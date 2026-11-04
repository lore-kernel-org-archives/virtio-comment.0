Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802845;
	b=y2a0jXfZ5rLgLbA2w7wxTZkYUfkJrqTJWZEvXLB1j35dv4ZHxa0lyVs2yNQSnw1aGIAe
	 AFms4OG1arHOzQtAUEDJatToLCUwBVbikcpBpHBUpETpXNmoV6GC4M1Ay5LQgpZtHqygB
	 QkkYKEkqAE7Pqi9oTa715SPFxA2RAe+U7nUk7LO1+G6kMBhIzENqMjKPx1dNQt6K3CWse
	 2fDTNmc2XJ/AA2t8QdABJgNhALFy0shzrXsaOHJzJHmmlwArkB+VqKz0lpV+AkpIn8Dwg
	 Xa9VpKCUDsHn68F4sBvMGBE95n/2PwmcK6qOl8gAbiXs8c21Hn039p7acXdFW03oPhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802845;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0C7+XybXLBYMOSRzXHwytccmYE0aVi2QrwAKfACuBIs=;
	b=PsSayK4NPhi8RC6VVE9kLrIeZdVP5nfCSnv24x5xXYpMdc7AjGkUleCqay3jVZMM53ql
	 gX5yf26UJRj302aAx49edrsqdCBvVYfu9RJsR5dKDVb861fTNl8nmSPjhvCTxr7ACybVl
	 ziKQ1GVJ4B3tG/JWDVAkOufcYaySzTwmPZbD6vXy/rDx60qHMr9R/EDvj3MwWjs/3MS4k
	 gTvTBMgORQJbzcZHVygmCXQzPH4MSqX9DhmnhfZzxDfoXa965eJPsJRm0YoKTh5chM4qE
	 HquhqSv8T/FNMZZn7U5ppo5v7J2jTQis6d7Hp9HDuQMNCRg5qCWlziW0HyK4Xp4nVRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ADVeR0Xr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UQfyyijN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF75606A31B
	for <virtio-comment@lists.linux.dev>; Wed,  4 Nov 2026 14:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBF75606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ADVeR0Xr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UQfyyijN
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BaOln2310758
	for <virtio-comment@lists.linux.dev>; Wed, 4 Nov 2026 14:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0C7+XybXLBYMOSRzXHwytccmYE0aVi2QrwAKfACuBIs=; b=ADVeR0Xr3yLHNjkd
	yiOBdqXYt0iQejZAE5A0+ul4FtjCSOC7F5BRbvkb+ewpH13DHTpl/Pfo2pSNR5B8
	E3H6ifcE9sX74cCn2iyfgo5JLGIKwR9AM7Sxe6ZwbwSEP1Y+qipAcDTeblngx2Et
	Wze/h66D14kmPKwUyWweo9ZhthIkKJzuPlPpC0NXbF6X9t5vd4tUbLdEXND1VMD1
	pztx0YPAs6Dt52JrHk2BFBjHT56KFhyEi9xsISroDYg7etWkQpr6PzS+R2SgFyut
	fNs5z1TGNZTzyifXQdXMn//Q1kENEnLTHQ/dgD3qXIGp5MQWMU9p14ZCezSGjR48
	SAa1Dg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mv9qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Wed, 04 Nov 2026 14:34:03 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso39144e0c.3
        for <virtio-comment@lists.linux.dev>; Wed, 04 Nov 2026 06:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793802843; x=1794407643; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0C7+XybXLBYMOSRzXHwytccmYE0aVi2QrwAKfACuBIs=;
        b=UQfyyijNHtZxABV60jLeDQtt5U+XHPJ/iSoJ7UAr+U7OtF9uOG0Xo3StlrpBXay9nY
         /0B8cjoJkGwoEH1QAtQ9Gaoxjf0TKAo8gbj+zoOoYF8zZ/l7v48bpQHT9qIqDxNRqV4b
         2o5tXXtsYBp1NuZ78C5x0jbbnv31GPP2p9y8kwxSkpx4XDoR8jE+Vfb1CxQf9C6IdnQE
         ddESWcUvHoRE+SUz/ERDGTNfMkQwF8WkB2n71G033jnTKLu8S+xCC8UntQDgZhWL2e3F
         hSfFqMhkSOZy4JM4bBEiwIEur4qHQ7+J7lxPrZ9zGFgGlRHSvmfRXruhNW+YOtWi0s2Q
         MYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802843; x=1794407643;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0C7+XybXLBYMOSRzXHwytccmYE0aVi2QrwAKfACuBIs=;
        b=1ruwhnZM0bUEe3cd16jutCw0qQP9zZAaMtcYhf6osw19hg4jYK+GpOW9mPe5JQ89Ga
         ANovOjZHuD3Gd9Smthtd6yUiuMAHEU8w546dSz18jAD/SUcp8WWIg+h0XxP/J6USbRNW
         x9P2qQweLy7/U3W0K6PzfhkL+XGwglwzC2LK8qE3/7KG5h7Ag/X4TdfCBetCecnUiVRT
         UA4WlkdgEGuBj5kYtU4V6oP7hWpq/XumcJTaoci73ZheXPdcyP2R3AJEAHX+cwjZpkQY
         O10CSx7YXM5zSCu6w/Bc7djTYBsms9lnb7bZ7h0STphnzpNBiyiia6/byy5w2eJC4GYb
         kT6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxEyZgJaUQcOo3u4KTS9WbMWiIOPWmfLDsS1YLIGM8OzqKFrE3gKFTZA09/IYRBxq2Py2KJzkzUDTewKSGGDw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/ChpwZp5Kw4ykbd24o1EGHHuwJLfPYJO/eex0OIaQ3c3ntmUZa
	pVI+UvAz2IgcMhcWsGJnnDj8ethmrbBn+qQXXWOgZWME0DRl/F4nK/PNG7WAGUyTf55uZdmwaBp
	jnj4l5OkvedlNrGEluTuGGjZy1LNB6JeMKnAsJsHl4yLxdADhPZ+f/9P4bTg5RQg0A1k2pw==
