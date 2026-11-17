Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794955944;
	b=D/DCPWPtzXENZLNvWUK1o4IUxc9tN+QZw+Hc1f8m7N4GcekJy/k7O0F7mXZQ8m30q/xD
	 Axm5MTNF+2mAEyUUaEIg971bzfMV80zHUPvpaFnvxUcpiu9/tsI2lgu3zd5cGuyatIR1H
	 6C2CtdhdA+8bJU7RggSjAEbCvC/yKFJglEbzyzsd8HlrZ4mHb6B8HZ11xPwgODJlVRiK1
	 rcuKfBXjWO3BePRGW6n4Vxd8zmdoFMiHp2XpPWEAuSqAtHLS3a68k2b7boCQTiMAocEIh
	 ow61F6GVikIwWYCRrDGdzSScCY+/y1IlCfEejft3QN0upNDG0+bvPocGiVlv79Uzdag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955944;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZxB0daiOuQ+eLjPWk3uOW6wMD9dI4KG5Pk0/E3yNow0=;
	b=rb8p6L2wPM6D6+yqXMbQj5DBT7gpt8s3iVgKIUiOXBAj12x+XPem+iIWnfzAnJnlKn17
	 5uilsTVdKubGINt4JlxQorD6MY2xYnbY5NEddOcHEZtcmaI/fUTjtp+tSuYs7Ns256YfH
	 GRK1wkuSDSpMNLlQCob9SEY0zoZfyAR8OQpqMygk354sDm6/mdAHPJaz/1s3k7gxCufMT
	 5M67fzyWSmmbZLI02PfihOiUKOaX4aoQOPldM8nw5RfbCg67i74BMsjczuC+ZdDxnjNQH
	 YLjG5xK39ktC2LfVrdlpqtUfUAG0bMiNsvcVbVJy9Flj77+c1BCXAWfc1McZrlOn05Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FOsWIH0v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=id0Tlckk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECAF606A32C
	for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 22:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ECAF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FOsWIH0v;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=id0Tlckk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMeqoG1464782
	for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 22:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZxB0daiOuQ+eLjPWk3uOW6wM
	D9dI4KG5Pk0/E3yNow0=; b=FOsWIH0vT77zXRVSZBs0DuEkL7mv/fJl+uwsi07J
	Kx40WOvbQ0dcdL2LnXhmSXY5vXwZ6oO61y5ctKbsF7phudhfaPocpujOi6ckUaCo
	8x9WeJQ4cGmxVjjlxNa4Awa0NDQ4Ew6OvwlR9q7YuZyXfe4zROkan/yftbTNvQOX
	uEpetJ2at7X65sCKdD/kW3Edsz9zMxP6D5Zfx4I1qTxZhtyina8JIBWuaBCcP/Eo
	eYsYBYwds2sOiM0BD2HdGulcgnrSHTJy94SomX9lmKnQ7o5tsZZCAekNL5x5wszc
	oagwunHseFmUncFW9XRIVOEw8ww7lGjuKIF6tSIRW2HigQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9g1wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 22:52:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b8cef34b43so321543b3a.2
        for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 14:52:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794955942; cv=none;
        d=google.com; s=arc-20260327;
        b=imlk0h6sdj6q5LcdYe1+oF2GOT9GzPNInXjp0kZJgbmdmdJz+4l2D1OMvzgYQq9ifW
         KoMK2W8sb3PSqFJ0DoYCTPFcijqbukIgvKT6yqQJCqbBIDIgKr/8M+ILgxtAzci/6Yj2
         maQVJmYsMeJ2O404UZqUxcWbTB8h9L7N6q/tchszGz1HMMYMH0Wv5mpFrO3G23t4HQrd
         5jl/LfiZaWPJYsgoK2KphPhBQcV9V+bLmb7IgpG1ednrgXrfBdKWuSDe6HyfPrnK12xk
         fqWOm2EJJ8iSDrpKS/eehrbTqsCj5c9E28YzKa6EuKsbnQMamYzgNZ4Ksi6QlW6IBkgu
         R8sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZxB0daiOuQ+eLjPWk3uOW6wMD9dI4KG5Pk0/E3yNow0=;
        fh=O4F5aS5OrNQVWkGbt0xc/KqKkG3h8ns+Vz1Efj/OuOo=;
        b=s7gsmySApbXI2qU740pXM/v2O9SM0DWHLosQG4/CBdzu47xWkYa4QMPu/5wQyhSALS
         CwkQArEDHvuA0peocUWqSDp+LFTnOGqoBWOLNkAjpYopLHkKS4vjJh0iRT+ct7fCH3xl
         R1q4Rm443XPyJOm90/SF/hm1/+srYDa1yJg69cQdJHUNh8o7hTpFoAM1VWckM55jco5K
         71IbJNa/uorUpLz4wCSiZ5aGPFDdVyk2A9U/uC1a89trkMvE/hqFsbeS/5E9+wtSHxEg
         NmzAR7/8wsccOeRTLOZRd78A3tGPUUpqaCLemzkantLk4gobuLnjpy5FqW86OosADoMo
         K2Ww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794955942; x=1795560742; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZxB0daiOuQ+eLjPWk3uOW6wMD9dI4KG5Pk0/E3yNow0=;
        b=id0TlckkKK1gjdDB12KM2CmTcSf4yu8XwL8Dnxh7Xpy4JnIFFTM3MUdZ/CjLBqhQJA
         2fKeLsBPCxDqLfI2YiyPZq/vwTKafT/B7a2TNiTgC2qZmD0H8dRfDeCeX0dZSajp/Tn0
         G2Cn2PshAixvKwfrIse0XyfhJjwSsvBbvUdbaDf1qvatYBgm7Ev3cV5OAyAjWVqwkYPE
         8d4XuxaxJ3sAfmTvP7DjWEWYZhgIv8ic7esyuAdUJVG/1LBCSOlzP917BtGr1F0Vwoui
         23BK17Bn61a4I7FdxmE+MI2B7jVMukAX+rC6BbNvvS2y76X2Q3hJtwHZixdTge5gmfd9
         /m4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955942; x=1795560742;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZxB0daiOuQ+eLjPWk3uOW6wMD9dI4KG5Pk0/E3yNow0=;
        b=RWvJAFsnpn8N0n2NL9Piz4kWfcj8jASU+7/I5fO4kKytcDdhSBnysxMoWJLnck3nKg
         aswMbBPc7nHICaLd1uSa2ZVyHWN4DbNSOOqxMdbBoL2daTl4qsu8E3Q0UATGVLFNN6mj
         CHNqGGYwIyYKyRzu2GDPHbTlnh+qGHBu42XJg2AkNQYfkz7MXc+ZsKCdZzlHiYGC4GX1
         jPqnj/Qczz8uhFtNN1k4MfxoKOnAHnotS7OEsKppcKMLj8KLgfOTANDApiyQnm6qe7Hb
         pKHZ8KPFFqiOKBr4Ks3OmoDShrK5kHCS5k0G5P3rz6BMw84KCDMp4NgVPV1OYxH+iwlM
         uK7w==
