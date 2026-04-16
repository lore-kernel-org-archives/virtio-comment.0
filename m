Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBCB311C1B
	for <virtio-comment@lists.linux.dev>; Thu, 16 Apr 2026 16:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776358386; cv=none; b=N3EG2YMB7MCfKfc7B0vS/6uvBHlSylkO11nnqXo8qxUjxarxFLnU3lh/OX6KUVWZiO6OZgR71fe0JbwuXMn3kkw9G0eGWz2GertvnuKHbcvX/IROJMmArsaJpDdhGTXITk9l0exm0l3CuvtpfxrjyGljYuuGGTRDIE9YyNQY/MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776358386; c=relaxed/simple;
	bh=OYt/Ogtf/Fd0g/+wR9ROGP2vOAnCIglgBXFitxNt8hk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OIfovnKggxt+tWoLP+ePRtq3LjCkOPZmkgUyu8xhIksEEgPRDK397EamS7u+Qs4jaT5IKg82Mkzq42mDeci+X2C2vCsyPYJvoDhCcspBsdefj2QKwIxyHyz/xRKtBHEsJGsYvt5znryhI7fRILUHCA6ouPdWPPW2cVRaHY7p8Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jmTN3tbB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yf3ZthSM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jmTN3tbB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yf3ZthSM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GFlWX94125508
	for <virtio-comment@lists.linux.dev>; Thu, 16 Apr 2026 16:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OTGgX+/6j3q
	ASkhbqWWRjs0E15ohaAvmJgtC+GT6Q6U=; b=jmTN3tbB3iqlkeBESSetAfmG7Bm
	2O+qCmFYWfP4JJvRzAnCcuF9W2gGb2kcFGO6jWAbGqOEA4FqGACMdrZdrbgZOsbc
	9XyF/QIAdnfb2Z47rUh4rF0BesizJCf0t9VowI4uxeqdkAMlm6VHQlgYEJETwlMB
	JqtgErX1DtqWGcfoRg6ahz7ZYcOz03S+pHPtmI/T5bjiCeVuPuvKWh8C5fM8HYKJ
	6lZpmnoSkhJWHCicYMqQtHnLy2ul+LwRjSRaUPV2A+XRzzBDJwTzQC2cGzd0sk57
	IQXXYAYb8UDdsx8fpMxEFmhWIc2AFLCKDQZKNPeDD0gtJdgbDTjO5zZLRmg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvrf9nx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Thu, 16 Apr 2026 16:53:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e2eeebd33so13486371cf.2
        for <virtio-comment@lists.linux.dev>; Thu, 16 Apr 2026 09:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776358383; x=1776963183; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTGgX+/6j3qASkhbqWWRjs0E15ohaAvmJgtC+GT6Q6U=;
        b=Yf3ZthSMy29fkrMYf3CucShc1aSaxPQ9et1y0V2hO3mYZBnz9Vxie1ZaWdBB7SbRsa
         CJomaui/5L2ApSQXyc13cGY8rxWo6eIBUsPM8c0xpHgUdu+lARHFP5clo4CcX81OnTYN
         G2fjk1aQ0Bu1E2+haWQ02CYvW0e/t636LOK+UgbHZa4yVKffNLWtummkp/x3iRuiqhWk
         0kUF5m48LHL73VO8jF1OY2v/mPsC6qqVLbTpBbK72qmTri+QP6zB3auZN8wyo/aUNtaj
         Uiv1dmofZ7g/vCuMhn9PzFNIOP/k50YlE2xzMSblN9pQ3NbKVxiTfOVVj3dEdk4mNITL
         In5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776358383; x=1776963183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OTGgX+/6j3qASkhbqWWRjs0E15ohaAvmJgtC+GT6Q6U=;
        b=UsbThd4r7eDMs3xm+CJaqSD4HwLCTjA5XVNyRTCwyHub8Yxf5DQ+h4U2L/qqFPZxIq
         +SGxjK6CA/XIEyMgI4fG5QfugoahpnJeMcSidHgdPDeiM7wFK4410HRG2VOxOhi6SaCW
         t/CAdTmdNG7xB2Mc1MdZAMVCt7kgAT+5aNkIn4sVypmQ6FiB+aAoza/yWUAJ7f7lRBUc
         R9TKO++MoIJt0lVlM29bcC/xvuZuX3/rb6bjBI56q4OP4RhsinMKx0+SUzrBzG1kouCM
         EysCs9ONAdK+kMkrWoiqJ8D4vpzEM+aQt1e12ICFNZn8fww456IWo+VkQwKMoRL73lDS
         2Y+g==
