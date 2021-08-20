Return-Path: <jasowang@redhat.com>
MIME-Version: 1.0
References: <DM4PR12MB504062CEF6BEDABE6F76DEC2DEF99@DM4PR12MB5040.namprd12.prod.outlook.com>
 <62bd1c8d-c56e-fc98-f833-61d9c999f814@redhat.com> <cc7e769a-fee6-2940-74a7-03dbc98a109f@nvidia.com>
 <CACGkMEuAo84oGL6saMTFaS7yzsihuNUWVK4AkVtctT80Opc8Zg@mail.gmail.com>
 <c97bcfbf-81c6-c70c-a943-7f72b0d94d71@nvidia.com> <CACGkMEvxxsnEZYCok-xPLnKzJM=501M3erkZ-EDegOFD9YfQdg@mail.gmail.com>
 <5eb7d5b4-a715-5ef2-81f7-9721d865d6ac@nvidia.com> <YR48goPkf7scGwjA@work-vm>
 <755ff192-33ac-9f6a-a7ad-b44b14afd5d2@nvidia.com> <YR5pgsRf3p4rBwnc@work-vm>
 <39536c3c-e455-5602-9391-0b21add7e22f@nvidia.com> <0d06c26e-f1e7-3cac-a017-059e8985bb44@redhat.com>
 <74151019-6f78-2bff-5b0a-b5a4da814787@nvidia.com>
