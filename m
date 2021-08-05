Return-Path: <mgurtovoy@nvidia.com>
Subject: Re: [RFC PATCH] Introduce admin virtqueue as a new transport
References: <20210803032006.48881-1-jasowang@redhat.com>
 <892f7853-1d30-5435-2c19-ace9b1028c99@nvidia.com>
 <b750f804-9a8a-e37b-a0e7-40ecf291157a@redhat.com>
 <f2701248-10c1-aa4e-8cc8-419937b1ee8b@nvidia.com>
 <87f6dd9b-f2fb-e68e-0ec7-0fdbb1a2ccb2@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <07fd5294-b633-395e-7d68-491e75f68300@nvidia.com>
Date: Thu, 5 Aug 2021 15:37:17 +0300
MIME-Version: 1.0
In-Reply-To: <87f6dd9b-f2fb-e68e-0ec7-0fdbb1a2ccb2@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, cohuck@redhat.com, stefanha@redhat.com, eperezma@redhat.com, lulu@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 8/5/2021 4:36 AM, Jason Wang wrote:
>
> =E5=9C=A8 2021/8/4 =E4=B8=8B=E5=8D=886:20, Max Gurtovoy =E5=86=99=E9=81=
=93:
>>
>> On 8/4/2021 4:37 AM, Jason Wang wrote:
>>>
>>> =E5=9C=A8 2021/8/3 =E4=B8=8B=E5=8D=888:40, Max Gurtovoy =E5=86=99=E9=81=
=93:
>>>>>
>>>>> +Sometimes it's hard to implement the device in a transport specific
>>>>> +method. One example is that a physical device may try to present
>>>>> +multiple virtual devices with a limited transport specific
>>>>> +resources. Another example is to implement virtual devices which is
>>>>> +transport independent. In those cases, the admin virtqueue=20
>>>>> provided by
>>>>> +the management device could be used to replace the transport=20
>>>>> specific
>>>>> +method to implement the virtual device. Then the presenting of the
>>>>> +virtual device is done through the cooperation between the admin
>>>>> +virtqueue and the driver.
>>>>
>>>> maybe it's me, but I can't understand how admin queue is a transport.
>>>
>>>
>>> The transport is the method that provides basic facility. In this=20
>>> proposal, the admin virtqueue is used to provide basic facility for=20
>>> the virtual device. That is to say, it's the transport for virtual=20
>>> device.
>>>
>>>
>>>>
>>>> And how can I use admin queue transport to migrate VFs that are=20
>>>> controlled by virtio PCI PF.
>>>
>>>
>>> This live migration support and the admin virtqueue transport are=20
>>> orthogonal. The main motivation of this proposal is used for=20
>>> implementing virtual device transport via admin virtqueue. It's not=20
>>> hard to add new commands for doing live migration for the virtual=20
>>> device, I don't do that since I believe it's expected to be=20
>>> addressed in your proposal.
>>
>> so why do you call it in the same name that I used in my RFC ? This=20
>> is confusing and causing problems.
>
>
> Max,
>
> I really think the game of "who comes first" is meaningless.
>
> I've used the terminology like "admin virtqueue" sometime early this=20
> year:
>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.oasis-open.org%2Farchives%2Fvirtio-comment%2F202101%2Fmsg00034.html&amp;da=
ta=3D04%7C01%7Cmgurtovoy%40nvidia.com%7Cffc813bcfeb743b309cd08d957b17eed%7C=
43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637637242113472461%7CUnknown%7CT=
WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%=
3D%7C1000&amp;sdata=3DGwU%2Fz5U4HIjsS2MH1%2BaI1u7ff8dIG%2F15zE5CwDJ91Cg%3D&=
amp;reserved=3D0=20
>
>
> I start the work of the admin virtqueue as a transport since then and=20
> I think I don't say "you call it the same name that I used before".

I didn't say it matters who call it first.

But it does matter for us to have different naming since it causes=20
confusion.

In any case, the management device will introduce an admin queue=20
feature. So my RFC is defining this infrastructure. Your first commit=20
should be on top of my RFC introducing new admin commands for creating=20
virtualized devices (you can call it=20
VIRTIO_ADMIN_PCI_VIRTUALIZATION_MANAGEMENT class in the transport=20
command range). The second commit should define the new transport and=20
configuration cycles to get to a point that the SF virtio device is=20
ready to be used by virtio driver.


>
>
>>
>> You are working on a parallel feature and reviewing my RFC as if it=20
>> was instead of your proposal.
>
>
> Firstly, though they may have the same interface/commands, the two=20
> proposals serves for completely different goals.
>
> Secondly, it's about how to justify your proposal in the community,=20
> and I think I don't get the convincing answers for the following two=20
> points:
>
> 1) I have said that your proposal of using admin virtqueue for doing=20
> live migration makes sense, but we need the per function interface for=20
> nested virt

