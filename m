Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C272459C7
	for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 09:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747646695; cv=none; b=HMD4mGoJFr1aUgTN1+zsD9NoGcYyChf3aurPfEXubzliQtXY8gksi9/hQuIaS2QjTWHHmtb1W1ywNq+Li4bLFGvtM3CIY4xSWRXm/frSuL78RZ+n85Opvu+e2pHa60gp+TmnwtpgFbqfUCrx4lA6kv/c69TQneQB9dOxh4ymdoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747646695; c=relaxed/simple;
	bh=s16roD/kII4wA6wgnxuOIpzjC971WvF4q8VmeVl00d4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eQO5t8BCcMNoaR6g3Ktd7v8KM6O/g+/4gpgnZEXwvsC23Qm6EAbp4WpvCFrYo11aNiP7YoZzYDyGtw4sAzZ4RY5lsYV0chN9Mtv4CPNzBSCb+pGzFKm5OPgisRwXUKtA6947lK9Twjynw9YRMtkZ79fBmqiZnyhUVJkfUG5M/nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BHthobmO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BHthobmO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747646691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1i12sFFSqfAyCuComdfcFpnbwVZGJOW5YWkX/GD+xkQ=;
	b=BHthobmO58pKaVxwq0vj7YC4Um4Z0SrpzpxNYm8QBZBCmj7/0a5V53Y1YXRYK3G6Yjwrbr
	ApuLhQIO/rqeBIK4ZxxCJAVZPky9fWABasD6uK5U385HY8/ySgGLTJxMGSapngzXDD4BFy
	OaOwxoA3C3IHwHQzCNSo9liNR3YzDQc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-WlllviPEPA2yNIlnXpquoA-1; Mon, 19 May 2025 05:24:47 -0400
X-MC-Unique: WlllviPEPA2yNIlnXpquoA-1
X-Mimecast-MFC-AGG-ID: WlllviPEPA2yNIlnXpquoA_1747646686
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so33437025e9.2
        for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 02:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747646686; x=1748251486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1i12sFFSqfAyCuComdfcFpnbwVZGJOW5YWkX/GD+xkQ=;
        b=muHPmeZ/r2nMg1A7kRI3/wddxqRWuOCWn2upIYKqiZ0u80wdVZejYMHnB7AC/Oj1Kf
         khtw8uYjo4twT2HD/EBxR+uc0S0bfXcWV1rtZ0H/u+YEXB208TCgu3tl6jFlWFJ8t421
         K8zTmGsQqfEAcUWZmNjsQ6C6K+2+XGuImCuLuEJ/NNr6wbxz4j9rsknbfZI5tSbbDx0l
         /qTU2Kj3MUOFgmVTOYRRmAZmBOVLHu3NeAZUHyOh/+3iYONEzNo8v2Ujz0Jh5aicsE84
         K/LiWlmJuDM3eOkYmNlbqtZtWQvYq/juGiR6Qx0ikcY7z34V1018SMdXxIfxTjYPotTd
         D9Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUzsk39LBK7pTm/r7B6OBsDhljXBotJ7VoY4sq1BmrkMVCKZQ1l3qd/yJJjGYeuJBdU90be6DLR139HQa3UTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxaHkBVic9d769XjLy94/CjnSKCEGkiFVZWnQvTWYNTYgHd3UG/
	khdy08PaKxV6sAwX5lSqI42MnXpRv4Y3qb6xZ0LdBKw73J3izTCveIbkr7wLDwfTfE1afLZlL/4
	T8KH7ZFCTH6hb6Qn2qq+2Gt4meQExSqibB4jtkHOGLm1/l00wSKejYYfd3mGklfnW7v6F
X-Gm-Gg: ASbGncsrqDI6Bmi6wcCK6X9l2LezfbBUpfeujd8nHCwkXlzrqwUo9PeeisRQEwSlsZ7
	q50xT/lMPcQMqiQEkWXHSnVtU7+7MrqO/kqw0KLu9Yvie0sOYKG0RPRXPWawvzh7UxuW+Bx8GZT
	6iDo80qgnd6wtx5XkRlTIqgGsX1ZafHuFS9txaLCyh4tim2tMIst3Mmw64L7evNwUbkJ8VRnsAQ
	jAUcyP5+nITwZYPS+k6N5de6Im0kJbP5tN7UcDOIfVGAM+0g9Gd0qcjJ6oijwyIUoW8x19EmEZi
	JhcUb6RqOoTr6RTMpM8=
X-Received: by 2002:a05:600c:8597:b0:43c:f78d:82eb with SMTP id 5b1f17b1804b1-442fd780495mr117785145e9.15.1747646686157;
        Mon, 19 May 2025 02:24:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElbwXCLCnk6oaWfnUYuXUNkbCdmQdI3LEk5GC1QRpY4BmMqr7xuOt0qPqp2l+4gHgejwa5VA==
