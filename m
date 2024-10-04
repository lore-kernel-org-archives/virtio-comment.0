Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5285613790B
	for <virtio-comment@lists.linux.dev>; Fri,  4 Oct 2024 08:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728029635; cv=none; b=Npje/bmEb1J5GmFXbab9eZ5z8okmQxYZ/LZmPgcqqpUwZx7GTwPAcqfRGgGVx0Es9OKbtgrHV/KduSiqkaP0LVHnCEpHyohIjg+XJ0VUZB0z5zvQK+kANKbBW93P3zDMQ3G0zVorfC7ZqyCiYcCZXgyLXK2T+PzB6m5hXnxhpkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728029635; c=relaxed/simple;
	bh=CoR5TIyW3nbyAZ6igDR5/a22VuGr0U8TXE2eyBpQcMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=de63oVdmjN0+CLhXCKrigAJgYieVqTQmkNZOXRHKFYx+tLDxNgMpol3LXnAnWl88tnHVhzIDV0W+s2vG6Nr2z9T0KVK86ET/rRaVKSxqlPHOCfxEus+LMoJv2ltqHBuwWPPgQ3Q8n04HS9ehje1s6dhj5MwWGVsVTr3Fg2Jkvbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KEMH1PBb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KEMH1PBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728029632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZqEtbbchLaOsLNRYM88wQCdJ9FlRA9s/WSssBM4Gto=;
	b=KEMH1PBbGE2P2aG+qj5X/ASFV14ZsGH3j6mmoIC+DUooP0TImnZmU8lEq//451S2huDUCx
	czNtodwmo4P69Kn8LPwR4e7DX+qO98Lky5F4lK2YUZtYq/lnBHg55GxeS4LIgETmW36RVE
	pjKU0OpP5yz8tEwW/SOqvg3PeoocsU0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-340-TQqlmpk9N9i1AC55TKfqYQ-1; Fri,
 04 Oct 2024 04:13:49 -0400
X-MC-Unique: TQqlmpk9N9i1AC55TKfqYQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F26F719560A5;
	Fri,  4 Oct 2024 08:13:47 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.45.224.200])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D595919560B2;
	Fri,  4 Oct 2024 08:13:44 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: maxime.coquelin@redhat.com,
	Eelco Chaudron <echaudro@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	kshankar@marvell.com
Subject: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload feature
Date: Fri,  4 Oct 2024 10:13:24 +0200
Message-ID: <55306969c73f62bf4d100d15074bfd6cde741417.1728029499.git.pabeni@redhat.com>
In-Reply-To: <cover.1728029499.git.pabeni@redhat.com>
References: <cover.1728029499.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} are two gso_type flags
allowing respectively GSO over UDPv4 tunnel and GSO over UDPv6 tunnel.
They can be negotiated on both the host and guest sides.

One constraint addressed here is that the virtio side (either device or
driver) receiving a UDP tunneled GSO packet must be able to reconstruct
completely the inner and outer headers offset - to allow for later GSO.

To accommodate such need, new fields are introduced in the virtio_net
header: outer_th_offset and inner_nh_offset.
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
not aggregate the wire packet in a GSO one.

Signed-off-by: Paolo Abeni <pabeni@redhat.com>
---
v8 -> v9:
 - rebased on top of virtio-1.4, changed udp-tunnel features number
   to avoid conflicts/duplications
 - fixed typos:
   VIRTIO_NET_HDR_F_UDP_TUNNEL_IPV4 -> VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV4
   VIRTIO_NET_HDR_F_UDP_TUNNEL_IPV6 -> VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV6
 - specified strict validation on RX side (both driver and device)
   for UDP tunneled packet: NEEDS_CSUM and plain GSO are mandatory for UDP
   tunnel GSO packets. The driver is not allowed to set DATA_VALID for UDP
   tunnel GSO packets, the driver can set both DATA_VALID & NEEDS_CSUM.

v7 -> v8:
 - dropped 'Note that' in note
 - NOT set neither A nor B -> NOT set either A or B
 - specify that 'gso_partial' needs uh->len set to the wire one

