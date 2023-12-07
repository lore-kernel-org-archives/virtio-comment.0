Return-Path: <virtio-comment-return-8759-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8698C4167B
	for <virtio-comment@archiver.kernel.org>; Thu,  7 Dec 2023 05:35:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 236982AC9D
	for <virtio-comment@archiver.kernel.org>; Thu,  7 Dec 2023 05:35:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E98A898690D
	for <virtio-comment@archiver.kernel.org>; Thu,  7 Dec 2023 05:35:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C8EE998402B; Thu,  7 Dec 2023 05:35:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 14DBE9868FD
	for <virtio-comment@lists.oasis-open.org>; Thu,  7 Dec 2023 05:34:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: -1BztQz6PGKkix0bo5xM-w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701927282; x=1702532082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jo633S60tJRRoBXfdEs0lNx/+t9Obk4YIu/plBCoSP0=;
        b=nGyGv8QTOiZY+oohQ8pfwe5l2xN3azni0k44+PgpjL67C8hm3oJnUyIDmrB/w9Qsaz
         d3jMB7r7DKQNfcboCpuDI6YaZYUE+Us4vDacaZIMBUNkrVryKTJn4vKtsbvc8mUzG4wC
         /+UJ4zjhaiOYxtpdYvCg7YtKYd6lg3TUM5QnRVQzMyxVIw+EHFKgf4GVyHlzFT9Iqe4d
         20WnOobiD7EYAki7nEy2I8eu4l39mtDFRAlcOtcouddPDRGFp8OhehBnQWkB2labqqOc
         I4QKftpLFnuUnpPdY+9LpdYOht6YhP+fvsN3pRvYcs6uo21TIDiCKeyUkb6VJMTD0IBF
         9pWA==
X-Gm-Message-State: AOJu0YwUkCcxyXd8ceMWrtTLInGIvl/8LyHSUNVSys32xzfkpuzIHEKF
	wQgOdgQWOTIbTY/1M5BzMP+fNqMxPSOgBrQyz339UvgJDtY0RrqYAi70gHYZSnRm4ioUcNbGb85
	lmb+mUJTZnXU29Qx8pbu3Z1qvMJfWOcRhKufhkLtyJ4jdTs1MOw==
X-Received: by 2002:a17:90a:5912:b0:286:bf8c:b9d8 with SMTP id k18-20020a17090a591200b00286bf8cb9d8mr1756942pji.83.1701927281583;
        Wed, 06 Dec 2023 21:34:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7WYYhTG6Fgb8iAtxEdW+8PHTyQM8Rg6Aeo/RH6rxDWaV6mqxdI+SO8pspUoFwmFKpiDNsJto6DSY+pk2dpEU=
X-Received: by 2002:a17:90a:5912:b0:286:bf8c:b9d8 with SMTP id
 k18-20020a17090a591200b00286bf8cb9d8mr1756937pji.83.1701927281229; Wed, 06
 Dec 2023 21:34:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701158152.git.hengqi@linux.alibaba.com>
 <CACGkMEsMhuNX3YzAAV52uDD_FWqPq8LdtQsx5EnWaqQn4RmDVg@mail.gmail.com>
 <68223a13-9124-4b44-aac7-851ab9bddf90@linux.alibaba.com> <CACGkMEvgJ-c3i4FSOMQSn=XcGOi2Be4gTS=rjB10KnADkrpw_Q@mail.gmail.com>
 <20231204035211-mutt-send-email-mst@kernel.org> <CACGkMEs=aM1n95xWkwJMCrbT1+sW1kHO=r0eMR-07OhrdPW8kw@mail.gmail.com>
 <20231204040528-mutt-send-email-mst@kernel.org> <4dee1860-4790-4217-b13f-3259172b653c@linux.alibaba.com>
 <CACGkMEtDTGafzOo1=-9LDhpQByA9Y=6NtPpUibLc=EVwC4CYXA@mail.gmail.com>
 <d11b39dc-a74b-4bde-9c2d-d7dae09f3c71@linux.alibaba.com> <20231205094318-mutt-send-email-mst@kernel.org>
 <bba2c20b-0f61-43f3-81e5-3311144e6208@linux.alibaba.com> <CACGkMEuGvz0xy9aML4oBJoStx-DW93LnGDdh6JMXyw3AhrgExA@mail.gmail.com>
 <1701849446.0349424-5-xuanzhuo@linux.alibaba.com> <CACGkMEsOeGbP5050RyDhMGvK_ZK=zziEuktWDHy0JCh9WHt8Cg@mail.gmail.com>
 <151752e2-1684-42a8-a53e-722da877c19b@linux.alibaba.com> <47e97f8c-fb88-4f32-8230-5b3357fb8091@linux.alibaba.com>
