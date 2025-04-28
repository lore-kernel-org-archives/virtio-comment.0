Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA3E1FF60A
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 07:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745827186; cv=none; b=DeX4VvUeDXmCdZ0ozFolhBKM4QxOWPkBJVDBQxYNbBnBNM6lsJ59jy1xh54JqrTLTiHdInnsMGFG6b8xR1SagcNnhqvj6oIzyi/nbcSCpZCfJopycGVGg+czVJveO+HaQxc0ICSalKmpV4p2A+KrWMsBGxi4PUWsE3sHO4/VP7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745827186; c=relaxed/simple;
	bh=0MZzNI7Mz21heoeKB4UgSXZHkVH/4zVlWoGHMnHpf+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UvgcNGzualmM/68NTAqbNNMuQMSScqTA1kcBZO0eNirpW/UDKe4mTrhIWIWfUgN/O5aHW8JyodnvdWRDASxQSaImbg/qEwxh1AFvLqKGllDYiPM1D1nIfDXyeUpr+K5zne4GSkMFesWanV8hqRtlC77AqH9Jwz9VkvNx2LkiqlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EfMQIsky; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EfMQIsky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745827182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NVdw1SPhlTuognID1AWOxL3ZiH7DaRSj1XTLT81plDU=;
	b=EfMQIskycwLuDghMspMVMuz4esOEzwxYEXS9Px/n48ijxtndMm3/3w4q8FFSW41iDhfkwR
	SCq6bz26QJhKOJX2dJOyXRJ9ztxGdNvJKCh6sc706y1a7+hFqZG8fddrxeNFbEDfiGZnOs
	Gkhc82xqWvi598ZCXzIXdBCjz5DCSGA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-bMPGo_pSOHKerFLOcxXi-Q-1; Mon, 28 Apr 2025 03:59:41 -0400
X-MC-Unique: bMPGo_pSOHKerFLOcxXi-Q-1
X-Mimecast-MFC-AGG-ID: bMPGo_pSOHKerFLOcxXi-Q_1745827180
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3912b54611dso2241593f8f.1
        for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 00:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745827180; x=1746431980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVdw1SPhlTuognID1AWOxL3ZiH7DaRSj1XTLT81plDU=;
        b=TrtTIwUPpR6/+e/1miZTUoh+yvvADKbJeG/UP66VsvpYJ6QyNYeylOAfNCTWT8WwsY
         1ncLJWjb1T21FUPaozZRZu2kAzpfnin9D4Av7mhJx2vofgPQMOW4cBznDGCPlvZE1Lz1
         mxJ/xoqqt+cG1SopwS0KUoTKjvA81r9S8WW/bAQBoSLPL6MoTPrm30+WtfiFNbpMnQ7S
         kz90irp762Aowi4Aj6hfgZTjpAU89lsAIyFfAVO1WrB4H5vw+Q0LqRobYvxaxGVS2Sve
         KGlJTK+P3TuETjpX2QePVzHqJ+bSz1y9AcnJrNkks9/uknrNf/e+P8m+Gxm9p2XczxIu
         Aojw==
X-Gm-Message-State: AOJu0YzBmrVO2O0n2OiIYU1DkWJmM1uxR9dFjddNERbFsvFdKb+hhzRB
	4XHYEV0zhdo+GSRbRN1N9JWzouxXz2ts+dEIcepC8pvbAydRsEOP++KHipwG3lDxvb7YWvkRDZV
	5/i6/EE9Gcyvva4IHAYN9uU/ttQ1Z7IrfRmto2y9/Mp++2XSgdH0wZ1ObYu0fs4Tm
X-Gm-Gg: ASbGncuSusP+b0jPG+rtqZrkYvyuwH76KIO5WV4sqXkRKBHgPx0MuOySkXT7hg8cZlR
	0OKQmmYK/6Cmmtpi3fW6Oo8kiPwqd7Rxy9QU3fjasjyZcEKaw5ujdRrRLfayZWjnb4JmOYrFqwS
	ZRfS1dvKNoDliAmaXMAqaYFlAhQwFstyqzzpAGr2/1oSSaui7OSinqjiOOSuy1f3vCXb2GG3TP0
	+UwPHgCYelMBqDWqCzP47YjjbrM1tV0kapd06PQv6o49t5czTA92d5OP6Snl0JRy5KliIUMiQ/W
	hwE/YA==
