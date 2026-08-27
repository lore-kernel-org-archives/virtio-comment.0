Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9E33EEAD7
	for <virtio-comment@lists.linux.dev>; Thu, 27 Aug 2026 16:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847479; cv=none; b=ZKtRQemT+5aGEmXY2+Qi6rFYgjpSi4UkLsxLRboD+3wqKI+NCBfIp5f82QmtuO9Xm03+qONwuezWYNm1AO70+oE/+BxK5sVNIznMSHPETtkzglEOko5FKUCEbF7jgPavo99IwmZChMFmHr6mJZ0TAc+7STQa93Qwih5yYGNBAkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847479; c=relaxed/simple;
	bh=S8ZJVOMvKwRp+PsZ/hcxuq18bgHeZ61LWNft+jPx/rU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8Ch5tYtPMAu3D3xqbr6J9mhwUrtGpSWGT8wVhV3BI4qSsz9c8EI53+n4+HxtGtfNToMr5Zp27cy8jnzN157DX2CtGzWeu8Ge2edBbbRDEIR0Nd2/BW5eTbhQMIeSNzeDln6gPDJ8xLlDC0Q5asviR0JBKVSKImAnTqqJsbcoy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fZYUz8Sc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hk7zaTLf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fZYUz8Sc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hk7zaTLf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFc4Uw297492
	for <virtio-comment@lists.linux.dev>; Thu, 27 Aug 2026 16:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N0kmeBrwaIba2L/4XJwaX7/r
	xv6rNNvenO+VLalrB1A=; b=fZYUz8ScLuSvzvNtaP8uo4OSR5qK8nuQu4U0nYJ/
	ioNAwsf5FEbWNueVGf8SneYwRUcmNQa95TADFCPW9Cok5ia8vkL79kRmWuKtLNgY
	OvuyOwFjNy8SPkx+Fv9Alt7quwoi+EA++Y02jUtzBDN/aIVXsu7sHojue9rvaYuL
	kCpMxXBd+Wn4lzvdeeqPtat8d/tj9teJe99kS12q4ecNCzm2ecKWWTJ2ZPVEJKR7
	UiVld3yrj2d+hVZZvis3qsaIlaMjWHp25tPi5MAggbPrRyW9f8VpipOOYbMiOOO8
	pwn8rtn6mkBS7wpFtBVg3W42Qw461jjAPvapJeoLVLej/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gam6fh5es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Thu, 27 Aug 2026 16:17:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9382f9430deso2955185a.1
        for <virtio-comment@lists.linux.dev>; Thu, 27 Aug 2026 09:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787847477; x=1788452277; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N0kmeBrwaIba2L/4XJwaX7/rxv6rNNvenO+VLalrB1A=;
        b=Hk7zaTLfoml9lpZayKT2Tnw0sjkCQqD9uPh+KOY9FZXQKTgaA6L+YMNz5uc1IW8pJf
         4v2oH2Ni7GYQ9HtPhdutuyJMftRvWwBNJyFTnMO4DDc09kmsOgdTmUpaiLjcFndvdJkJ
         L1cYFTGx4wAawKZC9kf1ms2DddTTPqOjN8avEZe6RY6Y13WuWP8rc0Nl414HYlhchwOS
         XfCeeXfBczbBf+UUOi9aZyAx1tZk3Wcea0VUlQM0W0ZlZl9rwnh1u7/6xbW9PJ5ZvIyb
         BqxYw9hunCaLhaRLBxM/ExcCSM/MBPNT/G6HyXWBVJWKz9S6vCSmgXryEjZxCxSiO9A5
         aoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787847477; x=1788452277;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0kmeBrwaIba2L/4XJwaX7/rxv6rNNvenO+VLalrB1A=;
        b=RLIiVYYssqBzbaCYQhAGAstnu/Ew+PevsfnBKbJzx297LabSDPBfncaPy/gz6oLw6y
         NQ5bMOnKcu3pyt+ED0AMQXJZ65dy62uJdVq1DV76IrsHhHwlTuj68UHl4BWVFRQcGOJ4
         nG6DST9vhlMEYwxRphPvMJIXB/hgKxGPshna3aCzQF3fVVAejX+OQP5Y58KjbimKMTgi
         QRvp/1ql6+FM+7/gn7tONurui3zrXfOerL2UVmvU4gipyxRBLBAM8IUBrr8eHoYRyO7W
         L2XEJSuQ0E2N6OpTwUeIXJLPJi+tKwRV/ydnRNlFlNO5abTxNBXPaV3i2dfQ/2ryw118
         Cfgw==
X-Gm-Message-State: AFuF++ll5xEBymCqElgmOX3jLfdNcXT2O0SGXg+J/e16MTXOerkq25R3
	EjwlifcLRW9mozcboIRnxY149WC/39vH8CurvcGUutRM7jVtrVUqBL0VMdSvNTxfCdogUvVf3ny
	Tw1Az+jw8ScAGRY18S3dIG6UurncV7CTM35XaH4Xa9H3xMsBkr40TCwmLfCYrblnYUYrSaQ==
X-Gm-Gg: AR+sD113eE+ijnUW6WQFjPvs9foSLAd5RFYjiBYmOnprlWw/LdceXQYSHFgXljq0yMz
	YRHDRMlLBtBLvnGnpq7RIG30wibVkwmd4egU8XaVjwkM/WdomgpA12l1MdJk8VumhfZXHitjjW3
	14GCjjT+EYIb05auX/6sYN0CtAo1t9bWNlEAN9zUz7+IfGdtGquYr5QrzdPkZ21cHSbb1jCV5bR
	gmqgl5GCE52CURIE50yArUBv32fJszH3pGn3uVAuaEug8ESVn6R1Bclw+o4fa9ROgl70kdX+w2D
	6APR/PoCg7WXIDTnY9o1ldnL5qzDFTX7Th2hNhFUqcAH4oj4cXaiIRI6UPpuYSGQGeg4MmpamyL
	3wJzWlK+HdVYTDMZNwcZruS+7DSKhx/KwEww=
