Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FA1145330
	for <virtio-comment@lists.linux.dev>; Mon, 29 Jul 2024 11:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722252645; cv=none; b=F63C7vtkO/sf0y+WQhSZRzzS87qbxSWyqUzGd2zaGpjYbhzfDpdh/tJbJbSPSEV3n9CuwjBCUJHcNUaL8MSGrPcsQC+JoOKWygMWghTllExikCMUUyHeZwqGx/+xsVCegX7DHQdPNPk1h7rfn+T786JkSlFcBt60P3UEhUCZaVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722252645; c=relaxed/simple;
	bh=6epK+QCOMGCgmIYf3u6dzBWyZVpP6v/3NeoDD87k+Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YA0niTrDFteCSFygf/HuvgG4MdTXM6xd8jO2TQ4tm+mt11eSmdKfv0FnIJkbOCCtz+6mwWhLS0kjsCTQz1G8OoifHNT/+fwopiq9neoU3Pgj0FgI9Cbh3/m/4k3FDNl0ytT0+LUWj6LF3yPLCHf4IfhyH4mnCkzZGAqIbtVvAog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V3QGL55O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V3QGL55O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722252638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5NTpWKrKcQnAfOpyd96uHeTjhhQ9+VLEBtkHCUyZ+k=;
	b=V3QGL55OO4sAP/5IWm4fobSaWrSZX9wu10dTyVZgX4e+J0lIueTT/bHu7qNmERErW+hy+R
	7vAnuzahqprSjwkmGVP4olxgrffvX3N61pPluxCCEbrkogsfOBgqXgGFD3GLGTpZq67K1G
	qAI2H8rQZTmddlvFncxqAkfBKXpSP+A=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-213-QXU0QVUrPsW8Njp8Xu3Bdg-1; Mon,
 29 Jul 2024 07:30:34 -0400
X-MC-Unique: QXU0QVUrPsW8Njp8Xu3Bdg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 70B211956048;
	Mon, 29 Jul 2024 11:30:33 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.45.225.153])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 176711955D42;
	Mon, 29 Jul 2024 11:30:30 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: maxime.coquelin@redhat.com,
	Eelco Chaudron <echaudro@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH v6 2/2] virtio-net: define UDP tunnel checksum offload feature
Date: Mon, 29 Jul 2024 13:30:08 +0200
Message-ID: <5b3829e774a0bd43b7cb7119446486df42094d43.1722252302.git.pabeni@redhat.com>
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

This complements the previous change, additionally
introducing the UDP tunnel checksum offload feature.

Differently from the plain checksum offload feature, this
depends on UDP tunnel segmentation being available, as outer checksum
computation for non GSO packets is cheap and H/W implementation of
such feature is complex.

UDP tunnel checksum offload does not introduce additional fields,
instead leverages the outer transport offset introduced by the
UDP tunnel segmentation feature to locate the outer checksum
inside the packet.

When  UDP tunnel checksum offload is enabled, the VIRTIO_NET_HDR_F_DATA_VALID
bit semantic is extended, in the device -> driver direction, to
cover both the inner and the outer checksum validation.

Signed-off-by: Paolo Abeni <pabeni@redhat.com>
---
 device-types/net/description.tex | 123 ++++++++++++++++++++++++++++---
 1 file changed, 113 insertions(+), 10 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index eda294d..1225b50 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -91,9 +91,15 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (47)] Driver can receive GSO packets
   carried by a UDP tunnel.
 
+\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM (48)] Driver handles packets
+  carried by a UDP tunnel with partial csum for the outer header.
+
 \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (49)] Device can receive GSO packets
   carried by a UDP tunnel.
 
+\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM (50)] Device handles packets
+  carried by a UDP tunnel with partial csum for the outer header.
+
 \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash for encapsulated packets.
 
 \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue notification coalescing.
@@ -141,6 +147,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO] Requires both VIRTIO_NET_F_GUEST_TSO4 and VIRTIO_NET_F_GUEST_TSO6, or
    both VIRTIO_NET_F_GUEST_USO4 and VIRTIO_NET_F_GUEST_USO6.
+\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM] Requires VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO
 
 \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
@@ -149,6 +156,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires both VIRTIO_NET_F_HOST_TSO4 and VIRTIO_NET_F_HOST_TSO6, or
    both VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6.
++\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM] Requires VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO
 
 \item[VIRTIO_NET_F_CTRL_RX] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_CTRL_VLAN] Requires VIRTIO_NET_F_CTRL_VQ.
