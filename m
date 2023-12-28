Return-Path: <virtio-comment-return-8872-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF16C3DA6E
	for <virtio-comment@archiver.kernel.org>; Thu, 28 Dec 2023 07:46:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9D6987024A
	for <virtio-comment@archiver.kernel.org>; Thu, 28 Dec 2023 07:46:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 937B1986452
	for <virtio-comment@archiver.kernel.org>; Thu, 28 Dec 2023 07:46:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 875D69863B2; Thu, 28 Dec 2023 07:46:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 70C50983EB6
	for <virtio-comment@lists.oasis-open.org>; Thu, 28 Dec 2023 07:46:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R631e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VzNh0I4_1703749576;
From: Heng Qi <hengqi@linux.alibaba.com>
To: virtio-comment@lists.oasis-open.org
Cc: Jason Wang <jasowang@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Date: Thu, 28 Dec 2023 15:46:13 +0800
Message-Id: <1703749573-2786-3-git-send-email-hengqi@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1703749573-2786-1-git-send-email-hengqi@linux.alibaba.com>
References: <1703749573-2786-1-git-send-email-hengqi@linux.alibaba.com>
Subject: [virtio-comment] [PATCH v7 2/2] virtio-net: device does not deliver partially checksummed packet and may validate the checksum

virtio-net works in a virtualized system and is somewhat different from
physical nics. One of the differences is that to save virtio device
resources, rx may receive partially checksummed packets. However, XDP may
cause partially checksummed packets to be dropped.
So XDP loading currently conflicts with the feature VIRTIO_NET_F_GUEST_CSUM.
When XDP is loaded, the offload of VIRTIO_NET_F_GUEST_CSUM is disabled
(to disable the tx checksum offload).

In addition, implementation of some performant devices always do not generate
partially checksummed packets, but the standard driver still cannot load XDP
when VIRTIO_NET_F_GUEST_CSUM is there.

This patch lets the device to supply fully checksummed packets to the driver.

A new feature VIRTIO_NET_F_GUEST_FULLY_CSUM is added to solve the above
situation, which provides the driver with configurable offload.
If the offload is enabled, then the device must deliver fully
checksummed packets to the driver and may validate the checksum.

Use case example:
If VIRTIO_NET_F_GUEST_FULLY_CSUM is negotiated and the offload is enabled,
after XDP processes a fully checksummed packet, the VIRTIO_NET_HDR_F_DATA_VALID bit
is retained if the device has validated its checksum, resulting in the guest
not needing to validate the checksum again. This is useful for guests:
  1. Bring the driver advantages such as cpu savings.
  2. For devices that do not generate partially checksummed packets themselves,
     XDP can be loaded in the driver without modifying the hardware behavior.

Several solutions have been discussed in the previous proposal[1].
After historical discussion, we have tried the method proposed by Jason[2],
but some complex scenarios and challenges are difficult to deal with.
We now return to the method suggested in [1].

[1] https://lists.oasis-open.org/archives/virtio-dev/202305/msg00291.html
[2] https://lore.kernel.org/all/20230628030506.2213-1-hengqi@linux.alibaba.com/

Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
v6->v7:
- FULLY_CSUM no longer depends on GUEST_CSUM.
- The description related to DATA_VALID has nothing to do with
  whether GUEST_CSUM is negotiated or not. @Jason

v5->v6:
- Rewrite and clarify patch description. @Michael

v4->v5:
- Remove the modification to the GUEST_CSUM. @Jason
- The description of this feature has been reorganized for greater clarity. @Michael

v3->v4:
- Streamline some repetitive descriptions. @Jason
- Add how features should work, when to be enabled, and overhead. @Jason @Michael

v2->v3:
- Add a section named "Driver Handles Fully Checksummed Packets"
  and more descriptions. @Michael

v1->v2:
- Modify full checksum functionality as a configurable offload
  that is initially turned off. @Jason

 device-types/net/description.tex        | 68 ++++++++++++++++++++++++++++++---
 device-types/net/device-conformance.tex |  1 +
 2 files changed, 64 insertions(+), 5 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index a5210f2..d4a7329 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -122,6 +122,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
     device with the same MAC address.
 
 \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
+
+\item[VIRTIO_NET_F_GUEST_FULLY_CSUM (64)] Device delivers fully checksummed packets
+    to the driver and may validate the checksum.
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -136,6 +139,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
+\item[VIRTIO_NET_F_GUEST_FULLY_CSUM] Requires VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
 
 \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
@@ -383,7 +387,8 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
 the same system might not need checksumming at all, nor segmentation,
 if both guests are amenable.}
    The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
-  checksummed packets can be received, and if it can do that then
+  checksummed packets can be received (provided that the offload of
+  VIRTIO_NET_F_GUEST_FULLY_CSUM is disabled), and if it can do that then
   the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
   VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4
   and VIRTIO_NET_F_GUEST_USO6 are the input equivalents of the features described above.
@@ -398,6 +403,55 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
 A truly minimal driver would only accept VIRTIO_NET_F_MAC and ignore
 everything else.
 
