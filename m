Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFBA2BD5A7
	for <virtio-comment@lists.linux.dev>; Wed,  4 Feb 2026 11:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770205865; cv=none; b=UbyzIXlutJbvbC164vHTsilTP9qdv4Qgnwzr+lwpOC0H+vPp4uml9zcZ1XyV+mlRuh7t/8Ntx0QHfRmvNtWm7f56lYPhOp2qTRE1GwuyeTnJILa+FPtvbAAShG9JDEccfMIlrO0ARXSB4WxQnlIBWdCuAcSfMb416fU7I18JDb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770205865; c=relaxed/simple;
	bh=9hlYi8NpIFVjGeAlf6j3e0kXs6wzOTSK0H87ph+A200=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bjIkZlk/COPGEDVlY1Mr10v+AqMkYPmLIorJV/XyZNTJrCPmPRDhiRn1FG6/8HGzghTvO7QOCr0oeVyRn6wSPe3DXH2hYNl5UNLoCAvXjMMSml6cMBVMtoB3iWtBOaP3geNBx1tgbA7VD+QypdRWMhzqfcM/Gujc76SA+hrk3OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+4hLcgn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hsaKwWMp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+4hLcgn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hsaKwWMp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614BBZux1250166
	for <virtio-comment@lists.linux.dev>; Wed, 4 Feb 2026 11:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HistTeGr9Rt
	FLTzo5EixbhE76+klGVvEQzjtTLBFIzw=; b=U+4hLcgnMd/2oWpxCJB0TY/fqSz
	p/uuctDy2/B4Xvw+pjiGWpXellT0F3S76/bLp/wiTik3p5YCO2qejmMzLMzX1e1z
	HvT3cB8u/pqwQICoHUWJ3r1mUZI4BRnwntB9k3fDEOdORwC1ieHTuvj3RM8KCFTy
	Vk0plzlcsfZujg7w8OKjWYI7i3tE+19KqCvPPP4aVKVDTge8/KWe+janKSqrQYAc
	KybXo7ZTzQvaowfelwNDkyQ6nhmhOMDVB7coiATmh2nYrw84fzzgneZZWX6QOH0S
	kv0XvKj0G7aSIOK1lvrZQ9jzKRN+LN1+L0LIvahNmr7svJsfH+7oCHMgXxg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43dh0drj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Wed, 04 Feb 2026 11:51:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6cfd52556so263744385a.0
        for <virtio-comment@lists.linux.dev>; Wed, 04 Feb 2026 03:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770205864; x=1770810664; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HistTeGr9RtFLTzo5EixbhE76+klGVvEQzjtTLBFIzw=;
        b=hsaKwWMpLrDsYOLwOVXr3Imud+GzQqyGrgn+XZ6HPM/GJ0SCCmVf6MF+4qJzXK7iWd
         CVZI14QbnsCboqUXhciA0UjWW/4XrNpvViWyljYofiGb0wgYX5WgwB4/3OXrhReOjckG
         2kjYGdWfDrv2etITjPddEarA55T4LTM8E4yWkOoYSPQKfpilXXgn2bkfdc74l0fA5RYj
         ziyd2TxN2yES/NsukhzCukDNnEkcHBs9Dfqa5XOWUFicmdot748ySMbherawBI4ZuRcw
         rWPeUedr5VnVVLEn4gJspHpkYTh81sB9Hsshr2NHVFMkRRPupIzIO7jw8xobjLRBqZqJ
         LiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770205864; x=1770810664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HistTeGr9RtFLTzo5EixbhE76+klGVvEQzjtTLBFIzw=;
        b=fCQzaYLyLh64FL06vdz3hVk0OM94kYs3NCKj2Ikbl03IPzT4ECNElbK6T/98kSikAr
         SnufMhxoeVmPYtwhfX1wiQN4RKmMrG2veoOUP9pGnzUegqotw9eB/TQj8rwGjYUC+R3F
         73Zf6lMSncJ3U6utfAEWL0RVIi/9XYBRukp152bX+VrjnsrVTo3ZNjjzA13va9CO8iFE
         9uh48ZPNDEQSOS5zLjavmHvhkwlL8y6lIrMFIjG6/4yoeJ7cxZKEAZzGF4qO5vBC0RBS
         eYfvRnxZwunUpg7sjTXv7L1S+RhRlh6ld8m5xl/D16du1Fq2Sn6qNlFw2xfX1oU5GWvV
         sbTg==
