Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0431A2571B0
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 08:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745827340; cv=none; b=BGK277izXP61Wkj23fqsTd5YzmQ2G5qN3vllu7FSFDTKlGLolLkiZR4ll17UP0DP4lcOMBcPsMJHpMbpXU9+A5jP43QI6bqODEqE1BhDWgXAiFPCsHaVX1BJZq82fZ+3+WHoE5ciNCLIju2sC8gffI9/qLf4OZ5ha2B7dzTXnJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745827340; c=relaxed/simple;
	bh=2wOITgsOQ6k3CeWVBjPAMaM18KLuWVfiMMOpSSaPKQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=OrWQvD3wcvPMFIJ4pS12XGwH8TjRuyX5PYW4XewkBfaS664jr5VsfKf8igcZ8f7Q+mF+NmxR3LXnpjRiWNFR6MnujGcvMLGYzv4iBqfz1XnLFIqr1wX3y2++v0t5NTGN073VhTCVfwv8ziHvRKvDjEjqeuFFS52yokDSt72bMn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I2IoAuFR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I2IoAuFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745827336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I7MC/F35HjZIFLNRmQmDT+raZuoalKbeF8YygkFsKVI=;
	b=I2IoAuFRFpYAsIXFhzpm3VDJ0Rrj0swjrGPifiSJJoQoviUljnPIV+OqQpPm4OBE0WUi1F
	rmd3AMTXG96McmgfKRSwen81WaOG3EZhv1+837v0TK2wg2ReklEi1dT2nTzBIqXtnaKL/e
	i3rhNl7cIkECX6TcQ/jwPn8KG4J/kdQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-owbPg2EnNfSYEk3FcXdIiQ-1; Mon, 28 Apr 2025 04:02:15 -0400
X-MC-Unique: owbPg2EnNfSYEk3FcXdIiQ-1
X-Mimecast-MFC-AGG-ID: owbPg2EnNfSYEk3FcXdIiQ_1745827334
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39c1b1c0969so2738715f8f.1
        for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 01:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745827334; x=1746432134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7MC/F35HjZIFLNRmQmDT+raZuoalKbeF8YygkFsKVI=;
        b=DrlWhgjjdnXMYGvuwVhD8utN6ed4+LLj5akONxuW2LDuWrQavNiRW+xNuMmQFUbmwk
         fIBEpTlNsqRzzr01WJ/391+T5c6aNzmHnPsJT/0aDZtooC2I5sQXzl9Z/9sKafliFKvp
         j5nzgNvoVAXlY/DxDKsfDUhikPj/vPz09MTSWmSiTNezbYWDSGL5mraBgWX8FhqTLfo+
         9zuRU6IcQrPucDVKG2t8Sfym1rwu862lwFH2nDqt2+zPUgmFMu9yaA8OwI8AiIcT2IYY
         vX7wweLr0R7glDQTcdyWkOy219CYk91HGY+DSeVilsLmE1DuxJpuqvA5NNDqneErFyT5
         U7pA==
X-Gm-Message-State: AOJu0Yy43qxp53l3ia8r3kNW+3sLXal+racmqJFpwX3fMqm71OYFzmEe
	Jm6pC7K+yxyOalT/7Osv15lUJn+hEMtCoCSJ3ZHJiZTYBngXDufufEJViG9qm95VMO3AwYtfCTy
	WxqmIJG0qyqiRnZYOmlWokkhYolmpJ3Da5DMmZhGMKyyifAQE3Us0wwpddwfCno8T
X-Gm-Gg: ASbGncubniB39/T9rZjksaVf0VjuNF0yCAeoRfU/oSFJSfpksOI4BeMkJcolOPRloMK
	zotRVFeBs3ASLdvHHTs0IPzmiP4BnMGmvU4bDxCb01+nX6VsWtqqfp5NFbZs2EfJGvv3tqnzF1/
	x4PKPZwMtlNR0nx89Dzsne+khn+5v3Trqy51rwwrrMJIo+t2ZSnEwe+iVLQn253bJWWznT0qt2M
	l0A5l7/QYPWQ+32SBwDAlsEUjUy6ybmM38dXIQ6Bhzumcaq/ma4MCipHj8dImtVVPTn2co71FDJ
	+0O0ZQ==
X-Received: by 2002:a05:600c:1c11:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-440ab79f9c2mr53075085e9.11.1745827333750;
        Mon, 28 Apr 2025 01:02:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1AnI3lB+hZN4diYU8XkU1VzgtJZOGRYaTs3V189jtZ+CUDfr5sE2Do0qQGWO+sGVWYHXJ6Q==
