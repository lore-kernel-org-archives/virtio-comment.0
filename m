Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D248145A18
	for <virtio-comment@lists.linux.dev>; Mon, 10 Mar 2025 02:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741573374; cv=none; b=o0LKydXC8pBknDVbRz/TIc/PlQKmdnNuOQ8fvq4ENL1p2tPnwa6TZYFft3z+OiBsVHlgfe5C7EXRnSJpyg89b/MvU/qKWYTTFO/77kM86g1ZnzMKR7MIuZK4MwjyBm5AdqOFWNBzkseLU5hTvwnUoY6nrxmAZVnyAb2riGEFcoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741573374; c=relaxed/simple;
	bh=deyfd+aRq2wHYBgsjJasi0MkObS+1EFwD5pFbyFgl+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sgVRytCBNkvs9Bv1nfy+ZTRpKhRgzRQueeX/8jlvEqqoNjFWSv79YQgrQRRd1ihYi0fafNFml3GY4wls9Tb3TMV/yW558Nejg7ZL0yBm/RMJ8BzAo6WBlj2PLByg9WEoVyBxtNYTkTzkqoJbhtuYsoo9BbHBTFFfMh9InhDaqYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WCAnuCDB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WCAnuCDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741573371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpatMQaeWrahZ7E1KISWRmgc4Lc1Ig70UzG9u5YVOiw=;
	b=WCAnuCDBVI6qYGXNUiBlr3qwKDgDcevFwCQLt03Ws20HHM4RoYREg6yKtWKqTQ89ymp/M6
	FEfB1SGqSOkUqzXkff2aWquE/hXVKCx00UGKnNAw7nCPz3mFbuAuDtTMSdJycFVVw28FkW
	jJIYwyr2YUE1xf2oHxKTClmMSltrLYM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-tiR2fEovOW6W6Lo2pESa0Q-1; Sun, 09 Mar 2025 22:22:48 -0400
X-MC-Unique: tiR2fEovOW6W6Lo2pESa0Q-1
X-Mimecast-MFC-AGG-ID: tiR2fEovOW6W6Lo2pESa0Q_1741573367
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff798e8c93so5193635a91.2
        for <virtio-comment@lists.linux.dev>; Sun, 09 Mar 2025 19:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741573367; x=1742178167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpatMQaeWrahZ7E1KISWRmgc4Lc1Ig70UzG9u5YVOiw=;
        b=hMTrQNLhjRY3Os2n3BNpl6JAW18uFz8BzyDHhsmYYr48TpALGt3PFg6vD0V3SFgGTZ
         hue/AB+Xme0XzAaM0DaY5z8J8hISB3bXM3BIb2QbG7cXJe+86HE1zaoTK/wm6EWl8JQp
         80ZksZiKXfO37YQMvWe6Nms5SVmaWA3WK1V+7Vsb8qZjSvktFwVLXK2P/VMj9/42hE/o
         O4QMbHPZOVpKz+TbNiI7Fdfki1WJBc2iNpnNlct7e/OZTFhXdJliGjI6xl5zuO/bIx5k
         eX8Uqhxf17Te11rwtotNUrAXIHh77KjBFAHSIDoc9l67SBt/+RK3GY+GM+PlWk9+GsWQ
         kZZw==
X-Gm-Message-State: AOJu0Yz7rKF7eDN+H0pZ1RXcA7qw2B30cN0aGbjfvE1IbsMsRpVXMKaV
	kohuIMZmuTP77p7JeI65pcr9YDXy/bTOeRbUHS7MHaNgGkg76lBa8b4BJjTTMvP1N3ru1IN5l0k
	LQmRHxKErh/xdTF2Eyd1iNk5F6GajwhG94tL2ead6WdcTBIXVxkUWXBUqVSTIxQs/qprkDbIdy8
	CKFvBdFa7rCw9XHmildelb4rQWAyWujUPpbx3Wg3M=
X-Gm-Gg: ASbGnctKT/sWvKb4JPfzy1PTND6YQlo1C71Aa9kyoRKjJ9Pl2bpNN+4s17V6VBB9B1x
	Fo0QhCSMjuzQw9Fc/zNFNC400f66idCXo4UQSifOaKffYRk5825XjWE827HHb6VB/RaNL/rkQgw
	==
