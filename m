Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ECD8825
	for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 02:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716865065; cv=none; b=F0giMByhBPSjM+g+5F5HzUN6MAa5/4Da4U1VuwsllVjviyryDV4yWV7GjG1wtiA/c1gzEcUXTvD+wkIO8NIzv3eLkQ1K/62zYUShIbRkWUw+9VaiqKcxjV0mxpaiuUpaMFTY/R5XVmoFkugxtRtCrWDPLqV5Ppg26Qmlyes4X9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716865065; c=relaxed/simple;
	bh=ufQKSy95MeZIfaf4gLzB3DQHXhr4BcdCIl9pQV216F4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kiz1Y+BqpMiUfXOemqcfQKPeJ6ueSzC9C6Vs+ggkao5bVVZIhTZ2BJPneBOGGFaoAEFkfzEmA4LBAFuIdL7NQ0BDcExCMklLi9ZlPalwWHHSQiGRMuhCKCSan1fqQH83gFNcBCDATESvy8PJFjFRnLysTavtGBXqXpv71Ep8It8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q3/2yIBO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q3/2yIBO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716865062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hb4pobHLNyeZDGjrtd0GjmZaTSrY7kR7/Y48Fpxhb9M=;
	b=Q3/2yIBOGnhwBkhy3pASySD5xE0hM6gry0z5AFgl/C+zN5wM/ZuyUlEB0XjHKkLWrgdx9y
	SsBDnekV3i7WBLZzAx0s5EiVHDZmwBbKtnnITrQwAkLZuna0ypOP0L+irBpiz1rz0KmVKu
	WC8Tp3vMLiQyh2L91tbMCALgUNwa1O4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-6rponC0BOCac-NcS6l1wuA-1; Mon, 27 May 2024 22:57:40 -0400
X-MC-Unique: 6rponC0BOCac-NcS6l1wuA-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2bffbc8ad81so375466a91.2
        for <virtio-comment@lists.linux.dev>; Mon, 27 May 2024 19:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716865060; x=1717469860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hb4pobHLNyeZDGjrtd0GjmZaTSrY7kR7/Y48Fpxhb9M=;
        b=lnZayNBOJ+HHJT+GEk1PdsMUrVGbA0clSD9h4CUAL51MX14ISHufbpJp8EXtL999LU
         cky1ZySX3RhwC3v/VaxAuzWgZtW98VeGd6Sc+SuN4vvz46NRo+m9q2Qu/hZ1kaZxsEkH
         sC+MyurfRKcFDbYEdUGovxFj46GqLUahdK3RCTMuwSv4y45r1Fn1FFPC5qa4xWiLKr7I
         doGgEDiFb9S0S+9AL9IMHLmdof/dvCDmtF0BmyKjW2oCRu8a/HCKqviwXMGuNGiZj2WE
         k92umPLvw8/I2nWU3CeXOw+0IA7GDQQ/5OdhSbkSueERqJAUjyk3ew8/US4z8d/W15Og
         +FqQ==
X-Gm-Message-State: AOJu0Ywfvw5Itasazm70WLz4UALmOlFQkgGDejGi+EgvRFNtrsqFUrwO
	1YVy48UzWRx0ByEihYGvmrbcU+f0o7tams4fwdIE0GjE1dhwYNbyIvLrgAzlsk4zj02kLZ7n9ae
	mCZx1Au/G2sIokZJiT7p482xI2ZX4Z0XJRS56KSjmONgm1sXWybL8SzUN0YoPzT3HebaS6b3nwI
	GOFc8BNLR+E3DrMmX+2gh7WjeZIjqBeAUx27n6cXA=
X-Received: by 2002:a17:90a:296:b0:2bd:d2f9:fa18 with SMTP id 98e67ed59e1d1-2bf5f85ddcdmr9723256a91.48.1716865059550;
        Mon, 27 May 2024 19:57:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvoypZCrCFLAjEFSKNY5yHn0YlH7ryPi0W01Pn0KwfFiwJmYp3PBgvffzknruQa81VDF2k8ZsWCknyb0VnmTA=
X-Received: by 2002:a17:90a:296:b0:2bd:d2f9:fa18 with SMTP id
 98e67ed59e1d1-2bf5f85ddcdmr9723239a91.48.1716865059086; Mon, 27 May 2024
 19:57:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cb89d3d6b6a7e4a7f13e60dd3fded5e950727890.1716448766.git.pabeni@redhat.com>
 <ed730a7e12853339c6f5f298fa6c240a39942a74.camel@redhat.com>
 <CACGkMEtetmg=YUtPW+yL+s5MzhbKKkJyrx3EDOtf2aF=q5_b8g@mail.gmail.com> <a630f422b86ea4dd96418a84b5eea196fc98f326.camel@redhat.com>
