Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C19410E0
	for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 04:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735186438; cv=none; b=uFpcXpgMhFweaJyBXQ+2K2Pv3NOrx100Zoary6Qp9lJPI81KXMmGK350U3k8SHQvkrENyOUVjAo7TJM/WT0Mdfr2ppDeAMUVrudfrSpSYoBHm6MDGWBS8pDuYDBjnSZWylKJIip0dzUrEWAdlHWeYGe24QWlhjMViJfWwzrm6bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735186438; c=relaxed/simple;
	bh=jLol+PjgOHsUrvTUVuR+qzlS6uhOXx34deYDcvqLZqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=STy+oz4hpmIrh9sgUvKrMweakIlR2J6r8sgQp9AwbLuU5aSlGSHMyku4UefqQBNjS6kt/jAjgk7C356yxQ5t41MDU6wTvpQ0JPkyc9RukHXrlyKIPppxhbkdyIY1qyCi6f36aPflGRPg81GmXxcdjhhvavA8+58vSAaJWA1cBZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=fATZAKfg; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="fATZAKfg"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f44353649aso5640267a91.0
        for <virtio-comment@lists.linux.dev>; Wed, 25 Dec 2024 20:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1735186435; x=1735791235; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ud2F3U0fl+ljx2dF6N/6JSPjDUo8HkYt/i/ybUonb4=;
        b=fATZAKfgOiCcVnYD0+Xnnlom364cdSmoT1bkzhxbm0PbkOPRUblPYiYeODdUGCzRP/
         YaVoJ8/+K7zMOdA8ZQRL+O1iY+9eUq02xl9bL1MmSCPPMT5g1rYkN4q+HkxPv/ZOT5Hk
         4qru7+cH++luLwivj/W3wOGp79S9gR1NDKsmMTizy7vbyK+i8wP7NjbovjYPHeCzc7r1
         gomVKoH9vc0xAY0W8kZgDZlV+EcJQeYda/ux3Mmtr0TqZoBDB3u/LR5RnmnpNqRfYGnR
         EZ+wNsh+/Dy04fVa4+WgwYN7unMVave5NZVPRhqEARItDJRPcHn82arzcJZNQfvY4Ag7
         eUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735186435; x=1735791235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ud2F3U0fl+ljx2dF6N/6JSPjDUo8HkYt/i/ybUonb4=;
        b=qu1fLrIvmGTxM5ffmEL3/0Az09FnGNLz5ifZWLitiu4DQiClHuJ7peQacU/0GEo3BA
         X6MY0L4bDfd+Q5obk5JB25NOjJFQ8i9EAc+bhHka+QVNiSX5LLGOzD1F2f5zxQGGo1m7
         uRKS0mFP1Eh4yYFEVCmxznlPjq/1/Dmluhu2YuCKp+oxk6YMVJr9kyL9v7AyD5ffuywb
         t6auVrh7T5ORa33gWdz6rwceqiDFFWwy4E1+vn5/qC1hfGG+EuPItBWgFizSsLpGwl1e
         fkt2OEteMlb2/XKtZCCj9gjW8Ao67+8a8HjrO2jRsjINezdyNBvBiq2shAZ7V4jTlJ1r
         MUDw==
X-Forwarded-Encrypted: i=1; AJvYcCUzBxsyT3lZjQfVHhrPxcS6jtVnAs0VzteIc+dYQpDIb7BGMPMPVHDV9XZ6pekqkdGKzQ5kVirjj5KXyPwsFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfFUoIlXenQiwTmT0xRncGZvcgDtiByPMjc8W0XT5nSzBz8KZd
	6lRPJ/STIoN2YypE9HA+RrMO2xfdxc+QdlTF9IyW8sGJ+cpxr3J9OvOxJtBVKtf/4TZ6mX2TLsK
	X7gA=
X-Gm-Gg: ASbGnctF8lcFs7RTpvWUdvxCrzjgjQOeDghErKYpoy5s5px53n5DBcgxZQxTm8WreW8
	cZf8B8FR8VH1pi4IqAoPyhG0AUBSRd2h8VPQN4aezWnfMJ4UVg15Jj3p7yZ5zw7WiajGeLhoZf/
	ZZwRa5f0PeHth9TAaVxfxWRiV6kJYnwGQ7kX/onXjbdNMaT58kI+QYmhKdbTmytbG67FS1aU4s/
	kB9nw8Pw0JGcuIHBgrQZBlo6O809M27mlmfBLkqSVVRxLThNgMuUaTl6lX9FZAird8yPg==
X-Google-Smtp-Source: AGHT+IHkSMyMamDFEpGYv8ik3w2rahXvxxFJDcnZwYNHumDHd4MrfP4314Da0JfDxQ2UUUQJTBoogw==
X-Received: by 2002:a17:90b:3d45:b0:2ee:accf:9685 with SMTP id 98e67ed59e1d1-2f452dfd36fmr31891249a91.4.1735186435570;
        Wed, 25 Dec 2024 20:13:55 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f48db83c37sm2364303a91.47.2024.12.25.20.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Dec 2024 20:13:55 -0800 (PST)
