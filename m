Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E831E868
	for <virtio-comment@lists.linux.dev>; Thu,  1 Aug 2024 03:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722481309; cv=none; b=uOp3KcPiD2eQiCFJV1Ty6kQCMGKUKupiu145++3qnm5BUlBhoaboFY6A295XPnmoWixA6faMdazaoDm8kEagKKLsvlJ3tgBetBqq6pjH8dcTt7xqz1h/vMTm6L2gL8Vi+iFqrXubPg6ycEsbKIkt5BIpiKPaB+95JhwsMRk6FZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722481309; c=relaxed/simple;
	bh=gNa8dH8TcdHEHSQuqAoF63cIuYgXPsMnfKSUuYBQRYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tiF0EGRLpYuUyzef3Tp0MfNsYSt1mkTVkpCwymRPnwDW7dvOGM4IzRd00I4f8O7cWEWHd5RIgyTnsucz9i48w7WiwEveYa+qcZP4owLaVOLeg14VrvV9BIvWKJcdSa6Z/npQ+aGOkkdDfVCpxrpGJHyRyH1yduR+YD2zfxt/wxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VczOAo3T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VczOAo3T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722481302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZQqi8Rlj8p2YzhXekA+GMcnKbqaZuag13vj8ljtfWo=;
	b=VczOAo3TMleu4fwLGpPDzaTzafCFLi+GGIBijNNrEjrmo5iJcB/X4TFxEiTzI9lewZsKfP
	rztdiBRUrLI/qjUxpC1mlBC7FUqyJvUafZw3x4XL5FT0OIyS5VTnbdPLcbLifHvAtR8ugw
	Pcb6rueUnNSwJvMxjFK5oMdOIhIZyJo=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-yP87qIJFM3WhGpb5C0_vsw-1; Wed, 31 Jul 2024 23:01:38 -0400
X-MC-Unique: yP87qIJFM3WhGpb5C0_vsw-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-70d24aead3eso5763181b3a.0
        for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 20:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722481296; x=1723086096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZQqi8Rlj8p2YzhXekA+GMcnKbqaZuag13vj8ljtfWo=;
        b=RGq9qNYoPrHzbXXl9rKwZ+DYETdp/8szgiACZ9eRkg6iw4lVBtYnAM+lakBB9XOA7K
         VbhyXvd6KdtBNT1ITBUF6lZtlYR0txvaOlpo8io9BNWeZ65AHJa8qG/vuly717wfouiP
         I3Uq2pqXr0x7Be55X3cL3emrCWTpayUjwajBFVywMndXpoS7ZklGhL/l5Iu0ss33GgA6
         d3tQNisUc87Wpuh9OziHgOIJLjS6KoJVIRr1hspzJb8OTFoj57DgU3Sy6n3U48g5vCyH
         OBMaizROQEfFnN4oG7qdQFgj1uxXIjoYB51pY7WqkDKSekWUDpX5QfoAZNPb0+YbWYMf
         hLVw==
X-Gm-Message-State: AOJu0YzzSGsa6OhLD8Nml929bfSqy2rgDvndgdZxWKH+ETazXJpNmfkq
	sYEQfXh8JSjo07E8oJXO+9kM6iNz9EUSv3IhD/6rP410StXd8FxMfYip3RwiEcMR5Q9FL0doQDc
	QT02CRZbMhI+doNZIPhrS6dQMtft91NPkClNC21s7LQvGab4QWhDbEkJZ/3smBr08XTPHt25kkc
	zdiLfkh4oLP8W7A6CF37wj8oggQFcyuETlVWKZtco=
X-Received: by 2002:a05:6a20:394d:b0:1c3:ff33:24b9 with SMTP id adf61e73a8af0-1c68ce762femr1751878637.3.1722481295607;
        Wed, 31 Jul 2024 20:01:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOwBC9k2L4QqQpzhGhBH93X3dK/PIoAumna0zdKCSWRZ+H3MB6dJW6x1YcSlOZINO3Ac+xDk4klNyMhAwttKI=
X-Received: by 2002:a05:6a20:394d:b0:1c3:ff33:24b9 with SMTP id
 adf61e73a8af0-1c68ce762femr1751840637.3.1722481295023; Wed, 31 Jul 2024
 20:01:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1722252302.git.pabeni@redhat.com> <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
 <CACGkMEsOPcyUevsGcZeR8311-=5kGt5bRmxDQ3XGYQ3_S4Diyw@mail.gmail.com> <a9a575a8-3ffe-4c0a-9ed3-4eb1174e8364@redhat.com>
