Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267881F585C
	for <virtio-comment@lists.linux.dev>; Thu, 17 Apr 2025 22:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744927837; cv=none; b=k72pwssCla15Wv2eMKa04z/Q5NkAhJcNBAo997aTzmwGDcO82NLCmCmnn+45RJv3F6ZoNLZmP62I8e90YkPUp44dT/8uGRvfcl82swxQvBbDfkUa6I2bFRe7cpQz1ilCsgHMbIzVzEesuAr3/uuBQgS/0Bi07Hua77xxSOPBYdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744927837; c=relaxed/simple;
	bh=+t9bl1SHstHUYSul24IeIlcLnnSPmsGjoPUDOo97CTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=bzNyfjWYEdlvgzY4AfHzhYQ//oYFXVsbNnqiSEGSy9WokIvMZd9Avp1+bPWZLUD+faJb4We1iU1az28V39mq4qaLpeD639xY6cTrzsmqXCmQjSLbFzn3Z4fbzNnz3QJ7eTS5IzRpLfpgN4lX29AOaOqGEke2HDGKhrfLxA4AKec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RrepyXrI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RrepyXrI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744927833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0ksumfyC7GO7HCkGeaK4zRPoR4k4blTtOwwXG1TeMcA=;
	b=RrepyXrIKQaXphww03FReBMPCICeFDd4DcDv/BG2feaVFZ5fXCbgoK6UrksuW3b1NId39e
	+Z+bn9uc/erzoRn9paGeL04vKotWskxosojuv0mMEd03+k3d0yLoWBUiBZlSvXzaUT5Loa
	/1/6VNOMaDpU+BP2WgaXeEdhL6FPQMs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-jsIpUaO9PwSZPQULkxF8gw-1; Thu, 17 Apr 2025 18:10:32 -0400
X-MC-Unique: jsIpUaO9PwSZPQULkxF8gw-1
X-Mimecast-MFC-AGG-ID: jsIpUaO9PwSZPQULkxF8gw_1744927831
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so9400595e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 17 Apr 2025 15:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744927831; x=1745532631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ksumfyC7GO7HCkGeaK4zRPoR4k4blTtOwwXG1TeMcA=;
        b=ZpnZBMUrmZJ2elxPF2K/yL9Rk5YrlpFV1zvWTDrIb24zGIPVNnNkp3zgHoe1DKTWY4
         LhtIIt1bZ2iKauxKfaZ97B5Lr1GMhFDARoaAYHMG5Ptw8PzNSpG7+mPurI7GKHVf+6CX
         ULmqghoXZdLLzbxKL4Ch4NVHxfiH7VDb/DriC9dmXHEQcWl3I5i+OW1cOZROTtDjqvnW
         mshi0+L1YhbixndikWFKOQfVMhXZpLA6ZGi5JWHnVKntE0jyv/HqfZVyUU0RFEHQP8Km
         Mk8G98kLwTxc8GwVr8vFid1wftNS9fldwdlVeCbhgnKkh2HLY8VNutq6ZThGeoDfYMJn
         YquA==
X-Gm-Message-State: AOJu0YxBue0iPeoaIbhWSHpUfb38oTWGPCiXpVFrL59llXBls+c/XSXp
	Xxlq2Cr+g1hH00pDKfwREG2W2Pci3cMge+6Z+kOSgkiltpJEYOUNtCiHsk41ivqD34QrF7kbe4c
	gGkss1e7huhs6VLJiLNHnatLKsuQlolugIvNls78CtQmcplg1yK3Jpub+3Wk0Yt0p
X-Gm-Gg: ASbGncvjxho2sBf4yomJnQBxuidpLuXmw2XfBu3nsM8DQk0dVFcstjEBU9fJEwB8v99
	BpPT4UhLOm1Te9MCkPvRN9xB3HidpUjGMKXJK01yK7TTSDgVtB65zDdVu5Q4mp2s+Xzt3KLej0n
	oC5i5X7RkmbFHX4/OUu8G/Z4aGNzO89ZdfqC0TsfotNezjxAvYax3guJxMOMrY33Jqwz6WY/Icq
	7NbhevEc9NNEMpyYYIqQbCz382z6mYOCwpjXKE1l/qxEPQ6N1oC4FGBYA0ldB3+4XtJBjENykhd
	YOEEHg==
X-Received: by 2002:a05:600c:8709:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-4406ac1fe25mr4899165e9.30.1744927831257;
        Thu, 17 Apr 2025 15:10:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqhVxFGGe+nMUxpEp5WJX9dCE6p61B93XePnfQXcGhI+PuJfVpL7T+9mk77tPLTu+MiUv33w==
X-Received: by 2002:a05:600c:8709:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-4406ac1fe25mr4899025e9.30.1744927830827;
        Thu, 17 Apr 2025 15:10:30 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43be53sm855457f8f.41.2025.04.17.15.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:10:30 -0700 (PDT)