X-Forwarded-Encrypted: i=1; AL+hErHDKeOs65cl8320Mrxj/gbHXxTAeGnLPqEZuRm7yaljjuhfx8vMItmcm+Gxgj1G1gtIJzuxiSjvujZl/NJBZw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8w1+05wJMlvvzQRXvHmks9i4trF5FPvAY4tigqKrEwqu+/rSC3
	+PijbG5EAYpOHAMeNvUrAumJQIKP0VELnE9acAoiNxhRqluhal6dDGE4oXgwgoHOMTxH11ontAo
	QzqsmPt2szGlOLrdSdElB4LGxL7qnntJY0FtFRVyHQf4vPKhD5KxxfDnnE+ceDeFUUCILz/AJ5B
	03LXRiIq3TW0ztU44Zpspb+vRvOryGKxsZfCr8275Tr0k6
X-Gm-Gg: AYBFou0f0TTy59lgNgY2djj79j4CT+Smi6PnWuue6u9d9ciQw9HXJdz7vLaMI90AUNF
	mfKE9K6i+4jPOH0/ebzFaf/hY8Ux8TZtvViQ8bur+3b9tEsghOVCc6exKDSONy8D+RrK/NRBqB4
	WlextQMApumeJspfoEU76CtdMPIcXDCVPkmvvcp8sF0XIFVF4kgpgXEaqL
X-Received: by 2002:a05:6a00:138a:b0:891:1caa:3f72 with SMTP id d2e1a72fcca58-8c5d52a6561mr469068b3a.57.1794955942109;
        Tue, 17 Nov 2026 14:52:22 -0800 (PST)
