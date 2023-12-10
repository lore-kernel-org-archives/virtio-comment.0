Return-Path: <virtio-comment-return-8764-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2D5C4167B
	for <virtio-comment@archiver.kernel.org>; Sun, 10 Dec 2023 05:39:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 41D182B06A
	for <virtio-comment@archiver.kernel.org>; Sun, 10 Dec 2023 05:39:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 24988986330
	for <virtio-comment@archiver.kernel.org>; Sun, 10 Dec 2023 05:39:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0896498420E; Sun, 10 Dec 2023 05:39:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E88D398427B
	for <virtio-comment@lists.oasis-open.org>; Sun, 10 Dec 2023 05:39:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702186771; x=1702791571;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WcK9yGDyJ7c2w75TpsnuZmbQeaVvYIs9zd+DelnevDo=;
        b=aN8eC1djbfjA032I0bWpB1AItCYwggfYlUEcyQa6romsLQ/eDwwopB95fMJwtYoriB
         o+mxLESj6OWshlOkNgVaB5x+KKG4kJPq4NTrIkV/hnHpFxZHLwnL7kYS3SL/1X8ousRg
         SqpisQrWW0XBRird2hV0v8f3FMFmYFJ58VcK/sqUiAIbTd42zTg6nw23o82xPs+E9AP+
         YBI9pYAm9kCu1eMDE4/P4y7BRKtO39k6/ZUgwDKhPNYHisPTs9ivdLUATDsZK67smDai
         tX5SShXMfjeIOxjafqEMia6GKexaPgpfMf6vnH8lm/1yucihI4erwKOn/+24y5qLM9GU
         WRKA==
X-Gm-Message-State: AOJu0YxDLfj+l7+HxV5Z0oWRTQICh10zhduK+S/0U1StCpHtD8wJ0aFU
	SCw6CV4dLRaCfID8cyKVqO+RKjPL8v41oZNyEQtYpw==
X-Google-Smtp-Source: AGHT+IFGLgOeTkwJlIp+ZEs9cZBBlbXyCAbsXo2lQ9sd/PGddgJgxdopNYBpcYAqmTpG2WrwzFn4kivycgooRMObYfA=
X-Received: by 2002:a2e:9c83:0:b0:2c9:f845:30d9 with SMTP id
 x3-20020a2e9c83000000b002c9f84530d9mr873828lji.83.1702186770853; Sat, 09 Dec
 2023 21:39:30 -0800 (PST)
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
 <CACGkMEv+f+0cUPaOOpVrt6jofBudGwcG08VS+y_iDbcuU4QGvg@mail.gmail.com>
In-Reply-To: <CACGkMEv+f+0cUPaOOpVrt6jofBudGwcG08VS+y_iDbcuU4QGvg@mail.gmail.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Sun, 10 Dec 2023 07:39:18 +0200
Message-ID: <CAOEp5Od5nBs31Fd-4JDNAzexQVdZA-O1o1AmuMzs_rZU=Bq_0A@mail.gmail.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	virtio-comment@lists.oasis-open.org, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Content-Type: multipart/alternative; boundary="000000000000d18358060c213d96"
Subject: Re: [virtio-comment] Re: [PATCH v4 1/2] virtio-net: update
 description for VIRTIO_NET_F_GUEST_CSUM.

--000000000000d18358060c213d96
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If somebody explains the problem that this patch addresses it will be very,
_very_ helpful.
We _were_ sure that if the host suggests  VIRTIO_NET_F_GUEST_CSUM and the
driver acks it - they both can do _more_ than without this feature.
Specifically the driver claims that it is able to deal with additional
types of incoming packets and such a way the device is able to provide
_more_ types of incoming packets than if this feature is not acked..
Shall we change our mind somehow?
I believe that if due to the presence of this feature the driver is _not_
able to do something this is a bug somewhere around the driver, isn't it?
Thank you in advance for the clarification.

On Thu, Dec 7, 2023 at 7:35=E2=80=AFAM Jason Wang <jasowang@redhat.com> wro=
te:

