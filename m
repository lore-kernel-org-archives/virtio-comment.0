Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E456171CC
	for <virtio-comment@lists.linux.dev>; Mon,  1 Jul 2024 03:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719802960; cv=none; b=IhRlEuu+ft2pEQDGaopgkSV8sySqfH9vbztnLTv+x26ELTDI/4CNO13cpv5+isVAz7G/h/+hMy/ddVuMfWpaHUtksXvw5nvDVOiWRblrtlizx2xoVG5Dwvzxb2Yth5h/Gig+k4lVJQKMx3XILmJVr54XoNqYGeruhr3WMXTA5kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719802960; c=relaxed/simple;
	bh=UjM+hstgq5nqqt68ovOVekZmey38+9tupI/zxJrbwP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cAoFATsKoNCFq59FKG0vt01x6hKK0upASipwKw8BsPOvVlX+YMbSztob+J5B1sgcJwQa7XkAVDMM8g9axSPyrnRf7OyD4RuSzYL9BtIyojVqQh2Y35Kg6lXRh/4JhFsSoleM2KpL3XdgJ+VQ/bvkvH/sVnZWOe6loeGhGEAhGpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D+T/ceJE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D+T/ceJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719802957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pGjgz5FkGRv8vVR5aqcy6Iy3ShNhDf2fA7xC2njEiSo=;
	b=D+T/ceJEYIROjFNn09xCnDsbtnkHgGadLbMTvQcndl9U+ENFvqSJrf0/FdjniBCGwFM4Sp
	XoLPaxpVSvO9qBlBz1t+hjmQLBtLwjblNWDo5XbSOxiJN/tbz7YTCMpjmX3QmH0LiqQdgp
	IK+V61LGcEtQ/QLf6Pg/3245S0WzHH8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-rbqMjZgCPQ6XrE5gu3YW9w-1; Sun, 30 Jun 2024 23:02:36 -0400
X-MC-Unique: rbqMjZgCPQ6XrE5gu3YW9w-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2c9343025cbso1275995a91.0
        for <virtio-comment@lists.linux.dev>; Sun, 30 Jun 2024 20:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719802954; x=1720407754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGjgz5FkGRv8vVR5aqcy6Iy3ShNhDf2fA7xC2njEiSo=;
        b=jH1u/GiT8doIObbJfHmdjb1Bg6fTrp/2eLvuCuUTiBz8+ObRYtFW7EVvb/wUmbYrmq
         /cSjI9Xr1N/9np+yYAUYXi7wqiAcG7wtFJPEEmJl/i5zwxmbGIf+iko/wNlInWb1iKUN
         pqRqUPgZrkWB/A0kXJgLPzg1wlJkBsNiOp5WbekoWjfRHckZp8l0Lh8JrDFY/Z9KB6I2
         bxU7UYROMQMJte0xPL2asp5DdqGDbb5ZvOwhNwWETOe3VywVo+PMEQmWCFRTLJgmRVpo
         QrVekP+4YuMpRNjxPqpulq2aprxDtQwEm/UYCTK0JX5ySGVYCWacytgvbXqGoQHDWtB/
         CUXA==
X-Forwarded-Encrypted: i=1; AJvYcCWy1r3fuOX4FCaokWXkwCHgzFLEz1FmLEFn0OAZ4WSbJy9OaGw3zYJI00Iad8M6HcgXd8BpE90ikApwt+GvXJ4/yvoY4U0tYMcna6sao7U=
X-Gm-Message-State: AOJu0YzVo5D6v6aB1dOreoIL6GmJIq580UKPuvk5EtLk3P2Kd4UiHTpN
	4ROYlvC+xb0PwziBUEPV2na0Wk8VnwwJIM19smqjuENVaZkGaepglUPU9YsIdKEJIYK7Ikt5i8t
	OCXMY+CjY9T1GPFbwe5iHvUr/vWzougVXMoDWzsxOfO+I0jnCSTKz3ObCtawcFBPo1QkddveuSg
	uzHH0UMJgty3hEWJpbpdvZxPqCdD1U4aBk/d2saGkmdzeJyUs=
