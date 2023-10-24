Return-Path: <virtio-comment-return-7944-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE63FC25B48
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 13:31:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 27CE060D2D
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 13:31:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1EDC99869B4
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 13:31:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 146E59869A4; Tue, 24 Oct 2023 13:31:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F40769869AB
	for <virtio-comment@lists.oasis-open.org>; Tue, 24 Oct 2023 13:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 9dwOTxf7P321Dr39FZl09A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698154245; x=1698759045;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LCB5k1CPy4ubFzOTrxVfSjNbjSNvT/Mmdyodf3t/Mns=;
        b=N9ZFXRv9rGSQ46nKQc0HNATF4fHSi6fQhxafX74u4DV49waYX5unCq92Upmwsy1aTe
         mgBvoQfTyDHiXRXbxpnEWAf9+BuaqRCXk0PFaoDn0HvTECQEYvMFuENXZFZA5rDN0Fdw
         bvOsbOm2BXvdojf9Rb9tK6eRu66vYjuQc5nRfFhgpGwK1KOI4Rd+hMsYcRbuuYrj/K8I
         zJYg6FCzVn6qcU1WANLCKX0bmnKLIfzUrXFC9QzDcuTwM7I+01iqF9ow4zhi1Yqas3Qy
         PZO25x5H/KEEPupRNv9IBEbOjsouvyi4u7w0JZHUlVBwYta3xUnljwuisuu92Z9fwUmK
         ozRw==
X-Gm-Message-State: AOJu0Yy6X3L/7H90Q5Csk+i2EZuES7bue+sN4l6/zHwIzuVrdr02m4gE
	7f1fXYo7II6fbvarCT1XbCew35aYECJfE6W53JysX8nYG/K4d17x8pdXN7HenWoIGQeYyTmOD0P
	T+y8wQ7kxbkTdvN9VJzeKBR6zqjWHUjbx3A==
X-Received: by 2002:a05:6871:7408:b0:1ea:9a1:e96f with SMTP id nw8-20020a056871740800b001ea09a1e96fmr14434123oac.9.1698154245449;
        Tue, 24 Oct 2023 06:30:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFaz/ypzU+nnmujnFI53F/CAqOghaJj/AgYusZXX5uJML/98RFDYv6s2es5kyHIhouJQTx3w==
X-Received: by 2002:a05:6871:7408:b0:1ea:9a1:e96f with SMTP id nw8-20020a056871740800b001ea09a1e96fmr14434092oac.9.1698154245101;
        Tue, 24 Oct 2023 06:30:45 -0700 (PDT)
Date: Tue, 24 Oct 2023 15:30:41 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Radu Ocica <rocica@blackberry.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	anton.yakovlev@opensynergy.com
Message-ID: <ZTfHAQxns6j8gmEL@fedora>
References: <02725a6508584ed2aa8b31c9e9f4264a@blackberry.com>
MIME-Version: 1.0
In-Reply-To: <02725a6508584ed2aa8b31c9e9f4264a@blackberry.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [virtio-dev] virtio-snd comments/questions

On Wed, Oct 18, 2023 at 03:32:21PM +0000, Radu Ocica wrote:
> Hi,
> I am working on implementing a virtio-snd vdev. During my work on differe=
nt aspects of the implementation I stumbled across the following issues wit=
h the virtio sound device specification (that is part of the virtio 1.3 dra=
ft). In some cases additional clarifications might be enough to address the=
 issue, in others additional features might be required. Below is a list of=
 the issues, with some suggestions on how the issues could be addressed.
> PCM playback and capture
> Unclear semantics of PCM_STOP/PCM_START operations
> The virtio-snd specification is not clear on the expectations on how the =
PCM_STOP control request is to be handled by the vdev, in terms of whether =
to:
>=20
>   *   drop the remaining buffered audio in the host pcm stream and return=
 pending io messages to the guest driver
>   *   drop the remaining buffered audio in the host pcm stream and keep p=
ending io messages in order to be able to prime the host pcm stream in case=
 PCM_STOP is followed by PCM_START; return pending io messages only when re=
ceiving PCM_RELEASE
>   *   drain the remaining buffered audio in the host pcm stream and send =
a PCM_STOP response upon drain completion, return pending io messages to th=
e guest driver as they are completed (before PCM_STOP response); drain capa=
bility might or might not be available for the host pcm stream
>   *   start draining the remaining buffered audio in the host pcm stream =
and send a PCM_STOP response immediately, return pending io messages to the=
 guest driver as they are completed (after PCM_STOP response); if receiving=
 PCM_RELEASE before drain completion hold off the response until all pendin=
