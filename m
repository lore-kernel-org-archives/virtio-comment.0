Return-Path: <virtio-comment-return-8719-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF68AC4167B
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Dec 2023 07:18:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0657B2B04F
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Dec 2023 07:18:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DBB0A9863E5
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Dec 2023 07:18:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BD6C998408C; Mon,  4 Dec 2023 07:18:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ABF00986376
	for <virtio-comment@lists.oasis-open.org>; Mon,  4 Dec 2023 07:18:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: GXq5wSjgMhW0PE6HG688Iw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701674314; x=1702279114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFpNov+3SpkfSAhEEmSP3V0pdGdXBnAMJ0ON8L+aP5k=;
        b=cKQYuFzA2PjS3WQRZ7p7xOhyN68kOrfhaIFEEkCISzqKADSOTI81H8j3MQYa4HpnbE
         hMBl0i64DGsRcTSNqkzITzqqmgi3s9mUL2gJ8nCJ+3g7xiRslPs9MdnMza/QLUwD7YoM
         Z4kd4kLsE0uYf0D5f9atiFlSbWHGqbITA9KBNlpbduLhOuIIaEpqIsUzy6wsfU1BL3jo
         8FMVo6pcP0mn2sQqdBvpoU/Jl8UVtD0Zz0JWyDhvZeis3/m64AeYflZM3wuco5VsDu0t
         0GBCI9mjG7mfFXEi0tBOpIhXvUL5tcz4C9jOsoPHfaq94BbgPvgrnBqUIrwA18k+CwH0
         p8hA==
X-Gm-Message-State: AOJu0Yydeeh+FtRzKjgptU9LNa37a7pIu4YrYPe+ZIb731khUuupYx1Y
	RwwievTWOvr+SqKPKOFpP3WnmdP7YTUXpgBnGRzr8zxbRLCu+epbIROxywCTCJYhmITUY2dMLM4
	fI5eNiSMyZfifomgwHk4U8X5XUFj4sLxr2Kimo9C/Wf9IpAUwtQ==
X-Received: by 2002:ac2:59c2:0:b0:50b:d764:6ea0 with SMTP id x2-20020ac259c2000000b0050bd7646ea0mr2432628lfn.80.1701674313914;
        Sun, 03 Dec 2023 23:18:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTvRapA2iVBRCAhlU1wZ1TrqqtCKnDKpagioIbCeaLanXOtI4oXP5s4ZFEcChCvQwI8aWGov5HRHDhyQyxzX0=
X-Received: by 2002:ac2:59c2:0:b0:50b:d764:6ea0 with SMTP id
 x2-20020ac259c2000000b0050bd7646ea0mr2432620lfn.80.1701674313572; Sun, 03 Dec
 2023 23:18:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701158152.git.hengqi@linux.alibaba.com>
 <5490c3b5b2321e13a9344057d02f2ae5fe9ebf56.1701158152.git.hengqi@linux.alibaba.com>
 <CACGkMEuN20TaSF1OeFgwEF85ZadxPomnsoMmprS3=DpCFPJKhQ@mail.gmail.com>
 <90ef9ec4-6cce-49c4-a27d-7168990ae3f3@linux.alibaba.com> <CACGkMEu3M6D0TXgm7b89mKosGF37x2YJhj+kVb0RQ=sZJ+vQqA@mail.gmail.com>
 <5bb13b60-f324-412f-99a2-a476320d79b1@linux.alibaba.com> <00b1ed5f-fc91-4aba-b650-2830cd5ac412@linux.alibaba.com>
 <CACGkMEsz_6DQtsErd+V0kKSzm=TLxvSgk_Fbhyysa-w41CXSwQ@mail.gmail.com> <b37db3db-ffb8-4fce-9ec9-2fc248fd57df@linux.alibaba.com>
In-Reply-To: <b37db3db-ffb8-4fce-9ec9-2fc248fd57df@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 4 Dec 2023 15:18:22 +0800
Message-ID: <CACGkMEsMhuNX3YzAAV52uDD_FWqPq8LdtQsx5EnWaqQn4RmDVg@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, 
	"Michael S . Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v4 1/2] virtio-net: update
 description for VIRTIO_NET_F_GUEST_CSUM.

