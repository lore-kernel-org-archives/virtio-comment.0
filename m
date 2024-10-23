Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C7214B946
	for <virtio-comment@lists.linux.dev>; Wed, 23 Oct 2024 20:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729717114; cv=none; b=bAphS/fJdCdTDYlXBmPcDF87UdfPirRvNU3Fvyg+SETjHeMy6nTHeQZjYczkdGAa9tcRcfRHagH7rYnnBZXGea3y9kQwX7RoIg3ogouIpZjUowJybiqGrgU1WtYHx1Dlz6vbTtdPKAlbf6GJRKlU4/01z2HyQnoFfeQQy46ecmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729717114; c=relaxed/simple;
	bh=2/YEglEHmZaCgBgucHt3ATevZ6VeZ6c/h+//TLK5NS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rb5H2eCWFutWWUIk3JhF7V13X8krsQGB6a18H+w1msa3CLzaUOFKfpyJWOHUvw4+qENsFWRfSoITpOnL0tdFNjsFVSJfRoR+gZ1pUNJ6jNt0+3P4PJ/oAJu2AJEUFJWxk6lI3wggI53uGPVXD9vVoEXC2ktNR9Caa+lMsURQuuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qo+ZWCk2; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qo+ZWCk2"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e2e340218daso297048276.0
        for <virtio-comment@lists.linux.dev>; Wed, 23 Oct 2024 13:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729717112; x=1730321912; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/YEglEHmZaCgBgucHt3ATevZ6VeZ6c/h+//TLK5NS8=;
        b=qo+ZWCk2DlRY4GtmGNoq3w1AkyCrKfAWvTLVNy/SB1AcqdGn4dPsh6hijI2/kk722u
         m9/vqz7W17/xw/uIwA1emU3f3c/DC0tdfPiKaeuZkQjwd1jl+/lWv/sobnUXhN6pYlSr
         qR80S+NYKJQMBsy+Qf17LBUJcuhzRft+ZyalXonnCmHUveNsSlhfEhxUreDT8OGMBnQO
         /J/eICEZIJ6kmBlJRG/Lif9Js0FscPG8V9htYjuXrD8j3qWPplkR49bCEJr0HIODoGTX
         2KHh0LEM9FVZU1EvVsnctnCwgK6ZON9waUx0f/8bmpnTyvQfksKDUml1nEg9yCmgiSr8
         HGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729717112; x=1730321912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/YEglEHmZaCgBgucHt3ATevZ6VeZ6c/h+//TLK5NS8=;
        b=wTyRGlcSnhc+26nlw6KCT5hbJM7CP/d6lVz/6vZ8Js2f6JvOmcyRYLKNwAjaY2o7/4
         ov2lvybFbXv0OpJOMRt3ex3pb7PR77YQZOYZYh1o+fRcs2a3hZ81seMNPOjqPO0CrcTh
         rWJFADMR8h5KhK0yyVKJv5cCpcYNdm29gpxbzPg68pNC+UNe98D5EhL5y+tSReLZfxX+
         RXMfxL1FPo+Zg4O8dD1KqFrFJ0EG2I2dNkZ9zKVQzaP+hLJwG1efO98DLvuukqef8u8M
         M/g1NRuUgq43LieUEEH28RHbEuWSIKCgkAeXUoWmy3ssyZxIdM+iKcpT7qqOIay0Fasc
         8Wvg==
X-Forwarded-Encrypted: i=1; AJvYcCUKTq/J7V4JbrD7ocGTxSpgk0RMt5O5VCoNgHYJpqfcz6FHv+OcU79lg4ypB1tibU/7z1Yzi9fOkD+1K5Ks9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYbfCumoyX+hJOKeu+PIMlEDBdcAmWxWuA5fU2GWrUkPqD99I4
	4ph12vLnjqqniL7PVOpz8reQ1mAY/WUS6HLgj8sHS+ctzoG51vB+QV29iGS4YHk+Gqmj+Na5JR0
	vPQnN1Cra4aps9fT1LbbFADlA7GArVRXjxAAxCHoPqttjb1aiUUaZ
