Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9EA193060
	for <virtio-comment@lists.linux.dev>; Wed, 27 Nov 2024 09:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732700236; cv=none; b=ctHKgJJi/hxDiDNu6cPimf8yq6eNIa41whVeRC6R+1JBqKnrKC6o18dN0BH8XfNdvHHAUrzOeSWO3LovbZFx8CqMMWegrgC58oHaBbx/0ystC9eZlejx6KREkphXKAfgx8ZvB123FwmtNwLgypIpbY5Ekc4ANFYNWyHjSpg0CNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732700236; c=relaxed/simple;
	bh=LCrpR9PNW1/zrJpwqQ5eGeccugB/u6oZMGpeSE1SOLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=UZTxewf2IMNUKWfWkjfEnam77EJfyn0lv6G5aWoxTZTa+b3UFlEPdTMX45fLoRN6OhGZ4WHBj58sEEzLmYChsfDkPBalFj+VQvhhtO3Whae+gVfYaPmu3Zwr8RUz/gbGQmVSiaIPftOjlNUZwR+XnPZtUHgP4ogaAfX0DdzPOKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dvPhLP+Q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dvPhLP+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732700233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RF/FKVqdjTi5BlbseODy8KfEjuePRhnEV/GJnv8luIg=;
	b=dvPhLP+QoAzaxFdKNenZytr728nCj//C43btznC/Zwi7DQ1CME3MEflM4sCHF8NLmP9EYL
	RGZaZexW7ElfVytSlKUtCNc1XwyBXE3tVqR7r1K3u4cdj4o5NH08jIgNe6i++T8HyS1jhq
	4h0En+Rt0xi35o9nGI1ojqE7AGcsODA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-T1f9njEaNYaP_hnOS3Y-Nw-1; Wed,
 27 Nov 2024 04:37:08 -0500
X-MC-Unique: T1f9njEaNYaP_hnOS3Y-Nw-1
X-Mimecast-MFC-AGG-ID: T1f9njEaNYaP_hnOS3Y-Nw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0A93A19560B8;
	Wed, 27 Nov 2024 09:37:07 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.39.194.173])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 82402195E480;
	Wed, 27 Nov 2024 09:37:04 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: maxime.coquelin@redhat.com,
	Eelco Chaudron <echaudro@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	kshankar@marvell.com
Subject: [PATCH v11 4/4] virtio-net: define UDP tunnel checksum offload feature
Date: Wed, 27 Nov 2024 10:36:43 +0100
Message-ID: <e87cf0c61f5ea3783cea0bcc4ea74f6e73f453d7.1732699986.git.pabeni@redhat.com>
In-Reply-To: <cover.1732699986.git.pabeni@redhat.com>
References: <cover.1732699986.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: liGHuMVGxQY-fU6gnjt0u-lzCwMtge2zlj4YRKZNy9M_1732700227
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This complements the previous change, additionally
introducing the UDP tunnel checksum offload feature.

Differently from the plain checksum offload feature, this
depends on UDP tunnel segmentation being available, as outer checksum
computation for non GSO packets is cheap and H/W implementation of
such a feature is complex.

UDP tunnel checksum offload does not introduce additional fields,
instead it leverages the outer transport offset introduced by the
UDP tunnel segmentation feature to locate the outer checksum
inside the packet.

When UDP tunnel checksum offload is negotiated:
- the driver requests the outer UDP checksum offload setting the
VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the flag field. Such bit
is not allocated inside the gso_type field to prevent space
exhaustion there.
- in the device -> driver direction, the VIRTIO_NET_HDR_F_DATA_VALID
bit semantic is extended, covering both the inner and the outer
checksum validation.

Signed-off-by: Paolo Abeni <pabeni@redhat.com>
---
v10 -> v11:
 - 'to the outer UDP pseudo header' -> 'to the outer UDP pseudo header
   checksum'
 - rebased on top of patch 2/4
 - dropped trailing spaces

