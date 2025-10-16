Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A2223E35F
	for <virtio-comment@lists.linux.dev>; Thu, 16 Oct 2025 05:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760594279; cv=none; b=EFtJCwDVoWoj1AmIzP+Z+16qDNjKxhS9IFXqHd6eyBykKocvzOPFZ/9omBbHqF9x+gRXWZlRxBiZBr5wdL6h6QuT+shqaM7icUKJmnnL4fHJW5uWv179fK4bZtgKJf8HICKkd1rbq/Ea0SPnn0/p0ERSpNROVfgmEV7oO5y9kW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760594279; c=relaxed/simple;
	bh=B9ajDSwx50HEKJSkqGwDcKUDbhSMpTF4M/89mlL5+Lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LU1GDFZkNW8VPoImykeLHa8vGzcucdG/0RR3G2WAhfvxVw5QE0tUPuLhAmXygCnwRVSl2dWBGh3Tz+HJDo2qZxNup7NbIpkDhHxWuYvFH6zKtCUHck7OuwvIW7Iw0fEhXByv6OqbonBzsAOeFog83jKZSX5z8SGezQe2i+3LlmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VDVL/+Z7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VDVL/+Z7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760594276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o+tCBCsDTYTtUuZXvh7F4K8zG3c7fLGzXRXR4tm9O8o=;
	b=VDVL/+Z7ZA3kSqRhXw89ILVIrtC7ksIA+BKMvwdcusX/FLUMA2iy1vWiCngMxqLSxAYslZ
	QQk79lgz53Cx/6cfqe1eA82XOMfl7+xo979YmdE5/87WGip+3ICyZvhmikC/tDXjd4LTcN
	kPnxv1afiksVD70DaFCeAQ1tWg2z/J4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-VOwyef6QM5KiCm-Iekr7AQ-1; Thu, 16 Oct 2025 01:57:55 -0400
X-MC-Unique: VOwyef6QM5KiCm-Iekr7AQ-1
X-Mimecast-MFC-AGG-ID: VOwyef6QM5KiCm-Iekr7AQ_1760594274
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32eb18b5500so619348a91.2
        for <virtio-comment@lists.linux.dev>; Wed, 15 Oct 2025 22:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760594274; x=1761199074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+tCBCsDTYTtUuZXvh7F4K8zG3c7fLGzXRXR4tm9O8o=;
        b=Y47kZiWmRzuedNPXo9AJBx+bWJdvp0qTKv/xRikAxEhle5tbii4/IN+Rko9MuZJL+x
         rKiU5d/B7UyyGPd7LMy6y6t1UKGkwCozrSudmyximZfhlpIS291r7ki63oMn9fKpBTLd
         GKkgenZtIjye89faU2/6qcAGh0aj9S3zI411CLG8s6+4h/dFCSMnV1XSN/WNJn0zlzXp
         136u9oJX6yzUPSFia93CUkY98VHlW5moDfIP1NX/PHROaihJf/TmS+OsjliG+wIATCw9
         CwNBx99GrkBEb+5vMuOJtRIdKH3dTUtapnjLhwFQDgHxn2D2/ox804/+m+rcv2kjq/jp
         emog==
X-Gm-Message-State: AOJu0YzhGxHV4JXVqq58fWVXYKuyWcUE1zWcNnkR1FTr/c5ZV5zZGsxX
	/dYtL5HpNk6yV1DKnYcNW2Kj1aXGBGH9YGlRsHOs276mrq9Uf1vSqLVmPhQ0iCq+kKOTjXTLMEE
	xWlG98RKpBTZ6t/8QEMR1W6pgtbiuZbwl9oCUjk95B4IWa+uFHiH9bX5bWg5kzDOQKZ5SxpNQKY
	lPeIAwwyQD0XjONhHHcZMaMg8x/cgFq6RwQvav7SU/umbxoP4qrmAU8d1N
X-Gm-Gg: ASbGnctWKqd0qgz662Mr8bECKulEeVKzu1Nadt3EoiXChPMm/g7ZkJMKFZOW822TyTP
	YdJ/3GdumeqSHC2/yB4tiGpR5+NvH3SN+TZR5zs+CayGZgAe6uQwSGDGbIU/QxyC0ZiRNLpaFFL
	r+2QPl6PROmJS3Q4epQPIgw3krBr3bc9e4e8DcEZ+/wu/OcVLsLbCN
X-Received: by 2002:a17:90b:3a8a:b0:33b:ba55:f5eb with SMTP id 98e67ed59e1d1-33bba55f81cmr98307a91.1.1760594273753;
        Wed, 15 Oct 2025 22:57:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTogkeVtxq+m2USmFSH23Rjdtz5E5aiILRSsGOu+yB1kxfGePSPY/AcF/K88kEVwCjYQ3v237ZdmIEVyyENcQ=
