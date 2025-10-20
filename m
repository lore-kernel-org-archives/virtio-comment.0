Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6E414F9FB
	for <virtio-comment@lists.linux.dev>; Mon, 20 Oct 2025 06:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760941576; cv=none; b=i5d86ZeOkzXL0Jfhs4NruP8PBzbISe4CQYERsERfux2h5Sr5MUELpu3mf75nNmhSw1urAaf6aXvm/6DBXE/vwJBhPXoVc0d7nFDbxQvs81fR7UcM+W6OdANr0NLrhEceOYkcGvpsRNItyBP7kZ1XubR4pFq/THbs6lZKfYapqtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760941576; c=relaxed/simple;
	bh=9u7mJ+qh8KjNhqw14LxOd2Q7T3+hnMbjLMWMUGTO3Ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QuVTsdYYaWSxbW6m9vVDXZYlWc/2ihak9h9Nu3UIpNDx9BM0oCeOXZR/5ULLo3eQsaxYu0K1rYMk4522jC0OE7aV96r2O4JfQs7U4vaDcm1ZNLxsqNe0J7M/xL6Yvu9iu2IRtSMvsqXA+0pDPTF8Bgxio7Lyd/448/Wztz+vNnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IlJ4PvzB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IlJ4PvzB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760941573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vjtn8vsWeIrwajTAlPRNd1vvx0cBTnTh4FnfKaTjt9Y=;
	b=IlJ4PvzBMBO4jky/HasdkpfwSQZty4Dck0/VF3qyOVx/VO0g/nksAfVlkZue0je2gyVsSM
	BXUyj2PopSsE5dsrNDrVEx4Y6zfvYfBfD8qR7cQoUnxqvfNu1XR8OdP9sd/E9AkQkzH3Ui
	MfaOl9rOZWCQcYBhkGYkKLDLL7atFlk=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-ZhFrV3MyPg6FaoCreAk6kg-1; Mon, 20 Oct 2025 02:26:11 -0400
X-MC-Unique: ZhFrV3MyPg6FaoCreAk6kg-1
X-Mimecast-MFC-AGG-ID: ZhFrV3MyPg6FaoCreAk6kg_1760941571
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33dadf7c5c0so811729a91.0
        for <virtio-comment@lists.linux.dev>; Sun, 19 Oct 2025 23:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760941571; x=1761546371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vjtn8vsWeIrwajTAlPRNd1vvx0cBTnTh4FnfKaTjt9Y=;
        b=t/7a8lfvMMzXD9oFRniaQ+fTC23ZuwP20fCmJdEU/kzLZ5rqtxu7jEIbeJ38VZx0mT
         OhpjN7rVg0kjXEO8GVNTAm74T2/hxHqwRD8mA3IXGz/BCq/klMvtgF4TdhtchLqFcSvO
         rQx9bWz7OQB9NvM/6MY6PSZ5uMVDh52tgIT2A7gH6K1tWyzdtjONjdABxFIoxn2ENSUz
         J7lZyX6+MhkMqOsWkoP38WOIfOt9OBqwxoB/g2hjOtx0VrQ3PolaLckx0BsDcrKnfiA+
         XUuKeDce3++YS5kOXULc4RheuULrhXNbNSfB1CQium1vVZ5yeOni4CHQk34jk48Ju+mf
         3PaQ==
X-Gm-Message-State: AOJu0YwUV+nijassDHNG/HkyjYodI3t0XEak2liNws8exTxPoE0oVGIh
	2dXp0Lg3eWF0uCHArlu/UuYZYZUxmaqMppUat3Mnu2pxhb3dhXaI09Lq0D5K6LrP79xko2V+6HV
	4TTeXOU+RJO3OLxYJHLJWIb9GBfAi7rQeyigd6132usIe5ithMRe2Op+GF/omor4GgNL8XtItGv
	aXsPt4r8igBFf5qdi83Ii/s8GYB5xS7NM5neoWu+FUQF0=
