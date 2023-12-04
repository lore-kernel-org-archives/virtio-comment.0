Return-Path: <virtio-comment-return-8726-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE183C4167B
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Dec 2023 09:08:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2833721696
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Dec 2023 09:08:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 111BC9863D0
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Dec 2023 09:08:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id ED1D598408C; Mon,  4 Dec 2023 09:08:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DED68986376
	for <virtio-comment@lists.oasis-open.org>; Mon,  4 Dec 2023 09:08:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: W18jcKYIPVOOX5WLhw9pjA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701680906; x=1702285706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0TqEAFzI28GJZj47kOR1I6uuQ2lfvcvhdmdC01IgD4=;
        b=o7Fx2VPGITcRPQONeccu5FH+BfXoB8WtiUVqDIDemocFnC5yztMyznkw6bVaXjKoM8
         VvBKwBQ3k6D/2wSo/fZNpfD+u7SnxNithZjhYcaRDZ6Xwx3b/CtrXixkrD2JI4DNv6is
         EuuiDDuAvqSSfq2hQtJ4H782GsdTJJXswe0PcZzTAwiomWOt6uuraLkMv+OZNK7qp+F/
         gWN/oxx/7Wop0zhyM1PEl0UlO7X+rk8b5xEkO9KbTxPSYc5LnZB7CFjeuIe44QGYF8tl
         rC2UJe42Mos+/mwjGY3+oZ0sqbNY1EYC0tCNVMp7LArkww/r1nfp13MBP2o5NC8X8LNT
         8Q9w==
X-Gm-Message-State: AOJu0YzMnwjsBYrqfKhaN5ZaX0SyunWymyqTwULpofidgPrpTIug2Is0
	U1u5qaI/fqUnFKLNK4Aw1ZCV6zuH0g8Or7U9ggWgu6ecm3rjKdPrUSRARAZJ+Ez7WFan3UEsYKi
	iGx1BWoGhszJj9t4VwLUFt86z+G7TmcnrUJm89GFtYzm0qW34xA==
X-Received: by 2002:a05:6512:3ea:b0:50b:fdb5:39f1 with SMTP id n10-20020a05651203ea00b0050bfdb539f1mr64233lfq.256.1701680906312;
        Mon, 04 Dec 2023 01:08:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwbwk08189p/oxXXjmVDtS+4nYA3r+CObWhen/5AEC4waiO37l4fwtp5kX5FBxGVCpZgQ2BokU1bL7yb2zyBQ=
X-Received: by 2002:a05:6512:3ea:b0:50b:fdb5:39f1 with SMTP id
 n10-20020a05651203ea00b0050bfdb539f1mr64230lfq.256.1701680905940; Mon, 04 Dec
 2023 01:08:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701158152.git.hengqi@linux.alibaba.com>
 <5490c3b5b2321e13a9344057d02f2ae5fe9ebf56.1701158152.git.hengqi@linux.alibaba.com>
 <CACGkMEuN20TaSF1OeFgwEF85ZadxPomnsoMmprS3=DpCFPJKhQ@mail.gmail.com>
 <90ef9ec4-6cce-49c4-a27d-7168990ae3f3@linux.alibaba.com> <CACGkMEu3M6D0TXgm7b89mKosGF37x2YJhj+kVb0RQ=sZJ+vQqA@mail.gmail.com>
 <5bb13b60-f324-412f-99a2-a476320d79b1@linux.alibaba.com> <00b1ed5f-fc91-4aba-b650-2830cd5ac412@linux.alibaba.com>
 <CACGkMEsz_6DQtsErd+V0kKSzm=TLxvSgk_Fbhyysa-w41CXSwQ@mail.gmail.com>
 <b37db3db-ffb8-4fce-9ec9-2fc248fd57df@linux.alibaba.com> <CACGkMEsMhuNX3YzAAV52uDD_FWqPq8LdtQsx5EnWaqQn4RmDVg@mail.gmail.com>
 <68223a13-9124-4b44-aac7-851ab9bddf90@linux.alibaba.com> <CACGkMEvgJ-c3i4FSOMQSn=XcGOi2Be4gTS=rjB10KnADkrpw_Q@mail.gmail.com>
 <fe545560-9a9d-4dc6-b18a-e5e1128eff1a@linux.alibaba.com>
In-Reply-To: <fe545560-9a9d-4dc6-b18a-e5e1128eff1a@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 4 Dec 2023 17:08:14 +0800
Message-ID: <CACGkMEsQhh7eVkUZYA+fgRzggOr-FgNfFgN3gvEnG3h4jePt2g@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, 
	"Michael S . Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v4 1/2] virtio-net: update
 description for VIRTIO_NET_F_GUEST_CSUM.

