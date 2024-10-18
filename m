Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2581D16631C
	for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 04:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729225610; cv=none; b=NU1AGihclvACaxRBS1RY3sGtfGp16DL+2j8fdzqinXlPOqaoYSu4R+ujcjLRla2x8Qxlr/08ZJeYJ9UFpZYSyAlDkcZiCDsYivRzRiYp5VvQbrrE2KOdelDvK+j6BjOuHv8NowqoPFQ0WAJG8aLenF5owhZ1t55MT5OAtk3zm98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729225610; c=relaxed/simple;
	bh=fqDLWea4M+jcbRTRs7zENs1VTzWoz8diZD7LWBUNaUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lUqyQJT1CgRgo/pqB2WnE4Hlgji/FOiiMnEyJJV/QRuzoilVboxgLX+ilYdnfB8XIuQLSgn+OlCETPy767bkQ5G3z6izYjVx09S7gFfBnucQ1IPGExfIJg7BjqZYAdUV0KE91IibQ4QDN0ERz3AS3QJFpM65VEGXsiLUSfv9p6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O9qaMotC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O9qaMotC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729225606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHNEJyehXWcF5Em3vQwujXkO0GnMfVOJLuwwfCQMZ1Q=;
	b=O9qaMotCU56QiiPoSbckKuwsbNQ1IfEDQW9aoUGvwekYMvn7irxavQwEKBcG9pY1TgIYK6
	TOyvS63il7dXdnLumXwaQ1CAqL1VtrY9qGBD2Obo5zp/YnuK2ND/ek+wPdI9gW2vomzVde
	gacrJxJRqM1dAyj4Sn7tplfcneE3GhM=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-o4hI3UYyMma6MRdU0Xd2Jw-1; Fri, 18 Oct 2024 00:26:45 -0400
X-MC-Unique: o4hI3UYyMma6MRdU0Xd2Jw-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-6c8f99fef10so1950540a12.3
        for <virtio-comment@lists.linux.dev>; Thu, 17 Oct 2024 21:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729225604; x=1729830404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHNEJyehXWcF5Em3vQwujXkO0GnMfVOJLuwwfCQMZ1Q=;
        b=fAdkYe/asYqPDOIwTudRs719k7v7Gb0EtaA9kXSVId5HLGfy+ajkgqd8308dcXdFQU
         i9CMAApUYHXr7o83jsFMIoOC2NaoNvN9Cwg9YppGVI8MFS8KBHML6Voqns7V66mNmrp8
         G5aqjtK6Kg9peRmpqaeXIrIQ4Qh6i6XzN/3bpGihZ0v1D1PoBaVuZupmyW1UbNWXO+v1
         i9UlJOlStCTbOL81vYVMxoKjIVjXyVQUCZxJ1EbKQ4NHkHdqvxrzpvD7Cawj1rzYhRIp
         irP/p2WZtrOlGR/TzCobKD9lhLf9Iju1q9sFIDM4BDH/UMo3EFp2tOZTLzYgAcVCurXL
         IItw==
X-Gm-Message-State: AOJu0YwkmwtPUp1NDEvDPaHhRzxDeybIqU3BBoLgdWl+WTHbuNGOIH/E
	O+KF/wZlRlGUbZ8DZxtT5tXTrfahxm9Vp+DOH4LikwO/9PxnoDY4QYi3nH0XaG/nmxT4o1DZfe8
	0HWMgZdDQo9Ue2wAM+JVs2nZwjNSi3ZjY5MVkCvci/0Z7srNLAkv7+9OfSxer2HmJ/35aQ+PZx0
	pwjDCurpyCCauWcGWBNZMm7iR7xI7TowjHgU/vqs0=
X-Received: by 2002:a05:6a21:78d:b0:1d2:e889:1513 with SMTP id adf61e73a8af0-1d92c4e162amr1774472637.17.1729225604376;
        Thu, 17 Oct 2024 21:26:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEubbykSF0U3o1IkFR5heQQmgjAmElx61wbxoBM++6gfvOQrHZMKN/2xc+Ih+smN0OW2oitUmxTKWmw7seuY2E=
X-Received: by 2002:a05:6a21:78d:b0:1d2:e889:1513 with SMTP id
 adf61e73a8af0-1d92c4e162amr1774451637.17.1729225603832; Thu, 17 Oct 2024
 21:26:43 -0700 (PDT)
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
 <44be2d9c-5624-4419-8e9c-e5302a5f6b2f@redhat.com>
