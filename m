Return-Path: <dan.j.williams@intel.com>
MIME-Version: 1.0
References: <20210728145502.264171-1-pankaj.gupta.linux@gmail.com>
In-Reply-To: <20210728145502.264171-1-pankaj.gupta.linux@gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 24 Aug 2021 19:40:31 -0700
Message-ID: <CAPcyv4hUgVDDqfciy_+xc6umXdWxoWr_appkSHTFSQY3WqhaJw@mail.gmail.com>
Subject: Re: [PATCH] virtio-pmem: PMEM device spec
Content-Type: text/plain; charset="UTF-8"
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: virtio-comment@lists.oasis-open.org, David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Taylor Stark <tstark@linux.microsoft.com>, Pankaj Gupta <pankaj.gupta@ionos.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Jul 28, 2021 at 7:55 AM Pankaj Gupta
<pankaj.gupta.linux@gmail.com> wrote:
>
> Posting virtio specification for virtio pmem device. Virtio pmem is a
> paravirtualized device which allows the guest to bypass page cache.
> Virtio pmem kernel driver is merged in Upstream Kernel 5.3. Also, Qemu
> device is merged in Qemu 4.1.
>

Is there still time to adjust this?

I notice that this document reiterates concepts that are described in
the PMEM programming model definition:

https://www.snia.org/sites/default/files/technical_work/final/NVMProgrammingModel_v1.2.pdf

...specifically that virtio-pmem explicitly disables
NVM.PM.OPTIMIZED_FLUSH and forces NVM.PM.FILE.SYNC. Then this document
can describe what happens on the backend to convey the sync operation
from the VM to the VMM.