X-Google-Smtp-Source: AGHT+IG806hgkiwJyfZrfHXpwR2QTdK2SeNrKGrOO/72q4EzzM0H2oQ0dJGglYTR2I5evO6CI9VoVagcv4O8XNT8fM0=
X-Received: by 2002:a25:a1e6:0:b0:e2b:9ddd:ecc6 with SMTP id
 3f1490d57ef6-e2e3a633f6bmr3341795276.19.1729717111391; Wed, 23 Oct 2024
 13:58:31 -0700 (PDT)
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
 <2bd71d08-3ae5-427f-8c2e-21af2d5650bf@redhat.com> <CACGkMEsdbhSiafUsWJLNB4gDw_Lz284Xhw0A9MWPsT6fP855nQ@mail.gmail.com>
In-Reply-To: <CACGkMEsdbhSiafUsWJLNB4gDw_Lz284Xhw0A9MWPsT6fP855nQ@mail.gmail.com>
From: Willem de Bruijn <willemb@google.com>
Date: Wed, 23 Oct 2024 16:57:52 -0400
Message-ID: <CA+FuTSdJ9ix=Ty5JzpaUsLFLAEcMra1pJWA_=dYX7FZ+5S8EEw@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Jason Wang <jasowang@redhat.com>
Cc: Paolo Abeni <pabeni@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	"maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 3:54=E2=80=AFAM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Mon, Oct 21, 2024 at 11:47=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> =
wrote:
> >
> > On 10/21/24 00:28, Willem de Bruijn wrote:
> > > This thread has gotten very long. I'm not sure where exactly to
> > > sprinkle all responses, so just starting my attempt at a summary
> > > afresh.
> > >
> > > One continuing point of confusion is ingress vs egress.
> > >
> > > * Checksumming.
> > >
> > > Perhaps we can start with a new precursor patch that clarifies the
> > > intended existing behavior?
> > >
> > > - NEEDS_CSUM and DATA_VALID are mutually exclusive bits
> > > - DATA_VALID reads/writes CHECKSUM_UNNECESSARY
>
> Spec has this:
>
> """
> If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> VIRTIO_NET_HDR_F_DATA_VALID bit in flags can be set: if so, device has
> validated the packet checksum. In case of multiple encapsulated
> protocols, one level of checksums has been validated.
> """
>
> Is this not sufficient?

It does not rule out setting DATA_VALID and NEEDS_CSUM at the same time.

I thought Paolo was suggesting using this, and you responded that they shou=
ld
be mutually exclusive.

> > > - NEEDS_CSUM reads/writes CHECKSUM_PARTIAL, and implies that
> > > virtio_net_hdr csum_start/_off are set
>
> Spec has this:
>
> For TX:
>
> """
> If the driver negotiated VIRTIO_NET_F_CSUM, it can skip checksumming the =
packet:
>
> flags has the VIRTIO_NET_HDR_F_NEEDS_CSUM set,
> csum_start is set to the offset within the packet to begin checksumming, =
and
> csum_offset indicates how many bytes after the csum_start the new (16
> bit ones=E2=80=99 complement) checksum is placed by the device.
> The TCP checksum field in the packet is set to the sum of the TCP
> pseudo header, so that replacing it by the ones=E2=80=99 complement check=
sum
> of the TCP header and body will give the correct result.
> """
>
> For RX:
>
> """
> If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> VIRTIO_NET_HDR_F_NEEDS_CSUM bit in flags can be set: if so, the packet
> checksum at offset csum_offset from csum_start and any preceding
> checksums have been validated. The checksum on the packet is
> incomplete and if bit VIRTIO_NET_HDR_F_RSC_INFO is not set in flags,
> then csum_start and csum_offset indicate how to calculate it (see
> Packet Transmission point 1).
> """

Interesting. So on Rx NEEDS_CSUM also implies that the packet
is validated, just like DATA_VALID.

And this implicitly has a csum_level: "and any preceding".

> > >
> > > This does not explicitly address CHECKSUM_NONE
>
> And this part
>
> """
> The driver can send a completely checksummed packet. In this case,
> flags will be zero, and gso_type will be VIRTIO_NET_HDR_GSO_NONE.
> """

I would expect DATA_VALID for this.

Yes, segmentation offloading depends on checksum offload, so that must
always be zero.

> > > and CHECKSUM_COMPLETE.
>
> This requires extending of the descriptor or vnet header to report checks=
um.

