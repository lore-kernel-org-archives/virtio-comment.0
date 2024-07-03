Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB484282E1
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 16:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720024382; cv=none; b=QyRFXXa1g2nOyEmWv8vJ77EiiNIGXeYdnDEagvsbijYLMlUpOpa5Sx5OLYd7geks5vA7AT+pZx46IsRmlY2S4jC+mkR7UdMcgzfqMiyJgnVJKEgmJ4GzeeXpTXFob+q9ncyMGv2vQNfiUXp2gFN8s5tt9EGS6buFn24qiqZN9qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720024382; c=relaxed/simple;
	bh=5yquLvbUcnnAHz3HcO5pbQKfB255WcIdvcVHH8FTdaQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o6vkZIYZ7+RjgNtb02xl9+kHqI2q7/GTqbEzZF5GHdGUU1Ezui233RhKP7vBdPSJ0RIwifFTuD27ejX+fHHiJldkIOuA5ZBgVdi7OEP/yUrwPOnsshbW5vURhD9w6eASnCrqN4NHykchEw8ZTfHpF01TLrfaSA3gynqjjWZIBzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HuEkQWa/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HuEkQWa/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720024379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5yquLvbUcnnAHz3HcO5pbQKfB255WcIdvcVHH8FTdaQ=;
	b=HuEkQWa/Qze8zSj3nWchlKps4LKUz5w+vB1C/+ZVdMbB+PSX7ZiJzf7t9oYazzdtkAC0RA
	JudecVhQsF+0GP0we7X0MMEXZPu5Yat9XRjQ4T/16pPhgkGy9/uILwMxahncP+9Jz3fdvO
	WOSNsVftIN1pwdmvrehd1zxn4NJH4Xk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-FEaGTQbzPfuhjnWPgZ63GQ-1; Wed, 03 Jul 2024 12:32:58 -0400
X-MC-Unique: FEaGTQbzPfuhjnWPgZ63GQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-36794dc56b5so179794f8f.2
        for <virtio-comment@lists.linux.dev>; Wed, 03 Jul 2024 09:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720024377; x=1720629177;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5yquLvbUcnnAHz3HcO5pbQKfB255WcIdvcVHH8FTdaQ=;
        b=TRMxGYPhycZl27zoliai/IYgidOA8jws/p9fJ5Fc0oLxUDoiNNypkJGZ1AnnhhqWee
         lDDEbfLeb0NoGKmCYppMw8b5UNKFV8rDbI1YCYmNtiaxfxDYxSR2UsdwgR+60N/szrSd
         zkCWoeUkKZI+3AUo3SUQ44xzK2Aa4ZcqLLzB/wnyiZlva2Dkq4C9YkIX8OWf1reJ56vx
         CR0sApRQN3Li6FwGXvdmSv5rn/ILzdVpjHyjYkdXFPgUknMpKYmnHqP2OlX0dEGYD2DP
         sldgGSld4j291jsoBwk5dYAguDHGQb6SXMXMvrPXADaSxOZGwAetUXdgp3zFtelOeY14
         XJUg==
X-Forwarded-Encrypted: i=1; AJvYcCUcGCP0Ljt69NOtg9EE5SPYUoM3sWbYM5GQqU/cye6yJkp9ufw3VKfE/OabJv1PrUdhJIbt2ZjceJY6c6tuZLL/dSbgo9E3Cx/ZuABxlQA=
X-Gm-Message-State: AOJu0YyQLNMMHsKhuPoKH0J9GIdKkfMRdxp0m3gzIOwnlvSoHeopefuE
	navL5QVNOUL78Gl53FZg8PbFweiSuwCnJlazJWFBC8M4n2yIvay4Yv1WZxwVK6NBxHqH4ANs7km
	95NGRHiCzqo2XzzIzZxsNYkLbhmxKflfCJT36ZbiDNB91XJmfMZVjWxTACI4r8HGw
