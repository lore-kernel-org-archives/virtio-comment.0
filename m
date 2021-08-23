Return-Path: <jasowang@redhat.com>
MIME-Version: 1.0
References: <cc7e769a-fee6-2940-74a7-03dbc98a109f@nvidia.com>
 <CACGkMEuAo84oGL6saMTFaS7yzsihuNUWVK4AkVtctT80Opc8Zg@mail.gmail.com>
 <c97bcfbf-81c6-c70c-a943-7f72b0d94d71@nvidia.com> <CACGkMEvxxsnEZYCok-xPLnKzJM=501M3erkZ-EDegOFD9YfQdg@mail.gmail.com>
 <5eb7d5b4-a715-5ef2-81f7-9721d865d6ac@nvidia.com> <5b4db3ac-0291-69ea-7e82-5b3f19049e61@redhat.com>
 <20210819104216-mutt-send-email-mst@kernel.org> <af402bd0-f6b1-811a-08da-7e3b23be6c05@redhat.com>
 <20210820023540-mutt-send-email-mst@kernel.org> <CACGkMEu10RY5BT2wXLRSVm1=sx3GMjzqJ7GYnHjf3pj9Pz+cuQ@mail.gmail.com>
 <20210820065144-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210820065144-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 23 Aug 2021 11:20:53 +0800
Message-ID: <CACGkMEta19ZkJ_zcmH5np5hjTrfE8Rdufts+FUywhpzc882vYQ@mail.gmail.com>
Subject: Re: [virtio-comment] Live Migration of Virtio Virtual Function
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com" <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>, Shahaf Shuler <shahafs@nvidia.com>, Ariel Adam <aadam@redhat.com>, Amnon Ilan <ailan@redhat.com>, Bodong Wang <bodong@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, Liran Liss <liranl@nvidia.com>, Oren Duer <oren@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Aug 20, 2021 at 7:06 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Aug 20, 2021 at 03:49:55PM +0800, Jason Wang wrote:
> > On Fri, Aug 20, 2021 at 3:04 PM Michael S. Tsirkin <mst@redhat.com> wro=
te:
> > >
> > > On Fri, Aug 20, 2021 at 10:17:05AM +0800, Jason Wang wrote:
> > > >
> > > > =E5=9C=A8 2021/8/19 =E4=B8=8B=E5=8D=8810:58, Michael S. Tsirkin =E5=
=86=99=E9=81=93:
> > > > > On Thu, Aug 19, 2021 at 10:44:46AM +0800, Jason Wang wrote:
> > > > > > > The PF device will have an option to quiesce/freeze the VF de=
vice.
> > > > > >
> > > > > > Is such design a must? If no, why not simply introduce those fu=
nctions in
> > > > > > the VF?
> > > > > Many IOMMUs only support protections at the function level.
> > > > > Thus we need ability to have one device (e.g. a PF)
> > > > > to control migration of another (e.g. a VF).
> > > >
> > > >
> > > > So as discussed previously, the only possible "advantage" is that t=
he DMA is
> > > > isolated.
> > > >
> > > >
> > > > > This is because allowing VF to access hypervisor memory used for
> > > > > migration is not a good idea.
> > > > > For IOMMUs that support subfunctions, these "devices" could be
> > > > > subfunctions.
> > > > >
> > > > > The only alternative is to keep things in device memory which
> > > > > does not need an IOMMU.
> > > > > I guess we'd end up with something like a VQ in device memory whi=
ch might
> > > > > be tricky from multiple points of view, but yes, this could be
> > > > > useful and people did ask for such a capability in the past.
> > > >
> > > >
> > > > I assume the spec already support this. We probably need some clari=
fication
> > > > at the transport layer. But it's as simple as setting MMIO are as v=
irtqueue
> > > > address?
> > >
> > > Several issues
> > > - we do not support changing VQ address. Devices do need to support
> > >   changing memory addresses.
> >
> > So it looks like a transport specific requirement (PCI-E) instead of a
> > general issue.
> >
> > > - Ordering becomes tricky especially .
> > >   E.g. when device reads descriptor in VQ
> > >   memory it suddenly does not flush out writes into buffer
> > >   that is potentially in RAM. We might also need even stronger
> > >   barriers on the driver side. We used dma_wmb but now it's
> > >   probably need to be wmb.
> > >   Reading multibyte structures from device memory is slow.
> > >   To get reasonable performance we might need to mark this device mem=
ory
> > >   WB or WC. That generally makes things even trickier.
> >
> > I agree, but still they are all transport specific requirements. If we
> > do that in a PCI-E BAR, the driver must obey the ordering rule for PCI
> > to make it work.
> > >
> > >
> > > > Except for the dirty bit tracking, we don't have bulk data that nee=
ds to be
> > > > transferred during migration. So a virtqueue is not must even in th=
is case.
> > >
> > > Main traffic is write tracking.
> >
> > Right.
> >
> > >
> > >
> > > >
> > > > >
> > > > > > If yes, what's the reason for making virtio different (e.g VCPU=
 live
