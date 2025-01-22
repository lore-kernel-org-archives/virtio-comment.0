Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4A31684B4
	for <virtio-comment@lists.linux.dev>; Wed, 22 Jan 2025 06:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737526624; cv=none; b=Gq509QTN3EmRL7hNqndkwJ3J+TLQ6jphD0lrFRL2lhOTBBDOvOL+DxfpSR/o87S+TZ2OIhRG4BdfTLP7hzXj5gFCKYVeAcjvrcXunYJyiVSqa+cgwF1p/xr+mM7XtAIDAhv8+pKxPO2AiDLjWYCPZtKmrtkCQAyXEQS28szbiZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737526624; c=relaxed/simple;
	bh=T1yUzY3nI8PxuX/FcZbvgCx0JZLehANVB58ERW5qzV4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oDl0mzwPfVPw5/nfkTNx33WFoC+iRXOyNUJWDoB+apnNZ+Tgidc+cNpKWaOdg+o9ImY8rmE52HE/DRtDp6xFHa8+SaaFkBWeo+i+f/wiyTrQ3D6ftAUtidHRQJDirrQMOaoiV0fl2gurm4jzItO+HfKW9BesoA8dt9wP7owVwIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=KWcKhyLn; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="KWcKhyLn"
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M61bvA026745;
	Tue, 21 Jan 2025 22:16:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=5
	SietgcGKEqXouedNioUcNYSzeKajWNcJ6rvUzUPoCM=; b=KWcKhyLn67WEj0p3b
	nnm2mLFdrQz+6AC8VeU+IhPwOhsVchsIctOrA73PaSY7NkWzaXyD71iUMClJ9wH7
	LeMHWMaNpxErmIgw695+35kfeCLgY3hHW5pi8b2e53hY3B4YGPHmneUUavhRTFum
	cr6mUq/rSu65xsqnR+aG3Pho+qGCSibaenYkf9umbgpz81OzaZF9+ciO4WW5xDnL
	fJYGMuGXSWhr4NZqMJTzqQvMuk7D7cT3T6owySz8iWhzEiGKSKKDAd/CCZ8+q7Xv
	p77/ADpDgQc1mB23e5l6ckWilRnB2EQq1gORPdThduhTsbhuxoue/NkG6P87qDUe
	a/VCg==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 44au1x00ub-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 22:16:55 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 Jan 2025 22:16:51 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 21 Jan 2025 22:16:51 -0800
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id D52593F70B4;
	Tue, 21 Jan 2025 22:16:48 -0800 (PST)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <mvaralar@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <anoobj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v3 1/4] virtio-crypto: Add IPsec service operation and Capabilities
Date: Wed, 22 Jan 2025 11:46:41 +0530
Message-ID: <20250122061644.266560-2-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122061644.266560-1-schalla@marvell.com>
References: <20250122061644.266560-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: lAQWJGo78NTJ_LV5SCdmAKLWEp02hRwR
X-Proofpoint-ORIG-GUID: lAQWJGo78NTJ_LV5SCdmAKLWEp02hRwR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_02,2025-01-22_01,2024-11-22_01

This commit introduces the IPsec service operation to the Crypto
device, enabling offloading of IPsec processing.

Capabilities:

1. IPsec Resource Capability (VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP):
   Indicates the device's IPsec resource limits, such as the number of
   outbound and inbound Security Associations (SAs).
2. IPsec SA Capability (VIRTIO_CRYPTO_IPSEC_SA_CAP): Specifies the
   supported IPsec modes, along with the supported cryptographic
   algorithms, authentication algorithms, IPsec options and
   anti-replay window size.

Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/crypto/description.tex | 166 +++++++++++++++++++++++++++-
 introduction.tex                    |  12 ++
 2 files changed, 173 insertions(+), 5 deletions(-)

diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
index 5705e26..2c00e50 100644
--- a/device-types/crypto/description.tex
+++ b/device-types/crypto/description.tex
@@ -2,13 +2,15 @@ \section{Crypto Device}\label{sec:Device Types / Crypto Device}
 
 The virtio crypto device is a virtual cryptography device as well as a
 virtual cryptographic accelerator. The virtio crypto device provides the
-following crypto services: CIPHER, MAC, HASH, AEAD and AKCIPHER. Virtio crypto
-devices have a single control queue and at least one data queue. Crypto
-operation requests are placed into a data queue, and serviced by the
-device. Some crypto operation requests are only valid in the context of a
-session. The role of the control queue is facilitating control operation
+following crypto services: CIPHER, MAC, HASH, AEAD, AKCIPHER and IPSEC.
+Virtio crypto devices have a single control queue and at least one data
+queue. Crypto operation requests are placed into a data queue, and serviced
+by the device. Some crypto operation requests are only valid in the context
+of a session. The role of the control queue is facilitating control operation
 requests. Sessions management is realized with control operation
 requests.
+The crypto device may have administration command interface through which
+IPsec service capabilities and resources are configured.
 
 \subsection{Device ID}\label{sec:Device Types / Crypto Device / Device ID}
 
