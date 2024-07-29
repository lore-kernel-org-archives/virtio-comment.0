Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB3878B4E
	for <virtio-comment@lists.linux.dev>; Mon, 29 Jul 2024 11:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722252637; cv=none; b=sMbAGtKquE7XIU38Tz7V9An7BYT2Z4W+5w/PV50o04AWH56/NH8vmTV1bQokOV5wgeS52bNrvOiIUoo5SVWlYFvRLlDoUZJYvohjffsNR5puN7gjyiXrCQHpF5GctJMrn/w5rPGGLfXlqQkPOqCHTs2qadBmTaW5UkI79s6uZ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722252637; c=relaxed/simple;
	bh=seOVBMI2q7G+vIlTFsHYrhCwenNNKRGnKRLgGPqThII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KCtW/NlHxIpTmxuo8J5xM+tsENlOVljcGgDhB6DrI/WnOTyTnxDp3dJJ5/K9AwSys8QjV7dqNCJ6cOgr9g9GGSvYe4VhO8nat30j+8jY6Em3PCKKA+hjxyi0cDI91k1es44FPywbd7LhFeEJT9LWRBctA7M4KMw8jomASo7ZWnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hu0Cy+at; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hu0Cy+at"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722252634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f2kjwQHUeltFGsAz+HPYBuBTq1UpketyaVJhuWoHXIU=;
	b=Hu0Cy+atgKHMMv7vaScK8tuiu5gpqs9++BQri9y1dG+WAospluPaenm/pLJzA4vPf4AYUF
	Atg96XVeFz/ziNzHAkfnhb4we0DTqOSVWFVDqrDt1zj2efBxM29YTqAKzj2Tly34MgkV/w
	fAqRXT1cpDAYVLGCyzV0U8uTzvLssyg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-256-FbD8euSjOBq32WZVLsKIQw-1; Mon,
 29 Jul 2024 07:30:31 -0400
X-MC-Unique: FbD8euSjOBq32WZVLsKIQw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8592B1955D4B;
	Mon, 29 Jul 2024 11:30:30 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.45.225.153])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2E0C41955D42;
	Mon, 29 Jul 2024 11:30:27 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: maxime.coquelin@redhat.com,
	Eelco Chaudron <echaudro@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH v6 1/2] virtio-net: define UDP tunnel segmentation offload feature
Date: Mon, 29 Jul 2024 13:30:07 +0200
Message-ID: <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
In-Reply-To: <cover.1722252302.git.pabeni@redhat.com>
References: <cover.1722252302.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The VIRTIO_NET_HDR_GSO_UDP_TUNNEL is a gso_type flag allowing GSO over
UDP tunnel. It can be negotiated on both the host and guest sides.

One constraint addressed here is that the virtio side (either device or
driver) receiving a UDP tunneled GSO packet must be able to reconstruct
completely the inner and outer headers offset - to allow for later GSO.

To accommodate such need, new fields are introduced in the virtio_net
header: outer_th_offset, inner_protocol_type and inner_nh_offset.
They map directly to the corresponding header information. The inner
transport header is implied by the (inner) checksum offload.

Those fields are required because a virtio device H/W implementation
performing segmentation for UDP tunneled packet will need to touch
the outer transport protocol (for the UDP length filed), the
inner network protocol (for the total length field, in the IPv4
case).

Note that segmentation will additionally need to touch
the outer network protocol and the inner transport protocol. The first
is implied/easily found with trivial parsing, the latter is identified
by the existing csum_start field.

Note that there is no concept of UDP tunnel type negotiation (e.g.
vxlan, geneve, vxlan-gpe, etc.), as a virtio device H/W implementation
can perform segmentation for every possible UDP-tunnel given the
specified new fields.
In the reverse direction, if a virtio device H/W implementation receives
some traffic for an unknown or unsupported UDP tunnel, it will simply
not aggregate the wire packet in GSO one.

Signed-off-by: Paolo Abeni <pabeni@redhat.com>
---
v5 -> v6:
 - split in 2 patches
 - dropped the unneeded outer_mh_offset field
https://lore.kernel.org/virtio-comment/56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com/

v4 -> v5:
 - add separate negotiation for UDP_TUNNEL_CSUM
 - much more verbose specification of outer csum handling
 - UDP_TUNNEL_CSUM requires GSO_UDP_TUNNEL
 https://lore.kernel.org/virtio-comment/cb89d3d6b6a7e4a7f13e60dd3fded5e950727890.1716448766.git.pabeni@redhat.com/

v3 -> v4:
 - new virtio_net_hdr fields depends on F_HOST_UDP_TUNNEL_GSO or
   F_GUEST_UDP_TUNNEL_GSO (Stefano)
 - Extended the changelog to answer Jason's questions.
 - Clarified outer csum handling (Jason)
 https://lore.kernel.org/virtio-dev/f0bf2db203f8061a3ecb50b7a48cf26d8f3c7f68.1716193086.git.pabeni@redhat.com

v2 -> v3:
 - UDP_TUNNEL -> UDP_TUNNEL_GSO
 - add explicit fields for the inner meta-data
 - more verbose changelog
 https://lists.oasis-open.org/archives/virtio-dev/202206/msg00026.html

