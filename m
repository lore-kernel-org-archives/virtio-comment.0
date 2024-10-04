Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6CA17758
	for <virtio-comment@lists.linux.dev>; Fri,  4 Oct 2024 08:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728029637; cv=none; b=u2u+D2w9ZZEZC9GCgXdc57FPH6c6Nrm9jDnRcvu2NaRQlA8cyScnepqx4mubFtxEmoZoU7SQEysZ/deJfPj0DPu+1NIXNcMowodhSfZVS10xS6Lc+G61RT/5X6JjRFELJ7J+SWtZ2jJ+bW+Epj2/m8m0oJc+Lh1z+jwKdW+lFuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728029637; c=relaxed/simple;
	bh=PNVECqYVhmBuLlMxJu8OuV+Dsa/1gXAsWvgFZRsQTGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dsauNRcUav+pJaLMfbInAwpfSGGo6lvXQSFyvXa2jvrxyeSWoKDvB4YPD4CERSseZPF5IBAzFGMfuoAoQqiT80UZR3eIAHNjxHlRvPkeSx/TG0c8EWfq3MTgZveCXY437TEc2SjQtp6BihkE6iW6CeaCRq6rDudl+7/AXyJhhWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ICB9yRVH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ICB9yRVH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728029634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWa1xkE8mjHODIzwSgZL5h6GPJM7FHEpA9P4uTZy8bI=;
	b=ICB9yRVHKhnBjRajwTkbX5eJN5Q1nIKwCmHCcWzyHNgh+0Mn+UFZDSnH4uJNzhe0rzoi2F
	iOVQcS/AQGNO5xeXmVEgwjv/ppju1yUs9//XHNRn8/0F7ZmXjwdQh48cuC9jJc44xI4+Ho
	q08uf95vwVfODblv2RZS7NHMjrQV6wg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-131-vmKT-80VOwyUojwAIZcpcQ-1; Fri,
 04 Oct 2024 04:13:53 -0400
X-MC-Unique: vmKT-80VOwyUojwAIZcpcQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BA1B11955F41;
	Fri,  4 Oct 2024 08:13:51 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.45.224.200])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1332E19560B2;
	Fri,  4 Oct 2024 08:13:48 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: maxime.coquelin@redhat.com,
	Eelco Chaudron <echaudro@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	kshankar@marvell.com
Subject: [PATCH v9 2/2] virtio-net: define UDP tunnel checksum offload feature
Date: Fri,  4 Oct 2024 10:13:25 +0200
Message-ID: <dd1f0e96d889daec3e53ffd21cbbd061aad8cb9a.1728029499.git.pabeni@redhat.com>
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
 device-types/net/description.tex | 136 ++++++++++++++++++++++++++++---
 1 file changed, 125 insertions(+), 11 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 8e84213..48e0f5e 100644
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
@@ -398,6 +413,11 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
   the outer UDP checksum is zero - by negotiating the
   VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature.
 
+\item If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, a driver can
+  additionally use TCP segmentation or UDP segmentation on top of UDP
+  encapsulation with the outer header requiring checksum offload,
+  negotiating the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM feature.
+
 \item The converse features are also available: a driver can save
   the virtual device some work by negotiating these features.\note{For example, a network packet transported between two guests on
 the same system might not need checksumming at all, nor segmentation,
@@ -406,8 +426,9 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
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
@@ -463,6 +484,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
 #define VIRTIO_NET_HDR_F_DATA_VALID    2
 #define VIRTIO_NET_HDR_F_RSC_INFO      4
+#define VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM 8
         u8 flags;
 #define VIRTIO_NET_HDR_GSO_NONE        0
 #define VIRTIO_NET_HDR_GSO_TCPV4       1
@@ -584,8 +606,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
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
 
@@ -613,6 +638,20 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
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
@@ -671,6 +710,14 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 MUST SET the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit.
 
 The driver MUST NOT send to the device TCP or UDP GSO packets over UDP tunnel
+requiring segmentation and outer UDP checksum offload, unless both the
+VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO and VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM features
+are negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL
+bit in the \field{gso_type} and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags}.
+
+If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM is not negotiated, the driver MUST not set
+the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags} and
+MUST NOT send to the device TCP or UDP GSO packets over UDP tunnel
 requiring segmentation and outer UDP checksum offload.
 
 The driver MUST NOT set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
