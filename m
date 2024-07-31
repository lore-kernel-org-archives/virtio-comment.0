Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76DF12B63
	for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 01:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722391062; cv=none; b=SW7gbvBeI4GB3xmZyUu27w9PyI0ViaQDM9ixgC/CCd0sCvBi+PK5GYzoIyEbQRSLnowgyiggIyreAecITdvD9hqomYKcZLiFv8knPTKqIs+pT+QNu1kAMI/ekGbiuAg/ctj50GbWsDauiFKDdt2sv695pMEN1fP0DZDU2jS5amA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722391062; c=relaxed/simple;
	bh=CWhHezOEVh1xfi6Sg1cRw4ecDybJrPL1IrbMTz0d7Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdwAJOoeJ+DgOo6rUoZgFxQFzAJ5e9wwfHDftWQhJPctX9Ibb5kFGQgmNHTaZRc3qPUp7QKudxRIGpjGHzBgu7iV2uuKpyqmyrnUmwQ26ylmXDxDh3d2G24C5V3N62mENjc+QazXtb4hm9kCxaLcUKHz2aW7V73xs2hQXHQ4xI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VuoML5Th; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VuoML5Th"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722391058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5od++mVJoloeTW3zf2xkVzMHhN3QKDqhzFMe+yhggbo=;
	b=VuoML5Th4fAmUtAQtmu+Hrgh98jVrLEh+kkwYpz8YTG9rF9IjS4iqMjeCOyew5TpGObJqP
	8MIOclLZPBBmvIwwFBSNs4ldgyn4xkj+5P6/C9sygVdPKfNcEuqn0Jb9bImzBaygt5hd6y
	4fyWnyWEAtRexZ20BuZfv7bL8FjkghQ=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-D-atiSxcNRKh_Imn7udX3A-1; Tue, 30 Jul 2024 21:57:37 -0400
X-MC-Unique: D-atiSxcNRKh_Imn7udX3A-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2cb54eac976so5131742a91.0
        for <virtio-comment@lists.linux.dev>; Tue, 30 Jul 2024 18:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722391056; x=1722995856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5od++mVJoloeTW3zf2xkVzMHhN3QKDqhzFMe+yhggbo=;
        b=YyMVyz0xmE8q22dc4nKVB0iXKFvklrOJbGDhwxI34TO2yS2OCgXvO9t4M3Gg4u/H7Y
         X7ltOMYLJSVUcIkEIsAF+YN7D8EBVIVTKVlrBR+a5EKnE9GgI6Dg85JGGayJW7WZ4ND9
         E9btbGAwW3OLb67zN5hX9ZA35jqudKLO40260pMVm4l1sAvzKmgAUx71TdkClP6P0Nno
         UUFeJP4LlUF4XehGNfJ4r65Szx5l6k6ZNnVxV0hC2Sc54fQI/0rLh2tS4FMYdNEJpXOp
         y6k00RXMkP1s5wp0A9cfAuX9gha5zHx2op9fsM27L9tdb7lBrUYa2qesRzHSRzhfRudu
         wgNw==
X-Gm-Message-State: AOJu0YxHeO17n+KSIn3xmJdYM470wNj34miwXfuJNLu6Msg2YNoCUJ5h
	PArhaWLIeMz/+QmhKBh1ilzasROIEgjiPwCPyuVytkCoFTMKt/2d4aOmjMRq1ekaX9iEgjFx7nr
	VPmhYOm6EL299htU0g3gk4/ziNAr/PlTW+NtE30CATPM8DdN3j0vLge7ZiFXDrWmYrfV7KrelUA
	q08dfeoOfNxEwGuKZEpYaA08BMIa8BiBXTFxaOrxs=
X-Received: by 2002:a17:90b:1807:b0:2c8:ea7b:8891 with SMTP id 98e67ed59e1d1-2cf7e5c16f5mr10443184a91.29.1722391055651;
        Tue, 30 Jul 2024 18:57:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG78q7J3Hyumg7B76jLTsnfevH+45ImLV9OHod7uBigTq6kVBAf6gyF+kRKbO/B4ZzGftpKfwuj+mSI6bQcuZo=