v6 -> v7:
 - replaced inner_protocol_type with VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 &&
   VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4
 - UDP_TUNNEL now depends on all the TCP and USO segmentation features
 - reworded the 'VIRTIO_NET_HDR_GSO_UDP_TUNNEL' bit driver normative
 - specified that  csum_start/offset points to the inner header in the
   driver normative, too
 - new fields presence depends on either VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO or
   VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO
 - e.g. ->  i.e.
 - zero -> positive zero (0x0)
 - checksumming -> checksum validation
 - explain why we the outer UDP csum can be precomputed only
   when the GSO packet length is a multiple of gso_size
 - added an example note for the tunnel-related fields value
 https://lore.kernel.org/virtio-comment/cover.1722252302.git.pabeni@redhat.com/T/#t

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
 device-types/net/description.tex | 205 +++++++++++++++++++++++++++++--
 1 file changed, 198 insertions(+), 7 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index b2a0d39..8e84213 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -88,6 +88,12 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
 
+\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (46)] Driver can receive GSO packets
+  carried by a UDP tunnel.
+
+\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (48)] Device can receive GSO packets
+  carried by a UDP tunnel.
+
 \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level statistics
     to the driver through the control virtqueue.
 
@@ -138,12 +144,16 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
+\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
+   VIRTIO_NET_F_GUEST_USO4 and VIRTIO_NET_F_GUEST_USO6.
 
 \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
 \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
+\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_HOST_TSO4, VIRTIO_NET_F_HOST_TSO6
+   and VIRTIO_NET_F_HOST_USO.
 
 \item[VIRTIO_NET_F_CTRL_RX] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_CTRL_VLAN] Requires VIRTIO_NET_F_CTRL_VQ.
@@ -381,6 +391,13 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
   TCP), VIRTIO_NET_F_HOST_TSO6 (IPv6 TCP), VIRTIO_NET_F_HOST_UFO
   (UDP fragmentation) and VIRTIO_NET_F_HOST_USO (UDP segmentation) features.
 
+\item If the VIRTIO_NET_F_HOST_TSO6, VIRTIO_NET_F_HOST_TSO4 and VIRTIO_NET_F_HOST_USO
+  segmentation features are negotiated, a driver can
+  use TCP segmentation or UDP segmentation on top of UDP encapsulation
+  offload, when the outer header does not require checksumming - e.g.
+  the outer UDP checksum is zero - by negotiating the
+  VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature.
+
 \item The converse features are also available: a driver can save
   the virtual device some work by negotiating these features.\note{For example, a network packet transported between two guests on
 the same system might not need checksumming at all, nor segmentation,
@@ -388,8 +405,9 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
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
@@ -451,6 +469,8 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_GSO_UDP         3
 #define VIRTIO_NET_HDR_GSO_TCPV6       4
 #define VIRTIO_NET_HDR_GSO_UDP_L4      5
+#define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 0x20
+#define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 0x40
 #define VIRTIO_NET_HDR_GSO_ECN      0x80
         u8 gso_type;
         le16 hdr_len;
@@ -461,6 +481,8 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
         le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
         le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
         le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
+        le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
+        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
 };
 \end{lstlisting}
 
@@ -518,6 +540,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 followed by the TCP header (with the TCP checksum field 16 bytes
 into that header). \field{csum_start} will be 14+20 = 34 (the TCP
 checksum includes the header), and \field{csum_offset} will be 16.
+If the given packet has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit set,
+the above checksum fields refer to the inner header checksum, see
+the example below.
 \end{note}
 
 \item If the driver negotiated
@@ -554,6 +580,39 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 specifically in the protocol.}.
    \end{itemize}
 
+\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the
+  \field{gso_type} has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
+  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit set, the GSO protocol is encapsulated
+  in a UDP tunnel.
+  The outer UDP header must not require checksum validation, i.e. the outer UDP
+  checksum must be a positive zero (0x0) as defined in UDP RFC 768.
+  The other tunnel-related fields indicate how to replicate the packet
+  headers to cut it into smaller packets:
+
+  \begin{itemize}
+  \item \field{outer_th_offset} field indicates the outer transport header within
+      the packet. This field differs from \field{csum_start} as the latter
+      points to the inner transport header within the packet.
+
+  \item \field{inner_nh_offset} field indicates the inner network header within
+      the packet.
+  \end{itemize}
+
+\begin{note}
+For example, consider a partially checksummed TCP (IPv4) packet carried over a
+Geneve UDP tunnel (again IPv4) with no tunnel options. The
+only relevant variable related to the tunnel type is the tunnel header length.
+The packet will have a 14 byte outer ethernet header, 20 byte outer IP header
+followed by the 8 byte UDP header (with a 0 checksum value), 8 byte Geneve header,
+14 byte inner ethernet header, 20 byte inner IP header
+and the TCP header (with the TCP checksum field 16 bytes
+into that header). \field{csum_start} will be 14+20+8+8+14+20 = 84 (the TCP
+checksum includes the header), \field{csum_offset} will be 16.
+\field{inner_nh_offset} will be 14+20+8+8+14 = 62, \field{outer_th_offset} will be
+14+20+8 = 42 and \field{gso_type} will be
+VIRTIO_NET_HDR_GSO_TCPV4 | VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 = 0x21
+\end{note}
+
 \item \field{num_buffers} is set to zero.  This field is unused on transmitted packets.
 
 \item The header and packet are added as one output descriptor to the