X-Gm-Gg: ASbGncuwTTEOkdYon9bA0V/MMRy0r+ijcbjOEiwpSaFVGvzCogb+wzx9R/jMczhtLEX
	tTaa5+diCeZzp5C0yJiwR5GByaqCv6eCJ0SSmFtU7Wvzd+zrx1/eBTvSinz9TYvasUiKnYChAgA
	acnvpjU+NZDyRIO4tmbRXJLUi0BcW/Tsj/DC7IAGy+Qv9y3uYekYKV
X-Received: by 2002:a17:90b:1844:b0:33d:ad58:cb6a with SMTP id 98e67ed59e1d1-33dad58cc4fmr3357880a91.8.1760941570678;
        Sun, 19 Oct 2025 23:26:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwoASjb0c6JWmtGmo+AV3Y0xy730lqnD0j9kP+NROroCmE3i+BBd6+2pJdi1sUFQKJTlxBt32E2L5tROavtts=
X-Received: by 2002:a17:90b:1844:b0:33d:ad58:cb6a with SMTP id
 98e67ed59e1d1-33dad58cc4fmr3357854a91.8.1760941570117; Sun, 19 Oct 2025
 23:26:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251014042243.22087-1-jasowang@redhat.com> <20251014044005-mutt-send-email-mst@kernel.org>
 <CACGkMEs7Y9DLuRp_3ex8ac3Hv5y7X5Q-PnS61DMjOVjAkvazjA@mail.gmail.com>
 <20251015030738-mutt-send-email-mst@kernel.org> <CACGkMEvBmNZCTrn9cWD+wByjNa+q-iEUOA6PK_GmWcqTdB5YMQ@mail.gmail.com>
 <20251016020113-mutt-send-email-mst@kernel.org> <CACGkMEtO5Z1-gwWLLm5TN4L6Sc5F6Vf+O_5W_joMq8p+TGV6Xg@mail.gmail.com>
 <20251016031546-mutt-send-email-mst@kernel.org>
