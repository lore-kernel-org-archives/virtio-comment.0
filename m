Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC8F24A06D
	for <virtio-comment@lists.linux.dev>; Thu, 16 Oct 2025 06:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760596324; cv=none; b=OmZHKtzRPJiS6ECE9g50XguSml42MbSB+IiAr8uSiVeFkZGUXbBC08ifmfWHMbU57rYPvk54EZRJkfMvFRVzEsNxAOAXs7OtFTcy8V7CajLE/x1mDk3RGHnDWY5LHnqsB/qRt7QwJLWgT8oNqLH+h4kUaIXFJdpYkjKgR7Zprbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760596324; c=relaxed/simple;
	bh=J+VGS3gIEBM7MFbhFRcsQLASzr5LTEWIpmL4F9or920=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C8xQDJjiAGgk3UYpAc/2Z1IANPEiCpz5supC2FRkDBQs09h7RrmCHKeGgHjt6l/suEwjLFdLPE7uQ84qTU4vNCscIJrepbHvpuzYk9qrC96XydmSrW18RBTkZJ5BRIpizk2zLWWsnHWs5l5iRLmJmoncfXHnaWxHo4r2ROZnJg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dyEEHBKg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dyEEHBKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760596321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FfJajp7UNzdMCATOr4EWY+hp6GRTUVNFbVl5l2B4pKY=;
	b=dyEEHBKgaP3v4gigdK8fRhborAb84LDHNPMdinjFAaSzyWqRtNfESitEixJh9ICuFW+tui
	jB9ynAiWWfkmlKGgEgove+JzR1cKUH1/crd4D0moO+WLb1XwAneQFh3RDnNXtUruijO0xH
	htVaxh4ASZxvUDjcof5QuPKvDGKtMug=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-y5uUa0FQMxWSvbHwYXjx5Q-1; Thu, 16 Oct 2025 02:31:59 -0400
X-MC-Unique: y5uUa0FQMxWSvbHwYXjx5Q-1
X-Mimecast-MFC-AGG-ID: y5uUa0FQMxWSvbHwYXjx5Q_1760596319
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eaa47c7c8so378711a91.3
        for <virtio-comment@lists.linux.dev>; Wed, 15 Oct 2025 23:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760596318; x=1761201118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfJajp7UNzdMCATOr4EWY+hp6GRTUVNFbVl5l2B4pKY=;
        b=rfPMYdDWgufzwcMH44dgO21JJ8G/REbTgrUPD6wkqWAVgveVX6/jkjjFn/1yG1mXVo
         LAauCJ18rh56/YQg7XwjioDYbC8All6gCIW6CEEe+Z9AdMMZTthqcPRqazQzqwudzNoL
         MydffeHDFA9eXkDkLxZXJ6nVoqD+rTHo39uWi0slpRmn5X+OuasBCju4rrmexKNlIzpQ
         y96nUyj3U/vI9uR81oHgmWhJOJFQ9ii5d2V/37uV8tJfSUKnBlVDX8ZGM/pI7vuT/n5W
         0QQPCArsKNgJGpLZwFkntpjSP9ZXNK46DJ/WSdd1b8eBGgmQIm9O4FVVPabwKICYL970
         zl4A==
X-Gm-Message-State: AOJu0Yw/JqWFDIGs5YQWgYHC16TJn7PCrkDI+MAI7YY4Ds4hELj0Q08+
	w6i2UGuXZaiHvoabZ/VyOjnSTynaLu9HH14szv9MtJPzN4yc4K7jBD3TwWDXbBapIaLU862/W0U
	Cr0d4XLo71Vl7KY22DV+HiRlrxvfQ3//Y3SqBBjpEqRT+k7Xfv6K+aprTfcrJn3ajq6bLbWHKuP
	3lkZp16BAAIyEjXQ14DprW6i15rmuitYyVgTGVw+CvyUzrtQ0vFmPa9H8U
X-Gm-Gg: ASbGncuGnvYF2YkPhfDFH3nW0o/Xk+ziJmqUCcFiEZnfB+555U9iyrNDk93P6Shr4Pt
	LtEUiXApByqdjE3D7oLrx8dWOLACsivMPewyDsv2aZYSxxfwHxD9TUjZpLl5yU6H/LEt4EjIx0i
	euuW/2Y+qIUObnU10rKbBYTiI7VrXU2r32CXT1cC4lFseXOsTAs/gn310g
