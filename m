Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5451DEFEA
	for <virtio-comment@lists.linux.dev>; Tue,  8 Oct 2024 13:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728393251; cv=none; b=ZdTMRJXqe3DA1HhV8MyA7UNKR+dsr0cen6q/GEng7t4P4JABP08Fa1+z6mx1GMFmMWBNvPlECzLJCNkp2VS+h3/WAGaLBU4JFA2xBA64PnKEsmBC1x32J5zBnpJ4G3EOQtEzzW1ygwIQgFNz2jsy/VgIEYbN/eXzV+BAs3L40qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728393251; c=relaxed/simple;
	bh=AQUSuGCFPvRLbrw02wC2G7BH9S+/4zGgpeIW65ofxcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gZjfjNs/CBLF9K3ypl+HK5xzCGxlm19m4u7ceukE8GccB9dDqiJp+vwk0C7MJ0x33JlLo4hMrvaiZ6gZRySllvAMkzF+k+6Bjx7iO51AV2c/3fydeDySpWO7Rg9qpAzG+Za3H8EQU59VXG+p3C4m9BgJ8feid37p9cIEfrnEbRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JEAuC3RO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JEAuC3RO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728393249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8ewrDOuwVA3YjfouZvEe5813Ckz1vWZTtWfIo2DGbG8=;
	b=JEAuC3ROJLZukg3SSZRHrYCaAX6RwdLa8rzoKqzMzZaemmvOc02nUeehpankLeTyuQH3fS
	A99HmYX24JJNwe9i1Taf4hTmYcESG0prSALrE9B9ig8JZlNYtCxp2GCOvmVU6GdSyxc22j
	m/0BmgxrOiXNRSMNp2qeCfPViOKAYKQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-4Fovsmi6NvWJ-dH_OEgAJw-1; Tue, 08 Oct 2024 09:14:07 -0400
X-MC-Unique: 4Fovsmi6NvWJ-dH_OEgAJw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42cb08ed3a6so30828585e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 08 Oct 2024 06:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728393246; x=1728998046;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ewrDOuwVA3YjfouZvEe5813Ckz1vWZTtWfIo2DGbG8=;
        b=tmceMFQMrjag0oMhAmo1DjEdv/oBAnC2VOEmCpcQPhn1nwRRi5fPri5BePLd4mSKeF
         XYGGNwsClA6SAYo6OK+jdx5FqZuvKQt/ee0gvhr0b03VBI39H7Qa1AIyFu9c1joXOUtb
         UlzQUyBFV32yrjuUZU5fzN48I/sKVGuqni6WAnrv8OSb0inkUtK8/yiybB8e6qldaH7I
         uAhfRp9YOSzPyLTtAq2OiDLPF9t1p8UV6/bADsyl6IhacmXvfC5lBM1G81YB26Z861yR
         gzhRZKAEl8fIAQEFYfT/FaJIJ/VmJnwY0B/Nh8mG7oIonXyKJbo4kXNu7su4wdnMBKp3
         49jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfhw7eWQef9/kAvcuDQ0xJf0kzJ2odRsFPa4db+9s/m6ps5r7l52nZZbg3jFGuS/6Chi4LBDRBi2z7C6sVWA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHumsRJ/20Cx3DBmHQ8XoiR0Xy4bbAHzeCySWeREc4aW2juO9t
	IhSbh/KBTgbm4BqMfDoETCjF3RAl6DcOfABaqo8UtBU4KSN80L/U/CgZybLkkAasMlyer9QsLtH
	95v3PRm4Eg8EHuSRQdll/+BgWIcqXYgo7qbijyQ6tGFbWdjYgA+PHFmRdZkf/xPBq
X-Received: by 2002:a05:600c:3110:b0:42c:b826:a26c with SMTP id 5b1f17b1804b1-42f94bcdcdcmr19668685e9.8.1728393246473;
        Tue, 08 Oct 2024 06:14:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYIEjouD3TgMlHjiu1dKA+M7sB/0bH50PUAexIerLqXNvKcTbjmBQUqdk5WHf+B3ADmjFQGQ==
