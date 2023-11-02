Return-Path: <virtio-comment-return-8105-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB14C4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 04:28:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 883182CADB
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 04:28:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 74985986BEC
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 04:28:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 59F41986BE3; Thu,  2 Nov 2023 04:28:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EF710986BE8
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 04:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: yem2cps7Ml-Rty28H2qdmQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698899086; x=1699503886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+3Ji5LhRAhVCg5OD5Ufkf4bHgG9J0lrBCjPgCHBXYA=;
        b=TjquqJxMO/BOqM61NvHFLZoxmBSPjbOk5+9EXzMDeWX8q8slkRmXIt1eWRiFZWyIJ7
         enc/jrdRiC2QvUqEuItjY5tsdMIhhDCcNc7uR0tFY2oz6YCzH+XhRj41+gWgfiYmAwwP
         0i7ZxisNcNR4yHbcs8vSfolhgvlOmT+aq7+jF49vwwcveSPop3qvBltRqB0b1bXDGINY
         er2aWqjkpb69Aw9d/jndhl5Hv8Ffl+CAVVq0HfB3eBx3nKp6Vn8h6NJK+wiWxwFTb+mD
         NryGCK3yc4+VB/5/2ComQxTAjLKQPgVsiACnl9Q8wJb1yBPaK8AetWpGNa/bXlQapMAs
         m38w==
X-Gm-Message-State: AOJu0YyZhDoRp/PHhkaod0R9tg0c91UoUk+cb6gL31Uq50vVoa3aZ/WR
	hf69clQjrhKgAtOB736raHxLv3zRMcB5Mx8Y/LDPEElVHypaPvQaM6OK1Xwr+sXDPVdDBEtu/63
	iKjyEESFVK4XOK0oycnZ5O/Mq/6hHqhKdLaMOvBJ+Pe6678vMLA==
X-Received: by 2002:a05:6214:d6f:b0:65a:fc2a:c2ab with SMTP id 15-20020a0562140d6f00b0065afc2ac2abmr18597333qvs.49.1698899086717;
        Wed, 01 Nov 2023 21:24:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdIwr0BPx4I7E8qAwypf0e8Ksuq5y3hUdn+zDNMEUJtC/+ennxtrkd+kJidtS5ONNfD7DfUoHDB1pc6mhAsMs=
X-Received: by 2002:a05:6214:d6f:b0:65a:fc2a:c2ab with SMTP id
 15-20020a0562140d6f00b0065afc2ac2abmr18597324qvs.49.1698899086481; Wed, 01
 Nov 2023 21:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com> <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018055422-mutt-send-email-mst@kernel.org> <PH0PR12MB548106B7225BAF351241EA8ADCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsJVxPuxCGjKs3R-kaVGfDMNjtAovM7PpBt3TVd8HON0g@mail.gmail.com>
 <PH0PR12MB5481DD16B25251BAC25AA908DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEthURdu4UNYXPseA-5g6mci2CFDP_UKKC1qFy+n7NHAKg@mail.gmail.com>
 <PH0PR12MB5481BBC4E48145A02C8963ABDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu3nC8G3Xo2EaunQ4k4rnB27UQMUvruXaf81_sZF7w-cQ@mail.gmail.com>
 <PH0PR12MB548120210DC4AC23382D8A99DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvwFno6ynKzi1WPAj=fF2xmzRS_kUKfL8UJU8sTcjDHbA@mail.gmail.com>
 <PH0PR12MB548140823FA205FA06597692DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <d3b029a0-5a50-c697-066a-e4f8e85b807c@redhat.com> <PH0PR12MB5481CE2BD779F1D96914FB6EDCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsC9F0SY=ydOSe+nV11L7d2t1Ypzr6nz_UoUc3w632VUQ@mail.gmail.com>
 <PH0PR12MB5481F7BE5C7F4430D1F26B06DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt_HnZ26ZySCt8w58-OdH+UDzqveqZ2=LN3mK3Z3oy4EA@mail.gmail.com> <DM8PR12MB548082010AC006539B04CB16DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
