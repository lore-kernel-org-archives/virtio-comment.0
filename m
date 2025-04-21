Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B402AEE9
	for <virtio-comment@lists.linux.dev>; Mon, 21 Apr 2025 05:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745214131; cv=none; b=nJJKPn86AMMxwKjY+jmlM79qD4iNzxbBP8hrrl8s3pJfBV5cJIWaWnCHZcoSR007cdi4s5ve3TmwibDWAGTM+CZgBvX8fYU+c7UQn/NpNLapZNZFxzQASPKD9h2fvS1G8np5GCdtMImYMjkqA1+6VxMDe5jX7EuMyRv19zQiZBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745214131; c=relaxed/simple;
	bh=EWn6T5AbjPRwYERodXKdnO0qPxkeQd2CXWyXyphsUe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YA8JthqLv5lVxQU2p8FaCkVLt0Q8BIzFBXndGH1sCoxClPppgqqQtCsFtPp6YyDaX3Uvaf777wkDgc7xEz6imv1E3AvhBLS8E3tMHUm88v5JsREHOmg82yCq98fQ2ceHz4QvDJ1oU1vDsq7zcibrBDZSf1LNkXwglNTmgkCTso8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=BMGb036g; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="BMGb036g"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2241053582dso51586565ad.1
        for <virtio-comment@lists.linux.dev>; Sun, 20 Apr 2025 22:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1745214129; x=1745818929; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Ye9Wuk3bpS9guOH7xGwsnWAKlWNJLaf/oOlFVuk+no=;
        b=BMGb036gHRsXItQz1D0NyOG+R4RKg+7a3sp30gOWXYjlseXjsyyRtGlIv7rYE8WEIM
         sWtVIPs7ukva4kMhnGgUehLVSPwTCp8ZCTlzJr8LQgWsoNdCHqmmbrTNRFkBBF2xybtd
         BiHdhUP9DiOOqhPlgbMuia0xEBxxoJUyI1EsUf2HvFrmpOagPNJDvkkdHahKx//rXGgc
         r3sHRoKuU9WcXxcV6aV34N/elZusJM8lHs98D8FwQ6zGH5USFu6c3AxyyZ73lUMu/FVG
         dJkCTT9xq8lT+y7XCg85p8AXxtW+OPOpbnXDq88C1Nf6yRsG06jLA/lG2N621A2sY0D2
         Gptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745214129; x=1745818929;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ye9Wuk3bpS9guOH7xGwsnWAKlWNJLaf/oOlFVuk+no=;
        b=wTZIw6/218Lb4gRLih5ek+fIltCgi2/x1YJb1ppIt5uVNCSvXO8B4keDao12utc7jr
         PMvwUvpXMahjDUwFMzRlOSaL2ZzfrOBs2A7A0efe2KXnDOOUJ2UWi68Py79BXDDeOmlL
         9GWyBfqts0WjtDiFm6qttLJl56JbzFhcDtmso9PlgD37Tlu0TsOzSOGrUat+QGKuW6u3
         sIOrUUpj+hudFdbmd7+rfmrowCiBq3E0+ko74FfHihbNVmVwVOGLdTVw+qnWFgDwT0Is
         obqyGRGIyjM8ZfLa57IaD6A2d6K70pXVKNBuE/WTYygpi3n6NnVB7WfasolESo0smfhJ
         rmgA==
X-Gm-Message-State: AOJu0YyBiFnTEoLhf5grZoQZwiiyKV3LRFpkzTgicEeB66zHLAgehhO8
	fxVl6+dxSTh6HJ2MzxoNMcG9Quyx1v6aXxLcSkSUE8F5th2lFNYW0zNhVu+4Jys=
X-Gm-Gg: ASbGncsMuXjqhjQSe00kwfkjEHAaiKtEP1XD5GN8eZmc/Zbn6Y2a93NOZDogumWP2bG
	trslh14t/5akTUdiObvcPbzsa5LpWQAbvcMGkBhXaG9JqPlo0wvhLAW285A/t1b0BPa2gKTjABa
	kwZS7CmLm+k9R2zqTm4yY6ZwAhELEjPN9Yg6KTtQoKe0JOuhCb+HKcA6s+lYqxfNMakN89CBMvn
	14yGlIo0OqlyVdJmOJKeMK4hmLfLesmqhb69RO3o8J+CKwE1qXzb6Uocwkcs4T4MWAu/uTSAbnf
	nSGYtJc4KcRDr0oYcYQ1s73v6a/iBN+BtFfwiJBohIdTkY/IyDIFNA==