> On Thu, Dec 7, 2023 at 12:52=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.com=
> wrote:
> >
> >
> >
> > =E5=9C=A8 2023/12/6 =E4=B8=8B=E5=8D=885:03, Heng Qi =E5=86=99=E9=81=93:
> > >
> > >
> > > =E5=9C=A8 2023/12/6 =E4=B8=8B=E5=8D=884:46, Jason Wang =E5=86=99=E9=
=81=93:
> > >> On Wed, Dec 6, 2023 at 4:08=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.ali=
baba.com>
> > >> wrote:
> > >>> On Wed, 6 Dec 2023 12:36:53 +0800, Jason Wang <jasowang@redhat.com>
> > >>> wrote:
> > >>>> On Wed, Dec 6, 2023 at 10:21=E2=80=AFAM Heng Qi <hengqi@linux.alib=
aba.com>
> > >>>> wrote:
> > >>>>>
> > >>>>>
> > >>>>> =E5=9C=A8 2023/12/5 =E4=B8=8B=E5=8D=8810:45, Michael S. Tsirkin =
=E5=86=99=E9=81=93:
> > >>>>>> On Tue, Dec 05, 2023 at 10:18:32PM +0800, Heng Qi wrote:
> > >>>>>>> =E5=9C=A8 2023/12/5 =E4=B8=8A=E5=8D=8811:52, Jason Wang =E5=86=
=99=E9=81=93:
> > >>>>>>>> On Mon, Dec 4, 2023 at 5:34=E2=80=AFPM Heng Qi
> > >>>>>>>> <hengqi@linux.alibaba.com> wrote:
> > >>>>>>>>> =E5=9C=A8 2023/12/4 =E4=B8=8B=E5=8D=885:05, Michael S. Tsirki=
n =E5=86=99=E9=81=93:
> > >>>>>>>>>> On Mon, Dec 04, 2023 at 04:59:49PM +0800, Jason Wang wrote:
> > >>>>>>>>>>> On Mon, Dec 4, 2023 at 4:53=E2=80=AFPM Michael S. Tsirkin
> > >>>>>>>>>>> <mst@redhat.com> wrote:
> > >>>>>>>>>>>> On Mon, Dec 04, 2023 at 04:49:46PM +0800, Jason Wang wrote=
:
> > >>>>>>>>>>>>> On Mon, Dec 4, 2023 at 3:37=E2=80=AFPM Heng Qi
> > >>>>>>>>>>>>> <hengqi@linux.alibaba.com> wrote:
> > >>>>>>>>>>>>>> =E5=9C=A8 2023/12/4 =E4=B8=8B=E5=8D=883:18, Jason Wang =
=E5=86=99=E9=81=93:
> > >>>>>>>>>>>>>>> On Fri, Dec 1, 2023 at 3:16=E2=80=AFPM Heng Qi
> > >>>>>>>>>>>>>>> <hengqi@linux.alibaba.com> wrote:
> > >>>>>>>>>>>>>>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=883:05, Jason Wang=
 =E5=86=99=E9=81=93:
> > >>>>>>>>>>>>>>>>> On Fri, Dec 1, 2023 at 2:30=E2=80=AFPM Heng Qi
> > >>>>>>>>>>>>>>>>> <hengqi@linux.alibaba.com> wrote:
> > >>>>>>>>>>>>>>>>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=882:24, Heng Qi =
=E5=86=99=E9=81=93:
> > >>>>>>>>>>>>>>>>>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=881:18, Jason W=
ang =E5=86=99=E9=81=93:
> > >>>>>>>>>>>>>>>>>>>> On Wed, Nov 29, 2023 at 4:23=E2=80=AFPM Heng Qi
> > >>>>>>>>>>>>>>>>>>>> <hengqi@linux.alibaba.com>
> > >>>>>>>>>>>>>>>>>>>> wrote:
> > >>>>>>>>>>>>>>>>>>>>> =E5=9C=A8 2023/11/29 =E4=B8=8B=E5=8D=884:00, Jaso=
n Wang =E5=86=99=E9=81=93:
> > >>>>>>>>>>>>>>>>>>>>>> On Tue, Nov 28, 2023 at 4:08=E2=80=AFPM Heng Qi
> > >>>>>>>>>>>>>>>>>>>>>> <hengqi@linux.alibaba.com>
> > >>>>>>>>>>>>>>>>>>>>>> wrote:
> > >>>>>>>>>>>>>>>>>>>>>>> To prevent readers from misunderstanding that
> > >>>>>>>>>>>>>>>>>>>>>>> the driver can
> > >>>>>>>>>>>>>>>>>>>>>>> only handles packets with partial checksum when
> > >>>>>>>>>>>>>>>>>>>>>>> VIRTIO_NET_F_GUEST_CSUM is negotiated, we updat=
e
> > >>>>>>>>>>>>>>>>>>>>>>> the description.
> > >>>>>>>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>>>>>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.co=
m
> >
> > >>>>>>>>>>>>>>>>>>>>>>> ---
> > >>>>>>>>>>>>>>>>>>>>>>> device-types/net/description.tex | 2 +-
> > >>>>>>>>>>>>>>>>>>>>>>>          1 file changed, 1 insertion(+), 1
> > >>>>>>>>>>>>>>>>>>>>>>> deletion(-)
> > >>>>>>>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>>>>>> diff --git a/device-types/net/description.tex
> > >>>>>>>>>>>>>>>>>>>>>>> b/device-types/net/description.tex
> > >>>>>>>>>>>>>>>>>>>>>>> index aff5e08..529f470 100644
> > >>>>>>>>>>>>>>>>>>>>>>> --- a/device-types/net/description.tex
> > >>>>>>>>>>>>>>>>>>>>>>> +++ b/device-types/net/description.tex
> > >>>>>>>>>>>>>>>>>>>>>>> @@ -38,7 +38,7 @@ \subsection{Feature
> > >>>>>>>>>>>>>>>>>>>>>>> bits}\label{sec:Device Types
> > >>>>>>>>>>>>>>>>>>>>>>> / Network Device / Feature bits
> > >>>>>>>>>>>>>>>>>>>>>>> \begin{description}
> > >>>>>>>>>>>>>>>>>>>>>>> \item[VIRTIO_NET_F_CSUM (0)] Device handles
> > >>>>>>>>>>>>>>>>>>>>>>> packets with
> > >>>>>>>>>>>>>>>>>>>>>>> partial checksum offload.
> > >>>>>>>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>>>>>> -\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver
> > >>>>>>>>>>>>>>>>>>>>>>> handles packets with
> > >>>>>>>>>>>>>>>>>>>>>>> partial checksum.
> > >>>>>>>>>>>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver
> > >>>>>>>>>>>>>>>>>>>>>>> handles packets with
> > >>>>>>>>>>>>>>>>>>>>>>> partial checksum or full checksum.
> > >>>>>>>>>>>>>>>>>>>>>> So patch 2 said
> > >>>>>>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>>>>> "
> > >>>>>>>>>>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver
> > >>>>>>>>>>>>>>>>>>>>>> handles packets with
> > >>>>>>>>>>>>>>>>>>>>>> full checksum.
> > >>>>>>>>>>>>>>>>>>>>>> \end{description}
> > >>>>>>>>>>>>>>>>>>>>>> "
> > >>>>>>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>>>>> Is there any difference between the two "full
> > >>>>>>>>>>>>>>>>>>>>>> checksum" here?
> > >>>>>>>>>>>>>>>>>>>>> There's no difference.
> > >>>>>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>>>> The core is that VIRTIO_NET_F_GUEST_FULL_CSUM
> > >>>>>>>>>>>>>>>>>>>>> means that the driver
> > >>>>>>>>>>>>>>>>>>>>> "can
> > >>>>>>>>>>>>>>>>>>>>> only" handle packets with full checksum.
> > >>>>>>>>>>>>>>>>>>>> This seems to be odd.
> > >>>>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>>> Driver can always handle packet with full checksum=
,
> > >>>>>>>>>>>>>>>>>>>> no?
> > >>>>>>>>>>>>>>>>>>> Yes.
> > >>>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>>> I meant it
> > >>>>>>>>>>>>>>>>>>>> will be then to be functional equivalent to !
> > >>>>>>>>>>>>>>>>>>>> VIRTIO_NET_F_GUEST_FULL_CSUM?
> > >>>>>>>>>>>>>>>>>>> Are you referring to
> > >>>>>>>>>>>>>>>>>>> "functional equivalent to !VIRTIO_NET_F_GUEST_CSUM"=
 ?
> > >>>>>>>>>>>>>>>>>> Sorry, this is a typo. I meant
> > >>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>> Are you referring to
> > >>>>>>>>>>>>>>>>>> "functional equivalent to
> > >>>>>>>>>>>>>>>>>> !VIRTIO_NET_F_GUEST_FULL_CSUM" ?
> > >>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>> If so, I think it's no.
> > >>>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>> Maybe a description similar to the following would
> > >>>>>>>>>>>>>>>>>>> be more clearer:
> > >>>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver
> > >>>>>>>>>>>>>>>>>>> does not handle
> > >>>>>>>>>>>>>>>>>>> packets with partial checksum.
> > >>>>>>>>>>>>>>>>> I may miss something here, but what's the difference
> > >>>>>>>>>>>>>>>>> between
> > >>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>> VIRTIO_NET_F_GUEST_FULL_CSUM
> > >>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>> and
> > >>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>> !VIRTIO_NET_F_GUEST_CSUM?
> > >>>>>>>>>>>>>>>>       From the device perspective:
> > >>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>> If !VIRTIO_NET_F_GUEST_CSUM, the device delivers
> > >>>>>>>>>>>>>>>> packets with full
> > >>>>>>>>>>>>>>>> checksum to the driver,
> > >>>>>>>>>>>>>>>> but the device can not validate the checksum for these
> > >>>>>>>>>>>>>>>> packets. That is,
> > >>>>>>>>>>>>>>>> the flags in virtio-net-hdr
> > >>>>>>>>>>>>>>>> will not contain _DATA_VALID, and the driver or stack
> > >>>>>>>>>>>>>>>> needs to validate
> > >>>>>>>>>>>>>>>> these packets.
> > >>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>> If VIRTIO_NET_F_GUEST_FULL_CSUM, the device delivers
> > >>>>>>>>>>>>>>>> packets with full
> > >>>>>>>>>>>>>>>> checksum to the driver,
> > >>>>>>>>>>>>>>>> and the device can validate the checksum for these
> > >>>>>>>>>>>>>>>> packets. That is, the
> > >>>>>>>>>>>>>>>> flags in virtio-net-hdr
> > >>>>>>>>>>>>>>>> will contain _DATA_VALID,
> > >>>>>>>>>>>>>>> I think DATA_VALID is optional here as device can't
> > >>>>>>>>>>>>>>> recognize all type
> > >>>>>>>>>>>>>>> of protocols.
> > >>>>>>>>>>>>>> Yes, you are right, so I used "device *can*" here. Which
> > >>>>>>>>>>>>>> packet types
> > >>>>>>>>>>>>>> the device recognizes or validates
> > >>>>>>>>>>>>>> depends on the device's implementation. This is also the
> > >>>>>>>>>>>>>> current
> > >>>>>>>>>>>>>> practice of GUEST_CSUM.
> > >>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>> and the driver or stack does not need to
> > >>>>>>>>>>>>>>>> validate these packets.
> > >>>>>>>>>>>>>>> Ok, so I think there're something that is subtle here,
> > >>>>>>>>>>>>>> Ok, I see.
> > >>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> and that's why
> > >>>>>>>>>>>>>>> I'm asking here:
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> 1) "Driver does not handle packets with partial
> > >>>>>>>>>>>>>>> checksum" is not
> > >>>>>>>>>>>>>>> accurate, !GUEST_CUSM also fit for this definition.
> > >>>>>>>>>>>>>>> 2) "Driver handles packets with full checksum" is kind
> > >>>>>>>>>>>>>>> of ambiguous as
> > >>>>>>>>>>>>>>> it doesn't say whether or not the packet has been
> > >>>>>>>>>>>>>>> validated or not.
> > >>>>>>>>>>>>>> Maybe the description below would be less subtle?
> > >>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles
> > >>>>>>>>>>>>>> packets with partial
> > >>>>>>>>>>>>>> checksum or full checksum.
> > >>>>>>>>>>>>> I'd suggest to leave it as is. As I didn't find any issue
> > >>>>>>>>>>>>> since even
> > >>>>>>>>>>>>> with DATA_VALID. Did you?
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] The driver
> > >>>>>>>>>>>>>> handles packets
> > >>>>>>>>>>>>>> with full checksum,
> > >>>>>>>>>>>>>> and the device optionally validates the packet's checksu=
m.
> > >>>>>>>>>>>>> Or maybe something like (not a native speaker)
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>> The driver handles packets with full checksum which the
> > >>>>>>>>>>>>> device has
> > >>>>>>>>>>>>> already validated.
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>> Thanks
> > >>>>>>>>>>>> I feel we just need a proper definition of what does "full
> > >>>>>>>>>>>> checksum"
> > >>>>>>>>>>>> mean in this context. It is used but not defined.
> > >>>>>>>>>>>> Assume this feature was negotiated.
> > >>>>>>>>>>>> My understanding is that this is just like
> > >>>>>>>>>>>> VIRTIO_NET_F_GUEST_CSUM
> > >>>>>>>>>>>> but certain values in the header are then disallowed? Whic=
h?
> > >>>>>>>>>>>> This should be in the spec.
> > >>>>>>>>>>> Yes, I think it is probably the headers that DATA_VALID can
> > >>>>>>>>>>> work. We
> > >>>>>>>>>>> never define it in the past.
> > >>>>>>>>>>>
> > >>>>>>>>>>> E.g in the Linux we map DATA_VALID to CHECKSUM_UNNECESSARY,
> > >>>>>>>>>>> but it can
> > >>>>>>>>>>> only work for some specific protocols:
> > >>>>>>>>>>>
> > >>>>>>>>>>> """
> > >>>>>>>>>>>      *   %CHECKSUM_UNNECESSARY is applicable to following
> > >>>>>>>>>>> protocols:
> > >>>>>>>>>>>      *
> > >>>>>>>>>>>      *     - TCP: IPv6 and IPv4.
> > >>>>>>>>>>>      *     - UDP: IPv4 and IPv6. A device may apply
> > >>>>>>>>>>> CHECKSUM_UNNECESSARY to a
> > >>>>>>>>>>>      *       zero UDP checksum for either IPv4 or IPv6, the
> > >>>>>>>>>>> networking stack
> > >>>>>>>>>>>      *       may perform further validation in this case.
> > >>>>>>>>>>>      *     - GRE: only if the checksum is present in the
> > >>>>>>>>>>> header.
> > >>>>>>>>>>>      *     - SCTP: indicates the CRC in SCTP header has bee=
n
> > >>>>>>>>>>> validated.
> > >>>>>>>>>>>      *     - FCOE: indicates the CRC in FC frame has been
> > >>>>>>>>>>> validated.
> > >>>>>>>>>>> """
> > >>>>>>>>>>>
> > >>>>>>>>>>> I'm not sure whether it's just fine to duplicate the
> > >>>>>>>>>>> definition or
> > >>>>>>>>>>> it's too late to define any now.
> > >>>>>>>>>> I think it's mostly harmless for other protocols.
> > >>>>>>>>> I'm not sure if this should be defined by a new FULL_CSUM
> > >>>>>>>>> feature.
> > >>>>>>>>> This seems to be an issue with GUEST_CSUM.
> > >>>>>>>>>
> > >>>>>>>>> I think we should supplement these with a new patch for
> > >>>>>>>>> GUEST_CSUM?
> > >>>>>>>> Probably. My understanding is:
> > >>>>>>>>
> > >>>>>>>> You want to reuse DATA_VALID here, so we need to stick to a
> > >>>>>>>> consistent
> > >>>>>>>> semantic for GUEST_CUSM and FULL_CSUM. So we need a definition
> of
> > >>>>>>>> "full csum" or what kind of packet could DATA_VALID work here.
> > >>>>>>> I agree, we can be clear about what types of packets DATA_VALID
> > >>>>>>> might
> > >>>>>>> cover, e.g. TCP/UDP/GRE/SCTP/FoCE.
> > >>>>>>>
> > >>>>>>> But I think we also need something like
> > >>>>>>> \field{supported_validate_types} to
> > >>>>>>> indicate which packet types the device supports validating and
> > >>>>>>> setting
> > >>>>>>> DATA_VALID,
> > >>>>>>> otherwise the device driver that negotiates this feature may
> > >>>>>>> fail to live
> > >>>>>>> migration.
> > >>>>>>> Am I right?
> > >>>>>>>
> > >>>>>>> I'm not sure how GUEST_CSUM works now as it should also suffer
> > >>>>>>> from the
> > >>>>>>> above
> > >>>>>>> mentioned issues with live migration, but no devices are
> > >>>>>>> reporting this
> > >>>>>>> right now.
> > >>>>>>>
> > >>>>>>> Maybe, each device only supports checksum verification for
> > >>>>>>> TCP/UDP by
> > >>>>>>> default? I don't know.
> > >>>>>>> But I hope we can focus on this and get consensus, because our
> > >>>>>>> hw release
> > >>>>>>> date is coming soon.
> > >>>>>>>
> > >>>>>>> Thanks a lot!
> > >>>>>> First, DATA_VALID is not a thing that hardware should ever use.
> > >>>>>> It's a hack when packets are passed within host.
> > >>>>> Get here. Thanks!
> > >>>> So if I understand correctly, we need a new flag here and define t=
he
> > >>>> supported protocols.
> > >>>
> > >>> For what, migration?
> > >> No.
> > >>
> > >> It's basically a question of whether or not we want to reuse
> > >> DATA_VALID. It has limitations that it only works for some specific
> > >> protocols.
> > >
> > > Yes, I understand what Xuan means is that we reuse DATA_VALID and
> > > advertise
> > > what specific protocols DATA_VALID covers.
> > >
> > > Back to supported_validate_types, now I think we really don't need to
> > > let the device
> > > provide this field. Why? Because asssuming the device provides it, it
> > > seems useless
> > > because the driver does not parse the protocol type for each packet
> > > and does not use this field.
> > > The driver and stack just want to know whether the packet is valid or
> > > checksum unneccessary.
> >
> > Hi Jason and Michael.
> >
> > Are we aligned on this?
>
> For supported_validate_types, I don't think we need it.
>
> But I'm not sure if we are aligned.
>
> >
> > If yes, I'll write a new version to refresh the thread and try to avoid
> > future rollbacks.
>
> Maybe you can post a new version.
>
> Thanks
>
> >
> > Thanks a lot!
> >
> > >
> > > Thanks!
> > >
> > >>
> > >> If we don't, we need a new flag.
> > >>
> > >> Thanks
> > >
> > >
> > > This publicly archived list offers a means to provide input to the
> > > OASIS Virtual I/O Device (VIRTIO) TC.
> > >
> > > In order to verify user consent to the Feedback License terms and
> > > to minimize spam in the list archive, subscription is required
> > > before posting.
> > >
> > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > List help: virtio-comment-help@lists.oasis-open.org
> > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > Feedback License:
> https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > List Guidelines:
> > > https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > Committee: https://www.oasis-open.org/committees/virtio/
> > > Join OASIS: https://www.oasis-open.org/join/
> >
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines:
> https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>
>

