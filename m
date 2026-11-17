Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940210;
	b=iRtiTn9FMOT47o4WIPYwE9hU7NZoH6as3nrTcPWwiUeKBvOlb+jmtKx7wbHOoz72b+RM
	 Luk1L/OK5qGsIgPvu+QgPa9PlNpacxWx+WieK9d1YlE67PrRJALm7pTU8eJDt+YAfQh7B
	 nqLSSPuGcVprAb92P8/6nts5WwXUQThvmaqzqhdqSYZZv94YE3VdFOCNGXurOEqylu2cX
	 q40ZYoo3PI3KC/FBCaUQCUXaX60ecO88y8vlsAMJIawzMxpxp4CoIuPUFKhjwAf/M+avz
	 uVoM4CmCZKBp3zSIKX96hQjmGTlKeY8+1OBfbQrrWwj4DdrGRHKxNACfK4oj4q6mdpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940210;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z1Uep9UhvX3j/76n53AHJsDYYa+bH86a/VhxAmd0wRQ=;
	b=Q89GgEy69Lye8zV/VyvM4Y4jz21DVx8Q2f8R8D5F/sXmY9w+CyCXjd3O57p1YWC9tM51
	 7MBEU1ZvIQ8pfHyYT87/xDRpfS6iIbd26vTxZ+rxEz72Ush8e/e7ohDwhx1+BI/8WnL/I
	 HC1QsQZ1N+bEQ3wZbprcVYYDZDtnXx5pa9FXJnVtZlDmZQs7LuYcxfgmb7MKyi/uZdfBw
	 y8rO9Yp0Rrh59zrGtjYwiqb9qw+UdqC6GnBa0Ct5XullIbtBBt4bJZ/g8Zn0SFUOuW1J4
	 XlUpMTyhe0G2P16MBymTQsdFoOet7ZkG6skB3d44aNLdW8hocihWaoytv7QH+8WtenA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="IJ/4JQru";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iGGMXnov;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83091606A334
	for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 18:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83091606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IJ/4JQru;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iGGMXnov
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQi7p534674
	for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 18:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z1Uep9UhvX3j/76n53AHJsDYYa+bH86a/VhxAmd0wRQ=; b=IJ/4JQruURTYvlu7
	fS/Py54Cp0wWYTHzF3U0qDI2PAHC6bzmQAhae84hbJqApgqDb//H1fVOkQgq56QP
	GBjcrJXSK3OcaB4iRM9aNgn2v7eTAn+TAdkUD6C0fsmIaUZx0Lkhyf5Oa3fWNurb
	JNFFpjXP3QxDWJC2K3rgX8Go/5ywROgw1af2R5c31jMdaHEqS/AYX83T7MZjq2U1
	u4qD0MPBR5Jvo1bQdAos27rRKyZZRNsG/MOHM0AaISjAfYbR96KKUmpJ5R04qaDy
	GgaY4zY1qOaCSQInSusOHUQfloR19h//H4284I29qCEAFKaXf6x1zP4iOS7LgiyT
	g+KZMA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gfr38sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 18:30:08 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so9439e0c.1
        for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 10:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794940207; x=1795545007; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1Uep9UhvX3j/76n53AHJsDYYa+bH86a/VhxAmd0wRQ=;
        b=iGGMXnovtEQM+2foeGf5V74NIK1ciEuMoZDQaSF0KIR7Vjqo2Aj895qXcqJIz7d7L1
         jdnLmlRE/8QgSmXtUGqw753Tx8/UXNDUdj753/I3iZRMksvoApeEAGTOk/W7bqMf+n/J
         L9RpmbEvfxUIYD8ztKuN5Ya5FojpMBUD9vH94+6uXx098xpkV43nQdSUR8gi8AU53Ly/
         7/AxwGOwrPsA1ka1BwWCl36rVP31YD/Cf0XdiflA2fgBgnLb+DJQw1btm0V9VXCia4i+
         SC6jJFv9kueqAMOujyn968/rjMNMKtkdlnYIRDsxWL7Fz+nJJK7JnOETgpLYyJcB3G33
         hSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794940207; x=1795545007;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1Uep9UhvX3j/76n53AHJsDYYa+bH86a/VhxAmd0wRQ=;
        b=sH9zs41mgDh4k0i2X/IIKlbeGL9sr/s8nEzTsz9irDEYLx/633VAnvv1VN9vnEZed6
         aK6DfXINZRidnU2VJreE+SYrJS3CCn86e6oHvl6RPi5Pu8ojN+pnruue2pMvKQxOL6Ki
         6HoU670aTUWil1TgC+Uy66SzKH8Hb5AQra8qHcapmBney1pggUeX5IzP+EsVm/nS8Kg8
         vkD+hC/OuMf18tIr3qM5M5UNSIv6XLEtecRZNJNIxrvX6f/n84ipuvfB0OZwSaY3rT2Z
         vFzvZqjiXOhFmSMR1TDODEukP1WvuG1oICWRNkyA3tkDq9DfAAIZCEiWMeVjyMZH5065
         GQaw==
