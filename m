Return-Path: <mgurtovoy@nvidia.com>
Subject: Re: [RFC PATCH] Introduce admin virtqueue as a new transport
References: <20210803032006.48881-1-jasowang@redhat.com>
 <892f7853-1d30-5435-2c19-ace9b1028c99@nvidia.com>
 <b750f804-9a8a-e37b-a0e7-40ecf291157a@redhat.com>
 <f2701248-10c1-aa4e-8cc8-419937b1ee8b@nvidia.com>
 <87f6dd9b-f2fb-e68e-0ec7-0fdbb1a2ccb2@redhat.com>
 <07fd5294-b633-395e-7d68-491e75f68300@nvidia.com>
 <f74b11ed-82f9-5f9e-e6ac-679e5e43bf26@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <aabcf89e-056b-5107-f827-5b5baa8db63b@nvidia.com>
Date: Wed, 11 Aug 2021 13:00:05 +0300
MIME-Version: 1.0
In-Reply-To: <f74b11ed-82f9-5f9e-e6ac-679e5e43bf26@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, cohuck@redhat.com, stefanha@redhat.com, eperezma@redhat.com, lulu@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 8/6/2021 5:26 AM, Jason Wang wrote:
>
> =E5=9C=A8 2021/8/5 =E4=B8=8B=E5=8D=888:37, Max Gurtovoy =E5=86=99=E9=81=
=93:
>>
>> On 8/5/2021 4:36 AM, Jason Wang wrote:
>>>
>>> =E5=9C=A8 2021/8/4 =E4=B8=8B=E5=8D=886:20, Max Gurtovoy =E5=86=99=E9=81=
=93:
>>>>
>>>> On 8/4/2021 4:37 AM, Jason Wang wrote:
>>>>>
>>>>> =E5=9C=A8 2021/8/3 =E4=B8=8B=E5=8D=888:40, Max Gurtovoy =E5=86=99=E9=
=81=93:
>>>>>>>
>>>>>>> +Sometimes it's hard to implement the device in a transport=20
>>>>>>> specific
>>>>>>> +method. One example is that a physical device may try to present
>>>>>>> +multiple virtual devices with a limited transport specific
>>>>>>> +resources. Another example is to implement virtual devices=20
>>>>>>> which is
>>>>>>> +transport independent. In those cases, the admin virtqueue=20
>>>>>>> provided by
>>>>>>> +the management device could be used to replace the transport=20
>>>>>>> specific
>>>>>>> +method to implement the virtual device. Then the presenting of the
>>>>>>> +virtual device is done through the cooperation between the admin
>>>>>>> +virtqueue and the driver.
>>>>>>
>>>>>> maybe it's me, but I can't understand how admin queue is a=20
>>>>>> transport.
>>>>>
>>>>>
>>>>> The transport is the method that provides basic facility. In this=20
>>>>> proposal, the admin virtqueue is used to provide basic facility=20
>>>>> for the virtual device. That is to say, it's the transport for=20
>>>>> virtual device.
>>>>>
>>>>>
>>>>>>
>>>>>> And how can I use admin queue transport to migrate VFs that are=20
>>>>>> controlled by virtio PCI PF.
>>>>>
>>>>>
>>>>> This live migration support and the admin virtqueue transport are=20
>>>>> orthogonal. The main motivation of this proposal is used for=20
>>>>> implementing virtual device transport via admin virtqueue. It's=20
>>>>> not hard to add new commands for doing live migration for the=20
>>>>> virtual device, I don't do that since I believe it's expected to=20
>>>>> be addressed in your proposal.
>>>>
>>>> so why do you call it in the same name that I used in my RFC ? This=20
>>>> is confusing and causing problems.
>>>
>>>
>>> Max,
>>>
>>> I really think the game of "who comes first" is meaningless.
>>>
>>> I've used the terminology like "admin virtqueue" sometime early this=20
>>> year:
>>>
>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
ts.oasis-open.org%2Farchives%2Fvirtio-comment%2F202101%2Fmsg00034.html&amp;=
data=3D04%7C01%7Cmgurtovoy%40nvidia.com%7Cc99993bf49e244bba93108d958819b84%=
7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637638135950808128%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C1000&amp;sdata=3DF4XXvOttuggAOy34SYHMRigm80xp%2BLiUqGb9UVVhQJU%3D&am=
p;reserved=3D0=20
>>>
>>>
>>> I start the work of the admin virtqueue as a transport since then=20
>>> and I think I don't say "you call it the same name that I used before".
>>
>> I didn't say it matters who call it first.
>>
>> But it does matter for us to have different naming since it causes=20
>> confusion.
>>
>> In any case, the management device will introduce an admin queue=20
>> feature. So my RFC is defining this infrastructure. Your first commit=20
>> should be on top of my RFC introducing new admin commands for=20
>> creating virtualized devices (you can call it=20
>> VIRTIO_ADMIN_PCI_VIRTUALIZATION_MANAGEMENT class in the transport=20
>> command range).
>
>
> Both proposals are RFC, why need to mandate that now? It's always not=20
> late to switch to whatever has been agreed or justified. No?

