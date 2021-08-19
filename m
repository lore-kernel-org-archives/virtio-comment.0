Return-Path: <mgurtovoy@nvidia.com>
Subject: Re: [virtio-comment] Live Migration of Virtio Virtual Function
References: <DM4PR12MB504062CEF6BEDABE6F76DEC2DEF99@DM4PR12MB5040.namprd12.prod.outlook.com>
 <62bd1c8d-c56e-fc98-f833-61d9c999f814@redhat.com>
 <cc7e769a-fee6-2940-74a7-03dbc98a109f@nvidia.com>
 <CACGkMEuAo84oGL6saMTFaS7yzsihuNUWVK4AkVtctT80Opc8Zg@mail.gmail.com>
 <c97bcfbf-81c6-c70c-a943-7f72b0d94d71@nvidia.com>
 <CACGkMEvxxsnEZYCok-xPLnKzJM=501M3erkZ-EDegOFD9YfQdg@mail.gmail.com>
 <5eb7d5b4-a715-5ef2-81f7-9721d865d6ac@nvidia.com> <YR48goPkf7scGwjA@work-vm>
 <755ff192-33ac-9f6a-a7ad-b44b14afd5d2@nvidia.com> <YR5pgsRf3p4rBwnc@work-vm>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <39536c3c-e455-5602-9391-0b21add7e22f@nvidia.com>
Date: Thu, 19 Aug 2021 18:20:45 +0300
MIME-Version: 1.0
In-Reply-To: <YR5pgsRf3p4rBwnc@work-vm>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>, Shahaf Shuler <shahafs@nvidia.com>, Ariel Adam <aadam@redhat.com>, Amnon Ilan <ailan@redhat.com>, Bodong Wang <bodong@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, Liran Liss <liranl@nvidia.com>, Oren Duer <oren@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 8/19/2021 5:24 PM, Dr. David Alan Gilbert wrote:
> * Max Gurtovoy (mgurtovoy@nvidia.com) wrote:
>> On 8/19/2021 2:12 PM, Dr. David Alan Gilbert wrote:
>>> * Max Gurtovoy (mgurtovoy@nvidia.com) wrote:
>>>> On 8/18/2021 1:46 PM, Jason Wang wrote:
>>>>> On Wed, Aug 18, 2021 at 5:16 PM Max Gurtovoy <mgurtovoy@nvidia.com> w=
rote:
>>>>>> On 8/17/2021 12:44 PM, Jason Wang wrote:
>>>>>>> On Tue, Aug 17, 2021 at 5:11 PM Max Gurtovoy <mgurtovoy@nvidia.com>=
 wrote:
>>>>>>>> On 8/17/2021 11:51 AM, Jason Wang wrote:
>>>>>>>>> =E5=9C=A8 2021/8/12 =E4=B8=8B=E5=8D=888:08, Max Gurtovoy =E5=86=
=99=E9=81=93:
>>>>>>>>>> Hi all,
>>>>>>>>>>
>>>>>>>>>> Live migration is one of the most important features of
>>>>>>>>>> virtualization and virtio devices are oftenly found in virtual
>>>>>>>>>> environments.
>>>>>>>>>>
>>>>>>>>>> The migration process is managed by a migration SW that is runni=
ng on
>>>>>>>>>> the hypervisor and the VM is not aware of the process at all.
>>>>>>>>>>
>>>>>>>>>> Unlike the vDPA case, a real pci Virtual Function state resides =
in
>>>>>>>>>> the HW.
>>>>>>>>>>
>>>>>>>>> vDPA doesn't prevent you from having HW states. Actually from the=
 view
>>>>>>>>> of the VMM(Qemu), it doesn't care whether or not a state is store=
d in
>>>>>>>>> the software or hardware. A well designed VMM should be able to h=
ide
>>>>>>>>> the virtio device implementation from the migration layer, that i=
s how
>>>>>>>>> Qemu is wrote who doesn't care about whether or not it's a softwa=
re
>>>>>>>>> virtio/vDPA device or not.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> In our vision, in order to fulfil the Live migration requirement=
s for
>>>>>>>>>> virtual functions, each physical function device must implement
>>>>>>>>>> migration operations. Using these operations, it will be able to
>>>>>>>>>> master the migration process for the virtual function devices. E=
ach
>>>>>>>>>> capable physical function device has a supervisor permissions to
>>>>>>>>>> change the virtual function operational states, save/restore its
>>>>>>>>>> internal state and start/stop dirty pages tracking.
>>>>>>>>>>
>>>>>>>>> For "supervisor permissions", is this from the software point of =
view?
>>>>>>>>> Maybe it's better to give an example for this.
>>>>>>>> A permission to a PF device for quiesce and freeze a VF device for=
 example.
