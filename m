Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6411157E6B
	for <virtio-comment@lists.linux.dev>; Wed,  7 May 2025 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746611854; cv=none; b=tyzBdn3Rgfdg4XsnIBvXR3dF2zl1nq/GYGCzJoI9RVWNmeVkhCsZzT42M1qPP89fFvxWwayaWczle5GyOrw+4MzqGlCJC3la4SWRY7lXved8EJGuXjItpfiBTgZQhx9YjfIO2Lve3Xw0ujLVU8rSYij9j2hJjNLnQk6aBuaOhaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746611854; c=relaxed/simple;
	bh=7tvdu9mg2bNyFGJBofKE48stIUJwQ0uNuivWwfJAess=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g3Vlj+HoQPq4yGhKRcFB2yC7v2ngnTJzb2AXwKdTUfYJtleEO3j4jw8QhulvFJrcz8m6tCAVE1b4KK4kI+tS5tGhAOB6f8KXDZvTavaSWVm6s5wVZprk+Mb+Ba9CSESVHbj2fv6YBg5m3fcufQRMdgwWbfzoegt3Y3+XlFw89Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gifMWak4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gifMWak4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746611851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FwrJcQOdcVPj/XSkJfQQfag+XYYsTHOuwIwH4LKkPtY=;
	b=gifMWak4lWRm4x4tnmavvlgCJ6KD9tDkDxQfR9WE7u93qUqDxeWD1Kfzscj4+KwUpDSmXI
	aooZE1KR1W8hqCaX3CI1QP+eeBgj4BwABGbj2SZss+S6Cb62rQlvh+PMHJllQvroIOvdDb
	ZJ2rNo5Z9YY1eOJMjVL+BIP8fPy0ygE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-5OEzyYH_MouZlyHoiYsD5Q-1; Wed, 07 May 2025 05:57:30 -0400
X-MC-Unique: 5OEzyYH_MouZlyHoiYsD5Q-1
X-Mimecast-MFC-AGG-ID: 5OEzyYH_MouZlyHoiYsD5Q_1746611849
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-391492acb59so3356519f8f.3
        for <virtio-comment@lists.linux.dev>; Wed, 07 May 2025 02:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746611849; x=1747216649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwrJcQOdcVPj/XSkJfQQfag+XYYsTHOuwIwH4LKkPtY=;
        b=SkwCHgCs9XH4de22sXOZWJ0cBeEyrUr4PZmtq/oxHtlGooYhA41CKfcbP4mCeM7P7M
         qOonUIDu75UQ3NofGC0Pfvntu3i4BdQw57O6x3XCUGP/2D+CPFEBK3+lT1SJct3Useiq
         en3wRauX6smajF3/AeDzPv/7EUI9tRh94b6VIar1a2ARiDF9SnauusMrF/VVSAFPSFxB
         DL9m5Ep9+ACmz7Isjw+996G0fp2UWDvgn2DO0Xs5ojvwW8eSgWvtBKCuZM/uGCkqNi1I
         CzMGlk9XLVYH58n+dtKNgtTXgeaPWY0NgF919qk07SCYedJ16LQBQMoIJBEx6SMXBmLI
         Sc8A==
X-Forwarded-Encrypted: i=1; AJvYcCWoUlHNFSmvzCcUMCKQIVRTy6DVkS7LYHJ+7nUD9yQTyto8OINlqZkcUsgi0ZdLr7axKyONM7uazttxio5FfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIVzM2+fobJ9H7+diTr/WYCZCiHP6pybgpPRmVGRRFDrLfW6OK
	uBDnBpHxGVJL91BCJXUEFfiN7w5ts3QOLhgNbpo6eV0FemEyU51AYi9esTa69IvF0MUC8GIIcAb
	/I6HYr9DibPPyzNkTe2syGeMlbmPdk+pwwlAYcKIfYDjEou/gNYwJkuqb2f8idwZ2
X-Gm-Gg: ASbGncs63fH4Sl2BziZ9eq0eCLJC3CBy7LSNZx/gpDoHGv/tqMAJWzEGQjVZpJDmTAw
	Z102cs+ajyYGRmeGjK5+PSCcE/fsEgmZYpfmEOt4Dw0V1wCoc4+h+6FtCn2PJQ+HdV43U8GkPlJ
	6VTuAkAAbNy/XFg24z7rthTrOBMAep0eb/llbKjY+Yg0GDABNHrKgGkyP8olQaHY7iRUJvfLba8
	gahD+nYdC2P/ToVB8UdJW8+VKm+pDCm8nsSH56rRFCoXHAGSMoJ7MXtzMhhMbpeQzNCg8XsSIbu
	xN+2dGR3o0eVGL9E