v1 -> v2:
 - explicitly state that the outer header probing is mandatory
 - explicitly state that GSO_UDP is not allowed with GSO_UDP_TUNNEL
 - clarify hdr_len usage
 - clarify UDP_TUNNEL_CSUM bit usage
 - fix a few typos
 https://lists.oasis-open.org/archives/virtio-dev/202205/msg00037.html
---
 device-types/net/description.tex | 118 +++++++++++++++++++++++++++++--
 1 file changed, 112 insertions(+), 6 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 76585b0..eda294d 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -88,6 +88,12 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
 
+\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (47)] Driver can receive GSO packets
+  carried by a UDP tunnel.
+
+\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (49)] Device can receive GSO packets
+  carried by a UDP tunnel.
+
 \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash for encapsulated packets.
 
 \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue notification coalescing.
@@ -133,12 +139,16 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
+\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO] Requires both VIRTIO_NET_F_GUEST_TSO4 and VIRTIO_NET_F_GUEST_TSO6, or
+   both VIRTIO_NET_F_GUEST_USO4 and VIRTIO_NET_F_GUEST_USO6.
 
 \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
 \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
+\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires both VIRTIO_NET_F_HOST_TSO4 and VIRTIO_NET_F_HOST_TSO6, or
+   both VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6.
 
 \item[VIRTIO_NET_F_CTRL_RX] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_CTRL_VLAN] Requires VIRTIO_NET_F_CTRL_VQ.
@@ -375,6 +385,12 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
   TCP), VIRTIO_NET_F_HOST_TSO6 (IPv6 TCP), VIRTIO_NET_F_HOST_UFO
   (UDP fragmentation) and VIRTIO_NET_F_HOST_USO (UDP segmentation) features.
 
+\item If any TCP or UDP segmentation feature is negotiated, a driver can
+  use TCP segmentation or UDP segmentation on top of UDP encapsulation
+  offload, when the outer header does not require checksumming - e.g.
+  the outer UDP checksum is zero - by negotiating the
+  VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature.
+
 \item The converse features are also available: a driver can save
   the virtual device some work by negotiating these features.\note{For example, a network packet transported between two guests on
 the same system might not need checksumming at all, nor segmentation,
@@ -382,8 +398,9 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
    The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
   checksummed packets can be received, and if it can do that then
   the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
-  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4
-  and VIRTIO_NET_F_GUEST_USO6 are the input equivalents of the features described above.
+  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4,
+  VIRTIO_NET_F_GUEST_USO6 and VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO
+  are the input equivalents of the features described above.
   See \ref{sec:Device Types / Network Device / Device Operation /
 Setting Up Receive Buffers}~\nameref{sec:Device Types / Network
 Device / Device Operation / Setting Up Receive Buffers} and
@@ -413,6 +430,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_GSO_UDP         3
 #define VIRTIO_NET_HDR_GSO_TCPV6       4
 #define VIRTIO_NET_HDR_GSO_UDP_L4      5
+#define VIRTIO_NET_HDR_GSO_UDP_TUNNEL 0x40
 #define VIRTIO_NET_HDR_GSO_ECN      0x80
         u8 gso_type;
         le16 hdr_len;
@@ -423,6 +441,9 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
         le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
         le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
         le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
+        le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO negotiated)
+        le16 inner_protocol_type;(Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO negotiated)
+        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO negotiated)
 };
 \end{lstlisting}
 
@@ -480,6 +501,8 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 followed by the TCP header (with the TCP checksum field 16 bytes
 into that header). \field{csum_start} will be 14+20 = 34 (the TCP
 checksum includes the header), and \field{csum_offset} will be 16.
+If the given packet has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit set,
+the above checksum fields refer to the inner header checksum.
 \end{note}
 
 \item If the driver negotiated
@@ -516,6 +539,26 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 specifically in the protocol.}.
    \end{itemize}
 
+\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature,
+  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} indicates that
+  the GSO protocol is encapsulated in a UDP tunnel.
+  The outer UDP header must not require checksumming, e.g. the outer UDP checksum
+  must be zero.
+  The other tunnel-related fields indicate how to replicate the packet
+  headers to cut it into smaller packets:
+
+  \begin{itemize}
+  \item \field{outer_th_offset} field indicates the outer transport header within
+      the packet. Note that such field differs from \field{csum_start} as the latter
+      points to the inner transport header within the packet.
+
+  \item \field{inner_protocol_type} field indicates the ethernet type of the inner
+      protocol.
+
+  \item \field{inner_nh_offset} field indicates the inner network header within
+      the packet.
+  \end{itemize}
+
 \item \field{num_buffers} is set to zero.  This field is unused on transmitted packets.
 
 \item The header and packet are added as one output descriptor to the
@@ -557,6 +600,18 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
 \field{gso_type}.
 
