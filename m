Return-Path: <virtio-comment-return-5364-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E423BC7619A
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 09:07:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 44C3941EE2
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 09:07:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 29E0F98636E
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 09:07:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1B379986366; Tue, 11 Apr 2023 09:07:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0912398636D
	for <virtio-comment@lists.oasis-open.org>; Tue, 11 Apr 2023 09:07:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: UqZsWKfCOgi18281MWP6Xg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681204043; x=1683796043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utv+EbZiEw6I4bYszxCPPa3+xeccaWHsG7CSFMSB8hU=;
        b=yz5FEXiZyb+cwWNA5R23zYOmGLSmol/IN9+LELP5KT06edHp91R3VhsbdvzpWQQhjP
         k0yZbdyEuY07/epdHX9rNeP9eZ2z3wb1Wlz/FsDKc6LoAj81YHOPrM1VoHpoTcmDSN1D
         utvynK94J7fZlhwHSkfwqdIoLGXUMCDBLY6DZ3WKph6eI8G8P3gpWlqRUq8G81cfl405
         qb8heXLd6rZTuigsr1gdIANgPCLjSJIYYuzhCb5nzzmxEvuTUt1gYkSeJa1gWyyYYITA
         1z2WjyAjBwN7T5pA1Slhbjkt1Cr/E4GZqtv+AzPLugZpypkzS+QddQDSFQQx8nm/85kP
         DAIg==
X-Gm-Message-State: AAQBX9f8AaJF4hhDLQtLC5JSEyRfPX3lbeFXReA+zGBDgbA//qWQPF2k
	GndHYC04XfB/OQFjydItYbUfFpODAZnpsLoLkoppMr8qvw3OEuMfKvLZ0KJJbpTdl4vW/OXoOM/
	8K5DaIutItZQ0lYMZtDzGCcvn9Lc/OnmYVfFVCpRlOsH6Nv5iDg==
X-Received: by 2002:a05:6870:468d:b0:184:502f:e79d with SMTP id a13-20020a056870468d00b00184502fe79dmr2087266oap.9.1681204043045;
        Tue, 11 Apr 2023 02:07:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350adFjTU3Ay3mVQaQflGwI76LrE6U5VmXL7JYjPK/7Kczse7D0iQ8JI8aIWzen1X7ILVJ6gGRKUnYIImi7y+Eiw=
X-Received: by 2002:a05:6870:468d:b0:184:502f:e79d with SMTP id
 a13-20020a056870468d00b00184502fe79dmr2087264oap.9.1681204042810; Tue, 11 Apr
 2023 02:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230330225834.506969-1-parav@nvidia.com> <20230330225834.506969-9-parav@nvidia.com>
 <CACGkMEtMOy4B-O-52ka+9P3OBQ_hs1KvdjWodNYg-XKLff+giw@mail.gmail.com>
 <20230410021619-mutt-send-email-mst@kernel.org> <CACGkMEsZXozY7iC7L3L9FC+o8dQGY9+Hhbag2Z-G-nxr9BvDdw@mail.gmail.com>
 <20230410055947-mutt-send-email-mst@kernel.org> <CACGkMEsKLeJ1q3Vh8h2JYM=-RcrGd+31yR1Zsw0U=SRd1JZugg@mail.gmail.com>
 <20230411025646-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230411025646-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 11 Apr 2023 17:07:11 +0800
Message-ID: <CACGkMEui1ouE8DcXKkWUavToUT+vEP-c640vtw3BJBOSz5YTkw@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-dev@lists.oasis-open.org, cohuck@redhat.com, 
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com, 
	Satananda Burla <sburla@marvell.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [virtio-dev] [PATCH 08/11] transport-pci: Introduce virtio
 extended capability

