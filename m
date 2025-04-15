Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5123018801A
	for <virtio-comment@lists.linux.dev>; Tue, 15 Apr 2025 17:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744738236; cv=none; b=dVljfY781P0sbGybVgGzkni7ViSjva+P0XIo94Q1olsQfzdV4kh8vv181xC+iv5LhPa2mbCVML8M69WagmrctQAJoyvUhvFiYuAyTMAHS8Rk5RGIEzI0B1f26/aM2yIwYRwCVCTvMfGAQTGtdNVfU7KA093PDyFTFiL+0a2FTa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744738236; c=relaxed/simple;
	bh=8orc+KyigNlmxFR8ajomHI7EKeup0e/wuDF0siMedfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=L1Hsijr03UB+P/jyOiJfPqtglNFFNhLBy3rbjiBkteMSDL/R4YnXMpW7TJDiORUk9t2DNYXF716V2MRrgO6LbirBrA18v3vcvaK86MIOCttsGB4RwoJ+MeH/Xhge8AP7UZB4eEO0M+wX+I4qT1zIXPDgwV6gwyEGcm9gl2CXBic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cM6sprHd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cM6sprHd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744738233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kS4oQDCJwIp2/kSaa6ArGt/PJewd5u0z0iE6mhilnds=;
	b=cM6sprHdI2CXXrVOXoFu/vRTaUmzcKTKymn843oOdmnGc3gkGspo9OejNkPXHgAIsMSv9D
	TNlXKV8BoWlqt0MVV4AZ7gwN4NgF6k9GxgtznHKAhA5u538sdZEjiia8sLuCXBG6+EwIeP
	VobFadPIjoNS2Mmk6mIV76CEZcSuKcg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-KSrxrq7JO7aph80NUjFmQA-1; Tue, 15 Apr 2025 13:30:30 -0400
X-MC-Unique: KSrxrq7JO7aph80NUjFmQA-1
X-Mimecast-MFC-AGG-ID: KSrxrq7JO7aph80NUjFmQA_1744738229
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3914bc0cc4aso3411367f8f.3
        for <virtio-comment@lists.linux.dev>; Tue, 15 Apr 2025 10:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744738229; x=1745343029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kS4oQDCJwIp2/kSaa6ArGt/PJewd5u0z0iE6mhilnds=;
        b=Z9DVOqRDEVPiuj3jrSojDacLBSxYcWBr/wLydDk3GjpaTUBrmdWTU1aB2CA0xtMOQZ
         6SShVUQbgqm/1hbr1XDQ1biGggntU0QTaHufsmZW52E/WZVJb5ysUQs29dJWfL3Eumai
         ts+AQ30l8tGOpd/Zf57BIm2++naKNKvCbyAYzilvkc8DacbuTp0Lx+L9mFvnlgJZRp4w
         ziymvadTiiAosGP3biqlzLMEWSHCyGNeVJ/cjtsGqj8cP0vPsR0L7Tloe37DNGWkrU7K
         fxRlzrQayYIJrYLiHTXd99pFNHsWUtpjvXuQvZedYNa06y1LWgk5UYRgm+bpjVPy8OnL
         XJCg==
X-Gm-Message-State: AOJu0Yzi0ZyEEWEuNTx28IXueKNAfV18qWqiPwL8obdjz9l61gRSiPs0
	OsMN4tRQpIoczLsuDF40hCzpt542ZQFO42xLD7X4feVwHWVixAYaq6aEtJfYpq3FqEgulpvRS3H
	15M7pKkfBuM+cIPCIC/uy5OemtCw3/QtYRPv0BjdhIPR34XD4aWqMgB5vpAnxSVlh
X-Gm-Gg: ASbGnctrCz+wPJVgFQDtHbTyfcAehdSsXps2ZwK2fcG3iMQOg8EnTaObi70vgD8r7Fc
	Q/6apRreUL+tBARByONzbaGz7CJT7dD/vTdlhahE+MJLKl1DgqdH9R8wBZtqfg2VI1RrEWTfpJU
	PgaMAPE2dBRYM+TGxM6R4jv3vYaOD6hHP9Js2QpHjnm4UEHeymOb4Y9zbk862J6AQnN5UBY6L8l
	xTq9SRycd5n5jrow3FHtmQag6EIH4f35NCQbbQIOpskaHO9RQBw7u4tiRFsxSk2nH8z5sVyLc/X
	0BJDDw==