g io messages are completed and returned to the guest driver; drain capabil=
ity might or might not be available for the host pcm stream
>   *   pause the host pcm stream and maintain buffered audio / pending io =
messages as is; pause capability might or might not be available for the ho=
st pcm stream
>=20
> If the thinking is that the vdev on the host can decide on how to impleme=
nt PCM_STOP based on the host stream capabilities, the guest driver has no =
information about the choice made by the vdev. In our opinion the choice ma=
de by the vdev in implementing PCM_STOP dictates what the possible transiti=
ons after PCM_STOP can be (if PCM_STOP is implemented as pause, PCM_START a=
nd PCM_RELEASE are possible transitions, but if PCM_STOP is implemented as =
drain, the only valid transition is PCM_RELEASE and if PCM_STOP is implemen=
ted as drop and all pending io messages have been returned to the guest dri=
ver, again the only valid transition seems to be PCM_RELEASE), but the gues=
t driver is the one issuing the next request and it might at the best be ab=
le to make an educated guess how the vdev implemented PCM_STOP based on whe=
ther all the pending io messages are returned or not to the guest driver. T=
o make such a guess possible, more clarifications would be required in the =
spec to identify which of the scenarios listed above are considered by the =
spec.
> Note 1:  The reference virtio-snd linux/android guest driver explicitly d=
oesn't support the ALSA SNDRV_PCM_INFO_DRAIN_TRIGGER feature flag, which mi=
ght indicate there was no intent to support drain semantics.
> Note 2: The reference virtio-snd linux/android guest driver explicitly do=
es support the ALSA SNDRV_PCM_INFO_PAUSE feature flag, which seems to indic=
ate intent to support pause semantics, along with drop semantics.
> Note 3: The Android Audio HAL and tinyalsa/tinyplay don't have any notion=
 of drain or pause. At the end of a playback session there is a wait for pr=
eviously buffered data to complete playing using the tinyalsa pcm_wait() fu=
nction, and then a PCM_STOP request is issued after the buffered audio has =
completed playing. Drop semantics are assumed for PCM_STOP in this context.
> Information on period alignment and max audio buffer size
> No information about period alignment and min/max audio buffer/period siz=
e is currently available in struct virtio_snd_pcm_info. Ideally the period =
size used for io messages should match the period size used on the host. Th=
at will guarantee consistency in timing, precise accounting of available ro=
om to write more data or available data to read, across host and guest. A w=
orkaround is possible, where the device will fail a PCM_SET_PARAMETERS requ=
est that specifies an unsupported period alignment or audio buffer/period s=
ize and the guest is forced to use a period and buffer size that is known t=
o be supported by the host device (this can be done in an Android guest, by=
 hard coding the android audio HAL period size and the number of periods an=
d thus effectively the audio buffer size that is used for the virtio sound =
devices in the guest; in android and linux guests it can be done also by se=
tting the virtio_snd module parameters, to the effect of locking down the p=
eriod and buffer size).
> General Issues
>=20
>   *   There is no statement regarding the endianness of PCM data exchange=
d via txq and rxq queues and the virtio sound PCM format definitions do not=
 include endianness.
>   *   There is currently no requirement for the guest driver to enqueue a=
n io message only after it has completed writing data to it (playback) or r=
eading data from it (capture). The linux/android guest driver currently enq=
ueues an io message for playback immediately after calling snd_pcm_period_e=
lapsed(). snd_pcm_period_elapsed() makes it possible for the guest client a=
pp to write new data, but upon the return of this function there is no guar=
antee that the guest client app has already written new data. If the vdev d=
equeues the io message immediately and copies the PCM data for that io requ=
est before the guest client app has actually written new data to it, it res=
ults in out-of-sequence/stale data being played back.
>   *   There is no statement how the guest driver should react to a contro=
l request failing.
>=20
>      *   For PCM control requests the spec details what the "possible tra=
nsitions" are after each control request. It doesn't specify whether this a=
pplies only to successful control requests, or irrespective of the success =
of the control requests. For instance for PCM_START only PCM_STOP is listed=
 as a valid transition. What happens if PCM_START fails though? Is PCM_STOP=
 still a valid transition? Is a repeat of PCM_START valid, since the previo=
us PCM_START failed? Is a PCM_RELEASE required in order for the guest drive=
r to recover the io request descriptors that were sent to the vdev before P=
CM_START? Is a PCM_STOP required in this case, in order to be able to send =
PCM_RELEASE (because of valid sequences considerations)? It was seen that t=
he reference linux/android guest driver ignores a PCM_START failure and sti=
ll sends io requests after the failed PCM_START.

I tested this and I observed that when START fails, the guest still
sends the STOP cmd. This cmd is only valid if the stream has transited
to the START state, i.e., the spec only allows STOP in the START state.
I did not obser that the RELEASE cmd is issued. I think the driver shall
not send the STOP msg in that situation. What do you think?

Regards, Matias.


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