In-Reply-To: <74151019-6f78-2bff-5b0a-b5a4da814787@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 20 Aug 2021 19:16:21 +0800
Message-ID: <CACGkMEsJ7oqxMPpLET2uPr_om=pQYkbtyEoig5J_KSwzOUEenQ@mail.gmail.com>
Subject: Re: [virtio-comment] Live Migration of Virtio Virtual Function
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>, Shahaf Shuler <shahafs@nvidia.com>, Ariel Adam <aadam@redhat.com>, Amnon Ilan <ailan@redhat.com>, Bodong Wang <bodong@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, Liran Liss <liranl@nvidia.com>, Oren Duer <oren@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Aug 20, 2021 at 6:26 PM Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>
>
> On 8/20/2021 5:24 AM, Jason Wang wrote:
> >
> > =E5=9C=A8 2021/8/19 =E4=B8=8B=E5=8D=8811:20, Max Gurtovoy =E5=86=99=E9=
=81=93:
> >>
> >> On 8/19/2021 5:24 PM, Dr. David Alan Gilbert wrote:
> >>> * Max Gurtovoy (mgurtovoy@nvidia.com) wrote:
> >>>> On 8/19/2021 2:12 PM, Dr. David Alan Gilbert wrote:
> >>>>> * Max Gurtovoy (mgurtovoy@nvidia.com) wrote:
> >>>>>> On 8/18/2021 1:46 PM, Jason Wang wrote:
> >>>>>>> On Wed, Aug 18, 2021 at 5:16 PM Max Gurtovoy
> >>>>>>> <mgurtovoy@nvidia.com> wrote:
> >>>>>>>> On 8/17/2021 12:44 PM, Jason Wang wrote:
> >>>>>>>>> On Tue, Aug 17, 2021 at 5:11 PM Max Gurtovoy
> >>>>>>>>> <mgurtovoy@nvidia.com> wrote:
> >>>>>>>>>> On 8/17/2021 11:51 AM, Jason Wang wrote:
> >>>>>>>>>>> =E5=9C=A8 2021/8/12 =E4=B8=8B=E5=8D=888:08, Max Gurtovoy =E5=
=86=99=E9=81=93:
> >>>>>>>>>>>> Hi all,
> >>>>>>>>>>>>
> >>>>>>>>>>>> Live migration is one of the most important features of
> >>>>>>>>>>>> virtualization and virtio devices are oftenly found in virtu=
al
> >>>>>>>>>>>> environments.
> >>>>>>>>>>>>
> >>>>>>>>>>>> The migration process is managed by a migration SW that is
> >>>>>>>>>>>> running on
> >>>>>>>>>>>> the hypervisor and the VM is not aware of the process at all=
.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Unlike the vDPA case, a real pci Virtual Function state
> >>>>>>>>>>>> resides in
> >>>>>>>>>>>> the HW.
> >>>>>>>>>>>>
> >>>>>>>>>>> vDPA doesn't prevent you from having HW states. Actually
> >>>>>>>>>>> from the view
> >>>>>>>>>>> of the VMM(Qemu), it doesn't care whether or not a state is
> >>>>>>>>>>> stored in
> >>>>>>>>>>> the software or hardware. A well designed VMM should be able
> >>>>>>>>>>> to hide
> >>>>>>>>>>> the virtio device implementation from the migration layer,
> >>>>>>>>>>> that is how
> >>>>>>>>>>> Qemu is wrote who doesn't care about whether or not it's a
> >>>>>>>>>>> software
> >>>>>>>>>>> virtio/vDPA device or not.
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>>> In our vision, in order to fulfil the Live migration
> >>>>>>>>>>>> requirements for
> >>>>>>>>>>>> virtual functions, each physical function device must
> >>>>>>>>>>>> implement
> >>>>>>>>>>>> migration operations. Using these operations, it will be
> >>>>>>>>>>>> able to
> >>>>>>>>>>>> master the migration process for the virtual function
> >>>>>>>>>>>> devices. Each
> >>>>>>>>>>>> capable physical function device has a supervisor
> >>>>>>>>>>>> permissions to
> >>>>>>>>>>>> change the virtual function operational states,
> >>>>>>>>>>>> save/restore its
> >>>>>>>>>>>> internal state and start/stop dirty pages tracking.
> >>>>>>>>>>>>
> >>>>>>>>>>> For "supervisor permissions", is this from the software
> >>>>>>>>>>> point of view?
> >>>>>>>>>>> Maybe it's better to give an example for this.
> >>>>>>>>>> A permission to a PF device for quiesce and freeze a VF
> >>>>>>>>>> device for example.
> >>>>>>>>> Note that for safety, VMM (e.g Qemu) is usually running
> >>>>>>>>> without any privileges.
> >>>>>>>> You're mixing layers here.
> >>>>>>>>
> >>>>>>>> QEMU is not involved here. It's only sending IOCTLs to
> >>>>>>>> migration driver.
> >>>>>>>> The migration driver will control the migration process of the
> >>>>>>>> VF using
> >>>>>>>> the PF communication channel.
> >>>>>>> So who will be granted the "permission" you mentioned here?
> >>>>>> This is just an expression.
> >>>>>>
> >>>>>> What is not clear ?
> >>>>>>
> >>>>>> The PF device will have an option to quiesce/freeze the VF device.
> >>>>>>
> >>>>>> This is simple. Why are you looking for some sophisticated
> >>>>>> problems ?
> >>>>> I'm trying to follow along here and have not completely; but I
> >>>>> think the issue is a
> >>>>> security separation one.
> >>>>> The VMM (e.g. qemu) that has been given access to one of the VF's i=
s
> >>>>> isolated and shouldn't be able to go poking at other devices; so it
> >>>>> can't go poking at the PF (it probably doesn't even have the PF
> >>>>> device
> >>>>> node accessible) - so then the question is who has access to the
> >>>>> migration driver and how do you make sure it can only deal with VF'=
s
> >>>>> that it's supposed to be able to migrate.
> >>>> The QEMU/userspace doesn't know or care about the PF connection and
> >>>> internal
> >>>> virtio_vfio_pci driver implementation.
> >>> OK
> >>>
> >>>> You shouldn't change 1 line of code in the VM driver nor in QEMU.
> >>> Hmm OK.
> >>>
> >>>> QEMU does not have access to the PF. Only the kernel driver that
> >>>> has access
> >>>> to the VF will have access to the PF communication channel. There
> >>>> is no
> >>>> permission problem here.
> >>>>
> >>>> The kernel driver of the VF will do this internally, and make sure
> >>>> that the
> >>>> commands it build will only impact the VF originating them.
> >>>>
> >>> Now that confuses me; isn't the kernel driver that has access to the =
VF
> >>> running inside the guest?  If it's inside the guest we can't trust
> >>> it to
> >>> do anything about stopping impact to other devices.
> >>
> >> No. The driver is in the hypervisor (virtio_vfio_pci). This is the
> >> migration driver, right ?
> >
> >
> > Well, talking things like virtio_vfio_pci that is not mentioned before
> > and not justified on the list may easily confuse people. As pointed
> > out in another thread, it has too many disadvantages over the existing
> > virtio-pci vdpa driver. And it just duplicates a partial function of
> > what virtio-pci vdpa driver can do. I don't think we will go that way.
>
> This was just an example for David to help with understanding the
> solution since he thought that the guest drivers somehow should be change=
d.
>
> David I'm sorry if I confused you.
>
> Again Jason, you try to propose your vDPA solution that is not what
> we're trying to achieve in this work. Think of a world without vDPA.