X-Google-Smtp-Source: AGHT+IHPsqxfNtjjNgkvBUFPQQ+AgDGeKEgO1Ye0z04oNQ4fR1NdVbpJXNG+LVyYRO5QcHNgEBkWxA==
X-Received: by 2002:a17:902:ce86:b0:220:c143:90a0 with SMTP id d9443c01a7336-22c535a7254mr149725165ad.24.1745214128594;
        Sun, 20 Apr 2025 22:42:08 -0700 (PDT)
Received: from [157.82.203.223] ([157.82.203.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf5398sm57486545ad.90.2025.04.20.22.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Apr 2025 22:42:08 -0700 (PDT)
Message-ID: <3f5af7fc-7418-4179-b191-7138e9d8fd08@daynix.com>
Date: Mon, 21 Apr 2025 14:42:06 +0900
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
 <51a96d2a-6911-4a6c-8108-4a523e836819@daynix.com>
 <CACGkMEvPTzNwyxjF1C1ZnL6wJUyojpJ8XH3L-py9R208HzdcOQ@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CACGkMEvPTzNwyxjF1C1ZnL6wJUyojpJ8XH3L-py9R208HzdcOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/04/21 11:56, Jason Wang wrote:
> On Sat, Apr 19, 2025 at 2:22 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> On 2025/04/16 16:38, Jason Wang wrote:
>>> On Fri, Apr 11, 2025 at 3:41 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>
>>>> On 2025/04/08 15:33, Jason Wang wrote:
>>>>> On Mon, Apr 7, 2025 at 11:43 AM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>>>
>>>>>> On 2025/04/07 11:41, Jason Wang wrote:
>>>>>>> On Sat, Mar 29, 2025 at 4:32 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>>>>>
>>>>>>>> On 2025/03/24 13:02, Jason Wang wrote:
>>>>>>>>> On Fri, Mar 21, 2025 at 3:01 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>>>>>>>
>>>>>>>>>> The previous description said:
>>>>>>>>>>> A driver sets \field{max_tx_vq} to inform a device how many transmit
>>>>>>>>>>> virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
>>>>>>>>>>
>>>>>>>>>> However, it also controls how many receive virtqueues a device MAY use.
>>>>>>>>>> Copy the description of the virtqueue_pairs field of struct
>>>>>>>>>> virtio_net_ctrl_mq_pairs_set, which also has the identical semantics, to
>>>>>>>>>> clarify that.
>>>>>>>>>
>>>>>>>>> Thanks for doing this, I wonder if it's time to rename as "max_tx_vq"
>>>>>>>>> sounds like a TX only thing.
>>>>>>>>
>>>>>>>> I'm no longer pursuing this change. Please see the discussion at:
>>>>>>>> https://lore.kernel.org/r/765a23aa-bb6b-4a01-89f1-31ad213b4715@daynix.com
>>>>>>>>
>>>>>>>> Please also review a change for QEMU based on the discussion:
>>>>>>>> https://lore.kernel.org/qemu-devel/20250322-vq-v2-1-cee0aafe6404@daynix.com
>>>>>>>
>>>>>>> Ok, so it seems that RSS implement a async RX/TX queue model instead
>>>>>>> of the MQ queue pairs:
>>>>>>>
>>>>>>> 1) rx available queue were controlled by indirection table
>>>>>>> 2) tx available queue were controlled by max_tx_vq
>>>>>>>
>>>>>>> So it introduces more "issues" like:
>>>>>>>
>>>>>>> 1) This calls a new uAPI as I suggested in another thread instead of
>>>>>>> reusing TUN_SET_QUEUE
>>>>>>
>>>>>> QEMU applies the same approach for both VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET
>>>>>> and VIRTIO_NET_CTRL_MQ_RSS_CONFIG, which is to parse the configuration
>>>>>> passed by the guest in QEMU and to pass the parsed configuration to TUN
>>>>>> via TUNSETQUEUE. Please see the patch for QEMU I mentioned in the
>>>>>> previous email for the actual implementation.
>>>>>
>>>>> If this is true, even if guests want to have an async tx/rx queue
>>>>> number, the underlayer TAP will still choose a combined queue pair
>>>>> model.
>>>>>
>>>>>>
>>>>>>> 2) If both MQ and RSS are negotiated, what happens if the driver is
>>>>>>> using both max_tx_vq and virtqueue_pairs. This seems unclear in the
>>>>>>> spec itself.
>>>>>>
>>>>>> The spec says the last one sent by the driver will be used. In version
>>>>>> 1.2, 5.1.6.5.5 "Device operation in multiqueue mode" says:
>>>>>>     > The driver enables multiqueue by sending a command using class
>>>>>>     > VIRTIO_NET_CTRL_MQ. The command selects the mode of multiqueue
>>>>>>     > operation, as follows:
>>>>>>     >  #define VIRTIO_NET_CTRL_MQ    4
>>>>>>     >  #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET        0 (for automatic
>>>>>>     >  receive steering)
>>>>>>     >  #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1 (for configurable
>>>>>>     >  receive steering)
>>>>>>     >  #define VIRTIO_NET_CTRL_MQ_HASH_CONFIG         2 (for configurable
>>>>>>     >  hash calculation)
>>>>>>     >
>>>>>>     > If more than one multiqueue mode is negotiated, the resulting device
>>>>>>     > configuration is defined by the last command sent by the driver.
>>>>>
>>>>> I think it doesn't clarify all the cases. Consider we:
>>>>>
>>>>> 1) configure flow A to use rx queue 4
>>>>> 2) set curr_queue_paris to 2
>>>>>
>>>>> How to choose the rx queue in flow A? This needs some clarification
>>>>> e.g whether unclassified or automq or drop
>>>>
>>>> Such a configuration is not possible. If VIRTIO_NET_CTRL_MQ_RSS_CONFIG
>>>> configures flow A to use rx queue 4, the resulting number of queue pairs
>>>> will be at least 5.
>>>
>>> Yes, this could be prevented by a well formed driver. But I mean from
>>> the device side, such commands could be sent from the driver that is
>>> something both spec and the implementation (e.g TAP) needs to
>>> consider.
>>
>> If VIRTIO_NET_CTRL_MQ_RSS_CONFIG is the last command, it must define the
>> number of queue pairs since the spec says the resulting device
>> configuration is defined by the last command sent by the driver. So if
>> VIRTIO_NET_CTRL_MQ_RSS_CONFIG configures flow A to use rx queue 4, the
>> command also define that the number of queue pairs to be at least 5.
>> Therefore, it is not possible for a driver to define the number of queue
>> pairs contradicting with the flow configuration.
> 
> Yes, but I meant what happens if there's a
> VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET afterwards that sets queue pairs to 2.
> In this case, should the flow go with which queue?