X-Received: by 2002:a17:90a:d60b:b0:2c4:f5ad:c34b with SMTP id 98e67ed59e1d1-2c93d70b906mr1908184a91.28.1719802954261;
        Sun, 30 Jun 2024 20:02:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ1uiT/gX90HRr6Em1bHsbBAKaVZuIbTBAist3APSo6PN+fGjMT8oEQSdr5ZgibQyzBGSGhLcnLrk1SoY4zyg=
X-Received: by 2002:a17:90a:d60b:b0:2c4:f5ad:c34b with SMTP id
 98e67ed59e1d1-2c93d70b906mr1908164a91.28.1719802953729; Sun, 30 Jun 2024
 20:02:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
 <CACGkMEt-Ep+At_4YvkJ2t8UmQHJ0-Qm6fAPbGpkV_AfVyNq2EA@mail.gmail.com>
 <ed07e9bb9ae5bc1a171c77425cc0b96e6b87745c.camel@redhat.com>
 <CACGkMEvD_WDN5yeRKcZ2ijRF8C2_Pmr6UZWMNt+_R6S0WHY5Fg@mail.gmail.com>
 <e5d885e6331b18b3be63facfd59658b316f20de1.camel@redhat.com>
 <CACGkMEsbiN90ptOL2XHauzWS=9j5RXtnO7OD10yChPaUO3CY_A@mail.gmail.com> <2f1c19591ff456ada2a1ad470032d3e3fb9f88d7.camel@redhat.com>
In-Reply-To: <2f1c19591ff456ada2a1ad470032d3e3fb9f88d7.camel@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 1 Jul 2024 11:02:22 +0800
Message-ID: <CACGkMEv9gGrLO0OkHYKmjqrLw50kfm2yaifMk1wnb6noa5L99w@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Michael Tsirkin <mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 5:51=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On Fri, 2024-06-28 at 10:41 +0800, Jason Wang wrote:
> > On Wed, Jun 26, 2024 at 1:35=E2=80=AFAM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> > > On Tue, 2024-06-25 at 16:28 +0800, Jason Wang wrote:
> > >
> > > > Without UDP tunneling, GSO works with simple csum_start/csum_offset=
.
> > > > It doesn't require things like mac/network offset.
> > > > With UDP tunneling, can we just invent
> > > > inner_csum_start/inner_csum_offset to make things just work?
> > >
> > > Note for UDP tunneling should be 'outer_csum_start' (as 'csum_start'
> > > refers to the inner header) and 'outer_csum_offset' will not be neede=
d,
> > > as we know that the outer header is an UDP one.
> >
> > You meant it is implied by VIRTIO_NET_HDR_GSO_UDP_TUNNEL? Probably but
> > we also had the case for VIRTIO_NET_HDR_GSO_UDP.
>
> Possibly did you mean VIRTIO_NET_HDR_GSO_UDP_L4?

Both I think.

> I think that is quite
> a different thing: such offload was added when the
> csum_start/csum_offset field already existed, I guess it was far easier
> to reuse the virtio net header as is, instead of _deleting_ an unused
> field for that specific gso type?!?

We probably don't need to delete it. We can just leave it unused if
it's the case.

>
> To do UDP tunnel GSO we need new fields. Do I understand correctly that
> there is concern about adding "too much" new fields?

Nope, I just want to know the reason why those fields were not
required for non-tunnel GSO.

For example, for non tunnel GSO, we have:

gso_type: indicates the protocol of the transport
csum_start/csum_offset: transport offset and the offset of transport checks=
um

It seems the device can't do segmentation solely with the above three
without parsing as TCP has variable options. The device needs to
understand the TCP options and replicate it in each segment. So:

- L2/L3 seems to be protocol independent. E.g it works for 802.1Q. (Or
if I was wrong then it should have some assumptions on the L2/L3
protocol)
- L4 is not protocol independent, e.g we had gso_type and TCP options
(Or without a payload_start?)

So the current (non tunneling) GSO is not protocol independent.

For tunnel GSO, this proposal introduces:

inner_protocol: inner ethernet type
inner_mac_offset: inner mac header
inner_nh_offset: inner network header

This gives me the impression that the tunnel GSO (at least the inner
part) wants to be protocol independent. This is fine but I don't fully
understand why the above is needed. For example, why do we need to
know about the inner_protocol?

> if so we should
> avoid introducing 'outer_csum_offset' as it carries no useful
> information. FTR: I think we *should* be concerned about the
> virtio_net_header size increase, as it will be bad for performances.

