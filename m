Return-Path: <jasowang@redhat.com>
MIME-Version: 1.0
References: <DM4PR12MB504062CEF6BEDABE6F76DEC2DEF99@DM4PR12MB5040.namprd12.prod.outlook.com>
 <62bd1c8d-c56e-fc98-f833-61d9c999f814@redhat.com> <cc7e769a-fee6-2940-74a7-03dbc98a109f@nvidia.com>
 <CACGkMEuAo84oGL6saMTFaS7yzsihuNUWVK4AkVtctT80Opc8Zg@mail.gmail.com>
 <c97bcfbf-81c6-c70c-a943-7f72b0d94d71@nvidia.com> <CACGkMEvxxsnEZYCok-xPLnKzJM=501M3erkZ-EDegOFD9YfQdg@mail.gmail.com>
 <5eb7d5b4-a715-5ef2-81f7-9721d865d6ac@nvidia.com> <YR48goPkf7scGwjA@work-vm>
 <755ff192-33ac-9f6a-a7ad-b44b14afd5d2@nvidia.com> <YR5pgsRf3p4rBwnc@work-vm>
 <39536c3c-e455-5602-9391-0b21add7e22f@nvidia.com> <0d06c26e-f1e7-3cac-a017-059e8985bb44@redhat.com>
 <74151019-6f78-2bff-5b0a-b5a4da814787@nvidia.com> <CACGkMEsJ7oqxMPpLET2uPr_om=pQYkbtyEoig5J_KSwzOUEenQ@mail.gmail.com>
 <41fbd78a-f1d8-9056-3929-1e7b6b57a49b@nvidia.com>
