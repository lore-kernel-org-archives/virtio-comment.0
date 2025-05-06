Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3648F280006
	for <virtio-comment@lists.linux.dev>; Tue,  6 May 2025 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746542333; cv=none; b=rDXnIAnyXwImORA1b7h1H8MpX1OtFBN8esxHe+xknHwA0EV1oVWVA19iK8mVtK8i93jD8nG6Gpy+0IPhN3gG9Kfs7P6wzNLCDGkJ7IhuirhA4ANj3bLAST8GKg9KFWhR42cQijQGSl0kBfYmx7D8Ry6iQIM9Z8jHRmTuvKMoef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746542333; c=relaxed/simple;
	bh=g5HrmOfpbF4HgAv0UiwbZnYqdsWXJ+x1xmCEOGNk/MM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TAhJNlMCRRZdO968gjzIvoSTwOjp6bRFGBn+2t1bT9VmuPQmxoM2AQG96V19jZiqq9HUEgA6I/m7zLE0r0mQhOcRqY+KVByUJAISk5YNkXh89ICzI9msXl/mMJ8fJgWmR31I90Zo8gd902MOU7X2haovh5USmFevb5DMMmDKGOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=In8FZsPF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="In8FZsPF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746542330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jgP9JAbCbqbOhqDgYUrv/4ynLFP3l8EFOkE1XEkYIgE=;
	b=In8FZsPFRwLW38BFrfljdEDZsCM+yXqiJF2wNamc9tA+NDNEKxn5Z32SUvGPyoL6944DbR
	phspHawIAbb944L/lIAiinr5JNUSXiswTjxHjQXpcjOQW9dOlSbG9SymIO2TmH+CfHLqsv
	DkU1OV3V3LG9R5DaR6mpU8YkCL41hdI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-d-8OwsbQM--8Zzg24bpUUg-1; Tue, 06 May 2025 10:38:49 -0400
X-MC-Unique: d-8OwsbQM--8Zzg24bpUUg-1
X-Mimecast-MFC-AGG-ID: d-8OwsbQM--8Zzg24bpUUg_1746542328
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39130f02631so1624752f8f.2
        for <virtio-comment@lists.linux.dev>; Tue, 06 May 2025 07:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746542328; x=1747147128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jgP9JAbCbqbOhqDgYUrv/4ynLFP3l8EFOkE1XEkYIgE=;
        b=BXx3XDpecPeE+RSQDIxegg9qiccxj6L/EoVEdlMIoHvzAg4VUK5fG1vbSESi9QFGQb
         MAwTjOLqYPb2Hl1jL/bxLIes7udf+qf6hY1sScblEFJniPJhsh6cUrAEHUfLclMYFari
         etLFSCKZqHj0BzosP1y1Injmloh1Nu7HpCDTJyffQeSAKAtREvGZ7MEpCVjNmHlv1VUu
         idijk0SYSE5emmqrrQwtMgHLSjb7Y0oAiB/91p0lWYvwfxcXo97rLV7twidHu0VpxE+3
         UQuItpl537aclL1ZQ2dgAtAsUEyiQDAec1xZyq3vOYzbkBvVZ8hJ/1TxI7m5cAikP2bK
         ezsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+AlAWLFMP6RmkJ7HlXiVCEwmGHVm9A5ixfUphN9oR1cV3sLb5YWMElxnT/S5s+SGU/rLvhkqWCFTaszCWLA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz//4dOw0enaWejD92e5WlsakVBhdiu0VO71FaYsEw0sqpqv/9h
	OouB6UMsQvDQ6X6rAwSGF8CrYwjWr9/2ogq9kZstM+0wfZORDspS/z7dgUhfpIDngdOAV2wIYqJ
	NNU3VWUTHzrl2CURprQdDyZBwDGRfOwPicF65HE17kqzXHNansIRdt+XMH9bXBr/B
