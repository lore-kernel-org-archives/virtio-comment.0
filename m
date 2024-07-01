Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718035C614
	for <virtio-comment@lists.linux.dev>; Mon,  1 Jul 2024 09:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719825797; cv=none; b=hhZA3yUQBe/L8UQxfgm+E7/enirKEBG9cfopB46oXoVP2NhPjfw+sNNqORngIK4GDjGz8z6dSZNjdvkNaMaNIKejFKkKWwfNj09OkLixt0KCgn00n09TpX5Gafxmi6AfXixnPi4UVt09pTijWpc7AJ0ZrlAb0TWq11H9/0RGbl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719825797; c=relaxed/simple;
	bh=1dtJMKHegoNyJSR7DqI+VLJYSCYxDHZZnaiyvpryeq8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r/BprgoBMyd1qxeCK9MFrQNdxhzg0iSnF7lxCAdQ/lyfgKiaNKiKXdOxIIZBm+hG0/tGxKYjRAvz6C829GFkKSwEoeoc9t4nIEF5uTX8ebPOpYJowo79DpLZSxlodUTsprtD9O7ofyp6RlVQb5UCPG+/riCdqtGL3ZmWK0QUK3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WXvDSTxF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WXvDSTxF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719825794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1dtJMKHegoNyJSR7DqI+VLJYSCYxDHZZnaiyvpryeq8=;
	b=WXvDSTxFK8cYvsC+odv8yfgOJCDPGL59cqs+HcdrNXZqJJdppGmksvk6TbuP0Q+T13pcyr
	IJ95Ak3vchuwkNezMgEYB3II7yWQqrrD8d3fi7jc2yCRkarxZr7XUE4LaMAb632bZAR8Go
	j7dzmUgb2H7CUPOnmg8NLh6mf1khWg8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-hoKX1nR7ODW5vCvP07DSWw-1; Mon, 01 Jul 2024 05:23:10 -0400
X-MC-Unique: hoKX1nR7ODW5vCvP07DSWw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-363e506bf56so629855f8f.2
        for <virtio-comment@lists.linux.dev>; Mon, 01 Jul 2024 02:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719825789; x=1720430589;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1dtJMKHegoNyJSR7DqI+VLJYSCYxDHZZnaiyvpryeq8=;
        b=wFzfq3ivEO3NWSvspZQ795mjWgDo4lzNudS6G8PvMoTGj7nYc7KQyjBYU0H2u3GzQj
         VRFym66IW0BtOjuT9fKzuRPdLXcyiK6araHAntH+y6yEY5EleykzGtUo1urX23Eht4Qy
         QssQNr2tuj3vqSZ3HNaXuyGnEnG7Kzq6snMWiSm7vIGY0j2LeK4Q0a9Hi9ZCv5jtCKxr
         vHNbr/ixC6jvXVgnKgmV24nbWsEc/nu/OYAue1Cxa33GyWFREjwJvXk/3/C9U4ZGbW1e
         FBpF1j7eToq2lTuTKSMBGR+9Y0z3ucU6Nt8o8tw/LwR2Y19+AYqVwAIN7zIjUgf9lSPU
         SWtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyEc1M3d/Q/WTpPfzwdJXrTv/EbPCfChBTWS2fGYuerabno0EmOE9nIS9uHvYRb+nz10nMwiLIxt70rm36y2Vgar4jicP3JVQmC/MG1gI=
X-Gm-Message-State: AOJu0YwLxEaj3g3VUR7iqySMqUWCKU/9aVs2q5QDnO45Dy0CKPM0trHP
	H2puMD+j9cHzxSYuuXLZMMTb69wf2LjrHiaP/uOvi6TIDvwhY117mK+oz5cFkaiNbl4b9Nkx/vi
	Mr6t91TuiusyoAv/j/WGABM5fa6zXqrOwIG84PI8rxo7lRV4aN7iEx6TGfGD+kBAR
X-Received: by 2002:a05:600c:4848:b0:425:7ac6:96f7 with SMTP id 5b1f17b1804b1-4257ac69876mr33175115e9.0.1719825789109;
        Mon, 01 Jul 2024 02:23:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHudvE2LNDiN2pA93Y80odTzxN2K0bPcDmgnejqVcoUpOJ0qm2iEQp2Lkbjx15HMrKqOt9d/w==
