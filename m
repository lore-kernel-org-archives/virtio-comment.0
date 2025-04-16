Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E250C1B0F11
	for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 18:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744829133; cv=none; b=n9ON4EZDwx6OsWpip1gytMYzjTh/gEd6V9dWQ1a9DR6DTW/8PL/dU55wu2qtVN+PkYNchbQwWeu//UMLjO/b3wbEXKp9aU97bnFytU2c6kvOWp87+ZbHCQml9T9KTZFMjhBOVGSHZ/GV4jMkLtc5gIDTK+BpTUXQ6rkw5Bv9BVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744829133; c=relaxed/simple;
	bh=l2Y6/ydv2fttMu0Jy0L+CnS4uj8Kv2GnkDj6DGe2iho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fuU/WdwcpSxXfM0nzUFSGa/ABl6YZZ2Avpx08+QRoX0kcODXegB6QD/kEwHJVYVZI6KWES9UyUVEKJJCS2o+cFyswcu+pkEI92115N13Z4wvNztvxe3DYxTbd0HKKOE6HnNNFEbiXUyZ7I/RmO7PqaWm7apkhEMFWR+leBJszNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LheqfASe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LheqfASe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744829130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xzsmxVY521IlwWoUPBjs2hEQwT9qq6SKR82lQibUBZE=;
	b=LheqfASeC6mn7fJB3xff7f5s9PIkWmXnKpmPY80B2wehmtkc7j3f6TYJJZrmQbWa6P4a2V
	rwuUUQ3/Fs3svOkFZTQQlVKlI+E7ZuTdbRQftWGuPX1kGNJobdbylbtWseH2gvg/yLd7EO
	+hNmul+fIEQ5POze3C1nQ+l38uA0Bjw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-aWZEded6OnO8jDNthHDGVg-1; Wed, 16 Apr 2025 14:45:24 -0400
X-MC-Unique: aWZEded6OnO8jDNthHDGVg-1
X-Mimecast-MFC-AGG-ID: aWZEded6OnO8jDNthHDGVg_1744829123
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d22c304adso4659275e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 11:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744829123; x=1745433923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzsmxVY521IlwWoUPBjs2hEQwT9qq6SKR82lQibUBZE=;
        b=H6Sfaes3eEUYLBFf5doTFsStLsCHiu6aoP49vozLxNwM9ALJ/advRAeBx3ooGLOEN5
         bJMvyhJ7LwEkm8HHPihaFwBXMBqVv/Oi+UhSnvCDuMsRHINpOIa7qRLy9AqwFDsoO8cJ
         oXnV5pB7Xx3B9eMRZJUDygcd6BbkdZPXa0gpHvCwf0+S+YyZt32KPYC+qEjl/Lny8F0H
         RlMgVptt0WlXRgNw4iVfGenmCwFjpnR6DuzPpt9StewOR7xrDVP7/hnFYGvC3cOMHLo7
         Ul/r7EnXrm5mvmqbHMDWrl77tGk9UuqElgSNOi++fWuEy1y46Gl6nyYpRceJ16SmmXfQ
         Ktkg==
X-Gm-Message-State: AOJu0YyDHu8ECXXLtVCj22DGuXmKlgRlLA0tRgG1tSG/K/gHwVl2o0AD
	6q8XH7SWtI9doWL77BGSP8yxZ5HpgmQGI/TiTSDjDJb4Dpu9xgIxTl00wCXP3S94ZqXCTn8pBS8
	engmJGwh5GJN2I5Z2tBt9HhudrurVO4Fq6eEz0fxeQJGPvefyrlZuhTN7EiLvJ3oT