--000000000000d18358060c213d96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If somebody explains the problem that=C2=A0this=C2=A0patch=
 addresses it will be very, _very_ helpful.<div>We _were_ sure that if the =
host suggests=C2=A0

 VIRTIO_NET_F_GUEST_CSUM and the driver acks it - they both can do _more_ t=
han without this feature.</div><div>Specifically the driver claims that it =
is able to deal with additional types of incoming packets and such a way th=
e device is able to provide _more_ types of incoming packets than=C2=A0if t=
his feature is not acked..</div><div>Shall we change our mind somehow?</div=
><div>I believe that if due to the presence of this feature the driver is _=
not_ able to do something this is a bug somewhere around the driver, isn&#3=
9;t=C2=A0it?</div><div>Thank you in advance for the clarification.</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Thu, Dec 7, 2023 at 7:35=E2=80=AFAM Jason Wang &lt;<a href=3D"mailto:jasowa=
ng@redhat.com">jasowang@redhat.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Thu, Dec 7, 2023 at 12:52=E2=80=AFPM H=
eng Qi &lt;<a href=3D"mailto:hengqi@linux.alibaba.com" target=3D"_blank">he=
ngqi@linux.alibaba.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; =E5=9C=A8 2023/12/6 =E4=B8=8B=E5=8D=885:03, Heng Qi =E5=86=99=E9=81=93=
:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; =E5=9C=A8 2023/12/6 =E4=B8=8B=E5=8D=884:46, Jason Wang =E5=86=99=
=E9=81=93:<br>
&gt; &gt;&gt; On Wed, Dec 6, 2023 at 4:08=E2=80=AFPM Xuan Zhuo &lt;<a href=
=3D"mailto:xuanzhuo@linux.alibaba.com" target=3D"_blank">xuanzhuo@linux.ali=
baba.com</a>&gt;<br>
&gt; &gt;&gt; wrote:<br>
&gt; &gt;&gt;&gt; On Wed, 6 Dec 2023 12:36:53 +0800, Jason Wang &lt;<a href=
=3D"mailto:jasowang@redhat.com" target=3D"_blank">jasowang@redhat.com</a>&g=
t;<br>
&gt; &gt;&gt;&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt; On Wed, Dec 6, 2023 at 10:21=E2=80=AFAM Heng Qi &lt;<=
a href=3D"mailto:hengqi@linux.alibaba.com" target=3D"_blank">hengqi@linux.a=
libaba.com</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; =E5=9C=A8 2023/12/5 =E4=B8=8B=E5=8D=8810:45, Mich=
ael S. Tsirkin =E5=86=99=E9=81=93:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; On Tue, Dec 05, 2023 at 10:18:32PM +0800, Hen=
g Qi wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; =E5=9C=A8 2023/12/5 =E4=B8=8A=E5=8D=8811:=
52, Jason Wang =E5=86=99=E9=81=93:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Mon, Dec 4, 2023 at 5:34=E2=80=AFP=
M Heng Qi<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:hengqi@linux.al=
ibaba.com" target=3D"_blank">hengqi@linux.alibaba.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; =E5=9C=A8 2023/12/4 =E4=B8=8B=E5=
=8D=885:05, Michael S. Tsirkin =E5=86=99=E9=81=93:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Mon, Dec 04, 2023 at 04:59=
:49PM +0800, Jason Wang wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Mon, Dec 4, 2023 at 4:=
53=E2=80=AFPM Michael S. Tsirkin<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:mst=
@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Mon, Dec 04, 2023 =
at 04:49:46PM +0800, Jason Wang wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Mon, Dec 4, 20=
23 at 3:37=E2=80=AFPM Heng Qi<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"ma=
ilto:hengqi@linux.alibaba.com" target=3D"_blank">hengqi@linux.alibaba.com</=
a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; =E5=9C=A8 202=
3/12/4 =E4=B8=8B=E5=8D=883:18, Jason Wang =E5=86=99=E9=81=93:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Fri, D=
ec 1, 2023 at 3:16=E2=80=AFPM Heng Qi<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a hr=
ef=3D"mailto:hengqi@linux.alibaba.com" target=3D"_blank">hengqi@linux.aliba=
ba.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; =E5=
=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=883:05, Jason Wang =E5=86=99=E9=81=93:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; O=
n Fri, Dec 1, 2023 at 2:30=E2=80=AFPM Heng Qi<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &=
lt;<a href=3D"mailto:hengqi@linux.alibaba.com" target=3D"_blank">hengqi@lin=
ux.alibaba.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t; =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=882:24, Heng Qi =E5=86=99=E9=81=93:<=
br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt; =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=881:18, Jason Wang =E5=86=99=E9=
=81=93:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt; On Wed, Nov 29, 2023 at 4:23=E2=80=AFPM Heng Qi<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt; &lt;<a href=3D"mailto:hengqi@linux.alibaba.com" target=3D"_blank=
">hengqi@linux.alibaba.com</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt; =E5=9C=A8 2023/11/29 =E4=B8=8B=E5=8D=884:00, Jason Wang =E5=
=86=99=E9=81=93:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt; On Tue, Nov 28, 2023 at 4:08=E2=80=AFPM Heng Qi<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:hengqi@linux.alibaba.com" target=
=3D"_blank">hengqi@linux.alibaba.com</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; To prevent readers from misunderstanding that<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; the driver can<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; only handles packets with partial checksum when<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; VIRTIO_NET_F_GUEST_CSUM is negotiated, we update<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; the description.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Heng Qi &lt;<a href=3D"mailto:hengqi@=
linux.alibaba.com" target=3D"_blank">hengqi@linux.alibaba.com</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; device-types/net/description.tex | 2 +-<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 file changed, 1 =
insertion(+), 1<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; deletion(-)<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; diff --git a/device-types/net/description.tex<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; b/device-types/net/description.tex<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; index aff5e08..529f470 100644<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; --- a/device-types/net/description.tex<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; +++ b/device-types/net/description.tex<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; @@ -38,7 +38,7 @@ \subsection{Feature<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; bits}\label{sec:Device Types<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; / Network Device / Feature bits<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; \begin{description}<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; \item[VIRTIO_NET_F_CSUM (0)] Device handles<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; packets with<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; partial checksum offload.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; -\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; handles packets with<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; partial checksum.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; handles packets with<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt; partial checksum or full checksum.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt; So patch 2 said<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt; &quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt; +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt; handles packets with<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt; full checksum.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt; \end{description}<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt; &quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt; Is there any difference between the two &quot;full<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt; checksum&quot; here?<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt; There&#39;s no difference.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt; The core is that VIRTIO_NET_F_GUEST_FULL_CSUM<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt; means that the driver<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt; &quot;can<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt; only&quot; handle packets with full checksum.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt; This seems to be odd.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt; Driver can always handle packet with full checksum,<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt; no?<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt; Yes.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt; I meant it<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt; will be then to be functional equivalent to !<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt; VIRTIO_NET_F_GUEST_FULL_CSUM?<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt; Are you referring to<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt; &quot;functional equivalent to !VIRTIO_NET_F_GUEST_CSUM&quot; ?<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t; Sorry, this is a typo. I meant<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t; Are you referring to<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t; &quot;functional equivalent to<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t; !VIRTIO_NET_F_GUEST_FULL_CSUM&quot; ?<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt; If so, I think it&#39;s no.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt; Maybe a description similar to the following would<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt; be more clearer:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt; +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt; does not handle<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt; packets with partial checksum.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I=
 may miss something here, but what&#39;s the difference<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; b=
etween<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; V=
IRTIO_NET_F_GUEST_FULL_CSUM<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; a=
nd<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; !=
VIRTIO_NET_F_GUEST_CSUM?<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0From the device perspective:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; If !V=
IRTIO_NET_F_GUEST_CSUM, the device delivers<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; packe=
ts with full<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; check=
sum to the driver,<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; but t=
he device can not validate the checksum for these<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; packe=
ts. That is,<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; the f=
lags in virtio-net-hdr<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; will =
not contain _DATA_VALID, and the driver or stack<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; needs=
 to validate<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; these=
 packets.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; If VI=
RTIO_NET_F_GUEST_FULL_CSUM, the device delivers<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; packe=
ts with full<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; check=
sum to the driver,<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; and t=
he device can validate the checksum for these<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; packe=
ts. That is, the<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; flags=
 in virtio-net-hdr<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; will =
contain _DATA_VALID,<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I think D=
ATA_VALID is optional here as device can&#39;t<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; recognize=
 all type<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; of protoc=
ols.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Yes, you are =
right, so I used &quot;device *can*&quot; here. Which<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; packet types<=
br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; the device re=
cognizes or validates<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; depends on th=
e device&#39;s implementation. This is also the<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; current<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; practice of G=
UEST_CSUM.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; and t=
he driver or stack does not need to<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; valid=
ate these packets.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Ok, so I =
think there&#39;re something that is subtle here,<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Ok, I see.<br=
>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; and that&=
#39;s why<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I&#39;m a=
sking here:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; 1) &quot;=
Driver does not handle packets with partial<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; checksum&=
quot; is not<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; accurate,=
 !GUEST_CUSM also fit for this definition.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; 2) &quot;=
