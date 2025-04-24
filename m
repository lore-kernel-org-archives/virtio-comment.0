Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED70214A91
	for <virtio-comment@lists.linux.dev>; Thu, 24 Apr 2025 09:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487317; cv=none; b=FOgtduTqqTFkXKvsGCz1Ft1MC9fb21oiSXxXgaaCVl/6fTpJGSbbmNmpkWxMlxIzFVWYteeKfve1zCqbW978l0ee5Q+5KBrgEKkZxQqeJL6oWq6434bH0gZi2jZyiznvJ1L0kbbzHxbODwHt1PsEvEa2WuD4ANtcgD/v8uOEdNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487317; c=relaxed/simple;
	bh=cUiBgRaACwk/XODiAc6KWXj9os72W9yygCIrI1VmPo8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ycj5jBVh4hdC3MMpYxvApyq2Jwl2JoKYf4XWztzVAcqD/FMWuJ9cn6fvl2X0wxg3v5Czi56ItKh4pLCDSDgJXupo6Np0KklW+guEzgSbmVaPaeom/2fFsHstmtp0An2Ziev1lcv+8iY0Hsz/eiPkqa484LiZ6fUTt0CE05X//ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=LDNjFAI/; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="LDNjFAI/"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O9CWQB006551;
	Thu, 24 Apr 2025 02:31:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=F
	Ggu8ACJHdV1VGRRKDjAhXoQLbcevbQ71gQyic86UVE=; b=LDNjFAI/2MlDct+qn
	u3Z1IafU57GagIO+irggomVu1GgxDGKCreJK/VOYxtepGog/2PvVL3Ua91xBdnoC
	VaIqKLcs/09VBpLi8PM3WYCOkqoC/7VQ4YJgjgq2UG+inz9m5dP3+4BSVHZC9uSm
	jCzTBu02btKu3O/Ejo0YRI1tE+N3Ag0usn5bUNFHPWb0PNMAwfGKIp/O26kOhL0X
	kWr/UfY11o3RSicWA9yfjK1V4bauAakuCtX08DJ7EO0jWP3hgn5Dv1k+ZELyaOxM
	GT/V58bJkogIkpeVE/SvgXn0ENGkMVMnM9cd8In6kbu6k3w0pepJNO7iSzRfUiWR
	3ceaQ==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 466jk1c4td-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 02:31:04 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 24 Apr 2025 02:30:59 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 24 Apr 2025 02:30:59 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id D09D03F70A6;
	Thu, 24 Apr 2025 02:30:55 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <mvaralar@redhat.com>,
        <parav@nvidia.com>, <sma@napatech.com>, <sburla@marvell.com>,
        <ndabilpuram@marvell.com>, <jerinj@marvell.com>, <anoobj@marvell.com>,
        <schalla@marvell.com>
Subject: [PATCH RFC v6 2/4] virtio-crypto: Add resource objects for IPsec outbound and inbound SAs
Date: Thu, 24 Apr 2025 15:00:44 +0530
Message-ID: <20250424093046.1927395-3-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250424093046.1927395-1-schalla@marvell.com>
References: <20250424093046.1927395-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX7SIc9uLEPVF0 0+bN7XqbnZRQihRJHNYewJYj2ejRP2RvhDa5XOTq67t0Z9O/Ggq3dCTtyU1UsOmNugFQuD/E2GD j9HQZsyzKVTbzOWVk9QPZwq65qjjnS0HySribbqCDw7vJUdXYMzab59/pr33dh7y6cnCuZCztLY
 5jzv6jQbRxLqDg57M6CdH+ejnPOCnC1j4I1LpAwJvKMWP22pUsB+VRrLAt8yHWbeXRMuZlBqnVC 1E5luOjTi/LFktS4mjoK7GiOcd8Sl9QFNKCrt3d+xu8M/dpoy+NOMk7O2jU+R80DhR+HnRZK+jn Jx2BMwrmRj1eP3xZzy0ZwE+szUP6ZDNe3YV2KUQHtxtiNUc/l8/dNC8W6qH4uDa5sECDhX2hSnZ
 eBIoboHz6xyWPUopKoDEffYgaM0VIsrrSZrEFdwaZCx2s9LDridivffHU97eoycTAX4b7YLg
X-Authority-Analysis: v=2.4 cv=OLwn3TaB c=1 sm=1 tr=0 ts=680a04d8 cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=XR8D0OoHHMoA:10 a=M5GUcnROAAAA:8 a=0H_-Kr0UuhIv2HgSC1sA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: 09e_PVMw0hsrtgqzNuWqBe7Selp-HIZt
X-Proofpoint-ORIG-GUID: 09e_PVMw0hsrtgqzNuWqBe7Selp-HIZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01

This commit introduces resource objects to enable the driver/device to
create IPsec Security Associations (SAs) for both inbound and outbound
directions.

The IPsec SA objects include essential parameters required for packet
outbound and inbound processing, such as SPI, tunnel headers, IPsec mode,
IPsec options and cipher/authentication specific data.

Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/crypto/description.tex | 155 ++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
index f4978f0..544ac18 100644
--- a/device-types/crypto/description.tex
+++ b/device-types/crypto/description.tex
@@ -336,6 +336,20 @@ \subsection{Device and driver capabilities}\label{sec:Device Types / Crypto Devi
 \hline
 \end{tabularx}
 
+\subsection{Device resource objects}\label{sec:Device Types / Crypto Device / Device resource objects}
+
+The crypto device has the following resource objects.
+
+\begin{tabularx}{\textwidth}{ |l||l|X| }
+\hline
+type & Name & Description \\
+\hline \hline
+0x0200 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA]{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA} & IPsec outbound SA resource object \\
+\hline
+0x0201 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-SA]{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA} & IPsec inbound SA resource object \\
+\hline
+\end{tabularx}
+
 \subsection{Device Operation}\label{sec:Device Types / Crypto Device / Device Operation}
 
 The operation of a virtio crypto device is driven by requests placed on the virtqueues.