X-Received: by 2002:a05:600c:1c11:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-440ab79f9c2mr53074675e9.11.1745827333241;
        Mon, 28 Apr 2025 01:02:13 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a13bdsm147061475e9.9.2025.04.28.01.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 01:02:11 -0700 (PDT)
Date: Mon, 28 Apr 2025 04:02:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: chia-yu.chang@nokia-bell-labs.com
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com, mvaralar@redhat.com,
	jasowang@redhat.com, xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com, ij@kernel.org, ncardwell@google.com,
	koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com,
	vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com,
	mirja.kuehlewind@ericsson.com
Subject: Re: [PATCH v8 2/2] virtio-net: Define Accurate ECN feature in
 virtio-spec
Message-ID: <20250428040034-mutt-send-email-mst@kernel.org>
References: <20250417224044.21348-1-chia-yu.chang@nokia-bell-labs.com>
 <20250417224044.21348-3-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250417224044.21348-3-chia-yu.chang@nokia-bell-labs.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MSTY80xBJAJsnWAhTcNgZGe5dHRLBHWspqqXhaT-liA_1745827334
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 18, 2025 at 12:40:44AM +0200, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> This change implements Accurate ECN based on the AccECN specification:
>   https://tools.ietf.org/id/draft-ietf-tcpm-accurate-ecn-28.txt
> 
> Unlike RFC3168 ECN, Accurate ECN uses the TCP CWR flag as part of the ACE
> field to count new packets with CE marks in the IP-ECN field; however,
> RFC 3168 ECN-aware TSO will clean the TCP CWR flag from the 2nd segment of
> an aggregated segment. Therefore, fallback shall be applied by setting
> NETIF_F_GSO_ACCECN to ensure that the CWR flag should not be changed within
> the aggregated segment (e.g., super-skb in Linux).
> 
> To apply it in virtio-spec, new feature bits for host and guest are added
> for feature negotiation between driver and device. And the translation of
> the Accurate ECN GSO flag between virtio_net_hdr and skb header for
> NETIF_F_GSO_ACCECN is also added to avoid CWR flag corruption due to RFC3168
> ECN TSO.
> 
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> ---
>  device-types/net/description.tex | 50 +++++++++++++++++++++++++-------
>  introduction.tex                 |  3 ++
>  2 files changed, 42 insertions(+), 11 deletions(-)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 6b09f0a..cd5c38f 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -140,6 +140,14 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>  
>  \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles packets
>    carried by a UDP tunnel with partial csum for the outer header.
> +
> +\item[VIRTIO_NET_F_HOST_ACCECN (69)] Device can receive TSO with TCP CWR flag set
> +  and follow the ACE bits handling approach mentioned in
> +  \hyperref[intro:accecn]{[AccECN]}.
> +
> +\item[VIRTIO_NET_F_GUEST_ACCECN (70)] Driver can receive TSO with TCP CWR flag set
> +  and follow the ACE bits handling approach mentioned in
> +  \hyperref[intro:accecn]{[AccECN]}.
>  \end{description}


same comments as patch 1

>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
> @@ -151,6 +159,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
>  \item[VIRTIO_NET_F_GUEST_TSO4] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_TSO6] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_ECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_NET_F_GUEST_TSO6.
> +\item[VIRTIO_NET_F_GUEST_ACCECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_NET_F_GUEST_TSO6.
>  \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
>  \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> @@ -161,6 +170,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
>  \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
> +\item[VIRTIO_NET_F_HOST_ACCECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
>  \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_HOST_TSO4, VIRTIO_NET_F_HOST_TSO6
> @@ -284,11 +294,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
>  The device MUST NOT modify \field{mtu} once it has been set.
>  
>  The device MUST NOT pass received packets that exceed \field{mtu} (plus low
> -level ethernet header length) size with \field{gso_type} NONE or ECN
> +level ethernet header length) size with \field{gso_type} NONE, ECN or ACCECN
>  after VIRTIO_NET_F_MTU has been successfully negotiated.
>  
>  The device MUST forward transmitted packets of up to \field{mtu} (plus low
> -level ethernet header length) size with \field{gso_type} NONE or ECN, and do
> +level ethernet header length) size with \field{gso_type} NONE, ECN or ACCECN, and do
>  so without fragmentation, after VIRTIO_NET_F_MTU has been successfully
>  negotiated.
>  
> @@ -338,11 +348,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
>  
>  If the driver negotiates VIRTIO_NET_F_MTU, it MUST supply enough receive
>  buffers to receive at least one receive packet of size \field{mtu} (plus low
> -level ethernet header length) with \field{gso_type} NONE or ECN.
> +level ethernet header length) with \field{gso_type} NONE, ECN or ACCECN.
>  
>  If the driver negotiates VIRTIO_NET_F_MTU, it MUST NOT transmit packets of
>  size exceeding the value of \field{mtu} (plus low level ethernet header length)
> -with \field{gso_type} NONE or ECN.
> +with \field{gso_type} NONE, ECN or ACCECN.
>  
>  A driver SHOULD negotiate the VIRTIO_NET_F_STANDBY feature if the device offers it.
>  
> @@ -433,7 +443,7 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
>     The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
>    checksummed packets can be received, and if it can do that then
>    the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
> -  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4,
> +  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_ACCECN, VIRTIO_NET_F_GUEST_USO4,
>    VIRTIO_NET_F_GUEST_USO6 VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and
>    VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM are the input equivalents of
>    the features described above.
> @@ -592,6 +602,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
>  #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 0x20
>  #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 0x40
>  #define VIRTIO_NET_HDR_GSO_ECN      0x80
> +#define VIRTIO_NET_HDR_GSO_ACCECN   0x10
>          u8 gso_type;
>          le16 hdr_len;
>          le16 gso_size;
> @@ -702,6 +713,12 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>      indicates that the TCP packet has TCP CWR flag set, and the flag will be handled differently for all segments of
>      an aggregated segment, as mentioned in \hyperref[intro:rfc3168]{[RFC3168]}
>      \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
> +
> +  \item If the driver negotiated the VIRTIO_NET_F_HOST_ACCECN feature,
> +    the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}
> +    indicates that the TCP packet has TCP CWR flag set, and the flag will be applied to all segments of an aggregated

