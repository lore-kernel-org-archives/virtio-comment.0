Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ED9289358
	for <virtio-comment@lists.linux.dev>; Thu, 16 Oct 2025 06:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760595437; cv=none; b=MzvWkMP+NiglPHhOzv7n+q9602E1GaKcLucbCZ1Mz+fZzZsBtg2RZCkZIhoLB79yD7Ii6Zht6rhFAGlJJX68fSwUP0C5pGoElOgTjO4TE4brQytcVZ/iBAxDM3l053dozH+SKZNIwGGZHYRyMtsRpvoZVwgpG/v1xFYfhT6zL80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760595437; c=relaxed/simple;
	bh=HtOVwvWdORJyIzV9ACRLyofmGSuaqw7kbCdDf/kkbY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=CGlkwJCs0gl1o0sTHgjtp2fa2XI2hL3ICQ9HE48pkA7jSyR3xv3dMdj6XimlG2qkz7vv/MT8EqOQOGyyEaEuHwubQ+Rwr8Uz2riIBE9wJKMDgJX+hq4amNtPS9FH3sQR9zEa2SgwQgrotFDh2GF96jEMdV8KC//ExxaFMNnpg1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IqZJhLGw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IqZJhLGw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760595432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RdDMRrWw5wQG1IvLC6ZTLQDrXAT6gzg+4GCI6SfL6wI=;
	b=IqZJhLGwfJ+MMOUGJKIcVXcQQOzN3sEFHFHZ0f7TNXx0sQqttGegeV3L2l2BWpPQJOR2A7
	30XkxgKkb2w1BlxbJxw5ulkNcwDvE936vzlV+6BZh2DWELYVRYlDNDMuqrxCLW2pBh5DIq
	w9+1CG9C5YTY/qF0KC7B8d5udP0D4Uo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-SGCrD-LDP3iJWMWEHb-yNQ-1; Thu, 16 Oct 2025 02:17:10 -0400
X-MC-Unique: SGCrD-LDP3iJWMWEHb-yNQ-1
X-Mimecast-MFC-AGG-ID: SGCrD-LDP3iJWMWEHb-yNQ_1760595430
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46b303f6c9cso3306555e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 15 Oct 2025 23:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760595429; x=1761200229;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RdDMRrWw5wQG1IvLC6ZTLQDrXAT6gzg+4GCI6SfL6wI=;
        b=NfDdnRv0UA8NYF8PQDh87TpScux8mxERJ29fdgKeh5aTFfbP1G0S7UvJvM+0Q8fzF+
         bc4KVxIPI5boSeYw2I41nDB7UrMY0Ug5Vr255roMyPuq18HBRW45Jxg0wPQSwiOxP4wT
         Kt6cDJPjZkRsaHNLafF6IFuK2LQiw5XgFu5ZIlQS9GmYuPDGF90/F0MZ+JbUGlkw3hgk
         plE1y0w5vFY64/mBQ/6CX12K+7Yjt+J5ekFlLpF74fR8vv62jauTcyYqWzC7DQqMkxuQ
         PHQQX6UOq+xDNpdC1tH3Cvv+SB2n7EkxCU6vOzbSDexGGAB7ZNOFRx7PSv7S2bgl0sgI
         pEHg==
X-Gm-Message-State: AOJu0YwTDuhhGnGA4BNoPMEnILXJhL+k/zS0kcLGaeF/ntnI0Rm6v4HE
	qay7snc4QsWi8y8ftgBGu30P0E3WDLPiw0MKzX7+V3U53hcyjSVEwstcTGLgb1bF9VTqgCde6Xz
	DRuP36xSvu5hN8JLWDZEeb3ss1U96eKDtztHqsV6p2IzmtOQgcTW346Wimeh0NAy6DWqH
X-Gm-Gg: ASbGnctb+9JzB5p/6njFZGf+JAXDMnzsDmUEZc565gwuhEff4ul5QAQhg9dHaP/ngWO
	SsoEnHOqU96iwZimsOmK5RzWhjW3DZBleT7S+E4JuXz9azI50O6etIGk5SJaj5kJoZSBff7vwyv
	GvuMgn8ySrmdxibhX1rCnChRAy6Cs9Ix6H0pKjYS3iv7UfLvpTJI7caoQS93W1heAhRw0QlvT1B
	DsRS0V607Hi/Nm0TlMXMHKtUbzhhYUPcHD8BQg4lHmUIHv6gC/bVMH67Rz13nL4hhZpWEtB5eHK
	YBkUAokcVg/HgZMJkCkRM80DOE3lYRD6b8a/uzZ8v+NJbOIrZkY2skdinXhGOP2DD1PU
X-Received: by 2002:a05:600c:3b04:b0:471:14e7:e988 with SMTP id 5b1f17b1804b1-47114e7e9f5mr462905e9.35.1760595429400;
        Wed, 15 Oct 2025 23:17:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUNev0zyCfVfokwYbTNnNhyGWZCMG040gdQxVerJmDe+JsSf0t3N/g9+9nrtQntnoZdYjVig==