>>>>>>> Note that for safety, VMM (e.g Qemu) is usually running without any=
 privileges.
>>>>>> You're mixing layers here.
>>>>>>
>>>>>> QEMU is not involved here. It's only sending IOCTLs to migration dri=
ver.
>>>>>> The migration driver will control the migration process of the VF us=
ing
>>>>>> the PF communication channel.
>>>>> So who will be granted the "permission" you mentioned here?
>>>> This is just an expression.
>>>>
>>>> What is not clear ?
>>>>
>>>> The PF device will have an option to quiesce/freeze the VF device.
>>>>
>>>> This is simple. Why are you looking for some sophisticated problems ?
>>> I'm trying to follow along here and have not completely; but I think th=
e issue is a
>>> security separation one.
>>> The VMM (e.g. qemu) that has been given access to one of the VF's is
>>> isolated and shouldn't be able to go poking at other devices; so it
>>> can't go poking at the PF (it probably doesn't even have the PF device
>>> node accessible) - so then the question is who has access to the
>>> migration driver and how do you make sure it can only deal with VF's
>>> that it's supposed to be able to migrate.
>> The QEMU/userspace doesn't know or care about the PF connection and inte=
rnal
>> virtio_vfio_pci driver implementation.
> OK
>
>> You shouldn't change 1 line of code in the VM driver nor in QEMU.
> Hmm OK.
>
>> QEMU does not have access to the PF. Only the kernel driver that has acc=
ess
>> to the VF will have access to the PF communication channel.=C2=A0 There =
is no
>> permission problem here.
>>
>> The kernel driver of the VF will do this internally, and make sure that =
the
>> commands it build will only impact the VF originating them.
>>
> Now that confuses me; isn't the kernel driver that has access to the VF
> running inside the guest?  If it's inside the guest we can't trust it to
> do anything about stopping impact to other devices.

No. The driver is in the hypervisor (virtio_vfio_pci). This is the=20
migration driver, right ?

The guest is running as usual. It doesn't aware on the migration at all.

This is the point I try to make here. I don't (and I can't) change even=20
1 line of code in the guest.

e.g:

QEMU ioctl --> vfio (hypervisor) --> virtio_vfio_pci on hypervisor=20
(bounded to VF5) --> send admin command on PF adminq to start tracking=20
dirty pages for VF5 --> PF device will do it

QEMU ioctl --> vfio (hypervisor) --> virtio_vfio_pci on hypervisor=20
(bounded to VF5) --> send admin command on PF adminq to quiesce VF5 -->=20
PF device will do it

You can take a look how we implement mlx5_vfio_pci in the link I provided.

>
> Dave
>
>
>> We already do this in mlx5 NIC migration. The kernel is secured and QEMU
>> interface is the VF.
>>
>>> Dave
>>>
>>>>>>>>>> An example of this approach can be seen in the way NVIDIA perfor=
ms
>>>>>>>>>> live migration of a ConnectX NIC function:
>>>>>>>>>>
>>>>>>>>>> https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci
>>>>>>>>>> <https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci>
>>>>>>>>>>
>>>>>>>>>> NVIDIAs SNAP technology enables hardware-accelerated software de=
fined
>>>>>>>>>> PCIe devices. virtio-blk/virtio-net/virtio-fs SNAP used for stor=
age
>>>>>>>>>> and networking solutions. The host OS/hypervisor uses its standa=
rd
>>>>>>>>>> drivers that are implemented according to a well-known VIRTIO
>>>>>>>>>> specifications.
>>>>>>>>>>
>>>>>>>>>> In order to implement Live Migration for these virtual function
>>>>>>>>>> devices, that use a standard drivers as mentioned, the specifica=
tion
>>>>>>>>>> should define how HW vendor should build their devices and for S=
W
>>>>>>>>>> developers to adjust the drivers.
>>>>>>>>>>
>>>>>>>>>> This will enable specification compliant vendor agnostic solutio=
n.
>>>>>>>>>>
>>>>>>>>>> This is exactly how we built the migration driver for ConnectX
>>>>>>>>>> (internal HW design doc) and I guess that this is the way other
>>>>>>>>>> vendors work.
>>>>>>>>>>
>>>>>>>>>> For that, I would like to know if the approach of =E2=80=9CPF th=
at controls
>>>>>>>>>> the VF live migration process=E2=80=9D is acceptable by the VIRT=
IO technical
>>>>>>>>>> group ?
>>>>>>>>>>
>>>>>>>>> I'm not sure but I think it's better to start from the general
>>>>>>>>> facility for all transports, then develop features for a specific
>>>>>>>>> transport.
>>>>>>>> a general facility for all transports can be a generic admin queue=
 ?
