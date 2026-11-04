Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802636;
	b=Acm0uMC5IQmAc7uPz4Uyo7KZSFpyUBLmCGF4oAzV+uXlTG7nUC6/I6XsfcJqmOqb/PPL
	 bIwl+iVWHqLnBa7VERwx/GNmuHnMGDsfOSg+x+Wqyo1UgcUWPgyM2VsBhEHEU6BcDk1jk
	 bV/crVYygqILs5PBJMKpvL7N8Io1nFqS54dGLWbDCd3TMwuj2+o9kdIU//wEksGYH96Vd
	 CDC+QPXdNFcgPKW3NqI5p5d4Kj/0Tv+eMACOBSJ0gF7sogHIQ6SBMo5p+OAAW+lZixBaf
	 vUrHUqZSiR4c+60sFdx8xYF6tij6pDONbfcMkIPuQ4iyeL02imDnCb7Bu46VB5gf+4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802636;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yyoZc4zjr0h4bhJOUVxAFl9y7S9xI7Flu7z31PynXAM=;
	b=4I2FuydyJYB2NgQRkZIkCHRxcyNS9I8TAJ3lGJVHS6W8UCya5QJ1XAwlW7Y+riBZEsjw
	 RhkmJU0fDQtj+MHC2gnpYoOqCluAnwookJZqnyZje2njnWRhNeIWW+vHr9tYv1yBpPqS5
	 CgYcfgsz5VQRyLtdPDNtveRjr+47wd3TJ9kNMoscUh2iAYguupw/TdcQnectH+3N4rg79
	 fWYcLz6/4UJDNkKyBozbsYqgDjG3xLGz0OmhbDBV3/aVpCTTsCqoccPbo75BDk/ORfxsv
	 3eIoaePlVURFJZUqqXGIB+buVehZk4W/tmT0Srd4j7+KWbUKrln/FRgQcRP1jtJE6Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QlzzfgW0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bnkZGtjz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51367606A31B
	for <virtio-comment@lists.linux.dev>; Wed,  4 Nov 2026 14:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51367606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QlzzfgW0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bnkZGtjz
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZsKK2284167
	for <virtio-comment@lists.linux.dev>; Wed, 4 Nov 2026 14:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yyoZc4zjr0h4bhJOUVxAFl9y7S9xI7Flu7z31PynXAM=; b=QlzzfgW0wL9fXYyT
	Gx8tFMJjgiexvcKSgRrfBJFbPAZwoXwPDDI7ywfbydEBJ4Jz/5SQRPynQdEYoDFT
	+LguBoIw4byhIFM5s9X2nKG96cnY2Zj1sVoSRL0HO6gkQaYp3Kx0lAfb8qSZyE10
	U9egyCnIjbPmIUxUOCju3/yJRxSa1N8+luRyzz46eTZ22bhjvtMJLJu4tD1RJ8D2
	n4tfEod8RahMCxh2KvPayy1MlRTTZdVKkqPvHMOvOEOARiZbwJqk1nDy1GDH+Q9P
	G673HqQv50KvifrrZoqZKqjScSI+sH6BZpSFfX4sd1GRbezrjBWedRaLH8Zony7/
	R73ZVQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284s3jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Wed, 04 Nov 2026 14:30:35 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso38106e0c.3
        for <virtio-comment@lists.linux.dev>; Wed, 04 Nov 2026 06:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793802634; x=1794407434; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yyoZc4zjr0h4bhJOUVxAFl9y7S9xI7Flu7z31PynXAM=;
        b=bnkZGtjzv9ExzC3xfFWEATxuWnJhiDwgsJKvkbcvETDdyLXrE7WGqFwi8/KK9h6dhT
         ezkOV0MurxBGzMQfZBrgpDjCFZ5QuaI2EWPsq/Kby8FxRg5gX386dOSesCZzldCFxGwR
         CNzPLsTolmYmLXHQlfXOP0zbwYAepc3Xnbx8+0E9sGXtsnaXasMEcQmY+zIpqGpFViwc
         GkdjWr3Zw4kPiP8NMUPGoNEdw8VBKxEH8ImjGDzWg86r9j28+S5+C5c6iSgF+x2Kkj3x
         xgcQuaAv3tRKZtso8ZAfW4fRZQKI6Nfwl8G9VmCsQKWV5siwrEMo/puPkLZggLsm7FmI
         sXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802634; x=1794407434;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yyoZc4zjr0h4bhJOUVxAFl9y7S9xI7Flu7z31PynXAM=;
        b=SwZE9ijunrE/na0frC7qD7suWEKOR5pLyvFT06feM/K3hc6mtbZT7P5Krn6imMoCRW
         2hzq6qey8MxHwkK5XaElTJxsrZIodmsMD3fHkul9Tq1ao2bNhrM+FJwvaXGadKRaQoMb
         VfTDxHt7MjPMfgBvl3wA0KlKgfVnMUaf+bGq/LmLjEA2MDrLzY1MeJVsKemPEtPNpBqe
         RrBdqSTp8QRyH69EqzU01m1B+9PYoWPmXfoYTm+SgLN2U498brwRO8Ix39WaLGrz49Ha
         BTy/Sl1z7nVltuOFB64aeF9n3S+tHC7ZsgElBIVklbD1JrsPsFF9mvE59ap8pS7bRodw
         PJXw==
