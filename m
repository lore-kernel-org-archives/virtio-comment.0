Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF30BD2FF
	for <virtio-comment@lists.linux.dev>; Wed,  5 Mar 2025 04:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741147580; cv=none; b=bTSbAwaJ1S3RnxPnNXA+j5bc1opFyWPjCcnCdAlFK/Yb2H+wd3hQ1biGM7Wg48j2SLQIW9o5vrGUM8cvQswfAjev5zQuvIzuiBhB6kBZsdlrAETWWb6XqNqPD+YTPaq+eyRiAMD4kYn2CMwpxLhWxYpUigoRDdPfRElBXUftUA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741147580; c=relaxed/simple;
	bh=ElwpgnEoIf4ikUk9v7NP/f2jXngHSTNeYnoWvCHJ1ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fXQOOi3r67Mm9jggSz3hcuFlclwd3O7R/LWCQ5NpHeXkCIQmL74m+6sOJAMBBZ7OOAAxinecnL2/0b76kwuyNz8uNyQuvkV+0xaagNWB8d4OKmrkFwqQB8JMFqfKhBf7WvjPTV7pTgdS35j6Q0dGdKD5pMEsab9/PXUjLxcwbWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TQIczgBv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TQIczgBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741147576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9u0M2GBAOsBr5NDblb16gh/scBoZc59XFV7/n/9OREQ=;
	b=TQIczgBvlvr4bR/TATXpeZIGOyY6LWabQDcqCM/tvtXOnTJVBLrNa2kAeixoKTf+kw8vfj
	ibOiEyTdsRLtDo/kjdcydZPf8otnUm2mwr/9PLJePLRC4mbf8yDwUrp3udpqXli/QABKsV
	OyuFJPrwC3m7wUpz4yrmBlWdku+aQ58=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-u2MxxGctNHOW-MNWjUYHYA-1; Tue, 04 Mar 2025 23:06:13 -0500
X-MC-Unique: u2MxxGctNHOW-MNWjUYHYA-1
X-Mimecast-MFC-AGG-ID: u2MxxGctNHOW-MNWjUYHYA_1741147572
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fe862ea448so19863078a91.3
        for <virtio-comment@lists.linux.dev>; Tue, 04 Mar 2025 20:06:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741147571; x=1741752371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9u0M2GBAOsBr5NDblb16gh/scBoZc59XFV7/n/9OREQ=;
        b=RIK1PXl74XMxug4loxr0mr6/9jd9Xq4aoKSzqs4h/ppWpSz3ebRqhTWgiP+xaHETsz
         bUC1jaDbr2tTTJ7bnuLf4v8t31IF/Yz38FI6xasAQtrHb+Klhv99zb+GNuBlEQ8Qias2
         xMgliURelYIz3A7gwNzFALBmeSI9wEI10m/PhRwBcBTpVKLX6LJ5X2HApTrSKH5+mKK6
         82hNRCJ0zZOW8gB8AO7jcFJT1RkBaUewk2czay9kzAhwMGGds7231xchX/gig8aCB2Yy
         qTYPmLqXgOjwKFt86xkmACylLu5/uYHsJ8ULgZeN88ybmrkH2NSjhdZeb2hB7KWHtgjW
         g9zQ==
X-Gm-Message-State: AOJu0YzoKgZOxqHH7NSBMAvk5n5sHSSZb/lmBufpTtCVZ7YfTVkKLKrx
	PQVLYvKaHl6ZzzzeYye2NNzzKAZoVb/D1Uu6UTmr344VgFL1xrNj3BTDpzJMYJw1jxb/ZlU0KDh
	6khusz9m/Oy0YSpzSMWxEsrShxOk5C8jp2eLqIigHCSpKyRRawTfmUl3DuWDMcDrE+DovhwKWaI
	lrmtC4tzjf7/jtCvy8ZP6EecVu9Bu1e71i8FIZmks=
X-Gm-Gg: ASbGncskJ9EmK62KJn8B9uTTUKuiWb7iq8sHHkq5+RCuTS6DZngLzUErQlCzcF0XiOu
	XpJyMnUHmEt6RpV8PsDaWuRPNfIR9wZR3sVc1f7tcIuNKIgQx8hAkRrtU0KueeJrH/z/2cfp9KA
	==
X-Received: by 2002:a17:90b:4a87:b0:2ee:3cc1:793e with SMTP id 98e67ed59e1d1-2ff498304fbmr2660062a91.32.1741147571499;
        Tue, 04 Mar 2025 20:06:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMKapzwXN0quST7IPZdxW+kW39YaHf+Ym7ktH75lRkKZ9vm+6+0qG9i/FJRzHCmKOw7Mjd9cXJDE4HDlBGK8o=
