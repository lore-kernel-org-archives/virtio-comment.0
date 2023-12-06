Return-Path: <virtio-comment-return-8745-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90985C4167B
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 04:37:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DDF4B216A8
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 04:37:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D09EF9867BD
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 04:37:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C39FE983FE1; Wed,  6 Dec 2023 04:37:08 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B5F1F986688
	for <virtio-comment@lists.oasis-open.org>; Wed,  6 Dec 2023 04:37:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: fYNvViJTM7q7sRxBUNq9yA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701837424; x=1702442224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMji5qT+vSk7BM+3nd6nZ6lMIG7RZX8dazUD/1ZGDF0=;
        b=I2+ao3JVoeV90ZKhMB7THPqi47C1bwj/+gXrZ8xHqWp8rVOKzbM9v7huwfPp6cmqhi
         RR3P6TUpw86fa/CAtGTtP8kvVMgIAK5eFBxQcBoHlBVjcFd/cYHzaK+XilQHhSC104Yn
         hZKtiG5+nqIHmeDBPYEKIi1jimGekTpwB8Ypt56RvThh3ufLKsDhCfRNiOjbtH0V9coE
         Wb8rZ0YE+AUfDUJwbYfyTQX1al1XylhVcnd71Xgz7HJEr2AgZCksWcqOthfNVzl8K3GD
         VbKl25naD2bg0kf1YhmbGvau/sFI1oWFpRV4RP6cI1YitLZDcNg36Os0P3HkDaCdkruK
         sClw==
X-Gm-Message-State: AOJu0YxMVxnJeEOAru4EFAtAL6mCW23xfaG5vWFvl7dPkzwKGNQt4t44
	o13LTDagLhwVyCn+gPOqtvqXeGnsMehZ782Mb0Aws6u2DmMcc6Kgdr1cV65pdVIWJASn4sUVvnt
	arEwLi3niwyIbW/GkrkWR50mmKB6hFSJgji2yH3A2fDby3UJuV5ENm+rM17zLjVY=
X-Received: by 2002:ac2:562b:0:b0:50b:d764:8e38 with SMTP id b11-20020ac2562b000000b0050bd7648e38mr90207lff.74.1701837424547;
        Tue, 05 Dec 2023 20:37:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4VQcjwZ+74cbBuPsYZwzY82w07UmVGoON9bROkSu6gH9JbH5tN4aIbWj68gOA+0XD9bILWCNJDdOsoj1pIwc=
X-Received: by 2002:ac2:562b:0:b0:50b:d764:8e38 with SMTP id
 b11-20020ac2562b000000b0050bd7648e38mr90202lff.74.1701837424175; Tue, 05 Dec
 2023 20:37:04 -0800 (PST)
MIME-Version: 1.0
References: <b37db3db-ffb8-4fce-9ec9-2fc248fd57df@linux.alibaba.com>
 <CACGkMEsMhuNX3YzAAV52uDD_FWqPq8LdtQsx5EnWaqQn4RmDVg@mail.gmail.com>
 <68223a13-9124-4b44-aac7-851ab9bddf90@linux.alibaba.com> <CACGkMEvgJ-c3i4FSOMQSn=XcGOi2Be4gTS=rjB10KnADkrpw_Q@mail.gmail.com>
 <20231204035211-mutt-send-email-mst@kernel.org> <CACGkMEs=aM1n95xWkwJMCrbT1+sW1kHO=r0eMR-07OhrdPW8kw@mail.gmail.com>
 <20231204040528-mutt-send-email-mst@kernel.org> <4dee1860-4790-4217-b13f-3259172b653c@linux.alibaba.com>
 <CACGkMEtDTGafzOo1=-9LDhpQByA9Y=6NtPpUibLc=EVwC4CYXA@mail.gmail.com>
 <d11b39dc-a74b-4bde-9c2d-d7dae09f3c71@linux.alibaba.com> <20231205094318-mutt-send-email-mst@kernel.org>
 <bba2c20b-0f61-43f3-81e5-3311144e6208@linux.alibaba.com>
In-Reply-To: <bba2c20b-0f61-43f3-81e5-3311144e6208@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 6 Dec 2023 12:36:53 +0800
Message-ID: <CACGkMEuGvz0xy9aML4oBJoStx-DW93LnGDdh6JMXyw3AhrgExA@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v4 1/2] virtio-net: update
 description for VIRTIO_NET_F_GUEST_CSUM.

