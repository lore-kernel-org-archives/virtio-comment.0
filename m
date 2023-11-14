Return-Path: <virtio-comment-return-8355-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04EFC4332F
	for <virtio-comment@archiver.kernel.org>; Tue, 14 Nov 2023 08:50:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F14504454A
	for <virtio-comment@archiver.kernel.org>; Tue, 14 Nov 2023 08:50:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D0D45986D71
	for <virtio-comment@archiver.kernel.org>; Tue, 14 Nov 2023 08:50:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B321D986D67; Tue, 14 Nov 2023 08:50:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3A2C8986D68
	for <virtio-comment@lists.oasis-open.org>; Tue, 14 Nov 2023 08:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0VwOyj.s_1699951785;
From: Heng Qi <hengqi@linux.alibaba.com>
To: virtio-comment@lists.oasis-open.org
Cc: Jason Wang <jasowang@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Date: Tue, 14 Nov 2023 16:49:45 +0800
Message-Id: <8acff73199993535bb66528343681209c32b3560.1699951535.git.hengqi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v3] virtio-net: support distinguishing between partial and full checksum

virtio-net works in a virtualized system and is somewhat different from
physical nics. One of the differences is that to save virtio device
resources, rx may receive packets with partial checksum. However, XDP may
cause partially checksummed packets to be dropped. So XDP loading conflicts
with the feature VIRTIO_NET_F_GUEST_CSUM.

This patch lets the device to supply fully checksummed packets to the driver.
Then XDP can coexist with VIRTIO_NET_F_GUEST_CSUM to enjoy the benefits of
device verification checksum.

In addition, implementation of some performant devices do not generate
partially checksummed packets, but the standard driver still need to clear
VIRTIO_NET_F_GUEST_CSUM when loading XDP. If these devices enable the
full checksum offloading, then the driver can load XDP without clearing
VIRTIO_NET_F_GUEST_CSUM.

A new feature bit VIRTIO_NET_F_GUEST_FULL_CSUM is added to solve the above
situation, which provides the driver with configurable receive full checksum
offload. If the offload is enabled, then the device must supply fully
checksummed packets to the driver.

Use case example:
If VIRTIO_NET_F_GUEST_FULL_CSUM is negotiated and receive full checksum
offload is enabled, after XDP processes a packet with full checksum, the
VIRTIO_NET_HDR_F_DATA_VALID bit is still retained, resulting in the stack
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
v2->v3:
- Add a section named "Driver Handles Fully Checksummed Packets"
  and more descriptions. @Michael

v1->v2:
- Modify full checksum functionality as a configurable offload
  that is initially turned off. @Jason

 device-types/net/description.tex        | 73 +++++++++++++++++++++++--
 device-types/net/device-conformance.tex |  1 +
 device-types/net/driver-conformance.tex |  1 +
 3 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index aff5e08..6937a2f 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -122,6 +122,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
     device with the same MAC address.
 
 \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
+
+\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver handles packets with full checksum.
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -136,6 +138,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
+\item[VIRTIO_NET_F_GUEST_FULL_CSUM] Requires VIRTIO_NET_F_GUEST_CSUM and VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
 
 \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
@@ -398,6 +401,58 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
 A truly minimal driver would only accept VIRTIO_NET_F_MAC and ignore
 everything else.
 
+\subsubsection{Driver Handles Fully Checksummed Packets}\label{sec:Device Types / Network Device / Device Initialization / Driver Handles Fully Checksummed Packets}
+
+The VIRTIO_NET_F_GUEST_CSUM feature indicates that the driver can handle
+partially or fully checksummed packets from the device. When the
+driver only expects fully checksummed packets, the VIRTIO_NET_F_GUEST_FULL_CSUM
+feature can be negotiated if the device offers it.
+Then the driver only handles packets with full checksum.
+
+By negotiating the VIRTIO_NET_F_GUEST_FULL_CSUM feature, the driver can
+benefit, for example, from the device's ability to calculate and validate the checksum
+in scenarios where partially checksummed packets are not compatible.
+
+Delivering fully checksummed packets rather than partially
+checksummed packets incurs additional overhead for the device.
+As a result, receive full-checksum offload (meaning the driver only handles
+packets with full checksum) is disabled by default \ref{sec:Device Types / Network Device
+/ Device Operation / Control Virtqueue / Offloads State Configuration}.
+
+Receive full-checksum offload can be enabled if the driver successfully
+sends the VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET command with the
+VIRTIO_NET_F_GUEST_FULL_CSUM bit set.
+
+\drivernormative{\subsubsection}{Driver Handles Fully Checksummed Packets}{sec:Device Types / Network Device / Device Initialization / Driver Handles Fully Checksummed Packets}
+
+The driver MUST NOT enable receive full-checksum offload for which
+VIRTIO_NET_F_GUEST_FULL_CSUM has not been negotiated.
+
+\devicenormative{\subsubsection}{Driver Handles Fully Checksummed Packets}{sec:Device Types / Network Device / Device Initialization / Driver Handles Fully Checksummed Packets}
+
+Initially (before the device successfully receives any
+VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET command with the VIRTIO_NET_F_GUEST_FULL_CSUM
+bit set) receive full-checksum offload MUST be disabled.
+
+Upon the device reset, the device MUST disable receive full-checksum offload.
+
+If VIRTIO_NET_F_GUEST_FULL_CSUM has been negotiated and receive full-checksum
+offload has not been enabled, the device MUST NOT perform any of the
+functionality provided by VIRTIO_NET_F_GUEST_FULL_CSUM.
+
+If a partially checksummed packet is received by the device, the device MUST
+calculate full checksum for the packet and then supply it to the driver
+\ref{sec:Device Types / Network Device / Device Operation / Packet Transmission}.
+
+If receive full-checksum offload has been enabled, the device MUST NOT set
+the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} and MUST supply a
+fully checksummed packet to the driver.
+
+If receive full-checksum offload has been enabled and \field{gso_type}
+differs from VIRTIO_NET_HDR_GSO_NONE, then the device MUST NOT set
+the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} and MUST calculate
+full checksum for the packet and then supply it to the driver.
+
 \subsection{Device Operation}\label{sec:Device Types / Network Device / Device Operation}
 
 Packets are transmitted by placing them in the
