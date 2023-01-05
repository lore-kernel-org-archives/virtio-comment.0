Return-Path: <virtio-comment-return-3688-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3478D986639
	for <virtio-comment@lists.oasis-open.org>; Thu,  5 Jan 2023 14:29:24 +0000 (UTC)
Message-ID: <58603f43-9165-eb0c-9ee6-114874681109@linux.ibm.com>
Date: Thu, 5 Jan 2023 15:29:14 +0100
MIME-Version: 1.0
References: <20221223081939.26506-1-xuanzhuo@linux.alibaba.com>
 <c572aa1f-e2a9-721e-5389-aec605fc439f@linux.ibm.com>
 <88bdae7b-4ee0-8da8-5bb7-473957002bbe@linux.ibm.com>
 <1672917622.6090338-1-xuanzhuo@linux.alibaba.com>
From: Alexandra Winter <wintera@linux.ibm.com>
In-Reply-To: <1672917622.6090338-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [virtio-comment] Re: [PATCH v2 0/1] introduce virtio-ism:
 internal shared memory device
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: hans@linux.alibaba.com, herongguang@linux.alibaba.com, zmlcc@linux.alibaba.com, dust.li@linux.alibaba.com, tonylu@linux.alibaba.com, zhenzao@linux.alibaba.com, helinguo@linux.alibaba.com, gerry@linux.alibaba.com, mst@redhat.com, cohuck@redhat.com, jasowang@redhat.com, Jan Kiszka <jan.kiszka@siemens.com>, kgraul@linux.ibm.com, wenjia@linux.ibm.com, jaka@linux.ibm.com, hca@linux.ibm.com, twinkler@linux.ibm.com, raspl@linux.ibm.com, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>



On 05.01.23 12:20, Xuan Zhuo wrote:
> On Wed, 4 Jan 2023 14:52:10 +0100, Alexandra Winter <wintera@linux.ibm.com> wrote:
>>
>>
>>
>> On 23.12.22 09:19, Xuan Zhuo wrote:
[...]
>>>
>>> # Virtio ISM device
>>>
>>>     ISM devices provide the ability to share memory between different guests on
>>>     a host. A guest's memory got from ism device can be shared with multiple
>>>     peers at the same time. This shared relationship can be dynamically created
>>>     and released.
>>>>     The shared memory obtained from the device is divided into multiple ism
>>>     regions for share. ISM device provides a mechanism to notify other ism
>>>     region referrers of content update events.
> 
> 
> Thank you very much for your reply.
> 
>>
>> As this should work with SMC-D, let me point out some aspect of the ISM devices we use today:
>>
>> 1) Owner-User
>> For such a memory region one peer is the owner and the other peer is the user.
>> I don't see that in your diagram below. Maybe you could point that out more clearly.
> 
> Indeed, we only emphasize the creator. After the creation, all the references of
> this region are similar.
> 
> The user's management authority for region is reflected through permission, and
> this permissions can be transferred to other users.
> 
> 
>> I think the concept of user and owner simplifies device management (reset, recovery, etc..) and is
>> useful for other scenarios that use ISM as well.
> 
> Can you be more specific? What is the benefit of the concept of owner for
> device management?
> 

The owner/creator is responsible for the buffer/memory region. It decides when
the buffer should be freed. When it goes away, the buffer goes away.
Otherwise you have to keep track who is the last user, or 2 users could try to
free the buffer, etc.


>> After reading the whole thread, it seems to me that you propose a 'single owner, multiple
>> users' scenario, do I understand this correctly?
> 
> Yes, we allow the scenes of multiple users.
> 
>> Then SMC-D would use a subset of 'single owner-single user' which is fine.
>>
>>
>> 2) unidirectional buffers (memory regions)
>> For the ISM devices today only the user writes into the memory region and the owner only reads
>> from this memory region. This suits the SMC-D usecase and probably maximises performance in
>> other usecases as well.
>> So for compatibility, I would ask that the virtio-ism spec does not mandate to provide for
>> bidirectional usage of the memory regions. It should suffice, if the user can write and
>> the owner can read.
> 
> I think there will be bidirectional write or creator-write scenes.
> 
> SMC-D can be set up based on permission to read only for creator.

I agree.

