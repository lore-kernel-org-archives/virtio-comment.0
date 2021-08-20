Return-Path: <virtio-comment-return-2243-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6899E986497
	for <virtio-comment@lists.oasis-open.org>; Fri, 20 Aug 2021 10:26:40 +0000 (UTC)
References: <DM4PR12MB504062CEF6BEDABE6F76DEC2DEF99@DM4PR12MB5040.namprd12.prod.outlook.com>
 <62bd1c8d-c56e-fc98-f833-61d9c999f814@redhat.com>
 <cc7e769a-fee6-2940-74a7-03dbc98a109f@nvidia.com>
 <CACGkMEuAo84oGL6saMTFaS7yzsihuNUWVK4AkVtctT80Opc8Zg@mail.gmail.com>
 <c97bcfbf-81c6-c70c-a943-7f72b0d94d71@nvidia.com>
 <CACGkMEvxxsnEZYCok-xPLnKzJM=501M3erkZ-EDegOFD9YfQdg@mail.gmail.com>
 <5eb7d5b4-a715-5ef2-81f7-9721d865d6ac@nvidia.com> <YR48goPkf7scGwjA@work-vm>
 <755ff192-33ac-9f6a-a7ad-b44b14afd5d2@nvidia.com> <YR5pgsRf3p4rBwnc@work-vm>
 <39536c3c-e455-5602-9391-0b21add7e22f@nvidia.com>
 <0d06c26e-f1e7-3cac-a017-059e8985bb44@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <74151019-6f78-2bff-5b0a-b5a4da814787@nvidia.com>