On Wed, Dec 6, 2023 at 10:21=E2=80=AFAM Heng Qi <hengqi@linux.alibaba.com> =
wrote:
>
>
>
> =E5=9C=A8 2023/12/5 =E4=B8=8B=E5=8D=8810:45, Michael S. Tsirkin =E5=86=99=
=E9=81=93:
> > On Tue, Dec 05, 2023 at 10:18:32PM +0800, Heng Qi wrote:
> >>
> >> =E5=9C=A8 2023/12/5 =E4=B8=8A=E5=8D=8811:52, Jason Wang =E5=86=99=E9=
=81=93:
> >>> On Mon, Dec 4, 2023 at 5:34=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.=
com> wrote:
> >>>>
> >>>> =E5=9C=A8 2023/12/4 =E4=B8=8B=E5=8D=885:05, Michael S. Tsirkin =E5=
=86=99=E9=81=93:
> >>>>> On Mon, Dec 04, 2023 at 04:59:49PM +0800, Jason Wang wrote:
> >>>>>> On Mon, Dec 4, 2023 at 4:53=E2=80=AFPM Michael S. Tsirkin <mst@red=
hat.com> wrote:
> >>>>>>> On Mon, Dec 04, 2023 at 04:49:46PM +0800, Jason Wang wrote:
> >>>>>>>> On Mon, Dec 4, 2023 at 3:37=E2=80=AFPM Heng Qi <hengqi@linux.ali=
baba.com> wrote:
> >>>>>>>>> =E5=9C=A8 2023/12/4 =E4=B8=8B=E5=8D=883:18, Jason Wang =E5=86=
=99=E9=81=93:
> >>>>>>>>>> On Fri, Dec 1, 2023 at 3:16=E2=80=AFPM Heng Qi <hengqi@linux.a=
libaba.com> wrote:
> >>>>>>>>>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=883:05, Jason Wang =E5=86=
=99=E9=81=93:
> >>>>>>>>>>>> On Fri, Dec 1, 2023 at 2:30=E2=80=AFPM Heng Qi <hengqi@linux=
.alibaba.com> wrote:
> >>>>>>>>>>>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=882:24, Heng Qi =E5=86=
=99=E9=81=93:
> >>>>>>>>>>>>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=881:18, Jason Wang =E5=
=86=99=E9=81=93:
> >>>>>>>>>>>>>>> On Wed, Nov 29, 2023 at 4:23=E2=80=AFPM Heng Qi <hengqi@l=
inux.alibaba.com>
> >>>>>>>>>>>>>>> wrote:
> >>>>>>>>>>>>>>>> =E5=9C=A8 2023/11/29 =E4=B8=8B=E5=8D=884:00, Jason Wang =
=E5=86=99=E9=81=93:
> >>>>>>>>>>>>>>>>> On Tue, Nov 28, 2023 at 4:08=E2=80=AFPM Heng Qi <hengqi=
@linux.alibaba.com>
> >>>>>>>>>>>>>>>>> wrote:
> >>>>>>>>>>>>>>>>>> To prevent readers from misunderstanding that the driv=
er can
> >>>>>>>>>>>>>>>>>> only handles packets with partial checksum when
> >>>>>>>>>>>>>>>>>> VIRTIO_NET_F_GUEST_CSUM is negotiated, we update the d=
escription.
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> >>>>>>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>>>>>>         device-types/net/description.tex | 2 +-
> >>>>>>>>>>>>>>>>>>         1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> diff --git a/device-types/net/description.tex
> >>>>>>>>>>>>>>>>>> b/device-types/net/description.tex
> >>>>>>>>>>>>>>>>>> index aff5e08..529f470 100644
> >>>>>>>>>>>>>>>>>> --- a/device-types/net/description.tex
> >>>>>>>>>>>>>>>>>> +++ b/device-types/net/description.tex
> >>>>>>>>>>>>>>>>>> @@ -38,7 +38,7 @@ \subsection{Feature bits}\label{sec:=
Device Types
> >>>>>>>>>>>>>>>>>> / Network Device / Feature bits
> >>>>>>>>>>>>>>>>>>         \begin{description}
> >>>>>>>>>>>>>>>>>>         \item[VIRTIO_NET_F_CSUM (0)] Device handles pa=
ckets with
> >>>>>>>>>>>>>>>>>> partial checksum offload.
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> -\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles pac=
kets with
> >>>>>>>>>>>>>>>>>> partial checksum.
> >>>>>>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles pac=
kets with
> >>>>>>>>>>>>>>>>>> partial checksum or full checksum.
> >>>>>>>>>>>>>>>>> So patch 2 said
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> "
> >>>>>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver handle=
s packets with
> >>>>>>>>>>>>>>>>> full checksum.
> >>>>>>>>>>>>>>>>>         \end{description}
> >>>>>>>>>>>>>>>>> "
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> Is there any difference between the two "full checksum"=
 here?
> >>>>>>>>>>>>>>>> There's no difference.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> The core is that VIRTIO_NET_F_GUEST_FULL_CSUM means that=
 the driver
> >>>>>>>>>>>>>>>> "can
> >>>>>>>>>>>>>>>> only" handle packets with full checksum.
> >>>>>>>>>>>>>>> This seems to be odd.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Driver can always handle packet with full checksum, no?
> >>>>>>>>>>>>>> Yes.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> I meant it
> >>>>>>>>>>>>>>> will be then to be functional equivalent to !
> >>>>>>>>>>>>>>> VIRTIO_NET_F_GUEST_FULL_CSUM?
> >>>>>>>>>>>>>> Are you referring to
> >>>>>>>>>>>>>> "functional equivalent to !VIRTIO_NET_F_GUEST_CSUM" ?
> >>>>>>>>>>>>> Sorry, this is a typo. I meant
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Are you referring to
> >>>>>>>>>>>>> "functional equivalent to !VIRTIO_NET_F_GUEST_FULL_CSUM" ?
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> If so, I think it's no.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Maybe a description similar to the following would be more=
 clearer:
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver does not =
handle
> >>>>>>>>>>>>>> packets with partial checksum.
> >>>>>>>>>>>> I may miss something here, but what's the difference between
> >>>>>>>>>>>>
> >>>>>>>>>>>> VIRTIO_NET_F_GUEST_FULL_CSUM
> >>>>>>>>>>>>
> >>>>>>>>>>>> and
> >>>>>>>>>>>>
> >>>>>>>>>>>> !VIRTIO_NET_F_GUEST_CSUM?
> >>>>>>>>>>>      From the device perspective:
> >>>>>>>>>>>
> >>>>>>>>>>> If !VIRTIO_NET_F_GUEST_CSUM, the device delivers packets with=
 full
> >>>>>>>>>>> checksum to the driver,
> >>>>>>>>>>> but the device can not validate the checksum for these packet=
s. That is,
> >>>>>>>>>>> the flags in virtio-net-hdr
> >>>>>>>>>>> will not contain _DATA_VALID, and the driver or stack needs t=
o validate
> >>>>>>>>>>> these packets.
> >>>>>>>>>>>
> >>>>>>>>>>> If VIRTIO_NET_F_GUEST_FULL_CSUM, the device delivers packets =
with full
> >>>>>>>>>>> checksum to the driver,
> >>>>>>>>>>> and the device can validate the checksum for these packets. T=
hat is, the
> >>>>>>>>>>> flags in virtio-net-hdr
> >>>>>>>>>>> will contain _DATA_VALID,
> >>>>>>>>>> I think DATA_VALID is optional here as device can't recognize =
all type
> >>>>>>>>>> of protocols.
> >>>>>>>>> Yes, you are right, so I used "device *can*" here. Which packet=
 types
> >>>>>>>>> the device recognizes or validates
> >>>>>>>>> depends on the device's implementation. This is also the curren=
t
> >>>>>>>>> practice of GUEST_CSUM.
> >>>>>>>>>
> >>>>>>>>>>> and the driver or stack does not need to
> >>>>>>>>>>> validate these packets.
> >>>>>>>>>> Ok, so I think there're something that is subtle here,
> >>>>>>>>> Ok, I see.
> >>>>>>>>>
> >>>>>>>>>> and that's why
> >>>>>>>>>> I'm asking here:
> >>>>>>>>>>
> >>>>>>>>>> 1) "Driver does not handle packets with partial checksum" is n=
ot
> >>>>>>>>>> accurate, !GUEST_CUSM also fit for this definition.
> >>>>>>>>>> 2) "Driver handles packets with full checksum" is kind of ambi=
guous as
> >>>>>>>>>> it doesn't say whether or not the packet has been validated or=
 not.