X-Received: by 2002:a17:90b:1807:b0:2c8:ea7b:8891 with SMTP id
 98e67ed59e1d1-2cf7e5c16f5mr10443159a91.29.1722391054959; Tue, 30 Jul 2024
 18:57:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1722252302.git.pabeni@redhat.com> <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
In-Reply-To: <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 31 Jul 2024 09:57:23 +0800
Message-ID: <CACGkMEsOPcyUevsGcZeR8311-=5kGt5bRmxDQ3XGYQ3_S4Diyw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 7:30=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> The VIRTIO_NET_HDR_GSO_UDP_TUNNEL is a gso_type flag allowing GSO over
> UDP tunnel. It can be negotiated on both the host and guest sides.
>
> One constraint addressed here is that the virtio side (either device or
 > completely the inner and outer headers offset - to allow for later GSO.
>
> To accommodate such need, new fields are introduced in the virtio_net
> header: outer_th_offset, inner_protocol_type and inner_nh_offset.
> They map directly to the corresponding header information. The inner
> transport header is implied by the (inner) checksum offload.
>
> Those fields are required because a virtio device H/W implementation
> performing segmentation for UDP tunneled packet will need to touch
> the outer transport protocol (for the UDP length filed), the
> inner network protocol (for the total length field, in the IPv4
> case).
>
> Note that segmentation will additionally need to touch
> the outer network protocol and the inner transport protocol. The first
> is implied/easily found with trivial parsing, the latter is identified
> by the existing csum_start field.
>
> Note that there is no concept of UDP tunnel type negotiation (e.g.
> vxlan, geneve, vxlan-gpe, etc.), as a virtio device H/W implementation
> can perform segmentation for every possible UDP-tunnel given the
> specified new fields.
> In the reverse direction, if a virtio device H/W implementation receives
> some traffic for an unknown or unsupported UDP tunnel, it will simply
> not aggregate the wire packet in GSO one.
>
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> ---
> v5 -> v6:
>  - split in 2 patches
>  - dropped the unneeded outer_mh_offset field
> https://lore.kernel.org/virtio-comment/56ccba136272593d0d2af0303600c06f26=
bd84a1.1718621522.git.pabeni@redhat.com/
>
> v4 -> v5:
>  - add separate negotiation for UDP_TUNNEL_CSUM
>  - much more verbose specification of outer csum handling
>  - UDP_TUNNEL_CSUM requires GSO_UDP_TUNNEL
>  https://lore.kernel.org/virtio-comment/cb89d3d6b6a7e4a7f13e60dd3fded5e95=
0727890.1716448766.git.pabeni@redhat.com/
>
> v3 -> v4:
>  - new virtio_net_hdr fields depends on F_HOST_UDP_TUNNEL_GSO or
>    F_GUEST_UDP_TUNNEL_GSO (Stefano)
>  - Extended the changelog to answer Jason's questions.
>  - Clarified outer csum handling (Jason)
>  https://lore.kernel.org/virtio-dev/f0bf2db203f8061a3ecb50b7a48cf26d8f3c7=
f68.1716193086.git.pabeni@redhat.com
>
> v2 -> v3:
>  - UDP_TUNNEL -> UDP_TUNNEL_GSO
>  - add explicit fields for the inner meta-data
>  - more verbose changelog
>  https://lists.oasis-open.org/archives/virtio-dev/202206/msg00026.html
>
> v1 -> v2:
>  - explicitly state that the outer header probing is mandatory
>  - explicitly state that GSO_UDP is not allowed with GSO_UDP_TUNNEL
>  - clarify hdr_len usage
>  - clarify UDP_TUNNEL_CSUM bit usage
>  - fix a few typos
>  https://lists.oasis-open.org/archives/virtio-dev/202205/msg00037.html
> ---
>  device-types/net/description.tex | 118 +++++++++++++++++++++++++++++--
>  1 file changed, 112 insertions(+), 6 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index 76585b0..eda294d 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -88,6 +88,12 @@ \subsection{Feature bits}\label{sec:Device Types / Net=
work Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
>
> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (47)] Driver can receive GSO pac=
kets
> +  carried by a UDP tunnel.
> +
> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (49)] Device can receive GSO pack=
ets
> +  carried by a UDP tunnel.
> +
>  \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash fo=
r encapsulated packets.
>
>  \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue notificat=
ion coalescing.
> @@ -133,12 +139,16 @@ \subsubsection{Feature bit requirements}\label{sec:=
Device Types / Network Device
>  \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO] Requires both VIRTIO_NET_F_GUES=
T_TSO4 and VIRTIO_NET_F_GUEST_TSO6, or
> +   both VIRTIO_NET_F_GUEST_USO4 and VIRTIO_NET_F_GUEST_USO6.

