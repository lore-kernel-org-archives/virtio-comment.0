Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A732F4A00
	for <virtio-comment@lists.linux.dev>; Wed, 15 Oct 2025 04:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760502571; cv=none; b=eh0YZwHeAjL7kT6dofFPEh8FFtyLxXf6P8lQM3jMixXDhEgEzIYvUAqQlyZbJwAemAA/IZrxdQKy7bpExCrAgepsaGF7WRarWbr/IZF9D1Pinv0xyHY2KuIY8XhStn/9zwzaY6K2G1wl4UD1O6hQDjyiILOS8cCnrDA423oQImQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760502571; c=relaxed/simple;
	bh=MKnNu/38g/IoXSGhylkr3GDBXdqkp3+ZZk6rdse/AzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNxPQkqtwGD/HGKu6cICVG9EtbXTx/mJOJ0qEp2zuC7u7dAMr1xA0ohAJYWECtVeplfOvzfrb5/OhqhJDqhaTm0dSkBUiaXopitfR3WeKnUxhlP3jzu7DqS6lIWwQTxnNG4I5iR6Etw8Vi66jLhDRMfr+asb9ieH4/TrG1MRhsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X492G5N8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X492G5N8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760502568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ovrdqD4RP2OHpYXxXOWKTnrrNPvxmWVVx31OzTbJVA=;
	b=X492G5N81q31BSiPx05wCl2gRkl0SqkJcLGVEl+QvOJ/8xDPFgbh8h6O4hXdWk2gktT0ia
	A1A5ffnnwOT899eZDVvDEz8vFTjwz9Lohz96DlbZdhLp4Oif+lHuQ7HESvGwLaE6HIykLs
	diOsRpd7X5Q91t7Bfnbr7gkuhMvXXrc=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-aEbqyMSyM2yqepcKo0bn_w-1; Wed, 15 Oct 2025 00:29:27 -0400
X-MC-Unique: aEbqyMSyM2yqepcKo0bn_w-1
X-Mimecast-MFC-AGG-ID: aEbqyMSyM2yqepcKo0bn_w_1760502566
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33428befd39so23240435a91.0
        for <virtio-comment@lists.linux.dev>; Tue, 14 Oct 2025 21:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760502566; x=1761107366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ovrdqD4RP2OHpYXxXOWKTnrrNPvxmWVVx31OzTbJVA=;
        b=O4UZCvqyjMFSUOfT9ztDv8lF/WVHiz/KnslYb4RONSGW0xq/KUmcU5OXyo7aRiAePU
         udu8MER+sIHc+GZWQSJ6ikKD9rEU3cu6ookScDdKvX0eLkc7DAoyoUHx8zWlEXiC6hqb
         aNUhOMHnCbcPHXyzScoIZ4m1tXTgANz4vG5XFaW+nDNBMY4CRBsMJnrjDauPbHmKu36c
         fqn90A4prlHI9lvx9iqzg1aaRZndn8/YRlXFYKqKSg+gKASiCT4SjxotS9HC0Srxy2HG
         t+vJX3M3kz+6zTMUv+C7jl8IaTewOUkPvc8Lv+TTflnqyG+eFixOpWfvKEHLKqoj0JU/
         wXEA==
X-Gm-Message-State: AOJu0Yx9Fb/uNiiYbn7HxB1CrcIg/Z8aFheEGx/WhkkYyX1imm/cjYmk
	NujoImQ641JB3vQ7iKZz86z0XTqpeWxPUhp8S/nnlAyPd5467h2+2hhzIGwq3XDO9Ow6m3tb0Hk
	qvCc/bZTFZlL2XrmeqbtW6vo15dAEu1pU6470E5/hM2/SyMChrxxEGoStUobnNUO7JmCfZWwrxD
	OVepM7yjE/X4qn9f+4nB2FGMINVbaDdK0+v6i2NSY4bWU=
X-Gm-Gg: ASbGncuk4WcXRyF3PWElWnRKD2CuZPhTIviCuB5gms4cFRY1peAWkYwJRU9TKHDCXmO
	+bzHbdKMveHHt5VuHhXPJKVjo2/gWnba9fQ8w7rRg7yW4yWnPQWK3hD9jD2t6aeZVorSpNXAWrz
	l71VC9kQmMXE4ZIjw42FpRCw==
X-Received: by 2002:a17:90b:1b07:b0:338:3cea:608e with SMTP id 98e67ed59e1d1-33b5138f734mr34750735a91.31.1760502565802;
        Tue, 14 Oct 2025 21:29:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGxo0cZztL0Xz7KBecOxXFxgxvzckZF4Y7Cw3dBBMID4sCoaXtw2ZaCdUHGoae4InCAtaAml+pOKhylSO7y7U=
