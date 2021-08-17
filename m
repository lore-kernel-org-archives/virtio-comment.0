Return-Path: <david@redhat.com>
Subject: Re: [virtio-comment] [PATCH v1 1/2] virtio-mem: introduce
 VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
References: <20210812133150.36146-1-david@redhat.com>
 <20210812133150.36146-2-david@redhat.com> <87mtpgtpye.fsf@redhat.com>
 <d924385f-fc8f-4069-e6d5-664514320816@redhat.com> <87h7fotofz.fsf@redhat.com>
From: David Hildenbrand <david@redhat.com>
Message-ID: <2044101d-2b2e-0fbf-68a7-2c4398084a40@redhat.com>
Date: Tue, 17 Aug 2021 11:27:35 +0200
MIME-Version: 1.0
In-Reply-To: <87h7fotofz.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On 17.08.21 11:23, Cornelia Huck wrote:
> On Tue, Aug 17 2021, David Hildenbrand <david@redhat.com> wrote:
> 
>> On 17.08.21 10:50, Cornelia Huck wrote:
>>> On Thu, Aug 12 2021, David Hildenbrand <david@redhat.com> wrote:
>>>> +With VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, the device MAY allow the CPU to
>>>
>>> "If VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has been negotiated, ..."
>>>
>>
>> ack
>>
>>>> +read memory of unplugged memory blocks inside \field{usable_region_size}.
>>>
>>> A compliant driver would not read that memory, would it?
>>
>> Indeed. The device could decide to allow for reading, but it's pretty
>> much undefined behavior.
> 
> Maybe make it "SHOULD NOT"? Less strong than "MUST NOT", but still makes
> clear that a driver reading it is pretty much doing the wrong thing.
> 

I was also wondering to just drop it completely, because it's actually 
undefined behavior. What do you think?

-- 
Thanks,

David / dhildenb