X-Received: by 2002:a17:90b:4f4e:b0:32e:5b07:15dd with SMTP id 98e67ed59e1d1-33b51105bb3mr39133666a91.1.1760596318518;
        Wed, 15 Oct 2025 23:31:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwCGsuijZKrQTCGc0bJ+YCpxOKxtuJUdEU0BhbMhE8P5fDVfD7RzWsKBqR+81QoUJdX6JzfNNICJZb9K+9mEI=
X-Received: by 2002:a17:90b:4f4e:b0:32e:5b07:15dd with SMTP id
 98e67ed59e1d1-33b51105bb3mr39133626a91.1.1760596317930; Wed, 15 Oct 2025
 23:31:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251014042243.22087-1-jasowang@redhat.com> <20251014044005-mutt-send-email-mst@kernel.org>
 <CACGkMEs7Y9DLuRp_3ex8ac3Hv5y7X5Q-PnS61DMjOVjAkvazjA@mail.gmail.com>
 <20251015030738-mutt-send-email-mst@kernel.org> <CACGkMEvBmNZCTrn9cWD+wByjNa+q-iEUOA6PK_GmWcqTdB5YMQ@mail.gmail.com>
 <20251016020113-mutt-send-email-mst@kernel.org>
In-Reply-To: <20251016020113-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 16 Oct 2025 14:31:46 +0800
X-Gm-Features: AS18NWCpJaqqgJ8HtNMAoiqisRAilvqCWEWShRskqG7pDILao1Y7lCk6OiqYbvU
Message-ID: <CACGkMEtO5Z1-gwWLLm5TN4L6Sc5F6Vf+O_5W_joMq8p+TGV6Xg@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: introduce TSO limit feature
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, lulu@redhat.com, nguyenlienviet@google.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ro-LWCm9y_-vY-0-tLsZnlGowhX6cyWd2PW7URhbiyY_1760596319
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 2:17=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Thu, Oct 16, 2025 at 01:57:41PM +0800, Jason Wang wrote:
> > On Wed, Oct 15, 2025 at 3:27=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > Thanks for the answers. Some more comments:
> > >
> > > On Wed, Oct 15, 2025 at 12:29:13PM +0800, Jason Wang wrote:
> > > > > >  device-types/net/description.tex | 46 ++++++++++++++++++++++++=
++++++++
> > > > > >  1 file changed, 46 insertions(+)
> > > > > >
> > > > > > diff --git a/device-types/net/description.tex b/device-types/ne=
t/description.tex
> > > > > > index 415c7fd..e56df75 100644
> > > > > > --- a/device-types/net/description.tex
> > > > > > +++ b/device-types/net/description.tex
> > > > > > @@ -146,6 +146,9 @@ \subsection{Feature bits}\label{sec:Device =
Types / Network Device / Feature bits
> > > > > >   when VIRTIO_NET_F_IPSEC is negotiated. When a device offers I=
Psec feature, it SHOULD
> > > > > >   also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
> > > > > >
> > > > > > +\item[VIRTIO_NET_F_HOST_TSO_LIMIT(71)] Device limits the maxim=
um TCP
> > > > > > +  length and the number of segments when performing TCP segmen=
tation.
> > > > > > +
> > > > > >  \end{description}
> > > > > >
> > > > > >  \subsubsection{Feature bit requirements}\label{sec:Device Type=
s / Network Device / Feature bits / Feature bit requirements}
> > > > > > @@ -184,6 +187,7 @@ \subsubsection{Feature bit requirements}\la=
bel{sec:Device Types / Network Device
> > > > > >  \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ=
.
> > > > > >  \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ =
along with VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
> > > > > >  \item[VIRTIO_NET_F_RSS_CONTEXT] Requires VIRTIO_NET_F_CTRL_VQ =
and VIRTIO_NET_F_RSS.
> > > > > > +\item[VIRTIO_NET_F_HOST_TSO_LIMIT] Requires VIRTIO_NET_F_HOST_=
TSO4 or VIRTIO_NET_F_HOST_TSO6
> > > > > >  \end{description}
> > > > > >
> > > > > >  \begin{note}
> > > > > > @@ -220,6 +224,8 @@ \subsection{Device configuration layout}\la=
bel{sec:Device Types / Network Device
> > > > > >          le16 rss_max_indirection_table_length;
> > > > > >          le32 supported_hash_types;
> > > > > >          le32 supported_tunnel_types;
> > > > > > +        le32 tso_max_size;
> > > > > > +        le32 tso_max_segs;
> > > > > >  };
> > > > > >  \end{lstlisting}
> > > > > >
> > > > > > @@ -276,6 +282,19 @@ \subsection{Device configuration layout}\l=
abel{sec:Device Types / Network Device
> > > > > >  Encapsulation types are defined in \ref{sec:Device Types / Net=
work Device / Device Operation / Processing of Incoming Packets /
> > > > > >  Hash calculation for incoming packets / Encapsulation types su=
pported/enabled for inner header hash}.
> > > > > >
> > > > > > +The following field, \field{tso_max_size} only exists if
> > > > > > +VIRTIO_NET_F_HOST_TSO_LIMIT is set.
> > > > > > +It specifies the maximum TCP length
> > > > >
> > > > > what is TCP length?
> > > >
> > > > It's defined in the rfc793:
> > > >
> > > > """
> > > >       The TCP Length is the TCP header length plus the data length =
in
> > > >       octets (this is not an explicitly transmitted quantity, but i=
s
> > > >       computed), and it does not count the 12 octets of the pseudo
> > > >       header.
> > > > """
> > >
> > >
> > > But that one is 16 bit so can not exceed 65535.
> >
> > I just reuse the terminology instead of defining something new.
>
> Let's use a generic term that will work with big tcp.

After glancing at RFC TCP length seems to be the best as TCP header
doesn't have a length.

Maybe you have something better in mind?

>
> > Note
> > that it is only used in pseudo header for csum after device has
> > performed TSO. The value in the pseudo header is capped by MTU/MSS.
> >
> > As replied in another thread, BIG TCP requires more work or features.
> > Driver needs to set ip->tot_len 0 with a new gso type to let the
> > device know about BIG TCP packet.
> >
> > >
> > > > >
> > > > > > of a TSO packet
> > > > >
> > > > > what is a TSO packet?
> > > >
> > > > Packet for device to perform TCP segmentation offload.
> > >
> > > pls define terms before use.
> >
> > I may miss something but TSO has been widely used in the spec before
> > this feature:
> >
> > """
> > \item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
> > ...
> > \item[VIRTIO_NET_F_HOST_TSO4 (11)] Device can receive TSOv4.
> > ...
> > """
>
>
> Yes but that does not define a "TSO packet".

How about a patch beforehand to explain thing like:

\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO (TCP
Segmentation Offload) with ECN.

>
>
> > >
> > > > > > that the
> > > > > > +device can process.
> > > > >
> > > > > process in which direction? you mean device can receive?
> > > >
> > > > It works only for TX (as TSO works only for TX).
> > >
> > >
> > > rest of spec says "device receives from driver"  for this.
> > > process is ambiguous
> >
> > A quick grep doesn't show me things like this, maybe you can point out
> > the location. Not a native speaker, but using "device receives from
> > driver" is indeed ambiguous for TX.
>
> Well right near the text you quoted:
>
> \item[VIRTIO_NET_F_HOST_TSO4 (11)] Device can receive TSOv4.
>
> \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.

Okay, I think you want another to to replace it with

\item[VIRTIO_NET_F_HOST_TSO4 (11)] Device can transmit TSOv4.

?

>
>
>
>
> > >
> > >
> > >
> > >
> > > > >
> > > > > > When VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is set,
> > > > > > +it specifies the maximum inner TCP length of a UDP tunnel TSO =
packet
> > > > > > +that the device can process.
> > > > >
> > > > > Rest of spec talks of " GSO over UDP tunnels packets" is this the=
 same?
> > > >
> > > > Not exactly the same, this is only for TSO not genreal GSO.
> > >
> > > rest of spec mostly talks of GSO. in fact virtio tso is a kind of
> > > accelerated gso.
> >
> > This only applies for some specific software datapath like vhost-net.
> > But it doesn't apply to others especially the hardware device who will
> > do real TSO.
>
> My point is that once you have said both GSO and TSO in the same
> sentence, any reader's eyes have glazed over.
>
>
>
>
> > > either do the same or add a lot of text
> > > explaining tso as opposed to gso.
> >
> > Is this ok to say "UDP tunnel VIRTIO_NET_HDR_GSO_TCPV4 or
> > VIRTIO_NET_HDR_GSO_TCPV6 packet"?
>
> Do you maybe mean: \field{gso_type} set to VIRTIO_NET_HDR_GSO_TCPV4
> or VIRTIO_NET_HDR_GSO_TCPV6

Yes.

>
>
>
> > >
> > > > >
> > > > > even if it's actually unused?
> > > > >
> > > > > this, on the assumption that the length for tunnel is smaller?
> > > >
> > > > It means the device should have the same limitation for plain TSO a=
nd
> > > > tunnel TSO.
> > >
> > > Hmm. I have doubts how it can work given the overhead.
> >
> > If a device can't afford the same limitation, it can simply not
> > advertise this feature. The reason I don't introduce a dedicated
> > limitation for tunnel is that there could be more tunnel supported in
> > the future, it would be a burden to have a per tunnel type limitation.
>
> Well presumably the feature is needed no?

Yes, but the kernel assumes the same limitation for tunnel and non
tunnel one. Having a single limitation simply things or if you stick I
can introduce a dedicated one for UDP tunnels.

>
>
>
> > >
> > > > >
> > > > > I think this kind of things should be explicit.
> > > > >
> > > > >
> > > > > > +
> > > > > > +The following field, \field{tso_max_segs} only exists if
> > > > > > +VIRTIO_NET_F_HOST_TSO_LIMIT is set.
> > > > > > +It specifies the maximum number of segments that can be produc=
ed by
> > > > > > +the device after performing segmentation on TSO packet or a UD=
P tunnel
> > > > > > +TSO packet (when VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is set).
> > > > >
> > > > > I don't get this field at all. the assumption is that all segment=
s
> > > > > are the same size, right? Then it is just based on length?
> > > >
> > > > It's the device side limitation, for example a device can produce 1=
00
> > > > segments at most, even if the tso_max_size is 256K, when MTU is 150=
0,
> > > > the driver can't send a TSO packet whose TCP length is greater than
> > > > (1500 - 20 - 20) * 100 =3D 146K.
> > >
> > > then "can be produced" is again confusing. device
> > > transmits packets but it does not "produce" them as such.
> > > maybe you just mean "supported".
> >
> > I think yes.
> >
> > >
> > > > >
> > > > >
> > > > >
> > > > > > +
> > > > > >  \devicenormative{\subsubsection}{Device configuration layout}{=
Device Types / Network Device / Device configuration layout}
> > > > > >
> > > > > >  The device MUST set \field{max_virtqueue_pairs} to between 1 a=
nd 0x8000 inclusive,
> > > > > > @@ -326,6 +345,17 @@ \subsection{Device configuration layout}\l=
abel{sec:Device Types / Network Device
> > > > > >  The device SHOULD NOT offer VIRTIO_NET_F_CTRL_RX_EXTRA if it
> > > > > >  does not offer VIRTIO_NET_F_CTRL_VQ.
> > > > > >
> > > > > > +If VIRTIO_NET_F_HOST_TSO_LIMIT and VIRTIO_NET_F_MTU have been
> > > > > > +negotiated, the device SHOULD set \field{tso_max_size} so that=
 a TCP
> > > > > > +segment that fully utilizes the configured MTU can be processe=
d by TSO
> > > > > > +(e.g., for IPv4 without options: at least \field{mtu} - 20; fo=
r IPv6
> > > > > > +without extension headers: at least \field{mtu} - 40). This
> > > > > > +recommendation does not account for IPv4 options or IPv6 exten=
sion
> > > > > > +headers, which reduce the effective segment size.
> > > > > > +
> > > > > > +If VIRTIO_NET_F_HOST_TSO_LIMIT has been negotiated, the device=
 MUST
> > > > > > +set \field{tso_max_segs} to at least 64.
> > > > >
> > > > > where does this 64 come from? pls document.
> > > >
> > > > A simple backward compatibility which makes sure the value can make
> > > > sure 64K TSO can be segmented with 1500 MTU.
> > >
> > > 2^16/64 =3D=3D 1024
> > >
> > > not ~1500
> >
> > Yes, I just choose one that is sufficient.
> >
> > >
> > > And we don't know MTU is 1500, either.
> >
> > A typical configuration but I can remove this part.
> >
> > Thanks
> >
> > >
> > >
> > >
> > > --
> > > MST
> > >
>

Thanks

