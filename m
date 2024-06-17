Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6221BDCD
	for <virtio-comment@lists.linux.dev>; Mon, 17 Jun 2024 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718621567; cv=none; b=nTtw/NJTk1oKOHl5gXtRjvfTjHo1J+shFW2lZwQUeP1MuV7ixY+0zDEhbjEmDUE4Sg1CBJBrQUImdPiboa7Y8BeNQ+zsYRG/gye+u00/CflDvWrXZDFJDH63JiDskEVnVe4Qj8RcSqGeIC+QM3KP2hEfHwEFMGy4Wcu4sOUEBaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718621567; c=relaxed/simple;
	bh=7VgoPPkugZEsRvkDWaxuBSJqDilo+zY0b5BnJ9pHnaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Kd0mC1/6c83fvViDABNJ3CP4nSl4g6XNFqC3kL3v6YIl+PwR3FSMCqf5/lPsRiu8LHCfGwD2TrbbB7s1o8MGESx84spl1DE7g/E1Ur0Cz4f//5i76rrgDlEUy0qC0UT6w9pDYYbK39crI9Iu7sdITGVDrCskf4GUr00q1AroeZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bgMITwFv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bgMITwFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718621563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IdbkrID2NqDMGGG+C8ff13/ZOHF8s46RnpC2Ep1CVM0=;
	b=bgMITwFvBHPCS2QrumPh9IJVEIkLd74OMs0iT6Jmz1JKkSNGpLTQY5V6xamtYcUzhW3x+0
	reh0sD1AaEKLt5VfwwB9+6OgvbWGWchSRd0BRgZ/jsMkT7ABiHEiXGSh+7n6KrLRL1Zmiw
	BWkiCPGy5ro/Kjzw5KFpkMYsTpK2asc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-66-ASQ08E4yMt6Crmc6k1sdgA-1; Mon,
 17 Jun 2024 06:52:40 -0400
X-MC-Unique: ASQ08E4yMt6Crmc6k1sdgA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9FBAD195606A;
	Mon, 17 Jun 2024 10:52:39 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.45.224.221])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2B3CB1956087;
	Mon, 17 Jun 2024 10:52:36 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: maxime.coquelin@redhat.com,
	Eelco Chaudron <echaudro@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH v5] virtio-net: define UDP tunnel offload feature
Date: Mon, 17 Jun 2024 12:52:11 +0200
Message-ID: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The VIRTIO_NET_HDR_GSO_UDP_TUNNEL is a gso_type flag allowing GSO over
UDP tunnel. It can be negotiated on both the host and guest sides.

UDP tunnel usage is ubiquitous in container deployment, and the ability
to offload UDP encapsulated GSO traffic impacts greatly the performances
and the CPU utilization of such use cases.

One constraint addressed here is that the virtio side (either device or
driver) receiving a UDP tunneled GSO packet must be able to reconstruct
completely the inner and outer headers offset - to allow for later GSO.

To accommodate such need, new optional fields are introduced in the
virtio_net header: outer_th_offset, inner_protocol, inner_mac_offset,
inner_nh_offset. They map directly to the corresponding header
information. The inner transport header is implied by the (inner)
checksum offload.

The checksum offload for the outer header is negotiated with a separate
feature and only for GSO over UDP tunnel packets. Computing the outer
header checksum is cheap: due to the inner checksum only data in between
the outer and the inner transport header must be accounted[1].

The GSO over UDP tunnels packets are allowed even when the outer header
csum offload is not supported, if the outer UDP header has zero csum
or the GSO packet size is an integer multiple of the gso_size. In such
later case the outer UDP header checksum can be computed independently
prior to the segmentation step, do to [1].

Migration for GSO_UDP_TUNNEL-enabled-VMs should be managed alike other
types of GSO offload: VMs that has negotiated UDP tunnel GSO and
checksum offload could be migrated only on hosts supporting such
features.

Note that there is no concept of UDP tunnel type negotiation (e.g.
vxlan, geneve, vxlan-gpe, etc.). That is intentional because:
- given the information carried by the guest or host kernel, it's
  impossible to probe reliably the UDP tunnel type. Specifically, the
  outer UDP port numbers give a hint, but peers could use nonstandard
  ones.
- all the existing UDP tunnel protocols behave the same way WRT GSO
  offload, carrying an immutable header on top of the outer transport
  one.
- if a new UDP tunnel protocol, carring packet dependant information
  alike the inner packet length or csum should surface in the future,
  the host and guest kernels will need explicit support for it,
  including new, different GSO features. Additional virtio support
  should be designed separately.

Signed-off-by: Paolo Abeni <pabeni@redhat.com>
---
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
 device-types/net/description.tex | 248 ++++++++++++++++++++++++++++++-
 1 file changed, 240 insertions(+), 8 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 76585b0..d6f9f79 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -88,6 +88,18 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
 