Driver handles packets with full checksum&quot; is kind<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; of ambigu=
ous as<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; it doesn&=
#39;t say whether or not the packet has been<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; validated=
 or not.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Maybe the des=
cription below would be less subtle?<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +\item[VIRTIO=
_NET_F_GUEST_CSUM (1)] Driver handles<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; packets with =
partial<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; checksum or f=
ull checksum.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I&#39;d suggest t=
o leave it as is. As I didn&#39;t find any issue<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; since even<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; with DATA_VALID. =
Did you?<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +\item[VIRTIO=
_NET_F_GUEST_FULL_CSUM (64)] The driver<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; handles packe=
ts<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; with full che=
cksum,<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; and the devic=
e optionally validates the packet&#39;s checksum.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Or maybe somethin=
g like (not a native speaker)<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; The driver handle=
s packets with full checksum which the<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; device has<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; already validated=
.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Thanks<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I feel we just need a=
 proper definition of what does &quot;full<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; checksum&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; mean in this context.=
 It is used but not defined.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Assume this feature w=
as negotiated.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; My understanding is t=
hat this is just like<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; VIRTIO_NET_F_GUEST_CS=
UM<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; but certain values in=
 the header are then disallowed? Which?<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; This should be in the=
 spec.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Yes, I think it is probab=
