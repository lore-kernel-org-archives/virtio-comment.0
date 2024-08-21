Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A99616A92F
	for <virtio-comment@lists.linux.dev>; Wed, 21 Aug 2024 19:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724268530; cv=none; b=q5AnH6uoEpiO827d5FeO8CgJdWBecaAcsz4GryXMZC7qrzcC18IunAqzSMf3LH05j0NrjMX+5VvsYjf2UTQZF79YoGrGmg4iyrTWK/cQxvtAtz4JzZItatf6Lp4ZU4epbiIXT5T73fBLSmYoYaJXKdmeR7UTlTUDd0YymOMHmdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724268530; c=relaxed/simple;
	bh=Qj4SZB8vcRM5skij0BsbULde5tK/8Da/vCfPLkcqyDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XHR9x1TG3TkOuwdRSN3t9/50KmFHfajzzdUUQ0soj3qkmjdt/3NxL1nMufV2gvHhAR3eUEPKYKHnsBqixyQQwwGiibPizd8zaVxwyrAcOgkY+dKtQ+M4TEMf6fJx14uRjy+F5Wqx9zfPVGOgXke36tc9oLZiSz0h44HUlS42GOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w3bPbLBn; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w3bPbLBn"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e13c23dbabdso74709276.3
        for <virtio-comment@lists.linux.dev>; Wed, 21 Aug 2024 12:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724268527; x=1724873327; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNzeUqtFgBBBgHKd88qfWUc0LFYUAtWvF7j8Yk2gaZI=;
        b=w3bPbLBnfUMMi8+1O77KJpll63ecdedXwwrSr9TM2x3ds9IuJFBFvdEabXWvMaDJl4
         a1qOxpXWHroIFPQD5aRMZJcigVMBHjWAwSDuXcauM8KGZ9oboQZBwORlP1Qg+Sj5aIdp
         qvx6Mr03JOH09WNI3wfGQIFSQ6lN8j67igrrfgHxoBtWdFUrBb3ovrk2qvPqoTvC1gFR
         Gqjx066xFnV18E10Qx+51FSbW7YM+koVBQaH+OJFiXgIbAcHY9XsoCYBP1xQglpdNSSy
         NYI30zEgXHUNYz/5tFEaSfAmqlQ0yP51qzd0d44JhqEGCrvKpBaN7mqDUxWeJyN9ewoa
         KKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724268527; x=1724873327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNzeUqtFgBBBgHKd88qfWUc0LFYUAtWvF7j8Yk2gaZI=;
        b=Q/P7LlX3hNUT1dxWK+d/vrbIFpSFVK87JlWHRkpY9mlakDCK51X0b7v+Ff+O05tEHL
         rK5JM9M+Oi29jIeWKxEbd6L5fJyPdFHQQMMrPI2ku22SN7G1sbKYxkS0krtMNWiJ7onK
         yUhxSc6ULWO32uQ2TNM4kJz0yHHEjB4F48PBMFhaA4MSNIM6KUXt/M8nn3yFeMNL5K0P
         Pcdpnk9EBpATAORxegnVYcYlC6sS4/0jgcRvyYlUH9RMLONvavvJ0rTYjhXfDm4yXfpG
         IuPyg+jkPc7WjV0lgOkqr3KB6zfLlvRstFisDk1nIGR+mjEMr1BZdqUIjoLBWXtFdhxb
         O1uw==
X-Gm-Message-State: AOJu0YxsurIRcrcmp09tCAcXZiVxGtsLzziyrOweex9Ieh/kjtiTPLT5
	wgjYzudBdybw/3F7VyQ0cvOc08oZS7a2nEOIwON8Sk7lStXpvBTHnpVuAjqZJKStNZ5Sq9vOdjH
	juJFw7ytTHe4/cMqjsZan3Jspumw/rpH+8jVK
