Return-Path: <david@redhat.com>
Subject: Re: [virtio-comment] [PATCH 1/1] virtio-pmem: Support PCI
 BAR-relative addresses
References: <20210721205939.20746-1-tstark@linux.microsoft.com>
 <20210721205939.20746-2-tstark@linux.microsoft.com>
 <87k0li7fry.fsf@redhat.com>
 <20210722232626.GA32055@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <30dd175a-e9da-0f18-0f45-3317bd7f0b8f@redhat.com>
 <20210723183826.GA11436@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
From: David Hildenbrand <david@redhat.com>
Message-ID: <fcd76b6e-f6e5-c0e9-7d0d-e7d84c5553f9@redhat.com>
Date: Fri, 23 Jul 2021 21:18:21 +0200
MIME-Version: 1.0
In-Reply-To: <20210723183826.GA11436@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Taylor Stark <tstark@linux.microsoft.com>, Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, grahamwo@microsoft.com, benhill@microsoft.com, mst@redhat.com, pankaj.gupta@ionos.com, Taylor Stark <tstark@microsoft.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On 23.07.21 20:38, Taylor Stark wrote:
> On Fri, Jul 23, 2021 at 09:01:48AM +0200, David Hildenbrand wrote:
>> On 23.07.21 01:26, Taylor Stark wrote:
>>> On Thu, Jul 22, 2021 at 01:24:17PM +0200, Cornelia Huck wrote:
>>>> On Wed, Jul 21 2021, tstark@linux.microsoft.com wrote:
>>>>
>>>>> From: Taylor Stark <tstark@microsoft.com>
>>>>>
>>>>> Update the virtio-pmem RFC spec to add support for describing the pmem region
>>>>> via PCI BARs. Shared memory windows are used to accomplish this, similar to
>>>>> virtio-fs and virtio-gpu. This is required to support virtio-pmem in Hyper-V,
>>>>> since Hyper-V only allows PCI devices to operate on memory ranges defined via
>>>>> BARs.
>>>>
>>>> Given that we already have pmem support out there (even though the spec
>>>> has not been included yet, should this get a feature?
>>>
>>> I wasn't sure if we needed to handle backwards compatibility given that pmem
>>> hasn't been merged into the spec yet. If we do, then yes I think it makes sense
>>> to add a feature bit. How about VIRTIO_PMEM_F_SHMEM_REGION?
>>
>> The implementations that are upstream win, and usually we get a spec
>> after the implementation is mature. The spec merely documents what
>> the existing implementations are doing. Of course, one can plan
>> ahead and propose additions to the spec that won't break existing
>> setups.
>>
>> The feature seems to be glued to PCI BARs, right? Maybe that should
>> be part of the feature name.
>>
>> -- 
>> Thanks,
>>
>> David / dhildenb
> 
> I had to do a bit of research to develop an opinion on including BAR in
> the name. Using BARs is the implementation for the PCI transport, but there
> are other transports that have support for shared memory regions but don't
> use BARs (e.g. mmio - see vm_get_shm_region). Using shared memory regions
> was initially a convenient way to use PCI BARs, but I think it could be
> valuable for other transports as well (it adds similarity with other virtio
> devices). So I think it makes sense to leave BAR out of the name, since
> that's transport specific. Maybe I should retitle the patch? Let me know
> your thoughts (especially since I'm learning on the fly).

Ah, the content doesn't actually talk about PCI BARs, that's my source 
of confusion :)

I know that virtio-fs also uses BARs in DAX mode, but I have no idea how 
they named features (if any?) or how they described it in their spec. 
Might be worth exploring.


-- 
Thanks,

David / dhildenb

