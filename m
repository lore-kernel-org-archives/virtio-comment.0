Return-Path: <dgilbert@redhat.com>
Date: Mon, 23 Aug 2021 13:08:47 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [virtio-comment] Live Migration of Virtio Virtual Function
Message-ID: <YSOPz0YQSc7AZDa6@work-vm>
References: <DM4PR12MB504062CEF6BEDABE6F76DEC2DEF99@DM4PR12MB5040.namprd12.prod.outlook.com>
 <62bd1c8d-c56e-fc98-f833-61d9c999f814@redhat.com>
 <cc7e769a-fee6-2940-74a7-03dbc98a109f@nvidia.com>
 <CACGkMEuAo84oGL6saMTFaS7yzsihuNUWVK4AkVtctT80Opc8Zg@mail.gmail.com>
 <c97bcfbf-81c6-c70c-a943-7f72b0d94d71@nvidia.com>
 <CACGkMEvxxsnEZYCok-xPLnKzJM=501M3erkZ-EDegOFD9YfQdg@mail.gmail.com>
 <5eb7d5b4-a715-5ef2-81f7-9721d865d6ac@nvidia.com>
 <5b4db3ac-0291-69ea-7e82-5b3f19049e61@redhat.com>
 <20210819104216-mutt-send-email-mst@kernel.org>
 <af402bd0-f6b1-811a-08da-7e3b23be6c05@redhat.com>
MIME-Version: 1.0
In-Reply-To: <af402bd0-f6b1-811a-08da-7e3b23be6c05@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com" <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>, Shahaf Shuler <shahafs@nvidia.com>, Ariel Adam <aadam@redhat.com>, Amnon Ilan <ailan@redhat.com>, Bodong Wang <bodong@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, Liran Liss <liranl@nvidia.com>, Oren Duer <oren@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

* Jason Wang (jasowang@redhat.com) wrote:
> 
> 在 2021/8/19 下午10:58, Michael S. Tsirkin 写道:
> > On Thu, Aug 19, 2021 at 10:44:46AM +0800, Jason Wang wrote:
> > > > The PF device will have an option to quiesce/freeze the VF device.
> > > 
> > > Is such design a must? If no, why not simply introduce those functions in
> > > the VF?
> > Many IOMMUs only support protections at the function level.
> > Thus we need ability to have one device (e.g. a PF)
> > to control migration of another (e.g. a VF).
> 
> 
> So as discussed previously, the only possible "advantage" is that the DMA is
> isolated.
> 
> 
> > This is because allowing VF to access hypervisor memory used for
> > migration is not a good idea.
> > For IOMMUs that support subfunctions, these "devices" could be
> > subfunctions.
> > 
> > The only alternative is to keep things in device memory which
> > does not need an IOMMU.
> > I guess we'd end up with something like a VQ in device memory which might
> > be tricky from multiple points of view, but yes, this could be
> > useful and people did ask for such a capability in the past.
> 
> 
> I assume the spec already support this. We probably need some clarification
> at the transport layer. But it's as simple as setting MMIO are as virtqueue
> address?
> 
> Except for the dirty bit tracking, we don't have bulk data that needs to be
> transferred during migration. So a virtqueue is not must even in this case.
> 
> 
> > 
> > > If yes, what's the reason for making virtio different (e.g VCPU live
> > > migration is not designed like that)?
> > I think the main difference is we need PF's help for memory
> > tracking for pre-copy migration anyway.
> 
> 
> Such kind of memory tracking is not a must. KVM uses software assisted
> technologies (write protection) and it works very well. For virtio,
> technology like shadow virtqueue has been used by DPDK and prototyped by
> Eugenio.
> 
> Even if we want to go with hardware technology, we have many alternatives
> (as we've discussed in the past):
> 
> 1) IOMMU dirty bit (E.g modern IOMMU have EA bit for logging external device
> write)
> 2) Write protection via IOMMU or device MMU
> 3) Address space ID for isolating DMAs

What's the state of those - last time I chatted to anyone about IOMMUs
doing protection, things were at the 'in the future' stage.

Dave

> Using physical function is sub-optimal that all of the above since:
> 
> 1) limited to a specific transport or implementation and it doesn't work for
> device or transport without PF
> 2) the virtio level function is not self contained, this makes any feature
> that ties to PF impossible to be used in the nested layer
> 3) more complicated than leveraging the existing facilities provided by the
> platform or transport
> 
> Consider (P)ASID will be ready very soon, workaround the platform limitation
> via PF is not a good idea for me. Especially consider it's not a must and we
> had already prototype the software assisted technology.
> 
> 
> >   Might as well integrate
> > the rest of state in the same channel.
> 
> 
> That's another question. I think for the function that is a must for doing
> live migration, introducing them in the function itself is the most natural
> way since we did all the other facilities there. This ease the function that
> can be used in the nested layer.
> 
> And using the channel in the PF is not coming for free. It requires
> synchronization in the software or even QOS.
> 
> Or we can just separate the dirty page tracking into PF (but need to define
> them as basic facility for future extension).
> 
> 
> > 
> > Another answer is that CPUs trivially switch between
> > functions by switching the active page tables. For PCI DMA
> > it is all much trickier sine the page tables can be separate
> > from the device, and assumed to be mostly static.
> 
> 
> I don't see much different, the page table is also separated from the CPU.
> If the device supports state save and restore we can scheduling the multiple
> VMs/VCPUs on the same device.
> 
> 
> > So if you want to create something like the VMCS then
> > again you either need some help from another device or
> > put it in device memory.
> 
> 
> For CPU virtualization, the states could be saved and restored via MSRs. For
> virtio, accessing them via registers is also possible and much more simple.
> 
> Thanks
> 
> 
> > 
> > 
> 
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
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

