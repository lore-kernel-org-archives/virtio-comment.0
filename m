Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6938A13D291
	for <virtio-comment@lists.linux.dev>; Mon, 14 Oct 2024 12:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728907291; cv=none; b=CnJ4aEyURx3StAF5QFZi3edS5+2CLvoPjg/5pgyYdhbHzuws7zVIhhLIH+KlEYWyzoaoa7rC9VJ2+XMlR9HN/BFSkcgC8KLjK+oJeeq+McIASRc329pddQfaTx24rYrgqTJ2A/9EywpvWgigIumpWwCHzRGKDx6XLgrwyym6MIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728907291; c=relaxed/simple;
	bh=68SMEG2l01i5d/XciVDb910jWdjhmDur76RNZy8JmcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uaXkt3UlGF3MiGJ8g5qJHUwKZ8p9rhpc5+wFP/ne+RmUSV/Gbmn1cJb/5ZZkQ68GqdUvES48Zi4YEeAx5nl4vfXxdUIQZ3VxI8FCm06goG1+Ou963ApspgouQWB60wL/8bDABaIoS/IoO4dmHPmROmCkNGLyzFhkmQXz6fVblDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fP7nzMbw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fP7nzMbw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728907288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lfSjnksvHShMgQkpYu60ptALWwNi+IQwqKXSzLmONjQ=;
	b=fP7nzMbwnZt+w0UJb6vW8k/4wUbcXuwZvmQA17OLvlzLiEDfmxat91drGmMWXuXTb5p4dh
	RJURrrsght+RhHJKSV9L17FK0a2SK6vNQ6okWMwz4qgdP9r6+raAluTEuhUKlzmFH9xald
	h+8BbrhT+gq8nzishbnDeWCZTwPOd3g=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-gVUBJJeRNkawQ1SJNXKzyA-1; Mon, 14 Oct 2024 08:01:25 -0400
X-MC-Unique: gVUBJJeRNkawQ1SJNXKzyA-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-539e91e12bbso1207072e87.2
        for <virtio-comment@lists.linux.dev>; Mon, 14 Oct 2024 05:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728907284; x=1729512084;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfSjnksvHShMgQkpYu60ptALWwNi+IQwqKXSzLmONjQ=;
        b=BxnXbOhllJAyjDFlAyRPsJGXbVWiNI0npw+gxmbU4pIIU9DM9ivBveHlY0yRvjkN8V
         M/lNiNybC6FhRxn0w47c2cgNToHvNOHvpy3IWEbj84ETI9/3yNixcsQFKC29X5Lb7Y5V
         HiOLwBRDj8dpecZc55Yh7o8lNxnFLkDH5GGwxjZXfrQUjyZdY9qcftjIhpIEfBLLjIBx
         5qH3Sq2fB3q4UQo4BeG6VAk96Y9fo730MLYQaJdD02ySJcEvmkw7YDmVc5ArkNAl7jnQ
         ouwsU3DOdL9cMStBe2xauCNU7/GXtDEuLJ989MN+f7fbD2AoVuzvVmfKHnKnEyOcABII
         zriw==
X-Forwarded-Encrypted: i=1; AJvYcCUkGnjfkZL6p24WSljaXlbxSwVeqc6GMsCP1Ymufr5+2dDzyOqKfSPxiFgUJj1G/LxOofhjRvJ2M+uRv0kAqg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2kG8WZ+/ahaeUmujbgQ7cL9CcZDXmQlHVq4A4LuGkh44t/dxk
	d+CYaIq1B3cILt9AvU90l4pIW0d4j3m/33I5mqJYqDhNhXw7EQo26/YjkbiwecxGi0+ABHcVJs0
	8diYVbmUCL2w0F+T1wN2fyiN1NXLHAQcL5IueO6AKgkQ8W5riAipCPMfcN9wiX4bH
X-Received: by 2002:a05:6512:2313:b0:533:d3e:16fe with SMTP id 2adb3069b0e04-539e571dadbmr2803089e87.38.1728907284302;
        Mon, 14 Oct 2024 05:01:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW3T1MQ56dgPC0EwBjDqCTOlNooQ/IZTipFGiEMhzGZr4EDvzIz2tyozxdPAMOM4x9yW55zA==