+\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (47)] Driver can receive GSO packets
+  carried by an UDP tunnel.
+
+\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM (48)] Driver handles packets
+  carried by an UDP tunnel with partial csum for the outer header.
+
+\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (49)] Device can receive GSO packets
+  carried by an UDP tunnel.
+
+\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM (50)] Device handles packets
+  carried by an UDP tunnel with partial csum for the outer header.
+
 \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash for encapsulated packets.
 
 \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue notification coalescing.
@@ -133,12 +145,18 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
+\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
+   VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6.
+\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM] Requires VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO
 
 \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
 \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
+\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_HOST_TSO4, VIRTIO_NET_F_HOST_TSO6,
+   VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6.
+\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM] Requires VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO
 
 \item[VIRTIO_NET_F_CTRL_RX] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_CTRL_VLAN] Requires VIRTIO_NET_F_CTRL_VQ.
@@ -375,6 +393,16 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
   TCP), VIRTIO_NET_F_HOST_TSO6 (IPv6 TCP), VIRTIO_NET_F_HOST_UFO
   (UDP fragmentation) and VIRTIO_NET_F_HOST_USO (UDP segmentation) features.
 
+\item If any TCP or UDP segmentation feature is negotiated, a driver can
+  use TCP segmentation or UDP segmentation on top of UDP encapsulation
+  offload, when the outer header does not require checksumming,
+  by negotiating the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature.
+
+\item If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, a driver can
+  additionally use TCP segmentation or UDP segmentation on top of UDP
+  encapsulation with the outer header requiring checksum offload,
+  negotiating the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature.
+
 \item The converse features are also available: a driver can save
   the virtual device some work by negotiating these features.\note{For example, a network packet transported between two guests on
 the same system might not need checksumming at all, nor segmentation,
@@ -382,8 +410,10 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
    The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
   checksummed packets can be received, and if it can do that then
   the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
-  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4
-  and VIRTIO_NET_F_GUEST_USO6 are the input equivalents of the features described above.
+  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4,
+  VIRTIO_NET_F_GUEST_USO6, VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and
+  VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM are the input equivalents of
+  the features described above.
   See \ref{sec:Device Types / Network Device / Device Operation /
 Setting Up Receive Buffers}~\nameref{sec:Device Types / Network
 Device / Device Operation / Setting Up Receive Buffers} and
@@ -407,12 +437,14 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
 #define VIRTIO_NET_HDR_F_DATA_VALID    2
 #define VIRTIO_NET_HDR_F_RSC_INFO      4
+#define VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM 8
         u8 flags;
 #define VIRTIO_NET_HDR_GSO_NONE        0
 #define VIRTIO_NET_HDR_GSO_TCPV4       1
 #define VIRTIO_NET_HDR_GSO_UDP         3
 #define VIRTIO_NET_HDR_GSO_TCPV6       4
 #define VIRTIO_NET_HDR_GSO_UDP_L4      5
+#define VIRTIO_NET_HDR_GSO_UDP_TUNNEL 0x40
 #define VIRTIO_NET_HDR_GSO_ECN      0x80
         u8 gso_type;
         le16 hdr_len;
@@ -423,6 +455,10 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
         le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
         le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
         le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
+        le16 outer_th_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
+        le16 inner_protocol;    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
+        le16 inner_mac_offset;  (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
+        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
 };
 \end{lstlisting}
 
@@ -480,6 +516,8 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 followed by the TCP header (with the TCP checksum field 16 bytes
 into that header). \field{csum_start} will be 14+20 = 34 (the TCP
 checksum includes the header), and \field{csum_offset} will be 16.
+If the given packets has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit set,
+the above checksum fields refer to the inner header checksum.
 \end{note}
 
 \item If the driver negotiated
@@ -516,6 +554,59 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 specifically in the protocol.}.
    \end{itemize}
 
