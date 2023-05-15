Return-Path: <virtio-comment-return-5893-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527C1C7EE22
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 07:10:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 85CF560086
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 07:10:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6ED97986509
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 07:10:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5AA46986348; Mon, 15 May 2023 07:10:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 48478986366
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 May 2023 07:10:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: iW5cd4NqNLaok6_fCot6gQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684134653; x=1686726653;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0xggi//TRRe9z5Z0wbPdDy2jYoCvWGjsO6eGfdEUYdc=;
        b=j+0IQgc2yf3aqvMX3H/QwJp22vXKXfFkTin9hb67ynRxM1IW6ym8cjDasUBeq0yRaq
         F6pVdHACzN2h79U3hHFxzbNMol9quuuETox3HXp+sVImXWW5kFZd9vyfUynn3bgS1NWq
         Pxo0DVWD6hVXLNHfYa8N2WujU7PVqQ56XbPoPZC9o9wD2QoL8Q8O/UPbgRlABi5TCPkb
         QnEEgbF4S35KPxudUIMSkQDwhIQzQniQgddqI1aqSbizlU6/Gya4KisPTq7jcDpGZYC+
         SSGtEt3C4bLF+v5dh/ImIgwRzTP8dZG6cQvD0prevNyH6uqK+Dk4um2kayqdKNVarz5W
         fHFw==
X-Gm-Message-State: AC+VfDwMr7PsEV37MeZhJwX9yHiUjRyb32YcGuAQu95l4ZeJOvB1EJ9S
	bNTMFu5BdJyk+fkTm5M0Y+N8CYpdPQ8G+qwAWCvXHiYmeLrcJ2G2MywPTvD+IaECqAk47Fgfw9o
	9FsnQYXq/6pqs580fOM9F3E9BKvQkq7MftQ==
X-Received: by 2002:a05:6a00:2d25:b0:643:6b94:374b with SMTP id fa37-20020a056a002d2500b006436b94374bmr48465778pfb.1.1684134653633;
        Mon, 15 May 2023 00:10:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5x1P3hGPFJExwxLz8MXIBRECCXHDCQd6+V55SVwekRtbHIHlGjKqo61lVWy+FG6sLAPlB2EA==
X-Received: by 2002:a05:6a00:2d25:b0:643:6b94:374b with SMTP id fa37-20020a056a002d2500b006436b94374bmr48465752pfb.1.1684134653277;
        Mon, 15 May 2023 00:10:53 -0700 (PDT)
Message-ID: <893b6ec0-a74f-69b7-95a3-988f0f9382a8@redhat.com>
Date: Mon, 15 May 2023 15:10:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "david.edmondson@oracle.com" <david.edmondson@oracle.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Yishai Hadas
 <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 Shahaf Shuler <shahafs@nvidia.com>
References: <20230506000135.628899-1-parav@nvidia.com>
 <CACGkMEt_2B68a+BZ4-vfeDf_eYj5ZhxrDNd6dxuiF85qr0yN2g@mail.gmail.com>
 <20230507093959-mutt-send-email-mst@kernel.org>
 <CACGkMEtfMbcu2OPsH6P2tA1aHh2FKygv=xkJ-e1XQzb62nE1vQ@mail.gmail.com>
 <20230510014534-mutt-send-email-mst@kernel.org>
 <43ec1c8d-7d11-2400-3649-1fe366b1e21b@nvidia.com>
 <20230510121417-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F030A76141320F03956EDC779@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB5481CEB307F413E53B03D502DC779@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtm5AS50YmPi6A5=gzZZ9Jm55NEJ3GKOTzv-Z0m5E5J_w@mail.gmail.com>
 <PH0PR12MB5481DE0569EC53A862A4D2E9DC749@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <PH0PR12MB5481DE0569EC53A862A4D2E9DC749@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v2 0/2] transport-pci: Introduce legacy registers access
 using AQ


在 2023/5/11 21:28, Parav Pandit 写道:
>
>> From: Jason Wang <jasowang@redhat.com>
>> Sent: Thursday, May 11, 2023 3:07 AM
>>>> 4th point in cover letter is: "config virtqueues of the managed device".
>>>>
>>>> This work belongs to the driver -> device direct communication using
>>>> a queue from driver to device.
>>>> So, I imagine this work can be done using a queue by the guest
>>>> driver and serviced by the device like how a guest driver configures
>>>> the queue today without any mediation.
>>>> For PCI, MMIO transport, surely this can be done by the PCI device
>>>> directly being is PF, VF or SIOV.
>>>> (Instead of config register, using a new queue interface). Looks fine to me.
>> Great.
>>
>>>> Can this new cfg queue mediated like CVQ that is done in a sw? May be yes.
>>>> Should it be always mediated when it is of VF, SIOV Device? Mostly
>>>> no because it is yet another VQ for PF, VF, SIOV.
>> Yes, the mediation is always conditional but not mandated when doing the
>> design.
>>
>>>> I am yet to parse rest of the 4 patches, please give me some time to review
>> it.
>>> I went over the past work of [1], [2].
>>>
>>> [1]
>>> https://lore.kernel.org/all/20220826100034.200432-2-lingshan.zhu@intel
>>> .com/ [2]
>>> https://lists.oasis-open.org/archives/virtio-comment/202208/msg00141.h
>>> tml
>>>
>>> The "virtio q as transport" in [2] is bit misleading as its only role is to
>> transport the _registers_ of the SIOV_R1 device through its parent PF.
>>> Rest of the work is the pure management work to manage the life cycle of
>> SIOV devices (create/delete/configure/compose).
>>
>> I think this can be tweaked for static provisioning setups like SR-IOV. E.g group
>> owner can choose to not advertise the life cycle management commands. Then
>> the hypervisor may know the provisioning is transport specific.
>>
> It is just bunch of admin commands in the new SIOV or virtual virtio device chapter.
> It is not a transport chapter.


