Return-Path: <virtio-comment-return-8703-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A6FC07E97
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 05:18:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DEE682B022
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 05:18:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C0842986882
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 05:18:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9490098614B; Fri,  1 Dec 2023 05:18:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8406E98669A
	for <virtio-comment@lists.oasis-open.org>; Fri,  1 Dec 2023 05:18:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: krvP-tUdO9qCHQDGfHmYFQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701407922; x=1702012722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbeCJfLpIZKqv1vmURm9n65LzlnSQrSgNQvEFj0Dcl8=;
        b=vGp/2+PxsZtijK/hw6/alUV2GOTgUyjqn1RTinSOjyyLQzL3N2QzGy3EhcSCfnoZR0
         pwGOsuvk+rLEv5i5SyTKw8VBPtdgoGm0aXoo4UfdV75GW5uHqiUKDh3JtwEeJ7y1j9Xj
         hw3qYPiE9Vn1QL3ysuwVKS+CCsBhn6KF4+T5Qf4TSfWpkcIpTLF/TBrJ4L9beLgGzPnv
         7Z9TIcnHVSgTkUGK16RqjNR27W9ZhYLmQ+LfJXU+QLKjs89cLafK2Wzvk95UzKkS/h72
         xYFDNzAs7t8guE+G9ucdAPQeOsLGFQQBSyIFsNaxo44GE/4O/EUmNL7W+TtHG7GzDq+b
         PhWA==
X-Gm-Message-State: AOJu0YwsxG2LM3sUEEpaQgFiUzqdzLHqQP3XadE1RM3CvlMuwpGLVEOu
	aqdMdde/N1zUeVP7G0SqjgU8dnop+RFLotG+8trFT30jspd6bIjiXgM0NPEKENYprQISVRwj1P7
	PAHnuIW7bDw/mowDPqE/iDXgrKxd6Gqwd/zNgaXY6iOJ8MI9grQ==
X-Received: by 2002:a05:6512:3c8a:b0:50a:7868:d3c3 with SMTP id h10-20020a0565123c8a00b0050a7868d3c3mr520607lfv.16.1701407921936;
        Thu, 30 Nov 2023 21:18:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfAl6D1hTl/2pKIu9PKOlqrkP6VwG0ANieqSADiy4E9/Ytj+YhFRT2pzl5DqRPDA8+szg4uUmzIsGdpprE218=
X-Received: by 2002:a05:6512:3c8a:b0:50a:7868:d3c3 with SMTP id
 h10-20020a0565123c8a00b0050a7868d3c3mr520601lfv.16.1701407921649; Thu, 30 Nov
 2023 21:18:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701158152.git.hengqi@linux.alibaba.com>
 <5490c3b5b2321e13a9344057d02f2ae5fe9ebf56.1701158152.git.hengqi@linux.alibaba.com>
 <CACGkMEuN20TaSF1OeFgwEF85ZadxPomnsoMmprS3=DpCFPJKhQ@mail.gmail.com> <90ef9ec4-6cce-49c4-a27d-7168990ae3f3@linux.alibaba.com>
In-Reply-To: <90ef9ec4-6cce-49c4-a27d-7168990ae3f3@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 1 Dec 2023 13:18:10 +0800
Message-ID: <CACGkMEu3M6D0TXgm7b89mKosGF37x2YJhj+kVb0RQ=sZJ+vQqA@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, 
	"Michael S . Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v4 1/2] virtio-net: update
 description for VIRTIO_NET_F_GUEST_CSUM.

On Wed, Nov 29, 2023 at 4:23=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.com> =
wrote:
>
>
>
> =E5=9C=A8 2023/11/29 =E4=B8=8B=E5=8D=884:00, Jason Wang =E5=86=99=E9=81=
=93:
> > On Tue, Nov 28, 2023 at 4:08=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.c=
om> wrote:
> >> To prevent readers from misunderstanding that the driver can
> >> only handles packets with partial checksum when
> >> VIRTIO_NET_F_GUEST_CSUM is negotiated, we update the description.
> >>
> >> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> >> ---
> >>   device-types/net/description.tex | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/device-types/net/description.tex b/device-types/net/descr=
iption.tex
> >> index aff5e08..529f470 100644
> >> --- a/device-types/net/description.tex
> >> +++ b/device-types/net/description.tex
> >> @@ -38,7 +38,7 @@ \subsection{Feature bits}\label{sec:Device Types / N=
etwork Device / Feature bits
> >>   \begin{description}
> >>   \item[VIRTIO_NET_F_CSUM (0)] Device handles packets with partial che=
cksum offload.
> >>
> >> -\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with partia=
l checksum.
> >> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with partia=
l checksum or full checksum.
> > So patch 2 said
> >
> > "
> > +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver handles packets with
> > full checksum.
> >   \end{description}
> > "
> >
> > Is there any difference between the two "full checksum" here?
>
> There's no difference.
>
> The core is that VIRTIO_NET_F_GUEST_FULL_CSUM means that the driver "can
> only" handle packets with full checksum.

This seems to be odd.

Driver can always handle packet with full checksum, no? I meant it
will be then to be functional equivalent to !
VIRTIO_NET_F_GUEST_FULL_CSUM?

Thanks

>
> Thanks!
>
> >
> > Thanks
> >
> >>   \item[VIRTIO_NET_F_CTRL_GUEST_OFFLOADS (2)] Control channel offloads
> >>           reconfiguration support.
> >> --
> >> 2.19.1.6.gb485710b
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

