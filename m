Return-Path: <mgurtovoy@nvidia.com>
Subject: Re: [virtio-comment] [PATCH 1/1] live_migration: initial support for
 migrating virtio devices
References: <20210624082032.44186-1-mgurtovoy@nvidia.com>
 <20210624082032.44186-2-mgurtovoy@nvidia.com> <8735t2m2uc.fsf@redhat.com>
 <6229141e-2604-d941-dfc4-2d8f414f4011@nvidia.com>
 <20210707100658-mutt-send-email-mst@kernel.org>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <58a279bd-57c9-3db8-9809-e56da6e7bf5e@nvidia.com>
Date: Wed, 7 Jul 2021 17:15:55 +0300
MIME-Version: 1.0
In-Reply-To: <20210707100658-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, jasowang@redhat.com, eperezma@redhat.com, aadam@redhat.com, oren@nvidia.com, shahafs@nvidia.com, parav@nvidia.com, bodong@nvidia.com, amikheev@nvidia.com, stefanha@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 7/7/2021 5:09 PM, Michael S. Tsirkin wrote:
> On Wed, Jul 07, 2021 at 03:51:25PM +0300, Max Gurtovoy wrote:
>>>> +This document will describe the needed updates to the virtio
>>>> specification for adding live migration support for various
>>>> devices. Live migration is one of the most important features of
>>>> virtualization and virtio devices are oftenly found in virtual
>>>> environments so setting a standard mechanism for this feature will
>>>> allow virtio providers to develop compliant devices that will use
>>>> standard drivers for that matter.
>>> Is this supposed to happen on the device side? Do drivers need to get
>>> involved, or is it transparent to them?
>> Guest drivers should be involved.
> Hmm that's a big drawback of this design then.

sorry it was a typo :)

Guest drivers *shouldn't* be involved.

of course.


> If nothing else, it should be possible to get state from device and
> replace it with an emulated software implementation
> for duration of migration, transparently to guest drivers.
>
>

