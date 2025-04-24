Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28B5221283
	for <virtio-comment@lists.linux.dev>; Thu, 24 Apr 2025 09:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487832; cv=none; b=eY05mkvWdwA9pB06tb3aYHQyeZNMlY0TRyPkm8YbPX3p1K+IuKY7K9jJ4RATNmLJHR9LgYy8FQ3EIAkFKKUT+G6IWjxXGC1EstpZrdbH1e1KPPCc8CzyYZ4XrpYeNHBJAj5PSBqw6NDuwL4i8ySO0NvioInA7Be51EG04dulo20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487832; c=relaxed/simple;
	bh=8HkzUMaKw3YYHG9MQ8tZF25UpXi45sNw79YN7nsc5bU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NLBaT3evKuV7gZD/4G8qSMIiWr1H2Nppk4i46PPGJX3wSCmeVm5PQX8mShv6aalQBhXoAgQ+NEXTdYZWTercGIvEue6AsaiEWhv0H3qg9BtjUJQ2YDrj9TmfOFrxJC+m/1yQbjEEI1O40kPRdHaQlxA+Rg+SbIAXcWMqBl5mZ50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=CRBpygWo; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="CRBpygWo"
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O9Xk2Z025528;
	Thu, 24 Apr 2025 02:43:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=v
	4B+UK1EkgfIL8YAOWN5XkR/ka4bRmUvFWzZLeiy3RY=; b=CRBpygWodV/py+L6f
	Tqbnk0zkqM6W132YsnhSKqUm6jcDJ3Qb3yIHGE69Um+E/nCNiv+tboFKKmCGEjgC
	aizGURcc5O6VcymF/JkZ6KeI1pZUVIE0pOp2yECc9d7b79xufTpyWnFqaUofvRmq
	9p147KsMbg9m30DXEO3xNsPWrE2Xn5ETGkDe4Ap/FddXrwg3jcjYAQdZRvPpCHS1
	heQsoTBXl2KZ+4oiRB9Vctki+8n0tRb2y4Tl9XBd87Gwfqb1ehUpQt4jVgw1C048
	RMmnOdykT4zxCCYYOQBXk2erhp6x5Lml2hOAugkyrIG8d42A46GEXusPrn0tqbc4
	kcZBQ==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 466jk1m65f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 02:43:49 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 24 Apr 2025 02:43:48 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 24 Apr 2025 02:43:48 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 140993F7097;
	Thu, 24 Apr 2025 02:43:44 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <kshankar@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v5 3/4] virtio-net: extend virtio_net_hdr for IPsec support
Date: Thu, 24 Apr 2025 15:13:31 +0530
Message-ID: <20250424094332.1927688-4-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250424094332.1927688-1-schalla@marvell.com>
References: <20250424094332.1927688-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2NCBTYWx0ZWRfXzQ83Kwe2LVCg ppI5IQh9qtlsGo0bqsFhreLUgYjV16B/N+6zA2F0QXe0CWf6KsqZ32IcY0FHP6ki8PRFw5wYUDJ BEknh2L2K2FGGURyDsrF9voY6KNUwWH9yluXxDG0pnsyMTZsrdpgKHsV8nHfzF7dxS4Wt46Pn8U
 hMebyxCGBok+2su0QvdlyNvatogsaARkFY661b3dFmdTfANmymN99O82hKO2OEOO+dFQF3/pArW K89mKwApzcaEe5tDNO5lw9U5dv3tymcPlqINDrhxurcjqHt1uZRfE0BFjUj7MQFO5VlfU6dlDy8 tmLrLQlb81gK49HTimwtyoJUiBWT65wNbQyyXj2oqgcGMlWmFtNtUVS8BzJqFmg/29fP3uo8DTL
 XNJknxKEXAL5bfqzPlkrfox3JBS4efPrVkZNM7QeSVxvvVb9A6OFQKqwLvk//lYa+F1OWZgD
X-Authority-Analysis: v=2.4 cv=C+vpyRP+ c=1 sm=1 tr=0 ts=680a07d5 cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=XR8D0OoHHMoA:10 a=M5GUcnROAAAA:8 a=TGQsgjt1CIk7gjYDjtMA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: B8bvt4dlyd5VlCGbhizeAMa94YzZL0dV
X-Proofpoint-ORIG-GUID: B8bvt4dlyd5VlCGbhizeAMa94YzZL0dV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01

Add IPsec resource object identifiers to the virtio_net_hdr for
identifying encryption/decryption operations on tx and rx side
respectively, along with flags.

Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/net/description.tex | 50 +++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index ea70c6f..8903e03 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -596,6 +596,9 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_F_DATA_VALID    2
 #define VIRTIO_NET_HDR_F_RSC_INFO      4
 #define VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM 8
+#define VIRTIO_NET_HDR_F_SECURITY      16
+#define VIRTIO_NET_HDR_F_SECURITY_ERR  32
+#define VIRTIO_NET_HDR_F_SECURITY_SA_SOFT_EXPIRY_WARN 64
         u8 flags;
 #define VIRTIO_NET_HDR_GSO_NONE        0
 #define VIRTIO_NET_HDR_GSO_TCPV4       1
@@ -618,6 +621,12 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
         le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
         le16 outer_nh_offset;   /* Only if VIRTIO_NET_F_OUT_NET_HEADER negotiated */
         u8 padding_reserved_2[6]; /* Only if VIRTIO_NET_F_OUT_NET_HEADER negotiated */
+        /* Present only if VIRTIO_NET_F_IPSEC negotiated */
+        struct ipsec_resource_hdr {
+                le32 resource_id;
+                le16 resource_type;
+                u8 padding_reserved_3[2];
+        };
 };
 \end{lstlisting}
 
@@ -971,6 +980,15 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
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
 
@@ -1031,6 +1049,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
 If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
 rely on the packet checksum being correct.
+
+If VIRTIO_NET_HDR_F_SECURITY bit in \field{flags} is not set, the
+device MUST NOT use the \field{resource_id} and \field{resource_type}.
+
 \paragraph{Packet Transmission Interrupt}\label{sec:Device Types / Network Device / Device Operation / Packet Transmission / Packet Transmission Interrupt}
 
 Often a driver will suppress transmission virtqueue interrupts
@@ -1083,7 +1105,8 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
 \end{note}
 
 When calculating the size of \field{struct virtio_net_hdr}, the driver
-MUST consider all the fields inclusive up to \field{padding_reserved_2},
+MUST consider all the fields inclusive up to \field{struct ipsec_resource_hdr},
+i.e. 40 bytes if VIRTIO_NET_F_IPSEC is negotiated or up to \field{padding_reserved_2}
 i.e. 32 bytes if VIRTIO_NET_F_OUT_NET_HEADER is negotiated or up to \field{inner_nh_offset}
 i.e. 24 bytes if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated or up to \field{padding_reserved}
 i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
@@ -1340,6 +1363,21 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
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
@@ -1391,6 +1429,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
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
 
@@ -3526,6 +3570,10 @@ \subsubsection{IPsec Operation}\label{sec:Device Types / Network Device / Device
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