X-Gm-Message-State: AOJu0Yx0DXQFLKjL9mbtSYzroXIPdx9pSoxr4vCuU+JdBlEVnzkLK1tm
	I3g6Sq31vPpXWDWQMkPJITrtzI20bEiOEKTlT5ttmF9Zp5wzhVHDTFnBG8rZoUWn61H/t1zXMPd
	G2RdJlK9+h1vVLxjfAffhiC/oniZLg0CJDc7oe5MrjRdwtw+h8DeIWxHljGJAKpVOqb12sqltcI
	fntBBV
X-Gm-Gg: AeBDiesN7nvFsAA68ntCHe1P4RDNgaSkYvIQwxYSVbELO/hUoYZ2W3naWyO0HsEf4N6
	ViruWVoOqxkjcichV1eBvuGu+9GTumrZ+whFakZYB1Zqp6l5yTCpH9bnR1r/Y4y9dc6BoIH7YKx
	ENfF52W0F30ggZ4oxjQ+6jbac79bJItxZySHWhu9gXFbamYuw+ONmY5e8+e4HvDIkUVdXU87WHW
	LQJb2r/se21rIfoqlyIqLY7GkNerha/1QnthJQB8XdsvpUmAhiJfpjxle0jQ8/RDmWiJYvcxJLu
	pQpQ40qRoXQLajt++VD/mPS5WY5ccYClh1ZqRYM60A2taVEGSCzqPSMyaKy/P1bBf4SFvxR5pfn
	TyWDF5g7uNgOVLxW0QBu6UNmGmvLlLywvIOONOK94YGXT5S0J+CZD
X-Received: by 2002:a05:622a:598a:b0:50b:506d:736b with SMTP id d75a77b69052e-50dd5c12825mr383174631cf.47.1776358383042;
        Thu, 16 Apr 2026 09:53:03 -0700 (PDT)
X-Received: by 2002:a05:622a:598a:b0:50b:506d:736b with SMTP id d75a77b69052e-50dd5c12825mr383174111cf.47.1776358382483;
        Thu, 16 Apr 2026 09:53:02 -0700 (PDT)
Received: from QCOM-LDTZRie9bq.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1780b9c2dsm185639966b.59.2026.04.16.09.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 09:53:01 -0700 (PDT)
From: Peter Hilber <peter.hilber@oss.qualcomm.com>
To: virtio-comment@lists.linux.dev
Cc: "Trilok Soni" <trilok.soni@oss.qualcomm.com>,
        "Matias Ezequiel Vara Larsen" <mvaralar@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Peter Hilber <peter.hilber@oss.qualcomm.com>
Subject: [PATCH v2 1/1] transport-mmio: Add v3, which polls for reset completion
Date: Thu, 16 Apr 2026 18:52:56 +0200
Message-ID: <20260416165256.4351-2-peter.hilber@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416165256.4351-1-peter.hilber@oss.qualcomm.com>
References: <20260416165256.4351-1-peter.hilber@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IwhkDigao6sol8T5xJcp5DTN_XMYHBs_
X-Proofpoint-ORIG-GUID: IwhkDigao6sol8T5xJcp5DTN_XMYHBs_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDE2MCBTYWx0ZWRfX8Z3oyfyAoaAF
 vJPs5qEyfWmQOuqeZZS+BeFVvw7h1KBb4hx4XPO5TegW8teUN+BJMFQVPUdsaLpP3SA2Koj18QG
 qduJujl1FcrPOtXpOVCnTX5/g9ZC2wsvOzsuNupUW9lsC3rElH1+4t+WqVudbJ0/aKGCAK7WSae
 M/sacjrGMubftWqgdCfKrk5vFvkZVE6Qr2zOApVAfKgSyROMQ4zABJaryfceikuvLWYiTiBsnM3
 wiKlO3nLBpp0xf+2q2M+2imvrN451Tjf5GIZlxMBp+Lz9RIx9+vb+TItesWAlLUK+1A1iVL/ieY
 4xqsbW+4Lc0br0u2pAmvPca+QqZ7feCg53Dd563AEXldMJCZKqJlRu3Rs8vCiJ6LrKiNZx8ftsm
 9ZEfPEt3v5+vEbUh4atfIF4bL+OQc3sZBh7qF88gUK2k7WkpQG9/7h1vKQXX0zMH3q6DyjoLSke
 TccUVuVJj6Qh3GjBIXA==
X-Authority-Analysis: v=2.4 cv=YtE/gYYX c=1 sm=1 tr=0 ts=69e113ef cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=XtCE9F2bTraIh14jv_oA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160160

Let devices using the MMIO transport avoid stalling the driver (virtual)
CPU during device reset, which requires introducing a new MMIO transport
version.

Unlike the PCI transport, the MMIO transport does not require the driver
to poll for reset completion. This requires a device using the MMIO
transport to complete reset during the write of zero to the Status
register. Device reset may take more than 100 ms if it involves
terminating ongoing device activity which accesses driver memory. When
the (virtual) CPU writing zero to the Status register needs to be
stalled during this, this may violate real-time requirements (including
those for hypervisor trap-and-emulate).

