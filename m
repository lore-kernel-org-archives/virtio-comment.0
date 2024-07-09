Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7C4A34
	for <virtio-comment@lists.linux.dev>; Tue,  9 Jul 2024 02:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720492307; cv=none; b=V2o0ZnYNFB6oqiHRrAMReAOa18dcqhtSRPSSbjv9CAqN5ln8hvVJ35fzyg7lgERlaPjOSO0ZwHLs1tHA8UEt1xO1hszj9pzbFuPNFzfTqmH0EVhmIlltiUmrIygyDWkVmtGdWi/HOOuBbbYh77MvkWJgXRgJjwetOIK2RyM/c8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720492307; c=relaxed/simple;
	bh=7QubCHfd3Xg/u9mk07Yvn0wACTfS1ax5vIQZ//0Htxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QHNq5qUiT2wcEuI0Odr5H84/DoTauoP4op18WLAVQ2x28CQR9wAPQK/68YkPH5+Pv4YcAK9PaxqsHwDiM58mILRupXxgVLXztsl7TpO4oirskJnYKYhUemX5+pf2Fe7ahnXroO/1ZBTL6+Y9IBuIqoSM/W15voZ/QpXUpvhHzHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TutvQRkP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TutvQRkP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720492304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IuLyMsOLgx1BRyeKBBN75p9yTGad9m+YjqoVG3OnYao=;
	b=TutvQRkPLkd4/3MbLdv3s2Yjf2TL+pt+wwXNGImAxz4RuRgpCi6hvp6xNvXlA02R8TvyEu
	Rh5+I8sJUFCQgctXi3VA1L0qTxOxa7SRFnxch/bH9+LY5gmZ6bG03w+JznXJ8gSXBN4UR7
	a09+FSpalKa1TU93cwfBUDekq+HvJGg=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-fJBmY4q-PWen5kXbI-7Bag-1; Mon, 08 Jul 2024 22:31:39 -0400
X-MC-Unique: fJBmY4q-PWen5kXbI-7Bag-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-70af036df9cso3863865b3a.1
        for <virtio-comment@lists.linux.dev>; Mon, 08 Jul 2024 19:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720492298; x=1721097098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuLyMsOLgx1BRyeKBBN75p9yTGad9m+YjqoVG3OnYao=;
        b=Onh7zVbarNJBYXSXNOv5YrxJWFqPjw8IO6paZnrkKLacLQvo1LO7sT4xt9VDkArarj
         LR54UTeneov22za+NWHad9M+skxVJ0Tp+Q8d8FQCm93qF6kCw4Pnz1+Ghrf+Wej/XGG9
         cAWusS/vEiWB/XJ/QmEsRmQWjl34zSBT/aDluLyY/lZYsAyq+Noti1nK+4Ec/NPj7uNK
         uyOkJhXrS+L563m+J3LDL77/9HBoMyVT058WgthoIuIAyGSGpdPC+f2fZUGBddF7sIHT
         1xyEnJOnLIUozKpTwd536jqrLixSdp9vBA4fTmirYKk0utmmpPaWPavT8s6OsaUqMDX6
         tSmw==
X-Forwarded-Encrypted: i=1; AJvYcCUnIASFZK+nNushuy7dKnOH0bKs8O4+oa7janlvRkXe/z3uVAKgNFjAJUnhAB6pQVM2q6Y9d/v6X21qt97GWA8788rrK0VXY9YThrSPmRg=
X-Gm-Message-State: AOJu0YxW4WKtxJ+aU0RDZkhMG6xOagTyU0FbJ/t9fiXbbpqKQq5psFNR
	4cLDT8Uk2Cly0NHSk9QCnt1GP7wVULEiGJ95HJOC73cIfFxYHqLOBddR/lYmBtvme1ZMtKttH+F
	2+dcsI9oRvwnVfz8t81EnmTjiEMNXxLkE2spzxyjmtgzuaeMjYmNnYL4D/ctg08Td8WzXoT1/kv
	iNKb2tqBP6IRC2bHLZVkOlk91C67MoNTyDZfpVP6M=
X-Received: by 2002:a05:6a00:2292:b0:70b:2ede:7142 with SMTP id d2e1a72fcca58-70b436171c6mr1717834b3a.34.1720492298518;
        Mon, 08 Jul 2024 19:31:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW0/srUg9qQHRN32Sb0zLh3v3J80W3GUy5Xn+D/kkEEarzMI3wjF1/x+ehKQ81r+tLA2ehZCRoGFuIPR+hafY=