Message-ID: <11feddcd-464a-4697-8462-32c165a7df49@daynix.com>
Date: Thu, 26 Dec 2024 13:13:52 +0900
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
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CY8PR12MB7195C321CF982819C5393358DC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024/12/26 13:08, Parav Pandit wrote:
> 
>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Sent: Thursday, December 26, 2024 9:22 AM
>> To: Parav Pandit <parav@nvidia.com>; virtio-comment@lists.linux.dev
>> Cc: Michael S. Tsirkin <mst@redhat.com>; Jason Wang
>> <jasowang@redhat.com>; devel@daynix.com
>> Subject: Re: [PATCH] virtio-net: Change num_buffers value
>>
>> On 2024/12/26 11:50, Parav Pandit wrote:
>>>
>>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>> Sent: Wednesday, December 25, 2024 12:01 PM
>>>>
>>>> On 2024/12/25 15:28, Parav Pandit wrote:
>>>>>
>>>>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>>> Sent: Wednesday, December 25, 2024 11:52 AM
>>>>>>
>>>>>> Linux's vhost_net and QEMU sets num_buffers to zero when
>>>>>> VIRTIO_NET_F_MRG_RXBUF is not negotiated. Change the specification
>>>>>> to reflect this reality.
>>>>>>
>>>>> Please fix the vhost_net and QEMU to reflect the specification which
>>>>> clearly
>>>> writes num_buffers must be set to 1.
>>>>> (the last hunk of this patch).
>>>>> One cannot suddenly change what was written in the device spec as
>> 'must'
>>>> requirement.
>>>>>
>>>>
>>>> This proposal is based on the discussion happened during the
>>>> vhost_net
>>>> development:
>>>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flor
>>>>
>> e.kernel.org%2Fall%2FCACGkMEt0spn59oLyoCwcJDdLeYUEibePF7gppxdVX1Y
>> vmAr
>>>>
>> 72Q%40mail.gmail.com%2F&data=05%7C02%7Cparav%40nvidia.com%7C227
>> ecfe28
>>>>
>> 0c04c7fbe0708dd2560ae73%7C43083d15727340c1b7db39efd9ccc17a%7C0%
>> 7C0%7C
>>>>
>> 638707819369398017%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiO
>> nRydWUsIl
>>>>
>> YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D
>> %7C
>>>>
>> 0%7C%7C%7C&sdata=JcJuXC0tHF%2BQwCjrpwDTnEWRrITD0hXwB3cTkwmZ
>> qOk%3D&res
>>>> erved=0
>>>>
>>>> The reasoning here is that vhost_net and QEMU set num_buffers to zero
>>>> for years so changing it is more risky.
>>> Less risky for the device or the driver?
>>
>> For the driver.
>>
> 
>>> Your response implies for the device, but do not understand how it is less
>> risky for the consumer of the field (driver).
>>
>> If there is a driver that reads the field, such a driver is likely to expect zero
>> because the two most popular implementations sets the field to zero.
>>
> Why would driver expect zero there when spec said 1?
> It can only work if the driver ignored the field.
>   
>>> If the field was never read by all the drivers, it is better to modify the spec
>> to say following in the requirements section:
>>> 1. device MAY set any value, or MAY NOT event set it.
>>> 2. device SHOULD NOT set num_buffers.
>>> 3. driver MUST ignore num_buffers when VIRTIO_NET_F_MRG_RXBUF is
>> not negotiated.
>>>
>>> For the real PCI devices, this actually can save the sparse DMA occurring on
>> rx packet.
>>> (telling 0 forces the device to do the DMA for the field that driver ignores).
>>>
>>> Also please change the motivation in the commit log to indicates that dpdk
>> pmd, freebsd, windows, Linux, QNX drivers has never read/honored the field
>> num_buffers when VIRTIO_NET_F_MRG_RXBUF is not negotiated.
>>> Hence, make it optional for the device to set it.
>>>
>>> Please work with those open and closed source driver's maintainers to get
>> their ACK on non_usage by the driver.
>>>
>>> This change will help to save the PCI DMA.
>>
>> I don't think it will save the DMA because it is at middle of buffer.
>>
> Its part of the vnet hdr writing process. So its slightly lighter to not write in simple cases.
> How a device does DMA is upto the device on splitting the buffer.
> 
> And if it does not save DMA, I don't see the motivation.
> The driver is working with num_buffers=1 and num_buffers=0.
> So what are we trying to save?
> Aligning the spec to some behavior to one device implementation makes other device implementations non compliant to the spec anyway.
> So the risk part is not clear to me.


I'm comparing the possibility that there is a driver that breaks with 
num_buffers=1 or one that breaks with num_buffers=0.

When comparing these, it is more likely that there is a driver that 
breaks with num_buffers=1. Most drivers should have been tested with 
vhost_net or QEMU so they should work with num_buffers=0, but they may 
not be tested and break with num_buffers=1.

Regards,
Akihiko Odaki
