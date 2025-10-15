Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6474525C711
	for <virtio-comment@lists.linux.dev>; Wed, 15 Oct 2025 07:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760513248; cv=none; b=pqtUDAS29SbfBhW6IvprPChtVTV1XXKe/aQuuwADNHhE2YNqS2ms3yNJoF/IYSIwNGrTBKZRhVDPLiuBOs+XkXx49PBDZ1vR8ivbHmOIax0j3Gocyv7SRrYIaDAOTImI9NIJbIgdBTZWJjb/6DLqSUOakCqsxa3iburTz95JGKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760513248; c=relaxed/simple;
	bh=a+UzW1qAUDDTVhJI5oYlw5QPNFpUGA64L7pNqsmdAM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=k6kwAaI2iF5qpMy6rrDFiZgd27pf05tTJZD2kWm+Zru60RmwbQ7NNrk7uWVApOqxKVKW08bnZb2T47q/+40pKdFH/OmkyV/GFg5mOzkGH0z4c78cOU9oINbsFCjRmQIEONuzAkKtdjBcNwFl54o3lvmH7EIS3KQOTmtZpPZwZGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h9vHTfyH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h9vHTfyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760513245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YuFXQ5v+a+li+WVDkcORW5NQQsygyzsRJispFmblPUo=;
	b=h9vHTfyHTkZAbnDANbBGMtbciJzVTjy700ZOY6zupzx/rNIbuIjl0mFCvgA+zn0sR4+sdd
	Hg6v50t6wxpbj8e8RBCgWmU2Nl0wHSobBcecFJtfcWN0629co5pgS7ZOPzLvAdH5Q00rbC
	q1Lv8tt0RASF69c6I1QNCPCUv9lqwXM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-A6Avpp2RNWiPk3wS-vhhXg-1; Wed, 15 Oct 2025 03:27:23 -0400
X-MC-Unique: A6Avpp2RNWiPk3wS-vhhXg-1
X-Mimecast-MFC-AGG-ID: A6Avpp2RNWiPk3wS-vhhXg_1760513242
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46fa88b5760so19723375e9.3
        for <virtio-comment@lists.linux.dev>; Wed, 15 Oct 2025 00:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760513242; x=1761118042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuFXQ5v+a+li+WVDkcORW5NQQsygyzsRJispFmblPUo=;
        b=Di7GVytTBAQw7iahLiwLGoQeH7z7jtWkDJG6Tx4U8BhGgSl1NexcND1mlCVUqsSn7P
         0zIn1uf1eGevmaZ6EPAR4kTU66T5KOOntFB/HBT8zxAeF46bRW7nIMVCbpTg22qFmUwv
         Ximi5up0zMH249Rwbfu6gmLV/mNAcWISqDQUOu5JW8n7oPiRTSMmBBbE9XfVMM2NRTy1
         0Ou/j7iqLGHvkN2BMFOumKwJ26+h9sovZIN5xQKMux+g5UBxjbuqTyoMcCSqokM//jzu
         vEO/x+z2Lienasv4Ipdc3IA0JQlk7xWRNFrMviUJ1zji/NZhr6IhX6S73c2yji1twVpf
         h2mA==
X-Gm-Message-State: AOJu0Yy4Q9YV2nmH9eon7o0c+d4VFj5aizV78bP6nh/ixk5sV6TrCkDB
	qbRmda1xrjoEqWMLQ+tTc2Ycuvv78LdJH76a8N4Iyp8hbVt6/JSN4GDUoxPHd3dCe/CAk41Uglb
	95BWVkaLUetDtdQeixYB4tEs0yp3vfgh9rFPmz2To1++HMRqmLndp/4D8Ozh+JJ8UH5Yt
