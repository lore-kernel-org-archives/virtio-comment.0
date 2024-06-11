Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CCE17623D
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 12:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718108674; cv=none; b=f3HPJ93pywEMkZng+cH6qjoTKURdoItP4LpKYJ1UpSnzqH1sei1GTUf8PmNY8mERsZCB24cq2ADq4sSSy1yIbv0gjAQ+wmVIOlFBzcRtR4pvBgbnhx3lAq1UqVUtqngPNm6p16URaZRfvYT77Neg8HY2YitbBOc6cImbIrYDI4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718108674; c=relaxed/simple;
	bh=FyKzVvhq704MTXH063MZ72aBEmt2Wwcz2JEP+Gm8qY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqGMjcRgjTFfz6RrfGO/vShAOSdgUxrdr1rSryIeDZfi8vplm8Slsvg510iS5ogwUa1WC6XSIJIykvnks3rOaYj9zU/L2Ayg+j3kS1RokdiW5xfsM20MKvzYaYWagmCVL5lvUpMjbFzUuVjHKyTdSDNepXIKQnaKijskoj5jwIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DDMJ5UOq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DDMJ5UOq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718108670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lU8v1um4ZbkqRrWHKTAfl2/Dv799WNmKVF4ed+Ge2wY=;
	b=DDMJ5UOq7ewb7mkpV7ILVuz28Cr08L3u+p5O/5LfzAZSppQ7XQ9RX7XEwqoqLWPe8z0s3t
	fs7s0S972C9A8zq15dBCI3CQzqbiSBg46ZHe5XgwUI+Wu3qzlZGQc7KHaxE/nFlP81bIov
	Q5WMt+98xFhYm99RVLKGkUMYNuYh7Iw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-ArPzcBhdNbWx2I1DmyRBVw-1; Tue, 11 Jun 2024 08:24:28 -0400
X-MC-Unique: ArPzcBhdNbWx2I1DmyRBVw-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2c283f190c1so957533a91.1
        for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 05:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718108666; x=1718713466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lU8v1um4ZbkqRrWHKTAfl2/Dv799WNmKVF4ed+Ge2wY=;
        b=dkOqUv+bCbwHwovOxEL4iyYFxHguzB5q9VlCw+WM9YlrB0kd+9n571CsusiJxKuYo5
         hNMEM6IrsAlEIJFfq3caa5T2vAZzlii1FvxnqDZ/Gxkmwkx/q8CcRkuX1YBxhrPANIlB
         R2jNmS6cWWWONKSftFecrgr+PhaMXT29bqsxeUhnUAFfF/OnOhBMvoVVXYzm4kowuQ9+
         cQklD2rOoKfXmSPwaLbxT+ek9qyvZQ+xJQhEfdO7Il+bO2AuIBusVcY/FCEnctIOH6YB
         N+RXTinN8J7APZcINTxJ9I/yjWZjgXPfnLuH62jzKIkMQvuG4E64/x8SLWjrba4P9U5U
         OqKA==
X-Gm-Message-State: AOJu0YzlWsBWvFexmITWHSSVVVnEAn+k+h0LdCchmPZLPXAqOxiTdLHe
	285Jdd0Gr7bpoFFztGeqZSKpz4MWFIH3KUMTJhCijMcviVIi6lObAtfPdlPcPb7+e8zFe8HmSOO
	vLwdx9x0mPH4xA2gGpNLUiATfFKq2nye7y7Eftb98Y63aYohpCFXxe+p004TQxYCh3wsZEkNqum
	PwxYKU4FG+8XU0WWf3+zZD0IXQscvoPsxRVu+A2kc=
X-Received: by 2002:a17:90a:c87:b0:2bd:7e38:798e with SMTP id 98e67ed59e1d1-2c2bcc0ba89mr10304977a91.28.1718108665951;
        Tue, 11 Jun 2024 05:24:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMco3+5Gr4GCmOah9iUiTfqmliklliQzj7ZE58Khb+StKTOTIjQAa2Ju90PfUurr287GYUJiAbJxGhjDNP2ws=
X-Received: by 2002:a17:90a:c87:b0:2bd:7e38:798e with SMTP id
 98e67ed59e1d1-2c2bcc0ba89mr10304935a91.28.1718108665013; Tue, 11 Jun 2024
 05:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240607133508.1400529-1-aesteve@redhat.com> <CADSE00K5RjuLY1UKfPiAMXv=HWJC3hdp9yvo_t7yr9HqhAVotw@mail.gmail.com>
 <CADSE00Kcc-uVKYkNT-LHX3kQwmhQNLgKp8FRMrWz0hWg+e_c8g@mail.gmail.com> <21f91356-0ca2-47c9-a659-d73c768717e4@opensynergy.com>
