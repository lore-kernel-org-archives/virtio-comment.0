Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942658;
	b=xo2nCFaZ+bicbONAJY15zY4a0MOTEDD3KlqArtOR+5fk+UnWdrAh/wSrqYtHASPPqfI6
	 FawvIRd+61VcTA+POGy3zRDGOGp4eVJiVTt0SoulOgnYKIxGI/fxtHi3g1sidmQMEbZGS
	 /sCwkTuTv5d8p0PPDTnT3I+Lz1idbSBlrPmAtObEO2yVc0oIQUmzGHclNKTDj8qkqgvzx
	 bXZGcHHON952YGOpytecaKbK2PpsSE73rMKWu3ike1Ri0jTKewZisDeHCRrWFHjMJIlfN
	 umTCS6YeqP6of8UPiwQ/zKTZz5/p1pn9NK0MpypRlFVaaM3eaPLZ95PNgJH/pQsnl+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942658;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CfVc326FgN6aqRzBFX4K3ogakW22Gf2ENNMDxCe2lOw=;
	b=v6yna16v0Mr11JSyNI/0bOSiUEcZ2APlQu9y4Bg0bFAgdBRkGTfhm6lAnW7MK2JG9fV9
	 qf7kn8BSH7h7oIf/oqRZ1Ji1EfROg4O9DGnNrI18uypTKaP4bVbWmGDuEB7Ed57NXDYcY
	 X0MTbANqGCkvUDe9ZoWKeothgkOK3hPhBTNPpJzovQjClchgPIsJVQF8fatT2MWKWN+/O
	 FsOWoJm2qurdnZom1l0Av4upzckpnohUHrHVbGTRVFTccQIPI/ub5WXu34GV4we6uLcAR
	 GYjoQ0mA9k/Ric86AUcyPHisYd1wPyWqR25nxOua8Id1ZOZMqzrifc6ROiKS1updGJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A19tirZU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AHahkR5D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9CD606A88B
	for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 19:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E9CD606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A19tirZU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AHahkR5D
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ6Lnl2160810
	for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 19:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CfVc326FgN6aqRzBFX4K3ogakW22Gf2ENNMDxCe2lOw=; b=A19tirZUFPDblncN
	gsgl2EepWTTVqXODALIBxxQa34WjPD46zzzXRNa8q27QKfmK2SeQ1IF+xUMf5VmZ
	1FggfpAFnMS0dN+bM57esEQWGr6x+j2HWtc8C4aqyMoTZ/jFS3b64DYeaoIt9DzN
	L7WX94YbuYyS5zxOwDVhhMyYzgTV4CdOa7bzA0g/MGFr5yIzn4+6w/3TjXUQ+nwR
	DofqpxOj9MPyITymirOaXzc1NRBeXmv+TXRO2BpwZxeYYdiwBqdGTNaFEoHYaWhA
	clGxMUyl5GbixyozR1l7lr+IxAaQIflJWVm6DGfNfd7kDmge9fNeTZbrfhnHT/YV
	+jN3UQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kccapgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 19:10:56 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2d1f86515so1907137.3
        for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 11:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794942656; x=1795547456; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CfVc326FgN6aqRzBFX4K3ogakW22Gf2ENNMDxCe2lOw=;
        b=AHahkR5DiBVEg6vlh+PqsxkEieB7NjkbM/kN6F72WO1Zi4kxW4AxufaAtnpkSbiNE/
         zrXeQR9/ctBv1+agYdiQL2Umwk0hblf29TU66ZX4m+VzaoHB41lFsMR2uIdoLQ0899uA
         /0nFvnQf+dX4XX6ZIE6q+kAdtMOb3oa1HM8pqUhuUHgvDKuJiIpr4jpHwIXh185Ah4Mo
         WPQ86ooUDLsiFx9BjL66Fp+DrMlvA2rrjfesbUQeGuPAUKg0tB7brzQHL1xCjQQtXuzF
         wxS2ihXxran0xHy3YDc44Q2du+VI3BS3wiBZ8pg7HH4JpAiWUzhgECmPf40GQc5k+rhi
         09Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942656; x=1795547456;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CfVc326FgN6aqRzBFX4K3ogakW22Gf2ENNMDxCe2lOw=;
        b=RPy9erNTjSq/kswP55H6GoEi4C8Kzp3lXu8eES0SGjTqD2IQ7Q7V6VqCpLE+k42u2E
         Ytr1WjXbJtPXyAgnhMJYfXPaLSXDtvNsgS6FP++eL2LOlDHC9/i29VFQxLTBVu9iJTf3
         2ccAUQTBsLwcdBiDkBJNm2Ldp0CLI70fcumRmS/bgSNWibeFqAcJfhV6fxIxgn/V/n4P
         1gfOFlB4TJisnh1nWo0/tubIcZ+BmdLMu9qxvmmVPUXF2FEcr8GYAAe+R+DwpEjF4ZfY
         1yC349ZZkrvsWGMcEtEIWC2C1/HPWxcI6+PjmTv1qmy6EnQ06KJhfhGbcZw+5tyuubHT
         Gj9Q==