X-Received: by 2002:a17:90b:4a87:b0:2ee:3cc1:793e with SMTP id
 98e67ed59e1d1-2ff498304fbmr2660025a91.32.1741147570972; Tue, 04 Mar 2025
 20:06:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250222233040.29738-1-chia-yu.chang@nokia-bell-labs.com> <20250222233040.29738-3-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250222233040.29738-3-chia-yu.chang@nokia-bell-labs.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 5 Mar 2025 12:05:58 +0800
X-Gm-Features: AQ5f1JpfPosEC2NvvNJFk3mqpOH56-1ZgOAcwhHVBlHzUOR1-GdTn5Dvku2Wz7U
Message-ID: <CACGkMEtoiBKhCcTzhZ47J4PvRZpaEFML_vVkiqwt0tN=zopy-w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] virtio-net: define Accurate ECN feature in virtio-spec
To: chia-yu.chang@nokia-bell-labs.com
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com, 
	mvaralar@redhat.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W78dqsbtEi-irA5eGWhV63mnqVHGNkX3J_AKm8RQLMs_1741147572
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 7:31=E2=80=AFAM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> This change implements Accurate ECN based on AccECN specifications:
>   https://tools.ietf.org/id/draft-ietf-tcpm-accurate-ecn-28.txt
>
> Unlike RFC 3168 ECN, Accurate ECN uses the CWR flag as part of the ACE
> field to count new packets with CE mark; however, RFC 3168 ECN-aware TSO
> will clean CWR flag from the 2nd segment of an aggregated segment.
> Therefore, fallback shall be applied by seting NETIF_F_GSO_ACCECN to

typo, should be setting.

> ensure that the CWR flag should not be changed within a super-skb.

Let's try to use a general terminology other than Linux one such as "skb".

>
> To apply it in virtio-spec, new featue bits for host and guest are added

And "feature"

> for feature negotiation between driver and device. And the translation
> of Accurate ECN GSO flag between virtio_net_hdr and skb header for
> NETIF_F_GSO_ACCECN is also added to avoid CWR flag corruption due to
> RFC3168 ECN TSO.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> ---
>  device-types/net/description.tex | 47 ++++++++++++++++++++++++--------
>  1 file changed, 36 insertions(+), 11 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index 104a32f..f8294d1 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -92,6 +92,12 @@ \subsection{Feature bits}\label{sec:Device Types / Net=
work Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
>
> +\item[VIRTIO_NET_F_HOST_ACCECN (25)] Device can receive TSO with TCP CWR=
 flag set,
> +    which will be applied to all segments of an aggregated segment.
> +
> +\item[VIRTIO_NET_F_GUEST_ACCECN (26)] Driver can receive TSO with TCP CW=
R flag set,
> +    which will be applied to all segments of an aggregated segment.

One thing I can think is that, do we need to mention implementation
details like these? Or we can just claim

_ECN is for RFC3168
_ACCECN is for AccECN RFC

Then everything is probably fine?

The reason I'm asking is that it looks like the AccECN has a full
chapter that describes the requirement for hardware offloading which
we probably don't want to duplicate here. (For example if I was not
wrong the whole ACE bits needs to be duplicated in every segmented
packet)

Thanks


