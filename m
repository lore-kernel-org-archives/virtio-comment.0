Return-Path: <virtio-comment-return-5991-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF48C7EE23
	for <virtio-comment@archiver.kernel.org>; Mon, 22 May 2023 00:55:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B264068469
	for <virtio-comment@archiver.kernel.org>; Mon, 22 May 2023 00:54:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 997E8986300
	for <virtio-comment@archiver.kernel.org>; Mon, 22 May 2023 00:54:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8431B9862F7; Mon, 22 May 2023 00:54:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6F8BC9862FE
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 May 2023 00:54:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: EM67czG-MsKbdV20XxElIg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684716895; x=1687308895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXomS9NMxwbhRKSDOznyz4hf6MBSUYHaDqlPZPyUGts=;
        b=lMW+5fJYxjkI+KrGd9ye0XWSnxkComnaCcRElovT4gTrfH6TfAdRdFfTIxNugN21fB
         y4an4SCZkjRisqz3S4oKn9lNUNUk4FU7cJ7QpWo6or9iFBoO0DArOixm7br7amLELYHp
         qrWF2WSKEzMcs3aEMmgVghLiMu5JqhHQ+m1v8NjXTVmJ4OGzWkHvoOuhH5emf+WcmqXC
         gzWvH1cIKH+bexmMXlV7EI23iQ/yHPX4LZ+5nUSlQ1ViriU4bgp8SCpKIRmxtlH98/ZE
         CNRmRLFoKPrDrC8AW07ICo652mYSBTfFNEqToz4XxpxUG83Y/4QBEBxIyhEqLppYY+uq
         PyzA==
X-Gm-Message-State: AC+VfDwkl1NxBRIf3pq/LBJl9Qr6Fvtub1S343G5fR+O9rVlclckNl6v
	x7Ou28Tgasa/ALEJ3C5lA2Am1yXJxHD+UCGaMC4IwaFEWLBGF72SY6FPTffRGsWtI+WeS3QAs/u
	lCX2KApc3E4xc68FPKVz5h0ICpZEYojikJ/7l6q/vlOIr28l2qA==
X-Received: by 2002:ac2:5141:0:b0:4f3:a051:58d7 with SMTP id q1-20020ac25141000000b004f3a05158d7mr2562621lfd.49.1684716895692;
        Sun, 21 May 2023 17:54:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ56GA7uyNcza5acnCMy9QIz8n0zRfNIXB48OHYIjBKuwnfJFFOl5S9jJahuORqBuAuS7YuUMHeRkndjBCoCS6A=
X-Received: by 2002:ac2:5141:0:b0:4f3:a051:58d7 with SMTP id
 q1-20020ac25141000000b004f3a05158d7mr2562611lfd.49.1684716895274; Sun, 21 May
 2023 17:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230506000135.628899-1-parav@nvidia.com> <20230506000135.628899-2-parav@nvidia.com>
 <20230517013839-mutt-send-email-mst@kernel.org> <PH0PR12MB54817CBB98900B83C4F30164DC7E9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230518153640-mutt-send-email-mst@kernel.org> <20230519015520-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481AABA8A22DC088B5D7CFDDC7C9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230521050829-mutt-send-email-mst@kernel.org> <PH0PR12MB548161A2D28C387C9AF23B81DC429@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230521102050-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230521102050-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 22 May 2023 08:54:44 +0800
Message-ID: <CACGkMEtTa3angJZdrUW+Eeqi3vW1z7UDVAMaWowY1BRaJby0Kg@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] RE: [PATCH v2 1/2] transport-pci: Introduce
 legacy registers access commands