X-Received: by 2002:a05:600c:4fd3:b0:422:78c:82f6 with SMTP id 5b1f17b1804b1-4257a0df29dmr88923465e9.3.1720024377295;
        Wed, 03 Jul 2024 09:32:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgeHHDB/+m8B1RyoYgkmACReV4SyJYPD6dzFYFH5TQQ0cj3r9Tb5QQU281R7oKTizZkTAZIw==
X-Received: by 2002:a05:600c:4fd3:b0:422:78c:82f6 with SMTP id 5b1f17b1804b1-4257a0df29dmr88923365e9.3.1720024376867;
        Wed, 03 Jul 2024 09:32:56 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3344:172b:1510::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af5b61bsm246806795e9.17.2024.07.03.09.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:32:56 -0700 (PDT)
Message-ID: <ead6fe1f23295906b7239cf946d51762132b29de.camel@redhat.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, Stefano
	Garzarella <sgarzare@redhat.com>, Michael Tsirkin <mst@redhat.com>
Date: Wed, 03 Jul 2024 18:32:54 +0200
In-Reply-To: <CACGkMEtun+4xhh1s6o8kEnGGg4gvVS2ocuUr2yvubTNQqGcNkw@mail.gmail.com>
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

On Wed, 2024-07-03 at 10:34 +0800, Jason Wang wrote:

> > > > Other UDP tunnel protocols (e.g. FOU), does not carry the inner hea=
der
> > > > and additionally the inner protocol type is not specified on the wi=
re,
> > > > (is configured on the control plane) so there is no way to extract =
it
> > > > with parsing.
> > >=20
> > > I think if this proposal wants to support the case where there's no
> > > encapsulation header, we probably need to clarify it somewhere.
> > > (Otherwise readers may assume there's an encapsulation protocol like
> > > geneve).
> > >=20
> > > But in the case of FOU. If the control plane has mapped the port to a
> > > specific protocol on the rx side. I don't know how the inner_protocol
> > > can help in any place.
> >=20
> > AFAICT whoever is sending (and building) the UDP tunnel GSO packet over
> > such tunnel protocol knows the inner header offset and inner protocol
> > type. It just need to put them in the virtio net header.
>=20
> The virtio net header is not sent on the wire, imagine two hardware
> implementations of virtio-net trying to send FOU. How can the rx side
> of hardware virtio-net know about that?

If the device does not support H/W GRO for for TCP/UDP over FOU tunnel
(I guess almost every H/W will belong to this category) there is no
need to fill the extended attribute.

If the device somewhat implements such support (e.g. by virtue of some
configuration associating a given UDP port to FOU, and a given inner
protocol type), to be able to aggregate the packets and updated the GSO
packet 'len' fields in the various header, the device actually use such
information, and thus can insert them in the virtio_net_header.

FTR I really don't think anybody is interested in FOU H/W GRO support;)

> > >=20
> Just make sure we are on the same page.
>=20
> If I don't misread you, your point is that the csum_offset is implied
> by gso_type. For example VIRTIO_NET_HDR_GSO_UDP_TUNNEL implies
> csum.offset =3D=3D 6. If this is true, it is something that has been like
> this. For example VIRTIO_NET_HDR_GSO_TCPV4 implies csum_offset =3D=3D 16.

My point was about avoid adding a to virtio_net_header a field that
carries no additional information. I actually underlooked the fact that
virtio could have avoided introducing csum_offset for TCPV{4,6},UDP_L4
cases.

> > > > - give to the newly introduced fields couple the exact old semantic=
 of
> > > > csum_start/csum_offset.
> > > >=20
> > > > I actually went through the exercise of implementing a working PoC =
on
> > > > top of a previous revision of this proposal. AFAICT using
> > > > csum_start/csum_offset for the outer csum will require a more compl=
ex
> > > > and bug prone implementation then the alternative initially propose=
d
> > > > here.
> > > >=20
> > > > > >=20
> > > > > Exactly. My point is (I may miss something obvious) why should we=
 care