You need to add the needed commands for vDPA to stop/start queues and=20
you'll have the nested migration. BTW, this stop/start is not part of=20
virtio migration. It's a capabiliy that vDPA will use to implement vDPA=20
live migration.

So please don't mix virtio migration and vDPA migration.

Also in case we'll want nexted migration, the L1 VF (that is seem as PF=20
to the VM) can expose admin_q and migration caps to manage migration=20
process for L2 VFs.

I already mentioned this.

>
> 2) I've pointed out that using the general vitqueue for carrying=20
> vendor specific command breaks the efforts of spec as a standard device

It's not breaking anything. Most of the specifications (NVMe, SCSI, FC,=20
more..) allow Vendors to innovate, and so does VIRTIO today. I don't=20
understand the objection and this is a contradiction to the vendor=20
specific cfg area you added for some reason in the past. I'm repeating=20
myself again and again.

In case Virtio doesn't want to be innovative and encourage vendors to=20
innovate their products, lets keep the 192-255 classes reserved for now=20
and discuss it in the future again.

>
> Lastly, this proposal is RFC, it's not perfect for sure. The most=20
> important thing for the current stage is not about how and when this=20
> can be merged but whether or not this approach can work. I post them=20
> now since a talk about the hyper scalability will be given at the KVM=20
> Forum then I need to post this as one of the approach before as a=20
> reference. There are vendors that are asking something like this as a=20
> reference for having better scalability than SR-IOV.
>
>
>>
>> IIUC, in your proposal a non SRIOV device parent will create admin=20
>> queue and using this admin queue you'll be able to create children=20
>> devices and their transport will be admin queue.
>>
>> That means that the configuration cycles will be trapped by the=20
>> parent device somehow.
>
>
> That's the way for having better scalability. And this is also the=20
> approach that SIOV used.
>
>
>>
>> This also means we need to merge my RFC first to create=20
>> infrastructure for this RFC.
>
>
> It doesn't matter which will be merged. We should guarantee:
>
> 1) The idea is justified by the community
> 2) The merged proposal is extensible for accepting new features and=20
> commands
>
> For 2) I think both proposals can do that. And to me, it's not hard to=20
> switch to the similar interface as you invent.
>
so please be supportive and please understand that this RFC will allow=20
easier addition to your proposal for virtio SFs.

>
>>
>> For admin management that you'll need probably virtio-cli tool from=20
>> user space.
>
>
> What does virtio-cli do? We've already had vdpa that is integrated=20
> into iproute2.
>
> And let me clarify the concept again: vDPA is a superset of virtio.=20
> That means virtio could be treated as one kind of vDPA.
>
> In this sense, I don't see a value of re-inventing the wheels again in=20
> the virtio-cli.

virtio-cli has nothing to do with vDPA.

It's a tool to configure virtio device from cmdline.


>
>
>>
>> So this proposal is complementary to mine. Your management device=20
>> will negotiate "my" admin_queue feature and you'll need to add more=20
>> commands to this admin queue that are probably in transport specific=20
>> domain to create children.
>
>
> I think we can go either:
>
> 1) Make two virtqueues separately
>
> or
>
> 2) Using a single virtqueue
>
> And I would like to co-operate if 2) makes more sense.
>
>
>>
>> You do need to handle the configuration cycles that this management=20
>> parent device will need to support.
>
>
> My proposals have already supported basic management like device=20
> creation and destroy. And I think it's not hard to extend it to other.

see my suggestion above. Need to build this on top of my RFC before=20
defining the new transport.


>
> To reduce the complexity, I've stripped out a lot of features from the=20
> first RFC. It's better to start from the minimal set.
>
> Thanks
>
>
>>
>>
>>>
>>> For virtual device, it's a independent virtio device that could be=20
>>> assigned to secure DMA context/domain,=C2=A0 it is functional equivalen=
t=20
>>> ADI or SF. The difference is that it can work with or without=20
>>> platform support (SIOV or PASID).
>>>
>>>
>>>>
>>>> And why the regular admin queue that is part of the device queues=20
>>>> can't fit to your needs ?
>>>
>>>
>>> For "regular admin queue", did you mean your proposal. Actually,=20
>>> it's not conflict, we can unify the interface though the motivation=20
>>> is different.
>>>
>>>
>>>>
>>>> Can you explain your needs ? is it to create a vDPA device from=20
>>>> some SW interface ?
>>>
>>>
>>> As stated in the patch, the needs are:
>>>
>>> - Presenting virtual devices with limited transport specific resources
>>> - Presenting virtual devices without platform support (e.g SR-IOV or=20
>>> SIOV)
>>>
>>> We want virtio to have hyper-scalability via slicing at virtio=20
>>> level. It's not directly related to vDPA.
>>>
>>> For vDPA, vendor are freed to have their own technology to be hyper=20
>>> scalable (e.g SF, ADI or other stuffs).
>>>
>>> Thanks
>>>
>>>
>>>>
>>>> I don't follow.=20
>>>
>>
>