X-Google-Smtp-Source: AGHT+IFcu830zpPHgfeJqK46o078XK4wMOib/2CBlO39xrCM7z8nhBZ07aC56etrqoWcK2rw78JMGLnScUFkeL6E0Bo=
X-Received: by 2002:a05:6902:2190:b0:e16:4e65:9678 with SMTP id
 3f1490d57ef6-e1665459c04mr3994305276.14.1724268526771; Wed, 21 Aug 2024
 12:28:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1724234131.git.pabeni@redhat.com> <04089a87ff34aa518345ba5b50aecf737fb03f40.1724234131.git.pabeni@redhat.com>
In-Reply-To: <04089a87ff34aa518345ba5b50aecf737fb03f40.1724234131.git.pabeni@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Wed, 21 Aug 2024 15:28:10 -0400
Message-ID: <CA+FuTScjheR1htWujZ5=adBRB3+_z5KrCyHKoRGVapGq-MGtJQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 6:03=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> The VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} are two gso_type flags
> allowing respectively GSO over UDPv4 tunnel and GSO over UDPv6 tunnel.
> They can be negotiated on both the host and guest sides.
>
> One constraint addressed here is that the virtio side (either device or
> driver) receiving a UDP tunneled GSO packet must be able to reconstruct
> completely the inner and outer headers offset - to allow for later GSO.
>
> To accommodate such need, new fields are introduced in the virtio_net
> header: outer_th_offset and inner_nh_offset.
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

Trivial because Ethernet header followed by IPv4 or IPv6 header is
assumed? I.e., no level 2.5 headers like vlan or mpls to complicate
matters.

> by the existing csum_start field.
>
> Note that there is no concept of UDP tunnel type negotiation (e.g.
> vxlan, geneve, vxlan-gpe, etc.), as a virtio device H/W implementation
> can perform segmentation for every possible UDP-tunnel given the
> specified new fields.
> In the reverse direction, if a virtio device H/W implementation receives
> some traffic for an unknown or unsupported UDP tunnel, it will simply
> not aggregate the wire packet in a GSO one.
>
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>

Overall this looks great to me.

A few comments inline, mostly to clarify language. Happy to give my
Reviewed-By as is too at this point.

> ---
> v6 -> v7:
>  - replaced inner_protocol_type with VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 &=
&
>    VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4
>  - UDP_TUNNEL now depends on all the TCP and USO segmentation features
>  - reworded the 'VIRTIO_NET_HDR_GSO_UDP_TUNNEL' bit driver normative
>  - specified that  csum_start/offset points to the inner header in the
>    driver normative, too
>  - new fields presence depends on either VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO=
 or
>    VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO
>  - e.g. ->  i.e.
>  - zero -> positive zero (0x0)
>  - checksumming -> checksum validation
>  - explain why we the outer UDP csum can be precomputed only
>    when the GSO packet length is a multiple of gso_size
>  - added an example note for the tunnel-related fields value
> https://lore.kernel.org/virtio-comment/cover.1722252302.git.pabeni@redhat=
.com/T/#t
>
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
>  device-types/net/description.tex | 157 +++++++++++++++++++++++++++++--
>  1 file changed, 151 insertions(+), 6 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index 76585b0..e0e0927 100644
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
> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_GUEST_TSO=
4, VIRTIO_NET_F_GUEST_TSO6,
> +   VIRTIO_NET_F_GUEST_USO4 and VIRTIO_NET_F_GUEST_USO6.
>
>  \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_N=
ET_F_HOST_TSO6.
>  \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_HOST_TSO4,=
 VIRTIO_NET_F_HOST_TSO6
