Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DF03F54C5
	for <virtio-comment@lists.linux.dev>; Fri,  8 May 2026 14:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252031; cv=none; b=CdRa23wrbOxZC9rzk2e6P9cjpcSHdaY0h8ykn5xkcEQk54n6rn5oaCsUPH38AHd8mwLxGzEqyn57vKR95iA54QJxuKE8NkzsCwPb8oqbb2bo45Hsn8uY3ecupVZFvAcyIFDPHHrHGweBb/+gSvVObEq6LC+OLINrSHmloMVtV6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252031; c=relaxed/simple;
	bh=5Dbt8/dWuR6wBsRPyf13uh+PH6ObPKkk6xQukMnG0Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irtItcXiQHOTQ1G+/tO1+bATYNqY2Bi/kPAv4yxRW/VmvmoSVcieUG5SwCiIwZNTO+/Msf9BF54CqdwspnwaD7VV2SH0aPzwoFSJyG6r8C75u1ZqZuskkW5qTjrR0FTuYi1GlpRdurC92puK2Ahdv6ELO7/Ge7nYiApQIbZZnk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQNz1dbs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zw7jknAG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQNz1dbs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zw7jknAG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648CF1WH4070250
	for <virtio-comment@lists.linux.dev>; Fri, 8 May 2026 14:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FWzCfE3mOXfSu7BT5vvqEgKs
	e/etf/JBCZjbPGp+WNY=; b=kQNz1dbsuF2f7GHPWHcXbE7Hc7hEnHcgD7+vSsD2
	7gwQ7jNxa1sxRFXOEGUr5UKGtkK87OeuO17SSKuub10sQt+3IvgXjWwx3mtdn2RQ
	ZX8JDm1flLz57Rnh0+Der3NAEWC0Oh98YYpV8l4/WNCgYCb1FESFkGNL1WFcZsYn
	kuMFFMDkHXNDDuGLYpcWWCncwEivg5qJ8lN0UUS5Osvsb0tj1j5EqpD54zeIpvF5
	e/rxjodAiJKxxau21RxuJg6nh3WvQmWMZuE61UmXFp/SlzUgCR2mNgtNpcP+Ugfq
	Xeki9hdfg5vIM2CWJzgvJubS/1BMG5Pj0rFaUmX/9r6dZA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e12sp3ksk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Fri, 08 May 2026 14:53:49 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-62f30279e90so1922639137.0
        for <virtio-comment@lists.linux.dev>; Fri, 08 May 2026 07:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778252028; x=1778856828; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FWzCfE3mOXfSu7BT5vvqEgKse/etf/JBCZjbPGp+WNY=;
        b=Zw7jknAGb8Ozd5CehfuC1GvIemtl/es0smSvMtQv4EjhoclgVONM3plrl4uT7Sr54/
         8QyajBUAedPvq0lAi5sTdNKZvTpVez0fquGDzqbAY1TsUyVVUv1B7uvPDD0GmC/9/MUn
         0yFBykdx5uDfSqMT3SZizG4p7JPLpntamjcCyxW+TSefxHXAMEXPH5xb38AbcOQe6sIq
         hB8EgNrh1soSLM26DcKfSD7F4lUG2wHJX1m1fpBgVcVNMiX4UhBiSooWyaVY3KqO2mw2
         q4Tyo5DNEywVlGSu502f0bVi/JQdpanaKEqESlWNpGR8d7JB2tqHb94d0OMVE+Z1V68i
         pCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778252028; x=1778856828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWzCfE3mOXfSu7BT5vvqEgKse/etf/JBCZjbPGp+WNY=;
        b=R/zuiEn7Aj+kQbiC0tkd1WRsPPHZotjxt8XhC4MmQCJ3z2RFJd0ZtQDcy8kU6QGqpm
         /D8AZ6hWihrJwOhYU3qYIi6KhdgbDa7jbbRa1coAkJbLMeMY3zQovtg36lq7D4OcPg3w
         yo+apBbC2U1TKIn0oOxzG67AuivGxP+vLEJhMxYBQLSkRwCz0NpLRRqB1iqwwnz8yPEA
         UusFa58OtsNVStoV/9XwmptjadvG8+UBokVs7ykxwyDRtUglzjo43DVkoeHgDAWn5i6T
         iUD0VNOnyj4H0HPgPmWmSQc4Wwvi/vVCu7IHFQ+V0pL/QMaM21TE0jA6jN3G8VwFdwqL
         pZOA==
X-Gm-Message-State: AOJu0YxkKOdI7h/zxRKuAmdKVwPlt3/cmIygTzOOz+mkf5eBd/1jlX5E
	/nQO4wfPcJjvYS96VV6NbRw7bW85kZzEOW/ID0Cvc9dooesK9FBI1ccCrAsOZv606TgzaHjaN8t
	e/lcTEI7jA1tqlIPj4OIKNanCVltmgEAYHLl5a2jLbM0NM5GkBmjGITMHAjRBqx7/NIN2GGQ7d/
	l7zQ==
