Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E02C1B4F2A
	for <virtio-comment@lists.linux.dev>; Fri, 15 Nov 2024 11:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731671133; cv=none; b=uEuGkryRBwrmc7JWgeM9IFEuEB6PAzYbCNGmRsX+UP8E3Ana9ILuWjn2+P4IJ+btULKovvofR7S/PddJHt7p+FKhDEljmzxpyTX2QfJQJKBQ/O4OSzn8e7RX6upfwRy8wM40MxSlcgJm0LLm7eRyvGZJhyHBXk+aZHASMB+T+T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731671133; c=relaxed/simple;
	bh=ivgPTpR3G0SSpZ+LtIuXUCnuQGK6mi6ap4Ff6b46Pjg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jRdKw9PX11LLfQRJSY4mQcVPZKfxqHD6pL2ySO2B3p7QSq9VBu+4iw+mnAfO5IuN/TgvCcuSVtocIwQXdfF4CqU+3G3MCzZcr+gXO4Eo2qqK5d31P4qPjsRBwURR1sKRptfClhcm8fLOfcT/9FGdqW2dJ3q9tOg/+dr3dSJ/oF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=HrhioUkq; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="HrhioUkq"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF72mPq004802;
	Fri, 15 Nov 2024 03:45:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=B
	tqNL6lqWRQuC9Axi3OwdUbPvL3OHoewPPqw7QYBXpI=; b=HrhioUkqsJRQQQ4os
	neBwEcmbSI3ZGhYL3rxxcRHTPWwDXffZLKlTbXHm/z37a782ptJrR6T6P5V8viBH
	nh1VZK2ecaSoZC6IPXunNlI32T8aigc2dsnIarw8Di9H0yo7fnMmB9Rsajmyo4q0
	tqcj0D9YFoKWeST+WuQmoMH1hMX4CiXgoMYhc44lH6b/d1Mdezdch+syerBkawqv
	T7qTxviKtV05nA4tcnifT60KiJ5CN+HA8wVtcDQpFH7JrUBzUrzGLM91hUbeG5Cp
	bQfOWbJJUihkGOucTR9JzSq8dB+PeX5+8x0tMfisRXgsOB/qVeey1KgQQ489T3BB
	Sk04g==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 42x1jk8c3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 03:45:30 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 15 Nov 2024 03:45:29 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 15 Nov 2024 03:45:29 -0800
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 35F843F7048;
	Fri, 15 Nov 2024 03:45:26 -0800 (PST)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <parav@nvidia.com>,
        <sburla@marvell.com>, <ndabilpuram@marvell.com>, <jerinj@marvell.com>,
        <anoobj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC 1/4] virtio-crypto: Add IPsec service operation and Capabilities
Date: Fri, 15 Nov 2024 17:15:20 +0530
Message-ID: <20241115114523.1787840-2-schalla@marvell.com>
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
X-Proofpoint-GUID: Ep4p1yf_8TEorstFfftmMG5vXXqSFIib
X-Proofpoint-ORIG-GUID: Ep4p1yf_8TEorstFfftmMG5vXXqSFIib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

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
 device-types/crypto/description.tex | 164 +++++++++++++++++++++++++++-
 1 file changed, 159 insertions(+), 5 deletions(-)

diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
index 5705e26..ce4b1fb 100644
--- a/device-types/crypto/description.tex
+++ b/device-types/crypto/description.tex
@@ -2,11 +2,11 @@ \section{Crypto Device}\label{sec:Device Types / Crypto Device}
 
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
 