Address this by introducing a new MMIO transport version, v3, where the
driver must poll for reset completion, and, hence, the device reset does
not have to complete during the write to the Status register. Add a
requirement that resetting a device which already has Status zero is
synchronous to avoid ambiguity when such a reset would finish.

For clarity, also add some related requirements for v2. These
requirements are implied by the rest of the specification and therefore
do not alter the v2 semantics.

With MMIO transport v3, reset essentially works as with the PCI
transport, and the change is therefore not expected to cause problems.

Existing devices with MMIO transport v2 are not required to implement
v3, which will not work with current drivers. Only devices which require
asynchronous reset need to report MMIO transport v3, and therefore
require an updated driver.

Drivers have to support the MMIO transport versions of the used devices.
Portable MMIO transport drivers should therefore support both v2 and v3,
which is simple.

Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>
---

Notes:
    v2:
    
    - Add summary of MMIO v3 to Version register description (Matias)
    
    - Align requirements on Status register transition to zero with transport-
      independent requirements (Matias)
    
    - Change requirements relating to reset when status is already zero
      (Matias)
    
    - In the commit message, document when v3 devices may be incompatible with
      v2 drivers (as per reply to Michael)
    
    - Improve wording; refer to "zero" rather than "0"

 transport-mmio.tex | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/transport-mmio.tex b/transport-mmio.tex
index 94a93a1..cddbcc9 100644
--- a/transport-mmio.tex
+++ b/transport-mmio.tex
@@ -64,7 +64,8 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
   }
   \hline
   \mmioreg{Version}{Device version number}{0x004}{R}{%
-    0x2.
+    0x2 or 0x3. With version 0x3, the driver waits until it reads zero from the
+    \field{Status} register before considering a reset complete.
     \begin{note}
       Legacy devices (see \ref{sec:Virtio Transport Options / Virtio Over MMIO / Legacy interface}~\nameref{sec:Virtio Transport Options / Virtio Over MMIO / Legacy interface}) used 0x1.
     \end{note}
@@ -185,6 +186,11 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
     Writing non-zero values to this register sets the status flags,
     indicating the driver progress. Writing zero (0x0) to this
     register triggers a device reset.
+
+    Starting with \field{Version} 0x3, the device reset need not
+    complete before the write returns, and the driver waits until it
+    reads back zero before considering a reset complete.
+
     See also p. \ref{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Device Initialization}~\nameref{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Device Initialization}.
   }
   \hline
@@ -262,13 +268,31 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
 
 The device MUST return 0x74726976 in \field{MagicValue}.
 
-The device MUST return value 0x2 in \field{Version}.
+The device MUST return value 0x2 or 0x3 in \field{Version}.
 
 The device MUST present each event by setting the corresponding bit in \field{InterruptStatus} from the
 moment it takes place, until the driver acknowledges the interrupt
 by writing a corresponding bit mask to the \field{InterruptACK} register.  Bits which
 do not represent events which took place MUST be zero.
 
+The device MUST reset when zero is written to \field{Status}.
+
+The device MUST present zero in \field{Status} once it has finished the reset.
+
+For \field{Version} 0x2, the device MUST finish a reset before the driver's
+write of zero to \field{Status} has completed.
+
+For \field{Version} 0x3, if \field{Status} is non-zero before a reset, the
+device MAY continue with the reset after the driver's write of zero to
+\field{Status} has completed.
+
+For \field{Version} 0x3, if \field{Status} is zero before a reset, the device
+MUST finish the reset before the driver's write of zero to \field{Status} has
+completed.
+
+For \field{Version} 0x3, the device MUST change \field{Status} to zero as the
+last step of the reset.
+
 Upon reset, the device MUST clear all bits in \field{InterruptStatus} and ready bits in the
 \field{QueueReady} register for all queues in the device.
 
@@ -305,7 +329,7 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
 The driver MUST ignore a device with \field{MagicValue} which is not 0x74726976,
 although it MAY report an error.
 
-The driver MUST ignore a device with \field{Version} which is not 0x2,
+The driver MUST ignore a device whose \field{Version} is neither 0x2 nor 0x3,
 although it MAY report an error.
 
 The driver MUST ignore a device with \field{DeviceID} 0x0,
@@ -331,6 +355,9 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
 The driver MUST write a value with a bit mask describing events it handled into \field{InterruptACK} when
 it finishes handling an interrupt and MUST NOT set any of the undefined bits in the value.
 
+For \field{Version} 0x3, the driver MUST NOT consider a reset complete before
+reading back zero in \field{Status}.
+
 If VIRTIO_F_RING_RESET has been negotiated, after the driver writes 1 to
 \field{QueueReset} to reset the queue, the driver MUST NOT consider queue
 reset to be complete until it reads back 0 in \field{QueueReset}. The driver
-- 
2.43.0

