Return-Path: <jasowang@redhat.com>
Subject: Re: [virtio-comment] Re: [RFC PATCH] Introduce admin virtqueue as a
 new transport
References: <20210803032006.48881-1-jasowang@redhat.com>
 <892f7853-1d30-5435-2c19-ace9b1028c99@nvidia.com>
 <b750f804-9a8a-e37b-a0e7-40ecf291157a@redhat.com>
 <f2701248-10c1-aa4e-8cc8-419937b1ee8b@nvidia.com>
 <87f6dd9b-f2fb-e68e-0ec7-0fdbb1a2ccb2@redhat.com>
 <07fd5294-b633-395e-7d68-491e75f68300@nvidia.com>
 <f74b11ed-82f9-5f9e-e6ac-679e5e43bf26@redhat.com>
 <aabcf89e-056b-5107-f827-5b5baa8db63b@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7eec9cba-68cc-4f73-4913-3e5e178a9c2e@redhat.com>
Date: Thu, 12 Aug 2021 11:02:40 +0800
MIME-Version: 1.0
In-Reply-To: <aabcf89e-056b-5107-f827-5b5baa8db63b@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
To: Max Gurtovoy <mgurtovoy@nvidia.com>, virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, cohuck@redhat.com, stefanha@redhat.com, eperezma@redhat.com, lulu@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


在 2021/8/11 下午6:00, Max Gurtovoy 写道:
>
> On 8/6/2021 5:26 AM, Jason Wang wrote:
>>
>> 在 2021/8/5 下午8:37, Max Gurtovoy 写道:
>>>
>>> On 8/5/2021 4:36 AM, Jason Wang wrote:
>>>>
>>>> 在 2021/8/4 下午6:20, Max Gurtovoy 写道:
>>>>>
>>>>> On 8/4/2021 4:37 AM, Jason Wang wrote:
>>>>>>
>>>>>> 在 2021/8/3 下午8:40, Max Gurtovoy 写道:
>>>>>>>>
>>>>>>>> +Sometimes it's hard to implement the device in a transport 
>>>>>>>> specific
>>>>>>>> +method. One example is that a physical device may try to present
>>>>>>>> +multiple virtual devices with a limited transport specific
>>>>>>>> +resources. Another example is to implement virtual devices 
>>>>>>>> which is
>>>>>>>> +transport independent. In those cases, the admin virtqueue 
>>>>>>>> provided by
>>>>>>>> +the management device could be used to replace the transport 
>>>>>>>> specific
>>>>>>>> +method to implement the virtual device. Then the presenting of 
>>>>>>>> the
>>>>>>>> +virtual device is done through the cooperation between the admin
>>>>>>>> +virtqueue and the driver.
>>>>>>>
>>>>>>> maybe it's me, but I can't understand how admin queue is a 
>>>>>>> transport.
>>>>>>
>>>>>>
>>>>>> The transport is the method that provides basic facility. In this 
>>>>>> proposal, the admin virtqueue is used to provide basic facility 
>>>>>> for the virtual device. That is to say, it's the transport for 
>>>>>> virtual device.
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> And how can I use admin queue transport to migrate VFs that are 
>>>>>>> controlled by virtio PCI PF.
>>>>>>
>>>>>>
>>>>>> This live migration support and the admin virtqueue transport are 
>>>>>> orthogonal. The main motivation of this proposal is used for 
>>>>>> implementing virtual device transport via admin virtqueue. It's 
>>>>>> not hard to add new commands for doing live migration for the 
>>>>>> virtual device, I don't do that since I believe it's expected to 
>>>>>> be addressed in your proposal.
>>>>>
>>>>> so why do you call it in the same name that I used in my RFC ? 
>>>>> This is confusing and causing problems.
>>>>
>>>>
>>>> Max,
>>>>
>>>> I really think the game of "who comes first" is meaningless.
>>>>
>>>> I've used the terminology like "admin virtqueue" sometime early 
>>>> this year:
>>>>
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.oasis-open.org%2Farchives%2Fvirtio-comment%2F202101%2Fmsg00034.html&amp;data=04%7C01%7Cmgurtovoy%40nvidia.com%7Cc99993bf49e244bba93108d958819b84%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637638135950808128%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=F4XXvOttuggAOy34SYHMRigm80xp%2BLiUqGb9UVVhQJU%3D&amp;reserved=0 
>>>>
>>>>
>>>> I start the work of the admin virtqueue as a transport since then 
>>>> and I think I don't say "you call it the same name that I used 
>>>> before".
>>>
>>> I didn't say it matters who call it first.
>>>
>>> But it does matter for us to have different naming since it causes 
>>> confusion.
>>>
>>> In any case, the management device will introduce an admin queue 
>>> feature. So my RFC is defining this infrastructure. Your first 
>>> commit should be on top of my RFC introducing new admin commands for 
>>> creating virtualized devices (you can call it 
>>> VIRTIO_ADMIN_PCI_VIRTUALIZATION_MANAGEMENT class in the transport 
>>> command range).
>>
>>
>> Both proposals are RFC, why need to mandate that now? It's always not 
>> late to switch to whatever has been agreed or justified. No?
>
> I would like to cooperate and not block each other.