In-Reply-To: <47e97f8c-fb88-4f32-8230-5b3357fb8091@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 7 Dec 2023 13:34:29 +0800
Message-ID: <CACGkMEv+f+0cUPaOOpVrt6jofBudGwcG08VS+y_iDbcuU4QGvg@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v4 1/2] virtio-net: update
 description for VIRTIO_NET_F_GUEST_CSUM.

On Thu, Dec 7, 2023 at 12:52=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.com> =
wrote:
>
>
>
> =E5=9C=A8 2023/12/6 =E4=B8=8B=E5=8D=885:03, Heng Qi =E5=86=99=E9=81=93:
> >
> >
> > =E5=9C=A8 2023/12/6 =E4=B8=8B=E5=8D=884:46, Jason Wang =E5=86=99=E9=81=
=93:
> >> On Wed, Dec 6, 2023 at 4:08=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.aliba=
ba.com>
> >> wrote:
> >>> On Wed, 6 Dec 2023 12:36:53 +0800, Jason Wang <jasowang@redhat.com>
> >>> wrote:
> >>>> On Wed, Dec 6, 2023 at 10:21=E2=80=AFAM Heng Qi <hengqi@linux.alibab=
a.com>
> >>>> wrote:
> >>>>>
> >>>>>
> >>>>> =E5=9C=A8 2023/12/5 =E4=B8=8B=E5=8D=8810:45, Michael S. Tsirkin =E5=
=86=99=E9=81=93:
> >>>>>> On Tue, Dec 05, 2023 at 10:18:32PM +0800, Heng Qi wrote:
> >>>>>>> =E5=9C=A8 2023/12/5 =E4=B8=8A=E5=8D=8811:52, Jason Wang =E5=86=99=
=E9=81=93:
> >>>>>>>> On Mon, Dec 4, 2023 at 5:34=E2=80=AFPM Heng Qi
> >>>>>>>> <hengqi@linux.alibaba.com> wrote:
> >>>>>>>>> =E5=9C=A8 2023/12/4 =E4=B8=8B=E5=8D=885:05, Michael S. Tsirkin =
=E5=86=99=E9=81=93:
> >>>>>>>>>> On Mon, Dec 04, 2023 at 04:59:49PM +0800, Jason Wang wrote:
> >>>>>>>>>>> On Mon, Dec 4, 2023 at 4:53=E2=80=AFPM Michael S. Tsirkin
> >>>>>>>>>>> <mst@redhat.com> wrote:
> >>>>>>>>>>>> On Mon, Dec 04, 2023 at 04:49:46PM +0800, Jason Wang wrote:
> >>>>>>>>>>>>> On Mon, Dec 4, 2023 at 3:37=E2=80=AFPM Heng Qi
> >>>>>>>>>>>>> <hengqi@linux.alibaba.com> wrote:
> >>>>>>>>>>>>>> =E5=9C=A8 2023/12/4 =E4=B8=8B=E5=8D=883:18, Jason Wang =E5=
=86=99=E9=81=93:
> >>>>>>>>>>>>>>> On Fri, Dec 1, 2023 at 3:16=E2=80=AFPM Heng Qi
> >>>>>>>>>>>>>>> <hengqi@linux.alibaba.com> wrote:
> >>>>>>>>>>>>>>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=883:05, Jason Wang =
=E5=86=99=E9=81=93:
> >>>>>>>>>>>>>>>>> On Fri, Dec 1, 2023 at 2:30=E2=80=AFPM Heng Qi
> >>>>>>>>>>>>>>>>> <hengqi@linux.alibaba.com> wrote:
> >>>>>>>>>>>>>>>>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=882:24, Heng Qi =
=E5=86=99=E9=81=93:
> >>>>>>>>>>>>>>>>>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=881:18, Jason Wan=
g =E5=86=99=E9=81=93:
> >>>>>>>>>>>>>>>>>>>> On Wed, Nov 29, 2023 at 4:23=E2=80=AFPM Heng Qi
> >>>>>>>>>>>>>>>>>>>> <hengqi@linux.alibaba.com>
> >>>>>>>>>>>>>>>>>>>> wrote:
> >>>>>>>>>>>>>>>>>>>>> =E5=9C=A8 2023/11/29 =E4=B8=8B=E5=8D=884:00, Jason =
Wang =E5=86=99=E9=81=93:
> >>>>>>>>>>>>>>>>>>>>>> On Tue, Nov 28, 2023 at 4:08=E2=80=AFPM Heng Qi
> >>>>>>>>>>>>>>>>>>>>>> <hengqi@linux.alibaba.com>
> >>>>>>>>>>>>>>>>>>>>>> wrote:
> >>>>>>>>>>>>>>>>>>>>>>> To prevent readers from misunderstanding that
> >>>>>>>>>>>>>>>>>>>>>>> the driver can
> >>>>>>>>>>>>>>>>>>>>>>> only handles packets with partial checksum when
> >>>>>>>>>>>>>>>>>>>>>>> VIRTIO_NET_F_GUEST_CSUM is negotiated, we update
> >>>>>>>>>>>>>>>>>>>>>>> the description.
> >>>>>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>>>>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> >>>>>>>>>>>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>>>>>>>>>>> device-types/net/description.tex | 2 +-
> >>>>>>>>>>>>>>>>>>>>>>>          1 file changed, 1 insertion(+), 1
> >>>>>>>>>>>>>>>>>>>>>>> deletion(-)
> >>>>>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>>>>> diff --git a/device-types/net/description.tex
> >>>>>>>>>>>>>>>>>>>>>>> b/device-types/net/description.tex
> >>>>>>>>>>>>>>>>>>>>>>> index aff5e08..529f470 100644
> >>>>>>>>>>>>>>>>>>>>>>> --- a/device-types/net/description.tex
> >>>>>>>>>>>>>>>>>>>>>>> +++ b/device-types/net/description.tex
> >>>>>>>>>>>>>>>>>>>>>>> @@ -38,7 +38,7 @@ \subsection{Feature
> >>>>>>>>>>>>>>>>>>>>>>> bits}\label{sec:Device Types
> >>>>>>>>>>>>>>>>>>>>>>> / Network Device / Feature bits
> >>>>>>>>>>>>>>>>>>>>>>> \begin{description}
> >>>>>>>>>>>>>>>>>>>>>>> \item[VIRTIO_NET_F_CSUM (0)] Device handles
> >>>>>>>>>>>>>>>>>>>>>>> packets with
> >>>>>>>>>>>>>>>>>>>>>>> partial checksum offload.
> >>>>>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>>>>> -\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver
> >>>>>>>>>>>>>>>>>>>>>>> handles packets with
> >>>>>>>>>>>>>>>>>>>>>>> partial checksum.
> >>>>>>>>>>>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver
> >>>>>>>>>>>>>>>>>>>>>>> handles packets with
> >>>>>>>>>>>>>>>>>>>>>>> partial checksum or full checksum.
> >>>>>>>>>>>>>>>>>>>>>> So patch 2 said
> >>>>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>>>> "
> >>>>>>>>>>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver
> >>>>>>>>>>>>>>>>>>>>>> handles packets with
> >>>>>>>>>>>>>>>>>>>>>> full checksum.
> >>>>>>>>>>>>>>>>>>>>>> \end{description}
> >>>>>>>>>>>>>>>>>>>>>> "
> >>>>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>>>> Is there any difference between the two "full
> >>>>>>>>>>>>>>>>>>>>>> checksum" here?
> >>>>>>>>>>>>>>>>>>>>> There's no difference.
> >>>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>>> The core is that VIRTIO_NET_F_GUEST_FULL_CSUM
> >>>>>>>>>>>>>>>>>>>>> means that the driver
> >>>>>>>>>>>>>>>>>>>>> "can
> >>>>>>>>>>>>>>>>>>>>> only" handle packets with full checksum.
> >>>>>>>>>>>>>>>>>>>> This seems to be odd.
> >>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>> Driver can always handle packet with full checksum,
> >>>>>>>>>>>>>>>>>>>> no?
> >>>>>>>>>>>>>>>>>>> Yes.
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>> I meant it
> >>>>>>>>>>>>>>>>>>>> will be then to be functional equivalent to !
> >>>>>>>>>>>>>>>>>>>> VIRTIO_NET_F_GUEST_FULL_CSUM?
> >>>>>>>>>>>>>>>>>>> Are you referring to
> >>>>>>>>>>>>>>>>>>> "functional equivalent to !VIRTIO_NET_F_GUEST_CSUM" ?
> >>>>>>>>>>>>>>>>>> Sorry, this is a typo. I meant
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> Are you referring to
> >>>>>>>>>>>>>>>>>> "functional equivalent to
> >>>>>>>>>>>>>>>>>> !VIRTIO_NET_F_GUEST_FULL_CSUM" ?
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> If so, I think it's no.
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> Maybe a description similar to the following would
> >>>>>>>>>>>>>>>>>>> be more clearer:
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver
> >>>>>>>>>>>>>>>>>>> does not handle
> >>>>>>>>>>>>>>>>>>> packets with partial checksum.
> >>>>>>>>>>>>>>>>> I may miss something here, but what's the difference
> >>>>>>>>>>>>>>>>> between
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> VIRTIO_NET_F_GUEST_FULL_CSUM
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> and
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> !VIRTIO_NET_F_GUEST_CSUM?
> >>>>>>>>>>>>>>>>       From the device perspective:
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> If !VIRTIO_NET_F_GUEST_CSUM, the device delivers
> >>>>>>>>>>>>>>>> packets with full
> >>>>>>>>>>>>>>>> checksum to the driver,
> >>>>>>>>>>>>>>>> but the device can not validate the checksum for these
> >>>>>>>>>>>>>>>> packets. That is,
> >>>>>>>>>>>>>>>> the flags in virtio-net-hdr
> >>>>>>>>>>>>>>>> will not contain _DATA_VALID, and the driver or stack
> >>>>>>>>>>>>>>>> needs to validate
> >>>>>>>>>>>>>>>> these packets.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> If VIRTIO_NET_F_GUEST_FULL_CSUM, the device delivers
> >>>>>>>>>>>>>>>> packets with full
> >>>>>>>>>>>>>>>> checksum to the driver,
> >>>>>>>>>>>>>>>> and the device can validate the checksum for these
> >>>>>>>>>>>>>>>> packets. That is, the
> >>>>>>>>>>>>>>>> flags in virtio-net-hdr
> >>>>>>>>>>>>>>>> will contain _DATA_VALID,
> >>>>>>>>>>>>>>> I think DATA_VALID is optional here as device can't
> >>>>>>>>>>>>>>> recognize all type
> >>>>>>>>>>>>>>> of protocols.
> >>>>>>>>>>>>>> Yes, you are right, so I used "device *can*" here. Which
> >>>>>>>>>>>>>> packet types
> >>>>>>>>>>>>>> the device recognizes or validates
> >>>>>>>>>>>>>> depends on the device's implementation. This is also the
> >>>>>>>>>>>>>> current
> >>>>>>>>>>>>>> practice of GUEST_CSUM.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> and the driver or stack does not need to
> >>>>>>>>>>>>>>>> validate these packets.
> >>>>>>>>>>>>>>> Ok, so I think there're something that is subtle here,
> >>>>>>>>>>>>>> Ok, I see.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> and that's why
> >>>>>>>>>>>>>>> I'm asking here:
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> 1) "Driver does not handle packets with partial
> >>>>>>>>>>>>>>> checksum" is not
> >>>>>>>>>>>>>>> accurate, !GUEST_CUSM also fit for this definition.
> >>>>>>>>>>>>>>> 2) "Driver handles packets with full checksum" is kind
> >>>>>>>>>>>>>>> of ambiguous as
> >>>>>>>>>>>>>>> it doesn't say whether or not the packet has been
> >>>>>>>>>>>>>>> validated or not.
> >>>>>>>>>>>>>> Maybe the description below would be less subtle?
> >>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles
> >>>>>>>>>>>>>> packets with partial
> >>>>>>>>>>>>>> checksum or full checksum.
> >>>>>>>>>>>>> I'd suggest to leave it as is. As I didn't find any issue
> >>>>>>>>>>>>> since even
> >>>>>>>>>>>>> with DATA_VALID. Did you?
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] The driver
> >>>>>>>>>>>>>> handles packets
> >>>>>>>>>>>>>> with full checksum,
> >>>>>>>>>>>>>> and the device optionally validates the packet's checksum.
> >>>>>>>>>>>>> Or maybe something like (not a native speaker)
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> The driver handles packets with full checksum which the
> >>>>>>>>>>>>> device has
> >>>>>>>>>>>>> already validated.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Thanks
> >>>>>>>>>>>> I feel we just need a proper definition of what does "full
> >>>>>>>>>>>> checksum"
> >>>>>>>>>>>> mean in this context. It is used but not defined.
> >>>>>>>>>>>> Assume this feature was negotiated.
> >>>>>>>>>>>> My understanding is that this is just like
> >>>>>>>>>>>> VIRTIO_NET_F_GUEST_CSUM
> >>>>>>>>>>>> but certain values in the header are then disallowed? Which?
> >>>>>>>>>>>> This should be in the spec.
> >>>>>>>>>>> Yes, I think it is probably the headers that DATA_VALID can
> >>>>>>>>>>> work. We
> >>>>>>>>>>> never define it in the past.
> >>>>>>>>>>>
> >>>>>>>>>>> E.g in the Linux we map DATA_VALID to CHECKSUM_UNNECESSARY,
> >>>>>>>>>>> but it can
> >>>>>>>>>>> only work for some specific protocols:
> >>>>>>>>>>>
> >>>>>>>>>>> """
> >>>>>>>>>>>      *   %CHECKSUM_UNNECESSARY is applicable to following
> >>>>>>>>>>> protocols:
> >>>>>>>>>>>      *
> >>>>>>>>>>>      *     - TCP: IPv6 and IPv4.
> >>>>>>>>>>>      *     - UDP: IPv4 and IPv6. A device may apply
> >>>>>>>>>>> CHECKSUM_UNNECESSARY to a
> >>>>>>>>>>>      *       zero UDP checksum for either IPv4 or IPv6, the
> >>>>>>>>>>> networking stack
> >>>>>>>>>>>      *       may perform further validation in this case.
> >>>>>>>>>>>      *     - GRE: only if the checksum is present in the
> >>>>>>>>>>> header.
> >>>>>>>>>>>      *     - SCTP: indicates the CRC in SCTP header has been
> >>>>>>>>>>> validated.
> >>>>>>>>>>>      *     - FCOE: indicates the CRC in FC frame has been
> >>>>>>>>>>> validated.
> >>>>>>>>>>> """
> >>>>>>>>>>>
> >>>>>>>>>>> I'm not sure whether it's just fine to duplicate the
> >>>>>>>>>>> definition or
> >>>>>>>>>>> it's too late to define any now.
> >>>>>>>>>> I think it's mostly harmless for other protocols.
> >>>>>>>>> I'm not sure if this should be defined by a new FULL_CSUM
> >>>>>>>>> feature.
> >>>>>>>>> This seems to be an issue with GUEST_CSUM.
> >>>>>>>>>
> >>>>>>>>> I think we should supplement these with a new patch for
> >>>>>>>>> GUEST_CSUM?
> >>>>>>>> Probably. My understanding is:
> >>>>>>>>
> >>>>>>>> You want to reuse DATA_VALID here, so we need to stick to a
> >>>>>>>> consistent
> >>>>>>>> semantic for GUEST_CUSM and FULL_CSUM. So we need a definition o=
f
> >>>>>>>> "full csum" or what kind of packet could DATA_VALID work here.
> >>>>>>> I agree, we can be clear about what types of packets DATA_VALID
> >>>>>>> might
> >>>>>>> cover, e.g. TCP/UDP/GRE/SCTP/FoCE.
> >>>>>>>
> >>>>>>> But I think we also need something like
> >>>>>>> \field{supported_validate_types} to
> >>>>>>> indicate which packet types the device supports validating and
> >>>>>>> setting
> >>>>>>> DATA_VALID,
> >>>>>>> otherwise the device driver that negotiates this feature may
> >>>>>>> fail to live
> >>>>>>> migration.
> >>>>>>> Am I right?
> >>>>>>>
> >>>>>>> I'm not sure how GUEST_CSUM works now as it should also suffer
> >>>>>>> from the
> >>>>>>> above
> >>>>>>> mentioned issues with live migration, but no devices are
> >>>>>>> reporting this
> >>>>>>> right now.
> >>>>>>>
> >>>>>>> Maybe, each device only supports checksum verification for
> >>>>>>> TCP/UDP by
> >>>>>>> default? I don't know.
> >>>>>>> But I hope we can focus on this and get consensus, because our
> >>>>>>> hw release
> >>>>>>> date is coming soon.
> >>>>>>>
> >>>>>>> Thanks a lot!
> >>>>>> First, DATA_VALID is not a thing that hardware should ever use.
> >>>>>> It's a hack when packets are passed within host.
> >>>>> Get here. Thanks!
> >>>> So if I understand correctly, we need a new flag here and define the
> >>>> supported protocols.
> >>>
> >>> For what, migration?
> >> No.
> >>
> >> It's basically a question of whether or not we want to reuse
> >> DATA_VALID. It has limitations that it only works for some specific
> >> protocols.
> >
> > Yes, I understand what Xuan means is that we reuse DATA_VALID and
> > advertise
> > what specific protocols DATA_VALID covers.
> >
> > Back to supported_validate_types, now I think we really don't need to
> > let the device
> > provide this field. Why? Because asssuming the device provides it, it
> > seems useless
> > because the driver does not parse the protocol type for each packet
> > and does not use this field.
> > The driver and stack just want to know whether the packet is valid or
> > checksum unneccessary.
>
> Hi Jason and Michael.
>
> Are we aligned on this?

For supported_validate_types, I don't think we need it.

But I'm not sure if we are aligned.

>
> If yes, I'll write a new version to refresh the thread and try to avoid
> future rollbacks.

Maybe you can post a new version.

Thanks

>
> Thanks a lot!
>
> >
> > Thanks!
> >
> >>
> >> If we don't, we need a new flag.
> >>
> >> Thanks
> >
> >
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> >
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.p=
df
> > List Guidelines:
> > https://www.oasis-open.org/policies-guidelines/mailing-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
>


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

