Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AD78836
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 12:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745843554; cv=none; b=svHyFGPIeM6aBWtW0eMsxVI7GZurC5xBN1CULMgaiIjCk5QCjWkDYLzJngxtM6KWnliiE96pI2xZWfbNw9BQO7HQBzVBGVYVeZBSjcx+oVJWB7ffmhzPikIRYhs+2pUuDPWfkCNsxcyfPXyJkufOEdnBuUwRi1PnqdYqgNt6Ez4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745843554; c=relaxed/simple;
	bh=yD6xJbDHxQ7at9P2QJh/VU7Bl/QU4qEW0ss6IsL6XS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=H6QvAGC2jb9i9pn6ax/LZnFcaofmzP79kOUFP7Ck/GaWbI9GbU8ZgLp3CcmDJSjFZYe37jmeVbMX7Saj3gNAkrEqDXi/2YMDvZ2/AIgGICFh+2E7r1ab1iOljsryZ5qBo/QrmF7lKIclW+qnjtMcrh5v8wPt5unMuPrXjieAf1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jt55Swy3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jt55Swy3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745843550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sub7uoyZ8i3jXOfXlLqGeBQo6S8zOaL9kf7ameZXKtw=;
	b=Jt55Swy3fpCe7sYGQFs98bFoVOO38yAdZNtn5aJ+d1xR8GEskdjRk2JCGOGCzfgDcESTkL
	/ja6D/bGkWUV3L6JpeuGvcY3zJBuI60FhqXG/aoyuWUksr9mfaDGbzszTsFQ4C9ZtrQhag
	lnJpAzz68L3glnh9hcexY0tOQrae+e4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-Yg1QNyaNNcqKesovEgVxjg-1; Mon, 28 Apr 2025 08:32:28 -0400
X-MC-Unique: Yg1QNyaNNcqKesovEgVxjg-1
X-Mimecast-MFC-AGG-ID: Yg1QNyaNNcqKesovEgVxjg_1745843548
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39ee57e254aso2145278f8f.1
        for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 05:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745843547; x=1746448347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sub7uoyZ8i3jXOfXlLqGeBQo6S8zOaL9kf7ameZXKtw=;
        b=wKMspLAh18PitsM1FJGmi6MUPw5VL8TRPLjzN5YA0OkTO9YSKbYeAt/IuX4bNnf49S
         er9j88uCo53PcPnxLtd0OjKJHGnzJG3mpaCnofuQgsG6OVuq9xkDEQwRoTF986m5wzY1
         0SscPvLccON90Aoam5wgpeajWQOh3JquR2Kdt0NOAp45tJHHb2EDhv8GQ3LGA+C61M8W
         XCJFQZy5yE3W4d75/5Nhqh07V4AgHDtdo08l05lnQVYnjz0G7T3wvfTqZaT264aPniws
         cLPVsGA2EdE2Em140OIJfY7Cd/vwLUt0CDdS5eNPpmEHg9dlOHuG0s/DrA6gNl1LvFDq
         UI+w==
X-Gm-Message-State: AOJu0YzPbfwqCgdZ2MnNxOlJv0JS1nelg3Z1tBn7R6FsBIIGaID6Ol8S
	dVnZGa2aKpFQhWvvKwriIgQecOwG0BXYI6fNRAFDQo/5f7uz+0lssLRx10Dxc14tQTi3oSld0+Y
	IqeXgd5u+sKte9LHbWedHAlY8gfxqTTSPrHQagF6RSbyaQZrIWx8cyMZUSzS3KDOQ
