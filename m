Return-Path: <jasowang@redhat.com>
Subject: Re: [virtio-comment] Live Migration of Virtio Virtual Function
References: <DM4PR12MB504062CEF6BEDABE6F76DEC2DEF99@DM4PR12MB5040.namprd12.prod.outlook.com>
 <62bd1c8d-c56e-fc98-f833-61d9c999f814@redhat.com>
 <cc7e769a-fee6-2940-74a7-03dbc98a109f@nvidia.com>
 <CACGkMEuAo84oGL6saMTFaS7yzsihuNUWVK4AkVtctT80Opc8Zg@mail.gmail.com>
 <c97bcfbf-81c6-c70c-a943-7f72b0d94d71@nvidia.com>
 <CACGkMEvxxsnEZYCok-xPLnKzJM=501M3erkZ-EDegOFD9YfQdg@mail.gmail.com>
 <5eb7d5b4-a715-5ef2-81f7-9721d865d6ac@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5b4db3ac-0291-69ea-7e82-5b3f19049e61@redhat.com>
Date: Thu, 19 Aug 2021 10:44:46 +0800
MIME-Version: 1.0
In-Reply-To: <5eb7d5b4-a715-5ef2-81f7-9721d865d6ac@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>, Shahaf Shuler <shahafs@nvidia.com>, Ariel Adam <aadam@redhat.com>, Amnon Ilan <ailan@redhat.com>, Bodong Wang <bodong@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, Liran Liss <liranl@nvidia.com>, Oren Duer <oren@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>


在 2021/8/18 下午7:45, Max Gurtovoy 写道:
>
> On 8/18/2021 1:46 PM, Jason Wang wrote:
>> On Wed, Aug 18, 2021 at 5:16 PM Max Gurtovoy <mgurtovoy@nvidia.com> 
>> wrote:
>>>
>>> On 8/17/2021 12:44 PM, Jason Wang wrote:
>>>> On Tue, Aug 17, 2021 at 5:11 PM Max Gurtovoy <mgurtovoy@nvidia.com> 
>>>> wrote:
>>>>> On 8/17/2021 11:51 AM, Jason Wang wrote:
>>>>>> 在 2021/8/12 下午8:08, Max Gurtovoy 写道:
>>>>>>> Hi all,
>>>>>>>
>>>>>>> Live migration is one of the most important features of
>>>>>>> virtualization and virtio devices are oftenly found in virtual
>>>>>>> environments.
>>>>>>>
>>>>>>> The migration process is managed by a migration SW that is 
>>>>>>> running on
>>>>>>> the hypervisor and the VM is not aware of the process at all.
>>>>>>>
>>>>>>> Unlike the vDPA case, a real pci Virtual Function state resides in
>>>>>>> the HW.
>>>>>>>
>>>>>> vDPA doesn't prevent you from having HW states. Actually from the 
>>>>>> view
>>>>>> of the VMM(Qemu), it doesn't care whether or not a state is 
>>>>>> stored in
>>>>>> the software or hardware. A well designed VMM should be able to hide
>>>>>> the virtio device implementation from the migration layer, that 
>>>>>> is how
>>>>>> Qemu is wrote who doesn't care about whether or not it's a software
>>>>>> virtio/vDPA device or not.
>>>>>>
>>>>>>
>>>>>>> In our vision, in order to fulfil the Live migration 
>>>>>>> requirements for
>>>>>>> virtual functions, each physical function device must implement
>>>>>>> migration operations. Using these operations, it will be able to
>>>>>>> master the migration process for the virtual function devices. Each
>>>>>>> capable physical function device has a supervisor permissions to
>>>>>>> change the virtual function operational states, save/restore its
>>>>>>> internal state and start/stop dirty pages tracking.
>>>>>>>
>>>>>> For "supervisor permissions", is this from the software point of 
>>>>>> view?
>>>>>> Maybe it's better to give an example for this.
>>>>> A permission to a PF device for quiesce and freeze a VF device for 
>>>>> example.
>>>> Note that for safety, VMM (e.g Qemu) is usually running without any 
>>>> privileges.
>>> You're mixing layers here.
>>>
>>> QEMU is not involved here. It's only sending IOCTLs to migration 
>>> driver.
>>> The migration driver will control the migration process of the VF using
>>> the PF communication channel.
>> So who will be granted the "permission" you mentioned here?
>
> This is just an expression.
>
> What is not clear ?