X-Gm-Gg: AYBFou3dXgz8VZCcMEK7p3nro6xV9BSgdueS0IJ2W9m3OUnRnK2hRPX9z842O1oXZhF
	dN6f8mwdOPEtj49KF3N17T63ZLryIRx5tHImTCkyp9N7gs4S1GNN6o/Cmzg+pyoYKcERfAwFOu7
	mLdKkpWuuj/f1aO4MLQ/G4NrWslZqmpWdQPABv5/QGKal4iT+mILBypIBR7tIGTjWciVxCa6ANv
	9MAgVInd44lbOS5ANFn5aRs1hCktbrdyYTX6CLWvsozg91eW0MI1CCeTXVeggruXg6xClUxl6wa
	Xv/2HgX1GawZeI1dh9YChRPIKssV3kg8McQbPCn5HGfLL+ulxQlK+nyl4wWDT4DWZ8sXm4LAvYj
	s1DTnkMga024TnwN/daCFOENm/U4qkeaszGRtyxYSldAU6UuT33BjCWrfb5VKf2ebaJfT4AGv/E
	8=
X-Received: by 2002:a05:6122:8487:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ec6881cab8mr7117728e0c.3.1793802842946;
        Wed, 04 Nov 2026 06:34:02 -0800 (PST)
X-Received: by 2002:a05:6122:8487:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ec6881cab8mr7117695e0c.3.1793802842476;
        Wed, 04 Nov 2026 06:34:02 -0800 (PST)
Received: from [10.224.243.56] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea18104bsm4454718f8f.6.2026.11.04.06.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 06:34:01 -0800 (PST)
Message-ID: <4222d5ec-e44f-46a1-8a14-a2f3fb6d84d1@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 15:34:00 +0100
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
To: Peter Hilber <peter.hilber@oss.qualcomm.com>,
        Cornelia Huck <cohuck@redhat.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>
References: <20261022114028-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806C7432951E2DB6CB3C945DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022115837-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB68066B4C6D821EF792DAA220DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022122727-mutt-send-email-mst@kernel.org>
 <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
 <CAAjaMXbFY8d_H6YJSbb+2ycx-Bh7wBym0UpCy2Z4XsftkhQSzA@mail.gmail.com>
 <fe70886a-b119-4302-b35d-f99dfab4b018@gmail.com>
 <rltfxbrlfrqixbuevqknfake6hmcs62vjwgpk66tzvyswvfuej@6imyqn2npcby>
 <875wyo3557.fsf@redhat.com>
 <mkmnrjrkzjg6gdh4u3l6lib7ggovl7oiqwki76pkdboue2szdi@lhpg3ik33w7y>
