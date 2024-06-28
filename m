Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6605917F8
	for <virtio-comment@lists.linux.dev>; Fri, 28 Jun 2024 02:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719542530; cv=none; b=BRCtteqnfjMNPrpzw49XRdIF8LfYZodykGdsyFjJSr4pAC28udXFC5YrDuu6asFL8e2cCom96G1ZgTYI+X39G0jARlHsZArvY0Po+qKRtN6y2U2dkIAp9DJTvZ3iOfKkx1fSrO+mwZo90QySqPqXZFi6f3JyzLFlQqg/rWRBILg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719542530; c=relaxed/simple;
	bh=DaSoxVdZoagWyEdMfzMfNeOkqNyos8OTB5Fc0cCPAZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=naP7djwBl5LFHARlrD3dMRIxG5FuXzEXyBpRDbnXuaau1qtDJCw9hBkG4zdEbm52sSQX2aT3lW2lPplZI4ImLl3ZAu+ojf5lsUVhbzncTW+STKXOiWd2YXd7ZyzMGf/5J63b3Gpy0Z3oSmSAZ6XEPdj2ROC0AxAZQ7OqI1dDN3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DfdKgmyq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DfdKgmyq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719542527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NTaCYU1lFkRTS4hfel5JO5bKY2LuCdAy12tzE5J+gYw=;
	b=DfdKgmyq9HrdaFJAPKiOCDKPkMs+NKWXIAFhUQLv2lilCiZK5Ds3r0xouM4T+Na4rq/hDQ
	D0TqN4LYTiRSedG58TzsVkO0GtF+A1Grd2eVg5bhVZCHKe3+R8CuRnPFkESF+6KFrCZgIw
	d+OvJtriLZ8zbbZ6Hk76g5hJYDqRzZ0=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-yFOaDiknP-a3vLyBwi2p6g-1; Thu, 27 Jun 2024 22:42:05 -0400
X-MC-Unique: yFOaDiknP-a3vLyBwi2p6g-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-25ca2237198so273587fac.1
        for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 19:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719542525; x=1720147325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTaCYU1lFkRTS4hfel5JO5bKY2LuCdAy12tzE5J+gYw=;
        b=EweijwcCm5vkJwtNpHCPj9IvpqKoEpykswJkE4RfwThY3PCAyYTY7ERN9kXZTZpB3k
         8YoOeHE/7r/R4AK5YyYbZgqY5cdQa5jb1Qa1lLVj8EOnbwYuEVXiWS9x0olxfVTy61H5
         NnFVoJ/V/Ntx7oVSlsV8iQ7EaWPRJJSikYaS2TICO5r9/2m5clBseskmtwhq9Qp87A+E
         Uy1Rz6wQtiuU+zyaZKZ60GDQzc9TWVSncB/5zws6aUGvz05Z+3C8SRiz6bv9pSq0WUXz
         PsgMI2tKSy5cqLJy3IH/SYS0HZ4MSphjhKLSDiDfwCmI6RnACmIw0m2B0+IXPVhYFpJP
         Kmpg==
X-Forwarded-Encrypted: i=1; AJvYcCU9JM2uhULL+N0Cuf83WQY/3dUugGT0D85GZBta6mYduOVgvs5blwe2dzLjYQ5GC63dnOr77YuDVRfeZs5hcw7gAch9O7gd3roiytpdSz0=
X-Gm-Message-State: AOJu0Yy/S8/1wdyT/h1fPZXaHcRUIb3bbTp+XHhdTuO8Wa2z1A6e7cUF
	1wgtlWJ1re6OHQB1Lg9K1/OYe3uspKpwHB9pecWjfejl1tXrhigApSRDLPd2r6dQSe4kXeKO3Mz
	9b53H/+HxTL8ZapRhSP/7k2x0jlYVKlD5aJTLsu7HkeFcZVxTnoVUkKi79J4VZ1xbcPVRmqWL22
	/d8QOutbJFG8Sm3DCEU1UmWYNBOh5xhSBtPRpiY48=
