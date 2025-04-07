Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D076224FD
	for <virtio-comment@lists.linux.dev>; Mon,  7 Apr 2025 03:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743997434; cv=none; b=n5TKuMJsdje6MGd8GQMaBGL7XS3X7p7IBYHUOOGRa71f/wGQwrfCT8/dSFWstYdmaYkw6jzOvEOoXo0CViXlR0MlkSWEitFPCsuktP2UGBSsfzWxjRSbC6wOJS/TmegfQSbsqewX3cd2mVyD/8JjV7Forv2MyvzahEfgH5grkKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743997434; c=relaxed/simple;
	bh=huMW51W3thOuBDtYUJhvw/VBHQFtlN2XrwsJblv75fU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZEqK8aJi/0n0tVTuWroNenxOPw/OLWauKxiN8Svz49Q4cIuJSYaicLHoba8LDe1h2eTbQpUsjMybisRHFdm2mXJ8k3SncBgFaL3NR7nhzcPn5xwq4nSNp8TP0xophSX/+qoS1zKZFpASIN67CwbzLwIz3Ajx1vAtg1Po7Gx3U5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=0ZfifG9A; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="0ZfifG9A"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7399838db7fso3256336b3a.0
        for <virtio-comment@lists.linux.dev>; Sun, 06 Apr 2025 20:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1743997431; x=1744602231; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=euKPBJEN8FPA5Bt33m+vom9Z6he3xBv6opRquCa34ug=;
        b=0ZfifG9A4Etco6gr6sOxf50W3pLcOOrrgkMrzVK75jdx//zS73qsbyq0XPo+A3+s5l
         2T8VzhOTYjgZQKFiSdjda4jzAJi1Lo/Bg1+RTitOTBuI5LurgX5pqhk6OaQl5n/lu1SU
         4KB77V49RoUBMdhvMVGrgNPmTd2ObvJvNWXiOvmA6opJM/mY/pK8izodGs/yxtoMjVYX
         J7VsamFF0sXzrjG79agXFgk4wcrSDZqgSXwtkVX9s26byofgFrwh5spfQuE5XQ6qqktB
         DcV/KOH6J4OQ0R9MHInaBrqmFmqQjs9VBN51tv+3PTmAROxMc4v0YlIL/opUynZ2woce
         wQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743997431; x=1744602231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=euKPBJEN8FPA5Bt33m+vom9Z6he3xBv6opRquCa34ug=;
        b=tApA3ZS3Lvz7H2EVHEA+eYC3lGfjTYg3zk6XaIBdZB3AMzNMJaJGWKpDR05SKlILli
         L/m5B8Wwr/VFhmzY2DXBw4dn8NWnVDlegQp+Gx2tMSMb3duHKre3B22LQopA/CxvG4Tp
         54PzMy+XFrmAK5A8Bxp3gfSj5NJBgYtQs10E4/lIHvjxOQNQwtjFmcvxQU0NhSjxO3Nl
         2GGXR5gqxdDQRb55+IA8s0orcteG0PeFTmXUbaEtOE7PYirU4Uvkhc2jxsELt2xS+0Ic
         K9qLvsqZ37yZ3nx/ahDivUeei31+sjgRZ7rHRiUatlXL0cDz32vt9nxe55e/1AK+ypdV
         nzOg==
X-Gm-Message-State: AOJu0YzbkVjSZ5uzNye7tJaLI4E53d8eR377S6mGMvCJ1o9gbqnIVmDq
	mSVD7TuvRm7YuJAJ5elDHl3RSyVOy71RGtWkB5es1zNbgCaYwAx+clvzRWH0aH4=
X-Gm-Gg: ASbGncvZUqW298sHld2CRnWxPnyuqJb2aFt0FMuLu2mCt9lHjdZTpHeV8q+h2MGLmX6
	QjHSBnvukHyYcEJX2WbxTiDTx5Td6UTPUaBNPACCc+Zd1V5a8ZOIUlr0B3GZ4i/CkHoYFSCW2+0
	fp+XorcLaTtUj0g9cnOABmEEoffnxCnQb1EOuKibdVGhP/O1l8GTuxhxpMvRk5yMSvvT7CRQd2L
	k6udZQAcmeLNfZKxRk5cu20hlmxAEHmk9GiyincGfMcAMTh7M6tGX35HSg+Doo3lLoPo7J11pd1
	9QEmgbLYs6yRGzft3+iYABDXVxnfARtyHhP2WQO2ztwP9vkCXrkXeIP3mqwcuT7k4ijV0qQxBBO
	Ja+hUA39ZebGfgQQ6rs7Ma+M=
