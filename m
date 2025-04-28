Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F2D1AA1E0
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 17:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745862928; cv=none; b=i8WhtmGk4ZHU/UE3OOOULqkcC/UBbjPNILm1Ij1Uc2aJDkMRUt56qWyWvDyA9+z0Xhs7hK40mJswXLC3QwDhm+NFuTn8AlTAqga7NegxqCV01B5WOZEcMBkJ9PGZkyE+6RjXCS7zunjIYEqg1IsRM5j73vmvvs2POfzt4SijJ3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745862928; c=relaxed/simple;
	bh=nvZ8a7U8mtjx97AuSlB5R1RP5jjK/jXd7vtY3E4XUN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=EToI+NNDaOKDKx/33bONwrod/xxZxatBQqmgtuyskkYZtfnVxh2tmNNByvlDrOb0BsONiXsVDQk2IYICkGR+k0ra0HUQk6AaZQCNC0AnwcDd5I0wWr1lY+TmQLyMmF5UY7DCKKYJViyeD8TDXNk/uH6MLVOW7aeTBGgb7IxDy/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RXg5JKLh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RXg5JKLh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745862922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ztT83GcfFRR2yA5KaJPA+hNwc0K6umYW2932f5D7uRo=;
	b=RXg5JKLhyw7tVNh7tgXWNGsBr2NK9mjq9Qu/Q2CmZYBXC6PEsMSK8VHOtKJ7n3V/V8gnxk
	CnFusIIQLArH3YgNPa/2ipFnOaYs0oPUsdrk89t6LxDJJFFloXt4BaW/V+DTSuBWTXxtdM
	lnUb6daJzgiyEKWHhDcR17MGi3Sk4Cc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-zzp01AiYOWWrG0slF8XJlw-1; Mon, 28 Apr 2025 13:55:19 -0400
X-MC-Unique: zzp01AiYOWWrG0slF8XJlw-1
X-Mimecast-MFC-AGG-ID: zzp01AiYOWWrG0slF8XJlw_1745862918
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a07a867a4dso1217638f8f.3
        for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 10:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862918; x=1746467718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztT83GcfFRR2yA5KaJPA+hNwc0K6umYW2932f5D7uRo=;
        b=grFi7NIJDEp7BBVia/B1Cr+19vbTVZX6IRrUtNF4aDc3kV3YhlVmxDy1eXZlAX6S2F
         WKc2hzGPKzZWN+/Am+0r/c6v5XD4c5oaVA+lBcwMraDQCAVJprWz3bCgxyAzK+3UJPED
         QVxltUOnhW4MRqLHk0AA1ZCSiI1JaRL2NzwzCTVFD0lL2d2q0ydhDyq/mVc6UoYpda5H
         f9VVgnvEn5t3SrQ2jqIFbSkCu9SQTDkW1Vq0nwhdM9ImSHcIKueqJ7Ivjk1ayKTftSxp
         IBfs7Mphi5DeeYa/p2vMnO6lDT6QvEEmD7OM+5uUuE40snp2YoSJ6GwmkrRV824KcFKo
         Zl/g==
X-Gm-Message-State: AOJu0YxLnnuFm8xySYTlMyJnsmiCu1D6Dn3YI+iDTpA+hZaRNxDNkQQx
	4EHeyo21ksr5RfCWucJy8eq1n5BQp8/4Fk991qjQoJmFDWFOjS/ompWzn4jD6bejcdmJY88Asjj
	oF3kxNOwszgORTveto4DDA7RIJr/T2WuFvP2q6EtlDEeCsOxEy9/DAH6Y5W9lDxrO
X-Gm-Gg: ASbGncs1wB+GDE9bzsN1tUxfv+sOwVEggVgm6olt0AdpLHkEH63u+rhinx684gZ1hAi
	OO1QybEUE/7p3x/zoWOJNpC53TgC7qDmsjrjidfxzIC9OWU9snGdJcY74YjEOC4BpXjGg6w0PP5
	muMXAyzH5v5q+BztN03ZwO6xZ7nEKmQOipUGd53rIyKamDZWYi48xX6LecC41z5vUZ6ee0r1PDe
	CGuiU00scjxg9/7ztlNuNSFmXkBq/6G7gsE4vGKWCTUz0PoX6gwc0TA5k1uwftU4ky7n+GvdeMV
	uyVCMQ==
X-Received: by 2002:adf:e34f:0:b0:39e:cbf2:4344 with SMTP id ffacd0b85a97d-3a0890a51b7mr495908f8f.4.1745862918388;
        Mon, 28 Apr 2025 10:55:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaocbUrSVr3PQaLXsqoJx//5ypCTa/B2YwSyLx7+rWsyo9OTebvCI319Z490sX0L5LBKNCkQ==