ly the headers that DATA_VALID can<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; work. We<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; never define it in the pa=
st.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; E.g in the Linux we map D=
ATA_VALID to CHECKSUM_UNNECESSARY,<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; but it can<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; only work for some specif=
ic protocols:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &quot;&quot;&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 *=C2=
=A0 =C2=A0%CHECKSUM_UNNECESSARY is applicable to following<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; protocols:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 *=C2=
=A0 =C2=A0 =C2=A0- TCP: IPv6 and IPv4.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 *=C2=
=A0 =C2=A0 =C2=A0- UDP: IPv4 and IPv6. A device may apply<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; CHECKSUM_UNNECESSARY to a=
<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 *=C2=
=A0 =C2=A0 =C2=A0 =C2=A0zero UDP checksum for either IPv4 or IPv6, the<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; networking stack<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 *=C2=
=A0 =C2=A0 =C2=A0 =C2=A0may perform further validation in this case.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 *=C2=
=A0 =C2=A0 =C2=A0- GRE: only if the checksum is present in the<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; header.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 *=C2=
=A0 =C2=A0 =C2=A0- SCTP: indicates the CRC in SCTP header has been<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; validated.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 *=C2=
=A0 =C2=A0 =C2=A0- FCOE: indicates the CRC in FC frame has been<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; validated.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &quot;&quot;&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I&#39;m not sure whether =
it&#39;s just fine to duplicate the<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; definition or<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; it&#39;s too late to defi=
ne any now.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I think it&#39;s mostly harml=
ess for other protocols.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I&#39;m not sure if this should b=
e defined by a new FULL_CSUM<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; feature.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; This seems to be an issue with GU=
EST_CSUM.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I think we should supplement thes=
e with a new patch for<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; GUEST_CSUM?<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Probably. My understanding is:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; You want to reuse DATA_VALID here, so=
 we need to stick to a<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; consistent<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; semantic for GUEST_CUSM and FULL_CSUM=
