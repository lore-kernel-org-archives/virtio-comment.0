Return-Path: <virtio-comment-return-8721-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6766C4167B
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Dec 2023 08:50:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1374C2B051
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Dec 2023 08:50:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D43EA98640B
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Dec 2023 08:50:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AC31F98408C; Mon,  4 Dec 2023 08:50:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F0F9B986376
	for <virtio-comment@lists.oasis-open.org>; Mon,  4 Dec 2023 08:50:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: EOOEhH74OmiRlpnZU5THrA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701679798; x=1702284598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2pCTsBvqHIMnrSsbbSwwsUZYCpjeP6NiHBYVB3hSGM=;
        b=GZ2y4ZsjpyYtK941be7Xj7dQm/fmF+Y74Q9iakz07lmus3wq0EXG5NxA+4oEBy5I+s
         fWiBQh+wLuYe7OrJ5vQsIR6pjtSbwMQUuUoTy6ttd3L0ZGJByl7zAOCOvAL2/3jac9y7
         bN7rIUK2d0PyxVbInkmQlile+DmO9P4vWHKmEJwyL1eZKSza2BpOv8GKYsHGL/r094ud
         mINuBO7+rRwkOguQ/exIqRrLiXwsAbjltDooGXvh7bOE5ZJOu086n+qxAfSNYeCdj0Vx
         FImngC60EOYIbVZcMv+MSoH7YYBTDVI5E3oK8G0tGdq1mrHQRAgB3waggAlEnjvqVdfZ
         nJOg==
X-Gm-Message-State: AOJu0YyNQogVKsmZAF1cnlQeCcInvVZ7caGrS1JeLx+HSmwsNNXM6Hx7
	Jvk+9ugbyXieyZLiadHcCTGCMdQpNLRQ1TMKy1/FT9/8CN0nFGeRDCUR+KsMkMu7VXFS718fVe1
	TsyVsr7NkLTcSfBydGJa/1VeemHfYAvu8JgBiBXnr70PHso4Rgg==
X-Received: by 2002:a05:6512:1091:b0:50b:eeb9:4294 with SMTP id j17-20020a056512109100b0050beeb94294mr579150lfg.137.1701679798118;
        Mon, 04 Dec 2023 00:49:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPoBCiL9++i1flpby2G1TvUZwHnu6esbpe8kcsygUOC/lVshGdvd7CqWb3dnQLFx2pLL172ukQ8SDahEJjsss=
X-Received: by 2002:a05:6512:1091:b0:50b:eeb9:4294 with SMTP id
 j17-20020a056512109100b0050beeb94294mr579146lfg.137.1701679797734; Mon, 04
 Dec 2023 00:49:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701158152.git.hengqi@linux.alibaba.com>
 <5490c3b5b2321e13a9344057d02f2ae5fe9ebf56.1701158152.git.hengqi@linux.alibaba.com>
 <CACGkMEuN20TaSF1OeFgwEF85ZadxPomnsoMmprS3=DpCFPJKhQ@mail.gmail.com>
 <90ef9ec4-6cce-49c4-a27d-7168990ae3f3@linux.alibaba.com> <CACGkMEu3M6D0TXgm7b89mKosGF37x2YJhj+kVb0RQ=sZJ+vQqA@mail.gmail.com>
 <5bb13b60-f324-412f-99a2-a476320d79b1@linux.alibaba.com> <00b1ed5f-fc91-4aba-b650-2830cd5ac412@linux.alibaba.com>
 <CACGkMEsz_6DQtsErd+V0kKSzm=TLxvSgk_Fbhyysa-w41CXSwQ@mail.gmail.com>
 <b37db3db-ffb8-4fce-9ec9-2fc248fd57df@linux.alibaba.com> <CACGkMEsMhuNX3YzAAV52uDD_FWqPq8LdtQsx5EnWaqQn4RmDVg@mail.gmail.com>
 <68223a13-9124-4b44-aac7-851ab9bddf90@linux.alibaba.com>
