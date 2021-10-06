Return-Path: <david@redhat.com>
Subject: Re: [PATCH RESEND v2 0/5] virtio-mem:
 VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE and interaction with memory properties
References: <20210920134653.16412-1-david@redhat.com>
 <87h7ebe2b9.fsf@redhat.com> <843ec36a-e682-017c-2343-7571ac7b3fcb@redhat.com>
 <87mtnmzaf0.fsf@redhat.com>
From: David Hildenbrand <david@redhat.com>
Message-ID: <d4fb2e98-931d-d53f-a24f-3d48ea3fc1ad@redhat.com>
Date: Wed, 6 Oct 2021 13:00:52 +0200
MIME-Version: 1.0
In-Reply-To: <87mtnmzaf0.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org
Cc: Hui Zhu <teawater@gmail.com>, Marek Kedzierski <mkedzier@redhat.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>, Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Wei Yang <richard.weiyang@linux.alibaba.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On 06.10.21 12:59, Cornelia Huck wrote:
> On Fri, Sep 24 2021, David Hildenbrand <david@redhat.com> wrote:
> 
>> On 23.09.21 17:31, Cornelia Huck wrote:
>>> On Mon, Sep 20 2021, David Hildenbrand <david@redhat.com> wrote:
>>>
>>>> Looking into supporting virtio-mem
>>>> a) without a shared zeropage for the memory backing of the device --
>>>>      not allowing the driver to read unplugged memory
>>>> b) on architectures with memory properties for RAM (e.g., s390x with
>>>>      storage keys and storage attributes)
>>>> requires extension of the spec to handle both cases cleanly and describe
>>>> the expected semantics.
>>>>
>>>> I'll open a github issue soon; in the meantime, I'll work on the actual
>>>> implementation in QEMU and Linux.
>>>
>>> LGTM, but would like a second opinion.
>> Thanks Conny! I'll wait for more feedback before I open a github issue /
>> request a vote.
> 
> Anyone else interested in looking at this?
> 
> Otherwise, I'd say just open an issue and request a vote.
> 

Would it make sense to split it into two parts?

VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE: #1-#4
Memory properties: #5

Then I could resend via the split and request two votes.

Thanks!

-- 
Thanks,

David / dhildenb