I think VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO requires all of the four?

>
>  \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_N=
ET_F_HOST_TSO6.
>  \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires both VIRTIO_NET_F_HOST_=
TSO4 and VIRTIO_NET_F_HOST_TSO6, or
> +   both VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6.
>
>  \item[VIRTIO_NET_F_CTRL_RX] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_CTRL_VLAN] Requires VIRTIO_NET_F_CTRL_VQ.
> @@ -375,6 +385,12 @@ \subsection{Device Initialization}\label{sec:Device =
Types / Network Device / Dev
>    TCP), VIRTIO_NET_F_HOST_TSO6 (IPv6 TCP), VIRTIO_NET_F_HOST_UFO
>    (UDP fragmentation) and VIRTIO_NET_F_HOST_USO (UDP segmentation) featu=
res.
>
> +\item If any TCP or UDP segmentation feature is negotiated,

Not a native speaker but this seems to conflict with the above. For
example, does "only VIRTIO_NET_F_GUEST_TSO4 is negotiated" mean any
TCP segmentation feature?

> a driver can
> +  use TCP segmentation or UDP segmentation on top of UDP encapsulation
> +  offload, when the outer header does not require checksumming - e.g.
> +  the outer UDP checksum is zero - by negotiating the
> +  VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature.
> +
>  \item The converse features are also available: a driver can save
>    the virtual device some work by negotiating these features.\note{For e=
xample, a network packet transported between two guests on
>  the same system might not need checksumming at all, nor segmentation,
> @@ -382,8 +398,9 @@ \subsection{Device Initialization}\label{sec:Device T=
ypes / Network Device / Dev
>     The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
>    checksummed packets can be received, and if it can do that then
>    the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
> -  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO=
4
> -  and VIRTIO_NET_F_GUEST_USO6 are the input equivalents of the features =
described above.
> +  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO=
4,
> +  VIRTIO_NET_F_GUEST_USO6 and VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO
> +  are the input equivalents of the features described above.
>    See \ref{sec:Device Types / Network Device / Device Operation /
>  Setting Up Receive Buffers}~\nameref{sec:Device Types / Network
>  Device / Device Operation / Setting Up Receive Buffers} and
> @@ -413,6 +430,7 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Network Device / Device O
>  #define VIRTIO_NET_HDR_GSO_UDP         3
>  #define VIRTIO_NET_HDR_GSO_TCPV6       4
>  #define VIRTIO_NET_HDR_GSO_UDP_L4      5
> +#define VIRTIO_NET_HDR_GSO_UDP_TUNNEL 0x40
>  #define VIRTIO_NET_HDR_GSO_ECN      0x80
>          u8 gso_type;
>          le16 hdr_len;
> @@ -423,6 +441,9 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Network Device / Device O
>          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
>          le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
>          le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
> +        le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O negotiated)
> +        le16 inner_protocol_type;(Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_G=
SO negotiated)
> +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O negotiated)
>  };
>  \end{lstlisting}
>
> @@ -480,6 +501,8 @@ \subsubsection{Packet Transmission}\label{sec:Device =
Types / Network Device / De
>  followed by the TCP header (with the TCP checksum field 16 bytes
>  into that header). \field{csum_start} will be 14+20 =3D 34 (the TCP
>  checksum includes the header), and \field{csum_offset} will be 16.
> +If the given packet has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit set,
> +the above checksum fields refer to the inner header checksum.
>  \end{note}
>
>  \item If the driver negotiated
> @@ -516,6 +539,26 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>  specifically in the protocol.}.
>     \end{itemize}
>
> +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feat=
ure,
> +  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} indicates th=
at
> +  the GSO protocol is encapsulated in a UDP tunnel.
> +  The outer UDP header must not require checksumming, e.g. the outer UDP=
 checksum