@@ -72,6 +74,8 @@ \subsection{Supported crypto services}\label{sec:Device Types / Crypto Device /
 #define VIRTIO_CRYPTO_SERVICE_AEAD   3
 /* AKCIPHER (Asymmetric Key Cipher) service */
 #define VIRTIO_CRYPTO_SERVICE_AKCIPHER 4
+/* IPSEC service */
+#define VIRTIO_CRYPTO_SERVICE_IPSEC  5
 \end{lstlisting}
 
 The above constants designate bits used to indicate the which of crypto services are
@@ -318,6 +322,20 @@ \subsection{Device Initialization}\label{sec:Device Types / Crypto Device / Devi
 \item The driver MUST read the supported algorithms based on \field{crypto_services} field.
 \end{itemize*}
 
+\subsection{Device and driver capabilities}\label{sec:Device Types / Crypto Device / Device and driver capabilities}
+
+The crypto device has the following capabilities.
+
+\begin{tabularx}{\textwidth}{ |l||l|X| }
+\hline
+Identifier & Name & Description \\
+\hline \hline
+0x0800 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-RESOURCE-CAP]{VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP} & IPsec resource capability \\
+\hline
+0x0801 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP]{VIRTIO_CRYPTO_IPSEC_SA_CAP} & IPsec Security Association(SA) capability \\
+\hline
+\end{tabularx}
+
 \subsection{Device Operation}\label{sec:Device Types / Crypto Device / Device Operation}
 
 The operation of a virtio crypto device is driven by requests placed on the virtqueues.