Well, I'd say, let's think vDPA a superset of virtio, not just the
acceleration technologies.

> Also I don't understand how vDPA is related to virtio specification
> decisions ?

So how is VFIO related to virtio specific decisions? That's why I
think we should avoid talking about software architecture here. It's
the wrong community.

>  make vDPA into virtio and then we can open a discussion.
>
> I'm interesting in virtio migration of HW devices.
>
> The proposal in this thread is actually get support from Michal AFAIU
> and also others were happy with. All beside of you.

So I think I've clairfied my several times :(

- I'm fairly ok with the proposal
- but we decouple the basic facility out of the admin virtqueue and
this seems agreed by Michael:

Let's take the dirty page tracking as an example:

1) let's first define that as one of the basic facility
2) then we can introduce admin virtqueue or other stuffs as an
interface for that facility

Does this work for you?

>
> We do it in mlx5 and we didn't see any issues with that design.
>

If we seperate things as I suggested, I'm totally fine.

> I don't think you can say that we "go that way".

For "go that way" I meant the method of using vfio_virtio_pci, it has
nothing related to the discussion of "using PF to control VF" on the
spec.

>
> You're trying to build a complementary solution for creating scalable
> functions and for some reason trying to sabotage NVIDIA efforts to add
> new important functionality to virtio.

Well, it's a completely different topic. And it doesn't conflict with
anything that is proposed here by you. I think I've stated this
several times.  I don't think we block each other, it's just some
unification work if one of the proposals is merged first. I sent them
recently because it will be used as a material for my talk on the KVM
Forum which is really near.

>
> This also sabotage the evolvment of virtio as a standard.
>
> You're trying to enforce some un-finished idea that should work on some
> future specific HW platform instead of helping defining a good spec for
> virtio.

Let's open another thread for this if you wish, it has nothing related
to the spec but how it is implemented in Linux. If you search the
archive, something similar to "vfio_virtio_pci" has been proposed
several years before by Intel. The idea has been rejected, and we have
leveraged Linux vDPA bus for virtio-pci devices.

>
> And all is for having users to choose vDPA framework instead of using
> plain virtio.
>
> We believe in our solution and we have a working prototype. We'll
> continue with our discussion to convince the community with it.

Again, it looks like there's a lot of misunderstanding. Let's open a
thread on the suitable list instead of talking about any specific
software solution or architecture here. This will speed up things.

Thanks