In-Reply-To: <20251016031546-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 20 Oct 2025 14:25:56 +0800
X-Gm-Features: AS18NWCOY4nH07l27uWhwcboBpAVWYy3F2tbQR5sTFO2o9a8EWKHsfI8u-PBva0
Message-ID: <CACGkMEtDwxWXqdN7ESk5QvmLwTg7GnspZJFu0r-o=XpKTzBGyA@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: introduce TSO limit feature
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, lulu@redhat.com, nguyenlienviet@google.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j_kso0pkLbjz0qJaSjJ-wtxMYar9SxhufdnkZfVzJtY_1760941571
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 6:03=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Thu, Oct 16, 2025 at 02:31:46PM +0800, Jason Wang wrote:
> > On Thu, Oct 16, 2025 at 2:17=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Thu, Oct 16, 2025 at 01:57:41PM +0800, Jason Wang wrote:
> > > > On Wed, Oct 15, 2025 at 3:27=E2=80=AFPM Michael S. Tsirkin <mst@red=
hat.com> wrote:
> > > > >
> > > > > Thanks for the answers. Some more comments:
> > > > >
> > > > > On Wed, Oct 15, 2025 at 12:29:13PM +0800, Jason Wang wrote:
> > > > > > > >  device-types/net/description.tex | 46 ++++++++++++++++++++=
++++++++++++
> > > > > > > >  1 file changed, 46 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/device-types/net/description.tex b/device-type=
s/net/description.tex
> > > > > > > > index 415c7fd..e56df75 100644
> > > > > > > > --- a/device-types/net/description.tex
> > > > > > > > +++ b/device-types/net/description.tex
> > > > > > > > @@ -146,6 +146,9 @@ \subsection{Feature bits}\label{sec:Dev=
ice Types / Network Device / Feature bits
> > > > > > > >   when VIRTIO_NET_F_IPSEC is negotiated. When a device offe=
rs IPsec feature, it SHOULD
> > > > > > > >   also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
> > > > > > > >
> > > > > > > > +\item[VIRTIO_NET_F_HOST_TSO_LIMIT(71)] Device limits the m=
aximum TCP
> > > > > > > > +  length and the number of segments when performing TCP se=
gmentation.
> > > > > > > > +
> > > > > > > >  \end{description}
> > > > > > > >
> > > > > > > >  \subsubsection{Feature bit requirements}\label{sec:Device =
Types / Network Device / Feature bits / Feature bit requirements}
> > > > > > > > @@ -184,6 +187,7 @@ \subsubsection{Feature bit requirements=
}\label{sec:Device Types / Network Device
> > > > > > > >  \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTR=
L_VQ.
> > > > > > > >  \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL=
_VQ along with VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
> > > > > > > >  \item[VIRTIO_NET_F_RSS_CONTEXT] Requires VIRTIO_NET_F_CTRL=
_VQ and VIRTIO_NET_F_RSS.
> > > > > > > > +\item[VIRTIO_NET_F_HOST_TSO_LIMIT] Requires VIRTIO_NET_F_H=
OST_TSO4 or VIRTIO_NET_F_HOST_TSO6
> > > > > > > >  \end{description}
> > > > > > > >
> > > > > > > >  \begin{note}
> > > > > > > > @@ -220,6 +224,8 @@ \subsection{Device configuration layout=
}\label{sec:Device Types / Network Device
> > > > > > > >          le16 rss_max_indirection_table_length;
> > > > > > > >          le32 supported_hash_types;
> > > > > > > >          le32 supported_tunnel_types;
> > > > > > > > +        le32 tso_max_size;
> > > > > > > > +        le32 tso_max_segs;
> > > > > > > >  };
> > > > > > > >  \end{lstlisting}
> > > > > > > >
> > > > > > > > @@ -276,6 +282,19 @@ \subsection{Device configuration layou=
t}\label{sec:Device Types / Network Device
> > > > > > > >  Encapsulation types are defined in \ref{sec:Device Types /=
 Network Device / Device Operation / Processing of Incoming Packets /
> > > > > > > >  Hash calculation for incoming packets / Encapsulation type=
s supported/enabled for inner header hash}.
> > > > > > > >
> > > > > > > > +The following field, \field{tso_max_size} only exists if
> > > > > > > > +VIRTIO_NET_F_HOST_TSO_LIMIT is set.
> > > > > > > > +It specifies the maximum TCP length
> > > > > > >
> > > > > > > what is TCP length?
> > > > > >
> > > > > > It's defined in the rfc793:
> > > > > >
> > > > > > """
> > > > > >       The TCP Length is the TCP header length plus the data len=
gth in
> > > > > >       octets (this is not an explicitly transmitted quantity, b=
ut is
> > > > > >       computed), and it does not count the 12 octets of the pse=
udo
> > > > > >       header.
> > > > > > """
> > > > >
> > > > >
> > > > > But that one is 16 bit so can not exceed 65535.
> > > >
> > > > I just reuse the terminology instead of defining something new.
> > >
> > > Let's use a generic term that will work with big tcp.
> >
> > After glancing at RFC TCP length seems to be the best as TCP header
> > doesn't have a length.
> >
> > Maybe you have something better in mind?
>
>
> Depends on what do you mean by it, exactly.

TCP header length plus the data length. Maybe TCP packet length?

>
> > >
> > > > Note
> > > > that it is only used in pseudo header for csum after device has
> > > > performed TSO. The value in the pseudo header is capped by MTU/MSS.
> > > >
> > > > As replied in another thread, BIG TCP requires more work or feature=
s.
> > > > Driver needs to set ip->tot_len 0 with a new gso type to let the
> > > > device know about BIG TCP packet.
> > > >
> > > > >
> > > > > > >
> > > > > > > > of a TSO packet
> > > > > > >
> > > > > > > what is a TSO packet?
> > > > > >
> > > > > > Packet for device to perform TCP segmentation offload.
> > > > >
> > > > > pls define terms before use.
> > > >
> > > > I may miss something but TSO has been widely used in the spec befor=
e
> > > > this feature:
> > > >
> > > > """
> > > > \item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
> > > > ...
> > > > \item[VIRTIO_NET_F_HOST_TSO4 (11)] Device can receive TSOv4.
> > > > ...
> > > > """
> > >
> > >
> > > Yes but that does not define a "TSO packet".
> >
> > How about a patch beforehand to explain thing like:
> >
> > \item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO (TCP
> > Segmentation Offload) with ECN.
>
> That does not define is either?
>
> virtio$ git grep 'TSO packet'
> virtio$

Something like this?

Maybe "TSO packet is the packet that device may segment it into
multiple frames"?


>
>
>
>
>
> > >
> > >
> > > > >
> > > > > > > > that the
> > > > > > > > +device can process.
> > > > > > >
> > > > > > > process in which direction? you mean device can receive?
> > > > > >
> > > > > > It works only for TX (as TSO works only for TX).
> > > > >
> > > > >
> > > > > rest of spec says "device receives from driver"  for this.
> > > > > process is ambiguous
> > > >
> > > > A quick grep doesn't show me things like this, maybe you can point =
out
> > > > the location. Not a native speaker, but using "device receives from
> > > > driver" is indeed ambiguous for TX.
> > >
> > > Well right near the text you quoted:
> > >
> > > \item[VIRTIO_NET_F_HOST_TSO4 (11)] Device can receive TSOv4.
> > >
> > > \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
> >
> > Okay, I think you want another to to replace it with
> >
> > \item[VIRTIO_NET_F_HOST_TSO4 (11)] Device can transmit TSOv4.
> >
> > ?
>
>
> "receive" in this context is "receive from driver".
>
>
> TSO is not something that is transmitted on the wire.

Ok.

>
>
>
>
> > >
> > >
> > >
> > >
> > > > >
> > > > >
> > > > >
> > > > >
> > > > > > >
> > > > > > > > When VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is set,
> > > > > > > > +it specifies the maximum inner TCP length of a UDP tunnel =
TSO packet
> > > > > > > > +that the device can process.
> > > > > > >
> > > > > > > Rest of spec talks of " GSO over UDP tunnels packets" is this=
 the same?
> > > > > >
> > > > > > Not exactly the same, this is only for TSO not genreal GSO.
> > > > >
> > > > > rest of spec mostly talks of GSO. in fact virtio tso is a kind of
> > > > > accelerated gso.
> > > >
> > > > This only applies for some specific software datapath like vhost-ne=
t.
> > > > But it doesn't apply to others especially the hardware device who w=
ill
> > > > do real TSO.
> > >
> > > My point is that once you have said both GSO and TSO in the same
> > > sentence, any reader's eyes have glazed over.
> > >
> > >
> > >
> > >
> > > > > either do the same or add a lot of text
> > > > > explaining tso as opposed to gso.
> > > >
> > > > Is this ok to say "UDP tunnel VIRTIO_NET_HDR_GSO_TCPV4 or
> > > > VIRTIO_NET_HDR_GSO_TCPV6 packet"?
> > >
> > > Do you maybe mean: \field{gso_type} set to VIRTIO_NET_HDR_GSO_TCPV4
> > > or VIRTIO_NET_HDR_GSO_TCPV6
> >
> > Yes.
> >
> > >
> > >
> > >
> > > > >
> > > > > > >
> > > > > > > even if it's actually unused?
> > > > > > >
> > > > > > > this, on the assumption that the length for tunnel is smaller=
?
> > > > > >
> > > > > > It means the device should have the same limitation for plain T=
SO and
> > > > > > tunnel TSO.
> > > > >
> > > > > Hmm. I have doubts how it can work given the overhead.
> > > >
> > > > If a device can't afford the same limitation, it can simply not
> > > > advertise this feature. The reason I don't introduce a dedicated
> > > > limitation for tunnel is that there could be more tunnel supported =
in
> > > > the future, it would be a burden to have a per tunnel type limitati=
on.
> > >
> > > Well presumably the feature is needed no?
> >
> > Yes, but the kernel assumes the same limitation for tunnel and non
> > tunnel one. Having a single limitation simply things or if you stick I
> > can introduce a dedicated one for UDP tunnels.
>
> I don't insist, I think it is worth clarifying though.

Ok how about this:

"""
If a device can not have a single limitation for both plain GSO and
tunnel GSO, it MUST NOT advertise VIRTIO_NET_F_TSO_LIMIT feature.
"""

>
> > >
> > >
> > >
> > > > >
> > > > > > >
> > > > > > > I think this kind of things should be explicit.
> > > > > > >
> > > > > > >
> > > > > > > > +
> > > > > > > > +The following field, \field{tso_max_segs} only exists if
> > > > > > > > +VIRTIO_NET_F_HOST_TSO_LIMIT is set.
> > > > > > > > +It specifies the maximum number of segments that can be pr=
oduced by
> > > > > > > > +the device after performing segmentation on TSO packet or =
a UDP tunnel
> > > > > > > > +TSO packet (when VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is set).
> > > > > > >
> > > > > > > I don't get this field at all. the assumption is that all seg=
ments
> > > > > > > are the same size, right? Then it is just based on length?
> > > > > >
> > > > > > It's the device side limitation, for example a device can produ=
ce 100
> > > > > > segments at most, even if the tso_max_size is 256K, when MTU is=
 1500,
> > > > > > the driver can't send a TSO packet whose TCP length is greater =
than
> > > > > > (1500 - 20 - 20) * 100 =3D 146K.
> > > > >
> > > > > then "can be produced" is again confusing. device
> > > > > transmits packets but it does not "produce" them as such.
> > > > > maybe you just mean "supported".
> > > >
> > > > I think yes.
> > > >
> > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > > +
> > > > > > > >  \devicenormative{\subsubsection}{Device configuration layo=
ut}{Device Types / Network Device / Device configuration layout}
> > > > > > > >
> > > > > > > >  The device MUST set \field{max_virtqueue_pairs} to between=
 1 and 0x8000 inclusive,
> > > > > > > > @@ -326,6 +345,17 @@ \subsection{Device configuration layou=
t}\label{sec:Device Types / Network Device
> > > > > > > >  The device SHOULD NOT offer VIRTIO_NET_F_CTRL_RX_EXTRA if =
it
> > > > > > > >  does not offer VIRTIO_NET_F_CTRL_VQ.
> > > > > > > >
> > > > > > > > +If VIRTIO_NET_F_HOST_TSO_LIMIT and VIRTIO_NET_F_MTU have b=
een
> > > > > > > > +negotiated, the device SHOULD set \field{tso_max_size} so =
that a TCP
> > > > > > > > +segment that fully utilizes the configured MTU can be proc=
essed by TSO
> > > > > > > > +(e.g., for IPv4 without options: at least \field{mtu} - 20=
; for IPv6
> > > > > > > > +without extension headers: at least \field{mtu} - 40). Thi=
s
> > > > > > > > +recommendation does not account for IPv4 options or IPv6 e=
xtension
> > > > > > > > +headers, which reduce the effective segment size.
> > > > > > > > +
> > > > > > > > +If VIRTIO_NET_F_HOST_TSO_LIMIT has been negotiated, the de=
vice MUST
> > > > > > > > +set \field{tso_max_segs} to at least 64.
> > > > > > >
> > > > > > > where does this 64 come from? pls document.
> > > > > >
> > > > > > A simple backward compatibility which makes sure the value can =
make
> > > > > > sure 64K TSO can be segmented with 1500 MTU.
> > > > >
> > > > > 2^16/64 =3D=3D 1024
> > > > >
> > > > > not ~1500
> > > >
> > > > Yes, I just choose one that is sufficient.
> > > >
> > > > >
> > > > > And we don't know MTU is 1500, either.
> > > >
> > > > A typical configuration but I can remove this part.
> > > >
> > > > Thanks
> > > >
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > MST
> > > > >
> > >
> >
> > Thanks
>

Thanks