In-Reply-To: <21f91356-0ca2-47c9-a659-d73c768717e4@opensynergy.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 11 Jun 2024 14:24:13 +0200
Message-ID: <CADSE00JDgn1aj8+kxY=7UXvM5Co_dAWxR93A1mQma28HFHKpDg@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] virtio-media: Add device specification
To: Alexander Gordeev <alexander.gordeev@opensynergy.com>
Cc: virtio-comment@lists.linux.dev, Alexandre Courbot <acourbot@chromium.org>, 
	changyeon@google.com, eballetb@redhat.com, daniel.almeida@collabora.com, 
	ribalda@google.com, mst@redhat.com, gurchetansingh@google.com, 
	Matti.Moell@opensynergy.com, cohuck@redhat.com, 
	nicolas.dufresne@collabora.com, alex.bennee@linaro.org, 
	Alexander Gordeev <agordeev@qti.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a9fbfd061a9c5867"

--000000000000a9fbfd061a9c5867
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Tue, Jun 11, 2024 at 12:10=E2=80=AFPM Alexander Gordeev <
alexander.gordeev@opensynergy.com> wrote:

> Hi Albert, Alexandre,
>
> On 10.06.24 11:24, Albert Esteve wrote:
> > Just saw Alex Courbot's point-per-point response in the previous thread=
.
> > I'll link it here, as I'd prefer to move the discussion:
> >
> https://lore.kernel.org/all/CAPBb6MW36YaZFaWgksePQ=3DfMC7QffJD6ZpHN-iSzhL=
Yp9Ho0sg@mail.gmail.com/
> >
> > Again, sorry for the confusion.
>
> I think I'll quote Alexandre's email and respond to him below to have it
> in the new place.
>
> Replying to Alexandre:
>
> On 08.06.24 03:50, Alexandre Courbot wrote:
> > On Fri, Jun 7, 2024 at 10:29=E2=80=AFPM Alexander Gordeev
> > <alexander.gordeev@opensynergy.com> wrote:
> >>
> >> Hi Albert,
> >>
> >> On 07.06.24 10:00, Albert Esteve wrote:
> >>> Hi,
> >>>
> >>> This a formal attempt of including virtio-media
> >>> device specification.
>
> The thing is we already had a long email discussion. Unfortunately it
> didn't help to reach a consensus. You asked Cornelia to organize a
> meeting. So she did, there were a bunch of virtio and V4L2 experts
> invited by her. We both had an opportunity to bring our own experts to
> the discussion and to present our points of view. I presented the same
> arguments listed below in this email.
>
> I clearly remember, that all the experts told you, that you're going in
> a wrong direction, if your goal is standardization. I don't know what
> can I add on top of this. I think it is time to take the opinions of the
> experts and these arguments seriously, and stop pushing.
>
> Has anything changed since June 2023? I don't think so. I promised to
> continue the virtio-video development, I provided two drafts. I think,
> the last one addresses all previous comments and I'm myself satisfied
> with it. I'm also working on the driver update, I've published some
> intermediate results. You promised to make a downstream specification
> and implement it, you did it. Great, everything went according to the
> made decisions so far.
>
> You know, virtio-video is not a toy project too. AFAIK you can literally
> go and buy a mass market car with virtio-video on board since 2021. So
> our device and the driver are in production for years. Yes, the driver
> is based on draft v3/v4, there are problems, it needs updating. It is a
> work in progress right now. I hope to bring updates within a few months.
>

It is me who wanted to push for standardization. And I already gave
the reasoning. It is not my intention to torpedo virtio-video efforts.
I wish they did not split. But I now hope they can co-exist
in the VIRTIO standard, each covering specific usecases, and yeah,
with some overlapping.

Let's keep the discussion technical, to try to improve the specs :)


