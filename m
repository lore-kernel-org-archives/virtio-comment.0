Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1208E1EB4A2
	for <virtio-comment@lists.linux.dev>; Thu,  1 Aug 2024 03:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722482384; cv=none; b=DllSN2ktUW/qFL+8SFYsA7DBGHzfJwZqAQxQi5y0FNjcZGDVmISDc7x6HujiDkrHCW2RF+Uohj0Y1gB07/W42GGbYNAbbF4NwW51RP06xWveXxzvSxxqyhYsqhKIBHrDE3cySbTfabdWb7mYc+vTJl7+M1mU6J2EL4uBrgAs6x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722482384; c=relaxed/simple;
	bh=5CNtoRxcJvgw1IzB0ftBkfiuz19ATLbG9shI4R4JRIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OJxjPKmNSi0vWFN8ZRalNd1qQCvQnCZ7b2WybXqBbhCrTDQxICodCo6j7hEjIZ+MCaHIObQIDIXQHJj8v9lEday37dtzmCtOJZHqj11nfVaLedewuw83Q8prosgiNjCUeTffE7b7SoZ381mF/VWP6cez6ogxOTN1nkBL72pykRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XISKq2mQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XISKq2mQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722482380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+1GU/nBg9g0gdymm/6tQk2SBiq6LKzbds819hj3km3M=;
	b=XISKq2mQdaokVsh0nYXqpwcpcwmCzkzVDdcNE5pW8tkocSAJvxede5XPIKd5pPW41iGynv
	icrGr5CMGLVy3VfnuPF10vzNSoEcypn0VsMM0heIF+wgLtgjwkY1UJ3IeNuPNna2+Yy21Z
	wzY5L67pPEVqE/Y2UUJcrO9PFdZp30Q=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-nEF8-dVQOqKUajjIpA2mQA-1; Wed, 31 Jul 2024 23:19:34 -0400
X-MC-Unique: nEF8-dVQOqKUajjIpA2mQA-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-7b04199911bso1641148a12.1
        for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 20:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722482373; x=1723087173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1GU/nBg9g0gdymm/6tQk2SBiq6LKzbds819hj3km3M=;
        b=I6NSalggn+Gvb3FU1XGCy69E4U8/wvqbG+Qb4/0+wKvLQr0wU2/vqsYUHzMk0WLmY/
         3oBdejZDJAoT3/dl0w5P8ZuMR7PvkpMydA/yHPGsLQA4eTKfn/WiRs4tBxVROw9CT4jY
         7UjyGqJmpyH4QrzV3rUCOq2DTnJHebXrY/xqEDZuw7TyPPX4MkzNKa7ZL2wCA+sRYzwq
         K48x9DjcsnDVYmitS1+CMcilgiknLOOqjbqyTQAK6RT/YwbSqathHEAC+Yf/STYGpMr3
         OKwuhzOgpSQ7N27S0m3mKE3QFn8UzVRj0V/zqAjFBz2zH4Hsab/cnh6y7RitHYfpgPVw
         tioA==
X-Forwarded-Encrypted: i=1; AJvYcCWJvtikz7td2436f2nks6IQJSlJhz409glfIJERGRXqO5LUWwd2gxuXJ6adRlyq7a0gwzcLjTzKkacp0MIg36Az7krLPFwOHs/oQdOFNNU=
X-Gm-Message-State: AOJu0YwTTLb9HGfRR7k2fwRWMOpX3XcG3DWqN6ORJmjKvUDBWkyE2PKd
	biC3Bg/+cbmocwUwEYvaXSE+RafiHVe/G63tchrglNLKxomlOyWMeEJF8wGWd+S1V4sXoU5NAZx
	kFvOO5RQ+EDq5aXlh+aSx47JpMGyqF+tl1sulf12zL/PYRbqtzm3pUZdAZAvZ0K1PQrdw8he2/N
	+UjSy9LCcVnSu++l9VTuoqMIfI2qG6rIjzzwqmlSc=
X-Received: by 2002:a17:90b:1c10:b0:2cb:56bd:5d7 with SMTP id 98e67ed59e1d1-2cfcaaaaf37mr2270213a91.5.1722482373086;
        Wed, 31 Jul 2024 20:19:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNr3bR4Zxrp6EoAxdiTrql1Lac44aP9j3MwbwtNjsLcXH0C7vJDdniwtyXz/7+qhUq5rYZ/7dsZYg9H72AgxY=
X-Received: by 2002:a17:90b:1c10:b0:2cb:56bd:5d7 with SMTP id
 98e67ed59e1d1-2cfcaaaaf37mr2270166a91.5.1722482372298; Wed, 31 Jul 2024
 20:19:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1722252302.git.pabeni@redhat.com> <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
 <CA+FuTSfu8Sys_s+3jpXoS0GbZC4stOVgBrEYOtA9YoTCEJkJAA@mail.gmail.com>
 <d79c4ed9-c1d5-4c9c-9f10-661745edf96c@redhat.com> <CACGkMEu6dnKOgYVYRWKadXirnk4R6Rc16ojNR=oSX-a22Rt4OA@mail.gmail.com>
 <CA+FuTScr26P+QtPfWKzD1zzadKiZ3zRs75KC1ycexdQRAQ0XuQ@mail.gmail.com>
 <56d62e5a-b7df-43f7-8878-517505345529@redhat.com> <CA+FuTScunTfXGzpEFEgZcv3FKSzVwSK0vhuO61a=Ui2HybTsJw@mail.gmail.com>
