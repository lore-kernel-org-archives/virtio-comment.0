Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80C7502BE
	for <virtio-comment@lists.linux.dev>; Tue,  6 May 2025 15:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546026; cv=none; b=GGWpga3TfrzYQUjkv8tgGfqABDsFHTJ/vAOgVxOUD5pK59DzXfUyHBqY0SMJZbVm6ERRmtDE0O6REtAuTB1Paz4L/c0E6Q6TXSuTW39EXDtNm1pA9QcEWSSSHF+OEW9RGDm8qtaVExTighxVJzMfPFbE9NtTHqFnb5qMNtmw/6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546026; c=relaxed/simple;
	bh=BKUvZb5L188rF0rI16vHI9olaC9tUGtRIxBQ4dbdHEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxZLFVC9pScMGTZoO5hjNgSWV80njoI/kPmwWhSYsGIz5eVsYEc62n8RU3vmQ6QAUIR70oyXC/HGyQmibF/2dXBAD3cktD8vxqEy0iZPlsOuCXjeGygVje5dSBWq8faAr0yGVS3Tg9ZRvrKFXb2xqnmYDFFCKwpDbVo+APvv4B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d9Aad3bB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d9Aad3bB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746546022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f3J3mkeSH6g287oEcwynEPWv23QAj/b+wJLb9Al6Vxs=;
	b=d9Aad3bBY+ZgG1OTm/wA4/wb2a1R2tTqGRlfrc5Oq3GWJp4kgNwpg6LYUXh5Mv01S1N0Ab
	MR8Xei0NyDC9BnPdo+arNONx9uROeVt1SLoDGLwzqZ6WPjfdyz+uv5jcBU00nXLOuBfwVw
	hii8VYnm3QuFSz2dLjKxbzB50cdPv4g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-zlNMJUtNOpGTsu3Q4mt3Bw-1; Tue, 06 May 2025 11:40:21 -0400
X-MC-Unique: zlNMJUtNOpGTsu3Q4mt3Bw-1
X-Mimecast-MFC-AGG-ID: zlNMJUtNOpGTsu3Q4mt3Bw_1746546020
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a064c45f03so2483404f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 06 May 2025 08:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546020; x=1747150820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f3J3mkeSH6g287oEcwynEPWv23QAj/b+wJLb9Al6Vxs=;
        b=Azn/NxG/o4AuGy/dlIjODHD4GN//Jw4/leUIhKt27nZjZYkw1f9TNG7OgfKd7d+oUA
         v4sq1l4f6c3rwegqab68dAXqnKsBSVfeAcxQV116W12XtAJ8Tv8LgdQkfBikfkSj2tpC
         8LdNQBR4R5+23+imDr/LBP1uBZm6uMM6vZKK0bIjeReQEoA7PvXGF6gjluPS8s201rP2
         07B+iTzSf5TbwiUZo+DcRBA/esZkQwk0CUP9RQNxTERYrvWSXJLg11bfnvOsDmkLAWZL
         2xY4z0bL0JJkgaPFXDCtBIk/X9Sqfipz9LOIXpFZ5/cydo2XktPhn0LQ92AdYNb50zj9
         6WIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxXZHhtl5OJc1JXJ/TApUCfa5KxkUxVilRuIjlajoOiVrdsWfCl7AEuBcOLJsKfCA3ATUuhpzWaSA0+Ux7eA==@lists.linux.dev
X-Gm-Message-State: AOJu0YylK5YQNUH+vwFKc+wifZKuZ80ul/a/estDxbVUEnnpnlVlstOe
	oirXrUiGrmgbsdT5QnM5u0B+soPv7nC3INt3dIxy7MIbMnBX5kheXr6m/59wQGUhsKL/ow0GtSR
	jm4dLucBdqM5jb26SY5wkIId40TwBQpkp2/Dwl+SRGMxlwBJKI3pUzOXO1YOLZOmQ
X-Gm-Gg: ASbGnctsaZ9crQeCQJLeCJa8ejbK2f+N7sLgJ/xN0xOcC3TocA98TyYPJGo/LpRd9Xf
	MYqNd8rQ/yN++PP+fyKDystao7qdWGoYtjAKgbo6Cc88JXkz8RCuL9sRfTeQJOZypo7Q5gzHdnW
	pM2iwuDHkiNEcCAC8pp3lYRFsLG0F4Czrp1yQF+kWJQWl477schM3OO3hw8FktWBaa+NogLWmnw
	M3JLrJQgwt5bDTbNXeVJmlsAHALHnlMpJ6iDwOSCmPcKufwFlHP4Gl+s5xhB/HyhffjwE2Kdriv
	pI5N6+jRf6+iFmET7As=
X-Received: by 2002:a05:6000:3106:b0:3a0:6c43:6a69 with SMTP id ffacd0b85a97d-3a0b443f2e1mr199654f8f.29.1746546019679;
        Tue, 06 May 2025 08:40:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmtFxMKGGw13QrD7HBm2MQFePX+AE0NBTJPwPvfhqJiV7x1BPMdf27dG2a/okoQuUm4sujhA==