X-Received: by 2002:a05:6000:438a:b0:3a0:b1f7:c1da with SMTP id ffacd0b85a97d-3a0b4a08713mr2552799f8f.46.1746611849227;
        Wed, 07 May 2025 02:57:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGt+0Ky7Sbto8OzuxBetH16/NVy6sAkqaRnm4c3iNgrAZgo8KHUxjSFH8dHO/Z8eIOMsO4QAQ==
X-Received: by 2002:a05:6000:438a:b0:3a0:b1f7:c1da with SMTP id ffacd0b85a97d-3a0b4a08713mr2552774f8f.46.1746611848823;
        Wed, 07 May 2025 02:57:28 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244b:910::f39? ([2a0d:3344:244b:910::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0d15sm16731404f8f.13.2025.05.07.02.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 02:57:28 -0700 (PDT)
Message-ID: <758156c0-7cc7-4af4-b5eb-1339b3b9b437@redhat.com>
Date: Wed, 7 May 2025 11:57:26 +0200
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
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CY8PR12MB71953CA2DC3CD5608BA54D02DC89A@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rTEZYMMhSp-Gn_irqfLYQXeTq7gMaZAUgiezz0AmL4M_1746611849
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/6/25 6:20 PM, Parav Pandit wrote:
> From: Paolo Abeni <pabeni@redhat.com Sent: Tuesday, May 6, 2025 9:10 PM
>> On 5/6/25 5:00 PM, Parav Pandit wrote:
>>> From: Paolo Abeni <pabeni@redhat.com Sent: Tuesday, May 6, 2025 8:09 PM
>>>> On 5/6/25 10:56 AM, Parav Pandit wrote:
>>>>> Are you good with #3?
>>>>
>>>> I'm sorry for the latency. Let me double check to avoid possible
>>>> misunderstanding; #3 means:
>>>>
>>>> - 0 to 23, and 50 to 127 Feature bits for the specific device type
>>>> + 0 to 23, and 45 to 127 Feature bits for the specific device type
>>>>
>>> No change in above feature bits.
>>>
>>>> using bits 46-39 for UDP tunnel offloads and likely bit 45 for
>>>> VIRTIO_NET_F_OUT_NET_HEADER.
>>>>
>>> This also to use bit 69 as proposed.
>>>
>>>> The VIRTIO_NET_F_CTRL_GUEST_OFFLOADS mapping should be specified
>>>> after eventually a new offload feature will be defined using a bit >= 64.
>>>>
>>> No. UDP tunnel feature bits 65 to 68 maps to command bits 46,47,48,49.
>>> This is the only description change in
>> VIRTIO_NET_F_CTRL_GUEST_OFFLOADS command.
>>> Would it work?
>>
>> AFAICT, yes, it should work.
>>
>> But it will not avoid the immediate need to expand the virtio features
>> negotiation above 64 bits, with the already mentioned complexity.
>>
>> I would preferably avoid that, if possible: I restarted this thread with such a
>> goal.
>>
> In that case we should adopt #2.

Do we have quorum? Should I send a patch?

>>> In fact, this command extension alone would have been sufficient if the
>> vnet_hdr had a fixed size where new fields could be added.
>>
>> I could not parse this last statement. The virtio_net_hdr size depends on the
>> negotiated features, and AFAICT  VIRTIO_NET_F_CTRL_GUEST_OFFLOADS
>> can't replace features negotiation. Could you please rephrase?
>>
> I meant to say, if we have fixed size vnet hdr, say 64B, than there is no need of feature negotiation per offload.
> VIRTIO_NET_F_CTRL_GUEST_OFFLOADS or any other command can dynamically enable/disable a feature on invocation of ethtool/netlink/devlink or similar OS UAPIs.
> It does not apply presently to this feature as the infrastructure of 64B vnet hdr is not in present and it cannot a fix anyway for this issue.
> It was just a forward thinking on how to build the optimize data path.

Understood. I'm unsure if that schema could have issues with migration
vs VMs with different offloads, but let's put that aside from the main
topic here ;)

Thanks,

Paolo