@@ -723,7 +778,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   \field{num_buffers} is one, then the entire packet will be
   contained within this buffer, immediately following the struct
   virtio_net_hdr.
-\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
+\item If the VIRTIO_NET_F_GUEST_CSUM feature (regardless of whether
+  VIRTIO_NET_F_GUEST_FULL_CSUM was negotiated) was negotiated, the
   VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
   set: if so, device has validated the packet checksum.
   In case of multiple encapsulated protocols, one level of checksums
@@ -747,7 +803,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   number of coalesced TCP segments in \field{csum_start} field and
   number of duplicated ACK segments in \field{csum_offset} field
   and sets bit VIRTIO_NET_HDR_F_RSC_INFO in \field{flags}.
-\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
+\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated but the
+  VIRTIO_NET_F_GUEST_FULL_CSUM feature was not negotiated, the
   VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} can be
   set: if so, the packet checksum at offset \field{csum_offset}
   from \field{csum_start} and any preceding checksums
@@ -805,8 +862,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
 \field{gso_type}.
 
-If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
-device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
+If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated but
+the VIRTIO_NET_F_GUEST_FULL_CSUM feature has not been negotiated,
+the device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
 \begin{enumerate}
 \item the device MUST validate the packet checksum at
@@ -826,7 +884,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 been negotiated, the device MUST set \field{gso_type} to
 VIRTIO_NET_HDR_GSO_NONE.
 
-If \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE, then
+If the VIRTIO_NET_F_GUEST_FULL_CSUM feature has not been negotiated and
+\field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE, then
 the device MUST also set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags} MUST set \field{gso_size} to indicate the desired MSS.
 If VIRTIO_NET_F_RSC_EXT was negotiated, the device MUST also
@@ -842,7 +901,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 not less than the length of the headers, including the transport
 header.
 
-If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
+If the VIRTIO_NET_F_GUEST_CSUM feature (regardless of whether
+VIRTIO_NET_F_GUEST_FULL_CSUM has been negotiated) has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_DATA_VALID bit in
 \field{flags}, if so, the device MUST validate the packet
 checksum (in case of multiple encapsulated protocols, one level
@@ -1633,6 +1693,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_F_GUEST_UFO        10
 #define VIRTIO_NET_F_GUEST_USO4       54
 #define VIRTIO_NET_F_GUEST_USO6       55
+#define VIRTIO_NET_F_GUEST_FULL_CSUM  64
 
 #define VIRTIO_NET_CTRL_GUEST_OFFLOADS       5
  #define VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET   0
diff --git a/device-types/net/device-conformance.tex b/device-types/net/device-conformance.tex
index 52526e4..e72cb5b 100644
--- a/device-types/net/device-conformance.tex
+++ b/device-types/net/device-conformance.tex
@@ -16,4 +16,5 @@
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Inner Header Hash}
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}
+\item \ref{devicenormative:Device Types / Network Device / Device Initialization / Driver Handles Fully Checksummed Packets}
 \end{itemize}
diff --git a/device-types/net/driver-conformance.tex b/device-types/net/driver-conformance.tex
index c693c4f..6a1d7a7 100644
--- a/device-types/net/driver-conformance.tex
+++ b/device-types/net/driver-conformance.tex
@@ -16,4 +16,5 @@
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Inner Header Hash}
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}
+\item \ref{drivernormative:Device Types / Network Device / Device Initialization / Driver Handles Fully Checksummed Packets}
 \end{itemize}
-- 
2.19.1.6.gb485710b


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