I agree we should be careful but it should be fine as long as we don't
exceed the cache line size.

>
> >
> > > Dropping the support for the use-case with no inner mac header, and
> > > enforcing that the inner mac header must always be an ethernet one, t=
he
> > > following fields will suffice:
> > > - outer transport header offset (or, if you prefer 'outer_csum_start'=
)
> >
> > csum start seems to be more consistent with existing fields.
> > Personally I prefer to stick to the existing fields for outer.
>
> I'm unsure if I read the above correctly. AFAICS you are suggesting to
> re-use the existing fields for the outer header and add new ones for
> the inner header, am I correct?

Yes.

>
> Note that the outer checksum is optional - the outer UDP csum can be 0.
>
> AFAICT using csum_start for the outer csum will be a bad choice as we
> will need to change the handling of such field depending on the
> gso_type and the s/w implementation will be more complex and likely
> more bug prone.

Not sure I understand here, but I'm not sure if it's too late to
change that. As stated, we may introduce a new robust GSO to replace
it anyhow.

>
> > But if
> > others are all fine with introducing new fields for outer, I'm fine.
> >
> > > - inner mac header offset (because we can't locate it in any robust w=
ay
> > > even with parsing)
> >
> > I see, so the point is to make it protocol independent. Then we end up
> > with an interesting situation:
> >
> > 1) we try to make tunnel GSO to be protocol independent
> > 2) but it depends on the outer GSO when is not very clear that it is
> > protocol independent or not
>
> Note that the inner mac header offset can change on a per packet basis
> even if the UDP tunnel protocol stay constant/is fixed. e.g. if the
> tunnel protocol is geneve, different packets can have different geneve
> options and thus different inner mac header offset.

Exactly. My point is (I may miss something obvious) why should we care
about mac header offset when we are doing segmentation? For the
content from outer payload start to inner transport start
(inner_csum_start), the device can just replicate without worrying
about what it has.

>
> I don't understand the point 2) above. We need some new fields to carry
> the information need for UDP tunnel GSO. How that relates to the
> protocol independence? We need such fields regardless of the protocol,
> unless we want to resort to parsing all the way from the outer mac to
> the inner transport.

I think we're talking about the same thing, try to avoid unnecessary
parsing. So I mean, we don't need to parse from outer transport
payload start to inner csum_start. That's why I don't get why we need
inner_mac/nh/ether_type.

>
> > I wonder if we should introduce the PISO for GSO first (new fields)
> > and build the tunnel GSO on top? (Or it might be an overkill?)
>
> I'm not sure if PISO is suitable for the virtio net use case.
>
> e.g. the virtio driver rx side must be able to fully reconstruct the
> GSO information for later S/W segmentation, if needed.
>
> With PISO the outer headers and the encap info are lost, the received
> PSIO GSO packet will be corrupted at any later S/W segmentation.
>
> The above problem does not affect H/W nics implementing PISO sending
> the segmented packets on the wire, as the other end is going to fully
> parse the incoming packets.
>
> @Willem, feel free to correct the above statements as needed.

Yes, I think we need clarification from Willem.

>
> Let me voice my biggest concern. I feel like we are not making any
> progress in the forward direction. The initial design was sound enough
> to build a working PoC.

Yes.

> The current design is completely fuzzy to me.

This is not what I want.

> I
> would be great if we could start setting some details.

Spec change might be more careful as the vendor may just start the
implementation so I want to make sure there's no unnecessary fields.

> e.g. do we want to avoid parsing if possible?

This is a good question. See my reply before. At least current GSO
designs try to avoid parsing at some layers.

I understand the motivation of introducing inner_nh/mac is to avoid
parsing but I want to know if those are needed for doing segmentation.

>  do we want to minimize
> new fields introduction?

I think we need a balance between the minimization and how easily it
could be implemented by device.

> can the virtio net header layout be 'gso_type'
> dependent?

I don't get this question. Did you mean a completely new header format
other than the current one? I think the answer is yes if it has
sufficient justification but it requires a new feature.

>
> Do you think a video call would help ruling out some details? if so
> please let me know if/when you are available, I'll try to set it up.

It might be, but let's hear from more people then we can decide if it
is needed or not.

Adding Michael here.

Thanks

>
> Thanks,
>
> Paolo
>

