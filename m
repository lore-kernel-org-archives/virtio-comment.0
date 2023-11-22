Return-Path: <virtio-comment-return-8520-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89633C072A2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 04:17:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DDBA3217AA
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 04:17:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CBC669868A5
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 04:17:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BFF35986893; Wed, 22 Nov 2023 04:17:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B0D41986894
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 04:17:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: aq5L-uDzOOqq7ey62N2lEg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700626672; x=1701231472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Wrd2QKqZvMRqAtob965EEBu6pPPK62wc8MpZdg9pgk=;
        b=h8MnK6u2VLSbdKRtJhLLkxIa5s02M3eZd41aWCX8cZOH2spKZDr2oi+DCBRkfRbER/
         +Ixr6hb8+zd51JHtFBBCTJ2a+FP0V1YY/oP2JErpFUAZ59BeGPgWDHCLpqefJ9Gqu7wd
         BMy80dZNj4Ez7KzdECIiPgcw+bV7Jgs3wc/ouv1fYdqzFNJ++aYPZ4FdMFJsCPBnWRvw
         ntStw0qHRPE13GPoE0OEeut3NuZltMUf8Z91Ug7Y1wfYp07QtFd+0s/gh9m5WZuPWCOi
         Er9rMgHs6Oc7lagHzA+oyaaOcDan9ceY+dZFpoGGev62gWWOnb+HKzOIuAi0VR+X6lXh
         Bq5Q==
X-Gm-Message-State: AOJu0YwdF3KAEOeOhEDwBI3wzFvritkFD+plnwuq668Nujv8BhQWlKTs
	TH75m1jtZtY8QZ9L1+Z1pdc7UQaUevla0/Q/Ite1EeOZLy+wmPHX8k9tnkflJJdI3XuEBejRLOm
	6TEnXMTj3hhxixcmIXzJhjULT6+ufW3tP2crh9SD6mtp4fwm86w==
X-Received: by 2002:ac2:41d4:0:b0:509:4a02:49f7 with SMTP id d20-20020ac241d4000000b005094a0249f7mr640837lfi.44.1700626671809;
        Tue, 21 Nov 2023 20:17:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhFO4WZwGpGSJJCd1gmbDj5fwpBViZfl4Zcnkete+ZrwEhrrzVV+zJuBne9psJt9Yz3ZQX+g+wAQUuQJudzV0=
X-Received: by 2002:ac2:41d4:0:b0:509:4a02:49f7 with SMTP id
 d20-20020ac241d4000000b005094a0249f7mr640826lfi.44.1700626671502; Tue, 21 Nov
 2023 20:17:51 -0800 (PST)
MIME-Version: 1.0
References: <20231117031251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117042446-mutt-send-email-mst@kernel.org> <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117044428-mutt-send-email-mst@kernel.org> <PH0PR12MB5481E8342B26739B852B592FDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117053117-mutt-send-email-mst@kernel.org> <PH0PR12MB5481632B9E440DDCBEEA7B75DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117062003-mutt-send-email-mst@kernel.org> <PH0PR12MB548133582D377B3FE4BB9F6CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073917-mutt-send-email-mst@kernel.org> <PH0PR12MB5481CD9329189829A8A6B6D1DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtEEj8jXeE7JHyFk6UkBkEP5vpYzXPHHSGpSjDKQivJAg@mail.gmail.com> <PH0PR12MB5481036FE38E03DDFAE1D13CDCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481036FE38E03DDFAE1D13CDCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 22 Nov 2023 12:17:39 +0800
Message-ID: <CACGkMEtpSFBp2oVtawgs8k7S-kp2DFXBdSW6_y3nrt3L-ZkSSg@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, 
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

