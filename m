Return-Path: <virtio-comment-return-5009-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752F8C6FD1C
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Mar 2023 02:52:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C14FE86E8
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Mar 2023 02:52:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 82CC1986462
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Mar 2023 02:52:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 77B1E986455; Thu, 23 Mar 2023 02:52:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 642FB9860C5
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Mar 2023 02:52:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: oERqrTkaOCCREIBgoR94iw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679539948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SyOk24cvLKy5Dl90PHV7KbSLw5+uh8RlQhce1eF/l8U=;
        b=abXg9UhZIheO/qXRd8VuP3f0LY8rTzOmknxYb5Xth05uAyW0VXVczdW5g0QGkXTDK/
         kBpt16S+pEKX8MCcYEoJDsDAcZRToqUOh85kEdDOUCSoWOB+LK6xc9Bgq3VYsA+tn5Vq
         fbihUNGiZ2LFvaFzNf9tC8o+sCeKNUnSZvVm4231RTJoaIPo0ZqjUcj02+SCDGFWvtC3
         DMPw8feVgcNos5N5ZO/lnxTCkKnU3jWJ3t32kPSPDLRCV7JpW8URsp7TlAN7/wpu4z7n
         y4KowxsX3ehU5W/35hQWPV2i2A07LmS5MoU3k0N27//sQHRCNj7DrBuNhb9pcb0s2EOu
         aQHw==
X-Gm-Message-State: AAQBX9eZkDfI+GrC9fmhTEgrxW7zA4UgG8n5+Xt+KLBYCtLh4eckpO0m
	5w85/XYruREC17Y/vweMdL1F7HOMoESIQoiHVcwZEsyAUudemDn6phkVphoyiP21EdO9shLRaR9
	Wa7+OXWEPm9lxZSpnD5dX0yil1KxczhslBA==
X-Received: by 2002:a17:903:300d:b0:19d:553:745c with SMTP id o13-20020a170903300d00b0019d0553745cmr3141904pla.9.1679539947740;
        Wed, 22 Mar 2023 19:52:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350a8+RCd/S3pDxKEMd0NhlvUgv/RZgJ0OpnGBhlEudL6mbB0IArBgYNqskyoyMWqJIGaLIqW1Q==
X-Received: by 2002:a17:903:300d:b0:19d:553:745c with SMTP id o13-20020a170903300d00b0019d0553745cmr3141895pla.9.1679539947381;
        Wed, 22 Mar 2023 19:52:27 -0700 (PDT)
Message-ID: <9c5b72b0-287c-a9a8-4e97-d891e02c3542@redhat.com>
Date: Thu, 23 Mar 2023 10:52:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: Heng Qi <hengqi@linux.alibaba.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, Alvaro Karsz
 <alvaro.karsz@solid-run.com>, virtio-dev@lists.oasis-open.org,
 virtio-comment@lists.oasis-open.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <20230320111840.64039-1-hengqi@linux.alibaba.com>
 <20230320144625-mutt-send-email-mst@kernel.org>
 <3a1969e7-2c4d-b64e-33b2-57311d73fb45@linux.alibaba.com>
 <20230321032921-mutt-send-email-mst@kernel.org>
 <b7e44ed9-ef85-bc89-b146-dc35f1af574e@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <b7e44ed9-ef85-bc89-b146-dc35f1af574e@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio-dev] Re: [PATCH v11] virtio-net: support inner header
 hash