X-Forwarded-Encrypted: i=1; AL+hErG6iaNr2TVYTkJcgRYbre6C0qaGEEuyLIxkoBdbSUPHrmgydCWgU3APVHFgW0fY+9HvNCvpjSuNZy8YGk6ONA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/l5/qbVO14QZrpU+VRVwHGjF19Cs3NSlWqXnzoM4gpDXGZ2tkI
	R+kngv44n6oSO0KV4qGNKo7K/G7hCnNiOXRlSisVvmeMwnXXwO1qGaElgMSLUYYYyh44/Z2OT8I
	Nu6jkDmDBmdy2DKEsNvyoaUEtRxdm1oIbkJujDFU7kmeu0aT6kgduLiiIp7v6cH+Vn80pDdEmpv
	Bxvg==
X-Gm-Gg: AYBFou0exzwvZC+pg38pgZaL2StdDNceZw+1SmSTc/jotdOlFDVnOhWg5aSZujgs7a8
	6Xswvzesmg/ddPpGEE3w9dEPEZHmL0553t0Sz+d+5kZlxGsU280OFNygXWEFSjEZ41j5OZUvbDW
	Qp18rWBeFEav+Xw09Aww8M4sg9g2fggNCANUnOGKmMDTI+GpqONfAexPxwqlacMJ92PZDELqwzc
	kWgW3rjQHa2h81PLMpqmMZGeX4NuDmZjX+aw6oBpWyBKXnvwI24DQPxk61yRbpGb5LrdgWuOYRH
	/VKOQKo6tzNenBKAFcE2xePs/QoK92WIstxDyXLrOzi9AEZGFJZ6mMk2lXh2mRVfRTX/ocANX+T
	HK88JIQUXjY2fp2JYmx569O0R4V7JxqtOTWETMucM9P065mEt58QxMiXsDQIlfYNKWokL472Msy
	Jo
X-Received: by 2002:a05:6122:6017:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ee646d158amr478697e0c.3.1794942656260;
        Tue, 17 Nov 2026 11:10:56 -0800 (PST)
X-Received: by 2002:a05:6122:6017:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ee646d158amr478672e0c.3.1794942655808;
        Tue, 17 Nov 2026 11:10:55 -0800 (PST)
Received: from [10.224.243.56] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573baaaasm356004f8f.58.2026.11.17.11.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:10:54 -0800 (PST)
Message-ID: <12e122bb-fd42-492b-b475-70569510cb24@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 20:10:53 +0100
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
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Hilber <peter.hilber@oss.qualcomm.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Demi Marie Obenour
 <demiobenour@gmail.com>,
        Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>
