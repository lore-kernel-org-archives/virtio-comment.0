Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18D0146588
	for <virtio-comment@lists.linux.dev>; Fri, 25 Oct 2024 08:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729844943; cv=none; b=Pr6ommJ9ZIHipOCiQSaWqXBH8AOI6xC6yYfFNJ8j5ArvJ+ezd6/3UXr/2Ujfx0GeYvxqEccD9r9YluYnv/RUO2kxlgcdNQo1k/welSkIXlrr3xPBzZ+KqQnTHb5MIs8X74WOmyoI92afMgdZ9zh48Q6xRQYb6foV0mr4ZZDO0Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729844943; c=relaxed/simple;
	bh=3oeRgvOs86zookL/BOOuixFJKe6xC11GBTaaqzd9/3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QcMp/MihBU8XcLrdpxiHJIfkF4TIqTiMlq6vSXygpTXxU0nD3T/pSUZUcM976LNj4S1BZypmk1xCOrBJX8LFcnV40S0jm5JwbzIBKU2iq1qSGTE6o2NN8OdIFwJh0o/J4ewtyzgm2xLxUECk06N2eizlERq23Chl7SMmR6JwGRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RRnmJ4/i; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RRnmJ4/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729844939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wH0ST0GpJ0ih/DACGfhmlKeF3WB9hbtF/5Yq5SWMGr4=;
	b=RRnmJ4/iVICdBOeDNP6s9PgjWYyhf08ukpBaxa9/abBglBa1vGZBrVU7xRLe820nrQmvTx
	VutbCaDUr6BUL5uENZcLB8oIqTmoi1ysxDG7MrM7pJuzhSssi1JMC8h4zKog25gRrWxAsV
	ApGCShMMZFDFWRFvuA3c8/UlRBXGPAk=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-J5OBdy5XPpOnE0bcJh4NxQ-1; Fri, 25 Oct 2024 04:28:58 -0400
X-MC-Unique: J5OBdy5XPpOnE0bcJh4NxQ-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-71e58e838d5so1902424b3a.1
        for <virtio-comment@lists.linux.dev>; Fri, 25 Oct 2024 01:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729844937; x=1730449737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wH0ST0GpJ0ih/DACGfhmlKeF3WB9hbtF/5Yq5SWMGr4=;
        b=LLrmKh1gT2ZoKqYHgWxvLjWzYtWKiR36KB1qjC0LbFEkPQWbv53ufiJiFMLwrg1xqr
         /uo+0o2GzmYhh4mf+La1ITkk2pTiy+tL4ZiXz/OMvQ3QObJ4GfZfNy+GweGEpAHh1Xdp
         SRLdozN/80NC5bTDObqRj8Zv8iYvKMv/2+1FzFizjME4KjPwIo6GscRMMr80u/PzOLV3
         ZRvh3SeAYItBOXMDXB/tuQ3LDfMHt+B6wvEsTfWycf5K+SNRybRGlwJwSUJolErFfKOH
         nB7TKxqqL8WvJCzYSFsseg8ZI81SduDXG8cjkaA4f96LUGFzl9dGm9HErZlIy5puPOCM
         rmzQ==
X-Gm-Message-State: AOJu0Yxh0c4iVKxj2JVBfuK8KcVOX8xJ5hH02OCVAh76ufHPyxrsMGBL
	MNoa3YR88iDECpaP78I+HkWCjlAqQxVhZrltVNfhshsdpNIgxQ7Ab9ZcMmbdVVZOs65MQ7+jHyt
	o7HkHav2sqmyxsC6/esg9ujljQr+HXjEToi/NTFNqMF56542jrZV902qjkreOmA2YxWJOHst2KO
	FKdNogQelS3F3axT/5RrlxmgGe1o7tlRldZKaKKas=
X-Received: by 2002:a05:6a00:8c3:b0:71e:4bfb:a1f9 with SMTP id d2e1a72fcca58-72045f547a8mr5879254b3a.22.1729844937201;
        Fri, 25 Oct 2024 01:28:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWiOC+Kml8dU3EKqcx+Sgzwuj1WD/8XrS95irXJpIrYcsKc6r5ZnvEIKVO/kARWTulmb/xaCXlGINjip3fAHo=
X-Received: by 2002:a05:6a00:8c3:b0:71e:4bfb:a1f9 with SMTP id
 d2e1a72fcca58-72045f547a8mr5879239b3a.22.1729844936729; Fri, 25 Oct 2024
 01:28:56 -0700 (PDT)
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
 <7f40f3da-aa6e-437c-af73-97e44e1982d1@redhat.com> <CACGkMEu-83JEcs73R4Eym2tkcUT5Zsj7i2qOsB-9ivmLNf0b5g@mail.gmail.com>
 <5da197a8-a022-4c2d-a4ae-09e0948e620e@redhat.com>