In-Reply-To: <68223a13-9124-4b44-aac7-851ab9bddf90@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 4 Dec 2023 16:49:46 +0800
Message-ID: <CACGkMEvgJ-c3i4FSOMQSn=XcGOi2Be4gTS=rjB10KnADkrpw_Q@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, 
	"Michael S . Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v4 1/2] virtio-net: update
 description for VIRTIO_NET_F_GUEST_CSUM.

On Mon, Dec 4, 2023 at 3:37=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.com> w=
rote:
>
>
>
> =E5=9C=A8 2023/12/4 =E4=B8=8B=E5=8D=883:18, Jason Wang =E5=86=99=E9=81=93=
:
> > On Fri, Dec 1, 2023 at 3:16=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.co=
m> wrote:
> >>
> >>
> >> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=883:05, Jason Wang =E5=86=99=E9=81=
=93:
> >>> On Fri, Dec 1, 2023 at 2:30=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.=
com> wrote:
> >>>>
> >>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=882:24, Heng Qi =E5=86=99=E9=81=
=93:
> >>>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=881:18, Jason Wang =E5=86=99=E9=
=81=93:
> >>>>>> On Wed, Nov 29, 2023 at 4:23=E2=80=AFPM Heng Qi <hengqi@linux.alib=
aba.com>
> >>>>>> wrote:
> >>>>>>> =E5=9C=A8 2023/11/29 =E4=B8=8B=E5=8D=884:00, Jason Wang =E5=86=99=
=E9=81=93:
> >>>>>>>> On Tue, Nov 28, 2023 at 4:08=E2=80=AFPM Heng Qi <hengqi@linux.al=
ibaba.com>
> >>>>>>>> wrote:
> >>>>>>>>> To prevent readers from misunderstanding that the driver can
> >>>>>>>>> only handles packets with partial checksum when
> >>>>>>>>> VIRTIO_NET_F_GUEST_CSUM is negotiated, we update the descriptio=
n.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> >>>>>>>>> ---
> >>>>>>>>>      device-types/net/description.tex | 2 +-
> >>>>>>>>>      1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/device-types/net/description.tex
> >>>>>>>>> b/device-types/net/description.tex
> >>>>>>>>> index aff5e08..529f470 100644
> >>>>>>>>> --- a/device-types/net/description.tex
> >>>>>>>>> +++ b/device-types/net/description.tex
> >>>>>>>>> @@ -38,7 +38,7 @@ \subsection{Feature bits}\label{sec:Device Ty=
pes
> >>>>>>>>> / Network Device / Feature bits
> >>>>>>>>>      \begin{description}
> >>>>>>>>>      \item[VIRTIO_NET_F_CSUM (0)] Device handles packets with
> >>>>>>>>> partial checksum offload.
> >>>>>>>>>
> >>>>>>>>> -\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with
> >>>>>>>>> partial checksum.
> >>>>>>>>> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with
> >>>>>>>>> partial checksum or full checksum.
> >>>>>>>> So patch 2 said
> >>>>>>>>
> >>>>>>>> "
> >>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver handles packets=
 with
> >>>>>>>> full checksum.
> >>>>>>>>      \end{description}
> >>>>>>>> "
> >>>>>>>>
> >>>>>>>> Is there any difference between the two "full checksum" here?
> >>>>>>> There's no difference.
> >>>>>>>
> >>>>>>> The core is that VIRTIO_NET_F_GUEST_FULL_CSUM means that the driv=
er
> >>>>>>> "can
> >>>>>>> only" handle packets with full checksum.
> >>>>>> This seems to be odd.
> >>>>>>
> >>>>>> Driver can always handle packet with full checksum, no?
> >>>>> Yes.
> >>>>>
> >>>>>> I meant it
> >>>>>> will be then to be functional equivalent to !
> >>>>>> VIRTIO_NET_F_GUEST_FULL_CSUM?
> >>>>> Are you referring to
> >>>>> "functional equivalent to !VIRTIO_NET_F_GUEST_CSUM" ?
> >>>> Sorry, this is a typo. I meant
> >>>>
> >>>> Are you referring to
> >>>> "functional equivalent to !VIRTIO_NET_F_GUEST_FULL_CSUM" ?
> >>>>
> >>>>> If so, I think it's no.
> >>>>>
> >>>>> Maybe a description similar to the following would be more clearer:
> >>>>>
> >>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver does not handle
> >>>>> packets with partial checksum.
> >>> I may miss something here, but what's the difference between
> >>>
> >>> VIRTIO_NET_F_GUEST_FULL_CSUM
> >>>
> >>> and
> >>>
> >>> !VIRTIO_NET_F_GUEST_CSUM?
> >>   From the device perspective:
> >>
> >> If !VIRTIO_NET_F_GUEST_CSUM, the device delivers packets with full
> >> checksum to the driver,
> >> but the device can not validate the checksum for these packets. That i=
s,
> >> the flags in virtio-net-hdr
> >> will not contain _DATA_VALID, and the driver or stack needs to validat=
e
> >> these packets.
> >>
> >> If VIRTIO_NET_F_GUEST_FULL_CSUM, the device delivers packets with full
> >> checksum to the driver,
> >> and the device can validate the checksum for these packets. That is, t=
he
> >> flags in virtio-net-hdr
> >> will contain _DATA_VALID,
> > I think DATA_VALID is optional here as device can't recognize all type
> > of protocols.
>
> Yes, you are right, so I used "device *can*" here. Which packet types
> the device recognizes or validates
> depends on the device's implementation. This is also the current
> practice of GUEST_CSUM.
>
> >
> >> and the driver or stack does not need to
> >> validate these packets.
> > Ok, so I think there're something that is subtle here,
>
> Ok, I see.
>
> > and that's why
> > I'm asking here:
> >
> > 1) "Driver does not handle packets with partial checksum" is not
> > accurate, !GUEST_CUSM also fit for this definition.
> > 2) "Driver handles packets with full checksum" is kind of ambiguous as
> > it doesn't say whether or not the packet has been validated or not.
>
> Maybe the description below would be less subtle?
> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with partial
> checksum or full checksum.