> > > > > > migration is not designed like that)?
> > > > > I think the main difference is we need PF's help for memory
> > > > > tracking for pre-copy migration anyway.
> > > >
> > > >
> > > > Such kind of memory tracking is not a must. KVM uses software assis=
ted
> > > > technologies (write protection) and it works very well.
> > >
> > > So page-fault support is absolutely a viable option IMHO.
> > > To work well we need VIRTIO_F_PARTIAL_ORDER - there was not
> > > a lot of excitement but sure I will finalize and repost it.
> >
> > As discussed before, it looks like a performance optimization but not a=
 must?
> >
> > I guess we don't do that for KVM and it works well.
>
> Depends on type of device. For networking it's a problem because it is
> driven by outside events so it keeps going leading to packet drops which
> is a quality of implementation issue, not an optimization.

So it looks to me it's a factor of how device page faults perform. E.g
we may suffer from packet drops during live migration when KVM is
logger dirty pages as well.

> Same thing with e.g. audio I suspect. Maybe graphics.

I wonder even with this, it may not work for those real time tasks.

> For KVM and
> e.g. storage it's more of a performance issue.
>
>
> > >
> > >
> > > However we need support for reporting and handling faults.
> > > Again this is data path stuff and needs to be under
> > > hypervisor control so I guess we get right back
> > > to having this in the PF?
> >
> > So it depends on whether it requires a DMA. If it's just something
> > like a CR2 register, we don't need PF.
>
> We won't strictly need it but it is a well understood model,
> working well with e.g. vfio. It makes sense to support it.
>
> > >
> > >
> > >
> > >
> > >
> > > > For virtio,
> > > > technology like shadow virtqueue has been used by DPDK and prototyp=
ed by
> > > > Eugenio.
> > >
> > > That's ok but I think since it affects performance at 100% of the
> > > time when active we can not rely on this as the only solution.
> >
> > This part I don't understand:
> >
> > - KVM writes protect the pages, so it loses performance as well.
> > - If we are using virtqueue for reporting dirty bitmap, it can easily
> > run out of space and we will lose the performance as well
> > - If we are using bitmap/bytemap, we may also losing the performance
> > (e.g the huge footprint) or at PCI level
> >
> > So I'm not against the idea, what I think makes more sense is not
> > limit the facilities like device states, dirty page tracking to the
> > PF.
>
> It could be a cross-device facility that can support PF but
> also other forms of communication, yes.

That's my understanding as well.

>
>
> > >
> > >
> > > > Even if we want to go with hardware technology, we have many altern=
atives
> > > > (as we've discussed in the past):
> > > >
> > > > 1) IOMMU dirty bit (E.g modern IOMMU have EA bit for logging extern=
al device
> > > > write)
> > > > 2) Write protection via IOMMU or device MMU
> > > > 3) Address space ID for isolating DMAs
> > >
> > > Not all systems support any of the above unfortunately.
> > >
> >
> > Yes. But we know the platform (AMD/Intel/ARM) will be ready soon for
> > them in the near future.
>
> know and future in the same sentence make an oxymoron ;)
>
> > > Also some systems might have a limited # of PASIDs.
> > > So burning up a extra PASID per VF halving their
> > > number might not be great as the only option.
> >
> > Yes, so I think we agree that we should not limit the spec to work on
> > a specific configuration (e.g the device with PF).
>
> That makes sense to me.
>
> > >
> > >
> > > >
> > > > Using physical function is sub-optimal that all of the above since:
> > > >
> > > > 1) limited to a specific transport or implementation and it doesn't=
 work for
> > > > device or transport without PF
> > > > 2) the virtio level function is not self contained, this makes any =
feature
> > > > that ties to PF impossible to be used in the nested layer
> > > > 3) more complicated than leveraging the existing facilities provide=
d by the
> > > > platform or transport
> > >
> > > I think I disagree with 2 and 3 above simply because controlling VFs =
through
> > > a PF is how all other devices did this.
> >
> > For management and provision yes. For other features, the answer is
> > not. This is simply because most hardware vendors don't consider
> > whether or not a feature could be virtualized. That's fine for them
> > but not us. E.g if we limit the feature A to PF. It means feature A
> > can't be used by guests. My understanding is that we'd better not
> > introduce a feature that is hard to be virtualized.
>
> I'm not sure what do you mean when you say management but I guess
> at least stuff that ip link does normally:
>
>
>                [ vf NUM [ mac LLADDR ]
>                         [ VFVLAN-LIST ]
>                         [ rate TXRATE ]
>                         [ max_tx_rate TXRATE ]
>                         [ min_tx_rate TXRATE ]
>                         [ spoofchk { on | off } ]
>                         [ query_rss { on | off } ]
>                         [ state { auto | enable | disable } ]
>                         [ trust { on | off } ]
>                         [ node_guid eui64 ]
>                         [ port_guid eui64 ] ]
>
>
> is fair game ...