X-Received: by 2002:a05:6a00:2292:b0:70b:2ede:7142 with SMTP id
 d2e1a72fcca58-70b436171c6mr1717804b3a.34.1720492298040; Mon, 08 Jul 2024
 19:31:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
 <CACGkMEt-Ep+At_4YvkJ2t8UmQHJ0-Qm6fAPbGpkV_AfVyNq2EA@mail.gmail.com>
 <ed07e9bb9ae5bc1a171c77425cc0b96e6b87745c.camel@redhat.com>
 <CACGkMEvD_WDN5yeRKcZ2ijRF8C2_Pmr6UZWMNt+_R6S0WHY5Fg@mail.gmail.com>
 <e5d885e6331b18b3be63facfd59658b316f20de1.camel@redhat.com>
 <CACGkMEsbiN90ptOL2XHauzWS=9j5RXtnO7OD10yChPaUO3CY_A@mail.gmail.com>
 <2f1c19591ff456ada2a1ad470032d3e3fb9f88d7.camel@redhat.com>
 <CACGkMEv9gGrLO0OkHYKmjqrLw50kfm2yaifMk1wnb6noa5L99w@mail.gmail.com>
 <4497c727ea6cc696ba7d60bcb95ba9bce33f1136.camel@redhat.com>
 <CACGkMEu_ODQV6O5-w6Hzg5gk-8x_iRsuWSk4fN2vzznPEYKphg@mail.gmail.com>
 <5914dd3b40bca9ca0a49aa31845a2bda49c862c2.camel@redhat.com>
 <CACGkMEtun+4xhh1s6o8kEnGGg4gvVS2ocuUr2yvubTNQqGcNkw@mail.gmail.com>
 <ead6fe1f23295906b7239cf946d51762132b29de.camel@redhat.com>
 <CACGkMEtsqjnFGFnZzF825ur8zz9--QovkxW5oCi+TT6Pu7S9oQ@mail.gmail.com>
 <a1a7625f669d58f17e047adee64e050f438d9fbb.camel@redhat.com>
 <CACGkMEvn8_uJewGw=RNg0133a68KFeoi2ctk2-vxZk=x8z8anQ@mail.gmail.com> <4d31f892a481b9d16ec81251b0bd569ba709f4d3.camel@redhat.com>
In-Reply-To: <4d31f892a481b9d16ec81251b0bd569ba709f4d3.camel@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 9 Jul 2024 10:31:26 +0800
Message-ID: <CACGkMEve=WQOGx1P8eyDsOq2=QivUt4tmV=BEPvkxk0bdEXw=Q@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Michael Tsirkin <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2024 at 6:38=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On Mon, 2024-07-08 at 10:11 +0800, Jason Wang wrote:
> > On Fri, Jul 5, 2024 at 5:23=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> =
wrote:
> > >
> > > On Fri, 2024-07-05 at 11:26 +0800, Jason Wang wrote:
> > > > On Thu, Jul 4, 2024 at 12:33=E2=80=AFAM Paolo Abeni <pabeni@redhat.=
com> wrote:
> > > >
> > > > > Anyway if a device can't perform H/W GRO it will send to the driv=
er non
> > > > > GSO packet. It will not need to fill any fields for that.
> > > > >
> > > > > Let's suppose we have to host with H/W virtio net support, both
> > > > > exposing F_GUEST_UDP_TUNNEL_GSO, host1 can do geneve H/W GRO, hos=
t2
> > > > > can't. I don't see migration issues between host1 and host2. The =
latter
> > > > > will not generate any UDP TUNNEL GSO packet for geneve, but will =
send
> > > > > to the driver plain packets, as on the wire.
> > > > >
> > > > > What I'm missing?
> > > >
> > > > Probably not but not sure if this is a actual bug, but consider:
> > > >
> > > > Guests can only know inner protocol X and Y. So did host 1. But aft=
er
> > > > migrating to host2, it can have inner protocol Z. Can this happen o=
r
> > > > not?
> > >
> > > As mentioned, the guest will not parse the packet, it just need to
> > > validate the fields.
> > >
> > > Yes, the above scenario can happen, but AFAICS it will not cause any
> > > bugs.
> > >
> > > The guest will be able to process and segment the UDP tunnel GSO
> > > packets with unknown UDP tunnel protocol thanks to the mentioned
> > > additional fields added to the virtio net header.
> > >
> > > Obviously, if the guest don't understand geneve packets, and the host
> > > suddenly starts sending them, at some point such packets will be
> > > dropped inside the guest.
> >
> > Ok, I meant for example, guests don't understand UDP GSO geneve
> > packets but can understand non GSO geneve packets.
>
> I guess there some ambiguity with using the term "understand".
> What do you mean with "guests don't understand UDP GSO geneve packets"?