X-Received: by 2002:a17:90b:3907:b0:2ee:ee77:227c with SMTP id 98e67ed59e1d1-2ff7ce632d4mr17331884a91.3.1741573366921;
        Sun, 09 Mar 2025 19:22:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBxzNdi+dpkzTGhk7vULAJN8banWlegjKYTInxLQ0GKP30RMMpx7ePKSuj015FKwlZTXS6rYfy6J1ABqX9XrI=
X-Received: by 2002:a17:90b:3907:b0:2ee:ee77:227c with SMTP id
 98e67ed59e1d1-2ff7ce632d4mr17331849a91.3.1741573366410; Sun, 09 Mar 2025
 19:22:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250306171917.90460-1-chia-yu.chang@nokia-bell-labs.com> <20250306171917.90460-3-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250306171917.90460-3-chia-yu.chang@nokia-bell-labs.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 10 Mar 2025 10:22:34 +0800
X-Gm-Features: AQ5f1Jp_LnPqO7VZXuCI6HNshMCOo9SFMsX3Nbwll4v5lqr-SNCWSdPUbw-3q1s
Message-ID: <CACGkMEtCqu6w5oCNNWFUnRaTeb_h9v9DotqWqt_faue+xgaTUg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] virtio-net: define Accurate ECN feature in virtio-spec
To: chia-yu.chang@nokia-bell-labs.com
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com, 
	mvaralar@redhat.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xPY04mkg4Lu1wdyrYLIfl17-eaZNf_cmpVfDn2Zot7M_1741573367
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 7, 2025 at 1:19=E2=80=AFAM <chia-yu.chang@nokia-bell-labs.com> =
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
> Therefore, fallback shall be applied by setting NETIF_F_GSO_ACCECN to
> ensure that the CWR flag should not be changed within a aggregated segmen=
t
> (e.g., super-skb in Linux).
>
> To apply it in virtio-spec, new feature bits for host and guest are added
> for feature negotiation between driver and device. And the translation
> of Accurate ECN GSO flag between virtio_net_hdr and skb header for
> NETIF_F_GSO_ACCECN is also added to avoid CWR flag corruption due to
> RFC3168 ECN TSO.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> ---
>  device-types/net/description.tex | 49 +++++++++++++++++++++++++-------
>  introduction.tex                 |  3 ++
>  2 files changed, 41 insertions(+), 11 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index 50b1372..095a1d1 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -140,6 +140,14 @@ \subsection{Feature bits}\label{sec:Device Types / N=
etwork Device / Feature bits
>
>  \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles packets
>    carried by a UDP tunnel with partial csum for the outer header.
> +
> +\item[VIRTIO_NET_F_HOST_ACCECN (69)] Device can receive TSO with TCP CWR=
 flag set
> +  and follow the ACE bits handling approach mentioend in
> +  \hyperref[intro:accecn]{[AccECN]}.
> +
> +\item[VIRTIO_NET_F_GUEST_ACCECN (70)] Driver can receive TSO with TCP CW=
R flag set
> +  and follow the ACE bits handling approach mentioend in
> +  \hyperref[intro:accecn]{[AccECN]}.
>  \end{description}
>
>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Networ=
k Device / Feature bits / Feature bit requirements}
> @@ -151,6 +159,7 @@ \subsubsection{Feature bit requirements}\label{sec:De=
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
> @@ -161,6 +170,7 @@ \subsubsection{Feature bit requirements}\label{sec:De=
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
> @@ -284,11 +294,11 @@ \subsection{Device configuration layout}\label{sec:=
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
> @@ -338,11 +348,11 @@ \subsection{Device configuration layout}\label{sec:=
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
> @@ -433,7 +443,7 @@ \subsection{Device Initialization}\label{sec:Device T=
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
> @@ -592,6 +602,7 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Network Device / Device O
>  #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 0x20
>  #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 0x40
>  #define VIRTIO_NET_HDR_GSO_ECN      0x80
> +#define VIRTIO_NET_HDR_GSO_ACCECN   0x10
>          u8 gso_type;
>          le16 hdr_len;
>          le16 gso_size;
> @@ -702,6 +713,11 @@ \subsubsection{Packet Transmission}\label{sec:Device=
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

Similar to patch 1, I think it would be fine to just say this is for
ACCECN without the need to say implementation details like CWR and
others.

Thanks