References: <20261022115837-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB68066B4C6D821EF792DAA220DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022122727-mutt-send-email-mst@kernel.org>
 <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
 <CAAjaMXbFY8d_H6YJSbb+2ycx-Bh7wBym0UpCy2Z4XsftkhQSzA@mail.gmail.com>
 <fe70886a-b119-4302-b35d-f99dfab4b018@gmail.com>
 <rltfxbrlfrqixbuevqknfake6hmcs62vjwgpk66tzvyswvfuej@6imyqn2npcby>
 <875wyo3557.fsf@redhat.com>
 <mkmnrjrkzjg6gdh4u3l6lib7ggovl7oiqwki76pkdboue2szdi@lhpg3ik33w7y>
 <4222d5ec-e44f-46a1-8a14-a2f3fb6d84d1@oss.qualcomm.com>
 <20261104094014-mutt-send-email-mst@kernel.org>
 <ce7dc70a-13d0-4c8b-9b0c-b46e9a0af54d@oss.qualcomm.com>
 <SJ0PR12MB6806CFA20D1EBF3DDD4AD8B0DC7B2@SJ0PR12MB6806.namprd12.prod.outlook.com>
Content-Language: en-US
From: Matti Moell <matti.moell@oss.qualcomm.com>
In-Reply-To: <SJ0PR12MB6806CFA20D1EBF3DDD4AD8B0DC7B2@SJ0PR12MB6806.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfX0dgHixyXe8IE
 Lb+s/6QXlcV373zG3ooP0ZyzHNPFF7v4/Z0wzuXPeFns57Q4TuokG/YRu98P2s5sP7IUQep0Lru
 q9DvwYocxY9uiIv9SVFmdkjGqkmTbBc=
X-Proofpoint-ORIG-GUID: hxWKCeR1six-83QYUiT4I-UfUvx03hY6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfX9VmFbrqWDU1w
 vz+dUgf9NPOPWGrHJXQjRlZ5tWIXGOExdkxZpHaz9ae+wnCGNVj0kWsZqCqNAV47lF4FjDYEmer
 GXRP1wfZ+UEB9x0Mhnk8a9t4AOedKPlscL+RiG3pPJVihkdCvi+uvlcvmq4MIfXuxnTkYMdiCX1
 G0kVyiG/Hx1B7x5RyBdRzpXaXV+3FJtfmIAvVVQL9CJZ/N+R+igrf1vlPitTykZuEIZ3wEsmPCh
 BkesyjVHSOVc8K7ib1IiGSyv8tBLkhztxYDRSmFm/dYGEjD/+GL1Ngza8qidLkwSVnFIwuZV1Q8
 Lx9axej0GgX6ooKJIJgyy4ElrPaSdS3KBizP9DTHdFw3Hou9XFbKIXI3zmyWUwDTR/wejYj7XIL
 a+N0R+ZOTd87ZOm0XZxfbdZvzYTaFTBxs28WI7fejkpk0xxAsIHQ6h8zWu27xVzTGFKbaOf/cP3
 refzQkM9ypd1S5/T1nA==
X-Proofpoint-GUID: hxWKCeR1six-83QYUiT4I-UfUvx03hY6
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afca6c0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gMERNU6qP3YnGLNLGlwA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170076



On 17/11/2026 19:41, Parav Pandit wrote:
> 
>> From: Matti Moell <matti.moell@oss.qualcomm.com>
>> Sent: 18 November 2026 12:00 AM
> 
>> On 04/11/2026 15:46, Michael S. Tsirkin wrote:
>>>
>>> Ugh. Let's keep it simple. Reserve ID 52 as vendor specific, qualcom
>>> can do what qualcom wants with a qualcom subsystem vendor id,
>>> or just you know, use its own device/vendor ID.
>>>
>>
>> Just for clarification, so you'd be fine with reserving ID 52 as
>> "Qualcomm Subsystem"?
>>
> for me at least it is bit absurd to transport non virtio messages using virtio transport.
> it does not make any sense in virtio specification.

I don't disagree. But I also don't want anything to use an ID that isn't 
actually reserved and create massive-headaches later.
