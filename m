Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0B812D1E7
	for <virtio-comment@lists.linux.dev>; Wed, 19 Jun 2024 10:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718793433; cv=none; b=dRa1V9zDzfkx8A/ougDz2wWxB3ktSjz4L4u0mVsf8fsH4cfkbQVNokIZVkI0EGw5d8ZTEnB5AIRRU+QwqbojuvqV8uUSVoqqMLDngo+N8ss2nRA3ZWkcQneDVpGr/Z1m2Bm+h2j2kAj9yWMNDY5aDymIylfggsBlFH1g3di2KNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718793433; c=relaxed/simple;
	bh=qMTud0aa6b/aB8WVxnBc8hFqaGFljxlpIIMk7HEA6os=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qOGW7Wb+8Qo/HytdZDDCk1GOOKHeTrP/O7QWKcL7Fa558drzOcvLefhInMQsQ0FEumGXE6tA/ebEpwScTRMgHQlG8XB64B4KlDefcRbHL+jqVuHUYx//18Ecm7lpKfgZ4LySweBrc971GnUO4gspJESW/oYB/sMBRFvLxk5vOBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AXRXo2pQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AXRXo2pQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718793430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dFv7w6T24cLXMU0wgyP6b8SkVIn4j9IRmuWAJ8jb8eU=;
	b=AXRXo2pQSjzxoWADJRdPtfUub0XFRSqQJG9cMNhUGiCQGqVaMBfzDV7uYHCpr6RCUdU06b
	Agv9aUJ/NeQMBj5JcOnBZnWSkLOyrj/eI8XQnsKcWt6vIgdZuktMw6dd/YnwAhhfTs9BGK
	TP7C+6ETfz2pPZ0tuOzCHVgD9HoFcHY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-GrVFGVDpNCCpu15gyz1HRg-1; Wed, 19 Jun 2024 06:37:08 -0400
X-MC-Unique: GrVFGVDpNCCpu15gyz1HRg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42180a0730dso7228925e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 19 Jun 2024 03:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718793427; x=1719398227;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dFv7w6T24cLXMU0wgyP6b8SkVIn4j9IRmuWAJ8jb8eU=;
        b=TZjChOm7Nbky0GhhyxbYaZywKRGwroi7UkOqj/ya0XPLmWha8rMQrHyxEKjY1UfxLd
         oies/AqSRDm9//EBST9ud4jvqJ5TbzOYsYFJC8eYK/A+3RrrVkscEKnmd3JXddM1Konn
         uWU/JPEisejwXeGfhdAWT+lbflLfcsKIAGQLrWSi0AJmHV6RaOQxMiZl8QH++jLTJ2RI
         pBeUZzE33xPYiJtQsvTduHQqHJ8HIjjCq7NsJ07W3eDwM+XqFQakm3zChiL14nBw0YEB
         1+WJTXzcvFo/O62vcXtVn6BWI6VgaMXmIQo3/TByaKRZjuLu4MGoNU2GSCEUxgvOvLck
         4oaQ==
X-Gm-Message-State: AOJu0Yx84kbLgfbVPHN8UteTQeRsVfQnFqeeAG6ZXHB6M6I/fEe7axDE
	vq2sb/QHxgeJWrqFbL8Oq2IYKXZxibfhF+Ull9IMK1sB+uWAwdJvLRFQ1elD8wfBASJTCzujFDY
	shaUiMhqNWUNjnHzLLZIbTfoXHLVlIiH0B8jjim8hJTbSE4RI2HH+r360rsrvFbpoit3scs6U
X-Received: by 2002:a05:600c:5125:b0:422:78c:82f9 with SMTP id 5b1f17b1804b1-4247529bba1mr13726475e9.3.1718793427195;
        Wed, 19 Jun 2024 03:37:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbL+En6scDbk+01VSKVaLFGpkH7hi1bYnaGcNmoCUeWJKWt0eZwSLk5HckFhOBxupKCoS8Dg==