> +   and VIRTIO_NET_F_HOST_USO.
>
>  \item[VIRTIO_NET_F_CTRL_RX] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_CTRL_VLAN] Requires VIRTIO_NET_F_CTRL_VQ.
> @@ -375,6 +385,13 @@ \subsection{Device Initialization}\label{sec:Device =
Types / Network Device / Dev
>    TCP), VIRTIO_NET_F_HOST_TSO6 (IPv6 TCP), VIRTIO_NET_F_HOST_UFO
>    (UDP fragmentation) and VIRTIO_NET_F_HOST_USO (UDP segmentation) featu=
res.
>
> +\item If the VIRTIO_NET_F_HOST_TSO6, VIRTIO_NET_F_HOST_TSO4 and VIRTIO_N=
ET_F_HOST_USO
> +  segmentation features are negotiated, a driver can
> +  use TCP segmentation or UDP segmentation on top of UDP encapsulation
> +  offload, when the outer header does not require checksumming - e.g.
> +  the outer UDP checksum is zero - by negotiating the
> +  VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature.
> +
>  \item The converse features are also available: a driver can save
>    the virtual device some work by negotiating these features.\note{For e=
xample, a network packet transported between two guests on
>  the same system might not need checksumming at all, nor segmentation,
> @@ -382,8 +399,9 @@ \subsection{Device Initialization}\label{sec:Device T=
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
> @@ -413,6 +431,8 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Network Device / Device O
>  #define VIRTIO_NET_HDR_GSO_UDP         3
>  #define VIRTIO_NET_HDR_GSO_TCPV6       4
>  #define VIRTIO_NET_HDR_GSO_UDP_L4      5
> +#define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 0x20
> +#define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 0x40
>  #define VIRTIO_NET_HDR_GSO_ECN      0x80
>          u8 gso_type;
>          le16 hdr_len;
> @@ -423,6 +443,8 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Network Device / Device O
>          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
>          le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
>          le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
> +        le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
>  };
>  \end{lstlisting}
>
> @@ -480,6 +502,10 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>  followed by the TCP header (with the TCP checksum field 16 bytes
>  into that header). \field{csum_start} will be 14+20 =3D 34 (the TCP
>  checksum includes the header), and \field{csum_offset} will be 16.
> +If the given packet has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or th=
e
> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit set,
> +the above checksum fields refer to the inner header checksum, see
> +the example below.
>  \end{note}
>
>  \item If the driver negotiated
> @@ -516,6 +542,39 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>  specifically in the protocol.}.
>     \end{itemize}
>
> +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feat=
ure and the
> +  \field{gso_type} has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
> +  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit set, the GSO protocol is encaps=
ulated
> +  in a UDP tunnel.
> +  The outer UDP header must not require checksum validation, i.e. the ou=
ter UDP
> +  checksum must be a positive zero (0x0) as defined in UDP RFC 768.
> +  The other tunnel-related fields indicate how to replicate the packet
> +  headers to cut it into smaller packets:
> +
> +  \begin{itemize}
> +  \item \field{outer_th_offset} field indicates the outer transport head=
er within
> +      the packet. Note that such field differs from \field{csum_start} a=
s the latter
> +      points to the inner transport header within the packet.
> +
> +  \item \field{inner_nh_offset} field indicates the inner network header=
 within
> +      the packet.
> +  \end{itemize}
> +
> +\begin{note}
> +For example, consider a partially checksummed TCP (IPv4) packet carried =
over a

partially checksummed here means CHECKSUM_PARTIAL?

The term makes sense within Linux, but intuitively partially
checksummed could be interpreted to mean something like UDPLite: a
checksum over part of the packet.

Perhaps checksum offloaded instead?

And since I'm bikeshedding: "Note that" is a phrase that can almost
always be dropped entirely.

> +Geneve UDP tunnel (again IPv4) with no tunnel options. Note that the
> +only relevant variable related to the tunnel type is the tunnel header l=
ength.
> +The packet will have a 14 byte outer ethernet header, 20 byte outer IP h=
eader
> +followed by the 8 byte UDP header (with a 0 checksum value), 8 byte Gene=
ve header,
> +14 byte inner ethernet header, 20 byte inner IP header
> +and the TCP header (with the TCP checksum field 16 bytes
> +into that header). \field{csum_start} will be 14+20+8+8+14+20 =3D 84 (th=
e TCP
> +checksum includes the header), \field{csum_offset} will be 16.

The csum_offset field is not even needed in virtio_net_hdr if gso is
enabled, as then the gso type already defines the protocol.