the CWR

> +    segment, as mentioned in \hyperref[intro:accecn]{[AccECN]}
> +    \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
>     \end{itemize}
>  
>  \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the
> @@ -797,6 +814,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>  \hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_HOST_ECN feature is
>  negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
>  
> +The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
> +which have the TCP CWR flag set and require the flag be applied as mentioned in
> +\hyperref[intro:accecn]{[AccECN]}, unless the VIRTIO_NET_F_HOST_ACCECN feature is
> +negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}.
> +

same comments as patch 1

>  If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
>  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
>  in \field{gso_type} according to the inner network header protocol type
> @@ -1108,12 +1130,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>    in case of tunnels) has been validated.
>  \end{enumerate}
>  
> -Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
> -and ECN features enable receive checksum, large receive offload and RFC3168
> -ECN support which are the input equivalents of the transmit checksum,
> -transmit segmentation offloading and RFC3168 ECN features, as described
> -in \ref{sec:Device Types / Network Device / Device Operation /
> -Packet Transmission}:
> +Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL, ECN and
> +ACCECN features enable receive checksum, large receive offload, RFC3168 ECN
> +and Accurate ECN support which are the input equivalents of the transmit
> +checksum, transmit segmentation offloading, RFC3168 ECN and Accurate ECN
> +features, as described in \ref{sec:Device Types / Network Device /
> +Device Operation / Packet Transmission}:
>  \begin{enumerate}
>  \item If the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options were
>    negotiated, then \field{gso_type} MAY be something other than
> @@ -1218,6 +1240,11 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>  \hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_GUEST_ECN feature is
>  negotiated, in which case the device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
>  
> +The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
> +which have the TCP CWR flag set and require the flag be handled as mentioned in
> +\hyperref[intro:accecn]{[AccECN]}, unless the VIRTIO_NET_F_GUEST_ACCECN feature is
> +negotiated, in which case the device MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}.
> +

same comments as patch 1

>  If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
>  device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
>  \field{flags}, if so:
> @@ -2193,6 +2220,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
>  #define VIRTIO_NET_F_GUEST_USO4       54
>  #define VIRTIO_NET_F_GUEST_USO6       55
> +#define VIRTIO_NET_F_GUEST_ACCECN     70
>  
>  #define VIRTIO_NET_CTRL_GUEST_OFFLOADS       5
>   #define VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET   0
> diff --git a/introduction.tex b/introduction.tex
> index d52622e..9320ca1 100644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -171,6 +171,9 @@ \section{Normative References}\label{sec:Normative References}
>  	\phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
>      S. Floyd., ``The Addition of Explicit Congestion Notification (ECN) to IP'', September 2001.
>  	\newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
> +        \phantomsection\label{intro:accecn}\textbf{[AccECN]} &
> +    B. Briscoe., ``More Accurate Explicit Congestion Notification (AccECN) Feedback in TCP'', February 2025.
> +        \newline\url{https://www.ietf.org/archive/id/draft-ietf-tcpm-accurate-ecn-33.txt}\\
>  \end{longtable}
>  
>  \section{Non-Normative References}
> -- 
> 2.34.1