I would like to cooperate and not block each other.

>
>
>> The second commit should define the new transport and configuration=20
>> cycles to get to a point that the SF virtio device is ready to be=20
>> used by virtio driver.
>>
>>
>>>
>>>
>>>>
>>>> You are working on a parallel feature and reviewing my RFC as if it=20
>>>> was instead of your proposal.
>>>
>>>
>>> Firstly, though they may have the same interface/commands, the two=20
>>> proposals serves for completely different goals.
>>>
>>> Secondly, it's about how to justify your proposal in the community,=20
>>> and I think I don't get the convincing answers for the following two=20
>>> points:
>>>
>>> 1) I have said that your proposal of using admin virtqueue for doing=20
>>> live migration makes sense, but we need the per function interface=20
>>> for nested virt
>>
>> You need to add the needed commands for vDPA to stop/start queues and=20
>> you'll have the nested migration. BTW, this stop/start is not part of=20
>> virtio migration.
>
>
> Why not? My proposal is for virtio spec.
>
>
>> It's a capabiliy that vDPA will use to implement vDPA live migration.
>
>
> For vDPA device, we don't need to bother the spec. All vDPA devices=20
> supported by the Linux has already supported stop/start and indices=20
> save/restore (I meant mlx5e and IFCVF).
>
>
>>
>> So please don't mix virtio migration and vDPA migration.
>
>
> It's not me but you that mixes the concept.
>
> Virtio migration and vDPA migration are functional equivalent. Adding=20
> the live migration support for virtio spec will help for the vendor=20
> that doesn't want to go for vendor specific control path.

so how will virtio Live migration spec help vDPA ?

Vendor create only virtq acceleration to implement virtio.

>
>
>>
>> Also in case we'll want nexted migration, the L1 VF (that is seem as=20
>> PF to the VM) can expose admin_q and migration caps to manage=20
>> migration process for L2 VFs.
>>
>> I already mentioned this.
>
>
> But you tend to ignore the issues I've pointed out:
>
> - How to migrate L1 in this case?
> - If you want to migrate L(N) you need admin virtqueue in L0 to L(N-1)?

I don't ignore it.

For some reason you ask about Live migration in the RFC for AdminQ. I'm=20
trying to build a concept and infrastructure.

Lets focus.

>
> And ignore the suggestion that has nothing conflict with your proposal:
>
> 1) introduce both start/stop and device states as basic facility, that=20
> is to define the semantic and format
> 2) introduce the admin virtqueue and the commands for implementing the=20
> above facility
>
> Then we leave the chance for the per-function interface which fits=20
> naturally for nested virtualization and for the vendor that doesn't=20
> want to have admin virtqueue. And we don't need to expose the admin=20
> virtqueue in the nested layers.

As mentioned, I want to agree on adminq infrastructure as proposed here.

Please don't involve the LM and nested LM.

