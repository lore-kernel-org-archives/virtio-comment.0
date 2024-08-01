Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C681113
	for <virtio-comment@lists.linux.dev>; Thu,  1 Aug 2024 02:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722479112; cv=none; b=TUIvxoNzZaOJ/PDwtbkLA3EM7EWKDlz9w2AN3ueEElCuL+xQqMW1roDnUZOV32AyF4oVR5lzbx+JovYQ2f2kTS7Omw28fIaJ67LB4GCftmacmOQDfbn1vj7M9eYdJ1zboOp1wpwT9AfnNKI5Tq69FB2D26sks55vqN8PEBGv2Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722479112; c=relaxed/simple;
	bh=HsWtB+lalqAq4pa/7dt6+Ta8YjOHVsrd1P7AVQi5eRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qaq3oER3gpXD6gAGnnbeyXLnw8odM+9OuII1PwMtV4kQST42uIVt54A9Cz4fphs0Hr5fmYXni5zYltZUzqctl4SAgFooUezrB+tlY1DnxrNP3b7WtK5ZW+1m4eQ5APedE9C3vvNxBkcZyXY04HhOVjKIWCpt1blF4q6TB8iQHGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QH1fnrxX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QH1fnrxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722479108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tk7f52MyX0BYbsHBvqdHolNrvvI4koXN1yjaA1o+Ptw=;
	b=QH1fnrxXMZfUYyo5j9eMsc2r0YKRGdQ5jM5GYQnFQ1sBi5NYF2UwR9OK8nu8J8S0oMCHHc
	Hhg73VLZHOc96u386x2J52vPDPsx2zYK0zygG/6Z1VK+RfxqMScQ85c8+zAkoSVPBxu3c8
	Di5xAt8klEaepJ11lxSc1MC/9AnOHiU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-iwLIy709N9OwW4nl4vGERQ-1; Wed, 31 Jul 2024 22:25:06 -0400
X-MC-Unique: iwLIy709N9OwW4nl4vGERQ-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2cfe9270d82so365640a91.3
        for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 19:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722479105; x=1723083905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tk7f52MyX0BYbsHBvqdHolNrvvI4koXN1yjaA1o+Ptw=;
        b=FCRrynWSPM0uPlW6CJnIvPO4+/z4zJk2nBaIZbIJ835Sk/qNCCSCPoyCmzDrWJGBKA
         GqsMIQ0sXw9fMXlP4n19Wb8n3MF31JpDPE6FKQIogymoprUkJ7IFzDcrjCPn7kpDkFqu
         l+T8DkUXBJB2TsDMpL9D2rMzT+GNyjtSQsS2iJFneqNFlxx9toUc1l8eq+PisM62beEL
         7oApLCERGipLLVOukG/a1rDdPrzMYrlZhV9hWCOxIDhulX5uPJniHe1qAfE003BSOFpp
         4oOPsIMffhRJem/UIhVvWbUWwbvAqbB6tGn3XEibwgGfvU8duSLKMO/zrORfdzIExxQc
         wV9g==
X-Forwarded-Encrypted: i=1; AJvYcCXMXHYXVHYr59zhaNHtOdFhc8nc2s7ZBxjXQoE82xzh2zTGHdK3yo0YKkBfjHRI2fxVSdhCpjHLgrQkjW93TKjaq20vgGCv1FMzBhcV15Q=
X-Gm-Message-State: AOJu0YxDcb6JXADqXlGU9CjvJzXQt6E/QJWHedAK+RWOiDPmuCa2B8O6
	iXhiXgcnM1AJ/A39envLYnKgYkMEn+s7fwJS8Bxl1xr1gVAFJTM2Iwi6gU3816E9fkLZszAxejl
	wNnvUIUHI1E5CsoeqPx9/O/odB3qZgi4TROvcUTdlquNnF65l1DfPhBcmFcPod8ZU3TbHR8sm4R
	h2f5D60Et4Iyc00vOfPbZIsE0BGBEnn9SZwfkUxLM1QmfAVzLAOutd
X-Received: by 2002:a17:90a:7081:b0:2c9:719f:b04b with SMTP id 98e67ed59e1d1-2cfe7b6fd0cmr1312689a91.29.1722479104994;
        Wed, 31 Jul 2024 19:25:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX8l8QpTi4pK27JZB8n8B8npkax58G2g4Jc+k2SUfq/4AfhQr3wUq/MUD40GiGSOT/miGpGFt1qdUIdLbMYZo=
X-Received: by 2002:a17:90a:7081:b0:2c9:719f:b04b with SMTP id
 98e67ed59e1d1-2cfe7b6fd0cmr1312664a91.29.1722479104387; Wed, 31 Jul 2024
 19:25:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1722252302.git.pabeni@redhat.com> <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
 <CA+FuTSfu8Sys_s+3jpXoS0GbZC4stOVgBrEYOtA9YoTCEJkJAA@mail.gmail.com>
 <d79c4ed9-c1d5-4c9c-9f10-661745edf96c@redhat.com> <CACGkMEu6dnKOgYVYRWKadXirnk4R6Rc16ojNR=oSX-a22Rt4OA@mail.gmail.com>
 <CA+FuTScr26P+QtPfWKzD1zzadKiZ3zRs75KC1ycexdQRAQ0XuQ@mail.gmail.com>
