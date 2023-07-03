Return-Path: <virtio-comment-return-6682-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F001EB64DC
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 08:10:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BE1856846E
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 08:10:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9E687986555
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 08:10:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8614198644B; Mon,  3 Jul 2023 08:10:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7223D98644C
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Jul 2023 08:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: YgsohcUoNYirisxpVC6_fQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688371830; x=1690963830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxcTSqe3lQlPrfVMacD/IElNIniUkHAsjhLBcjD8F98=;
        b=YRkUNpf25fpS9kOTfsaUvaOzBBhBPtvqLAWkHODEPrVCzS8fNrBhz20vTcJpqomlhf
         XDApE3arbEFsqjbkHsSCva4LjUxR8xutuZF71uMvLS/YiOH9QObcRPfUPfxGEC3KjdWL
         9r+CmKxe+s1lI+l+iVFOgCy494al4FcoET/97LHiTq8KIWLSQvfjZ3dqoegFynw4TwvR
         Lo/CACC6WiFHaRKMPrd0F8dIMQisDL8XvrQo3KORtJn/erkeZfUTN35jUqiJsAS0XItu
         Dsp2lKm1SuwbravCmu7uioKuRmp0oVstzefE+SoLK1BOuaAVJf6YimXrulHpzqEhhzjk
         Xmww==
X-Gm-Message-State: ABy/qLZjgkOAawlbpKNX07tnfQbethRG/g0Cp2NCh+5UsOizL00SrpIT
	ZrmvXcbUAb1fnqP6xQdcuUDL5U+RMLrVCxb0g5GPLJC+RfLAJClJ0SuV7aNzv7ZgRRsQ+t00XkT
	16Brdi5/VhWASFkptulkfjbvp5gso2kKRt7upywDMq23PGVfIUg==
X-Received: by 2002:a2e:3307:0:b0:2b6:9ebc:daed with SMTP id d7-20020a2e3307000000b002b69ebcdaedmr6185965ljc.35.1688371830009;
        Mon, 03 Jul 2023 01:10:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEGiHzRl3wUE9SBwyMAqtdW0hfDl9DFR774kaOTtX/ZBJXH6WF6MJNrKwnvv0RsZwaopdQlwU1+1orslo6jo6Y=
X-Received: by 2002:a2e:3307:0:b0:2b6:9ebc:daed with SMTP id
 d7-20020a2e3307000000b002b69ebcdaedmr6185950ljc.35.1688371829687; Mon, 03 Jul
 2023 01:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <1687243466.51691-1-xuanzhuo@linux.alibaba.com>
 <e37fb447-fd22-4d42-f3e2-2ab6f1c8f3b4@intel.com> <1688104464.531018-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1688104464.531018-1-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 3 Jul 2023 16:10:18 +0800
Message-ID: <CACGkMEtNPGneB0E1sVqmpe9fGwMp=_2vmepy3Bm9r=5=5r=ZXQ@mail.gmail.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, virtio-comment@lists.oasis-open.org, 
	"Michael S. Tsirkin" <mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] About the plan of Admin Queue

On Fri, Jun 30, 2023 at 1:59=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> On Tue, 20 Jun 2023 16:11:12 +0800, "Zhu, Lingshan" <lingshan.zhu@intel.c=
om> wrote:
> >
> >
> > On 6/20/2023 2:44 PM, Xuan Zhuo wrote:
> > > Hi,
> > >
> > > hi, I would want to know some plans and progress about admin queue.
> > >
> > > At the current spec, it seems that there is only one framework and no
> > > specific commands. I'd like to know if anyone is currently working on=
 this and
> > > what the plans are.
> > >
> > > We also faced some similar issues, and we think admin queue is a good=
 way to
> > > manage sr-iov.
> > >
> > >
> > > Thanks.
> > I plan to rebase original transport vq on admin vq.
> >
> > https://lists.oasis-open.org/archives/virtio-comment/202208/msg00140.ht=
ml
>
>
> I review the patch, that is for S-IOV, right?

It is not limited to SIOV. So you won't see any SIOV terminology in
the proposal.

>
> I think it is good.
>
> I would if all is configured by the transport vq/admin vq from the OS?

One thing to clarify is that, we will define a set of admin commands,
and admin virtqueue is one interface for that. The admin commands is
designed to be more general to be carried via other type of interfaces
(if not, let's fix):

1) MMIO
2) Other transport that already use DMA
3) software IPC

Thanks

>
> Can we create a managed dev from the backend?
>
> Such as, the DPU sends a command to the driver, then the driver creates a=
 new
> managed dev.
>
> Thanks.
>
>
> >
> > Thanks,
> > Zhu Lingshan
> > >
> > >
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
> > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license=
.pdf
> > > List Guidelines: https://www.oasis-open.org/policies-guidelines/maili=
ng-lists
> > > Committee: https://www.oasis-open.org/committees/virtio/
> > > Join OASIS: https://www.oasis-open.org/join/
> > >
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
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing=
-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
> >
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