+The driver MUST NOT send to the device TCP or UDP GSO packets over UDP tunnel
+requiring segmentation offload, unless the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is
+negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL
+bit in \field{gso_type}.
+
+The driver MUST NOT send to the device TCP or UDP GSO packets over UDP tunnel
+requiring segmentation and outer UDP checksum offload.
+
+The driver MUST NOT set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL together with
+VIRTIO_NET_HDR_GSO_UDP, as the latter is deprecated in favor of UDP_L4
+and no new features will support it.
+
 If the VIRTIO_NET_F_CSUM feature has been negotiated, the
 driver MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
@@ -598,6 +653,28 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 	header.
 \end{itemize}
 
+If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has been negotiated, the
+driver MAY set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type}, if so:
+\begin{itemize}
+\item the driver MUST set \field{outer_th_offset} to the outer UDP header
+  offset, \field{inner_protocol_type} to the ethernet type of the inner
+  protocol, and \field{inner_nh_offset} to the inner network header offset.
+\end{itemize}
+
+If the bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL in \field{gso_type} is set, the outer
+UDP header MUST NOT require checksumming. That is the, the outer UDP checksum
+value must be 0, or the valid complete checksum for such header.
+
+\begin{note}
+The valid complete checksum of the outer UDP header of individual segments
+can be computed by the driver prior to segmentation only if the GSO packet
+size is a multiple of \field{gso_size}.
+\end{note}
+
+If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has not
+been negotiated, the driver MUST NOT set the VIRTIO_NET_HDR_F_UDP_TUNNEL bit
+in \field{gso_type}.
+
 The driver SHOULD accept the VIRTIO_NET_F_GUEST_HDRLEN feature if it has
 been offered, and if it's able to provide the exact header length.
 
@@ -633,6 +710,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 	\end{note}
 \end{itemize}
 
+If VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} is not set, the
+device MUST NOT use the \field{outer_th_offset}, \field{inner_protocol_type}
+ and \field{inner_nh_offset}.
+
 If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
 rely on the packet checksum being correct.
 \paragraph{Packet Transmission Interrupt}\label{sec:Device Types / Network Device / Device Operation / Packet Transmission / Packet Transmission Interrupt}
@@ -727,8 +808,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   has been validated.
 \end{enumerate}
 
-Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP and ECN
-features enable receive checksum, large receive offload and ECN
+Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
+and ECN features enable receive checksum, large receive offload and ECN
 support which are the input equivalents of the transmit checksum,
 transmit segmentation offloading and ECN features, as described
 in \ref{sec:Device Types / Network Device / Device Operation /
@@ -750,8 +831,14 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   from \field{csum_start} and any preceding checksums
   have been validated.  The checksum on the packet is incomplete and
   if bit VIRTIO_NET_HDR_F_RSC_INFO is not set in \field{flags},
-  then \field{csum_start} and \field{csum_offset} indicate how to calculate it
-  (see Packet Transmission point 1).
+  then \field{csum_start} and \field{csum_offset} indicate how to calculate it.
+  If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit is set, the \field{csum_start} field
+  refers to the inner transport header offset (see Packet Transmission point 1).
+\item If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO option was negotiated and
+  \field{gso_type} is not VIRTIO_NET_HDR_GSO_NONE, the VIRTIO_NET_HDR_GSO_UDP_TUNNEL
+  bit MAY be set. In such case the \field{outer_th_offset}, \field{inner_protocol_type},
+  and \field{inner_nh_offset} fields indicate the corresponding
+  headers information.
 
 \end{enumerate}
 
@@ -796,6 +883,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 If none of VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 have been negotiated,
 the device MUST NOT set \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
 
+If VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO is not negotiated the device MUST NOT set
+the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type}.
+
 The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
 which have the Explicit Congestion Notification bit set, unless the
 VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
@@ -819,6 +909,17 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 	fully checksummed packet;
 \end{enumerate}
 
+The device MUST NOT send to the driver TCP or UDP GSO packets encapsulated in UDP
+tunnel and requiring segmentation offload, unless the
+VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO is negotiated, in which case the device MUST set
+the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} and MUST set the
+\field{outer_th_offset}, \field{inner_protocol_type} and
+\field{inner_nh_offset} fields to the corresponding header information, and the outer
+UDP header MUST NOT require checksum offload.
+
+The device MUST NOT send the driver TCP or UDP GSO packets encapsulated in UDP
+tunnel and requiring segmentation and outer checksum offload.
+
 If none of the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options have
 been negotiated, the device MUST set \field{gso_type} to
 VIRTIO_NET_HDR_GSO_NONE.
@@ -867,6 +968,10 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
 rely on the packet checksum being correct.
 
+If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_GSO bit in \field{gso_type} is not set,
+the driver MUST NOT use the \field{outer_th_offset}, \field{inner_protocol_type},
+\field{inner_mac_offset} and \field{inner_nh_offset}.
+
 \paragraph{Hash calculation for incoming packets}
 \label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets / Hash calculation for incoming packets}
 
@@ -1624,6 +1729,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_F_GUEST_TSO6       8
 #define VIRTIO_NET_F_GUEST_ECN        9
 #define VIRTIO_NET_F_GUEST_UFO        10
+#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  47
 #define VIRTIO_NET_F_GUEST_USO4       54
 #define VIRTIO_NET_F_GUEST_USO6       55
 
-- 
2.45.2

