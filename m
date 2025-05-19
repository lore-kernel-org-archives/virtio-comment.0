Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7991D26A0F3
	for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 08:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747645069; cv=none; b=qBCsDoLaW7+zBNa0gTr1ipFc634AJZ0wckpxUP4orxwmfDb7UAUe2pJOR9XTwMpXWcSx8moeM8yPSxhtfAyI8DinPtXduxMz1u4pFyeG/OKE7qGDOTvPbss5iZ4RXucb7XYIpysZ+LrbK7o+56VnZ2Z+fxAWuDdUKEzjUtwzH68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747645069; c=relaxed/simple;
	bh=JxYqOVfqIh1SBMQmx31hhrk23G1F1qx7QkZW6pQsjS0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=S62ulrqMadU+CIt20sNb40/RnXF5eQgzxhkLH4ZxqX/sVxPYqKzt3E4eqDNvGtQjdUIiPueQRy36h5Thv1d5CtKYv5rPjJImeqZ7TovljDwSzQR7z4dLv/HQTTr4yQn2OJqEvkDvZn02iLOFsmjTiU6+HBNbgXYT/h038+WIKmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SPDVnD+h; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SPDVnD+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747645066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6shA8Nw8cerVyanZR2G440fVqrQx+t6s1rXIY4yP0RU=;
	b=SPDVnD+hrOsfKJ4SrTxqwZmYDETOMvwSKOAW8duI9Ky5MbHcXnjM07y6fSyA8uHNAk/diq
	eEa8jfy1wFeHChJpQuxIJvDkb9kP8ZAlVKWb2JLxJEEsy3cNYedR2QXUQziXaW7Bk63i5a
	JSBPI5mOP2Tb1iPT/ST+nTiQoO9HMiA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-vt8GZgScOzWfKNQUB3FvBA-1; Mon, 19 May 2025 04:57:45 -0400
X-MC-Unique: vt8GZgScOzWfKNQUB3FvBA-1
X-Mimecast-MFC-AGG-ID: vt8GZgScOzWfKNQUB3FvBA_1747645064
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442e0e6eb84so26599975e9.0
        for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 01:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747645064; x=1748249864;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6shA8Nw8cerVyanZR2G440fVqrQx+t6s1rXIY4yP0RU=;
        b=JHpwkeKzFKIhAWf7yj8tS473sCUfdSQy3HOVvi3TBwz9Mf3VN6N1/pmojUBtPmiAU4
         u35ZHIc5iqeOznw1fxP8lYIj6B5LzZN0lkSX8WaJ42HnbReOanfcKT6T89LTYaY2Lqr1
         twcVT6YdOL7ZG+pyOIZx/jUXetGkS2Nc+C6omgpnEMAjnnWDacA43cTjHXKuc0ZmLkG+
         CvtzTQM/XhisFoaQdjjIJDdh4A9WAqNb0Ag4Qrfq+n5CrdrDiBtjvHBXTS+k26LCgD48
         vBbLmRaHA5k/Jvsm7m4BV1xC6eR3nJdkxz8mwflcjV1r8Uv9SnSqZr517Y61tz9n0Hqp
         2Slg==
X-Forwarded-Encrypted: i=1; AJvYcCVXTs8RnmuCaM7LcWP02L18bkD5D9BdEilk/MvlhqZfC8cuD2zKLvIbdT1QZzDqOf2gPjed3X3NXtk212fBEA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUIZBYUerVBk0zHCgDkXS5XVPknaEug1ZKPMIy/FT+zQbHr2qq
	PXE5LWoAnCzUnpdEVi/W3P3qo9y3icVWXgEyc4UwRPzZTrx7VFMoFKZYb/OP7u1hBN8t3GgWyga
	EG/h3xNHnY9FZiOXWVR/BYnmWxf8o5Vj9DvVEI4T2WgoLdaE1jh0PraxdUo1D4gplR0/1
X-Gm-Gg: ASbGncvktOeA/rq9OAyZ6eS5F6LKnc3ygLojyTcgEAPUcf0Mtzlt2oGU4Z9I8EPrGPE
	5OdKJ2VWpThObDcuh2w+3QvVeLQFtOhv+GXPzk14iWcg2kICimVZdkmVsdnQDjAlEgJcFBY/AdR
	mycia7F7SzubFlfUqjTDYgs1/4cLbC7zeIv7ZoJfj4Uzah05C4IA9DS30V6xbO/Wq4qmE2oVKck
	3/MamsChMedNU+m+t0vI5vKmZLl6XECx38GToPNmMSBuFep4tARzuipb0lIoI1AVR1dYqkURtH8
	9iGROJlDAeDaoKuMGOw=
