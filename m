Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002391487C3
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 08:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719304119; cv=none; b=LpNFmoNtxMn36j+k30ENftMNRr/aJDBwQrXKK3wn7faYnoUjmzcu9WOA+8e/b/285tCHHRrCDsHFEVeDcbU8Y9kbOhfwT/Bi65JBlhUyUj1RqbPXGaGu+KrCK6I+lrl2y8pxkcBbImPa9lowMhKkYn1apvsWbL/8IBjXhzOShRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719304119; c=relaxed/simple;
	bh=bIb5Obyg3UdOhpHEf/V7Abq5/9nvsIKnvWz2joHXCMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTovzhqwdaTz1sPTi95y9LUe6GVY/XqwrHQ+24iRWKOC+LDCIO/26qYTdJ8TlJ3g7zPMv3DnrJ+bjxd3UlaxZ0/kHcFAP7NF15pmBn1vvub5J6wHVzR6UCA4uOias/gji4CF7ESmnmM6oPiXzYi3WU8oHrRLp8igk6mEch6BaMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZXWQLlFE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZXWQLlFE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719304116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ejXqoos61iWiEhvAhD9l+D1LkwtaCA6GaAKRIeJy6TI=;
	b=ZXWQLlFECCkilDMPngWcpYM5pw3IJtWmWEXEEG//IcMgbke+4u1uvwj+fkk+XKhaCpsfKi
	XUI3zDtSM3kOkyb2KWJwqkQINdhJgO86A3VwLz7ztHdVlU8bBYwU5yAI/DxZ69EAoTFnYC
	jz1+9H+2N44xHN6WNKA/oW2rLLgRrdM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-oo5onWxLNXux1G1THcsMJw-1; Tue, 25 Jun 2024 04:28:34 -0400
X-MC-Unique: oo5onWxLNXux1G1THcsMJw-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2c30144b103so4414607a91.0
        for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 01:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719304114; x=1719908914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejXqoos61iWiEhvAhD9l+D1LkwtaCA6GaAKRIeJy6TI=;
        b=VOYVC/j83JzORGJwG1HGXBg7xz9VxnZflgZ5AjfshNqLgLvjPGkZIwyGFdVfnqqeSV
         XJp3IO6wN/2IQJYenbLkSfJboJ92gJe8AJ0zR97K8g2YBnc3Z3V2ftlPr1DfHr2vt0db
         Vel8m/Fd5QkNOgitMOlRGdzA+YspbKNiHB7Gw8TeZ1t+icRJC0gZ50DxvECuUZ/c9NT1
         7B1SlcQpR1KWdUHEuqztSGY/BUlqPK4TjZLMXL7ig3O9TF5dgPnd2k3HOtIdkvFboYkc
         hW+Ojqfy01oZ8yxw7Ml0NoFEOFkfAWjnCI3y69rPPMJyPaRYytaxXzrIGNhkvYa1RjE6
         7h7g==
X-Gm-Message-State: AOJu0YxrqzBLvqq6FcWYfsAYx+Dl43XIMTEyLe0uurM2keDNtuwLS5eS
	kdhGdEun0uOU0DNBp5kESC+fB8kJ0c38beN0tQwo5dhiJhGOQNB9Lfb7tvzemwHRGK7c29vXsaL
	DBMzgjXNd3xkQJXK5MeRa9/87FmZEcx6aMtyRjkLSJF7rDrRR+bpm6XczIVCrUitVUmwJeKtW2u
	xNhTjKCfrANlkShAaykaV9tgQ3Ah6iMVg5jtMeRqg=
X-Received: by 2002:a17:90a:b106:b0:2c6:f5bf:5175 with SMTP id 98e67ed59e1d1-2c8a2358c37mr4181147a91.10.1719304113530;
        Tue, 25 Jun 2024 01:28:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+3ZX2snIFekYkQv+Yjx0GL7HAtOcG6R0wh2hL9ixbLF5uIoYT7wq026F56oXx4LuYdXalYldUDFUDqPKNycY=
X-Received: by 2002:a17:90a:b106:b0:2c6:f5bf:5175 with SMTP id
 98e67ed59e1d1-2c8a2358c37mr4181107a91.10.1719304112853; Tue, 25 Jun 2024
 01:28:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
 <CACGkMEt-Ep+At_4YvkJ2t8UmQHJ0-Qm6fAPbGpkV_AfVyNq2EA@mail.gmail.com> <ed07e9bb9ae5bc1a171c77425cc0b96e6b87745c.camel@redhat.com>