The past configuration made by VIRTIO_NET_CTRL_MQ_RSS_CONFIG will be 
ignored since the last command defines the configuration according to 
5.1.6.5.5 "Device operation in multiqueue mode". Instead, the device 
will steer packets according to 5.1.6.5.6 "Automatic receive steering in 
multiqueue mode":

 > When multiqueue is enabled by VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET command,
 > the device MUST use automatic receive steering based on packet flow.
 > Programming of the receive steering classificator is implicit. After
 > the driver transmitted a packet of a flow on transmitqX, the device
 > SHOULD cause incoming packets for that flow to be steered to
 > receiveqX. For uni-directional protocols, or where no packets have
 > been transmitted yet, the device MAY steer a packet to a random queue
 > out of the specified receiveq1…receiveqn.

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
>>> Thanks
>>>
>>>
>>>>
>>>> Regards,
>>>> Akihiko Odaki
>>>>
>>>>>
>>>>> Thanks
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Akihiko Odaki
>>>>>>
>>>>>>>
>>>>>>> THanks
>>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>>>>>>> ---
>>>>>>>>>>       device-types/net/description.tex | 4 +++-
>>>>>>>>>>       1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
>>>>>>>>>> index 76585b0..5178191 100644
>>>>>>>>>> --- a/device-types/net/description.tex
>>>>>>>>>> +++ b/device-types/net/description.tex
>>>>>>>>>> @@ -1578,7 +1578,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>>>>>>>>>>
>>>>>>>>>>       Field \field{indirection_table} is an array of receive virtqueues ids.
>>>>>>>>>>
>>>>>>>>>> -A driver sets \field{max_tx_vq} to inform a device how many transmit virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
>>>>>>>>>> +Field \field{max_tx_vq} specifies the number of the transmit and receive queues
>>>>>>>>>> +to be used up to \field{max_virtqueue_pairs}; subsequently, transmitq1\ldots
>>>>>>>>>> +transmitqn and receiveq1\ldots receiveqn where n=\field{max_tx_vq} MAY be used.
>>>>>>>>>>
>>>>>>>>>>       Fields \field{hash_key_length} and \field{hash_key_data} define the key to be used in hash calculation.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> ---
>>>>>>>>>> base-commit: b495841a8e80d12c1130f8868f4128866291142d
>>>>>>>>>> change-id: 20250321-tx-78e44c50a035
>>>>>>>>>>
>>>>>>>>>> Best regards,
>>>>>>>>>> --
>>>>>>>>>> Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 

