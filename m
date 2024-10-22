Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3270A14F108
	for <virtio-comment@lists.linux.dev>; Tue, 22 Oct 2024 07:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729582946; cv=none; b=fKGEVqVoxWBz/z84zHH7qouVQqbfNIdzaDDQmV+fPifCj9r/UUem6BhN71hg96+kbjS+wfYC+JdCxTTnq4XY8oPJtcKyAvWY59b1JNAYFwm9zgZiPAcAF2b/N5Tq8YAQtbCmEx3LMlfQwOXTf9XlJTOLcP8ngJcpw3lq2apfkxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729582946; c=relaxed/simple;
	bh=FuVZd6WgzRhZ6TXjkURYsguC7D04IzZ5auL5dHrWuWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALCFKXe8giql7mp3ubPpHN1qGN9gc9YdvK62mjOEmloLSbfoC784xHh9quMHEijHYQh47Wu0abmqHKc+sQr1EQuM90nKUenwXjgXo014OJl6bKv3HtSlVfKTCwhroQFH6IwZCDKV8tnPtmhzVzcuo2mjLsD4AsRMCc8mv1d6kOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZhvF5w20; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZhvF5w20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729582943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KNe5vhWAVj7Yet+EjDMql+eMSpNAJPtmOjSdo/6eFQU=;
	b=ZhvF5w20KumO8vQuED1DSUc8G55wyCS7TsJe9W4kBHW1tbqD/mPh0EV02jSH/2JcOpdS15
	w0T9o6wwd2RojooOfYRxNjU8qGSPdYQsoJuOniIbvhFd7lHDyuQi5IQ47JfbeqOcKUqrfe
	TF4/y1W8U0RceZ9CkwlzO+bUniYj2b4=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-paw2mNSHOoakHWuj9xnTXQ-1; Tue, 22 Oct 2024 03:42:21 -0400
X-MC-Unique: paw2mNSHOoakHWuj9xnTXQ-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-7d4f9974c64so3530502a12.1
        for <virtio-comment@lists.linux.dev>; Tue, 22 Oct 2024 00:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729582941; x=1730187741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNe5vhWAVj7Yet+EjDMql+eMSpNAJPtmOjSdo/6eFQU=;
        b=mkFbvTMRXifRBicVB+ZmLavx1iyVQM5TKGc8ysTJij2KECkDcYkzQhRQ+Y09aW8zLK
         +KX+w3rWUdUiNzhYlPxKBolh4Hb5o3tXJ5dAEWn4X0jvtizA2rM3AWQDhSIBFivgZO3b
         SvwC5M21lxHIXT9Mp/j6MZ6kx1s3FSjKb/qaU4xVnpoVGu1PXuqt+++qZzLZV4iXWRFr
         32yWJ6Byj4u8Ef6H7EBnJajX6fS+ACGaNC1icYec+xAaPYC41+Ng663H/pjbOpWSp12z
         0pCHv1ThwXsL6bYALfNZV2dcaHiuHgjxlyOvXR5c2QDxBGF2DLDTVzgschXOM4B1KvSt
         mzug==
X-Gm-Message-State: AOJu0Yxg8GCwI/aRenKywSYDk5JbBSdC7d4ix3qAc4Fru5IGTU2wSdNG
	kdPo71R9UhmVsmruH2cuQOIXOZ15gDCNFgwHL+lgh2kmCR8gvd2myJyyuF6+l8pIEmouKV9npNU
	K7VLqYBXL9ftvV4pXpVuvUFTZW5Wz9XIzhhytmKIhQT66k9JW96NmqEfIUN+VZmOH7nYLxHUqrR
	O/FA6h3Yy+Oxgn36LPtfkcCajFVM3x2fQUXFkSUrI=
X-Received: by 2002:a05:6a21:78b:b0:1cf:ff65:22f4 with SMTP id adf61e73a8af0-1d92c5ac004mr19278294637.41.1729582940840;
        Tue, 22 Oct 2024 00:42:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXuryGTO7d6hT2ny/PjncK/ZvKlwpn5HgoekF1zsdwswEVW4ZYQcaHTBCcmB3FUl/2kfR6aHhPR9VdygdW5jA=
X-Received: by 2002:a05:6a21:78b:b0:1cf:ff65:22f4 with SMTP id
 adf61e73a8af0-1d92c5ac004mr19278277637.41.1729582940325; Tue, 22 Oct 2024
 00:42:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1728029499.git.pabeni@redhat.com> <55306969c73f62bf4d100d15074bfd6cde741417.1728029499.git.pabeni@redhat.com>
 <CACGkMEvV0gtvgpb7z1MqJLKzHm-Be_8hkf0GzqqsFsfDG8oAeA@mail.gmail.com>
 <d34f50af-4042-44c6-90e1-0acbbb899e96@redhat.com> <CACGkMEvrowr6CwF+=RiR+f3EagdKB=rzyCPCQcUdXee4a5MaZA@mail.gmail.com>
 <2b90c368-b514-4077-a6bf-43da075af4fc@redhat.com> <CACGkMEu5GWZrYVRN==F=vrRQQGnxj_WqX86YZ+diqC3s3m2m_A@mail.gmail.com>
 <10bc51b2-efbe-4f33-a1b3-827de4d0cd10@redhat.com> <CACGkMEuhJXMd0hGopyehESO1eNVRXVX+FaF7m8f6Y9yWCzoESA@mail.gmail.com>
 <44be2d9c-5624-4419-8e9c-e5302a5f6b2f@redhat.com> <CACGkMEsgJT1c93RZur20fUyjtxSX6dMPePEJvzbmNWpAHd92Mg@mail.gmail.com>
 <3e3d6984-65d3-46b0-aaa3-e6591123f95a@redhat.com> <CACGkMEsiRJ2zAcys0iFQkiL0h9MY-LOE4=LP7s4ksN=T+HY_Xw@mail.gmail.com>
 <7f40f3da-aa6e-437c-af73-97e44e1982d1@redhat.com>