>
>
>>
>>>
>>> 2) I've pointed out that using the general vitqueue for carrying=20
>>> vendor specific command breaks the efforts of spec as a standard device
>>
>> It's not breaking anything. Most of the specifications (NVMe, SCSI,=20
>> FC, more..) allow Vendors to innovate, and so does VIRTIO today. I=20
>> don't understand the objection and this is a contradiction to the=20
>> vendor specific cfg area you added for some reason in the past. I'm=20
>> repeating myself again and again.
>
>
> The repeating is because you ignore my concerns. Such design violates=20
> the goal of the virtio spec for being a standard device:
>
> - customer doesn't want to be locked by a specific vendor

Same as NVMe.

> - the spec doesn't prevent you from doing innovation under the virtio=20
> level

do you mean in transport level ?

> - the vendor specific cfg has not been used by any vendor so far, and=20
> we had that doesn't mean it's a good practice (or maybe we can try to=20
> deprecate that)

I guess you added it for a reason.

> - the vendor specific feature may greatly complicate the live=20
> migration and its compatibility, virtio is deigned to be capable of=20
> migration, that's the most important difference compared to NVM and=20
> other architecture. A simple blob of (vendor specific) states just=20
> won't work, and they are a lot of other things you need to consider,=20
> e.g the migration comparability with the existing software backend or=20
> machine types. If you check the qemu git history, you can see how hard=20
> for maintaining the migration compatibility for the past 10 years. I=20
> don't think it can work well if we want to allow vendor specific state=20
> to be migrated.

SW migration and HW migration is different.

Migrating between 2 different HW vendors will not be supported at stage 1.

And again, the discussion is not related to this RFC.

>
> NVME mandates the BAR layout so it must explicitly reserve BAR for=20
> vendor specific usage. Virtio-pci is much more flexible and doesn't=20
> mandate BAR layout and the driver discover the virtio facility via=20
> virtio capabilities. That means, the spec doesn't prevent you from=20
> adding vendor specific stuffs by using dedicated BARs. I've told you=20
> that they are other vendor that reserved the BAR for vendor specific=20
> functions which is just ignored by you.

But NVMe allows vendor specific IO and Admin commands that are not=20
related to the BAR.

Why is this a problem for virtio ?

>
>
>>
>> In case Virtio doesn't want to be innovative=20
>
>
> That's not true.=C2=A0 The innovation should be done at virtio level if=
=20
> it's a general feature.
>
> For the innovation that depends on the vendor, it's not the innovation=20
> of virtio itself but the vendor. Let's don't do that at the spec since=20
> it's the wrong layer.

I disagree.

The window should be opened in the spec.


>
>
>> and encourage vendors to innovate their products, lets keep the=20
>> 192-255 classes reserved for now and discuss it in the future again.
>
>
> That should work.
>
>
>>
>>>
>>> Lastly, this proposal is RFC, it's not perfect for sure. The most=20
>>> important thing for the current stage is not about how and when this=20
>>> can be merged but whether or not this approach can work. I post them=20
>>> now since a talk about the hyper scalability will be given at the=20
>>> KVM Forum then I need to post this as one of the approach before as=20
>>> a reference. There are vendors that are asking something like this=20
>>> as a reference for having better scalability than SR-IOV.
>>>
>>>
>>>>
>>>> IIUC, in your proposal a non SRIOV device parent will create admin=20
>>>> queue and using this admin queue you'll be able to create children=20
>>>> devices and their transport will be admin queue.
>>>>
>>>> That means that the configuration cycles will be trapped by the=20
>>>> parent device somehow.
>>>
>>>
>>> That's the way for having better scalability. And this is also the=20
>>> approach that SIOV used.
>>>
>>>
>>>>
>>>> This also means we need to merge my RFC first to create=20
>>>> infrastructure for this RFC.
>>>
>>>
>>> It doesn't matter which will be merged. We should guarantee:
>>>
>>> 1) The idea is justified by the community
>>> 2) The merged proposal is extensible for accepting new features and=20
>>> commands
>>>
>>> For 2) I think both proposals can do that. And to me, it's not hard=20
>>> to switch to the similar interface as you invent.
>>>
>> so please be supportive and please understand that this RFC will=20
>> allow easier addition to your proposal for virtio SFs.
>
>
> I really want to co-operate, but please make sure to answer the=20
> concerns that were raised. Since we're discussing the spec, it won't=20
> be as fast as a patch for Linux. We must be careful so please be patient.
>
>
>>
>>>
>>>>
>>>> For admin management that you'll need probably virtio-cli tool from=20
>>>> user space.
>>>
>>>
>>> What does virtio-cli do? We've already had vdpa that is integrated=20
>>> into iproute2.
>>>
>>> And let me clarify the concept again: vDPA is a superset of virtio.=20
>>> That means virtio could be treated as one kind of vDPA.
>>>
>>> In this sense, I don't see a value of re-inventing the wheels again=20
>>> in the virtio-cli.
>>
>> virtio-cli has nothing to do with vDPA.
>>
>> It's a tool to configure virtio device from cmdline.
>
>
> Again, please look at how Linux implement vDPA. It has already=20
> supported virtio-pci via the vp_vdpa driver. From its point of view,=20
> virtio-pci is yet another vendor specific implementation of virtio.
>
> It's just as simple as to implement the vdpa management device in the=20
> vp_vdpa driver to leverage all the existing management capability of=20
> the vdpa tool for virtio device.
>
> Let's don't duplicate the efforts.

