Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAC14DA0C
	for <virtio-comment@lists.linux.dev>; Tue, 18 Jun 2024 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718727403; cv=none; b=X1e3ZqDX8r/D74FC6D71qBMUuh72P+2qhHny1POEax0XpE5RFmS0Q8kBafs1vqKJ1iCZrdEo/2d4OJEj3CzyawgcwG8td95JpsRTFZiSX6XgrxW5mw06519paYJNjDI9gjqCM9E/3DrR49UMAGoJ1tU2L+kjEl8eu/om0nogTew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718727403; c=relaxed/simple;
	bh=b/6hsdyzHuj2FZscOBGwHSsW/6Hd1O2fXm5SHQqVjgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XokkbmUC3e2xO4p6Wg9FpVO/HDAIp8DG8gg9KOPVTdhB8hRpiL53lOljIj/R+cy83TlmgPLtuKkWDj9j/NOw2usBSLiC8e0DaxjNADZGqLx0solj7TqXXaHIeEqccCUUc5ovsWMuE5ESADkX+8d8IvSzitFmWYMgP1ShC8oPCao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pCasdDil; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pCasdDil"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-375fc24a746so134165ab.1
        for <virtio-comment@lists.linux.dev>; Tue, 18 Jun 2024 09:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718727400; x=1719332200; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KPc8q9o155OPpzfLUghqQBXirh8czq5Bv91y4GiVRc=;
        b=pCasdDilc0xC6GA4au4ly9u2cOu6iedrDQbOFDsgjy6BKNxJ9IIKLHHRVXMO8knMoS
         w0a3kbwfxAPBDFMzkKLQGpo7D9veNTk1MuxZJNzw6w/fWsQQvDEUs4zO7sLI3H6OyV1h
         l2s3+oiqboeHbonsHoW5PveVdkEEtzP7d8amHSmNFc+/EGXkRJKLe37jiv/DekBEXNbl
         ksWj+pp/NShUyzi6LyTMtlWei8CeDc8xP4WoeTG7WlbVfbnNuViYfcWOrOYb7Jgx73jp
         pYOFDOG5cxGmj0R8RnE8aMrC6EMvUQoFoQzbA1AaOKvRsalLgUIqcEjOwcCM15LN5cuC
         FkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718727400; x=1719332200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KPc8q9o155OPpzfLUghqQBXirh8czq5Bv91y4GiVRc=;
        b=uYRRKDjKQtNEGM9oXyJDD2X6h9DTHs8SrR/jF7TgIgZHPhH6DuEHoxNRSgg9VhrUfZ
         Io8osr34IL9LJpFb+utbKZ7B/G2UpOgUiJz1woVSlQHS7HsrdbbgSzHuN/pfUbNjlu3Z
         y5KEi5fYcm7K8BbvTQRfo6RB0+unW/MSlSKMbyeVQaV0YrGZPXZ9+UJn2lm05wLbG/mS
         xNtVpWLbjYnjWvmdMMZFpB4waRYhOQxzsDxOF1AflsPcpW9tXzEOEUHYZfBgdQHS2E+V
         vP94bIg/PGibpwDXtYiUVAbULpsfVibTWV+Am2JGLyg1KDBwBM3UZSoW5mo99DRQiUiu
         q28A==
X-Gm-Message-State: AOJu0YwsqwFV+wEz9my4RcTqlEq2CpY3VHrsSeEYb7U+wR47xzh2lLzv
	xB6JfTxgZvI4vVbDrcfpGmTzMiS6FSsfw/LA3MJ+hIBoOF9imXBrC6glTno4dnOCtqKxNuZnSbC
	0pq0VEV24I/HjUUuJUV6TiDLVqz9mnz99OdoD
X-Google-Smtp-Source: AGHT+IEoUcR8SDWHw8deL6tfsIqZrNhdI/n2wzozcVn3p3OBCrkeLH/HghmORkZilgUt5d6faWbqeWsABVoPdrov07o=
X-Received: by 2002:a05:6e02:def:b0:375:dd11:2e34 with SMTP id
 e9e14a558f8ab-3760b4f82e1mr3075515ab.5.1718727399633; Tue, 18 Jun 2024
 09:16:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