In-Reply-To: <41fbd78a-f1d8-9056-3929-1e7b6b57a49b@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 23 Aug 2021 11:10:09 +0800
Message-ID: <CACGkMEvH9gna_bnghvA1o-xgK=Tru5xxr8nsUhEd9E0hsjkZiA@mail.gmail.com>
Subject: Re: [virtio-comment] Live Migration of Virtio Virtual Function
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>, Shahaf Shuler <shahafs@nvidia.com>, Ariel Adam <aadam@redhat.com>, Amnon Ilan <ailan@redhat.com>, Bodong Wang <bodong@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, Liran Liss <liranl@nvidia.com>, Oren Duer <oren@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Sun, Aug 22, 2021 at 6:05 PM Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>
>
> On 8/20/2021 2:16 PM, Jason Wang wrote:
> > On Fri, Aug 20, 2021 at 6:26 PM Max Gurtovoy <mgurtovoy@nvidia.com> wro=
te:
> >>
> >> On 8/20/2021 5:24 AM, Jason Wang wrote:
> >>> =E5=9C=A8 2021/8/19 =E4=B8=8B=E5=8D=8811:20, Max Gurtovoy =E5=86=99=
=E9=81=93:
> >>>> On 8/19/2021 5:24 PM, Dr. David Alan Gilbert wrote:
> >>>>> * Max Gurtovoy (mgurtovoy@nvidia.com) wrote:
> >>>>>> On 8/19/2021 2:12 PM, Dr. David Alan Gilbert wrote:
> >>>>>>> * Max Gurtovoy (mgurtovoy@nvidia.com) wrote:
> >>>>>>>> On 8/18/2021 1:46 PM, Jason Wang wrote:
> >>>>>>>>> On Wed, Aug 18, 2021 at 5:16 PM Max Gurtovoy
> >>>>>>>>> <mgurtovoy@nvidia.com> wrote:
> >>>>>>>>>> On 8/17/2021 12:44 PM, Jason Wang wrote:
> >>>>>>>>>>> On Tue, Aug 17, 2021 at 5:11 PM Max Gurtovoy
> >>>>>>>>>>> <mgurtovoy@nvidia.com> wrote:
> >>>>>>>>>>>> On 8/17/2021 11:51 AM, Jason Wang wrote:
> >>>>>>>>>>>>> =E5=9C=A8 2021/8/12 =E4=B8=8B=E5=8D=888:08, Max Gurtovoy =
=E5=86=99=E9=81=93:
> >>>>>>>>>>>>>> Hi all,
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Live migration is one of the most important features of
> >>>>>>>>>>>>>> virtualization and virtio devices are oftenly found in vir=
tual
> >>>>>>>>>>>>>> environments.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> The migration process is managed by a migration SW that is
> >>>>>>>>>>>>>> running on
> >>>>>>>>>>>>>> the hypervisor and the VM is not aware of the process at a=
ll.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Unlike the vDPA case, a real pci Virtual Function state
> >>>>>>>>>>>>>> resides in
> >>>>>>>>>>>>>> the HW.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>> vDPA doesn't prevent you from having HW states. Actually
> >>>>>>>>>>>>> from the view
> >>>>>>>>>>>>> of the VMM(Qemu), it doesn't care whether or not a state is
> >>>>>>>>>>>>> stored in
> >>>>>>>>>>>>> the software or hardware. A well designed VMM should be abl=
e
> >>>>>>>>>>>>> to hide
> >>>>>>>>>>>>> the virtio device implementation from the migration layer,
> >>>>>>>>>>>>> that is how
> >>>>>>>>>>>>> Qemu is wrote who doesn't care about whether or not it's a
> >>>>>>>>>>>>> software
> >>>>>>>>>>>>> virtio/vDPA device or not.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> In our vision, in order to fulfil the Live migration
> >>>>>>>>>>>>>> requirements for
> >>>>>>>>>>>>>> virtual functions, each physical function device must
> >>>>>>>>>>>>>> implement
> >>>>>>>>>>>>>> migration operations. Using these operations, it will be
> >>>>>>>>>>>>>> able to
> >>>>>>>>>>>>>> master the migration process for the virtual function
> >>>>>>>>>>>>>> devices. Each
> >>>>>>>>>>>>>> capable physical function device has a supervisor
> >>>>>>>>>>>>>> permissions to
> >>>>>>>>>>>>>> change the virtual function operational states,
> >>>>>>>>>>>>>> save/restore its
> >>>>>>>>>>>>>> internal state and start/stop dirty pages tracking.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>> For "supervisor permissions", is this from the software
> >>>>>>>>>>>>> point of view?
> >>>>>>>>>>>>> Maybe it's better to give an example for this.
> >>>>>>>>>>>> A permission to a PF device for quiesce and freeze a VF
> >>>>>>>>>>>> device for example.
> >>>>>>>>>>> Note that for safety, VMM (e.g Qemu) is usually running
> >>>>>>>>>>> without any privileges.
> >>>>>>>>>> You're mixing layers here.
> >>>>>>>>>>
> >>>>>>>>>> QEMU is not involved here. It's only sending IOCTLs to
> >>>>>>>>>> migration driver.
> >>>>>>>>>> The migration driver will control the migration process of the
> >>>>>>>>>> VF using
> >>>>>>>>>> the PF communication channel.
> >>>>>>>>> So who will be granted the "permission" you mentioned here?
> >>>>>>>> This is just an expression.
> >>>>>>>>
> >>>>>>>> What is not clear ?
> >>>>>>>>
> >>>>>>>> The PF device will have an option to quiesce/freeze the VF devic=
e.
> >>>>>>>>
> >>>>>>>> This is simple. Why are you looking for some sophisticated
> >>>>>>>> problems ?
> >>>>>>> I'm trying to follow along here and have not completely; but I
> >>>>>>> think the issue is a
> >>>>>>> security separation one.
> >>>>>>> The VMM (e.g. qemu) that has been given access to one of the VF's=
 is
> >>>>>>> isolated and shouldn't be able to go poking at other devices; so =
it
> >>>>>>> can't go poking at the PF (it probably doesn't even have the PF
> >>>>>>> device
> >>>>>>> node accessible) - so then the question is who has access to the
> >>>>>>> migration driver and how do you make sure it can only deal with V=
F's
> >>>>>>> that it's supposed to be able to migrate.
> >>>>>> The QEMU/userspace doesn't know or care about the PF connection an=
d
> >>>>>> internal
> >>>>>> virtio_vfio_pci driver implementation.
> >>>>> OK
> >>>>>
> >>>>>> You shouldn't change 1 line of code in the VM driver nor in QEMU.
> >>>>> Hmm OK.
> >>>>>
> >>>>>> QEMU does not have access to the PF. Only the kernel driver that
> >>>>>> has access
> >>>>>> to the VF will have access to the PF communication channel. There
> >>>>>> is no
> >>>>>> permission problem here.
> >>>>>>
> >>>>>> The kernel driver of the VF will do this internally, and make sure
> >>>>>> that the
> >>>>>> commands it build will only impact the VF originating them.
> >>>>>>
> >>>>> Now that confuses me; isn't the kernel driver that has access to th=
e VF
> >>>>> running inside the guest?  If it's inside the guest we can't trust
> >>>>> it to
> >>>>> do anything about stopping impact to other devices.
> >>>> No. The driver is in the hypervisor (virtio_vfio_pci). This is the
> >>>> migration driver, right ?
> >>>
> >>> Well, talking things like virtio_vfio_pci that is not mentioned befor=
e
> >>> and not justified on the list may easily confuse people. As pointed
> >>> out in another thread, it has too many disadvantages over the existin=
g
> >>> virtio-pci vdpa driver. And it just duplicates a partial function of
> >>> what virtio-pci vdpa driver can do. I don't think we will go that way=
.
> >> This was just an example for David to help with understanding the
> >> solution since he thought that the guest drivers somehow should be cha=
nged.
> >>
> >> David I'm sorry if I confused you.
> >>
> >> Again Jason, you try to propose your vDPA solution that is not what
> >> we're trying to achieve in this work. Think of a world without vDPA.
> > Well, I'd say, let's think vDPA a superset of virtio, not just the
> > acceleration technologies.
>
> I'm sorry but vDPA is not relevant to this discussion.