X-Received: by 2002:a05:600c:4848:b0:425:7ac6:96f7 with SMTP id 5b1f17b1804b1-4257ac69876mr33174955e9.0.1719825788680;
        Mon, 01 Jul 2024 02:23:08 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3344:2451:6610:7695:150b:6fd2:fdc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fc412sm9546881f8f.70.2024.07.01.02.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 02:23:08 -0700 (PDT)
Message-ID: <4497c727ea6cc696ba7d60bcb95ba9bce33f1136.camel@redhat.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, Stefano
	Garzarella <sgarzare@redhat.com>, Michael Tsirkin <mst@redhat.com>
Date: Mon, 01 Jul 2024 11:23:06 +0200
In-Reply-To: <CACGkMEv9gGrLO0OkHYKmjqrLw50kfm2yaifMk1wnb6noa5L99w@mail.gmail.com>
References: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
	 <CACGkMEt-Ep+At_4YvkJ2t8UmQHJ0-Qm6fAPbGpkV_AfVyNq2EA@mail.gmail.com>
	 <ed07e9bb9ae5bc1a171c77425cc0b96e6b87745c.camel@redhat.com>
	 <CACGkMEvD_WDN5yeRKcZ2ijRF8C2_Pmr6UZWMNt+_R6S0WHY5Fg@mail.gmail.com>
	 <e5d885e6331b18b3be63facfd59658b316f20de1.camel@redhat.com>
	 <CACGkMEsbiN90ptOL2XHauzWS=9j5RXtnO7OD10yChPaUO3CY_A@mail.gmail.com>
	 <2f1c19591ff456ada2a1ad470032d3e3fb9f88d7.camel@redhat.com>
	 <CACGkMEv9gGrLO0OkHYKmjqrLw50kfm2yaifMk1wnb6noa5L99w@mail.gmail.com>
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

On Mon, 2024-07-01 at 11:02 +0800, Jason Wang wrote:
> On Fri, Jun 28, 2024 at 5:51=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> w=
rote:
>=20
> > I think that is quite
> > a different thing: such offload was added when the
> > csum_start/csum_offset field already existed, I guess it was far easier
> > to reuse the virtio net header as is, instead of _deleting_ an unused
> > field for that specific gso type?!?
>=20
> We probably don't need to delete it. We can just leave it unused if
> it's the case.

I think the starting question on your side was about cum_start and
csum_offset for the (outer) header checksum instead of using a new for
that goal as initially proposed here.

I read your previous message as you considered VIRTIO_NET_HDR_GSO_UDP
and VIRTIO_NET_HDR_GSO_UDP_L4 a prior art about handling a similar
case.

My point is that VIRTIO_NET_HDR_GSO_UDP and VIRTIO_NET_HDR_GSO_UDP_L4
were not a similar case, as when such offload where added,
virtio_net_header already included all the fields necessary to support
checksum offload for such GSO, while with UDP tunnel GSO we need to
support the inner header checksum as for plain GSO and an _additional_
csum for the outer transport header.

> > To do UDP tunnel GSO we need new fields. Do I understand correctly that
> > there is concern about adding "too much" new fields?
>=20
> Nope, I just want to know the reason why those fields were not
> required for non-tunnel GSO.

With plain (non-tunnel) GSO we need to offload a single checksum.

With UDP tunnel GSO there are 2 separate checksums the device or the
driver possibly need to offload: the inner transport header checksum
and the outer transport header checksum.=C2=A0

The latter header is always an UDP one, and the checksum there is
optional - UDP GSO packets can have 0 csum there. Side note: that is
different from UDP_L4, which always requires non zero csum for the such
UDP csum.

Using the existing csum_fields for the inner transport header works
nicely, as it does not change such fields semantic nor handling, and
does not waste the (variable) offset information.

Still we need some more info to correctly locate the outer transport
header and the checksum, without resorting to header parsing. Thus the
additional field.