Provisioning could be a part of the transport. For example SR-IOV allows 
static and dynamic provisioning. If a virtio device needs to be 
implemented in VF, it needs to be provisioned first.


>
>>> And the motivation is also clear is to provide composing a virtio device for the
>> guest VM for the backward compatibility for 1.x part of the specification.
>>> It seems fine and indeed orthogonal to me that: it is for backward
>> compatibility for already defined config fields for existing guest VM driver.
>>> It does not conflict with the cfgq/cmdq idea whose main purpose is for the
>> new config fields, new use cases that doesn't require any mediation.
>>> Such cfgq works across PF, VF, SF/SIOV devices in uniform way without
>> mediation.
>>
>> My understanding is that the cfgq/cmdq could be done on top, since the
>> commands are part of transport unless I miss something.
>>
> On top of what?
> cfgq/cmdq is just another queue like any other VQ.
> it is orthogonal to accessing 1.x registers using group owner's queue.


I think there hasn't been any proposal that call any virtqueue like 
cfgq/cmdq. So using that may cause a lot of misunderstanding. I think 
the context here is to provide or extend transport facilities via a 
virtqueue not something like the control virtqueue.


>
>>> It also scales device register memory also very well in predictable way.
>>>
>>> The registers and feature bits access described in [2], can certainly be done
>> using new non_legacy new AQ commands.
>>> Both legacy and non-legacy command have different semantics as Michael
>> mentioned.
>>> The AQ semantics that Michael did as opposed to "virtqueue as transport" fits
>> well for the use case described in [1].
>>> There are changes on going in MSI-X area and SIOV, so you might want to
>> wait for it.
>>
>> I think you meant IMS, actually, it's not hard to add new commands to support
>> a general IMS. We can start from a virtio specific one (as it looks a common
>> requirement not only for PCI/SIOV but also for transport like MMIO)
>>
> IMS configuration usually supposed to go directly to the device.


Admin virtqueue doesn't preventing anything from letting IMS go directly 
to the device.


>   Long discussion with Thomas on IMS topic.
> I will avoid diverting to unrelated discussion for now.
>
>>> Or proposed command in [1] should be tagged as siov_r1, then things will be
>> cleaner.
>>
>> Maybe we can say, one of the implementations is siov_r1, since it can be used
>> to implement devices in other transport. One of the main motivations for
>> transport virtqueue is to reduce the transport specific resources to ease the
>> virtio device implementation.
>>
> Yes, the main motivation as for backward compatibility for the currently defined features.
>
>>> With that I don't see legacy 3 commands anyway conflict with [1].
>> It doesn't, but it's not elegant since:
>>
> I don’t see how making 3 commands to 9 commands makes it elegant by doing bisecting of registers offset in hypervisor.


Or it needs to be done by the hardware and cross register write/read 
needs to be handled there as well.


> Its same thing using more opcodes.


Do we really care about the number of opcodes? I think we've reserved 
sufficient spaces.


>
>> 1) Modern transport, admin virtqueue with well defined transport commands
>> 2) Legacy transport, works moe like a PCI transport on top of the admin
>> virtqueue
>>
>> Transport virtqueue tend to be transport independent, but 2) tie it somehow to
>> the PCI. That's why I suggest to
>>
> The 4 patches are not transporting all the PCI things over transport VQ. it is not a transport.


It really depends on the different viewpoint. To me, adminq is not 
specific to PCI, so this proposal looks more like a partial transport 
for legacy.

So we have

1) all commands via PCI
2) all commands via adminq
3) part of the commands via PCI and the rest via adminq

This proposal goes to for 3 with transport specific commands while I 
think we need to try 1 and 2 then it is more general and it helps to 
avoid duplication with future features.

Thanks



> It is mediation done for SIOV like how it's done for 2 patches.
>
>> 1) introduce legacy transport commands
>>
>> or
>>
>> 2) tweak your proposal to become a PCI over admin virtqueue
>>
> This is not the objective to transport all PCI virtio fields over AQ.
> Transport VQ commands proposal commands and commands in this proposal are just fine the way there without quoting it as "transport".


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