. So we need a definition of<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &quot;full csum&quot; or what kind of=
 packet could DATA_VALID work here.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; I agree, we can be clear about what types=
 of packets DATA_VALID<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; might<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; cover, e.g. TCP/UDP/GRE/SCTP/FoCE.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; But I think we also need something like<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; \field{supported_validate_types} to<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; indicate which packet types the device su=
pports validating and<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; setting<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; DATA_VALID,<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; otherwise the device driver that negotiat=
es this feature may<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; fail to live<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; migration.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; Am I right?<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; I&#39;m not sure how GUEST_CSUM works now=
 as it should also suffer<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; from the<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; above<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; mentioned issues with live migration, but=
 no devices are<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; reporting this<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; right now.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; Maybe, each device only supports checksum=
 verification for<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; TCP/UDP by<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; default? I don&#39;t know.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; But I hope we can focus on this and get c=
onsensus, because our<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; hw release<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; date is coming soon.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; Thanks a lot!<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; First, DATA_VALID is not a thing that hardwar=
e should ever use.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; It&#39;s a hack when packets are passed withi=
n host.<br>
&gt; &gt;&gt;&gt;&gt;&gt; Get here. Thanks!<br>
&gt; &gt;&gt;&gt;&gt; So if I understand correctly, we need a new flag here=
 and define the<br>
&gt; &gt;&gt;&gt;&gt; supported protocols.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; For what, migration?<br>
&gt; &gt;&gt; No.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; It&#39;s basically a question of whether or not we want to re=
use<br>
&gt; &gt;&gt; DATA_VALID. It has limitations that it only works for some sp=
ecific<br>
&gt; &gt;&gt; protocols.<br>
&gt; &gt;<br>
&gt; &gt; Yes, I understand what Xuan means is that we reuse DATA_VALID and=
<br>
&gt; &gt; advertise<br>
&gt; &gt; what specific protocols DATA_VALID covers.<br>
&gt; &gt;<br>
&gt; &gt; Back to supported_validate_types, now I think we really don&#39;t=
 need to<br>