X-Received: by 2002:a17:90b:3a8a:b0:33b:ba55:f5eb with SMTP id
 98e67ed59e1d1-33bba55f81cmr98283a91.1.1760594273365; Wed, 15 Oct 2025
 22:57:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251014042243.22087-1-jasowang@redhat.com> <20251014044005-mutt-send-email-mst@kernel.org>
 <CACGkMEs7Y9DLuRp_3ex8ac3Hv5y7X5Q-PnS61DMjOVjAkvazjA@mail.gmail.com> <20251015030738-mutt-send-email-mst@kernel.org>
In-Reply-To: <20251015030738-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 16 Oct 2025 13:57:41 +0800
X-Gm-Features: AS18NWCH77xhr_pzx6xCm-vEUJFyP6ts59amfkHATqs9XEDXx-sypL4pC_6IOpQ
Message-ID: <CACGkMEvBmNZCTrn9cWD+wByjNa+q-iEUOA6PK_GmWcqTdB5YMQ@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: introduce TSO limit feature
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, lulu@redhat.com, nguyenlienviet@google.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jo7sXd9FdgqxzDQLaOERLXbD546LFtlb4GJ6-nvWNz0_1760594274
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 3:27=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> Thanks for the answers. Some more comments:
>
> On Wed, Oct 15, 2025 at 12:29:13PM +0800, Jason Wang wrote:
> > > >  device-types/net/description.tex | 46 ++++++++++++++++++++++++++++=
++++
> > > >  1 file changed, 46 insertions(+)
> > > >
> > > > diff --git a/device-types/net/description.tex b/device-types/net/de=
scription.tex
> > > > index 415c7fd..e56df75 100644
> > > > --- a/device-types/net/description.tex
> > > > +++ b/device-types/net/description.tex
> > > > @@ -146,6 +146,9 @@ \subsection{Feature bits}\label{sec:Device Type=
s / Network Device / Feature bits
> > > >   when VIRTIO_NET_F_IPSEC is negotiated. When a device offers IPsec=
 feature, it SHOULD
> > > >   also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
> > > >
> > > > +\item[VIRTIO_NET_F_HOST_TSO_LIMIT(71)] Device limits the maximum T=
CP
> > > > +  length and the number of segments when performing TCP segmentati=
on.
> > > > +
> > > >  \end{description}
> > > >
> > > >  \subsubsection{Feature bit requirements}\label{sec:Device Types / =
Network Device / Feature bits / Feature bit requirements}
> > > > @@ -184,6 +187,7 @@ \subsubsection{Feature bit requirements}\label{=
sec:Device Types / Network Device
> > > >  \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
> > > >  \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ alon=
g with VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
> > > >  \item[VIRTIO_NET_F_RSS_CONTEXT] Requires VIRTIO_NET_F_CTRL_VQ and =
VIRTIO_NET_F_RSS.
> > > > +\item[VIRTIO_NET_F_HOST_TSO_LIMIT] Requires VIRTIO_NET_F_HOST_TSO4=
 or VIRTIO_NET_F_HOST_TSO6
> > > >  \end{description}
> > > >
> > > >  \begin{note}
> > > > @@ -220,6 +224,8 @@ \subsection{Device configuration layout}\label{=
sec:Device Types / Network Device
> > > >          le16 rss_max_indirection_table_length;
> > > >          le32 supported_hash_types;
> > > >          le32 supported_tunnel_types;
> > > > +        le32 tso_max_size;
> > > > +        le32 tso_max_segs;
> > > >  };
> > > >  \end{lstlisting}
> > > >
> > > > @@ -276,6 +282,19 @@ \subsection{Device configuration layout}\label=
{sec:Device Types / Network Device
> > > >  Encapsulation types are defined in \ref{sec:Device Types / Network=
 Device / Device Operation / Processing of Incoming Packets /
> > > >  Hash calculation for incoming packets / Encapsulation types suppor=
ted/enabled for inner header hash}.
> > > >
> > > > +The following field, \field{tso_max_size} only exists if
> > > > +VIRTIO_NET_F_HOST_TSO_LIMIT is set.
> > > > +It specifies the maximum TCP length
> > >
> > > what is TCP length?
> >
> > It's defined in the rfc793:
> >
> > """
> >       The TCP Length is the TCP header length plus the data length in
> >       octets (this is not an explicitly transmitted quantity, but is
> >       computed), and it does not count the 12 octets of the pseudo
> >       header.
> > """
>
>
> But that one is 16 bit so can not exceed 65535.

I just reuse the terminology instead of defining something new. Note
that it is only used in pseudo header for csum after device has
performed TSO. The value in the pseudo header is capped by MTU/MSS.

As replied in another thread, BIG TCP requires more work or features.
Driver needs to set ip->tot_len 0 with a new gso type to let the
device know about BIG TCP packet.

>
> > >
> > > > of a TSO packet
> > >
> > > what is a TSO packet?
> >
> > Packet for device to perform TCP segmentation offload.
>
> pls define terms before use.

I may miss something but TSO has been widely used in the spec before
this feature:

"""
\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
...
\item[VIRTIO_NET_F_HOST_TSO4 (11)] Device can receive TSOv4.
...
"""

>
> > > > that the
> > > > +device can process.
> > >
> > > process in which direction? you mean device can receive?
> >
> > It works only for TX (as TSO works only for TX).
>
>
> rest of spec says "device receives from driver"  for this.
> process is ambiguous

A quick grep doesn't show me things like this, maybe you can point out
the location. Not a native speaker, but using "device receives from
driver" is indeed ambiguous for TX.

>
>
>
>
> > >
> > > > When VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is set,
> > > > +it specifies the maximum inner TCP length of a UDP tunnel TSO pack=
et
> > > > +that the device can process.
> > >
> > > Rest of spec talks of " GSO over UDP tunnels packets" is this the sam=
e?
> >
> > Not exactly the same, this is only for TSO not genreal GSO.
>
> rest of spec mostly talks of GSO. in fact virtio tso is a kind of
> accelerated gso.

This only applies for some specific software datapath like vhost-net.
But it doesn't apply to others especially the hardware device who will
do real TSO.

> either do the same or add a lot of text
> explaining tso as opposed to gso.

Is this ok to say "UDP tunnel VIRTIO_NET_HDR_GSO_TCPV4 or
VIRTIO_NET_HDR_GSO_TCPV6 packet"?

>
> > >
> > > even if it's actually unused?
> > >
> > > this, on the assumption that the length for tunnel is smaller?
> >
> > It means the device should have the same limitation for plain TSO and
> > tunnel TSO.
>
> Hmm. I have doubts how it can work given the overhead.

If a device can't afford the same limitation, it can simply not
advertise this feature. The reason I don't introduce a dedicated
limitation for tunnel is that there could be more tunnel supported in
the future, it would be a burden to have a per tunnel type limitation.

>
> > >
> > > I think this kind of things should be explicit.
> > >
> > >
> > > > +
> > > > +The following field, \field{tso_max_segs} only exists if
> > > > +VIRTIO_NET_F_HOST_TSO_LIMIT is set.
> > > > +It specifies the maximum number of segments that can be produced b=
y
> > > > +the device after performing segmentation on TSO packet or a UDP tu=
nnel
> > > > +TSO packet (when VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is set).
> > >
> > > I don't get this field at all. the assumption is that all segments
> > > are the same size, right? Then it is just based on length?
> >
> > It's the device side limitation, for example a device can produce 100
> > segments at most, even if the tso_max_size is 256K, when MTU is 1500,
> > the driver can't send a TSO packet whose TCP length is greater than
> > (1500 - 20 - 20) * 100 =3D 146K.
>
> then "can be produced" is again confusing. device
> transmits packets but it does not "produce" them as such.
> maybe you just mean "supported".

I think yes.

>
> > >
> > >
> > >
> > > > +
> > > >  \devicenormative{\subsubsection}{Device configuration layout}{Devi=
ce Types / Network Device / Device configuration layout}
> > > >
> > > >  The device MUST set \field{max_virtqueue_pairs} to between 1 and 0=
x8000 inclusive,
> > > > @@ -326,6 +345,17 @@ \subsection{Device configuration layout}\label=
{sec:Device Types / Network Device
> > > >  The device SHOULD NOT offer VIRTIO_NET_F_CTRL_RX_EXTRA if it
> > > >  does not offer VIRTIO_NET_F_CTRL_VQ.
> > > >
> > > > +If VIRTIO_NET_F_HOST_TSO_LIMIT and VIRTIO_NET_F_MTU have been
> > > > +negotiated, the device SHOULD set \field{tso_max_size} so that a T=
CP
> > > > +segment that fully utilizes the configured MTU can be processed by=
 TSO
> > > > +(e.g., for IPv4 without options: at least \field{mtu} - 20; for IP=
v6
> > > > +without extension headers: at least \field{mtu} - 40). This
> > > > +recommendation does not account for IPv4 options or IPv6 extension
> > > > +headers, which reduce the effective segment size.
> > > > +
> > > > +If VIRTIO_NET_F_HOST_TSO_LIMIT has been negotiated, the device MUS=
T
> > > > +set \field{tso_max_segs} to at least 64.
> > >
> > > where does this 64 come from? pls document.
> >
> > A simple backward compatibility which makes sure the value can make
> > sure 64K TSO can be segmented with 1500 MTU.
>
> 2^16/64 =3D=3D 1024
>
> not ~1500

Yes, I just choose one that is sufficient.

>
> And we don't know MTU is 1500, either.

A typical configuration but I can remove this part.

Thanks

>
>
>
> --
> MST
>