@@ -680,6 +727,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 The driver MUST NOT set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit and the
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit together.
 
+The driver MUST NOT set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit \field{flags}
+without setting either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
+the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}.
+
 If the VIRTIO_NET_F_CSUM feature has been negotiated, the
 driver MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
@@ -731,8 +782,23 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
   to the inner transport header and inner transport checksum field.
 \end{itemize}
 
+If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM feature has been negotiated,
+and the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
+the driver MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
+\field{flags}, if so the driver MUST set the packet outer UDP header checksum
+to the outer UDP pseudo header.
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
@@ -753,6 +819,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 been negotiated, the driver MUST NOT set either the VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV4
 bit or the VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV6 in \field{gso_type}.
 
+If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM option has not been negotiated,
+the driver MUST NOT set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit
+in \field{flags}.
+
 The driver SHOULD accept the VIRTIO_NET_F_GUEST_HDRLEN feature if it has
 been offered, and if it's able to provide the exact header length.
 
@@ -811,6 +881,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
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
@@ -920,8 +995,11 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   in \field{flags}, meaning that the device validated the checksum,
   set the csum_start and csum_offset fields, but did not provide the
   partial checksum for the transport header.
-  In case of multiple encapsulated protocols, one level of checksums
-  has been validated.
+  If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been negotiated,
+  and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit is set in \field{flags},
+  both the outer UDP checksum and the inner transport checksum
+  have been validated, otherwise only one level of checksums (the inner one
+  in case of tunnels) has been validated.
 \end{enumerate}
 
 Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
@@ -957,6 +1035,14 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   bit MAY be set. In such case the \field{outer_th_offset} and
   \field{inner_nh_offset} fields indicate the corresponding
   headers information.
+\item If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature was
+negotiated, and
+  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit is set in \field{gso_type}, the
+  VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags} can be set: if so,
+  the outer UDP checksum has been validated.
+  If the VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} is not set, the UDP
+  header checksum at offset 6 from from \field{outer_th_offset}
+  is set to the outer UDP pseudo header checksum.
 
 \end{enumerate}
 
@@ -1005,6 +1091,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}.
 
+If VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM is not negotiated the device MUST NOT set
+the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
+
 The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
 which have the Explicit Congestion Notification bit set, unless the
 VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
@@ -1037,7 +1126,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 to the corresponding header information, and the outer UDP header MUST NOT
 require checksum offload.
 
-The device MUST NOT send the driver TCP or UDP GSO packets encapsulated in UDP
+If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has not been negotiated,
+the device MUST NOT send the driver TCP or UDP GSO packets encapsulated in UDP
 tunnel and requiring segmentation and outer checksum offload.
 
 If none of the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options have
@@ -1063,13 +1153,31 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_DATA_VALID bit in
 \field{flags}, if so, the device MUST validate the packet
-checksum (in case of multiple encapsulated protocols, one level
-of checksums is validated). \note{This implies that if either the
-VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
+checksum. If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has
+been negotiated, and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit set in
+\field{flags}, both the outer UDP checksum and the inner transport
+checksum have been validated, otherwise only one level of checksums
+(the inner one in case of tunnels) has been validated. \note{This implies
+that if either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
 and the set the VIRTIO_NET_HDR_F_DATA_VALID in \field{flags} is set,
 the the VIRTIO_NET_F_GUEST_CSUM bit in \field{flags} is must be set, too}
 
+If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been negotiated
+and either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit is set or the
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit is set in \field{gso_type}, the
+device MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
+\field{flags}, if so and the VIRTIO_NET_F_DATA_VALID bit in \field{flags}
+is not set, the device MUST set the packet outer UDP checksum stored in the
+receive buffer to the outer UDP pseudo header.
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
@@ -1110,6 +1218,11 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 \end{itemize}
 the driver MUST NOT accept the packet.
 
+If the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags} is set,
+and both the bits VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 and
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 in \field{gso_type} are not set,
+the driver MOST NOT accept the packet.
+
 \paragraph{Hash calculation for incoming packets}
 \label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets / Hash calculation for incoming packets}
 
@@ -1954,6 +2067,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_F_GUEST_ECN        9
 #define VIRTIO_NET_F_GUEST_UFO        10
 #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
+#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
 #define VIRTIO_NET_F_GUEST_USO4       54
 #define VIRTIO_NET_F_GUEST_USO6       55
 
-- 
2.45.2