X-Received: by 2002:a05:600c:8597:b0:43c:f78d:82eb with SMTP id 5b1f17b1804b1-442fd780495mr117784935e9.15.1747646685790;
        Mon, 19 May 2025 02:24:45 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:5710::f39? ([2a0d:3344:244f:5710::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca9417dsm11895839f8f.101.2025.05.19.02.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 02:24:45 -0700 (PDT)
Message-ID: <3b6a16b1-0318-4bd0-9afa-5616afd42788@redhat.com>
Date: Mon, 19 May 2025 11:24:41 +0200
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
 <4df60cbe-ace1-41ae-9d24-5f548e780f82@redhat.com>
 <CY8PR12MB7195C1BA2C27B1E332B2FD21DC9CA@CY8PR12MB7195.namprd12.prod.outlook.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CY8PR12MB7195C1BA2C27B1E332B2FD21DC9CA@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W2Xj910cYP9NIGl-RR5nU5S51UYjY2sVjPCgSLna0Bc_1747646686
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/19/25 11:04 AM, Parav Pandit wrote:
>> From: Paolo Abeni <pabeni@redhat.com>
>> Sent: Monday, May 19, 2025 2:28 PM
>> On 5/7/25 11:57 AM, Paolo Abeni wrote:
>>> On 5/6/25 6:20 PM, Parav Pandit wrote:
>>>> From: Paolo Abeni <pabeni@redhat.com Sent: Tuesday, May 6, 2025 9:10
>>>> PM
>>>>> On 5/6/25 5:00 PM, Parav Pandit wrote:
>>>>>> From: Paolo Abeni <pabeni@redhat.com Sent: Tuesday, May 6, 2025
>>>>>> 8:09 PM
>>>>>>> On 5/6/25 10:56 AM, Parav Pandit wrote:
>>>>>>>> Are you good with #3?
>>>>>>>
>>>>>>> I'm sorry for the latency. Let me double check to avoid possible
>>>>>>> misunderstanding; #3 means:
>>>>>>>
>>>>>>> - 0 to 23, and 50 to 127 Feature bits for the specific device type
>>>>>>> + 0 to 23, and 45 to 127 Feature bits for the specific device type
>>>>>>>
>>>>>> No change in above feature bits.
>>>>>>
>>>>>>> using bits 46-39 for UDP tunnel offloads and likely bit 45 for
>>>>>>> VIRTIO_NET_F_OUT_NET_HEADER.
>>>>>>>
>>>>>> This also to use bit 69 as proposed.
>>>>>>
>>>>>>> The VIRTIO_NET_F_CTRL_GUEST_OFFLOADS mapping should be
>> specified
>>>>>>> after eventually a new offload feature will be defined using a bit >= 64.
>>>>>>>
>>>>>> No. UDP tunnel feature bits 65 to 68 maps to command bits
>> 46,47,48,49.
>>>>>> This is the only description change in
>>>>> VIRTIO_NET_F_CTRL_GUEST_OFFLOADS command.
>>>>>> Would it work?
>>>>>
>>>>> AFAICT, yes, it should work.
>>>>>
>>>>> But it will not avoid the immediate need to expand the virtio
>>>>> features negotiation above 64 bits, with the already mentioned
>> complexity.
>>>>>
>>>>> I would preferably avoid that, if possible: I restarted this thread
>>>>> with such a goal.
>>>>>
>>>> In that case we should adopt #2.
>>>
>>> Do we have quorum? Should I send a patch?
>>
>> As per off-list discussion with Michel, there is no agreement on reserved bits
>> re-use.
>>
>> That means the only available option is #3 above.
>>
>> @Parav, would you send a patch to fix the offloads <> features mapping, or do
>> you prefer I'll do it?
>>
> If its urgent, please do it.
> If it can wait till 22 May this week, I will prepare one.

I'll do, because I want to move this thing forward. Note that I think
it's better to change the offload bit name definition for UDP related
offload, to avoid multiple definitions using specifying the string and
different value. i.e.:

---
diff --git a/device-types/net/description.tex
b/device-types/net/description.tex
index 1b6b54d..5d869bc 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -2186,8 +2186,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device
Types / Network Device / Devi
 #define VIRTIO_NET_F_GUEST_TSO6       8
 #define VIRTIO_NET_F_GUEST_ECN        9
 #define VIRTIO_NET_F_GUEST_UFO        10
-#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
-#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
+#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_MAPPED  46
+#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM_MAPPED 47
 #define VIRTIO_NET_F_GUEST_USO4       54
 #define VIRTIO_NET_F_GUEST_USO6       55

@@ -2205,6 +2205,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device
Types / Network Device / Devi
 negotiation corresponding offload gets enabled to preserve backward
 compatibility.

+Note that device features bit in the [65 to 68] range correspond to
+offloads bits in the [46 to 49] range.
+
 \drivernormative{\subparagraph}{Setting Offloads State}{Device Types /
Network Device / Device Operation / Control Virtqueue / Offloads State
Configuration / Setting Offloads State}

 A driver MUST NOT enable an offload for which the appropriate feature