Well, it's you that mention the software things like VFIO first.

>
> Anyhow, I don't see any problem for vDPA driver to work on top of the
> design proposed here.
>
> >> Also I don't understand how vDPA is related to virtio specification
> >> decisions ?
> > So how is VFIO related to virtio specific decisions? That's why I
> > think we should avoid talking about software architecture here. It's
> > the wrong community.
>
> VFIO is not related to virtio spec.

Of course.

>
> It was an example for David. What is the problem with giving examples to
> ease on people to understand the solution ?

I don't think your example ease the understanding.

>
> Where did you see that the design is referring to VFIO ?
>
> >
> >>   make vDPA into virtio and then we can open a discussion.
> >>
> >> I'm interesting in virtio migration of HW devices.
> >>
> >> The proposal in this thread is actually get support from Michal AFAIU
> >> and also others were happy with. All beside of you.
> > So I think I've clairfied my several times :(
> >
> > - I'm fairly ok with the proposal
>
> It doesn't seems like that.
>
> > - but we decouple the basic facility out of the admin virtqueue and
> > this seems agreed by Michael:
> >
> > Let's take the dirty page tracking as an example:
> >
> > 1) let's first define that as one of the basic facility
> > 2) then we can introduce admin virtqueue or other stuffs as an
> > interface for that facility
> >
> > Does this work for you?
>
> What I really want is to agree that the right way to manage migration
> process of a virtio VF. My proposal is doing so by creating a
> communication channel in its parent PF.

It looks to me you never answer the question "why it must be done by PF".

All the functions provided by PF so far for software is not expected
to be used by VMM like Qemu. Those functions usually requires
capability or privileges for the management software to use. You
mentioned things like "supervisor" and "permission", but it looks to
me you are still unaware how it connect to the security stuffs.

>
> I think I got a confirmation here.
>
> This communication channel is not introduced in this thread, but
> obviously it should be an adminq.

Let me clarify. What I want to say is admin should be one of the
possible channels.

>
> For your future scalable functions, the Parent Device (lets call it PD)
> will manage the creation/migration/destruction process for its Virtual
> Devices (lets call them VDs) using the PD adminq.
>
> Agreed ?

They are two different set of functions:

- provisioning/creation/destruction: requires privilege and we don't
have any plan to expose them to the guest. It should be done via PF or
PD for security as you mentioned above.
- migration: doesn't require privilege, and it can be expose to the
guest, if can be done in either PF or VF. To me using VF is much more
natural,  but using PF is also fine.

An exception for the migration is the dirty page tracking, without DMA
isolation, we may end up with security issue if we do that in the VF.

>
> Please don't answer that this is not a "must". This is my proposal. If
> you have another proposal, please propose.

Well, you are asking for the comments instead of enforcing things right?

And it's as simple as:

1) introduce admin virtqueue, and bind migration features to admin virtqueu=
e

or

2) introduce migration features and admin virtqueue independently

What's the problem of do trivial modifications like 2)? Is that
conflict with your proposal?

>
> >
> >> We do it in mlx5 and we didn't see any issues with that design.
> >>
> > If we seperate things as I suggested, I'm totally fine.
>
> separate what ?
>
> Why should I create different interfaces for different management tasks.

I don't say you need to create different interfaces. It's for future extens=
ions:

1) When VIRTIO_F_ADMIN_VQ is negotiated, the interface is admin virtqueue
2) When other features is negotiated, the interface is other.