On Tue, Apr 11, 2023 at 3:00=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Apr 11, 2023 at 10:19:39AM +0800, Jason Wang wrote:
> > On Mon, Apr 10, 2023 at 6:04=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Mon, Apr 10, 2023 at 03:16:46PM +0800, Jason Wang wrote:
> > > > On Mon, Apr 10, 2023 at 2:24=E2=80=AFPM Michael S. Tsirkin <mst@red=
hat.com> wrote:
> > > > >
> > > > > On Mon, Apr 10, 2023 at 09:36:17AM +0800, Jason Wang wrote:
> > > > > > On Fri, Mar 31, 2023 at 7:00=E2=80=AFAM Parav Pandit <parav@nvi=
dia.com> wrote:
> > > > > > >
> > > > > > > PCI device configuration space for capabilities is limited to=
 only 192
> > > > > > > bytes shared by many PCI capabilities of generic PCI device a=
nd virtio
> > > > > > > specific.
> > > > > > >
> > > > > > > Hence, introduce virtio extended capability that uses PCI Exp=
ress
> > > > > > > extended capability.
> > > > > > > Subsequent patch uses this virtio extended capability.
> > > > > > >
> > > > > > > Co-developed-by: Satananda Burla <sburla@marvell.com>
> > > > > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > > >
> > > > > > Can you explain the differences compared to what I've used to p=
ropose?
> > > > > >
> > > > > > https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/ms=
g08078.html
> > > > > >
> > > > > > This can save time for everybody.
> > > > > >
> > > > > > Thanks
> > > > >
> > > > > BTW another advantage of extended capabilities is - these are act=
ually
> > > > > cheaper to access from a VM than classic config space.
> > > >
> > > > Config space/BAR is allowed by both of the proposals or anything I =
missed?
> > > >
> > > > >
> > > > >
> > > > > Several points
> > > > > - I don't like it that yours is 32 bit. We do not need 2 variants=
 just
> > > > >   make it all 64 bit
> > > >
> > > > That's fine.
> > > >
> > > > > - We need to document that if driver does not scan extended capbi=
lities it will not find them.
> > > >
> > > > This is implicit since I remember we don't have such documentation =
for
> > > > pci capability, anything makes pcie special?
> > >
> > > yes - the fact that there are tons of existing drivers expecting
> > > everything in standard space.
> > >
> > >
> > > > >   And existing drivers do not scan them. So what is safe
> > > > >   to put there? vendor specific? extra access types?
> > > >
> > > > For PASID at least, since it's a PCI-E feature, vendor specific sho=
uld
> > > > be fine. Not sure about legacy MMIO then.
> > > >
> > > > >   Can we make scanning these mandatory in future drivers? future =
devices?
> > > > >   I guess we can add a feature bit to flag that.
> > > >
> > > > For PASID, it doesn't need this, otherwise we may duplicate transpo=
rt
> > > > specific features.
> > >
> > > i don't get it. what does PASID have to do with it?
> >
> > My proposal is to allow PASID capability to be placed on top.
>
> Assuming you mean a patch applied on top of this one.
>
> > So what
> > I meant is:
> >
> > if the driver needs to use PASID, it needs to scan extend capability
> >
> > So it is only used for future drivers. I think this applies to legacy
> > MMIO as well.
>
> sure
>
> > > A new feature will allow clean split at least:
> > > we make any new features and new devices that expect
> > > express capability depend on this new feature bit.
> > >
> > > > >   Is accessing these possible from bios?
> > > >
> > > > Not at least for the two use cases now PASID or legacy MMIO.
> > >
> > > can't parse english here. what does this mean?
> >
> > I meant, it depends on the capability semantics. Both PASID and legacy
> > MMIO don't need to be accessed by BIOS. We can't change legacy BIOS to
> > use legacy MMIO bars.
> >
> > Thanks
>
> makes sense.
>
>
> now, imagine someone building a new device. if existing drivers are not
> a concern, it is possible to move capabilities all to extended space. is
> that possible while keeping the bios working?

This is possible but I'm not sure it's worthwhile. What happens if the
device puts all capabilities in the extended space but the bios can't
scan there? We can place them at both but it then doesn't address the
out of space issue. Things will be easier if we allow new
features/capabilities to be placed on the extended space.

Thanks

>
> > >
> > >
> > > > >
> > > > > So I like this one better as a basis - care reviewing it and addi=
ng
> > > > > stuff?
> > > >
> > > > There are very few differences and I will have a look.
> > > >
> > > > Thanks
> > > >
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

