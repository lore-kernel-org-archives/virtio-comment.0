Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEDA19ADBE
	for <virtio-comment@lists.linux.dev>; Mon, 24 Jun 2024 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719242157; cv=none; b=rsGNIMsigns7L5FzRVHBAEPNtLdKM72OMctfIB/f1DT0OhH2R0Z+4v2/SBzN72FMrdyrXELZo++aexX8Jm1uj96l2CTt8sZC0NSOK60XAH4vuB1voKXQjoh7SPX8fSZyAw0Hs8bh7bTGxX7dBlX5ACbh182MxhJYEBBTiuB/Of4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719242157; c=relaxed/simple;
	bh=VTJ8tfX2o322QNi5OOs/6D5+eOlSrP0zGqs8FqBCAiE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sjNvJtSmx8qD3eLJOd7IkxkSTrWykuaJrhuyake6VBzroSeAALhJJmmnYz0SU48HHhMSTlD6u20IqNwYLTJ1VpRtFzSU5Ysdn2p6vzXN7d5LhF+o7wdBO6L0ROmzuL93j5RnZOlGXQRmcf6IDUUtZvpL2LnFCT0Pg+7N69n2gt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KF4Trbx2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KF4Trbx2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719242154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fzqPx2/FlBwk/V8UycxsaEKIR+Ny/WnfwAnaQQZMuc8=;
	b=KF4Trbx2C5EHV35MVhsEJ6U0AKFIl0Npy1ksxeXubKkdqpZqE4b7HM4w+u3x6pPqPZke8w
	yZA5ftzRiLmgZWN3/hMmN0c0CuO1scFdekdzjlXZlyaecCvppigoIvaw55Vrln5Osiz57Y
	EbT/Y+UG3cIdcuJWrion3SGSPniiwQI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-3G_h9NzcP2O_j3PLzsaeIg-1; Mon, 24 Jun 2024 11:15:52 -0400
X-MC-Unique: 3G_h9NzcP2O_j3PLzsaeIg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-362a593fd63so131040f8f.2
        for <virtio-comment@lists.linux.dev>; Mon, 24 Jun 2024 08:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719242151; x=1719846951;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fzqPx2/FlBwk/V8UycxsaEKIR+Ny/WnfwAnaQQZMuc8=;
        b=Aegd68grfXfARUKgJjzaIcec3UTRMZl1LqPooKx78li6MdupOw9Lmh6Qkzrqm9qNFs
         k2RbVsBj1KfzNpd2JGdb2UIneskFfgaO7KXetYcvp11/k+guJS+0pTubM4J3WMeMshA0
         sbYkrPonvsHrBBwbOnn/MukyK+KfaTCqmVPqI4ectE6uHswNxNb2BKtoBuEN82c9k6dG
         rogLcO8cOXHdlh8NwBOTi5ro/Nbe5cf29ZKhRSJkVDmU6xpfWlVdOj79ceBWoGnKb6wl
         1eIAwJdy0OZjIK1hN3qP+TRH9C5GQ00/2Jy2LS0sTS5dCr7zl3gzq4JL2SUuoKt4TisZ
         2Ryw==
X-Forwarded-Encrypted: i=1; AJvYcCWMZ7T7THkTzO8HE2Vd4dltozlZ66mp0wwmdbGOirwBCTXoR0Lrct0Qy67EmmIJtzECUI8hf5T81ZAKZecjhx3qiKbTu3wRsEx/cBZnlUU=
X-Gm-Message-State: AOJu0YxtaeazF/m3oUtWtB9Qn4a0uDAwTs0buGZ8dJ9e+P9qykwHI4pI
	w+eIhvRNi2I5uC39oVoz3Gvw8pnG9Hb8DR++/lx162FpUWIK1ZYYd5SDD8bIsf9vn3FWsraPTxC
	4XG7uwIbQYdV26pev/wCxfGiXHiPBqytHjrufqd0lf//Jx0NTQweqSKUGp+5IHu4/
X-Received: by 2002:a05:600c:5111:b0:424:88be:c0bb with SMTP id 5b1f17b1804b1-42488bec60amr47442285e9.1.1719242151570;
        Mon, 24 Jun 2024 08:15:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1uxbt5BZo68zgTnGd/3Q/4A4Op1Zq9OfVt3yqeIgWxYdxjfBGUUYlxr+y8mPA26y2mXRP2Q==
X-Received: by 2002:a05:600c:5111:b0:424:88be:c0bb with SMTP id 5b1f17b1804b1-42488bec60amr47442075e9.1.1719242151084;
        Mon, 24 Jun 2024 08:15:51 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3341:b0ae:da10::739])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3666dc46d50sm9984738f8f.67.2024.06.24.08.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:15:50 -0700 (PDT)
