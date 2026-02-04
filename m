Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE582BD5A7
	for <virtio-comment@lists.linux.dev>; Wed,  4 Feb 2026 11:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770205864; cv=none; b=XFYpgYIJeDtAgG4Xm56b+lzMAVvJC1YFeH5vLVz52K+ikVvYLWjIcfcHpZZ6RS39mpC/9OS8pSaQWlM2zh1RK4/fvk5bdmELsGU9JWpAY7IqZQZqVIKLcxUukkS4zz+AGYOHiE3gNf+3OW6avbEF25ocbtUKrVXibhH2kPA3gI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770205864; c=relaxed/simple;
	bh=uE2PwTziZaSRiTuFrzt6pVgDGWGOEPY053LToBu/Zk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PiAjTdW/wBDdrkC7+2GJimPhuAviAgGM8N9pNoSwZ9KIwzCKdj90/03F/sxGComEoL3fL7+YDffgKikVyg+QAIucy0p1OnnMeZAIQbtiGV/zJNQfhjuyR0GjfQBABESke/z0nDQ6S1VhCEm1x5FAaATCBD4ht1nuyYc3YLitgSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dj2vbEds; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2OZPyt5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dj2vbEds";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z2OZPyt5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614BB2qc1248614
	for <virtio-comment@lists.linux.dev>; Wed, 4 Feb 2026 11:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fkrn2zV4jGjlcGNlzWFSwbLa4xMPOlUevAF
	NJ2brlJc=; b=Dj2vbEdsG3i3fc5Td/J7YjE/4dUIiyPtXXJE5xNy2hbSm40nXAc
	Lzz6lILVfOhlpDWH7oeuzg4KP3Uz6qp1yxW4JnPqufHhKh1UpMHzT8eb+LPFttm5
	7hfUVpjwacygsUq2mbCr87RXbL6sVSkvK8gsYWTMXT0a3rUWYeyOTjMAAF4LX6Ix
	3XgslsVBK7AbGN05nWb2KsBrQLDFdCuck+AhkjWkAphN5nOQusfisIuaxDBhxif/
	sYKLcLRak3tr0bdnQI5hboPuXQJEfjX/Uq5GZvnKXmynuCXvmVdzHDLk8JrlR5FP
	IIECc8F4xfzkogo84PFmmfkKft7jYWrXdJg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43dh0dre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Wed, 04 Feb 2026 11:51:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70d16d5a9so639985285a.3
        for <virtio-comment@lists.linux.dev>; Wed, 04 Feb 2026 03:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770205863; x=1770810663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fkrn2zV4jGjlcGNlzWFSwbLa4xMPOlUevAFNJ2brlJc=;
        b=Z2OZPyt5QLh06RIlp0V+oKd2JLGqUQb948ZJ5+JdY/NG8tjIm5i4cUuav55szLyFoi
         r1KMJr+lipnkloNcF7U76xoBtQTDXbUDncFjuHnVVQurRFC1D+AOIbCMqv/TVg8csM3v
         C5KjbUOL77btwaA2yBrRv6apaXNvD1svlrDXWkXPfErdKysSFKHSV/yybgGV97l+a/uO
         L/KeC2MiHHAR0Qd2OVoErwSgiw3NWb2nz6cqxz0m0gnd5e2hho5j9SHnPrHAfhqiJYyI
         9n7Jir+El+geg9lA86yDvCa8YpnNUHUOvcOxtuuCd1V9nr/zYWv3UtLkpg75Wj+7dGRZ
         E6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770205863; x=1770810663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkrn2zV4jGjlcGNlzWFSwbLa4xMPOlUevAFNJ2brlJc=;
        b=A17p7uhhWKN0P0FHaxJo6LeJ+aq0SFmF0nQpsky+6gZiXRs+aXblndQyka5Pl/jumz
         qZgpvZ7dsRYmaDunkcFrN3AyqD327V6MDbuSt2tOwTn2VQoLZgJIYtnOaF9ESU3C0Jro
         gU5O/SiBZ5w6eT8FW+bpK7i0+o39CY3LnQyVQ4lqxU/REb1mdOKG5Nztk57chJpfhf6Y
         GMvaXrPQLwsUQE+KcmpNeoGanSnCkYOO4/EgTlxZGYYz5k9JRbIPbpmnPCSnkAhODjeq
         ifSR+n1j/Bm184Tglv8HpudhSkW5ctO58i4QkUuiM8oYOmY59ixycbEUMWbs90LjY7QF
         RELQ==
X-Gm-Message-State: AOJu0YyvCYUu8KCX15PvsE4JajTGFXlKKN56SWF/YQ3JMbBaicjY+5h6
	zVm3Rc5m3bbIMYTtWcvrF4QGshP6BHSAegV1JqiReem4WF2t9/TCfK66sV3/6aW5Q/H+JDeaZGc
	qBIMUT86Hh3pbGnUB61Dxl3P8DLnJahIkWlBmcRgyjJtyuTo6ycAliwsfwrVa3eGe+6rQE0panj
	KdXw==
