Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943C1210F5D
	for <virtio-comment@lists.linux.dev>; Tue, 29 Apr 2025 12:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745930430; cv=none; b=RpCR3jt7k1uuApwvR33oUb7MXVQzHfNdpQPIgtDtXC5sLVhpgn9YXmXVigTS1AhrWI19oKe4ii4Fj8iTKx+AqTDP6EreRoN2yubsxjMYyI4ceZqWRurg0QbvsHC0m1tzPnFAmD79oM72jJl6OkyVuf+2KRxMsqakvPL47+za4Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745930430; c=relaxed/simple;
	bh=kF23alz+dcLiQL7/ehGDtEssbZqajKfWGmikJZ9Tzfc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W29xqTw+z3VXE/wyTNRD4BiHTj4F98t79HMKIDdusuwuRThR2xkjUwTbMjulDk9nY1CaY7UEO/HEmj6YYXrJrsR/MLuPHZ4ezJHSJIpvV4Y32Dx8+fbVGP3D/Sh36Z41ZeqpI2j82ntPXYHWad6AskQI9W5gEshbt+Dw5gQdp1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=bBaXHgM2; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="bBaXHgM2"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9NSJ3020905;
	Tue, 29 Apr 2025 05:40:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=J
	ZbQUxXF5bJ2IjhJXXxb1ubCmMJuzBZ4McbReHBdtq0=; b=bBaXHgM2C9j/WSsMa
	4tEJOxgmwjWQqaJINKJW3c8eNgvMXIbqrbpdYNI9hScUL9zPYUDdVjW89ropfdFD
	no52Goe29RQFHor7+k+dywLM6ZU4I5maSufzc6CFvab62qSvBnIJnI8sRXBqbyYV
	Bobnr7uxJK8fI0NSDMMJG62JrB0kIkz4kenyCX5mfNDVoACu+bXapfWMD0BVPKn4
	Q37akCeZpxHo7ImkHME8ECg6ME+silDfk6R+8PkAyOHK/xJRvM9Gdb4ZMfLOuZ+J
	PvFPZJIjvlTOHd0+IYAK9J9c5xkGdH9/ORDPcNqUC/gmorDOMUanvu/KsklZ20yd
	4z8Bg==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 468vuq60nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 05:40:27 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 29 Apr 2025 05:40:26 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 29 Apr 2025 05:40:26 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 8EB835B6949;
	Tue, 29 Apr 2025 05:40:22 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <kshankar@marvell.com>, <schalla@marvell.com>
Subject: [PATCH v6 3/4] virtio-net: extend virtio_net_hdr for IPsec support
Date: Tue, 29 Apr 2025 18:10:09 +0530
Message-ID: <20250429124010.1949371-4-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250429124010.1949371-1-schalla@marvell.com>
References: <20250429124010.1949371-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5NCBTYWx0ZWRfX3rUo3zOrzn5r wr8pjqyK9MD4nRgb1gHTkyrW7oXMSB1BYTaZAUGhkjpv05MMYRCsnVKhU9KRto+5xyFy9iL4c0U ywMD7Mc9LAcu7veKTb61Ik1TvkrMP7XsZU7850DJ+cAN67WDHvR9ACZU5vAMt/DEvMHVQKiuTZI
 t7bLV6AaanPWDNwFLF9pzL0KQ/AjI9bQcrxB/EzlA/EpHxIgBP8oDmTxK13S9+HEuigh2hZpdPp 7q2jaFstYeLt5XhtXJvSaTy1owKUxUORWGFXz6HMRo4x5AFUIm1PkxJZ+Av/TRl6oSz3ory7qfJ M0rmHQ9Q70KS1zb2h7UQAoCMOu2pMfwrl7s0b12GsO5zsfMX0If0t0lEZCywIMZAD6gJ2Eq4yIe
 wRR3W6eGWyttPHJAxVUS9mRXTFxugjDSSBaUuB6Ern5uzpvKK4WbfNtDe5zxlsYmSKhraIQE
X-Authority-Analysis: v=2.4 cv=L60dQ/T8 c=1 sm=1 tr=0 ts=6810c8bb cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=XR8D0OoHHMoA:10 a=M5GUcnROAAAA:8 a=TGQsgjt1CIk7gjYDjtMA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: pMpe1FG1AfJglOU6q2NfZs1AMfonpM3D
X-Proofpoint-GUID: pMpe1FG1AfJglOU6q2NfZs1AMfonpM3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01

Add IPsec resource object identifiers to the virtio_net_hdr for
identifying encryption/decryption operations on tx and rx side
respectively, along with flags.

Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/net/description.tex | 51 ++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 105a002..2540f2b 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -597,6 +597,9 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_F_DATA_VALID    2
 #define VIRTIO_NET_HDR_F_RSC_INFO      4
 #define VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM 8
+#define VIRTIO_NET_HDR_F_SECURITY      16
+#define VIRTIO_NET_HDR_F_SECURITY_ERR  32
+#define VIRTIO_NET_HDR_F_SECURITY_SA_SOFT_EXPIRY_WARN 64
         u8 flags;
 #define VIRTIO_NET_HDR_GSO_NONE        0
 #define VIRTIO_NET_HDR_GSO_TCPV4       1