In-Reply-To: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Tue, 18 Jun 2024 18:15:59 +0200
Message-ID: <CA+FuTSdVUre71ULgi8wnRZsCeHn1WqJMJmc7iDzUhaYB2nidLQ@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 12:52=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> The VIRTIO_NET_HDR_GSO_UDP_TUNNEL is a gso_type flag allowing GSO over
> UDP tunnel. It can be negotiated on both the host and guest sides.
>
> UDP tunnel usage is ubiquitous in container deployment, and the ability
> to offload UDP encapsulated GSO traffic impacts greatly the performances
> and the CPU utilization of such use cases.
>
> One constraint addressed here is that the virtio side (either device or
> driver) receiving a UDP tunneled GSO packet must be able to reconstruct
> completely the inner and outer headers offset - to allow for later GSO.
>
> To accommodate such need, new optional fields are introduced in the
> virtio_net header: outer_th_offset, inner_protocol, inner_mac_offset,
> inner_nh_offset. They map directly to the corresponding header
> information. The inner transport header is implied by the (inner)
> checksum offload.
>
> The checksum offload for the outer header is negotiated with a separate
> feature and only for GSO over UDP tunnel packets. Computing the outer
> header checksum is cheap: due to the inner checksum only data in between
> the outer and the inner transport header must be accounted[1].
>
> The GSO over UDP tunnels packets are allowed even when the outer header
> csum offload is not supported, if the outer UDP header has zero csum
> or the GSO packet size is an integer multiple of the gso_size. In such
> later case the outer UDP header checksum can be computed independently
> prior to the segmentation step, do to [1].
>
> Migration for GSO_UDP_TUNNEL-enabled-VMs should be managed alike other
> types of GSO offload: VMs that has negotiated UDP tunnel GSO and
> checksum offload could be migrated only on hosts supporting such
> features.
>
> Note that there is no concept of UDP tunnel type negotiation (e.g.
> vxlan, geneve, vxlan-gpe, etc.). That is intentional because:
> - given the information carried by the guest or host kernel, it's
>   impossible to probe reliably the UDP tunnel type. Specifically, the
>   outer UDP port numbers give a hint, but peers could use nonstandard
>   ones.
> - all the existing UDP tunnel protocols behave the same way WRT GSO
>   offload, carrying an immutable header on top of the outer transport
>   one.
> - if a new UDP tunnel protocol, carring packet dependant information
>   alike the inner packet length or csum should surface in the future,
>   the host and guest kernels will need explicit support for it,
>   including new, different GSO features. Additional virtio support
>   should be designed separately.
>
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> ---
> v4 -> v5:
>  - add separate negotiation for UDP_TUNNEL_CSUM
>  - much more verbose specification of outer csum handling

Thanks. Much appreciated.

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
>  device-types/net/description.tex | 248 ++++++++++++++++++++++++++++++-
>  1 file changed, 240 insertions(+), 8 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index 76585b0..d6f9f79 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -88,6 +88,18 @@ \subsection{Feature bits}\label{sec:Device Types / Net=
work Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
>
> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (47)] Driver can receive GSO pac=
kets
> +  carried by an UDP tunnel.
> +
> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM (48)] Driver handles packets
> +  carried by an UDP tunnel with partial csum for the outer header.
> +
> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (49)] Device can receive GSO pack=
ets
> +  carried by an UDP tunnel.
> +
> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM (50)] Device handles packets
> +  carried by an UDP tunnel with partial csum for the outer header.
> +
>  \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash fo=
r encapsulated packets.
>
>  \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue notificat=
ion coalescing.
> @@ -133,12 +145,18 @@ \subsubsection{Feature bit requirements}\label{sec:=
Device Types / Network Device
>  \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_GUEST_TSO=
4, VIRTIO_NET_F_GUEST_TSO6,
> +   VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6.
> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM] Requires VIRTIO_NET_F_GUEST_UD=
P_TUNNEL_GSO

Should this dependency be the other way around? GSO/GRO requires Tx/Rx
checksum offload, but not vice versa.

Or is this effectively VIRTIO_NET_F_GUEST_UDP_TUNNEL_*GSO*_CSUM?

It sounds like there may even be three features here: UDP_TUNNEL,
UDP_TUNNEL_CSUM and UDP_TUNNEL_GSO.

It may make sense to split the patch into two (or three) patches?