>
> >>> Virtio-media came from a discussion on virtio-dev
> >>> mailing list, which lead to presenting virtio-v4l2[1]
> >>> specification as an alternative to virtio-video.
> >>>
> >>> Later, virtio-v4l2 was renamed to virtio-media[2]
> >>> and published through:
> >>>
> >>> https://github.com/chromeos/virtio-media
> >>>
> >>> The repository above includes a virtio-media driver able
> >>> to pass v4l2-compliance when proxying the vivid/vicodec
> >>> virtual devices or an actual UVC camera using the
> >>> V4L2 vhost device (available in the repository).
> >>> Steps to reproduce are also detailed[3].
> >>>
> >>> There is some overlap with virtio-video in regards
> >>> to which devices it can handle. However,
> >>> as virtio-media will likely be the virtualization
> >>> solution for ChromeOS (already landed into the chromeos
> >>> organization) and possibly other Google projects for
> >>> media devices, it would be desirable to include the
> >>> specification in the next virtio release despite
> >>> the aforementioned overlap.
> >>>
> >>> The device ID in this document differs from
> >>> the ID in the virtio-media project repository.
> >>> And it will probably need some discussion on which
> >>> would be the correct definitive ID.
> >>>
> >>> Full PDF:
> https://drive.google.com/file/d/1pNCFP06VoV8Zuyx0aDVQ7HAT4xp-pZ0a/view?us=
p=3Dsharing
> >>> PDF with the media section only:
> https://drive.google.com/file/d/1sn3NUUeCm46zVyJKHkpytTIgGw1fUt5T/view?us=
p=3Dsharing
> >>>
> >>> [1]
> https://mail.google.com/mail/u/0?ui=3D2&ik=3D73ebd65ebd&attid=3D0.1&permm=
sgid=3Dmsg-f:1767388565327924962&th=3D1887068940754ee2&view=3Datt&disp=3Din=
line&realattid=3Df_libalimc0
> >>> [2]
> https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg12665.htm=
l
> >>> [3] https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md
> >>>
> >>> Albert Esteve (1):
> >>>     virtio-media: Add virtio media device specification
> >>>
> >>>    conformance.tex                           |  13 +-
> >>>    content.tex                               |   1 +
> >>>    device-types/media/description.tex        | 578
> ++++++++++++++++++++++ >>>    device-types/media/device-conformance.tex |
> 11 +
> >>>    device-types/media/driver-conformance.tex |   9 +
> >>>    5 files changed, 608 insertions(+), 4 deletions(-)
> >>>    create mode 100644 device-types/media/description.tex
> >>>    create mode 100644 device-types/media/device-conformance.tex
> >>>    create mode 100644 device-types/media/driver-conformance.tex
> >>
> >> I'd like to add some general considerations:
> >>
> >> 1. virtio-media device capability discovery is very chatty
> >>
> >> V4L2 requires potentially hundreds of system calls to get the full vie=
w
> >> of the device capabilities. This is inherited by virtio-media.
> >> AFAIU V4L2 developers agree there is room for enhancement here, see [1=
],
> >> [2]. Also I've been told VIDIOC_G_EXT_CTRLS/VIDIOC_S_EXT_CTRLS were
> >> added for similar reasons.
> >>
> >>   From the point of view of virtualization developers like my colleagu=
es
> >> and me hundreds of hypervisor "exits" are excessive and costly. It can
> >> noticeably increase boot times, which is something we fight against in
> >> automotive. AFAIU other virtio developers agree with this, see [3].
> >
> > There is a simple way to mitigate this: allow an arbitrary number of
> > commands to be submitted by the driver with each command buffer. The
> > host processes the commands sequentially and stops at the first error,
> > if any.
> >
> > That way, when enumerating formats, the guest can place a bunch of
> > VIDIOC_ENUM_FMT ioctls covering an arbitrary range 0..n in its command
> > buffer, and get all these formats in one vmexit instead of n. In the
> > case of a video decoder supporting 5 input formats, all the formats
> > are enumerated in 5 exits.
>
> I don't understand how could you end up with a fixed amount of vmexits.
> When I try to count with the batching as you wrote, the results depend
> very much on the amounts of supported coded and raw formats. I can
> easily have 50+ vmexits on our hardware.
> And of course it only gets worse with the encoder, because you have a
> lot of controls to query.
>
> > Having this option could also enable other optimizations, like the
> > guest being able to queue all its CAPTURE buffers in a single vmexit,
> > although I doubt this would result in a noticeable performance boost.
>
> Queuing of many independent buffers is already supported by virtqueues.
> You can simply queue a bunch of commands, but trigger an interrupt only
> once.
> The problem with the device capabilities is that in many cases you have
> to get the results of the previous command (batch) before you can submit
> a new one.
>
> > But at the very least this should address concerns about noisy
> > enumeration. I haven't noticed any slowness due to format enumeration
> > with the current scheme, but the option is trivial to enable.
>
> Well, I discussed the hack you mentioned and other ways to squeeze V4L2
> in virtio with some very experienced people in my team. Everybody says
> this is simply not the way how it is done in virtio. I think we both
> heard the same thing in the meeting a year ago.
>
> >> In contrast virtio-video has been doing this in one command from day
> >> one. Yes, the data was incomplete. That's why in draft v9 I added TLV =
as
> >> a way to store all possible capabilities. I hope the linux-media folks
> >> could take a look on it. Maybe this is something, that can be adopted =
in
> >> V4L2?
> >>
> >> 2. virtio-media has a hard dependency on V4L2
> >>
> >> There are certainly some "patches" on top of V4L2 in virtio-media, lik=
e
> >> the representation of the extended controls (which actually looks
> >> similar to the representation of the controls in virtio-video) or
> >> VIRTIO_MEDIA_EVT_DQBUF. But how far can this go? Is it OK to add your
> >> own ioctl ids in virtio-media?
> >
> > virtio-media doesn't add any ioctl ID and the extended controls use
> > the same structure as their V4L2 counterparts.
>
> Have you considered adding an ioctl ID to get all the device
> capabilities as a single blob?
>
> >> AFAIK the linux-media maintainers have been overloaded for years, see
> >> [4]. Would they be happy to deal with the additional requirements? Wou=
ld
> >> virtio community like to have a dependency here?
> >
> > The burden of having a couple new events in virtio-media seems lighter
> > to me on the V4L2 maintainers than the one of having a whole new video
> > protocol to maintain.
>
> You've always wrote that virtio-video is the same thing as V4L2, but now
> it is a whole new video protocol all of a sudden.
> In fact virtio-video allows to use the controls from V4L2, for example.
> Also the general flow is aligned IMHO.
>
> I meant the potential new requirements for the V4L2 UAPI. I think it is
> a much more sensitive topic compared to only one of the many drivers. It
> is true, that the burden is going to increase in any way. But I wouldn't
> try to speculate on this, I'm not a V4L2 maintainer.
>
> >> 2.1. an example: format modifiers
> >>
> >> There is a patchset aiming at unifying V4L2 pixel formats and extendin=
g
> >> them with DRM format modifiers. It is now at version 7 submitted in
> >> 2023, see [5]. The first version was submitted in 2019, see [6]. Not
> >> merged yet AFAIK.
> >>
> >> In virtio-video I just added them in draft v9.
> >>
> >> I'm absolutely not trying to criticize here. I just try to highlight
> >> that there is a lot of legacy and the process is painful. Right now we
> >> have an opportunity to design a new API according to the current state
> >> of the art of the stateful codecs.
> >>
> >> 3. uncertainty with cameras
> >>
> >> AFAIK there is still no agreement about how cameras should be
> >> virtualized, see [3], [7], [8], [9]. virtio-media provides support for
> >> cameras in a specific way, which might not be desirable.
> >
> > There is definitely an agreement on how cameras should work on V4L2 ;
> > and thanks to that you can operate a camera using virtio-media,
> > *today*.
> >
> > I'm sure the virtio-camera specification, driver, and host devices
> > will be very impressive once they are released ; it's just that I
> > would enjoy a solution, however imperfect, within my life span.
>
> Well, you have the solution now. Nobody stops you from using it.
>
> >> 4. (minor) is it possible/hard to implement the device in hardware/on =
a
> >> micro controller?
> >>
> >> This is something I thought about recently, there might be a use-case
> >> for it in the future. One of the concerns is that dynamic memory
> >> allocations are IMHO inevitable in virtio-media or virtio-video up to
> >> draft v8. I think multiple virtqueues in virtio-video draft v9 would
> >> help here. Not sure yet...
> >
> > V4L2's MMAP buffer type has that covered.
> >
> >>
> >> There are also other minor concerns, that are probably tolerable.
> >>
> >> [1]
> https://lore.kernel.org/linux-media/20230922100303.GF19112@pendragon.idea=
sonboard.com/
> >> [2] Page 6 in
> https://hverkuil.home.xs4all.nl/mediasummit2023-pdfs/Hsia-Jun%20Li%20-%20=
V4L2%20M2M%20EXT%20API%20enhancement.pdf
> >> [3] https://old.linaro.org/blog/the-challenges-of-abstracting-virtio/
> >> [4]
> https://lore.kernel.org/linux-media/4b6b1355-9baa-ff1e-e1c0-89dfdc83ad04@=
xs4all.nl/
> >> [5]
> https://lore.kernel.org/linux-media/20230206043308.28365-2-ayaka@soulik.i=
nfo/
> >> [6]
> https://lore.kernel.org/linux-media/20190319145243.25047-1-boris.brezillo=
n@collabora.com/
> >> [7] https://lore.kernel.org/virtio-dev/87354dtp30.fsf@linaro.org/
> >> [8]
> https://lore.kernel.org/linux-media/00f53c06-e66d-aa46-ca4f-c3baab6cf455@=
xs4all.nl/
> >> [9]
> https://lore.kernel.org/virtio-dev/CAAFQd5BrhDZtFX3vdhBVSLXthe8CykYsZzVQ9=
ddZxVNvNS3ArA@mail.gmail.com/
> >>
>
>
> --
> Alexander Gordeev
> Senior Software Engineer
>
>