X-Received: by 2002:a05:600c:5125:b0:422:78c:82f9 with SMTP id 5b1f17b1804b1-4247529bba1mr13726365e9.3.1718793426703;
        Wed, 19 Jun 2024 03:37:06 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3341:b0b7:b110::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe92c6sm261793555e9.18.2024.06.19.03.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 03:37:06 -0700 (PDT)
Message-ID: <7effaf20b981c427f7ad396c29464da685b3a822.camel@redhat.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: Willem de Bruijn <willemb@google.com>, Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, Eelco
 Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 19 Jun 2024 12:37:05 +0200
In-Reply-To: <CA+FuTSdVUre71ULgi8wnRZsCeHn1WqJMJmc7iDzUhaYB2nidLQ@mail.gmail.com>
References: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
	 <CA+FuTSdVUre71ULgi8wnRZsCeHn1WqJMJmc7iDzUhaYB2nidLQ@mail.gmail.com>
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

Hi,

Thank you for the feedback!

On Tue, 2024-06-18 at 18:15 +0200, Willem de Bruijn wrote:
> On Mon, Jun 17, 2024 at 12:52=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> =
wrote:
>=20
> > @@ -133,12 +145,18 @@ \subsubsection{Feature bit requirements}\label{se=
c:Device Types / Network Device
> >  \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
> >  \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
> >  \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_GUEST_T=
SO4, VIRTIO_NET_F_GUEST_TSO6,
> > +   VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6.
> > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM] Requires VIRTIO_NET_F_GUEST_=
UDP_TUNNEL_GSO
>=20
> Should this dependency be the other way around? GSO/GRO requires Tx/Rx
> checksum offload, but not vice versa.
>=20
> Or is this effectively VIRTIO_NET_F_GUEST_UDP_TUNNEL_*GSO*_CSUM?
>=20
> It sounds like there may even be three features here: UDP_TUNNEL,
> UDP_TUNNEL_CSUM and UDP_TUNNEL_GSO.
>=20
> It may make sense to split the patch into two (or three) patches?

VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM is intended just for GSO packets. I
could probably rename it accordingly. As such it really depends on
VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO. This is intentionally the opposite
of the relationship between the inner csum feature and plain GSO.

The take-away I got from the feedback on the previous revision is that
outer checksum offload for UDP tunneled non GSO packets does not help
much - as computing the outer csum is cheap.

I would avoid introducing an additional feature bit just for that.

This change is becoming rater big, I guess I can split it in 2 patches,
but I fear a strong interdependence that would make both the split and
the review hard.

If we avoid the additional feature bit, it think the change should be
manageable with a single patch.

> > @@ -375,6 +393,16 @@ \subsection{Device Initialization}\label{sec:Devic=
e Types / Network Device / Dev
> >    TCP), VIRTIO_NET_F_HOST_TSO6 (IPv6 TCP), VIRTIO_NET_F_HOST_UFO
> >    (UDP fragmentation) and VIRTIO_NET_F_HOST_USO (UDP segmentation) fea=
tures.
> >=20
> > +\item If any TCP or UDP segmentation feature is negotiated, a driver c=
an
> > +  use TCP segmentation or UDP segmentation on top of UDP encapsulation
> > +  offload, when the outer header does not require checksumming,
> > +  by negotiating the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature.
> > +
> > +\item If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, a driver can
> > +  additionally use TCP segmentation or UDP segmentation on top of UDP
> > +  encapsulation with the outer header requiring checksum offload,
> > +  negotiating the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature.
>=20
> Please also make explicit what is expected of udp tunnel offload
> without checksum offload, on both tx and rx: one of outer checksum is
> zero, or it is computed/validated in software (does not work with
> GSO/GRO, of course, so I assume you mean the first only).

That is somewhat explained in later section - "Device Operation".
Looking at the existing document layout I think the latter is better
suited for such specification, should I somewhat duplicate the wording
here?=20