X-Received: by 2002:a5d:584a:0:b0:399:6d26:7752 with SMTP id ffacd0b85a97d-39ee2767a8fmr303769f8f.38.1744738229048;
        Tue, 15 Apr 2025 10:30:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcY2E+lsJhafh/sOxhCn0n6R4/YoWbrX89GAO2brHMJqO2gP/j+GbXs3XaQnSB6jDKSAuLfA==
X-Received: by 2002:a5d:584a:0:b0:399:6d26:7752 with SMTP id ffacd0b85a97d-39ee2767a8fmr303735f8f.38.1744738228667;
        Tue, 15 Apr 2025 10:30:28 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9640a9sm14997972f8f.10.2025.04.15.10.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:30:27 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:30:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"ij@kernel.org" <ij@kernel.org>,
	"ncardwell@google.com" <ncardwell@google.com>,
	"Koen De Schepper (Nokia)" <koen.de_schepper@nokia-bell-labs.com>,
	"g.white" <g.white@cablelabs.com>,
	vidhi_goel <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: Re: [PATCH v6 1/2] virtio-net: Fix ECN feature descritpion
Message-ID: <20250415132904-mutt-send-email-mst@kernel.org>
References: <20250414153425.99726-1-chia-yu.chang@nokia-bell-labs.com>
 <20250414153425.99726-2-chia-yu.chang@nokia-bell-labs.com>
 <20250414145806-mutt-send-email-mst@kernel.org>
 <PAXPR07MB79843BA9E3B951584AA3461FA3B22@PAXPR07MB7984.eurprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PAXPR07MB79843BA9E3B951584AA3461FA3B22@PAXPR07MB7984.eurprd07.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QJd8bUeW5PSypYAfrOgXFWI89BGq_iiEwsd0QHo_jKQ_1744738229
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 15, 2025 at 01:33:45PM +0000, Chia-Yu Chang (Nokia) wrote:
> > -----Original Message-----
> > From: Michael S. Tsirkin <mst@redhat.com> 
> > Sent: Monday, April 14, 2025 8:59 PM
> > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > Cc: virtio-comment@lists.linux.dev; cohuck@redhat.com; mvaralar@redhat.com; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>; g.white <g.white@cablelabs.com>; vidhi_goel <vidhi_goel@apple.com>; ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > Subject: Re: [PATCH v6 1/2] virtio-net: Fix ECN feature descritpion
> > 
> > 
> > CAUTION: This is an external email. Please be very careful when clicking links or opening attachments. See the URL nok.it/ext for additional information.
> > 
> > 
> > 
> > On Mon, Apr 14, 2025 at 05:34:24PM +0200, chia-yu.chang@nokia-bell-labs.com wrote:
> > > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > >
> > > Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not mean 
> > > that TCP has IP-ECN set, instead it identifies TCP CWR flag is set and 
> > > will be cleared from the second segment. This is used to offload TCP 
> > > CWR flag in a way that is compatible with RFC3168 ECN but is 
> > > problematic for non-RFC3168 use of CWR flag.
> > >
> > > Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > > ---
> > 
> > 
> > if this is accepted, we might want to backport this to 1.3 maybe?
> 
> Thanks for feedback.
> In my opinion, this fix shall be backported to clarify its relation to RFC3168 ECN.
> Shall we make further patch, or you will do the merge once this patch is accepted?
> 
> Best regards,
> Chia-Yu

For the backport, you will need to open another github issue.