X-Received: by 2002:a17:90b:1b07:b0:338:3cea:608e with SMTP id
 98e67ed59e1d1-33b5138f734mr34750698a91.31.1760502565332; Tue, 14 Oct 2025
 21:29:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251014042243.22087-1-jasowang@redhat.com> <20251014044005-mutt-send-email-mst@kernel.org>
In-Reply-To: <20251014044005-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 15 Oct 2025 12:29:13 +0800
X-Gm-Features: AS18NWB1u0-HEQGoTJuzepZrinqWkiybgr06pWDCpqsYN_8mY7XtCmr816v0trs
Message-ID: <CACGkMEs7Y9DLuRp_3ex8ac3Hv5y7X5Q-PnS61DMjOVjAkvazjA@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: introduce TSO limit feature
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, lulu@redhat.com, nguyenlienviet@google.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3Qlyu4eoHNlELPUhAP02E2qh4Plz0pBKBwzn_w9mlw8_1760502566
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 4:59=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> thanks for the patch! yet something to improve.
> I note issues only when encountered 1st time but please
> do go and check all patch for each issue.
>
>
> On Tue, Oct 14, 2025 at 12:22:43PM +0800, Jason Wang wrote:
> > This patch introduces TSO limit feature which allows the device to
> > advertise:
> >
> > - Maximum TCP length of a TSO packet or inner TSO packet when UDP
> >   tunnel is support
> > - Maximum number of segment that can be produced by the device after
> >   segmentation of TSO or inner TSO packet of a UDP tunnel
> >
> > This is a must to implement TCP jumbogram, as networking stack needs
> > to know the limitation of the device in order to produce TSO packet as
> > large as possible.
>
> I am not sure I understand the use-case. So how is it used,
> exactly?

It works like a device advertising the TSO limit so the kernel stack
can try to send a TSO packet up to that limit to the device to perform
TCP segmentation offload. E.g without this device information
networking stack can only send a size at most 64K packet to the
device.

>
> Why is TSO singled out as compared to USO?

AFAIK no support for big USO in Linux.

>
> >
> > And it would also help for the case where host has a different TSO
> > limitation than the assumption (for example, Linux assumes 64K to be
> > the maximum number of segs and payload length).
>
> how does it assume it? 64K segments?

Yes.

