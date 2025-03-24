Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB332BAF7
	for <virtio-comment@lists.linux.dev>; Mon, 24 Mar 2025 06:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742798552; cv=none; b=Sqgd0/Pu6MVTMOUF7TqK3Y+Bnmzkn0MWEH9BPpgNHCMm8m/oxd5VuzWx5UVbBap4jmqH++qrJt46SfRqWYeswZ/517txdmWG9ahFo88fVBVi4N2nrT7F9BuY8NB9olX3To4XiDeLDVUZc/av+SXXOjTQCuV+xoCu26UbbKtR+4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742798552; c=relaxed/simple;
	bh=7ODHyvuij8hm/VCJfIZMsHttP5RjDNDEEiFeVsb/DTM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FVRp8CIMjr1mtqjH/CKxK6qHHGQALJaSsF9CiL52vKD+oqIl/DEyLRWADdAdCupBI7CYqK5QpfLjFRMI99uj7udf3DdtxnYj56L7UftZm4nAfzemNHVwH5v+oI2wTsdPMQ0H2DtCii4/mJMgOTMW86FkHUILEUoxKUkcNk21+I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=P/MFcCsk; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="P/MFcCsk"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O3Cwf6006122;
	Sun, 23 Mar 2025 23:38:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=s
	FQJXXye+oXEpIZ+1fRIpx5Ms2tFNrLjiDSm+IRN+Rg=; b=P/MFcCsk2+CQC6VBu
	TkiO46QhcoIM290wipRPCnV5R6dVW/jfzmfy74RGHP6LgSHqEsSBBkruvDlME/Uq
	noHTx6QKqsuEGPF0v2tbAfUGawT1JzCgLlMl+YRfpGq/5W7odYtVq0cej1kQ8d+X
	80zSLv2eBFOBspU3h82XeGR7RAH0me2/8sqwhEu2XSVCX7wvdQvLbgWuR5TFGfvr
	28ccdRpGfK5d2pqDQo/9dENc4Bcd++vmRzb0A+9DaXaAzOeRVw8Y/jGvNFVoRrQ/
	th+4NfCOHnEL1zjLQv9O9CbFXSLejwn+3FHwCdwMIePV9ycR1my/252UPdBSuLAs
	pespg==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 45jy9ng9ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Mar 2025 23:38:52 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 23 Mar 2025 23:38:51 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 23 Mar 2025 23:38:51 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 3D7443F70DE;
	Sun, 23 Mar 2025 23:38:48 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <mvaralar@redhat.com>,
        <parav@nvidia.com>, <sma@napatech.com>, <sburla@marvell.com>,
        <ndabilpuram@marvell.com>, <jerinj@marvell.com>, <anoobj@marvell.com>,
        <schalla@marvell.com>
Subject: [PATCH RFC v4 1/4] virtio-crypto: Add IPsec service operation and Capabilities
Date: Mon, 24 Mar 2025 12:08:40 +0530
Message-ID: <20250324063843.1599512-2-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250324063843.1599512-1-schalla@marvell.com>
References: <20250324063843.1599512-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=YvgPR5YX c=1 sm=1 tr=0 ts=67e0fdfc cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=Vs1iUdzkB0EA:10 a=BqEg4_3jAAAA:8 a=M5GUcnROAAAA:8 a=V35hCYzM3wOqFGfn7v4A:9 a=0mFWnFbQd5xWBqmg7tTt:22
 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: br2w6huPaDwP88vGPLj4hvTFDxpkDdAp
X-Proofpoint-ORIG-GUID: br2w6huPaDwP88vGPLj4hvTFDxpkDdAp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01

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
 device-types/crypto/description.tex | 173 +++++++++++++++++++++++++++-
 introduction.tex                    |  12 ++
 2 files changed, 180 insertions(+), 5 deletions(-)

diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
index e053cc7..958c231 100644
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
@@ -1872,3 +1890,148 @@ \subsubsection{AKCIPHER Service Operation}\label{sec:Device Types / Crypto Devic
 \item VIRTIO_CRYPTO_ERR if any failure not mentioned above occurs.
 \end{itemize*}
 \end{itemize*}
+
+\subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device / Device Operation / IPSEC Service Operation}
+
+A crypto device can support the processing of IPsec protocol operations.
+In addition to standard crypto processing, the IPsec protocol operations
+are also handled by the crypto device as a lookaside operation.
+
+IPsec Inbound processing: The device performs decryption, authentication,
+integrity checking and remove additional headers, including tunnel header if
+in tunnel mode, as well as the ESP/AH header from the packet(See \hyperref[intro:IPSEC]{IPSEC} RFC).
+The resulting packet contains only the plain data.
+
+IPsec Outbound processing: The device performs encryption, attach ICV,
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
+        le32 reserved1;
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
+        struct virtio_crypto_ipsec_mode_cap cap_mode[];
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
+\field{max_auth_key_len} is the maximum length of authentication key supported by the device.
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
+4 & VIRTIO_CRYPTO_IPSEC_COPY_DF & Specifies whether copy Don't Fragment bit is supported, as described in \hyperref[intro:IPSEC]{IPSEC} \\
+\hline
+5 & VIRTIO_CRYPTO_IPSEC_ECN & Specifies whether copy Explicit Congestion Notification is supported, as described in \hyperref[intro:IPSEC]{IPSEC} \\
+\hline
+6 & VIRTIO_CRYPTO_IPSEC_SA_LIFETIME & Specifies whether SA lifetime feature is supported, as described in \hyperref[intro:IPSEC]{IPSEC} \\
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