--000000000000a9fbfd061a9c5867
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr">Hi Alexander,<br></div></div></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 11, =
2024 at 12:10=E2=80=AFPM Alexander Gordeev &lt;<a href=3D"mailto:alexander.=
gordeev@opensynergy.com">alexander.gordeev@opensynergy.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Albert, Alexan=
dre,<br>
<br>
On 10.06.24 11:24, Albert Esteve wrote:<br>
&gt; Just saw Alex Courbot&#39;s point-per-point response in the previous t=
hread.<br>
&gt; I&#39;ll link it here, as I&#39;d prefer to move the discussion:<br>
&gt; <a href=3D"https://lore.kernel.org/all/CAPBb6MW36YaZFaWgksePQ=3DfMC7Qf=
fJD6ZpHN-iSzhLYp9Ho0sg@mail.gmail.com/" rel=3D"noreferrer" target=3D"_blank=
">https://lore.kernel.org/all/CAPBb6MW36YaZFaWgksePQ=3DfMC7QffJD6ZpHN-iSzhL=
Yp9Ho0sg@mail.gmail.com/</a><br>
&gt; <br>
&gt; Again, sorry for the confusion.<br>
<br>
I think I&#39;ll quote Alexandre&#39;s email and respond to him below to ha=
ve it <br>
in the new place.<br>
<br>
Replying to Alexandre:<br>
<br>
On 08.06.24 03:50, Alexandre Courbot wrote:<br>
&gt; On Fri, Jun 7, 2024 at 10:29=E2=80=AFPM Alexander Gordeev<br>
&gt; &lt;<a href=3D"mailto:alexander.gordeev@opensynergy.com" target=3D"_bl=
ank">alexander.gordeev@opensynergy.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Albert,<br>
&gt;&gt;<br>
&gt;&gt; On 07.06.24 10:00, Albert Esteve wrote:<br>
&gt;&gt;&gt; Hi,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This a formal attempt of including virtio-media<br>
&gt;&gt;&gt; device specification.<br>
<br>
The thing is we already had a long email discussion. Unfortunately it <br>
didn&#39;t help to reach a consensus. You asked Cornelia to organize a <br>
meeting. So she did, there were a bunch of virtio and V4L2 experts <br>
invited by her. We both had an opportunity to bring our own experts to <br>
the discussion and to present our points of view. I presented the same <br>
arguments listed below in this email.<br>
<br>
I clearly remember, that all the experts told you, that you&#39;re going in=
 <br>