In-Reply-To: <a9a575a8-3ffe-4c0a-9ed3-4eb1174e8364@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 1 Aug 2024 11:01:23 +0800
Message-ID: <CACGkMEvC7H_NtPU8Gqde9J6Jz8UyFqcceYXtHhTpYOhZAq03Eg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 4:43=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 7/31/24 03:57, Jason Wang wrote:
> >> @@ -133,12 +139,16 @@ \subsubsection{Feature bit requirements}\label{s=
ec:Device Types / Network Device
> >>   \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
> >>   \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
> >>   \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> >> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO] Requires both VIRTIO_NET_F_G=
UEST_TSO4 and VIRTIO_NET_F_GUEST_TSO6, or
> >> +   both VIRTIO_NET_F_GUEST_USO4 and VIRTIO_NET_F_GUEST_USO6.
> >
> > I think VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO requires all of the four?
>
> Functionally speaking is not strictly necessary: the UDP tunnel feature
> needs just a single inner GSO type to assemble and process an UDP
> tunneled packet.
>
> On the flip side I think is reasonable that modern implementations
> support all the mentioned inner GSO type and requiring all of them would
> possibly make the implementation simpler and/or less bug prone.

Yes.

>
> So I guess I can change the requirement as you say above.

That would be great.

>
> >>   \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
> >>   \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
> >>   \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRT=
IO_NET_F_HOST_TSO6.
> >>   \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
> >>   \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
> >> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires both VIRTIO_NET_F_HO=
ST_TSO4 and VIRTIO_NET_F_HOST_TSO6, or
> >> +   both VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6.
> >>
> >>   \item[VIRTIO_NET_F_CTRL_RX] Requires VIRTIO_NET_F_CTRL_VQ.
> >>   \item[VIRTIO_NET_F_CTRL_VLAN] Requires VIRTIO_NET_F_CTRL_VQ.
> >> @@ -375,6 +385,12 @@ \subsection{Device Initialization}\label{sec:Devi=
ce Types / Network Device / Dev
> >>     TCP), VIRTIO_NET_F_HOST_TSO6 (IPv6 TCP), VIRTIO_NET_F_HOST_UFO
> >>     (UDP fragmentation) and VIRTIO_NET_F_HOST_USO (UDP segmentation) f=
eatures.
> >>
> >> +\item If any TCP or UDP segmentation feature is negotiated,
> >
> > Not a native speaker but this seems to conflict with the above. For
> > example, does "only VIRTIO_NET_F_GUEST_TSO4 is negotiated" mean any
> > TCP segmentation feature?
>
> As per the previois comment, I'll change this in the next revision to:
>
> """
> If the VIRTIO_NET_F_HOST_TSO6, VIRTIO_NET_F_HOST_TSO4 and
> VIRTIO_NET_HDR_GSO_UDP_L4 features are negotiated
> """

Ok.

>> @@ -516,6 +539,26 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De
> >>   specifically in the protocol.}.
> >>      \end{itemize}
> >>
> >> +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO f=
eature,
> >> +  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} indicates=
 that
> >> +  the GSO protocol is encapsulated in a UDP tunnel.
> >> +  The outer UDP header must not require checksumming, e.g. the outer =
UDP checksum
> >> +  must be zero.
> >> +  The other tunnel-related fields indicate how to replicate the packe=
t
> >> +  headers to cut it into smaller packets:
> >> +
> >> +  \begin{itemize}
> >> +  \item \field{outer_th_offset} field indicates the outer transport h=
eader within
> >> +      the packet. Note that such field differs from \field{csum_start=
} as the latter
> >> +      points to the inner transport header within the packet
> >
> > I wonder if it's better to stick to outer_csum_start, and say it's
> > offset within the packet to begin checksumming for outer packet.  This
> > follows the existing name and could be reused for encapsulation other
> > than UDP tunnel.
>
> I thought we agreed on this name in the previous iteration?!?

