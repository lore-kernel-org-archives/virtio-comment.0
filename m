Return-Path: <jasowang@redhat.com>
MIME-Version: 1.0
References: <DM4PR12MB504062CEF6BEDABE6F76DEC2DEF99@DM4PR12MB5040.namprd12.prod.outlook.com>
 <62bd1c8d-c56e-fc98-f833-61d9c999f814@redhat.com> <cc7e769a-fee6-2940-74a7-03dbc98a109f@nvidia.com>
In-Reply-To: <cc7e769a-fee6-2940-74a7-03dbc98a109f@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 17 Aug 2021 17:44:17 +0800
Message-ID: <CACGkMEuAo84oGL6saMTFaS7yzsihuNUWVK4AkVtctT80Opc8Zg@mail.gmail.com>
Subject: Re: [virtio-comment] Live Migration of Virtio Virtual Function
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>, Shahaf Shuler <shahafs@nvidia.com>, Ariel Adam <aadam@redhat.com>, Amnon Ilan <ailan@redhat.com>, Bodong Wang <bodong@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, Liran Liss <liranl@nvidia.com>, Oren Duer <oren@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Aug 17, 2021 at 5:11 PM Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>
>
> On 8/17/2021 11:51 AM, Jason Wang wrote:
> >
> > =E5=9C=A8 2021/8/12 =E4=B8=8B=E5=8D=888:08, Max Gurtovoy =E5=86=99=E9=
=81=93:
> >>
> >> Hi all,
> >>
> >> Live migration is one of the most important features of
> >> virtualization and virtio devices are oftenly found in virtual
> >> environments.
> >>
> >> The migration process is managed by a migration SW that is running on
> >> the hypervisor and the VM is not aware of the process at all.
> >>
> >> Unlike the vDPA case, a real pci Virtual Function state resides in
> >> the HW.
> >>
> >
> > vDPA doesn't prevent you from having HW states. Actually from the view
> > of the VMM(Qemu), it doesn't care whether or not a state is stored in
> > the software or hardware. A well designed VMM should be able to hide
> > the virtio device implementation from the migration layer, that is how
> > Qemu is wrote who doesn't care about whether or not it's a software
> > virtio/vDPA device or not.
> >
> >
> >> In our vision, in order to fulfil the Live migration requirements for
> >> virtual functions, each physical function device must implement
> >> migration operations. Using these operations, it will be able to
> >> master the migration process for the virtual function devices. Each
> >> capable physical function device has a supervisor permissions to
> >> change the virtual function operational states, save/restore its
> >> internal state and start/stop dirty pages tracking.
> >>
> >
> > For "supervisor permissions", is this from the software point of view?
> > Maybe it's better to give an example for this.
>
> A permission to a PF device for quiesce and freeze a VF device for exampl=
e.

Note that for safety, VMM (e.g Qemu) is usually running without any privile=
ges.

>
> >
> >
> >> An example of this approach can be seen in the way NVIDIA performs
> >> live migration of a ConnectX NIC function:
> >>
> >> https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci
> >> <https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci>
> >>
> >> NVIDIAs SNAP technology enables hardware-accelerated software defined
> >> PCIe devices. virtio-blk/virtio-net/virtio-fs SNAP used for storage
> >> and networking solutions. The host OS/hypervisor uses its standard
> >> drivers that are implemented according to a well-known VIRTIO
> >> specifications.
> >>
> >> In order to implement Live Migration for these virtual function
> >> devices, that use a standard drivers as mentioned, the specification
> >> should define how HW vendor should build their devices and for SW
> >> developers to adjust the drivers.
> >>
> >> This will enable specification compliant vendor agnostic solution.
> >>
> >> This is exactly how we built the migration driver for ConnectX
> >> (internal HW design doc) and I guess that this is the way other
> >> vendors work.
> >>
> >> For that, I would like to know if the approach of =E2=80=9CPF that con=
trols
> >> the VF live migration process=E2=80=9D is acceptable by the VIRTIO tec=
hnical
> >> group ?
> >>
> >
> > I'm not sure but I think it's better to start from the general
> > facility for all transports, then develop features for a specific
> > transport.
>
> a general facility for all transports can be a generic admin queue ?

It could be a virtqueue or a transport specific method (pcie capability).

E.g we can define what needs to be migrated for the virtio-blk first
(the device state). Then we can define the interface to get and set
those states via admin virtqueue. Such decoupling may ease the future
development of the transport specific migration interface.

Thanks

>
>
> >
> > Thanks
> >
> >
> >> Cheers,
> >>
> >> -Max.
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