On Wed, Nov 22, 2023 at 12:29=E2=80=AFAM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, November 21, 2023 10:47 AM
> >
> > On Fri, Nov 17, 2023 at 8:51=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > > > From: virtio-comment@lists.oasis-open.org
> > > > <virtio-comment@lists.oasis- open.org> On Behalf Of Michael S.
> > > > Tsirkin
> > > > Sent: Friday, November 17, 2023 6:11 PM
> > > >
> > > > On Fri, Nov 17, 2023 at 12:22:59PM +0000, Parav Pandit wrote:
> > > > >
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Friday, November 17, 2023 5:03 PM
> > > > > > To: Parav Pandit <parav@nvidia.com>
> > > > >
> > > > > > > Somehow the claim of shadow vq is great without sharing any
> > > > > > > performance
> > > > > > numbers is what I don't agree with.
> > > > > >
> > > > > > It's upstream in QEMU. Test it youself.
> > > > > >
> > > > > We did few minutes back.
> > > > > It results in a call trace.
> > > > > Vhost_vdpa_setup_vq_irq crashes on list corruption on net-next.
> > > >
> > > > Wrong list for this bug report.
> > > >
> > > > > We are stopping any shadow vq tests on unstable stuff.
> > > >
> > > > If you don't want to benchmark against alternatives how are you
> > > > going to prove your stuff is worth everyone's time?
> > >
> > > Comparing performance of the functional things count.
> > > You suggest shadow vq, frankly you should post the grand numbers of
> > shadow vq.
> >
> > We need an apple to apple comparison. Otherwise you may argue with that=
,
> > no?
> >
> When the requirements are met the comparison can be made of the solution.
> And I don=E2=80=99t see that the basic requirements are matching for two =
different use cases.
> So no point in discussing one OS specific implementation as reference poi=
nt.

Shadow virtqueue is not OS specific, it's a common method. If you
disagree, please explain why.

> Otherwise I will end up adding vfio link in the commit log in next versio=
n as you are asking similar things here and being non neutral to your ask.

When doing a benchmark, you need to describe your setups, no? So any
benchmark is setup specific, nothing wrong.

It looks to me you claim your method is better, but refuse to give proofs.

>
> Anyway, please bring the perf data whichever you want to compare in anoth=
er forum. It is not the criteria anyway.

So how can you prove your method is the best one? You have posted the
series for months, and so far I still don't see any rationale about
why you choose to go that way.

This is very odd as we've gone through several methods one or two
years ago when discussing vDPA live migration.

>
> > >
> > > It is really not my role to report bug of unstable stuff and compare =
the perf
> > against.
> >
> > Qemu/KVM is highly relevant here no? And it's the way to develop the
> > community. The shadow vq code is handy.
> It is relevant for direct mapped device.

Let's focus on the function then discuss the use cases. If you can't
prove your proposal has a proper function, what's the point of
discussing the use cases?

> There is absolutely no point of converting virtio device to another virtu=
alization layer and run again and get another virtio device.
> So for direct mapping use case shadow vq is not relevant.

It is needed because shadow virtqueue is the baseline. Most of the
issues don't exist in the case of shadow virtqueue.

We don't want to end up with a solution that

1) can't outperform shadow virtqueue
2) have more issues than shadow virtqueue

> For other use cases, please continue.
>
> >
> > Just an email to Qemu should be fine, we're not asking you to fix the b=
ug.
> >
> > Btw, how do you define stable? E.g do you think the Linus tree is stabl=
e?
> >
> Basic test with iperf is not working. Crashing it.

As a kernel developer, dealing with crashing at any layer is pretty common.=
 No?

Thanks


> All of this is complete unrelated discussion to this series to slow down =
the work.
> I don=E2=80=99t see any value.
> Michael asked to do the test, we did, it does not work. Functionally brok=
en code has no comparison.
>
> > Thanks
> >
> > >
> > > We propose device context and provided the numbers you asked. Mostly
> > wont be able to go farther than this.
> > >
> > > This publicly archived list offers a means to provide input to the
> > > OASIS Virtual I/O Device (VIRTIO) TC.
> > >
> > > In order to verify user consent to the Feedback License terms and to
> > > minimize spam in the list archive, subscription is required before
> > > posting.
> > >
> > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > List help: virtio-comment-help@lists.oasis-open.org
> > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > Feedback License:
> > > https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > List Guidelines:
> > > https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > Committee: https://www.oasis-open.org/committees/virtio/
> > > Join OASIS: https://www.oasis-open.org/join/
> > >
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

