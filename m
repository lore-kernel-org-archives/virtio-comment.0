Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8CB10E5
	for <virtio-comment@lists.linux.dev>; Mon, 10 Mar 2025 02:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741573262; cv=none; b=WLFnzHMOGBiBGd0n7LT8XY6VXbamRW6QVZiIwKHDdJjc6h5QskYvcWl+Kt+gKuLiNDTRzo62uj6dRBfboWnuHjfWAqfhEDf8+gmYk3vHVo5QdxQqXb8AHkWQV6hMjdOqluqGY7xu9FYymATCnGFDhik2eSgiDXyBJUSkneAWo0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741573262; c=relaxed/simple;
	bh=L7N990MAvYJ9pwYfuLgc86edG1Vjp0e1p6t9uWPoz+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iI0+rH9uCxkxuC7sD2nBrtsrB/vMgoc35R16BsqRECmh194qZ5QCs3TtlDHLsILJnF8SBcfU+D0SfNGhrm/j5EK1DzkZW+3mDMW5lBspS5ncep+ni60dGwHl7rq3rynDoevEqotnOLpT+fzRvQ+vdxzEU2I0MMepobgnAvuZKyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QgN0oTYw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QgN0oTYw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741573259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r1aOwkVRJuNeZbm7mn1TBN96YNUeAlQneFEL9Yz1mZw=;
	b=QgN0oTYwsoYYouPQ9mgMrMYZulFnZn18jqkBzWqtqvphlWxjIthMTQxiFE0sFJybI+APTu
	rGfj+3HFUIXk01vzf6Hvy3HVnHzZesrLyU3NfweIE/c23xoy8SSqMlZgbkkunokfHfHtvY
	UAcHM2635a1kfXb9mHxqQo6FRmFipHU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-x1h6_w0zPYmcnESE8qWC5w-1; Sun, 09 Mar 2025 22:20:58 -0400
X-MC-Unique: x1h6_w0zPYmcnESE8qWC5w-1
X-Mimecast-MFC-AGG-ID: x1h6_w0zPYmcnESE8qWC5w_1741573257
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2242f408320so31283415ad.2
        for <virtio-comment@lists.linux.dev>; Sun, 09 Mar 2025 19:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741573257; x=1742178057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1aOwkVRJuNeZbm7mn1TBN96YNUeAlQneFEL9Yz1mZw=;
        b=qBAl+GOsO438Z6pF2/zb4ZMua0Cxh0uiy/8FK3S3FLYGjcsJrjq6d0lRvHl/WqDKKg
         56qyTLJAc5HMGHmYSpVq9KrV+qGR7hth6boGvYh+TOLDShh8ZWbcjbOFTRBVRYasHQdE
         gujyKkd6Er1MzaipTLidaKD/McFGpaBAmJwI3nyAehEGX3cVU5PT48DG8gL1yRTaTNOI
         MYLQTwrlECJN2bs1MAQbXLpnluVFNcRcozIYv9o9L2j969ujppVQrwLbRJK6F9lyS0OD
         75pXaInnaZx6XcYjbGWaDl1BvjVcFxCGt/s0d4ajOYndee1COclwoZuz63ss0eTad5Z/
         C3aA==
X-Gm-Message-State: AOJu0YxkpEgMbURYph2klxfxC7qeLWaruytfXa1m3GAm3l89fhtUgvMo
	4cYEw81EGLyNROoPciOxKOVa7wLt6sHTAiw7TFWQyHfR1I1kC7QItueuKKi0FyULR/wDdfbf9Dm
	eNj8jWPPnQqW5D8tkhxqYja0Db1Ng3Nu9M9dcesMp+vf60tIr2OGpC4iGqUBrKZNtCxDq+0wuRd
	enGcxp7L46kyZG1DhiK+aPz0u5/EKYDbPlcI3Cr3s=
X-Gm-Gg: ASbGncugU3bur6aNBq/HVIjvUSUMicrsD1yCTJuW3XC8xjv+ska5gK4Ad3jlZm1VH/e
	BTViTA/FiD6U6a4mawtclpVIQcA1Mk0uCyiyVTN3cnbY/pf8i7bEB9xR3HYEc/M1ReBCkdMKgHA
	==
X-Received: by 2002:a17:902:f54e:b0:21f:1549:a563 with SMTP id d9443c01a7336-22428886654mr194875995ad.2.1741573257317;
        Sun, 09 Mar 2025 19:20:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+1TBzBkWAaKkiDzeGK21IPqM8tBByZhMOatSFcPXm/SK/8d5BT/e9c+0hXLTi+DIbn0c38MjOwmfxfCQj/vI=
X-Received: by 2002:a17:902:f54e:b0:21f:1549:a563 with SMTP id
 d9443c01a7336-22428886654mr194875635ad.2.1741573256872; Sun, 09 Mar 2025
 19:20:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250306171917.90460-1-chia-yu.chang@nokia-bell-labs.com> <20250306171917.90460-2-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250306171917.90460-2-chia-yu.chang@nokia-bell-labs.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 10 Mar 2025 10:20:45 +0800