In-Reply-To: <5da197a8-a022-4c2d-a4ae-09e0948e620e@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 25 Oct 2024 16:28:45 +0800
Message-ID: <CACGkMEu-AQea98e5xqj4Vfo4zog_nzeJQ_pLADAOY9ZogsS8AQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 12:56=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 10/22/24 09:42, Jason Wang wrote:
> > So my point is considering we are designing virtio instead of trying
> > to make existing GSO capable devices to support tunnel GSO (or can we
> > do that for virtio?). If some new fields can make things easier, we
> > probably need to go that way.
> >
> > Let me summarize my understanding for your proposal so far:
> >
> > 1) csum_start/csum_offset were for the inner and so the outer checksum
> > can be done through LCO or offload via patch 2
> > 2) if VIRTIO_NET_HDR_GSO_UDP_TUNNEL_{IPV4|IPV6} is set the rest bits
> > of the gso_type were for inner
> > 3) hdr_len is for inner (this needs to be clarified in the spec), so
> > outer hdr_len could be deduced from inner
> >
> > It should work but for 1) I worry about the possible inconsistency:
> >
> > 1) It might have some conflict with
> >
> > "
> > If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> > VIRTIO_NET_HDR_F_DATA_VALID bit in flags can be set: if so, device has
> > validated the packet checksum. In case of multiple encapsulated
> > protocols, one level of checksums has been validated.
> > "
>
> I proposed the following:
>
> For GSO over UDP tunnel VIRTIO_NET_HDR_F_DATA_VALID is allowed if and
> only even  VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is set in flags.
>
> That means that the device supports csum offload for both the inner and
> the outer and both csums are valid. The corresponding skb will have
> CHECKSUM_UNNECESSARY and csum_level =3D=3D 1.

Nit: csum_level seems to be Linux specific.

>
> For GSO over UDP tunnel VIRTIO_NET_HDR_F_DATA_VALID with a single csum
> offloaded, VIRTIO_NET_HDR_F_DATA_VALID can't be used.
>
> Note that we may want to avoid completely VIRTIO_NET_HDR_F_DATA_VALID
> for GSO over UDP tunnel packets, see below[1]. Also that option would
> avoid all the conflicts.
>
> > 2) csum_start/csum_offset were for outer for non GSO tunnel packets.
> > hdr_len, gso_type are fine.
> >
> > I think those can be addressed for sure with more statements in the
> > spec. Just not sure if it's worth it. I'm fine if you stick to that or
> > we can hear from others.
>
> I'm unsure I read this point correctly. A rephrase could help.

I meant

2.1) in the spec, we need to describe for example, if hdr_len is for
inner(most) or outer(most)
2.2) based on the discussion so far, I'm convinced the using
cusm_start/offset looks more convenient

>
> > Down this road, I have other questions:
> >
> > 1) We need to clarify if there's an N level nesting tunnel, is
> > csum_start/offset/hdr_len for the innermost or not. Linux seems to use
> > the innermost semantic. If yes, for DATA_VALID, as Willem mentioned,
> > we need a way to report csum_level.
>
> If there are multiple nested tunnels, there will be no GSO over UDP
> tunnels packets.

This needs to be described in the spec.

> The existing specs will apply, only one csum will be
> offloaded.

This sounds like conflict with what you proposed above

"""
That means that the device supports csum offload for both the inner and
the outer and both csums are valid. The corresponding skb will have
CHECKSUM_UNNECESSARY and csum_level =3D=3D 1.
"""

This sounds like two csums were offloaded.


>
> > 2) In your POC[1], hdr->csum_start/offset seems still point to the oute=
r header
>
> That would be a bug...
>
> > https://github.com/pabeni/linux-devel/blob/virtio_tunnel_gso/include/li=
nux/virtio_net.h#L229
>
> ... but the above code shows that hdr->csum_start points to the inner,
> because skb->csum_start/skb->csum_offset refers to the inner header in
> Linux.

Ah, I may have mis-read the code. So you meant Linux already did LCO
by pointing csum_start/offset for the inner header.

This kind of answers my question (and Willem's in another thread)
about how non GSO UDP tunnel works in Linux now. And my concern of the
inconsistency would not make sense any more if my above understanding
is correct.

>
> There is actually another point which I'm quite scared to mention
> because it caused v9 and implicitly all this discussion.
>
> I want to prevent the driver receiving from the device GSO over UDP
> tunnel packets without csum_start/csum_offset, because the header
> probing code looks fragile and bug-prone and will be even more complex
> in case of tunnels.

This needs more thought. For example, it seems not specific to GSO.
Should we have a new feature for this? (And build a GSO UDP tunnel on
top?)

>
> [1] AFAICS the easiest way to prevent such thing is explicitly requiring
> no DATA_VALID for GSO over UDP tunnel packets.
>
> Cheers,
>
> Paolo

Thanks

>