On Mon, Dec 4, 2023 at 5:06=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.com> w=
rote:
>
>
>
> =E5=9C=A8 2023/12/4 =E4=B8=8B=E5=8D=884:49, Jason Wang =E5=86=99=E9=81=93=
:
> > On Mon, Dec 4, 2023 at 3:37=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.co=
m> wrote:
> >>
> >>
> >> =E5=9C=A8 2023/12/4 =E4=B8=8B=E5=8D=883:18, Jason Wang =E5=86=99=E9=81=
=93:
> >>> On Fri, Dec 1, 2023 at 3:16=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.=
com> wrote:
> >>>>
> >>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=883:05, Jason Wang =E5=86=99=E9=
=81=93:
> >>>>> On Fri, Dec 1, 2023 at 2:30=E2=80=AFPM Heng Qi <hengqi@linux.alibab=
a.com> wrote:
> >>>>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=882:24, Heng Qi =E5=86=99=E9=
=81=93:
> >>>>>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=881:18, Jason Wang =E5=86=99=
=E9=81=93:
> >>>>>>>> On Wed, Nov 29, 2023 at 4:23=E2=80=AFPM Heng Qi <hengqi@linux.al=
ibaba.com>
> >>>>>>>> wrote:
> >>>>>>>>> =E5=9C=A8 2023/11/29 =E4=B8=8B=E5=8D=884:00, Jason Wang =E5=86=
=99=E9=81=93:
> >>>>>>>>>> On Tue, Nov 28, 2023 at 4:08=E2=80=AFPM Heng Qi <hengqi@linux.=
alibaba.com>
> >>>>>>>>>> wrote:
> >>>>>>>>>>> To prevent readers from misunderstanding that the driver can
> >>>>>>>>>>> only handles packets with partial checksum when
> >>>>>>>>>>> VIRTIO_NET_F_GUEST_CSUM is negotiated, we update the descript=
ion.
> >>>>>>>>>>>
> >>>>>>>>>>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> >>>>>>>>>>> ---
> >>>>>>>>>>>       device-types/net/description.tex | 2 +-
> >>>>>>>>>>>       1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>>>>>>
> >>>>>>>>>>> diff --git a/device-types/net/description.tex
> >>>>>>>>>>> b/device-types/net/description.tex
> >>>>>>>>>>> index aff5e08..529f470 100644
> >>>>>>>>>>> --- a/device-types/net/description.tex
> >>>>>>>>>>> +++ b/device-types/net/description.tex
> >>>>>>>>>>> @@ -38,7 +38,7 @@ \subsection{Feature bits}\label{sec:Device =
Types
> >>>>>>>>>>> / Network Device / Feature bits
> >>>>>>>>>>>       \begin{description}
> >>>>>>>>>>>       \item[VIRTIO_NET_F_CSUM (0)] Device handles packets wit=
h
> >>>>>>>>>>> partial checksum offload.
> >>>>>>>>>>>
> >>>>>>>>>>> -\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets wi=
th
> >>>>>>>>>>> partial checksum.
> >>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets wi=
th
> >>>>>>>>>>> partial checksum or full checksum.
> >>>>>>>>>> So patch 2 said
> >>>>>>>>>>
> >>>>>>>>>> "
> >>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver handles packe=
ts with
> >>>>>>>>>> full checksum.
> >>>>>>>>>>       \end{description}
> >>>>>>>>>> "
> >>>>>>>>>>
> >>>>>>>>>> Is there any difference between the two "full checksum" here?
> >>>>>>>>> There's no difference.
> >>>>>>>>>
> >>>>>>>>> The core is that VIRTIO_NET_F_GUEST_FULL_CSUM means that the dr=
iver
> >>>>>>>>> "can
> >>>>>>>>> only" handle packets with full checksum.
> >>>>>>>> This seems to be odd.
> >>>>>>>>
> >>>>>>>> Driver can always handle packet with full checksum, no?
> >>>>>>> Yes.
> >>>>>>>
> >>>>>>>> I meant it
> >>>>>>>> will be then to be functional equivalent to !
> >>>>>>>> VIRTIO_NET_F_GUEST_FULL_CSUM?
> >>>>>>> Are you referring to
> >>>>>>> "functional equivalent to !VIRTIO_NET_F_GUEST_CSUM" ?
> >>>>>> Sorry, this is a typo. I meant
> >>>>>>
> >>>>>> Are you referring to
> >>>>>> "functional equivalent to !VIRTIO_NET_F_GUEST_FULL_CSUM" ?
> >>>>>>
> >>>>>>> If so, I think it's no.
> >>>>>>>
> >>>>>>> Maybe a description similar to the following would be more cleare=
r:
> >>>>>>>
> >>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver does not handle
> >>>>>>> packets with partial checksum.
> >>>>> I may miss something here, but what's the difference between
> >>>>>
> >>>>> VIRTIO_NET_F_GUEST_FULL_CSUM
> >>>>>
> >>>>> and
> >>>>>
> >>>>> !VIRTIO_NET_F_GUEST_CSUM?
> >>>>    From the device perspective:
> >>>>
> >>>> If !VIRTIO_NET_F_GUEST_CSUM, the device delivers packets with full
> >>>> checksum to the driver,
> >>>> but the device can not validate the checksum for these packets. That=
 is,
> >>>> the flags in virtio-net-hdr
> >>>> will not contain _DATA_VALID, and the driver or stack needs to valid=
ate
> >>>> these packets.
> >>>>
> >>>> If VIRTIO_NET_F_GUEST_FULL_CSUM, the device delivers packets with fu=
ll
> >>>> checksum to the driver,
> >>>> and the device can validate the checksum for these packets. That is,=
 the
> >>>> flags in virtio-net-hdr
> >>>> will contain _DATA_VALID,
> >>> I think DATA_VALID is optional here as device can't recognize all typ=
e
> >>> of protocols.
> >> Yes, you are right, so I used "device *can*" here. Which packet types
> >> the device recognizes or validates
> >> depends on the device's implementation. This is also the current
> >> practice of GUEST_CSUM.
> >>
> >>>> and the driver or stack does not need to
> >>>> validate these packets.
> >>> Ok, so I think there're something that is subtle here,
> >> Ok, I see.
> >>
> >>> and that's why
> >>> I'm asking here:
> >>>
> >>> 1) "Driver does not handle packets with partial checksum" is not
> >>> accurate, !GUEST_CUSM also fit for this definition.
> >>> 2) "Driver handles packets with full checksum" is kind of ambiguous a=
s
> >>> it doesn't say whether or not the packet has been validated or not.
> >> Maybe the description below would be less subtle?
> >> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with partia=
l
> >> checksum or full checksum.
> > I'd suggest to leave it as is. As I didn't find any issue since even
> > with DATA_VALID.
>
> OK, I'm not inclined to update the description for classic features
> either, if that's okay with others.
>
> > Did you?
> >
> >> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] The driver handles packets
> >> with full checksum,
> >> and the device optionally validates the packet's checksum.
> > Or maybe something like (not a native speaker)
> >
> > The driver handles packets with full checksum which the device has
> > already validated.
>
> Packets which are not validated by the device can still be received by
> the driver. This is basic
> and this feature does not break this.