On Fri, Dec 1, 2023 at 3:16=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.com> w=
rote:
>
>
>
> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=883:05, Jason Wang =E5=86=99=E9=81=93=
:
> > On Fri, Dec 1, 2023 at 2:30=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.co=
m> wrote:
> >>
> >>
> >> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=882:24, Heng Qi =E5=86=99=E9=81=93=
:
> >>>
> >>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=881:18, Jason Wang =E5=86=99=E9=
=81=93:
> >>>> On Wed, Nov 29, 2023 at 4:23=E2=80=AFPM Heng Qi <hengqi@linux.alibab=
a.com>
> >>>> wrote:
> >>>>>
> >>>>> =E5=9C=A8 2023/11/29 =E4=B8=8B=E5=8D=884:00, Jason Wang =E5=86=99=
=E9=81=93:
> >>>>>> On Tue, Nov 28, 2023 at 4:08=E2=80=AFPM Heng Qi <hengqi@linux.alib=
aba.com>
> >>>>>> wrote:
> >>>>>>> To prevent readers from misunderstanding that the driver can
> >>>>>>> only handles packets with partial checksum when
> >>>>>>> VIRTIO_NET_F_GUEST_CSUM is negotiated, we update the description.
> >>>>>>>
> >>>>>>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> >>>>>>> ---
> >>>>>>>     device-types/net/description.tex | 2 +-
> >>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>>
> >>>>>>> diff --git a/device-types/net/description.tex
> >>>>>>> b/device-types/net/description.tex
> >>>>>>> index aff5e08..529f470 100644
> >>>>>>> --- a/device-types/net/description.tex
> >>>>>>> +++ b/device-types/net/description.tex
> >>>>>>> @@ -38,7 +38,7 @@ \subsection{Feature bits}\label{sec:Device Type=
s
> >>>>>>> / Network Device / Feature bits
> >>>>>>>     \begin{description}
> >>>>>>>     \item[VIRTIO_NET_F_CSUM (0)] Device handles packets with
> >>>>>>> partial checksum offload.
> >>>>>>>
> >>>>>>> -\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with
> >>>>>>> partial checksum.
> >>>>>>> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with
> >>>>>>> partial checksum or full checksum.
> >>>>>> So patch 2 said
> >>>>>>
> >>>>>> "
> >>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver handles packets w=
ith
> >>>>>> full checksum.
> >>>>>>     \end{description}
> >>>>>> "
> >>>>>>
> >>>>>> Is there any difference between the two "full checksum" here?
> >>>>> There's no difference.
> >>>>>
> >>>>> The core is that VIRTIO_NET_F_GUEST_FULL_CSUM means that the driver
> >>>>> "can
> >>>>> only" handle packets with full checksum.
> >>>> This seems to be odd.
> >>>>
> >>>> Driver can always handle packet with full checksum, no?
> >>> Yes.
> >>>
> >>>> I meant it
> >>>> will be then to be functional equivalent to !
> >>>> VIRTIO_NET_F_GUEST_FULL_CSUM?
> >>> Are you referring to
> >>> "functional equivalent to !VIRTIO_NET_F_GUEST_CSUM" ?
> >> Sorry, this is a typo. I meant
> >>
> >> Are you referring to
> >> "functional equivalent to !VIRTIO_NET_F_GUEST_FULL_CSUM" ?
> >>
> >>> If so, I think it's no.
> >>>
> >>> Maybe a description similar to the following would be more clearer:
> >>>
> >>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver does not handle
> >>> packets with partial checksum.
> > I may miss something here, but what's the difference between
> >
> > VIRTIO_NET_F_GUEST_FULL_CSUM
> >
> > and
> >
> > !VIRTIO_NET_F_GUEST_CSUM?
>
>  From the device perspective:
>
> If !VIRTIO_NET_F_GUEST_CSUM, the device delivers packets with full
> checksum to the driver,
> but the device can not validate the checksum for these packets. That is,
> the flags in virtio-net-hdr
> will not contain _DATA_VALID, and the driver or stack needs to validate
> these packets.
>
> If VIRTIO_NET_F_GUEST_FULL_CSUM, the device delivers packets with full
> checksum to the driver,
> and the device can validate the checksum for these packets. That is, the
> flags in virtio-net-hdr
> will contain _DATA_VALID,

I think DATA_VALID is optional here as device can't recognize all type
of protocols.

> and the driver or stack does not need to
> validate these packets.

Ok, so I think there're something that is subtle here, and that's why
I'm asking here:

1) "Driver does not handle packets with partial checksum" is not
accurate, !GUEST_CUSM also fit for this definition.
2) "Driver handles packets with full checksum" is kind of ambiguous as
it doesn't say whether or not the packet has been validated or not.

Thanks

>
> Thanks!
>
> >
> > Thanks
> >
> >>> Thanks!
> >>>
> >>>> Thanks
> >>>>
> >>>>> Thanks!
> >>>>>
> >>>>>> Thanks
> >>>>>>
> >>>>>>> \item[VIRTIO_NET_F_CTRL_GUEST_OFFLOADS (2)] Control channel offlo=
ads
> >>>>>>>             reconfiguration support.
> >>>>>>> --
> >>>>>>> 2.19.1.6.gb485710b
> >>>>>>>
> >>>
> >>> This publicly archived list offers a means to provide input to the
> >>> OASIS Virtual I/O Device (VIRTIO) TC.
> >>>
> >>> In order to verify user consent to the Feedback License terms and
> >>> to minimize spam in the list archive, subscription is required
> >>> before posting.
> >>>
> >>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >>> List help: virtio-comment-help@lists.oasis-open.org
> >>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> >>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license=
.pdf
> >>> List Guidelines:
> >>> https://www.oasis-open.org/policies-guidelines/mailing-lists
> >>> Committee: https://www.oasis-open.org/committees/virtio/
> >>> Join OASIS: https://www.oasis-open.org/join/
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