X-Received: by 2002:a05:600c:3b04:b0:471:14e7:e988 with SMTP id 5b1f17b1804b1-47114e7e9f5mr462545e9.35.1760595428652;
        Wed, 15 Oct 2025 23:17:08 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426fc54b32dsm2945518f8f.30.2025.10.15.23.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 23:17:08 -0700 (PDT)
Date: Thu, 16 Oct 2025 02:17:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, lulu@redhat.com,
	nguyenlienviet@google.com
Subject: Re: [PATCH] virtio-net: introduce TSO limit feature
Message-ID: <20251016020113-mutt-send-email-mst@kernel.org>
References: <20251014042243.22087-1-jasowang@redhat.com>
 <20251014044005-mutt-send-email-mst@kernel.org>
 <CACGkMEs7Y9DLuRp_3ex8ac3Hv5y7X5Q-PnS61DMjOVjAkvazjA@mail.gmail.com>
 <20251015030738-mutt-send-email-mst@kernel.org>
 <CACGkMEvBmNZCTrn9cWD+wByjNa+q-iEUOA6PK_GmWcqTdB5YMQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEvBmNZCTrn9cWD+wByjNa+q-iEUOA6PK_GmWcqTdB5YMQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XUnJzkz0BlD75D4KoIxDGqnxUvTpOcSFxW16iu6vplk_1760595430
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Oct 16, 2025 at 01:57:41PM +0800, Jason Wang wrote:
> On Wed, Oct 15, 2025 at 3:27 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > Thanks for the answers. Some more comments:
> >
> > On Wed, Oct 15, 2025 at 12:29:13PM +0800, Jason Wang wrote:
> > > > >  device-types/net/description.tex | 46 ++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 46 insertions(+)
> > > > >
> > > > > diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> > > > > index 415c7fd..e56df75 100644
> > > > > --- a/device-types/net/description.tex
> > > > > +++ b/device-types/net/description.tex
> > > > > @@ -146,6 +146,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
> > > > >   when VIRTIO_NET_F_IPSEC is negotiated. When a device offers IPsec feature, it SHOULD
> > > > >   also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
> > > > >
> > > > > +\item[VIRTIO_NET_F_HOST_TSO_LIMIT(71)] Device limits the maximum TCP
> > > > > +  length and the number of segments when performing TCP segmentation.
> > > > > +
> > > > >  \end{description}
> > > > >
> > > > >  \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
> > > > > @@ -184,6 +187,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
> > > > >  \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
> > > > >  \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ along with VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
> > > > >  \item[VIRTIO_NET_F_RSS_CONTEXT] Requires VIRTIO_NET_F_CTRL_VQ and VIRTIO_NET_F_RSS.
> > > > > +\item[VIRTIO_NET_F_HOST_TSO_LIMIT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6
> > > > >  \end{description}
> > > > >
> > > > >  \begin{note}
> > > > > @@ -220,6 +224,8 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
> > > > >          le16 rss_max_indirection_table_length;
> > > > >          le32 supported_hash_types;
> > > > >          le32 supported_tunnel_types;
> > > > > +        le32 tso_max_size;
> > > > > +        le32 tso_max_segs;
> > > > >  };
> > > > >  \end{lstlisting}
> > > > >
> > > > > @@ -276,6 +282,19 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
> > > > >  Encapsulation types are defined in \ref{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets /
> > > > >  Hash calculation for incoming packets / Encapsulation types supported/enabled for inner header hash}.
> > > > >
> > > > > +The following field, \field{tso_max_size} only exists if
> > > > > +VIRTIO_NET_F_HOST_TSO_LIMIT is set.
> > > > > +It specifies the maximum TCP length
> > > >
> > > > what is TCP length?
> > >
> > > It's defined in the rfc793:
> > >
> > > """
> > >       The TCP Length is the TCP header length plus the data length in
> > >       octets (this is not an explicitly transmitted quantity, but is
> > >       computed), and it does not count the 12 octets of the pseudo
> > >       header.
> > > """
> >
> >
> > But that one is 16 bit so can not exceed 65535.
> 
> I just reuse the terminology instead of defining something new.

Let's use a generic term that will work with big tcp.

> Note
> that it is only used in pseudo header for csum after device has
> performed TSO. The value in the pseudo header is capped by MTU/MSS.
> 
> As replied in another thread, BIG TCP requires more work or features.
> Driver needs to set ip->tot_len 0 with a new gso type to let the
> device know about BIG TCP packet.
> 
> >
> > > >
> > > > > of a TSO packet
> > > >
> > > > what is a TSO packet?
> > >
> > > Packet for device to perform TCP segmentation offload.
> >
> > pls define terms before use.
> 
> I may miss something but TSO has been widely used in the spec before
> this feature:
> 
> """
> \item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
> ...
> \item[VIRTIO_NET_F_HOST_TSO4 (11)] Device can receive TSOv4.
> ...
> """


Yes but that does not define a "TSO packet".


