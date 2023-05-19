Return-Path: <virtio-comment-return-5976-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCF5C77B73
	for <virtio-comment@archiver.kernel.org>; Fri, 19 May 2023 01:54:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3A793142D48
	for <virtio-comment@archiver.kernel.org>; Fri, 19 May 2023 01:54:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 29069986725
	for <virtio-comment@archiver.kernel.org>; Fri, 19 May 2023 01:54:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 193FE98671F; Fri, 19 May 2023 01:54:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 00A6E986720
	for <virtio-comment@lists.oasis-open.org>; Fri, 19 May 2023 01:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: OAcWwIJ_O1yKr-8Pn4XxuQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684461274; x=1687053274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G163ekcql6LEkuWspBQdW/nv0RMls45iJmC6Q1dMi54=;
        b=H1kJV9qFuqbKj1nr8wGGokBT8T6ZsMzFMIHu7DvUiDb9XJdQ7p9lV3MY6jSc18IXdW
         n528Wmp/5qTlhPHGtDof4itbupKPecL16lhrMAUlYlAvAtb+MSU2Bp/B48SkIa2OSx2L
         Xaj8T01Wo+CoU1NWY8iw1/UUh/TwpPdNXSOKNMpYDCy/OJI2pgq+9nAcIs//d27oCjkj
         Z/h9CCYDEOzhjQzqcscHfvtMIkGAh9uadvLgHMIe1OitY021yPumXYDrZkZVZXLGQ47R
         cSKz2DR6PTm8Q9F85HdAidLlK5AGy4OeaHl3lwm4JC177UhSfUYUlL0sIlkhQpEeMmGG
         94DA==
X-Gm-Message-State: AC+VfDwFaLaxkO/z4ka8XjOvZ+IO1VHfbZ/E5d67L+6j0NRTQOqg7w2P
	ObiXz78vJGmazcyvQrW/uHpqDoN4P9HvrIv9Z5+LSuIQPQliiC62izXL9GYs0UMhp1GTLKDvjS/
	xR/Ya835MSUQYfiD6quKzi7mpqYgbgAWM8y65kXTHxfXBO8Z+LQ==
X-Received: by 2002:a19:f502:0:b0:4f3:8244:adc4 with SMTP id j2-20020a19f502000000b004f38244adc4mr251830lfb.44.1684461274011;
        Thu, 18 May 2023 18:54:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ63aEHcJ4aH+ywPH0cJF9ZSIPDZwkRJ/hwDJAOX4oD2DuLQaj4fIzkmF8jpAlTHtjmonuTD/AV67bStoKNDjOY=
X-Received: by 2002:a19:f502:0:b0:4f3:8244:adc4 with SMTP id
 j2-20020a19f502000000b004f38244adc4mr251817lfb.44.1684461273681; Thu, 18 May
 2023 18:54:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230506000135.628899-1-parav@nvidia.com> <20230506000135.628899-2-parav@nvidia.com>
 <20230517013839-mutt-send-email-mst@kernel.org> <PH0PR12MB54817CBB98900B83C4F30164DC7E9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230518153640-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230518153640-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 19 May 2023 09:54:22 +0800
Message-ID: <CACGkMEt+XLvGmj5Cez8Sb_T0UfujCi16u5zpMAe+jJG+JJXr6A@mail.gmail.com>
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

On Fri, May 19, 2023 at 3:42=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Wed, May 17, 2023 at 07:32:33PM +0000, Parav Pandit wrote:
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Wednesday, May 17, 2023 1:45 AM
> > >
> > > On Sat, May 06, 2023 at 03:01:34AM +0300, Parav Pandit wrote:
> > > > +\begin{lstlisting}
> > > > +struct virtio_admin_cmd_lreg_wr_data {
> > > > + u8 offset; /* Starting byte offset of the register(s) to write */
> > > > + u8 register[];
> > > > +};
> > > > +\end{lstlisting}
> > >
> > > So to summarize, I think the main comment here was to have separate
> > > commands for access to common versus device config. Just today I thou=
ght
> > > some more and came up with another reason why this is a good idea: if=
 we ever
> > > want legacy MMIO emulation, we can reuse the device config command.
> > >
> > MMIO is actually simpler than PCI because all the registers are contigu=
ous regardless of msix.
> > So single command with offset can service just fine.
>
> yes but then you need to implement both MMIO and PCI in hardware.
> with a flag you can implement legacy MMIO in software on top of
> legacy PCI in hardware.
>
> > More below.
> >
> > > Jason also feels the common config command can be shared with vq tran=
sport
> > > effort. We can discuss this, for sure, I guess its putting code in ha=
rdware versus
> > > in hypervisor, but if there are hardware vendors who strictly want th=
is code in
> > > hardware I don't have a big problem with this even if I don't exactly=
 get why.
> > >
> > > With this idea all hypervisor has to do is subtract the offset from d=
evice config
> > > access, sounds like a small price to pay.
> > It is more than the subtraction cost.
> >
> > Hypervisor needs to inspect MSI-X enable/disable settings to decide whe=
n to issue command #1 vs #3 for the requested offset.
>

I don't know why it is a problem, for any hypervisor that supports
legacy, the code (MSI-X enablement detection) should already be there.

And it is just something like what Qemu had:

/* The remaining space is defined by each driver as the per-driver
 * configuration space */
#define VIRTIO_PCI_CONFIG_SIZE(dev)     VIRTIO_PCI_CONFIG_OFF(msix_enabled(=
dev))

Is this really expensive?

> I thought that for now you wanted to ignore MSI-X disable case?
> Because if you do care then we need INTx emulation.
>
>
> > > Does this sound like a reasonable
> > > compromize to you?
> >
> > Splitting proposed one command to two commands,
> > 1. one for accessing legacy common config
> > 2. second for accessing legacy device specific config
> >
> > seems fine to me as below.
> >
> > So we will have total 5 commands (instead of 3).
> >
> > 1. legacy common config read
> > 2. legacy common config write
> >
> > 3. legacy device config read
> > 4. legacy device config write
> > 5. query device notification area
> >
> > #1 and #3 same cmd signature but different opcode.
> > #2 and #4 same cmd signature but different opcode.
> >
>
> Sounds reasonable. Jason?

Better, but for transport virtqueue/adminq we won't go this way but
using individual commands for common and other configurations for a
more deterministic behaviour with a simpler device.

>
> notification thing needs more thought I feel though.
> It feels weirdly bolted on, but I can't put my finger
> on what's wrong exactly yet. Will think it over.

Two things in my mind:

1) There's probably no need for a BAR and it should be sufficient for
an address, the device just needs to make sure to report a correct
address if BAR is remapped. It helps to save BAR for VF as well.
2) We need a size, otherwise we don't know if the notification area
could be mapped safely to the guest. And in the case of
virtio_pci_notify_cap, though it could be implied by the offset but it
deserves a formal clarification as well there.

Thanks

>
>
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

