Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA3225779
	for <virtio-comment@lists.linux.dev>; Thu, 17 Oct 2024 06:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729147654; cv=none; b=NW6TFqfUBY35sGEeqHXuLlmm09obLe5QZ72R8+JvFZpgPA4RtUSypO66ghVLrz9yN4YI5j4SrJbaXSmWRdFHXK3rtOismq1UiA/fuPrykjAYBGRcYZ3EejlR/GmwZzv4mRWkAYKrO/h6dgXR8d5/pf7D+xOZzHihe7O1bnhVTKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729147654; c=relaxed/simple;
	bh=ARiNwH4fLL14GylRDsZWFQnM5ybZ0Cz59QZieQzQ/lQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ch9QJgeORonNcGXmAue6IdUaIbkWobUSfImbNYJ52fegzy4bFlPbLfzY89T47cvNznPWrE4dWzGpEVaWMBJlk2kQmdLI32mzeDvLEkufNAKxKih9rO6hlVBQ/CHSOrU1nSCakLAOjUt7923AOHMoaaLQiGzgpJOyYPHQZRf3+wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NS795gIK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NS795gIK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729147651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s+LgZf61yPwoHYDSemYj92pr3IO97y3QuvKTtpPlQb8=;
	b=NS795gIKW1azV8aLXWlxQTzc7rbyZ2HR61qDgPaALxJ3FvbootszDtWWbg0lq7C1mbuKmN
	G+mBYpqpmSoyjkaoDbXEtaSGtwZSK/sWYLjX0V289/thruXjinwLSdxApNTf09YPRQA6Cs
	SGQUuwriO+7NhcA1SI55y58qIcLL6Q0=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-pzJlktKJNfeGHbmm7tt9hw-1; Thu, 17 Oct 2024 02:47:30 -0400
X-MC-Unique: pzJlktKJNfeGHbmm7tt9hw-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-20d417fc584so7795115ad.1
        for <virtio-comment@lists.linux.dev>; Wed, 16 Oct 2024 23:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729147649; x=1729752449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+LgZf61yPwoHYDSemYj92pr3IO97y3QuvKTtpPlQb8=;
        b=ajBpz+n8eNYTIq08fO8h+8u4Kv+uwJ0adaLrISyBTpbK5RoaHq+sjuUAfCS4Q8T35n
         FwA3wqaquysxB0fjkiLEJguE28gbd3TinDkg6TRX1msCuO3WZ22ZKLDmtXtLIWA1iHwo
         ERgjXZUT6KVJR4zg63Ai7G6cvEU9ZqMu3K/KNlel1stqBwVJWbshF+/fAK/gdj1qfk5X
         kXLwGSwYaOpHCYkPbgEvPHiYk/vhbFLHZxDpxeMfZR08UT3vnYHiHMUxgWq8ThDpWGWm
         YFb/Sw/O+lyCJwkIaW6YisbIEayPZ2/k7ejhrpIETw51ADLCEZuc9tYlM1vIwbiuAFEi
         UzHg==
X-Gm-Message-State: AOJu0YwncblQXDpSwI+Uo30JuwIWBf/EP5LDeOW2sSU+z/3HK6dfgN+E
	+cO4O2+Qk4JlAJH+KS9o/kaEq873widukyTwS54PUXUNrBJtHe0lyNRhZNecSWdcTBWdDxmPErX
	jsoKbAdBCVp14uR0MMRbYRHdma9I8JM6zyuuBN0xyLLOWL5ecOzU4i/CC8TbyEPixrZf2nJTn7+
	prHSAuikzGPHZ7rNlvabPyubPGv6/+0u6/SJgpDkw=
X-Received: by 2002:a17:903:1108:b0:20c:ea0a:9665 with SMTP id d9443c01a7336-20cea0a98aemr176472185ad.32.1729147648909;
        Wed, 16 Oct 2024 23:47:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe+jq8wPEmUe0D5OHyUgV2HHZ2KH5avCzytfmSUxtOhPG9sqQlSxpABF3tLpn7PyHu0L1hAlyB9OwCQoLkyIA=
X-Received: by 2002:a17:903:1108:b0:20c:ea0a:9665 with SMTP id
 d9443c01a7336-20cea0a98aemr176472045ad.32.1729147648457; Wed, 16 Oct 2024
 23:47:28 -0700 (PDT)
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
 <10bc51b2-efbe-4f33-a1b3-827de4d0cd10@redhat.com>
