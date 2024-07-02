Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119FEBA3F
	for <virtio-comment@lists.linux.dev>; Tue,  2 Jul 2024 16:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719937520; cv=none; b=VKSzJcIJYGALTVuPmTQzllpgm4EJITcpvUHqIN83S2Jg6bxsHWdxyRUOOSav7LD8J76/iTbBUhdZSNV7GH281xyVlWbcS8943KKn8Ao9+LFlIMABAyZI84jFMjUMv1uXEI+ZGp5fADQ66m4ioqrLcpDX+mZ1+YwLzvgfYwKNs6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719937520; c=relaxed/simple;
	bh=YtF0QvGGPbP6+/69XSAkyRSNU1+Jk2pMK82oJzU1GOk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kUnkiTgjprqqgWmNKJGWwKEzm5r6AQOMKqEzqhuC5/0XqAi5uGr3WjiSlBInNK+K53++NcytjsjsI6oiRU2h/mdd8uBMlenq4Maji3sOdpfmx3tAC9FnNT6+np97gRjJId3yBMCYHex6C06yJpFYgkjc7/rnuLKhCQH++Iq4V4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RI+ZQ50p; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RI+ZQ50p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719937517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YuZ1dhEGfi/0Y7FBFSQjF9izI+QH3HpYqCL2WDR9mXM=;
	b=RI+ZQ50pwYrpvSODGEZ9v8kovjtayHthMGm368URoLB3zUBkL+P6lMFutRSmCJMu/F4nUk
	KHiyUVEidHlyEIPr3U3PbqeJJ95hLQTuZ5EgzH/SFw7QhZcG9Ernw6qYD3KXvgJD2HcTt6
	iqtGJI1An4kN72YMqPfivOmbUou9HtA=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-QJgwwziKPRKzr92CIDHCxg-1; Tue, 02 Jul 2024 12:25:16 -0400
X-MC-Unique: QJgwwziKPRKzr92CIDHCxg-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2ec67e2be29so9581831fa.1
        for <virtio-comment@lists.linux.dev>; Tue, 02 Jul 2024 09:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719937514; x=1720542314;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7E/HA0X+/TA4yPb67PVdOdkkdg2nrIuu522D9WeTm8=;
        b=hIR9rDW2ho8LFNtBy7RKZFks4FcDBdwe7tLZZgEcOqeQzrNzIrKV5WXc/0sIjBHAg3
         rl5VAt0NerdyeVh3DcCBd/FogCN9hCtL0f7OZyhh4I/n6b53ZTESfm/nOUDX1M6Wxhq/
         3L5ECrBlOsZ48uYPiOIicletgs7sa5Wv/FzRxYiF3f4uV6tTShrctn5e2f1qHaTGCPBg
         Ok6K9UCfymf3vVbse5tuiaB+zEWnf1Bz4UJLTdtn06gC0WwjDp2BPbZsT0iHJmQwefqJ
         I/NQLzqnU4YHGIeT0XHB5NUJaqbag1tEcCyM+LUlKPZfoWn9UFrYONtOmOjvCX/8RaoF
         r7bA==
X-Forwarded-Encrypted: i=1; AJvYcCVt4gHCKW82siK/ippZ3o7Kw9+1RhqIcG4zS3zH386yhLAxNlNZXcQ/vnVfkOlQqqcQf8EwTR6SuQ1Xe2MhTaIWLJVZ9MghrC+5DoECFyw=
X-Gm-Message-State: AOJu0YxjKLyrSqLLG3f9yPZsHq3RTxZXLcTR6HRO8P4L2XKUb4EyWxqH
	BAoWunfLZofYpACEj7zI5/ACm/RgBnJT1yk7a2rnPrrh/Fi7YHLpRrbypWGSpqeWmtkEsDlMcFd
	Gw8g2wPZKEFwmsK2+YncetrUZ29bsAz7Tbu+ceEJz6yMFtZacQind1tVqkD6CBpth
X-Received: by 2002:a05:651c:210d:b0:2eb:e6fe:3092 with SMTP id 38308e7fff4ca-2ee5e6cd8ebmr69144531fa.4.1719937514345;
        Tue, 02 Jul 2024 09:25:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIcT4pnI/rshMyZPRQHfFw4zTcaPsBQIx+6zbMtVzsPX2Us5QLzRIvtaKy6dnLltAOoW/cDg==