Well, the "supervisor permission" usually means it must be done that way 
otherwise it may have security implication.

But your answer sounds nothing related to that which is confusing.


>
> The PF device will have an option to quiesce/freeze the VF device.


Is such design a must? If no, why not simply introduce those functions 
in the VF? If yes, what's the reason for making virtio different (e.g 
VCPU live migration is not designed like that)?


>
> This is simple. Why are you looking for some sophisticated problems ?


It's pretty natural that people may review the patch or proposal from 
different angles. But it looks to me it's not something you want to see? 
If you mandate people to think the same as you, that's not how the 
community work. And it makes the conversation very hard. Before we 
moving forward, I think we should agree on some basic code-of-conduct as 
what Linux had: 
https://www.kernel.org/doc/html/latest/process/code-of-conduct.html. 
Especially the second standard: "Being respectful of differing 
viewpoints and experiences".

In the mean time, it's your duty to explain the motivation in a clear 
way or explain it to the reviewers. I suggest you to re-visit how to 
submit patches: 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html


>
>>>
>>>>>>> An example of this approach can be seen in the way NVIDIA performs
>>>>>>> live migration of a ConnectX NIC function:
>>>>>>>
>>>>>>> https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci
>>>>>>> <https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci>
>>>>>>>
>>>>>>> NVIDIAs SNAP technology enables hardware-accelerated software 
>>>>>>> defined
>>>>>>> PCIe devices. virtio-blk/virtio-net/virtio-fs SNAP used for storage
>>>>>>> and networking solutions. The host OS/hypervisor uses its standard
>>>>>>> drivers that are implemented according to a well-known VIRTIO
>>>>>>> specifications.
>>>>>>>
>>>>>>> In order to implement Live Migration for these virtual function
>>>>>>> devices, that use a standard drivers as mentioned, the 
>>>>>>> specification
>>>>>>> should define how HW vendor should build their devices and for SW
>>>>>>> developers to adjust the drivers.
>>>>>>>
>>>>>>> This will enable specification compliant vendor agnostic solution.
>>>>>>>
>>>>>>> This is exactly how we built the migration driver for ConnectX
>>>>>>> (internal HW design doc) and I guess that this is the way other
>>>>>>> vendors work.
>>>>>>>
>>>>>>> For that, I would like to know if the approach of “PF that controls
>>>>>>> the VF live migration process” is acceptable by the VIRTIO 
>>>>>>> technical
>>>>>>> group ?
>>>>>>>
>>>>>> I'm not sure but I think it's better to start from the general
>>>>>> facility for all transports, then develop features for a specific
>>>>>> transport.
>>>>> a general facility for all transports can be a generic admin queue ?
>>>> It could be a virtqueue or a transport specific method (pcie 
>>>> capability).
>>> No. You said a general facility for all transports.
>> For general facility, I mean the chapter 2 of the spec which is general
>>
>> "
>> 2 Basic Facilities of a Virtio Device
>> "
>>
> It will be in chapter 2. Right after "2.11 Exporting Object" I can add 
> "2.12 Admin Virtqueues" and this is what I did in the RFC.


The point is, migration should be an independent facility and it's 
possible to be done in transport specific way other than the admin 
virtqueue.


>
>>> Transport specific is not general.
>> The transport is in charge of implementing the interface for those 
>> facilities.
>
> Transport specific is not general.
>
>
>>
>>>> E.g we can define what needs to be migrated for the virtio-blk first
>>>> (the device state). Then we can define the interface to get and set
>>>> those states via admin virtqueue. Such decoupling may ease the future
>>>> development of the transport specific migration interface.
>>> I asked a simple question here.
>>>
>>> Lets stick to this.
>> I answered this question.
>
> No you didn't answer.