a wrong direction, if your goal is standardization. I don&#39;t know what <=
br>
can I add on top of this. I think it is time to take the opinions of the <b=
r>
experts and these arguments seriously, and stop pushing.<br>
<br>
Has anything changed since June 2023? I don&#39;t think so. I promised to <=
br>
continue the virtio-video development, I provided two drafts. I think, <br>
the last one addresses all previous comments and I&#39;m myself satisfied <=
br>
with it. I&#39;m also working on the driver update, I&#39;ve published some=
 <br>
intermediate results. You promised to make a downstream specification <br>
and implement it, you did it. Great, everything went according to the <br>
made decisions so far.<br>
<br>
You know, virtio-video is not a toy project too. AFAIK you can literally <b=
r>
go and buy a mass market car with virtio-video on board since 2021. So <br>
our device and the driver are in production for years. Yes, the driver <br>
is based on draft v3/v4, there are problems, it needs updating. It is a <br=
>
work in progress right now. I hope to bring updates within a few months.<br=
></blockquote><div><br></div><div>It is me who wanted to push for standardi=
zation. And I already gave</div><div>the reasoning. It is not my intention =
to torpedo virtio-video efforts.</div><div>I wish they did not split. But I=
 now hope they can co-exist</div><div>in the VIRTIO standard, each covering=
 specific usecases, and yeah,</div><div>with some overlapping.</div><div><b=
r></div><div>Let&#39;s keep the discussion technical, to try to improve the=
 specs :)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