在 2023/3/21 22:49, Heng Qi 写道:
>
>
> 在 2023/3/21 下午3:34, Michael S. Tsirkin 写道:
>> On Tue, Mar 21, 2023 at 11:56:14AM +0800, Heng Qi wrote:
>>>
>>> 在 2023/3/21 上午3:43, Michael S. Tsirkin 写道:
>>>> On Mon, Mar 20, 2023 at 07:18:40PM +0800, Heng Qi wrote:
>>>>> 1. Currently, a received encapsulated packet has an outer and an 
>>>>> inner header, but
>>>>> the virtio device is unable to calculate the hash for the inner 
>>>>> header. Multiple
>>>>> flows with the same outer header but different inner headers are 
>>>>> steered to the
>>>>> same receive queue. This results in poor receive performance.
>>>>>
>>>>> To address this limitation, a new feature VIRTIO_NET_F_HASH_TUNNEL 
>>>>> has been
>>>>> introduced, which enables the device to advertise the capability 
>>>>> to calculate the
>>>>> hash for the inner packet header. Compared with the out header 
>>>>> hash, it regains
>>>>> better receive performance.
>>>> So this would be a very good argument however the cost would be it 
>>>> would
>>>> seem we have to keep extending this indefinitely as new tunneling
>>>> protocols come to light.
>>>> But I believe in fact we don't at least for this argument:
>>>> the standard way to address this is actually by propagating entropy
>>>> from inner to outer header.
>>> Yes, we don't argue with this.
>>>
>>>> So I'd maybe reorder the commit log and give the explanation 2 below
>>>> then say "for some legacy systems
>>>> including entropy in IP header
>>>> as done in modern protocols is not practical, resulting in
>>>> bad performance under RSS".
>>> I agree. But not necessarily the legacy system, some scenarios need to
>>> connect multiple tunnels, for compatibility, they will not use optional
>>> fields or choose the old tunnel protocol.
>> compatibility ... with legacy systems, no?
>>
>>>>
>>>>> 2. The same flow can traverse through different tunnels, resulting 
>>>>> in the encapsulated
>>>>> packets being spread across multiple receive queues (refer to the 
>>>>> figure below).
>>>>> However, in certain scenarios, it becomes necessary to direct 
>>>>> these encapsulated
>>>>> packets of the same flow to a single receive queue. This 
>>>>> facilitates the processing
>>>>> of the flow by the same CPU to improve performance (warm caches, 
>>>>> less locking, etc.).
>>>>>
>>>>>                  client1                    client2
>>>>>                     |                          |
>>>>>                     |        +-------+         |
>>>>>                     +------->|tunnels|<--------+
>>>>>                              +-------+
>>>>>                                 |  |
>>>>>                                 |  |
>>>>>                                 v  v
>>>>>                         +-----------------+
>>>>>                         | processing host |
>>>>>                         +-----------------+
>>>> necessary is too strong a word I feel.
>>>> All this is, is an optimization, we don't really know how strong it is
>>>> even.
>>>>
>>>> Here's how I understand this:
>>>>
>>>> Imagine two clients client1 and client2 talking to each other.
>>>> A copy of all packets is sent to a processing host over a virtio 
>>>> device.
>>>> Two directions of the same flow between two clients might be
>>>> encapsulated in two different tunnels, with current RSS
>>>> strategies they would land on two arbitrary, unrelated queues.
>>>> As an optimization, some hosts might wish to make sure both directions
>>>> of the encapsulated flow land on the same queue.
>>>>
>>>>
>>>> Is this a good summary?
>>> I think yes.
>>>
>>>>
>>>> Now that things begin to be clearer, I kind of begin to agree with
>>>> Jason's suggestion that this is extremely narrow.  And what if I want
>>>> one direction on queue1 and another one queue2 e.g. adjacent 
>>>> numbers for
>>> I don't understand why we need this, can you point out some usage 
>>> scenarios?
>> If traffic is predominantly UDP, each queue can be processed in
>> parallel. If you need to look at the other side of the flow once
>> in a while, you can find it by doing ^1.
>
> I'm not sure if I align with you, but I try to answer. When we try to 
> place traffic in one direction on a certain queue,
> it means that we have calculated the hash, we can record the 
> five-tuple information and the queue number. When
> the traffic in the other direction comes, we can match what we just 
> recorded information and place it on the ^1 queue.
>
>>
>>>> the same flow?  If enough people agree this is needed we can accept 
>>>> this
>>>> but did you at all consider using something programmable like BPF for
>>> I think the problem is that our virtio device cannot support ebpf, 
>>> we can
>>> also ask Alvaro, Parav if their virtio devices can support ebpf 
>>> offloading.
>>> :)
>> This isn't ebpf, more like classic bpf. Just math done on packets,
>> no tables.
>
> We would also really like to use simple bpf offloading, which is cool. 
> But it still takes time, for example to
> support parsing of bpf instructions etc. on devices like fpga, which 
> they can't do easily now. Few devices
> are supported right now, I only see support for the netronome iNIC in 
> the kernel.
>
>    #git grep XDP_SETUP_PROG_HW
>    drivers/net/ethernet/netronome/nfp/nfp_net_common.c:    case 
> XDP_SETUP_PROG_HW:
>    drivers/net/netdevsim/bpf.c:    if (bpf->command == 
> XDP_SETUP_PROG_HW && !ns->bpf_xdpoffload_accept) {
>    drivers/net/netdevsim/bpf.c:    if (bpf->command == 
> XDP_SETUP_PROG_HW) {
>    drivers/net/netdevsim/bpf.c:    case XDP_SETUP_PROG_HW:
>    include/linux/netdevice.h:      XDP_SETUP_PROG_HW,
>    net/core/dev.c: xdp.command = mode == XDP_MODE_HW ? 
> XDP_SETUP_PROG_HW : XDP_SETUP_PROG;


Note that this is the eBPF hardware offloading which is much more 
complicated than what we propose now. For hash calculation, a simple 
classical bpf or other like P4 would be sufficient. The point is to 
allow the user to customize the hash calculation.

If this is too flexible for the hardware, it would be stillbetter to 
consider a more general hash calculation pipeline (XOR, swap, hash 
masks, hash key customization) like:

https://docs.napatech.com/r/Feature-Set-N-ANL10/Hash-Value-Generation

Thanks


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