+\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature,
+  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} indicates that
+  the GSO protocol is encapsulated in an UDP tunnel. If the outer UDP header
+  requires checksumming, the driver must have additionally negotiated the
+  VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature and offloaded the outer checksum
+  accordingly.
+  The other tunnel-related fields indicate how to replicate the inner packet
+  header to cut it into smaller packets:
+
+  \begin{itemize}
+  \item \field{outer_th_offset} field indicates the outer transport header within
+      the packet. Note that differs from \field{csum_start} as the latter
+      points to the inner transport header within the packet.
+
+  \item \field{inner_protocol} field indicates the ethernet type of the inner
+      protocol.
+
+  \item \field{inner_mac_offset} field indicates the inner mac header within the packet
+
+  \item \field{inner_nh_offset} field indicates the inner network header within
+      the packet
+  \end{itemize}
+
+\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature,
+  the transimitted packet is a GSO one encapsulated in an UDP tunnel, and
+  the outer UDP header requires checksumming, the driver can skip it:
+
+  \begin{itemize}
+  \item \field{flags} has the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM set,
+
+  \item \field{outer_th_offset} correspond to the outer checksum start and
+      implies the outer checksum offset: the outer transport header is UDP,
+      so the outer checksum offset is 6.
+
+  \item The outer UDP checksum field in the packet is set to the sum
+    of the UDP pseudo header, so that replacing it by the ones'
+    complement checksum of the outer UDP header and payload will give the
+    correct result.
+  \end{itemize}
+
+\begin{note}
+  Transmitting GSO packets carried by UDP tunnel is still possible even without
+  the outer UDP header checksum offload:
+  \begin{itemize}
+    \item when the outer UDP checksum is not required, that is, when the outer UDP
+      checksum is zero.
+    \item when the GSO packet size is equal to a multiple of \field{gso_size}. In such
+      case the outer UDP checksum is indepenent from the actual packet contents and
+      the driver computes the individual segment full outer UDP checksum prior
+      to the segmentation itself.
+  \end{itemize}
+\end{note}
+
 \item \field{num_buffers} is set to zero.  This field is unused on transmitted packets.
 
 \item The header and packet are added as one output descriptor to the
@@ -557,6 +648,34 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
 \field{gso_type}.
 
+The driver MUST NOT send to the device TCP or UDP GSO packets over UDP tunnel
+requiring segmentation offload, unless the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is
+negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL
+bit in the \field{gso_type}.
+
+The driver MUST NOT send to the device TCP or UDP GSO packets over UDP tunnel
+requiring segmentation and outer UDP checksum offload, unless both the
+VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO and VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM features
+are negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL
+bit in the \field{gso_type} and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags}.
+
+If VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM is not negotiated, the driver MUST not set
+the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags} and, in case of GSO
+packets carried over an UDP tunnel, MUST either supply the full checksum for the
+outer UDP header to the device or such checksum MUST be zero.
+
+\begin{note}
+Is possible to supply the full checksum for the outer UDP header for
+GSO packets over UDP tunnel, only when the GSO packet size is an integer
+multiple of \field{gso_size}.
+\end{note}
+
+The driver MUST NOT set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL together with
+VIRTIO_NET_HDR_GSO_UDP.
+
+The driver MUST NOT set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit \field{flags}
+without setting the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO bit in \field{gso_type}.
+
 If the VIRTIO_NET_F_CSUM feature has been negotiated, the
 driver MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
@@ -598,6 +717,45 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 	header.
 \end{itemize}
 
+If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has been negotiated, the
+driver MAY set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type}, if so:
+\begin{itemize}
+\item the driver MUST set the \field{outer_th_offset} to the outer UDP header
+  offset, the \field{inner_protocol} to the ethernet type of the inner
+  protocol, the \field{inner_mac_offset} to the inner mac header offset and
+  the \field{inner_nh_offset} to the inner network header offset.
+\end{itemize}
+
+If the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature has been negotiated, and the
+bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL in \field{gso_type} is set, the
+driver MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
+\field{flags}, if so:
+\begin{enumerate}
+\item the driver MUST validate the packet checksum at
+	offset 6 from \field{outer_th_offset} as well as all
+	preceding offsets;
+\item the driver MUST set the packet checksum stored in the
+	buffer to the outer UDP pseudo header;
+\item the driver MUST set \field{outer_th_offset} and such that calculating a ones'
+	complement checksum from \field{outer_th_offset} up until the end of
+	the packet and storing the result at offset 6 from  \field{outer_th_offset}
+	will result in a fully checksummed outer UDP packet;
+\end{enumerate}
+Otherwise, if the bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL in \field{gso_type} is set and
+the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{gso_type} is cleared, the driver
+MUST either set the outer UDP checksum to 0 or set it to the full outer UDP header
+value. To compute the full outer UDP header value the driver MUST:
+\begin{enumerate}
+\item set the outer UDP checksum to 0
+\item calculate the ones'complement checksum from \field{outer_th_offset} to
+  \field{csum_start}
+\item add the outer UDP pseudo header checksum
+\end{enumerate}
+
+If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has not
+been negotiated, the driver MUST clear the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit
+in the \field{gso_type}.
+
 The driver SHOULD accept the VIRTIO_NET_F_GUEST_HDRLEN feature if it has
 been offered, and if it's able to provide the exact header length.
 
@@ -633,6 +791,18 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 	\end{note}
 \end{itemize}
 
