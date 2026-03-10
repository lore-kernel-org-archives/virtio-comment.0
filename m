Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39023D1714
	for <virtio-comment@lists.linux.dev>; Tue, 10 Mar 2026 12:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145985; cv=none; b=NLmfng5qvSTR0jU582Mb21cdUMVlFWXU0U1Kalb2kK8hbg7Hp2FEiKzSz5qWrx1TRtRexvAegPMETuv92R/fiWLxG8Y4PxjVTihFo3utEtJowT1yuQbCFvD3HTS1wGnpoyFhECQzv5P4jfls8FsxwhxGeCZe2WiSY1LzXcrD3zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145985; c=relaxed/simple;
	bh=i3XWfTYNpN9e0/deF7OMq/119/fk+CpP7gkf/kQ2pH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7m6sNTARWnBIIo3dP/+Fs5zC0CfTqezPMtNBZws3cpiQ5miEXViW3w1xHh5+KCLzk+6GOVSVg72TpD1cU3u7wiOEXkQc+GOkKBCrnvoQRZ6XII7PHkM0fg+rNQrzT2B4Hug9WaxPcRSv68D4EYG6XpBy0opjs/PJvKye7ULcfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ovIEax9I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jxDhaSIi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ovIEax9I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jxDhaSIi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8pspY3691782
	for <virtio-comment@lists.linux.dev>; Tue, 10 Mar 2026 12:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aC4HWiCXPDrP9LexsdXXdr4Q
	0mNIwSEY0pjymUshe1w=; b=ovIEax9IJnTkUoUD0r7GBH5ic7v0v9Q8US/LfX2V
	WEpEXRzipvAEzLOqIMiQ4dvjJvaXYNPf6zAYOuJS5snJ3dI8YHVE8UhZ8lVpk88T
	qFPb+vNI+NyBln0Gq7HWb+AVzLkCAvtEPSs9WiHpVj1R6iAA0vgjnmbkRx7m1VFf
	31pYOvEtmMroig/GBCdqEB1CKN8WZe+m4QCLWfWgbkFoO4myAq/TgeXt0ZvHmqoY
	n+Ki8YX17FLwlThfPDusSE4yrijkG4/PTWBGrDm+V1QLx6bqCh7TT3gZP5tWw3Yf
	EK22hLKYmhIAPJ8uS8VzMKpxA5vSVbsQ/pKjjj7joO7IfA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg5ngupt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Tue, 10 Mar 2026 12:33:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd98d96382so33271885a.0
        for <virtio-comment@lists.linux.dev>; Tue, 10 Mar 2026 05:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773145982; x=1773750782; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aC4HWiCXPDrP9LexsdXXdr4Q0mNIwSEY0pjymUshe1w=;
        b=jxDhaSIi4w+cCEfv+FjGmPX7H9G+k8WRqfjAJWJYHBCNS71iYHvVQAjQFJHXXjXQnh
         6vroskSKHHDq93UuzaUJtztqAQjrqa/QpEJdHBzPQvtO+8YjIkI5VBylKvZ77mEzV5MS
         C0Kyxim5L3Ai0c6u/AWV7A+ByupiGD/AfhJarPGg0Tu8kWCW+KqlIMzypVo028Enrow/
         u7eTvbYBcDxHK8lmVBlgs8glkjsn5MBDvj0etf+GTET3OSVrrsroMNZOyouUbJWhA2Hy
         NL/hGHqahaks08qxIY5D8sKMuuYtDj0yeN16LTHQWHZ+Ke0h4UlfS/Om+kH5DtR0aXWv
         96Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145982; x=1773750782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aC4HWiCXPDrP9LexsdXXdr4Q0mNIwSEY0pjymUshe1w=;
        b=CJ0eyUr5C4T6lWOTO9J+F8ed8tLmOJHF9yGd0vissp0nKkgGYEWqi88J8x0O0IYhSK
         k8Axi/I0AouH5bp91NBuQUvLSIPuKIFzrArrvjrs3RiN7Zn1CzojL8vhXMO4iWrIUHov
         Yts8Pk7p2Fn4sld+F8p0+DrrDRNFM5KuhtwS5jUfCsz9qR+0g6/5CtceQNnhZiARzmJ6
         vrdHd7PFdYlS5UXQarL7WOmwFUF55X38eSUk5ykQTefIxZuOPsJuIut8QGfDITvSslI/
         KoksJ2v6D64GnybpntwP3GY6Y1ezNB2D9ro3e1rRpOMS8i1heX8C07GJRQbuTFZWLzON
         3EjQ==
X-Gm-Message-State: AOJu0YzGad7d8kyH48pGQccS/gp2MxnmdoeiA31OiDvOwAXjrQ4PPmTI
	ZkwC9Wi7rkeX70NkVrsmTZxnh3w7xLHJnMOdb6zdlPzbHvmtHkXtsXPr9iMb59ltwYtXbMZCN0l
	N55pAQmmoprPjCvbDLoUKjMXaxJP8US+xgxs0vqZX/Pm2NuOr2zYANFmUQcr/irI3VKWEYx/TEb
	uW5A==