> +  must be zero.
> +  The other tunnel-related fields indicate how to replicate the packet
> +  headers to cut it into smaller packets:
> +
> +  \begin{itemize}
> +  \item \field{outer_th_offset} field indicates the outer transport head=
er within
> +      the packet. Note that such field differs from \field{csum_start} a=
s the latter
> +      points to the inner transport header within the packet

I wonder if it's better to stick to outer_csum_start, and say it's
offset within the packet to begin checksumming for outer packet.  This
follows the existing name and could be reused for encapsulation other
than UDP tunnel.

> +
> +  \item \field{inner_protocol_type} field indicates the ethernet type of=
 the inner
> +      protocol.
> +
> +  \item \field{inner_nh_offset} field indicates the inner network header=
 within
> +      the packet.
> +  \end{itemize}
> +
>  \item \field{num_buffers} is set to zero.  This field is unused on trans=
mitted packets.
>
>  \item The header and packet are added as one output descriptor to the
> @@ -557,6 +600,18 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>  driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
>  \field{gso_type}.
>
> +The driver MUST NOT send to the device TCP or UDP GSO packets over UDP t=
unnel
> +requiring segmentation offload, unless the VIRTIO_NET_F_HOST_UDP_TUNNEL_=
GSO is
> +negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_UDP=
_TUNNEL
> +bit in \field{gso_type}.

Is this better to follow the existing style of the driver normative?
For example, we had

"If VIRTIO_NET_F_HOST_TSO6 is negotiated, the driver MAY set gso_type
to VIRTIO_NET_HDR_GSO_TCPV6 to request TCPv6 segmentation, otherwise
the driver MUST NOT set gso_type to VIRTIO_NET_HDR_GSO_TCPV6."

We could do the same

"If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY ...
otherwise the driver MUST NOT ..."

> +
> +The driver MUST NOT send to the device TCP or UDP GSO packets over UDP t=
unnel
> +requiring segmentation and outer UDP checksum offload.
> +
> +The driver MUST NOT set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL together with
> +VIRTIO_NET_HDR_GSO_UDP, as the latter is deprecated in favor of UDP_L4
> +and no new features will support it.
> +
>  If the VIRTIO_NET_F_CSUM feature has been negotiated, the
>  driver MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
>  \field{flags}, if so:
> @@ -598,6 +653,28 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>         header.
>  \end{itemize}
>
> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has been negotiated, the
> +driver MAY set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type}=
, if so:
> +\begin{itemize}
> +\item the driver MUST set \field{outer_th_offset} to the outer UDP heade=
r
> +  offset, \field{inner_protocol_type} to the ethernet type of the inner
> +  protocol, and \field{inner_nh_offset} to the inner network header offs=
et.
> +\end{itemize}

Do we need to say then csum_start and csum_offset is for the inner packet h=
ere?

> +
> +If the bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL in \field{gso_type} is set, the=
 outer
> +UDP header MUST NOT require checksumming. That is the, the outer UDP che=
cksum
> +value must be 0, or the valid complete checksum for such header.
> +
> +\begin{note}
> +The valid complete checksum of the outer UDP header of individual segmen=
ts
> +can be computed by the driver prior to segmentation only if the GSO pack=
et
> +size is a multiple of \field{gso_size}.
> +\end{note}
> +
> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has not
> +been negotiated, the driver MUST NOT set the VIRTIO_NET_HDR_F_UDP_TUNNEL=
 bit