It doesn't block since they are both RFCs.

I start the work from Jan, though it's trivial but it still a lot of 
work of switching to your proposal.

As I said, it's not late to switch to your format if it is agreed.


>
>>
>>
>>> The second commit should define the new transport and configuration 
>>> cycles to get to a point that the SF virtio device is ready to be 
>>> used by virtio driver.
>>>
>>>
>>>>
>>>>
>>>>>
>>>>> You are working on a parallel feature and reviewing my RFC as if 
>>>>> it was instead of your proposal.
>>>>
>>>>
>>>> Firstly, though they may have the same interface/commands, the two 
>>>> proposals serves for completely different goals.
>>>>
>>>> Secondly, it's about how to justify your proposal in the community, 
>>>> and I think I don't get the convincing answers for the following 
>>>> two points:
>>>>
>>>> 1) I have said that your proposal of using admin virtqueue for 
>>>> doing live migration makes sense, but we need the per function 
>>>> interface for nested virt
>>>
>>> You need to add the needed commands for vDPA to stop/start queues 
>>> and you'll have the nested migration. BTW, this stop/start is not 
>>> part of virtio migration.
>>
>>
>> Why not? My proposal is for virtio spec.
>>
>>
>>> It's a capabiliy that vDPA will use to implement vDPA live migration.
>>
>>
>> For vDPA device, we don't need to bother the spec. All vDPA devices 
>> supported by the Linux has already supported stop/start and indices 
>> save/restore (I meant mlx5e and IFCVF).
>>
>>
>>>
>>> So please don't mix virtio migration and vDPA migration.
>>
>>
>> It's not me but you that mixes the concept.
>>
>> Virtio migration and vDPA migration are functional equivalent. Adding 
>> the live migration support for virtio spec will help for the vendor 
>> that doesn't want to go for vendor specific control path.
>
> so how will virtio Live migration spec help vDPA ?


Virtio spec defines want to migrate, vDPA can use vendor specific way to 
save and get the state.


>
> Vendor create only virtq acceleration to implement virtio.


So let's no consider the vDPA as somehow an acceleration. It's actual a 
vendor specific transport/control path. This has been clarified in the 
kernel commit log.

We can add a vDPA transport to the spec if it helps to reduce the confusion.


>
>>
>>
>>>
>>> Also in case we'll want nexted migration, the L1 VF (that is seem as 
>>> PF to the VM) can expose admin_q and migration caps to manage 
>>> migration process for L2 VFs.
>>>
>>> I already mentioned this.
>>
>>
>> But you tend to ignore the issues I've pointed out:
>>
>> - How to migrate L1 in this case?
>> - If you want to migrate L(N) you need admin virtqueue in L0 to L(N-1)?
>
> I don't ignore it.
>
> For some reason you ask about Live migration in the RFC for AdminQ. 
> I'm trying to build a concept and infrastructure.


