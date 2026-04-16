Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E0F2E06E4
	for <virtio-comment@lists.linux.dev>; Thu, 16 Apr 2026 16:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776358384; cv=none; b=iXO4aAEor/FPHz5cPUwy3OWQh2krUz82ozOMEaFnt3n1/7oMwY8iyDqEHR7BnPfP0H2yYZ51qpMWT0Bv6ZaxySnfGK1izIm2h/KjrUxJychxenUK1CKZnmg0bxSz458QYiKjwt6/MMRwKp+gx+gQ0wEyDNgN5XgdRD3q4b00gfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776358384; c=relaxed/simple;
	bh=KAUT8BjZ7oXrvp+YXVYTXy4LUaV79RI460I32V3HMog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QsjKl1D4/su2BGMSx9Gk9y8F1lBPyEoVoZTC2MnWUi/EQtu23eCoffkXMAqUNikt31BsaO2i4lMgbj54HlCbheyUETDJN3f1mA2gtR7JWTuqyEBXHafkO7mTIiZ9VASyjD+fHQLzNzq55J3PPNc87IiEF6/rOARi3VuFVX+SZnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=amj7ibvJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkXg5jhX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="amj7ibvJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hkXg5jhX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GFr0tg4124964
	for <virtio-comment@lists.linux.dev>; Thu, 16 Apr 2026 16:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yYIo6/Uj1vOXhibd+unAXf5a5QqNRT6zvhn
	bmBqW/7Q=; b=amj7ibvJcAwQNzVu52pQUJ6FoaFuDbQtsfdD7CiRIXOV2EPVwrl
	NhGl61LqHPovjxN3RVmlFEQIQg5kUkl2ru+CeMMPj76QGUWjrSKTf/gWaGWdtZnR
	8o7d495T9iFEJKAtOCfoO0+NYD6ZzZmy0GxipDJ7rLfWRahxxNVr1lE5SvtmvX95
	AMI+sgpJqEj4rkLO27V0dJfczDVjhAYXjA9VWw0gsXQ3L7EBgae+OEgML11N+/9x
	qRSIBrtkt/2y+ZVa2ZxyKdEbSb3dMfCVnAjeAHT/uju0dUJckxh1NndbAuXl90PB
	M8eJnlWTFebyxRYJS00/NngyOn9V2qqwp9w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvrf9nwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Thu, 16 Apr 2026 16:53:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50df4c130dbso22898131cf.1
        for <virtio-comment@lists.linux.dev>; Thu, 16 Apr 2026 09:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776358381; x=1776963181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yYIo6/Uj1vOXhibd+unAXf5a5QqNRT6zvhnbmBqW/7Q=;
        b=hkXg5jhX9YWOtfSwaajQLzMisK4dCyzU0NFp9aRx7VuaeU0kDjTLB23918NSAgvWx9
         73CVXTtMR1vLwvmuZBoNdai83f/4uZ1K06tQuwdkFz0muj4cEqmQmKC0MdsKJKpnrThq
         ATkLjqb4o1o2wJlOk52Q4avc5LsPAd8KEeWcYpKYMhX2eqzzaLXbqsDGecoMbz4gMuMs
         gsto+41BbQhh0VqG8v9BUzdaQ4G2g04Z/drW5KiWhXnRN+Vhkc4G5GwT01Zk/kXPmxeW
         DFDspV3kKfaBwktjB5UsPciY7UpR4tyzQVUt3v3r26jVsRAI3Mz6Pn7GV12KHFEAN4mg
         LKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776358381; x=1776963181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYIo6/Uj1vOXhibd+unAXf5a5QqNRT6zvhnbmBqW/7Q=;
        b=R5zhwV5JDRwysmAbW5gvf1Q8QWLoFSVFj+GG7wGoSmCcJ75D0R2uZQDD0mYZcXDbBn
         whacrP8qszGcs00ZC6hGtamYBhG6AWZLdCzgQNhGhoo8U5Ap4u5FZMMWG7pc5oPwSTCT
         MS8ya9iBD76lFagM8h/dJObVYNw9D0/kyyUyEfYR7FbKNrpBmXHWTiuMMbnTGYBeRijp
         REAb045cFlB4qR2BpgADKxPGmq5JbYUtmdqyMNCam9EDLcP3N0XIHZL7FbYOiuMDiO3w
         6W1smtsPIdQR9Dh9Fu0x+CAnM2VnDmB7az/NdWuuDo0JND5geLYMrRTu6q0i3/sZwn90
         jVhQ==
X-Gm-Message-State: AOJu0YxRsA+XkC9cFa4PVodJeWchxVtnWU0WLTpg04Z3Xc8Gvar29aXX
	0k0ggLiwKlSRMB9Q2V7L215pI7QlN7D9OlhvlnlKgWFHHzw1OIo6KTvadPz7iM2yAfmdCOetfOe
	Bt2uGKicn6iZeT2Hd6dwJDoZv/waS1w+87+w/6C+BhEXMFMIklmYfnWhaeQU2nW3RGGk0nzOtVb
	jSu9oW
