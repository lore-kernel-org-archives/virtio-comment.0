Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9AB1E526
	for <virtio-comment@lists.linux.dev>; Tue, 18 Feb 2025 01:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739840888; cv=none; b=fDt5wpLqg13bCqNk9u7nRrLNNHWYVIs+8+LqIuyR6MAbyCjGExOj1mYdx8D2jkzHJUR8WzqdymvzAV7yEss87trVePIFNL5Db/5nGtQ8RwjRO7w899htgiS83uQgM2WI+za6kLZzjlLCZL9vVRd8giRWkWQDFoznryDd58uFwiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739840888; c=relaxed/simple;
	bh=2lDiHvr26H79NzkvlMaM7EaC77S94X1+iFiq4lNu0+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAkGvQnJef+5fnsrKIftptvRt3qn9gqSSKsNfpeOWqFK09aVILpPSG1RM5NnQ+njSQXqgjgkNchhqx/KwyjlPX3FojgtMTDudNdvtrhW33wYgootScTPAp6TMyM2X+rHvkcMSZ5DyGVcrKRT7YB4K2LrQEhU2hq7OF0mfK7o2+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HGUyHKus; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HGUyHKus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739840884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ld9OXdMbRMS4E2/h3cPXairH4yxQs7sc2Ydpa/Uk6eQ=;
	b=HGUyHKusMplhlICpqVD+yoFrCTGN/0uHgJnFFQ6KwjvvX0OtdKgjHDTjZew6Tc4T6GXFax
	dMgVOcmL1QSp1hdFs9SZKQxQtp3jrWHc0qX3Qu4uTehjr6Zl+YRWc6/FTkWiSjhNbQjOmY
	zUh8aZo7hfnXjEVKkQrcdAw5AQOnIZY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-SRgRg4ZsNSu1HIvVgmY4iw-1; Mon, 17 Feb 2025 20:08:03 -0500
X-MC-Unique: SRgRg4ZsNSu1HIvVgmY4iw-1
X-Mimecast-MFC-AGG-ID: SRgRg4ZsNSu1HIvVgmY4iw_1739840882
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fc0bc05c00so15397826a91.2
        for <virtio-comment@lists.linux.dev>; Mon, 17 Feb 2025 17:08:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739840882; x=1740445682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ld9OXdMbRMS4E2/h3cPXairH4yxQs7sc2Ydpa/Uk6eQ=;
        b=THyI/XPPwrCQUB6nDYvYNWPD7i6j9zxLq+K8qkCxWpc4Tt09TbP9YuYt1T7Rz2nbSt
         xbBs08AwNwDLG464XbD+EsCC8qh32ss+Fuz3ca2hi1VElByUFF9wUzuk2JH8KH8VI8tz
         ctHd8r+xrrNUDvbxTxJsGz+tlsTzU+Ff9hgWpfVHve+wTR/4yj2il9j1q4iz1xJ2dWha
         8pQAHY38MEgP6ak8l+pYQ0koQhjzC9bUdv+E9UMPXjq/WTJ6d6m3IjUWAhuJ8MYLbJ4z
         nOBKHlA6SwloAIBbGxANKd6T/K6OSPd00bxK9zJo4+ngv+IvGLtZl93eGOJGgt22yPJr
         tQbw==
X-Gm-Message-State: AOJu0Yz6OBzP+anbUg65VnzTVyUaH2i2xa65QEK+pCfR2czFS8D8Fmg+
	i2SQbveFFDc75Ch+4Jgbg57GzzAcsNty7v5jZtxQ/72wok27RgH/y5uuAGEO3Oc3Tv3hoyxZ97A
	paJ8mnpyXDoVV/u5nVXp3pYGiqd6yJOndAGFNkFus8hsmHX0HBUfwzVlpme0GQ0MV/tArkR1ORX
	kInxPBl9Zykd9IsYvA1ISKZZA72eMynvZjYnJNhuI=