@@ -618,7 +621,11 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
         le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
         le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
         le16 outer_nh_offset;   /* Only if VIRTIO_NET_F_OUT_NET_HEADER negotiated */
-        u8 padding_reserved_2[6]; /* Only if VIRTIO_NET_F_OUT_NET_HEADER negotiated */
+        /* Only if VIRTIO_NET_F_IPSEC negotiated */
+        struct ipsec_resource_hdr {
+                le32 resource_id;
+                le16 resource_type;
+        };
 };
 \end{lstlisting}
 
@@ -972,6 +979,15 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 together with the VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV4 bit or the
 VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}.
 
+If the device supports \hyperref[par:Device Types / Network Device / Device Operation / IPsec Operation]{IPsec Operation},
+the driver may set VIRTIO_NET_HDR_F_SECURITY bit in \field{flags}, if so:
+\begin{enumerate}
+\item the driver MUST create IPsec Outbound resource object
+\hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-ENC-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA}
+\item the driver MUST set \field{resource_id} to a valid IPsec outbound
+      resource object ID.
+\end{enumerate}
+
 \devicenormative{\paragraph}{Packet Transmission}{Device Types / Network Device / Device Operation / Packet Transmission}
 The device MUST ignore \field{flag} bits that it does not recognize.
 
@@ -1032,6 +1048,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
 If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
 rely on the packet checksum being correct.
+
+If VIRTIO_NET_HDR_F_SECURITY bit in \field{flags} is not set, the
+device MUST NOT use the \field{resource_id} and \field{resource_type}.
+
 \paragraph{Packet Transmission Interrupt}\label{sec:Device Types / Network Device / Device Operation / Packet Transmission / Packet Transmission Interrupt}
 
 Often a driver will suppress transmission virtqueue interrupts
@@ -1084,8 +1104,8 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
 \end{note}
 
 When calculating the size of \field{struct virtio_net_hdr}, the driver
-MUST consider all the fields inclusive up to \field{padding_reserved_2},
-i.e. 32 bytes if VIRTIO_NET_F_OUT_NET_HEADER is negotiated or up to \field{inner_nh_offset}
+MUST consider all the fields inclusive up to \field{struct ipsec_resource_hdr},
+i.e. 32 bytes if VIRTIO_NET_F_OUT_NET_HEADER or VIRTIO_NET_F_IPSEC is negotiated or up to \field{inner_nh_offset}
 i.e. 24 bytes if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated or up to \field{padding_reserved}
 i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
 
@@ -1341,6 +1361,21 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 \field{flags}, the device MUST either provide a zero outer UDP header
 checksum or a fully checksummed outer UDP header.
 
+The device MUST set the VIRTIO_NET_HDR_F_SECURITY bit in the \field{flags}
+if the packet goes through the IPsec processing. Otherwise, this bit MUST
+be cleared. The device MUST set or clear this bit regardless of setting
+VIRTIO_NET_HDR_F_SECURITY_ERR or VIRTIO_NET_HDR_F_SECURITY_SA_SOFT_EXPIRY_WARN bit.
+
+The device MUST set the VIRTIO_NET_HDR_F_SECURITY_ERR bit in the \field{flags}
+if any error is encountered during IPsec processing. Otherwise, this bit MUST be cleared.
+The device MUST set or clear this bit regardless of setting
+VIRTIO_NET_HDR_F_SECURITY_SA_SOFT_EXPIRY_WARN bit.
+
+The device MUST set the VIRTIO_NET_HDR_F_SECURITY_SA_SOFT_EXPIRY_WARN bit in the \field{flags}
+if the SA associated with \field{resource_id} reaches the SA lifetime soft limits configured in
+the \field{struct virtio_crypto_ipsec_lifetime}.
+See \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA}.
+
 \drivernormative{\paragraph}{Processing of Incoming
 Packets}{Device Types / Network Device / Device Operation /
 Processing of Incoming Packets}
@@ -1392,6 +1427,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 in \field{gso_type} are not set,
 the driver MOST NOT accept the packet.
 
+When VIRTIO_NET_HDR_F_SECURITY and VIRTIO_NET_HDR_F_SECURITY_ERR bits are set in the \field{flags},
+it indicates that the device experienced a processing error on the IPsec packet.
+It need not be an 'error packet'. For example, a particular SA was not offloaded or
+SA has reached the SA lifetime hard limits configured in the \field{struct virtio_crypto_ipsec_lifetime}.
+So vnet_hdr will have both bits set.
+
 \paragraph{Hash calculation for incoming packets}
 \label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets / Hash calculation for incoming packets}
 
@@ -3528,6 +3569,10 @@ \subsubsection{IPsec Operation}\label{sec:Device Types / Network Device / Device
 See \ref{sec:Device Types / Network Device / Device Operation / Flow filter}
 for details about flow filter.
 
+Note that there is a small race condition where a SA object might be destroyed
+while a recieve packet is still inflight. The driver SHOULD handle this situation
+appropriately.
+
 \paragraph{Device and driver capabilities}
 \label{par:Device Types / Network Device / Device Operation / IPsec Operation / Device and driver capabilities}
 
-- 
2.25.1