X-Received: by 2002:a05:6512:2313:b0:533:d3e:16fe with SMTP id 2adb3069b0e04-539e571dadbmr2803065e87.38.1728907283786;
        Mon, 14 Oct 2024 05:01:23 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf49910sm151797905e9.20.2024.10.14.05.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 05:01:23 -0700 (PDT)
Message-ID: <95f857f3-a113-401b-ae8d-7bf0a53f261a@redhat.com>
Date: Mon, 14 Oct 2024 14:01:22 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] virtio-mem: introduce VIRTIO_MEM_F_PERSISTENT_SUSPEND
To: Juraj Marcin <jmarcin@redhat.com>, virtio-comment@lists.linux.dev
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20241009090202.10544-2-jmarcin@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20241009090202.10544-2-jmarcin@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.10.24 11:01, Juraj Marcin wrote:
> Before, the behavior while suspending to a deep sleep state and waking
> up was not specified. For example, in x86 QEMU VM all devices receive a
> reset request during wake-up. This would lead to unplugging of all the
> plugged memory blocks. Due to this, suspending is disallowed in the
> Linux Kernel, when plugged memory is present and
> VIRTIO_MEM_F_PERSISTENT_SUSPEND feature flag is not advertised by the
> virtio-mem device.
> 
> This new flag should signal to the guest driver, that the device can
> correctly suspend to a deep sleep state and then wake up without
> disrupting the plugged memory blocks. This feature flag is already
> supported in the Linux Kernel [1] and also supported in QEMU [2].
> 
> [1]: https://lore.kernel.org/all/20240318120645.105664-1-david@redhat.com/
> [2]: https://lore.kernel.org/all/20240904103722.946194-1-jmarcin@redhat.com/
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> Signed-off-by: Juraj Marcin <jmarcin@redhat.com>
> ---
> v2:
> - replaced "guest system" with "guest", suggested by Matias
> - updated QEMU patch series link
> ---
>   device-types/mem/description.tex | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/device-types/mem/description.tex b/device-types/mem/description.tex
> index 0a6d558..9acf63f 100644
> --- a/device-types/mem/description.tex
> +++ b/device-types/mem/description.tex
> @@ -60,6 +60,8 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Device / Feature bits}
>   access unplugged memory. \footnote{On platforms with memory properties that
>   might get modified implicitly on memory access, this feature is expected to
>   be offered by the device.}
> +\item[VIRTIO_MEM_F_PERSISTENT_SUSPEND (2)] The driver can allow the guest
> +to enter suspended state (deep sleep, suspend-to-RAM).
>   \end{description}
>   
>   \subsection{Device configuration layout}\label{sec:Device Types / Memory Device / Device configuration layout}
> @@ -174,6 +176,9 @@ \subsection{Device Initialization}\label{Device Types / Memory Device / Device I
>   The device MUST NOT modify memory or memory properties of plugged memory
>   blocks during device reset.
>   
> +The device SHOULD offer VIRTIO_MEM_F_PERSISTENT_SUSPEND if the platform
> +supports suspending (deep sleep, suspend-to-RAM) with plugged memory blocks.
> +
>   \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Operation}
>   
>   The device notifies the driver about the amount of memory the device wants
> @@ -268,6 +273,9 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
>   memory blocks to unplug them, or it would not be able to make use of
>   unplugged memory blocks after plugging them (e.g., alignment).
>   
> +If VIRTIO_MEM_F_PERSISTENT_SUSPEND has not been negotiated, the driver MUST NOT
> +allow the guest to enter a suspended state (deep sleep, suspend-to-RAM).
> +
>   \devicenormative{\subsubsection}{Device Operation}{Device Types / Memory Device / Device Operation}
>   
>   The device MUST provide the exact same memory properties with the exact same
> @@ -293,6 +301,10 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
>   
>   The device SHOULD unplug all memory blocks during system resets.
>   
> +If VIRTIO_MEM_F_PERSISTENT_SUSPEND has been negotiated, the device MUST NOT not
> +change the state of memory blocks when suspending or when waking up from
> +suspended state (deep sleep, suspend-to-RAM).
> +
>   \subsubsection{PLUG request}\label{sec:Device Types / Memory Device / Device Operation / PLUG request}
>   
>   Request to plug consecutive memory blocks that are currently unplugged.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/207

v1 was on the list for more than 2 months, and there was only a minor 
change for v2.

Conny, Michael, can you please open a TC vote?

-- 
Cheers,

David / dhildenb