X-Received: by 2002:a05:6870:568b:b0:25d:1a2f:cd53 with SMTP id 586e51a60fabf-25d1a2fdacemr15102494fac.53.1719542524878;
        Thu, 27 Jun 2024 19:42:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErrp3zfm0bq/WFyAHR52ypmX9P6KsyercHiUQj/L/NdxoMut/tZ5tXx26VBa2q1MYiHeAjWJY3em1SfdCSnRk=
X-Received: by 2002:a05:6870:568b:b0:25d:1a2f:cd53 with SMTP id
 586e51a60fabf-25d1a2fdacemr15102477fac.53.1719542524495; Thu, 27 Jun 2024
 19:42:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
 <CACGkMEt-Ep+At_4YvkJ2t8UmQHJ0-Qm6fAPbGpkV_AfVyNq2EA@mail.gmail.com>
 <ed07e9bb9ae5bc1a171c77425cc0b96e6b87745c.camel@redhat.com>
 <CACGkMEvD_WDN5yeRKcZ2ijRF8C2_Pmr6UZWMNt+_R6S0WHY5Fg@mail.gmail.com> <e5d885e6331b18b3be63facfd59658b316f20de1.camel@redhat.com>
In-Reply-To: <e5d885e6331b18b3be63facfd59658b316f20de1.camel@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 28 Jun 2024 10:41:53 +0800
Message-ID: <CACGkMEsbiN90ptOL2XHauzWS=9j5RXtnO7OD10yChPaUO3CY_A@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 1:35=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On Tue, 2024-06-25 at 16:28 +0800, Jason Wang wrote:
> > On Mon, Jun 24, 2024 at 11:47=E2=80=AFPM Paolo Abeni <pabeni@redhat.com=
> wrote:
> >
> > > > > +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (49)] Device can receive =
GSO packets
> > > > > +  carried by an UDP tunnel.
> > > > > +
> > > > > +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_CSUM (50)] Device handles pac=
kets
> > > > > +  carried by an UDP tunnel with partial csum for the outer heade=
r.
> > > > > +
> > > > >  \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header=
 hash for encapsulated packets.