X-Gm-Gg: ASbGncsNcYZbJ0b1ToUthze+SHhOccViIk0dLeAPDoMoA7pRkGzai3D1L7AioOIVLUc
	hQf5tD69n/jYDKolIQ7BN/4Y0x86m/YT7vZNEUkMaLLwNP1VuiSBhUUCaezYsdko=
X-Received: by 2002:a17:90b:2fc3:b0:2ea:b564:4b31 with SMTP id 98e67ed59e1d1-2fc40f21c49mr16919806a91.19.1739840881763;
        Mon, 17 Feb 2025 17:08:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSGpHvh8GHvNKWdlnNoYvjaoag/2VjSkbOqF9sVc8Q9GV3PiBl/8BA4yz+RaRJ6SqESztdSDxblsBA4r17Els=
X-Received: by 2002:a17:90b:2fc3:b0:2ea:b564:4b31 with SMTP id
 98e67ed59e1d1-2fc40f21c49mr16919760a91.19.1739840881268; Mon, 17 Feb 2025
 17:08:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250217172955.9271-1-chia-yu.chang@nokia-bell-labs.com> <20250217172955.9271-2-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250217172955.9271-2-chia-yu.chang@nokia-bell-labs.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 18 Feb 2025 09:07:48 +0800
X-Gm-Features: AWEUYZkW9ntDIumYhzvNWqJDbFSfQ7W_jdipP3B4bCo2vngCeWapcDw8HhucH3k
Message-ID: <CACGkMEunU9BmMzND2kuN=MuCCRSuipOj2Axm1yjbpfmAQuJdEA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] net/description.tex: New Accurate ECN and fixed
 ECN in virtio-spec