Date: Thu, 17 Apr 2025 18:10:27 -0400
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
Subject: Re: [PATCH v1 1/1] virtio-net: Fix ECN feature descritpion
Message-ID: <20250417180949-mutt-send-email-mst@kernel.org>
References: <20250416155223.16422-1-chia-yu.chang@nokia-bell-labs.com>
 <20250416155223.16422-2-chia-yu.chang@nokia-bell-labs.com>
 <20250416144453-mutt-send-email-mst@kernel.org>
 <PAXPR07MB79841E4D0A7571EC2B950B2EA3BC2@PAXPR07MB7984.eurprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PAXPR07MB79841E4D0A7571EC2B950B2EA3BC2@PAXPR07MB7984.eurprd07.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EdePg9NFvUnUW65-wdoz9gjmqxD2CZYE3x0jdZhhU3U_1744927831
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 17, 2025 at 10:04:26PM +0000, Chia-Yu Chang (Nokia) wrote:
> > -----Original Message-----
> > From: Michael S. Tsirkin <mst@redhat.com> 
> > Sent: Wednesday, April 16, 2025 8:45 PM
> > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > Cc: virtio-comment@lists.linux.dev; cohuck@redhat.com; mvaralar@redhat.com; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>; g.white <g.white@cablelabs.com>; vidhi_goel <vidhi_goel@apple.com>; ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > Subject: Re: [PATCH v1 1/1] virtio-net: Fix ECN feature descritpion
> > 
> > 
> > CAUTION: This is an external email. Please be very careful when clicking links or opening attachments. See the URL nok.it/ext for additional information.
> > 
> > 
> > 
> > On Wed, Apr 16, 2025 at 05:52:23PM +0200, chia-yu.chang@nokia-bell-labs.com wrote:
> > > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > >
> > > Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not mean 
> > > that TCP has IP-ECN set, instead it identifies TCP CWR flag is set and 
> > > will be cleared from the second segment. This is used to offload TCP 
> > > CWR flag in a way that is compatible with RFC3168 ECN but is 
> > > problematic for non-RFC3168 use of CWR flag.
> > >
> > > Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > 
> > Can you pls send a patch sans typos? Thanks!
> 
> Hello,
> 
> I've just sent v7 of RFC3168 ECN and AccECN patch to v1.4 branch
> And this single patch is to backport the RFC3168 ECN to the master branch (v1.3).
> Is this being the right way to do the backporting for v1.3 standard? Thanks.
> 
> Chia-Yu


get 1.4 patc upstream first. then 1.3 *maybe*.

> > 
> > > ---
> > >  device-types/net/description.tex | 33 +++++++++++++++++---------------
> > >  introduction.tex                 |  3 +++
> > >  2 files changed, 21 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/device-types/net/description.tex 
> > > b/device-types/net/description.tex
> > > index 4494633..f15b74a 100644
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
> > > @@ -512,8 +516,9 @@ \subsubsection{Packet 
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
> > >  \item \field{num_buffers} is set to zero.  This field is unused on transmitted packets.
> > > @@ -555,10 +560,9 @@ \subsubsection{Packet 
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
> > >  If the VIRTIO_NET_F_CSUM feature has been negotiated, the  driver MAY 
> > > set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in @@ -748,9 +752,9 @@ 
> > > \subsubsection{Processing of Incoming Packets}\label{sec:Device Types 
> > > / Network  \end{enumerate}
> > >
> > >  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP and ECN 
> > > -features enable receive checksum, large receive offload and ECN 
> > > -support which are the input equivalents of the transmit checksum, 
> > > -transmit segmentation offloading and ECN features, as described
> > > +features enable receive checksum, large receive offload and RFC3168 
> > > +ECN support which are the input equivalents of the transmit checksum, 
> > > +transmit segmentation offloading and RFC3168 ECN features, as 
> > > +described
> > >  in \ref{sec:Device Types / Network Device / Device Operation /  
> > > Packet Transmission}:
> > >  \begin{enumerate}
> > > @@ -821,10 +825,9 @@ \subsubsection{Processing of Incoming 
> > > Packets}\label{sec:Device Types / Network  the device MUST NOT set \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
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
> > > a/introduction.tex b/introduction.tex index 44c4ca4..8b79cba 100644
> > > --- a/introduction.tex
> > > +++ b/introduction.tex
> > > @@ -145,6 +145,9 @@ \section{Normative References}\label{sec:Normative References}
> > >      Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words", BCP
> > >      14, RFC 8174, DOI 10.17487/RFC8174, May 2017
> > >          \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
> > > +        \phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
> > > +    S. Floyd., ``The Addition of Explicit Congestion Notification (ECN) to IP'', September 2001.
> > > +        \newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
> > >  \end{longtable}
> > >
> > >  \section{Non-Normative References}
> > > --
> > > 2.34.1

