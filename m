Return-Path: <mst@redhat.com>
Date: Thu, 19 Aug 2021 10:58:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [virtio-comment] Live Migration of Virtio Virtual Function
Message-ID: <20210819104216-mutt-send-email-mst@kernel.org>
References: <DM4PR12MB504062CEF6BEDABE6F76DEC2DEF99@DM4PR12MB5040.namprd12.prod.outlook.com>
 <62bd1c8d-c56e-fc98-f833-61d9c999f814@redhat.com>
 <cc7e769a-fee6-2940-74a7-03dbc98a109f@nvidia.com>
 <CACGkMEuAo84oGL6saMTFaS7yzsihuNUWVK4AkVtctT80Opc8Zg@mail.gmail.com>
 <c97bcfbf-81c6-c70c-a943-7f72b0d94d71@nvidia.com>
 <CACGkMEvxxsnEZYCok-xPLnKzJM=501M3erkZ-EDegOFD9YfQdg@mail.gmail.com>
 <5eb7d5b4-a715-5ef2-81f7-9721d865d6ac@nvidia.com>
 <5b4db3ac-0291-69ea-7e82-5b3f19049e61@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5b4db3ac-0291-69ea-7e82-5b3f19049e61@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com" <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>, Shahaf Shuler <shahafs@nvidia.com>, Ariel Adam <aadam@redhat.com>, Amnon Ilan <ailan@redhat.com>, Bodong Wang <bodong@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, Liran Liss <liranl@nvidia.com>, Oren Duer <oren@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Aug 19, 2021 at 10:44:46AM +0800, Jason Wang wrote:
> > 
> > The PF device will have an option to quiesce/freeze the VF device.
> 
> 
> Is such design a must? If no, why not simply introduce those functions in
> the VF?

Many IOMMUs only support protections at the function level.
Thus we need ability to have one device (e.g. a PF)
to control migration of another (e.g. a VF).
This is because allowing VF to access hypervisor memory used for
migration is not a good idea. 
For IOMMUs that support subfunctions, these "devices" could be
subfunctions.

The only alternative is to keep things in device memory which
does not need an IOMMU.
I guess we'd end up with something like a VQ in device memory which might
be tricky from multiple points of view, but yes, this could be
useful and people did ask for such a capability in the past.

> If yes, what's the reason for making virtio different (e.g VCPU live
> migration is not designed like that)?

I think the main difference is we need PF's help for memory
tracking for pre-copy migration anyway. Might as well integrate
the rest of state in the same channel.

Another answer is that CPUs trivially switch between
functions by switching the active page tables. For PCI DMA
it is all much trickier sine the page tables can be separate
from the device, and assumed to be mostly static.
So if you want to create something like the VMCS then
again you either need some help from another device or
put it in device memory.


-- 
MST