In order to make 2) work, we need introduce migration and admin
virtqueue separately.

Migration is not management task which doesn't require any privilege.

>
> I have a virtual/scalable device that I want to  refer to from the
> physical/parent device using some interface.
>
> This interface is adminq. This interface will be used for dirty_page
> tracking and operational state changing and get/set internal state as
> well. And more (create/destroy SF for example).
>
> You can think of this in some other way, i'm fine with it. As long as
> the final conclusion is the same.
>
> >
> >> I don't think you can say that we "go that way".
> > For "go that way" I meant the method of using vfio_virtio_pci, it has
> > nothing related to the discussion of "using PF to control VF" on the
> > spec.
>
> This was an example. Please leave it as an example for David.
>
>
> >> You're trying to build a complementary solution for creating scalable
> >> functions and for some reason trying to sabotage NVIDIA efforts to add
> >> new important functionality to virtio.
> > Well, it's a completely different topic. And it doesn't conflict with
> > anything that is proposed here by you. I think I've stated this
> > several times.  I don't think we block each other, it's just some
> > unification work if one of the proposals is merged first. I sent them
> > recently because it will be used as a material for my talk on the KVM
> > Forum which is really near.
>
> In theory you're right. We shouldn't block each other, and I don't block
> you. But for some reason I see that you do try to block my proposal and
> I don't understand why.

I don't want to block your proposal, let's decouple the migration
feature out of admin virtqueue. Then it's fine.

The problem I see is that, you tend to refuse such a trivial but
beneficial change. That's what I don't understand.

>
> I feel like I wasted 2 months on a discussion instead of progressing.

Well, I'm not sure 2 months is short, but it's usually take more than
a year for huge project in Linux.

Patience may help us to understand the points of each other better.

>
> But now I do see a progress. A PF to manage VF migration is the way to
> go forward.
>
> And the following RFC will take this into consideration.
>
> >
> >> This also sabotage the evolvment of virtio as a standard.
> >>
> >> You're trying to enforce some un-finished idea that should work on som=
e
> >> future specific HW platform instead of helping defining a good spec fo=
r
> >> virtio.
> > Let's open another thread for this if you wish, it has nothing related
> > to the spec but how it is implemented in Linux. If you search the
> > archive, something similar to "vfio_virtio_pci" has been proposed
> > several years before by Intel. The idea has been rejected, and we have
> > leveraged Linux vDPA bus for virtio-pci devices.
>
> I don't know this history. And I will happy to hear about it one day.
>
> But for our discussion in Linux, virtio_vfio_pci will happen. And it
> will implement the migration logic of a virtio device with PCI transport
> for VFs using the PF admin queue.
>
> We at NVIDIA, currently upstreaming (alongside with AlexW and Cornelia)
> a vfio-pci separation that will enable an easy creation of vfio-pci
> vendor/protocol drivers to do some specific tasks.
>
> New drivers such as mlx5_vfio_pci, hns_vfio_pci, virtio_vfio_pci and
> nvme_vfio_pci should be implemented in the near future in Linux to
> enable migration of these devices.
>
> This is just an example. And it's not related to the spec nor the
> proposal at all.

Let's move those discussions to the right list. I'm pretty sure there
will a long debate there. Please prepare for that.

>
> >
> >> And all is for having users to choose vDPA framework instead of using
> >> plain virtio.
> >>
> >> We believe in our solution and we have a working prototype. We'll
> >> continue with our discussion to convince the community with it.
> > Again, it looks like there's a lot of misunderstanding. Let's open a
> > thread on the suitable list instead of talking about any specific
> > software solution or architecture here. This will speed up things.
>
> I prefer to finish the specification first. SW arch is clear for us in
> Linux. We did it already for mlx5 devices and it will be the same for
> virtio if the spec changes will be accepted.

I disagree, but let's separate software discussion out of the spec
discussion here.

Thanks