Message-ID: <f9baf97e713c87e5495b67f17ee87ff4597df360.camel@redhat.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: Willem de Bruijn <willemb@google.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, Stefano
	Garzarella <sgarzare@redhat.com>
Date: Mon, 24 Jun 2024 17:15:49 +0200
In-Reply-To: <CA+FuTSd8PYnjGrF-L2t0=M0p9A=Ctxh4-uy=ta8XgEs5iWRtwQ@mail.gmail.com>
References: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
	 <CA+FuTSdVUre71ULgi8wnRZsCeHn1WqJMJmc7iDzUhaYB2nidLQ@mail.gmail.com>
	 <7effaf20b981c427f7ad396c29464da685b3a822.camel@redhat.com>
	 <CA+FuTSd8PYnjGrF-L2t0=M0p9A=Ctxh4-uy=ta8XgEs5iWRtwQ@mail.gmail.com>
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

On Wed, 2024-06-19 at 15:26 +0200, Willem de Bruijn wrote:
> On Wed, Jun 19, 2024 at 12:37=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> =
wrote:
>=20
> > This change is becoming rater big, I guess I can split it in 2 patches,
> > but I fear a strong interdependence that would make both the split and
> > the review hard.
> >=20
> > If we avoid the additional feature bit, it think the change should be
> > manageable with a single patch.
>=20
> The main reason for asking is that it may be simpler to spot any
> unintended interdependencies. The first patch has no dependencies
> on the second patch.
>=20
> But just a thought, no hard preference.

Given that also Jason is asking the same, I'll do the split in the next
revision.

> > > > @@ -375,6 +393,16 @@ \subsection{Device Initialization}\label{sec:D=
evice Types / Network Device / Dev
> > > >    TCP), VIRTIO_NET_F_HOST_TSO6 (IPv6 TCP), VIRTIO_NET_F_HOST_UFO
> > > >    (UDP fragmentation) and VIRTIO_NET_F_HOST_USO (UDP segmentation)=
 features.
> > > >=20
> > > > +\item If any TCP or UDP segmentation feature is negotiated, a driv=
er can
> > > > +  use TCP segmentation or UDP segmentation on top of UDP encapsula=
tion
> > > > +  offload, when the outer header does not require checksumming,
> > > > +  by negotiating the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature.
> > > > +
> > > > +\item If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, a driver =
can
> > > > +  additionally use TCP segmentation or UDP segmentation on top of =
UDP
> > > > +  encapsulation with the outer header requiring checksum offload,
> > > > +  negotiating the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature.
> > >=20
> > > Please also make explicit what is expected of udp tunnel offload
> > > without checksum offload, on both tx and rx: one of outer checksum is
> > > zero, or it is computed/validated in software (does not work with
> > > GSO/GRO, of course, so I assume you mean the first only).
> >=20
> > That is somewhat explained in later section - "Device Operation".
> > Looking at the existing document layout I think the latter is better
> > suited for such specification, should I somewhat duplicate the wording
> > here?
>=20
> UDP tunneling with zero outer checksum is also common. Please
> do make explicit whether that is acceptable.

Ok.

> And for the other case, software computes the checksum, i.e.,
> partial GSO, do you state explicitly that all segments must be
> equal length and the outer headers already prepared for the segments,
> to be able to compute their checksum ahead of time?
>=20
> I don't mean to push for partial GSO, btw, if you prefer full
> offload of both outer and inner checksum, with full segmentation
> offload. It might just be supported by fewer NICs?

I think that it's nice to have the possibility to actually handle
segmented tunneled traffic even lacking the external csum offload
feature, even for non 0 outer csum.

I would like to keep it - unless the revisions cycles keep forever!

> > >=20
> > > > @@ -516,6 +554,59 @@ \subsubsection{Packet Transmission}\label{sec:=
Device Types / Network Device / De
> > > >  specifically in the protocol.}.
> > > >     \end{itemize}
> > > >=20
> > > > +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O feature,
> > > > +  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} indica=
tes that
> > > > +  the GSO protocol is encapsulated in an UDP tunnel. If the outer =
UDP header
> > > > +  requires checksumming, the driver must have additionally negotia=
ted the
> > > > +  VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature and offloaded the oute=
r checksum
> > > > +  accordingly.
> > > > +  The other tunnel-related fields indicate how to replicate the in=
ner packet
> > > > +  header to cut it into smaller packets:
> > > > +
> > > > +  \begin{itemize}
> > > > +  \item \field{outer_th_offset} field indicates the outer transpor=
t header within
> > > > +      the packet. Note that differs from \field{csum_start} as the=
 latter