In-Reply-To: <CA+FuTScr26P+QtPfWKzD1zzadKiZ3zRs75KC1ycexdQRAQ0XuQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 1 Aug 2024 10:24:53 +0800
Message-ID: <CACGkMEvRp6Mf7cXV6dJyrMXh3SoH_m16J61bWZ9pKce-kr1PxA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Willem de Bruijn <willemb@google.com>
Cc: Paolo Abeni <pabeni@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 10:26=E2=80=AFPM Willem de Bruijn <willemb@google.c=
om> wrote:
>
> On Wed, Jul 31, 2024 at 12:11=E2=80=AFAM Jason Wang <jasowang@redhat.com>=
 wrote:
> >
> > On Tue, Jul 30, 2024 at 3:33=E2=80=AFPM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> > >
> > > On 7/29/24 23:04, Willem de Bruijn wrote:
> > > > You have a working software implementation, right? Will this be sen=
t
> > > > (as RFC) to the public netdev or so mailing list before this become=
s a
> > > > standard? I assume that there is a standard process for virtio that
> > > > you are following. I'd just be more confident in a thumbs up if we
> > > > also review the code that implements the text.
> > >
> > > My plan is to write the S/W virtio_net implementation, too, but it's
> > > currently not ready. I had a working PoC for the first draft of this
> > > changeset, long time ago. Things are changed enough that I'll need a
> > > rewrite. I can try to shared such a thing on netdev ASAP (where "soon=
"
> > > here is a very relative terms ;)
> > >
> > > Also I don't know the standardization process. I hope for some guidan=
ce
> > > from Jason and/or Michael.
> >
> > It should be something like this. When there's no future comment, open
> > an issue https://github.com/oasis-tcs/virtio-spec/issues and ask for a
> > vote. When it passes the voting, it would be merged.
>
> So changes to the spec can be merged, because we know that they can be
> implemented reasonably?

This seems to be how it works now.

>
> IETF always requires (two, because interoperable protocol definitions)
> working implementations.
>
> It sounds a bit risky to me to skip this, as you come across the interest=
ing
> non-obvious details during implementation.
>
> Since implementation is planned anyway, doing at least a rough proof of
> concept first does not introduce extra work, but reduces risk that the sp=
ec
> contains errors.

Exactly and we have already had qemu which fits for that purpose. A
lot of hardware was prototyped in that way (for example, rocker fbnic
etc).

>
> Unless it is easy to update the spec before it is numbered and finalized.
> Then issues can be fixed up.
>
> Anyway, you have gone through this many times, so whatever the process
> is, I trust that it works. Just sharing my thought as a somewhat uniforme=
d
> reader.

I fully agree with you. In the long debate of the live migration
series, I point out we need a prototype for features that requires
huge changes. But I don't get sufficient feedback for that.

>
> >
> > >
> > > >
> > > >> @@ -423,6 +441,9 @@ \subsection{Device Operation}\label{sec:Device=
 Types / Network Device / Device O
> > > >>           le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPOR=
T negotiated)
> > > >>           le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPOR=
T negotiated)
> > > >>           le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPOR=
T negotiated)
> > > >> +        le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TU=
NNEL_GSO negotiated)
> > > >> +        le16 inner_protocol_type;(Only if VIRTIO_NET_F_HOST_UDP_T=
UNNEL_GSO negotiated)
> > > >> +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TU=
NNEL_GSO negotiated)
> > > >>   };
> > > >
> > > > In relation to the above: I recall that expanding the virtio_net_hd=
r
> > > > was non-trivial when I last tried to add fields ("[rfc,2/3]
> > > > virtio-net: support receive timestamp"). If that is the experience
> > > > again, it might be worthwhile to expand with enough space to also
> > > > accommodate a few subsequent extensions. Headroom is not that
> > > > expensive.
> > >
> >
> > Yes, but it looks like an independent issue for this.
>
> If this change requires new headroom, then it depends on headroom expansi=
on.
>
> My suggestion is to then expand it significantly immediately, to minimize=
 the
> number of times we have to change the virtio_net code to support new leng=
ths.
>
> We already have structs virtio_net_hdr, virtio_net_hdr_mrg_rxbuf,
> virtio_net_hdr_v1, virtio_net_hdr_v1_hash.
>
> Adding a new struct with every new field added just adds lots of churn in
> the code.
>
> Just a thought, feel free to skip if the maintainers disagree.
>

I think I agree with that, but I meant it's better to not make UDP
tunnel series depending on that.

Thanks

