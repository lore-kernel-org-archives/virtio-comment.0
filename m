Return-Path: <pankaj.gupta.linux@gmail.com>
MIME-Version: 1.0
References: <20210728145502.264171-1-pankaj.gupta.linux@gmail.com> <CAPcyv4hUgVDDqfciy_+xc6umXdWxoWr_appkSHTFSQY3WqhaJw@mail.gmail.com>
In-Reply-To: <CAPcyv4hUgVDDqfciy_+xc6umXdWxoWr_appkSHTFSQY3WqhaJw@mail.gmail.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 25 Aug 2021 09:52:43 +0200
Message-ID: <CAM9Jb+jJEuwYekfV2HeZnoFB2QxgjA=20NKtRn_5UhY7i0jR-w@mail.gmail.com>
Subject: Re: [PATCH] virtio-pmem: PMEM device spec
Content-Type: text/plain; charset="UTF-8"
To: Dan Williams <dan.j.williams@intel.com>
Cc: virtio-comment@lists.oasis-open.org, David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Taylor Stark <tstark@linux.microsoft.com>, Pankaj Gupta <pankaj.gupta@ionos.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi Dan,

> >
> > Posting virtio specification for virtio pmem device. Virtio pmem is a
> > paravirtualized device which allows the guest to bypass page cache.
> > Virtio pmem kernel driver is merged in Upstream Kernel 5.3. Also, Qemu
> > device is merged in Qemu 4.1.
> >
>
> Is there still time to adjust this?
>
> I notice that this document reiterates concepts that are described in
> the PMEM programming model definition:
>
> https://www.snia.org/sites/default/files/technical_work/final/NVMProgrammingModel_v1.2.pdf
>
> ...specifically that virtio-pmem explicitly disables
> NVM.PM.OPTIMIZED_FLUSH and forces NVM.PM.FILE.SYNC. Then this document
> can describe what happens on the backend to convey the sync operation
> from the VM to the VMM.

Thanks for having a look. I am currently removing(mostly removed) the
implementation details from
the proposed spec and only keeping device and driver interfaces and
their communication structures as per
the feedback from the VIRTIO committee.

Good to know the above document covers guest FLUSH usability details
which also applies to virtio-pmem.

Best regards,
Pankaj