X-Received: by 2002:a05:600c:3554:b0:442:cd13:f15d with SMTP id 5b1f17b1804b1-442fd67197dmr110762435e9.29.1747645063711;
        Mon, 19 May 2025 01:57:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcf4dhPDZlgZEhuhPjXMqTsWMJTO/M3vKQhucUObrGFbd7NxtLZdkzwsUG/0SQo3Mld7h3mw==
X-Received: by 2002:a05:600c:3554:b0:442:cd13:f15d with SMTP id 5b1f17b1804b1-442fd67197dmr110762215e9.29.1747645063354;
        Mon, 19 May 2025 01:57:43 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:5710::f39? ([2a0d:3344:244f:5710::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd51477dsm132941355e9.17.2025.05.19.01.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 01:57:42 -0700 (PDT)
Message-ID: <4df60cbe-ace1-41ae-9d24-5f548e780f82@redhat.com>
Date: Mon, 19 May 2025 10:57:41 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
From: Paolo Abeni <pabeni@redhat.com>
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "mvaralar@redhat.com" <mvaralar@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>,
 Willem de Bruijn <willemb@google.com>, Daniel Verkamp <dverkamp@chromium.org>
References: <20250423014257-mutt-send-email-mst@kernel.org>
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
 <2c880e08-9d92-45ee-be92-3bfc758e928c@redhat.com>
 <CY8PR12MB71953CA2DC3CD5608BA54D02DC89A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <758156c0-7cc7-4af4-b5eb-1339b3b9b437@redhat.com>
In-Reply-To: <758156c0-7cc7-4af4-b5eb-1339b3b9b437@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DRv0uaamDz8aZd11J-VPYH2sp_M30JcCiZZxMh2E29M_1747645064
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/7/25 11:57 AM, Paolo Abeni wrote:
> On 5/6/25 6:20 PM, Parav Pandit wrote:
>> From: Paolo Abeni <pabeni@redhat.com Sent: Tuesday, May 6, 2025 9:10 PM
>>> On 5/6/25 5:00 PM, Parav Pandit wrote:
>>>> From: Paolo Abeni <pabeni@redhat.com Sent: Tuesday, May 6, 2025 8:09 PM
>>>>> On 5/6/25 10:56 AM, Parav Pandit wrote:
>>>>>> Are you good with #3?
>>>>>
>>>>> I'm sorry for the latency. Let me double check to avoid possible
>>>>> misunderstanding; #3 means:
>>>>>
>>>>> - 0 to 23, and 50 to 127 Feature bits for the specific device type
>>>>> + 0 to 23, and 45 to 127 Feature bits for the specific device type
>>>>>
>>>> No change in above feature bits.
>>>>
>>>>> using bits 46-39 for UDP tunnel offloads and likely bit 45 for
>>>>> VIRTIO_NET_F_OUT_NET_HEADER.
>>>>>
>>>> This also to use bit 69 as proposed.
>>>>
>>>>> The VIRTIO_NET_F_CTRL_GUEST_OFFLOADS mapping should be specified
>>>>> after eventually a new offload feature will be defined using a bit >= 64.
>>>>>
>>>> No. UDP tunnel feature bits 65 to 68 maps to command bits 46,47,48,49.
>>>> This is the only description change in
>>> VIRTIO_NET_F_CTRL_GUEST_OFFLOADS command.
>>>> Would it work?
>>>
>>> AFAICT, yes, it should work.
>>>
>>> But it will not avoid the immediate need to expand the virtio features
>>> negotiation above 64 bits, with the already mentioned complexity.
>>>
>>> I would preferably avoid that, if possible: I restarted this thread with such a
>>> goal.
>>>
>> In that case we should adopt #2.
> 
> Do we have quorum? Should I send a patch?

As per off-list discussion with Michel, there is no agreement on
reserved bits re-use.

That means the only available option is #3 above.

@Parav, would you send a patch to fix the offloads <> features mapping,
or do you prefer I'll do it?

Thanks,

Paolo