Probably treated as DATA_VALID, after verifying the checksum field against
the computed sum.

> > > And the meaning of the flags are different on ingress vs egress. All
> > > of these points can probably be clarified.
> > >
> > > Also CHECKSUM_UNNECESSARY has the csum_level field to encode how many
> > > levels of checksums it covers. This only becomes relevant with
> > > tunnels.
>
> It depends on the semantics of the inner fields, if they are for
> innermost, we probably need to have some field. If they are just for
> level 1 tunnel, csum_level would be 1 at most.
>
> > >
> > > Also, if the current Linux virtio_net_hdr_to_skb is more permissive
> > > than the spec, let's definitely update the code.
> >
> > Can we? Wouldn't that possibly cause some interoperability problems wit=
h
> > other implementations (H/W or S/W) that are currently leveraging such
> > more permissive behavior? (Note: I don't have any specific info WRT tha=
t
> > point).
>
> This needs to be careful as it may break the migration compatibility.
>
> For example the recent increase of UDP_MAX_SEGMENTS may break
> migration compatibility silently. (Src has 128 but dst has 64).

Agreed with both of you. We cannot safely restrict after the initial releas=
e.

Which is a good reminder to make this new extension as unambiguous
as we can from the start, and limited to exposing exactly the feature that
we intend only.

> >
> > > * Tunnels.
> > >
> > > Technically there are no existing non-GSO tunnels in the virtio spec.
> > >
> > > What exists are packets with a single checksum offload. These may
> > > happen to be UDP packets with tunnels and inner packets, whose
> > > checksum virtio indeed has no way to vouch for. But no tunnel specifi=
c
> > > information is read/written in
> > > virtio_net_hdr_from_skb/virtio_net_hdr_to_skb. Such as the skb
> > > inner_.. fields, or csum_level.
> > >
> > > When introducing tunneling in the spec, and when only one checksum ca=
n
> > > be hardware offloaded, the most valuable one to offload is the
> > > innermost.
>
> So should we first introduce this and then GSO tunnel on top? As
> mentioned before, non GSO tunnel tries to offload the outer if I read
> the spec and Linux code correctly.

It might make sense to clarify the non-GSO tunneling case on virtio
as a first patch in this series.

If we can get to a clear description. But I'm concerned that it would
request a lot of extra work of Paolo that he did not sign up for.

I don't know how tunnels are used with virtio_net_hdr today. As far as
I can tell they are basically just UDP packets from the virtio point of vie=
w.

> > > Inner TCP packets must always be checksummed. UDP or other
> > > outer checksum fields can be left zero.
> > >
> > > Or computed cheaply in software, derived from the innermost checksum
> > > (local checksum offload). Though that is only relevant to patch 2.
> > > Relevant here is that in the current proposal if NEEDS_CHECKSUM is
> > > set, this is a checksum offload request of the inner TCP packet, and
> > > the outer UDP header has checksum zero. The inverse, for TSO, would
> > > not be very useful.
> >
> > I read the above as we are basically on the same page.
> >
> > > An alternative is to support multiple checksum offload requests at
> > > once, at a minimum two. But most hardware only supports one
> > > csum_start/_csum_off. And due to LCO, the complexity of supporting
> > > multiple levels is just not needed.
> >
> > patch 2 is about supporting offload of 2 checksums. In the v9
> > incarnation allows either CSUM_PARTIAL or CSUM_COMPLETE for both the
> > offloaded csum. FTR I'm aware of at least a (old, low-end) H/W
> > supporting offload of 2 separate, concurrent running csums.
>
> [1]
>
> >
> > In any case my understanding is that the most controversial point in
> > this thread is the previous one: which header should csum_start point t=
o
> > for GSO over UDP tunnel, as Jason prefer to have csum_start point to th=
e
> > outer header. Let's try to solve such point first.
>
> I think I would not stick to that. Just wonder if it would be more
> convenient since it gives us better consistency and is more hardware
> friendly (seems not a point any more as we have LCO and you mentioned
> [1] that it's an old low-end one) if it supports more than one.

If we can rely on LCO everywhere, I would also not try hard to make the one
piece of hardware work that has another, now superfluous, mechanism.