X-Received: by 2002:a05:651c:210d:b0:2eb:e6fe:3092 with SMTP id 38308e7fff4ca-2ee5e6cd8ebmr69144231fa.4.1719937513806;
        Tue, 02 Jul 2024 09:25:13 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3341:b0a6:6710::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b098b4dsm206163295e9.29.2024.07.02.09.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 09:25:13 -0700 (PDT)
Message-ID: <5914dd3b40bca9ca0a49aa31845a2bda49c862c2.camel@redhat.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, Stefano
	Garzarella <sgarzare@redhat.com>, Michael Tsirkin <mst@redhat.com>
Date: Tue, 02 Jul 2024 18:25:11 +0200
In-Reply-To: <CACGkMEu_ODQV6O5-w6Hzg5gk-8x_iRsuWSk4fN2vzznPEYKphg@mail.gmail.com>
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
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2024-07-02 at 14:50 +0800, Jason Wang wrote:
> On Mon, Jul 1, 2024 at 5:23=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>=20
> > Still we need some more info to correctly locate the outer transport
> > header and the checksum, without resorting to header parsing. Thus the
> > additional field.
>=20
> Maybe the "parsing" is something that causes confusion. If I
> understand it correctly, you meant "driver parsing" here on the rx
> side. Unfortunately, for plain (non-tunnel) GSO, csum_start and
> csum_offset is necessarily set (e.g in the case of
> VIRTIO_NET_F_DATA_VALID/CHECKSUM_UNNECESSARY), so the driver needs to
> probe them. For example, Linux driver has this in
> virtio_net_hdr_to_skb():
>=20
>                 /* gso packets without NEEDS_CSUM do not set transport_of=
fset.
>                  * probe and drop if does not match one of the above type=
s.
>                  */
>                 if (gso_type && skb->network_header) {
>                         struct flow_keys_basic keys;
>                         ...

This is the kind of things I suppose we wont to avoid.

The current proposal does not specify it, but I guess we can require
inner checksum offload as a pre-req for UDP tunnel GSO support, and
avoid a bunch of edge cases.

> > > For tunnel GSO, this proposal introduces:
> > >=20
> > > inner_protocol: inner ethernet type
> > > inner_mac_offset: inner mac header
> > > inner_nh_offset: inner network header
> > >=20
> > > This gives me the impression that the tunnel GSO (at least the inner
> > > part) wants to be protocol independent. This is fine but I don't full=
y
> > > understand why the above is needed. For example, why do we need to
> > > know about the inner_protocol?
> >=20
> > in some tunnel protocols e.g. geneve, the inner mac header is not
> > included. In such case, inner_mac_offset =3D=3D inner_nh_offset.
>=20
> I may miss something but geneve seems to have a inner mac according to:
>=20
> https://datatracker.ietf.org/doc/html/rfc8926#section-3-1

That is just one of the possible geneve layout. Geneve also allows
specifying an 0x0800 protocol type, omit the ethernet header and put
the inner ipv4 just after the geneve header itself.

> > Specifically in the geneve case the inner protocol can be obtained
> > parsing the geneve header itself.
>=20
> Yes.

still we wont to avoid such parsing, I guess and hope???

> > Other UDP tunnel protocols (e.g. FOU), does not carry the inner header
> > and additionally the inner protocol type is not specified on the wire,
> > (is configured on the control plane) so there is no way to extract it
> > with parsing.
>=20
> I think if this proposal wants to support the case where there's no
> encapsulation header, we probably need to clarify it somewhere.
> (Otherwise readers may assume there's an encapsulation protocol like
> geneve).
>=20
> But in the case of FOU. If the control plane has mapped the port to a
> specific protocol on the rx side. I don't know how the inner_protocol
> can help in any place.

AFAICT whoever is sending (and building) the UDP tunnel GSO packet over
such tunnel protocol knows the inner header offset and inner protocol
type. It just need to put them in the virtio net header.

> > Using all the above 3 fields allow covering all the above use-cases.
>=20
> Maybe you can give me an example for this.

I probably misread your question, but it should be something alike:

static inline int virtio_net_hdr_to_skb(...)
{
=09...
=09=09if (hdr->gso_type & VIRTIO_NET_HDR_GSO_UDP_TUNNEL) {
=09=09=09skb->inner_mac_header =3D __virtio16_to_cpu(little_endian, hdr->in=
ner_mac_offset);
=09=09=09skb->inner_network_header =3D __virtio16_to_cpu(little_endian, hdr=
->inner_nh_offset);
=09=09=09skb->inner_protocol =3D __virtio16_to_cpu(little_endian, hdr->inne=
r_protocol);
=09=09=09...

> > >=20
> > That csum field will need different handling WRT the inner one - as the
> > outer csum is optional.
> >=20
> > If we use csum_start/csum_offset for the _outer_ csum, we will need to:
> > - introduce additional inner_csum_start/inner_csum_offset to cope with
> > the inner transport header csum.
>=20
> Yes, this seems straightforward.
>=20
> > - change the semantic of existing csum_start/csum_offset to cope with
> > optional csum. csum_offset will carry no useful information, as it will
> > be always be constant '6'.
>=20
> We probably don't need to worry about this. For example, for TSO it
> would always be 16? And spec has something like
>=20
> "
> For example, consider a partially checksummed TCP (IPv4) packet. It
> will have a 14 byte ethernet header and 20 byte IP header followed by
> the TCP header (with the TCP checksum field 16 bytes into that
> header). csum_start will be 14+20 =3D 34 (the TCP checksum includes the
> header), and csum_offset will be 16
> "

If virtio would allow only TCP GSO, csum_offset would be quite useless
but plain GSO also allows UDP as transport protocol, with different
offset.

UDP tunnel GSO, by definition, only allow UDP as the outer transport
header.

> > - give to the newly introduced fields couple the exact old semantic of
> > csum_start/csum_offset.
> >=20
> > I actually went through the exercise of implementing a working PoC on
> > top of a previous revision of this proposal. AFAICT using
> > csum_start/csum_offset for the outer csum will require a more complex
> > and bug prone implementation then the alternative initially proposed
> > here.
> >=20
> > > >=20
> > > Exactly. My point is (I may miss something obvious) why should we car=
e
> > > about mac header offset when we are doing segmentation? For the
> > > content from outer payload start to inner transport start
> > > (inner_csum_start), the device can just replicate without worrying
> > > about what it has.
> >=20
> > The inner mac header offset is not needed for segmentation, it's needed
> > to rebuild correct GSO packets on the 'other end'.
>=20
> For "other end" did you mean the general device RX or the case of VM2VM?

Let suppose the the device is transmitting an UDP tunnel GSO packet.
With the "other end" I mean the driver receiving such packet. It must
be able to fill all the sk_buff fields needed to properly segment later
such packet, comprising inner_protocol, inner_mac_header,
inner_network_header etc...

> > E.g. when the device will transmits a UDP tunnel GSO packet, the driver
> > will need to be able to build a "correct" UDP tunnel GSO skbuff from
> > the virtio net header.
>=20
> So this seems to require the device to parse the packet during RX and
> fill the vnet header.=C2=A0

ENOCOFFEE here?!? During RX a device should get the vnet header from
the ring, right? so it's not going parse anything, just fetch the info
from the vnet header.


> > Such skbuff must includes both inner and outer header offsets, and in
> > the general case (as described above e.g. for the FOU tunnels) we can't
> > reconstruct the full inner headers info, even with parsing, without
> > inner mac network header offset, inner network offset and inner
> > protocol type.
>=20
> In the case of FOU, deivce doesn't know the inner protocol.=C2=A0

Why? it actually should know it. The device has an UDP tunnel GSO
packet, so whoever is transmitting it, should actually know all the
relevant offsets and involved protocols, because it should be
eventually able to S/W segment it.

> > Lacking the inner offset, the skb will be corrupted by a later
> > segmentation in the guest - if/when such thing will happen.
>=20
> Do you mean the case of GSO packet forwarding which might require
> software segmentation? For plain GSO, we don't require inner
> mac/nh/protocol in order to be forwarded or software segmented (or
> maybe I miss something again).

AFAICS skb_udp_tunnel_segment() unconditionally relies on skb-
>inner_protocol and skb_inner_mac_header() for correct segmentation:

https://elixir.bootlin.com/linux/latest/source/net/ipv4/udp_offload.c#L22
https://elixir.bootlin.com/linux/latest/source/net/ipv4/udp_offload.c#L166

> > >=20
> > This question on my side sparked from the goal of reducing the
> > virtio_net_header overhead. The idea is that a plain GSO packet will
> > have the current layout (no extra fields) even when UDP tunnel GSO is
> > negotiated.
> >=20
> > The new virtio_net_header layout (with outer transport, inner mac,
> > inner net and inner proto type) could be used only when UDP tunnel GSO
> > is negotiated _and_ 'gso_type' has the
> > VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit set.
> >=20
> > This way supporting UDP tunnel GSO will not pay any overhead for plain
> > GSO.
>=20
> Ok.

Does that mean that is ok to make the additional attributes presence
conditional to the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit, or just that the
above sentence is clear?

Thanks,

Paolo

