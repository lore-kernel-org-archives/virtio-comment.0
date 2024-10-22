Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB52C154425
	for <virtio-comment@lists.linux.dev>; Tue, 22 Oct 2024 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729583683; cv=none; b=qhY0u0RHaBvgIvwmmywce6Z65raS//VXfYYlt1Vvd4YO0eb+uYb7M7jOwjr0iY9icoZ3CH4dr1mYrDpA2xE2KIKhCSRRzEHDBcE291ZlN1dK8vMnDDjvrAJ1CdEiCXsnv0Q4LC9EZEG0kAipczEBtloi0u9Wk4QcEhJ8j7mGq7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729583683; c=relaxed/simple;
	bh=HQX5yXyrjeMvEzMLJJQeeskJ49fdq7Lz09iLc2V9azc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Woakquc0tP4kTICBfdK/lVUBLeIZtNV75XfR6luZGrPCGTqb2nVDDQU2L08PDfBYF2MGkCKo4Z3zwxf9GPDDjBdK98nWoe6xiUny9n1bief53ZlGccJ0FnfjaDSfyNmZvpkeLIfej2pBity4WNXmJAlMAioGrDBg6XZF2mFTLVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U6aZE8kl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U6aZE8kl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729583680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQX5yXyrjeMvEzMLJJQeeskJ49fdq7Lz09iLc2V9azc=;
	b=U6aZE8klTeScrU/sFxBWlKLtuyZQZyFLsRk/kfw3J3K96mxDMztoDcjF801vzwRy0PSsqp
	7DU91mQSwD4x7naaEoo0MNtx+PKzjRxILdWs7ADcZDWusTJKAcctFMCczIA6ooFbNSe7YD
	pgYKPkrwh9M2wL0fiQwt1K17YSRgwzs=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-a7hDYh0fOHOdXcZhwwFUDg-1; Tue, 22 Oct 2024 03:54:39 -0400
X-MC-Unique: a7hDYh0fOHOdXcZhwwFUDg-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-71e6c5fbebfso5962396b3a.3
        for <virtio-comment@lists.linux.dev>; Tue, 22 Oct 2024 00:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729583678; x=1730188478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQX5yXyrjeMvEzMLJJQeeskJ49fdq7Lz09iLc2V9azc=;
        b=AUeKyLVt7F5Ly6ywAxpdcHDEEa+B2kn8+5r0piJ56KxZobx72L7AFEBYvPCZ7nUPCF
         Xo8AfYJ+AbhaG+dosHQGy/Tmhqvlk8yNgd+idttIgIw+tUmlOMTIlBxKFUo0B+XwbkGk
         4QZnVdb277KQRioxcKy5sq0RXEFGjZD7/5YAGkDZU8x4jIvl1uuYcPcLJWvLMAvxrLmx
         rF/XJWMuqiXlA6+/9ESPFC4ZiW2tqsUFxtFnTN3tCYYFLVgaTIdi/SbMHj+Wf2LoqVkP
         3anrWxj2Eyr9PKP2GPrVt6GGcj28r2znltbZSFo5KemNa5QOjA/B0LPIzw/dxo96LxzR
         qmRg==
X-Forwarded-Encrypted: i=1; AJvYcCXqiHBXgz/lrWDVjzfS59e1hKfeuu2KDHcQNfUWbSItKZY75AkKXHVSm1lvTp7eRhu5XSkJ7WCCJ23/vkfjdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YydEckSdkw/ev1nxWLpAMLZsi1HXUr/gp9vjrWa0+IOZV2oRP7F
	QU4FXJSBsleQ5mKkPVjbnvS1Iu2+SmrFeh5LFLHI8Ob0RQ2C4qTvV59YjXfWaRtXipCqIy4+Fsq
	GBcUE8tpfLm4kA6Mz/Ir5DoHb92/pPLffRRn5Qx8OubmJmjfLiJrYVvltXMNL9qnmX1yWqUGC+5
	/1k6iEovuZnNkR0/FkdFnyDT5j8UZ+9lzyWNEvSbg=
X-Received: by 2002:a05:6a00:228d:b0:71e:634e:fe0d with SMTP id d2e1a72fcca58-71ee4b0ba5dmr2561386b3a.12.1729583678330;
        Tue, 22 Oct 2024 00:54:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH49X64tCrif5a51UjVyDpzJcGvxbWeqRv9BPtMS2b5DXchHHG4IERJz1srau4T1PTAIK0rkP1XbzslbVjW+5c=
X-Received: by 2002:a05:6a00:228d:b0:71e:634e:fe0d with SMTP id
 d2e1a72fcca58-71ee4b0ba5dmr2561363b3a.12.1729583677815; Tue, 22 Oct 2024
 00:54:37 -0700 (PDT)
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
 <3e3d6984-65d3-46b0-aaa3-e6591123f95a@redhat.com> <CA+FuTSdvJNOBUQcUKPaJYO5t2pxByPSsj_USYdS=o1jKZBJK4A@mail.gmail.com>
 <2bd71d08-3ae5-427f-8c2e-21af2d5650bf@redhat.com>