Live migration is very important for virtio, When we design a 
infrastructure, we should make sure it can be migrated easily instead of 
introducing blockers.


>
> Lets focus.
>
>>
>> And ignore the suggestion that has nothing conflict with your proposal:
>>
>> 1) introduce both start/stop and device states as basic facility, 
>> that is to define the semantic and format
>> 2) introduce the admin virtqueue and the commands for implementing 
>> the above facility
>>
>> Then we leave the chance for the per-function interface which fits 
>> naturally for nested virtualization and for the vendor that doesn't 
>> want to have admin virtqueue. And we don't need to expose the admin 
>> virtqueue in the nested layers.
>
> As mentioned, I want to agree on adminq infrastructure as proposed here.


Well in your patch you mentioned that it supports live migration.


>
> Please don't involve the LM and nested LM.


Again, live migration is very important, let's consider that from the 
beginning.

For the case of nest, live migration is just one of the issues. 
Basically if you tie a feature to admin virtqueue, it would be very hard 
for the guest to use that.

You may say VF can have an admin virtqueue, then you end up with more 
sophisticated problem:

1) we need isolate the DMA since admin virtqueue is expected to be used 
by VMM, this means something like a PASID is a must

2) you need to live migration admin virtqueue


>
>>
>>
>>>
>>>>
>>>> 2) I've pointed out that using the general vitqueue for carrying 
>>>> vendor specific command breaks the efforts of spec as a standard 
>>>> device
>>>
>>> It's not breaking anything. Most of the specifications (NVMe, SCSI, 
>>> FC, more..) allow Vendors to innovate, and so does VIRTIO today. I 
>>> don't understand the objection and this is a contradiction to the 
>>> vendor specific cfg area you added for some reason in the past. I'm 
>>> repeating myself again and again.
>>
>>
>> The repeating is because you ignore my concerns. Such design violates 
>> the goal of the virtio spec for being a standard device:
>>
>> - customer doesn't want to be locked by a specific vendor
>
> Same as NVMe.


Well, you try to expose a "standard" virtio device for guest but some 
features must be used through a vendor specific way (e.g the cli you've 
mentioned). Isn't this a lock?


>
>> - the spec doesn't prevent you from doing innovation under the virtio 
>> level
>
> do you mean in transport level ?


Yes.


>
>> - the vendor specific cfg has not been used by any vendor so far, and 
>> we had that doesn't mean it's a good practice (or maybe we can try to 
>> deprecate that)
>
> I guess you added it for a reason.


So the spec said:

"
The optional Vendor data capability allows the device to present
vendor-specific data to the driver, without
conflicts, for debugging and/or reporting purposes,
and without conflicting with standard functionality.
"

It is only used for present data, or debugging. It's not used for adding 
innovations.

Obviously, it's a blocker for live migration.


>
>> - the vendor specific feature may greatly complicate the live 
>> migration and its compatibility, virtio is deigned to be capable of 
>> migration, that's the most important difference compared to NVM and 
>> other architecture. A simple blob of (vendor specific) states just 
>> won't work, and they are a lot of other things you need to consider, 
>> e.g the migration comparability with the existing software backend or 
>> machine types. If you check the qemu git history, you can see how 
>> hard for maintaining the migration compatibility for the past 10 
>> years. I don't think it can work well if we want to allow vendor 
>> specific state to be migrated.
>
> SW migration and HW migration is different.


We are talking about HW migration, isn't it?

But keeping the migration compatibility with software migration is very 
important.

The design will be less interested if it doesn't support his.


>
> Migrating between 2 different HW vendors will not be supported at 
> stage 1.


Why? We are pretty sure it can be done at least for virtio-net and 
virtio-blk. Let's don't go back.


