Return-Path: virtio-comment-return-1048-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E49849860D8
	for <virtio-comment@lists.oasis-open.org>; Tue,  4 Feb 2020 16:13:43 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Tue, 4 Feb 2020 16:13:36 +0000
Message-ID: <CY4PR1801MB207265CCA387276A48C20207C5030@CY4PR1801MB2072.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v2] virtio-net: Add an optional device control over the
 receive buffers length
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This patch gives devices some level of control over the receive buffers len=
gth.
The driver declares the minimum receive buffer length, and the device reque=
sts max/min buffer length ratio.

v2 incorporates v1 comments.

Changes from v1:
 * min_rx_buf_len must be set before FEATURES_OK
 * Use a single feature bit VIRTIO_NET_F_RXBUF_LEN_CTRL for both, the min s=
ize and the ratio
 * min_rx_buf_len is defined as write-only for driver


Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
---
 content.tex | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index d68cfaf..ab0d193 100644
--- a/content.tex
+++ b/content.tex
@@ -2815,6 +2815,10 @@ \subsection{Feature bits}\label{sec:Device Types / N=
etwork Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
=20
+\item[VIRTIO_NET_F_RXBUF_LEN_CTRL(58)] Device requests to know the minimum
+    receive buffers length, and requests to limit the maximum/minimum rece=
ive
+    buffers length ratio. Driver declares the minimum receive buffers leng=
th.
+
 \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact \field{h=
dr_len}
     value. Device benefits from knowing the exact header length.
=20
@@ -2861,8 +2865,8 @@ \subsubsection{Legacy Interface: Feature bits}\label{=
sec:Device Types / Network
 \subsection{Device configuration layout}\label{sec:Device Types / Network =
Device / Device configuration layout}
 \label{sec:Device Types / Block Device / Feature bits / Device configurati=
on layout}
=20
-Three driver-read-only configuration fields are currently defined. The \fi=
eld{mac} address field
-always exists (though is only valid if VIRTIO_NET_F_MAC is set), and
+The driver-read-only \field{mac} address field always exists
+(though is only valid if VIRTIO_NET_F_MAC is set), and
 \field{status} only exists if VIRTIO_NET_F_STATUS is set. Two
 read-only bits (for the driver) are currently defined for the status field=
:
 VIRTIO_NET_S_LINK_UP and VIRTIO_NET_S_ANNOUNCE.
@@ -2882,12 +2886,22 @@ \subsection{Device configuration layout}\label{sec:=
Device Types / Network Device
 VIRTIO_NET_F_MTU is set. This field specifies the maximum MTU for the driv=
er to
 use.
=20
+The write-only for driver field \field{min_rx_buf_len} only exists if
+VIRTIO_NET_F_RXBUF_LEN_CTRL is set. This field specifies the minimum recei=
ve
+buffers length.
+
+The driver-read-only field \field{rx_buf_len_ratio} only exists if
+VIRTIO_NET_F_RXBUF_LEN_CTRL is set. This field specifies the maximum/minim=
um receive
+buffers length ratio. The value '0' indicates unrestricted ratio.
+
 \begin{lstlisting}
 struct virtio_net_config {
         u8 mac[6];
         le16 status;
         le16 max_virtqueue_pairs;
         le16 mtu;
+        le32 min_rx_buf_len;
+        le16 rx_buf_len_ratio;
 };
 \end{lstlisting}
=20
@@ -2916,6 +2930,13 @@ \subsection{Device configuration layout}\label{sec:D=
evice Types / Network Device
 If the driver negotiates the VIRTIO_NET_F_STANDBY feature, the device MAY =
act
 as a standby device for a primary device with the same MAC address.
=20
+A driver SHOULD accept the VIRTIO_NET_F_RXBUF_LEN_CTRL feature if offered.
+
+If VIRTIO_NET_F_RXBUF_LEN_CTRL feature has been negotiated, the driver MUS=
T
+set \field{min_rx_buf_len} before setting the FEATURES_OK status bit.
+
+A driver MUST NOT modify \field{min_rx_buf_len} once it has been set.
+
 \drivernormative{\subsubsection}{Device configuration layout}{Device Types=
 / Network Device / Device configuration layout}
=20
 A driver SHOULD negotiate VIRTIO_NET_F_MAC if the device offers it.
@@ -3281,6 +3302,13 @@ \subsubsection{Setting Up Receive Buffers}\label{sec=
:Device Types / Network Devi
 If VIRTIO_NET_F_MQ is negotiated, each of receiveq1\ldots receiveqN
 that will be used SHOULD be populated with receive buffers.
=20
+If VIRTIO_NET_F_RXBUF_LEN_CTRL feature has been negotiated, the driver
+MUST initialize all receive virtqueue descriptors \field{len} field with
+the value greater than or equal to the value configured in the
+\field{min_rx_buf_len} device configuration field, and allocate receive
+buffers accordingly. If \field{rx_buf_len_ratio} > 0, then the \field{len}=
 value
+must also be less than or equal to (\field{min_rx_buf_len} * \field{rx_buf=
_len_ratio}).
+
 \devicenormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Ne=
twork Device / Device Operation / Setting Up Receive Buffers}
=20
 The device MUST set \field{num_buffers} to the number of descriptors used =
to
--

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

