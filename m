Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823A7209F54
	for <virtio-comment@lists.linux.dev>; Thu, 17 Apr 2025 22:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744927715; cv=none; b=F2oO7uFUxIs4yHUGB0GgDLubQoHJ4qO+9maKZ0YvJUgGzc7QRuTi7v8WUhUN4k3+DGf7SQuwUr2KXvlEZ9Zdj+MHJp0gjeMyb0pFRAyJlzCi+jDekCsfNml4aEn/WHXYzbo042Q7KE9lZv/tzfq6r3RGp3ThaW/gEOmZFU3YJw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744927715; c=relaxed/simple;
	bh=J4rfgfP6UEcfQcfBlOK7nM8l69YfqEeJXnVlp4in4no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GrmUZINQCMpbmmgoEO4wzbPE50gLqEoPWhWv6NzBgQccmoGYm5gK2Lcm3L6ENwy5Rp/IL93R8LE0jiLSKxJQWRvQfIN/u0aIMljRiT0Tte5QQF8HtlK5QfjLANc/pBykFpEea4rwKJueIpBvwUMkLf4SD8/qOakyDedgZqujRIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gU8J4mHp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gU8J4mHp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744927712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nItgsodgPTuJE3EoDlgPSuF5SM7B5h/VS68ZOdUp+yE=;
	b=gU8J4mHphVhG5KHMaxO0SQxUh2nobwE0/nsdtnLpP2zrRaUmENSDXgE0/FnOIJeTi58JAZ
	fXno8WMSP+ghELUlrUNUTM8DGfQDGv9j4+pa3Qs8RYQa4UUAJyJttXPH5dq7B/dgLaVG11
	7UzAahXrmaD+NOqIIODHeprRMOHgGrY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-imBymrorNUmhfRBJlPAhuA-1; Thu, 17 Apr 2025 18:08:31 -0400
X-MC-Unique: imBymrorNUmhfRBJlPAhuA-1
X-Mimecast-MFC-AGG-ID: imBymrorNUmhfRBJlPAhuA_1744927710
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so6131045e9.0
        for <virtio-comment@lists.linux.dev>; Thu, 17 Apr 2025 15:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744927710; x=1745532510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nItgsodgPTuJE3EoDlgPSuF5SM7B5h/VS68ZOdUp+yE=;
        b=erC50s0C5FsS1CbxFrQYUtOou5JYFowjGgGAJQA/LONRPZt+9Uki/0U23ZUcsd+E2L
         e0x4/n1t7v+aelIzOgGWFQdHyGIHlPNAgngsybXa6ZiouSTEzcQ2voy4+d0IyyADFbWz
         2YrDfOTt1RuFs/Kc/uZoZian6uKoucLqTq9kD6fuyRvEwEvStiuVYVx/nlcw0HWjoAES
         sXpW1LLLGJZ8EQ9EazfWlArJC8LKSYH0httMuldKTE9fdcuEs9uBDWDMpEsBZj0FtFys
         tWazJRTkFqlsw724ddmG+Qhpx48jWPM3HttU2ow6EzVwfVi85urhoSD86tvtYQaN9cfC
         zHlg==
X-Gm-Message-State: AOJu0YzvoPN8httvAb2ZJJqhQrjuVj7TemSNaZYT09641UwIVuSf1zqK
	nkLzPxrRC+DN0Pvow8L4fzPIa7VBKYGyMtdHEXQcGatOc5qqZS8EJS7UHqEK49ShAmJKYYpfIoJ
	QKJabNCli2wDz0HzYABMpubGKLwHLlvXOYbMuTxBuzUEaSsLMVD2Kzqd9NtSYriWM
X-Gm-Gg: ASbGncuCSNC22JhuBuBm0Tx1qLv9Kv/uPsArpBA6okNPTnu/ZjnMS27+YL3kMhkTMjc
	q0h8qEtb5LIcIjENglToU34iqO942lLE21Uk2OCmOcYGUUJWz/ko0HfVaz0UcaWJRh+mlSzM4G/
	wKIiDIVqgdMrWzYFceu3OF9sJAymwkSE+hjfpLdiFRpDQAa1Smpp5KQO1YEqhl3ZpttMI3NgxNE
	NgInzWuZvDosOXGZJVVLn0t5jBzCJOhAXI1nLA+dzyr8t5ezr8ya0njwcZH180LVS/sv6ueyUVI
	ve+r3w==
X-Received: by 2002:a5d:648d:0:b0:38d:dd52:1b5d with SMTP id ffacd0b85a97d-39efba2e5bfmr390425f8f.4.1744927709777;
        Thu, 17 Apr 2025 15:08:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTFKduSrTGDitVRs/esMt639upenTM29nOhQZHv2feX5wko84IWRQ1+0CgPJr5gzW7gHPyXA==
X-Received: by 2002:a5d:648d:0:b0:38d:dd52:1b5d with SMTP id ffacd0b85a97d-39efba2e5bfmr390402f8f.4.1744927709366;
        Thu, 17 Apr 2025 15:08:29 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493212sm839847f8f.66.2025.04.17.15.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:08:28 -0700 (PDT)
Date: Thu, 17 Apr 2025 18:08:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: chia-yu.chang@nokia-bell-labs.com
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com, mvaralar@redhat.com,
	jasowang@redhat.com, xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com, ij@kernel.org, ncardwell@google.com,
	koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com,
	vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com,
	mirja.kuehlewind@ericsson.com
Subject: Re: [PATCH v7 1/2] virtio-net: Fix ECN feature descritpion
Message-ID: <20250417180552-mutt-send-email-mst@kernel.org>
References: <20250417215735.20982-1-chia-yu.chang@nokia-bell-labs.com>
 <20250417215735.20982-2-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250417215735.20982-2-chia-yu.chang@nokia-bell-labs.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KanReTtUs1oU6tykbnRnlNp-BTq7BN2TTu6ALfJUmjw_1744927710
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 17, 2025 at 11:57:34PM +0200, chia-yu.chang@nokia-bell-labs.com wrote:
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

even the subject has a typo.

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

what does require refer to? driver should not require? packets require?

> +\hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_HOST_ECN feature is
> +negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.

set for which packets?

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

same question

> +\hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_GUEST_ECN feature is
> +negotiated, in which case the device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.

set for which packets?

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

