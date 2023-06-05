Return-Path: <virtio-comment-return-6126-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF06DC7EE24
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 07:59:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0FC7A2A827
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 07:59:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EF18B98643F
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 07:59:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DD97998638A; Mon,  5 Jun 2023 07:59:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CBE079863AC
	for <virtio-comment@lists.oasis-open.org>; Mon,  5 Jun 2023 07:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685951987; x=1688543987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qTjzVsOlpY5M6UoFgT8T+yT/kpWd2E8ewdvjVjWU1go=;
        b=Mc0SiLTLwhqv3PERWL7MdOYZvP4IgEH0z6jkWOThNxczNLImeBNFSUJvCCTh+600S6
         G8+dqD9SU947HJc4xK4Zh7bqE1Bx36nJDhULV15Bnzjuyps+p0tQJ8/B+iPlO/HZNeCm
         wWHaugogbkjf8UbCZY0g2iW8EMQZgy1EAWH1s6+LbUM2vBVS264QNWK5gJzp9tvMJ+q/
         7aQqLoa/4UCQ8F+5+caAMFW9k9mNoLJX5TWYQBiM4hDWFhlR76qHX+yMTm9p96YIqzZR
         vfjqGxK3q6MEt46ge7abe+3ozi5VoITbnFwDXBzGx0kuE9m7L9i83BTPbu1o6qjW21pM
         90ZA==
X-Gm-Message-State: AC+VfDw8MuY6yrRWWWrFVkE95YkcMxGg7D27kJxPvKuSwiVK9+WRfEE8
	kwEhqTlBVYxkOv75wDdBGBA4jQ==
X-Google-Smtp-Source: ACHHUZ6iFV1sHGYxbVzqHzujy6wqqUWPj+Sl5eTL6VAFqmGGPy9Z2T2nZJ7VTyIaKfldfk/UHn3NOQ==
X-Received: by 2002:a05:6358:9924:b0:123:6953:6754 with SMTP id w36-20020a056358992400b0012369536754mr8559943rwa.21.1685951987174;
        Mon, 05 Jun 2023 00:59:47 -0700 (PDT)
Message-ID: <bc6709df-8c72-0f31-35f8-57c369a47290@bytedance.com>
Date: Mon, 5 Jun 2023 15:57:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: mst@redhat.com, jasowang@redhat.com, virtio-comment@lists.oasis-open.org,
 houp@yusur.tech, helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-3-pizhenwei@bytedance.com>
 <20230531140640.GD1248296@fedora>
 <1572fc8c-2c92-10df-e109-6586a9692e0a@bytedance.com>
 <7238af9f-25e3-8490-a8dd-ee63435caba7@nvidia.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <7238af9f-25e3-8490-a8dd-ee63435caba7@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: Re: [virtio-comment] [PATCH v2 02/11] transport-fabrics:
 introduce Virtio Qualified Name



On 6/5/23 10:40, Parav Pandit wrote:
> 
> 
> On 6/1/2023 9:50 PM, zhenwei pi wrote:
>>
>>
>> On 5/31/23 22:06, Stefan Hajnoczi wrote:
>>> On Thu, May 04, 2023 at 04:19:01PM +0800, zhenwei pi wrote:
>>>> Add VQN section. The VQN is a little different from iSCSI/NVMe-oF on
>>>> style limitation. Because iSCSI/NVMe-of is storage specific protocol,
>>>> the full string IQN(for iSCSI/iSER) and NQN(for NVMe-oF) represents
>>>> a "storage access address". However, Virtio Over Fabrics works as
>>>> transport layer rather than device layer, a URL style string is better
>>>> to Virtio Over Fabrics. For example:
>>>> virtio-of://blk-resource/nvme-pool/849a39ad-8d7b-4a7a-adb6-e7407ace532c
>>>> virtio-of://blk-resource/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1
>>>> ...
>>>> virtio-of://crypto-resource/25307f22-e5a8-4ea2-b7ca-79f5c3bebc3c
>>>
>>> I'm not sure what blk-resource and nvme-pool are in these URLs?
>>>
>>> Should the patch mention the virtio-of:// URI scheme?
>>>
>>
>> Sorry, I missed the address and port. They should be:
>> virtio-rdma://192.168.1.100:8549/blk-resource/nvme-pool/849a39ad-8d7b-4a7a-adb6-e7407ace532c
>> virtio-tcp://192.168.1.110/blk-resource/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1
> 
> Since it is device specific resource, may be blk-dev or blk-device reads 
> better, as behind this device there are multiple resources.
> 

OK.

>> ...
>>
>> This is human readable string. when the software(or hardware) handles 
>> this, this should be translated into:
>> transport: RDMA
>> address: 192.168.1.100
>> port: 8549 (default port 8549(CRC-16/ARC of "Virtio"))
>> target VQN: blk-resource/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1
>>
>> This section only defines the "VQN" schema, not the resource string 
>> schema.
>>
>> For a process, I think the following two are both fine:
>> ./foo --full-url 
>> virtio-rdma://192.168.1.100:8549/blk-resource/nvme-pool/849a39ad-8d7b-4a7a-adb6-e7407ace532c
>> ./foo --transport rdma --address 192.168.1.100 --port 8549 --tvqn
>> blk-resource/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1
>>
>> [snip]
>>
>>>
>>> Is the maximum name 255 UTF-8 bytes plus a NUL character? Please state
>>> this in the spec. For example:
>>>
>>>    \item The string is NUL terminated.
> s/NUL/NULL ?
> 

OK.

>>>    \item The maximum name is 256 bytes in length, including the NUL 
>>> character.
>>>
>> OK, fix this in the next version.
>>
>>>> +\item There is no strict style limitation.
>>>
>>> I think it's necessary to define representations for specific fabrics
>>> (e.g. TCP/IP) so that VQNs can be exchanged between different VIRTIO
>>> implementations (VMMs, DPUs, command-line utilities, etc). Otherwise two
>>> different implementations may represent the same address differently.
>>>
>>> Stefan
>>
> 
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: 
> https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
> 

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