In-Reply-To: <2bd71d08-3ae5-427f-8c2e-21af2d5650bf@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 22 Oct 2024 15:54:26 +0800
Message-ID: <CACGkMEsdbhSiafUsWJLNB4gDw_Lz284Xhw0A9MWPsT6fP855nQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	"maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 11:47=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 10/21/24 00:28, Willem de Bruijn wrote:
> > This thread has gotten very long. I'm not sure where exactly to
> > sprinkle all responses, so just starting my attempt at a summary
> > afresh.
> >
> > One continuing point of confusion is ingress vs egress.
> >
> > * Checksumming.
> >
> > Perhaps we can start with a new precursor patch that clarifies the
> > intended existing behavior?
> >
> > - NEEDS_CSUM and DATA_VALID are mutually exclusive bits
> > - DATA_VALID reads/writes CHECKSUM_UNNECESSARY

Spec has this:

"""
If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
VIRTIO_NET_HDR_F_DATA_VALID bit in flags can be set: if so, device has
validated the packet checksum. In case of multiple encapsulated
protocols, one level of checksums has been validated.
"""

Is this not sufficient?

> > - NEEDS_CSUM reads/writes CHECKSUM_PARTIAL, and implies that
> > virtio_net_hdr csum_start/_off are set

Spec has this:

For TX:

"""
If the driver negotiated VIRTIO_NET_F_CSUM, it can skip checksumming the pa=
cket:

flags has the VIRTIO_NET_HDR_F_NEEDS_CSUM set,
csum_start is set to the offset within the packet to begin checksumming, an=
d
csum_offset indicates how many bytes after the csum_start the new (16
bit ones=E2=80=99 complement) checksum is placed by the device.
The TCP checksum field in the packet is set to the sum of the TCP
pseudo header, so that replacing it by the ones=E2=80=99 complement checksu=
m
of the TCP header and body will give the correct result.
"""

For RX:

"""
If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
VIRTIO_NET_HDR_F_NEEDS_CSUM bit in flags can be set: if so, the packet
checksum at offset csum_offset from csum_start and any preceding
checksums have been validated. The checksum on the packet is
incomplete and if bit VIRTIO_NET_HDR_F_RSC_INFO is not set in flags,
then csum_start and csum_offset indicate how to calculate it (see
Packet Transmission point 1).
"""

> >
> > This does not explicitly address CHECKSUM_NONE

And this part

"""
The driver can send a completely checksummed packet. In this case,
flags will be zero, and gso_type will be VIRTIO_NET_HDR_GSO_NONE.
"""

> > and CHECKSUM_COMPLETE.

This requires extending of the descriptor or vnet header to report checksum=
.

> > And the meaning of the flags are different on ingress vs egress. All
> > of these points can probably be clarified.
> >
> > Also CHECKSUM_UNNECESSARY has the csum_level field to encode how many
> > levels of checksums it covers. This only becomes relevant with
> > tunnels.

It depends on the semantics of the inner fields, if they are for
innermost, we probably need to have some field. If they are just for
level 1 tunnel, csum_level would be 1 at most.

> >
> > Also, if the current Linux virtio_net_hdr_to_skb is more permissive
> > than the spec, let's definitely update the code.
>
> Can we? Wouldn't that possibly cause some interoperability problems with
> other implementations (H/W or S/W) that are currently leveraging such
> more permissive behavior? (Note: I don't have any specific info WRT that
> point).

This needs to be careful as it may break the migration compatibility.

For example the recent increase of UDP_MAX_SEGMENTS may break
migration compatibility silently. (Src has 128 but dst has 64).

>
> > * Tunnels.
> >
> > Technically there are no existing non-GSO tunnels in the virtio spec.
> >
> > What exists are packets with a single checksum offload. These may
> > happen to be UDP packets with tunnels and inner packets, whose
> > checksum virtio indeed has no way to vouch for. But no tunnel specific
> > information is read/written in
> > virtio_net_hdr_from_skb/virtio_net_hdr_to_skb. Such as the skb
> > inner_.. fields, or csum_level.
> >
> > When introducing tunneling in the spec, and when only one checksum can
> > be hardware offloaded, the most valuable one to offload is the
> > innermost.

So should we first introduce this and then GSO tunnel on top? As
mentioned before, non GSO tunnel tries to offload the outer if I read
the spec and Linux code correctly.

> > Inner TCP packets must always be checksummed. UDP or other
> > outer checksum fields can be left zero.
> >
> > Or computed cheaply in software, derived from the innermost checksum
> > (local checksum offload). Though that is only relevant to patch 2.
> > Relevant here is that in the current proposal if NEEDS_CHECKSUM is
> > set, this is a checksum offload request of the inner TCP packet, and
> > the outer UDP header has checksum zero. The inverse, for TSO, would
> > not be very useful.
>
> I read the above as we are basically on the same page.
>
> > An alternative is to support multiple checksum offload requests at
> > once, at a minimum two. But most hardware only supports one
> > csum_start/_csum_off. And due to LCO, the complexity of supporting
> > multiple levels is just not needed.
>
> patch 2 is about supporting offload of 2 checksums. In the v9
> incarnation allows either CSUM_PARTIAL or CSUM_COMPLETE for both the
> offloaded csum. FTR I'm aware of at least a (old, low-end) H/W
> supporting offload of 2 separate, concurrent running csums.

[1]

>
> In any case my understanding is that the most controversial point in
> this thread is the previous one: which header should csum_start point to
> for GSO over UDP tunnel, as Jason prefer to have csum_start point to the
> outer header. Let's try to solve such point first.

I think I would not stick to that. Just wonder if it would be more
convenient since it gives us better consistency and is more hardware
friendly (seems not a point any more as we have LCO and you mentioned
[1] that it's an old low-end one) if it supports more than one.

>
> Cheers,
>
> Paolo
>

Thanks

