Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B791A1BC41
	for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 04:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735187624; cv=none; b=RW0D/4yr0wLYEjVR6s/9tHwJAhzWDcaUPGGtVQpUXJ3jJObfp1e8PpHY/4PxtdhvSX2jISoEbmaKRA+/U7yILoOyd9VkureD8JJaH6XZVy+Kst1zS0unypQJd4NtMNHp+Z5OG0JgDw+UtwaMid20uRc3Om0hRDzdoEHlCW4b2tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735187624; c=relaxed/simple;
	bh=4fHV0VuyqshQ1LezbNaijjqTIWgSutyZWdzfSOEUtTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTZmRIeZqdBXYpUIW7DxayBeLifY70idsj7oAhBC982a1RQrr4xtSaJVbtUWoQfnXP4CQ9quxa0Lj6FuvrLJgCeRLUAC/hzZSU7KWEltv2S8fptFBYG+mZE3OKAfV+ptAMLr0HNixMmlOHoBhx15HwHBKOQvsjqvno1zLdyw4j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=aMYblPSL; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="aMYblPSL"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2164b1f05caso68220955ad.3
        for <virtio-comment@lists.linux.dev>; Wed, 25 Dec 2024 20:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1735187622; x=1735792422; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/L/deNC7KENIXQ3HQZ/OgvsMxNnprL0SXubf1YKKGvs=;
        b=aMYblPSLnen0T3vxJA8zGrujE0FFoasCCIJYQfwxvyFPJfKIOi7UKDqFgFt9kEdrT5
         Gyc5953ErKkZbb5NElDKre7lC3oG8GeIPrnLbLvMDwDyd/H6SVvgt1nQds4HvNTmyGuG
         NMkQ/F5VhB2G3rIQa88QIgEeKp2ZRS9fIwSEFCFL0sULPBzjWEOAHDWL1G78iwIPEaba
         qIPoqbAgPTVASJoYzaMAV8Cu/8HdQow0NI40BIXT6MkCmp9x07KavqEjg9d71ZLr0OuW
         OgGNrq3jQjqjJOf0dL+bQHkb95ZK/LQOiH7WomPfTGSzuKMHgPRtC9fB4ANZJw4qfkQL
         Z2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735187622; x=1735792422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/L/deNC7KENIXQ3HQZ/OgvsMxNnprL0SXubf1YKKGvs=;
        b=B3px8o30huUgTImV9qlaNWGTZ/R2lke31xbL2Dura4l6te3bxNpy6R6ue+E3mKwrcl
         0U7WNJBhpKscTLDFPSMs1tYD1St/JEIMpazP8ol5yvm29TNFWWbFssP1z2afjbDLbN4O
         0rabSpiPWoJw/rsUDslRgaPyGpAF5M+aYFgMQWNdBn/H9ZerCqf6/V+ps5DdJr8z2glp
         JULds0rk2X53k8kfgrukHze0REAt08XXp2kj921shOlqt6IGyQRxrursGq8DusdKN+X8
         QEQvLCNzn6RVuhroNGjt5qMsD8/NLq9MlTzYjlZHA3gg1nxYLkhohWJodryOW1dMW1Vg
         RKCg==
X-Forwarded-Encrypted: i=1; AJvYcCWt8PW97zCVe9jN/11X9g+LOD/C8tX5LY97vX+ffLd4ZkY/IfiF0+YEsd0tMb4vJOU7SDZFHpcKVQvI0eoxRw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo0f/H5/FQl4J0W4Yu1YUpG3Zk2pssyWHj9Ni0t3Xf7kl57QkZ
	/JmKfndfzSH2RU9VJ29iIykHdh7Izpxt7+rDczaJ8wF/mLtxFCnrJGz9jJZoXPDJyKOjpT3mJMx
	qshc=
X-Gm-Gg: ASbGncv+S2BhAheahVBn5dBAAbIohi6cBn6fxatM6UuvIB5NSbxmbcR6puAPqXOuHfc
	VTSjjUyIS0e49jjWP8i4KnPqLidVGbJM3Apnexu+92Q4nEGw+J0VndAT9I2J0lB5exyeC4tSGVQ
	Oo1xv0OvOpbn2Sk2OA/UjtxDuTqwVvOBToRUp/4hMy9HrrCVa78n0KEMJpJLySJyz/kcIPC6H4Q
	rgkJMHh6AeRTQqkRcSabOcKpdtEVdXoG0o3BprKmOZghExJuM0WfvWd8Up/3Ok1kizcGw==