Date: Fri, 20 Aug 2021 13:26:28 +0300
MIME-Version: 1.0
In-Reply-To: <0d06c26e-f1e7-3cac-a017-059e8985bb44@redhat.com>
Subject: Re: [virtio-comment] Live Migration of Virtio Virtual Function
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>, Shahaf Shuler <shahafs@nvidia.com>, Ariel Adam <aadam@redhat.com>, Amnon Ilan <ailan@redhat.com>, Bodong Wang <bodong@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, Liran Liss <liranl@nvidia.com>, Oren Duer <oren@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 8/20/2021 5:24 AM, Jason Wang wrote:
>
> =E5=9C=A8 2021/8/19 =E4=B8=8B=E5=8D=8811:20, Max Gurtovoy =E5=86=99=E9=81=
=93:
>>
>> On 8/19/2021 5:24 PM, Dr. David Alan Gilbert wrote:
>>> * Max Gurtovoy (mgurtovoy@nvidia.com) wrote:
>>>> On 8/19/2021 2:12 PM, Dr. David Alan Gilbert wrote:
>>>>> * Max Gurtovoy (mgurtovoy@nvidia.com) wrote:
>>>>>> On 8/18/2021 1:46 PM, Jason Wang wrote:
>>>>>>> On Wed, Aug 18, 2021 at 5:16 PM Max Gurtovoy=20
>>>>>>> <mgurtovoy@nvidia.com> wrote:
>>>>>>>> On 8/17/2021 12:44 PM, Jason Wang wrote:
>>>>>>>>> On Tue, Aug 17, 2021 at 5:11 PM Max Gurtovoy=20
>>>>>>>>> <mgurtovoy@nvidia.com> wrote:
>>>>>>>>>> On 8/17/2021 11:51 AM, Jason Wang wrote:
>>>>>>>>>>> =E5=9C=A8 2021/8/12 =E4=B8=8B=E5=8D=888:08, Max Gurtovoy =E5=86=
=99=E9=81=93:
>>>>>>>>>>>> Hi all,
>>>>>>>>>>>>
>>>>>>>>>>>> Live migration is one of the most important features of
>>>>>>>>>>>> virtualization and virtio devices are oftenly found in virtual
>>>>>>>>>>>> environments.
>>>>>>>>>>>>
>>>>>>>>>>>> The migration process is managed by a migration SW that is=20
>>>>>>>>>>>> running on
>>>>>>>>>>>> the hypervisor and the VM is not aware of the process at all.
>>>>>>>>>>>>
>>>>>>>>>>>> Unlike the vDPA case, a real pci Virtual Function state=20
>>>>>>>>>>>> resides in
>>>>>>>>>>>> the HW.
>>>>>>>>>>>>
>>>>>>>>>>> vDPA doesn't prevent you from having HW states. Actually=20
>>>>>>>>>>> from the view
>>>>>>>>>>> of the VMM(Qemu), it doesn't care whether or not a state is=20
>>>>>>>>>>> stored in
>>>>>>>>>>> the software or hardware. A well designed VMM should be able=20
>>>>>>>>>>> to hide
>>>>>>>>>>> the virtio device implementation from the migration layer,=20
>>>>>>>>>>> that is how
>>>>>>>>>>> Qemu is wrote who doesn't care about whether or not it's a=20
>>>>>>>>>>> software
>>>>>>>>>>> virtio/vDPA device or not.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> In our vision, in order to fulfil the Live migration=20
>>>>>>>>>>>> requirements for
>>>>>>>>>>>> virtual functions, each physical function device must=20
>>>>>>>>>>>> implement
>>>>>>>>>>>> migration operations. Using these operations, it will be=20
>>>>>>>>>>>> able to
>>>>>>>>>>>> master the migration process for the virtual function=20
>>>>>>>>>>>> devices. Each
>>>>>>>>>>>> capable physical function device has a supervisor=20
>>>>>>>>>>>> permissions to
>>>>>>>>>>>> change the virtual function operational states,=20
>>>>>>>>>>>> save/restore its
>>>>>>>>>>>> internal state and start/stop dirty pages tracking.
>>>>>>>>>>>>
>>>>>>>>>>> For "supervisor permissions", is this from the software=20
>>>>>>>>>>> point of view?
>>>>>>>>>>> Maybe it's better to give an example for this.
>>>>>>>>>> A permission to a PF device for quiesce and freeze a VF=20
>>>>>>>>>> device for example.
>>>>>>>>> Note that for safety, VMM (e.g Qemu) is usually running=20
>>>>>>>>> without any privileges.
>>>>>>>> You're mixing layers here.
>>>>>>>>
>>>>>>>> QEMU is not involved here. It's only sending IOCTLs to=20
>>>>>>>> migration driver.
>>>>>>>> The migration driver will control the migration process of the=20
>>>>>>>> VF using
>>>>>>>> the PF communication channel.
>>>>>>> So who will be granted the "permission" you mentioned here?
>>>>>> This is just an expression.
>>>>>>
>>>>>> What is not clear ?
>>>>>>
>>>>>> The PF device will have an option to quiesce/freeze the VF device.
>>>>>>
>>>>>> This is simple. Why are you looking for some sophisticated=20
>>>>>> problems ?
>>>>> I'm trying to follow along here and have not completely; but I=20
>>>>> think the issue is a
>>>>> security separation one.
>>>>> The VMM (e.g. qemu) that has been given access to one of the VF's is
>>>>> isolated and shouldn't be able to go poking at other devices; so it
>>>>> can't go poking at the PF (it probably doesn't even have the PF=20
>>>>> device
>>>>> node accessible) - so then the question is who has access to the
>>>>> migration driver and how do you make sure it can only deal with VF's
>>>>> that it's supposed to be able to migrate.
>>>> The QEMU/userspace doesn't know or care about the PF connection and=20
>>>> internal
>>>> virtio_vfio_pci driver implementation.
>>> OK
>>>
>>>> You shouldn't change 1 line of code in the VM driver nor in QEMU.
>>> Hmm OK.
>>>
>>>> QEMU does not have access to the PF. Only the kernel driver that=20
>>>> has access
>>>> to the VF will have access to the PF communication channel. There=20
>>>> is no
>>>> permission problem here.
>>>>
>>>> The kernel driver of the VF will do this internally, and make sure=20
>>>> that the
>>>> commands it build will only impact the VF originating them.
>>>>
>>> Now that confuses me; isn't the kernel driver that has access to the VF
>>> running inside the guest?=C2=A0 If it's inside the guest we can't trust=
=20
>>> it to
>>> do anything about stopping impact to other devices.
>>
>> No. The driver is in the hypervisor (virtio_vfio_pci). This is the=20
>> migration driver, right ?
>
>
> Well, talking things like virtio_vfio_pci that is not mentioned before=20
> and not justified on the list may easily confuse people. As pointed=20
> out in another thread, it has too many disadvantages over the existing=20
> virtio-pci vdpa driver. And it just duplicates a partial function of=20
> what virtio-pci vdpa driver can do. I don't think we will go that way.