> 
> 
>>
>> 3) Memory provided by the owner
>> In your diagram it seems that the hipervisor provides the memory for the buffers.
>> That puts the burden of providing enough memory or the risk of OOM on the Hipervisor
>> which is kind of unfair. In case of memory shortage this results in a first-come-first-serve
>> race.
>> We thought it more suitable that the instances that use ISM
>> (the owners of the buffers) provide for the memory. Then they can make the tradeoff
>> of memory for performance and do not impact other connections.
> 
> 
> Good Point.
> 
> Indeed, it is a fair solution provided by creator.
> 
> Our design considers that a user may maliciously occupys a region from other vm.
> 
> When creator allocated a memory from the guest and it is attached by one
> maliciously user, this user may not release the reference normally after the
> connection (may not smc connection) is closed.

The creator should be able to free the memory in any case. Attached users should
be notified.

> 
> If the region is provided by hypervisor, other user (including creator) can
> directly detach the region. And if one vm takes up too much regions, hypervisor
> can prevent this VM from alloc/attach new region.
> 
> Thanks.
> 

Especially in a cloud scenario memory is often a scarce resource and there may be
Class A guests with a lot of memory and Class B with less. If the hipervisor hands
out these virtio-ism buffers for free, that puts the bill on the hipervisor.

How is the hipervisor to decide how many regions are too much for a specific guest?
That requires an algorithm and/or additional configuration controls. 
If otoh you bill the regions to the creator's memory, you can fine-tune inside each
guest how much it should spend on ism-buffers. e.g by defining a maximum size and
number of regions.

Imagine a scenario, where a guest runs into the problem, that it cannot get the
regions it wants. In my experience an admin is happy if such an issue can be fixed 
by changing the settings inside the guest. 
When regions are handed out by the hipervisor, then the admin has to change a
hipervisor setting. And most probably needs to either reduce the setting for another
guest, or increase Hipervisor memory (who pays for that?)

Also now the problems in one guest may be caused by activtiy in another guest.
Of course this happens a lot in real life, when guests are sharing resources, but
users are still complaining about it and want to minimize this as much as possible
(SLAs, etc..) 

Of course there are always multiple ways to manage fairness and billing between guests,
and people have different preferences on usability. This is just my POV based on my own
experience and many customer stories from the typically highly virtualized
IBM Z environment.
Maybe others want to chime in.

> 
>>
>>>
>>> ## Design
>>>
>>>     This is a structure diagram based on ism sharing between two vms.
>>>
>>>     |-------------------------------------------------------------------------------------------------------------|
>>>     | |------------------------------------------------|       |------------------------------------------------| |
>>>     | | Guest                                          |       | Guest                                          | |
>>>     | |                                                |       |                                                | |
>>>     | |   ----------------                             |       |   ----------------                             | |
>>>     | |   |    driver    |     [M1]   [M2]   [M3]      |       |   |    driver    |             [M2]   [M3]     | |
>>>     | |   ----------------       |      |      |       |       |   ----------------               |      |      | |
>>>     | |    |cq|                  |map   |map   |map    |       |    |cq|                          |map   |map   | |
>>>     | |    |  |                  |      |      |       |       |    |  |                          |      |      | |
>>>     | |    |  |                -------------------     |       |    |  |                --------------------    | |
>>>     | |----|--|----------------|  device memory  |-----|       |----|--|----------------|  device memory   |----| |
>>>     | |    |  |                -------------------     |       |    |  |                --------------------    | |
>>>     | |                                |               |       |                               |                | |
>>>     | |                                |               |       |                               |                | |
>>>     | | Qemu                           |               |       | Qemu                          |                | |
>>>     | |--------------------------------+---------------|       |-------------------------------+----------------| |
>>>     |                                  |                                                       |                  |
>>>     |                                  |                                                       |                  |
>>>     |                                  |------------------------------+------------------------|                  |
>>>     |                                                                 |                                           |
>>>     |                                                                 |                                           |
>>>     |                                                   --------------------------                                |
>>>     |                                                    | M1 |   | M2 |   | M3 |                                 |
>>>     |                                                   --------------------------                                |
>>>     |                                                                                                             |
>>>     | HOST                                                                                                        |
>>>     ---------------------------------------------------------------------------------------------------------------
[...]

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