To: chia-yu.chang@nokia-bell-labs.com
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com, 
	mvaralar@redhat.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j5MIulHwq0iXOklaxy9OajiETY_qykrsbtJ5w4vub9Q_1739840882
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 1:30=E2=80=AFAM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> This change implements Accurate ECN based on AccECN specifications:
>   https://tools.ietf.org/id/draft-ietf-tcpm-accurate-ecn-28.txt
>
> Unlike RFC 3168 ECN, Accurate ECN uses the CWR flag as part of the ACE
> field to count new packets with CE mark; however, RFC 3168 ECN-aware TSO
> will clean CWR flag from the 2nd segment of a super-skb. Therefore, fallb=
ack
> shall be applied by seting NETIF_F_GSO_ACCECN to ensure that the CWR flag
> should not be changed within a super-skb.
>
> To apply it in virtio-spec, new featue bits for host and guest are added =
for
> feature negotiation between driver and device. And the translation of
> Accurate ECN GSO flag between virtio_net_hdr and skb header for
> NETIF_F_GSO_ACCECN is also added to avoid CWR flag corruption due to
> RFC3168 ECN TSO.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> ---
>  device-types/net/description.tex | 75 +++++++++++++++++++++++++-------
>  1 file changed, 60 insertions(+), 15 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index b546cd7..5ba7acc 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -54,7 +54,8 @@ \subsection{Feature bits}\label{sec:Device Types / Netw=
ork Device / Feature bits
>
>  \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
>
> -\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
> +\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with CWR flag s=
et,
> +    which will be cleared from the 2nd segment in a super-skb.

skb is Linux specific, let's use common terminology in the spec.

And this deserves a dedicated patch, and I wonder if it's too late to
change this (or can we audit all the implementation of
VIRTIO_NET_F_GUEST_ECN).

>
>  \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
>
> @@ -62,7 +63,8 @@ \subsection{Feature bits}\label{sec:Device Types / Netw=
ork Device / Feature bits
>
>  \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
>
> -\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with ECN.
> +\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with CWR flag s=
et,
> +    whcih will be cleared from the 2nd sedgment in a super-skb.

Typos here. And the same question as the guest part.

>
>  \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
>
> @@ -88,6 +90,12 @@ \subsection{Feature bits}\label{sec:Device Types / Net=
work Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
>
> +\item[VIRTIO_NET_F_HOST_ACCECN (25)] Device can receive TSO with CWR fla=
g set,
> +    which will be applied to all segments in a super-skb.

Let's find a way to define "super-skb" here, or did you mean the
segmented packets?

> +
> +\item[VIRTIO_NET_F_GUEST_ACCECN (26)] Driver can receive TSO with CWR fl=
ag set,
> +    which will be applied to all segments in a super-skb.
> +
>  \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level sta=
tistics
>      to the driver through the control virtqueue.
>
> @@ -147,6 +155,7 @@ \subsubsection{Feature bit requirements}\label{sec:De=
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
> @@ -157,6 +166,7 @@ \subsubsection{Feature bit requirements}\label{sec:De=
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
> @@ -280,11 +290,11 @@ \subsection{Device configuration layout}\label{sec:=
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
> @@ -334,11 +344,11 @@ \subsection{Device configuration layout}\label{sec:=
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
> @@ -429,10 +439,15 @@ \subsection{Device Initialization}\label{sec:Device=
 Types / Network Device / Dev
>     The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
>    checksummed packets can be received, and if it can do that then
>    the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
> +<<<<<<< HEAD
>    VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO=
4,
>    VIRTIO_NET_F_GUEST_USO6 VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and
>    VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM are the input equivalents of
>    the features described above.
> +=3D=3D=3D=3D=3D=3D=3D
> +  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_ACC=
ECN, VIRTIO_NET_F_GUEST_USO4
> +  and VIRTIO_NET_F_GUEST_USO6 are the input equivalents of the features =
described above.
> +>>>>>>> a412354 (net/description.tex: New accurate ECN and fixed ECN in =
virtio-spec)

Looks like a leftover of resolving conflicts?

>    See \ref{sec:Device Types / Network Device / Device Operation /
>  Setting Up Receive Buffers}~\nameref{sec:Device Types / Network
>  Device / Device Operation / Setting Up Receive Buffers} and
> @@ -585,8 +600,12 @@ \subsection{Device Operation}\label{sec:Device Types=
 / Network Device / Device O
>  #define VIRTIO_NET_HDR_GSO_UDP         3
>  #define VIRTIO_NET_HDR_GSO_TCPV6       4
>  #define VIRTIO_NET_HDR_GSO_UDP_L4      5
> +<<<<<<< HEAD
>  #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 0x20
>  #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 0x40
> +=3D=3D=3D=3D=3D=3D=3D
> +#define VIRTIO_NET_HDR_GSO_ACCECN   0x40
> +>>>>>>> a412354 (net/description.tex: New accurate ECN and fixed ECN in =
virtio-spec)

And here?

>  #define VIRTIO_NET_HDR_GSO_ECN      0x80
>          u8 gso_type;
>          le16 hdr_len;
> @@ -695,8 +714,13 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>
>    \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
>      the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
> -    indicates that the TCP packet has the ECN bit set\footnote{This case=
 is not handled by some older hardware, so is called out
> -specifically in the protocol.}.
> +    indicates that the TCP packet has the CWR flag set and the flag will=
 be cleared from the 2nd segment in a
> +    super-skb\footnote{This case is not handled by some older hardware, =
so is called out specifically in the protocol.}.
> +
> +  \item If the driver negotiated the VIRTIO_NET_F_HOST_ACCECN feature,
> +    the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}
> +    indicates that the TCP packet has the CWR flag set and the flag will=
 not be cleared in a super-skb\footnote{This
> +    case is not handled by some older hardware, so is called out specifi=
cally in the protocol.}.
>     \end{itemize}
>
>  \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feat=
ure and the
> @@ -788,11 +812,12 @@ \subsubsection{Packet Transmission}\label{sec:Devic=
e Types / Network Device / De
>  \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
>
>  The driver SHOULD NOT send to the device TCP packets requiring segmentat=
ion offload
> -which have the Explicit Congestion Notification bit set, unless the
> -VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the
> -driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
> +which have the Congestion Window Reduced flag set and require the flag b=
e clared from
> +the 2nd segment of the super-skb, unless the VIRTIO_NET_F_HOST_ECN featu=
re is
> +negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN=
 bit in
>  \field{gso_type}.
>
> +<<<<<<< HEAD
>  If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
>  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUN=
NEL_IPV6 bit
>  in \field{gso_type} according to the inner network header protocol type
> @@ -829,6 +854,12 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>  The driver MUST NOT set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit \field{=
flags}
>  without setting either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
>  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}.
> +=3D=3D=3D=3D=3D=3D=3D
> +The driver SHOULD NOT send to the device TCP packets requiring segmentat=
ion offload
> +which have the congestion Window Reduced flag set and require the flag n=
ot be cleared
> +in the super-skb, unless the VIRTIO_NET_F_HOST_ACCECN feature is negotia=
ted, in which
> +case the driver MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso=
_type}.
> +>>>>>>> a412354 (net/description.tex: New accurate ECN and fixed ECN in =
virtio-spec)
>
>  If the VIRTIO_NET_F_CSUM feature has been negotiated, the
>  driver MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
> @@ -1104,10 +1135,15 @@ \subsubsection{Processing of Incoming Packets}\la=
bel{sec:Device Types / Network
>    in case of tunnels) has been validated.
>  \end{enumerate}
>
> +<<<<<<< HEAD
>  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
>  and ECN features enable receive checksum, large receive offload and ECN
> +=3D=3D=3D=3D=3D=3D=3D
> +Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, ECN, ACCECN
> +features enable receive checksum, large receive offload, ECN and ACCECN
> +>>>>>>> a412354 (net/description.tex: New accurate ECN and fixed ECN in =
virtio-spec)
>  support which are the input equivalents of the transmit checksum,
> -transmit segmentation offloading and ECN features, as described
> +transmit segmentation offloading, ECN and ACCECN features, as described
>  in \ref{sec:Device Types / Network Device / Device Operation /
>  Packet Transmission}:
>  \begin{enumerate}
> @@ -1210,11 +1246,16 @@ \subsubsection{Processing of Incoming Packets}\la=
bel{sec:Device Types / Network
>  the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
>
>  The device SHOULD NOT send to the driver TCP packets requiring segmentat=
ion offload
> -which have the Explicit Congestion Notification bit set, unless the
> -VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
> -device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
> +which have the Congestion Window Reduced flag set and require the flag b=
e cleared from
> +the 2nd segment of the super-skb, unless the VIRTIO_NET_F_GUEST_ECN feat=
ure is
> +negotiated, in which case the device MUST set the VIRTIO_NET_HDR_GSO_ECN=
 bit in
>  \field{gso_type}.

I think we need 2 patches

1) clarify the behaviour of VIRTIO_NET_F_GUEST_ECN, and in the
changelog explain why it's safe to do the clarification
2) introduce the new VIRTIO_NET_F_GUEST_ACCECN feature.

>
> +The device SHOULD NOT send to the driver TCP packets requiring segmentat=
ion offload
> +which have the Congestion Window Reduced flag set and require the flag n=
ot be cleared
> +in the super-skb, unless the VIRTIO_NET_F_GUEST_ACCECN feature is negoti=
ated, in which
> +case the device MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso=
_type}.
> +
>  If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
>  device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
>  \field{flags}, if so:
> @@ -2186,8 +2227,12 @@ \subsubsection{Control Virtqueue}\label{sec:Device=
 Types / Network Device / Devi
>  #define VIRTIO_NET_F_GUEST_TSO6       8
>  #define VIRTIO_NET_F_GUEST_ECN        9
>  #define VIRTIO_NET_F_GUEST_UFO        10
> +<<<<<<< HEAD
>  #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
>  #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
> +=3D=3D=3D=3D=3D=3D=3D
> +#define VIRTIO_NET_F_GUEST_ACCECN     26
> +>>>>>>> a412354 (net/description.tex: New accurate ECN and fixed ECN in =
virtio-spec)

Please double check the patch to make sure all conflicts have been
resolved before sending them.

Thanks

>  #define VIRTIO_NET_F_GUEST_USO4       54
>  #define VIRTIO_NET_F_GUEST_USO6       55
>
> --
> 2.34.1
>