X-Gm-Message-State: AOJu0YxrPC9XEtYUdJxVU7v8H7eJg/F2K+quauNS5rNa+imJhLOi/X/a
	l5bdrqW2A1+9ZkTVzkM+qD+jLjFwtLsHB+ZIQSj3KSZ5qwbwtlSfEg/Y/ILOV098vVKwmkVtxp/
	P1xlVxIcMa5lfblPngbQLNSjw+L2asyGnKaYtduPYavaOLsTsN4CrXTEYP4hlCG05u8s1Aaf5tL
	CPvA==
X-Gm-Gg: AZuq6aKFEYSDCWjzwCfvfXQuYaiuD9w01M5k6BcAvpuchB6tPlNO4bTlmD5A2AvTIRm
	BgXQ+kBetQi42cWIqxScN5BAs5Dmz58aS/FTa11qP8cmVa+9Pj1tkh3mIYrrkP+Dz0xY39nCZZR
	y2AxOG7y2uCqCw7PzI9iT6ahhTFFYl80xBMeMVUNjBVZg9JIJUqvCnD+QCLmyfHT6wXrB6HiAqa
	MLglGfr503Y4vLrNgp4hMv0u79d327+mIBh/Am01Xi+wvS5YY1HQxRhUZ78zq9eBnnba0kNUJrs
	BI+LHf6qAtO0YFcv6p2MpfPeDJBmanUpaliuF5a8NO54syfeqmDOvgRnrhOmJiCvvDf8hBEFcP5
	HboMbkEsX9I+9jGv59dWgFFIQGq/c1h2ymLGgqiAt
X-Received: by 2002:a05:620a:f06:b0:8c9:eee0:dbb7 with SMTP id af79cd13be357-8ca20483df6mr788316585a.23.1770205863859;
        Wed, 04 Feb 2026 03:51:03 -0800 (PST)
X-Received: by 2002:a05:620a:f06:b0:8c9:eee0:dbb7 with SMTP id af79cd13be357-8ca20483df6mr788313685a.23.1770205863444;
        Wed, 04 Feb 2026 03:51:03 -0800 (PST)
Received: from QCOM-LDTZRie9bq.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4831089d547sm53275275e9.14.2026.02.04.03.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 03:51:03 -0800 (PST)
From: Peter Hilber <peter.hilber@oss.qualcomm.com>
To: virtio-comment@lists.linux.dev
Cc: Trilok Soni <trilok.soni@oss.qualcomm.com>,
        Peter Hilber <peter.hilber@oss.qualcomm.com>
Subject: [PATCH 1/1] transport-mmio: Add v3, which polls for reset completion
Date: Wed,  4 Feb 2026 12:50:22 +0100
Message-ID: <20260204115022.1930-2-peter.hilber@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204115022.1930-1-peter.hilber@oss.qualcomm.com>
References: <20260204115022.1930-1-peter.hilber@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bMgb4f+Z c=1 sm=1 tr=0 ts=698332a8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qvqynU1OpCyfVFq6l24A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: aTNnmrDtQ_LzixKwNWHOOLxqe9ZDFbJF
X-Proofpoint-GUID: aTNnmrDtQ_LzixKwNWHOOLxqe9ZDFbJF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA5MCBTYWx0ZWRfX7CplPvUpTE53
 /cKAX5sMuepzOwTzWIEwqu1mdY/fOY+98BGhPqeFrH4EgUJEmdqV58/a8euIN7qiaapYBTBMdFs
 fS60x4DduOm5ox8DBCbc6Mf4qEw2V4IxhJUvNw9uaMDz61C1KvxIdjfrnuK2dZ3tfu1k2FV9Au5
 n2a8PW5goSPG+EWtLP7aUezOxZNKDawYz+JQAi6fEzEgIU+xWJ0Uzi76ep+WLQk3f50mhYjKR7T
 LvcZpr6PKmCZhWCCy7gP1DJcPWb56EagKCLDk7vNDbfAwTv9aCZ3gbBnWmNd9h6aHRY4+zCX39/
 s17yYWXfEHziI35ptQprd72nfFBKwOXmXWWy+aPvTsDDWaRJjtmgf6QgkiIwA562GYUOL0YgVbg
 itQYvTG6sYuc5jEUJszmpsPYXUNFn5LxTpWn9+sFcYmnSZJixc7YOnQtbgLwZV0AaDBYaO2h7te
 lC2evpC77V6zQKwIihQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_02,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040090

