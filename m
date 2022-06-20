Return-Path: <virtio-comment-return-3142-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8D64C9862CB
	for <virtio-comment@lists.oasis-open.org>; Mon, 20 Jun 2022 13:47:08 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20220617071406-mutt-send-email-mst@kernel.org>
References: <20210420183203.1227004-1-anton.yakovlev@opensynergy.com>
 <87a6m74un0.fsf@redhat.com>
 <20220617071406-mutt-send-email-mst@kernel.org>
Date: Mon, 20 Jun 2022 15:47:01 +0200
Message-ID: <87mte7qwfe.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] virtio-snd: add support for audio
 controls
Content-Type: text/plain
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Anton Yakovlev <anton.yakovlev@opensynergy.com>, virtio-comment@lists.oasis-open.org, liam.r.girdwood@linux.intel.com, tiwai@suse.de, broonie@kernel.org, maz@kernel.org, james.morse@arm.com, julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com, cdupontd@redhat.com, kraxel@redhat.com, jean-philippe@linaro.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Jun 17 2022, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Jul 27, 2021 at 05:57:23PM +0200, Cornelia Huck wrote:
>> On Tue, Apr 20 2021, Anton Yakovlev <anton.yakovlev@opensynergy.com> wrote:
>> 
>> > This patch extends the virtio sound device specification by adding
>> > support for audio controls. Audio controls can be used to set the volume
>> > level, mute/unmute the audio signal, switch different modes/states of
>> > the virtual sound device, etc.
>> >
>> > Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
>> > ---
>> >  conformance.tex  |   5 +
>> >  virtio-sound.tex | 374 ++++++++++++++++++++++++++++++++++++++++++++++-
>> >  2 files changed, 378 insertions(+), 1 deletion(-)
>> >
>> 
>> > @@ -50,6 +53,7 @@ \subsection{Device Configuration Layout}\label{sec:Device Types / Sound Device /
>> >      le32 jacks;
>> >      le32 streams;
>> >      le32 chmaps;
>> > +    le32 controls;
>> >  };
>> >  \end{lstlisting}
>> >  
>> > @@ -62,6 +66,9 @@ \subsection{Device Configuration Layout}\label{sec:Device Types / Sound Device /
>> >  PCM streams.
>> >  \item[\field{chmaps}] (driver-read-only) indicates a total number of all available
>> >  channel maps.
>> > +\item[\field{controls}] (driver-read-only) indicates a total number of all available
>> > +control elements if VIRTIO_SND_F_CTLS has been negotiated.
>> 
>> While the driver is not supposed to read this if the feature has not
>> been negotiated, do we also want to add a normative statement about what
>> the device is supposed to do in this case? Does the field always exist?
>
>
> Cornelia this is a general issue in the spec. We should be clearer
> that
> - drivers should be ready for config space to be shorter
> or longer than described here, as long as they do not
> need to access outside of it, it is ok.
> - negotiated/offered confusion

Yes, I remember we had some discussions about that in the meantime...

>
>
> I will revive my proposal where feature is negotiated even before
> FEATURES_OK
>
> I think this can stand as is for now.

Fine with me.


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