X-Gm-Gg: ASbGncu/fNpoBiKMHJaWdQwA2F2ylbbSOFkBaIWW2kRMXNSPcu6YqrBcCDcMugHy6Kc
	rGQw8d6lneHxyeF9koZSB3kpjZQ8fTT53Szibsa+9VB1wunkwM1EjmTfbRABk/ZoCq2E9rSEZCK
	l2moz4x09lBJXArjsInZP0hspXKulRLyOazeI3l9eQhrecwnAeP1zeXoQIm0QfVbGMkEj4l5Jus
	z6uQPEtrAoTWz1wPuDzHXR+bRfefdpobuzFWWcW0wu9RLePTYRlNiJ8/Ry2RETADmgz5rRcLoo0
	r6/eeQ==
X-Received: by 2002:a05:6000:4212:b0:3a0:7aa3:cc74 with SMTP id ffacd0b85a97d-3a07aa3cd77mr5682925f8f.6.1745843547613;
        Mon, 28 Apr 2025 05:32:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrG3m90Lb6TD+Ekj2J09s08mYCbP7Wc3pjEBsUJqtTGgn+/r8zqrXrpKd5mQFuFCMLOhOHvg==
X-Received: by 2002:a05:6000:4212:b0:3a0:7aa3:cc74 with SMTP id ffacd0b85a97d-3a07aa3cd77mr5682896f8f.6.1745843547137;
        Mon, 28 Apr 2025 05:32:27 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073bbeb5esm11009917f8f.0.2025.04.28.05.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 05:32:26 -0700 (PDT)
Date: Mon, 28 Apr 2025 08:32:23 -0400
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
Message-ID: <20250428082427-mutt-send-email-mst@kernel.org>
References: <20250417224044.21348-1-chia-yu.chang@nokia-bell-labs.com>
 <20250417224044.21348-2-chia-yu.chang@nokia-bell-labs.com>
 <20250428034815-mutt-send-email-mst@kernel.org>
 <PAXPR07MB798444A55878297F8A0D1E64A3812@PAXPR07MB7984.eurprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PAXPR07MB798444A55878297F8A0D1E64A3812@PAXPR07MB7984.eurprd07.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5f0DXZQbHgtOk4MVXEUf9QRQkW0UV9stkA6W4YE22-c_1745843548
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 28, 2025 at 11:28:59AM +0000, Chia-Yu Chang (Nokia) wrote:
> > -----Original Message-----
> > From: Michael S. Tsirkin <mst@redhat.com> 
> > Sent: Monday, April 28, 2025 10:00 AM
> > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > Cc: virtio-comment@lists.linux.dev; cohuck@redhat.com; mvaralar@redhat.com; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>; g.white <g.white@cablelabs.com>; vidhi_goel <vidhi_goel@apple.com>; ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > Subject: Re: [PATCH v8 1/2] virtio-net: Fix ECN feature descriptions
> > 
> > 
> > CAUTION: This is an external email. Please be very careful when clicking links or opening attachments. See the URL nok.it/ext for additional information.
> > 
> > 
> > 
> > On Fri, Apr 18, 2025 at 12:40:43AM +0200, chia-yu.chang@nokia-bell-labs.com wrote:
> > > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > >
> > > Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not mean 
> > > that TCP has IP-ECN set; instead, it identifies that the TCP CWR flag 
> > > is set and will be cleared from the second segment of an aggregated segment.
> > > This is used to offload the TCP CWR flag in a way that is compatible 
> > > with
> > > RFC3168 ECN but is problematic for non-RFC3168 use of the TCP CWR flag.
> > >
> > > Foe detailed requirements, please refer to IETF RFC3168:
> > > https://datatracker.ietf.org/doc/html/rfc3168
> > >
> > > Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > > ---
> > >  device-types/net/description.tex | 33 +++++++++++++++++---------------
> > >  introduction.tex                 |  3 +++
> > >  2 files changed, 21 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/device-types/net/description.tex 
> > > b/device-types/net/description.tex
> > > index 1b6b54d..6b09f0a 100644
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
> > > +    and follow the ACE bits handling approach mentioned in
> > > +    \hyperref[intro:rfc3168]{[RFC3168]}.
> > 
> > What is "the ACE bits handling approach"? It's agrammatical to use a plural while reducing the relative in english.
> > 
> > I looked at RFC3168 and I see no mention of ACE anywhere.
> > 
> > Also "mentioned in" is weirdly informal.
> > described maybe?
> > which part of the
> > spec do you refer to?
> > 
> > you should also expand acronims at first use.
> 
> Hi Michael,
> 
> Thanks for the comments.
> 
> RFC3168 does not explicitly discuss offloading, and one relevant statement is "When the TCP data sender is ready to set the CWR bit after reducing the congestion window, it SHOULD set the CWR bit only on the first new data packet that it transmits."
> Therefore, IMO, RFC3168 does not provide a clear specification of what occurs when offloading is applied.
> While the ACE field is a new terminology introduced in the AccECN draft, it incorporates the AE, CWR, and ECE flags.
> 
> To make the virtio spec clear (i.e., without expanding on the implied information that should be in the RFC) and simple to grasp, I would propose the following changes.
> "Device can receive TSO with the CWR flag set and follow the SHOULD requirements of the CWR bit described in Section 6.1 of RFC3168."