> >>>>>>>>> Maybe the description below would be less subtle?
> >>>>>>>>> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with=
 partial
> >>>>>>>>> checksum or full checksum.
> >>>>>>>> I'd suggest to leave it as is. As I didn't find any issue since =
even
> >>>>>>>> with DATA_VALID. Did you?
> >>>>>>>>
> >>>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] The driver handles pa=
ckets
> >>>>>>>>> with full checksum,
> >>>>>>>>> and the device optionally validates the packet's checksum.
> >>>>>>>> Or maybe something like (not a native speaker)
> >>>>>>>>
> >>>>>>>> The driver handles packets with full checksum which the device h=
as
> >>>>>>>> already validated.
> >>>>>>>>
> >>>>>>>> Thanks
> >>>>>>> I feel we just need a proper definition of what does "full checks=
um"
> >>>>>>> mean in this context. It is used but not defined.
> >>>>>>> Assume this feature was negotiated.
> >>>>>>> My understanding is that this is just like VIRTIO_NET_F_GUEST_CSU=
M
> >>>>>>> but certain values in the header are then disallowed? Which?
> >>>>>>> This should be in the spec.
> >>>>>> Yes, I think it is probably the headers that DATA_VALID can work. =
We
> >>>>>> never define it in the past.
> >>>>>>
> >>>>>> E.g in the Linux we map DATA_VALID to CHECKSUM_UNNECESSARY, but it=
 can