+If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has been negotiated:
+\begin{itemize}
+\item If the \field{gso_type} has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit set
+	the device MUST use the \field{outer_th_offset}, \field{inner_protocol},
+  \field{inner_mac_offset} and \field{inner_nh_offset} fields to
+  locate the corresponding headers inside the packet.
+\end{itemize}
+
+If VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} is not set, the
+device MUST NOT use the \field{outer_th_offset}, \field{inner_protocol},
+\field{inner_mac_offset} and \field{inner_nh_offset}.
+
 If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
 rely on the packet checksum being correct.
 \paragraph{Packet Transmission Interrupt}\label{sec:Device Types / Network Device / Device Operation / Packet Transmission / Packet Transmission Interrupt}
@@ -727,8 +897,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   has been validated.
 \end{enumerate}
 
-Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP and ECN
-features enable receive checksum, large receive offload and ECN
+Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
+and ECN features enable receive checksum, large receive offload and ECN
 support which are the input equivalents of the transmit checksum,
 transmit segmentation offloading and ECN features, as described
 in \ref{sec:Device Types / Network Device / Device Operation /
@@ -750,8 +920,20 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
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
+  bit MAY be set. In such case the \field{outer_th_offset}, \field{inner_protocol},
+  \field{inner_mac_offset} and \field{inner_nh_offset} fields indicates corresponding
+  header information.
+\item If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM feature was negotiated, and the
+  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit is set in \field{gso_type}, the
+  VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags} can be set: if so,
+  the outer UDP header checksum at offset 6 from \field{outer_th_offset} have
+  been validated. The checksum on the packet is incomplete and the
+  \field{outer_th_offset} indicates how to calculate it.
 
 \end{enumerate}
 
@@ -796,6 +978,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 If none of VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 have been negotiated,
 the device MUST NOT set \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
 
+If VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO is not negotiated the device MUST NOT set
+the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type}.
+
+If VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM is not negotiaded the device MUST NOT set
+the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
+
 The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
 which have the Explicit Congestion Notification bit set, unless the
 VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
@@ -819,6 +1007,13 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 	fully checksummed packet;
 \end{enumerate}
 
+The device MUST NOT send to the driver TCP or UDP GSO packets encapsulated in UDP
+tunnel and requiring segmentation offload, unless the
+VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO is negotiated, in which case the device MUST set
+the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} and MUST set the
+\field{outer_th_offset}, \field{inner_protocol}, \field{inner_mac_offset} and
+\field{inner_nh_offset}.
+
 If none of the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options have
 been negotiated, the device MUST set \field{gso_type} to
 VIRTIO_NET_HDR_GSO_NONE.
@@ -842,8 +1037,39 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_DATA_VALID bit in
 \field{flags}, if so, the device MUST validate the packet
-checksum (in case of multiple encapsulated protocols, one level
-of checksums is validated).
+checksum.
+
+If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and the VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM
+feature has been negotiated, the bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL is set in
+\field{gso_type}
+device MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
+\field{flags}, if so:
+\begin{enumerate}
+\item the device MUST validate the packet checksum at
+	offset 6 from \field{outer_th_offset};
+\item the device MUST set the packet checksum stored in the
+	receive buffer to the outer UDP pseudo header;
+\item the device MUST set \field{outer_th_offset} such that
+	calculating a ones' complement checksum from
+	\field{outer_th_offset} up until the end of the packet
+	and storing the result at offset 6 from \field{outer_th_offset}
+	will result in the outer UDP header fully checksummed;
+\end{enumerate}
+Otherwise, if the VIRTIO_NET_HDR_GSO_UDP_TUNNEL is set in
+\field{gso_type} and the bit VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is cleared in
+\field{flags}, the device MUST must either provide a zero outer UDP header
+checksum or a fully checksummed outer UDP header.
+
+\begin{note}
+The latter case is possible only if the GSO packet size is be a
+multiple of \field{gso_size}.
+\end{note}
+
+\begin{note}
+If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO feature is negotiated and the
+VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit is set, the VIRTIO_NET_HDR_F_NEEDS_CSUM
+bit refers to the inner header checksum.
+\end{note}
 
 \drivernormative{\paragraph}{Processing of Incoming
 Packets}{Device Types / Network Device / Device Operation /
@@ -867,6 +1093,10 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
 rely on the packet checksum being correct.
 
+If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_GSO bit in \field{gso_type} is not set,
+the driver MUST NOT use the \field{outer_th_offset}, \field{inner_protocol},
+\field{inner_mac_offset} and \field{inner_nh_offset}.
+
 \paragraph{Hash calculation for incoming packets}
 \label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets / Hash calculation for incoming packets}
 
@@ -1624,6 +1854,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_F_GUEST_TSO6       8
 #define VIRTIO_NET_F_GUEST_ECN        9
 #define VIRTIO_NET_F_GUEST_UFO        10
+#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  47
+#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM 48
 #define VIRTIO_NET_F_GUEST_USO4       54
 #define VIRTIO_NET_F_GUEST_USO6       55
 
-- 
2.45.1

