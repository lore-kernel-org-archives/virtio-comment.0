Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D9A1643D
	for <virtio-comment@lists.linux.dev>; Fri,  5 Jul 2024 03:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720149983; cv=none; b=T2dNFoqBo0a70NHwenc72fhuRR9xrR83Vo4OA7b+KjcU4HND8f711UAMSOqjLLqTxPT2gUbKXE71m61KDr6ol9DElie6XTqWiFeM195nXllbb3/847KXZdlQkZfk9cuelSeB0k2CekC3Ud+7/2szva0sFkSF1ljvqfQKnslfLhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720149983; c=relaxed/simple;
	bh=wacT+DOGglvcxMoZxJy8iMQqHIvdKet+kJqOJgWcKrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P0YqEBUYXLTTfCrMQPzV81Ab0EGZ0dROyWlzxdfCwQbXpVcHk8+bYEQPwRThtwO1sAZ2fepKrfU5Sl8bpQxJ7aS7Szs+NFFvhEC+dqG0DLBPB8UqQoCigv0dlRHeDMmnGJ7IHVS2+GviA67t62fOlSU5c2agGE+uF+M34WM708M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IJuh5Mji; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IJuh5Mji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720149980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wacT+DOGglvcxMoZxJy8iMQqHIvdKet+kJqOJgWcKrU=;
	b=IJuh5Mji4b25/5Vty13+KoOymTu/++4195LNOjuyVh1OdzGMYOw68dgtjRxNBna28FgaTm
	mK6tyQJn3aD4D/8Oc5EvgHW3OgxRc4gvlHvNpqFXGhrYyzhGZgiY2Ke1bSot3Qw/idDlDM
	LfQ7s901aqN9NzrY9QXYXhNHOCdobq0=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-_JRXrWUtPZuo6LQD1bm_wg-1; Thu, 04 Jul 2024 23:26:19 -0400
X-MC-Unique: _JRXrWUtPZuo6LQD1bm_wg-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2c963f358feso1221409a91.3
        for <virtio-comment@lists.linux.dev>; Thu, 04 Jul 2024 20:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720149978; x=1720754778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wacT+DOGglvcxMoZxJy8iMQqHIvdKet+kJqOJgWcKrU=;
        b=kw7faOgddBqBB77vdUcAbBvIORED4R17iQb2vDHTozUWS+XB4qUeiOm35OGwM6GC9Q
         uXThjwLEOw12R2NUDoqHiFriGQxO10kX9/9SX9swg12/d1hQCJiLa+Aspxn+DKEwr6OI
         SqWxfhndcRKaAR9i/Eu+hhvenhhKGDPJ3wkafNSDqMXYpDV1jpqvL58br5ly6zdqKQth
         /plm0H+Xg4ouLEVkiaiF3EFUmxlDS9uILQAxrSBfTGXBw9vNJuMKvHGzZGsQ2AmugeWA
         A4zdycOd73lUV/ojrMDNz0znDUSr/UXfzzIeB2NzikFqS1JNXn3ftzvcG0r0DOljzhna
         yw3w==
X-Forwarded-Encrypted: i=1; AJvYcCVufW/JrUIMBTmqLqDD6smBEJLZ6rfnAigYI24VX3OnvGCBZnwQqT2wnW0JqUdOD0Dhy5LBI49SbJSrn7oS9ud/RDGVf0a+NQxThXn6LfY=
X-Gm-Message-State: AOJu0YxaO+3Hb5E2fiJShyZK5ncBcpyOZwVWbewgN0eVM4HXxAzQZo8b
	QUVc4alXpbVUbunss9gyZx1dLcaVbLmLUcd7nijw7e4H34kHtqHh5TZaqxesI2YwyB+Atzqbimr
	4oEHYMRUHZQrjwUB/nk6lwww7LAZcTgDaed32OkMC0fQ1sx1HADqbIYWnL4wgNHITaoFSicy8kf
	0j9mz4OK69K9wDAQMlJdwiyGEsdlPRUAOzTMaprA0=
X-Received: by 2002:a17:90a:9a8b:b0:2bf:9566:7c58 with SMTP id 98e67ed59e1d1-2c99c6d080cmr2500376a91.41.1720149977751;
        Thu, 04 Jul 2024 20:26:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEotUXFRSULtd2grv4ToZaTVgZJeeTD+5YmjxJWKj1qlFu1Fat0qh1a2EoXHCo4IAV9k/t4HyXYBTs+8o9Q5KY=
