Return-Path: <virtio-comment-return-6683-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAE1EB64DC
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 08:21:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 96D6F71C8D
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 08:20:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 71CD2986555
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 08:20:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5E2F398644B; Mon,  3 Jul 2023 08:20:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4A3A398644C
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Jul 2023 08:20:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R831e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0VmVdZH._1688372454;
Message-ID: <1688372430.0519888-1-xuanzhuo@linux.alibaba.com>
Date: Mon, 3 Jul 2023 16:20:30 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
 virtio-comment@lists.oasis-open.org,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <1687243466.51691-1-xuanzhuo@linux.alibaba.com>
 <e37fb447-fd22-4d42-f3e2-2ab6f1c8f3b4@intel.com>
 <1688104464.531018-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEtNPGneB0E1sVqmpe9fGwMp=_2vmepy3Bm9r=5=5r=ZXQ@mail.gmail.com>
In-Reply-To: <CACGkMEtNPGneB0E1sVqmpe9fGwMp=_2vmepy3Bm9r=5=5r=ZXQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] About the plan of Admin Queue

On Mon, 3 Jul 2023 16:10:18 +0800, Jason Wang <jasowang@redhat.com> wrote:
> On Fri, Jun 30, 2023 at 1:59=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba=
.com> wrote:
> >
> > On Tue, 20 Jun 2023 16:11:12 +0800, "Zhu, Lingshan" <lingshan.zhu@intel=
.com> wrote:
> > >
> > >
> > > On 6/20/2023 2:44 PM, Xuan Zhuo wrote:
> > > > Hi,
> > > >
> > > > hi, I would want to know some plans and progress about admin queue.
> > > >
> > > > At the current spec, it seems that there is only one framework and =
no
> > > > specific commands. I'd like to know if anyone is currently working =
on this and
> > > > what the plans are.
> > > >
> > > > We also faced some similar issues, and we think admin queue is a go=
od way to
> > > > manage sr-iov.
> > > >
> > > >
> > > > Thanks.
> > > I plan to rebase original transport vq on admin vq.
> > >
> > > https://lists.oasis-open.org/archives/virtio-comment/202208/msg00140.=
html
> >
> >
> > I review the patch, that is for S-IOV, right?
>
> It is not limited to SIOV. So you won't see any SIOV terminology in
> the proposal.


I got.


>
> >
> > I think it is good.
> >
> > I would if all is configured by the transport vq/admin vq from the OS?
>
> One thing to clarify is that, we will define a set of admin commands,
> and admin virtqueue is one interface for that. The admin commands is
> designed to be more general to be carried via other type of interfaces
> (if not, let's fix):
>
> 1) MMIO
> 2) Other transport that already use DMA
> 3) software IPC


Great!!

Thanks.


>
> Thanks
>
> >
> > Can we create a managed dev from the backend?
> >
> > Such as, the DPU sends a command to the driver, then the driver creates=
 a new
> > managed dev.
> >
> > Thanks.
> >
> >
> > >
> > > Thanks,
> > > Zhu Lingshan
> > > >
> > > >
> > > >
> > > >
> > > > This publicly archived list offers a means to provide input to the
> > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > >
> > > > In order to verify user consent to the Feedback License terms and
> > > > to minimize spam in the list archive, subscription is required
> > > > before posting.
> > > >
> > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_licen=
se.pdf
> > > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mai=
ling-lists
> > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > Join OASIS: https://www.oasis-open.org/join/
> > > >
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

