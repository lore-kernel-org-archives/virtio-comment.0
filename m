Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5A12036E4
	for <virtio-comment@lists.linux.dev>; Mon, 16 Dec 2024 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734344475; cv=none; b=IqnpINplj5WzgFqnFo76p6Hx9g4rvjE06N3DWIHnECBbth56Ff2ZJaZGKh2Qm6PwJMW7l28L81Bc9Gw7IdsvN46QT/X/i/VJyPmQJvP1WmC1P1U/gEFI70fX2NfFvT1dae8HQnv3y1wHlXX+gcxQ3mG68+nEbKDvNQH9WKlLpkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734344475; c=relaxed/simple;
	bh=AXqmspPzWh9yB6WDGJwl3Smkc+yGoMAawuHitHuCzHA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eknrlwW9Y839f07oESKM4dhHeIP5MIqHH1g/G1+qWkUQ3bZQ+eelkwnPzGaALHXSgm3gqFVLIkKInd6rGsFXIFUXX1PRVjyeLQDLm6yGu7QrshImkPVeTTMkkKbrE8r+TOlCWRRjrn3ZSSu/B517jGr19jtBj/S63/CZe2VJRXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=Zr6iioI7; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="Zr6iioI7"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG9ZtQN019886;
	Mon, 16 Dec 2024 02:21:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=0
	zJOSLFh6CjDoQyPW/ALT3GMj+4PaO2qHJl2nXa95+g=; b=Zr6iioI754mJxsYDn
	JGx8IuwAXfRG9GR3QO5OnHeXEmxT0mXUujYwb00CNutGLfWFBkTPLl9pdyyCJJKB
	Ly2QIzrHrtqaim9yCRl/51osY54Ru0MOgA06UubESiujNj2nOStZ7LnUX3Y695t+
	Qrb5o3oiUrlYupuAvoanJfoc/aHHSaKtrelNCSfNazuh0yVKJstGyjESwD9JxeBO
	w7LEbfl0JS4CDZJxDMG+npa0k+UDRGlo+pwtTQzHrSCntOIymkq2xdX7qXf8SpCP
	mo88TqkaFEouJ7wB4/Vp+N/ZKKe3BFCMBfEfNuYLl+Mc9v29gpceIY9m5hY7zepO
	NY8xg==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 43jhq702pv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 02:21:11 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 16 Dec 2024 02:21:10 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 16 Dec 2024 02:21:10 -0800
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id E1D713F7093;
	Mon, 16 Dec 2024 02:21:06 -0800 (PST)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <mvaralar@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <anoobj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v2 1/4] virtio-crypto: Add IPsec service operation and Capabilities
Date: Mon, 16 Dec 2024 15:50:59 +0530
Message-ID: <20241216102102.2720453-2-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241216102102.2720453-1-schalla@marvell.com>
References: <20241216102102.2720453-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: UhB93z3frQSyUtOuNz-ZveWR7ELdqGBJ
X-Proofpoint-GUID: UhB93z3frQSyUtOuNz-ZveWR7ELdqGBJ
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
 device-types/crypto/description.tex | 160 +++++++++++++++++++++++++++-
 1 file changed, 155 insertions(+), 5 deletions(-)

diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
index 5705e26..df863da 100644
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
@@ -1872,3 +1888,137 @@ \subsubsection{AKCIPHER Service Operation}\label{sec:Device Types / Crypto Devic
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
+The device and the driver indicate IPsec SA resource limits using the
+VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP capability specifying the limits on the number of
+IPsec outbound and inbound SA resource objects.
+The VIRTIO_CRYPTO_IPSEC_SA_CAP capability  specifies which IPsec protocol capabilities
+the device supports. The driver indicates the IPsec parameters by setting the IPsec
+SA capability prior to adding any resource objects.
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
+\begin{table}[H]
+\caption{IPsec Options}
+\label{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Options}
+\begin{tabularx}{\textwidth}{ |l|X|X| }
+\hline
+Bit Number & Name & Description \\
+\hline \hline
+0 & VIRTIO_CRYPTO_IPSEC_ESN & Specifies whether extended sequence number is supported \\
+\hline
+1 & VIRTIO_CRYPTO_IPSEC_UDP_ENCAP & Specifies whether udp encapsulation is supported \\
+\hline
+2 & VIRTIO_CRYPTO_IPSEC_COPY_DSCP & Specifies whether copy dscp is supported \\
+\hline
+3 & VIRTIO_CRYPTO_IPSEC_DEC_TTL & Specifies whether decrementing the time to live is supported \\
+\hline
+\end{tabularx}
+\end{table}
-- 
2.25.1

