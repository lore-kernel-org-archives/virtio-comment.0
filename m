Return-Path: <mst@redhat.com>
Date: Wed, 7 Jul 2021 10:09:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [virtio-comment] [PATCH 1/1] live_migration: initial support for
 migrating virtio devices
Message-ID: <20210707100658-mutt-send-email-mst@kernel.org>
References: <20210624082032.44186-1-mgurtovoy@nvidia.com>
 <20210624082032.44186-2-mgurtovoy@nvidia.com>
 <8735t2m2uc.fsf@redhat.com>
 <6229141e-2604-d941-dfc4-2d8f414f4011@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <6229141e-2604-d941-dfc4-2d8f414f4011@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, jasowang@redhat.com, eperezma@redhat.com, aadam@redhat.com, oren@nvidia.com, shahafs@nvidia.com, parav@nvidia.com, bodong@nvidia.com, amikheev@nvidia.com, stefanha@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Jul 07, 2021 at 03:51:25PM +0300, Max Gurtovoy wrote:
> > > +This document will describe the needed updates to the virtio
> > > specification for adding live migration support for various
> > > devices. Live migration is one of the most important features of
> > > virtualization and virtio devices are oftenly found in virtual
> > > environments so setting a standard mechanism for this feature will
> > > allow virtio providers to develop compliant devices that will use
> > > standard drivers for that matter.
> > Is this supposed to happen on the device side? Do drivers need to get
> > involved, or is it transparent to them?
> 
> Guest drivers should be involved.

Hmm that's a big drawback of this design then.
If nothing else, it should be possible to get state from device and
replace it with an emulated software implementation
for duration of migration, transparently to guest drivers.


-- 
MST