X-Gm-Gg: ATEYQzwthStLfLVDJLTquZM38gECdQdjqWsMY+a2PxzsM1lwB6XmVTPesXDLxU4rnlq
	t+V4TsoSu/HLeBnD0+Po7uS+camJ2wsdnR7DWEG6m3+gpE1Ox8c/awGmUeJKBRWqZG+20eLK+uJ
	EkeM1/pDfimLx1+/bni2imQZNZy2slgSF3etf9Tq57d/IN2C10NuKatT1zsygscUtVn21PSGaLT
	6OTozr3o1Jxg9e7oarXmEAYI3cjRXbTHz75sYnaNXWyWUMm6sdUtuTZ7eYA8w9/Z0kB13YlL2Id
	m3na0hxPa7wGGMWu6qeK8IrqMvc377a43UGlnW9PDXTJdMUN1iUYTOogoaX4Y66Gz78NPAQDA3H
	zn5efkw/XjVDIpuJNIvbZxNO/vNphUcZYX6iRNDF1lfUlaITy2AFO9sOU
X-Received: by 2002:a05:620a:1903:b0:8cb:4ba9:ccec with SMTP id af79cd13be357-8cd6d48b175mr1726633685a.72.1773145981921;
        Tue, 10 Mar 2026 05:33:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1903:b0:8cb:4ba9:ccec with SMTP id af79cd13be357-8cd6d48b175mr1726630785a.72.1773145981425;
        Tue, 10 Mar 2026 05:33:01 -0700 (PDT)
Received: from QCOM-LDTZRie9bq.na.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f708sm98395835e9.11.2026.03.10.05.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 05:33:00 -0700 (PDT)
Date: Tue, 10 Mar 2026 13:32:59 +0100
From: Peter Hilber <peter.hilber@oss.qualcomm.com>
To: virtio-comment@lists.linux.dev
Cc: Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH 0/1] transport-mmio: Add optional reset completion polling
Message-ID: <5brvb7btnwymxc4d5yjcxohf362ihpth6sq6dtvda6uuzxymdg@efcuei3ar3s2>
References: <20260204115022.1930-1-peter.hilber@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204115022.1930-1-peter.hilber@oss.qualcomm.com>
X-Proofpoint-GUID: Y9B0gjr-sgWEksZuCn0EP270X_uLk2Q0
X-Authority-Analysis: v=2.4 cv=ervSD4pX c=1 sm=1 tr=0 ts=69b00f7e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Vt2AcnKqAAAA:8 a=mkMtH7XpAAAA:8 a=EUspDBNiAAAA:8 a=l4e7qE2laZTIoQsEITcA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=v10HlyRyNeVhbzM4Lqgd:22
 a=I9Slk6e--tAXHahELIuT:22
X-Proofpoint-ORIG-GUID: Y9B0gjr-sgWEksZuCn0EP270X_uLk2Q0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwOSBTYWx0ZWRfX4aQKzXTHAIzw
 72agDNqZgR7AwAMhBTULiHfnYPUF2/4WSOX+S1tNXeK1FiALBxnTv5Tqq3gUGZmFXfYwwzhVold
 rpHfhb+tpl4H2EZZI0YxVOg4tOy68INDGlOtLALwTowWHBOSlC1zDLO1wbgZdoMSp32ZeWl5pKn
 O/mrKrxISDG4A6aeBSbMMgfF7zQwy2Yuf5PjHwySwiIkJnhsQpDJpRFE30TfylmuCOxVW/89WVV
 wxuZy8fB9EiLeil9fj+DkAhfTEcuWqfCxFX2YdRgWmEZiipGGfXPs1FQAvm2ZhO46pBCRYXlJoG
 rltCG1GdHJrjht6ttnNOVzDg44y1qGTFXKTeM+0+ovkVAtTgYyBqoH088LEPY9kgoXjbXBAZrMy
 ttM3q9VzmywjL//itoYKa7yexlYBaau4sksgE8b73V1yMuPjmfWj5st/MYAHHOMZRtFT0ckJlhM
 vsgEqXgsvOYT9lBX19A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100109

On Wed, Feb 04, 2026 at 12:50:21PM +0100, Peter Hilber wrote:
> Let devices using the MMIO transport avoid stalling the driver (virtual)
> CPU during device reset, which requires introducing a new MMIO transport
> version. This proposal is similar to [1], but simpler.
> 
> If the device reset includes terminating device activity which may
> interfere with the driver, the reset should always have completed by the
> time the driver considers the reset complete. After device reset, the
> driver may free previously exposed buffers. Per the current MMIO transport
> specification, the device must hence complete the reset during the write of
> 0 to the Status register. If terminating the device activity takes long,
> the (virtual) CPU doing this write to the Status register must be stalled
> for extended time, which may violate real-time requirements (including
> those for hypervisor trap-and-emulate).
> 
> Address this by introducing a new MMIO transport version, v3, where the
> driver must poll for reset completion, and, hence, the device reset does
> not have to finish during the write of 0 to the Status register. Polling
> for an operation to finish is a pattern also used for the PCI transport
> device reset, device suspend, and MMIO transport QueueReset writes.

This patch has been pending for one month without replies. Any review or
feedback would be very welcome.

Best regards,

Peter

> 
> Unlike [1], this proposal does not require a reset-in-progress status bit.
> Unlike [1], devices cannot indicate that the reset failed, which appears
> unneeded.
> 
> This proposal has been verified with proof-of-concept implementations for
> the Linux kernel and EDK2 OVMF Virtio drivers (supporting v2 and v3), and
> for the QEMU Virtio devices.
> 
> [1] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg07677.html
> 
> Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>
> 
> 
> Peter Hilber (1):
>   transport-mmio: Add v3, which polls for reset completion
> 
>  transport-mmio.tex | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 5187698cc6f40fd2f2a714ca3faa6e998c5fc231
> -- 
> 2.43.0
> 