X-Gm-Gg: Acq92OHyBHbQjCQ4hDc3lI/tWm6/cHynrLduRAHIJ3WXXx5q5Wdom1eikWPotg4gaXL
	XuJJjfULz9wLG4gD1VCstWfQQXTRdbTKhplrzTy862BOi09cql7wW3EVAjhkwBYUnIOv42yobyI
	COSJFU3303VYFlVmFFm2ktLTTpJpyGnqBpduDjnIifQa7JIwrXFYBhMZptldYrWXTwVZkm8AOUu
	lWOWU/zC6+9+SeIy9xy4U3WlOOujZnpdU1hkaMeOu/NU4ICpuuX52+kJJqwhBg5w3FM5va/ZyDT
	fYqNhg0326LRos9GDY4uCeQAgwqHaoo/z8lLZVrYLIF61vjhbdg/MtNHPrFUOEhhfzwVRP2gkyn
	OwGIWM5R2z1zzXIWD2olWiTgGnSkTzuidgecI7mpOEVqPLcMlXO4QTyE2
X-Received: by 2002:a05:6102:580e:b0:62f:357a:3297 with SMTP id ada2fe7eead31-6313e959d44mr1427999137.5.1778252027993;
        Fri, 08 May 2026 07:53:47 -0700 (PDT)
X-Received: by 2002:a05:6102:580e:b0:62f:357a:3297 with SMTP id ada2fe7eead31-6313e959d44mr1427989137.5.1778252027455;
        Fri, 08 May 2026 07:53:47 -0700 (PDT)
Received: from QCOM-LDTZRie9bq.na.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac09c856asm90078466b.14.2026.05.08.07.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 07:53:46 -0700 (PDT)
Date: Fri, 8 May 2026 16:53:45 +0200
From: Peter Hilber <peter.hilber@oss.qualcomm.com>
To: virtio-comment@lists.linux.dev
Cc: Trilok Soni <trilok.soni@oss.qualcomm.com>,
        Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 1/1] transport-mmio: Add v3, which polls for reset
 completion
Message-ID: <5jkvhc7joy5toliab4qqmv7qno6j7irc2if5p72qbjboepo5xu@wu64nvccxa7s>
References: <20260416165256.4351-1-peter.hilber@oss.qualcomm.com>
 <20260416165256.4351-2-peter.hilber@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416165256.4351-2-peter.hilber@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE1MSBTYWx0ZWRfX5qKsDK4r1kaz
 4BdeN84368MwuJBwXMqZKq3TY1sTs5RA8xBo6+IY3jt5dHaNI0TzQXzC+ghnSUA6B6DDnYSClcn
 yJN6XBwpq1+8bpGH1wcIi0fHWgPuvRcr8DRKISKiNxP8EiRKwb+yT3PVr6Jmx4mbAZg8ITiTVpU
 ri6uk3IVBlUqs7hl61FuX/1h7U/lxFVIIDsKKaE8/Dv4Eij68Dj0YjJxmdDsZ4qWllHaPysqsng
 WOD0rjUFV7ROzFT8jiU+2bSxhWMXtorutfiNzcMDPiHurDTQzyx9BiF0qwEUS7tkBWNHojV31pJ
 qqkG95hRCTf80Rz+Dq+uxrpCbRHiaXIEQM6MQqvOzoRd7IEbaTPIIoYxuswTnunxTGLpN47Eoy8
 LzARjoQRtBuGfPphWOvX7kHLZJv88PU94d1QB5j6DSmb6LQlIF+CTOGPFHVrL2G5UU5qJ0UUasI
 JKKL7a4vsJEKnDAYfyg==
X-Proofpoint-ORIG-GUID: 3XXyW_Jq1HXNb76uuHtz0BXqV5nghQld
X-Authority-Analysis: v=2.4 cv=Wu4b99fv c=1 sm=1 tr=0 ts=69fdf8fd cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=GD-asfRFfinyQSMSJGYA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 3XXyW_Jq1HXNb76uuHtz0BXqV5nghQld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080151

On Thu, Apr 16, 2026 at 06:52:56PM +0200, Peter Hilber wrote:
> Let devices using the MMIO transport avoid stalling the driver (virtual)
> CPU during device reset, which requires introducing a new MMIO transport
> version.
> 
> Unlike the PCI transport, the MMIO transport does not require the driver
> to poll for reset completion. This requires a device using the MMIO
> transport to complete reset during the write of zero to the Status
> register. Device reset may take more than 100 ms if it involves
> terminating ongoing device activity which accesses driver memory. When
> the (virtual) CPU writing zero to the Status register needs to be
> stalled during this, this may violate real-time requirements (including
> those for hypervisor trap-and-emulate).
> 
> Address this by introducing a new MMIO transport version, v3, where the
> driver must poll for reset completion, and, hence, the device reset does
> not have to complete during the write to the Status register. Add a
> requirement that resetting a device which already has Status zero is
> synchronous to avoid ambiguity when such a reset would finish.
> 

Could you please open a voting ballot for this change?

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/246

This version got a Reviewed-by from Matias Ezequiel Vara Larsen [1].

Best regards,

Peter

[1] https://lore.kernel.org/virtio-comment/aeX0hPTBQh%2FtgLOp@fedora/#t
