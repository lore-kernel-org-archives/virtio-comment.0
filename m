Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EDE1BB6A5
	for <virtio-comment@lists.linux.dev>; Tue,  2 Jul 2024 15:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719933334; cv=none; b=qg2lgX0XX/Mia3HcTfl+tBuL5IF10Hl+NB2kLrd81AYg4IifRVRFFSZMFNclOwwxQkoAITF1rRAK7ArzLKlf/6a0L2z1bSzFdfS0MDNcCd7T4ZXMkTnvHY1ZqCVnnLEchNqe1h1uU+pd/njkD3676xg4vXprfS0n2Jb/7CTqW3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719933334; c=relaxed/simple;
	bh=H3XR2UphOI8pwZMVfj3w1+6eky8z/7wU7wVVfR+LflY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c16glrNDdxbThx+vx/yj/lVPWZYmVlL0vVemXFOSp8YhM67t625t4nP0ZvZ567q6/CX/RkTP0IFM8YXDA8GWfI1tS2SjbLMFhfiw5srXL0l5Y7QSoDgMpxqcNwwjbUYFV9iaRr4EDX3ZgWNQ/Cy9bG/w0dFfWYUHcTUSf0Xwhz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=EIS0FCLu; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="EIS0FCLu"
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462Bc84I000986;
	Tue, 2 Jul 2024 08:15:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=dC9hBl6/RlavAoWCa5pVFLV
	64xoD8RwhQSS9mzDVdpE=; b=EIS0FCLuK8LvCxMCkLnAhlExB0tRLMHEXuyZ7gr
	S7m6SaBgMK9vi5Jv4oTDB9I9JAXT5TXAV4mPSCMb2DhyKoinjbpqXDKRm5EC2M1V
	K2SW0ku0kzeejUKA30VVadCWnqrP+p4h/gV17vlA/WpVg/YBXXX4UlJEOGuxlEtn
	gunZrtgDFFvvx8/tBGZ0s1zuFnCKSVNuJsbeV2Swj5Kt/DkXmkMXfpUnlwzVsQbG
	Ssz6GyaiztXi3ESuWHiM+67cjH2swjMV9Cwi3qzmbZSxdwZpVXvF3hIM6vPigLfC
	OgkNIOz9bHWZ6eaI5oZ0XxF+aGH2iJWgC2o5rUcvpGPiYQQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4049mdtmf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 08:15:09 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 2 Jul 2024 08:15:08 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 2 Jul 2024 08:15:08 -0700
Received: from localhost.localdomain (unknown [10.28.34.38])
	by maili.marvell.com (Postfix) with ESMTP id 627803F7083;
	Tue,  2 Jul 2024 08:15:05 -0700 (PDT)
From: Gowrishankar Muthukrishnan <gmuthukrishn@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <anoobj@marvell.com>, <sburla@marvell.com>, <jerinj@marvell.com>,
        <mst@redhat.com>, <lhestz@163.com>, <pizhenwei@bytedance.com>,
        <helei.sig11@bytedance.com>,
        Gowrishankar Muthukrishnan
	<gmuthukrishn@marvell.com>
Subject: [PATCH v1] virtio-crypto: add ECDSA op parameters
Date: Tue, 2 Jul 2024 20:45:00 +0530
Message-ID: <20240702151500.2280738-1-gmuthukrishn@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5oYBSP0iNI8cr6PeVfjvlb5xXqdiMx6y
X-Proofpoint-ORIG-GUID: 5oYBSP0iNI8cr6PeVfjvlb5xXqdiMx6y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_10,2024-07-02_02,2024-05-17_01

In ECDSA SIGN operation, a random scalar 'k' is used to generate
one part of signature. As this value SHOULD be randomly secure,
the application might supply it through secure RNG rather than
relying on SIGN implementation.

Another parameter is prehash algorithm to hash source data before
SIGN operation on it.

Current data queue struct for AKCIPHER do not hold any option
to input algorithm specific parameter. Hence, in this patch
new fields are introduced in data queue struct for AKCIPHER to
support additional parameters.

Signed-off-by: Gowrishankar Muthukrishnan <gmuthukrishn@marvell.com>
---
 device-types/crypto/description.tex | 55 ++++++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 4 deletions(-)

diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
index 5705e26..6ad20b8 100644
--- a/device-types/crypto/description.tex
+++ b/device-types/crypto/description.tex
@@ -1742,11 +1742,36 @@ \subsubsection{AEAD Service Operation}\label{sec:Device Types / Crypto Device /
 \end{itemize*}
 
 \subsubsection{AKCIPHER Service Operation}\label{sec:Device Types / Crypto Device / Device Operation / AKCIPHER Service Operation}
+An input for AKCIPHER operation contains one or more parameters that \field{algo} (in virtio_crypto_op_header structure) may need along with source data.
+
+ECDSA algorithm accepts the following parameters:
+
+\begin{lstlisting}
+    struct virtio_crypto_ecdsa_param_flf {
+        /* Prehash algorithm */
+        le32 prehash_algo;
+
+        /* Length of secret scalar */
+        le32 secret_scalar_len;
+    };
+
+    struct virtio_crypto_ecdsa_param_vlf {
+        /* Secret scalar */
+        u8 secret_scalar[secret_scalar_len];
+    };
+\end{lstlisting}
+
+\field{prehash_algo} is the prehash algorithm used in the ECDSA SIGN and VERIFY operations. Refer VIRTIO_CRYPTO_AKCIPHER* for the supported algorithms.
+
+\field{secret_scalar} is the secret scalar used in the ECDSA SIGN operation. The length of the secret scalar is specified in \field{secret_scalar_len}.
 
 Session mode AKCIPHER requests are as follows:
 
 \begin{lstlisting}
 struct virtio_crypto_akcipher_data_flf {
+    /* Algorithm parameters in fixed length */
+    #define VIRTIO_CRYPTO_AKCIPHER_ALGO_PARAM_SIZE 8
+    u8 algo_param_flf[VIRTIO_CRYPTO_AKCIPHER_ALGO_PARAM_SIZE];
     /* length of source data */
     le32 src_data_len;
     /* length of dst data */
@@ -1755,6 +1780,9 @@ \subsubsection{AKCIPHER Service Operation}\label{sec:Device Types / Crypto Devic
 
 struct virtio_crypto_akcipher_data_vlf {
     /* Device read only portion */
+    /* Algorithm parameters in variable length */
+    u8 algo_param_vlf[algo_param_len];
+
     /* Source data */
     u8 src_data[src_data_len];
 
@@ -1764,15 +1792,29 @@ \subsubsection{AKCIPHER Service Operation}\label{sec:Device Types / Crypto Devic
 };
 \end{lstlisting}
 
-Each data request uses the virtio_crypto_akcipher_flf structure and the virtio_crypto_akcipher_data_vlf
+Each data request uses the virtio_crypto_akcipher_data_flf structure and the virtio_crypto_akcipher_data_vlf
 structure to store information used to run the AKCIPHER operations.
 
+\field{algo_param_flf} is the \field{algo} specific fixed parameters, it MUST be one of the following structures:
+\begin{itemize*}
+    \item struct virtio_crypto_ecdsa_param_flf
+\end{itemize*}
+
+The length of the \field{algo_param_flf} is fixed to 8 bytes, the data of unused part (if has) will be ignored.
+
+\field{algo_param_vlf} is the algorithm specific variable parameters, it MUST be one of the following structures:
+\begin{itemize*}
+    \item struct virtio_crypto_ecdsa_param_vlf
+\end{itemize*}
+
+\field{algo_param_len} is the size of the specific structure used in \field{algo_param_vlf}.
+
 For encryption, decryption, and signing:
 \field{src_data} is the source data that will be processed, note that for signing operations,
 src_data stores the data to be signed, which usually is the digest of some data rather than the
 data itself.
 \field{src_data_len} is the length of source data.
-\field{dst_result} is the result data and \field{dst_data_len} is the length of it. Note that the
+\field{dst_data} is the result data and \field{dst_data_len} is the length of it. Note that the
 length of the result is not always exactly equal to dst_data_len, the driver needs to check how
 many bytes the device has written and calculate the actual length of the result.
 
@@ -1802,7 +1844,7 @@ \subsubsection{AKCIPHER Service Operation}\label{sec:Device Types / Crypto Devic
 \begin{lstlisting}
 struct virtio_crypto_akcipher_data_flf_stateless {
     struct {
-        /* See VIRTIO_CYRPTO_AKCIPHER* above */
+        /* See VIRTIO_CRYPTO_AKCIPHER* above */
         le32 algo;
         /* See VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_* above */
         le32 key_type;
@@ -1816,6 +1858,8 @@ \subsubsection{AKCIPHER Service Operation}\label{sec:Device Types / Crypto Devic
         } u;
     } sess_para;
 
+    /* Algorithm parameters in fixed length */
+    u8 algo_param_flf[VIRTIO_CRYPTO_AKCIPHER_ALGO_PARAM_SIZE];
     /* length of source data */
     le32 src_data_len;
     /* length of destination data */
@@ -1826,6 +1870,9 @@ \subsubsection{AKCIPHER Service Operation}\label{sec:Device Types / Crypto Devic
     /* Device read only portion */
     u8 akcipher_key[key_len];
 
+    /* Algorithm parameters in variable length */
+    u8 algo_param_vlf[algo_param_len];
+
     /* Source data */
     u8 src_data[src_data_len];
 
@@ -1834,7 +1881,7 @@ \subsubsection{AKCIPHER Service Operation}\label{sec:Device Types / Crypto Devic
 };
 \end{lstlisting}
 
-In stateless mode, the format of key and signature, the meaning of src_data and dst_data, are all the same
+In stateless mode, the format of key and signature, the meaning of src_data and dst_data, algorithm specific additional parameters are all the same
 with session mode.
 
 \drivernormative{\paragraph}{AKCIPHER Service Operation}{Device Types / Crypto Device / Device Operation / AKCIPHER Service Operation}
-- 
2.25.1