This was just an example for David to help with understanding the=20
solution since he thought that the guest drivers somehow should be changed.

David I'm sorry if I confused you.

Again Jason, you try to propose your vDPA solution that is not what=20
we're trying to achieve in this work. Think of a world without vDPA.=20
Also I don't understand how vDPA is related to virtio specification=20
decisions ? make vDPA into virtio and then we can open a discussion.

I'm interesting in virtio migration of HW devices.

The proposal in this thread is actually get support from Michal AFAIU=20
and also others were happy with. All beside of you.

We do it in mlx5 and we didn't see any issues with that design.

I don't think you can say that we "go that way".

You're trying to build a complementary solution for creating scalable=20
functions and for some reason trying to sabotage NVIDIA efforts to add=20
new important functionality to virtio.

This also sabotage the evolvment of virtio as a standard.

You're trying to enforce some un-finished idea that should work on some=20
future specific HW platform instead of helping defining a good spec for=20
virtio.

And all is for having users to choose vDPA framework instead of using=20
plain virtio.

We believe in our solution and we have a working prototype. We'll=20
continue with our discussion to convince the community with it.

Thanks.

>
> Thanks
>
>
>>
>> The guest is running as usual. It doesn't aware on the migration at all.
>>
>> This is the point I try to make here. I don't (and I can't) change=20
>> even 1 line of code in the guest.
>>
>> e.g:
>>
>> QEMU ioctl --> vfio (hypervisor) --> virtio_vfio_pci on hypervisor=20
>> (bounded to VF5) --> send admin command on PF adminq to start=20
>> tracking dirty pages for VF5 --> PF device will do it
>>
>> QEMU ioctl --> vfio (hypervisor) --> virtio_vfio_pci on hypervisor=20
>> (bounded to VF5) --> send admin command on PF adminq to quiesce VF5=20
>> --> PF device will do it
>>
>> You can take a look how we implement mlx5_vfio_pci in the link I=20
>> provided.
>>
>>>
>>> Dave
>>>
>>>
>>>> We already do this in mlx5 NIC migration. The kernel is secured and=20
>>>> QEMU
>>>> interface is the VF.
>>>>
>>>>> Dave
>>>>>
>>>>>>>>>>>> An example of this approach can be seen in the way NVIDIA=20
>>>>>>>>>>>> performs
>>>>>>>>>>>> live migration of a ConnectX NIC function:
>>>>>>>>>>>>
>>>>>>>>>>>> https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci
>>>>>>>>>>>> <https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci>
>>>>>>>>>>>>
>>>>>>>>>>>> NVIDIAs SNAP technology enables hardware-accelerated=20
>>>>>>>>>>>> software defined
>>>>>>>>>>>> PCIe devices. virtio-blk/virtio-net/virtio-fs SNAP used for=20
>>>>>>>>>>>> storage
>>>>>>>>>>>> and networking solutions. The host OS/hypervisor uses its=20
>>>>>>>>>>>> standard
>>>>>>>>>>>> drivers that are implemented according to a well-known VIRTIO
>>>>>>>>>>>> specifications.
>>>>>>>>>>>>
>>>>>>>>>>>> In order to implement Live Migration for these virtual=20
>>>>>>>>>>>> function
>>>>>>>>>>>> devices, that use a standard drivers as mentioned, the=20
>>>>>>>>>>>> specification
>>>>>>>>>>>> should define how HW vendor should build their devices and=20
>>>>>>>>>>>> for SW
>>>>>>>>>>>> developers to adjust the drivers.
>>>>>>>>>>>>
>>>>>>>>>>>> This will enable specification compliant vendor agnostic=20
>>>>>>>>>>>> solution.
>>>>>>>>>>>>
>>>>>>>>>>>> This is exactly how we built the migration driver for ConnectX
>>>>>>>>>>>> (internal HW design doc) and I guess that this is the way=20
>>>>>>>>>>>> other
>>>>>>>>>>>> vendors work.
>>>>>>>>>>>>
>>>>>>>>>>>> For that, I would like to know if the approach of =E2=80=9CPF =
that=20
>>>>>>>>>>>> controls
>>>>>>>>>>>> the VF live migration process=E2=80=9D is acceptable by the VI=
RTIO=20
>>>>>>>>>>>> technical
>>>>>>>>>>>> group ?
>>>>>>>>>>>>
>>>>>>>>>>> I'm not sure but I think it's better to start from the general
>>>>>>>>>>> facility for all transports, then develop features for a=20
>>>>>>>>>>> specific
>>>>>>>>>>> transport.
>>>>>>>>>> a general facility for all transports can be a generic admin=20
>>>>>>>>>> queue ?
>>>>>>>>> It could be a virtqueue or a transport specific method (pcie=20
>>>>>>>>> capability).
>>>>>>>> No. You said a general facility for all transports.
>>>>>>> For general facility, I mean the chapter 2 of the spec which is=20
>>>>>>> general
>>>>>>>
>>>>>>> "
>>>>>>> 2 Basic Facilities of a Virtio Device
>>>>>>> "
>>>>>>>
>>>>>> It will be in chapter 2. Right after "2.11 Exporting Object" I=20
>>>>>> can add "2.12
>>>>>> Admin Virtqueues" and this is what I did in the RFC.
>>>>>>
>>>>>>>> Transport specific is not general.
>>>>>>> The transport is in charge of implementing the interface for=20
>>>>>>> those facilities.
>>>>>> Transport specific is not general.
>>>>>>
>>>>>>
>>>>>>>>> E.g we can define what needs to be migrated for the virtio-blk=20
>>>>>>>>> first
>>>>>>>>> (the device state). Then we can define the interface to get=20
>>>>>>>>> and set
>>>>>>>>> those states via admin virtqueue. Such decoupling may ease the=20
>>>>>>>>> future
>>>>>>>>> development of the transport specific migration interface.
>>>>>>>> I asked a simple question here.
>>>>>>>>
>>>>>>>> Lets stick to this.
>>>>>>> I answered this question.
>>>>>> No you didn't answer.
>>>>>>
>>>>>> I asked=C2=A0 if the approach of =E2=80=9CPF that controls the VF li=
ve=20
>>>>>> migration process=E2=80=9D
>>>>>> is acceptable by the VIRTIO technical group ?
>>>>>>
>>>>>> And you take the discussion to your direction instead of=20
>>>>>> answering a Yes/No
>>>>>> question.
>>>>>>
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 The virtqueue could be one of the
>>>>>>> approaches. And it's your responsibility to convince the community
>>>>>>> about that approach. Having an example may help people to=20
>>>>>>> understand
>>>>>>> your proposal.
>>>>>>>
>>>>>>>> I'm not referring to internal state definitions.
>>>>>>> Without an example, how do we know if it can work well?
>>>>>>>
>>>>>>>> Can you please not change the subject of my initial intent in=20
>>>>>>>> the email ?
>>>>>>> Did I? Basically, I'm asking how a virtio-blk can be migrated with
>>>>>>> your proposal.
>>>>>> The virtio-blk PF admin queue will be used to manage the=20
>>>>>> virtio-blk VF
>>>>>> migration.
>>>>>>
>>>>>> This is the whole discussion. I don't want to get into resolution.
>>>>>>
>>>>>> Since you already know the answer as I published 4 RFCs already=20
>>>>>> with all the
>>>>>> flow.
>>>>>>
>>>>>> Lets stick to my question.
>>>>>>
>>>>>>> Thanks
>>>>>>>
>>>>>>>> Thanks.
>>>>>>>>
>>>>>>>>
>>>>>>>>> Thanks
>>>>>>>>>
>>>>>>>>>>> Thanks
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> Cheers,
>>>>>>>>>>>>
>>>>>>>>>>>> -Max.
>>>>>>>>>>>>
>>>>>>>>>> This publicly archived list offers a means to provide input=20
>>>>>>>>>> to the
>>>>>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>>>>>>>>
>>>>>>>>>> In order to verify user consent to the Feedback License terms=20
>>>>>>>>>> and
>>>>>>>>>> to minimize spam in the list archive, subscription is required
>>>>>>>>>> before posting.
>>>>>>>>>>
>>>>>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>>>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>>>>>>>> List help: virtio-comment-help@lists.oasis-open.org
>>>>>>>>>> List archive:=20
>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=3D04%7C01%=
7Cmgurtovoy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d1572734=
0c1b7db39efd9ccc17a%7C0%7C0%7C637650231017968126%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DtqLsKdPEjF4uMUeqrwpeBD7J4q%2BrWKH1xRUXozJ4KEI%3D&amp;reserved=3D0
>>>>>>>>>> Feedback License:=20
>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fwww.oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;data=3D04%7C0=
1%7Cmgurtovoy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727=
340c1b7db39efd9ccc17a%7C0%7C0%7C637650231017968126%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;sdata=3D2tg8X5uT17Vtj1hWZ7kEskf%2BeG9jV5HhJA3yepZksrg%3D&amp;reserved=3D=
0
>>>>>>>>>> List Guidelines:=20
>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fwww.oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists&amp;data=3D04%=
7C01%7Cmgurtovoy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15=
727340c1b7db39efd9ccc17a%7C0%7C0%7C637650231017968126%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;sdata=3DYnuvd9xCIEDhTjjxuAgMFVCek%2B6wQGhGjnUyrsKCamM%3D&amp;reserved=
=3D0
>>>>>>>>>> Committee:=20
>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fwww.oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=3D04%7C01%7Cmgurto=
voy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727340c1b7db3=
9efd9ccc17a%7C0%7C0%7C637650231017968126%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3DQyJw7q7fwlq8oFjiaI%2BZICxARQEvXhrhRbiKkIyFmik%3D&amp;reserved=3D0
>>>>>>>>>> Join OASIS:=20
>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fwww.oasis-open.org%2Fjoin%2F&amp;data=3D04%7C01%7Cmgurtovoy%40nvidia.co=
m%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727340c1b7db39efd9ccc17a%7C0=
%7C0%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI=
joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DjebnTI98aw8LE0=
zC0BF2hiP6Rg3YsoKKunSVZz5GAlU%3D&amp;reserved=3D0
>>>>>>>>>>
>>>>>> This publicly archived list offers a means to provide input to the
>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>>>>
>>>>>> In order to verify user consent to the Feedback License terms and
>>>>>> to minimize spam in the list archive, subscription is required
>>>>>> before posting.
>>>>>>
>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>>>> List help: virtio-comment-help@lists.oasis-open.org
>>>>>> List archive:=20
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
lists.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=3D04%7C01%7Cmg=
urtovoy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727340c1b=
7db39efd9ccc17a%7C0%7C0%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sda=
ta=3DT5gTfTBJ9blLPnGVlidRZFIeqrgi%2BcHyOwnVP5xtBPY%3D&amp;reserved=3D0
>>>>>> Feedback License:=20
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
www.oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;data=3D04%7C01%7C=
mgurtovoy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727340c=
1b7db39efd9ccc17a%7C0%7C0%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DSmRyku3IZ8O5vITCXasVxF%2BEjcG7zb%2BDi8sZinSuvp4%3D&amp;reserved=3D0
>>>>>> List Guidelines:=20
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
www.oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists&amp;data=3D04%7C01=
%7Cmgurtovoy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d157273=
40c1b7db39efd9ccc17a%7C0%7C0%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DIV4C1Y%2BE%2Bq9OPzjyYYvoVrPp6975qyNZ%2Fn1%2B0eD58%2FA%3D&amp;rese=
rved=3D0
>>>>>> Committee:=20
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
www.oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=3D04%7C01%7Cmgurtovoy%=
40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727340c1b7db39efd=
9ccc17a%7C0%7C0%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D8Bh=
0ufU4zKnzwspmmF0vN3tW3Ppi4RYfcT8pFzo%2FTT8%3D&amp;reserved=3D0
>>>>>> Join OASIS:=20
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
www.oasis-open.org%2Fjoin%2F&amp;data=3D04%7C01%7Cmgurtovoy%40nvidia.com%7C=
12187bc5e0d94abdd7bb08d96381b438%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0=
%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV=
2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DjebnTI98aw8LE0zC0B=
F2hiP6Rg3YsoKKunSVZz5GAlU%3D&amp;reserved=3D0
>>>>>>
>>
>> This publicly archived list offers a means to provide input to the
>> OASIS Virtual I/O Device (VIRTIO) TC.
>>
>> In order to verify user consent to the Feedback License terms and
>> to minimize spam in the list archive, subscription is required
>> before posting.
>>
>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>> List help: virtio-comment-help@lists.oasis-open.org
>> List archive:=20
>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist=
s.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=3D04%7C01%7Cmgurto=
voy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727340c1b7db3=
9efd9ccc17a%7C0%7C0%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3DT5gTfTBJ9blLPnGVlidRZFIeqrgi%2BcHyOwnVP5xtBPY%3D&amp;reserved=3D0
>> Feedback License:=20
>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.=
oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;data=3D04%7C01%7Cmgur=
tovoy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727340c1b7d=
b39efd9ccc17a%7C0%7C0%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3DSmRyku3IZ8O5vITCXasVxF%2BEjcG7zb%2BDi8sZinSuvp4%3D&amp;reserved=3D0
>> List Guidelines:=20
>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.=
oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists&amp;data=3D04%7C01%7Cm=
gurtovoy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727340c1=
b7db39efd9ccc17a%7C0%7C0%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd=
ata=3DIV4C1Y%2BE%2Bq9OPzjyYYvoVrPp6975qyNZ%2Fn1%2B0eD58%2FA%3D&amp;reserved=
=3D0
>> Committee:=20
>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.=
oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=3D04%7C01%7Cmgurtovoy%40nv=
idia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727340c1b7db39efd9ccc=
17a%7C0%7C0%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D8Bh0ufU=
4zKnzwspmmF0vN3tW3Ppi4RYfcT8pFzo%2FTT8%3D&amp;reserved=3D0
>> Join OASIS:=20
>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.=
oasis-open.org%2Fjoin%2F&amp;data=3D04%7C01%7Cmgurtovoy%40nvidia.com%7C1218=
7bc5e0d94abdd7bb08d96381b438%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C6=
37650231017978092%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DjebnTI98aw8LE0zC0BF2hi=
P6Rg3YsoKKunSVZz5GAlU%3D&amp;reserved=3D0
>>
>

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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

