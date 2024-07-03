Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6127D139D
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 02:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719974075; cv=none; b=serjjNHPdnuV0HfdeHEB6GCcaU1jtAlnY3+y6Oi/KBxb0F2JLpiegFSbb6Zx1lSCuy6vRZSJeRoxBZt/GfapNe6n+NN2SAlFH9B1dz06v2HvsZl1AB50hQ0h1qanyDlTZ9FKmSnTH+DdW0JdWKfPCGUarG3UwDQZS62sBCpFJZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719974075; c=relaxed/simple;
	bh=AW07iFsnPgq6inNHPBY+iiwnUHnAGsNTIl7faeLXM/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m1//1tlBL/7mW3DfDhBYfBBWruApTi240/zH39eJWRpHoXjHao0h8YLcfe6/56FHbzh13cZOcQ3+x9om6WHjYVgXv5S0EkV+k8qkxC4GEt3ioIns137HZWbudULM1854mkWahyICbKjk819alJU0++ZMwz1m1HfvzXks6TSn6Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YVS3IJZD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YVS3IJZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719974072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uhyoFEoQLF7ZjdXmW2eDGSzU585muJ5fF/Eg571dNw4=;
	b=YVS3IJZDcIZ2mNayzdlr9opkLpXfuLfqhm08Jh796pdViDGFxvWbc4IpZZiOocajKjziFc
	bItrSTjGzuyZeUuMF1iJqxJ/X7pH8v1TqDWQDGZAoR6RKjYBcNhXAk7W5pF7hDyv3EY3n/
	sZyS5WZFnurejuEMIlj41mYO/4l+nNc=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-QQdvEkm1PZynD2iUN9SwqQ-1; Tue, 02 Jul 2024 22:34:28 -0400
X-MC-Unique: QQdvEkm1PZynD2iUN9SwqQ-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3d659a11828so3912599b6e.3
        for <virtio-comment@lists.linux.dev>; Tue, 02 Jul 2024 19:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719974068; x=1720578868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhyoFEoQLF7ZjdXmW2eDGSzU585muJ5fF/Eg571dNw4=;
        b=S+/DZxciCwVW+SdNKPVLtRJleoH+bIr/nkTJrVfn3b98QlftGMJnphXPPrixjo448S
         K3WRmYl4r8ku6YsTpIrXSZu3ImsPjpmGqvEZY3zTCp/C+A9FjpQ/wTvVs4bmsoth3rZW
         y4oHYCzA9Ke8lX1ZoMH3FKj92UEbNSoQ9quW+twvhMMKqstAsO+Ek7h99W/mk+I8mKnf
         kc35ZF0eK5YNkSkgJ9zF5S9QU2k4FrAaLKfyKeNWkO9rHGefjCtuPeoqqeAPtC4lnin+
         nWI4GPvahbWpzprxjhf7XRC7w7R2XsN7QvoApuQpRGZEhyur4PdDbdpmYrRo2qTubeYn
         Eeyg==
X-Forwarded-Encrypted: i=1; AJvYcCXrCMhjNLP+LV1Bchob+eX8ymZRCbXSn8CA6lmIcjqU7BfQzdKq3Ye8tcKHABPlChOQdWVAPAH7cojA90jdz1V+jfF4M2nkU87ur7VFT7w=
X-Gm-Message-State: AOJu0YzVyhS7/f2e9pdtoSpl+d2HEFrKO26Ox6ZkIpiXwD+8GoJl9TYy
	AeifEGmL1OuDWQNekBOapc+S6N4w1kvkWEuvMzMzVHcFOn+hm5b1nwOwumZtlk4kAanw524gC/f
	1O51ZufssSP60H3pfDcaQXIDNVrOyC/2yHWtATBZT0u4mv8IkGPfskiV4Fo48o5P8Yo4qj+ruiK
	1NOvIggv/CUHU9a0e/KCHXWMtJGdjILNt68UaimbU=