>  \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_N=
ET_F_HOST_TSO6.
>  \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_HOST_TSO4,=
 VIRTIO_NET_F_HOST_TSO6,
> +   VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6.
> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM] Requires VIRTIO_NET_F_HOST_UDP_=
TUNNEL_GSO
>
>  \item[VIRTIO_NET_F_CTRL_RX] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_CTRL_VLAN] Requires VIRTIO_NET_F_CTRL_VQ.
> @@ -375,6 +393,16 @@ \subsection{Device Initialization}\label{sec:Device =
Types / Network Device / Dev
>    TCP), VIRTIO_NET_F_HOST_TSO6 (IPv6 TCP), VIRTIO_NET_F_HOST_UFO
>    (UDP fragmentation) and VIRTIO_NET_F_HOST_USO (UDP segmentation) featu=
res.
>
> +\item If any TCP or UDP segmentation feature is negotiated, a driver can
> +  use TCP segmentation or UDP segmentation on top of UDP encapsulation
> +  offload, when the outer header does not require checksumming,
> +  by negotiating the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature.
> +
> +\item If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, a driver can
> +  additionally use TCP segmentation or UDP segmentation on top of UDP
> +  encapsulation with the outer header requiring checksum offload,
> +  negotiating the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature.

Please also make explicit what is expected of udp tunnel offload
without checksum offload, on both tx and rx: one of outer checksum is
zero, or it is computed/validated in software (does not work with
GSO/GRO, of course, so I assume you mean the first only).