> >
> > > > > that the
> > > > > +device can process.
> > > >
> > > > process in which direction? you mean device can receive?
> > >
> > > It works only for TX (as TSO works only for TX).
> >
> >
> > rest of spec says "device receives from driver"  for this.
> > process is ambiguous
> 
> A quick grep doesn't show me things like this, maybe you can point out
> the location. Not a native speaker, but using "device receives from
> driver" is indeed ambiguous for TX.

Well right near the text you quoted:

\item[VIRTIO_NET_F_HOST_TSO4 (11)] Device can receive TSOv4.

\item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.




> >
> >
> >
> >
> > > >
> > > > > When VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is set,
> > > > > +it specifies the maximum inner TCP length of a UDP tunnel TSO packet
> > > > > +that the device can process.
> > > >
> > > > Rest of spec talks of " GSO over UDP tunnels packets" is this the same?
> > >
> > > Not exactly the same, this is only for TSO not genreal GSO.
> >
> > rest of spec mostly talks of GSO. in fact virtio tso is a kind of
> > accelerated gso.
> 
> This only applies for some specific software datapath like vhost-net.
> But it doesn't apply to others especially the hardware device who will
> do real TSO.

My point is that once you have said both GSO and TSO in the same
sentence, any reader's eyes have glazed over.




> > either do the same or add a lot of text
> > explaining tso as opposed to gso.
> 
> Is this ok to say "UDP tunnel VIRTIO_NET_HDR_GSO_TCPV4 or
> VIRTIO_NET_HDR_GSO_TCPV6 packet"?

Do you maybe mean: \field{gso_type} set to VIRTIO_NET_HDR_GSO_TCPV4
or VIRTIO_NET_HDR_GSO_TCPV6 



> >
> > > >
> > > > even if it's actually unused?
> > > >
> > > > this, on the assumption that the length for tunnel is smaller?
> > >
> > > It means the device should have the same limitation for plain TSO and
> > > tunnel TSO.
> >
> > Hmm. I have doubts how it can work given the overhead.
> 
> If a device can't afford the same limitation, it can simply not
> advertise this feature. The reason I don't introduce a dedicated
> limitation for tunnel is that there could be more tunnel supported in
> the future, it would be a burden to have a per tunnel type limitation.

Well presumably the feature is needed no?



> >
> > > >
> > > > I think this kind of things should be explicit.
> > > >
> > > >
> > > > > +
> > > > > +The following field, \field{tso_max_segs} only exists if
> > > > > +VIRTIO_NET_F_HOST_TSO_LIMIT is set.
> > > > > +It specifies the maximum number of segments that can be produced by
> > > > > +the device after performing segmentation on TSO packet or a UDP tunnel
> > > > > +TSO packet (when VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is set).
> > > >
> > > > I don't get this field at all. the assumption is that all segments
> > > > are the same size, right? Then it is just based on length?
> > >
> > > It's the device side limitation, for example a device can produce 100
> > > segments at most, even if the tso_max_size is 256K, when MTU is 1500,
> > > the driver can't send a TSO packet whose TCP length is greater than
> > > (1500 - 20 - 20) * 100 = 146K.
> >
> > then "can be produced" is again confusing. device
> > transmits packets but it does not "produce" them as such.
> > maybe you just mean "supported".
> 
> I think yes.
> 
> >
> > > >
> > > >
> > > >
> > > > > +
> > > > >  \devicenormative{\subsubsection}{Device configuration layout}{Device Types / Network Device / Device configuration layout}
> > > > >
> > > > >  The device MUST set \field{max_virtqueue_pairs} to between 1 and 0x8000 inclusive,
> > > > > @@ -326,6 +345,17 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
> > > > >  The device SHOULD NOT offer VIRTIO_NET_F_CTRL_RX_EXTRA if it
> > > > >  does not offer VIRTIO_NET_F_CTRL_VQ.
> > > > >
> > > > > +If VIRTIO_NET_F_HOST_TSO_LIMIT and VIRTIO_NET_F_MTU have been
> > > > > +negotiated, the device SHOULD set \field{tso_max_size} so that a TCP
> > > > > +segment that fully utilizes the configured MTU can be processed by TSO
> > > > > +(e.g., for IPv4 without options: at least \field{mtu} - 20; for IPv6
> > > > > +without extension headers: at least \field{mtu} - 40). This
> > > > > +recommendation does not account for IPv4 options or IPv6 extension
> > > > > +headers, which reduce the effective segment size.
> > > > > +
> > > > > +If VIRTIO_NET_F_HOST_TSO_LIMIT has been negotiated, the device MUST
> > > > > +set \field{tso_max_segs} to at least 64.
> > > >
> > > > where does this 64 come from? pls document.
> > >
> > > A simple backward compatibility which makes sure the value can make
> > > sure 64K TSO can be segmented with 1500 MTU.
> >
> > 2^16/64 == 1024
> >
> > not ~1500
> 
> Yes, I just choose one that is sufficient.
> 
> >
> > And we don't know MTU is 1500, either.
> 
> A typical configuration but I can remove this part.
> 
> Thanks
> 
> >
> >
> >
> > --
> > MST
> >

