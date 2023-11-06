Return-Path: <virtio-comment-return-8186-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C85C4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 06:35:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 806F33E582
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 06:35:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A714498670A
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 06:35:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 030A79867AB; Mon,  6 Nov 2023 06:35:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6E9B6986706
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 06:35:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ccLN8o71MkKFiLiJkI2qPA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699252526; x=1699857326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ioCreNcFFq2EQ1NHDJSMqDqIOYwYVk4WqZ2eA59bN4=;
        b=U5nH5AW7Moxt5b7lKenRNOM1b//fhGqiEuxtlVJdF0AlW49UuEQLcMNxzOcoDOmN7j
         5mP6s7iFSv8keqgYRooWveCmCoMh23unBMO71+fXtLkTvoLkVafZ/6S+E/PavO7cmyeP
         GvmwhH0yOhrE4diLLjMmPkuZYbhAtsLt7ipA/eGouCBzomPNL9RKmTQtKNYoWR9s5c4W
         9zfb9OiYZqy8n0rmt9XO13ls+ReiKksixO1aRM+0mskZuRzznN2T4xd0vvaoi7BFkT/r
         17CKPVnCjFoUM9iyaB1kWYZiQtg2qGFyRAqMlGAn9uyaFSVoNs3QLcQrXS2RLJ5Fgik7
         YROg==
X-Gm-Message-State: AOJu0YyroBiaMGVcTbo+SkfPrbKF2Dd64DfJoeGrDj1TczQkPmmAtim9
	VIqXMvF0MHXtg0W6lIp3Tavv1kzDLOO0OLQEd8tUGzaIHlee0KFtBplb7pXFegs2PE6UTHpTRnG
	hXsVJX9wICturmy7o7ET3EpD6kf0ZqiNK54Q0pL5GlvhPgHaKkw==
X-Received: by 2002:a05:6512:1046:b0:503:9c2:e44e with SMTP id c6-20020a056512104600b0050309c2e44emr26098679lfb.55.1699252525952;
        Sun, 05 Nov 2023 22:35:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPCmOkLkmo+xWa4ea3NAd7ElrCThB+q5o8D6S8G43GoAfBp7vykTDxl60rA0G9QOv/fTKF4f3jmcKzuby21Dk=
X-Received: by 2002:a05:6512:1046:b0:503:9c2:e44e with SMTP id
 c6-20020a056512104600b0050309c2e44emr26098667lfb.55.1699252525730; Sun, 05
 Nov 2023 22:35:25 -0800 (PST)
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
 <CACGkMEt_HnZ26ZySCt8w58-OdH+UDzqveqZ2=LN3mK3Z3oy4EA@mail.gmail.com>
 <DM8PR12MB548082010AC006539B04CB16DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEuh+9h9nwGbv63onEh2MgGoCEkKmCwsLEvJ9O5NqtFs-Q@mail.gmail.com> <PH0PR12MB548181EA329E774DC359FD10DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB548181EA329E774DC359FD10DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 6 Nov 2023 14:35:14 +0800
Message-ID: <CACGkMEsUBtEQO7_B0qoWHDZfxFA4zjM97=ox+gjHrOksPSFM3A@mail.gmail.com>
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