> +
>  \item The converse features are also available: a driver can save
>    the virtual device some work by negotiating these features.\note{For e=
xample, a network packet transported between two guests on
>  the same system might not need checksumming at all, nor segmentation,
> @@ -382,8 +410,10 @@ \subsection{Device Initialization}\label{sec:Device =
Types / Network Device / Dev
>     The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
>    checksummed packets can be received, and if it can do that then
>    the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
> -  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO=
4
> -  and VIRTIO_NET_F_GUEST_USO6 are the input equivalents of the features =
described above.
> +  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO=
4,
> +  VIRTIO_NET_F_GUEST_USO6, VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and
> +  VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM are the input equivalents of
> +  the features described above.
>    See \ref{sec:Device Types / Network Device / Device Operation /
>  Setting Up Receive Buffers}~\nameref{sec:Device Types / Network
>  Device / Device Operation / Setting Up Receive Buffers} and
> @@ -407,12 +437,14 @@ \subsection{Device Operation}\label{sec:Device Type=
s / Network Device / Device O
>  #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
>  #define VIRTIO_NET_HDR_F_DATA_VALID    2
>  #define VIRTIO_NET_HDR_F_RSC_INFO      4
> +#define VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM 8
>          u8 flags;
>  #define VIRTIO_NET_HDR_GSO_NONE        0
>  #define VIRTIO_NET_HDR_GSO_TCPV4       1
>  #define VIRTIO_NET_HDR_GSO_UDP         3
>  #define VIRTIO_NET_HDR_GSO_TCPV6       4
>  #define VIRTIO_NET_HDR_GSO_UDP_L4      5
> +#define VIRTIO_NET_HDR_GSO_UDP_TUNNEL 0x40
>  #define VIRTIO_NET_HDR_GSO_ECN      0x80
>          u8 gso_type;
>          le16 hdr_len;
> @@ -423,6 +455,10 @@ \subsection{Device Operation}\label{sec:Device Types=
 / Network Device / Device O
>          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
>          le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
>          le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
> +        le16 outer_th_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> +        le16 inner_protocol;    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> +        le16 inner_mac_offset;  (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)

Inner protocol is the inner mac protocol e.g., ARPHRD_ETHER? To be
able to parse the inner mac protocol (and from that the inner network
protocol). [update: answered below, see next inline response for
follow-on]

And it is the inner network header if no mac header is present?

How to detect that case should also be made explicit. E.g.,
inner_nh_offset =3D=3D inner_mac_offset, or inner_mac_offset =3D=3D 0. Even=
 if
that is not supported yet. To make sure that we can detect it and
support it in the future.

> +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
>  };
>  \end{lstlisting}
>
> @@ -480,6 +516,8 @@ \subsubsection{Packet Transmission}\label{sec:Device =
Types / Network Device / De
>  followed by the TCP header (with the TCP checksum field 16 bytes
>  into that header). \field{csum_start} will be 14+20 =3D 34 (the TCP
>  checksum includes the header), and \field{csum_offset} will be 16.
> +If the given packets has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit set,
> +the above checksum fields refer to the inner header checksum.
>  \end{note}
>
>  \item If the driver negotiated
> @@ -516,6 +554,59 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>  specifically in the protocol.}.
>     \end{itemize}
>
> +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feat=
ure,
> +  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} indicates th=
at
> +  the GSO protocol is encapsulated in an UDP tunnel. If the outer UDP he=
ader
> +  requires checksumming, the driver must have additionally negotiated th=
e
> +  VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature and offloaded the outer chec=
ksum
> +  accordingly.
> +  The other tunnel-related fields indicate how to replicate the inner pa=
cket
> +  header to cut it into smaller packets:
> +
> +  \begin{itemize}
> +  \item \field{outer_th_offset} field indicates the outer transport head=
er within
> +      the packet. Note that differs from \field{csum_start} as the latte=
r
> +      points to the inner transport header within the packet.
> +
> +  \item \field{inner_protocol} field indicates the ethernet type of the =
inner
> +      protocol.

That answers my above question. But is this needed if it can be read
from the inner mac header (when the inner link layer type is known)?

We should try to add the minimum number of fields required. Are all
these fields required, or can some (like this) be derived easily from
the others?

> +
> +  \item \field{inner_mac_offset} field indicates the inner mac header wi=
thin the packet
> +
> +  \item \field{inner_nh_offset} field indicates the inner network header=
 within
> +      the packet
> +  \end{itemize}
> +
> +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM fea=
ture,
> +  the transimitted packet is a GSO one encapsulated in an UDP tunnel, an=
d

typo: transmitted

> +  the outer UDP header requires checksumming, the driver can skip it:
> +
> +  \begin{itemize}
> +  \item \field{flags} has the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM set,
> +
> +  \item \field{outer_th_offset} correspond to the outer checksum start a=
nd
> +      implies the outer checksum offset: the outer transport header is U=
DP,
> +      so the outer checksum offset is 6.
> +
> +  \item The outer UDP checksum field in the packet is set to the sum
> +    of the UDP pseudo header, so that replacing it by the ones'
> +    complement checksum of the outer UDP header and payload will give th=
e
> +    correct result.
> +  \end{itemize}
> +
> +\begin{note}
> +  Transmitting GSO packets carried by UDP tunnel is still possible even =
without
> +  the outer UDP header checksum offload:
> +  \begin{itemize}
> +    \item when the outer UDP checksum is not required, that is, when the=
 outer UDP
> +      checksum is zero.
> +    \item when the GSO packet size is equal to a multiple of \field{gso_=
size}. In such
> +      case the outer UDP checksum is indepenent from the actual packet c=
ontents and

typo: independent

> +      the driver computes the individual segment full outer UDP checksum=
 prior
> +      to the segmentation itself.
> +  \end{itemize}
> +\end{note}
> +
>  \item \field{num_buffers} is set to zero.  This field is unused on trans=
mitted packets.
>
>  \item The header and packet are added as one output descriptor to the
> @@ -557,6 +648,34 @@ \subsubsection{Packet Transmission}\label{sec:Device=
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
> +bit in the \field{gso_type}.
> +
> +The driver MUST NOT send to the device TCP or UDP GSO packets over UDP t=
unnel
> +requiring segmentation and outer UDP checksum offload, unless both the
> +VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO and VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM f=
eatures
> +are negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO=
_UDP_TUNNEL
> +bit in the \field{gso_type} and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit=
 in the \field{flags}.
> +
> +If VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM is not negotiated, the driver MUST =
not set
> +the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags} and, in ca=
se of GSO
> +packets carried over an UDP tunnel, MUST either supply the full checksum=
 for the
> +outer UDP header to the device or such checksum MUST be zero.
> +
> +\begin{note}
> +Is possible to supply the full checksum for the outer UDP header for
> +GSO packets over UDP tunnel, only when the GSO packet size is an integer
> +multiple of \field{gso_size}.
> +\end{note}
> +
> +The driver MUST NOT set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL together with
> +VIRTIO_NET_HDR_GSO_UDP.

Perhaps explain why: VIRTIO_NET_HDR_GSO_UDP is fragmentation offload,
which is deprecated in favor of UDP_L4 and no new features will
support it.

> +
> +The driver MUST NOT set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit \field{=
flags}
> +without setting the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO bit in \field{gso_t=
ype}.
> +
>  If the VIRTIO_NET_F_CSUM feature has been negotiated, the
>  driver MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
>  \field{flags}, if so:
> @@ -598,6 +717,45 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>         header.
>  \end{itemize}
>
> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has been negotiated, the
> +driver MAY set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type}=
, if so:
> +\begin{itemize}
> +\item the driver MUST set the \field{outer_th_offset} to the outer UDP h=
eader
> +  offset, the \field{inner_protocol} to the ethernet type of the inner
> +  protocol, the \field{inner_mac_offset} to the inner mac header offset =
and
> +  the \field{inner_nh_offset} to the inner network header offset.
> +\end{itemize}
> +
> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM feature has been negotiated, an=
d the
> +bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL in \field{gso_type} is set, the
> +driver MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
> +\field{flags}, if so:
> +\begin{enumerate}
> +\item the driver MUST validate the packet checksum at
> +       offset 6 from \field{outer_th_offset} as well as all
> +       preceding offsets;
> +\item the driver MUST set the packet checksum stored in the
> +       buffer to the outer UDP pseudo header;
> +\item the driver MUST set \field{outer_th_offset} and such that calculat=
ing a ones'
> +       complement checksum from \field{outer_th_offset} up until the end=
 of
> +       the packet and storing the result at offset 6 from  \field{outer_=
th_offset}
> +       will result in a fully checksummed outer UDP packet;
> +\end{enumerate}
> +Otherwise, if the bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL in \field{gso_type} =
is set and
> +the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{gso_type} is cleared,=
 the driver
> +MUST either set the outer UDP checksum to 0 or set it to the full outer =
UDP header
> +value. To compute the full outer UDP header value the driver MUST:
> +\begin{enumerate}
> +\item set the outer UDP checksum to 0
> +\item calculate the ones'complement checksum from \field{outer_th_offset=
} to
> +  \field{csum_start}