v9 -> v10:
 - DATA_VALID is not allowed for GSO over UDP tunnel packets
 - fixed more typos:
   VIRTIO_NET_HDR_GSO_UDP_TUNNEL -> either
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 or VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6

v8 -> v9:
 - rebased on top of virtio-1.4, changed udp-tunnel features number
   to avoid conflicts/duplications
 - fixed typos:
   VIRTIO_NET_HDR_F_UDP_TUNNEL -> VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM
   VIRTIO_NET_HDR_GSO_UDP_TUNNEL -> either
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 or VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
 - specified strict validation for the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM
   bit, only allowed with UDP tunnel GSO packets.
 - specified that VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM describe the outer
   header csum offload for both in presence and absence of
   VIRTIO_NET_HDR_F_DATA_VALID

v7 -> v8:
 - dropped confusing wording around csum validation
 - clarified VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM allocation

v6 -> v7:
 - rebased
 - VIRTIO_NET_F_{HOST,GUEST}_UDP_TUNNEL_CSUM -> ...UDP_TUNNEL_GSO_CSUM
 - dropped unintended change to existing TCP gso spec
---
 device-types/net/description.tex | 143 ++++++++++++++++++++++++++++---
 1 file changed, 131 insertions(+), 12 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 67bbccf..efb543f 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -91,9 +91,15 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (46)] Driver can receive GSO packets
   carried by a UDP tunnel.
 
+\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM (47)] Driver handles packets
+  carried by a UDP tunnel with partial csum for the outer header.
+
 \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (48)] Device can receive GSO packets
   carried by a UDP tunnel.
 
+\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (49)] Device handles packets
+  carried by a UDP tunnel with partial csum for the outer header.
+
 \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level statistics
     to the driver through the control virtqueue.
 
@@ -146,6 +152,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
    VIRTIO_NET_F_GUEST_USO4 and VIRTIO_NET_F_GUEST_USO6.
+\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM] Requires VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO
 
 \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
@@ -154,6 +161,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_HOST_TSO4, VIRTIO_NET_F_HOST_TSO6
    and VIRTIO_NET_F_HOST_USO.
+\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM] Requires VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO
 
 \item[VIRTIO_NET_F_CTRL_RX] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_CTRL_VLAN] Requires VIRTIO_NET_F_CTRL_VQ.
@@ -168,6 +176,13 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_RSS_CONTEXT] Requires VIRTIO_NET_F_CTRL_VQ and VIRTIO_NET_F_RSS.
 \end{description}
 
+\begin{note}
+The dependency between UDP_TUNNEL_GSO_CSUM and UDP_TUNNEL_GSO is intentionally
+in the opposite direction with respect to the plain GSO features and the plain
+checksum offload because UDP tunnel checksum offload gives very little gain
+for non GSO packets and is quite complex to implement in H/W.
+\end{note}
+
 \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Network Device / Feature bits / Legacy Interface: Feature bits}
 \begin{description}
 \item[VIRTIO_NET_F_GSO (6)] Device handles packets with any GSO type. This was supposed to indicate segmentation offload support, but
@@ -402,6 +417,11 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
   could be either TCP or UDP. Only a single level of encapsulation
   offload is supported.
 
