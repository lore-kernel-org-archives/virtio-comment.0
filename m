Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94121B580F
	for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 14:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722435977; cv=none; b=MwhToyVEGvxXD1NCV8M2mDRw559nmyBZtZIOiIRQXaW0bbNm2qJEgwzVhBRAAXgBhS1fMK/lY583m7ZetGqVH8yxLNlWu6Kp/aHIbO3qR+te8dg/UEzcN3cv81ONAun/NGtziZfqs11qvBdBAEP27Q+zsjqaz6PAMMFAlVQPvuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722435977; c=relaxed/simple;
	bh=I3Kl83AJyzAJHaiuOzN3Yb49Bw0lnR8HVqhMnn5rNh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f5/87k9tSVSbxoF5hzDJ3Xh6AADrLN4CB17WsH2HGPkEChiBBuzvaKGslOWxG5QqBw1+esaK5NHs6lA4LpUZ4RbIxMUK2sl9vIn8ULPi65iff3RmvCn1zNy3zxnTNwBk1/l6GdV4IqAiRe4J04S4buA/pvHDCOK/6YvPo/e6b2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UkQ7m+iv; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UkQ7m+iv"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-44fee2bfd28so347961cf.1
        for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 07:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722435974; x=1723040774; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvY71T7K2kRuQfKaYU+zcsXgBL8JYJn1tm21+a3Flrw=;
        b=UkQ7m+ivlhQX4kpxziFUoeQGb4JjNbZxka5V/fm76QNECXO7uRY6EucO32XUMCdjQT
         yccUJqJVJxibSe5jwoKqsoxIxP4vJ8SOrtZhlGZXfCy/llzBfo/LDKzo4LHBFFDSMfqD
         G7MC+Wyhq6EWfysxeqRmIScTreIffo2vJcZgLrLv2D26U9l3XwUk95huJ5LG4aD5YX+L
         QJByNuuHOESYtQ/yL71x8UMFUYUGt8h2scN8/qqxXQJ6RuY4DpkEShFnTtTjA/Zf3ksx
         h9tB22kxx6aDhUUZ/SGqERjdLu+7OPI5YeqbXPwkpJNj/36jt5LXXYwSCpSvDaHL7Yts
         Ckkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722435974; x=1723040774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KvY71T7K2kRuQfKaYU+zcsXgBL8JYJn1tm21+a3Flrw=;
        b=LsHcEoEFdS2+kadUwbMX85ZCfiwBUjUuRxWmlGMhgW3w/IWpi2d7/LAkpRRjFjpfsk
         N4fX6XsfxnEi8eaoGtObdwUB3IUGuG6UwDS3+AlobpoSDan5cLcb0PiZ4tjQI4Y4U9mu
         UtmU0Mvoe2NLuQxPe4jw1ilamm2t0jTUhTOn80TfSBXg8/NWCJzQ1EYNZfY0AxHylIDV
         KjNB6OJcyVDuTy8gIbLYMt08ZAVMNVnxkY4K9g7Q4zG7/L1t/sgpbTGk2ScEf1Qb3qTc
         u0a1jryAUQu8xTY6C+0iMF+rkQfRk7q4GZSQ7FWPf8tIb6l9ZT2iBqhm07pw7T5PUpqz
         glqw==
X-Forwarded-Encrypted: i=1; AJvYcCXAwjhakJcpT6PaAUv4MSqeXVWoksbvUMqHQuvqQnrCsqEhITyhaHJju7ivcPJfM9+nvCbWZs7AUQoeMaXCQbIEqdLNlPqUUZQ+t5aOqP0=
X-Gm-Message-State: AOJu0Yx5sxh4G6obxEzM4z35htAI9tAX1JJvb9sf5sIo/z/g/Vgcc1W8
	9kCyOPYwf7XNpmA8V+ypvH73ByANnxJoKoiO3UEn6l8ddNcNoXpXehUGrA1F2EkQqS/PHi+lkBA
	IfwMnuWrtmVYPx5SL+JJplZWJ11kj000tr3D+
X-Google-Smtp-Source: AGHT+IEfjpdXo5OHpB6a6DsEWmZqrTusYOs8kHpD83IYOa8Jsi2hQtkLHx20LBOjaLXjhHkmDDR5xy0H4oSps/ceaM4=
X-Received: by 2002:ac8:5f4e:0:b0:447:e01a:de95 with SMTP id
 d75a77b69052e-450416eb227mr3496461cf.0.1722435974223; Wed, 31 Jul 2024
 07:26:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1722252302.git.pabeni@redhat.com> <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
 <CA+FuTSfu8Sys_s+3jpXoS0GbZC4stOVgBrEYOtA9YoTCEJkJAA@mail.gmail.com>
 <d79c4ed9-c1d5-4c9c-9f10-661745edf96c@redhat.com> <CACGkMEu6dnKOgYVYRWKadXirnk4R6Rc16ojNR=oSX-a22Rt4OA@mail.gmail.com>
