Return-Path: <david@redhat.com>
References: <20210812133150.36146-1-david@redhat.com>
 <20210812133150.36146-3-david@redhat.com> <87k0kktpfs.fsf@redhat.com>
From: David Hildenbrand <david@redhat.com>
Subject: Re: [virtio-comment] [PATCH v1 2/2] virtio-mem: describe interaction
 with memory properties
Message-ID: <f4bf611f-c35f-8b22-5382-5a8ea87bfd31@redhat.com>
Date: Tue, 17 Aug 2021 11:58:30 +0200
MIME-Version: 1.0
In-Reply-To: <87k0kktpfs.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

[...]

>>   \subsection{Device ID}\label{sec:Device Types / Memory Device / Device ID}
>>   24
>>   
>> @@ -47,7 +57,8 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Device / Feature bits}
>>   \item[VIRTIO_MEM_F_ACPI_PXM (0)] The field \field{node_id} in the device
>>   configuration is valid and corresponds to an ACPI PXM.
>>   \item[VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE (1)] The driver MUST NOT access
>> -unplugged memory.
>> +unplugged memory. \footnote{This feature is expected to be enabled on platforms
>> +with memory properties that might get modified implicitly on memory access.}
> 
> "On platforms with memory properties (...), this feature is expected to
> be offered by the device." ?
> 

Ack.

[...]

>>   
>> -The driver MUST NOT request to unplug memory blocks while the memory is
>> -still in use.
>> +The driver MUST NOT request unplug of memory blocks while corresponding memory
>> +or memory properties are still in use.
>>   
>>   The driver SHOULD initialize memory blocks after plugging them, the content
>>   is undefined.
>>   
>> +The driver SHOULD initialize memory properties of memory blocks after plugging
>> +them if it cannot deal with either the default settings or the previous
>> +setting.
> 
> This would imply that any memory properties need to allow modification
> by the driver, right? It's clear what you want to introduce this for,
> but do we need to tighten the definition of what kind of memory
> properties we are talking about?

Right, we actually want to have:

"The device MUST allow to read and write memory and querying and 
modifying memory properties of plugged memory blocks."

(I would have thought we'd have that but I cannot find it right now; too 
basic that I seem to have forgotten to add it initially)


What I want to document here, for example, is that on s390x you might 
just get the "0" storage key or the "stable" storage attribute (--> 
platform default) -- platform defaults. But you won't suddenly get a 
setting that would result in unexpected behavior (e.g., strange 
protection via the storage key, data loss due to the storage attribute).

So consequently, when e.g., plugging memory in Linux where we don't have 
to care about storage keys at all; we won't have to initialize storage 
keys when plugging memory, because it will contain a safe/default value 
(or just the old values the driver set earlier) that won't give us surprises

What would be your suggestion?

> 
>> +
>>   The driver SHOULD react to resize requests from the device
>>   (\field{requested_size} in the device configuration changed) by
>>   (un)plugging memory blocks.
>> @@ -253,25 +271,34 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
>>   
>>   \devicenormative{\subsubsection}{Device Operation}{Device Types / Memory Device / Device Operation}
>>   
>> -The device MAY change the content of unplugged memory blocks at any time.
>> +The device MUST provide the exact same memory properties with the exact same
>> +semantics for device memory the platform provides in the same configuration for
>> +ordinary RAM.
> 
> This supposes that all RAM has the same properties across the whole
> platform, right? Do we want to be able to support some kind of
> heterogeneous platforms, or is that too much of an odd case?

I think, if the platform already doesn't have the same memory properties 
for all ordinary RAM (note that PMEM might be special and is not 
ordinary RAM) in the configuration, then we'd be dealing with an odd 
corner case already.

If we would have such a platform, then I'd assume that the device would 
also be flexible to either provide memory properties or not. Again, I'd 
say we'd mimic the exact same semantics as the paltform.

I guess once we actually run into such an odd case and want to handle it 
properly for virtio-mem, we'd have to document how to detect on such a 
platform if memory properties actually apply; there would have to be a 
way already to detect the same for other ordinary RAM.

Maybe we can rephrase this statement to cover this case already.

Thanks!

-- 
Thanks,

David / dhildenb