On Thu, Nov 2, 2023 at 2:10=E2=80=AFPM Parav Pandit <parav@nvidia.com> wrot=
e:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Thursday, November 2, 2023 9:54 AM
> >
> > On Wed, Nov 1, 2023 at 11:07=E2=80=AFAM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Wednesday, November 1, 2023 6:03 AM
> > > >
> > > > On Tue, Oct 31, 2023 at 1:17=E2=80=AFPM Parav Pandit <parav@nvidia.=
com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > > From: virtio-comment@lists.oasis-open.org
> > > > > > <virtio-comment@lists.oasis- open.org> On Behalf Of Jason Wang
> > > > > > Sent: Tuesday, October 31, 2023 7:07 AM
> > > > > >
> > > > > > On Mon, Oct 30, 2023 at 12:28=E2=80=AFPM Parav Pandit <parav@nv=
idia.com>
> > wrote:
> > > > > > >
> > > > > > >
> > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > Sent: Monday, October 30, 2023 9:35 AM
> > > > > > > >
> > > > > > > > =E5=9C=A8 2023/10/26 11:50, Parav Pandit =E5=86=99=E9=81=93=
:
> > > > > > > > >> From: virtio-comment@lists.oasis-open.org
> > > > > > > > >> <virtio-comment@lists.oasis- open.org> On Behalf Of Jaso=
n
> > > > > > > > >> Wang For example, you still haven't succeeded in definin=
g
> > > > passthrough.
> > > > > > > > > It was defined on 19th Oct in [1].
> > > > > > > > > What part is not clear to you in definition of passthroug=
h device?
> > > > > > > > >
> > > > > > > > > [1]
> > > > > > > > > https://lore.kernel.org/virtio-
> > > > > > > > comment/PH0PR12MB5481EA6A4D0C64C5AF6D3A
> > > > > > > > > 57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com/
> > > > > > > >
> > > > > > > >
> > > > > > > > Let me copy-paste it again:
> > > > > > > >
> > > > > > > > For example, assuming you are correct, you still fail to
> > > > > > > > explain
> > > > > > > >
> > > > > > > > 1) what is trapped and what's not, or what's the boundary
> > > > > > > Passthrough definition was replied few times.
> > > > > > > One of them is here,
> > > > > > > https://lore.kernel.org/virtio-
> > > > > > comment/PH0PR12MB5481EA6A4D0C64C5AF6D3A
> > > > > > > 57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com/
> > > > > > > I don=E2=80=99t know what you mean by 'explain'. What do you =
want to
> > > > > > > be
> > > > explained?
> > > > > > > What is trapped is listed in
> > > > > > > https://lore.kernel.org/virtio-
> > > > > > comment/PH0PR12MB5481EA6A4D0C64C5AF6D3A
> > > > > > > 57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com/
> > > > > > > What is not trapped is also listed in
> > > > > > > https://lore.kernel.org/virtio-
> > > > > > comment/PH0PR12MB5481EA6A4D0C64C5AF6D3A
> > > > > > > 57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com/
> > > > > > > So what more do you want to explain in there?
> > > > > >
> > > > > > You explained that MSI-X is trapped but not the others. People
> > > > > > may know
> > > > why.
> > > > > > or what's the boundary to choose to trap or not.
> > > > > >
> > > > > If a platform can support without trapping, it can be avoided as
> > > > > well and can
> > > > be added in the future.
> > > >
> > > > Who is going to do that synchronization?
> > > Lets first bring that hypervisor sw design before discussing phantom =
problem
> > solving.
> > > All necessary modules will be involved in synchronization depending o=
n how
> > its done in future.
> >
> > It's not the charge of the virtio spec to mandate any type of hyperviso=
r design.
> > But it looks to me you want to do that.
> You always attribute is wrong to disregard the proposal which is incorrec=
t.

This is not my point. I'm just saying, I never say any virtio existing
facilities need to be synchronized with the development of the
hypervisor. That's great proof that it is well designed.

If the proposal is designed in a general method without limitations,
the spec can keep working like a charm in the past.

> Virtio spec does not mandate it.
> Why?
> Because virtio is so late in the cycle of developing features, that it ha=
s to fit into the existing hypervisors design to support the feature and pr=
oven UAPIs.
>
> So like RSS, flow filters, statistics, provisioning, and more, it is addi=
ng the support for UAPIs which are already present for a while across multi=
ple devices.
>
> So attributing it as mandating is simply wrong.
> It is addressing the existing use case.
>
> One can always build new hypervisor and demand new features from virtio.
> That is perfectly fine.
>
> Your expectation is that device migration framework to work for an undefi=
ned hypervisor, which is just silly.

It's not silly, for example virtio was designed before VFIO was
invented. If there's no layer violation and the spec aligns with PCI
spec, we don't need to do any synchronization to say "we can support
VFIO now".  And we never have a feature that claims to work under
condition X,Y,Z in the past.

>
> > > > > > >
> > > > > > > > 2) if the hypervisor is not developed with those
> > > > > > > > assumptions, things can work
> > > > > > > What to explain in #2. :)
> > > > > > > Things can expand when such hypervisor is born.
> > > > > >
> > > > > > So the point is still, to make your proposal to be useful in mo=
re use
> > cases.
> > > > > >
> > > > > When a use case arise, device context can be expanded.
> > > >
> > > > It's not device context.
> > > >
> > > I don=E2=80=99t see why not. It is stored in the device.
> > > Remapping part will be hypervisor specific, so it may be stored in pl=
atform
> > specific migration data.
> >
> > The point is, device context should work for all type of hypervisors.
> > You can't claim it can only work with your "passthrough" model.
> >
> Which other type you specifically have in mind?
> The current proposal should work for:
> 1. passthrough model
> 2. may be for vdpa model.

Note that, it's not the vdpa model, it's the model that can do
conditional traps for virtio config.

I think we are somehow making an agreement here, we need to make sure
the proposal works in both modes.

Then I'm fine.

> The model seems to work for passthrough and vdpa both cases to me.
>
> If something is missing for #2, either device context can be updated, or =
new commands can be added.
>
> > >
> > > > > No point in making things no one implements or not present in hyp=
ervisor.
> > > > > The infrastructure is extendible so spec is covered for it.
> > > >
> > > > It would be problematic if you stick to claim "passthrough" but not=
.
> > >
> > > I don=E2=80=99t know what this means. I am not debating passthrough/n=
on-
> > passthrough.
> > > What is inside the device, will be part of device-context.
> > > What is part of the platform content, will be part of platform contex=
t.
> > > Since this is generic to all types of PCI devices, I don=E2=80=99t se=
e a need to over-solve
> > it now in virtio.
> >
> > Ok, so you agree it can work even if hypervisor want to trap?
>
> Yes. I believe so, it can work.
> If something is missing, we should discuss to enhance it.

That's great.

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

