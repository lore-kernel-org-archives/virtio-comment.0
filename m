Return-Path: virtio-comment-return-1201-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8D440985528
	for <virtio-comment@lists.oasis-open.org>; Thu, 30 Apr 2020 00:57:11 +0000 (UTC)
MIME-Version: 1.0
References: <20200422005531.15085-1-gurchetansingh@chromium.org>
 <20200422005531.15085-2-gurchetansingh@chromium.org> <20200428102922.ptoppskbs7xhube7@sirius.home.kraxel.org>
 <CAAfnVBneVgQQkGu6H_B6NGkUrEC7QD0o91vzUDTQ1=kyS_tKbw@mail.gmail.com> <20200429092830.3p6qc4nsscbz44xu@sirius.home.kraxel.org>
In-Reply-To: <20200429092830.3p6qc4nsscbz44xu@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 29 Apr 2020 17:56:38 -0700
Message-ID: <CAPaKu7Sjk7QkOejWJmPXC=1B710sHVVnThUUuSynrpSiyN8CDA@mail.gmail.com>
Subject: Re: [virtio-comment] Re: [PATCH 1/2] virtio-gpu: add resource create blob
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, virtio-comment@lists.oasis-open.org, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Apr 29, 2020 at 2:28 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > Do we need separate items (HOSTSYS/HOST3D) for these?  Shouldn't this=
 be
> > > a host implementation detail the guest doesn't need to worry about?
> >
> > Yes, separate items are not needed and could indeed be an host
> > implementation detail.  Right now, the drm uapi has VIRTGPU_BLOB_MEM_HO=
ST /
> > VIRTIO_GPU_BLOB_MEM_HOST_GUEST and the kernel separates to HOST{SYS,3D}=
 and
> > does various checks.
> >
> > https://gitlab.freedesktop.org/virgl/drm-misc-next/-/commit/0ccb47d5150=
a2978d179d0c44ef3285541c8964c
> >
> >
> > The reasoning is since there's no RESOURCE_CREATE_BLOB2D
> > or RESOURCE_CREATE_BLOB3D, the separation captures that difference in a=
n
> > explicit API level.  That way, the blob id is only allowed with HOST3D.
>
> I think we can also simply define "blob id is only allowed virgl=3Don", n=
o
> need for a separate command.

With a single command, can blob_id be 0 when virgl=3Don?  Does the host
have enough info to know where to allocate from?

It seems we want HOSTSYS such that we can create dumb bos that are not
shadowed.  How about favoring GUEST for that use case instead?  Some
VMMs cannot support mapping a HOSTSYS into the guest.  The downside
would be that VMMs only see a dumb bo as an array of
virtio_gpu_mem_entry.  VMMs that need a linear mapping would need
something like udmabuf.

VIRTIO_GPU_CMD_SET_SCANOUT_BLOB below makes sense.

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