>
> And again, the discussion is not related to this RFC.
>
>>
>> NVME mandates the BAR layout so it must explicitly reserve BAR for 
>> vendor specific usage. Virtio-pci is much more flexible and doesn't 
>> mandate BAR layout and the driver discover the virtio facility via 
>> virtio capabilities. That means, the spec doesn't prevent you from 
>> adding vendor specific stuffs by using dedicated BARs. I've told you 
>> that they are other vendor that reserved the BAR for vendor specific 
>> functions which is just ignored by you.
>
> But NVMe allows vendor specific IO and Admin commands that are not 
> related to the BAR.


It's a migration blocker.


>
> Why is this a problem for virtio ?


Virtio is born for virt. Please remember, (cross vendor/implementation) 
migration is one of the key advantage for virtio. This is different from 
NVME.

AFAIK, in order to live migrate NVME, the (smartNIC) vendor have done a 
lot of vendor specific tricks which is fragile and makes it impossible 
to cross the vendor.


>
>>
>>
>>>
>>> In case Virtio doesn't want to be innovative 
>>
>>
>> That's not true.  The innovation should be done at virtio level if 
>> it's a general feature.
>>
>> For the innovation that depends on the vendor, it's not the 
>> innovation of virtio itself but the vendor. Let's don't do that at 
>> the spec since it's the wrong layer.
>
> I disagree.
>
> The window should be opened in the spec.


You don't answer why is must be done in the spec, especially:

1) it breaks migration
2) spec doesn't forbid it at transport level
3) a concrete example has been given for how to do that (IFCVF)


>
>
>>
>>
>>> and encourage vendors to innovate their products, lets keep the 
>>> 192-255 classes reserved for now and discuss it in the future again.
>>
>>
>> That should work.
>>
>>
>>>
>>>>
>>>> Lastly, this proposal is RFC, it's not perfect for sure. The most 
>>>> important thing for the current stage is not about how and when 
>>>> this can be merged but whether or not this approach can work. I 
>>>> post them now since a talk about the hyper scalability will be 
>>>> given at the KVM Forum then I need to post this as one of the 
>>>> approach before as a reference. There are vendors that are asking 
>>>> something like this as a reference for having better scalability 
>>>> than SR-IOV.
>>>>
>>>>
>>>>>
>>>>> IIUC, in your proposal a non SRIOV device parent will create admin 
>>>>> queue and using this admin queue you'll be able to create children 
>>>>> devices and their transport will be admin queue.
>>>>>
>>>>> That means that the configuration cycles will be trapped by the 
>>>>> parent device somehow.
>>>>
>>>>
>>>> That's the way for having better scalability. And this is also the 
>>>> approach that SIOV used.
>>>>
>>>>
>>>>>
>>>>> This also means we need to merge my RFC first to create 
>>>>> infrastructure for this RFC.
>>>>
>>>>
>>>> It doesn't matter which will be merged. We should guarantee:
>>>>
>>>> 1) The idea is justified by the community
>>>> 2) The merged proposal is extensible for accepting new features and 
>>>> commands
>>>>
>>>> For 2) I think both proposals can do that. And to me, it's not hard 
>>>> to switch to the similar interface as you invent.
>>>>
>>> so please be supportive and please understand that this RFC will 
>>> allow easier addition to your proposal for virtio SFs.
>>
>>
>> I really want to co-operate, but please make sure to answer the 
>> concerns that were raised. Since we're discussing the spec, it won't 
>> be as fast as a patch for Linux. We must be careful so please be 
>> patient.
>>
>>
>>>
>>>>
>>>>>
>>>>> For admin management that you'll need probably virtio-cli tool 
>>>>> from user space.
>>>>
>>>>
>>>> What does virtio-cli do? We've already had vdpa that is integrated 
>>>> into iproute2.
>>>>
>>>> And let me clarify the concept again: vDPA is a superset of virtio. 
>>>> That means virtio could be treated as one kind of vDPA.
>>>>
>>>> In this sense, I don't see a value of re-inventing the wheels again 
>>>> in the virtio-cli.
>>>
>>> virtio-cli has nothing to do with vDPA.
>>>
>>> It's a tool to configure virtio device from cmdline.
>>
>>
>> Again, please look at how Linux implement vDPA. It has already 
>> supported virtio-pci via the vp_vdpa driver. From its point of view, 
>> virtio-pci is yet another vendor specific implementation of virtio.
>>
>> It's just as simple as to implement the vdpa management device in the 
>> vp_vdpa driver to leverage all the existing management capability of 
>> the vdpa tool for virtio device.
>>
>> Let's don't duplicate the efforts.
>
> You're looking only on Linux and I look on the virtio as a spec that 
> is being used by other OS as well.


