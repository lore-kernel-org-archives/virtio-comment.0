Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6701A189B84
	for <virtio-comment@lists.linux.dev>; Fri, 11 Apr 2025 07:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744357262; cv=none; b=MgVBxh1L14M83eZorjguJdJWK1v4fZKJ7VUM8UzToH+pCEgmYpLGz4Shbmrnijg5uuA9XwMWWMDtC1SjUPdTEaM0ocXya/GI+uHI3GWXYUOsNuNGagFyN/NuPp/y+MW7qlQEdmzVKEKS//TYGO2ulGAKZeJaZeyhPgmWdViGbGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744357262; c=relaxed/simple;
	bh=6Io3ddupOB2/a1M4UkuFn7VcyVWky91YpbP7vF9ATS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aMIwNATHUolXW1GVAStFbuZ/oSKj6+uIQ3OJ8Kb/p1uTiJJ5LAEW4Ulk0X3WB81egihwqVHnPDJmdieXx0jKui2Klz5jfSmnx/MHFI00dpuAZQ0flklPb+kxTm45kVnd3xU+jgpIER+YqU1jANEIpYRRqUk7x4dcRhokAQXCY/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=ZhyFDca7; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="ZhyFDca7"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-227c7e57da2so15757985ad.0
        for <virtio-comment@lists.linux.dev>; Fri, 11 Apr 2025 00:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1744357259; x=1744962059; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PAEFYfJJXMW/427goCrHPoGXA6kx8TREykHr+7xUjLM=;
        b=ZhyFDca7jmZnTKEgJTvBp2PFTcSfXO5l+N071LzDoJrTnW8y6XMqyq080OJRICY/jd
         FJYPFdpxVK5kxrfFEGpYA4OUw9tZt7XaRDyrbRN0a5k0NprUW8+uKRpNc4fhocynVPeI
         OhzwmiXcobyIKwqdjReRmsMSGMYOMmZJtkC5bjPn9t2NYWvJygL0lZ9oCqyQXtHYREZh
         7DIen4/KqCgJWmkt2iYm+831UuuYJp8BPWuoaCdUwBhtXWPewcuK1adKwarDNShwCdXh
         s/HPm08WxgU3ZEf8Z9aHF8KMVgmrGzSdXAJjjIzZ+UJAo+trCeig3dj9u7InWSdMBzj+
         7vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744357259; x=1744962059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PAEFYfJJXMW/427goCrHPoGXA6kx8TREykHr+7xUjLM=;
        b=WjUI3v7S4HWV5xZuseFdfc4OwvT3EtJgY8hRIPh5KzyE1q91TG2hKCQp/RbG8wBAC0
         hUp5N3GAcprsD+0d5iNclPu6bvtwIT9iZXNgy7EWqBSOazhyLpn8wxgMneFKR7M4jc6T
         9hVcinhGfWGUOVXVTPzuHGYwhx+2B+9/JtjOqWggLnDRuba/bmZVrLlpgmIc3Z+RJssX
         0KQzGwyrA7SjDQXzpbqNGy2nQpOAs//kWvVuRnbsfLw4jD78ETqRQOeTAtc6J3eB993z
         O2X8X4bWfY5PDe2aUN0/JTSWpeMVUkhiuLHTH66fz0H+fGdoWh6ZOLJswDfFBzT0bWaS
         gwEA==
X-Gm-Message-State: AOJu0Yx1/FMpHr6QDiOdRx6B5taY9WhnfIkdRG/1yk8tTMHUo5gSHYNX
	+7kPA1KvVB8Ds08cwnFJIDagMYOttZlabAlSxYLWWyy3wrgVbWCV6NdyLFT9xnc=
X-Gm-Gg: ASbGnctvgNFIZ5DPWeMx+UK6asVoMMxL9iWaKjgLSWWGGVM+bmrAfgT8PUuP7glit35
	FpZ2Dn1+6G3EGkH2QsKeq/zQz8xDDbG5/I4EOSfN67XUKcKbgTCZdugJXoRSmkOuoOUU0By3z5/
	6Xgy2g7puhZezS9hy5sPoiiYN5KXIbhffZsjL1v8AWywKEvc5GbBMTQij+fY/qbKFDTL97z2Uk4
	BuR76S/313oYY5MMbEC5m/j9aac35jkXqoN3px1TH/Xq3/xP1lhUdW+cuUssP9vhWPE6qGv1QYp
	DaTtTevi2x/MUlev5UTjPEFIPHTK3Qf9yH4EAibnug+m0WpRH14uSw==
X-Google-Smtp-Source: AGHT+IGKpSYzKY38szl7HTJSbnJVN0DsxxEHP2o0p28RsPVxFAof/rJR6gAPpFDjusgbc8fLzxNSug==
X-Received: by 2002:a17:90b:4d0c:b0:2f7:4cce:ae37 with SMTP id 98e67ed59e1d1-30823642aa0mr3295351a91.18.1744357259410;
        Fri, 11 Apr 2025 00:40:59 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd12b62dsm5557087a91.26.2025.04.11.00.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 00:40:59 -0700 (PDT)