> > > > > about mac header offset when we are doing segmentation? For the
> > > > > content from outer payload start to inner transport start
> > > > > (inner_csum_start), the device can just replicate without worryin=
g
> > > > > about what it has.
> > > >=20
> > > > The inner mac header offset is not needed for segmentation, it's ne=
eded
> > > > to rebuild correct GSO packets on the 'other end'.
> > >=20
> > > For "other end" did you mean the general device RX or the case of VM2=
VM?
> >=20
> > Let suppose the the device is transmitting an UDP tunnel GSO packet.
> > With the "other end" I mean the driver receiving such packet. It must
> > be able to fill all the sk_buff fields needed to properly segment later
> > such packet, comprising inner_protocol, inner_mac_header,
> > inner_network_header etc...
>=20
> I guess we are talking about different things.
>=20
> In a VM setup, the host can read those vnet headers. For example
> virtio-net(VM1) -> tap1 -> bridge/OVS -> tap2 -> virtio-net(VM2), host
> can simply map vnet header to skb medata back and forth, so those
> inner fields could be seen by VM2's virtio-net driver.
>=20
> But what I want to say is in the case of bare metal or hardware
> virtio-net implementation. Machine1 (virtio-net) -> wire -> Machine
> 2(virtio-net). In this case the RX virtio-net can't see the vnet
> header. If it wants to offer those inner fields, the only thing is
> trying to parse the inner. And such kind of parsing will be hard to be
> protocol independent. And if it's not protocol independent, we may end
> up with compatibility issues for live migration.

To be able to do H/W GRO for e.g. TCP over UDP tunnel, the device must
be able to parse the tunnel protocol. The same way it should be able to
parse up to L4 for the plain TCP H/W GRO case.

Anyway if a device can't perform H/W GRO it will send to the driver non
GSO packet. It will not need to fill any fields for that.

Let's suppose we have to host with H/W virtio net support, both
exposing F_GUEST_UDP_TUNNEL_GSO, host1 can do geneve H/W GRO, host2
can't. I don't see migration issues between host1 and host2. The latter
will not generate any UDP TUNNEL GSO packet for geneve, but will send
to the driver plain packets, as on the wire.

What I'm missing?

Note that to do TSO for geneve packets the driver don't need to do any
parsing.

> Or actually, the F_GUEST_UDP_TUNNEL_GSO (and FOU?) is not something
> that is expected to be implemented by hardware?

I guess H/W GRO for UDP tunnel will be rare. Note that the H/W can
implement H/W GRO only for a limited set of the UDP tunnels protocols.

> > >=20
> > > > Lacking the inner offset, the skb will be corrupted by a later
> > > > segmentation in the guest - if/when such thing will happen.
> > >=20
> > > Do you mean the case of GSO packet forwarding which might require
> > > software segmentation? For plain GSO, we don't require inner
> > > mac/nh/protocol in order to be forwarded or software segmented (or
> > > maybe I miss something again).
> >=20
> > AFAICS skb_udp_tunnel_segment() unconditionally relies on skb-
> > > inner_protocol and skb_inner_mac_header() for correct segmentation:
> >=20
> > https://elixir.bootlin.com/linux/latest/source/net/ipv4/udp_offload.c#L=
22
> > https://elixir.bootlin.com/linux/latest/source/net/ipv4/udp_offload.c#L=
166
>=20
> I see. Two questions:
>=20
> 1) If we allow the dodgy UDP tunnel GSO packets, those fields need to
> be validated

I guess virtio_net can validate them when building the skb:

outer_transport offset < inner_mac_offset=C2=A0

inner_mac_offset =3D=3D inner_network_offset &
inner_mac_offset + 14 =3D=3D inner_network_offset

protocol_type in [IPv4, IPv6, TEB]
...

> 2) Is there any existing NIC that can do RX UDP tunneling GSO?

AFAICS, the only NICs supporting HW GRO for UDP tunnel packet use the=20
bnxt driver. and think the implementation is buggy (it does not
set/fill must sk_buff fields).


> Or can we probe the inner stuff.

Could you please re-phrase this part?


Thanks!

Paolo