@@ -598,6 +657,29 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
 \field{gso_type}.
 
+If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
+in \field{gso_type} according to the inner network header protocol type
+to request TCP or UDP GSO packets over UDPv4 or UDPv6 tunnel
+segmentation, otherwise the driver MUST NOT set either the
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
+in \field{gso_type}.
+
+When requesting TCP or UDP GSO segmentation over UDP tunnel, the driver MUST SET the
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit if the inner network header is IPv4, i.e. the
+packet is a TCPv4 GSO one, otherwise, if the inner network header is IPv6, the driver
+MUST SET the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit.
+
+The driver MUST NOT send to the device TCP or UDP GSO packets over UDP tunnel
+requiring segmentation and outer UDP checksum offload.
+
+The driver MUST NOT set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit together with VIRTIO_NET_HDR_GSO_UDP, as the
+latter is deprecated in favor of UDP_L4 and no new feature will support it.
+
+The driver MUST NOT set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit and the
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit together.
+
 If the VIRTIO_NET_F_CSUM feature has been negotiated, the
 driver MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
@@ -639,12 +721,48 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 	header.
 \end{itemize}
 
+If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has been negotiated, the
+driver MAY set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}, if so:
+\begin{itemize}
+\item the driver MUST set \field{outer_th_offset} to the outer UDP header
+  offset and \field{inner_nh_offset} to the inner network header offset.
+  The \field{csum_start} and \field{csum_offset} fields point respectively
+  to the inner transport header and inner transport checksum field.
+\end{itemize}
+
+If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set, the
+outer UDP header MUST NOT require checksum validation. That is, the
+outer UDP checksum value MUST be 0 or the validated complete checksum
+for such header.
+
+\begin{note}
+The valid complete checksum of the outer UDP header of individual segments
+can be computed by the driver prior to segmentation only if the GSO packet
+size is a multiple of \field{gso_size}, because then all segments
+have the same size and thus all data included in the outer UDP
+checksum is the same for every segment. These pre-computed segment
+length and checksum fields are different from those of the GSO
+packet.
+In this scenario the outer UDP header of the GSO packet must carry the
+segmented UDP packet length.
+\end{note}
+
+If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has not
+been negotiated, the driver MUST NOT set either the VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV4
+bit or the VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV6 in \field{gso_type}.
+
 The driver SHOULD accept the VIRTIO_NET_F_GUEST_HDRLEN feature if it has
 been offered, and if it's able to provide the exact header length.
 
 The driver MUST NOT set the VIRTIO_NET_HDR_F_DATA_VALID and
 VIRTIO_NET_HDR_F_RSC_INFO bits in \field{flags}.
 
+The driver MUST NOT set the VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags}
+together with the VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV4 bit or the
+VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}.
+
 \devicenormative{\paragraph}{Packet Transmission}{Device Types / Network Device / Device Operation / Packet Transmission}
 The device MUST ignore \field{flag} bits that it does not recognize.
 
@@ -674,6 +792,25 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 	\end{note}
 \end{itemize}
 
+If both the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit and
+the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in in \field{gso_type} are set,
+the device MUST NOT accept the packet.
+
+If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit and the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
+bit in \field{gso_type} are not set, the device MUST NOT use the
+\field{outer_th_offset} and \field{inner_nh_offset}.
+
+If either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
+the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set, and any of
+the following is true:
+\begin{itemize}
+\item the VIRTIO_NET_HDR_F_NEEDS_CSUM is not set in \field{flags}
+\item the VIRTIO_NET_HDR_F_DATA_VALID is set in \field{flags}
+\item the \field{gso_type} excluding the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4
+bit and the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit is VIRTIO_NET_HDR_GSO_NONE
+\end{itemize}
+the device MUST NOT accept the packet.
+
 If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
 rely on the packet checksum being correct.
 \paragraph{Packet Transmission Interrupt}\label{sec:Device Types / Network Device / Device Operation / Packet Transmission / Packet Transmission Interrupt}
@@ -776,12 +913,19 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
   VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
   set: if so, device has validated the packet checksum.