X-Received: by 2002:a05:620a:2603:b0:938:e95e:9377 with SMTP id af79cd13be357-938e95e96d0mr1271893685a.30.1787847476623;
        Thu, 27 Aug 2026 09:17:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2603:b0:938:e95e:9377 with SMTP id af79cd13be357-938e95e96d0mr1271840985a.30.1787847474323;
        Thu, 27 Aug 2026 09:17:54 -0700 (PDT)
Received: from QCOM-LDTZRie9bq.na.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f25d4sm9782616f8f.30.2026.08.27.09.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:17:53 -0700 (PDT)
Date: Thu, 27 Aug 2026 18:17:51 +0200
From: Peter Hilber <peter.hilber@oss.qualcomm.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: virtio-comment@lists.linux.dev, Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH] content: Reserve ID 52 for Snapdragon device
Message-ID: <cptr5hczrpslq7wtrbd2pfbz247k2e3b6rvali2foaueeanymr@n6xtsyl4lq6m>
References: <20260826115504.1955-1-peter.hilber@oss.qualcomm.com>
 <1982f2c0-9dad-43b2-94ce-31d03d6a36e5@siemens.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1982f2c0-9dad-43b2-94ce-31d03d6a36e5@siemens.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEzNyBTYWx0ZWRfX/KJ5rSMiLhGv
 iiUYFdUen4oLqYdjUmIJ4bISJNkMqQdkBfkg/T9GJCxmxdopuNXE1MtaleZsf8LA/NGvUxt40JN
 OebaOxksSvi0bZWi1D8BssSxyWMfbIg=
X-Proofpoint-GUID: O3uuLwfeZ9rLLHX8vH2X-P9R84Je7W_h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEzNyBTYWx0ZWRfX1L2EqY9qX+V4
 6+cAFYNxtGG60V8rLSkvW4lGwiVKXY21OXZJMuUs2LRfwJUT8cO3PUdMYYSMqqdhZJs0mg7E4a9
 rtoXw9L85a9oPGQeWiaJWjdgmutw8i33UZyCVekUyZL/cX1WZYXPuTsqwDfguHHX5NkDSMMOyDZ
 mzQ2ebT+uZ3HNDxYKEOhY8KQM/+GlHn23bR70KxMwLlw2D1lRNL9Ue+xB4NBUwRScg2FsgTCQ4w
 rmsVq7xji2f0fiPcB65zWYEtSxOH4h4vu00qXPYZdzcptTmACu5clAFqz23iqNFTLlnbXnNtpx8
 /qIs39PKbRb3ICjJ+zfmMViWqyrr4nLlv7vuWTXHEaEpj4pbiopNtiTwAZTv+e8Ay8KWPCRO2RO
 SLDoRIDyPV9SwvWqgkkgnTIOXHckis0Q/zTzxRsTZ6g29QMw2TqI6HiQVVs8Qy+LgfUXhLrbhcz
 VtAtc9OPpjaKUIqJ1tg==
X-Authority-Analysis: v=2.4 cv=eIgjSnp1 c=1 sm=1 tr=0 ts=6a906335 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GCRp6uo6Z4V4cL1JMzsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: O3uuLwfeZ9rLLHX8vH2X-P9R84Je7W_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270137

On Wed, Aug 26, 2026 at 05:31:54PM +0200, Jan Kiszka wrote:
> On 26.08.26 13:55, Peter Hilber wrote:
> > Reserve a device ID for the Snapdragon device.  A Virtio Snapdragon
> > device exposes functionality across Snapdragon SoC subsystems through a
> > common Virtio-based protocol.
> > 
> 
> Virtio is supposed to provide generic hardware models, not so much a
> channel to expose concrete, physical chip IP over it. This looks very
> weird to me.

The Snapdragon device is not planned to undergo standardization, so it
should be acceptable as argued by Stefan.  Qualcomm has some Linux
kernel Virtio drivers which are intended for upstreaming, and as such
need a reserved device ID.

> 
> Also, isn't Snapdragon a protected brand by Qualcomm? Would it even
> legally be fine use it in the spec?

This use of the Snapdragon name in the Virtio specification has been
approved on the Qualcomm side.

> 
> > Device ID 51 is already reserved for the Virtio HAB device:
> > 
> > https://lore.kernel.org/virtio-comment/20260702140939.3535968-1-zeloren@qti.qualcomm.com/
> > 
> 
> I think I even voted for this, but likely without checking back what
> this may become. I was expecting (hoping?) for a generic, portable inter
> VM channel using shared memory. I hope HAB can be that as well - besides
> enabling some very Qualcomm-specific and unportable pass-through of
> accelerators or so.
> 
> Does a "Snapdragon device" have any relation to / dependency on HAB, or
> is this just the ID collision why it is mentioned here?

I mentioned it only because the HAB device ID patch has not been merged
yet.  The Snapdragon device is not related to the HAB device, which aims
for standardization.

Thank you for your feedback, and thank you to Stefan as well! 

Peter

> 
> Jan
> 
> -- 
> Siemens AG, Foundational Technologies
> Linux Expert Center