In-Reply-To: <7f40f3da-aa6e-437c-af73-97e44e1982d1@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 22 Oct 2024 15:42:08 +0800
Message-ID: <CACGkMEu-83JEcs73R4Eym2tkcUT5Zsj7i2qOsB-9ivmLNf0b5g@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 12:27=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 10/21/24 08:54, Jason Wang wrote:
> > On Fri, Oct 18, 2024 at 6:10=E2=80=AFPM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> >> On 10/18/24 06:26, Jason Wang wrote:
> >>> On Thu, Oct 17, 2024 at 11:34=E2=80=AFPM Paolo Abeni <pabeni@redhat.c=
om> wrote:
> >>>> i.e. all the checks in
> >>>>
> >>>> https://elixir.bootlin.com/linux/v6.12-rc2/source/include/linux/virt=
io_net.h#L97
> >>>> ..L112
> >>>>
> >>>> will be meaningless in such scenario and the GSO over UDP tunnel hel=
per
> >>>> code must replicate them with the correct offsets.
> >>>
> >>> I don't understand here. It works like a charm for non GSO UDP tunnel=
,
> >>> anything that makes it can't work for GSO?
> >>
> >> I we chose to use csum_start for the outer header, for GSO over UDP
> >> tunnel packets:
> >>
> >> 1) the 'all headers in linear part' check:
> >>
> >> https://elixir.bootlin.com/linux/v6.12-rc3/source/include/linux/virtio=
_net.h#L111
> >>
> >> and all the need preeceeding algebra will be useless,
> >
> > This part I don't understand. We still need a validation for the outer
> > header and we've already done this for non GSO tunnels already.
>
> For GSO over UDP tunnel packet, what we need to ensure is that all the
> headers, comprising the inner ones, are available.
>
> Checking that the outer header are there does not avoid the need for
> checking that the inner headers are present.

Right.

>
> Checking the inners only is instead sufficient: if the inner headers are
> available any preceeding data will also be available, including the
> outer headers.

Somehow but should we validate that the outer_th_offset belongs to the
linear part?

>
> >> 3) the csum_start/csum_offset assignment performed by:
> >>
> >> https://elixir.bootlin.com/linux/v6.12-rc3/source/include/linux/virtio=
_net.h#L104
> >>
> >> will yeld the wrong values - as they should point to the inner header
> >> for GSO over UDP tunnel packets.
> >
> > See above, it just works as a non GSO UDP tunnel.
>
> Note that all this topic is about GSO over UDP tunnel packets, and which
> layout is more consistent for them.
>
> For GSO over UDP tunnel packets, if we set virtio_net_header csum_start
> to the outer, we can't reuse a single line of the existing code, as the
> tests will be unnecessary or will give the wrong results.
>
> i.e.
>
> -
> https://elixir.bootlin.com/linux/v6.12-rc3/source/include/linux/virtio_ne=
t.h#L171
>
> would flag as invalid good  packets, as it would over-estimante the
> packet payload size
>
> -
> https://elixir.bootlin.com/linux/v6.12-rc3/source/include/linux/virtio_ne=
t.h#L179
>
> would drop every TCP over UDP tunnel packet, as csum_offset will be 6
> even when the inner header is TCP.

We won't hit this if gso_type is for the outer. Just to clarify, I
meant if we stick the existing vnet header fields only for outer,
there would be any issue.

>
> Instead if for GSO over UDP tunnel we set csum_start to the inner
> header, all the existing test will yield valid result - mostly because
> the Linux kernel, for such packets, expect csum_start pointing the inner
> header.

Ok, that makes sense.

So my point is considering we are designing virtio instead of trying
to make existing GSO capable devices to support tunnel GSO (or can we
do that for virtio?). If some new fields can make things easier, we
probably need to go that way.

Let me summarize my understanding for your proposal so far:

1) csum_start/csum_offset were for the inner and so the outer checksum
can be done through LCO or offload via patch 2
2) if VIRTIO_NET_HDR_GSO_UDP_TUNNEL_{IPV4|IPV6} is set the rest bits
of the gso_type were for inner
3) hdr_len is for inner (this needs to be clarified in the spec), so
outer hdr_len could be deduced from inner

It should work but for 1) I worry about the possible inconsistency:

1) It might have some conflict with

"
If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
VIRTIO_NET_HDR_F_DATA_VALID bit in flags can be set: if so, device has
validated the packet checksum. In case of multiple encapsulated
protocols, one level of checksums has been validated.
"

2) csum_start/csum_offset were for outer for non GSO tunnel packets.
hdr_len, gso_type are fine.

I think those can be addressed for sure with more statements in the
spec. Just not sure if it's worth it. I'm fine if you stick to that or
we can hear from others.

Down this road, I have other questions:

1) We need to clarify if there's an N level nesting tunnel, is
csum_start/offset/hdr_len for the innermost or not. Linux seems to use
the innermost semantic. If yes, for DATA_VALID, as Willem mentioned,
we need a way to report csum_level.
2) In your POC[1], hdr->csum_start/offset seems still point to the outer he=
ader

https://github.com/pabeni/linux-devel/blob/virtio_tunnel_gso/include/linux/=
virtio_net.h#L229

Thanks

>
> And that is IMHO a clear sign that for such packet csum_offset should
> point to the inner header even for virtio_net_hdr.
>
> Cheers,
>
> Paolo
>