I'd suggest to leave it as is. As I didn't find any issue since even
with DATA_VALID. Did you?

> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] The driver handles packets
> with full checksum,
> and the device optionally validates the packet's checksum.

Or maybe something like (not a native speaker)

The driver handles packets with full checksum which the device has
already validated.

Thanks


>
> Thanks!
>
> >
> > Thanks
> >
> >> Thanks!
> >>
> >>> Thanks
> >>>
> >>>>> Thanks!
> >>>>>
> >>>>>> Thanks
> >>>>>>
> >>>>>>> Thanks!
> >>>>>>>
> >>>>>>>> Thanks
> >>>>>>>>
> >>>>>>>>> \item[VIRTIO_NET_F_CTRL_GUEST_OFFLOADS (2)] Control channel off=
loads
> >>>>>>>>>              reconfiguration support.
> >>>>>>>>> --
> >>>>>>>>> 2.19.1.6.gb485710b
> >>>>>>>>>
> >>>>> This publicly archived list offers a means to provide input to the
> >>>>> OASIS Virtual I/O Device (VIRTIO) TC.
> >>>>>
> >>>>> In order to verify user consent to the Feedback License terms and
> >>>>> to minimize spam in the list archive, subscription is required
> >>>>> before posting.
> >>>>>
> >>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >>>>> List help: virtio-comment-help@lists.oasis-open.org
> >>>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> >>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_licen=
se.pdf
> >>>>> List Guidelines:
> >>>>> https://www.oasis-open.org/policies-guidelines/mailing-lists
> >>>>> Committee: https://www.oasis-open.org/committees/virtio/
> >>>>> Join OASIS: https://www.oasis-open.org/join/
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
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
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