This is not the full outer checksum.

Is the intent to work with inner checksum offload? If so, it requires more =
steps
both for partial GSO and even without GSO where the inner checksum includes
the inner pseudo header.

> +\item add the outer UDP pseudo header checksum
> +\end{enumerate}
> +
> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has not
> +been negotiated, the driver MUST clear the VIRTIO_NET_HDR_F_UDP_TUNNEL_C=
SUM bit
> +in the \field{gso_type}.
> +
>  The driver SHOULD accept the VIRTIO_NET_F_GUEST_HDRLEN feature if it has
>  been offered, and if it's able to provide the exact header length.
>
> @@ -633,6 +791,18 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>         \end{note}
>  \end{itemize}
>
> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has been negotiated:
> +\begin{itemize}
> +\item If the \field{gso_type} has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit =
set
> +       the device MUST use the \field{outer_th_offset}, \field{inner_pro=
tocol},
> +  \field{inner_mac_offset} and \field{inner_nh_offset} fields to
> +  locate the corresponding headers inside the packet.
> +\end{itemize}
> +
> +If VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} is not set, the
> +device MUST NOT use the \field{outer_th_offset}, \field{inner_protocol},
> +\field{inner_mac_offset} and \field{inner_nh_offset}.
> +
>  If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
>  rely on the packet checksum being correct.
>  \paragraph{Packet Transmission Interrupt}\label{sec:Device Types / Netwo=
rk Device / Device Operation / Packet Transmission / Packet Transmission In=
terrupt}
> @@ -727,8 +897,8 @@ \subsubsection{Processing of Incoming Packets}\label{=
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
> @@ -750,8 +920,20 @@ \subsubsection{Processing of Incoming Packets}\label=
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
_protocol},
> +  \field{inner_mac_offset} and \field{inner_nh_offset} fields indicates =
corresponding
> +  header information.
> +\item If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM feature was negotiated, =
and the
> +  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit is set in \field{gso_type}, the
> +  VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags} can be set: =
if so,
> +  the outer UDP header checksum at offset 6 from \field{outer_th_offset}=
 have