X-Received: by 2002:a05:600c:3110:b0:42c:b826:a26c with SMTP id 5b1f17b1804b1-42f94bcdcdcmr19668465e9.8.1728393246047;
        Tue, 08 Oct 2024 06:14:06 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:c700:a76f:473d:d5cf:25a8? (p200300cbc72fc700a76f473dd5cf25a8.dip0.t-ipconnect.de. [2003:cb:c72f:c700:a76f:473d:d5cf:25a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89eaabb5sm109630575e9.22.2024.10.08.06.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 06:14:05 -0700 (PDT)
Message-ID: <12281338-d1e7-4b4e-91f4-571059e1410b@redhat.com>
Date: Tue, 8 Oct 2024 15:14:05 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio-mem: introduce VIRTIO_MEM_F_PERSISTENT_SUSPEND
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: Juraj Marcin <jmarcin@redhat.com>, virtio-comment@lists.linux.dev,
 Cornelia Huck <cohuck@redhat.com>
References: <20240809140403.484556-1-jmarcin@redhat.com>
 <11d91474-5b53-49f8-9301-a2db885948a0@redhat.com> <ZwPutFATuftmzHK6@fedora>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ZwPutFATuftmzHK6@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.10.24 16:22, Matias Ezequiel Vara Larsen wrote:
> On Mon, Oct 07, 2024 at 10:17:23AM +0200, David Hildenbrand wrote:
>> On 09.08.24 16:03, Juraj Marcin wrote:
>>> Before, the behavior while suspending to a deep sleep state and waking
>>> up was not specified. For example, in x86 QEMU VM all devices receive a
>>> reset request during wake-up. This would lead to unplugging of all the
>>> plugged memory blocks. Due to this, suspending is disallowed in the
>>> Linux Kernel, when plugged memory is present and
>>> VIRTIO_MEM_F_PERSISTENT_SUSPEND feature flag is not advertised by the
>>> virtio-mem device.
>>>
>>> This new flag should signal to the guest driver, that the device can
>>> correctly suspend to a deep sleep state and then wake up without
>>> disrupting the plugged memory blocks. This feature flag is already
>>> supported in the Linux Kernel [1] and should be soon also supported in
>>> QEMU [2].
>>>
>>> [1]: https://lore.kernel.org/all/20240318120645.105664-1-david@redhat.com/
>>> [2]: https://lore.kernel.org/all/20240806160756.182524-1-jmarcin@redhat.com/
>>>
>>> Signed-off-by: Juraj Marcin <jmarcin@redhat.com>
>>> ---
>>>    device-types/mem/description.tex | 12 ++++++++++++
>>>    1 file changed, 12 insertions(+)
>>>
>>> diff --git a/device-types/mem/description.tex b/device-types/mem/description.tex
>>> index 0a6d558..5bff24c 100644
>>> --- a/device-types/mem/description.tex
>>> +++ b/device-types/mem/description.tex
>>> @@ -60,6 +60,8 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Device / Feature bits}
>>>    access unplugged memory. \footnote{On platforms with memory properties that
>>>    might get modified implicitly on memory access, this feature is expected to
>>>    be offered by the device.}
>>> +\item[VIRTIO_MEM_F_PERSISTENT_SUSPEND (2)] The driver can allow the guest
>>> +system to enter suspended state (deep sleep, suspend-to-RAM).
>>>    \end{description}
>>>    \subsection{Device configuration layout}\label{sec:Device Types / Memory Device / Device configuration layout}
>>> @@ -174,6 +176,9 @@ \subsection{Device Initialization}\label{Device Types / Memory Device / Device I
>>>    The device MUST NOT modify memory or memory properties of plugged memory
>>>    blocks during device reset.
>>> +The device SHOULD offer VIRTIO_MEM_F_PERSISTENT_SUSPEND if the platform
>>> +supports suspending (deep sleep, suspend-to-RAM) with plugged memory blocks.
>>> +
>>>    \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Operation}
>>>    The device notifies the driver about the amount of memory the device wants
>>> @@ -268,6 +273,9 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
>>>    memory blocks to unplug them, or it would not be able to make use of
>>>    unplugged memory blocks after plugging them (e.g., alignment).
>>> +If VIRTIO_MEM_F_PERSISTENT_SUSPEND has not been negotiated, the driver MUST NOT
>>> +allow the guest system to enter a suspended state (deep sleep, suspend-to-RAM).
> 
> I think `guest system` could be simply `guest` but I do not have a
> strong opinion about it.

Makes sense. @Juraj, can you respin with that adjusted?

I'll open an issue afterwards and request a vote.

-- 
Cheers,

David / dhildenb

