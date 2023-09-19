Return-Path: <virtio-comment-return-7462-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A254CD3438
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 04:35:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 99784157EE5
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 04:35:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 781C298651C
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 04:35:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6740498637D; Tue, 19 Sep 2023 04:35:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D8CA19864D1
	for <virtio-comment@lists.oasis-open.org>; Tue, 19 Sep 2023 04:34:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 76x0jVcLOIOClwIXmiGuqg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695098059; x=1695702859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dC1p9Eo8a7jAI8bhsFPUwHJLiUMg1rN/W4oba/2gSCA=;
        b=m6dyTE2yzX+Gw4v1Z3fXjBpMU+q+g2lc1nvwNRVOuFXTIp35+bnybtflpmhYsFb/65
         nisDu88FLx82lHLo7U8g8Qxlg8UAtl/yugAqwFcc/Qq71gaeR8MvStejdZVWHBsTlMpe
         /2cioh9tUq7PldC0RYwseMCL5FBdDXSB5DGNMT7kLSzqKBMnNtEXjSG/uUq8+dB/SgEr
         yFVlrHLe2caEBFaAQQYQ7dMlwa/qaAt0i1ijwT38Krrf5uospbzlQ+DSt+FyFEx5Vf3f
         TTV1nUInPnF0xAgn5pvpurA0eCjzQdKGkixl8lQrpwHDJkkoAQ7QQpQ2JtZru6Pj0a+U
         E/jw==
X-Gm-Message-State: AOJu0YxJ42yJxh0rsCHahiIdyWYmYRIPJWrXbgxdWbz1MXncza/jbK+q
	Z/DxN4CZs2YQ+ZJhh+yoi/Bz5Z3lJhMZsDzmVXFmw6Pse3v0h/ZRpLv+RoAu1D/FgpXXyLgHyph
	qA7V/RL2eGBkjggurlkjQs6yhQpmEwqmRh0Qnx7069yF0wQKkUg==
X-Received: by 2002:a19:7113:0:b0:500:9a45:62f with SMTP id m19-20020a197113000000b005009a45062fmr7599703lfc.8.1695098059218;
        Mon, 18 Sep 2023 21:34:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUo3AEXXQtFqlNkYfp3m/0yKVxKjHbmaZXBqMbLr06cEeXpCyFO0dfsdTFqs97PHBt1Vjoy6bJdc7GuOuJQ7g=
X-Received: by 2002:a19:7113:0:b0:500:9a45:62f with SMTP id
 m19-20020a197113000000b005009a45062fmr7599688lfc.8.1695098058837; Mon, 18 Sep
 2023 21:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
 <PH0PR12MB5481E8114A659954251F17DCDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <17514b93-2da4-42b3-a5bf-b96358a7a875@intel.com> <PH0PR12MB5481F236858D5CD97EF55732DCF1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9fabd346-9b6f-a727-3de8-813ec3570772@intel.com> <PH0PR12MB5481468378DC1E5491A5427CDCF1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2baee870-bf38-5d83-0543-1d0a68f8e651@intel.com> <PH0PR12MB5481A26B62962979C19280D2DCF1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <8bd1c228-856a-9454-752d-750997c4f4db@intel.com> <4c195683-0eb8-5e92-d97a-217cfa8af760@intel.com>
 <PH0PR12MB5481860AEAD92C74A5BC19F6DCF1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f132cd22-e2e1-971a-894a-d62aa7ca6334@intel.com> <PH0PR12MB5481EF64F3BA3D13C34D016EDCF0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2f34daa5-3db3-fd64-550d-86678acbfef4@intel.com> <PH0PR12MB5481BB050713B687EDD07FB2DCF0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9d9ac82e-8eb9-558e-916a-c327e3c3a996@intel.com> <PH0PR12MB54814FAE1D790492C8D660E9DCF0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvo1cc7jnPT1ia8=+eOcgHaOhr77ey4p+_qLwq+cCE2vw@mail.gmail.com> <PH0PR12MB5481F53C9B2FFD5FF5BD4E4ADCF4A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481F53C9B2FFD5FF5BD4E4ADCF4A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 19 Sep 2023 12:34:07 +0800
Message-ID: <CACGkMEvsLnff7shd5RS8zuRQ0rbt+HHhUBDpviQ_=JiKP1mXVQ@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"stefanha@redhat.com" <stefanha@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH 5/5] virtio-pci: implement VIRTIO_F_QUEUE_STATE

On Sun, Sep 17, 2023 at 1:25=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Thursday, September 14, 2023 8:41 AM
> >
> > On Wed, Sep 13, 2023 at 12:37=E2=80=AFPM Parav Pandit <parav@nvidia.com=
> wrote:
> > >
> > >
> > >
> > > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > Sent: Wednesday, September 13, 2023 9:51 AM
> > >
> > > > we plan to implement a self-contain solution
> > > Make sure that works with device reset and FLR.
> >
> > We don't need to do that. It's out of the spec.
> >
> It is not. For the PCI member device, it needs to work reliably.

We never mentioned FLR in the PCI transport layer before and vendors
have produced tons of hardware PCI devices for several years.

If it's important, please describe it in detail in your series but it doesn=
't.

> Not doing means it relies on the trap+emulation, hence it just cannot com=
plete.
> And it is ok to me.
> I just wont claim that trap+emulation is _complete_ method.
>
> > > And if not, explain that it is for mediation mode related tricks.
> >
> > It's not the tricks and again, it's not mediation but trap and emulatio=
n. It's the
> > fundamental methodology used in virtualization, so does the virtio spec=
.
>
> Not the virto spec of 2023 and more for new features.
> The base for virtio spec 1.x was 0.9.5, but not the QEMU or other mediati=
on based software AFAIK.

Are you saying those new features will not be suitable for software
devices? If yes, please explain why.

Or are you saying the virtio spec is not capable for hardware devices?

Thanks


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

