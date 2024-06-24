Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE69F143C5C
	for <virtio-comment@lists.linux.dev>; Mon, 24 Jun 2024 15:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719244030; cv=none; b=AVx10c+YOv7740MBQBvh7nelWNgHcOrfC6YEL8YiodNQ0WF8nEIEuINy9dhVpMfP6CJNp3W6WW6AlnsVXC55UH3sGEMpxmrhiV0d/ck+1wSWdrv+PID/kZrSIM9XRNNjd54g3Glj0rKLuMw4KdywUeYZumuO/W+2oXvuTVgzw18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719244030; c=relaxed/simple;
	bh=TWUBL1tysBJ370TnCSSaOF9xIngQoppDgvW1xy3GaR8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lCPU8zgVnlFmOjZx8HpTLrSBiI4Mj91DoKfoOJgcN/vt3hZPg5nhK1YMpTMtiLp6gtsGRqGp/+p4ikBAZ6b14Rwnemy8jqRbd3P/Jf9IYZeQtGs6KOFJmB3fZ88Tk1mOYHXygTkqKeVfvmTI2ViXwHWlQ01WL1rFwym4thq+c7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NfhAb0SC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NfhAb0SC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719244027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tAxCtUqqSE9/6FwbWqNDlZxP0yYmdBNiHruHB2Y9j4A=;
	b=NfhAb0SCaRF6UwFBeBhVY0jjeBiAnL30QoL2QDGhNsWF7JO6uStXhsMDIo1TyJv7OvMwU/
	qd83rGRwx4z5u/R/JBfaoVDcahTFPDM7EsZJRCWWyJaycjf5JbWOqnVMlOv4c+U0xG4r9D
	UmVCN5kHW+lemnjwfHjOKA+UPWv2VBI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-Ytcy9ipmPm6mksUkLadFJg-1; Mon, 24 Jun 2024 11:47:06 -0400
X-MC-Unique: Ytcy9ipmPm6mksUkLadFJg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-36499139786so493167f8f.1
        for <virtio-comment@lists.linux.dev>; Mon, 24 Jun 2024 08:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719244025; x=1719848825;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAxCtUqqSE9/6FwbWqNDlZxP0yYmdBNiHruHB2Y9j4A=;
        b=cydxfY1URkNTLakbBlcdbQVCgLTo3hjkO9IqaMKqrYtwJFu5f3TvRV7Sc4Mpb1H6om
         CML2HuKuGpJIkdhoeeRLliTG402mGSA4TuljM/E3w0CfBf/Dz00cLwOl2tOKuOe0B9Q/
         yjMblg0S0zmepVnlRu6IbrklGs9LVcdDXeH/qyYZEZAtmkjzEuofWE6M2k0uXYYpy952
         e+cq1P9FJK0dC3zVYhNwFYohezBngnyip8SUCL7TmiPBtm+BvT+rjKnDN09Y/bPp3HJ9
         xGhlV8lgLfYTYtBjzu7XiJyLYKhoZsFK0c99uOq4dNgtF1khjXXPI1iSl7osr9xRTBZK
         lzzg==
X-Gm-Message-State: AOJu0YyNVikye/D2ld6l2iMYJx71vfU7i7xhwiWsqMOu+qCUn6VV+knz
	q4nqEbHtUEHB2nBAm5iPk3047Esab4a46NnqrVCxBkQ02LUH+C/2ki+xhjtyWULNmU97lJO3LV9
	8vEVC1XJQ/Z3Ejv0WCCIVkIwWnS77M6aS20i2ToFtnTCCYaerV3JpXbSIFKHEHUEG
X-Received: by 2002:a05:600c:470f:b0:422:78c:82f6 with SMTP id 5b1f17b1804b1-42487ef1ef5mr52892465e9.3.1719244024652;
        Mon, 24 Jun 2024 08:47:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH4CdukWbdUU+R/inXGpHS11cSeTzR4gkjrYpECivMlWRiPutgekguAVUztQXDiSqERziRfQ==
X-Received: by 2002:a05:600c:470f:b0:422:78c:82f6 with SMTP id 5b1f17b1804b1-42487ef1ef5mr52892195e9.3.1719244024174;
        Mon, 24 Jun 2024 08:47:04 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3341:b0ae:da10::739])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d2122e7sm181195195e9.40.2024.06.24.08.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:47:03 -0700 (PDT)
Message-ID: <ed07e9bb9ae5bc1a171c77425cc0b96e6b87745c.camel@redhat.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, Eelco
 Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>
Date: Mon, 24 Jun 2024 17:47:02 +0200
In-Reply-To: <CACGkMEt-Ep+At_4YvkJ2t8UmQHJ0-Qm6fAPbGpkV_AfVyNq2EA@mail.gmail.com>
References: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
	 <CACGkMEt-Ep+At_4YvkJ2t8UmQHJ0-Qm6fAPbGpkV_AfVyNq2EA@mail.gmail.com>
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