This looks better.
receive from where? The driver?
Add a section name, too. You can drop SHOULD just say
requirements, too.

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
> > > +    indicates that the TCP packet has TCP CWR flag set, and the flag 
> > > + will be handled differently for all segments of
> > 
> > the CWR flag.
> 
> Will be changed.
> 
> > 
> > > +    an aggregated segment, as mentioned in 
> > > + \hyperref[intro:rfc3168]{[RFC3168]}
> > 
> > i could not find this in the spec either.
> > "segment" is mentioned once, when talking about MSS.
> 
> Here refers to an aggregated segment (e.g., one big super skb in Linux) that has more than one MSS block.
> And the CWR flag will be handled differently for all segments inside, like I mentioned above, as implicitly described in RFC3168.
> Is there any other suggested terminology that is common across OSs?

I don't really know what you refer to.
Given it's according to RFC, maybe no need to talk about segments?

> > 
> > > +    \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
> > 
> > what does this refer to? which protocol? hardware older than what?
> >
> > >     \end{itemize}
> > >
> > >  \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO 
> > > feature and the @@ -788,10 +793,9 @@ \subsubsection{Packet 
> > > Transmission}\label{sec:Device Types / Network Device / De  \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
> > >
> > >  The driver SHOULD NOT send to the device TCP packets requiring 
> > > segmentation offload 
> > > -which have the Explicit Congestion Notification bit set, unless the
> > > -VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the
> > > -driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in 
> > > -\field{gso_type}.
> > > +which have the TCP CWR flag set and require the flag be handled as 
> > > +mentioned in \hyperref[intro:rfc3168]{[RFC3168]},
> > 
> > still confusing.
> > should not send packets that require the flag? or should not require the flag?
> > if the former, "and which would require" ... if the later "and should not require".
> > or better, make sentences shorter.
> 
> Should not send packets that (1) require segment offload, (2) have the CWR flag set, and (3) need to follow the SHOULD requirements in Section 6.1 of RFC3168.

Any of these? All of these? Any two of these?

> Is it better like this?
> "The driver should not send TCP packets to the device that require
> segmentation offload, and the set CWR flag needs to follow the "should
> requirement" in RFC 3168 section 6.1,

this part is still confusing. what is "and" here? do not send packets
that both require segmentation and have the CWR flag?
do not send packets that require segmentation and also do not
send packets that follow requirements?


> unless the VIRTIO_NET_F_HOST_ECN
> capability is negotiated, in which case the driver must set
> VI_IO_NET_SO in GSO_type."
> 
> BRs,
> Chia-Yu
> > 
> > > +unless the VIRTIO_NET_F_HOST_ECN feature is
> > > +negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
> > 
> > in which case? when it is or when it is not negotiated? or when it sends packets maybe?
> > 
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