@@ -1872,3 +1890,141 @@ \subsubsection{AKCIPHER Service Operation}\label{sec:Device Types / Crypto Devic
 \item VIRTIO_CRYPTO_ERR if any failure not mentioned above occurs.
 \end{itemize*}
 \end{itemize*}
+
+\subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device / Device Operation / IPSEC Service Operation}
+
+A crypto device can support the processing of IPsec protocol operations.
+In addition to standard crypto processing, the IPsec protocol operations
+are also handled by the Crypto Device as a lookaside operation.
+
+IPsec Inbound processing: The device will perform decryption, authentication,
+integrity checking and remove additional headers, including tunnel header if
+in tunnel mode, as well as the ESP/AH header from the packet(See \hyperref[intro:IPSEC]{IPSEC} RFC).
+The resulting packet contains only the plain data.
+
+IPsec Outbound processing: The device will perform encryption, attach ICV,
+update/add IP header, add ESP/AH header/trailer.
+
+A crypto device can support number of IPsec SAs, allowing it to manage multiple secure
+connections simultaneously.
+
+The device and the driver indicate IPsec SA resource limits using the
+VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP capability specifying the limits on the number of
+IPsec outbound and inbound SA resource objects.
+The VIRTIO_CRYPTO_IPSEC_SA_CAP capability  specifies which IPsec protocol capabilities
+the device supports. The driver indicates the IPsec parameters by setting the IPsec
+SA capability prior to adding any resource object.
+
+The driver controls the IPsec SA resource object using administration commands described in
+\ref{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}.
+
+\paragraph{Device and driver capabilities}
+\label{par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities}
+
+\subparagraph{VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP}
+\label{par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-RESOURCE-CAP}
+
+The VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP capability indicates the IPsec SA resource limits.
+\field{cap_specific_data} is in the format
+\field{struct virtio_crypto_ipsec_resource_cap}.
+
+\begin{lstlisting}
+struct virtio_crypto_ipsec_resource_cap {
+        le32 inb_sa_limit;
+        le32 outb_sa_limit;
+};
+\end{lstlisting}
+
+\field{inb_sa_limit}, and \field{outb_sa_limit} denote the maximum number of IPsec
+security Associations (SAs) that can be utilized for IPsec inbound and outbound processing,
+respectively, which the device is capable of creating.
+
+\subparagraph{VIRTIO_CRYPTO_IPSEC_SA_CAP}
+\label{par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP}
+
+The VIRTIO_CRYPTO_IPSEC_SA_CAP capability lists the supported IPsec modes along with
+the supported cryptographic, authentication algorithms and anti-replay window size for
+each IPsec mode.
+\field{cap_specific_data} is in the format \field{struct virtio_crypto_ipsec_sa_cap_data}.
+
+\begin{lstlisting}[label={lst:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / virtio-crypto-ipsec-mode-cap}]
+struct virtio_crypto_ipsec_mode_cap {
+        u8 mode;
+        u8 reserved[3];
+        le32 max_replay_win_sz;
+        le32 options;
+        le64 cipher_algo;
+        le64 hmac_algo;
+        le32 aead_algo;
+        le32 max_cipher_key_len;
+        le32 max_auth_key_len;
+};
+
+struct virtio_crypto_ipsec_sa_cap_data {
+        u8 count;
+        u8 reserved[7];
+        struct virtio_crypto_ipsec_mode_cap mode[];
+};
+\end{lstlisting}
+
+\field{count} indicates number of valid entries in the \field{mode} array.
+\field{mode[]} is an array of supported IPsec modes. Within each array entry:
+
+\field{mode} specifies the IPsec mode, as defined in table
+\ref{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Modes}.
+\field{max_replay_win_sz} specifies the maximum anti-replay window size the device supports.
+This field is applicable only for inbound operation.
+
+\field{options} Each bit indicates the IPsec protocol options supported by the device, as defined in table
+\ref{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Options}.
+
+\field{cipher_algo} CIPHER algorithms mask, see \ref{sec:Device Types / Crypto Device / Supported crypto services  / CIPHER services}.
+
+\field{hmac_algo} HMAC algorithms mask, see \ref{sec:Device Types / Crypto Device / Supported crypto services  / MAC services}.
+
+\field{aead_algo} AEAD algorithms mask, see \ref{sec:Device Types / Crypto Device / Supported crypto services  / AEAD services}.
+
+\field{max_cipher_key_len} is the maximum length of cipher key supported by the device.
+
+\field{max_auth_key_len} is the maximum length of authenticated key supported by the device.
+
+\begin{table}[H]
+\caption{IPsec Modes}
+\label{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Modes}
+\begin{tabularx}{\textwidth}{ |l|X|X| }
+\hline
+Type & Name & Description \\
+\hline \hline
+0x0 & - & Reserved \\
+\hline
+0x1 & VIRTIO_CRYPTO_IPSEC_MODE_ESP_TUNNEL & IPsec ESP protocol in tunnel mode \\
+\hline
+0x2 & VIRTIO_CRYPTO_IPSEC_MODE_ESP_TRANSPORT & IPsec ESP protocol in transport mode \\
+\hline
+0x3 & VIRTIO_CRYPTO_IPSEC_MODE_AH_TUNNEL & IPsec AH protocol in tunnel mode \\
+\hline
+0x4 & VIRTIO_CRYPTO_IPSEC_MODE_AH_TRANSPORT & IPsec AH protocol in transport mode \\
+\hline
+\end{tabularx}
+\end{table}
+
+See \hyperref[intro:IPSEC]{IPSEC} for more information on tunnel and transport modes in ESP/AH IPsec processing.
+
+\begin{table}[H]
+\caption{IPsec Options}
+\label{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Options}
+\begin{tabularx}{\textwidth}{ |l|X|X| }
+\hline
+Bit Number & Name & Description \\
+\hline \hline
+0 & VIRTIO_CRYPTO_IPSEC_ESN & Specifies whether extended sequence number is supported, as described in \hyperref[intro:ESN]{ESN}\\
+\hline
+1 & VIRTIO_CRYPTO_IPSEC_UDP_ENCAP & Specifies whether udp encapsulation is supported, as described in
+                                    \hyperref[intro:UDP-Encapsulation]{UDP Encapsulation}, applicable only for ESP IPsec processing \\
+\hline
+2 & VIRTIO_CRYPTO_IPSEC_COPY_DSCP & Specifies whether copy dscp is supported, as described in \hyperref[intro:IPSEC]{IPSEC} \\
+\hline
+3 & VIRTIO_CRYPTO_IPSEC_DEC_TTL & Specifies whether decrementing the time to live is supported, as described in \hyperref[intro:IPSEC]{IPSEC} \\
+\hline
+\end{tabularx}
+\end{table}
diff --git a/introduction.tex b/introduction.tex
index e60298a..80aa67a 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -162,6 +162,18 @@ \section{Normative References}\label{sec:Normative References}
 	\phantomsection\label{intro:TCP-Header-Format}\textbf{[TCP Header Format]} &
     TCP Header Format
 	\newline\url{https://www.rfc-editor.org/rfc/rfc9293#name-header-format}\\
+	\phantomsection\label{intro:IPSEC}\textbf{[IPSEC]} &
+    IPsec Protocol
+	\newline\url{https://www.rfc-editor.org/rfc/rfc4301}\\
+	\phantomsection\label{intro:ESP}\textbf{[ESP]} &
+    IPsec ESP
+	\newline\url{https://www.rfc-editor.org/rfc/rfc4303}\\
+	\phantomsection\label{intro:ESN}\textbf{[ESN]} &
+    IPsec ESN
+	\newline\url{https://www.rfc-editor.org/rfc/rfc4304}\\
+	\phantomsection\label{intro:UDP-Encapsulation}\textbf{[UDP Encapsulation]} &
+    IPsec UDP Encapsulation
+	\newline\url{https://www.rfc-editor.org/rfc/rfc3948}\\
 	\phantomsection\label{intro:CAN}\textbf{[CAN]} &
     ISO 11898-1:2015 Road vehicles -- Controller area network (CAN) -- Part 1: Data link layer and physical signalling\\
 	\phantomsection\label{intro:rfc8174}\textbf{[RFC8174]} &
-- 
2.25.1