> >>>>>> only work for some specific protocols:
> >>>>>>
> >>>>>> """
> >>>>>>     *   %CHECKSUM_UNNECESSARY is applicable to following protocols=
:
> >>>>>>     *
> >>>>>>     *     - TCP: IPv6 and IPv4.
> >>>>>>     *     - UDP: IPv4 and IPv6. A device may apply CHECKSUM_UNNECE=
SSARY to a
> >>>>>>     *       zero UDP checksum for either IPv4 or IPv6, the network=
ing stack
> >>>>>>     *       may perform further validation in this case.
> >>>>>>     *     - GRE: only if the checksum is present in the header.
> >>>>>>     *     - SCTP: indicates the CRC in SCTP header has been valida=
ted.
> >>>>>>     *     - FCOE: indicates the CRC in FC frame has been validated=
.
> >>>>>> """
> >>>>>>
> >>>>>> I'm not sure whether it's just fine to duplicate the definition or
> >>>>>> it's too late to define any now.
> >>>>> I think it's mostly harmless for other protocols.
> >>>> I'm not sure if this should be defined by a new FULL_CSUM feature.
> >>>> This seems to be an issue with GUEST_CSUM.
> >>>>
> >>>> I think we should supplement these with a new patch for GUEST_CSUM?
> >>> Probably. My understanding is:
> >>>
> >>> You want to reuse DATA_VALID here, so we need to stick to a consisten=
t
> >>> semantic for GUEST_CUSM and FULL_CSUM. So we need a definition of
> >>> "full csum" or what kind of packet could DATA_VALID work here.
> >> I agree, we can be clear about what types of packets DATA_VALID might
> >> cover, e.g. TCP/UDP/GRE/SCTP/FoCE.
> >>
> >> But I think we also need something like \field{supported_validate_type=
s} to
> >> indicate which packet types the device supports validating and setting
> >> DATA_VALID,
> >> otherwise the device driver that negotiates this feature may fail to l=
ive
> >> migration.
> >> Am I right?
> >>
> >> I'm not sure how GUEST_CSUM works now as it should also suffer from th=
e
> >> above
> >> mentioned issues with live migration, but no devices are reporting thi=
s
> >> right now.
> >>
> >> Maybe, each device only supports checksum verification for TCP/UDP by
> >> default? I don't know.
> >> But I hope we can focus on this and get consensus, because our hw rele=
ase
> >> date is coming soon.
> >>
> >> Thanks a lot!
> >
> > First, DATA_VALID is not a thing that hardware should ever use.
> > It's a hack when packets are passed within host.
>
> Get here. Thanks!