> For tunnel GSO, this proposal introduces:
>=20
> inner_protocol: inner ethernet type
> inner_mac_offset: inner mac header
> inner_nh_offset: inner network header
>=20
> This gives me the impression that the tunnel GSO (at least the inner
> part) wants to be protocol independent. This is fine but I don't fully
> understand why the above is needed. For example, why do we need to
> know about the inner_protocol?

in some tunnel protocols e.g. geneve, the inner mac header is not
included. In such case, inner_mac_offset =3D=3D inner_nh_offset.
Specifically in the geneve case the inner protocol can be obtained
parsing the geneve header itself.

Other UDP tunnel protocols (e.g. FOU), does not carry the inner header
and additionally the inner protocol type is not specified on the wire,
(is configured on the control plane) so there is no way to extract it
with parsing.

Using all the above 3 fields allow covering all the above use-cases.

>=20
> > AFAICT using csum_start for the outer csum will be a bad choice as we
> > will need to change the handling of such field depending on the
> > gso_type and the s/w implementation will be more complex and likely
> > more bug prone.
>=20
> Not sure I understand here, but I'm not sure if it's too late to
> change that. As stated, we may introduce a new robust GSO to replace
> it anyhow.

Please see the comments above WRT the outer csum handling. At this
point I suspect we are not on the same page. We need a new field to
support the _additional_, outer csum offload carried by UDP GSO
packets.=C2=A0

That csum field will need different handling WRT the inner one - as the
outer csum is optional.

If we use csum_start/csum_offset for the _outer_ csum, we will need to:
- introduce additional inner_csum_start/inner_csum_offset to cope with
the inner transport header csum.
- change the semantic of existing csum_start/csum_offset to cope with
optional csum. csum_offset will carry no useful information, as it will
be always be constant '6'.
- give to the newly introduced fields couple the exact old semantic of
csum_start/csum_offset.

I actually went through the exercise of implementing a working PoC on
top of a previous revision of this proposal. AFAICT using
csum_start/csum_offset for the outer csum will require a more complex
and bug prone implementation then the alternative initially proposed
here.

> >=20
> Exactly. My point is (I may miss something obvious) why should we care
> about mac header offset when we are doing segmentation? For the
> content from outer payload start to inner transport start
> (inner_csum_start), the device can just replicate without worrying
> about what it has.

The inner mac header offset is not needed for segmentation, it's needed
to rebuild correct GSO packets on the 'other end'.

E.g. when the device will transmits a UDP tunnel GSO packet, the driver
will need to be able to build a "correct" UDP tunnel GSO skbuff from
the virtio net header.=C2=A0

Such skbuff must includes both inner and outer header offsets, and in
the general case (as described above e.g. for the FOU tunnels) we can't
reconstruct the full inner headers info, even with parsing, without
inner mac network header offset, inner network offset and inner
protocol type.

Lacking the inner offset, the skb will be corrupted by a later
segmentation in the guest - if/when such thing will happen.

> > I don't understand the point 2) above. We need some new fields to carry
> > the information need for UDP tunnel GSO. How that relates to the
> > protocol independence? We need such fields regardless of the protocol,
> > unless we want to resort to parsing all the way from the outer mac to
> > the inner transport.
>=20
> I think we're talking about the same thing, try to avoid unnecessary
> parsing. So I mean, we don't need to parse from outer transport
> payload start to inner csum_start. That's why I don't get why we need
> inner_mac/nh/ether_type.

At this point I'm unsure if I made it clear why we actually need the
mentioned fields.

> >=20
>=20
>=20
>=20
> > can the virtio net header layout be 'gso_type'
> > dependent?
>=20
> I don't get this question. Did you mean a completely new header format
> other than the current one? I think the answer is yes if it has
> sufficient justification but it requires a new feature.

This question on my side sparked from the goal of reducing the
virtio_net_header overhead. The idea is that a plain GSO packet will
have the current layout (no extra fields) even when UDP tunnel GSO is
negotiated.

The new virtio_net_header layout (with outer transport, inner mac,
inner net and inner proto type) could be used only when UDP tunnel GSO
is negotiated _and_ 'gso_type' has the=20
VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit set.

This way supporting UDP tunnel GSO will not pay any overhead for plain
GSO.

>=20
Cheers,

Paolo

