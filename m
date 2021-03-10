Return-Path: virtio-comment-return-1735-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D52BD986520
	for <virtio-comment@lists.oasis-open.org>; Wed, 10 Mar 2021 18:15:44 +0000 (UTC)
References: <caf0c3e3-5959-10d2-6b87-5128b0e2c30e@opensynergy.com>
 <20210308112006.nplc4xvuhqvlnbrr@sirius.home.kraxel.org>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <38597fb4-26ee-29bc-d7b3-0e4eeb1c198b@opensynergy.com>
Date: Wed, 10 Mar 2021 19:15:40 +0100
MIME-Version: 1.0
In-Reply-To: <20210308112006.nplc4xvuhqvlnbrr@sirius.home.kraxel.org>
Subject: [virtio-comment] Re: virtio-snd: Adding support for audio controls
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, liam.r.girdwood@linux.intel.com, Takashi Iwai <tiwai@suse.de>, broonie@kernel.org, maz@kernel.org, james.morse@arm.com, julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com, cdupontd@redhat.com, jean-philippe@linaro.org
List-ID: <virtio-comment.lists.oasis-open.org>

Hi,

On 08.03.2021 12:20, Gerd Hoffmann wrote:
>> The `type` field contains the value type for this specific control.
>> Controls can have the following value types:
> 
>> SNDRV_CTL_ELEM_TYPE_INTEGER
>>    32-bit integer values.
>> SNDRV_CTL_ELEM_TYPE_INTEGER64
>>    64-bit integer values.
> 
> Should we make SNDRV_CTL_ELEM_TYPE_INTEGER 64bit and drop
> SNDRV_CTL_ELEM_TYPE_INTEGER64?  I guess alsa has both for
> "historical reasons", I see little reason to have both for
> a new interface.

As Takashi already pointed out, the virtio_snd_ctl_value structure
(defined in original email) has a fixed size. Therefore, for different
types it is possible to specify a different number of values.

Also, if the virtual control is backed by a real ALSA control of type
INTEGER, then we have to convert between 32 and 64 bits back and forth.
And since in this case the value will be completely transparent to the
device, we will have to do this for the entire structure (we do not know
how many values are significant and what is garbage).


>> SNDRV_CTL_ELEM_ACCESS_READ
>>    The driver can read the value of the control.
>> SNDRV_CTL_ELEM_ACCESS_WRITE
>>    The driver can write (change) the value of the control.
>> SNDRV_CTL_ELEM_ACCESS_VOLATILE
>>    Control value may be changed without a notification. (Applications
>>    should poll such a control constantly.)
> 
> Hmm, is there something like "can change with notification"?
> 
> /me thinks about volume controls.  In case the pcm stream and volume
> control is handled on the device (host) side by a sound daemon like
> pulseaudio the volume could change because someone tweaks it using
> pavucontrol.  It is probably useful to notify the driver (guest) in
> case that happens ...

Sending notifications is the expected default behavior. You can find
suggested event definitions at the end of the original email.


>> The `name` field contains the name identifier string (up to 44 bytes
>> including the terminating 0). ALSA classifies the role of a control by
>> its name. This can be problematic for systems without ALSA.
> 
> I think it would be useful to have a role enum instead (or in addition
> to the text label).

Yes, I also thought about this. Since having name is important, we can
introduce an additional "role" field.


> take care,
>    Gerd
> 
> 

-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin


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