So if I understand correctly, we need a new flag here and define the
supported protocols.

Thanks

>
> > Second I don't understand what it has to do with this
> > discussion.
> > Your patch should be more specific and define which
> > header fields are compatible with the new offload option.
> >
> >
> >
> >>> Thanks
> >>>
> >>>> Thanks!
> >>>>
> >>>>>>> After this is written up we will come up with a good short
> >>>>>>> description for the feature bit.
> >>>>>>>
> >>>>>> Thanks
> >>>>>>
> >>>>>>>>> Thanks!
> >>>>>>>>>
> >>>>>>>>>> Thanks
> >>>>>>>>>>
> >>>>>>>>>>> Thanks!
> >>>>>>>>>>>
> >>>>>>>>>>>> Thanks
> >>>>>>>>>>>>
> >>>>>>>>>>>>>> Thanks!
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Thanks
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Thanks!
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> Thanks
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> \item[VIRTIO_NET_F_CTRL_GUEST_OFFLOADS (2)] Control ch=
annel offloads
> >>>>>>>>>>>>>>>>>>                 reconfiguration support.
> >>>>>>>>>>>>>>>>>> --
> >>>>>>>>>>>>>>>>>> 2.19.1.6.gb485710b
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>> This publicly archived list offers a means to provide inpu=
t to the
> >>>>>>>>>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> In order to verify user consent to the Feedback License te=
rms and
> >>>>>>>>>>>>>> to minimize spam in the list archive, subscription is requ=
ired
> >>>>>>>>>>>>>> before posting.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >>>>>>>>>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.o=
rg
> >>>>>>>>>>>>>> List help: virtio-comment-help@lists.oasis-open.org
> >>>>>>>>>>>>>> List archive: https://lists.oasis-open.org/archives/virtio=
-comment/
> >>>>>>>>>>>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedb=
ack_license.pdf
> >>>>>>>>>>>>>> List Guidelines:
> >>>>>>>>>>>>>> https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
> >>>>>>>>>>>>>> Committee: https://www.oasis-open.org/committees/virtio/
> >>>>>>>>>>>>>> Join OASIS: https://www.oasis-open.org/join/
> >>>>>>>>>>> This publicly archived list offers a means to provide input t=
o the
> >>>>>>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
> >>>>>>>>>>>
> >>>>>>>>>>> In order to verify user consent to the Feedback License terms=
 and
> >>>>>>>>>>> to minimize spam in the list archive, subscription is require=
d
> >>>>>>>>>>> before posting.
> >>>>>>>>>>>
> >>>>>>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >>>>>>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >>>>>>>>>>> List help: virtio-comment-help@lists.oasis-open.org
> >>>>>>>>>>> List archive: https://lists.oasis-open.org/archives/virtio-co=
mment/
> >>>>>>>>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback=
_license.pdf
> >>>>>>>>>>> List Guidelines: https://www.oasis-open.org/policies-guidelin=
es/mailing-lists
> >>>>>>>>>>> Committee: https://www.oasis-open.org/committees/virtio/
> >>>>>>>>>>> Join OASIS: https://www.oasis-open.org/join/
> >>>>>>>>>>>
> >>>>>>>>> This publicly archived list offers a means to provide input to =
the
> >>>>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
> >>>>>>>>>
> >>>>>>>>> In order to verify user consent to the Feedback License terms a=
nd
> >>>>>>>>> to minimize spam in the list archive, subscription is required
> >>>>>>>>> before posting.
> >>>>>>>>>
> >>>>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >>>>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >>>>>>>>> List help: virtio-comment-help@lists.oasis-open.org
> >>>>>>>>> List archive: https://lists.oasis-open.org/archives/virtio-comm=
ent/
> >>>>>>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_l=
icense.pdf
> >>>>>>>>> List Guidelines: https://www.oasis-open.org/policies-guidelines=
/mailing-lists
> >>>>>>>>> Committee: https://www.oasis-open.org/committees/virtio/
> >>>>>>>>> Join OASIS: https://www.oasis-open.org/join/
> >>>>>>>>>
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
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing=
-lists
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

