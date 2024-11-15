Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8D81B982E
	for <virtio-comment@lists.linux.dev>; Fri, 15 Nov 2024 11:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731671136; cv=none; b=QqecG/qsSf16pj/8S+I5V1eqbX8EvVkQ5ZPOxJ4cHur6ptDo2S24Yj5Bf3+ZOVB7hbPhLRf676+ug9sVzyhMWXhGp4MUxRulUtaGV6XVBKu4iCWXtx2AAA1g26Vtb0HgdzGOIwCVCyNfqiTyVjBFYbz5cPFmn/BFAeiz3kc879A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731671136; c=relaxed/simple;
	bh=UT0X0pRww9YA/972Uo/EEv6VGUZP3ujQkwXoO6/clxw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s2EfFbxz/CSngiCZyM+PSwyEwm77JyF6+pkSFCMggr+p7IxosBbE72WMAOQbsZUJQxU0I6i7rMMd+MWdqMfpT75kc3Krf0Cbpo7nw1iPrqe6ypqljKBA6zoJTf2iPB7l77hg/RX2spAB1p4irfCRXaoXi4GVwHtEfsWu3hAn7M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=D9yE5m5M; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="D9yE5m5M"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF72sER004836;
	Fri, 15 Nov 2024 03:45:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=a
	chZsUxke02dWF00xZfhtIy1Kbo9xV3ke/Jgeu/fUiE=; b=D9yE5m5MvFeKSNT0y
	CqbEuMJvlAhTh1vQD2QJuqrzxHG+EFUw5kdQ40f48TKF+cTiPMKI8zdtJ8pkharM
	/wI7T0oe11mkJ0zxiV0zH0OTsPh9AdWxvIezhkWOiMl7iBaHAJXVHDh7zTrvU+Gu
	Wb2Z3J9WG6JEkQMVi3nPNd/DrCftdATe5B1wwoB0uUkYRQwUJniaT8+5nscLuXfI
	TwA9rrykUJTQ1HGEwbFiDovhSAtvyKKaBgQmeRvKDJvXBkEzSq2oj6Wnmx1Qy9fh
	Ark4iHCRMJUaHtsbK7It21SDqDYQLaglcgME9IydGMuj6NKmrxLBNDnGn/quohUl
	Gl31A==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 42x1jk8c3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 03:45:33 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 15 Nov 2024 03:45:33 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 15 Nov 2024 03:45:33 -0800
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 586533F7048;
	Fri, 15 Nov 2024 03:45:30 -0800 (PST)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <parav@nvidia.com>,
        <sburla@marvell.com>, <ndabilpuram@marvell.com>, <jerinj@marvell.com>,
        <anoobj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC 2/4] virtio-crypto: Add resource objects for IPsec outbound and inbound SAs
Date: Fri, 15 Nov 2024 17:15:21 +0530
Message-ID: <20241115114523.1787840-3-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241115114523.1787840-1-schalla@marvell.com>
References: <20241115114523.1787840-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: s-GJ7PoIV03Sfv8gurjW_D2xoJrv_WQY
X-Proofpoint-ORIG-GUID: s-GJ7PoIV03Sfv8gurjW_D2xoJrv_WQY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

This commit introduces resource objects to enable the driver/device to
create IPsec Security Associations (SAs) for both inbound and outbound
directions.

The IPsec SA objects include essential parameters required for packet
outbound and inbound processing, such as SPI, tunnel headers, IPsec mode,
IPsec options and cipher/authentication specific data.

Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/crypto/description.tex | 133 ++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
index ce4b1fb..7ac6f5b 100644
--- a/device-types/crypto/description.tex
+++ b/device-types/crypto/description.tex
@@ -334,6 +334,20 @@ \subsection{Device and driver capabilities}\label{sec:Device Types / Crypto Devi
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
@@ -2026,3 +2040,122 @@ \subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device /
 \end{tabularx}
 \end{table}
 
+\paragraph{Resource objects}
+\label{par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects}
+
+\subparagraph{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA}\label{par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA}
+
+A driver can have outbound SAs between 0 and \field{outb_sa_limit}, as specified by the
+capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For the IPsec outbound SA resource object
+\field{resource_obj_specific_data} is in the format
+\field{struct virtio_crypto_resource_obj_ipsec_sa}.
+
+\begin{lstlisting}
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
+                        uint8_t dscp;
+                        /* IPv4 Don't Fragment bit */
+                        uint8_t df;
+                        /* IPv4 Time To Live */
+                        uint8_t ttl;
+                } ipv4;
+                /* IPv6 tunnel header parameters */
+                struct {
+                        /* IPv6 source address */
+                        struct in6_addr src_addr;
+                        /* IPv6 destination address */
+                        struct in6_addr dst_addr;
+                        /* IPv6 flow label */
+                        uint32_t flabel;
+                        /* IPv6 hop limit */
+                        uint8_t hlimit;
+                        /* IPv6 Differentiated Services Code Point */
+                        uint8_t dscp;
+                } ipv6;
+        };
+};
+
+struct virtio_crypto_resource_obj_ipsec_sa {
+        le32 spi;
+        le32 salt;
+        le64 options;
+        struct virtio_crypto_ipsec_tunnel_param param;
+        le64 esn;
+        le16 udp_sport;
+        le16 udp_dport;
+        le32 replay_win_sz;
+        le64 cipher_algo;
+        struct {
+            u8 *data;
+            le16 length;
+        } cipher_key;
+        le64 auth_algo;
+        struct {
+            u8 *data;
+            le16 length;
+        } auth_key;
+        le32 obj_id;
+        u8 mode;
+        u8 direction;
+}
+\end{lstlisting}
+
+\field{spi} is the Security Parameter Index(SPI) used to uniquely identify the IPsec SA.
+\field{salt} is the 32 bit salt value used in the cryptographic operations. 
+
+\field{options} specifies the Options for configuring the IPsec SA, see
+\ref{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Options}.
+
+\field{param} specifies the parameters for IPsec tunnel mode.
+\field{esn} is the starting sequence number.
+\field{udp_sport} is the source port for UDP encapsulation. \field{udp_dport} is the
+destination port for UDP encapsulation.
+\field{replay_win_sz} is the anti-replay window size to enable sequence replay attack
+handling, replay checking is disabled if the window size is 0.
+
+\field{cipher_algo} is the cipher algorithm identifier
+see \ref{sec:Device Types / Crypto Device / Supported crypto services  / CIPHER services}
+\field{cipher_key} specifies the cipher key and it's length.
+\field{auth_algo} is the Authentication algorithm identifier
+\field{auth_key} specifies the authentication key data and its length.
+\field{obj_id} specifies the object id of the SA that can be used to retrieve
+driver-defined data associated with the IPsec SA.
+
+\field{mode} specifies the mode of the IPsec SA, see
+\ref{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Modes}.
+
+\field{direction} specifies IPsec SA direction, see
+\ref{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA / IPsec Direction}.
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