X-Google-Smtp-Source: AGHT+IFdugoRlORakdE9JGg8pufGyP7ywiwxNzap5F1t41kdB1PgXCo2D7SAy3eTGNMN63fnetHEGw==
X-Received: by 2002:a17:902:d2cc:b0:216:1cfa:2bbf with SMTP id d9443c01a7336-219e6f12dbemr296304785ad.35.1735187621966;
        Wed, 25 Dec 2024 20:33:41 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96e94dsm112130905ad.67.2024.12.25.20.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Dec 2024 20:33:41 -0800 (PST)
Message-ID: <b037a580-0428-405a-ab2a-f02025fb8132@daynix.com>
Date: Thu, 26 Dec 2024 13:33:39 +0900
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio-net: Change num_buffers value
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "devel@daynix.com" <devel@daynix.com>
References: <20241225-buffers-v1-1-712e839e8ad1@daynix.com>
 <CY8PR12MB7195705CAFA8759355685905DC0C2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <24facd94-87b2-45d1-97ca-851595e8cf41@daynix.com>
 <CY8PR12MB7195C2A20025389351D15B8DDC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <dcb6ad57-5d36-40f8-b161-7570dacdea4a@daynix.com>
 <CY8PR12MB7195C321CF982819C5393358DC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <11feddcd-464a-4697-8462-32c165a7df49@daynix.com>
 <CY8PR12MB7195520E85F38BB409949868DC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CY8PR12MB7195520E85F38BB409949868DC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024/12/26 13:24, Parav Pandit wrote:
> 
> 
>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Sent: Thursday, December 26, 2024 9:44 AM
>>
>> On 2024/12/26 13:08, Parav Pandit wrote:
>>>
>>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>> Sent: Thursday, December 26, 2024 9:22 AM
>>>> To: Parav Pandit <parav@nvidia.com>; virtio-comment@lists.linux.dev
>>>> Cc: Michael S. Tsirkin <mst@redhat.com>; Jason Wang
>>>> <jasowang@redhat.com>; devel@daynix.com
>>>> Subject: Re: [PATCH] virtio-net: Change num_buffers value
>>>>
>>>> On 2024/12/26 11:50, Parav Pandit wrote:
>>>>>
>>>>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>>> Sent: Wednesday, December 25, 2024 12:01 PM
>>>>>>
>>>>>> On 2024/12/25 15:28, Parav Pandit wrote:
>>>>>>>
>>>>>>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>>>>> Sent: Wednesday, December 25, 2024 11:52 AM
>>>>>>>>
>>>>>>>> Linux's vhost_net and QEMU sets num_buffers to zero when
>>>>>>>> VIRTIO_NET_F_MRG_RXBUF is not negotiated. Change the
>>>>>>>> specification to reflect this reality.
>>>>>>>>
>>>>>>> Please fix the vhost_net and QEMU to reflect the specification
>>>>>>> which clearly
>>>>>> writes num_buffers must be set to 1.
>>>>>>> (the last hunk of this patch).
>>>>>>> One cannot suddenly change what was written in the device spec as
>>>> 'must'
>>>>>> requirement.
>>>>>>>
>>>>>>
>>>>>> This proposal is based on the discussion happened during the
>>>>>> vhost_net
>>>>>> development:
>>>>>>
>>>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flor
>>>>
>> %2F&data=05%7C02%7Cparav%40nvidia.com%7C649e957573c04ca299a808
>> dd2563b
>>>>
>> 763%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C638707832422
>> 610980%7
>>>>
>> CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMD
>> AwMCIsIl
>>>>
>> AiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdat
>> a=bab
>>>>
>> vvZhhh8eCZAsF%2BMv4W0LjkD5KMTZn6OA4%2FzIMOAE%3D&reserved=0
>>>>>>
>>>>
>> e.kernel.org%2Fall%2FCACGkMEt0spn59oLyoCwcJDdLeYUEibePF7gppxdVX1Y
>>>> vmAr
>>>>>>
>>>>
>> 72Q%40mail.gmail.com%2F&data=05%7C02%7Cparav%40nvidia.com%7C227
>>>> ecfe28
>>>>>>
>>>>
>> 0c04c7fbe0708dd2560ae73%7C43083d15727340c1b7db39efd9ccc17a%7C0%
>>>> 7C0%7C
>>>>>>
>>>>
>> 638707819369398017%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiO
>>>> nRydWUsIl
>>>>>>
>>>>
>> YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D
>>>> %7C
>>>>>>
>>>>
>> 0%7C%7C%7C&sdata=JcJuXC0tHF%2BQwCjrpwDTnEWRrITD0hXwB3cTkwmZ
>>>> qOk%3D&res
>>>>>> erved=0
>>>>>>
>>>>>> The reasoning here is that vhost_net and QEMU set num_buffers to
>>>>>> zero for years so changing it is more risky.
>>>>> Less risky for the device or the driver?
>>>>
>>>> For the driver.
>>>>
>>>
>>>>> Your response implies for the device, but do not understand how it
>>>>> is less
>>>> risky for the consumer of the field (driver).
>>>>
>>>> If there is a driver that reads the field, such a driver is likely to
>>>> expect zero because the two most popular implementations sets the field
>> to zero.
>>>>
>>> Why would driver expect zero there when spec said 1?
>>> It can only work if the driver ignored the field.
>>>
>>>>> If the field was never read by all the drivers, it is better to
>>>>> modify the spec
>>>> to say following in the requirements section:
>>>>> 1. device MAY set any value, or MAY NOT event set it.
>>>>> 2. device SHOULD NOT set num_buffers.
>>>>> 3. driver MUST ignore num_buffers when VIRTIO_NET_F_MRG_RXBUF is
>>>> not negotiated.
>>>>>
>>>>> For the real PCI devices, this actually can save the sparse DMA
>>>>> occurring on
>>>> rx packet.
>>>>> (telling 0 forces the device to do the DMA for the field that driver
>> ignores).
>>>>>
>>>>> Also please change the motivation in the commit log to indicates
>>>>> that dpdk
>>>> pmd, freebsd, windows, Linux, QNX drivers has never read/honored the
>>>> field num_buffers when VIRTIO_NET_F_MRG_RXBUF is not negotiated.
>>>>> Hence, make it optional for the device to set it.
>>>>>
>>>>> Please work with those open and closed source driver's maintainers
>>>>> to get
>>>> their ACK on non_usage by the driver.
>>>>>
>>>>> This change will help to save the PCI DMA.
>>>>
>>>> I don't think it will save the DMA because it is at middle of buffer.
>>>>
>>> Its part of the vnet hdr writing process. So its slightly lighter to not write in
>> simple cases.
>>> How a device does DMA is upto the device on splitting the buffer.
>>>
>>> And if it does not save DMA, I don't see the motivation.
>>> The driver is working with num_buffers=1 and num_buffers=0.
>>> So what are we trying to save?
>>> Aligning the spec to some behavior to one device implementation makes
>> other device implementations non compliant to the spec anyway.
>>> So the risk part is not clear to me.
>>
>>
>> I'm comparing the possibility that there is a driver that breaks with
>> num_buffers=1 or one that breaks with num_buffers=0.
>>
>> When comparing these, it is more likely that there is a driver that breaks with
>> num_buffers=1.
> Why?
> And if so, such driver should be fixed which didn't follow the spec for 10+ years?
> 
> What will you do if an automotive product driver has stringent check to fail the pkt if num_buffers != 1?

Such a driver needs to be changed to ignore num_buffers if 
VIRTIO_NET_F_MRG_RXBUF is not negotiated.

We can't make the device compatible with drivers that expects 
num_buffers=0 and ones that expects num_buffers=1 at the same time so we 
must determine either of them that is less risky.

> Please get the ack of all.
 > >> Most drivers should have been tested with vhost_net or
>> QEMU
> Please get the ack from the maintainers that driver has ignored the field.
> At that point this field to be marked as don't_care/ignored field instead of forcing 0 or 1.
> 
>> so they should work with num_buffers=0, but they may not be tested
>> and break with num_buffers=1.
> This is hypothetical. Please get the enough data.

We can't survey all the drivers that may exist in the world so we need 
to make the safest hypothesis.

> We have PCI devices that do num_buffers=1 and tested with Linux, dpdk pmd, Windows drivers without issues on num_buffers.

We are determining the safest option for drivers, which consume the 
value, not for devices. PCI devices with num_buffers=1 may be tested 
with the listed drivers, but may not be with others.

Regards,
Akihiko Odaki
