Return-Path: <virtio-comment-return-7945-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8742C25B48
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 01:28:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 28ECD2B029
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 01:28:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 114FE9869DC
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 01:28:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id ED40E9869D3; Wed, 25 Oct 2023 01:28:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DA0559869D4
	for <virtio-comment@lists.oasis-open.org>; Wed, 25 Oct 2023 01:28:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: jPCllSgFOr-UuScLbVRScQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698197322; x=1698802122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObIskhWdl/n4sQAA98fS+IR9iWHIryxelb16UWwqJLc=;
        b=sf0Av6Wjmj/P5VUFy3J/JJkby60mUmK+oejuwwvERT35hVlJYAMClpie+WKFxM+QaT
         U9vlPxcw0d6QA1Dawwj74kx7mYCUMRkZx1mHdP2e0UVtkpzrcAoB27QEPH/t1rEFYw3q
         FyOKhy+nzUJ6EdpILQd26U/2y1i4p+JJ6FxtGFthLeuPvLUy5INYezMo863iKWRxuFYM
         ZvQGKdw+rR7CY3c0BEeRlWWysAtzFTMx+UUF9XEGtGVdghoAJUiDR6w066ZHx4/Esbwu
         HVN7DQLuWXILX3shnA0pFM8m7s3TKLPH4HYU5b7a4kKgtXtnPMV23qqplgOXDhSy+SWF
         5a8w==
X-Gm-Message-State: AOJu0Yx6VBbLU2vevaDXoP2C0ka7u8Ml3aWBpn0HZvq6tpG+E/CvZsW/
	kAlBrzWDcwbV3jI8yJW+Dak6u6xxRiaG55w4AQrRmyv8jI6mXSJ+yCB+Z0n3bsJZLdxZtccmMLU
	A1fDksLCFJloQPa2sItNNCplSJOq9l0ZBfpQjssWQuqgSILlb0g==
X-Received: by 2002:a19:740f:0:b0:503:afa:e79 with SMTP id v15-20020a19740f000000b005030afa0e79mr9900463lfe.5.1698197321899;
        Tue, 24 Oct 2023 18:28:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEn6AeIrf3Kd68WyLj7Av2D8ONsS0Ct7CApChvSbPcF3Tb1snB8FwBbyZB/C6AqXi6bbF3RwYYp3cuZt3rsTl8=
X-Received: by 2002:a19:740f:0:b0:503:afa:e79 with SMTP id v15-20020a19740f000000b005030afa0e79mr9900451lfe.5.1698197321564;
 Tue, 24 Oct 2023 18:28:41 -0700 (PDT)
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
 <CACGkMEsfyOCf-qCxr7kGM7WPco3YgeBsbOXbDT9AtigZpXF6Tg@mail.gmail.com>
 <PH0PR12MB5481A39FADD3A19F0CBF1B66DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt_aVfMgYQo3uMy-_DXrYDpgkWHtSq_qfr-tXs289pQWg@mail.gmail.com> <PH0PR12MB54817E76866D0E98863F6C5DDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54817E76866D0E98863F6C5DDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 25 Oct 2023 09:28:30 +0800
Message-ID: <CACGkMEs+M+z0HoBo9i_w5qjNt7=MxViSu2PYbTSyfe+Pm-dnqQ@mail.gmail.com>
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

On Tue, Oct 24, 2023 at 12:49=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, October 24, 2023 10:16 AM
> >
> > On Mon, Oct 23, 2023 at 12:42=E2=80=AFPM Parav Pandit <parav@nvidia.com=
> wrote:
> > >
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Monday, October 23, 2023 9:15 AM
> > > >
> > > > On Thu, Oct 19, 2023 at 1:32=E2=80=AFPM Parav Pandit <parav@nvidia.=
com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > > From: virtio-comment@lists.oasis-open.org
> > > > > > <virtio-comment@lists.oasis- open.org> On Behalf Of Jason Wang
> > > > > > Sent: Thursday, October 19, 2023 10:15 AM
> > > > > >
> > > > > > > > Again, if you don't want to talk about transport virtqueue,
> > > > > > > > that's fine. But let's leave the scalability issue aside as=
 well.
> > > > > > > >
> > > > > > > Registers are related for functionality and scale.
> > > > > > >
> > > > > > > Lets first agree on use case before the design, that I asked =
above.
> > > > > > >
> > > > > > > I will wait to respond to any other emails until we agree on
> > > > > > > use case
> > > > > > requirements.
> > > > > >
> > > > > > There are more than just me who want you to define "passthrough=
"
> > > > > > first where you refuse to respond.
> > > > > >
> > > > > Totally disagree.
> > > > > In the previous email itself, I wrote what passthrough is.
> > > > > So let's try yet one more time.
> > > > > Either you can re-read last email or for better read below and se=
e
> > > > > if it is
> > > > understood or not.
> > > > >
> > > > > > How could we make any agreement without an accurate the
> > > > > > definition of "passthrough" who is a key to understand each oth=
er?
> > > > >
> > > > > I replied few times in past emails but since those email threads
> > > > > are so long, it is
> > > > easy to miss out.
> > > > >
> > > > > Passthrough definition:
> > > > > a. virtio member device mapped to the guest vm
> > > >
> > > > I really think we need to be accurate here. For example, what does
> > > > "map" mean here?
> > > >
> > > Not trapped by hypervisor is better wording than mapped.
> > >
> > > > > b. only pci config space and msix of a member device is
> > > > > intercepted by
> > > > hypervisor.
> > > >
> > > > What's the criteria for choosing a cap/bar to be trapped or not? Fo=
r
> > > > example, there're a lot of other things that need to be virtualized=
 besides
> > MSI-X for sure.
> > > >
> > > For passthrough, which are those?
> >
> > I haven't gone through all the caps but this is what in my mind
> >
> > 1) vIOMMU related stuffs: ATS/PRI, assign PASID to a virtqueue in the f=
uture
> > 2) capability related to resources: like Resizable BAR etc
> For passthrough PASID assignment vq is not needed.

How do you know that? There are works ongoing to make vPASID work for
the guest like vSVA. Virtio doesn't differ from other devices.

> If at all it is done, it will be done from the guest by the driver using =
virtio interface.

Then you need to trap. Such things couldn't be passed through to
guests directly.

> Capabilities of #2 is generic across all pci devices, so it will be handl=
ed by the HV.
> ATS/PRI cap is also generic manner handled by the HV and PCI device.

No, ATS/PRI requires the cooperation from the vIOMMU. You can simply
do ATS/PRI passthrough but with an emulated vIOMMU.

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