X-Google-Smtp-Source: AGHT+IGeCsmA1Ek1tOeIuR0CoJx5dHokuc96r0V3nGrXj47Muk9z/5tJJyUWNwl519dH/s6q5fTVEw==
X-Received: by 2002:a05:6a00:3b8c:b0:736:b400:b58f with SMTP id d2e1a72fcca58-739d5e14137mr18316296b3a.0.1743997431326;
        Sun, 06 Apr 2025 20:43:51 -0700 (PDT)
Received: from ?IPV6:2400:4050:b783:b00:9e36:5f4c:928c:4ec2? ([2400:4050:b783:b00:9e36:5f4c:928c:4ec2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d1c7esm7376080b3a.36.2025.04.06.20.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 20:43:50 -0700 (PDT)
Message-ID: <6edb002d-406f-4f50-827a-14fe2228a650@daynix.com>
Date: Mon, 7 Apr 2025 12:43:48 +0900
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
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CACGkMEtqXtLeNTdcg0j57EX-4953htM9PWH+KQdRLBM=3jWgjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/04/07 11:41, Jason Wang wrote:
> On Sat, Mar 29, 2025 at 4:32 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> On 2025/03/24 13:02, Jason Wang wrote:
>>> On Fri, Mar 21, 2025 at 3:01 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>
>>>> The previous description said:
>>>>> A driver sets \field{max_tx_vq} to inform a device how many transmit
>>>>> virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
>>>>
>>>> However, it also controls how many receive virtqueues a device MAY use.
>>>> Copy the description of the virtqueue_pairs field of struct
>>>> virtio_net_ctrl_mq_pairs_set, which also has the identical semantics, to
>>>> clarify that.
>>>
>>> Thanks for doing this, I wonder if it's time to rename as "max_tx_vq"
>>> sounds like a TX only thing.
>>
>> I'm no longer pursuing this change. Please see the discussion at:
>> https://lore.kernel.org/r/765a23aa-bb6b-4a01-89f1-31ad213b4715@daynix.com
>>
>> Please also review a change for QEMU based on the discussion:
>> https://lore.kernel.org/qemu-devel/20250322-vq-v2-1-cee0aafe6404@daynix.com
> 
> Ok, so it seems that RSS implement a async RX/TX queue model instead
> of the MQ queue pairs:
> 
> 1) rx available queue were controlled by indirection table
> 2) tx available queue were controlled by max_tx_vq
> 
> So it introduces more "issues" like:
> 
> 1) This calls a new uAPI as I suggested in another thread instead of
> reusing TUN_SET_QUEUE

QEMU applies the same approach for both VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET 
and VIRTIO_NET_CTRL_MQ_RSS_CONFIG, which is to parse the configuration 
passed by the guest in QEMU and to pass the parsed configuration to TUN 
via TUNSETQUEUE. Please see the patch for QEMU I mentioned in the 
previous email for the actual implementation.

> 2) If both MQ and RSS are negotiated, what happens if the driver is
> using both max_tx_vq and virtqueue_pairs. This seems unclear in the
> spec itself.

The spec says the last one sent by the driver will be used. In version 
1.2, 5.1.6.5.5 "Device operation in multiqueue mode" says:
 > The driver enables multiqueue by sending a command using class
 > VIRTIO_NET_CTRL_MQ. The command selects the mode of multiqueue
 > operation, as follows:
 >  #define VIRTIO_NET_CTRL_MQ    4
 >  #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET        0 (for automatic
 >  receive steering)
 >  #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1 (for configurable
 >  receive steering)
 >  #define VIRTIO_NET_CTRL_MQ_HASH_CONFIG         2 (for configurable
 >  hash calculation)
 >
 > If more than one multiqueue mode is negotiated, the resulting device
 > configuration is defined by the last command sent by the driver.

Regards,
Akihiko Odaki

> 
> THanks
> 
> 
>>
>>>
>>>>
>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>> ---
>>>>    device-types/net/description.tex | 4 +++-
>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
>>>> index 76585b0..5178191 100644
>>>> --- a/device-types/net/description.tex
>>>> +++ b/device-types/net/description.tex
>>>> @@ -1578,7 +1578,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>>>>
>>>>    Field \field{indirection_table} is an array of receive virtqueues ids.
>>>>
>>>> -A driver sets \field{max_tx_vq} to inform a device how many transmit virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
>>>> +Field \field{max_tx_vq} specifies the number of the transmit and receive queues
>>>> +to be used up to \field{max_virtqueue_pairs}; subsequently, transmitq1\ldots
>>>> +transmitqn and receiveq1\ldots receiveqn where n=\field{max_tx_vq} MAY be used.
>>>>
>>>>    Fields \field{hash_key_length} and \field{hash_key_data} define the key to be used in hash calculation.
>>>>
>>>>
>>>> ---
>>>> base-commit: b495841a8e80d12c1130f8868f4128866291142d
>>>> change-id: 20250321-tx-78e44c50a035
>>>>
>>>> Best regards,
>>>> --
>>>> Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>
>>>
>>
> 

