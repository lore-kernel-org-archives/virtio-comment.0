Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F42F28B4E8
	for <virtio-comment@lists.linux.dev>; Mon, 14 Apr 2025 19:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744657742; cv=none; b=cdhvhxQEtkF+laxuYYNTIEcXlDhlChfD18+ChaB9um+KTbITsU4HyhiAzBZ+6CMpLSD36fhheILNcMCgmKfY5IDoyUNVdt0DC0o68a8HvPOXDku1zV7Exybkek+MOeQltaRUCcFLcWfJoObHRJ8Djo/dE27dm3plBdTl+gEtDl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744657742; c=relaxed/simple;
	bh=sM+fDdklJ/6cPkiOI5r9saoN+AUfFwc0krt1dsZGyVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ZJziaV8H1unBY/b7NscT4WxUskbR6GuOV6S3fd8Hu2WhxpOF2u3vhFwP4mCkppu2iozfGptE2wCgxKLMNNxYrNz0leCluN0c2vNNw1O+Ik4YVanzJbSaesk8huchVm8Tfmto+k4FXaQ6EeihaUaovLN/euGbzGD6ngliO9iAacQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FfP5Z2uJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FfP5Z2uJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744657739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MWgkyLJQTRlsTflokDfz7EXrgWGDaLB0T9hj4arsnkM=;
	b=FfP5Z2uJOoRDhCd3IbllDr0JqGs9IIi6GzIKoo87NmsZNd0woBFiGeyChYIJlhWXZYz0bo
	qrAhloXFl3ZkWyXMQXCOw9oXfE4V3rE1FaF72OtsrfxJKv2nhK8O+sCu4tnvUuyFeOLz4Y
	VJ8lVIY/+3/ypM3ezeGaYfneTmoSsBY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-iFIlZ7rtPHG8hAqfojBzwg-1; Mon, 14 Apr 2025 15:08:58 -0400
X-MC-Unique: iFIlZ7rtPHG8hAqfojBzwg-1
X-Mimecast-MFC-AGG-ID: iFIlZ7rtPHG8hAqfojBzwg_1744657737
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d51bd9b41so36478765e9.3
        for <virtio-comment@lists.linux.dev>; Mon, 14 Apr 2025 12:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744657737; x=1745262537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWgkyLJQTRlsTflokDfz7EXrgWGDaLB0T9hj4arsnkM=;
        b=QAMHvuX5s9l88ZwrHeMNS41magpPELOVMu0ZWXOXAjWy/yLHw5KgzuNcJOnMtcNscL
         es0wsmNsiJMc3Vt7+d/coBEErOKJSUCGh6TuTM1YsPVoHCken8dncADOoLTh2r0LUxh/
         c2GbUCUL//27Wdq0LP541NGd/vflVh2r+GE1LeGmDck/YE8ObND2DVK6BQlpvIDtSM4b
         M7S5SqXt8SPbIZhvUEzUr64Ub0jpZ+ueuyoO7o/RIYVgZPH7SL6Sp8MjzwNNDo5jTWTw
         HT/oqYKZswBRnnxow9ekCOrmsQNi+50Zj3LJPGJjh998XgsF6DuiAgzawl0UGVO63mTv
         ALdw==
X-Gm-Message-State: AOJu0YzfzMip/ZWJjELDORaxuWuQx2pU/TKBre/I7kuhE6ZpoQjVDuaa
	5OkIW3kazQr5YOSowlLc9YF5s6ht4VMa9tGFh/ywLi1sdq/a/fQjLbHQbJtEtpEISj6EfYFl6aK
	nykivILv3ZLlnFPBTcRFkyN41yLMbN0c3kdovF43xFmSjcdXSgM+kcufxkF6KlZfq
X-Gm-Gg: ASbGnctDrD+ZTaCRAeAkasEWXQceYaoio/vY66EzOdDPvf2yqhnlT+KzoqWeLMFUAZH
	LEoGws6tlI5YR3P9XitDbAoxJhcrsUrmOpTMA/NQT/Gv9o8jKp9EKJ7DiGQsAHIAwZ76fpYjHEL
	EU/Z8HEmLOzLjla9vpQfKwxYM8emQyPdJH3Ay5M3LUkH/2MGQ3thP0ACoo8o/mmt/t0P6I+SN6V
	r9BHppZQN/8d7Ail90CVcX/OWehnxZLlTdiZmYkITYkDlBvBqATRd1/nlmuk0x0J6qsUU3jtPld
	BplkBA==
X-Received: by 2002:a05:600c:1396:b0:43c:fdbe:439b with SMTP id 5b1f17b1804b1-43f3a928f0amr117186055e9.4.1744657736675;
        Mon, 14 Apr 2025 12:08:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEttg3i7cA6WXqfwqeSBy76r1oHajwFsmTMUpjYeWJ3i2g5oS+j0ZuSoLdplOsscuGinjT87Q==
