Return-Path: <virtio-comment-return-8627-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59C8C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 09:55:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 16FA8120D54
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 09:55:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D3FB29863BD
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 09:55:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B3E6098638E; Mon, 27 Nov 2023 09:55:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A5405986394
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 09:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="392421348"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="392421348"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="885968521"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="885968521"
Message-ID: <8083cbb4-9eb9-4c87-ba80-24ea100827c0@intel.com>
Date: Mon, 27 Nov 2023 17:54:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "eperezma@redhat.com"
 <eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
References: <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
 <PH0PR12MB54816D26CE3B22CA84CAAE2ADCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvqB0Q3N6UBuVXad7GLGRWB_YS1rbdNZy8h85jkXGePtg@mail.gmail.com>
 <PH0PR12MB5481EEAEDFECA480BB3D69DCDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu3vSyVo6O4TvahiQYqZymnK7m+SWY9nzaQHFBEAbUpMA@mail.gmail.com>
 <20231124035211-mutt-send-email-mst@kernel.org>
 <CACGkMEtHhf2KTHeYcfRndh7GMu22R_Q4ABNb__zv_cn0na2N6Q@mail.gmail.com>
 <20231124071048-mutt-send-email-mst@kernel.org>
 <CACGkMEuLCHccVTWxT=DWDJRK3XGC_8wQW6AvuZ2kpTa8C-WeQQ@mail.gmail.com>
 <20231124092334-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231124092334-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND



On 11/24/2023 10:45 PM, Michael S. Tsirkin wrote:
> On Fri, Nov 24, 2023 at 09:01:53PM +0800, Jason Wang wrote:
>> On Fri, Nov 24, 2023 at 8:17 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>> On Fri, Nov 24, 2023 at 07:50:42PM +0800, Jason Wang wrote:
>>>>> I frankly don't see how a bit which is completely non-orthogonal with
>>>>> device and driver state can be useful for debug.
>>>> The bit is to make sure the state of a device doesn't change. It may
>>>> help or not just like if you want to pause a cpu/process during the
>>>> debug.
>>> Heh. But it would be much better to have an orthogonal state
>>> that driver can just set without worrying much about
>>> device being broken somehow.
>> In that case we still need a preise definition of the state. So I
>> don't see the difference here.
> You don't? If you can inspect state without perturbing it, that is
> better for debugging than an intrusive interface that perturbs state.
>
>
>> Anyhow, we can leave debugging aside.
>>
>>>
>>>>> For debug you want something that just always works.
>>>>> Not an interface that has so many requirements it will break if
>>>>> you look at it sidewise.
>>>>>
>>>>>
>>>>>>> I don’t see wasting time here.
>>>>>>> If its debug, its debug.
>>>>>>> If its migration, it is migration.
>>>>>>> If its pm, its pm.
>>>>>> Obviously not. Migration should leverage existing facilities as much
>>>>>> as possible instead of duplicating them.
>>>>> I don't think there's anything obvious here.  A lot of device state
>>>>> can't be easily accessed with existing facilities.
>>>> Then we can invent new things.
>>> So the approach this patchset takes is a single interface for
>>> all state introspection. Some duplication of functionality
>>> for the sake of consistency.
>>> You don't like it fine but
>> The (partial) duplication should be fine as long as it doesn't have
>> any issue, but I do see a lot of issues. So I can't say I like it.
> Let's focus on issue really instead of endless high level
> architecture discussions.
>
>>> there is nothing obvious that it's a bad thing. It's a tradeoff.
>>>
>>>>> The logical
>>>>> continuation of your reasoning would be to add state introspection
>>>>> commands e.g. to cvq in virtio net and then use tricks like shadow vq to
>>>>> issue these.
>>>> For the device state, yes. Because it is device logic and it is not
>>>> what platform or transport can know.
>>> Exactly as I thought. Don't think shadow VQ is something we
>>> can reasonably make a single migration mechanism though.
>> That's my understanding as well. It's up to the hypervisor, spec needs
>> to focus on the mechanism but not policy.
>>
>>> It feels fragile and heavyweight. It's more of a work
>>> around hardware limitations.
>>>
>>>
>>>>> Yea, possible, but can we not go there please?  Nothing is
>>>>> wrong with just building commands that do exactly what we want them to
>>>>> do instead of trying to build a ship in a bottle.
>>>> But it's not the case for others.
>>>>
>>>> E.g in Parav's proposal, it tries to rule P2P behaviour via virtio
>>>> admin commands when there is a duplication
>>> Yes there's some duplication. Advantage is consistency.
>> Just to clarify, we do need things like suspend but I don't see
>> dealing with PCI P2P in virtio as consistent (e.g we don't imply any
>> PCI stuff in virtio reset).
> I think I can clarify.  The consistency is that there's a single chapter
> that deals with migration, also hypervisors will all do exactly the same
> instead of each hypervisor guessing how to do migration and going its
> own way.
>
>
>
>
>>>   I actually
>>> suggested ways to reduce duplication, by using transport offsets as
>>> tags.
>> I don't see a connection with P2P here. Or I may miss something.
> I don't even know what P2P is in this context. Or why we are
> discussing it. Is this going to be another distraction that
> no one knows how it will work, just like mentioning TD randomly?
>
>>> Finding a right balance means we all need to stop going to
>>> extremes, I wish you and lingshan would stop trying to force everyone
>>> to use registers and parav would stop trying to force dma.
>> There is a misunderstanding. Actually. I don't want to force
>> registers.
> You keep insisting on overlaying suspend functionality
> over the existing transport. For pci that is going to be
> in a register.
>
>> Which kind of interface is the best way to go is really
>> implementation specific. In some implementations, registers are cheap
>> but not virtqueue, in others, virtqueue is cheap but not register.
>> They are all fine. But we can't not claim one proposal that is
>> optimized for a specific implementation to be the best way. What I
>> want to do is not limit the facilities that are used for live
>> migration to any specific transport. I think Ling Shan agreed with me
>> in this part. It needs to work on all interfaces regardless of
>> registers, DMA, CMA or others. That's why I suggest we focus on what
>> needs to be migrated first. That is define the following things
>>
>> 1) way to suspend/resume a device
>> 2) virtqueue states, indices or inflight ones
>> 3) device states
>>
>> It is just like how we define virtqueues/features/status and other
>> basic facilities where we do not tie it to any specific interfaces
>> like DMA, CMA, registers or admin commands. Virtio benefited from the
>> flexibility like this in the past so why not stick to that?
> Because migration is a complex enough topic that we simply know
> from experience that
> - things like error handling are needed
> - passing big arrays around is needed
> these just do not work reasonably well over registers and
> this is why admin commands were invented.
>
>
>
>> After this, each transport can choose to implement it in their own
>> way. For example, if there's a proposal to use those via admin
>> virtqueue that's fine.
>> And registers also fine and other transports.
>> That's why only the last patch of this series is dealing with the PCI
>> specific part.
> Maybe they are fine in theory. So far I didn't see anything cohesive
> that is close functionally being even to Parav's proposal of migration
> over admin commands. There's no specific *reason* not to do that,
> practically - I don't see why
>
>
>>>> and a layer violation.
>>> layers are only good if they make sense.
>> Case by case, for example, PCI PM has defined the state and the
>> interaction with P2P. Reusing that seems much cleaner than inventing a
>> mechanism in the virtio layer. Or if it needs a side channel, it needs
>> to be invented in PCI not virtio.
>>
>> Thanks
> There's no *if* in my opinion - migration is way easier for hypervisors
> to implement as a side channel so any device state can be migrated. And
> this is uniform across transports. Is it harder or easier for hardware
> to implement? We have a hardware vendor pushing a side channel approach
> so it seems likely they know what is good for hardware? If it is somehow
> nvidia specific - can we please have other vendors with actual
> plans implementing this hardware (and note this has nothing to do with
> VDPA - all this SUSPEND bit work is only useful for full offload) come
> forward and say "we don't support this, we support that"?  Or is this
> for some unnamed vendors not on the TC? Maybe they should join the TC to
> influence the direction then.  Because right now it looks like software
> guys telling hardware guys what is good for hardware and I don't see how
> this makes any sense.
I guess most of the TC members are SW experts and virtio is not only for HW,
SW emulated virtio works for many years.

This spec defines behaviors of virtio devices, not RTL, not layout.

So I assume SW experts are qualified to comment here.
>
>
>
>>>> Thanks
>>>>
>>>>
>>>>> --
>>>>> MST
>>>>>


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