X-Forwarded-Encrypted: i=1; AKwUvBxS83tOWCALU+CX7X5OGGhzgiYJGBiW1dYPPRNVvrWHRHV/X1XaKmllGNmkYqyyoqEsxaUJFNuZrJqulcBbkQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/3Nqa3i7Us3ntrbUi3yGD1zj1qN9bDxR/D2WsTj6ATiJKfzPza
	6MhFV9OmbJj2d1enKlOi4yW6/bI0KNqkuqPrD6lEdlt9l2QBFaU4MSr5jo7UALX+LvnAUJPay8F
	EiyTdF6M+msgkUttM5Elnex3ElOzcPRsdumWBKR7XCGTItVmBA3WmMUDd7gvoFl4VE0MHiIFYbR
	ribw==
X-Gm-Gg: AYBFou0FscCvuWaBbAR5aMrhDgArd+OCSpAC2MwRq77NHSdIXCQyb8lQF+iSoR75wy5
	fN/SFobp3S4JSwrxGGKNZKStcY+IareyER6+e6nIuQVieDOlOLViAZ5Gq1+YSs7Q/NCu1h+xu88
	4P+Q6Kz/kJPBGzKDyi8jk2IhtkCbTJwCogaL81OfJsAzdRJTb0FoIpsZEfEYVBUOnjWW4YN2TZp
	NBCmH/BnOE1jW4587ylgNlm+/i/GGpZ/JyMBFUXP3EZ9ixRGvUzIo/dKwMjdk+E06vdUWM7sF+z
	PIixMz+zfaeMUoIhKb8dUXCMZFphJ9wHUjvyKUSdCO+eYJn2O1kfnuz5Wi4qv2gAs/PogG707yv
	d2r/WoMBLZQWeu/wYxOR8R694RL14/NYtrquWckeo1HSbiuL+msTwVcxwuGkBYmLPQ1oZCDqvsL
	g=
X-Received: by 2002:a05:6122:11ae:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec689382bcmr7625066e0c.4.1793802634409;
        Wed, 04 Nov 2026 06:30:34 -0800 (PST)
X-Received: by 2002:a05:6122:11ae:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec689382bcmr7625018e0c.4.1793802633781;
        Wed, 04 Nov 2026 06:30:33 -0800 (PST)
Received: from [10.224.243.56] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed5538basm3981439f8f.44.2026.11.04.06.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 06:30:31 -0800 (PST)
Message-ID: <330c1fba-c36e-4b4c-850e-f18d4a2f5e7d@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 15:30:28 +0100
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio-gpu: Allow num_scanouts = 0 for headless mode
To: Dorinda Bassey <dbassey@redhat.com>, virtio-comment@lists.linux.dev
Cc: sgarzare@redhat.com, aesteve@redhat.com, slp@redhat.com
References: <20261103110623.328004-1-dbassey@redhat.com>
Content-Language: en-US
From: Matti Moell <matti.moell@oss.qualcomm.com>
In-Reply-To: <20261103110623.328004-1-dbassey@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb418b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=tWSsyOAbyfL3HvoN-E8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: 0wumzfiW6wT5LgA30lcV_WoMC6KiUR5l
X-Proofpoint-GUID: 0wumzfiW6wT5LgA30lcV_WoMC6KiUR5l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NyBTYWx0ZWRfX8f12GfMeX1pu
 bw3PsRuYsq0F/r4rHutWqSodOWZDPsk1IlPaf84oN/Ab1QUbOtaPOux5ft+OEgc/amIDMHVuyKa
 ze9PlmenDh0cAn/JDFriytqKzBUrwJtEqG3WxBlIG13EGm6fwMQGA88nsly2LrD4NRRgjFKlS+l
 rlpLkDYUe1/dkF5eImV22cA1wWAH08NLbZJghsaA7oAKOhcpnYf/5p7AvqfRN5PACEjreX60Sks
 89AQ34+/6Vlf9dtQtMKhs9amZjz9qqjH52MYdTAZnB5+JyLzXadTZMKXG5LPIbOHy32O7aU6J83
 hamcde/VfYCw6HW4rI5vLpIIOVsMvXKxVQPBMG/psIMEcluo6aBIUuVwThVwnwFdotbFxAAl9Lt
 4Z9am7bvYZNfE0oF9bge0aNiAh2p3XcqdvfvCrYqXyPxxRZuf0XmnxcHPJHWu7uvahhgQTJmBm0
 x1mZYAfnjdz4IsDFoOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NyBTYWx0ZWRfXwVmjjBhoCg3m
 pYKzd4/caix1sTisvKM13l2+E79/mxA4IZK/8/F5bMoojeNxZFAR6bleBgAUIFUP6/wusgVsuVs
 0uO44Lc7t5Shq8VVgtwgAjbGk0F/GFI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1011
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040057

On 03/11/2026 12:06, Dorinda Bassey wrote:
> The specification currently requires num_scanouts minimum value
> of 1, but the Linux kernel has supported num_scanouts = 0 since
> commit 72122c69d71784 ("drm/virtio: Add option to disable KMS
> support", 2023) for headless GPU compute workloads.
> 
> Update Section 5.7.4.1 to allow minimum value 0, aligning the
> specification with existing kernel behavior.
> 
> Signed-off-by: Dorinda Bassey <dbassey@redhat.com>

Reviewed-by: Matti Möll <matti.moell@oss.qualcomm.com>

I think CrOS actually used to use this. A much welcome change.