> > > > >
> > > > >  \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue n=
otification coalescing.
> > > > > @@ -133,12 +145,18 @@ \subsubsection{Feature bit requirements}\la=
bel{sec:Device Types / Network Device
> > > > >  \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
> > > > >  \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
> > > > >  \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> > > > > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_G=
UEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
> > > > > +   VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6.
> > > >
> > > > For "or" I think you meant "and" actually?
> > >
> > > No, just any (one) of the above options is sufficient for UDP tunnel
> > > GSO sake. Why do you want to mandate all of them?
> >
> > For example, does it mean if there's only VIRTIO_NET_F_GUEST_USO4, the
> > driver still supports tunnel offloading over UDPv6? This sounds a
> > little bit strange.
>
> I did not look to the things from such perspective. I agree it would be
> cleaner to require:
>         both VIRTIO_NET_F_GUEST_TSO4 and VIRTIO_NET_F_GUEST_TSO6 or
>         both VIRTIO_NET_F_GUEST_USO4 and VIRTIO_NET_F_GUEST_USO6
>
> > > >
> > > > > @@ -423,6 +455,10 @@ \subsection{Device Operation}\label{sec:Devi=
ce Types / Network Device / Device O
> > > > >          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPOR=
T negotiated)
> > > > >          le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPOR=
T negotiated)
> > > > >          le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPOR=
T negotiated)
> > > > > +        le16 outer_th_offset;   (Only if VIRTIO_NET_F_HOST_UDP_T=
UNNEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> > > > > +        le16 inner_protocol;    (Only if VIRTIO_NET_F_HOST_UDP_T=
UNNEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> > > > > +        le16 inner_mac_offset;  (Only if VIRTIO_NET_F_HOST_UDP_T=
UNNEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> > > > > +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_T=
UNNEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> > > > >  };
> > > > >  \end{lstlisting}
> > > > >
> > > > > @@ -480,6 +516,8 @@ \subsubsection{Packet Transmission}\label{sec=
:Device Types / Network Device / De
> > > > >  followed by the TCP header (with the TCP checksum field 16 bytes
> > > > >  into that header). \field{csum_start} will be 14+20 =3D 34 (the =
TCP
> > > > >  checksum includes the header), and \field{csum_offset} will be 1=
6.
> > > > > +If the given packets has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit s=
et,
> > > > > +the above checksum fields refer to the inner header checksum.
> > > >
> > > > Rethink of the design here, I have one dumb question:
> > > >
> > > > A simple csum_start/csum_offset can work for GSO without tunneling.
> > > > Any reason a inner_csum_start/inner_csum_offset (or simply introduc=
e a
> > > > copies of other gso related fields in the existing vnet header for
> > > > outer packet) can't work for tunneling GSO? I feel if we need to do
> > > > thing differently it might a hint of bugs for existing GSO
> > > > definitions.
> > >
> > > Yes, the outer csum offload could work even without requiring the UDP
> > > tunnel GSO support but:
> > > - AFAIK H/W support for outer csum offload is not as widespread as
> > > other offload, it will restrict a lot the feasibility of H/W
> > > implementation backing this spec.
> > > - computing the outer csum given the presence of the inner one is ver=
y
> > > cheap in S/W - because thanks to LCO the S/W needs to touch only a ve=
ry
> > > limited number of bytes to compute it.
> > >
> > > I can explicitly mention the above in the commit message of the next
> > > revision.
> >
> > Just to make sure we are on the same page. I basically meant:
> >
> > Without UDP tunneling, GSO works with simple csum_start/csum_offset.
> > It doesn't require things like mac/network offset.
> > With UDP tunneling, can we just invent
> > inner_csum_start/inner_csum_offset to make things just work?
>
> Note for UDP tunneling should be 'outer_csum_start' (as 'csum_start'
> refers to the inner header) and 'outer_csum_offset' will not be needed,
> as we know that the outer header is an UDP one.

You meant it is implied by VIRTIO_NET_HDR_GSO_UDP_TUNNEL? Probably but
we also had the case for VIRTIO_NET_HDR_GSO_UDP.

>
> I (mis?)understood from the discussion on previous revisions that you
> are against additional parsing.
>
> Using inner_csum_start only, will require such thing and will possibly
> be not enough to support Willen's use-case with no inner mac header.
>
> Note that plain GSO leverages the fact that the mac address is known to
> be an ethernet one, while the UDP tunnel GSO has an additional variable
> in the tunnel header length.

Yes.

>
> Dropping the support for the use-case with no inner mac header, and
> enforcing that the inner mac header must always be an ethernet one, the
> following fields will suffice:
> - outer transport header offset (or, if you prefer 'outer_csum_start')

csum start seems to be more consistent with existing fields.
Personally I prefer to stick to the existing fields for outer. But if
others are all fine with introducing new fields for outer, I'm fine.

> - inner mac header offset (because we can't locate it in any robust way
> even with parsing)

I see, so the point is to make it protocol independent. Then we end up
with an interesting situation:

1) we try to make tunnel GSO to be protocol independent
2) but it depends on the outer GSO when is not very clear that it is
protocol independent or not

I wonder if we should introduce the PISO for GSO first (new fields)
and build the tunnel GSO on top? (Or it might be an overkill?)

>
> Note that with that we will need an additional spec change (adding more
> fields) to support UDP tunnel GSO with no inner mac header.

Yes.

>
> If there is concern with the increased virtio_net_hdr size, what about
> to add the new fields only if the  VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit is
> set? that is, if UDP tunnel GSO support is negotiated _and_ the current
> packet is a UDP tunnel GSO one.

I think it's fine to increase virtio_net_hdr_size, and In the future
we may embed it into the descriptor.

>
> That will make the virtio_net_hdr len packet-dependent, could be a
> problem for H/W implementation?

We can hear from others.

>
> Cheers,
>
> Paolo
>

Thanks

