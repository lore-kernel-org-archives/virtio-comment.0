Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44827145A1A
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 17:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719336912; cv=none; b=TXJwKdcdvl1W69+93zfbjVDRlLR5rBIbwVYbuP3wStt0QZTL3iz3pMLo0Gq6cKjMBFsjHYozGglQDFFWTVEgZ5L+xrcBTOMH097WfPDxV0FFKax8vYZtxpIDlxfdj4GzD06Bo+pFumFwylF2s7dhZXCJtGRPr2hsisfJQTZjHvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719336912; c=relaxed/simple;
	bh=jMun9R2XZ3Ygv+utFIb7BsE1VJPky28+16HRHVaK/IY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PgPMO9FJY7UpyQGdSue1onFUIGpAwHjRQYHugEo/HDHfgxWHDoZXOzgpkAUQrhS2r8gkAtQWk7gcoKpYVVmpmOUofAZZ82xmQpQ2JWWA/0LYNCxIwy5SDup6+VbS2WfF/osflQh8P7pVCG134uQaj8oOvMThrsSj83XyDylHBKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JtEwuQ6s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JtEwuQ6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719336910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qB4E3Gb1MF2Jldew2ERDJ3pNHqh19mkaISEV8mA2xjc=;
	b=JtEwuQ6s/PN9D9s5BAIDedeEQ4sGY9qPZbsfAvu2vq6Zmpt4XEAmZa2amEQ/LLkheW2WrC
	ia5xFtdXBSmYfM6Hif+VVQiBZgm+FQ5Q4bmmBmoerAkvhcZ4JdY8xowIUsx/1TiHQB5078
	QE7Pc/XDZIueuyUyWCIw0Grf8etok6A=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-WwGRkXgoMa6tVELJo3LcXw-1; Tue, 25 Jun 2024 13:35:08 -0400
X-MC-Unique: WwGRkXgoMa6tVELJo3LcXw-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ec5566c22bso4098591fa.1
        for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 10:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719336906; x=1719941706;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=79vnZNApiWNAF7OlWUuDvSNmanvmUpS5zvvUMTBPqIo=;
        b=EUF0061O+YWrQ6P33jAm4lbyCVNXdWk3Awjr/bVJSBSwWmLrP2K2kLZWZuNo8RvqQi
         i3OlbwhATUs6Fc5JUkvs4SPOkSBzFefEFJNfW0I1C2+6hNc3WKcw4o/bgbqadwdYDEEw
         mWBoX+zmxn8XSJjZ1bLT4KOyd5IcXmmkle+BvgbMegrILKp0TUf8m7Qrv2M33o00wbci
         CHq1MXIxyzMj1i5I2+zPD7CEkXES8LVfH1ZvX59fgT+wg9z8WqYVUeHLklOCBTtV9CEZ
         fzsiuuHtzoTEMPMcaETcdt9N9NsVQgh1oahG0xsuXCiRFKUFLblD63DIfvrHmfbsoIqp
         T2dw==
X-Gm-Message-State: AOJu0YxFB0j8FudjkliLjAWKcNKoegB8EA6EUXRfigNQmBbydqV2tSEu
	6ZMG1gksYuDUOBV8F05UqF+ckTSk/DLknURy0V2JjW9UrHjGhy7oNPtO9o8VgdX23F8whFE6xn4
	jf/PwIr08kaRtnyiGA9pb7I4ZQyAzB+eU7UXXzrZT4MQ2kQILqZR1lf0ICz+0o5fj
X-Received: by 2002:ac2:4910:0:b0:52c:d7cc:33da with SMTP id 2adb3069b0e04-52cdeaae536mr4586182e87.5.1719336906691;
        Tue, 25 Jun 2024 10:35:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2K9r1Iyl0me/K/R/BTtmToABZ+j7JC28gmv3D7ccMB5YyJWMctDjzfdiStRK62SCQPLfl5g==
X-Received: by 2002:ac2:4910:0:b0:52c:d7cc:33da with SMTP id 2adb3069b0e04-52cdeaae536mr4586119e87.5.1719336904259;
        Tue, 25 Jun 2024 10:35:04 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3341:b0ae:da10::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0b63a9sm220608105e9.9.2024.06.25.10.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 10:35:03 -0700 (PDT)
Message-ID: <e5d885e6331b18b3be63facfd59658b316f20de1.camel@redhat.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: Jason Wang <jasowang@redhat.com>, Willem de Bruijn <willemb@google.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, Eelco
 Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 25 Jun 2024 19:35:02 +0200
In-Reply-To: <CACGkMEvD_WDN5yeRKcZ2ijRF8C2_Pmr6UZWMNt+_R6S0WHY5Fg@mail.gmail.com>
References: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
	 <CACGkMEt-Ep+At_4YvkJ2t8UmQHJ0-Qm6fAPbGpkV_AfVyNq2EA@mail.gmail.com>
	 <ed07e9bb9ae5bc1a171c77425cc0b96e6b87745c.camel@redhat.com>
	 <CACGkMEvD_WDN5yeRKcZ2ijRF8C2_Pmr6UZWMNt+_R6S0WHY5Fg@mail.gmail.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2024-06-25 at 16:28 +0800, Jason Wang wrote:
> On Mon, Jun 24, 2024 at 11:47=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> =
wrote:
>=20
> > > > +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (49)] Device can receive GS=
O packets
> > > > +  carried by an UDP tunnel.
> > > > +
> > > > +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM (50)] Device handles packe=
ts
> > > > +  carried by an UDP tunnel with partial csum for the outer header.
> > > > +
> > > >  \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header h=
ash for encapsulated packets.
> > > >=20
> > > >  \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue not=
ification coalescing.
> > > > @@ -133,12 +145,18 @@ \subsubsection{Feature bit requirements}\labe=
l{sec:Device Types / Network Device
> > > >  \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
> > > >  \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
> > > >  \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> > > > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_GUE=
ST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
> > > > +   VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6.
> > >=20
> > > For "or" I think you meant "and" actually?
> >=20
> > No, just any (one) of the above options is sufficient for UDP tunnel
> > GSO sake. Why do you want to mandate all of them?
>=20
> For example, does it mean if there's only VIRTIO_NET_F_GUEST_USO4, the
> driver still supports tunnel offloading over UDPv6? This sounds a
> little bit strange.

I did not look to the things from such perspective. I agree it would be
cleaner to require:
=09both VIRTIO_NET_F_GUEST_TSO4 and VIRTIO_NET_F_GUEST_TSO6 or
=09both VIRTIO_NET_F_GUEST_USO4 and VIRTIO_NET_F_GUEST_USO6

> > >=20
> > > > @@ -423,6 +455,10 @@ \subsection{Device Operation}\label{sec:Device=
 Types / Network Device / Device O
> > > >          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT =
negotiated)
> > > >          le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT =
negotiated)
> > > >          le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT =
negotiated)
> > > > +        le16 outer_th_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUN=
NEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> > > > +        le16 inner_protocol;    (Only if VIRTIO_NET_F_HOST_UDP_TUN=
NEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> > > > +        le16 inner_mac_offset;  (Only if VIRTIO_NET_F_HOST_UDP_TUN=
NEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> > > > +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUN=
NEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> > > >  };
> > > >  \end{lstlisting}
> > > >=20
> > > > @@ -480,6 +516,8 @@ \subsubsection{Packet Transmission}\label{sec:D=
evice Types / Network Device / De
> > > >  followed by the TCP header (with the TCP checksum field 16 bytes
> > > >  into that header). \field{csum_start} will be 14+20 =3D 34 (the TC=
P
> > > >  checksum includes the header), and \field{csum_offset} will be 16.
> > > > +If the given packets has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit set=
,
> > > > +the above checksum fields refer to the inner header checksum.
> > >=20
> > > Rethink of the design here, I have one dumb question:
> > >=20
> > > A simple csum_start/csum_offset can work for GSO without tunneling.
> > > Any reason a inner_csum_start/inner_csum_offset (or simply introduce =
a
> > > copies of other gso related fields in the existing vnet header for
> > > outer packet) can't work for tunneling GSO? I feel if we need to do
> > > thing differently it might a hint of bugs for existing GSO
> > > definitions.
> >=20
> > Yes, the outer csum offload could work even without requiring the UDP
> > tunnel GSO support but:
> > - AFAIK H/W support for outer csum offload is not as widespread as
> > other offload, it will restrict a lot the feasibility of H/W
> > implementation backing this spec.
> > - computing the outer csum given the presence of the inner one is very
> > cheap in S/W - because thanks to LCO the S/W needs to touch only a very
> > limited number of bytes to compute it.
> >=20
> > I can explicitly mention the above in the commit message of the next
> > revision.
>=20
> Just to make sure we are on the same page. I basically meant:
>=20
> Without UDP tunneling, GSO works with simple csum_start/csum_offset.
> It doesn't require things like mac/network offset.
> With UDP tunneling, can we just invent
> inner_csum_start/inner_csum_offset to make things just work?

Note for UDP tunneling should be 'outer_csum_start' (as 'csum_start'
refers to the inner header) and 'outer_csum_offset' will not be needed,
as we know that the outer header is an UDP one.

I (mis?)understood from the discussion on previous revisions that you
are against additional parsing.

Using inner_csum_start only, will require such thing and will possibly
be not enough to support Willen's use-case with no inner mac header.

Note that plain GSO leverages the fact that the mac address is known to
be an ethernet one, while the UDP tunnel GSO has an additional variable
in the tunnel header length.

Dropping the support for the use-case with no inner mac header, and=20
enforcing that the inner mac header must always be an ethernet one, the
following fields will suffice:
- outer transport header offset (or, if you prefer 'outer_csum_start')
- inner mac header offset (because we can't locate it in any robust way
even with parsing)

Note that with that we will need an additional spec change (adding more
fields) to support UDP tunnel GSO with no inner mac header.

If there is concern with the increased virtio_net_hdr size, what about
to add the new fields only if the  VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit is
set? that is, if UDP tunnel GSO support is negotiated _and_ the current
packet is a UDP tunnel GSO one.

That will make the virtio_net_hdr len packet-dependent, could be a
problem for H/W implementation?

Cheers,

Paolo