> > @@ -423,6 +455,10 @@ \subsection{Device Operation}\label{sec:Device Typ=
es / Network Device / Device O
> >          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT nego=
tiated)
> >          le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT nego=
tiated)
> >          le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT nego=
tiated)
> > +        le16 outer_th_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_=
GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> > +        le16 inner_protocol;    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_=
GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> > +        le16 inner_mac_offset;  (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_=
GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
>=20
> Inner protocol is the inner mac protocol e.g., ARPHRD_ETHER? To be
> able to parse the inner mac protocol (and from that the inner network
> protocol). [update: answered below, see next inline response for
> follow-on]
>=20
> And it is the inner network header if no mac header is present?
>=20
> How to detect that case should also be made explicit. E.g.,
> inner_nh_offset =3D=3D inner_mac_offset, or inner_mac_offset =3D=3D 0. Ev=
en if
> that is not supported yet. To make sure that we can detect it and
> support it in the future.

To me the specification above means that when inner_nh_offset =3D=3D
inner_mac_offset there is no mac header and inner_protocol identify the
L3 header (ipv4 vs ipv6). I can make such expectation explicit. It
should both cover your intended use case and pose no hard (difficult to
meet) requirements on hardware implementations.

> > @@ -516,6 +554,59 @@ \subsubsection{Packet Transmission}\label{sec:Devi=
ce Types / Network Device / De
> >  specifically in the protocol.}.
> >     \end{itemize}
> >=20
> > +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO fe=
ature,
> > +  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} indicates =
that
> > +  the GSO protocol is encapsulated in an UDP tunnel. If the outer UDP =
header
> > +  requires checksumming, the driver must have additionally negotiated =
the
> > +  VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature and offloaded the outer ch=
ecksum
> > +  accordingly.
> > +  The other tunnel-related fields indicate how to replicate the inner =
packet
> > +  header to cut it into smaller packets:
> > +
> > +  \begin{itemize}
> > +  \item \field{outer_th_offset} field indicates the outer transport he=
ader within
> > +      the packet. Note that differs from \field{csum_start} as the lat=
ter
> > +      points to the inner transport header within the packet.
> > +
> > +  \item \field{inner_protocol} field indicates the ethernet type of th=
e inner
> > +      protocol.
>=20
> That answers my above question. But is this needed if it can be read
> from the inner mac header (when the inner link layer type is known)?
>=20
> We should try to add the minimum number of fields required. Are all
> these fields required, or can some (like this) be derived easily from
> the others?

I think I discussed this point with Jason in the past revisions. We can
use less new fields, but that will require some parsing. I understand
that Jason prefers no parsing at all. To that extend AFAICS we need all
the new fields listed here - to be able to fully reconstruct the
information/skb fields for either GSO or TSO.

> > +  \item \field{inner_mac_offset} field indicates the inner mac header =
within the packet
> > +
> > +  \item \field{inner_nh_offset} field indicates the inner network head=
er within
> > +      the packet
> > +  \end{itemize}
> > +
> > +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM f=
eature,
> > +  the transimitted packet is a GSO one encapsulated in an UDP tunnel, =
and
>=20
> typo: transmitted

FTR, I pushed this into codespell, I will look for something better
next time.

> > @@ -557,6 +648,34 @@ \subsubsection{Packet Transmission}\label{sec:Devi=
ce Types / Network Device / De
> >  driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
> >  \field{gso_type}.
> >=20
> > +The driver MUST NOT send to the device TCP or UDP GSO packets over UDP=
 tunnel
> > +requiring segmentation offload, unless the VIRTIO_NET_F_HOST_UDP_TUNNE=
L_GSO is
> > +negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_U=
DP_TUNNEL
> > +bit in the \field{gso_type}.
> > +
> > +The driver MUST NOT send to the device TCP or UDP GSO packets over UDP=
 tunnel
> > +requiring segmentation and outer UDP checksum offload, unless both the
> > +VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO and VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM=
 features
> > +are negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_G=
SO_UDP_TUNNEL
> > +bit in the \field{gso_type} and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM b=
it in the \field{flags}.
> > +
> > +If VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM is not negotiated, the driver MUS=
T not set
> > +the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags} and, in =
case of GSO
> > +packets carried over an UDP tunnel, MUST either supply the full checks=
um for the
> > +outer UDP header to the device or such checksum MUST be zero.
> > +
> > +\begin{note}
> > +Is possible to supply the full checksum for the outer UDP header for
> > +GSO packets over UDP tunnel, only when the GSO packet size is an integ=
er
> > +multiple of \field{gso_size}.
> > +\end{note}
> > +
> > +The driver MUST NOT set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL together wit=
h
> > +VIRTIO_NET_HDR_GSO_UDP.
>=20
> Perhaps explain why: VIRTIO_NET_HDR_GSO_UDP is fragmentation offload,
> which is deprecated in favor of UDP_L4 and no new features will
> support it.