> > 
> > 
> > >  device-types/net/description.tex | 33 +++++++++++++++++---------------
> > >  introduction.tex                 |  3 +++
> > >  2 files changed, 21 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/device-types/net/description.tex 
> > > b/device-types/net/description.tex
> > > index 1b6b54d..a2c9de8 100644
> > > --- a/device-types/net/description.tex
> > > +++ b/device-types/net/description.tex
> > > @@ -54,7 +54,9 @@ \subsection{Feature bits}\label{sec:Device Types / 
> > > Network Device / Feature bits
> > >
> > >  \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
> > >
> > > -\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
> > > +\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with TCP CWR flag set
> > > +    and follow the ACE bits handling approach mentioned in
> > > +    \hyperref[intro:rfc3168]{[RFC3168]}.
> > >
> > >  \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
> > >
> > > @@ -62,7 +64,9 @@ \subsection{Feature bits}\label{sec:Device Types / 
> > > Network Device / Feature bits
> > >
> > >  \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
> > >
> > > -\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with ECN.
> > > +\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with TCP CWR flag set
> > > +    and follow the ACE bits handling approach mentioend in
> > > +    \hyperref[intro:rfc3168]{[RFC3168]}.
> > >
> > >  \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
> > >
> > > @@ -695,8 +699,9 @@ \subsubsection{Packet 
> > > Transmission}\label{sec:Device Types / Network Device / De
> > >
> > >    \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
> > >      the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
> > > -    indicates that the TCP packet has the ECN bit set\footnote{This case is not handled by some older hardware, so is called out
> > > -specifically in the protocol.}.
> > > +    indicates that the TCP packet has TCP CWR flag set and the flag will be handled differently to all segements of
> > > +    an aggregated segment, as mentioned in \hyperref[intro:rfc3168]{[RFC3168]}
> > > +    \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
> > >     \end{itemize}
> > >
> > >  \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO 
> > > feature and the @@ -788,10 +793,9 @@ \subsubsection{Packet 
> > > Transmission}\label{sec:Device Types / Network Device / De  \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
> > >
> > >  The driver SHOULD NOT send to the device TCP packets requiring 
> > > segmentation offload -which have the Explicit Congestion Notification 
> > > bit set, unless the -VIRTIO_NET_F_HOST_ECN feature is negotiated, in 
> > > which case the -driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in 
> > > -\field{gso_type}.
> > > +which have the TCP CWR flag set and require the flag be handled as 
> > > +mentioned in \hyperref[intro:rfc3168]{[RFC3168]}, unless the 
> > > +VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
> > >
> > >  If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
> > >  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the 
> > > VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit @@ -1105,9 +1109,9 @@ 
> > > \subsubsection{Processing of Incoming Packets}\label{sec:Device Types 
> > > / Network  \end{enumerate}
> > >
> > >  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL 
> > > -and ECN features enable receive checksum, large receive offload and 
> > > ECN -support which are the input equivalents of the transmit checksum, 
> > > -transmit segmentation offloading and ECN features, as described
> > > +and ECN features enable receive checksum, large receive offload and 
> > > +RFC3168 ECN support which are the input equivalents of the transmit 
> > > +checksum, transmit segmentation offloading and RFC3168 ECN features, 
> > > +as described
> > >  in \ref{sec:Device Types / Network Device / Device Operation /  
> > > Packet Transmission}:
> > >  \begin{enumerate}
> > > @@ -1210,10 +1214,9 @@ \subsubsection{Processing of Incoming 
> > > Packets}\label{sec:Device Types / Network  the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
> > >
> > >  The device SHOULD NOT send to the driver TCP packets requiring 
> > > segmentation offload -which have the Explicit Congestion Notification 
> > > bit set, unless the -VIRTIO_NET_F_GUEST_ECN feature is negotiated, in 
> > > which case the -device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in 
> > > -\field{gso_type}.
> > > +which have the TCP CWR flag set and require the flag be handled as 
> > > +mentioned in \hyperref[intro:rfc3168]{[RFC3168]}, unless the 
> > > +VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
> > >
> > >  If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the  
> > > device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in diff --git 
> > > a/introduction.tex b/introduction.tex index e60298a..d52622e 100644
> > > --- a/introduction.tex
> > > +++ b/introduction.tex
> > > @@ -168,6 +168,9 @@ \section{Normative References}\label{sec:Normative References}
> > >      Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words", BCP
> > >      14, RFC 8174, DOI 10.17487/RFC8174, May 2017
> > >          \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
> > > +     \phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
> > > +    S. Floyd., ``The Addition of Explicit Congestion Notification (ECN) to IP'', September 2001.
> > > +     \newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
> > >  \end{longtable}
> > >
> > >  \section{Non-Normative References}
> > > --
> > > 2.34.1