Sorry if I do that, the switch loses some context :(

> It feels
> strange to introduce a csum related field in a change NOT introducing a
> checksum related feature. And we need this filed here, for plain
> segmentation.

Ok, fine.

>
> >> @@ -557,6 +600,18 @@ \subsubsection{Packet Transmission}\label{sec:Dev=
ice Types / Network Device / De
> >>   driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
> >>   \field{gso_type}.
> >>
> >> +The driver MUST NOT send to the device TCP or UDP GSO packets over UD=
P tunnel
> >> +requiring segmentation offload, unless the VIRTIO_NET_F_HOST_UDP_TUNN=
EL_GSO is
> >> +negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_=
UDP_TUNNEL
> >> +bit in \field{gso_type}.
> >
> > Is this better to follow the existing style of the driver normative?
> > For example, we had
> >
> > "If VIRTIO_NET_F_HOST_TSO6 is negotiated, the driver MAY set gso_type
> > to VIRTIO_NET_HDR_GSO_TCPV6 to request TCPv6 segmentation, otherwise
> > the driver MUST NOT set gso_type to VIRTIO_NET_HDR_GSO_TCPV6."
> >
> > We could do the same
> >
> > "If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY ...
> > otherwise the driver MUST NOT ..."
>
> ok, I'll do that in the next revision
>
> >> @@ -598,6 +653,28 @@ \subsubsection{Packet Transmission}\label{sec:Dev=
ice Types / Network Device / De
> >>          header.
> >>   \end{itemize}
> >>
> >> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has been negotiated, t=
he
> >> +driver MAY set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_ty=
pe}, if so:
> >> +\begin{itemize}
> >> +\item the driver MUST set \field{outer_th_offset} to the outer UDP he=
ader
> >> +  offset, \field{inner_protocol_type} to the ethernet type of the inn=
er
> >> +  protocol, and \field{inner_nh_offset} to the inner network header o=
ffset.
> >> +\end{itemize}
> >
> > Do we need to say then csum_start and csum_offset is for the inner pack=
et here?
>
> I thought such statement was already everywhere, but no objection to add
> it here, too.

I think we need some tweaks. E.g with this patch applied, in "Packet
Transmission" subsection, we still have something which is not clear:

"""
  \item \field{csum_start} is set to the offset within the packet to
begin checksumming,
    and

  \item \field{csum_offset} indicates how many bytes after the csum_start t=
he
    new (16 bit ones' complement) checksum is placed by the device.
"""

I wonder if it's more clear to just describe the outer and inner metadata t=
here?

And in the end of this description

"""
\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature=
,
  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} indicates that
  the GSO protocol is encapsulated in a UDP tunnel.
  The outer UDP header must not require checksumming, e.g. the outer
UDP checksum
  must be zero.
  The other tunnel-related fields indicate how to replicate the packet
  headers to cut it into smaller packets:

  \begin{itemize}
  \item \field{outer_th_offset} field indicates the outer transport
header within
      the packet. Note that such field differs from \field{csum_start}
as the latter
      points to the inner transport header within the packet.

  \item \field{inner_protocol_type} field indicates the ethernet type
of the inner
      protocol.

  \item \field{inner_nh_offset} field indicates the inner network header wi=
thin
      the packet.
  \end{itemize}
"""

And it would be even nicer if an example could be give there, as we
have a non tunnel example for setting metatdata:

"""
For example, consider a partially checksummed TCP (IPv4) packet.
It will have a 14 byte ethernet header and 20 byte IP header
followed by the TCP header (with the TCP checksum field 16 bytes
into that header). \field{csum_start} will be 14+20 =3D 34 (the TCP
checksum includes the header), and \field{csum_offset} will be 16.
"""

>
> Somewhat related, I have a doubt WRT the csum_start/csum_offset fields
> "presence" with plain GSO packets. AFAICS, the specs require the csum
> offload feature as a pre-req for the plain segmentation feature, but
> also allow the reception of a GSO packet without the
> VIRTIO_NET_HDR_F_NEEDS_CSUM bit set, see the recent linux patch from Will=
em:
>
> https://lore.kernel.org/netdev/20240729201108.1615114-1-willemdebruijn.ke=
rnel@gmail.com/
>
> I think it will make the thing simpler if we always require such bit to
> be set for GSO packets.

Did you mean forbid VIRTIO_NET_HDR_F_DATA_VALID? I think it means we
will prevent vendors from implementing GRO_HW for UDP tunnels.

> I guess we can't change the current status for
> the existing GSO types, but for UDP tunnel we could add that requirement
> from the start, both for the driver -> device direction and for the
> device -> driver direction.
>
> Even when the device sets the VIRTIO_NET_HDR_F_DATA_VALID, so can always
> expect a valid csum_start/csum_offset pair, and make things hopefully
> more robust.

Ok, so you meant you want to mandate csum_start/csum_offset even in
the case of VIRTIO_NET_HDR_F_DATA_VALID.

> When VIRTIO_NET_HDR_F_DATA_VALID is set, the pair will NOT
> be used to validated the csum, just to point to the inner transport
> header and avoid parsing. WDYT?

It should be fine, but I think it's better to be an independent
feature (e.g a new feature flag as it is not specific to tunnels).

If we add too many dependencies for UDP tunnel, it would take too long
to be converged.

Thanks

>
> Thanks,
>
> Paolo
>

