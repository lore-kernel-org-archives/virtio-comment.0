Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8AA31E115
	for <virtio-comment@lists.linux.dev>; Thu, 16 Oct 2025 10:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760608989; cv=none; b=iSwdVYbJQykD+kjyyG3wa10NPRG9/7D2yUrXFsq7zd3v7MvfYbWlhPYziYhrgWyr41O1ffavFrse7g+cV1Yzb0cl/mF/F2fxCmpbIoTzz6BM/DC+mg4Fq3txApq4dJRwJ1gQVgV0Q9zz9tz0NsphOYZ1WFjhytGkZkOyefQuoy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760608989; c=relaxed/simple;
	bh=MfHSot4y/6D+F0kXPacn1s+9amzYAlK8tNTieYs05jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Y9UONwT625TIHCQDvL3yVuTYolXlmRbmfx5C0xdWRWWrRbiBfr11MlwoMPB599L5LhPWo/b8dzPDzLWOO0dGYjAO/Xi1WnL4Y9dPaFRrMKO++WkqPgMQChdiEX4Vxizrct31lzc1iMbAnyGN9MzAfiVmnJiPjO377WY/hXj70sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g9HV4c8c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g9HV4c8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760608983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hlgc0j7i0z+rAiSYV951KeseHct/CJnLvYYBLTPt/h4=;
	b=g9HV4c8cact9u5NmqFx5XRQ7nBvGk5g/SccKI9ptZcNVfn6bpzJ+k66U5QWxhbFkWkDrN8
	obyaksnJZFlC07YDoEz0rgkel67OZ6DoO6fHDE8jo7U+KwoNKSkvV1Fo1v6fysrH953aIc
	UGZmuKsqfPl3np1xFwj845tK/oo7NkI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-jKoSQNKJM6mDoKcT4i0LZg-1; Thu, 16 Oct 2025 06:03:02 -0400
X-MC-Unique: jKoSQNKJM6mDoKcT4i0LZg-1
X-Mimecast-MFC-AGG-ID: jKoSQNKJM6mDoKcT4i0LZg_1760608981
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3ecdf7b5c46so435536f8f.2
        for <virtio-comment@lists.linux.dev>; Thu, 16 Oct 2025 03:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760608981; x=1761213781;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hlgc0j7i0z+rAiSYV951KeseHct/CJnLvYYBLTPt/h4=;
        b=Hp2Lv2K4at8MtKfKUxeDYsVWW0Wr9nxfLBIX++W8jeeZhhHqTPTUyTnO4pLmXWWXU2
         V8tLaImJLefp0t6jYbcuf1qHswsE3pyBMiAYfUTR33K2amokaAsGjHaW5k45dzcgk2Yj
         sWP63AxLYW3JSr0fbYx2ktNbLSreHzLstBu6SiKbW7J5fpIUCsTYzd/NAOdvOQevZhjr
         Gmzf8h6shfnvM5Ew1461qfsTT4xiY7y5CCsrdc+rUyv4ygIfqQrxYD0X8F+ckJNbH8Nj
         2e2RlXMEbXVHwRZgNyW6NklD3asya5Br5/epSpq5p/rKA8XbPK7vYWGJUOODUvL7LgDI
         IJnw==
X-Gm-Message-State: AOJu0YxQar3A7teG4JP7aBkeg/CVBbUBAsJzi/axeF0ZsLH8zzi9XXm4
	dqU9QVdlwQEeNY0oNM+aBTV4KvgeDErrpldi9cGnt7g9zxZ04FkWeLMsiv4EHmfBJ5ZjtJVCZsk
	fn7Wgub0s18U6alwLQ21hPKMNDTJPc5bP8L2fpHkkeLsOPAVSMr2smEb3ebrA6t7l7NNy
X-Gm-Gg: ASbGnctIK9k+MKioNF6pmus7XbF0kl1FqSrp7eHZ2Rrq1Ng5W5P6mCm0JvdYM4ySVbK
	S4moMYbB0oRSMnm4xQa+Lm8hU9V8wbDAxvSpTGx+2JTzNaQge3IfDKbObmuUwUCO+WPjcil+0kj
	hh+uew3QjSTlCQM6XDPqFXj1GEG+T8bES9brfc8tkwcM7czY7cG8TKRbHv+GbrBSQGgK6LOveTg
	VnzpLwc30kpXGgdHJeUf/wAt+7SG615XQJKN0/ntok+86CiHlC8Tq/EzyK+JjNmRPtkh1XXT38j
	AS/tVoOc80X4lm+PI4SQUd3L5DtechOcGMZ7xm6kw8/d+VRJsI/eCrFf7mSGTCHY