&gt; &gt; let the device<br>
&gt; &gt; provide this field. Why? Because asssuming the device provides it=
, it<br>
&gt; &gt; seems useless<br>
&gt; &gt; because the driver does not parse the protocol type for each pack=
et<br>
&gt; &gt; and does not use this field.<br>
&gt; &gt; The driver and stack just want to know whether the packet is vali=
d or<br>
&gt; &gt; checksum unneccessary.<br>
&gt;<br>
&gt; Hi Jason and Michael.<br>
&gt;<br>
&gt; Are we aligned on this?<br>
<br>
For supported_validate_types, I don&#39;t think we need it.<br>
<br>
But I&#39;m not sure if we are aligned.<br>
<br>
&gt;<br>
&gt; If yes, I&#39;ll write a new version to refresh the thread and try to =
avoid<br>
&gt; future rollbacks.<br>
<br>
Maybe you can post a new version.<br>
<br>
Thanks<br>
<br>
&gt;<br>
&gt; Thanks a lot!<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Thanks!<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; If we don&#39;t, we need a new flag.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Thanks<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; This publicly archived list offers a means to provide input to th=
e<br>
&gt; &gt; OASIS Virtual I/O Device (VIRTIO) TC.<br>
&gt; &gt;<br>
&gt; &gt; In order to verify user consent to the Feedback License terms and=
<br>
&gt; &gt; to minimize spam in the list archive, subscription is required<br=
>
&gt; &gt; before posting.<br>
&gt; &gt;<br>
&gt; &gt; Subscribe: <a href=3D"mailto:virtio-comment-subscribe@lists.oasis=
-open.org" target=3D"_blank">virtio-comment-subscribe@lists.oasis-open.org<=
/a><br>
&gt; &gt; Unsubscribe: <a href=3D"mailto:virtio-comment-unsubscribe@lists.o=
asis-open.org" target=3D"_blank">virtio-comment-unsubscribe@lists.oasis-ope=
n.org</a><br>
&gt; &gt; List help: <a href=3D"mailto:virtio-comment-help@lists.oasis-open=
.org" target=3D"_blank">virtio-comment-help@lists.oasis-open.org</a><br>
&gt; &gt; List archive: <a href=3D"https://lists.oasis-open.org/archives/vi=
rtio-comment/" rel=3D"noreferrer" target=3D"_blank">https://lists.oasis-ope=
n.org/archives/virtio-comment/</a><br>
&gt; &gt; Feedback License: <a href=3D"https://www.oasis-open.org/who/ipr/f=
eedback_license.pdf" rel=3D"noreferrer" target=3D"_blank">https://www.oasis=
-open.org/who/ipr/feedback_license.pdf</a><br>
&gt; &gt; List Guidelines:<br>
&gt; &gt; <a href=3D"https://www.oasis-open.org/policies-guidelines/mailing=
-lists" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.org/pol=
icies-guidelines/mailing-lists</a><br>
&gt; &gt; Committee: <a href=3D"https://www.oasis-open.org/committees/virti=
o/" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.org/committ=
ees/virtio/</a><br>
&gt; &gt; Join OASIS: <a href=3D"https://www.oasis-open.org/join/" rel=3D"n=
oreferrer" target=3D"_blank">https://www.oasis-open.org/join/</a><br>
&gt;<br>
<br>
<br>
This publicly archived list offers a means to provide input to the<br>
OASIS Virtual I/O Device (VIRTIO) TC.<br>
<br>
In order to verify user consent to the Feedback License terms and<br>
to minimize spam in the list archive, subscription is required<br>
before posting.<br>
<br>
Subscribe: <a href=3D"mailto:virtio-comment-subscribe@lists.oasis-open.org"=
 target=3D"_blank">virtio-comment-subscribe@lists.oasis-open.org</a><br>
Unsubscribe: <a href=3D"mailto:virtio-comment-unsubscribe@lists.oasis-open.=
org" target=3D"_blank">virtio-comment-unsubscribe@lists.oasis-open.org</a><=
br>
List help: <a href=3D"mailto:virtio-comment-help@lists.oasis-open.org" targ=
et=3D"_blank">virtio-comment-help@lists.oasis-open.org</a><br>
List archive: <a href=3D"https://lists.oasis-open.org/archives/virtio-comme=
nt/" rel=3D"noreferrer" target=3D"_blank">https://lists.oasis-open.org/arch=
ives/virtio-comment/</a><br>
Feedback License: <a href=3D"https://www.oasis-open.org/who/ipr/feedback_li=
cense.pdf" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.org/=
who/ipr/feedback_license.pdf</a><br>
List Guidelines: <a href=3D"https://www.oasis-open.org/policies-guidelines/=
mailing-lists" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.=
org/policies-guidelines/mailing-lists</a><br>
Committee: <a href=3D"https://www.oasis-open.org/committees/virtio/" rel=3D=
"noreferrer" target=3D"_blank">https://www.oasis-open.org/committees/virtio=
/</a><br>
Join OASIS: <a href=3D"https://www.oasis-open.org/join/" rel=3D"noreferrer"=
 target=3D"_blank">https://www.oasis-open.org/join/</a><br>
<br>
</blockquote></div>

--000000000000d18358060c213d96--
