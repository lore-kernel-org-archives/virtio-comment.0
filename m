Return-Path: <pankaj.gupta@ionos.com>
MIME-Version: 1.0
References: <20210721205939.20746-1-tstark@linux.microsoft.com> <87mtqe7g7z.fsf@redhat.com>
In-Reply-To: <87mtqe7g7z.fsf@redhat.com>
From: Pankaj Gupta <pankaj.gupta@ionos.com>
Date: Thu, 22 Jul 2021 13:30:30 +0200
Message-ID: <CALzYo309tuJLLhVGdGc6RxOgQr5Y_ZtEsS=xG9Uu8G5_b42S7Q@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH 0/1] virtio-pmem: Support PCI
 BAR-relative addresses
Content-Type: text/plain; charset="UTF-8"
To: Cornelia Huck <cohuck@redhat.com>
Cc: Taylor Stark <tstark@linux.microsoft.com>, virtio-comment@lists.oasis-open.org, grahamwo@microsoft.com, benhill@microsoft.com, "Michael S . Tsirkin" <mst@redhat.com>, Taylor Stark <tstark@microsoft.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi Cornelia,

> > This patch updates the virtio-pmem spec to add support for describing the pmem
> > region via PCI BARs. This is required to support virtio-pmem in Hyper-V, since
> > Hyper-V only allows PCI devices to operate on memory ranges defined via BARs.
> >
> > As virtio-pmem hasn't been added to the virtio spec yet (see this issue [1]),
> > this patch is based off the RFC spec [2]. The linux driver implementation has
> > been posted at [3].
>
> What's the general status of the pmem spec? I had pinged in the issue,
> but I have not seen any progress.

Appologies for missing your ping (As I was down for some time). I will
try to post the
virtio-pmem spec new version in coming week.

Thanks,
Pankaj

