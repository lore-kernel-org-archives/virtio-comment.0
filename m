Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAF0184F
	for <virtio-comment@lists.linux.dev>; Sat, 19 Apr 2025 06:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745043758; cv=none; b=TDPVkvp+oQNDON7kNqZyvpPvwfXf70xDEuTbdiXssVBi7iSmvBqbLxNND8/6qVkn4q6+WzAU3hBVOXPiG8XjXGWZAEZKaYs/DhMh8GWwRnwNwqQLYoCeWbYLzo4sjeELzmKLMiGHsmY8xW1YWP56MmxI4kv/kK3M9sUn3iEio+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745043758; c=relaxed/simple;
	bh=mSKG9ltJrl6mX3Nd+JGONU++/8wQmv3PrvjZrG41lPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sJr/bBLnxzpjB3xWLHf8jUbIw3BwKp2pTq8bk37iolcbG1ff7sg5z3EeQzzQ9eprley0rDezjhdreKwmes7IesyvlqsjlKJB7u6LUZM36rJ6u0WCHPrLGlZOyufkWNWADmWgeriaQkpEgZew2uA4Yf2UESWFFG1kY15Gx0qR0cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=SKuz27nh; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="SKuz27nh"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-227cf12df27so21496595ad.0
        for <virtio-comment@lists.linux.dev>; Fri, 18 Apr 2025 23:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1745043755; x=1745648555; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xiuXdsR3y2QY54rEE9+wwM0xmvZhKf+Zzy/ZrtvQSoE=;
        b=SKuz27nhi8dDb+9/EZ/HuWHXks6Of1PwJFeOyh+9f3kkOq0JmIyL3KXgs5IC6+8s+Y
         S9wqR+AGqXfNdQwHVXxaRnz7OHpQrws/6QUMEWEUXtJxWQWaOnRm5dry5lvAOwSl+RCL
         j+HLe+WlgKoSESwo5wPXGfbz4FShbfTlrvnZOUFNzvaFVkqz7f1SVq/T815ZRgsX2Nwl
         bTs5AeJqmVhB3V7CvbIwkhJvQUf/K/FLCzMqe0oCPFlF38pSTGCgPjpLAcB2Gya/jv53
         XAgGXL8MPhItojJv9BSyqg7gKY2z8ARWbVql2OL5SiPba00svFHPzweuAlcmNrTCpsr4
         VezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745043755; x=1745648555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xiuXdsR3y2QY54rEE9+wwM0xmvZhKf+Zzy/ZrtvQSoE=;
        b=OTV+7nckCZu9qt9271icGmnRatRk0v0+4Oy3QE5Nl4y+y0c9s8mRhR53M9fLMN+2QF
         xb4J53HgavrqQEdK23CPliw7EhKwYN3nOByDcuppp9Y/vp0PCB6AC4enXUyDvIvOXFQh
         wZy3Z9CsHZGWJQbj7Am/mpRv4h175iyXWwz+Sge6ugGNg9djrNn8sLcd8KFWF5w71q65
         xVYxLd24TFqUQkLZ0SwC5lP5b1XfNTlJtB3YJb0722tIQYPb7ckyxK3Phhr9o42QrAMo
         1RI82S0q2/HORkDlfzlOPFnYwimbTLWcF1WSf0truHEbI6wrWVP2iZEFMq7EPWDQ+khg
         FM2w==
X-Gm-Message-State: AOJu0YzT7fEv8dXllhZWkS2InAmmTWQDm1UjlJY7tYrlkOTYOrMzn45U
	Pf9Y1OxY9Fv8d/ERXknv8RkEeEFrcmvlAdMaHCRrUxeQXmiqbIzejiYAKmpIwks=
X-Gm-Gg: ASbGncv4Fh3py8ZZWmpPaukFyHBw/9hSnauoH6gP+TgexDn9Ic+2i5am4tgNKgbGsDA
	aE4X9CIy+6Qi+e+6Ycp1Db8olvhE2I6AkIweWj6Xxx5w33D4SRHEQ+ALRLrPyxJ2FbK7gpRHr3q
	s784dRKQzaQibsEtopzoPw/GedisNTCYcZT1jQeQJZICQ0xAOmAg+Z93zDibZswuCuXp2ngUvQ1
	tzR6epcyFKR/Zk06jaHzJHO7M4wGFrmuAne+35Om1cHApPGTj4EzP/545NBGyD/AdPK+I2hbnnl
	/BYeyoYqTvswzGYi6+iWipgVgcdK4T1JgtgKXYglNSK5idq5UQ2YgnPLsiPPU/fIhrdtzfd/RWH
	Phi1xETx/qTS+Dk6zEfI=