+\item If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, a driver can
+  additionally use TCP segmentation or UDP segmentation on top of UDP
+  encapsulation with the outer header requiring checksum offload,
+  negotiating the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM feature.
+
 \item The converse features are also available: a driver can save
   the virtual device some work by negotiating these features.\note{For example, a network packet transported between two guests on
 the same system might not need checksumming at all, nor segmentation,
@@ -410,8 +430,9 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
   checksummed packets can be received, and if it can do that then
   the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
   VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4,
-  VIRTIO_NET_F_GUEST_USO6 and VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO
-  are the input equivalents of the features described above.
+  VIRTIO_NET_F_GUEST_USO6 VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and
+  VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM are the input equivalents of
+  the features described above.
   See \ref{sec:Device Types / Network Device / Device Operation /
 Setting Up Receive Buffers}~\nameref{sec:Device Types / Network
 Device / Device Operation / Setting Up Receive Buffers} and
@@ -557,6 +578,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
 #define VIRTIO_NET_HDR_F_DATA_VALID    2
 #define VIRTIO_NET_HDR_F_RSC_INFO      4
+#define VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM 8
         u8 flags;
 #define VIRTIO_NET_HDR_GSO_NONE        0
 #define VIRTIO_NET_HDR_GSO_TCPV4       1
@@ -681,8 +703,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
   \field{gso_type} has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
   VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit set, the GSO protocol is encapsulated
   in a UDP tunnel.
-  The outer UDP header must not require checksum validation, i.e. the outer UDP
-  checksum must be a positive zero (0x0) as defined in UDP RFC 768.
+  If the outer UDP header requires checksumming, the driver must have
+  additionally negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM feature
+  and offloaded the outer checksum accordingly, otherwise
+  the outer UDP header must not require checksum validation, i.e. the outer
+  UDP checksum must be positive zero (0x0) as defined in UDP RFC 768.
   The other tunnel-related fields indicate how to replicate the packet
   headers to cut it into smaller packets:
 
@@ -710,6 +735,20 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 VIRTIO_NET_HDR_GSO_TCPV4 | VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 = 0x21
 \end{note}
 
+\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM feature,
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
@@ -768,6 +807,16 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 MUST SET the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit.
 
 The driver MUST NOT send to the device GSO packets over UDP tunnel
+requiring segmentation and outer UDP checksum offload, unless both the
+VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO and VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM features
+are negotiated, in which case the driver MUST set either the
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
+bit in the \field{gso_type} and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
+the \field{flags}.
+
+If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM is not negotiated, the driver MUST not set
+the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags} and
+MUST NOT send to the device GSO packets over UDP tunnel
 requiring segmentation and outer UDP checksum offload.
 
 The driver MUST NOT set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
@@ -777,6 +826,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 The driver MUST NOT set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit and the
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit together.
 
+The driver MUST NOT set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit \field{flags}
+without setting either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
+the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}.
+
 If the VIRTIO_NET_F_CSUM feature has been negotiated, the
 driver MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
@@ -838,8 +891,23 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
   to the inner transport header and inner transport checksum field.
 \end{itemize}
 
+If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM feature has been negotiated,
+and the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
+the driver MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
+\field{flags}, if so the driver MUST set the packet outer UDP header checksum
+to the outer UDP pseudo header checksum.
+
+\begin{note}
+calculating a ones' complement checksum from \field{outer_th_offset}
+up until the end of the packet and storing the result at offset 6
+from \field{outer_th_offset} will result in a fully checksummed outer UDP packet;
+\end{note}
+
 If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
-VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set, the
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set
+and the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM feature has not
+been negotiated, the
 outer UDP header MUST NOT require checksum validation. That is, the
 outer UDP checksum value MUST be 0 or the validated complete checksum
 for such header.
@@ -860,6 +928,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 been negotiated, the driver MUST NOT set either the VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV4
 bit or the VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV6 in \field{gso_type}.
 
+If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM option has not been negotiated,
+the driver MUST NOT set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit
+in \field{flags}.
+
 The driver SHOULD accept the VIRTIO_NET_F_GUEST_HDRLEN feature if it has
 been offered, and if it's able to provide the exact header length.
 
@@ -918,6 +990,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \end{itemize}
 the device MUST NOT accept the packet.
 
+If the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags} is set,
+and both the bits VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 and
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 in \field{gso_type} are not set,
+the device MOST NOT accept the packet.
+
 If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
 rely on the packet checksum being correct.
 \paragraph{Packet Transmission Interrupt}\label{sec:Device Types / Network Device / Device Operation / Packet Transmission / Packet Transmission Interrupt}
@@ -1020,8 +1097,11 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
   VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
   set: if so, device has validated the packet checksum.