X-Received: by 2002:adf:e34f:0:b0:39e:cbf2:4344 with SMTP id ffacd0b85a97d-3a0890a51b7mr495889f8f.4.1745862917942;
        Mon, 28 Apr 2025 10:55:17 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8da58sm11899199f8f.15.2025.04.28.10.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:55:17 -0700 (PDT)
Date: Mon, 28 Apr 2025 13:55:14 -0400
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
Subject: Re: [PATCH v8 1/2] virtio-net: Fix ECN feature descriptions
Message-ID: <20250428135259-mutt-send-email-mst@kernel.org>
References: <20250417224044.21348-1-chia-yu.chang@nokia-bell-labs.com>
 <20250417224044.21348-2-chia-yu.chang@nokia-bell-labs.com>
 <20250428034815-mutt-send-email-mst@kernel.org>
 <PAXPR07MB798444A55878297F8A0D1E64A3812@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <20250428082427-mutt-send-email-mst@kernel.org>
 <PAXPR07MB7984627B11C4528429AD5F99A3812@PAXPR07MB7984.eurprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PAXPR07MB7984627B11C4528429AD5F99A3812@PAXPR07MB7984.eurprd07.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dvIkyhfGQvTi2dx2q3H5bEiWiQmHDJes873YQ3QXBqw_1745862918
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 28, 2025 at 03:11:25PM +0000, Chia-Yu Chang (Nokia) wrote:
> > -----Original Message-----
> > From: Michael S. Tsirkin <mst@redhat.com> 
> > Sent: Monday, April 28, 2025 2:32 PM
> > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > Cc: virtio-comment@lists.linux.dev; cohuck@redhat.com; mvaralar@redhat.com; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>; g.white <g.white@cablelabs.com>; vidhi_goel <vidhi_goel@apple.com>; ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > Subject: Re: [PATCH v8 1/2] virtio-net: Fix ECN feature descriptions
> > 
> > 
> > CAUTION: This is an external email. Please be very careful when clicking links or opening attachments. See the URL nok.it/ext for additional information.
> > 
> > 
> > 
> > On Mon, Apr 28, 2025 at 11:28:59AM +0000, Chia-Yu Chang (Nokia) wrote:
> > > > -----Original Message-----
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Monday, April 28, 2025 10:00 AM
> > > > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > > > Cc: virtio-comment@lists.linux.dev; cohuck@redhat.com; 
> > > > mvaralar@redhat.com; jasowang@redhat.com; 
> > > > xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij@kernel.org; 
> > > > ncardwell@google.com; Koen De Schepper (Nokia) 
> > > > <koen.de_schepper@nokia-bell-labs.com>; g.white 
> > > > <g.white@cablelabs.com>; vidhi_goel <vidhi_goel@apple.com>; 
> > > > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > > > Subject: Re: [PATCH v8 1/2] virtio-net: Fix ECN feature descriptions
> > > >
> > > >
> > > > CAUTION: This is an external email. Please be very careful when clicking links or opening attachments. See the URL nok.it/ext for additional information.
> > > >
> > > >
> > > >
> > > > On Fri, Apr 18, 2025 at 12:40:43AM +0200, chia-yu.chang@nokia-bell-labs.com wrote:
> > > > > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > > > >
> > > > > Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not 
> > > > > mean that TCP has IP-ECN set; instead, it identifies that the TCP 
> > > > > CWR flag is set and will be cleared from the second segment of an aggregated segment.
> > > > > This is used to offload the TCP CWR flag in a way that is 
> > > > > compatible with
> > > > > RFC3168 ECN but is problematic for non-RFC3168 use of the TCP CWR flag.
> > > > >
> > > > > Foe detailed requirements, please refer to IETF RFC3168:
> > > > > https://datatracker.ietf.org/doc/html/rfc3168
> > > > >
> > > > > Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > > > > ---
> > > > >  device-types/net/description.tex | 33 +++++++++++++++++---------------
> > > > >  introduction.tex                 |  3 +++
> > > > >  2 files changed, 21 insertions(+), 15 deletions(-)
> > > > >
> > > > > diff --git a/device-types/net/description.tex
> > > > > b/device-types/net/description.tex
> > > > > index 1b6b54d..6b09f0a 100644
> > > > > --- a/device-types/net/description.tex
> > > > > +++ b/device-types/net/description.tex
> > > > > @@ -54,7 +54,9 @@ \subsection{Feature bits}\label{sec:Device Types 
> > > > > / Network Device / Feature bits
> > > > >
> > > > >  \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
> > > > >
> > > > > -\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
> > > > > +\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with TCP CWR flag set
> > > > > +    and follow the ACE bits handling approach mentioned in
> > > > > +    \hyperref[intro:rfc3168]{[RFC3168]}.
> > > > >
> > > > >  \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
> > > > >
> > > > > @@ -62,7 +64,9 @@ \subsection{Feature bits}\label{sec:Device Types 
> > > > > / Network Device / Feature bits
> > > > >
> > > > >  \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
> > > > >
> > > > > -\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with ECN.
> > > > > +\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with TCP CWR flag set
> > > > > +    and follow the ACE bits handling approach mentioned in
> > > > > +    \hyperref[intro:rfc3168]{[RFC3168]}.
> > > >
> > > > What is "the ACE bits handling approach"? It's agrammatical to use a plural while reducing the relative in english.
> > > >
> > > > I looked at RFC3168 and I see no mention of ACE anywhere.
> > > >
> > > > Also "mentioned in" is weirdly informal.
> > > > described maybe?
> > > > which part of the
> > > > spec do you refer to?
> > > >
> > > > you should also expand acronims at first use.
> > >
> > > Hi Michael,
> > >
> > > Thanks for the comments.
> > >
> > > RFC3168 does not explicitly discuss offloading, and one relevant statement is "When the TCP data sender is ready to set the CWR bit after reducing the congestion window, it SHOULD set the CWR bit only on the first new data packet that it transmits."
> > > Therefore, IMO, RFC3168 does not provide a clear specification of what occurs when offloading is applied.
> > > While the ACE field is a new terminology introduced in the AccECN draft, it incorporates the AE, CWR, and ECE flags.
> > >
> > > To make the virtio spec clear (i.e., without expanding on the implied information that should be in the RFC) and simple to grasp, I would propose the following changes.
> > > "Device can receive TSO with the CWR flag set and follow the SHOULD requirements of the CWR bit described in Section 6.1 of RFC3168."
> > 
> > This looks better.
> > receive from where? The driver?
> > Add a section name, too. You can drop SHOULD just say requirements, too.
> 
> OK, then I will put
> "Device can receive TSO with the CWR flag set and follow the requirements of the CWR bit described in "Section 6.1.2. The TCP Sender" of RFC3168."
> 
> > 
> > > > >
> > > > >  \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
> > > > >
> > > > > @@ -695,8 +699,9 @@ \subsubsection{Packet 
> > > > > Transmission}\label{sec:Device Types / Network Device / De
> > > > >
> > > > >    \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
> > > > >      the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
> > > > > -    indicates that the TCP packet has the ECN bit set\footnote{This case is not handled by some older hardware, so is called out
> > > > > -specifically in the protocol.}.
> > > > > +    indicates that the TCP packet has TCP CWR flag set, and the 
> > > > > + flag will be handled differently for all segments of
> > > >
> > > > the CWR flag.
> > >
> > > Will be changed.
> > >
> > > >
> > > > > +    an aggregated segment, as mentioned in 
> > > > > + \hyperref[intro:rfc3168]{[RFC3168]}
> > > >
> > > > i could not find this in the spec either.
> > > > "segment" is mentioned once, when talking about MSS.
> > >
> > > Here refers to an aggregated segment (e.g., one big super skb in Linux) that has more than one MSS block.
> > > And the CWR flag will be handled differently for all segments inside, like I mentioned above, as implicitly described in RFC3168.
> > > Is there any other suggested terminology that is common across OSs?
> > 
> > I don't really know what you refer to.
> > Given it's according to RFC, maybe no need to talk about segments?
> 
> OK, so I suggest the following without going into the details:
> "If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature, the VIRTIO_NET_HDR_GSO_ECN bit in gso_type indicates that the TCP packet 
> has the TCP CWR flag set and follows the requirements of the CWR bit described in "Section 6.1.2. The TCP Sender" of RFC3168."
> 
> > > >
> > > > > +    \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
> > > >
> > > > what does this refer to? which protocol? hardware older than what?
> > > >
> > > > >     \end{itemize}
> > > > >
> > > > >  \item If the driver negotiated the 
> > > > > VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the @@ -788,10 +793,9 
> > > > > @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De  \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
> > > > >
> > > > >  The driver SHOULD NOT send to the device TCP packets requiring 
> > > > > segmentation offload -which have the Explicit Congestion 
> > > > > Notification bit set, unless the -VIRTIO_NET_F_HOST_ECN feature is 
> > > > > negotiated, in which case the -driver MUST set the 
> > > > > VIRTIO_NET_HDR_GSO_ECN bit in -\field{gso_type}.
> > > > > +which have the TCP CWR flag set and require the flag be handled 
> > > > > +as mentioned in \hyperref[intro:rfc3168]{[RFC3168]},
> > > >
> > > > still confusing.
> > > > should not send packets that require the flag? or should not require the flag?
> > > > if the former, "and which would require" ... if the later "and should not require".
> > > > or better, make sentences shorter.
> > >
> > > Should not send packets that (1) require segment offload, (2) have the CWR flag set, and (3) need to follow the SHOULD requirements in Section 6.1 of RFC3168.
> > 
> > Any of these? All of these? Any two of these?
> > 
> > > Is it better like this?
> > > "The driver should not send TCP packets to the device that require 
> > > segmentation offload, and the set CWR flag needs to follow the "should 
> > > requirement" in RFC 3168 section 6.1,
> > 
> > this part is still confusing. what is "and" here? do not send packets that both require segmentation and have the CWR flag?
> > do not send packets that require segmentation and also do not send packets that follow requirements?
> 
> OK, it shall be the latter case you describe.
> Because, if the TCP packet requires segment offload but the RFC3168 requirement is not required (notice that it is a SHOULD requirement rather than a MUST), the packet can still be transmitted.
> In this case, the CWR flag will be delivered not just in the first packet, but this is as intended.
> 
> As such, I would like to propose a shorten text:
> "The driver should not send to the device TCP packets that require not only segmentation offload but also following the CWR flag requirements described in "Section 6.1.2 The TCP Sender" of RFC3168, unless..."

same issue, still confusing.
do you just mean VIRTIO_NET_HDR_GSO_ECN set?


> > 
> > > unless the VIRTIO_NET_F_HOST_ECN
> > > capability is negotiated, in which case the driver must set 
> > > VI_IO_NET_SO in GSO_type."
> > >
> > > BRs,
> > > Chia-Yu
> > > >
> > > > > +unless the VIRTIO_NET_F_HOST_ECN feature is negotiated, in which 
> > > > > +case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
> > > >
> > > > in which case? when it is or when it is not negotiated? or when it sends packets maybe?
> > > >
> > > > >
> > > > >  If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY 
> > > > > set
> > > > >  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> > > > > VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit @@ -1105,9 +1109,9 @@ 
> > > > > \subsubsection{Processing of Incoming Packets}\label{sec:Device 
> > > > > Types / Network  \end{enumerate}
> > > > >
> > > > >  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, 
> > > > > UDP_TUNNEL -and ECN features enable receive checksum, large 
> > > > > receive offload and ECN -support which are the input equivalents 
> > > > > of the transmit checksum, -transmit segmentation offloading and 
> > > > > ECN features, as described
> > > > > +and ECN features enable receive checksum, large receive offload 
> > > > > +and
> > > > > +RFC3168 ECN support which are the input equivalents of the 
> > > > > +transmit checksum, transmit segmentation offloading and RFC3168 
> > > > > +ECN features, as described
> > > > >  in \ref{sec:Device Types / Network Device / Device Operation / 
> > > > > Packet Transmission}:
> > > > >  \begin{enumerate}
> > > > > @@ -1210,10 +1214,9 @@ \subsubsection{Processing of Incoming 
> > > > > Packets}\label{sec:Device Types / Network  the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
> > > > >
> > > > >  The device SHOULD NOT send to the driver TCP packets requiring 
> > > > > segmentation offload -which have the Explicit Congestion 
> > > > > Notification bit set, unless the -VIRTIO_NET_F_GUEST_ECN feature 
> > > > > is negotiated, in which case the -device MUST set the 
> > > > > VIRTIO_NET_HDR_GSO_ECN bit in -\field{gso_type}.
> > > > > +which have the TCP CWR flag set and require the flag be handled 
> > > > > +as mentioned in \hyperref[intro:rfc3168]{[RFC3168]}, unless the 
> > > > > +VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
> > > > >
> > > > >  If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the 
> > > > > device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in diff --git 
> > > > > a/introduction.tex b/introduction.tex index e60298a..d52622e 
> > > > > 100644
> > > > > --- a/introduction.tex
> > > > > +++ b/introduction.tex
> > > > > @@ -168,6 +168,9 @@ \section{Normative References}\label{sec:Normative References}
> > > > >      Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words", BCP
> > > > >      14, RFC 8174, DOI 10.17487/RFC8174, May 2017
> > > > >          \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
> > > > > +     \phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
> > > > > +    S. Floyd., ``The Addition of Explicit Congestion Notification (ECN) to IP'', September 2001.
> > > > > +     \newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
> > > > >  \end{longtable}
> > > > >
> > > > >  \section{Non-Normative References}
> > > > > --
> > > > > 2.34.1