On Mon, 2024-06-24 at 11:07 +0800, Jason Wang wrote:
> On Mon, Jun 17, 2024 at 6:52=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> w=
rote:
> >=20
> > The VIRTIO_NET_HDR_GSO_UDP_TUNNEL is a gso_type flag allowing GSO over
> > UDP tunnel. It can be negotiated on both the host and guest sides.
> >=20
> > UDP tunnel usage is ubiquitous in container deployment, and the ability
> > to offload UDP encapsulated GSO traffic impacts greatly the performance=
s
> > and the CPU utilization of such use cases.
> >=20
> > One constraint addressed here is that the virtio side (either device or
> > driver) receiving a UDP tunneled GSO packet must be able to reconstruct
> > completely the inner and outer headers offset - to allow for later GSO.
> >=20
> > To accommodate such need, new optional fields are introduced in the
> > virtio_net header: outer_th_offset, inner_protocol, inner_mac_offset,
> > inner_nh_offset. They map directly to the corresponding header
> > information. The inner transport header is implied by the (inner)
> > checksum offload.
>=20
> Does this mean csum_start in the vnet header actually?

Yes. I thought the wording was unambiguous?!?

> > diff --git a/device-types/net/description.tex b/device-types/net/descri=
ption.tex
> > index 76585b0..d6f9f79 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -88,6 +88,18 @@ \subsection{Feature bits}\label{sec:Device Types / N=
etwork Device / Feature bits
> >  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
> >      channel.
> >=20
> > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (47)] Driver can receive GSO p=
ackets
> > +  carried by an UDP tunnel.
> > +
> > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM (48)] Driver handles packets
> > +  carried by an UDP tunnel with partial csum for the outer header.
>=20
> Could we separate the outer csum into another patch to converge sooner?

Given that both you and Willem are asking for it, I guess I'll have
to:)

> > +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (49)] Device can receive GSO pa=
ckets
> > +  carried by an UDP tunnel.
> > +
> > +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM (50)] Device handles packets
> > +  carried by an UDP tunnel with partial csum for the outer header.
> > +
> >  \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash =
for encapsulated packets.
> >=20
> >  \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue notific=
ation coalescing.
> > @@ -133,12 +145,18 @@ \subsubsection{Feature bit requirements}\label{se=
c:Device Types / Network Device
> >  \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
> >  \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
> >  \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_GUEST_T=
SO4, VIRTIO_NET_F_GUEST_TSO6,
> > +   VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6.
>=20
> For "or" I think you meant "and" actually?

No, just any (one) of the above options is sufficient for UDP tunnel
GSO sake. Why do you want to mandate all of them?

>=20
> > @@ -407,12 +437,14 @@ \subsection{Device Operation}\label{sec:Device Ty=
pes / Network Device / Device O
> >  #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
> >  #define VIRTIO_NET_HDR_F_DATA_VALID    2
> >  #define VIRTIO_NET_HDR_F_RSC_INFO      4
> > +#define VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM 8
>=20
> Not a native speaker but following the name style does
> _F_UDP_TUNNEL_NEEDS_CSUM sounds better here?

Not a native speaker here, too :)
Your suggestion is more consistent with the existing flag, but on the
flip side the new one will have a slightly different semantic...=20
In the next revision I'll go with your suggestion, if nobody complains

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
> > +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_=
GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> >  };
> >  \end{lstlisting}
> >=20
> > @@ -480,6 +516,8 @@ \subsubsection{Packet Transmission}\label{sec:Devic=
e Types / Network Device / De
> >  followed by the TCP header (with the TCP checksum field 16 bytes
> >  into that header). \field{csum_start} will be 14+20 =3D 34 (the TCP
> >  checksum includes the header), and \field{csum_offset} will be 16.
> > +If the given packets has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit set,
> > +the above checksum fields refer to the inner header checksum.
>=20
> Rethink of the design here, I have one dumb question:
>=20
> A simple csum_start/csum_offset can work for GSO without tunneling.
> Any reason a inner_csum_start/inner_csum_offset (or simply introduce a
> copies of other gso related fields in the existing vnet header for
> outer packet) can't work for tunneling GSO? I feel if we need to do
> thing differently it might a hint of bugs for existing GSO
> definitions.

Yes, the outer csum offload could work even without requiring the UDP
tunnel GSO support but:
- AFAIK H/W support for outer csum offload is not as widespread as
other offload, it will restrict a lot the feasibility of H/W
implementation backing this spec.
- computing the outer csum given the presence of the inner one is very
cheap in S/W - because thanks to LCO the S/W needs to touch only a very
limited number of bytes to compute it.

I can explicitly mention the above in the commit message of the next
revision.

> >  \end{note}
> >=20
> >  \item If the driver negotiated
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
> > +
> > +  \item \field{inner_mac_offset} field indicates the inner mac header =
within the packet
> > +
> > +  \item \field{inner_nh_offset} field indicates the inner network head=
er within
> > +      the packet
> > +  \end{itemize}
>=20
> Should we add some words to here to clarify the segmetiaon offload
> done here is protocol independent as Willem suggested like PISO:
>=20
> https://www.opencompute.org/w/index.php?title=3DCore_Offloads#Protocol_In=
dependent_Segmentation_Offload

I will specify that this is indepenent from the outer MAC header and
from the tunnel protocol itself.

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
>=20
> I may miss something but any reason we need this?

H/W support for outer header csum offload is not a trivial thing.=C2=A0

When all the segments have the same length (GSO partial), the outer
csum value become constant and can be computed in advance to the
segmentation itself (thanks to LCO),  allowing UDP tunnel segmentation
offload for packets requiring outer csum even when the device is not
capable of computing such csum.

As GSO partial + LCO specification is non trivial and is raising
questions on multiple fronts (see my previous reply to Willem), I plan
to drop it from the next revision (unless someone complains soon!)

>=20
Thanks!

Paolo