X-Gm-Gg: ASbGncuZ7OJ81WsUY0Tt6cEW8gSKN7+GIIMczQWvIXshG8UD77PTv87Su085dYA4nN1
	QWxRQZYKvZoUz1X5jckw9pLU7UTrTFF8Cnfc0Blogl9TmQoFuvc7Yzda40JHyM7VYNAzAkZ51Go
	+m5p22mqCP/RsABDE09OrG+K3lzaLOMLSkoUry7ggpCApYeHVQtcNr+hSS01mFgL8/OCkidDvVE
	2aFGu9gpZF0wYw19Dn+LnBcLIO/mcwNPodtRCyCb6h2u2K79fB6r9TfSvoyVn0kbvIYZeUDHDwt
	loc2OBV9BSUIGvYXA+y6cgrFpLAXBWmyow==
X-Received: by 2002:a05:600d:14:b0:46e:74cc:42b8 with SMTP id 5b1f17b1804b1-46fa9af831cmr144351935e9.17.1760513242158;
        Wed, 15 Oct 2025 00:27:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFBI21nsZrwOF6L4pnnO7A8orRSJ8Vp2BnL+oiv5FjQt1nnPtA/+yBM6BroZou6dUf5g63sQ==
X-Received: by 2002:a05:600d:14:b0:46e:74cc:42b8 with SMTP id 5b1f17b1804b1-46fa9af831cmr144351765e9.17.1760513241685;
        Wed, 15 Oct 2025 00:27:21 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb489194dsm279465315e9.12.2025.10.15.00.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 00:27:21 -0700 (PDT)
Date: Wed, 15 Oct 2025 03:27:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, lulu@redhat.com,
	nguyenlienviet@google.com
Subject: Re: [PATCH] virtio-net: introduce TSO limit feature
Message-ID: <20251015030738-mutt-send-email-mst@kernel.org>
References: <20251014042243.22087-1-jasowang@redhat.com>
 <20251014044005-mutt-send-email-mst@kernel.org>
 <CACGkMEs7Y9DLuRp_3ex8ac3Hv5y7X5Q-PnS61DMjOVjAkvazjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEs7Y9DLuRp_3ex8ac3Hv5y7X5Q-PnS61DMjOVjAkvazjA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SLr07IuRO5MGT-ajNYBhe20tOerlKZE8tczrQ_sNpjM_1760513242
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks for the answers. Some more comments:

On Wed, Oct 15, 2025 at 12:29:13PM +0800, Jason Wang wrote:
> > >  device-types/net/description.tex | 46 ++++++++++++++++++++++++++++++++
> > >  1 file changed, 46 insertions(+)
> > >
> > > diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> > > index 415c7fd..e56df75 100644
> > > --- a/device-types/net/description.tex
> > > +++ b/device-types/net/description.tex
> > > @@ -146,6 +146,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
> > >   when VIRTIO_NET_F_IPSEC is negotiated. When a device offers IPsec feature, it SHOULD
> > >   also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
> > >
> > > +\item[VIRTIO_NET_F_HOST_TSO_LIMIT(71)] Device limits the maximum TCP
> > > +  length and the number of segments when performing TCP segmentation.
> > > +
> > >  \end{description}
> > >
> > >  \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
> > > @@ -184,6 +187,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
> > >  \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
> > >  \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ along with VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
> > >  \item[VIRTIO_NET_F_RSS_CONTEXT] Requires VIRTIO_NET_F_CTRL_VQ and VIRTIO_NET_F_RSS.
> > > +\item[VIRTIO_NET_F_HOST_TSO_LIMIT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6
> > >  \end{description}
> > >
> > >  \begin{note}
> > > @@ -220,6 +224,8 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
> > >          le16 rss_max_indirection_table_length;
> > >          le32 supported_hash_types;
> > >          le32 supported_tunnel_types;
> > > +        le32 tso_max_size;
> > > +        le32 tso_max_segs;
> > >  };
> > >  \end{lstlisting}
> > >
> > > @@ -276,6 +282,19 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
> > >  Encapsulation types are defined in \ref{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets /
> > >  Hash calculation for incoming packets / Encapsulation types supported/enabled for inner header hash}.
> > >
> > > +The following field, \field{tso_max_size} only exists if
> > > +VIRTIO_NET_F_HOST_TSO_LIMIT is set.
> > > +It specifies the maximum TCP length
> >
> > what is TCP length?
> 
> It's defined in the rfc793:
> 
> """
>       The TCP Length is the TCP header length plus the data length in
>       octets (this is not an explicitly transmitted quantity, but is
>       computed), and it does not count the 12 octets of the pseudo
>       header.
> """