X-Gm-Features: AQ5f1JpXyhmN8ll39-3gmib2igalN5CjapHcsABLeSKrRolC1bdwTrq8vqsx9lU
Message-ID: <CACGkMEtzRUj2-W8x1GG9qnRHisNHT2aVtnXWnb7XmY3gr9BsxQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] virtio-net: Fix ECN feature descritpion
To: chia-yu.chang@nokia-bell-labs.com
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com, 
	mvaralar@redhat.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Dsqv1gaY3a7GxZR-dNTnE4c_cJ60JQw6usHJoh_OO1Q_1741573257
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 7, 2025 at 1:19=E2=80=AFAM <chia-yu.chang@nokia-bell-labs.com> =
wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not mean that
> TCP has IP-ECN set, instead it identifies TCP CWR flag is set and will be
> cleared from the second segment. This is used to offload TCP CWR flag in =
a
> way that is compatible with RFC3168 ECN but is problematic for non-RFC316=
8
> use of CWR flag.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> ---
>  device-types/net/description.tex | 35 ++++++++++++++++++--------------
>  introduction.tex                 |  3 +++
>  2 files changed, 23 insertions(+), 15 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index 8d30673..50b1372 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -54,7 +54,9 @@ \subsection{Feature bits}\label{sec:Device Types / Netw=
ork Device / Feature bits
>
>  \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
>
> -\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
> +\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with TCP CWR fl=
ag set
> +    and follow the ACE bits handling approach mentioned in
> +    \hyperref[intro:rfc3168]{[RFC3168]}.
>
>  \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
>
> @@ -62,7 +64,9 @@ \subsection{Feature bits}\label{sec:Device Types / Netw=
ork Device / Feature bits
>
>  \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
>
> -\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with ECN.
> +\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with TCP CWR fl=
ag set
> +    and follow the ACE bits handling approach mentioend in
> +    \hyperref[intro:rfc3168]{[RFC3168]}.
>
>  \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
>
> @@ -695,8 +699,9 @@ \subsubsection{Packet Transmission}\label{sec:Device =
Types / Network Device / De
>
>    \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
>      the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
> -    indicates that the TCP packet has the ECN bit set\footnote{This case=
 is not handled by some older hardware, so is called out
> -specifically in the protocol.}.
> +    indicates that the TCP packet has TCP CWR flag set and the flag will=
 be applied to the 1st segment of an
> +    aggregated segment and be cleared from the 2nd segment of an aggrega=
ted
> +    segment\footnote{This case is not handled by some older hardware, so=
 is called out specifically in the protocol.}.
>     \end{itemize}

Nit: I still prefer to just say this complies with RFC3168 without
duplicating the implementation details.

But if others are fine with this I'm also ok.

Thanks

>
>  \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feat=
ure and the
> @@ -788,10 +793,10 @@ \subsubsection{Packet Transmission}\label{sec:Devic=
e Types / Network Device / De
>  \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
>
>  The driver SHOULD NOT send to the device TCP packets requiring segmentat=
ion offload
> -which have the Explicit Congestion Notification bit set, unless the
> -VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the
> -driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
> -\field{gso_type}.
> +which have the TCP CWR flag set and require the flag be applied to the 1=
st segment of
> +an aggregated segment and be clared from the 2nd segment of an aggregate=
d segment,
> +unless the VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case th=
e driver MUST
> +set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
>
>  If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
>  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUN=
NEL_IPV6 bit
> @@ -1105,9 +1110,9 @@ \subsubsection{Processing of Incoming Packets}\labe=
l{sec:Device Types / Network
>  \end{enumerate}
>
>  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
> -and ECN features enable receive checksum, large receive offload and ECN
> -support which are the input equivalents of the transmit checksum,
> -transmit segmentation offloading and ECN features, as described
> +and ECN features enable receive checksum, large receive offload and RFC3=
168
> +ECN support which are the input equivalents of the transmit checksum,
> +transmit segmentation offloading and RFC3168 ECN features, as described
>  in \ref{sec:Device Types / Network Device / Device Operation /
>  Packet Transmission}:
>  \begin{enumerate}
> @@ -1210,10 +1215,10 @@ \subsubsection{Processing of Incoming Packets}\la=
bel{sec:Device Types / Network
>  the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
>
>  The device SHOULD NOT send to the driver TCP packets requiring segmentat=
ion offload
> -which have the Explicit Congestion Notification bit set, unless the
> -VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
> -device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
> -\field{gso_type}.
> +which have the TCP CWR flag set and require the flag be applied to the 1=
st segment
> +of an aggregated segment and be cleared from the 2nd segment of an aggre=
gated segment,
> +unless the VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case t=
he device MUST
> +set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
>
>  If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
>  device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
> diff --git a/introduction.tex b/introduction.tex
> index e60298a..d52622e 100644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -168,6 +168,9 @@ \section{Normative References}\label{sec:Normative Re=
ferences}
>      Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Word=
s", BCP
>      14, RFC 8174, DOI 10.17487/RFC8174, May 2017
>          \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
> +       \phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
> +    S. Floyd., ``The Addition of Explicit Congestion Notification (ECN) =
to IP'', September 2001.
> +       \newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
>  \end{longtable}
>
>  \section{Non-Normative References}
> --
> 2.34.1
>