X-Gm-Gg: AeBDievZ2OqSNZ1+acZhF2k7ACqlgJl9Mv1o2TSLHgauNUemuQl0C4r9gB8zeAvq3NL
	nNQHixtYAhZmWjk0RZyW8yXM9P5Hya3Uxj7w0r9mt98w8o8Y/RHDSgIrWGGORNVQEZt3pzSXrdr
	Ldf0ZF+RPZK3kbaIhfeyJZKSv0Vof3FCEO62DEKItGB6GJIVTWpZtcyHmUF7CeLjVYfSfD9N3Qb
	n/C5OsiwgW3iw1m/KCMD+8lxD53U/udg4qVP6gigd77nyjEuXwEpi5+APpThhy+XruE9pkcJTiC
	3K92i6VqJAD2UVHjufgpjYYNBeQ3DS+5d1BqBMgOlXJhnuCtPKq3KQ+TUrC+WJSWf12Irh2xkpV
	qUxD7ds0TU5hz4OX1AcQzBbvS6oSeaG3ZhZAGMPNoaVS/PZqht/Pv
X-Received: by 2002:ac8:5a4a:0:b0:50b:2d6e:5253 with SMTP id d75a77b69052e-50e24c1046dmr59280221cf.41.1776358381256;
        Thu, 16 Apr 2026 09:53:01 -0700 (PDT)
X-Received: by 2002:ac8:5a4a:0:b0:50b:2d6e:5253 with SMTP id d75a77b69052e-50e24c1046dmr59279891cf.41.1776358380698;
        Thu, 16 Apr 2026 09:53:00 -0700 (PDT)
Received: from QCOM-LDTZRie9bq.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1780b9c2dsm185639966b.59.2026.04.16.09.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 09:52:59 -0700 (PDT)
From: Peter Hilber <peter.hilber@oss.qualcomm.com>
To: virtio-comment@lists.linux.dev
Cc: "Trilok Soni" <trilok.soni@oss.qualcomm.com>,
        "Matias Ezequiel Vara Larsen" <mvaralar@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Peter Hilber <peter.hilber@oss.qualcomm.com>
Subject: [PATCH v2 0/1] transport-mmio: Add optional reset completion polling
Date: Thu, 16 Apr 2026 18:52:55 +0200
Message-ID: <20260416165256.4351-1-peter.hilber@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tVBVPRYNszr4Lvqw7LAcmB8GDEwz2YWM
X-Proofpoint-ORIG-GUID: tVBVPRYNszr4Lvqw7LAcmB8GDEwz2YWM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDE2MCBTYWx0ZWRfX7+I7YDevw/kN
 TeroJk0K4J6/JV38TRhdSymmi0dXqh0aVBGCra/RxsxxJFc6/MRv01r5ayHtBylG2hyivIIZlIM
 pD+M+41OPKpJNBwIGw1mUr84cBklP3uOPVrBaE4ssQhAQ/oNMxLBYxu+GumahT58to3Bb+0b7Mb
 MF0A2JcqNNI05vLbl6QmBaZfcxScwQt3HlURoBr8l2EJFl2/Mv0K8qXQ9F20OuHdrt9BScwHEBa
 5373EQKh8vFVajmOoR6L0xKikzMw9eri5d8U6hKtAn04naE5qLp3cmy5cuGjf04Et9UyAH0b3SB
 ENkUfPUM5f5N2YasC0pUNMoRZtcLiBegaSxYJ5eLXUJ9tG7QZo8nko1bXJ+F6haAycqb21tMDKf
 HLd/guKJFG8t+HvW2LBsjdBQI/otRFymlrlPNQw7f3P63bHPcajx+pWbmbAZ6wkqV5TP9VgTGSk
 gJcH1z1XBnVPdp003bg==
X-Authority-Analysis: v=2.4 cv=YtE/gYYX c=1 sm=1 tr=0 ts=69e113ed cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=Vt2AcnKqAAAA:8
 a=mkMtH7XpAAAA:8 a=EUspDBNiAAAA:8 a=-nE-q4Jgy-PAZNx2EiYA:9
 a=a_PwQJl-kcHnX1M80qC6:22 a=v10HlyRyNeVhbzM4Lqgd:22 a=I9Slk6e--tAXHahELIuT:22
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
version. This proposal is similar to [1], but simpler.

v2, after discussion on the mailing list, describes some edge cases
differently and rewords some requirements.

If the device reset includes terminating device activity which may
interfere with the driver, the reset should always have completed by the
time the driver considers the reset complete. After device reset, the
driver may free previously exposed buffers. Per the current MMIO transport
specification, the device must hence complete the reset during the write of
zero to the Status register. If terminating the device activity takes long,
the (virtual) CPU doing this write to the Status register must be stalled
for extended time, which may violate real-time requirements (including
those for hypervisor trap-and-emulate).

Address this by introducing a new MMIO transport version, v3, where the
driver must poll for reset completion, and, hence, the device reset does
not have to finish during the write of zero to the Status register. Polling
for an operation to finish is a pattern also used for the PCI transport
device reset, device suspend, and MMIO transport QueueReset writes.

Unlike [1], this proposal does not require a reset-in-progress status bit.
Unlike [1], devices cannot indicate that the reset failed, which appears
unneeded.

This proposal has been verified with proof-of-concept implementations for
the Linux kernel and EDK2 OVMF Virtio drivers (supporting v2 and v3), and
for the QEMU Virtio devices.

[1] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg07677.html

v2:

- Add summary of MMIO v3 to Version register description (Matias)

- Align requirements on Status register transition to zero with transport-
  independent requirements (Matias)

- Change requirements relating to reset when status is already zero
  (Matias)

- In the commit message, document when v3 devices may be incompatible with
  v2 drivers (as per reply to Michael)

- Improve wording; refer to "zero" rather than "0"

Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>


Peter Hilber (1):
  transport-mmio: Add v3, which polls for reset completion

 transport-mmio.tex | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)


base-commit: 5187698cc6f40fd2f2a714ca3faa6e998c5fc231
-- 
2.43.0

