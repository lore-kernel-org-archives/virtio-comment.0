Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F9914B97E
	for <virtio-comment@lists.linux.dev>; Wed, 19 Jun 2024 13:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718803639; cv=none; b=H2AF2kM37/GVioEl8fBxd3rNk0vVfq7TmbYHKs8levhz/K61e0ATYd6PEILHUfGN6yZNlMJDAb+vQOVYvMvrOyVSTtAVGDR5FTe7XdYSpOa5qE0WRHNX51U4G/coCfD/5/m3BYc7rgr/9OyfesUuci7YJ2C1thK3QHm2kyH+iyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718803639; c=relaxed/simple;
	bh=58yp8NSmDsbergZikI5fjXJL1L24PGtsloeHgLjVYy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRS405EBlaYqcMi6Tdb/xX3Duhz/UjUQokiow6m9oDJviFtfbUi/tOEsbVJLK8iwncoJqnIAKyAPKsOrKG4Cbg7pmguUd7ajN6bXoSbOiIJRxcyw7vS8gowL2DouNlIzCcjPTc3FhNPTRumqWRZU2E0GRB2gqMcY2Kn7juaXuG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U/bXqJaj; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U/bXqJaj"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-44056f72257so352761cf.0
        for <virtio-comment@lists.linux.dev>; Wed, 19 Jun 2024 06:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718803636; x=1719408436; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThAmJOKPtw5onM+y24m49o9r8Wfw5SVNFjRkJlk6Ybk=;
        b=U/bXqJajGlX5FNMWd1GpyXt8sOtMSUdCRapR582wzQzANdQNk0MmE9juPueXEv8CK3
         RHvgZjWxpanVIzclArWB7KpjsmzsopISdaDTm7BjpEL2PzojT7YaMjwgBxCMqxgWMtsI
         aytBcLWZGtM9jw2p82jyPKHeM5UIylz44YpidgLYTsrSv2IaAZwj/ywDB08VE0jqsCsY
         gETRVGDCgU9hUOKiBT49VtepNuDFhwjwgVRXtVDrU894YcwCIXfTDAGdgVpHx3oa4KAZ
         DX77flZg8KLJaQfiC4R5OP4m+ln1q82JVwjYVM+zdqsLoZ+aWd7+3WNTWTIxu4PahTU7
         vtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718803636; x=1719408436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThAmJOKPtw5onM+y24m49o9r8Wfw5SVNFjRkJlk6Ybk=;
        b=kQ5OXaenH8ZWb5mbbyHzrd04Usqg68RU0GQrwDYXuqSK4cD88vV1L0cA+XeEd6Eavf
         bz10PIAfy0c9IezrA3Bv11UXDkGaB779REGLtmjUQfnlZtex5sGTL0RAOlShJPVO5mrw
         I/AqdeykUu8YYrSh47lpAYL/C21qlk7N6VTj88QvWrFHXGfcnfHZZv5QPdX6G21Aqs9Y
         NW82Xg2Xjs3lq9rApHbnas8lr18CENMyZz+rvmkVTTnlcD4CS6/72VF3FKuqPWdAzNM4
         4cDhVXJ6F+If9yy7lGU85Ihd3/cbmzhTw3teeaciTAPT7AOMemNjvaocscwGBf69e9vb
         oB+w==
X-Forwarded-Encrypted: i=1; AJvYcCXpWrt+c6aCuKMOtPaiCi/E5mnBQoyvpMQG5PtGUdX3EVlJZwfohTz/m2ZupXUcmnmB8eoT/7vh+Nxnc54fxmEAY2TMlOEkW0p6g0UIrxU=
X-Gm-Message-State: AOJu0Yz2PFvUxmV78zhYvK1VyCb6WYwQkYHSyfr7OdWVy6KVX2pJzWR4
	2o/9CcJZXAB16uD2nFZPrDsPf0Cknbeic0Fm4LPLRLS+3phIsu7egvOvE/e8wynNSWgYFfTpCje
	i+vqLJZgi7x6StMjFd37EVs9Ipeuiy+tyKD8a
X-Google-Smtp-Source: AGHT+IGlhS05ZamOGDSoOMpX4rx2eCEpUcyW5w+qkrr7Ewa3B2qXWB42uTYfBTo8uFZ1I6aD7CduyZFHiFD/+Difhrs=
X-Received: by 2002:ac8:5a81:0:b0:444:938e:5ce0 with SMTP id
 d75a77b69052e-444a8b53ad7mr3878841cf.0.1718803636211; Wed, 19 Jun 2024
 06:27:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
 <CA+FuTSdVUre71ULgi8wnRZsCeHn1WqJMJmc7iDzUhaYB2nidLQ@mail.gmail.com> <7effaf20b981c427f7ad396c29464da685b3a822.camel@redhat.com>
