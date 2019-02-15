Return-Path: virtio-comment-return-631-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A367A9860B3
	for <virtio-comment@lists.oasis-open.org>; Fri, 15 Feb 2019 22:08:18 +0000 (UTC)
References: <CAEkmjvWgQg-xhOb0xLKqofi31Dzwaz1M8DQGDBgrYqO8iJ7Ubg@mail.gmail.com>
 <20190215120718.7c7e09cc.cohuck@redhat.com>
 <f4f00ab1-fb60-483a-ab53-5d0546dd9a8e@redhat.com>
 <20190215132843.65552e44.cohuck@redhat.com>
 <4c526716-44f5-5eea-a855-f0b9f91cb579@redhat.com>
 <20190215133753.1e74c6d8.cohuck@redhat.com> <20190215135016.GG2630@work-vm>
 <7e601742-a4f0-1c89-ce4a-018d1bc0d63f@redhat.com>
 <20190215140233.GH2630@work-vm>
 <b7bb1e23-707e-a6da-7bb7-5498c7f3d73a@redhat.com>
 <20190215151424.GI2630@work-vm>
From: David Hildenbrand <david@redhat.com>
Message-ID: <f18ad134-c98a-e0f1-25df-8684983826eb@redhat.com>
Date: Fri, 15 Feb 2019 23:08:12 +0100
MIME-Version: 1.0
In-Reply-To: <20190215151424.GI2630@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH 1/3] shared memory: Define shared memory
 regions
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Frank Yang <lfy@google.com>, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

>> On s390x, we have to define the size of the host->guest page table when
>> starting the guest. So we need some upper limit.
> 
> That's OK; x86 also has that because they have a limited physical
> and virtual address size [which may or may not be correctly passed to
> the guest!].
> 
>> Mapping anywhere, I
>> really don't like. Letting the guest define the mapping, I really don't
>> like.
> 
> Well it's OK to have a hole for it, but letting the guest choose where
> those mappings go in the hole is the norm for PCI (there are
> exceptions).

Yes, but at least if we need a new interface for this for s390x (what I
assume), not allowing the guest to map is obviously easier. However if
there is good reason why it is needed, nothing speaks against it. We
just have to offer the guest enough information to do it.

> 
>> We can of course switch the order of mappings
>>
>> [0x000000000000000      ]
>> ... Memory region containing RAM
>> [ram_size         	]
>> ... Memory region for memory devices (virtio-pmem, virtio-mem ...)
>> [maxram_size - ram_size ]
>> ... Memory region for e.g. special PCI/CCW devices
>> [                    TBD]
>>
>> We can size TBD in a way that we e.g. max out the current page table
>> size before having to switch to more levels.
> 
> Yes, that's fine to set some upper limit; you've just got to make sure
> that the hypervisor knows where it can put stuff and if the guest
> does PCI that it knows where it's allowed to put stuff and as long
> as the two don't overlap everyone is happy.
> 
> [We should probably take this level of detail off this list - it's
> parsecs away from the detail of virtio]

Yes indeed, I guess this gives Conny an idea on how it could work, so
now she can design an interface - and clarify all the details ;)

I guess we'll need something for both, virtio-ccw and virtio-pci on s390x.

I'll be happy to discuss this off-list.

*flies away*

Have a great weekend Dave!


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