> +
>  \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level sta=
tistics
>      to the driver through the control virtqueue.
>
> @@ -151,6 +157,7 @@ \subsubsection{Feature bit requirements}\label{sec:De=
vice Types / Network Device
>  \item[VIRTIO_NET_F_GUEST_TSO4] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_TSO6] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_ECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO=
_NET_F_GUEST_TSO6.
> +\item[VIRTIO_NET_F_GUEST_ACCECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIR=
TIO_NET_F_GUEST_TSO6.
>  \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> @@ -161,6 +168,7 @@ \subsubsection{Feature bit requirements}\label{sec:De=
vice Types / Network Device
>  \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_N=
ET_F_HOST_TSO6.
> +\item[VIRTIO_NET_F_HOST_ACCECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTI=
O_NET_F_HOST_TSO6.
>  \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_HOST_TSO4,=
 VIRTIO_NET_F_HOST_TSO6
> @@ -284,11 +292,11 @@ \subsection{Device configuration layout}\label{sec:=
Device Types / Network Device
>  The device MUST NOT modify \field{mtu} once it has been set.
>
>  The device MUST NOT pass received packets that exceed \field{mtu} (plus =
low
> -level ethernet header length) size with \field{gso_type} NONE or ECN
> +level ethernet header length) size with \field{gso_type} NONE or ECN or =
ACCECN
>  after VIRTIO_NET_F_MTU has been successfully negotiated.
>
>  The device MUST forward transmitted packets of up to \field{mtu} (plus l=
ow
> -level ethernet header length) size with \field{gso_type} NONE or ECN, an=
d do
> +level ethernet header length) size with \field{gso_type} NONE or ECN or =
ACCECN, and do
>  so without fragmentation, after VIRTIO_NET_F_MTU has been successfully
>  negotiated.
>
> @@ -338,11 +346,11 @@ \subsection{Device configuration layout}\label{sec:=
Device Types / Network Device
>
>  If the driver negotiates VIRTIO_NET_F_MTU, it MUST supply enough receive
>  buffers to receive at least one receive packet of size \field{mtu} (plus=
 low
> -level ethernet header length) with \field{gso_type} NONE or ECN.
> +level ethernet header length) with \field{gso_type} NONE or ECN or ACCEC=
N.
>
>  If the driver negotiates VIRTIO_NET_F_MTU, it MUST NOT transmit packets =
of
>  size exceeding the value of \field{mtu} (plus low level ethernet header =
length)
> -with \field{gso_type} NONE or ECN.
> +with \field{gso_type} NONE or ECN or ACCECN.
>
>  A driver SHOULD negotiate the VIRTIO_NET_F_STANDBY feature if the device=
 offers it.
>
> @@ -433,7 +441,7 @@ \subsection{Device Initialization}\label{sec:Device T=
ypes / Network Device / Dev
>     The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
>    checksummed packets can be received, and if it can do that then
>    the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
> -  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO=
4,
> +  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_ACC=
ECN, VIRTIO_NET_F_GUEST_USO4,
>    VIRTIO_NET_F_GUEST_USO6 VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and
>    VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM are the input equivalents of
>    the features described above.
> @@ -592,6 +600,7 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Network Device / Device O
>  #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 0x20
>  #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 0x40
>  #define VIRTIO_NET_HDR_GSO_ECN      0x80
> +#define VIRTIO_NET_HDR_GSO_ACCECN   0x10
>          u8 gso_type;
>          le16 hdr_len;
>          le16 gso_size;
> @@ -702,6 +711,11 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>      indicates that the TCP packet has TCP CWR flag set and the flag will=
 be applied to the 1st segment of an
>      aggregated segment and be cleared from the 2nd segment of an aggrega=
ted
>      segment\footnote{This case is not handled by some older hardware, so=
 is called out specifically in the protocol.}.
> +
> +  \item If the driver negotiated the VIRTIO_NET_F_HOST_ACCECN feature,
> +    the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}
> +    indicates that the TCP packet has TCP CWR flag set and the flag will=
 be applied to all segments of an aggregated
> +    segment. \footnote{This case is not handled by some older hardware, =
so is called out specifically in the protocol.}.
>     \end{itemize}
>
>  \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feat=
ure and the
> @@ -798,6 +812,11 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>  unless the VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case th=
e driver MUST
>  set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
>
> +The driver SHOULD NOT send to the device TCP packets requiring segmentat=
ion offload
> +which have TCP CWR flag set and require the flag to be applied to all se=
gments
> +of an aggregated segment, unless the VIRTIO_NET_F_HOST_ACCECN feature is=
 negotiated,
> +in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \=
field{gso_type}.
> +
>  If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
>  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUN=
NEL_IPV6 bit
>  in \field{gso_type} according to the inner network header protocol type
> @@ -1109,12 +1128,12 @@ \subsubsection{Processing of Incoming Packets}\la=
bel{sec:Device Types / Network
>    in case of tunnels) has been validated.
>  \end{enumerate}
>
> -Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
> -and ECN features enable receive checksum, large receive offload and ECN
> -support which are the input equivalents of the transmit checksum,
> -transmit segmentation offloading and ECN features, as described
> -in \ref{sec:Device Types / Network Device / Device Operation /
> -Packet Transmission}:
> +Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL,
> +ECN and ACCECN features enable receive checksum, large receive offload,
> +RFC3168 ECN and Accurate ECN support which are the input equivalents of
> +the transmit checksum, transmit segmentation offloading, RFC3168 ECN and
> +Accurate ECN features, as described in \ref{sec:Device Types /
> +Network Device / Device Operation / Packet Transmission}:
>  \begin{enumerate}
>  \item If the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options we=
re
>    negotiated, then \field{gso_type} MAY be something other than
> @@ -1220,6 +1239,11 @@ \subsubsection{Processing of Incoming Packets}\lab=
el{sec:Device Types / Network
>  unless the VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case t=
he device MUST
>  set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
>
> +The device SHOULD NOT send to the driver TCP packets requiring segmentat=
ion offload
> +which have TCP CWR flag set and require the flag to be applied to all se=
gments
> +of an aggregated segment, unless the VIRTIO_NET_F_GUEST_ACCECN feature i=
s negotiated,
> +in which case the device MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \=
field{gso_type}.
> +
>  If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
>  device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
>  \field{flags}, if so:
> @@ -2191,6 +2215,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Network Device / Devi
>  #define VIRTIO_NET_F_GUEST_TSO6       8
>  #define VIRTIO_NET_F_GUEST_ECN        9
>  #define VIRTIO_NET_F_GUEST_UFO        10
> +#define VIRTIO_NET_F_GUEST_ACCECN     26
>  #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
>  #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
>  #define VIRTIO_NET_F_GUEST_USO4       54
> --
> 2.34.1
>

