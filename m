Return-Path: <virtio-comment-return-5363-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85A9C7619A
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 09:02:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5D1993F55F
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 09:02:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B9BAC986630
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 09:02:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AFB92986366; Tue, 11 Apr 2023 09:02:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9BE8C98675A
	for <virtio-comment@lists.oasis-open.org>; Tue, 11 Apr 2023 09:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: SQWA8VMDMma-4EmxSyiJDQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681203731; x=1683795731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JoQJvePWC+E9HAfKlg3Zr9Px6+LoCYAwE5Lvin70mCs=;
        b=F5xElOVWS6+KFzhoWFvkayDxySQpsBRSWYj48VLSgQEJ54mooC6+xH8fYdF1iDumG5
         OokAQfyg/zRV5r6fbYQcyWUzG7KBNYopzD7+/spTKwYuFmpQywgZEjW8/KlbET8ZdxBy
         e58mSUXFf5/sz8isN3KNSwmYcmYjUHqnHr1YSHVmuD3NgJXp5yEJAFOXweKL1i1PJn2o
         5W7bhPO2dErkQsiXQBRGsDjX6x0QDcWq74FIRNvAx2uc2fpyk5bh5WsuBgyfYAIghbwz
         rDnw/axlQlqg6JDEL33Raopu9vshurAkhpzvr8priYhIxkw5odF4BinHErp1boSHb7NB
         wWaQ==
X-Gm-Message-State: AAQBX9ckA67SdQdV/lTVZKQRp58pqxne3RYEU2tTUxNwbcSmquZjjQYn
	dLl2zmse1Vd6o8jVF05jFviSlbNHQt8ibbqn276Y0DDsaIo8848JrZoxuaWopCG+5/2gi5+p2Lc
	76fCIjb1WJxFRzbIrf5dFkIZvytTci+KvF2RU9eFSS8moFDGgyg==
X-Received: by 2002:a05:6870:5627:b0:184:c14:a685 with SMTP id m39-20020a056870562700b001840c14a685mr895045oao.9.1681203730978;
        Tue, 11 Apr 2023 02:02:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y30/DZjjWO4jLZoew4X2H9mmkO4P4ZDV6QvDEis0UP5JUNE8PSSVhRXrklBZvD79OKiejDwUV5djUaD4HBrvg=
X-Received: by 2002:a05:6870:5627:b0:184:c14:a685 with SMTP id
 m39-20020a056870562700b001840c14a685mr895037oao.9.1681203730742; Tue, 11 Apr
 2023 02:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230330225834.506969-1-parav@nvidia.com> <20230330225834.506969-10-parav@nvidia.com>
 <20230407043841-mutt-send-email-mst@kernel.org> <CACGkMEtkOdwixxaRz2Pv9xP75vb13ncboX5XRs8NqFCUsS16aQ@mail.gmail.com>
 <20230410020906-mutt-send-email-mst@kernel.org> <CACGkMEtiROwuB+ECJqd13qdpMJSTMoDOzi1u_i85==42C0XSXw@mail.gmail.com>
 <20230410023715-mutt-send-email-mst@kernel.org> <CACGkMEs+E_OarQxP3NmLk3iSi7U0WgAn-m3b4eX7ULu1+v=sOw@mail.gmail.com>
 <20230410060417-mutt-send-email-mst@kernel.org> <CACGkMEuc47PdmQdC67Nz4AvX_+jy+XBgCkwZ1BHmM8VGb9gywA@mail.gmail.com>
 <20230411030056-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230411030056-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 11 Apr 2023 17:01:59 +0800
Message-ID: <CACGkMEt2QAfhCgpYjSRNzf3n4W_HJLrMfE9JHzocR_gPH_Zrtg@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-dev@lists.oasis-open.org, cohuck@redhat.com, 
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com, 
	Satananda Burla <sburla@marvell.com>, Maxime Coquelin <maxime.coquelin@redhat.com>, 
	Yan Vugenfirer <yan@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH 09/11] transport-pci: Describe PCI
 MMR dev config registers

