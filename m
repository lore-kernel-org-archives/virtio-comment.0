Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376B0DDC3
	for <virtio-comment@lists.linux.dev>; Mon, 14 Apr 2025 18:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744657134; cv=none; b=ZUOCcVo78e2NwTdwnpSDTFZf1jJl7NnUCsAYvNdshREey6CXmNZGuywZd9QBnZOTPtPwceS59oUO2oVywVZDYIp3RSsD256HHlTPEH6hk2AyfL44k9yTii7iDjfRWLdXjg29+iaLLSiYamWaxlOYx+v+s4m11piLWz5VmwpVJQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744657134; c=relaxed/simple;
	bh=L3WIx0iP5WTUjz14RoHSVi5ghOaoOLNmGhqOYx1b/zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jEsNdq7aq0a/3azgEtwPy9mK2FnXecPrQjZNpnzbofpPQnvxnzEpQWf3uOsKAKp4AVjMdI4CxI/EWRMtJ5guCFJfI85I6Rs/x3qSOZT1XLB31cn4F+n98A3Eb14+6T6Ue07q1GcayteUFuDXYUpm4umE/452pi8GPJBbzrp4mj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TvZ+Jhe/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TvZ+Jhe/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744657131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fktHJptF4whCh+WV8wPAXAIL8O4dXdG9XMGz9/IvonE=;
	b=TvZ+Jhe/cervDJByaQvVsHlZcISq+Mziev8ZXxCkmEAIpzE+mtpTENkD6lkA8fEfyytSdB
	hVgfmdw2XFhr0iW9nHK1821IQ7cuLZSc7Dh+HaIVfH6jCjLhseMEcJ9BQLW9d1uxF8r/nT
	UY/f2nMHewcAi1khna0hfpdYc6gFtvs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-Eab6vSVxNFGz_aL87H31gA-1; Mon, 14 Apr 2025 14:58:49 -0400
X-MC-Unique: Eab6vSVxNFGz_aL87H31gA-1
X-Mimecast-MFC-AGG-ID: Eab6vSVxNFGz_aL87H31gA_1744657128
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso36479835e9.0
        for <virtio-comment@lists.linux.dev>; Mon, 14 Apr 2025 11:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744657128; x=1745261928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fktHJptF4whCh+WV8wPAXAIL8O4dXdG9XMGz9/IvonE=;
        b=p6q8P41Y2SegoDB0eZWDtn3dFih6dv1qGCeWysI28PS+L8XKZLj7S+Xooe3XVxyuU6
         6tgHR7zGAyHwmKlGL5kDLFrKukfbk3zOP9KQgghSJs9XvVmUNPPlJQt4HNwRNs3+h7P9
         NZSqCIwFRnQeuWmpcVNi6f3lK8iJrtZk3oi1S01+FvfxYXOteapLW7BYJDoG3ahMQDUJ
         /whq32u2xU4MDmJ9/h0RevlMp3I5Y2qHp/I+0AmIhkcJV9j7NIuPk52iBbgllTTJjge9
         tejtQs2EJu+vjNxy388eVHLBW96B6aOy9o5rk8nkzSRM9BzdZDhPMl2ouXWlNYuOIBKE
         7fIg==
X-Gm-Message-State: AOJu0Yxr1EC7t31PCIa5U9w21/PkX6JvN9oQN4kRfg7VKGVWQKgRTFVq
	zPuK4CGmJqk6oiXZYNu71LVNKnmdq0l2DQp5TjlcRMbqldogBu229DrlbDRy9NcU9nTeiJHJwKp
	wypxTeGjDAkEr6xBLR0/5Xiae/76lvJPdOqBYLz0KC2D9+YsiBeNpn3Pzbh6UAJwp
X-Gm-Gg: ASbGncsSnlmhaRoFJE+WEv8tUejNzDQD7vWFunWGufQo5Fgp1k2o+ZRzQO6u7QgJ62q
	C9jBsx3Dk3gBu7a8BgcKCpSY9ByYV9RDyQWKwMtPN/ZG3RPu0LDoz1fiCFqZZH5OwmQX7kMh7gA
	xM/wPoyS+l9d3WeR2Zkpm5NQTkPOu85WSNXQdwNag7S4EUOGPblr+Dj4Az5K6T18eq5zpJGhwPS
	zqWfGBWHGawi7v424/Mo2GbiBGbHtjb4Lpxh5c9RgXD1FQyhsKjUd4OkS+5GY6Ofgl8p8kGht1z
	u/Sjqw==
X-Received: by 2002:a05:600c:1e1c:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-43f3a9afb42mr128168625e9.24.1744657128325;
        Mon, 14 Apr 2025 11:58:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcshsBC1nKs629fl1meodlWNxST+BKmkV6gdGICYo1K4K4REZirwXPQAG6UdV6m8NidSHR6Q==
