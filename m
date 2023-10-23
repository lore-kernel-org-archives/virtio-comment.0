Return-Path: <virtio-comment-return-7892-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E46FC001E0
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 03:45:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 866062AD4A
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 03:45:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7D80898666A
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 03:45:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7338D986659; Mon, 23 Oct 2023 03:45:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 65943986662
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 03:45:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 10lDZ_qdMl-FV4MNOJ8zUQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698032714; x=1698637514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1Ak3uoMco8o3/P0OrMqqj2zITsw2vX1B6nHWgYwZ40=;
        b=PqDtaT0q397rCPvAXaQEAmGXcSocZNYN/4vFAwF5AYa5ptdVudLUifko0+H3ED8GUj
         FaPRax9tz0wyMV4gOTBxJljWTNQMmzlCwnSuDdtYu2CUcjM8eJbaYTdxg//rYnvABaD2
         cGrwgu7SBYdMcjgo1n1hNKUnhsYJ7jcsMLkP2iBFocUFe5oQTLfeyTKldv5UfG8Fu+yW
         g/k2Ton/1tYufx4sHA+DIqee8EdLsV8AyloHk3EJ3Mr4hUDroFgy4t1Yq3IZtWcZLAHq
         r8v1W74sNyxCjUqK36+oySyOf1bXuo/ktNhwx7syWIuJM4GIZjiesJe6ag89Wgj+2spQ
         y9RQ==
X-Gm-Message-State: AOJu0YxiJKBljJGWTxNTUWt+fgaEPtM0GjLRerW1khCHktYok+54fnJU
	LXea9mtXcWJpomMXmj0K2ZUb1JiaoZHnDTxIMZ3VSb1Otm3lY6IJOYkfQW1Dohg2HmVY9LdsoB2
	Pa9dsYvw+LVHYOHURGk6Q2QeBG6v0mk+etQPSAQx70LSjCq2b+Q==
X-Received: by 2002:a05:6512:711:b0:507:a9b7:f071 with SMTP id b17-20020a056512071100b00507a9b7f071mr5462545lfs.1.1698032714450;
        Sun, 22 Oct 2023 20:45:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIVDL1kXPwvH7e4xTHa0D4Tsf6Gy7eB898CC7yrjjcX8VTkZKTBUUgtHJowpRxm3QVqbK1CVQMQmcQnnTpdjU=
X-Received: by 2002:a05:6512:711:b0:507:a9b7:f071 with SMTP id
 b17-20020a056512071100b00507a9b7f071mr5462531lfs.1.1698032714152; Sun, 22 Oct
 2023 20:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231008112555.473895-1-parav@nvidia.com> <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009121638-mutt-send-email-mst@kernel.org> <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com> <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com> <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com> <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt-pUSazfjfROukZdaLdmeX1xP7_OxQaQ=Se=jV5NXkDA@mail.gmail.com>
 <PH0PR12MB5481F8312139BB197CEB024BDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtihTxYADd1dbG=vX9=VLp0xfRJSQ4jd_m0UiuZNz_2sg@mail.gmail.com>
 <PH0PR12MB5481E85F17F9D22CBCC9FDF8DCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu_uRcL293Dd+vo2VvYJfUiCaPYF0dAjk-s6=RUtw-PEQ@mail.gmail.com>
 <PH0PR12MB54813820D9800B4F62C5784FDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMF4JVEQJ6skT2DrEWjop6wjKS6ad6dW2UNOA1oRuPKQ@mail.gmail.com>
 <PH0PR12MB548109DEAE4B6C76025BD57ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv2fNa_vqbqQmu3ys5tbB4-S-onXvr-pT9U9cd8iut7sA@mail.gmail.com> <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 23 Oct 2023 11:45:00 +0800
Message-ID: <CACGkMEsfyOCf-qCxr7kGM7WPco3YgeBsbOXbDT9AtigZpXF6Tg@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Thu, Oct 19, 2023 at 1:32=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
>
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Jason Wang
> > Sent: Thursday, October 19, 2023 10:15 AM
> >
> > > > Again, if you don't want to talk about transport virtqueue, that's
> > > > fine. But let's leave the scalability issue aside as well.
> > > >
> > > Registers are related for functionality and scale.
> > >
> > > Lets first agree on use case before the design, that I asked above.
> > >
> > > I will wait to respond to any other emails until we agree on use case
> > requirements.
> >
> > There are more than just me who want you to define "passthrough" first =
where
> > you refuse to respond.
> >
> Totally disagree.
> In the previous email itself, I wrote what passthrough is.
> So let's try yet one more time.
> Either you can re-read last email or for better read below and see if it =
is understood or not.
>
> > How could we make any agreement without an accurate the definition of
> > "passthrough" who is a key to understand each other?
>
> I replied few times in past emails but since those email threads are so l=
ong, it is easy to miss out.
>
> Passthrough definition:
> a. virtio member device mapped to the guest vm

I really think we need to be accurate here. For example, what does
"map" mean here?

> b. only pci config space and msix of a member device is intercepted by hy=
pervisor.

What's the criteria for choosing a cap/bar to be trapped or not? For
example, there're a lot of other things that need to be virtualized
besides MSI-X for sure.

> c. virtio config space, virtio cvqs, data vqs of a member device is direc=
tly accessed by the guest vm without intercepted by the hypervisor.
>
> (Why b?, no grand reason, it is how the hypervisors are working where to =
integrate the virtio member device to).

What you state here is more about the method to support a use case not
the use case itself. My understanding is "live migration" is a valid
use case for sure. And "passthough" is probably one way for achieving
live migration but this is what you need to define and justify in this
series.

What's more, I'm not convinced of a large series that is only designed
for a specific method of building a hypervisor. I'm more convinced
that if it can serve multiple different methods of building
hypervisors, I believe it would be more beneficial for virtio.

Thanks

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

