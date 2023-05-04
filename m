Return-Path: <virtio-comment-return-5772-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CCBC7EE21
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 10:53:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4930042568
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 10:52:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3CA1A9866B0
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 10:52:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 28157983EB5; Thu,  4 May 2023 10:52:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 14DBD98663F
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 10:52:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683197577; x=1685789577;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EtrPdBSRP2cHOMoaB10xE6X6ZK5yw2p9cMvBz4KTUnw=;
        b=gjgQBMjldgfTZQKz8hAvqdD4NMXWn50pJGTRofUXhZBFRUDqv0iQtVuBBp34noTIaM
         DQo6gY0AZuLGe35y/mrVa6kk+LUORTSdxWYrBOmyYh9+pfKl7QkoPtczdjJ2yZwk45Ke
         9viZ09UerhxykF3fY1nRl71XD/KzA8yGnI667Ex8GGNuNZdCYGsHfosU/3qxUpNGcxkg
         aYYg5grTD/WbhZbgi6qPZUbA5Il5Rx7IE36bvLDg+o1zENd5LqR3KwvSzGjwadOjQ6Tl
         6J62K9DaEUIYIriK4eM+I0UvtC3SkMKpveiB4cc/debdLSO8amBhX6dxIFD4uSWqEXVY
         hcTQ==
X-Gm-Message-State: AC+VfDwG7taYnSUYs61BGoJwzGsMbAK41rjPZ5dlaCl+bEogLVVcp+Xz
	FPS9IcMnPHbbIlRnm+CsCkPZDQ==
X-Google-Smtp-Source: ACHHUZ5+eGTHOFXenR3r2NOfCe2TODW8E+gLHcZeXBrqs7hJmErKvgDbhLFubeVFXuNO5g4E1Sx3Hw==
X-Received: by 2002:a17:902:e844:b0:1aa:d706:e0e5 with SMTP id t4-20020a170902e84400b001aad706e0e5mr3814891plg.47.1683197577219;
        Thu, 04 May 2023 03:52:57 -0700 (PDT)
Message-ID: <89bdc618-9f30-686a-21a1-74d7d4d5016c@bytedance.com>
Date: Thu, 4 May 2023 18:50:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, parav@nvidia.com,
 stefanha@redhat.com, jasowang@redhat.com,
 virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-2-pizhenwei@bytedance.com>
 <13c0e109-8d21-5294-6bd5-8f6fd6f707d2@redhat.com>
 <1a0b973a-11b0-6b24-f118-902a5809f7d1@bytedance.com>
 <20230504060313-mutt-send-email-mst@kernel.org>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230504060313-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Re: Re: [virtio-comment] [PATCH v2 01/11] transport-fabrics:
 introduce Virtio Over Fabrics overview



On 5/4/23 18:05, Michael S. Tsirkin wrote:
> On Thu, May 04, 2023 at 05:46:46PM +0800, zhenwei pi wrote:
>>
>>
>> On 5/4/23 16:57, David Hildenbrand wrote:
>>> On 04.05.23 10:19, zhenwei pi wrote:
>>>> In the past years, virtio supports lots of device specifications by
>>>> PCI/MMIO/CCW. These devices work fine in the virtualization environment.
>>>>
>>>> Introduce Virtio Over Fabrics transport to support "network defined
>>>> peripheral devices". With this transport, Many Virtio based devices
>>>> transparently work over fabrics. Note that the balloon device may not
>>>> make sense. Shared memory regions won't work.
>>>
>>> Anything that involves memory (memory balloon, memory device, shared
>>> memory) is fully incompatible I would guess.
>>>
>>
>> Hi,
>>
>> Agree that memory device and shared memory is incompatible.
>>
>> But memory balloon device, I don't know if it's possible to use in future.
>> As far as I can imagine: a user process runs virtio-of target by listening
>> localhost, and memory balloon isolates same pages from kernel, the user
>> process maps these physical pages into virtual memory ...
> 
> I don't see anything big that is wrong with balloon. device inflates
> balloon, this memory is stolen from guest. isn't this what user
> wanted? presumably there's a way for device to send this
> information to the hypervisor otherwise it seems kind of
> pointless.
> 

Hi,

A user process has a chance to steal some pages from a kernel, these 
pages will not be used by kernel(no memory migration, no KSM, no kswap 
on these pages). As of the current situation, this maybe seem pointless ...

I don't disagree with David's point about memory balloon. ^_^

-- 
zhenwei pi

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