&gt;&gt;&gt; Virtio-media came from a discussion on virtio-dev<br>
&gt;&gt;&gt; mailing list, which lead to presenting virtio-v4l2[1]<br>
&gt;&gt;&gt; specification as an alternative to virtio-video.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Later, virtio-v4l2 was renamed to virtio-media[2]<br>
&gt;&gt;&gt; and published through:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://github.com/chromeos/virtio-media" rel=3D"no=
referrer" target=3D"_blank">https://github.com/chromeos/virtio-media</a><br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The repository above includes a virtio-media driver able<br>
&gt;&gt;&gt; to pass v4l2-compliance when proxying the vivid/vicodec<br>
&gt;&gt;&gt; virtual devices or an actual UVC camera using the<br>
&gt;&gt;&gt; V4L2 vhost device (available in the repository).<br>
&gt;&gt;&gt; Steps to reproduce are also detailed[3].<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; There is some overlap with virtio-video in regards<br>
&gt;&gt;&gt; to which devices it can handle. However,<br>
&gt;&gt;&gt; as virtio-media will likely be the virtualization<br>
&gt;&gt;&gt; solution for ChromeOS (already landed into the chromeos<br>
&gt;&gt;&gt; organization) and possibly other Google projects for<br>
&gt;&gt;&gt; media devices, it would be desirable to include the<br>
&gt;&gt;&gt; specification in the next virtio release despite<br>
&gt;&gt;&gt; the aforementioned overlap.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The device ID in this document differs from<br>
&gt;&gt;&gt; the ID in the virtio-media project repository.<br>
&gt;&gt;&gt; And it will probably need some discussion on which<br>
&gt;&gt;&gt; would be the correct definitive ID.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Full PDF: <a href=3D"https://drive.google.com/file/d/1pNCFP06V=
oV8Zuyx0aDVQ7HAT4xp-pZ0a/view?usp=3Dsharing" rel=3D"noreferrer" target=3D"_=
blank">https://drive.google.com/file/d/1pNCFP06VoV8Zuyx0aDVQ7HAT4xp-pZ0a/vi=
ew?usp=3Dsharing</a><br>
&gt;&gt;&gt; PDF with the media section only: <a href=3D"https://drive.goog=
le.com/file/d/1sn3NUUeCm46zVyJKHkpytTIgGw1fUt5T/view?usp=3Dsharing" rel=3D"=
noreferrer" target=3D"_blank">https://drive.google.com/file/d/1sn3NUUeCm46z=
VyJKHkpytTIgGw1fUt5T/view?usp=3Dsharing</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [1] <a href=3D"https://mail.google.com/mail/u/0?ui=3D2&amp;ik=
=3D73ebd65ebd&amp;attid=3D0.1&amp;permmsgid=3Dmsg-f:1767388565327924962&amp=
;th=3D1887068940754ee2&amp;view=3Datt&amp;disp=3Dinline&amp;realattid=3Df_l=
ibalimc0" rel=3D"noreferrer" target=3D"_blank">https://mail.google.com/mail=
/u/0?ui=3D2&amp;ik=3D73ebd65ebd&amp;attid=3D0.1&amp;permmsgid=3Dmsg-f:17673=
88565327924962&amp;th=3D1887068940754ee2&amp;view=3Datt&amp;disp=3Dinline&a=
mp;realattid=3Df_libalimc0</a><br>
&gt;&gt;&gt; [2] <a href=3D"https://www.mail-archive.com/virtio-dev@lists.o=
asis-open.org/msg12665.html" rel=3D"noreferrer" target=3D"_blank">https://w=
ww.mail-archive.com/virtio-dev@lists.oasis-open.org/msg12665.html</a><br>
&gt;&gt;&gt; [3] <a href=3D"https://github.com/chromeos/virtio-media/blob/m=
ain/TRY_IT_OUT.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
chromeos/virtio-media/blob/main/TRY_IT_OUT.md</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Albert Esteve (1):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0virtio-media: Add virtio media device speci=
fication<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 conformance.tex=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 13 +=
-<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 content.tex=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 device-types/media/description.tex=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 578 ++++++++++++++++++++++ &gt;&gt;&gt;=C2=A0 =C2=A0 device=
-types/media/device-conformance.tex |=C2=A0 11 +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 device-types/media/driver-conformance.tex |=C2=A0=
 =C2=A09 +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 5 files changed, 608 insertions(+), 4 deletions(-=
)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 create mode 100644 device-types/media/description=
.tex<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 create mode 100644 device-types/media/device-conf=
ormance.tex<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 create mode 100644 device-types/media/driver-conf=
ormance.tex<br>
&gt;&gt;<br>
&gt;&gt; I&#39;d like to add some general considerations:<br>
&gt;&gt;<br>
&gt;&gt; 1. virtio-media device capability discovery is very chatty<br>
&gt;&gt;<br>
&gt;&gt; V4L2 requires potentially hundreds of system calls to get the full=
 view<br>
&gt;&gt; of the device capabilities. This is inherited by virtio-media.<br>
&gt;&gt; AFAIU V4L2 developers agree there is room for enhancement here, se=
e [1],<br>
&gt;&gt; [2]. Also I&#39;ve been told VIDIOC_G_EXT_CTRLS/VIDIOC_S_EXT_CTRLS=
 were<br>
&gt;&gt; added for similar reasons.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0From the point of view of virtualization developers li=
ke my colleagues<br>
&gt;&gt; and me hundreds of hypervisor &quot;exits&quot; are excessive and =
costly. It can<br>
&gt;&gt; noticeably increase boot times, which is something we fight agains=
t in<br>
&gt;&gt; automotive. AFAIU other virtio developers agree with this, see [3]=
.<br>
&gt;<br>
&gt; There is a simple way to mitigate this: allow an arbitrary number of<b=
r>
&gt; commands to be submitted by the driver with each command buffer. The<b=
r>
&gt; host processes the commands sequentially and stops at the first error,=
<br>
&gt; if any.<br>
&gt;<br>
&gt; That way, when enumerating formats, the guest can place a bunch of<br>
&gt; VIDIOC_ENUM_FMT ioctls covering an arbitrary range 0..n in its command=
<br>
&gt; buffer, and get all these formats in one vmexit instead of n. In the<b=
r>
&gt; case of a video decoder supporting 5 input formats, all the formats<br=
>
&gt; are enumerated in 5 exits.<br>
<br>
I don&#39;t understand how could you end up with a fixed amount of vmexits.=
 <br>