It doesn't break. It doesn't exclude that.

See how GUEST_CSUM defined:

Driver handles packets with partial checksum.

Thanks

>
> Thanks!
>
> >
> > Thanks
> >
> >
> >> Thanks!
> >>
> >>> Thanks
> >>>
> >>>> Thanks!
> >>>>
> >>>>> Thanks
> >>>>>
> >>>>>>> Thanks!
> >>>>>>>
> >>>>>>>> Thanks
> >>>>>>>>
> >>>>>>>>> Thanks!
> >>>>>>>>>
> >>>>>>>>>> Thanks
> >>>>>>>>>>
> >>>>>>>>>>> \item[VIRTIO_NET_F_CTRL_GUEST_OFFLOADS (2)] Control channel o=
ffloads
> >>>>>>>>>>>               reconfiguration support.
> >>>>>>>>>>> --
> >>>>>>>>>>> 2.19.1.6.gb485710b
> >>>>>>>>>>>
> >>>>>>> This publicly archived list offers a means to provide input to th=
e
> >>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
> >>>>>>>
> >>>>>>> In order to verify user consent to the Feedback License terms and
> >>>>>>> to minimize spam in the list archive, subscription is required
> >>>>>>> before posting.
> >>>>>>>
> >>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >>>>>>> List help: virtio-comment-help@lists.oasis-open.org
> >>>>>>> List archive: https://lists.oasis-open.org/archives/virtio-commen=
t/
> >>>>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_lic=
ense.pdf
> >>>>>>> List Guidelines:
> >>>>>>> https://www.oasis-open.org/policies-guidelines/mailing-lists
> >>>>>>> Committee: https://www.oasis-open.org/committees/virtio/
> >>>>>>> Join OASIS: https://www.oasis-open.org/join/
> >>>> This publicly archived list offers a means to provide input to the
> >>>> OASIS Virtual I/O Device (VIRTIO) TC.
> >>>>
> >>>> In order to verify user consent to the Feedback License terms and
> >>>> to minimize spam in the list archive, subscription is required
> >>>> before posting.
> >>>>
> >>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >>>> List help: virtio-comment-help@lists.oasis-open.org
> >>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> >>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_licens=
e.pdf
> >>>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mail=
ing-lists
> >>>> Committee: https://www.oasis-open.org/committees/virtio/
> >>>> Join OASIS: https://www.oasis-open.org/join/
> >>>>
> >>
> >> This publicly archived list offers a means to provide input to the
> >> OASIS Virtual I/O Device (VIRTIO) TC.
> >>
> >> In order to verify user consent to the Feedback License terms and
> >> to minimize spam in the list archive, subscription is required
> >> before posting.
> >>
> >> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >> List help: virtio-comment-help@lists.oasis-open.org
> >> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> >> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.=
pdf
> >> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailin=
g-lists
> >> Committee: https://www.oasis-open.org/committees/virtio/
> >> Join OASIS: https://www.oasis-open.org/join/
> >>
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