>
> Thanks.
>
> >
> > Thanks
> >
> >
> >>
> >> The guest is running as usual. It doesn't aware on the migration at al=
l.
> >>
> >> This is the point I try to make here. I don't (and I can't) change
> >> even 1 line of code in the guest.
> >>
> >> e.g:
> >>
> >> QEMU ioctl --> vfio (hypervisor) --> virtio_vfio_pci on hypervisor
> >> (bounded to VF5) --> send admin command on PF adminq to start
> >> tracking dirty pages for VF5 --> PF device will do it
> >>
> >> QEMU ioctl --> vfio (hypervisor) --> virtio_vfio_pci on hypervisor
> >> (bounded to VF5) --> send admin command on PF adminq to quiesce VF5
> >> --> PF device will do it
> >>
> >> You can take a look how we implement mlx5_vfio_pci in the link I
> >> provided.
> >>
> >>>
> >>> Dave
> >>>
> >>>
> >>>> We already do this in mlx5 NIC migration. The kernel is secured and
> >>>> QEMU
> >>>> interface is the VF.
> >>>>
> >>>>> Dave
> >>>>>
> >>>>>>>>>>>> An example of this approach can be seen in the way NVIDIA
> >>>>>>>>>>>> performs
> >>>>>>>>>>>> live migration of a ConnectX NIC function:
> >>>>>>>>>>>>
> >>>>>>>>>>>> https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci
> >>>>>>>>>>>> <https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci>
> >>>>>>>>>>>>
> >>>>>>>>>>>> NVIDIAs SNAP technology enables hardware-accelerated
> >>>>>>>>>>>> software defined
> >>>>>>>>>>>> PCIe devices. virtio-blk/virtio-net/virtio-fs SNAP used for
> >>>>>>>>>>>> storage
> >>>>>>>>>>>> and networking solutions. The host OS/hypervisor uses its
> >>>>>>>>>>>> standard
> >>>>>>>>>>>> drivers that are implemented according to a well-known VIRTI=
O
> >>>>>>>>>>>> specifications.
> >>>>>>>>>>>>
> >>>>>>>>>>>> In order to implement Live Migration for these virtual
> >>>>>>>>>>>> function
> >>>>>>>>>>>> devices, that use a standard drivers as mentioned, the
> >>>>>>>>>>>> specification
> >>>>>>>>>>>> should define how HW vendor should build their devices and
> >>>>>>>>>>>> for SW
> >>>>>>>>>>>> developers to adjust the drivers.
> >>>>>>>>>>>>
> >>>>>>>>>>>> This will enable specification compliant vendor agnostic
> >>>>>>>>>>>> solution.
> >>>>>>>>>>>>
> >>>>>>>>>>>> This is exactly how we built the migration driver for Connec=
tX
> >>>>>>>>>>>> (internal HW design doc) and I guess that this is the way
> >>>>>>>>>>>> other
> >>>>>>>>>>>> vendors work.
> >>>>>>>>>>>>
> >>>>>>>>>>>> For that, I would like to know if the approach of =E2=80=9CP=
F that
> >>>>>>>>>>>> controls
> >>>>>>>>>>>> the VF live migration process=E2=80=9D is acceptable by the =
VIRTIO
> >>>>>>>>>>>> technical
> >>>>>>>>>>>> group ?
> >>>>>>>>>>>>
> >>>>>>>>>>> I'm not sure but I think it's better to start from the genera=
l
> >>>>>>>>>>> facility for all transports, then develop features for a
> >>>>>>>>>>> specific
> >>>>>>>>>>> transport.
> >>>>>>>>>> a general facility for all transports can be a generic admin
> >>>>>>>>>> queue ?
> >>>>>>>>> It could be a virtqueue or a transport specific method (pcie
> >>>>>>>>> capability).
> >>>>>>>> No. You said a general facility for all transports.
> >>>>>>> For general facility, I mean the chapter 2 of the spec which is
> >>>>>>> general
> >>>>>>>
> >>>>>>> "
> >>>>>>> 2 Basic Facilities of a Virtio Device
> >>>>>>> "
> >>>>>>>
> >>>>>> It will be in chapter 2. Right after "2.11 Exporting Object" I
> >>>>>> can add "2.12
> >>>>>> Admin Virtqueues" and this is what I did in the RFC.
> >>>>>>
> >>>>>>>> Transport specific is not general.
> >>>>>>> The transport is in charge of implementing the interface for
> >>>>>>> those facilities.
> >>>>>> Transport specific is not general.
> >>>>>>
> >>>>>>
> >>>>>>>>> E.g we can define what needs to be migrated for the virtio-blk
> >>>>>>>>> first
> >>>>>>>>> (the device state). Then we can define the interface to get
> >>>>>>>>> and set
> >>>>>>>>> those states via admin virtqueue. Such decoupling may ease the
> >>>>>>>>> future
> >>>>>>>>> development of the transport specific migration interface.
> >>>>>>>> I asked a simple question here.
> >>>>>>>>
> >>>>>>>> Lets stick to this.
> >>>>>>> I answered this question.
> >>>>>> No you didn't answer.
> >>>>>>
> >>>>>> I asked  if the approach of =E2=80=9CPF that controls the VF live
> >>>>>> migration process=E2=80=9D
> >>>>>> is acceptable by the VIRTIO technical group ?
> >>>>>>
> >>>>>> And you take the discussion to your direction instead of
> >>>>>> answering a Yes/No
> >>>>>> question.
> >>>>>>
> >>>>>>>      The virtqueue could be one of the
> >>>>>>> approaches. And it's your responsibility to convince the communit=
y
> >>>>>>> about that approach. Having an example may help people to
> >>>>>>> understand
> >>>>>>> your proposal.
> >>>>>>>
> >>>>>>>> I'm not referring to internal state definitions.
> >>>>>>> Without an example, how do we know if it can work well?
> >>>>>>>
> >>>>>>>> Can you please not change the subject of my initial intent in
> >>>>>>>> the email ?
> >>>>>>> Did I? Basically, I'm asking how a virtio-blk can be migrated wit=
h
> >>>>>>> your proposal.
> >>>>>> The virtio-blk PF admin queue will be used to manage the
> >>>>>> virtio-blk VF
> >>>>>> migration.
> >>>>>>
> >>>>>> This is the whole discussion. I don't want to get into resolution.
> >>>>>>
> >>>>>> Since you already know the answer as I published 4 RFCs already
> >>>>>> with all the
> >>>>>> flow.
> >>>>>>
> >>>>>> Lets stick to my question.
> >>>>>>
> >>>>>>> Thanks
> >>>>>>>
> >>>>>>>> Thanks.
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>> Thanks
> >>>>>>>>>
> >>>>>>>>>>> Thanks
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>>> Cheers,
> >>>>>>>>>>>>
> >>>>>>>>>>>> -Max.
> >>>>>>>>>>>>
> >>>>>>>>>> This publicly archived list offers a means to provide input
> >>>>>>>>>> to the
> >>>>>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
> >>>>>>>>>>
> >>>>>>>>>> In order to verify user consent to the Feedback License terms
> >>>>>>>>>> and
> >>>>>>>>>> to minimize spam in the list archive, subscription is required
> >>>>>>>>>> before posting.
> >>>>>>>>>>
> >>>>>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >>>>>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >>>>>>>>>> List help: virtio-comment-help@lists.oasis-open.org
> >>>>>>>>>> List archive:
> >>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Flists.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=3D04%7C0=
1%7Cmgurtovoy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727=
340c1b7db39efd9ccc17a%7C0%7C0%7C637650231017968126%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;sdata=3DtqLsKdPEjF4uMUeqrwpeBD7J4q%2BrWKH1xRUXozJ4KEI%3D&amp;reserved=3D=
0
> >>>>>>>>>> Feedback License:
> >>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fwww.oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;data=3D04%7=
C01%7Cmgurtovoy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d157=
27340c1b7db39efd9ccc17a%7C0%7C0%7C637650231017968126%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000=
&amp;sdata=3D2tg8X5uT17Vtj1hWZ7kEskf%2BeG9jV5HhJA3yepZksrg%3D&amp;reserved=
=3D0
> >>>>>>>>>> List Guidelines:
> >>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fwww.oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists&amp;data=3D0=
4%7C01%7Cmgurtovoy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d=
15727340c1b7db39efd9ccc17a%7C0%7C0%7C637650231017968126%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1=
000&amp;sdata=3DYnuvd9xCIEDhTjjxuAgMFVCek%2B6wQGhGjnUyrsKCamM%3D&amp;reserv=
ed=3D0
> >>>>>>>>>> Committee:
> >>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fwww.oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=3D04%7C01%7Cmgur=
tovoy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727340c1b7d=
b39efd9ccc17a%7C0%7C0%7C637650231017968126%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3DQyJw7q7fwlq8oFjiaI%2BZICxARQEvXhrhRbiKkIyFmik%3D&amp;reserved=3D0
> >>>>>>>>>> Join OASIS:
> >>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fwww.oasis-open.org%2Fjoin%2F&amp;data=3D04%7C01%7Cmgurtovoy%40nvidia.=
com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727340c1b7db39efd9ccc17a%7=
C0%7C0%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DjebnTI98aw8L=
E0zC0BF2hiP6Rg3YsoKKunSVZz5GAlU%3D&amp;reserved=3D0
> >>>>>>>>>>
> >>>>>> This publicly archived list offers a means to provide input to the
> >>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
> >>>>>>
> >>>>>> In order to verify user consent to the Feedback License terms and
> >>>>>> to minimize spam in the list archive, subscription is required
> >>>>>> before posting.
> >>>>>>
> >>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >>>>>> List help: virtio-comment-help@lists.oasis-open.org
> >>>>>> List archive:
> >>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flists.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=3D04%7C01%7C=
mgurtovoy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727340c=
1b7db39efd9ccc17a%7C0%7C0%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DT5gTfTBJ9blLPnGVlidRZFIeqrgi%2BcHyOwnVP5xtBPY%3D&amp;reserved=3D0
> >>>>>> Feedback License:
> >>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fwww.oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;data=3D04%7C01%=
7Cmgurtovoy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d1572734=
0c1b7db39efd9ccc17a%7C0%7C0%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DSmRyku3IZ8O5vITCXasVxF%2BEjcG7zb%2BDi8sZinSuvp4%3D&amp;reserved=3D=
0
> >>>>>> List Guidelines:
> >>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fwww.oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists&amp;data=3D04%7C=
01%7Cmgurtovoy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d1572=
7340c1b7db39efd9ccc17a%7C0%7C0%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DIV4C1Y%2BE%2Bq9OPzjyYYvoVrPp6975qyNZ%2Fn1%2B0eD58%2FA%3D&amp;re=
served=3D0
> >>>>>> Committee:
> >>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fwww.oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=3D04%7C01%7Cmgurtovo=
y%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727340c1b7db39e=
fd9ccc17a%7C0%7C0%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D8=
Bh0ufU4zKnzwspmmF0vN3tW3Ppi4RYfcT8pFzo%2FTT8%3D&amp;reserved=3D0
> >>>>>> Join OASIS:
> >>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fwww.oasis-open.org%2Fjoin%2F&amp;data=3D04%7C01%7Cmgurtovoy%40nvidia.com%=
7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727340c1b7db39efd9ccc17a%7C0%7=
C0%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DjebnTI98aw8LE0zC=
0BF2hiP6Rg3YsoKKunSVZz5GAlU%3D&amp;reserved=3D0
> >>>>>>
> >>
> >> This publicly archived list offers a means to provide input to the
> >> OASIS Virtual I/O Device (VIRTIO) TC.
> >>
> >> In order to verify user consent to the Feedback License terms and
> >> to minimize spam in the list archive, subscription is required
> >> before posting.
> >>
> >> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >> List help: virtio-comment-help@lists.oasis-open.org
> >> List archive:
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fli=
sts.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=3D04%7C01%7Cmgur=
tovoy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727340c1b7d=
b39efd9ccc17a%7C0%7C0%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3DT5gTfTBJ9blLPnGVlidRZFIeqrgi%2BcHyOwnVP5xtBPY%3D&amp;reserved=3D0
> >> Feedback License:
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fww=
w.oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;data=3D04%7C01%7Cmg=
urtovoy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727340c1b=
7db39efd9ccc17a%7C0%7C0%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sda=
ta=3DSmRyku3IZ8O5vITCXasVxF%2BEjcG7zb%2BDi8sZinSuvp4%3D&amp;reserved=3D0
> >> List Guidelines:
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fww=
w.oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists&amp;data=3D04%7C01%7=
Cmgurtovoy%40nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727340=
c1b7db39efd9ccc17a%7C0%7C0%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
sdata=3DIV4C1Y%2BE%2Bq9OPzjyYYvoVrPp6975qyNZ%2Fn1%2B0eD58%2FA%3D&amp;reserv=
ed=3D0
> >> Committee:
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fww=
w.oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=3D04%7C01%7Cmgurtovoy%40=
nvidia.com%7C12187bc5e0d94abdd7bb08d96381b438%7C43083d15727340c1b7db39efd9c=
cc17a%7C0%7C0%7C637650231017978092%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D8Bh0u=
fU4zKnzwspmmF0vN3tW3Ppi4RYfcT8pFzo%2FTT8%3D&amp;reserved=3D0
> >> Join OASIS:
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fww=
w.oasis-open.org%2Fjoin%2F&amp;data=3D04%7C01%7Cmgurtovoy%40nvidia.com%7C12=
187bc5e0d94abdd7bb08d96381b438%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7=
C637650231017978092%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DjebnTI98aw8LE0zC0BF2=
hiP6Rg3YsoKKunSVZz5GAlU%3D&amp;reserved=3D0
> >>
> >
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
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>