-  In case of multiple encapsulated protocols, one level of checksums
-  has been validated.
+  If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been negotiated,
+  and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit is set in \field{flags},
+  both the outer UDP checksum and the inner transport checksum
+  have been validated, otherwise only one level of checksums (the outer one
+  in case of tunnels) has been validated.
 \end{enumerate}
 
 Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
@@ -1062,12 +1142,22 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   bit MAY be set. In such case the \field{outer_th_offset} and
   \field{inner_nh_offset} fields indicate the corresponding
   headers information.
+\item If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature was
+negotiated, and
+  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
+  are set in \field{gso_type}, the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the
+  \field{flags} can be set: if so, the outer UDP checksum has been validated
+  and the UDP header checksum at offset 6 from from \field{outer_th_offset}
+  is set to the outer UDP pseudo header checksum.
+
 \begin{note}
 If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
 bit are set in \field{gso_type}, the \field{csum_start} field refers to
-the inner transport header offset (see Packet Transmission point 1)
-and only the inner transport header checksum has been validated by
-VIRTIO_NET_HDR_F_NEEDS_CSUM.
+the inner transport header offset (see Packet Transmission point 1).
+If the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags} is set both
+the inner and the outer header checksums have been validated by
+VIRTIO_NET_HDR_F_NEEDS_CSUM, otherwise only the inner transport header
+checksum has been validated.
 \end{note}
 \end{enumerate}
 
@@ -1116,6 +1206,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}.
 
+If VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM is not negotiated the device MUST NOT set
+the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
+
 The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
 which have the Explicit Congestion Notification bit set, unless the
 VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
@@ -1148,7 +1241,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 to the corresponding header information, and the outer UDP header MUST NOT
 require checksum offload.
 
-The device MUST NOT send the driver GSO packets encapsulated in UDP
+If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has not been negotiated,
+the device MUST NOT send the driver GSO packets encapsulated in UDP
 tunnel and requiring segmentation and outer checksum offload.
 
 If none of the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options have
@@ -1176,7 +1270,11 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_DATA_VALID bit in
 \field{flags}, if so, the device MUST validate the packet
-checksum. One level of checksum is validated: in case of multiple
+checksum. If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has
+been negotiated, and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit set in
+\field{flags}, both the outer UDP checksum and the inner transport
+checksum have been validated.
+Otherwise level of checksum is validated: in case of multiple
 encapsulated protocols the outermost one.
 
 If either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
@@ -1184,6 +1282,20 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 the device MUST NOT set the VIRTIO_NET_HDR_F_DATA_VALID bit in
 \field{flags}.
 
+If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been negotiated
+and either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit is set or the
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit is set in \field{gso_type}, the
+device MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
+\field{flags}, if so the device MUST set the packet outer UDP checksum
+stored in the receive buffer to the outer UDP pseudo header.
+
+Otherwise, the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been
+negotiated, either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit is set or the
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit is set in \field{gso_type},
+and the bit VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is not set in
+\field{flags}, the device MUST either provide a zero outer UDP header
+checksum or a fully checksummed outer UDP header.
+
 \drivernormative{\paragraph}{Processing of Incoming
 Packets}{Device Types / Network Device / Device Operation /
 Processing of Incoming Packets}
@@ -1225,6 +1337,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 \end{itemize}
 the driver MUST NOT accept the packet.
 
+If the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit and the VIRTIO_NET_HDR_F_NEEDS_CSUM
+bit in \field{flags} are set,
+and both the bits VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 and
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 in \field{gso_type} are not set,
+the driver MOST NOT accept the packet.
+
 \paragraph{Hash calculation for incoming packets}
 \label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets / Hash calculation for incoming packets}
 
@@ -2069,6 +2187,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_F_GUEST_ECN        9
 #define VIRTIO_NET_F_GUEST_UFO        10
 #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
+#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
 #define VIRTIO_NET_F_GUEST_USO4       54
 #define VIRTIO_NET_F_GUEST_USO6       55
 
-- 
2.45.2