In-Reply-To: <7effaf20b981c427f7ad396c29464da685b3a822.camel@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Wed, 19 Jun 2024 15:26:38 +0200
Message-ID: <CA+FuTSd8PYnjGrF-L2t0=M0p9A=Ctxh4-uy=ta8XgEs5iWRtwQ@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 12:37=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> Hi,
>
> Thank you for the feedback!
>
> On Tue, 2024-06-18 at 18:15 +0200, Willem de Bruijn wrote:
> > On Mon, Jun 17, 2024 at 12:52=E2=80=AFPM Paolo Abeni <pabeni@redhat.com=
> wrote:
> >
> > > @@ -133,12 +145,18 @@ \subsubsection{Feature bit requirements}\label{=
sec:Device Types / Network Device
> > >  \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
> > >  \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
> > >  \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> > > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_GUEST=
_TSO4, VIRTIO_NET_F_GUEST_TSO6,
> > > +   VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6.
> > > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM] Requires VIRTIO_NET_F_GUES=
T_UDP_TUNNEL_GSO
> >
> > Should this dependency be the other way around? GSO/GRO requires Tx/Rx
> > checksum offload, but not vice versa.
> >
> > Or is this effectively VIRTIO_NET_F_GUEST_UDP_TUNNEL_*GSO*_CSUM?
> >
> > It sounds like there may even be three features here: UDP_TUNNEL,
> > UDP_TUNNEL_CSUM and UDP_TUNNEL_GSO.
> >
> > It may make sense to split the patch into two (or three) patches?
>
> VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM is intended just for GSO packets. I
> could probably rename it accordingly.

I do think that that will be a bit more self-documenting. But totally up to=
 you.

> As such it really depends on
> VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO. This is intentionally the opposite
> of the relationship between the inner csum feature and plain GSO.
>
> The take-away I got from the feedback on the previous revision is that
> outer checksum offload for UDP tunneled non GSO packets does not help
> much - as computing the outer csum is cheap.
>
> I would avoid introducing an additional feature bit just for that.

I agree.

UDP_TUNNEL is also useful without GSO. But perhaps to minimize
the number of states, it is fine to require GSO support when adding
udp tunneling at all.

> This change is becoming rater big, I guess I can split it in 2 patches,
> but I fear a strong interdependence that would make both the split and
> the review hard.
>
> If we avoid the additional feature bit, it think the change should be
> manageable with a single patch.

The main reason for asking is that it may be simpler to spot any
unintended interdependencies. The first patch has no dependencies
on the second patch.

But just a thought, no hard preference.

> > > @@ -375,6 +393,16 @@ \subsection{Device Initialization}\label{sec:Dev=
ice Types / Network Device / Dev
> > >    TCP), VIRTIO_NET_F_HOST_TSO6 (IPv6 TCP), VIRTIO_NET_F_HOST_UFO
> > >    (UDP fragmentation) and VIRTIO_NET_F_HOST_USO (UDP segmentation) f=
eatures.
> > >
> > > +\item If any TCP or UDP segmentation feature is negotiated, a driver=
 can
> > > +  use TCP segmentation or UDP segmentation on top of UDP encapsulati=
on
> > > +  offload, when the outer header does not require checksumming,
> > > +  by negotiating the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature.
> > > +
> > > +\item If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, a driver ca=
n
> > > +  additionally use TCP segmentation or UDP segmentation on top of UD=
P
> > > +  encapsulation with the outer header requiring checksum offload,
> > > +  negotiating the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature.
> >
> > Please also make explicit what is expected of udp tunnel offload
> > without checksum offload, on both tx and rx: one of outer checksum is
> > zero, or it is computed/validated in software (does not work with
> > GSO/GRO, of course, so I assume you mean the first only).
>
> That is somewhat explained in later section - "Device Operation".
> Looking at the existing document layout I think the latter is better
> suited for such specification, should I somewhat duplicate the wording
> here?

UDP tunneling with zero outer checksum is also common. Please
do make explicit whether that is acceptable.

And for the other case, software computes the checksum, i.e.,
partial GSO, do you state explicitly that all segments must be
equal length and the outer headers already prepared for the segments,
to be able to compute their checksum ahead of time?

I don't mean to push for partial GSO, btw, if you prefer full
offload of both outer and inner checksum, with full segmentation
offload. It might just be supported by fewer NICs?

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
> >
> > Inner protocol is the inner mac protocol e.g., ARPHRD_ETHER? To be
> > able to parse the inner mac protocol (and from that the inner network
> > protocol). [update: answered below, see next inline response for
> > follow-on]
> >
> > And it is the inner network header if no mac header is present?
> >
> > How to detect that case should also be made explicit. E.g.,
> > inner_nh_offset =3D=3D inner_mac_offset, or inner_mac_offset =3D=3D 0. =
Even if
> > that is not supported yet. To make sure that we can detect it and
> > support it in the future.
>
> To me the specification above means that when inner_nh_offset =3D=3D
> inner_mac_offset there is no mac header and inner_protocol identify the
> L3 header (ipv4 vs ipv6). I can make such expectation explicit. It
> should both cover your intended use case and pose no hard (difficult to
> meet) requirements on hardware implementations.

Great. Yes, please do.