>
> Thanks.
>
>
> >
> > Thanks
> >
> >> Thanks.
> >>
> >>> Thanks
> >>>
> >>>
> >>>> The guest is running as usual. It doesn't aware on the migration at =
all.
> >>>>
> >>>> This is the point I try to make here. I don't (and I can't) change
> >>>> even 1 line of code in the guest.
> >>>>
> >>>> e.g:
> >>>>
> >>>> QEMU ioctl --> vfio (hypervisor) --> virtio_vfio_pci on hypervisor
> >>>> (bounded to VF5) --> send admin command on PF adminq to start
> >>>> tracking dirty pages for VF5 --> PF device will do it
> >>>>
> >>>> QEMU ioctl --> vfio (hypervisor) --> virtio_vfio_pci on hypervisor
> >>>> (bounded to VF5) --> send admin command on PF adminq to quiesce VF5
> >>>> --> PF device will do it
> >>>>
> >>>> You can take a look how we implement mlx5_vfio_pci in the link I
> >>>> provided.
> >>>>
> >>>>> Dave
> >>>>>
> >>>>>
> >>>>>> We already do this in mlx5 NIC migration. The kernel is secured an=
d
> >>>>>> QEMU
> >>>>>> interface is the VF.
> >>>>>>
> >>>>>>> Dave
> >>>>>>>
> >>>>>>>>>>>>>> An example of this approach can be seen in the way NVIDIA
> >>>>>>>>>>>>>> performs
> >>>>>>>>>>>>>> live migration of a ConnectX NIC function:
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci
> >>>>>>>>>>>>>> <https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci=
>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> NVIDIAs SNAP technology enables hardware-accelerated
> >>>>>>>>>>>>>> software defined
> >>>>>>>>>>>>>> PCIe devices. virtio-blk/virtio-net/virtio-fs SNAP used fo=
r
> >>>>>>>>>>>>>> storage
> >>>>>>>>>>>>>> and networking solutions. The host OS/hypervisor uses its
> >>>>>>>>>>>>>> standard
> >>>>>>>>>>>>>> drivers that are implemented according to a well-known VIR=
TIO
> >>>>>>>>>>>>>> specifications.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> In order to implement Live Migration for these virtual
> >>>>>>>>>>>>>> function
> >>>>>>>>>>>>>> devices, that use a standard drivers as mentioned, the
> >>>>>>>>>>>>>> specification
> >>>>>>>>>>>>>> should define how HW vendor should build their devices and
> >>>>>>>>>>>>>> for SW
> >>>>>>>>>>>>>> developers to adjust the drivers.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> This will enable specification compliant vendor agnostic
> >>>>>>>>>>>>>> solution.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> This is exactly how we built the migration driver for Conn=
ectX
> >>>>>>>>>>>>>> (internal HW design doc) and I guess that this is the way
> >>>>>>>>>>>>>> other
> >>>>>>>>>>>>>> vendors work.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> For that, I would like to know if the approach of =E2=80=
=9CPF that
> >>>>>>>>>>>>>> controls
> >>>>>>>>>>>>>> the VF live migration process=E2=80=9D is acceptable by th=
e VIRTIO
> >>>>>>>>>>>>>> technical
> >>>>>>>>>>>>>> group ?
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>> I'm not sure but I think it's better to start from the gene=
ral
> >>>>>>>>>>>>> facility for all transports, then develop features for a
> >>>>>>>>>>>>> specific
> >>>>>>>>>>>>> transport.
> >>>>>>>>>>>> a general facility for all transports can be a generic admin
> >>>>>>>>>>>> queue ?
> >>>>>>>>>>> It could be a virtqueue or a transport specific method (pcie
> >>>>>>>>>>> capability).
> >>>>>>>>>> No. You said a general facility for all transports.
> >>>>>>>>> For general facility, I mean the chapter 2 of the spec which is
> >>>>>>>>> general
> >>>>>>>>>
> >>>>>>>>> "
> >>>>>>>>> 2 Basic Facilities of a Virtio Device
> >>>>>>>>> "
> >>>>>>>>>
> >>>>>>>> It will be in chapter 2. Right after "2.11 Exporting Object" I
> >>>>>>>> can add "2.12
> >>>>>>>> Admin Virtqueues" and this is what I did in the RFC.
> >>>>>>>>
> >>>>>>>>>> Transport specific is not general.
> >>>>>>>>> The transport is in charge of implementing the interface for
> >>>>>>>>> those facilities.
> >>>>>>>> Transport specific is not general.
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>>>> E.g we can define what needs to be migrated for the virtio-bl=
k
> >>>>>>>>>>> first
> >>>>>>>>>>> (the device state). Then we can define the interface to get
> >>>>>>>>>>> and set
> >>>>>>>>>>> those states via admin virtqueue. Such decoupling may ease th=
e
> >>>>>>>>>>> future
> >>>>>>>>>>> development of the transport specific migration interface.
> >>>>>>>>>> I asked a simple question here.
> >>>>>>>>>>
> >>>>>>>>>> Lets stick to this.
> >>>>>>>>> I answered this question.
> >>>>>>>> No you didn't answer.
> >>>>>>>>
> >>>>>>>> I asked  if the approach of =E2=80=9CPF that controls the VF liv=
e
> >>>>>>>> migration process=E2=80=9D
> >>>>>>>> is acceptable by the VIRTIO technical group ?
> >>>>>>>>
> >>>>>>>> And you take the discussion to your direction instead of
> >>>>>>>> answering a Yes/No
> >>>>>>>> question.
> >>>>>>>>
> >>>>>>>>>       The virtqueue could be one of the
> >>>>>>>>> approaches. And it's your responsibility to convince the commun=
ity
> >>>>>>>>> about that approach. Having an example may help people to
> >>>>>>>>> understand
> >>>>>>>>> your proposal.
> >>>>>>>>>
> >>>>>>>>>> I'm not referring to internal state definitions.
> >>>>>>>>> Without an example, how do we know if it can work well?
> >>>>>>>>>
> >>>>>>>>>> Can you please not change the subject of my initial intent in
> >>>>>>>>>> the email ?
> >>>>>>>>> Did I? Basically, I'm asking how a virtio-blk can be migrated w=
ith
> >>>>>>>>> your proposal.
> >>>>>>>> The virtio-blk PF admin queue will be used to manage the
> >>>>>>>> virtio-blk VF
> >>>>>>>> migration.
> >>>>>>>>
> >>>>>>>> This is the whole discussion. I don't want to get into resolutio=
n.
> >>>>>>>>
> >>>>>>>> Since you already know the answer as I published 4 RFCs already
> >>>>>>>> with all the
> >>>>>>>> flow.
> >>>>>>>>
> >>>>>>>> Lets stick to my question.
> >>>>>>>>
> >>>>>>>>> Thanks
> >>>>>>>>>
> >>>>>>>>>> Thanks.
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>> Thanks
> >>>>>>>>>>>
> >>>>>>>>>>>>> Thanks
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> Cheers,
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> -Max.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>> This publicly archived list offers a means to provide input
> >>>>>>>>>>>> to the
> >>>>>>>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
> >>>>>>>>>>>>
> >>>>>>>>>>>> In order to verify user consent to the Feedback License term=
s
> >>>>>>>>>>>> and
> >>>>>>>>>>>> to minimize spam in the list archive, subscription is requir=
ed
> >>>>>>>>>>>> before posting.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >>>>>>>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >>>>>>>>>>>> List help: virtio-comment-help@lists.oasis-open.org
> >>>>>>>>>>>> List archive:
> >>>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=3D04%7=
C01%7Cmgurtovoy%40nvidia.com%7Cf31455a4a77448afbf4208d963cbfaf7%7C43083d157=
27340c1b7db39efd9ccc17a%7C0%7C0%7C637650550011068512%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000=
&amp;sdata=3DZOtYROgA9trASrl6vZpAgWKqd69wSO%2FIIehl%2F%2FV9Ji0%3D&amp;reser=
ved=3D0
> >>>>>>>>>>>> Feedback License:
> >>>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fwww.oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;data=3D04=
%7C01%7Cmgurtovoy%40nvidia.com%7Cf31455a4a77448afbf4208d963cbfaf7%7C43083d1=
5727340c1b7db39efd9ccc17a%7C0%7C0%7C637650550011068512%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C10=
00&amp;sdata=3DRdR%2Bs7zilTU%2BwJii1XwwpObuMlBr0ThWy4ur0TacYYo%3D&amp;reser=
ved=3D0
> >>>>>>>>>>>> List Guidelines:
> >>>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fwww.oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists&amp;data=
=3D04%7C01%7Cmgurtovoy%40nvidia.com%7Cf31455a4a77448afbf4208d963cbfaf7%7C43=
083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637650550011068512%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C1000&amp;sdata=3Dz2bXjUR8N0unB5xCki960drEzcAOM0oM6ULLh58B%2Bw0%3D&amp;re=
served=3D0
> >>>>>>>>>>>> Committee:
> >>>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fwww.oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=3D04%7C01%7Cmg=
urtovoy%40nvidia.com%7Cf31455a4a77448afbf4208d963cbfaf7%7C43083d15727340c1b=
7db39efd9ccc17a%7C0%7C0%7C637650550011068512%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sda=
ta=3D%2BMvgIFetSa3nZiMQ9NQNwQ23nf61tfoHF%2F7ZK3%2BjtVA%3D&amp;reserved=3D0
> >>>>>>>>>>>> Join OASIS:
> >>>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fwww.oasis-open.org%2Fjoin%2F&amp;data=3D04%7C01%7Cmgurtovoy%40nvidi=
a.com%7Cf31455a4a77448afbf4208d963cbfaf7%7C43083d15727340c1b7db39efd9ccc17a=
%7C0%7C0%7C637650550011078463%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DdWHo4Wz8oQ=
9o7VZDui%2Fsdg9iQbrFi1syTJuBDULZ%2BWs%3D&amp;reserved=3D0
> >>>>>>>>>>>>
> >>>>>>>> This publicly archived list offers a means to provide input to t=
he
> >>>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
> >>>>>>>>
> >>>>>>>> In order to verify user consent to the Feedback License terms an=
d
> >>>>>>>> to minimize spam in the list archive, subscription is required
> >>>>>>>> before posting.
> >>>>>>>>
> >>>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >>>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >>>>>>>> List help: virtio-comment-help@lists.oasis-open.org
> >>>>>>>> List archive:
> >>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=3D04%7C01%=
7Cmgurtovoy%40nvidia.com%7Cf31455a4a77448afbf4208d963cbfaf7%7C43083d1572734=
0c1b7db39efd9ccc17a%7C0%7C0%7C637650550011078463%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DLMnn0oZKj%2Bf2kE9pVeC2uSfROFFSawi6MJYUHmclJb0%3D&amp;reserved=3D0
> >>>>>>>> Feedback License:
> >>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fwww.oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;data=3D04%7C0=
1%7Cmgurtovoy%40nvidia.com%7Cf31455a4a77448afbf4208d963cbfaf7%7C43083d15727=
340c1b7db39efd9ccc17a%7C0%7C0%7C637650550011078463%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;sdata=3DZ7M42HYu%2FZ%2B8JdnMo3mp%2FV%2Bwz1VHLnjQJZqum4fwY0M%3D&amp;reser=
ved=3D0
> >>>>>>>> List Guidelines:
> >>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fwww.oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists&amp;data=3D04%=
7C01%7Cmgurtovoy%40nvidia.com%7Cf31455a4a77448afbf4208d963cbfaf7%7C43083d15=
727340c1b7db39efd9ccc17a%7C0%7C0%7C637650550011078463%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;sdata=3DEv2Z09T2ADqE9oxTw%2Bj5rlhrc939Xp4vd7D5j3Sa19M%3D&amp;reserved=
=3D0
> >>>>>>>> Committee:
> >>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fwww.oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=3D04%7C01%7Cmgurto=
voy%40nvidia.com%7Cf31455a4a77448afbf4208d963cbfaf7%7C43083d15727340c1b7db3=
9efd9ccc17a%7C0%7C0%7C637650550011078463%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3Dw%2FY1e4h4QFkGQg8PQRbZKIC4FhjSYE9%2FU9l4mX7E%2Fq4%3D&amp;reserved=3D0
> >>>>>>>> Join OASIS:
> >>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fwww.oasis-open.org%2Fjoin%2F&amp;data=3D04%7C01%7Cmgurtovoy%40nvidia.co=
m%7Cf31455a4a77448afbf4208d963cbfaf7%7C43083d15727340c1b7db39efd9ccc17a%7C0=
%7C0%7C637650550011078463%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI=
joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DdWHo4Wz8oQ9o7V=
ZDui%2Fsdg9iQbrFi1syTJuBDULZ%2BWs%3D&amp;reserved=3D0
> >>>>>>>>
> >>>> This publicly archived list offers a means to provide input to the
> >>>> OASIS Virtual I/O Device (VIRTIO) TC.
> >>>>
> >>>> In order to verify user consent to the Feedback License terms and
> >>>> to minimize spam in the list archive, subscription is required
> >>>> before posting.
> >>>>
> >>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >>>> List help: virtio-comment-help@lists.oasis-open.org
> >>>> List archive:
> >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
lists.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=3D04%7C01%7Cmg=
urtovoy%40nvidia.com%7Cf31455a4a77448afbf4208d963cbfaf7%7C43083d15727340c1b=
7db39efd9ccc17a%7C0%7C0%7C637650550011078463%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sda=
ta=3DLMnn0oZKj%2Bf2kE9pVeC2uSfROFFSawi6MJYUHmclJb0%3D&amp;reserved=3D0
> >>>> Feedback License:
> >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
www.oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;data=3D04%7C01%7C=
mgurtovoy%40nvidia.com%7Cf31455a4a77448afbf4208d963cbfaf7%7C43083d15727340c=
1b7db39efd9ccc17a%7C0%7C0%7C637650550011078463%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DZ7M42HYu%2FZ%2B8JdnMo3mp%2FV%2Bwz1VHLnjQJZqum4fwY0M%3D&amp;reserved=
=3D0
> >>>> List Guidelines:
> >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
www.oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists&amp;data=3D04%7C01=
%7Cmgurtovoy%40nvidia.com%7Cf31455a4a77448afbf4208d963cbfaf7%7C43083d157273=
40c1b7db39efd9ccc17a%7C0%7C0%7C637650550011078463%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DEv2Z09T2ADqE9oxTw%2Bj5rlhrc939Xp4vd7D5j3Sa19M%3D&amp;reserved=3D0
> >>>> Committee:
> >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
www.oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=3D04%7C01%7Cmgurtovoy%=
40nvidia.com%7Cf31455a4a77448afbf4208d963cbfaf7%7C43083d15727340c1b7db39efd=
9ccc17a%7C0%7C0%7C637650550011078463%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dw%2=
FY1e4h4QFkGQg8PQRbZKIC4FhjSYE9%2FU9l4mX7E%2Fq4%3D&amp;reserved=3D0
> >>>> Join OASIS:
> >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
www.oasis-open.org%2Fjoin%2F&amp;data=3D04%7C01%7Cmgurtovoy%40nvidia.com%7C=
f31455a4a77448afbf4208d963cbfaf7%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0=
%7C637650550011078463%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV=
2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DdWHo4Wz8oQ9o7VZDui=
%2Fsdg9iQbrFi1syTJuBDULZ%2BWs%3D&amp;reserved=3D0
> >>>>
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
> >> List archive: https://nam11.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.oasis-open.org%2Farchives%2Fvirtio-comment%2F&amp;data=3D=
04%7C01%7Cmgurtovoy%40nvidia.com%7Cf31455a4a77448afbf4208d963cbfaf7%7C43083=
d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637650550011078463%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
1000&amp;sdata=3DLMnn0oZKj%2Bf2kE9pVeC2uSfROFFSawi6MJYUHmclJb0%3D&amp;reser=
ved=3D0
> >> Feedback License: https://nam11.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fwww.oasis-open.org%2Fwho%2Fipr%2Ffeedback_license.pdf&amp;=
data=3D04%7C01%7Cmgurtovoy%40nvidia.com%7Cf31455a4a77448afbf4208d963cbfaf7%=
7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637650550011078463%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C1000&amp;sdata=3DZ7M42HYu%2FZ%2B8JdnMo3mp%2FV%2Bwz1VHLnjQJZqum4fwY0M=
%3D&amp;reserved=3D0
> >> List Guidelines: https://nam11.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fwww.oasis-open.org%2Fpolicies-guidelines%2Fmailing-lists&a=
mp;data=3D04%7C01%7Cmgurtovoy%40nvidia.com%7Cf31455a4a77448afbf4208d963cbfa=
f7%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637650550011078463%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C1000&amp;sdata=3DEv2Z09T2ADqE9oxTw%2Bj5rlhrc939Xp4vd7D5j3Sa19M%3D=
&amp;reserved=3D0
> >> Committee: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fwww.oasis-open.org%2Fcommittees%2Fvirtio%2F&amp;data=3D04%7C01%7Cm=
gurtovoy%40nvidia.com%7Cf31455a4a77448afbf4208d963cbfaf7%7C43083d15727340c1=
b7db39efd9ccc17a%7C0%7C0%7C637650550011078463%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd=
ata=3Dw%2FY1e4h4QFkGQg8PQRbZKIC4FhjSYE9%2FU9l4mX7E%2Fq4%3D&amp;reserved=3D0
> >> Join OASIS: https://nam11.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fwww.oasis-open.org%2Fjoin%2F&amp;data=3D04%7C01%7Cmgurtovoy%40nvi=
dia.com%7Cf31455a4a77448afbf4208d963cbfaf7%7C43083d15727340c1b7db39efd9ccc1=
7a%7C0%7C0%7C637650550011078463%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DdWHo4Wz8=
oQ9o7VZDui%2Fsdg9iQbrFi1syTJuBDULZ%2BWs%3D&amp;reserved=3D0
> >>
>