X-Received: by 2002:a05:600c:1396:b0:43c:fdbe:439b with SMTP id 5b1f17b1804b1-43f3a928f0amr117185795e9.4.1744657736170;
        Mon, 14 Apr 2025 12:08:56 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96e912sm11976682f8f.31.2025.04.14.12.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:08:55 -0700 (PDT)
Date: Mon, 14 Apr 2025 15:08:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: chia-yu.chang@nokia-bell-labs.com
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com, mvaralar@redhat.com,
	jasowang@redhat.com, xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com, ij@kernel.org, ncardwell@google.com,
	koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com,
	vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com,
	mirja.kuehlewind@ericsson.com
Subject: Re: [PATCH v6 2/2] virtio-net: define Accurate ECN feature in
 virtio-spec
Message-ID: <20250414150146-mutt-send-email-mst@kernel.org>
References: <20250414153425.99726-1-chia-yu.chang@nokia-bell-labs.com>
 <20250414153425.99726-3-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250414153425.99726-3-chia-yu.chang@nokia-bell-labs.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wBqkBNgmUTKdmbhzAdzC5m4do7gg6CtEHksWB1PZjYc_1744657737
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 14, 2025 at 05:34:25PM +0200, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> This change implements Accurate ECN based on AccECN specifications:
>   https://tools.ietf.org/id/draft-ietf-tcpm-accurate-ecn-28.txt
> 
> Unlike RFC 3168 ECN, Accurate ECN uses the CWR flag as part of the ACE
> field to count new packets with CE mark; however, RFC 3168 ECN-aware TSO
> will clean CWR flag from the 2nd segment of an aggregated segment.
> Therefore, fallback shall be applied by setting NETIF_F_GSO_ACCECN to
> ensure that the CWR flag should not be changed within a aggregated segment
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
>  device-types/net/description.tex | 50 +++++++++++++++++++++++++-------
>  introduction.tex                 |  3 ++
>  2 files changed, 42 insertions(+), 11 deletions(-)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index a2c9de8..3b9247d 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -140,6 +140,14 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>  
>  \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles packets
>    carried by a UDP tunnel with partial csum for the outer header.
> +
> +\item[VIRTIO_NET_F_HOST_ACCECN (69)] Device can receive TSO with TCP CWR flag set
> +  and follow the ACE bits handling approach mentioend in
> +  \hyperref[intro:accecn]{[AccECN]}.
> +
> +\item[VIRTIO_NET_F_GUEST_ACCECN (70)] Driver can receive TSO with TCP CWR flag set
> +  and follow the ACE bits handling approach mentioend in
> +  \hyperref[intro:accecn]{[AccECN]}.
>  \end{description}

typos



>  
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
> +level ethernet header length) size with \field{gso_type} NONE or ECN or ACCECN
>  after VIRTIO_NET_F_MTU has been successfully negotiated.


NINE, ECN or ACCECN

>  
>  The device MUST forward transmitted packets of up to \field{mtu} (plus low
> -level ethernet header length) size with \field{gso_type} NONE or ECN, and do
> +level ethernet header length) size with \field{gso_type} NONE or ECN or ACCECN, and do


same

>  so without fragmentation, after VIRTIO_NET_F_MTU has been successfully
>  negotiated.
>  
> @@ -338,11 +348,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
>  
>  If the driver negotiates VIRTIO_NET_F_MTU, it MUST supply enough receive
>  buffers to receive at least one receive packet of size \field{mtu} (plus low
> -level ethernet header length) with \field{gso_type} NONE or ECN.
> +level ethernet header length) with \field{gso_type} NONE or ECN or ACCECN.

same

>  If the driver negotiates VIRTIO_NET_F_MTU, it MUST NOT transmit packets of
>  size exceeding the value of \field{mtu} (plus low level ethernet header length)
> -with \field{gso_type} NONE or ECN.
> +with \field{gso_type} NONE or ECN or ACCECN.
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
>      indicates that the TCP packet has TCP CWR flag set and the flag will be handled differently to all segements of
>      an aggregated segment, as mentioned in \hyperref[intro:rfc3168]{[RFC3168]}
>      \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
> +
> +  \item If the driver negotiated the VIRTIO_NET_F_HOST_ACCECN feature,
> +    the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}
> +    indicates that the TCP packet has TCP CWR flag set and the flag will be applied to all segments of an aggregated
> +    segment, as mentioend in \hyperref[intro:accecn]{[AccECN]}
> +    \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
>     \end{itemize}
>  
>  \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the
> @@ -797,6 +814,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>  \hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_HOST_ECN feature is
>  negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
>  
> +The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
> +which have the TCP CWR flag set and require the flag be applied as mentioend in
> +\hyperref[intro:accecn]{[AccECN]}, unless the VIRTIO_NET_F_HOST_ACCECN feature is
> +negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}.
> +
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