X-Forwarded-Encrypted: i=1; AL+hErGPIyfVyLvXkavFCCizNYBvhDqMUNTOLfvboxYCbYJKdI7WdPB4f4H+ByhqFRkSMC/QRlxmZ/w09nPgVgzXJw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8FsOeRpgWG0+Qk90EKvmTV9XzPWcJXKXc5Nvnl7X0sXnZaEJhu
	I1dwHtC96iTcszqsJ1E3BUYfbzKI+iAuoVM4gJ4i50WGAKrInfp1t5BBHtn2McuCzW4Bx4zFdtv
	f3DU1EdbkGdqs/M6tVnQ+bidixsWGXy90w5GEXUIBAG23fQu1GNrRCBSeutiDYj9lv3pSWQ==
X-Gm-Gg: AYBFou1R1b+z3na/+jqDpddips8GMg+J+BRZjTW8HdbpB/YaXxrK3riroYZOVkSWLLt
	L+W08MsKQK7PEjdA/Nc1wMHUQfClraYaoH/aAFq+RMeDGnd0gXs4TMOjHA51flM4sC32hD6JeAa
	3gXfTimoV58sh8Lr/TkcGEF0irB8pPOwSlLvbvG2+9KqHO6nImsIDwkeGaAbBhyz+4hj+gGERh3
	IIOvlt63MpZoRI/viKJTiqLHvpwSvjMK25K/TolkpMDuaWs5sIexVHbqujBSaaEzly1r06HwfJZ
	syQYTCW1lUcvkqJbEFl+SAcc7DzzvP6oqwAzPIKefyf3ijKsWSNbFd77JEN+gYnB1e0m5Pqakc4
	MMAK+t3YGEyGjSmiYO8e8M+KUMjGr33s+i3UFXh9Ybpl4cbgDAVjs6YhLGtD3a4GUq64F2V2ffm
	jc
X-Received: by 2002:a05:6123:55b:10b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ee6460774amr449788e0c.2.1794940207473;
        Tue, 17 Nov 2026 10:30:07 -0800 (PST)
X-Received: by 2002:a05:6123:55b:10b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ee6460774amr449734e0c.2.1794940206877;
        Tue, 17 Nov 2026 10:30:06 -0800 (PST)
Received: from [10.224.243.56] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654b807fesm156126f8f.10.2026.11.17.10.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 10:30:05 -0800 (PST)
Message-ID: <ce7dc70a-13d0-4c8b-9b0c-b46e9a0af54d@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 19:30:04 +0100
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
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Hilber <peter.hilber@oss.qualcomm.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Demi Marie Obenour
 <demiobenour@gmail.com>,
        Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,
        Parav Pandit <parav@nvidia.com>,
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
Content-Language: en-US
From: Matti Moell <matti.moell@oss.qualcomm.com>
In-Reply-To: <20261104094014-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X/rHu2Te c=1 sm=1 tr=0 ts=6afc9d30 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bgmRwvdE-QB3bOvbC7cA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: Im5o-1TibwWdKZXb8BQXhAlzJdpwpRhN
X-Proofpoint-ORIG-GUID: Im5o-1TibwWdKZXb8BQXhAlzJdpwpRhN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3MyBTYWx0ZWRfX+oVXao9oDO/S
 JikE4UfQ7iKx7e691eliNyQZuVyBNO8oBeRfaO3HKMe8QrgUUbRoAFJoZr0ZgL4+Y+7nRUljRhp
 3hXtYIu5IORvpVoJIZykhYZFReOoj0xutBytsfzrewH1UufrnnhteexXeWs37PioyVlff92Y/Lh
 CUiVgD+s5BfEyKQ+62WDQ9d/TnNHIRCuetTE/4Q5wByOGjhWvqmNFkQmsF4dyHeoEjI65ze74l1
 7C+y8Repj56cTfCEVR5HKYiyHF3mBcMZd0oIKCcEVjlhd3uD9bII775slvAyBAzIz5FCMJuJKpt
 oVOksC6Hg6H+ntTVCSbM9zuSep7t27msSx5XwvV3WT/uWvG/zmyDm9orkot2kEnBk+zBEZNuvKG
 zE7FJdYov/bncG9MBe4DOnx6vgmKyianiJJA4MDcjiu3Z+LZ/K8uAgyvULhtPWvkN/jDR/J5A0/
 30eKXZVbsMkXE1OcIPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3MyBTYWx0ZWRfX5G2g13VitV0B
 TT9FujK5Xyj+Wmly9UOw7iWkG6TOJ9bh0DqtH3q18e5zc/Gyrysd0sTkXIsnRBvFmlhAi0xvew5
 OhrnEbNY+GlOwKCpmKdBlluClcaHHaE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170073


On 04/11/2026 15:46, Michael S. Tsirkin wrote:
> 
> Ugh. Let's keep it simple. Reserve ID 52 as vendor specific, qualcom
> can do what qualcom wants with a qualcom subsystem vendor id,
> or just you know, use its own device/vendor ID.
>

Just for clarification, so you'd be fine with reserving ID 52 as 
"Qualcomm Subsystem"?


>>
>> On another note. We are here because there just aren't enough device IDs
>> available
> 
> Nope, I don't think we want to go too far to accomodate devices with no
> plans to be part of the virtio spec. That's why we are here,
> the lack of IDs we'll fix.

Got it.

Cheers,

		Matti