In-Reply-To: <CA+FuTScunTfXGzpEFEgZcv3FKSzVwSK0vhuO61a=Ui2HybTsJw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 1 Aug 2024 11:19:21 +0800
Message-ID: <CACGkMEs1NZ0VDipqb_n_+T8UqQEMqm0LKi3ZPCyzr7+OFeqz_w@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Willem de Bruijn <willemb@google.com>
Cc: Paolo Abeni <pabeni@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 2:22=E2=80=AFAM Willem de Bruijn <willemb@google.com=
> wrote:
>
> On Wed, Jul 31, 2024 at 1:32=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> w=
rote:
> >
> > On 7/31/24 16:25, Willem de Bruijn wrote:
> > > On Wed, Jul 31, 2024 at 12:11=E2=80=AFAM Jason Wang <jasowang@redhat.=
com> wrote:
> > >> On Tue, Jul 30, 2024 at 3:33=E2=80=AFPM Paolo Abeni <pabeni@redhat.c=
om> wrote:
> > >>> On 7/29/24 23:04, Willem de Bruijn wrote:
> > >>>>> @@ -423,6 +441,9 @@ \subsection{Device Operation}\label{sec:Devic=
e Types / Network Device / Device O
> > >>>>>            le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REP=
ORT negotiated)
> > >>>>>            le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REP=
ORT negotiated)
> > >>>>>            le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REP=
ORT negotiated)
> > >>>>> +        le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_T=
UNNEL_GSO negotiated)
> > >>>>> +        le16 inner_protocol_type;(Only if VIRTIO_NET_F_HOST_UDP_=
TUNNEL_GSO negotiated)
> > >>>>> +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_T=
UNNEL_GSO negotiated)
> > >>>>>    };
> > >>>>
> > >>>> In relation to the above: I recall that expanding the virtio_net_h=
dr
> > >>>> was non-trivial when I last tried to add fields ("[rfc,2/3]
> > >>>> virtio-net: support receive timestamp"). If that is the experience
> > >>>> again, it might be worthwhile to expand with enough space to also
> > >>>> accommodate a few subsequent extensions. Headroom is not that
> > >>>> expensive.
> > >>
> > >> Yes, but it looks like an independent issue for this.
> > >
> > > If this change requires new headroom, then it depends on headroom exp=
ansion.
> > >
> > > My suggestion is to then expand it significantly immediately, to mini=
mize the
> > > number of times we have to change the virtio_net code to support new =
lengths.
> > >
> > > We already have structs virtio_net_hdr, virtio_net_hdr_mrg_rxbuf,
> > > virtio_net_hdr_v1, virtio_net_hdr_v1_hash.
> > >
> > > Adding a new struct with every new field added just adds lots of chur=
n in
> > > the code.
> > >
> > > Just a thought, feel free to skip if the maintainers disagree.
> >
> > I just read the old thread WRT virtio net timestamping.
> >
> > If we reserve additional headroom space for timestamping here, such roo=
m
> > will be available only if UDP_TUNNEL is negotiated, which sounds a bit
> > counterintuitive to me.
> >
> > I *think* ideally we want a separate virtio net feature for that?
>
> Fair point. Agreed that extra headroom should not be dependent on this fe=
ature.
>
> > Regarding the virtio_net_hdr parsing complexity increase, I think we
> > should add to the uAPI a struct containing only the new fields, e.g. fo=
r
> > UDP tunnel:
> >
> > struct virtio_net_udp_tunnel {
> >         __virtio16 outer_th_offset;
> >         // eventually __virtio16 inner_protocol_type;
> >         __virtio16 inner_nh_offset;
> > };
> >
> > At feature negotiation time both the drivers and the device compute the
> > offset inside the virtio buffer where such struct is placed:
> >
> > if VIRTIO_NET_F_HASH_REPORT is negotiated such offset is sizeof(struct
> > virtio_net_hdr_v1_hash) elsewhere is sizeof(struct virtio_net_hdr_v1)
> >
> > At rx time, struct virtio_net_udp_tunnel() is parsed from the above off=
set.
> >
> > With all the above in place, for every additional later feature we add
> > just a struct definition and the virtio_net header parsing complexity
> > scales linearly.
>
> Sounds good to me.
>
> > >>> If we would have VIRTIO_NET_HDR_GSO_UDPv4_L4 and
> > >>> VIRTIO_NET_HDR_GSO_UDPv6_L4 variants, we could avoid entirely
> > >>> 'inner_protocol_type', as the network protocol will be implied by t=
he
> > >>> GSO type itself.
> > >
> > > But that's too late now? Probably don't want to make this work
> > > depending on such a change.
> > >
> > > I don't entirely recall why we did not do that immediately. Perhaps
> > > it is related to also only having SKB_GSO_UDP_L4.
> >
> > I reached the same conclusion here:
> >
> > https://lore.kernel.org/virtio-comment/cover.1722252302.git.pabeni@redh=
at.com/T/#mac694da6e907451d5529116a97510c940bf2edd9
> >
> > What about reserving an additional bit in gso_type to specify the inner
> > network header protocol?
>
> Similar to VIRTIO_NET_HDR_GSO_ECN?

I think so.

>
> Is that preferable over VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP4 and
> .._UDP_TUNNEL_IP6 variants?
>
> And to parsing just this one byte (or nibble) from packet data using
> inner_nh_offset?
>
> If it's the best of those options, no objections from me. Definitely
> no need for a u16 if the only options are IPPROTO_IP and IPPROTO_IPV6.
>

Exactly.

Thanks