> +in \field{gso_type}.
> +
>  The driver SHOULD accept the VIRTIO_NET_F_GUEST_HDRLEN feature if it has
>  been offered, and if it's able to provide the exact header length.
>
> @@ -633,6 +710,10 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>         \end{note}
>  \end{itemize}
>
> +If VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} is not set, the
> +device MUST NOT use the \field{outer_th_offset}, \field{inner_protocol_t=
ype}
> + and \field{inner_nh_offset}.
> +
>  If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
>  rely on the packet checksum being correct.
>  \paragraph{Packet Transmission Interrupt}\label{sec:Device Types / Netwo=
rk Device / Device Operation / Packet Transmission / Packet Transmission In=
terrupt}
> @@ -727,8 +808,8 @@ \subsubsection{Processing of Incoming Packets}\label{=
sec:Device Types / Network
>    has been validated.
>  \end{enumerate}
>
> -Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP and ECN
> -features enable receive checksum, large receive offload and ECN
> +Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
> +and ECN features enable receive checksum, large receive offload and ECN
>  support which are the input equivalents of the transmit checksum,
>  transmit segmentation offloading and ECN features, as described
>  in \ref{sec:Device Types / Network Device / Device Operation /
> @@ -750,8 +831,14 @@ \subsubsection{Processing of Incoming Packets}\label=
{sec:Device Types / Network
>    from \field{csum_start} and any preceding checksums
>    have been validated.  The checksum on the packet is incomplete and
>    if bit VIRTIO_NET_HDR_F_RSC_INFO is not set in \field{flags},
> -  then \field{csum_start} and \field{csum_offset} indicate how to calcul=
ate it
> -  (see Packet Transmission point 1).
> +  then \field{csum_start} and \field{csum_offset} indicate how to calcul=
ate it.
> +  If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit is set, the \field{csum_start=
} field
> +  refers to the inner transport header offset (see Packet Transmission p=
oint 1).
> +\item If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO option was negotiated and
> +  \field{gso_type} is not VIRTIO_NET_HDR_GSO_NONE, the VIRTIO_NET_HDR_GS=
O_UDP_TUNNEL
> +  bit MAY be set. In such case the \field{outer_th_offset}, \field{inner=
_protocol_type},
> +  and \field{inner_nh_offset} fields indicate the corresponding
> +  headers information.
>
>  \end{enumerate}
>
> @@ -796,6 +883,9 @@ \subsubsection{Processing of Incoming Packets}\label{=
sec:Device Types / Network
>  If none of VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 have been =
negotiated,
>  the device MUST NOT set \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
>
> +If VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO is not negotiated the device MUST N=
OT set
> +the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type}.
> +
>  The device SHOULD NOT send to the driver TCP packets requiring segmentat=
ion offload
>  which have the Explicit Congestion Notification bit set, unless the
>  VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
> @@ -819,6 +909,17 @@ \subsubsection{Processing of Incoming Packets}\label=
{sec:Device Types / Network
>         fully checksummed packet;
>  \end{enumerate}
>
> +The device MUST NOT send to the driver TCP or UDP GSO packets encapsulat=
ed in UDP
> +tunnel and requiring segmentation offload, unless the
> +VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO is negotiated, in which case the devic=
e MUST set
> +the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} and MUST set t=
he
> +\field{outer_th_offset}, \field{inner_protocol_type} and
> +\field{inner_nh_offset} fields to the corresponding header information, =
and the outer
> +UDP header MUST NOT require checksum offload.

Similarly, do we need to say csum_start|offset is for inner?

> +
> +The device MUST NOT send the driver TCP or UDP GSO packets encapsulated =
in UDP
> +tunnel and requiring segmentation and outer checksum offload.
> +
>  If none of the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options =
have
>  been negotiated, the device MUST set \field{gso_type} to
>  VIRTIO_NET_HDR_GSO_NONE.
> @@ -867,6 +968,10 @@ \subsubsection{Processing of Incoming Packets}\label=
{sec:Device Types / Network
>  VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
>  rely on the packet checksum being correct.
>
> +If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_GSO bit in \field{gso_type} is not =
set,
> +the driver MUST NOT use the \field{outer_th_offset}, \field{inner_protoc=
ol_type},
> +\field{inner_mac_offset} and \field{inner_nh_offset}.
> +
>  \paragraph{Hash calculation for incoming packets}
>  \label{sec:Device Types / Network Device / Device Operation / Processing=
 of Incoming Packets / Hash calculation for incoming packets}
>
> @@ -1624,6 +1729,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Network Device / Devi
>  #define VIRTIO_NET_F_GUEST_TSO6       8
>  #define VIRTIO_NET_F_GUEST_ECN        9
>  #define VIRTIO_NET_F_GUEST_UFO        10
> +#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  47
>  #define VIRTIO_NET_F_GUEST_USO4       54
>  #define VIRTIO_NET_F_GUEST_USO6       55
>
> --
> 2.45.2
>

Thanks