>>>>>>> It could be a virtqueue or a transport specific method (pcie capabi=
lity).
>>>>>> No. You said a general facility for all transports.
>>>>> For general facility, I mean the chapter 2 of the spec which is gener=
al
>>>>>
>>>>> "
>>>>> 2 Basic Facilities of a Virtio Device
>>>>> "
>>>>>
>>>> It will be in chapter 2. Right after "2.11 Exporting Object" I can add=
 "2.12
>>>> Admin Virtqueues" and this is what I did in the RFC.
>>>>
>>>>>> Transport specific is not general.
>>>>> The transport is in charge of implementing the interface for those fa=
cilities.
>>>> Transport specific is not general.
>>>>
>>>>
>>>>>>> E.g we can define what needs to be migrated for the virtio-blk firs=
t
>>>>>>> (the device state). Then we can define the interface to get and set
>>>>>>> those states via admin virtqueue. Such decoupling may ease the futu=
re
>>>>>>> development of the transport specific migration interface.
>>>>>> I asked a simple question here.
>>>>>>
>>>>>> Lets stick to this.
>>>>> I answered this question.
>>>> No you didn't answer.
>>>>
>>>> I asked=C2=A0 if the approach of =E2=80=9CPF that controls the VF live=
 migration process=E2=80=9D