@@ -162,6 +170,13 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ along with VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
 \end{description}
 
+\begin{note}
+The dependency between UDP_TUNNEL_CSUM and UDP_TUNNEL_GSO is intentionally
+in the opposite direction with respect to the plain GSO features and the plain
+checksum offload because UDP tunnel checksum offload gives very little gain
+for non GSO packets is quite complex to implement in H/W.
+\end{note}
+
 \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Network Device / Feature bits / Legacy Interface: Feature bits}
 \begin{description}
 \item[VIRTIO_NET_F_GSO (6)] Device handles packets with any GSO type. This was supposed to indicate segmentation offload support, but
@@ -391,6 +406,11 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
   the outer UDP checksum is zero - by negotiating the
   VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature.
 
+\item If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, a driver can
+  additionally use TCP segmentation or UDP segmentation on top of UDP
+  encapsulation with the outer header requiring checksum offload,
+  negotiating the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature.
+
 \item The converse features are also available: a driver can save
   the virtual device some work by negotiating these features.\note{For example, a network packet transported between two guests on
 the same system might not need checksumming at all, nor segmentation,
@@ -399,8 +419,9 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
   checksummed packets can be received, and if it can do that then
   the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
   VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4,
-  VIRTIO_NET_F_GUEST_USO6 and VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO
-  are the input equivalents of the features described above.
+  VIRTIO_NET_F_GUEST_USO6 VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and
+  VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM are the input equivalents of
+  the features described above.
   See \ref{sec:Device Types / Network Device / Device Operation /
 Setting Up Receive Buffers}~\nameref{sec:Device Types / Network
 Device / Device Operation / Setting Up Receive Buffers} and
@@ -424,6 +445,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
 #define VIRTIO_NET_HDR_F_DATA_VALID    2
 #define VIRTIO_NET_HDR_F_RSC_INFO      4
+#define VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM 8
         u8 flags;
 #define VIRTIO_NET_HDR_GSO_NONE        0
 #define VIRTIO_NET_HDR_GSO_TCPV4       1
@@ -490,7 +512,7 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
     new (16 bit ones' complement) checksum is placed by the device.
 
   \item The TCP checksum field in the packet is set to the sum
-    of the TCP pseudo header, so that replacing it by the ones'
+    of the TCP pseudo header, so that replacing it with the ones'
     complement checksum of the TCP header and body will give the
     correct result.
   \end{itemize}
@@ -542,8 +564,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature,
   the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} indicates that
   the GSO protocol is encapsulated in a UDP tunnel.
-  The outer UDP header must not require checksumming, e.g. the outer UDP checksum
-  must be zero.
+  If the outer UDP header requires checksumming, the driver must have
+  additionally negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature
+  and offloaded the outer checksum accordingly, otherwise
+  the outer UDP header must not require checksumming, e.g. the outer
+  UDP checksum must be zero.
   The other tunnel-related fields indicate how to replicate the packet
   headers to cut it into smaller packets:
 
@@ -559,6 +584,20 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
       the packet.
   \end{itemize}
 
+\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature,
+  the transmitted packet is a GSO one encapsulated in a UDP tunnel, and
+  the outer UDP header requires checksumming, the driver can skip checksumming
+  the outer header:
+
+  \begin{itemize}
+  \item \field{flags} has the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM set,
+
+  \item The outer UDP checksum field in the packet is set to the sum
+    of the UDP pseudo header, so that replacing it by the ones'
+    complement checksum of the outer UDP header and payload will give the
+    correct result.
+  \end{itemize}
+
 \item \field{num_buffers} is set to zero.  This field is unused on transmitted packets.
 
 \item The header and packet are added as one output descriptor to the
@@ -606,12 +645,23 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 bit in \field{gso_type}.
 
 The driver MUST NOT send to the device TCP or UDP GSO packets over UDP tunnel
+requiring segmentation and outer UDP checksum offload, unless both the
+VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO and VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM features
+are negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL
+bit in the \field{gso_type} and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags}.
+
+If VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM is not negotiated, the driver MUST not set
+the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags} and
+MUST NOT send to the device TCP or UDP GSO packets over UDP tunnel
 requiring segmentation and outer UDP checksum offload.
 
 The driver MUST NOT set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL together with
 VIRTIO_NET_HDR_GSO_UDP, as the latter is deprecated in favor of UDP_L4
 and no new features will support it.
 
+The driver MUST NOT set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit \field{flags}
+without setting the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO bit in \field{gso_type}.
+
 If the VIRTIO_NET_F_CSUM feature has been negotiated, the
 driver MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