So we could harvest that 16b field. But the new feature needs two 16b
fields. Likely they could be two 8b fields with some relative offset
gymnastics. But adding it all up that makes for a less obvious, harder
to understand datapath. Only mentioning as a discussion point. Just
adding two new fields to the struct seems more sensible to me, too.

> +\field{inner_nh_offset} will be 14+20+8+8+14 =3D 62, \field{outer_th_off=
set} will be
> +14+20+8 =3D 42 and \field{gso_type} will be
> +VIRTIO_NET_HDR_GSO_TCPV4 | VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 =3D 0x21
> +\end{note}
> +
>  \item \field{num_buffers} is set to zero.  This field is unused on trans=
mitted packets.
>
>  \item The header and packet are added as one output descriptor to the
> @@ -557,6 +616,29 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>  driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
>  \field{gso_type}.
>
> +If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUN=
NEL_IPV6 bit
> +in \field{gso_type} according to the inner network header protocol type
> +to request TCP or UDP GSO packets over UDPv4 or UDPv6 tunnel
> +segmentation, otherwise the driver MUST NOT set neither the

not neither is a double negative. Neither already means not either, so
this because not not either.

> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit nor the VIRTIO_NET_HDR_GSO_UDP_TU=
NNEL_IPV6 bit
> +in \field{gso_type}.
> +
> +When requesting TCP or UDP GSO segmentation over UDP tunnel, the driver =
MUST SET the
> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit if the inner network header is IP=
v4, i.e. the
> +packet is a TCPv4 GSO one, otherwise, if the inner network header is IPv=
6, the driver
> +MUST SET the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit.
> +
> +The driver MUST NOT send to the device TCP or UDP GSO packets over UDP t=
unnel
> +requiring segmentation and outer UDP checksum offload.
> +
> +The driver MUST NOT set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or th=
e
> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit together with VIRTIO_NET_HDR_GSO_=
UDP, as the
> +latter is deprecated in favor of UDP_L4 and no new feature will support =
it.
> +
> +The driver MUST NOT set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit and t=
he
> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit together.
> +
>  If the VIRTIO_NET_F_CSUM feature has been negotiated, the
>  driver MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
>  \field{flags}, if so:
> @@ -598,6 +680,36 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>         header.
>  \end{itemize}
>
> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has been negotiated, the
> +driver MAY set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}, if so:
> +\begin{itemize}
> +\item the driver MUST set \field{outer_th_offset} to the outer UDP heade=
r
> +  offset and \field{inner_nh_offset} to the inner network header offset.
> +  The \field{csum_start} and \field{csum_offset} fields point respective=
ly
> +  to the inner transport header and inner transport checksum field.
> +\end{itemize}
> +
> +If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set, the
> +outer UDP header MUST NOT require checksum validation. That is, the
> +outer UDP checksum value MUST be 0 or the validated complete checksum
> +for such header.
> +
> +\begin{note}
> +The valid complete checksum of the outer UDP header of individual segmen=
ts
> +can be computed by the driver prior to segmentation only if the GSO pack=
et
> +size is a multiple of \field{gso_size}, because then all segments
> +have the same size and thus all data included in the outer UDP
> +checksum is the same for every segment. These pre-computed segment
> +length and checksum fields are different from those of the GSO
> +packet.
> +\end{note}

The second variant, gso_partial, also implies that the outer header
already has udph->length set to the segment length.

While the first variant does not. Right?

Probably worth clarifying.