X-Received: by 2002:a17:90a:9a8b:b0:2bf:9566:7c58 with SMTP id
 98e67ed59e1d1-2c99c6d080cmr2500369a91.41.1720149977182; Thu, 04 Jul 2024
 20:26:17 -0700 (PDT)
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
 <CACGkMEtun+4xhh1s6o8kEnGGg4gvVS2ocuUr2yvubTNQqGcNkw@mail.gmail.com> <ead6fe1f23295906b7239cf946d51762132b29de.camel@redhat.com>
In-Reply-To: <ead6fe1f23295906b7239cf946d51762132b29de.camel@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 5 Jul 2024 11:26:03 +0800
Message-ID: <CACGkMEtsqjnFGFnZzF825ur8zz9--QovkxW5oCi+TT6Pu7S9oQ@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Michael Tsirkin <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 12:33=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On Wed, 2024-07-03 at 10:34 +0800, Jason Wang wrote:
>
> > > > > Other UDP tunnel protocols (e.g. FOU), does not carry the inner h=
eader
> > > > > and additionally the inner protocol type is not specified on the =
wire,
> > > > > (is configured on the control plane) so there is no way to extrac=
t it
> > > > > with parsing.
> > > >
> > > > I think if this proposal wants to support the case where there's no
> > > > encapsulation header, we probably need to clarify it somewhere.
> > > > (Otherwise readers may assume there's an encapsulation protocol lik=
e
> > > > geneve).
> > > >
> > > > But in the case of FOU. If the control plane has mapped the port to=
 a
> > > > specific protocol on the rx side. I don't know how the inner_protoc=
ol
> > > > can help in any place.
> > >
> > > AFAICT whoever is sending (and building) the UDP tunnel GSO packet ov=
er
> > > such tunnel protocol knows the inner header offset and inner protocol
> > > type. It just need to put them in the virtio net header.
> >
> > The virtio net header is not sent on the wire, imagine two hardware
> > implementations of virtio-net trying to send FOU. How can the rx side
> > of hardware virtio-net know about that?
>
> If the device does not support H/W GRO for for TCP/UDP over FOU tunnel
> (I guess almost every H/W will belong to this category) there is no
> need to fill the extended attribute.
>
> If the device somewhat implements such support (e.g. by virtue of some
> configuration associating a given UDP port to FOU, and a given inner
> protocol type),

That's my understanding, it needs a device API to know about such things.

> to be able to aggregate the packets and updated the GSO
> packet 'len' fields in the various header, the device actually use such
> information, and thus can insert them in the virtio_net_header.
>
> FTR I really don't think anybody is interested in FOU H/W GRO support;)

Right.

>
> > > >
> > Just make sure we are on the same page.
> >
> > If I don't misread you, your point is that the csum_offset is implied
> > by gso_type. For example VIRTIO_NET_HDR_GSO_UDP_TUNNEL implies
> > csum.offset =3D=3D 6. If this is true, it is something that has been li=
ke
> > this. For example VIRTIO_NET_HDR_GSO_TCPV4 implies csum_offset =3D=3D 1=
6.
>
> My point was about avoid adding a to virtio_net_header a field that
> carries no additional information. I actually underlooked the fact that
> virtio could have avoided introducing csum_offset for TCPV{4,6},UDP_L4
> cases.
>
> > > > > - give to the newly introduced fields couple the exact old semant=
ic of
> > > > > csum_start/csum_offset.
> > > > >
> > > > > I actually went through the exercise of implementing a working Po=
C on
> > > > > top of a previous revision of this proposal. AFAICT using
> > > > > csum_start/csum_offset for the outer csum will require a more com=
plex
> > > > > and bug prone implementation then the alternative initially propo=
sed
> > > > > here.
> > > > >
> > > > > > >
> > > > > > Exactly. My point is (I may miss something obvious) why should =
we care
> > > > > > about mac header offset when we are doing segmentation? For the
> > > > > > content from outer payload start to inner transport start
> > > > > > (inner_csum_start), the device can just replicate without worry=
ing
> > > > > > about what it has.
> > > > >
> > > > > The inner mac header offset is not needed for segmentation, it's =
needed
> > > > > to rebuild correct GSO packets on the 'other end'.
> > > >
> > > > For "other end" did you mean the general device RX or the case of V=
M2VM?
> > >
> > > Let suppose the the device is transmitting an UDP tunnel GSO packet.
> > > With the "other end" I mean the driver receiving such packet. It must
> > > be able to fill all the sk_buff fields needed to properly segment lat=
er
> > > such packet, comprising inner_protocol, inner_mac_header,
> > > inner_network_header etc...
> >
> > I guess we are talking about different things.
> >
> > In a VM setup, the host can read those vnet headers. For example
> > virtio-net(VM1) -> tap1 -> bridge/OVS -> tap2 -> virtio-net(VM2), host
> > can simply map vnet header to skb medata back and forth, so those
> > inner fields could be seen by VM2's virtio-net driver.
> >
> > But what I want to say is in the case of bare metal or hardware
> > virtio-net implementation. Machine1 (virtio-net) -> wire -> Machine
> > 2(virtio-net). In this case the RX virtio-net can't see the vnet
> > header. If it wants to offer those inner fields, the only thing is
> > trying to parse the inner. And such kind of parsing will be hard to be
> > protocol independent. And if it's not protocol independent, we may end
> > up with compatibility issues for live migration.
>
> To be able to do H/W GRO for e.g. TCP over UDP tunnel, the device must
> be able to parse the tunnel protocol. The same way it should be able to
> parse up to L4 for the plain TCP H/W GRO case.