X-Received: by 2002:a05:6000:2c11:b0:3f4:c39d:d392 with SMTP id ffacd0b85a97d-4266e7df8f5mr21807663f8f.40.1760608980449;
        Thu, 16 Oct 2025 03:03:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5WXztTUEwzmY7YDOe/5ixdJ5v+f1b/ZeR8Jwx2gT7EhGwmrqZB6hTb/V/hZcAeS1SVqQDtA==
X-Received: by 2002:a05:6000:2c11:b0:3f4:c39d:d392 with SMTP id ffacd0b85a97d-4266e7df8f5mr21807619f8f.40.1760608979777;
        Thu, 16 Oct 2025 03:02:59 -0700 (PDT)
Received: from redhat.com ([77.137.36.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce583424sm33015613f8f.21.2025.10.16.03.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 03:02:59 -0700 (PDT)
Date: Thu, 16 Oct 2025 06:02:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, lulu@redhat.com,
	nguyenlienviet@google.com
Subject: Re: [PATCH] virtio-net: introduce TSO limit feature
Message-ID: <20251016031546-mutt-send-email-mst@kernel.org>
References: <20251014042243.22087-1-jasowang@redhat.com>
 <20251014044005-mutt-send-email-mst@kernel.org>
 <CACGkMEs7Y9DLuRp_3ex8ac3Hv5y7X5Q-PnS61DMjOVjAkvazjA@mail.gmail.com>
 <20251015030738-mutt-send-email-mst@kernel.org>
 <CACGkMEvBmNZCTrn9cWD+wByjNa+q-iEUOA6PK_GmWcqTdB5YMQ@mail.gmail.com>
 <20251016020113-mutt-send-email-mst@kernel.org>
 <CACGkMEtO5Z1-gwWLLm5TN4L6Sc5F6Vf+O_5W_joMq8p+TGV6Xg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtO5Z1-gwWLLm5TN4L6Sc5F6Vf+O_5W_joMq8p+TGV6Xg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cYfa9DCbAY3Quj9lrdRPgejzWNbSwifTMGoeUkAOHB4_1760608981
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Oct 16, 2025 at 02:31:46PM +0800, Jason Wang wrote:
> On Thu, Oct 16, 2025 at 2:17 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Oct 16, 2025 at 01:57:41PM +0800, Jason Wang wrote:
> > > On Wed, Oct 15, 2025 at 3:27 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > Thanks for the answers. Some more comments:
> > > >
> > > > On Wed, Oct 15, 2025 at 12:29:13PM +0800, Jason Wang wrote:
> > > > > > >  device-types/net/description.tex | 46 ++++++++++++++++++++++++++++++++
> > > > > > >  1 file changed, 46 insertions(+)
> > > > > > >
> > > > > > > diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> > > > > > > index 415c7fd..e56df75 100644
> > > > > > > --- a/device-types/net/description.tex
> > > > > > > +++ b/device-types/net/description.tex
> > > > > > > @@ -146,6 +146,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
> > > > > > >   when VIRTIO_NET_F_IPSEC is negotiated. When a device offers IPsec feature, it SHOULD
> > > > > > >   also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
> > > > > > >
> > > > > > > +\item[VIRTIO_NET_F_HOST_TSO_LIMIT(71)] Device limits the maximum TCP
> > > > > > > +  length and the number of segments when performing TCP segmentation.
> > > > > > > +
> > > > > > >  \end{description}
> > > > > > >
> > > > > > >  \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
> > > > > > > @@ -184,6 +187,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
> > > > > > >  \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
> > > > > > >  \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ along with VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
> > > > > > >  \item[VIRTIO_NET_F_RSS_CONTEXT] Requires VIRTIO_NET_F_CTRL_VQ and VIRTIO_NET_F_RSS.
> > > > > > > +\item[VIRTIO_NET_F_HOST_TSO_LIMIT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6
> > > > > > >  \end{description}
> > > > > > >
> > > > > > >  \begin{note}
> > > > > > > @@ -220,6 +224,8 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
> > > > > > >          le16 rss_max_indirection_table_length;
> > > > > > >          le32 supported_hash_types;
> > > > > > >          le32 supported_tunnel_types;
> > > > > > > +        le32 tso_max_size;
> > > > > > > +        le32 tso_max_segs;
> > > > > > >  };
> > > > > > >  \end{lstlisting}
> > > > > > >
> > > > > > > @@ -276,6 +282,19 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
> > > > > > >  Encapsulation types are defined in \ref{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets /
> > > > > > >  Hash calculation for incoming packets / Encapsulation types supported/enabled for inner header hash}.
> > > > > > >
> > > > > > > +The following field, \field{tso_max_size} only exists if
> > > > > > > +VIRTIO_NET_F_HOST_TSO_LIMIT is set.
> > > > > > > +It specifies the maximum TCP length
> > > > > >
> > > > > > what is TCP length?
> > > > >
> > > > > It's defined in the rfc793:
> > > > >
> > > > > """
> > > > >       The TCP Length is the TCP header length plus the data length in
> > > > >       octets (this is not an explicitly transmitted quantity, but is
> > > > >       computed), and it does not count the 12 octets of the pseudo
> > > > >       header.
> > > > > """
> > > >
> > > >
> > > > But that one is 16 bit so can not exceed 65535.
> > >
> > > I just reuse the terminology instead of defining something new.
> >
> > Let's use a generic term that will work with big tcp.
> 
> After glancing at RFC TCP length seems to be the best as TCP header
> doesn't have a length.
> 
> Maybe you have something better in mind?


Depends on what do you mean by it, exactly.

> >
> > > Note
> > > that it is only used in pseudo header for csum after device has
> > > performed TSO. The value in the pseudo header is capped by MTU/MSS.
> > >
> > > As replied in another thread, BIG TCP requires more work or features.
> > > Driver needs to set ip->tot_len 0 with a new gso type to let the
> > > device know about BIG TCP packet.
> > >
> > > >
> > > > > >
> > > > > > > of a TSO packet
> > > > > >
> > > > > > what is a TSO packet?
> > > > >
> > > > > Packet for device to perform TCP segmentation offload.
> > > >
> > > > pls define terms before use.
> > >
> > > I may miss something but TSO has been widely used in the spec before
> > > this feature:
> > >
> > > """
> > > \item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
> > > ...
> > > \item[VIRTIO_NET_F_HOST_TSO4 (11)] Device can receive TSOv4.
> > > ...
> > > """
> >
> >
> > Yes but that does not define a "TSO packet".
> 
> How about a patch beforehand to explain thing like:
> 
> \item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO (TCP
> Segmentation Offload) with ECN.

That does not define is either?

virtio$ git grep 'TSO packet'
virtio$ 





> >
> >
> > > >
> > > > > > > that the
> > > > > > > +device can process.
> > > > > >
> > > > > > process in which direction? you mean device can receive?
> > > > >
> > > > > It works only for TX (as TSO works only for TX).
> > > >
> > > >
> > > > rest of spec says "device receives from driver"  for this.
> > > > process is ambiguous
> > >
> > > A quick grep doesn't show me things like this, maybe you can point out
> > > the location. Not a native speaker, but using "device receives from
> > > driver" is indeed ambiguous for TX.
> >
> > Well right near the text you quoted:
> >
> > \item[VIRTIO_NET_F_HOST_TSO4 (11)] Device can receive TSOv4.
> >
> > \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
> 
> Okay, I think you want another to to replace it with
> 
> \item[VIRTIO_NET_F_HOST_TSO4 (11)] Device can transmit TSOv4.
> 
> ?


"receive" in this context is "receive from driver".


TSO is not something that is transmitted on the wire.




> >
> >
> >
> >
> > > >
> > > >
> > > >
> > > >
> > > > > >
> > > > > > > When VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is set,
> > > > > > > +it specifies the maximum inner TCP length of a UDP tunnel TSO packet
> > > > > > > +that the device can process.
> > > > > >
> > > > > > Rest of spec talks of " GSO over UDP tunnels packets" is this the same?
> > > > >
> > > > > Not exactly the same, this is only for TSO not genreal GSO.
> > > >
> > > > rest of spec mostly talks of GSO. in fact virtio tso is a kind of
> > > > accelerated gso.
> > >
> > > This only applies for some specific software datapath like vhost-net.
> > > But it doesn't apply to others especially the hardware device who will
> > > do real TSO.
> >
> > My point is that once you have said both GSO and TSO in the same
> > sentence, any reader's eyes have glazed over.
> >
> >
> >
> >
> > > > either do the same or add a lot of text
> > > > explaining tso as opposed to gso.
> > >
> > > Is this ok to say "UDP tunnel VIRTIO_NET_HDR_GSO_TCPV4 or
> > > VIRTIO_NET_HDR_GSO_TCPV6 packet"?
> >
> > Do you maybe mean: \field{gso_type} set to VIRTIO_NET_HDR_GSO_TCPV4
> > or VIRTIO_NET_HDR_GSO_TCPV6
> 
> Yes.
> 
> >
> >
> >
> > > >
> > > > > >
> > > > > > even if it's actually unused?
> > > > > >
> > > > > > this, on the assumption that the length for tunnel is smaller?
> > > > >
> > > > > It means the device should have the same limitation for plain TSO and
> > > > > tunnel TSO.
> > > >
> > > > Hmm. I have doubts how it can work given the overhead.
> > >
> > > If a device can't afford the same limitation, it can simply not
> > > advertise this feature. The reason I don't introduce a dedicated
> > > limitation for tunnel is that there could be more tunnel supported in
> > > the future, it would be a burden to have a per tunnel type limitation.
> >
> > Well presumably the feature is needed no?
> 
> Yes, but the kernel assumes the same limitation for tunnel and non
> tunnel one. Having a single limitation simply things or if you stick I
> can introduce a dedicated one for UDP tunnels.

I don't insist, I think it is worth clarifying though.

> >
> >
> >
> > > >
> > > > > >
> > > > > > I think this kind of things should be explicit.
> > > > > >
> > > > > >
> > > > > > > +
> > > > > > > +The following field, \field{tso_max_segs} only exists if
> > > > > > > +VIRTIO_NET_F_HOST_TSO_LIMIT is set.
> > > > > > > +It specifies the maximum number of segments that can be produced by
> > > > > > > +the device after performing segmentation on TSO packet or a UDP tunnel
> > > > > > > +TSO packet (when VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is set).
> > > > > >
> > > > > > I don't get this field at all. the assumption is that all segments
> > > > > > are the same size, right? Then it is just based on length?
> > > > >
> > > > > It's the device side limitation, for example a device can produce 100
> > > > > segments at most, even if the tso_max_size is 256K, when MTU is 1500,
> > > > > the driver can't send a TSO packet whose TCP length is greater than
> > > > > (1500 - 20 - 20) * 100 = 146K.
> > > >
> > > > then "can be produced" is again confusing. device
> > > > transmits packets but it does not "produce" them as such.
> > > > maybe you just mean "supported".
> > >
> > > I think yes.
> > >
> > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > > +
> > > > > > >  \devicenormative{\subsubsection}{Device configuration layout}{Device Types / Network Device / Device configuration layout}
> > > > > > >
> > > > > > >  The device MUST set \field{max_virtqueue_pairs} to between 1 and 0x8000 inclusive,
> > > > > > > @@ -326,6 +345,17 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
> > > > > > >  The device SHOULD NOT offer VIRTIO_NET_F_CTRL_RX_EXTRA if it
> > > > > > >  does not offer VIRTIO_NET_F_CTRL_VQ.
> > > > > > >
> > > > > > > +If VIRTIO_NET_F_HOST_TSO_LIMIT and VIRTIO_NET_F_MTU have been
> > > > > > > +negotiated, the device SHOULD set \field{tso_max_size} so that a TCP
> > > > > > > +segment that fully utilizes the configured MTU can be processed by TSO
> > > > > > > +(e.g., for IPv4 without options: at least \field{mtu} - 20; for IPv6
> > > > > > > +without extension headers: at least \field{mtu} - 40). This
> > > > > > > +recommendation does not account for IPv4 options or IPv6 extension
> > > > > > > +headers, which reduce the effective segment size.
> > > > > > > +
> > > > > > > +If VIRTIO_NET_F_HOST_TSO_LIMIT has been negotiated, the device MUST
> > > > > > > +set \field{tso_max_segs} to at least 64.
> > > > > >
> > > > > > where does this 64 come from? pls document.
> > > > >
> > > > > A simple backward compatibility which makes sure the value can make
> > > > > sure 64K TSO can be segmented with 1500 MTU.
> > > >
> > > > 2^16/64 == 1024
> > > >
> > > > not ~1500
> > >
> > > Yes, I just choose one that is sufficient.
> > >
> > > >
> > > > And we don't know MTU is 1500, either.
> > >
> > > A typical configuration but I can remove this part.
> > >
> > > Thanks
> > >
> > > >
> > > >
> > > >
> > > > --
> > > > MST
> > > >
> >
> 
> Thanks