X-Gm-Gg: ASbGncteV0GsDVKiFDb/sckWoa8LUHTYoeTR1eIfSmNeTDoIB2MXWa2fntbA8SDEJi1
	pHbtzMa5U58tRMt5/QG5P2XOc0VHYHZDzccZ8o+rLRqiY1D+bYZdWSxGVz1ViVJucvpncOU55cq
	1NhyVX+ghaifYv2o4dryytrl4X1UZ+mJ3SI85a4JN/LSDEJmh0I6fz/xs/b3dj/KVMd6vagDc4j
	cy700t6iyRBICNuAH8Zq/4/PTJs14bHCTxgy+dGwCa7HdKrFtzKcHlmEaXTqLaH9HBpMIl//sCd
	2s5fXQ==
X-Received: by 2002:a05:600c:1d0f:b0:439:91c7:895a with SMTP id 5b1f17b1804b1-4406242b977mr5719385e9.7.1744829123414;
        Wed, 16 Apr 2025 11:45:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPI/LyH3JfCQD1ElFYhzFDlk9yPv98vX79vj3CD+HjtyfVDreE2TGRPFnKcP/l0OCjBfC7Yg==
X-Received: by 2002:a05:600c:1d0f:b0:439:91c7:895a with SMTP id 5b1f17b1804b1-4406242b977mr5719175e9.7.1744829123030;
        Wed, 16 Apr 2025 11:45:23 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f3356sm28340255e9.20.2025.04.16.11.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 11:45:22 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:45:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: chia-yu.chang@nokia-bell-labs.com
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com, mvaralar@redhat.com,
	jasowang@redhat.com, xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com, ij@kernel.org, ncardwell@google.com,
	koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com,
	vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com,
	mirja.kuehlewind@ericsson.com
Subject: Re: [PATCH v1 1/1] virtio-net: Fix ECN feature descritpion
Message-ID: <20250416144453-mutt-send-email-mst@kernel.org>
References: <20250416155223.16422-1-chia-yu.chang@nokia-bell-labs.com>
 <20250416155223.16422-2-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250416155223.16422-2-chia-yu.chang@nokia-bell-labs.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7khfwF4X0aqVTSCnTolqIZ3YXjLlPdmWZKae73pd_DM_1744829123
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 16, 2025 at 05:52:23PM +0200, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not mean that
> TCP has IP-ECN set, instead it identifies TCP CWR flag is set and will be
> cleared from the second segment. This is used to offload TCP CWR flag in a
> way that is compatible with RFC3168 ECN but is problematic for non-RFC3168
> use of CWR flag.
> 
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Can you pls send a patch sans typos? Thanks!

> ---
>  device-types/net/description.tex | 33 +++++++++++++++++---------------
>  introduction.tex                 |  3 +++
>  2 files changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 4494633..f15b74a 100644
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
> @@ -512,8 +516,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
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
>  \item \field{num_buffers} is set to zero.  This field is unused on transmitted packets.
> @@ -555,10 +560,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
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
>  If the VIRTIO_NET_F_CSUM feature has been negotiated, the
>  driver MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
> @@ -748,9 +752,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>  \end{enumerate}
>  
>  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP and ECN
> -features enable receive checksum, large receive offload and ECN
> -support which are the input equivalents of the transmit checksum,
> -transmit segmentation offloading and ECN features, as described
> +features enable receive checksum, large receive offload and RFC3168
> +ECN support which are the input equivalents of the transmit checksum,
> +transmit segmentation offloading and RFC3168 ECN features, as described
>  in \ref{sec:Device Types / Network Device / Device Operation /
>  Packet Transmission}:
>  \begin{enumerate}
> @@ -821,10 +825,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>  the device MUST NOT set \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
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
> index 44c4ca4..8b79cba 100644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -145,6 +145,9 @@ \section{Normative References}\label{sec:Normative References}
>      Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words", BCP
>      14, RFC 8174, DOI 10.17487/RFC8174, May 2017
>          \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
> +        \phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
> +    S. Floyd., ``The Addition of Explicit Congestion Notification (ECN) to IP'', September 2001.
> +        \newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
>  \end{longtable}
>  
>  \section{Non-Normative References}
> -- 
> 2.34.1