Content-Language: en-US
From: Matti Moell <matti.moell@oss.qualcomm.com>
In-Reply-To: <mkmnrjrkzjg6gdh4u3l6lib7ggovl7oiqwki76pkdboue2szdi@lhpg3ik33w7y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EYzDkwe4xQIp1stI7vG3VAcwlJahLNAT
X-Proofpoint-ORIG-GUID: EYzDkwe4xQIp1stI7vG3VAcwlJahLNAT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NyBTYWx0ZWRfX+oGPuCIMzKCU
 uARhTq2DpuySnptEwTJ9OAxaHK0R7xZwA0mHABIhAyAmHCVOPdMRQhMH0C550EvS73Ht1CtVZWM
 mSb6ffb+TlAU7m8UruBpVVQk+k4DFJR6NUwOpgTfq4UTGlORSXE7POU54ZoeGB5hPyKFootqm/D
 2ACWJSSkSzNhqJLnh6WcwtmX6umnPITPbsWNKR83b4Qi4NHN9nlzusVLFmGXZkOTtvkrTnBm38Z
 FKD+shu3gO3BIquLrD1Z6Sxf+of+ud4nnGbhpo+XldwDU1LiNKWQyPJZG1qTNlBySLHw3bPhLUW
 M7rX6Ig3i37k3NmtdpMStKMKcV4jxpmGDhZec33uxDVWsEtY32EfLuPmhPqMpUtjd7uxKzUW6Et
 YzXDOQ8s68slJMKTbHJkwwEfw0JQK6wfhbByUAQAnCxAFjVJf07QnedTx9/BMKe1mwvhMwMRjbz
 1AeQZsK5/O1LIgWz1hQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NyBTYWx0ZWRfX03hkQB/iTEJa
 ZiECtdGl+Vp1XgsTOgehniYQWRDGEPXN8CGZgRviVDOobbIeIozp40ArEx4ArTVLCCOVYXfufFU
 LteEBCTANSeLCtrfGTElgfYG495+Q+U=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeb425b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ID6ng7r3AAAA:8 a=jDr6M9SAqJ_SdK0oBYEA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=AkheI1RvQwOzcTXhi5f4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1011 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040057

On 28/10/2026 15:22, Peter Hilber wrote:
> On Mon, Oct 26, 2026 at 03:31:16PM +0100, Cornelia Huck wrote:
>>
>> ...this would also still somewhat hold (no need to reserve an ID for
>> everything, but if you're serious, get a vendor-or-purpose prefix.)
>> I'd still want to encourage everyone creating a serious device to go and
>> try to standardize it.
>>
> 
> I am wondering how these namespaces would be managed and used. Would
> introducing a vendor/purpose prefix require an approval process in the
> Virtio TC? Would new standardized devices have a "standard" prefix when
> using ID 52?

I would suggest something like this
<PURPOSE>/<UUID>

Where PURPOSE is just some well known 32 bit number with:
- 0x..00:          must be ignored (similar to the device IDs)
- 0x..01:          test and experimentation
- 0x..02:          Vendor space, any vendor can use it
- 0x..03 - 0x..FF: Reserved for future use

Then the UUID can be any completely random within the purpose. Not "4" 
but a meaningfully generated UUIDv4.

OR alternatively we could create a QPSFI or maybe Qualcomm purpose 
instead of using a generic vendor space, for example 0x..02 could just 
be used for QPSFI. I don't think it makes a huge difference.

> Could a device UUID transparently transition from testing to
> vendor/purpose, so that drivers would only match on the UUID? Could the
> namespaces be seen as a quality gate so that testing-prefix devices may
> be refused in some circumstances?
I don't think that should be thing, once something is properly specified 
it can just use a normal device ID.

On another note. We are here because there just aren't enough device IDs 
available and while looking at this we figured out that the qemu docs[1] 
actually claim that there are 175 device IDs reserved for VIRTIO and not 
63 as written in the spec. Who's wrong here?

Maybe the solution lies in finding ways to expand the number of 
available IDs.

Cheers,

		Matti

[1]: https://www.qemu.org/docs/master/specs/pci-ids.html