In-Reply-To: <10bc51b2-efbe-4f33-a1b3-827de4d0cd10@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 17 Oct 2024 14:47:15 +0800
Message-ID: <CACGkMEuhJXMd0hGopyehESO1eNVRXVX+FaF7m8f6Y9yWCzoESA@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 3:20=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 10/11/24 04:08, Jason Wang wrote:
> > I wonder why not just introduce new fields for the inner, like what
> > has beed done in the linux sk_buff implementation? I know I propose
> > this before, but now I think it can help to reduce the complexity and
> > more aligned with the for non GSO tunneling.
> >
> > ...
> >          union {
> >                  __be16          inner_protocol;
> >                  __u8            inner_ipproto;
> >          };
> > ...
> >          __u16                   inner_transport_header;
> >          __u16                   inner_network_header;
> >          __u16                   inner_mac_header;
> >
> >          __be16                  protocol;
> >          __u16                   transport_header;
> >          __u16                   network_header;
> > ...
>
> As the discussion touches many different points, please allow me
> wrap-up, in order of increasing conflictuality:
>
> 1) there are a few points clarification requests which are actually not
> needed, because the asked text is already there in the spec.
>
> 2) the DATA_VALID handling proposed in v9 is bad, let me scratch it for n=
ow.
>
> 3) you feel the handling of csum_start/csum_offset is confusing and
> would prefer adding new fields for the inner headers.
>
> Let's try to set this most critical point first. Adding new fields for
> the inner headers has several dis-advantages:
>
> - we will need to add more new fields WRT to the current proposal. Using
> csum_start/csum_offset for the outer we will need:
>
>    inner_nh
>    inner_th
>    inner_offset
>
> instead of just outer_th, inner_nh
>
> - AFAICS, due to align reason, the above will require an additional
> <unused> field.
>
> - the implementation will not be able to reuse the existing code,
> leading to duplication and/or hacks.

This part I don't understand which part of the code could not be
re-used? More below.

>
> - will discard most of the discussions on this topics done in the past
> several revisions
>
> I understand that one of the argument in favor of using new fields for
> the inner headers is to align with the current linux kernel handling of
> tunnel related fields. Please note that the existence of skb->inner_*
> fields is quite blamed, I suggest avoiding taking them as a reference.

That's fine, but I would like to know why it is blamed or if such
blaming is related.

>
> AFAICS the main argument against the layout I proposed is the
> inconsistent usage of csum_start that will refer to the inner header for
> GSO over udp-tunnel packets and to the outer header in when the device
> does not expose the GSO over UDP tunnel support.
>
> I argue that dubbing such behavior as inconsistent is a matter of
> interpretation: in both case the csum_start field refers to the
> innermost header that the device is able to parse.

I was convinced by this argument until I see this

"""
If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
VIRTIO_NET_HDR_F_DATA_VALID bit in flags can be set: if so, device has
validated the packet checksum. In case of multiple encapsulated
protocols, one level of checksums has been validated.
"""

The "one level" seems to be ambiguous. But this reminds me that the
innermost assumption seems to be impractical:

The checksum of non GSO tunnels has been supported. In this case,
looking at the current Linux implementation, if I don't misread the
code, csum_start/offset were used for outer. What's more, the
innermost assumption requires the device to phrase each level of the
tunnel which is very hard (or even impossible).

If we use csum_start/offset for inner for GSO tunnel we would end up
with different semantics (GSO seems not a good reason for the
differences of csum):

For GSO UDP tunnel, csum_start/offset is for inner.
For non GSO UDP tunnel, csum_start/offset is for outer.

Such inconsistency a lot of extra statements to describe the
difference semantics in the spec and if/else in the code (as
demonstrated in your POC which uses a completely different helper to
do the header conversion between vnet header and skb metadata).

If we introduce new fields for inner, we can stick to the guidance and
normatives for the new fields instead of dealing with the different
semantics between GSO and non-GSO tunnels.

1) a patch to clarify the existing fields in vnet header were for
outer in there's a tunnel
2) adding new fields and explain that they were used for inner, we
don't need to worry any possible conflict when trying to reuse fields
with outer (as demonstrated by DATA_VALID).

>
> Finally, the specification change to describe the new field usage I
> propose is quite minimal and almost don't touch the existing definition:
> it's difficult for alternative specification being simpler - especially
> when such alternative specification will need more new fields to be
> described.
>
> Cheers,
>
> Paolo

Thanks

>