X-Received: by 2002:a05:6000:188f:b0:39e:f89b:85d6 with SMTP id ffacd0b85a97d-3a074f798c1mr7552061f8f.51.1745827179837;
        Mon, 28 Apr 2025 00:59:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKUWnRD3k9zAceevw2aix01mHL6JjiaJ1TTbZmRwI7OooQfPCo02Bx6Ip52UCcL7DVCJ9h3w==
X-Received: by 2002:a05:6000:188f:b0:39e:f89b:85d6 with SMTP id ffacd0b85a97d-3a074f798c1mr7552034f8f.51.1745827179383;
        Mon, 28 Apr 2025 00:59:39 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a07dbd6ea1sm6324743f8f.7.2025.04.28.00.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 00:59:38 -0700 (PDT)
Date: Mon, 28 Apr 2025 03:59:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: chia-yu.chang@nokia-bell-labs.com
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com, mvaralar@redhat.com,
	jasowang@redhat.com, xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com, ij@kernel.org, ncardwell@google.com,
	koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com,
	vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com,
	mirja.kuehlewind@ericsson.com
Subject: Re: [PATCH v8 1/2] virtio-net: Fix ECN feature descriptions
Message-ID: <20250428034815-mutt-send-email-mst@kernel.org>
References: <20250417224044.21348-1-chia-yu.chang@nokia-bell-labs.com>
 <20250417224044.21348-2-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250417224044.21348-2-chia-yu.chang@nokia-bell-labs.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qjMX7bkiQZnbvZPDAarh_VbriK52rRrpuUES2y6FxZY_1745827180
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 18, 2025 at 12:40:43AM +0200, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not mean that
> TCP has IP-ECN set; instead, it identifies that the TCP CWR flag is set
> and will be cleared from the second segment of an aggregated segment.
> This is used to offload the TCP CWR flag in a way that is compatible with
> RFC3168 ECN but is problematic for non-RFC3168 use of the TCP CWR flag.
> 
> Foe detailed requirements, please refer to IETF RFC3168:
> https://datatracker.ietf.org/doc/html/rfc3168
> 
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> ---
>  device-types/net/description.tex | 33 +++++++++++++++++---------------
>  introduction.tex                 |  3 +++
>  2 files changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 1b6b54d..6b09f0a 100644
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
> +    and follow the ACE bits handling approach mentioned in
> +    \hyperref[intro:rfc3168]{[RFC3168]}.

What is "the ACE bits handling approach"? It's agrammatical to use
a plural while reducing the relative in english.

I looked at RFC3168 and I see no mention of ACE anywhere.

Also "mentioned in" is weirdly informal.
described maybe?
which part of the
spec do you refer to?

you should also expand acronims at first use.

>  
>  \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
>  
> @@ -695,8 +699,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>  
>    \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
>      the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
> -    indicates that the TCP packet has the ECN bit set\footnote{This case is not handled by some older hardware, so is called out
> -specifically in the protocol.}.
> +    indicates that the TCP packet has TCP CWR flag set, and the flag will be handled differently for all segments of

the CWR flag.

> +    an aggregated segment, as mentioned in \hyperref[intro:rfc3168]{[RFC3168]}

i could not find this in the spec either.
"segment" is mentioned once, when talking about MSS.

> +    \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.

what does this refer to? which protocol? hardware older than what?

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
> +\hyperref[intro:rfc3168]{[RFC3168]},

still confusing.
should not send packets that require the flag? or should not require the
flag?
if the former, "and which would require" ... if the later "and should not
require".
or better, make sentences shorter.


>c unless the VIRTIO_NET_F_HOST_ECN feature is
> +negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.

in which case? when it is or when it is not negotiated? or when it sends
packets maybe?

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