I meant guests don't know how to handle UDP GSO geneve packets so it
needs to drop.

>
> Given the additional virtio net header fields, the guest will be always
> able to segment any UDP tunneled GSO packet, comprising any possibly
> geneve packet layout.

For example, guest supports geneve GSO packet since version X. We have
a guest version < X. When it is migrated from src to dst. Source
doesn't support geneve GSO but destination supports it in RX. Guests
will start to drop all UDP geneve GSO packets in the destination.

>
> > > > >
> > > > And still something needs to be considered:
> > > >
> > > > 1) inner nh/mac/protocol seems to be meaningless for hardware
> > > > virtio-net implementation, anything we can optimize on this? (maybe
> > > > not since e.g num_buffers is meaningless for TX as well)
> > >
> > > Do you mean in the Host2VM direction? They are needed to the VM, to
> > > fully understand/build the GSO packet.
> > >
> > > Or do you mean in the the VM2Host direction? The device will need the=
m
> > > to do H/W segmentation of the packet.
> >
> > I meant for example bare metal usage, host is using virtio-net NIC. If
> > the NIC can't do VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO, could we avoid
> > those inner headers?
>
> I see. The current specification change makes the new fields mandatory
> if the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature or
> VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO feature are negotiated.
>
> In a previous message I proposed to include such fields only when the
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit is set in the gso_type field. That
> should both address the above concern and optimize the binary layout in
> the general case. Are you ok with such proposal?

This might work, but not sure if it would complicate the hardware
implementation or not.

>
> > > > 2) do we need to hear from hardware vendors to see if there's a cha=
nce
> > > > to implement RX UDP Tunnel?
> > >
> > > The bnxt driver proves it's feasible. The lack of other NICs with suc=
h
> > > support hints it's difficult and/or there are is no large demand for
> > > that (I wild guess the latter).
> > >
> > > Possibly we can make the life easier for H/W driver implementations
> > > adding a configuration command -say VIRTIO_NET_CTRL_UDP_TUNNEL_CONFIG=
 -
> > > and allow the guest to explicitly request/enable specific UDP tunnel
> > > types?
> >
> > Probably but then we need to deal with compatibility issues. E.g src
> > support tunnel X but dst doesn't.
>
> Existing NICs need to explicitly enable e.g. geneve or vxlan offload. I
> mentioned the above configuration command as a way to hook into such
> NIC-related configuration steps.
>
> A simpler alternative could to be let the virtio net H/W implementation
> always enable all the supported UDP tunneled GSO offload when the
> VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO is negotiated

It might work but we need to list those UDP tunnels in the spec if I
was not wrong.

>
> > > Somewhat related question: what happens after a migration to the
> > > configuration send by the driver to the device? is up the the VM
> > > somehow catch the migration event and re-send them?
> >
> > I think not, when command X succeeds in the source, the guest will
> > assume it will succeed in the destination.
> >
> > > Or after the
> > > migration the VM is expected to run on top of a driver with a differe=
nt
> > > configuration?
> >
> > Nope, migration is totally transparent to the guest.
>
> Perhaps an example will help clarifying.
>
> Let's suppose a guest configures VIRTIO_NET_HASH_TUNNEL_TYPE_VXLAN and
> VIRTIO_NET_HASH_TUNNEL_TYPE_GENEVE on the current host and later is
> migrated elsewhere. Will the guest will stop receiving packets with
> hash_report carrying such values? if not, why/how?

We have the below fields in the configuration space:

struct virtio_net_config {
        ...
        le32 supported_hash_types;
        le32 supported_tunnel_types;
}

It's the charge of the management layer to make sure the dst has the
exact same supported type with src.

Thanks

>
> Thanks,
>
> Paolo
>

