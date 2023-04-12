Return-Path: <virtio-comment-return-5432-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2F2C7619A
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 05:15:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 429C226A4E
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 05:15:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 36E9598651C
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 05:15:15 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2EDD0986509; Wed, 12 Apr 2023 05:15:15 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1D23C98650E
	for <virtio-comment@lists.oasis-open.org>; Wed, 12 Apr 2023 05:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 4o9NJsoaPjyG0b3-FVxYMQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681276510; x=1683868510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lr9nNQAT7/w/nt0aGjl9dF4DjMz/dSrtMPqZ/WEc7/E=;
        b=KmdAhfbQ/RXdJRjRQfi9NPk8MC+Jb1eOxoK0FkvoEY5VfSBwBY5LLwK4kJqfcSpjs/
         answEm9S23mhk9svVlpiZK4seENx9YqX8XMsZst3xfTWVzS4Y7VyaxOOgk0cIA8FLzg8
         WI8WO2Itk/tcsoY3pl0slIyoEJOkUax+3S/TOjBhcpTnIKgRW5Zx/R+3NkaO9oyd0gVt
         YfjmsZxH8G5EZPndveENrPc9AjchQmK3DjPrt35QRgY3fkaElLdjuZi0qSvC8FxiYR71
         Kh1sfPW571BO2PQLledauXJHuunCSTzGXwhkVVQ81odvDtwBDXtqu0+QFEg26c1NfZS8
         v+hg==
X-Gm-Message-State: AAQBX9fJRmsii70vo5jlZrlogLV/8uCmgNV6rqtAbffmA777qjI35+Dr
	2CRCk9/Tt3DY3v0T1CWJcxfn7/+MNh4xKvudNCIVyY7uvx/f+hR4w+ivC1CYfK/LUI9IgPwOcIe
	RGWhFZeXvUXxTKU2iz6dwgCd5Z4Cm/PAdMzvgvLEkgPk6AJ9T3A==
X-Received: by 2002:a05:6870:d0c8:b0:17e:e007:7098 with SMTP id k8-20020a056870d0c800b0017ee0077098mr6295815oaa.9.1681276510611;
        Tue, 11 Apr 2023 22:15:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZjvhXPsy/QSUdPxn4jBFtdFGn1JAD8PAZmc6b9ji7wI7McadUhOosUhFploM6rubIv2kQntMFm6OPgTYAmAok=
X-Received: by 2002:a05:6870:d0c8:b0:17e:e007:7098 with SMTP id
 k8-20020a056870d0c800b0017ee0077098mr6295809oaa.9.1681276510387; Tue, 11 Apr
 2023 22:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230410020906-mutt-send-email-mst@kernel.org>
 <CACGkMEtiROwuB+ECJqd13qdpMJSTMoDOzi1u_i85==42C0XSXw@mail.gmail.com>
 <20230410023715-mutt-send-email-mst@kernel.org> <CACGkMEs+E_OarQxP3NmLk3iSi7U0WgAn-m3b4eX7ULu1+v=sOw@mail.gmail.com>
 <20230410060417-mutt-send-email-mst@kernel.org> <CACGkMEuc47PdmQdC67Nz4AvX_+jy+XBgCkwZ1BHmM8VGb9gywA@mail.gmail.com>
 <20230411030056-mutt-send-email-mst@kernel.org> <CACGkMEt2QAfhCgpYjSRNzf3n4W_HJLrMfE9JHzocR_gPH_Zrtg@mail.gmail.com>
 <20230411063945-mutt-send-email-mst@kernel.org> <CACGkMEufWUXHKahg3GLOKfV5aptbiek_DKwy+7rCfMya2GPaTQ@mail.gmail.com>
 <20230412000802-mutt-send-email-mst@kernel.org> <CACGkMEshNydwBD=Q0JW-SDY6xyiJ4uVrLn+pxbUrinycBKwsrw@mail.gmail.com>
 <PH0PR12MB548118F57BB4B4A4F8DC9D7ADC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB548118F57BB4B4A4F8DC9D7ADC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 12 Apr 2023 13:14:59 +0800
Message-ID: <CACGkMEvYsz1fSPG+fKpRaZ05Ut7ffKwvMPvR8xbRBsXA_6vGQw@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>, 
	Satananda Burla <sburla@marvell.com>, Maxime Coquelin <maxime.coquelin@redhat.com>, 
	Yan Vugenfirer <yan@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH 09/11] transport-pci: Describe PCI
 MMR dev config registers

On Wed, Apr 12, 2023 at 1:01=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, April 12, 2023 12:51 AM
> >
> > Yes, but this proposal will drag us back to legacy, isn't it?
> No. This proposal supports the legacy transitional pci device.
>
> > Or if it is used only in
> > the vitalization environment, what's the advantages of doing it over si=
mply
> > mediating on top of modern device?
> >
> Because the spec for modern device do not allow it. Discussed in these th=
reads.

Can you please tell me which part of the spec disallows it? There's a
long discussion in the virtualization-list a few months ago about
mediating legacy devices on top of modern. We don't see any blocker do
you?

>
> > 1) legacy MMIO bar: spec changes, hypervisor mediation
> > 2) modern device: no spec changes, hypervisor mediation
> >
> This question repeats the same discussion occurred in this patch series.
> You might want to refer it again to avoid repeating all over again.

No, I think you miss the point that modern devices could be used for
mediating legacy devices.

>
> > 1) it's better not invent any of new facilities for legacy
> > 2) if legacy is insisted, allow MMIO BAR0 is much simpler and better
> You have missed few emails. :)
> MMIO BAR is proposed here and it is not limited to BAR 0.

In the context of mediation, why do you need that flexibility?

> It is left for the device to either map something in existing BAR or use =
BAR 0.
> Because PCI has only 3 BARs.
> A device may want to support legacy and non-legacy functionality both at =
the same time.

This is perfectly fine, this is how Qemu did:

    /*
     * virtio pci bar layout used by default.
     * subclasses can re-arrange things if needed.
     *
     *   region 0   --  virtio legacy io bar
     *   region 1   --  msi-x bar
     *   region 2   --  virtio modern io bar (off by default)
     *   region 4+5 --  virtio modern memory (64bit) bar
     *
     */

> So better not to hard wire for BAR 0.

Using BAR0 doesn't prevent you from adding modern capabilities in BAR0, no?

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