>
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
> >
> > That answers my above question. But is this needed if it can be read
> > from the inner mac header (when the inner link layer type is known)?
> >
> > We should try to add the minimum number of fields required. Are all
> > these fields required, or can some (like this) be derived easily from
> > the others?
>
> I think I discussed this point with Jason in the past revisions. We can
> use less new fields, but that will require some parsing. I understand
> that Jason prefers no parsing at all. To that extend AFAICS we need all
> the new fields listed here - to be able to fully reconstruct the
> information/skb fields for either GSO or TSO.

Ok. I just wonder whether the choice of fields here is very Linux (and
struct sk_buff) specific.

>
> > > +  \item \field{inner_mac_offset} field indicates the inner mac heade=
r within the packet
> > > +
> > > +  \item \field{inner_nh_offset} field indicates the inner network he=
ader within
> > > +      the packet
> > > +  \end{itemize}
> > > +
> > > +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM=
 feature,
> > > +  the transimitted packet is a GSO one encapsulated in an UDP tunnel=
, and
> >
> > typo: transmitted
>
> FTR, I pushed this into codespell, I will look for something better
> next time.
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
> > > +\end{note}
> > > +
> > > +The driver MUST NOT set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL together w=
ith
> > > +VIRTIO_NET_HDR_GSO_UDP.
> >
> > Perhaps explain why: VIRTIO_NET_HDR_GSO_UDP is fragmentation offload,
> > which is deprecated in favor of UDP_L4 and no new features will
> > support it.
>
> I will do in the next revision.
>
> > > +The driver MUST NOT set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit \fi=
eld{flags}
> > > +without setting the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO bit in \field{g=
so_type}.
> > > +
> > >  If the VIRTIO_NET_F_CSUM feature has been negotiated, the
> > >  driver MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
> > >  \field{flags}, if so:
> > > @@ -598,6 +717,45 @@ \subsubsection{Packet Transmission}\label{sec:De=
vice Types / Network Device / De
> > >         header.
> > >  \end{itemize}
> > >
> > > +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has been negotiated, =
the
> > > +driver MAY set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_t=
ype}, if so:
> > > +\begin{itemize}
> > > +\item the driver MUST set the \field{outer_th_offset} to the outer U=
DP header
> > > +  offset, the \field{inner_protocol} to the ethernet type of the inn=
er
> > > +  protocol, the \field{inner_mac_offset} to the inner mac header off=
set and
> > > +  the \field{inner_nh_offset} to the inner network header offset.
> > > +\end{itemize}
> > > +
> > > +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature has been negotiated=
, and the
> > > +bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL in \field{gso_type} is set, the
> > > +driver MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
> > > +\field{flags}, if so:
> > > +\begin{enumerate}
> > > +\item the driver MUST validate the packet checksum at
> > > +       offset 6 from \field{outer_th_offset} as well as all
> > > +       preceding offsets;
> > > +\item the driver MUST set the packet checksum stored in the
> > > +       buffer to the outer UDP pseudo header;
> > > +\item the driver MUST set \field{outer_th_offset} and such that calc=
ulating a ones'
> > > +       complement checksum from \field{outer_th_offset} up until the=
 end of
> > > +       the packet and storing the result at offset 6 from  \field{ou=
ter_th_offset}
> > > +       will result in a fully checksummed outer UDP packet;
> > > +\end{enumerate}
> > > +Otherwise, if the bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL in \field{gso_ty=
pe} is set and
> > > +the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{gso_type} is clea=
red, the driver
> > > +MUST either set the outer UDP checksum to 0 or set it to the full ou=
ter UDP header
> > > +value. To compute the full outer UDP header value the driver MUST:
> > > +\begin{enumerate}
> > > +\item set the outer UDP checksum to 0
> > > +\item calculate the ones'complement checksum from \field{outer_th_of=
fset} to
> > > +  \field{csum_start}
> >
> > This is not the full outer checksum.
> >
> > Is the intent to work with inner checksum offload? If so, it requires m=
ore steps
> > both for partial GSO and even without GSO where the inner checksum incl=
udes
> > the inner pseudo header.
>
> Yes, my writing is not correct, I was hasty.
>
> Note that (to keep things simple) this spec basically restricts to LCO
> in the partial GSO case, and requires fallback to segmentation in other
> cases asking for outer csum offload.

How are these two cases distinguished? As in: what does a device
sign up for when it advertises VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM

> >
> Wrapping-up, AFAICT, the most critical points raised here are:
> * add a separate feature bit for CSUM offload in the UDP tunnel non GSO
> case -> I would avoid that if possible, due to the (little) gain/added
> complexity rate.

Ack. Fine to skip.

I'm more interested in udp tunnel offload without requiring advertising
GSO. But in practice all devices advertise TSO and increasingly USO,
so probably that is moot.

> * reducing the number of added fields. My understanding is that Jason
> is against it (at that will require more parsing), see:
>
> https://lists.oasis-open.org/archives/virtio-dev/202207/msg00003.html
>
> (unfortunately most of the discussion on previous revisions was
> threaded separately from the original post).
>
> Thanks for your time,
>
> Paolo
>