When I try to count with the batching as you wrote, the results depend <br>
very much on the amounts of supported coded and raw formats. I can <br>
easily have 50+ vmexits on our hardware.<br>
And of course it only gets worse with the encoder, because you have a <br>
lot of controls to query.<br>
<br>
&gt; Having this option could also enable other optimizations, like the<br>
&gt; guest being able to queue all its CAPTURE buffers in a single vmexit,<=
br>
&gt; although I doubt this would result in a noticeable performance boost.<=
br>
<br>
Queuing of many independent buffers is already supported by virtqueues. <br=
>
You can simply queue a bunch of commands, but trigger an interrupt only <br=
>
once.<br>
The problem with the device capabilities is that in many cases you have <br=
>
to get the results of the previous command (batch) before you can submit <b=
r>
a new one.<br>
<br>
&gt; But at the very least this should address concerns about noisy<br>
&gt; enumeration. I haven&#39;t noticed any slowness due to format enumerat=
ion<br>
&gt; with the current scheme, but the option is trivial to enable.<br>
<br>
Well, I discussed the hack you mentioned and other ways to squeeze V4L2 <br=
>
in virtio with some very experienced people in my team. Everybody says <br>
this is simply not the way how it is done in virtio. I think we both <br>
heard the same thing in the meeting a year ago.<br>
<br>
&gt;&gt; In contrast virtio-video has been doing this in one command from d=
ay<br>
&gt;&gt; one. Yes, the data was incomplete. That&#39;s why in draft v9 I ad=
ded TLV as<br>
&gt;&gt; a way to store all possible capabilities. I hope the linux-media f=
olks<br>
&gt;&gt; could take a look on it. Maybe this is something, that can be adop=
ted in<br>
&gt;&gt; V4L2?<br>
&gt;&gt;<br>
&gt;&gt; 2. virtio-media has a hard dependency on V4L2<br>
&gt;&gt;<br>
&gt;&gt; There are certainly some &quot;patches&quot; on top of V4L2 in vir=
tio-media, like<br>
&gt;&gt; the representation of the extended controls (which actually looks<=
br>
&gt;&gt; similar to the representation of the controls in virtio-video) or<=
br>
&gt;&gt; VIRTIO_MEDIA_EVT_DQBUF. But how far can this go? Is it OK to add y=
our<br>
&gt;&gt; own ioctl ids in virtio-media?<br>
&gt;<br>
&gt; virtio-media doesn&#39;t add any ioctl ID and the extended controls us=
e<br>
&gt; the same structure as their V4L2 counterparts.<br>
<br>
Have you considered adding an ioctl ID to get all the device <br>
capabilities as a single blob?<br>
<br>
&gt;&gt; AFAIK the linux-media maintainers have been overloaded for years, =
see<br>
&gt;&gt; [4]. Would they be happy to deal with the additional requirements?=
 Would<br>
&gt;&gt; virtio community like to have a dependency here?<br>
&gt;<br>
&gt; The burden of having a couple new events in virtio-media seems lighter=
<br>
&gt; to me on the V4L2 maintainers than the one of having a whole new video=
<br>
&gt; protocol to maintain.<br>
<br>
You&#39;ve always wrote that virtio-video is the same thing as V4L2, but no=
w <br>
it is a whole new video protocol all of a sudden.<br>
In fact virtio-video allows to use the controls from V4L2, for example. <br=
>
Also the general flow is aligned IMHO.<br>
<br>
I meant the potential new requirements for the V4L2 UAPI. I think it is <br=
>
a much more sensitive topic compared to only one of the many drivers. It <b=
r>
is true, that the burden is going to increase in any way. But I wouldn&#39;=
t <br>
try to speculate on this, I&#39;m not a V4L2 maintainer.<br>
<br>
&gt;&gt; 2.1. an example: format modifiers<br>
&gt;&gt;<br>
&gt;&gt; There is a patchset aiming at unifying V4L2 pixel formats and exte=
nding<br>
&gt;&gt; them with DRM format modifiers. It is now at version 7 submitted i=
n<br>
&gt;&gt; 2023, see [5]. The first version was submitted in 2019, see [6]. N=
ot<br>
&gt;&gt; merged yet AFAIK.<br>
&gt;&gt;<br>
&gt;&gt; In virtio-video I just added them in draft v9.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m absolutely not trying to criticize here. I just try to hig=
hlight<br>
&gt;&gt; that there is a lot of legacy and the process is painful. Right no=
w we<br>
&gt;&gt; have an opportunity to design a new API according to the current s=
tate<br>
&gt;&gt; of the art of the stateful codecs.<br>
&gt;&gt;<br>
&gt;&gt; 3. uncertainty with cameras<br>
&gt;&gt;<br>
&gt;&gt; AFAIK there is still no agreement about how cameras should be<br>
&gt;&gt; virtualized, see [3], [7], [8], [9]. virtio-media provides support=
 for<br>