I answered "I'm not sure". Or are you expecting the answer like yes or 
no? Of course I can't answer like that since it depends on whether your 
proposal is agreed by the vast majority of the members and the other 
procedure e.g voting before it is merged.

You may refer this doc to see about the procedure:

https://github.com/oasis-tcs/virtio-admin/blob/master/README.md


>
> I asked  if the approach of “PF that controls the VF live migration 
> process” is acceptable by the VIRTIO technical group ?
>
> And you take the discussion to your direction instead of answering a 
> Yes/No question.


I don't get the point of this question. If the reviewer think a 
direction may help, the review has the right to do that.

And what I want to say is:

1) I'm not sure it can be acceptable (I can't speak for the whole TC)
2) but I have idea to help people to understand the proposal (start form 
an example)


>
>>    The virtqueue could be one of the
>> approaches. And it's your responsibility to convince the community
>> about that approach. Having an example may help people to understand
>> your proposal.
>>
>>> I'm not referring to internal state definitions.
>> Without an example, how do we know if it can work well?
>>
>>> Can you please not change the subject of my initial intent in the 
>>> email ?
>> Did I? Basically, I'm asking how a virtio-blk can be migrated with
>> your proposal.
>
> The virtio-blk PF admin queue will be used to manage the virtio-blk VF 
> migration.
>
> This is the whole discussion. I don't want to get into resolution.
>
> Since you already know the answer as I published 4 RFCs already with 
> all the flow.


No I don't, especially the part of device states that need to be 
migrated. Even if I knew the answer, it doesn't mean other people can 
easily understand that. You only add a github link for to your mlx5e 
development tree, it's really hard to see the connections. And you don't 
even mention the 4 RFCS you've posted (and a lot of comments were not 
addressed there).


>
> Lets stick to my question.


I don't think you expectation can be met through "Hey, I have an idea, 
and you know how it work, does it make sense?". Especially consider it's 
a complicated issue.

Thanks


>
>> Thanks
>>
>>> Thanks.
>>>
>>>
>>>> Thanks
>>>>
>>>>>> Thanks
>>>>>>
>>>>>>
>>>>>>> Cheers,
>>>>>>>
>>>>>>> -Max.
>>>>>>>
>>>>> This publicly archived list offers a means to provide input to the
>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>>>
>>>>> In order to verify user consent to the Feedback License terms and
>>>>> to minimize spam in the list archive, subscription is required
>>>>> before posting.
>>>>>
>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>>> List help: virtio-comment-help@lists.oasis-open.org
>>>>> List archive: 
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=04%7C01%7Cmgurtovoy%40nvidia.com%7Cb8808c97b68a409d091a08d962356c9c%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637648804586291850%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=bsdgv6XEcsFCSLo0G00WxKUaSQzj0xh4TLlOR2v4c8Y%3D&amp;reserved=0
>>>>> Feedback License: 
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;data=04%7C01%7Cmgurtovoy%40nvidia.com%7Cb8808c97b68a409d091a08d962356c9c%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637648804586301810%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=P0NLoCAtirxtRJT6%2FhLir%2BHAPgZkFOIaKKLf3wgzRpE%3D&amp;reserved=0
>>>>> List Guidelines: 
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists&amp;data=04%7C01%7Cmgurtovoy%40nvidia.com%7Cb8808c97b68a409d091a08d962356c9c%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637648804586301810%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=gOcr8NTEiA0142OTIayO5C%2FnKfaROqSYtCpBYEfyrds%3D&amp;reserved=0
>>>>> Committee: 
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=04%7C01%7Cmgurtovoy%40nvidia.com%7Cb8808c97b68a409d091a08d962356c9c%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637648804586301810%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=EbQ3NmU7YDLLetvoS41PxtADJx1TmWK90INGjZozrkk%3D&amp;reserved=0
>>>>> Join OASIS: 
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.oasis-open.org%2Fjoin%2F&amp;data=04%7C01%7Cmgurtovoy%40nvidia.com%7Cb8808c97b68a409d091a08d962356c9c%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637648804586301810%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=xWF9jQStdg9SBspPSs8w5KYcZS08G72tfEKpd9bir2g%3D&amp;reserved=0
>>>>>
>