X-Received: by 2002:a05:600c:1e1c:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-43f3a9afb42mr128168375e9.24.1744657127866;
        Mon, 14 Apr 2025 11:58:47 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f208e96dasm136217035e9.0.2025.04.14.11.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 11:58:47 -0700 (PDT)
Date: Mon, 14 Apr 2025 14:58:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: chia-yu.chang@nokia-bell-labs.com
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com, mvaralar@redhat.com,
	jasowang@redhat.com, xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com, ij@kernel.org, ncardwell@google.com,
	koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com,
	vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com,
	mirja.kuehlewind@ericsson.com
Subject: Re: [PATCH v6 1/2] virtio-net: Fix ECN feature descritpion
Message-ID: <20250414145806-mutt-send-email-mst@kernel.org>
References: <20250414153425.99726-1-chia-yu.chang@nokia-bell-labs.com>
 <20250414153425.99726-2-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250414153425.99726-2-chia-yu.chang@nokia-bell-labs.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qmrB78JwfQeN143wndwChgnGV8DmTo-8M6SOcMAPD5c_1744657128
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 14, 2025 at 05:34:24PM +0200, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not mean that
> TCP has IP-ECN set, instead it identifies TCP CWR flag is set and will be
> cleared from the second segment. This is used to offload TCP CWR flag in a
> way that is compatible with RFC3168 ECN but is problematic for non-RFC3168
> use of CWR flag.
> 
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> ---


if this is accepted, we might want to backport this to 1.3 maybe?


>  device-types/net/description.tex | 33 +++++++++++++++++---------------
>  introduction.tex                 |  3 +++
>  2 files changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 1b6b54d..a2c9de8 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -54,7 +54,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>  
>  \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
>  
> -\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
> +\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with TCP CWR flag set
> +    and follow the ACE bits handling approach mentioned in
> +    \hyperref[intro:rfc3168]{[RFC3168]}.
>  
>  \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
>  
> @@ -62,7 +64,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>  
>  \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
>  
> -\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with ECN.
> +\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with TCP CWR flag set
> +    and follow the ACE bits handling approach mentioend in
> +    \hyperref[intro:rfc3168]{[RFC3168]}.
>  
>  \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
>  
> @@ -695,8 +699,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>  
>    \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
>      the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
> -    indicates that the TCP packet has the ECN bit set\footnote{This case is not handled by some older hardware, so is called out
> -specifically in the protocol.}.
> +    indicates that the TCP packet has TCP CWR flag set and the flag will be handled differently to all segements of
> +    an aggregated segment, as mentioned in \hyperref[intro:rfc3168]{[RFC3168]}
> +    \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
>     \end{itemize}
>  
>  \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the
> @@ -788,10 +793,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>  \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
>  
>  The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
> -which have the Explicit Congestion Notification bit set, unless the
> -VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the
> -driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
> -\field{gso_type}.
> +which have the TCP CWR flag set and require the flag be handled as mentioned in
> +\hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_HOST_ECN feature is
> +negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
>  
>  If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
>  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
> @@ -1105,9 +1109,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>  \end{enumerate}
>  
>  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
> -and ECN features enable receive checksum, large receive offload and ECN
> -support which are the input equivalents of the transmit checksum,
> -transmit segmentation offloading and ECN features, as described
> +and ECN features enable receive checksum, large receive offload and RFC3168
> +ECN support which are the input equivalents of the transmit checksum,
> +transmit segmentation offloading and RFC3168 ECN features, as described
>  in \ref{sec:Device Types / Network Device / Device Operation /
>  Packet Transmission}:
>  \begin{enumerate}
> @@ -1210,10 +1214,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>  the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
>  
>  The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
> -which have the Explicit Congestion Notification bit set, unless the
> -VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
> -device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
> -\field{gso_type}.
> +which have the TCP CWR flag set and require the flag be handled as mentioned in
> +\hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_GUEST_ECN feature is
> +negotiated, in which case the device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
>  
>  If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
>  device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
> diff --git a/introduction.tex b/introduction.tex
> index e60298a..d52622e 100644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -168,6 +168,9 @@ \section{Normative References}\label{sec:Normative References}
>      Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words", BCP
>      14, RFC 8174, DOI 10.17487/RFC8174, May 2017
>          \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
> +	\phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
> +    S. Floyd., ``The Addition of Explicit Congestion Notification (ECN) to IP'', September 2001.
> +	\newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
>  \end{longtable}
>  
>  \section{Non-Normative References}
> -- 
> 2.34.1

