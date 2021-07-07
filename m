Return-Path: <virtio-comment-return-1955-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 85EA0986457
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jul 2021 14:08:56 +0000 (UTC)
References: <20210624082032.44186-1-mgurtovoy@nvidia.com>
 <20210624082032.44186-2-mgurtovoy@nvidia.com> <8735t2m2uc.fsf@redhat.com>
 <6229141e-2604-d941-dfc4-2d8f414f4011@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6cfe2983-ad08-3b82-b92b-8447e81c0017@redhat.com>
Date: Wed, 7 Jul 2021 22:08:40 +0800
MIME-Version: 1.0
In-Reply-To: <6229141e-2604-d941-dfc4-2d8f414f4011@nvidia.com>
Subject: Re: [virtio-comment] [PATCH 1/1] live_migration: initial support for
 migrating virtio devices
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Max Gurtovoy <mgurtovoy@nvidia.com>, Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, mst@redhat.com
Cc: eperezma@redhat.com, aadam@redhat.com, oren@nvidia.com, shahafs@nvidia.com, parav@nvidia.com, bodong@nvidia.com, amikheev@nvidia.com, stefanha@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


=E5=9C=A8 2021/7/7 =E4=B8=8B=E5=8D=888:51, Max Gurtovoy =E5=86=99=E9=81=93:
>>>
>>> +
>>> +This document will describe the needed updates to the virtio
>>> specification for adding live migration support for various
>>> devices. Live migration is one of the most important features of
>>> virtualization and virtio devices are oftenly found in virtual
>>> environments so setting a standard mechanism for this feature will
>>> allow virtio providers to develop compliant devices that will use
>>> standard drivers for that matter.
>> Is this supposed to happen on the device side? Do drivers need to get
>> involved, or is it transparent to them?
>
> Guest drivers should be involved.
>
> Hypervisor drivers should have the vfio re-design that we're doing now=20
> in parallel.
>
> We'll develop new virtio_vfio_pci driver that will implement the=20
> specification.


Well, this sounds like a partial re-invention of my mdev-vDPA approach=20
which has been rejected by the community. The only difference is that=20
it's PCI specific but I don't think it change anything fundamentally. I=20
agree on the hardware design but not the software part.

This software part should be done in the vDPA (via a new parent) instead=20
of VFIO:

1) dedicated to virtio
2) capable for live migration, thanks to the vhost, vhost-vDPA has the=20
uAPI to support live migration, actually the device state=20
synchronization part is ready, what missed in the dirty page tracking,=20
it would be not hard to introduce the bitmap support, migration=20
compatibility support from the hypervisor(Qemu)
3) compatible with the existing virtio software stack
4) management API support
5) container ready
6) MicroVM ready, datapath assignment without PCI in the guest

...

Anything that blocks you from using the current mlx5 vDPA parent? It's=20
mature for live migration, switch, representors and a lot features that=20
virtio doesn't have. What's the value of using virtio PF in this case?=20
(Do you plan to invent all those features in the spec?)

Thanks


>
> Like we're doing for mlx5 NIC, the PF will be the communication=20
> channel for the migration process.
>
> The virtio pci PF admin queue will be used for that matter. The PF=20
> will not be migratable. It will manage the migration process for its VFs.=
=20


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