In-Reply-To: <ed07e9bb9ae5bc1a171c77425cc0b96e6b87745c.camel@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 25 Jun 2024 16:28:21 +0800
Message-ID: <CACGkMEvD_WDN5yeRKcZ2ijRF8C2_Pmr6UZWMNt+_R6S0WHY5Fg@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 11:47=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On Mon, 2024-06-24 at 11:07 +0800, Jason Wang wrote:
> > On Mon, Jun 17, 2024 at 6:52=E2=80=AFPM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> > >
> > > The VIRTIO_NET_HDR_GSO_UDP_TUNNEL is a gso_type flag allowing GSO ove=
r
> > > UDP tunnel. It can be negotiated on both the host and guest sides.
> > >
> > > UDP tunnel usage is ubiquitous in container deployment, and the abili=
ty
> > > to offload UDP encapsulated GSO traffic impacts greatly the performan=
ces
> > > and the CPU utilization of such use cases.
> > >
> > > One constraint addressed here is that the virtio side (either device =
or
> > > driver) receiving a UDP tunneled GSO packet must be able to reconstru=
ct
> > > completely the inner and outer headers offset - to allow for later GS=
O.
> > >
> > > To accommodate such need, new optional fields are introduced in the
> > > virtio_net header: outer_th_offset, inner_protocol, inner_mac_offset,
> > > inner_nh_offset. They map directly to the corresponding header
> > > information. The inner transport header is implied by the (inner)
> > > checksum offload.
> >
> > Does this mean csum_start in the vnet header actually?
>
> Yes. I thought the wording was unambiguous?!?

Not sure, to me csum_start seems more clear.

>
> > > diff --git a/device-types/net/description.tex b/device-types/net/desc=
ription.tex
> > > index 76585b0..d6f9f79 100644
> > > --- a/device-types/net/description.tex
> > > +++ b/device-types/net/description.tex
> > > @@ -88,6 +88,18 @@ \subsection{Feature bits}\label{sec:Device Types /=
 Network Device / Feature bits
> > >  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through contro=
l
> > >      channel.
> > >
> > > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (47)] Driver can receive GSO=
 packets
> > > +  carried by an UDP tunnel.
> > > +
> > > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM (48)] Driver handles packet=
s
> > > +  carried by an UDP tunnel with partial csum for the outer header.
> >
> > Could we separate the outer csum into another patch to converge sooner?
>
> Given that both you and Willem are asking for it, I guess I'll have
> to:)

Great :)