You're looking only on Linux and I look on the virtio as a spec that is=20
being used by other OS as well.

I understand your will for vDPA, but you need to make a separation=20
between vDPA and virtio.


>
> Thanks
>
>
>>
>>
>>>
>>>
>>>>
>>>> So this proposal is complementary to mine. Your management device=20
>>>> will negotiate "my" admin_queue feature and you'll need to add more=20
>>>> commands to this admin queue that are probably in transport=20
>>>> specific domain to create children.
>>>
>>>
>>> I think we can go either:
>>>
>>> 1) Make two virtqueues separately
>>>
>>> or
>>>
>>> 2) Using a single virtqueue
>>>
>>> And I would like to co-operate if 2) makes more sense.
>>>
>>>
>>>>
>>>> You do need to handle the configuration cycles that this management=20
>>>> parent device will need to support.
>>>
>>>
>>> My proposals have already supported basic management like device=20
>>> creation and destroy. And I think it's not hard to extend it to other.
>>
>> see my suggestion above. Need to build this on top of my RFC before=20
>> defining the new transport.
>>
>>
>>>
>>> To reduce the complexity, I've stripped out a lot of features from=20
>>> the first RFC. It's better to start from the minimal set.
>>>
>>> Thanks
>>>
>>>
>>>>
>>>>
>>>>>
>>>>> For virtual device, it's a independent virtio device that could be=20
>>>>> assigned to secure DMA context/domain,=C2=A0 it is functional=20
>>>>> equivalent ADI or SF. The difference is that it can work with or=20
>>>>> without platform support (SIOV or PASID).
>>>>>
>>>>>
>>>>>>
>>>>>> And why the regular admin queue that is part of the device queues=20
>>>>>> can't fit to your needs ?
>>>>>
>>>>>
>>>>> For "regular admin queue", did you mean your proposal. Actually,=20
>>>>> it's not conflict, we can unify the interface though the=20
>>>>> motivation is different.
>>>>>
>>>>>
>>>>>>
>>>>>> Can you explain your needs ? is it to create a vDPA device from=20
>>>>>> some SW interface ?
>>>>>
>>>>>
>>>>> As stated in the patch, the needs are:
>>>>>
>>>>> - Presenting virtual devices with limited transport specific=20
>>>>> resources
>>>>> - Presenting virtual devices without platform support (e.g SR-IOV=20
>>>>> or SIOV)
>>>>>
>>>>> We want virtio to have hyper-scalability via slicing at virtio=20
>>>>> level. It's not directly related to vDPA.
>>>>>
>>>>> For vDPA, vendor are freed to have their own technology to be=20
>>>>> hyper scalable (e.g SF, ADI or other stuffs).
>>>>>
>>>>> Thanks
>>>>>
>>>>>
>>>>>>
>>>>>> I don't follow.=20
>>>>>
>>>>
>>>
>>
>