X-Gm-Gg: AZuq6aLD6dlFQErflumx1rZgqVTdeBM47RvKlZhO87SnUCJVIdjJMLE9y6yEAMS2GN9
	iOafPS2oI2G3I10x63vzk4TT9g8cxnYZ7UaSVqHfmPXEwnCMUiet3y7FbwbCQtMPOfPoddb01Sq
	gUDDK5ZxPH6JKrIY1d3K0Q4vqzoql2DE4N/Zhe1Halv0h/SGjZM0DS9so1Os/O3GU2NyyvvY3VY
	qT+NDDnA9iiyZoXAsv5L8LdfujtP+nAwPZ4EPkAS0mqTQ8Werd7fkgK4ic5gzM8dmsUH8gOOcmZ
	tXDMscmm+IAvTi1S7ZK3b6lpQqi8HA9rCoAKptBsYQRWbpsRBetk+Mj8bBg/Vi9cFP4CfphwSsC
	sCjAPkOtJ/hJ+rZILRAoJvw6a/1LYT5NK96ZZTbtN
X-Received: by 2002:a05:620a:448e:b0:8c6:a1d5:47e1 with SMTP id af79cd13be357-8ca2f839d1dmr254807285a.9.1770205862681;
        Wed, 04 Feb 2026 03:51:02 -0800 (PST)
X-Received: by 2002:a05:620a:448e:b0:8c6:a1d5:47e1 with SMTP id af79cd13be357-8ca2f839d1dmr254804985a.9.1770205862231;
        Wed, 04 Feb 2026 03:51:02 -0800 (PST)
Received: from QCOM-LDTZRie9bq.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4831089d547sm53275275e9.14.2026.02.04.03.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 03:51:01 -0800 (PST)
From: Peter Hilber <peter.hilber@oss.qualcomm.com>
To: virtio-comment@lists.linux.dev
Cc: Trilok Soni <trilok.soni@oss.qualcomm.com>,
        Peter Hilber <peter.hilber@oss.qualcomm.com>
Subject: [PATCH 0/1] transport-mmio: Add optional reset completion polling
Date: Wed,  4 Feb 2026 12:50:21 +0100
Message-ID: <20260204115022.1930-1-peter.hilber@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bMgb4f+Z c=1 sm=1 tr=0 ts=698332a7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Vt2AcnKqAAAA:8 a=mkMtH7XpAAAA:8 a=EUspDBNiAAAA:8 a=23D8pX-6UNfdkGjBOIQA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=v10HlyRyNeVhbzM4Lqgd:22 a=I9Slk6e--tAXHahELIuT:22
X-Proofpoint-ORIG-GUID: P_29ncksu8J-dvNLeSvjjIjOnvxkbu-M
X-Proofpoint-GUID: P_29ncksu8J-dvNLeSvjjIjOnvxkbu-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA5MCBTYWx0ZWRfX26xa6cH3To81
 TGfPLP+VbBHbFzofWjCMlJZkfeSTt6dcQGW2CKlLNW3BOJ6F+csKBAXURWiHNcvHGWPtIzznmI9
 XrrQke6gm5cJk6XFIQHKqXmQQQ03B/ZYL4cW7rdaCKqPysbZ+mqyiczxgh7w7fmR3MifqeIedHb
 ctWjmQNy/7bqsDMR9SQkPQ8DrF2fybSBlinj7VIOr/hEB4gB24g2nSrGcMnTYv0NmhAd5NP4RJ3
 /6TJLwv4gvJ0DH9SXyLJj3EML1HcA2ecc+oVzV1QXQkdKO9bw1npU+ONYr6IaShAxboWZRZDprN
 RMIISPVjW7/2SiEt/W7tp3y6PPBtNZUjjydNU7pxM9x7OR/G/fVIsbdzwSmd1RcCXU7WHiT5ul7
 MoQKK6L5Uir/9WMU9avRHjUeS5m70QCtzS7zKNY1NREjg8+5yXGy3JtVCLgeN95vOFjOJotC9Jn
 sZVVdIcFv6o95dolBdw==
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
version. This proposal is similar to [1], but simpler.

If the device reset includes terminating device activity which may
interfere with the driver, the reset should always have completed by the
time the driver considers the reset complete. After device reset, the
driver may free previously exposed buffers. Per the current MMIO transport
specification, the device must hence complete the reset during the write of
0 to the Status register. If terminating the device activity takes long,
the (virtual) CPU doing this write to the Status register must be stalled
for extended time, which may violate real-time requirements (including
those for hypervisor trap-and-emulate).

Address this by introducing a new MMIO transport version, v3, where the
driver must poll for reset completion, and, hence, the device reset does
not have to finish during the write of 0 to the Status register. Polling
for an operation to finish is a pattern also used for the PCI transport
device reset, device suspend, and MMIO transport QueueReset writes.

Unlike [1], this proposal does not require a reset-in-progress status bit.
Unlike [1], devices cannot indicate that the reset failed, which appears
unneeded.

This proposal has been verified with proof-of-concept implementations for
the Linux kernel and EDK2 OVMF Virtio drivers (supporting v2 and v3), and
for the QEMU Virtio devices.

[1] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg07677.html

Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>


Peter Hilber (1):
  transport-mmio: Add v3, which polls for reset completion

 transport-mmio.tex | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)


base-commit: 5187698cc6f40fd2f2a714ca3faa6e998c5fc231
-- 
2.43.0