On Sun, May 21, 2023 at 10:33=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Sun, May 21, 2023 at 01:21:17PM +0000, Parav Pandit wrote:
> >
> > > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis=
-
> > > open.org> On Behalf Of Michael S. Tsirkin
> > > Sent: Sunday, May 21, 2023 5:17 AM
> >
> > > > The Notification of the VFs are on the VF BAR for modern or legacy.
> > > > One needs to build additional cross forwarding hardware from PF to =
VF for the
> > > doorbells.
> > >
> > > I think doorbells are driver notifications (linux driver calls them k=
icks)?
> > > I don't understand what you are saying above really.
> > > what can and what can't be done?
> > >
> > VF has the notification BAR region.
> > All 1.x and legacy such notification lands on the VF BAR.
> >
> > > Again all this idea (as opposed to Jason's transport vq) is to have a=
 simple
> > > software model. Attaching a driver to two devices at the same time is=
 hard to
> > > achive e.g. under windows.
> > >
> > Yet you initiate same discussion point that we already discussed again =
after summarizing.
> > A driver is not attached to two devices.
> > A driver is attached to a single device.
>
> And that device is the owner no? to send commands?
>
> > A device uses a parent/owner group device to access legacy.
> >
> > Software model may evolve over time.
> >
> > >
> > > > And it cannot utilize what already exists for 1.x VF.
> > > >
> > > >  > 2. It should be possible to send notifications through an admin
> > > > command too,
> > > > >    otherwise admin commands are an incomplete set of functionalit=
y.
> > > > >
> > > > Yes. it is only for the functionality. As we discussed in past alre=
ady, this will not
> > > get any performance.
> > >
> > > Performance might be ok if hardware disables kicks most of the time.
> > >
> > Even for the first kick it is order of magnitude higher.
> > Kicks is the natural tool for the low latency.
> >
> > >
> > > > > 3. I feel using a capability to describe legacy notification
> > > > >    area would be better just because we already have a
> > > > >    structure for this. make it an express capability if you like.
> > > > The AQ command interface is far more programable object than PCI ca=
pability
> > > to return this admin info.
> > > > Hence I prefer AQ cmd.
> > >
> > > I feel your preferences for 1 and 3 conflict. If you really insist on=
 kicks being on
> > > VFs then at least let us make VF driver in the host simple.
> > It is straight forward.
> >
> > If you prefer the "offset" example of past,
> >
> > If (legacy_offset =3D=3D queue_notify_offset)
> >    *db =3D guest_supplied_q_notify_content;
> > else
> >     virtio_net_send_aq_cmd();
> >
> > "simple" is really a subjective term in this context.
>
> yes this is qemu. sure.
>
> So we have legacy emulation send commands to VF or to PF.  Okay. But let
> us avoid the need for VF driver to send commands to PF to initialize.
> Just get all information it needs from VF itself.
>
>
> Maybe it's a good idea to reuse existing notification capability,
> or maybe a new one, but let's avoid making VF driver depend on PF
> commands.
>
>
>
> > > If it has to talk to PF
> > > driver things are really complex. At this point we are very very far =
from VFIO
> > > model, and then what exactly have we gained by implementing legacy co=
ntrol
> > > path in hardware?
> > It is in the VFIO model, legacy largely falls in the special path for b=
ackward compat for the hw devices.
> >
> > > Let's do software with maybe a couple of features such as
> > > VIRTIO_NET_F_LEGACY_HEADER.
> > >
> > We have already these design choices and tradeoff in v0 and v1, it does=
n't fit the requirements.
>
> BTW not for this project but generally this is why I thought it is not
> at all a bad idea to have a requirements text document e.g. under
> todo/
> discuss it as normally maybe even vote on including features in a
> plan for a release.
>
> > We cannot iterate exact 100% same points again in this summary discussi=
on.
> >
> > If you have any different comments from v0 and v1, please share, otherw=
ise these commands should proceed.
> >
> > What you hint is saying hey, "transport everything through the PF, then=
 why do you have a VF?"
> > We again past that discussion.
> >
> > This is different requirement, than
> > "There is a VF passthrough accessible directly from the guest without a=
 VI, some of them need to have legacy support also".
> > Hence how do one make that legacy guest utilize it the VF in passthroug=
h manner for 1.x and 0.9.5.
> > With this proposal 0.9.5 slow registers are accessed over the owner gro=
up admin PF keeping the whole model and functionality intact.
> >
> > This is it.
>
>
> So, I am saying one model is small driver for VF and a big one for PF.
> And to keep the VF driver simple, it should get information simply from
> config space capability.

Think in a different way, if we don't care about the speed of those
slow registers. For the method that accesses the configuration
structure, could we simply extend VIRTIO_PCI_CAP_PCI_CFG capability?

Thanks

>
>
>
> --
> MST
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