@@ -661,8 +711,27 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
   protocol, and \field{inner_nh_offset} to the inner network header offset.
 \end{itemize}
 
-If the bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL in \field{gso_type} is set, the outer
-UDP header MUST NOT require checksumming. That is the, the outer UDP checksum
+If the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature has been negotiated, and the
+bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL in \field{gso_type} is set, the
+driver MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
+\field{flags}, if so:
+\begin{enumerate}
+\item the driver MUST validate the packet checksum at
+	offset 6 from \field{outer_th_offset} as well as all
+	preceding offsets;
+\item the driver MUST set the packet outer UDP header checksum
+      to the outer UDP pseudo header;
+\end{enumerate}
+
+\begin{note}
+calculating a ones' complement checksum from \field{outer_th_offset}
+up until the end of the packet and storing the result at offset 6
+from \field{outer_th_offset} will result in a fully checksummed outer UDP packet;
+\end{note}
+
+If the bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL in \field{gso_type} is set
+and the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature has not been negotiated, the outer
+UDP header MUST NOT require checksumming. That is, the outer UDP checksum
 value must be 0, or the valid complete checksum for such header.
 
 \begin{note}
@@ -675,6 +744,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 been negotiated, the driver MUST NOT set the VIRTIO_NET_HDR_F_UDP_TUNNEL bit
 in \field{gso_type}.
 
+If the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM option has not been negotiated,
+the driver MUST NOT set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit
+in \field{flags}.
+
 The driver SHOULD accept the VIRTIO_NET_F_GUEST_HDRLEN feature if it has
 been offered, and if it's able to provide the exact header length.
 
@@ -839,6 +912,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   bit MAY be set. In such case the \field{outer_th_offset}, \field{inner_protocol_type},
   and \field{inner_nh_offset} fields indicate the corresponding
   headers information.
+\item If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM feature was negotiated, and
+  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit is set in \field{gso_type}, the
+  VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags} can be set: if so,
+  the outer UDP header checksum at offset 6 from \field{outer_th_offset} have
+  been validated. The checksum on the packet is incomplete and the
+  \field{outer_th_offset} indicates how to calculate it.
 
 \end{enumerate}
 
@@ -886,6 +965,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 If VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO is not negotiated the device MUST NOT set
 the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type}.
 
+If VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM is not negotiated the device MUST NOT set
+the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
+
 The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
 which have the Explicit Congestion Notification bit set, unless the
 VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
@@ -917,7 +999,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 \field{inner_nh_offset} fields to the corresponding header information, and the outer
 UDP header MUST NOT require checksum offload.
 
-The device MUST NOT send the driver TCP or UDP GSO packets encapsulated in UDP
+If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM feature has not been negotiated,
+the device MUST NOT send the driver TCP or UDP GSO packets encapsulated in UDP
 tunnel and requiring segmentation and outer checksum offload.
 
 If none of the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options have
@@ -943,8 +1026,27 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_DATA_VALID bit in
 \field{flags}, if so, the device MUST validate the packet
-checksum (in case of multiple encapsulated protocols, one level
-of checksums is validated).
+checksum. If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM feature has been negotiated,
+and the VIRTIO_NET_HDR_F_UDP_TUNNEL bit set, both the outer UDP checksum
+and the inner transport checksum have been
+validated, otherwise only one level of checksums (the inner one in case
+of tunnels) has been validated.
+
+If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM feature has been negotiated,
+the bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL is set in \field{gso_type}
+device MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
+\field{flags}, if so:
+\begin{enumerate}
+\item the device MUST validate the packet checksum at
+	offset 6 from \field{outer_th_offset};
+\item the device MUST set the packet checksum stored in the
+	receive buffer to the outer UDP pseudo header;
+\end{enumerate}
+
+Otherwise, if the VIRTIO_NET_HDR_GSO_UDP_TUNNEL is set in
+\field{gso_type} and the bit VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is cleared in
+\field{flags}, the device MUST either provide a zero outer UDP header
+checksum or a fully checksummed outer UDP header.
 
 \drivernormative{\paragraph}{Processing of Incoming
 Packets}{Device Types / Network Device / Device Operation /
@@ -1730,6 +1832,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_F_GUEST_ECN        9
 #define VIRTIO_NET_F_GUEST_UFO        10
 #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  47
+#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM 48
 #define VIRTIO_NET_F_GUEST_USO4       54
 #define VIRTIO_NET_F_GUEST_USO6       55
 
-- 
2.45.2