&gt;&gt; cameras in a specific way, which might not be desirable.<br>
&gt;<br>
&gt; There is definitely an agreement on how cameras should work on V4L2 ;<=
br>
&gt; and thanks to that you can operate a camera using virtio-media,<br>
&gt; *today*.<br>
&gt;<br>
&gt; I&#39;m sure the virtio-camera specification, driver, and host devices=
<br>
&gt; will be very impressive once they are released ; it&#39;s just that I<=
br>
&gt; would enjoy a solution, however imperfect, within my life span.<br>
<br>
Well, you have the solution now. Nobody stops you from using it.<br>
<br>
&gt;&gt; 4. (minor) is it possible/hard to implement the device in hardware=
/on a<br>
&gt;&gt; micro controller?<br>
&gt;&gt;<br>
&gt;&gt; This is something I thought about recently, there might be a use-c=
ase<br>
&gt;&gt; for it in the future. One of the concerns is that dynamic memory<b=
r>
&gt;&gt; allocations are IMHO inevitable in virtio-media or virtio-video up=
 to<br>
&gt;&gt; draft v8. I think multiple virtqueues in virtio-video draft v9 wou=
ld<br>
&gt;&gt; help here. Not sure yet...<br>
&gt;<br>
&gt; V4L2&#39;s MMAP buffer type has that covered.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; There are also other minor concerns, that are probably tolerable.<=
br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://lore.kernel.org/linux-media/20230922100303.=
GF19112@pendragon.ideasonboard.com/" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lore.kernel.org/linux-media/20230922100303.GF19112@pendragon.ideason=
board.com/</a><br>
&gt;&gt; [2] Page 6 in <a href=3D"https://hverkuil.home.xs4all.nl/mediasumm=
it2023-pdfs/Hsia-Jun%20Li%20-%20V4L2%20M2M%20EXT%20API%20enhancement.pdf" r=
el=3D"noreferrer" target=3D"_blank">https://hverkuil.home.xs4all.nl/mediasu=
mmit2023-pdfs/Hsia-Jun%20Li%20-%20V4L2%20M2M%20EXT%20API%20enhancement.pdf<=
/a><br>
&gt;&gt; [3] <a href=3D"https://old.linaro.org/blog/the-challenges-of-abstr=
acting-virtio/" rel=3D"noreferrer" target=3D"_blank">https://old.linaro.org=
/blog/the-challenges-of-abstracting-virtio/</a><br>
&gt;&gt; [4] <a href=3D"https://lore.kernel.org/linux-media/4b6b1355-9baa-f=
f1e-e1c0-89dfdc83ad04@xs4all.nl/" rel=3D"noreferrer" target=3D"_blank">http=
s://lore.kernel.org/linux-media/4b6b1355-9baa-ff1e-e1c0-89dfdc83ad04@xs4all=
.nl/</a><br>
&gt;&gt; [5] <a href=3D"https://lore.kernel.org/linux-media/20230206043308.=
28365-2-ayaka@soulik.info/" rel=3D"noreferrer" target=3D"_blank">https://lo=
re.kernel.org/linux-media/20230206043308.28365-2-ayaka@soulik.info/</a><br>
&gt;&gt; [6] <a href=3D"https://lore.kernel.org/linux-media/20190319145243.=
25047-1-boris.brezillon@collabora.com/" rel=3D"noreferrer" target=3D"_blank=
">https://lore.kernel.org/linux-media/20190319145243.25047-1-boris.brezillo=
n@collabora.com/</a><br>
&gt;&gt; [7] <a href=3D"https://lore.kernel.org/virtio-dev/87354dtp30.fsf@l=
inaro.org/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/vi=
rtio-dev/87354dtp30.fsf@linaro.org/</a><br>
&gt;&gt; [8] <a href=3D"https://lore.kernel.org/linux-media/00f53c06-e66d-a=
a46-ca4f-c3baab6cf455@xs4all.nl/" rel=3D"noreferrer" target=3D"_blank">http=
s://lore.kernel.org/linux-media/00f53c06-e66d-aa46-ca4f-c3baab6cf455@xs4all=
.nl/</a><br>
&gt;&gt; [9] <a href=3D"https://lore.kernel.org/virtio-dev/CAAFQd5BrhDZtFX3=
vdhBVSLXthe8CykYsZzVQ9ddZxVNvNS3ArA@mail.gmail.com/" rel=3D"noreferrer" tar=
get=3D"_blank">https://lore.kernel.org/virtio-dev/CAAFQd5BrhDZtFX3vdhBVSLXt=
he8CykYsZzVQ9ddZxVNvNS3ArA@mail.gmail.com/</a><br>
&gt;&gt; <br>
<br>
<br>
-- <br>
Alexander Gordeev<br>
Senior Software Engineer<br>
<br>
</blockquote></div></div>

--000000000000a9fbfd061a9c5867--