@@ -2036,3 +2050,144 @@ \subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device /
 \hline
 \end{tabularx}
 \end{table}
+
+\paragraph{Resource objects}
+\label{par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects}
+
+\subparagraph{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA}\label{par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA}
+
+A driver can have outbound SAs between 0 and \field{outb_sa_limit}, as specified by the
+capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For the IPsec outbound SA resource object
+\field{resource_obj_specific_data} is in the format
+\field{struct virtio_crypto_resource_obj_ipsec_sa_256b_key}.
+
+\begin{lstlisting}
+struct in_addr {
+        le32 s_addr;
+};
+
+struct in6_addr {
+        u8 s6_u8[16];
+};
+
+struct virtio_crypto_ipsec_tunnel_param {
+        /* Tunnel type: IPv4 or IPv6 */
+        u8 type;
+        u8 reserved[3];
+        union {
+                /* IPv4 tunnel header parameters */
+                struct {
+                        /* IPv4 source address */
+                        struct in_addr src_ip;
+                        /* IPv4 destination address */
+                        struct in_addr dst_ip;
+                        /* IPv4 Differentiated Services Code Point */
+                        u8 dscp;
+                        /* IPv4 Don't Fragment bit */
+                        u8 df;
+                        /* IPv4 Time To Live */
+                        u8 ttl;
+                        u8 reserved1;
+                } ipv4;
+                /* IPv6 tunnel header parameters */
+                struct {
+                        /* IPv6 source address */
+                        struct in6_addr src_addr;
+                        /* IPv6 destination address */
+                        struct in6_addr dst_addr;
+                        /* IPv6 flow label */
+                        le32 flabel;
+                        /* IPv6 hop limit */
+                        u8 hlimit;
+                        /* IPv6 Differentiated Services Code Point */
+                        u8 dscp;
+                        u8 reserved2[2];
+                } ipv6;
+        };
+};
+
+struct virtio_crypto_ipsec_lifetime {
+        le64 packets_soft_limit;
+        le64 bytes_soft_limit;
+        le64 packets_hard_limit;
+        le64 bytes_hard_limit;
+};
+
+struct virtio_crypto_resource_obj_ipsec_sa_256b_key {
+        u8 mode;
+        u8 direction;
+        u8 reserved[2];
+        le32 obj_id;
+        le32 spi;
+        le32 salt;
+        le64 options;
+        struct virtio_crypto_ipsec_tunnel_param param;
+        le16 udp_sport;
+        le16 udp_dport;
+        le32 replay_win_sz;
+        le64 cipher_algo;
+        struct {
+            le16 length;
+            le16 reserved1;
+            u8 data[32];
+        } cipher_key;
+        le64 auth_algo;
+        struct {
+            le16 length;
+            le16 reserved2;
+            u8 data[32];
+        } auth_key;
+        struct virtio_crypto_ipsec_lifetime life;
+}
+\end{lstlisting}
+
+\field{mode} specifies the mode of the IPsec SA, see
+\ref{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Modes}.
+
+\field{direction} specifies IPsec SA direction.
+\field{obj_id} specifies the object id of the SA that can be used to retrieve
+driver-defined data associated with the IPsec SA.
+\field{spi} is the Security Parameter Index(SPI) used to uniquely identify the IPsec SA.
+\field{salt} is the 32 bit salt value used in the cryptographic operations. 
+
+\field{options} specifies the Options for configuring the IPsec SA, see
+\ref{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Options}.
+
+\field{param} specifies the parameters for IPsec tunnel mode.
+\field{udp_sport} is the source port for UDP encapsulation.
+\field{udp_dport} is the destination port for UDP encapsulation.
+\field{replay_win_sz} is the anti-replay window size to enable sequence replay attack
+handling, replay checking is disabled if the window size is 0.
+
+\field{cipher_algo} is the cipher algorithm identifier
+see \ref{sec:Device Types / Crypto Device / Supported crypto services  / CIPHER services}
+\field{cipher_key} specifies the cipher key and its length.
+\field{auth_algo} is the Authentication algorithm identifier
+\field{auth_key} specifies the authentication key data and its length.
+\field{life} configures soft and hard lifetime of an IPsec SA. The Lifetime of
+an IPsec SA specifies the maximum number of packets or bytes that can be processed.
+IPsec operations starts failing once any hard limit is reached. Soft limits generate
+a warning status when the SA is approaching its hard lifetime limits.
+
+\begin{table}[H]
+\caption{IPsec Direction}
+\label{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA / IPsec Direction}
+\begin{tabularx}{\textwidth}{ |l|X|X| }
+\hline
+Type & Name & Description \\
+\hline \hline
+0x0 & - & Reserved \\
+\hline
+0x1 & VIRTIO_CRYPTO_IPSEC_DIR_OUTBOUND & IPsec direction outbound \\
+\hline
+0x2 & VIRTIO_CRYPTO_IPSEC_DIR_INBOUND & IPsec direction inbound \\
+\hline
+\end{tabularx}
+\end{table}
+
+\subparagraph{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA}\label{par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-SA}
+
+A driver can have inbound SAs between 0 and \field{inb_sa_limit}, as specified by the
+capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For the IPsec inbound SA resource object
+\field{resource_obj_specific_data} is in the format
+\field{struct virtio_crypto_resource_obj_ipsec_sa}.
-- 
2.25.1