That's the example of the management tasks:

1) is not expected or exposed for the guest
2) requires capabilities (CAP_NET_ADMIN) for security
3) won't be used by Qemu

But live migration seems different

1) it can be exposed for the guest for nested live migration
2) doesn't require capabilities, no security concern
3) will be used by Qemu


>
> > > About 1 - well this is
> > > just about us being smart and writing this in a way that is
> > > generic enough, right?
> >
> > That's exactly my question and my point, I know it can be done in the
> > PF. What I'm asking is "why it must be in the PF".
> >
> > And I'm trying to convince Max to introduce those features as "basic
> > device facilities" instead of doing that in the "admin virtqueue" or
> > other stuff that belongs to PF.
>
> Let's say it's not in a PF, I think it needs some way to be separate so
> we don't need lots of logic in the hypervisor to handle that.

We don't need a lot I think:

1) stop/freeze the device
2) device state set and get

> So from that POV admin queue is ok. In fact
> from my POV admin queue is suffering in that it does not focus on cross
> device communication enough, not that it's doing that too much.

Ok.

>
> > > E.g. include options for PASIDs too.
> > >
> > > Note that support for cross-device addressing is useful
> > > even outside of migration.  We also have things like
> > > priority where it is useful to adjust properties of
> > > a VF on the fly while it is active. Again the normal way
> > > all devices do this is through a PF. Yes a bunch of tricks
> > > in QEMU is possible but having a driver in host kernel
> > > and just handle it in a contained way is way cleaner.
> > >
> > >
> > > > Consider (P)ASID will be ready very soon, workaround the platform l=
imitation
> > > > via PF is not a good idea for me. Especially consider it's not a mu=
st and we
> > > > had already prototype the software assisted technology.
> > >
> > > Well PASID is just one technology.
> >
> > Yes, devices are allowed to have their own function to isolate DMA. I
> > mentioned PASID just because it is the most popular technology.
> >
> > >
> > >
> > > >
> > > > >   Might as well integrate
> > > > > the rest of state in the same channel.
> > > >
> > > >
> > > > That's another question. I think for the function that is a must fo=
r doing
> > > > live migration, introducing them in the function itself is the most=
 natural
> > > > way since we did all the other facilities there. This ease the func=
tion that
> > > > can be used in the nested layer.
> > > >
> > > > And using the channel in the PF is not coming for free. It requires
> > > > synchronization in the software or even QOS.
> > > >
> > > > Or we can just separate the dirty page tracking into PF (but need t=
o define
> > > > them as basic facility for future extension).
> > >
> > > Well maybe just start focusing on write tracking, sure.
> > > Once there's a proposal for this we can see whether
> > > adding other state there is easier or harder.
> >
> > Fine with me.
> >
> > >
> > >
> > > >
> > > > >
> > > > > Another answer is that CPUs trivially switch between
> > > > > functions by switching the active page tables. For PCI DMA
> > > > > it is all much trickier sine the page tables can be separate
> > > > > from the device, and assumed to be mostly static.
> > > >
> > > >
> > > > I don't see much different, the page table is also separated from t=
he CPU.
> > > > If the device supports state save and restore we can scheduling the=
 multiple
> > > > VMs/VCPUs on the same device.
> > >
> > > It's just that performance is terrible. If you keep losing packets
> > > migration might as well not be live.
> >
> > I don't measure the performance. But I believe the shadow virtqueue
> > should perform better than kernel vhost-net backends.
> >
> > If it's not, we can switch to vhost-net if necessary and we know it
> > works well for the live migration.
>
> Well but not as fast as hardware offloads with faults would be,
> which can potentially go full speed as long as you are lucky
> and do not hit too many faults.

Yes, but for live migration, I agree that we need better performance,
but if we go full speed, that may break the convergence.

Anyhow, we can see how well shadow virtqueue performs.

>
> > >
> > > >
> > > > > So if you want to create something like the VMCS then
> > > > > again you either need some help from another device or
> > > > > put it in device memory.
> > > >
> > > >
> > > > For CPU virtualization, the states could be saved and restored via =
MSRs. For
> > > > virtio, accessing them via registers is also possible and much more=
 simple.
> > > >
> > > > Thanks
> > >
> > > IMy guess is performance is going to be bad. MSRs are part of the
> > > same CPU that is executing the accesses....
> >
> > I'm not sure but it's how current VMX or SVM did.
> >
> > Thanks
>
> Yes but again. moving state of the CPU around is faster than
> pulling it across the PCI-E bus.

Right.

Thanks

>
> > >
> > > >
> > > > >
> > > > >
> > >
>