X-Google-Smtp-Source: AGHT+IHFz46NwPKP1qDXGGG1oICv42BCSzxRLDhBG/Q0XYfFjqvseJiBT2J+JqR+YlxV0o9dAcCIiw==
X-Received: by 2002:a17:903:2a86:b0:220:e91f:4408 with SMTP id d9443c01a7336-22c50d64436mr83237525ad.22.1745043755542;
        Fri, 18 Apr 2025 23:22:35 -0700 (PDT)
Received: from ?IPV6:2400:4050:b783:b00:9e36:5f4c:928c:4ec2? ([2400:4050:b783:b00:9e36:5f4c:928c:4ec2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4bbcsm26833275ad.149.2025.04.18.23.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 23:22:35 -0700 (PDT)
Message-ID: <51a96d2a-6911-4a6c-8108-4a523e836819@daynix.com>
Date: Sat, 19 Apr 2025 15:22:33 +0900
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio-net: Update the max_tx_vq description
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, devel@daynix.com
References: <20250321-tx-v1-1-dd21fbdedf7a@daynix.com>
 <CACGkMEtGx7ajAmJUib++qJ2=rhZjyj5p=7iN2xBvba4gcBAQtg@mail.gmail.com>
 <afd70f86-a248-460c-b82f-c3bbbf62c0f1@daynix.com>
 <CACGkMEtqXtLeNTdcg0j57EX-4953htM9PWH+KQdRLBM=3jWgjg@mail.gmail.com>
 <6edb002d-406f-4f50-827a-14fe2228a650@daynix.com>
 <CACGkMEuuK4uUgfdcYaGnGhTvbwzcrVL4Po2UFanPPObSX7oskA@mail.gmail.com>
 <1024b26d-ad8e-4ad6-a7c7-232d32e5e872@daynix.com>
 <CACGkMEvAf=4kL6L1rSGBT5tAdnaE6m1tG_GuA6Jghb5E4WZb1A@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CACGkMEvAf=4kL6L1rSGBT5tAdnaE6m1tG_GuA6Jghb5E4WZb1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/04/16 16:38, Jason Wang wrote:
> On Fri, Apr 11, 2025 at 3:41 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> On 2025/04/08 15:33, Jason Wang wrote:
>>> On Mon, Apr 7, 2025 at 11:43 AM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>
>>>> On 2025/04/07 11:41, Jason Wang wrote:
>>>>> On Sat, Mar 29, 2025 at 4:32 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>>>
>>>>>> On 2025/03/24 13:02, Jason Wang wrote:
>>>>>>> On Fri, Mar 21, 2025 at 3:01 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>>>>>
>>>>>>>> The previous description said:
>>>>>>>>> A driver sets \field{max_tx_vq} to inform a device how many transmit
>>>>>>>>> virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
>>>>>>>>
>>>>>>>> However, it also controls how many receive virtqueues a device MAY use.
>>>>>>>> Copy the description of the virtqueue_pairs field of struct
>>>>>>>> virtio_net_ctrl_mq_pairs_set, which also has the identical semantics, to
>>>>>>>> clarify that.
>>>>>>>
>>>>>>> Thanks for doing this, I wonder if it's time to rename as "max_tx_vq"
>>>>>>> sounds like a TX only thing.
>>>>>>
>>>>>> I'm no longer pursuing this change. Please see the discussion at:
>>>>>> https://lore.kernel.org/r/765a23aa-bb6b-4a01-89f1-31ad213b4715@daynix.com
>>>>>>
>>>>>> Please also review a change for QEMU based on the discussion:
>>>>>> https://lore.kernel.org/qemu-devel/20250322-vq-v2-1-cee0aafe6404@daynix.com
>>>>>
>>>>> Ok, so it seems that RSS implement a async RX/TX queue model instead
>>>>> of the MQ queue pairs:
>>>>>
>>>>> 1) rx available queue were controlled by indirection table
>>>>> 2) tx available queue were controlled by max_tx_vq
>>>>>
>>>>> So it introduces more "issues" like:
>>>>>
>>>>> 1) This calls a new uAPI as I suggested in another thread instead of
>>>>> reusing TUN_SET_QUEUE
>>>>
>>>> QEMU applies the same approach for both VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET
>>>> and VIRTIO_NET_CTRL_MQ_RSS_CONFIG, which is to parse the configuration
>>>> passed by the guest in QEMU and to pass the parsed configuration to TUN
>>>> via TUNSETQUEUE. Please see the patch for QEMU I mentioned in the
>>>> previous email for the actual implementation.
>>>
>>> If this is true, even if guests want to have an async tx/rx queue
>>> number, the underlayer TAP will still choose a combined queue pair
>>> model.
>>>
>>>>
>>>>> 2) If both MQ and RSS are negotiated, what happens if the driver is
>>>>> using both max_tx_vq and virtqueue_pairs. This seems unclear in the
>>>>> spec itself.
>>>>
>>>> The spec says the last one sent by the driver will be used. In version
>>>> 1.2, 5.1.6.5.5 "Device operation in multiqueue mode" says:
>>>>    > The driver enables multiqueue by sending a command using class
>>>>    > VIRTIO_NET_CTRL_MQ. The command selects the mode of multiqueue
>>>>    > operation, as follows:
>>>>    >  #define VIRTIO_NET_CTRL_MQ    4
>>>>    >  #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET        0 (for automatic
>>>>    >  receive steering)
>>>>    >  #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1 (for configurable
>>>>    >  receive steering)
>>>>    >  #define VIRTIO_NET_CTRL_MQ_HASH_CONFIG         2 (for configurable
>>>>    >  hash calculation)
>>>>    >
>>>>    > If more than one multiqueue mode is negotiated, the resulting device
>>>>    > configuration is defined by the last command sent by the driver.
>>>
>>> I think it doesn't clarify all the cases. Consider we:
>>>
>>> 1) configure flow A to use rx queue 4
>>> 2) set curr_queue_paris to 2
>>>
>>> How to choose the rx queue in flow A? This needs some clarification
>>> e.g whether unclassified or automq or drop
>>
>> Such a configuration is not possible. If VIRTIO_NET_CTRL_MQ_RSS_CONFIG
>> configures flow A to use rx queue 4, the resulting number of queue pairs
>> will be at least 5.
> 
> Yes, this could be prevented by a well formed driver. But I mean from
> the device side, such commands could be sent from the driver that is
> something both spec and the implementation (e.g TAP) needs to
> consider.

