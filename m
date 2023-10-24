Return-Path: <virtio-comment-return-7928-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4474CC00A8F
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 04:46:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7EE902AC48
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 04:46:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7582D986993
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 04:46:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 61DC098638A; Tue, 24 Oct 2023 04:46:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 50D0E986992
	for <virtio-comment@lists.oasis-open.org>; Tue, 24 Oct 2023 04:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: WbNtxeGxNb615BCaSOM1LA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698122779; x=1698727579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QcEnMqkaBCOr/MXSz/ST5UzWidszKOGPjaIn811Uj0=;
        b=elJqf8Rq+AEI/j5oXEJ1egftrN/PNAVel11wI8RZD6Em5E4u/ksmMcTLqdFL1SKKRu
         ASsNC8+2rvKzAFi85ZDmhE1EmpzdheUK/r4Q7Z/qZ4HP03a013ZfTEQCn5WbdEQ2e7Z4
         cbvV8f9JEvPVpfAnUAWyhhJ51M0D9k06MAL26fqIdko1fLE7EiKUH0mCKWcUuW+5da2t
         uGdTallcFy3nF+oEIQRf4nfNVA/0Qpg9jBXtpzT4FHfEVL3Z9xiclMI/llQez7DKst9M
         TcxNbiRYcuWl2eYs9uepRPooqt5D3xGh51uITK/M+OMkyuSpv87RhpSlHXa5dTjCxKtY
         MTeQ==
X-Gm-Message-State: AOJu0Yy9WYrLh6CcsiwwppV9naaSAnk2BVG4kSlLSV9qPSnRekN50ovG
	4O1KFLtdCaCDit1uyis8MACPjRXVv0tIgFUVfLYIW1wYoY9YhdmU93jS8chnq5U1Q0oW+0UUeCZ
	gLUfBHYyFY2AJEe/qnCbluVD4N00X0MGbR44FVoBlkxzA8b/cLQ==
X-Received: by 2002:a05:6512:4885:b0:503:95d:f2bd with SMTP id eq5-20020a056512488500b00503095df2bdmr7913354lfb.34.1698122779492;
        Mon, 23 Oct 2023 21:46:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQn2DA9zvAnrJe7eELnYok8bVjQgPy4v/qK6lkjgzd/u7Yg+/t3Ds82izrQ97rNMlP63G0XH0IyakeA46at/s=
X-Received: by 2002:a05:6512:4885:b0:503:95d:f2bd with SMTP id
 eq5-20020a056512488500b00503095df2bdmr7913342lfb.34.1698122779134; Mon, 23
 Oct 2023 21:46:19 -0700 (PDT)
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
 <CACGkMEv2fNa_vqbqQmu3ys5tbB4-S-onXvr-pT9U9cd8iut7sA@mail.gmail.com>
 <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsfyOCf-qCxr7kGM7WPco3YgeBsbOXbDT9AtigZpXF6Tg@mail.gmail.com> <PH0PR12MB5481A39FADD3A19F0CBF1B66DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481A39FADD3A19F0CBF1B66DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 24 Oct 2023 12:46:08 +0800
Message-ID: <CACGkMEt_aVfMgYQo3uMy-_DXrYDpgkWHtSq_qfr-tXs289pQWg@mail.gmail.com>
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

On Mon, Oct 23, 2023 at 12:42=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Monday, October 23, 2023 9:15 AM
> >
> > On Thu, Oct 19, 2023 at 1:32=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > >
> > > > From: virtio-comment@lists.oasis-open.org
> > > > <virtio-comment@lists.oasis- open.org> On Behalf Of Jason Wang
> > > > Sent: Thursday, October 19, 2023 10:15 AM
> > > >
> > > > > > Again, if you don't want to talk about transport virtqueue,
> > > > > > that's fine. But let's leave the scalability issue aside as wel=
l.
> > > > > >
> > > > > Registers are related for functionality and scale.
> > > > >
> > > > > Lets first agree on use case before the design, that I asked abov=
e.
> > > > >
> > > > > I will wait to respond to any other emails until we agree on use
> > > > > case
> > > > requirements.
> > > >
> > > > There are more than just me who want you to define "passthrough"
> > > > first where you refuse to respond.
> > > >
> > > Totally disagree.
> > > In the previous email itself, I wrote what passthrough is.
> > > So let's try yet one more time.
> > > Either you can re-read last email or for better read below and see if=
 it is
> > understood or not.
> > >
> > > > How could we make any agreement without an accurate the definition
> > > > of "passthrough" who is a key to understand each other?
> > >
> > > I replied few times in past emails but since those email threads are =
so long, it is
> > easy to miss out.
> > >
> > > Passthrough definition:
> > > a. virtio member device mapped to the guest vm
> >
> > I really think we need to be accurate here. For example, what does "map=
" mean
> > here?
> >
> Not trapped by hypervisor is better wording than mapped.
>
> > > b. only pci config space and msix of a member device is intercepted b=
y
> > hypervisor.
> >
> > What's the criteria for choosing a cap/bar to be trapped or not? For ex=
ample,
> > there're a lot of other things that need to be virtualized besides MSI-=
X for sure.
> >
> For passthrough, which are those?

I haven't gone through all the caps but this is what in my mind

1) vIOMMU related stuffs: ATS/PRI, assign PASID to a virtqueue in the futur=
e
2) capability related to resources: like Resizable BAR etc

Thanks


>
> > > c. virtio config space, virtio cvqs, data vqs of a member device is d=
irectly
> > accessed by the guest vm without intercepted by the hypervisor.
> > >
> > > (Why b?, no grand reason, it is how the hypervisors are working where=
 to
> > integrate the virtio member device to).
> >
> > What you state here is more about the method to support a use case not =
the
> > use case itself. My understanding is "live migration" is a valid use ca=
se for sure.
> > And "passthough" is probably one way for achieving live migration but t=
his is
> > what you need to define and justify in this series.
> >
> I largely captured that in v2 in device context and in theory of operatio=
n.
> I will keep it short as written in v2. If something is unclear (without w=
riting the book), I am happy to extend it.


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