In-Reply-To: <CACGkMEu6dnKOgYVYRWKadXirnk4R6Rc16ojNR=oSX-a22Rt4OA@mail.gmail.com>
From: Willem de Bruijn <willemb@google.com>
Date: Wed, 31 Jul 2024 10:25:34 -0400
Message-ID: <CA+FuTScr26P+QtPfWKzD1zzadKiZ3zRs75KC1ycexdQRAQ0XuQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Jason Wang <jasowang@redhat.com>
Cc: Paolo Abeni <pabeni@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 12:11=E2=80=AFAM Jason Wang <jasowang@redhat.com> w=
rote:
>
> On Tue, Jul 30, 2024 at 3:33=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> w=
rote:
> >
> > On 7/29/24 23:04, Willem de Bruijn wrote:
> > > You have a working software implementation, right? Will this be sent
> > > (as RFC) to the public netdev or so mailing list before this becomes =
a
> > > standard? I assume that there is a standard process for virtio that
> > > you are following. I'd just be more confident in a thumbs up if we
> > > also review the code that implements the text.
> >
> > My plan is to write the S/W virtio_net implementation, too, but it's
> > currently not ready. I had a working PoC for the first draft of this
> > changeset, long time ago. Things are changed enough that I'll need a
> > rewrite. I can try to shared such a thing on netdev ASAP (where "soon"
> > here is a very relative terms ;)
> >
> > Also I don't know the standardization process. I hope for some guidance
> > from Jason and/or Michael.
>
> It should be something like this. When there's no future comment, open
> an issue https://github.com/oasis-tcs/virtio-spec/issues and ask for a
> vote. When it passes the voting, it would be merged.

So changes to the spec can be merged, because we know that they can be
implemented reasonably?

IETF always requires (two, because interoperable protocol definitions)
working implementations.

It sounds a bit risky to me to skip this, as you come across the interestin=
g
non-obvious details during implementation.

Since implementation is planned anyway, doing at least a rough proof of
concept first does not introduce extra work, but reduces risk that the spec
contains errors.

Unless it is easy to update the spec before it is numbered and finalized.
Then issues can be fixed up.

Anyway, you have gone through this many times, so whatever the process
is, I trust that it works. Just sharing my thought as a somewhat uniformed
reader.

>
> >
> > >
> > >> @@ -423,6 +441,9 @@ \subsection{Device Operation}\label{sec:Device T=
ypes / Network Device / Device O
> > >>           le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT =
negotiated)
> > >>           le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT =
negotiated)
> > >>           le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT =
negotiated)
> > >> +        le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNN=
EL_GSO negotiated)
> > >> +        le16 inner_protocol_type;(Only if VIRTIO_NET_F_HOST_UDP_TUN=
NEL_GSO negotiated)
> > >> +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNN=
EL_GSO negotiated)
> > >>   };
> > >
> > > In relation to the above: I recall that expanding the virtio_net_hdr
> > > was non-trivial when I last tried to add fields ("[rfc,2/3]
> > > virtio-net: support receive timestamp"). If that is the experience
> > > again, it might be worthwhile to expand with enough space to also
> > > accommodate a few subsequent extensions. Headroom is not that
> > > expensive.
> >
>
> Yes, but it looks like an independent issue for this.

If this change requires new headroom, then it depends on headroom expansion=
.

My suggestion is to then expand it significantly immediately, to minimize t=
he
number of times we have to change the virtio_net code to support new length=
s.

We already have structs virtio_net_hdr, virtio_net_hdr_mrg_rxbuf,
virtio_net_hdr_v1, virtio_net_hdr_v1_hash.

Adding a new struct with every new field added just adds lots of churn in
the code.

Just a thought, feel free to skip if the maintainers disagree.


>
> > Do you mean, by adding 'padding' or 'unused' fields?

Yes.

> >
> > Side note: the above is not 32 bit aligned, do we need such aligment?
>
> Maybe, but it should be an independent topic.
>
> > If we would have VIRTIO_NET_HDR_GSO_UDPv4_L4 and
> > VIRTIO_NET_HDR_GSO_UDPv6_L4 variants, we could avoid entirely
> > 'inner_protocol_type', as the network protocol will be implied by the
> > GSO type itself.

But that's too late now? Probably don't want to make this work
depending on such a change.

I don't entirely recall why we did not do that immediately. Perhaps
it is related to also only having SKB_GSO_UDP_L4.
