Return-Path: <david@redhat.com>
References: <20210812133150.36146-1-david@redhat.com>
 <20210812133150.36146-3-david@redhat.com> <87k0kktpfs.fsf@redhat.com>
 <f4bf611f-c35f-8b22-5382-5a8ea87bfd31@redhat.com> <878s10tlm2.fsf@redhat.com>
From: David Hildenbrand <david@redhat.com>
Subject: Re: [virtio-comment] [PATCH v1 2/2] virtio-mem: describe interaction
 with memory properties
Message-ID: <e186d1a9-45b0-d34f-2f04-bbd8492b9698@redhat.com>
Date: Tue, 17 Aug 2021 14:20:05 +0200
MIME-Version: 1.0
In-Reply-To: <878s10tlm2.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On 17.08.21 12:24, Cornelia Huck wrote:
> On Tue, Aug 17 2021, David Hildenbrand <david@redhat.com> wrote:
> 
>>>> -The driver MUST NOT request to unplug memory blocks while the memory is
>>>> -still in use.
>>>> +The driver MUST NOT request unplug of memory blocks while corresponding memory
>>>> +or memory properties are still in use.
>>>>    
>>>>    The driver SHOULD initialize memory blocks after plugging them, the content
>>>>    is undefined.
>>>>    
>>>> +The driver SHOULD initialize memory properties of memory blocks after plugging
>>>> +them if it cannot deal with either the default settings or the previous
>>>> +setting.
>>>
>>> This would imply that any memory properties need to allow modification
>>> by the driver, right? It's clear what you want to introduce this for,
>>> but do we need to tighten the definition of what kind of memory
>>> properties we are talking about?
>>
>> Right, we actually want to have:
>>
>> "The device MUST allow to read and write memory and querying and
>> modifying memory properties of plugged memory blocks."
>>
> 
> "...must allow the driver to..."

Right, although we used something like "the device MUST allow the CPU 
to" ... and "The device MAY allow to read from unplugged memory blocks 
inside the region via DMA."

I guess if we want to cleanup, that would be e.g., "the device MUST 
allow the driver .. via the CPU".

> 
> Yes, I agree.
> 
>> (I would have thought we'd have that but I cannot find it right now; too
>> basic that I seem to have forgotten to add it initially)
>>
>>
>> What I want to document here, for example, is that on s390x you might
>> just get the "0" storage key or the "stable" storage attribute (-->
>> platform default) -- platform defaults. But you won't suddenly get a
>> setting that would result in unexpected behavior (e.g., strange
>> protection via the storage key, data loss due to the storage attribute).
>>
>> So consequently, when e.g., plugging memory in Linux where we don't have
>> to care about storage keys at all; we won't have to initialize storage
>> keys when plugging memory, because it will contain a safe/default value
>> (or just the old values the driver set earlier) that won't give us
>> surprises
> 
> But isn't that something that the device needs to do? E.g. plug the
> memory with the default storage key, or an old one if it replugs (and
> whatever is done for normal memory.)
> 
> If the driver needs to modify those values, it should just go ahead and
> do it, I guess; I don't think that needs to go into a normative
> statement, but maybe into a paragraph that explains the general
> functionality.

It's about which guarantees we give to the guest when plugging blocks. 
Optimally, we allow for sufficient freedom such that the device can 
avoid initializing things and the driver can avoid initializing things 
if the guest just doesn't care.

We also have in this patch: "The device MAY modify memory or reset 
memory properties to defaults of unplugged memory blocks at any time."

So the statement here is just the other way of looking at things: from 
the driver. If we can agree, we can just drop it, because the device 
description already tells us what can happen.

> 
>>
>> What would be your suggestion?
>>
>>>
>>>> +
>>>>    The driver SHOULD react to resize requests from the device
>>>>    (\field{requested_size} in the device configuration changed) by
>>>>    (un)plugging memory blocks.
>>>> @@ -253,25 +271,34 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
>>>>    
>>>>    \devicenormative{\subsubsection}{Device Operation}{Device Types / Memory Device / Device Operation}
>>>>    
>>>> -The device MAY change the content of unplugged memory blocks at any time.
>>>> +The device MUST provide the exact same memory properties with the exact same
>>>> +semantics for device memory the platform provides in the same configuration for
>>>> +ordinary RAM.
>>>
>>> This supposes that all RAM has the same properties across the whole
>>> platform, right? Do we want to be able to support some kind of
>>> heterogeneous platforms, or is that too much of an odd case?
>>
>> I think, if the platform already doesn't have the same memory properties
>> for all ordinary RAM (note that PMEM might be special and is not
>> ordinary RAM) in the configuration, then we'd be dealing with an odd
>> corner case already.
>>
>> If we would have such a platform, then I'd assume that the device would
>> also be flexible to either provide memory properties or not. Again, I'd
>> say we'd mimic the exact same semantics as the paltform.
>>
>> I guess once we actually run into such an odd case and want to handle it
>> properly for virtio-mem, we'd have to document how to detect on such a
>> platform if memory properties actually apply; there would have to be a
>> way already to detect the same for other ordinary RAM.
>>
>> Maybe we can rephrase this statement to cover this case already.
> 
> Perhaps we can talk about "comparable" RAM? IOW, if RAM in the same
> conditions would have attributes, the device memory must have it as
> well.

Exactly, although it's still a bit vague it would give us a better idea 
what's actually expected.

Thanks!

-- 
Thanks,

David / dhildenb

