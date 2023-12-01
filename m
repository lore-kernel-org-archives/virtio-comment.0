Return-Path: <virtio-comment-return-8709-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E94FC4167B
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 07:05:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 76F882B025
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 07:05:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4ECD69866A4
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 07:05:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 31D3598614B; Fri,  1 Dec 2023 07:05:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 00CB598669A
	for <virtio-comment@lists.oasis-open.org>; Fri,  1 Dec 2023 07:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: psQoez_AOh-Y96iKeJ68Dw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701414330; x=1702019130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6vpQepQ2Z9y2+HF2PqNRgBYN5UneH+crBb0B1O+fEg=;
        b=n93DJQO7Wagbt+S+EE/6NL+n7YVcxctwtOF+J5rItKdOEG3eDFVPswua8lLcon8hVE
         wLrkaCf2Bb5mWcxm+riTDcnU7xjFo6PG7zLFWIcPBhJxlQZm8YmadBmZA3WN30nVg3Y6
         qrtnfmJIgSSdHSZYziR5s+R7QTzpnxTmGqLpzx7RD0ghe0ZUa+armhhCjcIT2x4N31CK
         R5mKTJAYOjfhxXW5CDxsk9itbDTbyLYpunv9iDYzf6hGupUH6Y/nJVOBU6Tre3SAoW1m
         KKwyo2hu5IJG+exv89q5aywkeIJiE3ssbmVcJtAUO2VtVwzVsexTFoJPr00AcHqEzDHh
         0Frg==
X-Gm-Message-State: AOJu0YxkPk15xRv6Wy0ZlnYaLW6nAdcR11kKuvsTYRZWV2pPA/o0dcQD
	ck06ItUgME3B9F7Rgl2ek7DEXILaf7J9Bxz4ghPzw1HZ85MIR2Phtl+TPQip495/A0OJ1qhjPEu
	8gus/5/8I8WZK5KA2TLhVfnEdR172KPNV89jH2mDVvpoTsTwUaQ==
X-Received: by 2002:a05:6512:3b23:b0:50b:c476:2f03 with SMTP id f35-20020a0565123b2300b0050bc4762f03mr577679lfv.61.1701414330479;
        Thu, 30 Nov 2023 23:05:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHN1I7dlgVscQ/NiuUbvDlgYre43nLxqzKCxBlXyX0L9AhhCahfUhPGGp+b52H1Q5UwVoXaMkQ+0OjQqUCyRIo=
X-Received: by 2002:a05:6512:3b23:b0:50b:c476:2f03 with SMTP id
 f35-20020a0565123b2300b0050bc4762f03mr577668lfv.61.1701414330079; Thu, 30 Nov
 2023 23:05:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701158152.git.hengqi@linux.alibaba.com>
 <5490c3b5b2321e13a9344057d02f2ae5fe9ebf56.1701158152.git.hengqi@linux.alibaba.com>
 <CACGkMEuN20TaSF1OeFgwEF85ZadxPomnsoMmprS3=DpCFPJKhQ@mail.gmail.com>
 <90ef9ec4-6cce-49c4-a27d-7168990ae3f3@linux.alibaba.com> <CACGkMEu3M6D0TXgm7b89mKosGF37x2YJhj+kVb0RQ=sZJ+vQqA@mail.gmail.com>
 <5bb13b60-f324-412f-99a2-a476320d79b1@linux.alibaba.com> <00b1ed5f-fc91-4aba-b650-2830cd5ac412@linux.alibaba.com>
In-Reply-To: <00b1ed5f-fc91-4aba-b650-2830cd5ac412@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 1 Dec 2023 15:05:18 +0800
Message-ID: <CACGkMEsz_6DQtsErd+V0kKSzm=TLxvSgk_Fbhyysa-w41CXSwQ@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, 
	"Michael S . Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v4 1/2] virtio-net: update
 description for VIRTIO_NET_F_GUEST_CSUM.

On Fri, Dec 1, 2023 at 2:30=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.com> w=
rote:
>
>
>
> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=882:24, Heng Qi =E5=86=99=E9=81=93:
> >
> >
> > =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=881:18, Jason Wang =E5=86=99=E9=81=
=93:
> >> On Wed, Nov 29, 2023 at 4:23=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.=
com>
> >> wrote:
> >>>
> >>>
> >>> =E5=9C=A8 2023/11/29 =E4=B8=8B=E5=8D=884:00, Jason Wang =E5=86=99=E9=
=81=93:
> >>>> On Tue, Nov 28, 2023 at 4:08=E2=80=AFPM Heng Qi <hengqi@linux.alibab=
a.com>
> >>>> wrote:
> >>>>> To prevent readers from misunderstanding that the driver can
> >>>>> only handles packets with partial checksum when
> >>>>> VIRTIO_NET_F_GUEST_CSUM is negotiated, we update the description.
> >>>>>
> >>>>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> >>>>> ---
> >>>>>    device-types/net/description.tex | 2 +-
> >>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/device-types/net/description.tex
> >>>>> b/device-types/net/description.tex
> >>>>> index aff5e08..529f470 100644
> >>>>> --- a/device-types/net/description.tex
> >>>>> +++ b/device-types/net/description.tex
> >>>>> @@ -38,7 +38,7 @@ \subsection{Feature bits}\label{sec:Device Types
> >>>>> / Network Device / Feature bits
> >>>>>    \begin{description}
> >>>>>    \item[VIRTIO_NET_F_CSUM (0)] Device handles packets with
> >>>>> partial checksum offload.
> >>>>>
> >>>>> -\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with
> >>>>> partial checksum.
> >>>>> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with
> >>>>> partial checksum or full checksum.
> >>>> So patch 2 said
> >>>>
> >>>> "
> >>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver handles packets wit=
h
> >>>> full checksum.
> >>>>    \end{description}
> >>>> "
> >>>>
> >>>> Is there any difference between the two "full checksum" here?
> >>> There's no difference.
> >>>
> >>> The core is that VIRTIO_NET_F_GUEST_FULL_CSUM means that the driver
> >>> "can
> >>> only" handle packets with full checksum.
> >> This seems to be odd.
> >>
> >> Driver can always handle packet with full checksum, no?
> >
> > Yes.
> >
> >> I meant it
> >> will be then to be functional equivalent to !
> >> VIRTIO_NET_F_GUEST_FULL_CSUM?
> >
> > Are you referring to
> > "functional equivalent to !VIRTIO_NET_F_GUEST_CSUM" ?
>
> Sorry, this is a typo. I meant
>
> Are you referring to
> "functional equivalent to !VIRTIO_NET_F_GUEST_FULL_CSUM" ?
>
> > If so, I think it's no.
> >
> > Maybe a description similar to the following would be more clearer:
> >
> > +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver does not handle
> > packets with partial checksum.

I may miss something here, but what's the difference between

VIRTIO_NET_F_GUEST_FULL_CSUM

and

!VIRTIO_NET_F_GUEST_CSUM?

Thanks

> >
> > Thanks!
> >
> >>
> >> Thanks
> >>
> >>> Thanks!
> >>>
> >>>> Thanks
> >>>>
> >>>>> \item[VIRTIO_NET_F_CTRL_GUEST_OFFLOADS (2)] Control channel offload=
s
> >>>>>            reconfiguration support.
> >>>>> --
> >>>>> 2.19.1.6.gb485710b
> >>>>>
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

