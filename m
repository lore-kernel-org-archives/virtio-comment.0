Return-Path: virtio-comment-return-1538-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6A3319862D9
	for <virtio-comment@lists.oasis-open.org>; Wed, 25 Nov 2020 11:48:28 +0000 (UTC)
Date: Wed, 25 Nov 2020 06:48:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20201125045623-mutt-send-email-mst@kernel.org>
References: <CANkLV9gRR_EkrCK4czwWiH6toffKN12vSd6M9FFrtvQwU3bmHQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANkLV9gRR_EkrCK4czwWiH6toffKN12vSd6M9FFrtvQwU3bmHQ@mail.gmail.com>
Subject: Re: [virtio-comment] Writes to the Device Status field race with
 DEVICE_NEEDS_RESET
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Olivier Delande <olivier.delande@gmail.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Nov 18, 2020 at 01:45:13PM +0100, Olivier Delande wrote:
> As far as I understand the Virtio 1.1 spec, a driver must not clear
> any bit in the Device Status field when it writes a non-zero value.
> How can it comply with this requirement, when the device may be
> concurrently setting DEVICE_NEEDS_RESET? There does not seem to be any
> facility to atomically set some bits and leave the others unchanged.

Good point! I guess one way to actually make it race-free is for
the device to have the DEVICE_NEEDS_RESET bit read-only, that is
unaffected by driver writes.

We can't make it a MUST since there are lots of devices out there
but we can make it a SHOULD. Luckily it is unusual for drivers to
change status after initialization and unusual for devices to
fail during initialization.

One other thing we should probably suggest is that devices that set NEED_RESET before
FEATURES_OK is set, also fail setting of FEATURES_OK.
This way at least drivers will detect the failure.
That seems like a good idea even irrespective of the races,
since lots of drivers don't handle NEED_RESET.

-- 
MST


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