> +  been validated. The checksum on the packet is incomplete and the
> +  \field{outer_th_offset} indicates how to calculate it.
>
>  \end{enumerate}
>
> @@ -796,6 +978,12 @@ \subsubsection{Processing of Incoming Packets}\label=
{sec:Device Types / Network
>  If none of VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 have been =
negotiated,
>  the device MUST NOT set \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
>
> +If VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO is not negotiated the device MUST N=
OT set
> +the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type}.
> +
> +If VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM is not negotiaded the device MUST =
NOT set

typo: negotiated.

I probably did not catch all and worth a spell  check.

> +the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
> +
>  The device SHOULD NOT send to the driver TCP packets requiring segmentat=
ion offload
>  which have the Explicit Congestion Notification bit set, unless the
>  VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
> @@ -819,6 +1007,13 @@ \subsubsection{Processing of Incoming Packets}\labe=
l{sec:Device Types / Network
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
> +\field{outer_th_offset}, \field{inner_protocol}, \field{inner_mac_offset=
} and
> +\field{inner_nh_offset}.
> +
>  If none of the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options =
have
>  been negotiated, the device MUST set \field{gso_type} to
>  VIRTIO_NET_HDR_GSO_NONE.
> @@ -842,8 +1037,39 @@ \subsubsection{Processing of Incoming Packets}\labe=
l{sec:Device Types / Network
>  If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
>  device MAY set the VIRTIO_NET_HDR_F_DATA_VALID bit in
>  \field{flags}, if so, the device MUST validate the packet
> -checksum (in case of multiple encapsulated protocols, one level
> -of checksums is validated).
> +checksum.
> +
> +If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and the VIRTIO_NET_F_GUEST_UDP_=
TUNNEL_CSUM
> +feature has been negotiated, the bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL is se=
t in
> +\field{gso_type}
> +device MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
> +\field{flags}, if so:
> +\begin{enumerate}
> +\item the device MUST validate the packet checksum at
> +       offset 6 from \field{outer_th_offset};
> +\item the device MUST set the packet checksum stored in the
> +       receive buffer to the outer UDP pseudo header;
> +\item the device MUST set \field{outer_th_offset} such that
> +       calculating a ones' complement checksum from
> +       \field{outer_th_offset} up until the end of the packet
> +       and storing the result at offset 6 from \field{outer_th_offset}
> +       will result in the outer UDP header fully checksummed;
> +\end{enumerate}
> +Otherwise, if the VIRTIO_NET_HDR_GSO_UDP_TUNNEL is set in
> +\field{gso_type} and the bit VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is cleared=
 in
> +\field{flags}, the device MUST must either provide a zero outer UDP head=
er
> +checksum or a fully checksummed outer UDP header.
> +
> +\begin{note}
> +The latter case is possible only if the GSO packet size is be a
> +multiple of \field{gso_size}.
> +\end{note}
> +
> +\begin{note}
> +If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO feature is negotiated and the
> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit is set, the VIRTIO_NET_HDR_F_NEEDS_CSU=
M
> +bit refers to the inner header checksum.
> +\end{note}
>
>  \drivernormative{\paragraph}{Processing of Incoming
>  Packets}{Device Types / Network Device / Device Operation /
> @@ -867,6 +1093,10 @@ \subsubsection{Processing of Incoming Packets}\labe=
l{sec:Device Types / Network
>  VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
>  rely on the packet checksum being correct.
>
> +If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_GSO bit in \field{gso_type} is not =
set,
> +the driver MUST NOT use the \field{outer_th_offset}, \field{inner_protoc=
ol},
> +\field{inner_mac_offset} and \field{inner_nh_offset}.
> +
>  \paragraph{Hash calculation for incoming packets}
>  \label{sec:Device Types / Network Device / Device Operation / Processing=
 of Incoming Packets / Hash calculation for incoming packets}
>
> @@ -1624,6 +1854,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Network Device / Devi
>  #define VIRTIO_NET_F_GUEST_TSO6       8
>  #define VIRTIO_NET_F_GUEST_ECN        9
>  #define VIRTIO_NET_F_GUEST_UFO        10
> +#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  47
> +#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM 48
>  #define VIRTIO_NET_F_GUEST_USO4       54
>  #define VIRTIO_NET_F_GUEST_USO6       55
>
> --
> 2.45.1
>