X-Received: by 2002:a05:6000:3106:b0:3a0:6c43:6a69 with SMTP id ffacd0b85a97d-3a0b443f2e1mr199634f8f.29.1746546019295;
        Tue, 06 May 2025 08:40:19 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2706:e010::f39? ([2a0d:3344:2706:e010::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3356sm13820950f8f.29.2025.05.06.08.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 08:40:18 -0700 (PDT)
Message-ID: <2c880e08-9d92-45ee-be92-3bfc758e928c@redhat.com>
Date: Tue, 6 May 2025 17:40:17 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "mvaralar@redhat.com" <mvaralar@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>,
 Willem de Bruijn <willemb@google.com>, Daniel Verkamp <dverkamp@chromium.org>
References: <20250423014257-mutt-send-email-mst@kernel.org>
 <CABVzXA=Uof+TdU6H+eoiOOVjCZwfXfnLV8wAMP87Gz4G92fncA@mail.gmail.com>
 <20250423140404-mutt-send-email-mst@kernel.org>
 <bb5dd95a-15d5-4785-822c-e2b1e773950c@redhat.com>
 <20250429164256-mutt-send-email-mst@kernel.org>
 <CY8PR12MB7195AB46624A4339A305BE1CDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
 <68c4e73a-fa9e-4e2e-8c38-ed4a322bf47e@redhat.com>
 <CY8PR12MB7195E87CBF30EB5C7705835DDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20250501093933-mutt-send-email-mst@kernel.org>
 <PH8PR12MB7208BA2F9A48EEBF42B15AE0DC892@PH8PR12MB7208.namprd12.prod.outlook.com>
 <20250506035434-mutt-send-email-mst@kernel.org>
 <PH8PR12MB720860F36BE0C9E7C1C35A0EDC892@PH8PR12MB7208.namprd12.prod.outlook.com>
 <862ef83f-9ed8-4d50-85ca-36231e93514a@redhat.com>
 <CY8PR12MB7195FC058918DCC17E56FF80DC89A@CY8PR12MB7195.namprd12.prod.outlook.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CY8PR12MB7195FC058918DCC17E56FF80DC89A@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7M0PLKK5v0XdoZd8oN4u8rerOQ0ShlTsqfzjxBXP3Dc_1746546020
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/6/25 5:00 PM, Parav Pandit wrote:
>> From: Paolo Abeni <pabeni@redhat.com>
>> Sent: Tuesday, May 6, 2025 8:09 PM
>> On 5/6/25 10:56 AM, Parav Pandit wrote:
>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>> Sent: Tuesday, May 6, 2025 1:26 PM
>>>>> There are few proposals on table.
>>>>>
>>>>> 1. From Paolo,
>>>>> - 0 to 23, and 50 to 127 Feature bits for the specific device type
>>>>> + 0 to 23, and 46 to 127 Feature bits for the specific device type
>>>>>
>>>>> This does not have good reason of why it should still be 127.
>>>>>
>>>>> 2. From me:
>>>>> - 0 to 23, and 50 to 127 Feature bits for the specific device type
>>>>> + 0 to 23, and 45 to 64 Feature bits for the specific device type
>>>>>
>>>>> This is an extension of Paolo, to justify that implementing feature
>>>>> bits is
>>>> extremely hard even for experts as pointed by Paolo.
>>>>> It is worth to not extend it further.
>>>>> RSS can be negotiated via new bit 44 in future bit as OR of 44 and
>>>>> 64 so that
>>>> more wider users (Linux, freebsd, qnx, Windows, dpdk pmd) can pick 44.
>>>>>
>>>>> 3. From me:
>>>>> Keep the feature bits encoding as is up to 127 bits, because may be
>>>>> there is
>>>> (unknown and weird) value in having 127 feature bits.
>>>>> (unknown because the reasoning of #1 and #3 mismatch).
>>>>> In that case,
>>>>> VIRTIO_NET_CTRL_GUEST_OFFLOADS command text to be updated to
>>>> indicate
>>>>> feature fits A to D map to
>> VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.offloads
>>>> bits A' to D'.
>>>>>
>>>>> I am fine with option #2 and #3.
>>>>> Doing #1 for sure is wrong.
>>>>> Wrong because it delays the problem of #1 from this to another
>>>>> feature [A]
>>>> who's voting already completed.
>>>>>
>>>>> [A]
>>>>> https://lore.kernel.org/virtio-
>>>> comment/DM4PR18MB4269F73B786E83EF68A70F
>>>>> 37DFB82@DM4PR18MB4269.namprd18.prod.outlook.com/T/#t
>>>>
>>>>
>>>> #3 seems more conservate.
>>>
>>> Are you good with #3?
>>
>> I'm sorry for the latency. Let me double check to avoid possible
>> misunderstanding; #3 means:
>>
>> - 0 to 23, and 50 to 127 Feature bits for the specific device type
>> + 0 to 23, and 45 to 127 Feature bits for the specific device type
>>
> No change in above feature bits.
> 
>> using bits 46-39 for UDP tunnel offloads and likely bit 45 for
>> VIRTIO_NET_F_OUT_NET_HEADER.
>>
> This also to use bit 69 as proposed.
>  
>> The VIRTIO_NET_F_CTRL_GUEST_OFFLOADS mapping should be specified
>> after eventually a new offload feature will be defined using a bit >= 64.
>>
> No. UDP tunnel feature bits 65 to 68 maps to command bits 46,47,48,49.
> This is the only description change in VIRTIO_NET_F_CTRL_GUEST_OFFLOADS command.
> Would it work?

AFAICT, yes, it should work.

But it will not avoid the immediate need to expand the virtio features
negotiation above 64 bits, with the already mentioned complexity.

I would preferably avoid that, if possible: I restarted this thread with
such a goal.

Note: the implementation complexity spark from u64 hard-coded
"everywhere" in both the kernel, qemu and the related APIs.

> In fact, this command extension alone would have been sufficient if the vnet_hdr had a fixed size where new fields could be added.

I could not parse this last statement. The virtio_net_hdr size depends
on the negotiated features, and AFAICT  VIRTIO_NET_F_CTRL_GUEST_OFFLOADS
can't replace features negotiation. Could you please rephrase?

Thanks,

Paolo