X-Received: by 2002:a05:6a00:138a:b0:891:1caa:3f72 with SMTP id
 d2e1a72fcca58-8c5d52a6561mr469044b3a.57.1794955941590; Tue, 17 Nov 2026
 14:52:21 -0800 (PST)
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261022115837-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB68066B4C6D821EF792DAA220DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022122727-mutt-send-email-mst@kernel.org> <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
 <CAAjaMXbFY8d_H6YJSbb+2ycx-Bh7wBym0UpCy2Z4XsftkhQSzA@mail.gmail.com>
 <fe70886a-b119-4302-b35d-f99dfab4b018@gmail.com> <rltfxbrlfrqixbuevqknfake6hmcs62vjwgpk66tzvyswvfuej@6imyqn2npcby>
 <875wyo3557.fsf@redhat.com> <mkmnrjrkzjg6gdh4u3l6lib7ggovl7oiqwki76pkdboue2szdi@lhpg3ik33w7y>
 <4222d5ec-e44f-46a1-8a14-a2f3fb6d84d1@oss.qualcomm.com> <20261104094014-mutt-send-email-mst@kernel.org>
 <ce7dc70a-13d0-4c8b-9b0c-b46e9a0af54d@oss.qualcomm.com>
In-Reply-To: <ce7dc70a-13d0-4c8b-9b0c-b46e9a0af54d@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 23:52:10 +0100
X-Gm-Features: Aa3M54o82Y8bhSTwdDBPMqcGksW95r4vRqU4ugwut0ttAZw6kcBBjT9w7t0RhHI
Message-ID: <CAO9ioeWo8b9CaFHiE7Q7kAeYtkaq_gXZ1+_BGnNFHUF_EfBx7g@mail.gmail.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
To: Matti Moell <matti.moell@oss.qualcomm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
        Peter Hilber <peter.hilber@oss.qualcomm.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afcdaa6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=zTExP_ce8ZWLgA3iUEcA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: ckMQ95nd3fDQT7ztYDYbGR7ufkINz2Rl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX3ihSbzxvA0l3
 rsyZ39pkFqFLiQer1L2Pk3SpZvyi+eCzrSWjyeTHBFngCQK4ZaBCHGIz+SKoxEXpGSdEbNv6npP
 v4z0kmQZDgomwceKPO+a8s9m1YdzvTZd5oSTVvnLZJnse9op3Wn657jwZuW+x1JO615+XfWmQUu
 mf1Q5E8O2wn17oPRFb/sb1T9ZH3dPmXnnzxQWTSUxRgo/k/w3PpWPXXlSVwAdBgZTZB/tV7ps46
 aTbEnXK7io7si5N28CQjOc8mqCPxA5ZkUK6EB5yDq3YS9rKRBiXEdkFgX2tb4KkCaxjEbnnJhZR
 hB9/75F3Yl3qwNq31JhTIfycbeof45BCAcFRHB6HtZv9S4I/E65RpCcIzkGNswrLT1/uWIb7chI
 4JcJlB9Ff2llrmi38a1bE8l4H0oVy1Em23oa8INj4mJsG3OEQFimGBnHaqwqSG8MN9vj1vYkboh
 /HHJZs0ktyvPlzXfsJQ==
X-Proofpoint-GUID: ckMQ95nd3fDQT7ztYDYbGR7ufkINz2Rl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX4OsPSmT80Tm3
 2lmom76E+Mdug6qcCOTQICfAgRUsRGIlILYC7ULFgQoRyBkZLfzBtrlrhZ5xXv1dl6ubwxBqkbm
 Q6Brg72NpFGoBNuySGYy9hTIgYHUth0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170091

On Tue, 17 Nov 2026 at 19:30, Matti Moell <matti.moell@oss.qualcomm.com> wrote:
>
>
> On 04/11/2026 15:46, Michael S. Tsirkin wrote:
> >
> > Ugh. Let's keep it simple. Reserve ID 52 as vendor specific, qualcom
> > can do what qualcom wants with a qualcom subsystem vendor id,
> > or just you know, use its own device/vendor ID.
> >
>
> Just for clarification, so you'd be fine with reserving ID 52 as
> "Qualcomm Subsystem"?

I think the agreement was to define it for vendor-specific devices,
further using other means (like UUID) to identify the particular
device.

>
>
> >>
> >> On another note. We are here because there just aren't enough device IDs
> >> available
> >
> > Nope, I don't think we want to go too far to accomodate devices with no
> > plans to be part of the virtio spec. That's why we are here,
> > the lack of IDs we'll fix.
>
> Got it.
>
> Cheers,
>
>                 Matti



-- 
With best wishes
Dmitry