>>>> is acceptable by the VIRTIO technical group ?
>>>>
>>>> And you take the discussion to your direction instead of answering a Y=
es/No
>>>> question.
>>>>
>>>>>      The virtqueue could be one of the
>>>>> approaches. And it's your responsibility to convince the community
>>>>> about that approach. Having an example may help people to understand
>>>>> your proposal.
>>>>>
>>>>>> I'm not referring to internal state definitions.
>>>>> Without an example, how do we know if it can work well?
>>>>>
>>>>>> Can you please not change the subject of my initial intent in the em=
ail ?
>>>>> Did I? Basically, I'm asking how a virtio-blk can be migrated with
>>>>> your proposal.
>>>> The virtio-blk PF admin queue will be used to manage the virtio-blk VF
>>>> migration.
>>>>
>>>> This is the whole discussion. I don't want to get into resolution.
>>>>
>>>> Since you already know the answer as I published 4 RFCs already with a=
ll the
>>>> flow.
>>>>
>>>> Lets stick to my question.
>>>>
>>>>> Thanks
>>>>>
>>>>>> Thanks.
>>>>>>
>>>>>>
>>>>>>> Thanks
>>>>>>>
>>>>>>>>> Thanks
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> Cheers,
>>>>>>>>>>
>>>>>>>>>> -Max.
>>>>>>>>>>
>>>>>>>> This publicly archived list offers a means to provide input to the
>>>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>>>>>>
>>>>>>>> In order to verify user consent to the Feedback License terms and
>>>>>>>> to minimize spam in the list archive, subscription is required
>>>>>>>> before posting.
>>>>>>>>
>>>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>>>>>> List help: virtio-comment-help@lists.oasis-open.org
>>>>>>>> List archive: https://nam11.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Flists.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;da=
ta=3D04%7C01%7Cmgurtovoy%40nvidia.com%7C9d6634c268e84039d18308d9631d0220%7C=
43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637649798517296420%7CUnknown%7CT=
WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%=
3D%7C1000&amp;sdata=3DgVamhvYG3lbMVVyMz%2F%2Fq3VBMZKY47pqxvRi94Mp%2B%2B7I%3=
D&amp;reserved=3D0
>>>>>>>> Feedback License: https://nam11.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fwww.oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&a=
mp;data=3D04%7C01%7Cmgurtovoy%40nvidia.com%7C9d6634c268e84039d18308d9631d02=
20%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637649798517296420%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C1000&amp;sdata=3DU%2FxmgTCEaUTSgG%2BLohnAAuNXLncUOKU8yBxhkEMpmQk%=
3D&amp;reserved=3D0
>>>>>>>> List Guidelines: https://nam11.safelinks.protection.outlook.com/?u=
rl=3Dhttps%3A%2F%2Fwww.oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists=
&amp;data=3D04%7C01%7Cmgurtovoy%40nvidia.com%7C9d6634c268e84039d18308d9631d=
0220%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637649798517296420%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C1000&amp;sdata=3DnXzbdkD4B4TzAFXbD%2B4Jap8rWmzX2CZ8fVnEE2f4Tdc%=
3D&amp;reserved=3D0
>>>>>>>> Committee: https://nam11.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fwww.oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=3D04%7C01=
%7Cmgurtovoy%40nvidia.com%7C9d6634c268e84039d18308d9631d0220%7C43083d157273=
40c1b7db39efd9ccc17a%7C0%7C0%7C637649798517296420%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3D8Issa0O7V4p6MnuuJOcLDN4MAG77cSMSJ7MSZqvXol4%3D&amp;reserved=3D0
>>>>>>>> Join OASIS: https://nam11.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Fwww.oasis-open.org%2Fjoin%2F&amp;data=3D04%7C01%7Cmgurtovoy%4=
0nvidia.com%7C9d6634c268e84039d18308d9631d0220%7C43083d15727340c1b7db39efd9=
ccc17a%7C0%7C0%7C637649798517296420%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DpPqc=
ruawglqgMjakkslrpSVZzaOu%2FCvfkTSuUfMiEh0%3D&amp;reserved=3D0
>>>>>>>>
>>>> This publicly archived list offers a means to provide input to the
>>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>>
>>>> In order to verify user consent to the Feedback License terms and
>>>> to minimize spam in the list archive, subscription is required
>>>> before posting.
>>>>
>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>> List help: virtio-comment-help@lists.oasis-open.org
>>>> List archive: https://nam11.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=3D=
04%7C01%7Cmgurtovoy%40nvidia.com%7C9d6634c268e84039d18308d9631d0220%7C43083=
d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637649798517296420%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
1000&amp;sdata=3DgVamhvYG3lbMVVyMz%2F%2Fq3VBMZKY47pqxvRi94Mp%2B%2B7I%3D&amp=
;reserved=3D0
>>>> Feedback License: https://nam11.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fwww.oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;=
data=3D04%7C01%7Cmgurtovoy%40nvidia.com%7C9d6634c268e84039d18308d9631d0220%=
7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637649798517296420%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C1000&amp;sdata=3DU%2FxmgTCEaUTSgG%2BLohnAAuNXLncUOKU8yBxhkEMpmQk%3D&=
amp;reserved=3D0
>>>> List Guidelines: https://nam11.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fwww.oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists&a=
mp;data=3D04%7C01%7Cmgurtovoy%40nvidia.com%7C9d6634c268e84039d18308d9631d02=
20%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637649798517296420%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C1000&amp;sdata=3DnXzbdkD4B4TzAFXbD%2B4Jap8rWmzX2CZ8fVnEE2f4Tdc%3D=
&amp;reserved=3D0
>>>> Committee: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fwww.oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=3D04%7C01%7Cm=
gurtovoy%40nvidia.com%7C9d6634c268e84039d18308d9631d0220%7C43083d15727340c1=
b7db39efd9ccc17a%7C0%7C0%7C637649798517296420%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd=
ata=3D8Issa0O7V4p6MnuuJOcLDN4MAG77cSMSJ7MSZqvXol4%3D&amp;reserved=3D0
>>>> Join OASIS: https://nam11.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fwww.oasis-open.org%2Fjoin%2F&amp;data=3D04%7C01%7Cmgurtovoy%40nvi=
dia.com%7C9d6634c268e84039d18308d9631d0220%7C43083d15727340c1b7db39efd9ccc1=
7a%7C0%7C0%7C637649798517296420%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DpPqcruaw=
glqgMjakkslrpSVZzaOu%2FCvfkTSuUfMiEh0%3D&amp;reserved=3D0
>>>>