Let devices using the MMIO transport avoid stalling the driver (virtual)
CPU during device reset, which requires introducing a new MMIO transport
version.

Unlike the PCI transport, the MMIO transport does not require the driver
to poll for reset completion. This requires a device using the MMIO
transport to complete reset during the write of 0 to the Status
register. Device reset may take more than 100 ms if it involves
terminating ongoing device activity which accesses driver memory. When
the (virtual) CPU writing 0 to the Status register needs to be stalled
during this, this may violate real-time requirements (including those
for hypervisor trap-and-emulate).

Address this by introducing a new MMIO transport version, v3, where the
driver must poll for reset completion, and, hence, the device reset does
not have to complete during the write to the Status register.

For clarity, also add some related requirements for v2. These
requirements are implied by the rest of the specification and therefore
do not alter the v2 semantics.

With MMIO transport v3, reset essentially works as with the PCI
transport, and the change is therefore not expected to cause problems.

Existing devices with MMIO transport v2 are not required to implement
v3, which will not work with current drivers. Drivers have to support
the MMIO transport versions of the used devices. Portable MMIO transport
drivers should therefore support both v2 and v3, which is simple.

Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>
---
 transport-mmio.tex | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/transport-mmio.tex b/transport-mmio.tex
index 94a93a1..6504a6b 100644
--- a/transport-mmio.tex
+++ b/transport-mmio.tex
@@ -64,7 +64,8 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
   }
   \hline
   \mmioreg{Version}{Device version number}{0x004}{R}{%
-    0x2.
+    0x2 or 0x3. With version 0x3, the driver waits until it reads 0 from the
+    \field{Status} register before considering a reset complete.
     \begin{note}
       Legacy devices (see \ref{sec:Virtio Transport Options / Virtio Over MMIO / Legacy interface}~\nameref{sec:Virtio Transport Options / Virtio Over MMIO / Legacy interface}) used 0x1.
     \end{note}
@@ -262,13 +263,29 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
 
 The device MUST return 0x74726976 in \field{MagicValue}.
 
-The device MUST return value 0x2 in \field{Version}.
+The device MUST return value 0x2 or 0x3 in \field{Version}.
 
 The device MUST present each event by setting the corresponding bit in \field{InterruptStatus} from the
 moment it takes place, until the driver acknowledges the interrupt
 by writing a corresponding bit mask to the \field{InterruptACK} register.  Bits which
 do not represent events which took place MUST be zero.
 
+The device MUST reset when 0 is written to \field{Status}.
+
+While a reset is in progress, the device MUST retain the previous value of
+\field{Status}.
+
+For \field{Version} 0x2, the device MUST finish a reset before the driver's
+write of 0 to \field{Status} has completed.
+
+For \field{Version} 0x3, the device MAY continue with a reset after the driver's
+write of 0 to \field{Status} has completed.
+
+For \field{Version} 0x3, when \field{Status} is 0, the device MUST ignore
+further writes of 0 to \field{Status}.
+
+The device MUST present 0 in \field{Status} once it has finished the reset.
+
 Upon reset, the device MUST clear all bits in \field{InterruptStatus} and ready bits in the
 \field{QueueReady} register for all queues in the device.
 
@@ -305,7 +322,7 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
 The driver MUST ignore a device with \field{MagicValue} which is not 0x74726976,
 although it MAY report an error.
 
-The driver MUST ignore a device with \field{Version} which is not 0x2,
+The driver MUST ignore a device whose \field{Version} is neither 0x2 nor 0x3,
 although it MAY report an error.
 
 The driver MUST ignore a device with \field{DeviceID} 0x0,
@@ -331,6 +348,9 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
 The driver MUST write a value with a bit mask describing events it handled into \field{InterruptACK} when
 it finishes handling an interrupt and MUST NOT set any of the undefined bits in the value.
 
+For \field{Version} 0x3, the driver MUST NOT consider a reset complete before
+reading back 0 in \field{Status}.
+
 If VIRTIO_F_RING_RESET has been negotiated, after the driver writes 1 to
 \field{QueueReset} to reset the queue, the driver MUST NOT consider queue
 reset to be complete until it reads back 0 in \field{QueueReset}. The driver
-- 
2.43.0