I will do in the next revision.

> > +The driver MUST NOT set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit \fiel=
d{flags}
> > +without setting the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO bit in \field{gso=
_type}.
> > +
> >  If the VIRTIO_NET_F_CSUM feature has been negotiated, the
> >  driver MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
> >  \field{flags}, if so:
> > @@ -598,6 +717,45 @@ \subsubsection{Packet Transmission}\label{sec:Devi=
ce Types / Network Device / De
> >         header.
> >  \end{itemize}
> >=20
> > +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has been negotiated, th=
e
> > +driver MAY set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_typ=
e}, if so:
> > +\begin{itemize}
> > +\item the driver MUST set the \field{outer_th_offset} to the outer UDP=
 header
> > +  offset, the \field{inner_protocol} to the ethernet type of the inner
> > +  protocol, the \field{inner_mac_offset} to the inner mac header offse=
t and
> > +  the \field{inner_nh_offset} to the inner network header offset.
> > +\end{itemize}
> > +
> > +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature has been negotiated, =
and the
> > +bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL in \field{gso_type} is set, the
> > +driver MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
> > +\field{flags}, if so:
> > +\begin{enumerate}
> > +\item the driver MUST validate the packet checksum at
> > +       offset 6 from \field{outer_th_offset} as well as all
> > +       preceding offsets;
> > +\item the driver MUST set the packet checksum stored in the
> > +       buffer to the outer UDP pseudo header;
> > +\item the driver MUST set \field{outer_th_offset} and such that calcul=
ating a ones'
> > +       complement checksum from \field{outer_th_offset} up until the e=
nd of
> > +       the packet and storing the result at offset 6 from  \field{oute=
r_th_offset}
> > +       will result in a fully checksummed outer UDP packet;
> > +\end{enumerate}
> > +Otherwise, if the bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL in \field{gso_type=
} is set and
> > +the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{gso_type} is cleare=
d, the driver
> > +MUST either set the outer UDP checksum to 0 or set it to the full oute=
r UDP header
> > +value. To compute the full outer UDP header value the driver MUST:
> > +\begin{enumerate}
> > +\item set the outer UDP checksum to 0
> > +\item calculate the ones'complement checksum from \field{outer_th_offs=
et} to
> > +  \field{csum_start}
>=20
> This is not the full outer checksum.
>=20
> Is the intent to work with inner checksum offload? If so, it requires mor=
e steps
> both for partial GSO and even without GSO where the inner checksum includ=
es
> the inner pseudo header.

Yes, my writing is not correct, I was hasty.

Note that (to keep things simple) this spec basically restricts to LCO
in the partial GSO case, and requires fallback to segmentation in other
cases asking for outer csum offload.

>=20
Wrapping-up, AFAICT, the most critical points raised here are:
* add a separate feature bit for CSUM offload in the UDP tunnel non GSO
case -> I would avoid that if possible, due to the (little) gain/added
complexity rate.
* reducing the number of added fields. My understanding is that Jason
is against it (at that will require more parsing), see:

https://lists.oasis-open.org/archives/virtio-dev/202207/msg00003.html

(unfortunately most of the discussion on previous revisions was
threaded separately from the original post).

Thanks for your time,

Paolo

