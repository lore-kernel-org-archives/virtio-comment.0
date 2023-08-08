Return-Path: <virtio-comment-return-7048-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FBFC04A6A
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 04:33:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A3DA429FCD
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 04:33:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 85AD3986461
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 04:33:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 72F99983EB3; Tue,  8 Aug 2023 04:33:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6059E986460
	for <virtio-comment@lists.oasis-open.org>; Tue,  8 Aug 2023 04:33:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 4vKtd-a-OjSadtmKzcoVlw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691469218; x=1692074018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4j5/NFGLBJ/TvD/klo9bwfwy5Z3MW8FTsWhM8tPRcWE=;
        b=L8SOQp8R7FJXxRBPUr4re1xX+b5d4+yeBqaw75n90Ql9iMu/HPBPftYrU0tx6E/fgJ
         2N6vUGOh+uDLQ//2THcH52Ihrw5UtjLxASTeNm929LLdq85SHe/25ZQg4lln/rYNb/lE
         N1TYs8bUQeUSxnQG6ZwYDoOSyxw9RzdGGjlDdu1lup3pSE3ApHXloMyUYJ9ymC6a6vCJ
         7eZnVPU12HNo28BROJXP3w3UcnycBRGcaly/teXRuQKFMFh7mbR2k2+jDl0PCstgy+wI
         QcsAUXhupgY0xXnnol6iMLDDPUOwJJUfKQbDbOdTlWm5jPZ1w7ohppc5KTfN8KHwVTo/
         mldA==
X-Gm-Message-State: AOJu0YzbKygGNEQ8DPfco9uoPISQAGMJSWb9r3HlqXIQzrZ8wb2sMVFH
	/7QE/YRLA41lVB/cF9CjVfJ0p9vvUcqOLRJL4DHGNnY1ir9g0LVvYw++AVYgWLiStiU3/uP8fr8
	2OyMKC8Eb0xt0fFgES3LTZTwbRqlKyZB757++7QrKUoFqeigcPg==
X-Received: by 2002:a2e:3208:0:b0:2b9:f13b:6135 with SMTP id y8-20020a2e3208000000b002b9f13b6135mr8798846ljy.18.1691469217883;
        Mon, 07 Aug 2023 21:33:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkPhLjzb6MJV2hO2T/8Af7HVW/XyrDmcplXWovjPqV9U8oMt6eYBkFluPjZBfGa57a3lslhXXCKOgnVEnuN5o=
X-Received: by 2002:a2e:3208:0:b0:2b9:f13b:6135 with SMTP id
 y8-20020a2e3208000000b002b9f13b6135mr8798840ljy.18.1691469217598; Mon, 07 Aug
 2023 21:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230803083150.46745-1-xuanzhuo@linux.alibaba.com>
 <20230803054333-mutt-send-email-mst@kernel.org> <1691059929.235804-1-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB5481B5B3C5366CCACB221083DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691060652.3764465-2-xuanzhuo@linux.alibaba.com> <PH0PR12MB548191AE225B08BACFC0C350DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691061508.9066079-5-xuanzhuo@linux.alibaba.com> <PH0PR12MB5481CB7BE555F4672394A6ECDC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691062204.2378864-7-xuanzhuo@linux.alibaba.com> <PH0PR12MB5481E104793F9E68E1DC95CADC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691062877.0013635-8-xuanzhuo@linux.alibaba.com> <PH0PR12MB5481C3CE21016385BF7D6FF0DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691129914.3255427-1-xuanzhuo@linux.alibaba.com> <PH0PR12MB5481F521F146049E5E483B7DDC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691132049.7182267-2-xuanzhuo@linux.alibaba.com> <PH0PR12MB5481BE16AC810CD3A6D64832DC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691135097.4908528-3-xuanzhuo@linux.alibaba.com> <20230804053958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548152A5677F0508A62587AFDC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691388171.3192031-1-xuanzhuo@linux.alibaba.com> <CACGkMEtKcmvBqSJac4aNQMtvE+fYnOeLxeeXz1vtP5d2PM69bQ@mail.gmail.com>
 <1691462188.324996-1-xuanzhuo@linux.alibaba.com> <CACGkMEszg7nUNH2bW+EQLVxnPvUzT66D8=V8x7JKw+DL=RzsiQ@mail.gmail.com>
 <PH0PR12MB5481D3BDFB943D7856D846A9DC0DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvzU4SE8wBoTE6A56S9bGM_rtv=nU113WhEUL2EBEBaug@mail.gmail.com> <PH0PR12MB5481C7090E20AF17A9B2C437DC0DA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481C7090E20AF17A9B2C437DC0DA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 8 Aug 2023 12:33:26 +0800
Message-ID: <CACGkMEvRJ3wn_oeue9nDGL-itq=zY=m3_GgsoC_WSU+PYO_s0w@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: RE: RE: RE: RE: [virtio-comment] RE: RE: RE: RE: [RFC]
 virtio-net: support access and control the member devices

On Tue, Aug 8, 2023 at 12:17=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, August 8, 2023 9:21 AM
>
> > > The idea is to introduce filters on the new virtio switch object for =
tx and rx
> > both.
> >
> > It can be done in this way for sure but the question is why it must be =
done in
> > this way.
> This option because it is in use by very big and mature eco system of mul=
tiple sw stacks, kernel subsystem, drivers, and nics for several years now.
>
> > A drawback of using switch is that it introduces dependencies.
> >
> Feature is not a dependency. :)

Well, I meant you need a switch in order to let the IP filter work then.

>
> > > A virtio switch object can be part of a existing virtio device or a n=
ew virtio
> > device type in itself.
> >
> > That's fine.
> >
> > >
> > > Xuan,
> > > As we discussed, since the owner device packets also needs to be
> > > filtered, potentially outside of the owner device itself,
> >
> > This seems the admin request out of the scope of virtio.
> >
> Not really, it could be virto switch device that manage PF also.
> At that point, there may be two functions, PF and switching PF, switching=
 PF filters the traffic of the PF.

That's fine. But such filtering needs to be done in a switch specific
way not via the admin command/virtqueue.

Thanks

>
> Anyways, I am just not finding it useful enough at current point in time =
for us as far mature alternatives exist that users are comfortable with.
> I would like to listen to Xuan if they really have use case for having sw=
itching PF as virtio object or not.
>
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