In-Reply-To: <DM8PR12MB548082010AC006539B04CB16DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 2 Nov 2023 12:24:14 +0800
Message-ID: <CACGkMEuh+9h9nwGbv63onEh2MgGoCEkKmCwsLEvJ9O5NqtFs-Q@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Wed, Nov 1, 2023 at 11:07=E2=80=AFAM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, November 1, 2023 6:03 AM
> >
> > On Tue, Oct 31, 2023 at 1:17=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > >
> > > > From: virtio-comment@lists.oasis-open.org
> > > > <virtio-comment@lists.oasis- open.org> On Behalf Of Jason Wang
> > > > Sent: Tuesday, October 31, 2023 7:07 AM
> > > >
> > > > On Mon, Oct 30, 2023 at 12:28=E2=80=AFPM Parav Pandit <parav@nvidia=
.com> wrote:
> > > > >
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Monday, October 30, 2023 9:35 AM
> > > > > >
> > > > > > =E5=9C=A8 2023/10/26 11:50, Parav Pandit =E5=86=99=E9=81=93:
> > > > > > >> From: virtio-comment@lists.oasis-open.org
> > > > > > >> <virtio-comment@lists.oasis- open.org> On Behalf Of Jason
> > > > > > >> Wang For example, you still haven't succeeded in defining
> > passthrough.
> > > > > > > It was defined on 19th Oct in [1].
> > > > > > > What part is not clear to you in definition of passthrough de=
vice?
> > > > > > >
> > > > > > > [1]
> > > > > > > https://lore.kernel.org/virtio-
> > > > > > comment/PH0PR12MB5481EA6A4D0C64C5AF6D3A
> > > > > > > 57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com/
> > > > > >
> > > > > >
> > > > > > Let me copy-paste it again:
> > > > > >
> > > > > > For example, assuming you are correct, you still fail to explai=
n
> > > > > >
> > > > > > 1) what is trapped and what's not, or what's the boundary
> > > > > Passthrough definition was replied few times.
> > > > > One of them is here,
> > > > > https://lore.kernel.org/virtio-
> > > > comment/PH0PR12MB5481EA6A4D0C64C5AF6D3A
> > > > > 57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com/
> > > > > I don=E2=80=99t know what you mean by 'explain'. What do you want=
 to be
> > explained?
> > > > > What is trapped is listed in
> > > > > https://lore.kernel.org/virtio-
> > > > comment/PH0PR12MB5481EA6A4D0C64C5AF6D3A
> > > > > 57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com/
> > > > > What is not trapped is also listed in
> > > > > https://lore.kernel.org/virtio-
> > > > comment/PH0PR12MB5481EA6A4D0C64C5AF6D3A
> > > > > 57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com/
> > > > > So what more do you want to explain in there?
> > > >
> > > > You explained that MSI-X is trapped but not the others. People may =
know
> > why.
> > > > or what's the boundary to choose to trap or not.
> > > >
> > > If a platform can support without trapping, it can be avoided as well=
 and can
> > be added in the future.
> >
> > Who is going to do that synchronization?
> Lets first bring that hypervisor sw design before discussing phantom prob=
lem solving.
> All necessary modules will be involved in synchronization depending on ho=
w its done in future.

It's not the charge of the virtio spec to mandate any type of
hypervisor design. But it looks to me you want to do that.

>
> >
> > >
> > > > >
> > > > > > 2) if the hypervisor is not developed with those assumptions,
> > > > > > things can work
> > > > > What to explain in #2. :)
> > > > > Things can expand when such hypervisor is born.
> > > >
> > > > So the point is still, to make your proposal to be useful in more u=
se cases.
> > > >
> > > When a use case arise, device context can be expanded.
> >
> > It's not device context.
> >
> I don=E2=80=99t see why not. It is stored in the device.
> Remapping part will be hypervisor specific, so it may be stored in platfo=
rm specific migration data.

The point is, device context should work for all type of hypervisors.
You can't claim it can only work with your "passthrough" model.

>
> > > No point in making things no one implements or not present in hypervi=
sor.
> > > The infrastructure is extendible so spec is covered for it.
> >
> > It would be problematic if you stick to claim "passthrough" but not.
>
> I don=E2=80=99t know what this means. I am not debating passthrough/non-p=
assthrough.
> What is inside the device, will be part of device-context.
> What is part of the platform content, will be part of platform context.
> Since this is generic to all types of PCI devices, I don=E2=80=99t see a =
need to over-solve it now in virtio.

Ok, so you agree it can work even if hypervisor want to trap?

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

