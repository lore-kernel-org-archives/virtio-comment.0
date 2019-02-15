Return-Path: virtio-comment-return-620-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2CEA09860B2
	for <virtio-comment@lists.oasis-open.org>; Fri, 15 Feb 2019 12:33:12 +0000 (UTC)
References: <20190111114200.10026-2-dgilbert@redhat.com>
 <20190111131540.12a8abca.cohuck@redhat.com> <20190111122654.GE2738@work-vm>
 <20190115111038.6769d292.cohuck@redhat.com> <20190115112303.GB2135@work-vm>
 <20190116115638.152d6797.cohuck@redhat.com> <20190116200625.GG2351@work-vm>
 <20190211225225.7c39154d.cohuck@redhat.com> <20190213183755.GF2601@work-vm>
 <20190214115807.2bab4efb.cohuck@redhat.com> <20190214163707.GE2617@work-vm>
 <CAEkmjvWgQg-xhOb0xLKqofi31Dzwaz1M8DQGDBgrYqO8iJ7Ubg@mail.gmail.com>
 <20190215120718.7c7e09cc.cohuck@redhat.com>
 <f4f00ab1-fb60-483a-ab53-5d0546dd9a8e@redhat.com>
 <20190215132843.65552e44.cohuck@redhat.com>
From: David Hildenbrand <david@redhat.com>
Message-ID: <4c526716-44f5-5eea-a855-f0b9f91cb579@redhat.com>
Date: Fri, 15 Feb 2019 13:33:06 +0100
MIME-Version: 1.0
In-Reply-To: <20190215132843.65552e44.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] [PATCH 1/3] shared memory: Define shared memory
 regions
To: Cornelia Huck <cohuck@redhat.com>
Cc: Frank Yang <lfy@google.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On 15.02.19 13:28, Cornelia Huck wrote:
> On Fri, 15 Feb 2019 12:26:00 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
>> Probing is always ugly. But I think we can add something like
>>  the x86 PCI hole between 3 and 4 GB after our initial boot memory.
>> So there, we would have a memory region just like e.g. x86 has.
> 
> A special region is probably the best way out of this pickle. We would
> only need the discovery ccw for virtio, then.
> 
>>
>> This should even work with other mechanism I am working on. E.g.
>> for memory devices, we will add yet another memory region above
>> the special PCI region.
>>
>> The layout of the guest would then be something like
>>
>> [0x000000000000000]
>> ... Memory region containing RAM
>> [ram_size         ]
>> ... Memory region for e.g. special PCI devices
>> [ram_size +1 GB   ]
>> ... Memory region for memory devices (virtio-pmem, virtio-mem ...)
>> [maxram_size - ram_size + 1GB]
>>
>> We would have to create proper page tables for guest backing that take
>> care of the new guest size (not just ram_size). Also, to the guest we
>> would indicate "maximum ram size == ram_size" so it does not try to
>> probe the "special" memory.
> 
> Hm... so that would be:
> - 0..ram_size: just like it is handled now
> - ram_size..ram_size + 1GB: guest does not treat it as ram, but does
>   build page tables for it
> - ram_size + 1GB..maxram_size: for whatever memory devices do with it
> 
> How does the guest probe this? (SCLP?) Or does the guest simply know
> via some kind of probable feature that there's a 1GB region there?

As the guest only "knowns" ram, there is a "maximum ram size" specified
via SCLP. An unmodified guest will not probe beyond that.

The parts of the 1GB used by a device should be communicated via the
paravirtualized device I guess. PCI bars don't really fit I assume, so
we might need some virtio-ccw thingy (you're the expert :)) on top. That
is one part to be clarified.

I guess the guest does not need to know about the whole 1GB, only per
device about the used part. We can then built page tables in the guest
for that part when plugging.

-- 

Thanks,

David / dhildenb

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