+\subsubsection{Device Delivers Fully Checksummed Packets}\label{sec:Device Types / Network Device / Device Initialization / Device Delivers Fully Checksummed Packets}
+
+If the feature VIRTIO_NET_F_GUEST_FULLY_CSUM is negotiated, the driver can
+benefit from the device's ability to calculate and validate the checksum.
+
+If the feature VIRTIO_NET_F_GUEST_FULLY_CSUM is negotiated
+and its offload is enabled, the device behaves as follows:
+\begin{itemize}
+  \item The device delivers a fully checksummed packet to the driver rather than a partially checksummed packet.
+Partially checksummed packets come from TCP/UDP protocols \ref{devicenormative:Device Types / Network Device / Device Operation / Processing of Packets}.
+  \item The device may validate the packet checksum before delivering it.
+If the packet checksum has been verified, the VIRTIO_NET_HDR_F_DATA_VALID bit
+in \field{flags} is set: in case of multiple encapsulated protocols, one
+level of checksums has been validated.
+  \item The device can not set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags}.
+\end{itemize}
+
+The packet types that the device recognizes and can verify are independent of
+whether the offload of VIRTIO_NET_F_GUEST_FULLY_CSUM is enabled.
+
+Specific transport protocols that may have VIRTIO_NET_HDR_F_DATA_VALID set
+in \field{flags} include TCP, UDP, GRE (Generic Routing Encapsulation),
+and SCTP (Stream Control Transmission Protocol).
+A fully checksummed packet's checksum field for each of the above protocols
+is set to a calculated value that covers the transport header and payload
+(TCP or UDP involves the additional pseudo header) of the packet.
+
+Delivering fully checksummed packets rather than partially
+checksummed packets incurs additional overhead for the device.
+The overhead varies from device to device, for example the overhead of
+calculating and validating the packet checksum is a few microseconds
+for some hardware devices.
+
+The feature VIRTIO_NET_F_GUEST_FULLY_CSUM has a corresponding offload \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Offloads State Configuration},
+which when enabled means that the device delivers fully checksummed packets
+to the driver and may validate the checksum.
+\begin{note}
+Unlike other offloads, this offload is disabled even after
+VIRTIO_NET_F_GUEST_FULLY_CSUM has been negotiated.
+The offload has to be enabled when, for example, eXpress Data
+Path (XDP) in Linux is active.
+\end{note}
+
+\devicenormative{\subsubsection}{Device Delivers Fully Checksummed Packets}{sec:Device Types / Network Device / Device Initialization / Device Delivers Fully Checksummed Packets}
+
+If VIRTIO_NET_F_GUEST_FULLY_CSUM is negotiated, its offload is disabled
+until the VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET command with the
+VIRTIO_NET_F_GUEST_FULLY_CSUM bit set completes successfully.
+
 \subsection{Device Operation}\label{sec:Device Types / Network Device / Device Operation}
 
 Packets are transmitted by placing them in the
@@ -746,7 +800,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   number of coalesced TCP segments in \field{csum_start} field and
   number of duplicated ACK segments in \field{csum_offset} field
   and sets bit VIRTIO_NET_HDR_F_RSC_INFO in \field{flags}.
-\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
+\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated but the
+  VIRTIO_NET_F_GUEST_FULLY_CSUM feature was not negotiated, the
   VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} can be
   set: if so, the packet checksum at offset \field{csum_offset}
   from \field{csum_start} and any preceding checksums
@@ -804,8 +859,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
 \field{gso_type}.
 
-If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
-device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
+If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated but
+the VIRTIO_NET_F_GUEST_FULLY_CSUM feature has not been negotiated,
+the device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
 \begin{enumerate}
 \item the device MUST validate the packet checksum at
@@ -825,7 +881,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 been negotiated, the device MUST set \field{gso_type} to
 VIRTIO_NET_HDR_GSO_NONE.
 
-If \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE, then
+If the VIRTIO_NET_F_GUEST_FULLY_CSUM feature has not been negotiated and
+\field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE, then
 the device MUST also set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags} MUST set \field{gso_size} to indicate the desired MSS.
 If VIRTIO_NET_F_RSC_EXT was negotiated, the device MUST also
@@ -1631,6 +1688,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_F_GUEST_UFO        10
 #define VIRTIO_NET_F_GUEST_USO4       54
 #define VIRTIO_NET_F_GUEST_USO6       55
+#define VIRTIO_NET_F_GUEST_FULLY_CSUM 64
 
 #define VIRTIO_NET_CTRL_GUEST_OFFLOADS       5
  #define VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET   0
diff --git a/device-types/net/device-conformance.tex b/device-types/net/device-conformance.tex
index 52526e4..43b3921 100644
--- a/device-types/net/device-conformance.tex
+++ b/device-types/net/device-conformance.tex
@@ -16,4 +16,5 @@
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Inner Header Hash}
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}
+\item \ref{devicenormative:Device Types / Network Device / Device Initialization / Device Delivers Fully Checksummed Packets}
 \end{itemize}
-- 
1.8.3.1


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