+  If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO feature has been negotiated,
+  and either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
+  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
+  the device can additionally set the VIRTIO_NET_HDR_F_DATA_VALID bit
+  in \field{flags}, meaning that the device validated the checksum,
+  set the csum_start and csum_offset fields, but did not provide the
+  partial checksum for the transport header.
   In case of multiple encapsulated protocols, one level of checksums
   has been validated.
 \end{enumerate}
 
-Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP and ECN
-features enable receive checksum, large receive offload and ECN
+Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
+and ECN features enable receive checksum, large receive offload and ECN
 support which are the input equivalents of the transmit checksum,
 transmit segmentation offloading and ECN features, as described
 in \ref{sec:Device Types / Network Device / Device Operation /
@@ -803,8 +947,16 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   from \field{csum_start} and any preceding checksums
   have been validated.  The checksum on the packet is incomplete and
   if bit VIRTIO_NET_HDR_F_RSC_INFO is not set in \field{flags},
-  then \field{csum_start} and \field{csum_offset} indicate how to calculate it
-  (see Packet Transmission point 1).
+  then \field{csum_start} and \field{csum_offset} indicate how to calculate it.
+  If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
+  bit are set, the \field{csum_start} field
+  refers to the inner transport header offset (see Packet Transmission point 1).
+\item If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO option was negotiated and
+  \field{gso_type} is not VIRTIO_NET_HDR_GSO_NONE, the
+  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
+  bit MAY be set. In such case the \field{outer_th_offset} and
+  \field{inner_nh_offset} fields indicate the corresponding
+  headers information.
 
 \end{enumerate}
 
@@ -849,6 +1001,10 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 If none of VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 have been negotiated,
 the device MUST NOT set \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
 
+If VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO is not negotiated, the device MUST NOT set
+either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}.
+
 The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
 which have the Explicit Congestion Notification bit set, unless the
 VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
@@ -872,6 +1028,18 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 	fully checksummed packet;
 \end{enumerate}
 
+The device MUST NOT send to the driver TCP or UDP GSO packets encapsulated in UDP
+tunnel and requiring segmentation offload, unless the
+VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO is negotiated, in which case the device MUST set
+the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
+bit in \field{gso_type} according to the inner network header protocol type,
+MUST set the \field{outer_th_offset} and \field{inner_nh_offset} fields
+to the corresponding header information, and the outer UDP header MUST NOT
+require checksum offload.
+
+The device MUST NOT send the driver TCP or UDP GSO packets encapsulated in UDP
+tunnel and requiring segmentation and outer checksum offload.
+
 If none of the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options have
 been negotiated, the device MUST set \field{gso_type} to
 VIRTIO_NET_HDR_GSO_NONE.
@@ -896,7 +1064,11 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 device MAY set the VIRTIO_NET_HDR_F_DATA_VALID bit in
 \field{flags}, if so, the device MUST validate the packet
 checksum (in case of multiple encapsulated protocols, one level
-of checksums is validated).
+of checksums is validated). \note{This implies that if either the
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
+and the set the VIRTIO_NET_HDR_F_DATA_VALID in \field{flags} is set,
+the the VIRTIO_NET_F_GUEST_CSUM bit in \field{flags} is must be set, too}
 
 \drivernormative{\paragraph}{Processing of Incoming
 Packets}{Device Types / Network Device / Device Operation /
@@ -920,6 +1092,24 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
 rely on the packet checksum being correct.
 
+If both the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit and
+the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in in \field{gso_type} are set,
+the driver MUST NOT accept the packet.
+
+If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
+bit in \field{gso_type} are not set, the driver MUST NOT use the
+\field{outer_th_offset} and \field{inner_nh_offset}.
+
+If either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
+the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set, and any of
+the following is true:
+\begin{itemize}
+\item the VIRTIO_NET_HDR_F_NEEDS_CSUM is not set in \field{flags}
+\item the \field{gso_type} excluding the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4
+bit and the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit is VIRTIO_NET_HDR_GSO_NONE
+\end{itemize}
+the driver MUST NOT accept the packet.
+
 \paragraph{Hash calculation for incoming packets}
 \label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets / Hash calculation for incoming packets}
 
@@ -1763,6 +1953,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_F_GUEST_TSO6       8
 #define VIRTIO_NET_F_GUEST_ECN        9
 #define VIRTIO_NET_F_GUEST_UFO        10
+#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
 #define VIRTIO_NET_F_GUEST_USO4       54
 #define VIRTIO_NET_F_GUEST_USO6       55
 
-- 
2.45.2