> > > > +      points to the inner transport header within the packet.
> > > > +
> > > > +  \item \field{inner_protocol} field indicates the ethernet type o=
f the inner
> > > > +      protocol.
> > >=20
> > > That answers my above question. But is this needed if it can be read
> > > from the inner mac header (when the inner link layer type is known)?
> > >=20
> > > We should try to add the minimum number of fields required. Are all
> > > these fields required, or can some (like this) be derived easily from
> > > the others?
> >=20
> > I think I discussed this point with Jason in the past revisions. We can
> > use less new fields, but that will require some parsing. I understand
> > that Jason prefers no parsing at all. To that extend AFAICS we need all
> > the new fields listed here - to be able to fully reconstruct the
> > information/skb fields for either GSO or TSO.
>=20
> Ok. I just wonder whether the choice of fields here is very Linux (and
> struct sk_buff) specific.

I looked only at the Linux implementation while selecting the fields.

On the flip side, I think they include all the necessary information
for later GSO without additional parsing, independently from the actual
upper stack implementation (hard to prove!)

> > >=20
> > > > +The driver MUST NOT set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit \=
field{flags}
> > > > +without setting the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO bit in \field=
{gso_type}.
> > > > +
> > > >  If the VIRTIO_NET_F_CSUM feature has been negotiated, the
> > > >  driver MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
> > > >  \field{flags}, if so:
> > > > @@ -598,6 +717,45 @@ \subsubsection{Packet Transmission}\label{sec:=
Device Types / Network Device / De
> > > >         header.
> > > >  \end{itemize}
> > > >=20
> > > > +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has been negotiated=
, the
> > > > +driver MAY set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso=
_type}, if so:
> > > > +\begin{itemize}
> > > > +\item the driver MUST set the \field{outer_th_offset} to the outer=
 UDP header
> > > > +  offset, the \field{inner_protocol} to the ethernet type of the i=
nner
> > > > +  protocol, the \field{inner_mac_offset} to the inner mac header o=
ffset and
> > > > +  the \field{inner_nh_offset} to the inner network header offset.
> > > > +\end{itemize}
> > > > +
> > > > +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature has been negotiat=
ed, and the
> > > > +bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL in \field{gso_type} is set, the
> > > > +driver MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
> > > > +\field{flags}, if so:
> > > > +\begin{enumerate}
> > > > +\item the driver MUST validate the packet checksum at
> > > > +       offset 6 from \field{outer_th_offset} as well as all
> > > > +       preceding offsets;
> > > > +\item the driver MUST set the packet checksum stored in the
> > > > +       buffer to the outer UDP pseudo header;
> > > > +\item the driver MUST set \field{outer_th_offset} and such that ca=
lculating a ones'
> > > > +       complement checksum from \field{outer_th_offset} up until t=
he end of
> > > > +       the packet and storing the result at offset 6 from  \field{=
outer_th_offset}
> > > > +       will result in a fully checksummed outer UDP packet;
> > > > +\end{enumerate}
> > > > +Otherwise, if the bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL in \field{gso_=
type} is set and
> > > > +the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{gso_type} is cl=
eared, the driver
> > > > +MUST either set the outer UDP checksum to 0 or set it to the full =
outer UDP header
> > > > +value. To compute the full outer UDP header value the driver MUST:
> > > > +\begin{enumerate}
> > > > +\item set the outer UDP checksum to 0
> > > > +\item calculate the ones'complement checksum from \field{outer_th_=
offset} to
> > > > +  \field{csum_start}
> > >=20
> > > This is not the full outer checksum.
> > >=20
> > > Is the intent to work with inner checksum offload? If so, it requires=
 more steps
> > > both for partial GSO and even without GSO where the inner checksum in=
cludes
> > > the inner pseudo header.
> >=20
> > Yes, my writing is not correct, I was hasty.
> >=20
> > Note that (to keep things simple) this spec basically restricts to LCO
> > in the partial GSO case, and requires fallback to segmentation in other
> > cases asking for outer csum offload.
>=20
> How are these two cases distinguished? As in: what does a device
> sign up for when it advertises VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM

I'm unsure I understand the question correctly. The 2 cases mentioned
above are for a device that does not expose the
VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature. For UDP tunneled GSO packet
with non zero outer checksum it either requires prior segmentation or
that the segment is a GSO partial one.

Do you mean the driver should explicitly expose a GSO partial feature
to tell the upper stack to slice the GSO packets in a suitable way?

If so, I think we are better off without including the GSO partial in
here. Note that at least the driver could still provide that even
without spec support.

> >=20
> > Wrapping-up, AFAICT, the most critical points raised here are:
> > * add a separate feature bit for CSUM offload in the UDP tunnel non GSO
> > case -> I would avoid that if possible, due to the (little) gain/added
> > complexity rate.
>=20
> Ack. Fine to skip.
>=20
> I'm more interested in udp tunnel offload without requiring advertising
> GSO.=C2=A0

Can I ask why? I was under the assumption that TSO was an inevitable
goodness nowaday?!?


Thanks!

Paolo