@@ -72,6 +72,8 @@ \subsection{Supported crypto services}\label{sec:Device Types / Crypto Device /
 #define VIRTIO_CRYPTO_SERVICE_AEAD   3
 /* AKCIPHER (Asymmetric Key Cipher) service */
 #define VIRTIO_CRYPTO_SERVICE_AKCIPHER 4
+/* IPSEC service */
+#define VIRTIO_CRYPTO_SERVICE_IPSEC  5
 \end{lstlisting}
 
 The above constants designate bits used to indicate the which of crypto services are
@@ -318,6 +320,20 @@ \subsection{Device Initialization}\label{sec:Device Types / Crypto Device / Devi
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
@@ -1872,3 +1888,141 @@ \subsubsection{AKCIPHER Service Operation}\label{sec:Device Types / Crypto Devic
 \item VIRTIO_CRYPTO_ERR if any failure not mentioned above occurs.
 \end{itemize*}
 \end{itemize*}
+
+\subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device / Device Operation / IPSEC Service Operation}
+
+A crypto device can support the programming of IPsec Security Associations(SAs).
+In addition to standard crypto processing, the IPsec protocol processing is
+also offloaded to the Crypto Device as lookaside operation.
+
+IPsec Inbound processing: The device will perform decryption, authentication,
+integrity checking and remove additional headers, including tunnel headers if
+in tunnel mode, as well as the ESP/AH header from the packet. The resulting
+packet contains only the plain data.
+
+IPsec Outbound processing: The device will perform encryption, attach ICV,
+update/add IP headers, add ESP/AH headers/trailers.
+
+A crypto device can support number of IPsec SAs, allowing it to manage multiple secure
+connections simultaneously.
+
+The device and the driver indicates IPsec SA resource limits using the capability
+VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP specifying the limits on the number of IPsec outbound and
+inbound SA resource objects.
+The capability VIRTIO_CRYPTO_IPSEC_SA_CAP specifies which IPsec protocol capabilities
+the device supports. The driver indicates the IPsec parameters(Crypto algorithm,
+IPsec mode, anti-replay window size, etc.) it is using by setting the IPsec SA capability,
+prior to adding any resource objects.
+
+The driver controls the IPsec SA resource objects using administration commands described in
+\ref{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}.
+
+\paragraph{Device and driver capabilities}
+\label{par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities}
+
+\subparagraph{VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP}
+\label{par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-RESOURCE-CAP}
+
+The capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP indicates the IPsec SA resource limits.
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
+The capability VIRTIO_CRYPTO_IPSEC_SA_CAP lists the supported IPsec modes along with
+the supported cryptographic, authentication algorithms and anti-replay window size for
+each IPsec mode.
+\field{cap_specific_data} is in the format \field{struct virtio_crypto_ipsec_sa_cap_data}.
+
+\begin{lstlisting}[label={lst:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / virtio-crypto-ipsec-mode-cap}]
+struct virtio_crypto_ipsec_mode_cap {
+        le32 replay_win_sz_max;
+        le32 options;
+        le64 cipher_algo;
+        le64 hmac_algo;
+        le32 aead_algo;
+        le32 max_cipher_key_len;
+        le32 max_auth_key_len;
+        u8 mode;
+        u8 padding[3];
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
+\field{replay_win_sz_max} specifies the maximum anti-replay window size the device supports.
+
+\field{options} represents the IPsec protocol options the device supports, as defined in table
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
+\begin{table}[H]
+\caption{IPsec Options}
+\label{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Options}
+\begin{tabularx}{\textwidth}{ |l|X|X| }
+\hline
+Type & Name & Description \\
+\hline \hline
+0x0 & - & Reserved \\
+\hline
+0x1 & VIRTIO_CRYPTO_IPSEC_ESN & Specifies whether extended sequence number is supported \\
+\hline
+0x2 & VIRTIO_CRYPTO_IPSEC_UDP_ENCAP & Specifies whether udp encapsulation is supported \\
+\hline
+0x3 & VIRTIO_CRYPTO_IPSEC_COPY_DSCP & Specifies whether copy dscp is supported \\
+\hline
+0x4 & VIRTIO_CRYPTO_IPSEC_DEC_TTL & Specifies whether decrementing the time to live is supported \\
+\hline
+\end{tabularx}
+\end{table}
+
-- 
2.25.1