If VIRTIO_NET_CTRL_MQ_RSS_CONFIG is the last command, it must define the 
number of queue pairs since the spec says the resulting device 
configuration is defined by the last command sent by the driver. So if 
VIRTIO_NET_CTRL_MQ_RSS_CONFIG configures flow A to use rx queue 4, the 
command also define that the number of queue pairs to be at least 5. 
Therefore, it is not possible for a driver to define the number of queue 
pairs contradicting with the flow configuration.

Regards,
Akihiko Odaki

> 
> Thanks
> 
> 
>>
>> Regards,
>> Akihiko Odaki
>>
>>>
>>> Thanks
>>>
>>>>
>>>> Regards,
>>>> Akihiko Odaki
>>>>
>>>>>
>>>>> THanks
>>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>>>>> ---
>>>>>>>>      device-types/net/description.tex | 4 +++-
>>>>>>>>      1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
>>>>>>>> index 76585b0..5178191 100644
>>>>>>>> --- a/device-types/net/description.tex
>>>>>>>> +++ b/device-types/net/description.tex
>>>>>>>> @@ -1578,7 +1578,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>>>>>>>>
>>>>>>>>      Field \field{indirection_table} is an array of receive virtqueues ids.
>>>>>>>>
>>>>>>>> -A driver sets \field{max_tx_vq} to inform a device how many transmit virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
>>>>>>>> +Field \field{max_tx_vq} specifies the number of the transmit and receive queues
>>>>>>>> +to be used up to \field{max_virtqueue_pairs}; subsequently, transmitq1\ldots
>>>>>>>> +transmitqn and receiveq1\ldots receiveqn where n=\field{max_tx_vq} MAY be used.
>>>>>>>>
>>>>>>>>      Fields \field{hash_key_length} and \field{hash_key_data} define the key to be used in hash calculation.
>>>>>>>>
>>>>>>>>
>>>>>>>> ---
>>>>>>>> base-commit: b495841a8e80d12c1130f8868f4128866291142d
>>>>>>>> change-id: 20250321-tx-78e44c50a035
>>>>>>>>
>>>>>>>> Best regards,
>>>>>>>> --
>>>>>>>> Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 