Well, you've mentioned the virtio-cli which must be OS specific. I don't 
think the linux specific stuffs like netlink can work for other OSes.

As I repeat many times. vDPA is a hardware concept not software and not 
specific to Linux. And I don't think the vendor will design a hardware 
that just work for Linux.


>
> I understand your will for vDPA, but you need to make a separation 
> between vDPA and virtio.


Let's treat vDPA as a vendor specific transport. This will make the 
discussion more constructive.

Thanks


>
>
>>
>> Thanks
>>
>>
>>>
>>>
>>>>
>>>>
>>>>>
>>>>> So this proposal is complementary to mine. Your management device 
>>>>> will negotiate "my" admin_queue feature and you'll need to add 
>>>>> more commands to this admin queue that are probably in transport 
>>>>> specific domain to create children.
>>>>
>>>>
>>>> I think we can go either:
>>>>
>>>> 1) Make two virtqueues separately
>>>>
>>>> or
>>>>
>>>> 2) Using a single virtqueue
>>>>
>>>> And I would like to co-operate if 2) makes more sense.
>>>>
>>>>
>>>>>
>>>>> You do need to handle the configuration cycles that this 
>>>>> management parent device will need to support.
>>>>
>>>>
>>>> My proposals have already supported basic management like device 
>>>> creation and destroy. And I think it's not hard to extend it to other.
>>>
>>> see my suggestion above. Need to build this on top of my RFC before 
>>> defining the new transport.
>>>
>>>
>>>>
>>>> To reduce the complexity, I've stripped out a lot of features from 
>>>> the first RFC. It's better to start from the minimal set.
>>>>
>>>> Thanks
>>>>
>>>>
>>>>>
>>>>>
>>>>>>
>>>>>> For virtual device, it's a independent virtio device that could 
>>>>>> be assigned to secure DMA context/domain,  it is functional 
>>>>>> equivalent ADI or SF. The difference is that it can work with or 
>>>>>> without platform support (SIOV or PASID).
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> And why the regular admin queue that is part of the device 
>>>>>>> queues can't fit to your needs ?
>>>>>>
>>>>>>
>>>>>> For "regular admin queue", did you mean your proposal. Actually, 
>>>>>> it's not conflict, we can unify the interface though the 
>>>>>> motivation is different.
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> Can you explain your needs ? is it to create a vDPA device from 
>>>>>>> some SW interface ?
>>>>>>
>>>>>>
>>>>>> As stated in the patch, the needs are:
>>>>>>
>>>>>> - Presenting virtual devices with limited transport specific 
>>>>>> resources
>>>>>> - Presenting virtual devices without platform support (e.g SR-IOV 
>>>>>> or SIOV)
>>>>>>
>>>>>> We want virtio to have hyper-scalability via slicing at virtio 
>>>>>> level. It's not directly related to vDPA.
>>>>>>
>>>>>> For vDPA, vendor are freed to have their own technology to be 
>>>>>> hyper scalable (e.g SF, ADI or other stuffs).
>>>>>>
>>>>>> Thanks
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> I don't follow. 
>>>>>>
>>>>>
>>>>
>>>
>>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: 
> https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>