But that one is 16 bit so can not exceed 65535.

> >
> > > of a TSO packet
> >
> > what is a TSO packet?
> 
> Packet for device to perform TCP segmentation offload.

pls define terms before use.

> > > that the
> > > +device can process.
> >
> > process in which direction? you mean device can receive?
> 
> It works only for TX (as TSO works only for TX).


rest of spec says "device receives from driver"  for this.
process is ambiguous




> >
> > > When VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is set,
> > > +it specifies the maximum inner TCP length of a UDP tunnel TSO packet
> > > +that the device can process.
> >
> > Rest of spec talks of " GSO over UDP tunnels packets" is this the same?
> 
> Not exactly the same, this is only for TSO not genreal GSO.

rest of spec mostly talks of GSO. in fact virtio tso is a kind of
accelerated gso.  either do the same or add a lot of text
explaining tso as opposed to gso.

> >
> > even if it's actually unused?
> >
> > this, on the assumption that the length for tunnel is smaller?
> 
> It means the device should have the same limitation for plain TSO and
> tunnel TSO.

Hmm. I have doubts how it can work given the overhead.

> >
> > I think this kind of things should be explicit.
> >
> >
> > > +
> > > +The following field, \field{tso_max_segs} only exists if
> > > +VIRTIO_NET_F_HOST_TSO_LIMIT is set.
> > > +It specifies the maximum number of segments that can be produced by
> > > +the device after performing segmentation on TSO packet or a UDP tunnel
> > > +TSO packet (when VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is set).
> >
> > I don't get this field at all. the assumption is that all segments
> > are the same size, right? Then it is just based on length?
> 
> It's the device side limitation, for example a device can produce 100
> segments at most, even if the tso_max_size is 256K, when MTU is 1500,
> the driver can't send a TSO packet whose TCP length is greater than
> (1500 - 20 - 20) * 100 = 146K.

then "can be produced" is again confusing. device
transmits packets but it does not "produce" them as such.
maybe you just mean "supported".

> >
> >
> >
> > > +
> > >  \devicenormative{\subsubsection}{Device configuration layout}{Device Types / Network Device / Device configuration layout}
> > >
> > >  The device MUST set \field{max_virtqueue_pairs} to between 1 and 0x8000 inclusive,
> > > @@ -326,6 +345,17 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
> > >  The device SHOULD NOT offer VIRTIO_NET_F_CTRL_RX_EXTRA if it
> > >  does not offer VIRTIO_NET_F_CTRL_VQ.
> > >
> > > +If VIRTIO_NET_F_HOST_TSO_LIMIT and VIRTIO_NET_F_MTU have been
> > > +negotiated, the device SHOULD set \field{tso_max_size} so that a TCP
> > > +segment that fully utilizes the configured MTU can be processed by TSO
> > > +(e.g., for IPv4 without options: at least \field{mtu} - 20; for IPv6
> > > +without extension headers: at least \field{mtu} - 40). This
> > > +recommendation does not account for IPv4 options or IPv6 extension
> > > +headers, which reduce the effective segment size.
> > > +
> > > +If VIRTIO_NET_F_HOST_TSO_LIMIT has been negotiated, the device MUST
> > > +set \field{tso_max_segs} to at least 64.
> >
> > where does this 64 come from? pls document.
> 
> A simple backward compatibility which makes sure the value can make
> sure 64K TSO can be segmented with 1500 MTU.

2^16/64 == 1024  

not ~1500

And we don't know MTU is 1500, either.



-- 
MST