> +
> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has not
> +been negotiated, the driver MUST NOT set neither the VIRTIO_NET_HDR_F_UD=
P_TUNNEL_IPV4
> +bit nor the VIRTIO_NET_HDR_F_UDP_TUNNEL_IPV6 in \field{gso_type}.
> +
>  The driver SHOULD accept the VIRTIO_NET_F_GUEST_HDRLEN feature if it has
>  been offered, and if it's able to provide the exact header length.
>
> @@ -633,6 +745,10 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>         \end{note}
>  \end{itemize}
>
> +If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit and theVIRTIO_NET_HDR_GSO_=
UDP_TUNNEL_IPV6
> +bit in \field{gso_type} are not set, the device MUST NOT use the
> +\field{outer_th_offset} and \field{inner_nh_offset}.
> +
>  If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
>  rely on the packet checksum being correct.
>  \paragraph{Packet Transmission Interrupt}\label{sec:Device Types / Netwo=
rk Device / Device Operation / Packet Transmission / Packet Transmission In=
terrupt}
> @@ -727,8 +843,8 @@ \subsubsection{Processing of Incoming Packets}\label{=
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
> @@ -750,8 +866,16 @@ \subsubsection{Processing of Incoming Packets}\label=
{sec:Device Types / Network
>    from \field{csum_start} and any preceding checksums
>    have been validated.  The checksum on the packet is incomplete and
>    if bit VIRTIO_NET_HDR_F_RSC_INFO is not set in \field{flags},
> -  then \field{csum_start} and \field{csum_offset} indicate how to calcul=
ate it
> -  (see Packet Transmission point 1).
> +  then \field{csum_start} and \field{csum_offset} indicate how to calcul=
ate it.
> +  If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or VIRTIO_NET_HDR_GSO_UD=
P_TUNNEL_IPV6
> +  bit are set, the \field{csum_start} field
> +  refers to the inner transport header offset (see Packet Transmission p=
oint 1).
> +\item If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO option was negotiated and
> +  \field{gso_type} is not VIRTIO_NET_HDR_GSO_NONE, the
> +  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_T=
UNNEL_IPV6
> +  bit MAY be set. In such case the \field{outer_th_offset} and
> +  \field{inner_nh_offset} fields indicate the corresponding
> +  headers information.
>
>  \end{enumerate}
>
> @@ -796,6 +920,10 @@ \subsubsection{Processing of Incoming Packets}\label=
{sec:Device Types / Network
>  If none of VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 have been =
negotiated,
>  the device MUST NOT set \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
>
> +If VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO is not negotiated, the device MUST =
NOT set
> +neither the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit nor the
> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}.
> +
>  The device SHOULD NOT send to the driver TCP packets requiring segmentat=
ion offload
>  which have the Explicit Congestion Notification bit set, unless the
>  VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
> @@ -819,6 +947,18 @@ \subsubsection{Processing of Incoming Packets}\label=
{sec:Device Types / Network
>         fully checksummed packet;
>  \end{enumerate}
>
> +The device MUST NOT send to the driver TCP or UDP GSO packets encapsulat=
ed in UDP
> +tunnel and requiring segmentation offload, unless the
> +VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO is negotiated, in which case the devic=
e MUST set
> +the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP=
_TUNNEL_IPV6
> +bit in \field{gso_type} according to the inner network header protocol t=
ype,
> +MUST set the \field{outer_th_offset} and \field{inner_nh_offset} fields
> +to the corresponding header information, and the outer UDP header MUST N=
OT
> +require checksum offload.
> +
> +The device MUST NOT send the driver TCP or UDP GSO packets encapsulated =
in UDP
> +tunnel and requiring segmentation and outer checksum offload.
> +
>  If none of the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options =
have
>  been negotiated, the device MUST set \field{gso_type} to
>  VIRTIO_NET_HDR_GSO_NONE.
> @@ -867,6 +1007,10 @@ \subsubsection{Processing of Incoming Packets}\labe=
l{sec:Device Types / Network
>  VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
>  rely on the packet checksum being correct.
>
> +If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_=
UDP_TUNNEL_IPV6
> +bit in \field{gso_type} are not set, the driver MUST NOT use the
> +\field{outer_th_offset} and \field{inner_nh_offset}.
> +
>  \paragraph{Hash calculation for incoming packets}
>  \label{sec:Device Types / Network Device / Device Operation / Processing=
 of Incoming Packets / Hash calculation for incoming packets}
>
> @@ -1624,6 +1768,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
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