On Tue, Apr 11, 2023 at 3:04=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Apr 11, 2023 at 10:13:40AM +0800, Jason Wang wrote:
> > On Mon, Apr 10, 2023 at 6:06=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Mon, Apr 10, 2023 at 03:20:52PM +0800, Jason Wang wrote:
> > > > On Mon, Apr 10, 2023 at 2:40=E2=80=AFPM Michael S. Tsirkin <mst@red=
hat.com> wrote:
> > > > >
> > > > > On Mon, Apr 10, 2023 at 02:20:16PM +0800, Jason Wang wrote:
> > > > > > On Mon, Apr 10, 2023 at 2:15=E2=80=AFPM Michael S. Tsirkin <mst=
@redhat.com> wrote:
> > > > > > >
> > > > > > > On Mon, Apr 10, 2023 at 09:33:32AM +0800, Jason Wang wrote:
> > > > > > > > This is fine for vDPA but not for virtio if the design can =
only work
> > > > > > > > for some specific setups (OSes/archs).
> > > > > > > >
> > > > > > > > Thanks
> > > > > > >
> > > > > > > Well virtio legacy has a long history of documenting existing=
 hacks :)
> > > > > >
> > > > > > Exactly, so the legacy behaviour is not (or can't be) defined b=
y the
> > > > > > spec but the codes.
> > > > >
> > > > > I mean driver behaviour derives from the code but we do document =
it in
> > > > > the spec to help people build devices.
> > > > >
> > > > >
> > > > > > > But yes, VIRTIO_F_ORDER_PLATFORM has to be documented.
> > > > > > > And we have to decide what to do about ACCESS_PLATFORM since
> > > > > > > there's a security problem if device allows not acking it.
> > > > > > > Two options:
> > > > > > > - relax the rules a bit and say device will assume ACCESS_PLA=
TFORM
> > > > > > >   is acked anyway
> > > > > >
> > > > > > This will break legacy drivers which assume physical addresses.
> > > > >
> > > > > not that they are not already broken.
> > > >
> > > > I may miss something, the whole point is to allow legacy drivers to
> > > > run otherwise a modern device is sufficient?
> > >
> > > yes and if legacy drivers don't work in a given setup then we
> > > should not worry.
> > >
> > > > >
> > > > > > > - a new flag that is insecure (so useful for sec but useless =
for dpdk) but optional
> > > > > >
> > > > > > This looks like a new "hack" for the legacy hacks.
> > > > >
> > > > > it's not just for legacy.
> > > >
> > > > We have the ACCESS_PLATFORM feature bit, what is the useage for thi=
s new flag?
> > >
> > >
> > > ACCESS_PLATFORM is also a security boundary. so devices must fail
> > > negotiation if it's not there. this new one won't be.
> > >
> > >
> > > > >
> > > > > > And what about ORDER_PLATFORM, I don't think we can modify lega=
cy drivers...
> > > > > >
> > > > > > Thanks
> > > > >
> > > > > You play some tricks with shadow VQ I guess.
> > > >
> > > > Do we really want to add a new feature in the virtio spec that can
> > > > only work with the datapath mediation?
> > > >
> > > > Thanks
> > >
> > > As long as a feature is useful and can't be supported otherwise
> > > we are out of options.
> >
> > Probably not? Is it as simple as relaxing this:
> >
> > "Transitional devices MUST expose the Legacy Interface in I/O space in =
BAR0."
> >
> > To allow memory space.
> >
> > This works for both software and hardware devices (I had a handy
> > hardware that supports legacy virtio drivers in this way).
> >
> > Thanks
>
> Yes it is certainly simpler.
>
> Question: what happens if you try to run existing windows guests or dpdk
> on these? Do they crash horribly or exit gracefully?

Haven't tried DPDK and windows. But I remember DPDK supported legacy
MMIO bars for a while.

Adding Maxime and Yan for comments here.

>
> The point of the capability is to allow using modern device ID so such
> guests will not even try to bind.

It means a mediation layer is required to use. Then it's not an issue
for this simple relaxing any more?

An advantage of such relaxing is that, for the legacy drivers like an
ancient Linux version that can already do MMIO access to legacy BAR it
can work without any mediation.

At least, if ID can help, it can be used with this as well.

Thanks



>
>
> > > Keeping field practice things out of the
> > > spec helps no one.
> > >
> > > > >
> > > > > --
> > > > > MST
> > > > >
> > >
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

