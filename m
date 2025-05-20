Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44031172A
	for <virtio-comment@lists.linux.dev>; Tue, 20 May 2025 12:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747743584; cv=none; b=CHo9SgdP6+0GDy+n8qb59dFqyALJ3Fr6qsuIPZPa2vPcj8/OqafZ3GJK9UDkwoJvqAYTUQNPY4matK2YVK9ESGHIwwJDNGY7JOhP997Efb8vIcaBQhLQktBnR94avxlFS6hbqOfvF/tZakKe5LRPPhUX84zeL2FQ2KYTp1jW6n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747743584; c=relaxed/simple;
	bh=im/TFjD7eicFmOpjDM4+ybH6ysxLhGHUgs1xcm5FDRw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rT/uk0fLnq87JQVKXLD1unvGjjBd/qO5tiMaXzyFYpvuyi9cwb2RtNgqRr0M73PqjEKJgMPK1re0FJSVk/FUCcEXVEkGKo7EqEUJ7+fUn3s53x0A8xb6OcYUZ0tM9Omg/3DHd72LTVp2273VLWEcmHO6vdba10YuqCsZGuE/5Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=cevMG2/3; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="cevMG2/3"
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K6iIw2007934;
	Tue, 20 May 2025 05:19:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=w
	fW7mPb9Gx2fQiQ/N9DmPkua+SqPsQhNX55tZW3TXm4=; b=cevMG2/3eurKe34OZ
	uTH17fW91qnQC+UQN/4PbsfCefdfHdjBRm8SujQoBw3J9qCdrYfA+kgQ1M/9DEtC
	DertIZQZ7gWjgsvMl4UsuRLHTN0+06HtKyXDCA/knK0E/WldTR4YeYoRmyRo8gAb
	gwFXQKGH8k1XgoP7HKg/FCh30cqK+tUU1x50QFnPDk1N+upOD9xak1kpDZDeRzoA
	xMbYBs4sMjhoQiEUpbeihZHCLQZowX7PJbQFmcZm7Hrd1o8uWbb2dQwsFMHo1JE9
	nHu3PLN1u1TnOFmARevmODimrgqpvW7UNOBfvh6pg2vDQ5JUwD1nYZ4wZFXvctZ3
	50lxA==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 46rmqxgh01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 05:19:41 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 20 May 2025 05:19:40 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 20 May 2025 05:19:40 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 0A9D93F7061;
	Tue, 20 May 2025 05:19:36 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <kshankar@marvell.com>, <schalla@marvell.com>
Subject: [PATCH v7 3/4] virtio-net: extend virtio_net_hdr for IPsec support
Date: Tue, 20 May 2025 17:49:23 +0530
Message-ID: <20250520121924.2169258-4-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250520121924.2169258-1-schalla@marvell.com>
References: <20250520121924.2169258-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: gQaajipjeOR9tQEmT12v2sMP2QiL2Ssl
X-Authority-Analysis: v=2.4 cv=MMtgmNZl c=1 sm=1 tr=0 ts=682c735d cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=dt9VzEwgFbYA:10 a=M5GUcnROAAAA:8 a=Ikd4Dj_1AAAA:8 a=TGQsgjt1CIk7gjYDjtMA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: gQaajipjeOR9tQEmT12v2sMP2QiL2Ssl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA5OSBTYWx0ZWRfX3oE1vnTMeTKJ 3hJb74qmVljDuy84uD8Qyk2YKMMrYdkRabXCEe3gFaHAwk/x54lbhfrY+oz/7LdhZceWCZRPuXZ HWKGCjs93xVIQ3WpQpkXRb+5ObxeMAssW93wB02pOi3a52dq5U8AyYI5ekRBUAmNGzDRlfFIzNY
 nGqkoiEGlqbK559yBFXWw/ejRzEXOdF1BIMSIBvmVZx8j8LJiFdbnCk5/kiRi3eU8efhE3nch5d 84eM2Ul+twkh5UEw7oUdNlyiJEtUJylWI0AG7cQKktkoLbjsFnt2MeZzFslkcl4u5lm+r5bh+2N 2XDLutGvWWbEsqYA2rZuhY0/Uj7PmeHEvfbSYwxjHLUODxshT6Wd+/coifWISD5TOTG3L4k3SxJ
 SAo6fezD/NiwQ/MKUXFrc1aruYV1HBv3bo2mJOIaAJ5vUO6KT5wRQjsPL/f67467cXGZNTGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_05,2025-05-16_03,2025-03-28_01

Add IPsec resource object identifiers to the virtio_net_hdr for
identifying encryption/decryption operations on tx and rx side
respectively, along with flags.

Signed-off-by: Srujana Challa <schalla@marvell.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
---
 device-types/net/description.tex | 52 ++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 105a002..a2a1753 100644
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
@@ -618,7 +621,14 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
         le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
         le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
         le16 outer_nh_offset;   /* Only if VIRTIO_NET_F_OUT_NET_HEADER negotiated */
-        u8 padding_reserved_2[6]; /* Only if VIRTIO_NET_F_OUT_NET_HEADER negotiated */
+        /* Only if VIRTIO_NET_F_OUT_NET_HEADER or VIRTIO_NET_F_IPSEC negotiated */
+        union {
+                u8 padding_reserved_2[6];
+                struct ipsec_resource_hdr {
+                        le32 resource_id;
+                        le16 resource_type;
+                } ipsec_resource_hdr;
+        };
 };
 \end{lstlisting}
 
@@ -972,6 +982,15 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
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
 
@@ -1032,6 +1051,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
 If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
 rely on the packet checksum being correct.
+
+If VIRTIO_NET_HDR_F_SECURITY bit in \field{flags} is not set, the
+device MUST NOT use the \field{resource_id} and \field{resource_type}.
+
 \paragraph{Packet Transmission Interrupt}\label{sec:Device Types / Network Device / Device Operation / Packet Transmission / Packet Transmission Interrupt}
 
 Often a driver will suppress transmission virtqueue interrupts
@@ -1085,7 +1108,7 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
 
 When calculating the size of \field{struct virtio_net_hdr}, the driver
 MUST consider all the fields inclusive up to \field{padding_reserved_2},
-i.e. 32 bytes if VIRTIO_NET_F_OUT_NET_HEADER is negotiated or up to \field{inner_nh_offset}
+i.e. 32 bytes if VIRTIO_NET_F_OUT_NET_HEADER or VIRTIO_NET_F_IPSEC is negotiated or up to \field{inner_nh_offset}
 i.e. 24 bytes if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated or up to \field{padding_reserved}
 i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
 
@@ -1341,6 +1364,21 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
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
@@ -1392,6 +1430,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
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
 
@@ -3528,6 +3572,10 @@ \subsubsection{IPsec Operation}\label{sec:Device Types / Network Device / Device
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