>
> > > +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (49)] Device can receive GSO =
packets
> > > +  carried by an UDP tunnel.
> > > +
> > > +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM (50)] Device handles packets
> > > +  carried by an UDP tunnel with partial csum for the outer header.
> > > +
> > >  \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header has=
h for encapsulated packets.
> > >
> > >  \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue notif=
ication coalescing.
> > > @@ -133,12 +145,18 @@ \subsubsection{Feature bit requirements}\label{=
sec:Device Types / Network Device
> > >  \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
> > >  \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
> > >  \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> > > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_GUEST=
_TSO4, VIRTIO_NET_F_GUEST_TSO6,
> > > +   VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6.
> >
> > For "or" I think you meant "and" actually?
>
> No, just any (one) of the above options is sufficient for UDP tunnel
> GSO sake. Why do you want to mandate all of them?

For example, does it mean if there's only VIRTIO_NET_F_GUEST_USO4, the
driver still supports tunnel offloading over UDPv6? This sounds a
little bit strange.

>
> >
> > > @@ -407,12 +437,14 @@ \subsection{Device Operation}\label{sec:Device =
Types / Network Device / Device O
> > >  #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
> > >  #define VIRTIO_NET_HDR_F_DATA_VALID    2
> > >  #define VIRTIO_NET_HDR_F_RSC_INFO      4
> > > +#define VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM 8
> >
> > Not a native speaker but following the name style does
> > _F_UDP_TUNNEL_NEEDS_CSUM sounds better here?
>
> Not a native speaker here, too :)
> Your suggestion is more consistent with the existing flag, but on the
> flip side the new one will have a slightly different semantic...
> In the next revision I'll go with your suggestion, if nobody complains

Ok.

>
> > > @@ -423,6 +455,10 @@ \subsection{Device Operation}\label{sec:Device T=
ypes / Network Device / Device O
> > >          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT ne=
gotiated)
> > >          le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT ne=
gotiated)
> > >          le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT ne=
gotiated)
> > > +        le16 outer_th_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNE=
L_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> > > +        le16 inner_protocol;    (Only if VIRTIO_NET_F_HOST_UDP_TUNNE=
L_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> > > +        le16 inner_mac_offset;  (Only if VIRTIO_NET_F_HOST_UDP_TUNNE=
L_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> > > +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNE=
L_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> > >  };
> > >  \end{lstlisting}
> > >
> > > @@ -480,6 +516,8 @@ \subsubsection{Packet Transmission}\label{sec:Dev=
ice Types / Network Device / De
> > >  followed by the TCP header (with the TCP checksum field 16 bytes
> > >  into that header). \field{csum_start} will be 14+20 =3D 34 (the TCP
> > >  checksum includes the header), and \field{csum_offset} will be 16.
> > > +If the given packets has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit set,
> > > +the above checksum fields refer to the inner header checksum.
> >
> > Rethink of the design here, I have one dumb question:
> >
> > A simple csum_start/csum_offset can work for GSO without tunneling.
> > Any reason a inner_csum_start/inner_csum_offset (or simply introduce a
> > copies of other gso related fields in the existing vnet header for
> > outer packet) can't work for tunneling GSO? I feel if we need to do
> > thing differently it might a hint of bugs for existing GSO
> > definitions.
>
> Yes, the outer csum offload could work even without requiring the UDP
> tunnel GSO support but:
> - AFAIK H/W support for outer csum offload is not as widespread as
> other offload, it will restrict a lot the feasibility of H/W
> implementation backing this spec.
> - computing the outer csum given the presence of the inner one is very
> cheap in S/W - because thanks to LCO the S/W needs to touch only a very
> limited number of bytes to compute it.
>
> I can explicitly mention the above in the commit message of the next
> revision.

Just to make sure we are on the same page. I basically meant:

Without UDP tunneling, GSO works with simple csum_start/csum_offset.
It doesn't require things like mac/network offset.
With UDP tunneling, can we just invent
inner_csum_start/inner_csum_offset to make things just work?

>
> > >  \end{note}
> > >
> > >  \item If the driver negotiated
> > > @@ -516,6 +554,59 @@ \subsubsection{Packet Transmission}\label{sec:De=
vice Types / Network Device / De
> > >  specifically in the protocol.}.
> > >     \end{itemize}
> > >
> > > +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO =
feature,
> > > +  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} indicate=
s that
> > > +  the GSO protocol is encapsulated in an UDP tunnel. If the outer UD=
P header
> > > +  requires checksumming, the driver must have additionally negotiate=
d the
> > > +  VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature and offloaded the outer =
checksum
> > > +  accordingly.
> > > +  The other tunnel-related fields indicate how to replicate the inne=
r packet
> > > +  header to cut it into smaller packets:
> > > +
> > > +  \begin{itemize}
> > > +  \item \field{outer_th_offset} field indicates the outer transport =
header within
> > > +      the packet. Note that differs from \field{csum_start} as the l=
atter
> > > +      points to the inner transport header within the packet.
> > > +
> > > +  \item \field{inner_protocol} field indicates the ethernet type of =
the inner
> > > +      protocol.
> > > +
> > > +  \item \field{inner_mac_offset} field indicates the inner mac heade=
r within the packet
> > > +
> > > +  \item \field{inner_nh_offset} field indicates the inner network he=
ader within
> > > +      the packet
> > > +  \end{itemize}
> >
> > Should we add some words to here to clarify the segmetiaon offload
> > done here is protocol independent as Willem suggested like PISO:
> >
> > https://www.opencompute.org/w/index.php?title=3DCore_Offloads#Protocol_=
Independent_Segmentation_Offload
>
> I will specify that this is indepenent from the outer MAC header and
> from the tunnel protocol itself.
>
> > > @@ -557,6 +648,34 @@ \subsubsection{Packet Transmission}\label{sec:De=
vice Types / Network Device / De
> > >  driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
> > >  \field{gso_type}.
> > >
> > > +The driver MUST NOT send to the device TCP or UDP GSO packets over U=
DP tunnel
> > > +requiring segmentation offload, unless the VIRTIO_NET_F_HOST_UDP_TUN=
NEL_GSO is
> > > +negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO=
_UDP_TUNNEL
> > > +bit in the \field{gso_type}.
> > > +
> > > +The driver MUST NOT send to the device TCP or UDP GSO packets over U=
DP tunnel
> > > +requiring segmentation and outer UDP checksum offload, unless both t=
he
> > > +VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO and VIRTIO_NET_F_HOST_UDP_TUNNEL_CS=
UM features
> > > +are negotiated, in which case the driver MUST set the VIRTIO_NET_HDR=
_GSO_UDP_TUNNEL
> > > +bit in the \field{gso_type} and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM=
 bit in the \field{flags}.
> > > +
> > > +If VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM is not negotiated, the driver M=
UST not set
> > > +the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags} and, i=
n case of GSO
> > > +packets carried over an UDP tunnel, MUST either supply the full chec=
ksum for the
> > > +outer UDP header to the device or such checksum MUST be zero.
> > > +
> > > +\begin{note}
> > > +Is possible to supply the full checksum for the outer UDP header for
> > > +GSO packets over UDP tunnel, only when the GSO packet size is an int=
eger
> > > +multiple of \field{gso_size}.
> >
> > I may miss something but any reason we need this?
>
> H/W support for outer header csum offload is not a trivial thing.
>
> When all the segments have the same length (GSO partial), the outer
> csum value become constant and can be computed in advance to the
> segmentation itself (thanks to LCO),  allowing UDP tunnel segmentation
> offload for packets requiring outer csum even when the device is not
> capable of computing such csum.

I see.

>
> As GSO partial + LCO specification is non trivial and is raising
> questions on multiple fronts (see my previous reply to Willem), I plan
> to drop it from the next revision (unless someone complains soon!)

Fine with me.

Thanks

>
> >
> Thanks!
>
> Paolo
>