X-Received: by 2002:a05:6808:14c6:b0:3d6:2cc2:6b33 with SMTP id 5614622812f47-3d6b4de2f12mr13887405b6e.39.1719974067869;
        Tue, 02 Jul 2024 19:34:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYRMHU00dINs9dDBFx2Q82vbVhH+umwpLpu3+tsSrafqkkbcF30X+oN+Vx+yyjPYp1tCZFZtNtVX9r97fwwhs=
X-Received: by 2002:a05:6808:14c6:b0:3d6:2cc2:6b33 with SMTP id
 5614622812f47-3d6b4de2f12mr13887373b6e.39.1719974067140; Tue, 02 Jul 2024
 19:34:27 -0700 (PDT)
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
 <CACGkMEu_ODQV6O5-w6Hzg5gk-8x_iRsuWSk4fN2vzznPEYKphg@mail.gmail.com> <5914dd3b40bca9ca0a49aa31845a2bda49c862c2.camel@redhat.com>
In-Reply-To: <5914dd3b40bca9ca0a49aa31845a2bda49c862c2.camel@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 3 Jul 2024 10:34:15 +0800
Message-ID: <CACGkMEtun+4xhh1s6o8kEnGGg4gvVS2ocuUr2yvubTNQqGcNkw@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Michael Tsirkin <mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 12:25=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On Tue, 2024-07-02 at 14:50 +0800, Jason Wang wrote:
> > On Mon, Jul 1, 2024 at 5:23=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> =
wrote:
> >
> > > Still we need some more info to correctly locate the outer transport
> > > header and the checksum, without resorting to header parsing. Thus th=
e
> > > additional field.
> >
> > Maybe the "parsing" is something that causes confusion. If I
> > understand it correctly, you meant "driver parsing" here on the rx
> > side. Unfortunately, for plain (non-tunnel) GSO, csum_start and
> > csum_offset is necessarily set (e.g in the case of
> > VIRTIO_NET_F_DATA_VALID/CHECKSUM_UNNECESSARY), so the driver needs to
> > probe them. For example, Linux driver has this in
> > virtio_net_hdr_to_skb():
> >
> >                 /* gso packets without NEEDS_CSUM do not set transport_=
offset.
> >                  * probe and drop if does not match one of the above ty=
pes.
> >                  */
> >                 if (gso_type && skb->network_header) {
> >                         struct flow_keys_basic keys;
> >                         ...
>
> This is the kind of things I suppose we wont to avoid.
>
> The current proposal does not specify it, but I guess we can require
> inner checksum offload as a pre-req for UDP tunnel GSO support, and
> avoid a bunch of edge cases.

So the checksum offload is implemented via either
VIRTIO_NET_HDR_F_DATA_VALID or VIRTIO_NET_HDR_F_NEEDS_CSUM. I guess
you meant VIRTIO_NET_F_GUEST_CSUM here.

Unfortunately, partial csum looks more like a thing for a shortcut for
VM2VM traffic or not sure how easily GRO_HW could be done for a
hardware implementation.

>
> > > > For tunnel GSO, this proposal introduces:
> > > >
> > > > inner_protocol: inner ethernet type
> > > > inner_mac_offset: inner mac header
> > > > inner_nh_offset: inner network header
> > > >
> > > > This gives me the impression that the tunnel GSO (at least the inne=
r
> > > > part) wants to be protocol independent. This is fine but I don't fu=
lly
> > > > understand why the above is needed. For example, why do we need to
> > > > know about the inner_protocol?
> > >
> > > in some tunnel protocols e.g. geneve, the inner mac header is not
> > > included. In such case, inner_mac_offset =3D=3D inner_nh_offset.
> >
> > I may miss something but geneve seems to have a inner mac according to:
> >
> > https://datatracker.ietf.org/doc/html/rfc8926#section-3-1
>
> That is just one of the possible geneve layout. Geneve also allows
> specifying an 0x0800 protocol type, omit the ethernet header and put
> the inner ipv4 just after the geneve header itself.

Ok, so for geneve inner_mac_offset is not necessarily equal to inner_nh_off=
set.

>
> > > Specifically in the geneve case the inner protocol can be obtained
> > > parsing the geneve header itself.
> >
> > Yes.
>
> still we wont to avoid such parsing, I guess and hope???

Yes, but on the rx side how can it be avoided?

>
> > > Other UDP tunnel protocols (e.g. FOU), does not carry the inner heade=
r
> > > and additionally the inner protocol type is not specified on the wire=
,
> > > (is configured on the control plane) so there is no way to extract it
> > > with parsing.
> >
> > I think if this proposal wants to support the case where there's no
> > encapsulation header, we probably need to clarify it somewhere.
> > (Otherwise readers may assume there's an encapsulation protocol like
> > geneve).
> >
> > But in the case of FOU. If the control plane has mapped the port to a
> > specific protocol on the rx side. I don't know how the inner_protocol
> > can help in any place.
>
> AFAICT whoever is sending (and building) the UDP tunnel GSO packet over
> such tunnel protocol knows the inner header offset and inner protocol
> type. It just need to put them in the virtio net header.

The virtio net header is not sent on the wire, imagine two hardware
implementations of virtio-net trying to send FOU. How can the rx side
of hardware virtio-net know about that?

>
> > > Using all the above 3 fields allow covering all the above use-cases.
> >
> > Maybe you can give me an example for this.
>
> I probably misread your question, but it should be something alike:
>
> static inline int virtio_net_hdr_to_skb(...)
> {
>         ...
>                 if (hdr->gso_type & VIRTIO_NET_HDR_GSO_UDP_TUNNEL) {
>                         skb->inner_mac_header =3D __virtio16_to_cpu(littl=
e_endian, hdr->inner_mac_offset);
>                         skb->inner_network_header =3D __virtio16_to_cpu(l=
ittle_endian, hdr->inner_nh_offset);
>                         skb->inner_protocol =3D __virtio16_to_cpu(little_=
endian, hdr->inner_protocol);
>                         ...
>
> > > >
> > > That csum field will need different handling WRT the inner one - as t=
he
> > > outer csum is optional.
> > >
> > > If we use csum_start/csum_offset for the _outer_ csum, we will need t=
o:
> > > - introduce additional inner_csum_start/inner_csum_offset to cope wit=
h
> > > the inner transport header csum.
> >
> > Yes, this seems straightforward.
> >
> > > - change the semantic of existing csum_start/csum_offset to cope with
> > > optional csum. csum_offset will carry no useful information, as it wi=
ll
> > > be always be constant '6'.
> >
> > We probably don't need to worry about this. For example, for TSO it
> > would always be 16? And spec has something like
> >
> > "
> > For example, consider a partially checksummed TCP (IPv4) packet. It
> > will have a 14 byte ethernet header and 20 byte IP header followed by
> > the TCP header (with the TCP checksum field 16 bytes into that
> > header). csum_start will be 14+20 =3D 34 (the TCP checksum includes the
> > header), and csum_offset will be 16
> > "
>
> If virtio would allow only TCP GSO, csum_offset would be quite useless
> but plain GSO also allows UDP as transport protocol, with different
> offset.
>
> UDP tunnel GSO, by definition, only allow UDP as the outer transport
> header.

Just make sure we are on the same page.

If I don't misread you, your point is that the csum_offset is implied
by gso_type. For example VIRTIO_NET_HDR_GSO_UDP_TUNNEL implies
csum.offset =3D=3D 6. If this is true, it is something that has been like
this. For example VIRTIO_NET_HDR_GSO_TCPV4 implies csum_offset =3D=3D 16.

>
> > > - give to the newly introduced fields couple the exact old semantic o=
f
> > > csum_start/csum_offset.
> > >
> > > I actually went through the exercise of implementing a working PoC on
> > > top of a previous revision of this proposal. AFAICT using
> > > csum_start/csum_offset for the outer csum will require a more complex
> > > and bug prone implementation then the alternative initially proposed
> > > here.
> > >
> > > > >
> > > > Exactly. My point is (I may miss something obvious) why should we c=
are
> > > > about mac header offset when we are doing segmentation? For the
> > > > content from outer payload start to inner transport start
> > > > (inner_csum_start), the device can just replicate without worrying
> > > > about what it has.
> > >
> > > The inner mac header offset is not needed for segmentation, it's need=
ed
> > > to rebuild correct GSO packets on the 'other end'.
> >
> > For "other end" did you mean the general device RX or the case of VM2VM=
?
>
> Let suppose the the device is transmitting an UDP tunnel GSO packet.
> With the "other end" I mean the driver receiving such packet. It must
> be able to fill all the sk_buff fields needed to properly segment later
> such packet, comprising inner_protocol, inner_mac_header,
> inner_network_header etc...

I guess we are talking about different things.

In a VM setup, the host can read those vnet headers. For example
virtio-net(VM1) -> tap1 -> bridge/OVS -> tap2 -> virtio-net(VM2), host
can simply map vnet header to skb medata back and forth, so those
inner fields could be seen by VM2's virtio-net driver.

But what I want to say is in the case of bare metal or hardware
virtio-net implementation. Machine1 (virtio-net) -> wire -> Machine
2(virtio-net). In this case the RX virtio-net can't see the vnet
header. If it wants to offer those inner fields, the only thing is
trying to parse the inner. And such kind of parsing will be hard to be
protocol independent. And if it's not protocol independent, we may end
up with compatibility issues for live migration.

Or actually, the F_GUEST_UDP_TUNNEL_GSO (and FOU?) is not something
that is expected to be implemented by hardware?

>
> > > E.g. when the device will transmits a UDP tunnel GSO packet, the driv=
er
> > > will need to be able to build a "correct" UDP tunnel GSO skbuff from
> > > the virtio net header.
> >
> > So this seems to require the device to parse the packet during RX and
> > fill the vnet header.
>
> ENOCOFFEE here?!? During RX a device should get the vnet header from
> the ring, right? so it's not going parse anything, just fetch the info
> from the vnet header.

See my reply above (it works for VM2VM/VM2Host).

>
>
> > > Such skbuff must includes both inner and outer header offsets, and in
> > > the general case (as described above e.g. for the FOU tunnels) we can=
't
> > > reconstruct the full inner headers info, even with parsing, without
> > > inner mac network header offset, inner network offset and inner
> > > protocol type.
> >
> > In the case of FOU, deivce doesn't know the inner protocol.
>
> Why? it actually should know it. The device has an UDP tunnel GSO
> packet, so whoever is transmitting it, should actually know all the
> relevant offsets and involved protocols, because it should be
> eventually able to S/W segment it.

I mean in the RX side of a hardware implementation of virtio-net.

>
> > > Lacking the inner offset, the skb will be corrupted by a later
> > > segmentation in the guest - if/when such thing will happen.
> >
> > Do you mean the case of GSO packet forwarding which might require
> > software segmentation? For plain GSO, we don't require inner
> > mac/nh/protocol in order to be forwarded or software segmented (or
> > maybe I miss something again).
>
> AFAICS skb_udp_tunnel_segment() unconditionally relies on skb-
> >inner_protocol and skb_inner_mac_header() for correct segmentation:
>
> https://elixir.bootlin.com/linux/latest/source/net/ipv4/udp_offload.c#L22
> https://elixir.bootlin.com/linux/latest/source/net/ipv4/udp_offload.c#L16=
6

I see. Two questions:

1) If we allow the dodgy UDP tunnel GSO packets, those fields need to
be validated
2) Is there any existing NIC that can do RX UDP tunneling GSO? Or can
we probe the inner stuff.

>
> > > >
> > > This question on my side sparked from the goal of reducing the
> > > virtio_net_header overhead. The idea is that a plain GSO packet will
> > > have the current layout (no extra fields) even when UDP tunnel GSO is
> > > negotiated.
> > >
> > > The new virtio_net_header layout (with outer transport, inner mac,
> > > inner net and inner proto type) could be used only when UDP tunnel GS=
O
> > > is negotiated _and_ 'gso_type' has the
> > > VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit set.
> > >
> > > This way supporting UDP tunnel GSO will not pay any overhead for plai=
n
> > > GSO.
> >
> > Ok.
>
> Does that mean that is ok to make the additional attributes presence
> conditional to the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit,

Yes, (just my thought).

> or just that the
> above sentence is clear?
>
> Thanks,
>
> Paolo

Thanks

>