Message-ID: <1024b26d-ad8e-4ad6-a7c7-232d32e5e872@daynix.com>
Date: Fri, 11 Apr 2025 16:40:56 +0900
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
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CACGkMEuuK4uUgfdcYaGnGhTvbwzcrVL4Po2UFanPPObSX7oskA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/04/08 15:33, Jason Wang wrote:
> On Mon, Apr 7, 2025 at 11:43 AM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> On 2025/04/07 11:41, Jason Wang wrote:
>>> On Sat, Mar 29, 2025 at 4:32 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>
>>>> On 2025/03/24 13:02, Jason Wang wrote:
>>>>> On Fri, Mar 21, 2025 at 3:01 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>>>
>>>>>> The previous description said:
>>>>>>> A driver sets \field{max_tx_vq} to inform a device how many transmit
>>>>>>> virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
>>>>>>
>>>>>> However, it also controls how many receive virtqueues a device MAY use.
>>>>>> Copy the description of the virtqueue_pairs field of struct
>>>>>> virtio_net_ctrl_mq_pairs_set, which also has the identical semantics, to
>>>>>> clarify that.
>>>>>
>>>>> Thanks for doing this, I wonder if it's time to rename as "max_tx_vq"
>>>>> sounds like a TX only thing.
>>>>
>>>> I'm no longer pursuing this change. Please see the discussion at:
>>>> https://lore.kernel.org/r/765a23aa-bb6b-4a01-89f1-31ad213b4715@daynix.com
>>>>
>>>> Please also review a change for QEMU based on the discussion:
>>>> https://lore.kernel.org/qemu-devel/20250322-vq-v2-1-cee0aafe6404@daynix.com
>>>
>>> Ok, so it seems that RSS implement a async RX/TX queue model instead
>>> of the MQ queue pairs:
>>>
>>> 1) rx available queue were controlled by indirection table
>>> 2) tx available queue were controlled by max_tx_vq
>>>
>>> So it introduces more "issues" like:
>>>
>>> 1) This calls a new uAPI as I suggested in another thread instead of
>>> reusing TUN_SET_QUEUE
>>
>> QEMU applies the same approach for both VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET
>> and VIRTIO_NET_CTRL_MQ_RSS_CONFIG, which is to parse the configuration
>> passed by the guest in QEMU and to pass the parsed configuration to TUN
>> via TUNSETQUEUE. Please see the patch for QEMU I mentioned in the
>> previous email for the actual implementation.
> 
> If this is true, even if guests want to have an async tx/rx queue
> number, the underlayer TAP will still choose a combined queue pair
> model.
> 
>>
>>> 2) If both MQ and RSS are negotiated, what happens if the driver is
>>> using both max_tx_vq and virtqueue_pairs. This seems unclear in the
>>> spec itself.
>>
>> The spec says the last one sent by the driver will be used. In version
>> 1.2, 5.1.6.5.5 "Device operation in multiqueue mode" says:
>>   > The driver enables multiqueue by sending a command using class
>>   > VIRTIO_NET_CTRL_MQ. The command selects the mode of multiqueue
>>   > operation, as follows:
>>   >  #define VIRTIO_NET_CTRL_MQ    4
>>   >  #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET        0 (for automatic
>>   >  receive steering)
>>   >  #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1 (for configurable
>>   >  receive steering)
>>   >  #define VIRTIO_NET_CTRL_MQ_HASH_CONFIG         2 (for configurable
>>   >  hash calculation)
>>   >
>>   > If more than one multiqueue mode is negotiated, the resulting device
>>   > configuration is defined by the last command sent by the driver.
> 
> I think it doesn't clarify all the cases. Consider we:
> 
> 1) configure flow A to use rx queue 4
> 2) set curr_queue_paris to 2
> 
> How to choose the rx queue in flow A? This needs some clarification
> e.g whether unclassified or automq or drop

Such a configuration is not possible. If VIRTIO_NET_CTRL_MQ_RSS_CONFIG 
configures flow A to use rx queue 4, the resulting number of queue pairs 
will be at least 5.

Regards,
Akihiko Odaki

> 
> Thanks
> 
>>
>> Regards,
>> Akihiko Odaki
>>
>>>
>>> THanks
>>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>>> ---
>>>>>>     device-types/net/description.tex | 4 +++-
>>>>>>     1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
>>>>>> index 76585b0..5178191 100644
>>>>>> --- a/device-types/net/description.tex
>>>>>> +++ b/device-types/net/description.tex
>>>>>> @@ -1578,7 +1578,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>>>>>>
>>>>>>     Field \field{indirection_table} is an array of receive virtqueues ids.
>>>>>>
>>>>>> -A driver sets \field{max_tx_vq} to inform a device how many transmit virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
>>>>>> +Field \field{max_tx_vq} specifies the number of the transmit and receive queues
>>>>>> +to be used up to \field{max_virtqueue_pairs}; subsequently, transmitq1\ldots
>>>>>> +transmitqn and receiveq1\ldots receiveqn where n=\field{max_tx_vq} MAY be used.
>>>>>>
>>>>>>     Fields \field{hash_key_length} and \field{hash_key_data} define the key to be used in hash calculation.
>>>>>>
>>>>>>
>>>>>> ---
>>>>>> base-commit: b495841a8e80d12c1130f8868f4128866291142d
>>>>>> change-id: 20250321-tx-78e44c50a035
>>>>>>
>>>>>> Best regards,
>>>>>> --
>>>>>> Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>>>
>>>>>
>>>>
>>>
>>
> 

