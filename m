Return-Path: <virtio-comment-return-7053-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710E6C001DB
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 06:17:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B9B473E307
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 06:17:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9EDBC98646D
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 06:17:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8D91298403A; Tue,  8 Aug 2023 06:17:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7A8DF986460;
	Tue,  8 Aug 2023 06:17:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R731e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VpK24NY_1691475426;
Message-ID: <1691475379.321958-8-xuanzhuo@linux.alibaba.com>
Date: Tue, 8 Aug 2023 14:16:19 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Parav Pandit <parav@nvidia.com>
References: <20230803083150.46745-1-xuanzhuo@linux.alibaba.com>
 <20230803054333-mutt-send-email-mst@kernel.org>
 <1691059929.235804-1-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB5481B5B3C5366CCACB221083DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691060652.3764465-2-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB548191AE225B08BACFC0C350DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691061508.9066079-5-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB5481CB7BE555F4672394A6ECDC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691062204.2378864-7-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB5481E104793F9E68E1DC95CADC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691062877.0013635-8-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB5481C3CE21016385BF7D6FF0DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691129914.3255427-1-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB5481F521F146049E5E483B7DDC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691132049.7182267-2-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB5481BE16AC810CD3A6D64832DC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691135097.4908528-3-xuanzhuo@linux.alibaba.com>
 <20230804053958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548152A5677F0508A62587AFDC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691388171.3192031-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEtKcmvBqSJac4aNQMtvE+fYnOeLxeeXz1vtP5d2PM69bQ@mail.gmail.com>
 <1691462188.324996-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEszg7nUNH2bW+EQLVxnPvUzT66D8=V8x7JKw+DL=RzsiQ@mail.gmail.com>
 <PH0PR12MB5481D3BDFB943D7856D846A9DC0DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvzU4SE8wBoTE6A56S9bGM_rtv=nU113WhEUL2EBEBaug@mail.gmail.com>
 <PH0PR12MB5481C7090E20AF17A9B2C437DC0DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvRJ3wn_oeue9nDGL-itq=zY=m3_GgsoC_WSU+PYO_s0w@mail.gmail.com>
 <PH0PR12MB54810FEA361DFB7C759F2AADDC0DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuRHK8=eJOUvj_GtC58Fxyk0SwubAM1=gY-S5SBkg9_3g@mail.gmail.com>
In-Reply-To: <CACGkMEuRHK8=eJOUvj_GtC58Fxyk0SwubAM1=gY-S5SBkg9_3g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: RE: RE: RE: RE: [virtio-comment] RE: RE: RE: RE: [RFC] virtio-net: support access and control the member devices

On Tue, 8 Aug 2023 13:21:23 +0800, Jason Wang <jasowang@redhat.com> wrote:
> On Tue, Aug 8, 2023 at 12:38=E2=80=AFPM Parav Pandit <parav@nvidia.com> w=
rote:
> >
> >
> > > From: Jason Wang <jasowang@redhat.com>
> > > Sent: Tuesday, August 8, 2023 10:03 AM
> >
> > > > This option because it is in use by very big and mature eco system =
of multiple
> > > sw stacks, kernel subsystem, drivers, and nics for several years now.
> > > >
> > > > > A drawback of using switch is that it introduces dependencies.
> > > > >
> > > > Feature is not a dependency. :)
> > >
> > > Well, I meant you need a switch in order to let the IP filter work th=
en.
> > >
> > Ok.
> >
> > > >
> > > > > > A virtio switch object can be part of a existing virtio device =
or
> > > > > > a new virtio
> > > > > device type in itself.
> > > > >
> > > > > That's fine.
> > > > >
> > > > > >
> > > > > > Xuan,
> > > > > > As we discussed, since the owner device packets also needs to be
> > > > > > filtered, potentially outside of the owner device itself,
> > > > >
> > > > > This seems the admin request out of the scope of virtio.
> > > > >
> > > > Not really, it could be virto switch device that manage PF also.
> > > > At that point, there may be two functions, PF and switching PF, swi=
tching PF
> > > filters the traffic of the PF.
> > >
> > > That's fine. But such filtering needs to be done in a switch specific=
 way not via
> > > the admin command/virtqueue.
> >
> > A switch object needs a generic flow filter vq(s) to meet the high rate=
 needed.
> > Several of us have worked through the flow filter vq for few several we=
eks on bi-weekly basis and over public mailing lists.
> >
> > We can differ the design discussion once we have clarity on requirement=
s. :)
>
> It can be done via flow filter or not for sure. We need more inputs on
> the requirement. Maybe a new thread is more suitable.

YES.

I will post a summary to a new thread.

Thanks.


>
> Thanks
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