Yes.

>
> Anyway if a device can't perform H/W GRO it will send to the driver non
> GSO packet. It will not need to fill any fields for that.
>
> Let's suppose we have to host with H/W virtio net support, both
> exposing F_GUEST_UDP_TUNNEL_GSO, host1 can do geneve H/W GRO, host2
> can't. I don't see migration issues between host1 and host2. The latter
> will not generate any UDP TUNNEL GSO packet for geneve, but will send
> to the driver plain packets, as on the wire.
>
> What I'm missing?

Probably not but not sure if this is a actual bug, but consider:

Guests can only know inner protocol X and Y. So did host 1. But after
migrating to host2, it can have inner protocol Z. Can this happen or
not?

>
> Note that to do TSO for geneve packets the driver don't need to do any
> parsing.
>
> > Or actually, the F_GUEST_UDP_TUNNEL_GSO (and FOU?) is not something
> > that is expected to be implemented by hardware?
>
> I guess H/W GRO for UDP tunnel will be rare. Note that the H/W can
> implement H/W GRO only for a limited set of the UDP tunnels protocols.

That's my feeling, we can hear from hardware vendors for this.

>
> > > >
> > > > > Lacking the inner offset, the skb will be corrupted by a later
> > > > > segmentation in the guest - if/when such thing will happen.
> > > >
> > > > Do you mean the case of GSO packet forwarding which might require
> > > > software segmentation? For plain GSO, we don't require inner
> > > > mac/nh/protocol in order to be forwarded or software segmented (or
> > > > maybe I miss something again).
> > >
> > > AFAICS skb_udp_tunnel_segment() unconditionally relies on skb-
> > > > inner_protocol and skb_inner_mac_header() for correct segmentation:
> > >
> > > https://elixir.bootlin.com/linux/latest/source/net/ipv4/udp_offload.c=
#L22
> > > https://elixir.bootlin.com/linux/latest/source/net/ipv4/udp_offload.c=
#L166
> >
> > I see. Two questions:
> >
> > 1) If we allow the dodgy UDP tunnel GSO packets, those fields need to
> > be validated
>
> I guess virtio_net can validate them when building the skb:
>
> outer_transport offset < inner_mac_offset
>
> inner_mac_offset =3D=3D inner_network_offset &
> inner_mac_offset + 14 =3D=3D inner_network_offset
>
> protocol_type in [IPv4, IPv6, TEB]
> ...

Yes but I mean in the case of a VM, the vnet header is not trusted so
it needs to be validated in the host (e.g TAP or DODGY_GSO path).

>
> > 2) Is there any existing NIC that can do RX UDP tunneling GSO?
>
> AFAICS, the only NICs supporting HW GRO for UDP tunnel packet use the
> bnxt driver. and think the implementation is buggy (it does not
> set/fill must sk_buff fields).

Ok, I see.

So in conclusion, I think we are kind of on the same page. I
understand that those inner fields were designed mostly for VM2VM or
VM2Host. And still something needs to be considered:

1) inner nh/mac/protocol seems to be meaningless for hardware
virtio-net implementation, anything we can optimize on this? (maybe
not since e.g num_buffers is meaningless for TX as well)
2) do we need to hear from hardware vendors to see if there's a chance
to implement RX UDP Tunnel?

>
>
> > Or can we probe the inner stuff.
>
> Could you please re-phrase this part?

I meant we need to probe/parse the inner stuff for hardware
implementation of UDP GSO tunnel.

Thanks

>
>
> Thanks!
>
> Paolo
>