In-Reply-To: <44be2d9c-5624-4419-8e9c-e5302a5f6b2f@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 18 Oct 2024 12:26:32 +0800
Message-ID: <CACGkMEsgJT1c93RZur20fUyjtxSX6dMPePEJvzbmNWpAHd92Mg@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 11:34=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 10/17/24 08:47, Jason Wang wrote:
> >> AFAICS the main argument against the layout I proposed is the
> >> inconsistent usage of csum_start that will refer to the inner header f=
or
> >> GSO over udp-tunnel packets and to the outer header in when the device
> >> does not expose the GSO over UDP tunnel support.
> >>
> >> I argue that dubbing such behavior as inconsistent is a matter of
> >> interpretation: in both case the csum_start field refers to the
> >> innermost header that the device is able to parse.
> >
> > I was convinced by this argument until I see this
> >
> > """
> > If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> > VIRTIO_NET_HDR_F_DATA_VALID bit in flags can be set: if so, device has
> > validated the packet checksum. In case of multiple encapsulated
> > protocols, one level of checksums has been validated.
> > """
> >
> > The "one level" seems to be ambiguous. But this reminds me that the
> > innermost assumption seems to be impractical:
> >
> > The checksum of non GSO tunnels has been supported.
>
> I argue the above statement is again a matter of interpretation: the
> existing specs support checksum offload of UDP packets. That UDP packet
> may (or may not) carry a tunnel and some other headers, but such info
> are actually irrelevant to the device: lacking the GSO over UDP tunnel
> support, the device still parse the packet up to the (only known)
> transport (UDP) header and offload the related checksum.

Yes, so for non GSO tunnels, all vnet header fields (including
csum_start/offset) were for the outer. But this proposal tries to make
csum_start/offset an inner for GSO UDP tunnels. That seems to
introduce inconsistency with side effects.

>
> Also note that I already agreed the specification for DATA_VALID with
> GSO over UDP tunnel packets must be changed/corrected and I proposed 2
> options to avoid confusion there:
>
> https://lore.kernel.org/virtio-comment/CACGkMEvmhdYMHf5HKX37XqAYO2uHPq1=
=3DeWXfBPoS2gp8FJezDQ@mail.gmail.com/T/#m520efe2519200e878ab103f32598e5163c=
d01ec4
>
> """
> 1) forbid DATA_VALID with GSO over UDP tunnel
>

If it's not too hard, I would like to keep that. Here are the reasons

1) I notice that some Linux drivers uses DATA_VALID for GSO UDP tunnel
2) when we want to add it back some day in the future, it would cost
another feature bit
3) It looks to me all the issues come from when we try to reuse the
outer flags, we would not have issues if we introduce a new
bits/fields for inner

> or
>
> 2) forbid DATA_VALID with GSO over UDP tunnel without UDP tunnel
> checksum offload. That means that DATA_VALID for GSO over UDP tunnel
> packets could only be set when both the inner and outher header are
> offloaded.

This seems to be fine, but again we need to differ the outer/inner here.

1) reusing DATA_VALID/NEEDS_CSUM
2) introducing new fields and bit

Reusing seems to be harder.

And no matter what way we choose to go, we need clarify the following
conditions in the normatives

1) if inner is DATA_VALID but outer is NEEDS_CSUM is allowed
2) if inner is NEEDS_CUSM but outer is DATA_VALID is allowed

(It looks to me like it would be easier if we just forbid the above two).

> """
>
> [...]
> > Such inconsistency a lot of extra statements to describe the
> > difference semantics in the spec and if/else in the code (as
> > demonstrated in your POC which uses a completely different helper to
> > do the header conversion between vnet header and skb metadata).
>
> I think you have misread the PoC code. It actually re-uses the exiting
> helpers, verbatim, without the need to duplicate any existing checks.

There's no duplication but new semantic for csum_start/offset:

static inline int virtio_net_hdr_tnl_to_skb(struct sk_buff *skb, ...
      ...
      if (!gso_tunnel_type)
           return virtio_net_hdr_to_skb(skb, hdr, little_endian); // [1]
      ...
      inner_th =3D __virtio16_to_cpu(little_endian, hdr->csum_start);
      ...
      /* Let the basic parsing deal with plain GSO features. */
      ret =3D virtio_net_hdr_from_skb(skb, hdr, little_endian, false, // [2=
]
      ...
      skb->inner_transport_header =3D inner_th
...

static inline int virtio_net_hdr_to_skb(struct sk_buff *skb, ...
      ...
      if (hdr->flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
            u32 start =3D __virtio16_to_cpu(little_endian, hdr->csum_start)=
;
      ...
            if (!skb_partial_csum_set(skb, start, off))
      ...
}

And having two calls to virtio_net_hdr_from_skb() is a hint that the
logic needs to be extended in virtio_net_hdr_from_skb() instead.

>
> Sure, there is some additional code in the GSO over UDP tunnel helpers,
> as the latter must process and check additional fields. The other
> additional conditionals you see are due to both the spec and helper
> being very strict about the admitted packets - we want to avoid the
> loopholes leading to nasty bugs, as already mentioned. Such code checks
> and spec statements should (/must) be there with any layout we chose for
> the virtio_net_hdr to support GSO over UDP tunnel.
>
> Let me reiterate that, instead, using the csum_start/csum_offset fields
> to track the outer header information, the GSO over UDP tunnel could
> processing could not use
> virtio_net_hdr_to_skb()/virtio_net_hdr_from_skb() to process the
> existing fields. i.e. all the checks in
>
> https://elixir.bootlin.com/linux/v6.12-rc2/source/include/linux/virtio_ne=
t.h#L97
> ..L112
>
> will be meaningless in such scenario and the GSO over UDP tunnel helper
> code must replicate them with the correct offsets.

I don't understand here. It works like a charm for non GSO UDP tunnel,
anything that makes it can't work for GSO?

>
> IDK which extra statements in the spec you refers to, could you please
> be more specific?

I meant statements needs to be added to

1) say csum_start/offset is for inner but not outer, one example:

"""
+  \item \field{outer_th_offset} field indicates the outer transport
header within
+      the packet. This field differs from \field{csum_start} as the latter
+      points to the inner transport header within the packet.
"""

2) clarifying about other possible conflicts about such kinds of
reusing (gso_size, flags and others). Those seem to be missed in the
current proposal.

>
> > If we introduce new fields for inner, we can stick to the guidance and
> > normatives for the new fields instead of dealing with the different
> > semantics between GSO and non-GSO tunnels.
> >
> > 1) a patch to clarify the existing fields in vnet header were for
> > outer in there's a tunnel
>
> Would such patch require the sort of extra statements you don't like?!?

No, I meant, we need to clarify "one level" in the spec to align with
the existing implementation.

>
> > 2) adding new fields and explain that they were used for inner, we
> > don't need to worry any possible conflict when trying to reuse fields
> > with outer (as demonstrated by DATA_VALID).
>
> I must admit the 6m (or 2y?) step backward in time does sound scaring to =
me.

Sometimes it might be longer than expected, but it's still much better
than we found issues after it has been merged. Spec is kind of
different from the code as fixing bugs might be harder for the vendor.
Lots of vendors just start to implement their device once a feature is
merged into the spec.

>
> As mentioned the above will lead to a poorer implementation, are we ok
> with that?

1) sticking to existing csum_start/offset semantic, both the spec and
implementation are straightforward:

Convert between skb->csum_start/offset and vnet_hdr->csum_start/offset
with necessary checks
if (packet is GSO_UDP)
        Do conversion between skb->inner_XXX and vnet_hdr->inner_XXX
with necessary checks

2) with the proposal here

if (packet is GSO UDP)
        convert between skb->csum_start/offset/in_nh_offset and
skb->inner_XXX with necessary checks
        convert between outer_th_offset and skb->csum_start/offset
with necessary checks
else
        convert between skb->csum_start/offset and
vnet_hdr->csum_start/offset with necessary checks

I think 1) are easier to implement (no mention of the issues of flags
and other side effects caused by trying to reusing outer flags/fields
for inner).

I don't see how 1) is poorer. Or is it just because more vnet header
fields were introduced?

>
> What about hdr_len field? for GSO over UDP packets should include the
> inner hdr len or not? If not, it would be useless, otherwise would be
> inconsistent.

hdr_len is just a hint, various implementations just ignore that.
Actually, it's another example that needs to be clarified in this
proposal. Is that for outer and inner?

My understanding is that new fields for new functions are easier than
new semantics for existing fields. As the latter needs to deal with
the possible conflicts which is not easy.

By looking at your concern so far about adding new fields for inner,
the only thing that matters seems to be the vnet header length. I
think it's not a problem as adding a few new bytes won't impact the
performance.

Thanks

>
> /P
>