X-Gm-Gg: ASbGncts0VO+sOsfwvEQrD95UfCaAkJEPp6YjroDz2bXtZVn0e4RQjiW2QG6mv6RrXu
	x/0XjvSCytBKO9uq33C0EsYEepFi0J3m1yrWl9zR5x5v4EzvzZPMGp6JrhSE1JEJyFO7fKXXLdZ
	kEs07X4L2Ix6n74UUIJV1aLVNoEyglmT98lHLPu91Vcb25dUuJuMwN+gx/zOTRSuUIFdDyFhfi+
	LT1O+nM5zVE7UmEsF+Cw06W21DeOPbHi/Y/PoVOobZ7PTU3duaX3ILpBMgQ/FO2MjuDPbEI2el9
	+mz4SwG/XJBvZUuWGGw=
X-Received: by 2002:a05:6000:2501:b0:3a0:9705:eb13 with SMTP id ffacd0b85a97d-3a099ae9197mr13881660f8f.43.1746542328234;
        Tue, 06 May 2025 07:38:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnSdo+UmGCf/gtvTvgIDGStVadRXrZG8SnZsmzhOYqzAM4Ah8bEWMYlMHT5QcyijdqTtBeXg==
X-Received: by 2002:a05:6000:2501:b0:3a0:9705:eb13 with SMTP id ffacd0b85a97d-3a099ae9197mr13881630f8f.43.1746542327557;
        Tue, 06 May 2025 07:38:47 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2706:e010::f39? ([2a0d:3344:2706:e010::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae834bsm14058010f8f.60.2025.05.06.07.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:38:47 -0700 (PDT)
Message-ID: <862ef83f-9ed8-4d50-85ca-36231e93514a@redhat.com>
Date: Tue, 6 May 2025 16:38:45 +0200
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
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <PH8PR12MB720860F36BE0C9E7C1C35A0EDC892@PH8PR12MB7208.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IBfESlysDJc9ThLqFDCuA_ssBwpHwOnK5jkzoy_isRc_1746542328
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 5/6/25 10:56 AM, Parav Pandit wrote:
>> From: Michael S. Tsirkin <mst@redhat.com>
>> Sent: Tuesday, May 6, 2025 1:26 PM
>>> There are few proposals on table.
>>>
>>> 1. From Paolo,
>>> - 0 to 23, and 50 to 127 Feature bits for the specific device type
>>> + 0 to 23, and 46 to 127 Feature bits for the specific device type
>>>
>>> This does not have good reason of why it should still be 127.
>>>
>>> 2. From me:
>>> - 0 to 23, and 50 to 127 Feature bits for the specific device type
>>> + 0 to 23, and 45 to 64 Feature bits for the specific device type
>>>
>>> This is an extension of Paolo, to justify that implementing feature bits is
>> extremely hard even for experts as pointed by Paolo.
>>> It is worth to not extend it further.
>>> RSS can be negotiated via new bit 44 in future bit as OR of 44 and 64 so that
>> more wider users (Linux, freebsd, qnx, Windows, dpdk pmd) can pick 44.
>>>
>>> 3. From me:
>>> Keep the feature bits encoding as is up to 127 bits, because may be there is
>> (unknown and weird) value in having 127 feature bits.
>>> (unknown because the reasoning of #1 and #3 mismatch).
>>> In that case,
>>> VIRTIO_NET_CTRL_GUEST_OFFLOADS command text to be updated to
>> indicate
>>> feature fits A to D map to VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.offloads
>> bits A' to D'.
>>>
>>> I am fine with option #2 and #3.
>>> Doing #1 for sure is wrong.
>>> Wrong because it delays the problem of #1 from this to another feature [A]
>> who's voting already completed.
>>>
>>> [A]
>>> https://lore.kernel.org/virtio-
>> comment/DM4PR18MB4269F73B786E83EF68A70F
>>> 37DFB82@DM4PR18MB4269.namprd18.prod.outlook.com/T/#t
>>
>>
>> #3 seems more conservate.
> 
> Are you good with #3?

I'm sorry for the latency. Let me double check to avoid possible
misunderstanding; #3 means:

- 0 to 23, and 50 to 127 Feature bits for the specific device type
+ 0 to 23, and 45 to 127 Feature bits for the specific device type

using bits 46-39 for UDP tunnel offloads and likely bit 45 for
VIRTIO_NET_F_OUT_NET_HEADER.

The VIRTIO_NET_F_CTRL_GUEST_OFFLOADS mapping should be specified after
eventually a new offload feature will be defined using a bit >= 64.

Am I correct?

Thanks,

Paolo



