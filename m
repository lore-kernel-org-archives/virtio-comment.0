Return-Path: virtio-comment-return-1734-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3DC1F9861BE
	for <virtio-comment@lists.oasis-open.org>; Mon,  8 Mar 2021 11:20:13 +0000 (UTC)
Date: Mon, 8 Mar 2021 12:20:06 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20210308112006.nplc4xvuhqvlnbrr@sirius.home.kraxel.org>
References: <caf0c3e3-5959-10d2-6b87-5128b0e2c30e@opensynergy.com>
MIME-Version: 1.0
In-Reply-To: <caf0c3e3-5959-10d2-6b87-5128b0e2c30e@opensynergy.com>
Subject: [virtio-comment] Re: virtio-snd: Adding support for audio controls
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Cc: virtio-comment@lists.oasis-open.org, liam.r.girdwood@linux.intel.com, Takashi Iwai <tiwai@suse.de>, broonie@kernel.org, maz@kernel.org, james.morse@arm.com, julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com, cdupontd@redhat.com, jean-philippe@linaro.org
List-ID: <virtio-comment.lists.oasis-open.org>

  Hi,

> The `type` field contains the value type for this specific control.
> Controls can have the following value types:

> SNDRV_CTL_ELEM_TYPE_INTEGER
>   32-bit integer values.
> SNDRV_CTL_ELEM_TYPE_INTEGER64
>   64-bit integer values.

Should we make SNDRV_CTL_ELEM_TYPE_INTEGER 64bit and drop
SNDRV_CTL_ELEM_TYPE_INTEGER64?  I guess alsa has both for
"historical reasons", I see little reason to have both for
a new interface.

> SNDRV_CTL_ELEM_ACCESS_READ
>   The driver can read the value of the control.
> SNDRV_CTL_ELEM_ACCESS_WRITE
>   The driver can write (change) the value of the control.
> SNDRV_CTL_ELEM_ACCESS_VOLATILE
>   Control value may be changed without a notification. (Applications
>   should poll such a control constantly.)

Hmm, is there something like "can change with notification"?

/me thinks about volume controls.  In case the pcm stream and volume
control is handled on the device (host) side by a sound daemon like
pulseaudio the volume could change because someone tweaks it using
pavucontrol.  It is probably useful to notify the driver (guest) in
case that happens ...

> The `name` field contains the name identifier string (up to 44 bytes
> including the terminating 0). ALSA classifies the role of a control by
> its name. This can be problematic for systems without ALSA.

I think it would be useful to have a role enum instead (or in addition
to the text label).

take care,
  Gerd


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