In-Reply-To: <a630f422b86ea4dd96418a84b5eea196fc98f326.camel@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 28 May 2024 10:57:27 +0800
Message-ID: <CACGkMEsuhCoBe=dXTroTunjX98BUVo-EyyE3HRhzL0D4gC-qXw@mail.gmail.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 4:06=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On Mon, 2024-05-27 at 11:26 +0800, Jason Wang wrote:
> > On Thu, May 23, 2024 at 4:47=E2=80=AFPM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> > >
> > > On Thu, 2024-05-23 at 09:20 +0200, Paolo Abeni wrote:
> > > > The VIRTIO_NET_HDR_GSO_UDP_TUNNEL is a gso_type flag allowing GSO o=
ver
> > > > UDP tunnel. It can be negotiated on both the host and guest sides.
> > > >
> > > > UDP tunnel usage is ubiquitous in container deployment, and the abi=
lity
> > > > to offload UDP encapsulated GSO traffic impacts greatly the perform=
ances
> > > > and the CPU utilization of such use cases.
> > > >
> > > > One constraint addressed here is that the virtio side (either devic=
e or
> > > > driver) receiving a UDP tunneled GSO packet must be able to reconst=
ruct
> > > > completely the inner and outer headers offset - to allow for later =
GSO.
> > > >
> > > > To accommodate such need, new optional fields are introduced in the
> > > > virtio_net header: outer_th_offset, inner_protocol, inner_mac_offse=
t,
> > > > inner_nh_offset. They map directly to the corresponding header
> > > > information.
> > > >
> > > > Note that the inner transport header is implied by the (inner) chec=
ksum
> > > > offload, if present. Otherwise, it's up to the receiver to detect t=
he
> > > > inner transport header offset from the provided information, as it'=
s
> > > > currently the case for plain (not UDP tunneled) GSO packets.
> > > >
> > > > The outer UDP header may carry a second checksum, which can be offl=
oaded
> > > > independently from the inner one. Since UDP tunnel checksum offload
> > > > support makes little sense without UDP tunnel GSO support, to avoid
> > > > unnecessary complex feature negotiation, the
> > > > VIRTIO_NET_HDR_GSO_UDP_TUNNEL feature implies the support for the o=
uter
> > > > header checksum offload and the checksum itself is handled similarl=
y to
> > > > the inner header one.
> > > >
> > > > Migration for GSO_UDP_TUNNEL enabled VMs should be managed alike ot=
her
> > > > types of GSO offload: VMs that has negotiated such features could b=
e
> > > > migrated only on hosts supporting such features.
> > > >
> > > > Note that there is no concept of UDP tunnel type negotiation (e.g.
> > > > vxlan, geneve, vxlan-gpe, etc.). That is intentional because:
> > > > - given the information carried by the guest or host kernel, it's
> > > >   impossible to probe reliably the UDP tunnel type. Specifically, t=
he
> > > >   outer UDP port numbers give a hint, but peers could use nonstanda=
rd
> > > >   ones.
> > > > - all the existing UDP tunnel protocols behave the same way WRT GSO
> > > >   offload, carrying an immutable header on top of the outer transpo=
rt
> > > >   one.
> > > > - if a new UDP tunnel protocol, carring packet dependant informatio=
n
> > > >   alike the inner packet length or csum should surface in the futur=
e,
> > > >   the host and guest kernels will need explicit support for it,
> > > >   including new, different GSO features. Additional virtio support
> > > >   should be designed separately.
> > > >
> > > > Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> > > > ---
> > > > v3 -> v4:
> > > >  - new virtio_net_hdr fields depends on F_HOST_UDP_TUNNEL_GSO or
> > > >    F_GUEST_UDP_TUNNEL_GSO (Stefano)
> > > >  - Extended the changelog to answer Jason's questions.
> > > >  - Clarified outer csum handling (Jason)
> > > >  https://lore.kernel.org/virtio-dev/f0bf2db203f8061a3ecb50b7a48cf26=
d8f3c7f68.1716193086.git.pabeni@redhat.com
> > >
> > > Overall only minor edit over v3, just to restart the conversation.
> > >
> > > @Jason: I don't understand a question you raised on v3:
> > >
> > > """
> > > 1) if there's no concept of UDP tunnel type negotiation, would it be
> > > possible for a device to just implement vxlan?
> > > """
> > >
> > > Specifically, I don't understand what do you mean with 'just implemen=
t
> > > vxlan': there is no concept of vxlan-specific GSO offload in Linux, a=
ll
> > > UDP tunnels are exactly the same thing from GSO perspective.
> > >
> > > e.g. see:
> > >
> > > https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/i=
ntel/ice/ice_txrx.c#L2061
> > >
> > > Could you please re-phrase?
> >
> > I meant, virtio is not necessarily for a software implementation.
> > Various hardware vendors started to implement it as well.
>
> Note that the above links refers to an HW offload implementation for
> TCP over UDP tunnel TSO support.
>
> > I wonder if hardware is as flexible as Linux to support general UDP
> > tunnel offload.
>
> I don't have additional information WRT HW specific limitations.
>
> Perhaps the vendors (nvidia? intel? who else?) could chime here to
> specify such limitation if any.
>
> How is that kind of scenario managed with plain TCP TSO for virtio?

It's a problem indeed which needs to be addressed (and it is required
for big TCP).

> e.g. let's suppose that some virtio H/W only supports a limited number
> of segments per TSO packet.

A similar problem like this:

https://lore.kernel.org/lkml/20240411051124.386817-1-yuri.benditovich@dayni=
x.com/T/

I think this approach is problematic as it causes migration
compatibility issues.

(Unfortunately, it is applied and for some reason my comment doesn't
reach the list ...)

Thanks

>
> Thanks,
>
> Paolo
>
>