>
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
>
>
>
>
> > ---
> >  device-types/net/description.tex | 46 ++++++++++++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >
> > diff --git a/device-types/net/description.tex b/device-types/net/descri=
ption.tex
> > index 415c7fd..e56df75 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -146,6 +146,9 @@ \subsection{Feature bits}\label{sec:Device Types / =
Network Device / Feature bits
> >   when VIRTIO_NET_F_IPSEC is negotiated. When a device offers IPsec fea=
ture, it SHOULD
> >   also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
> >
> > +\item[VIRTIO_NET_F_HOST_TSO_LIMIT(71)] Device limits the maximum TCP
> > +  length and the number of segments when performing TCP segmentation.
> > +
> >  \end{description}
> >
> >  \subsubsection{Feature bit requirements}\label{sec:Device Types / Netw=
ork Device / Feature bits / Feature bit requirements}
> > @@ -184,6 +187,7 @@ \subsubsection{Feature bit requirements}\label{sec:=
Device Types / Network Device
> >  \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
> >  \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ along wi=
th VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
> >  \item[VIRTIO_NET_F_RSS_CONTEXT] Requires VIRTIO_NET_F_CTRL_VQ and VIRT=
IO_NET_F_RSS.
> > +\item[VIRTIO_NET_F_HOST_TSO_LIMIT] Requires VIRTIO_NET_F_HOST_TSO4 or =
VIRTIO_NET_F_HOST_TSO6
> >  \end{description}
> >
> >  \begin{note}
> > @@ -220,6 +224,8 @@ \subsection{Device configuration layout}\label{sec:=
Device Types / Network Device
> >          le16 rss_max_indirection_table_length;
> >          le32 supported_hash_types;
> >          le32 supported_tunnel_types;
> > +        le32 tso_max_size;
> > +        le32 tso_max_segs;
> >  };
> >  \end{lstlisting}
> >
> > @@ -276,6 +282,19 @@ \subsection{Device configuration layout}\label{sec=
:Device Types / Network Device
> >  Encapsulation types are defined in \ref{sec:Device Types / Network Dev=
ice / Device Operation / Processing of Incoming Packets /
> >  Hash calculation for incoming packets / Encapsulation types supported/=
enabled for inner header hash}.
> >
> > +The following field, \field{tso_max_size} only exists if
> > +VIRTIO_NET_F_HOST_TSO_LIMIT is set.
> > +It specifies the maximum TCP length
>
> what is TCP length?

It's defined in the rfc793:

"""
      The TCP Length is the TCP header length plus the data length in
      octets (this is not an explicitly transmitted quantity, but is
      computed), and it does not count the 12 octets of the pseudo
      header.
"""

>
> > of a TSO packet
>
> what is a TSO packet?

Packet for device to perform TCP segmentation offload.

> is length likely to be same for TCP6 and TCP4?

Technically we can have different limitations for ipv4 and ipv6. But
considering we are designing a fresh new feature, it would be better
to use the same limitation for simplicity.

>
> > that the
> > +device can process.
>
> process in which direction? you mean device can receive?

It works only for TX (as TSO works only for TX).

>
> > When VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is set,
> > +it specifies the maximum inner TCP length of a UDP tunnel TSO packet
> > +that the device can process.
>
> Rest of spec talks of " GSO over UDP tunnels packets" is this the same?

Not exactly the same, this is only for TSO not genreal GSO.

>
> even if it's actually unused?
>
> this, on the assumption that the length for tunnel is smaller?

It means the device should have the same limitation for plain TSO and
tunnel TSO.

>
> I think this kind of things should be explicit.
>
>
> > +
> > +The following field, \field{tso_max_segs} only exists if
> > +VIRTIO_NET_F_HOST_TSO_LIMIT is set.
> > +It specifies the maximum number of segments that can be produced by
> > +the device after performing segmentation on TSO packet or a UDP tunnel
> > +TSO packet (when VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is set).
>
> I don't get this field at all. the assumption is that all segments
> are the same size, right? Then it is just based on length?

It's the device side limitation, for example a device can produce 100
segments at most, even if the tso_max_size is 256K, when MTU is 1500,
the driver can't send a TSO packet whose TCP length is greater than
(1500 - 20 - 20) * 100 =3D 146K.

>
>
>
> > +
> >  \devicenormative{\subsubsection}{Device configuration layout}{Device T=
ypes / Network Device / Device configuration layout}
> >
> >  The device MUST set \field{max_virtqueue_pairs} to between 1 and 0x800=
0 inclusive,
> > @@ -326,6 +345,17 @@ \subsection{Device configuration layout}\label{sec=
:Device Types / Network Device
> >  The device SHOULD NOT offer VIRTIO_NET_F_CTRL_RX_EXTRA if it
> >  does not offer VIRTIO_NET_F_CTRL_VQ.
> >
> > +If VIRTIO_NET_F_HOST_TSO_LIMIT and VIRTIO_NET_F_MTU have been
> > +negotiated, the device SHOULD set \field{tso_max_size} so that a TCP
> > +segment that fully utilizes the configured MTU can be processed by TSO
> > +(e.g., for IPv4 without options: at least \field{mtu} - 20; for IPv6
> > +without extension headers: at least \field{mtu} - 40). This
> > +recommendation does not account for IPv4 options or IPv6 extension
> > +headers, which reduce the effective segment size.
> > +
> > +If VIRTIO_NET_F_HOST_TSO_LIMIT has been negotiated, the device MUST
> > +set \field{tso_max_segs} to at least 64.
>
> where does this 64 come from? pls document.

A simple backward compatibility which makes sure the value can make
sure 64K TSO can be segmented with 1500 MTU.

>
> > +
> >  \drivernormative{\subsubsection}{Device configuration layout}{Device T=
ypes / Network Device / Device configuration layout}
> >
> >  The driver MUST NOT write to any of the device configuration fields.
> > @@ -379,6 +409,22 @@ \subsubsection{Legacy Interface: Device configurat=
ion layout}\label{sec:Device T
> >  which provided a way for drivers to update the MAC without
> >  negotiating VIRTIO_NET_F_CTRL_MAC_ADDR.
> >
> > +If the driver negotiates VIRTIO_NET_F_HOST_TSO_LIMIT, it MUST NOT
> > +transmit TSO packets with TCP length exceeding \field{tso_max_size}.
> > +
> > +If the driver negotiates both VIRTIO_NET_F_HOST_TSO_LIMIT and
> > +VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO, it MUST NOT transmit UDP tunnel TSO
> > +packets with inner TCP length exceeding \field{tso_max_size}.
> > +
> > +If the driver negotiates VIRTIO_NET_F_HOST_TSO_LIMIT, it MUST NOT
> > +transmit TSO packets with \field{gso_size} that would cause the device
> > +to generate more than \field{tso_max_segs} segments.
>
> and how does it know?

Driver knows the tso_max_segs, so when it finds the TSO packet will
exceed the limitation it would allocate a new skb for example.

>
>
> > +
> > +If the driver negotiates both VIRTIO_NET_F_HOST_TSO_LIMIT and
> > +VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO, it MUST NOT transmit UDP tunnel TSO
> > +packets with \field{gso_size} that would cause the device to generate
> > +more than \field{tso_max_segs} segments.
> > +
> >  \subsection{Device Initialization}\label{sec:Device Types / Network De=
vice / Device Initialization}
> >
> >  A driver would perform a typical initialization routine like so:
> > --
> > 2.42.0

Thanks

>

