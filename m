Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDD2192592
	for <virtio-comment@lists.linux.dev>; Fri, 25 Oct 2024 08:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729845688; cv=none; b=lOnqTZ6iSCFDsSHu78YrFKf/rcAXBLDcRj60/yh6dhFzoT43IHuNKiqYiuD7Mz1xI8K/Lw4Wk9CynDBlJ0ydIFJQD7iAQe5y7GRowAVqz4hvLKCK6gKsbNptiHPkNz5yj/4xU2NSbcdb5TiYnvMkxEZrTlt3YuW54zlhLDe6188=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729845688; c=relaxed/simple;
	bh=tdiPIBzV6MQM2M0Og0EkN0ewCs8VRUjbLQWZvpw9IIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dd/mBI9mgfYt+lsyXnDIfRMNM85UoyJVdo3ihIs1As6pCrjWj56XnnJbdks9+NgXYANYTJjcEm7hqwA1cORorz1Ll7DRVkmxxnzOF5H4Zr7WJqwMivLPoh1m145+ny7RSYqWuPMdQkMuI1ZYyHak5ikrTyKa0ZAt30Q83P1lons=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LT4Eg8f/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LT4Eg8f/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729845685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tdiPIBzV6MQM2M0Og0EkN0ewCs8VRUjbLQWZvpw9IIc=;
	b=LT4Eg8f/WybfeLpPLi4DKHePXs9Daq1RI7J6qjPBRG8Dzssrl0GmR+PBnOXDQdsfj7kYdS
	bKtF2xp/eREMj+U9lGBxF6YhLrd/5V2cjWLZwjZPHXabFxI1QolOqN/aXseHvyitDURad7
	ZUjJTZoLyd0abh66tMVX1Yyo3KZOFIQ=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-YQQrwsGqPHK_EplcLhCD9Q-1; Fri, 25 Oct 2024 04:41:24 -0400
X-MC-Unique: YQQrwsGqPHK_EplcLhCD9Q-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-71e5a7bd897so2067401b3a.1
        for <virtio-comment@lists.linux.dev>; Fri, 25 Oct 2024 01:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729845683; x=1730450483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdiPIBzV6MQM2M0Og0EkN0ewCs8VRUjbLQWZvpw9IIc=;
        b=NTk0AGRMARUltU0uu/fAlMQfY53lvF/Fo6jcnf4TlnZCyoSOxDbQFGS75gdNsWPOCP
         YWUpi14Dx7ViAn9nQpVat8f1aPL0VFyW4VfBySUX/XdTeeXRB5zk5IwxGoRADMek8etS
         vuT8WpQQGbLhETasZyhbWD0wxw+s255F+bheNuXlxIMH0wvMs1TN4yr22n86uAp9ChuV
         GV5FAF58IoJTRcXdM25JVPY0G1bO3Thr2QPlI76d+eKXF1DwCrULHy6ASp50WvA3qhyh
         rrvNp8umq6zisqqbJ4I27IzcJDDYyYdS2XLrd08aLZGSHvgo5cusRmznyrWPnkpcbHaU
         Dpqg==
X-Forwarded-Encrypted: i=1; AJvYcCXvPzLIzEwGTL/pS0C1s3BruoNESbYS/Tt9psZXXx2vGlPuAqc+hRpMww1wjmQwlYQpwOTCNQakeQeMe5LpTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxQiRQu/1ks9pWIkVB0oILFnZNnKQ7Wn+ytH5GkX81fJ56GaxV
	BvcPNNCba4zuFlZQy35wXM+befMwwfYDlSIu6Pq2kZSc7YD6mdz3AtghUr9Mm+cOMcW9vIxYewt
	w5uck1290KvpmErGwx9J6GNQ5c0oSEcM/fYnOPfnfzQKjcJhwr6kaTDsWtIdpCzL5gdE/0Gkwgm
	jWQpCJAr8KNN2nPlt4k1td0dIYYuK5YqPvA60lcJE=
X-Received: by 2002:a05:6a00:2e1c:b0:71e:634e:fe0d with SMTP id d2e1a72fcca58-72030a8ae4bmr12916379b3a.12.1729845683104;
        Fri, 25 Oct 2024 01:41:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2rjp3RcoBdwYZ6YUahTg/RuvYWKOy6b5mK+gcvfVs6cSFsa6RflQfOzUrQKbiw7eUh7rp+cT1g7HBIk0f3OE=
X-Received: by 2002:a05:6a00:2e1c:b0:71e:634e:fe0d with SMTP id
 d2e1a72fcca58-72030a8ae4bmr12916348b3a.12.1729845682498; Fri, 25 Oct 2024
 01:41:22 -0700 (PDT)
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
 <CA+FuTSdJ9ix=Ty5JzpaUsLFLAEcMra1pJWA_=dYX7FZ+5S8EEw@mail.gmail.com>
In-Reply-To: <CA+FuTSdJ9ix=Ty5JzpaUsLFLAEcMra1pJWA_=dYX7FZ+5S8EEw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 25 Oct 2024 16:41:11 +0800
Message-ID: <CACGkMEs-Sm_FwPL5dS5sfsQRsb3XSqOdE2QrAgWZXB2gSyaDqw@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Willem de Bruijn <willemb@google.com>
Cc: Paolo Abeni <pabeni@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	"maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 4:58=E2=80=AFAM Willem de Bruijn <willemb@google.co=
m> wrote:
>
> On Tue, Oct 22, 2024 at 3:54=E2=80=AFAM Jason Wang <jasowang@redhat.com> =
wrote:
> >
> > On Mon, Oct 21, 2024 at 11:47=E2=80=AFPM Paolo Abeni <pabeni@redhat.com=
> wrote:
> > >
> > > On 10/21/24 00:28, Willem de Bruijn wrote:
> > > > This thread has gotten very long. I'm not sure where exactly to
> > > > sprinkle all responses, so just starting my attempt at a summary
> > > > afresh.
> > > >
> > > > One continuing point of confusion is ingress vs egress.
> > > >
> > > > * Checksumming.
> > > >
> > > > Perhaps we can start with a new precursor patch that clarifies the
> > > > intended existing behavior?
> > > >
> > > > - NEEDS_CSUM and DATA_VALID are mutually exclusive bits
> > > > - DATA_VALID reads/writes CHECKSUM_UNNECESSARY
> >
> > Spec has this:
> >
> > """
> > If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> > VIRTIO_NET_HDR_F_DATA_VALID bit in flags can be set: if so, device has
> > validated the packet checksum. In case of multiple encapsulated
> > protocols, one level of checksums has been validated.
> > """
> >
> > Is this not sufficient?
>
> It does not rule out setting DATA_VALID and NEEDS_CSUM at the same time.
>
> I thought Paolo was suggesting using this, and you responded that they sh=
ould
> be mutually exclusive.

Exactly, so it's for "NEEDS_CSUM and DATA_VALID are mutually exclusive bits=
"

I meant I didn't get this: " DATA_VALID reads/writes
CHECKSUM_UNNECESSARY" as spec already describes that DATA_VALID is the
semantic of CHECKSUM_UNNECESSARY. (See my quoted statement above).

>
> > > > - NEEDS_CSUM reads/writes CHECKSUM_PARTIAL, and implies that
> > > > virtio_net_hdr csum_start/_off are set
> >
> > Spec has this:
> >
> > For TX:
> >
> > """
> > If the driver negotiated VIRTIO_NET_F_CSUM, it can skip checksumming th=
e packet:
> >
> > flags has the VIRTIO_NET_HDR_F_NEEDS_CSUM set,
> > csum_start is set to the offset within the packet to begin checksumming=
, and
> > csum_offset indicates how many bytes after the csum_start the new (16
> > bit ones=E2=80=99 complement) checksum is placed by the device.
> > The TCP checksum field in the packet is set to the sum of the TCP
> > pseudo header, so that replacing it by the ones=E2=80=99 complement che=
cksum
> > of the TCP header and body will give the correct result.
> > """
> >
> > For RX:
> >
> > """
> > If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> > VIRTIO_NET_HDR_F_NEEDS_CSUM bit in flags can be set: if so, the packet
> > checksum at offset csum_offset from csum_start and any preceding
> > checksums have been validated. The checksum on the packet is
> > incomplete and if bit VIRTIO_NET_HDR_F_RSC_INFO is not set in flags,
> > then csum_start and csum_offset indicate how to calculate it (see
> > Packet Transmission point 1).
> > """
>
> Interesting. So on Rx NEEDS_CSUM also implies that the packet
> is validated, just like DATA_VALID.

Yes, the only difference is that the checksum is incomplete.

>
> And this implicitly has a csum_level: "and any preceding".

Kind of but it requires the driver to figure out the csum level, I
wonder if this makes sense for any implementation.

>
> > > >
> > > > This does not explicitly address CHECKSUM_NONE
> >
> > And this part
> >
> > """
> > The driver can send a completely checksummed packet. In this case,
> > flags will be zero, and gso_type will be VIRTIO_NET_HDR_GSO_NONE.
> > """
>
> I would expect DATA_VALID for this.

DATA_VALID is only used in RX and here zero flags means no offload, if
I was not wrong.

>
> Yes, segmentation offloading depends on checksum offload, so that must
> always be zero.
>
> > > > and CHECKSUM_COMPLETE.
> >
> > This requires extending of the descriptor or vnet header to report chec=
ksum.
>
> Probably treated as DATA_VALID, after verifying the checksum field agains=
t
> the computed sum.
>
> > > > And the meaning of the flags are different on ingress vs egress. Al=
l
> > > > of these points can probably be clarified.
> > > >
> > > > Also CHECKSUM_UNNECESSARY has the csum_level field to encode how ma=
ny
> > > > levels of checksums it covers. This only becomes relevant with
> > > > tunnels.
> >
> > It depends on the semantics of the inner fields, if they are for
> > innermost, we probably need to have some field. If they are just for
> > level 1 tunnel, csum_level would be 1 at most.
> >
> > > >
> > > > Also, if the current Linux virtio_net_hdr_to_skb is more permissive
> > > > than the spec, let's definitely update the code.
> > >
> > > Can we? Wouldn't that possibly cause some interoperability problems w=
ith
> > > other implementations (H/W or S/W) that are currently leveraging such
> > > more permissive behavior? (Note: I don't have any specific info WRT t=
hat
> > > point).
> >
> > This needs to be careful as it may break the migration compatibility.
> >
> > For example the recent increase of UDP_MAX_SEGMENTS may break
> > migration compatibility silently. (Src has 128 but dst has 64).
>
> Agreed with both of you. We cannot safely restrict after the initial rele=
ase.
>
> Which is a good reminder to make this new extension as unambiguous
> as we can from the start, and limited to exposing exactly the feature tha=
t
> we intend only.

Right.

>
> > >
> > > > * Tunnels.
> > > >
> > > > Technically there are no existing non-GSO tunnels in the virtio spe=
c.
> > > >
> > > > What exists are packets with a single checksum offload. These may
> > > > happen to be UDP packets with tunnels and inner packets, whose
> > > > checksum virtio indeed has no way to vouch for. But no tunnel speci=
fic
> > > > information is read/written in
> > > > virtio_net_hdr_from_skb/virtio_net_hdr_to_skb. Such as the skb
> > > > inner_.. fields, or csum_level.
> > > >
> > > > When introducing tunneling in the spec, and when only one checksum =
can
> > > > be hardware offloaded, the most valuable one to offload is the
> > > > innermost.
> >
> > So should we first introduce this and then GSO tunnel on top? As
> > mentioned before, non GSO tunnel tries to offload the outer if I read
> > the spec and Linux code correctly.
>
> It might make sense to clarify the non-GSO tunneling case on virtio
> as a first patch in this series.
>
> If we can get to a clear description. But I'm concerned that it would
> request a lot of extra work of Paolo that he did not sign up for.

Maybe, let's see.

>
> I don't know how tunnels are used with virtio_net_hdr today. As far as
> I can tell they are basically just UDP packets from the virtio point of v=
iew.

Paolo said csum_start/offset has already been used for the inner
header, and I've asked him to confirm in another thread.

>
> > > > Inner TCP packets must always be checksummed. UDP or other
> > > > outer checksum fields can be left zero.
> > > >
> > > > Or computed cheaply in software, derived from the innermost checksu=
m
> > > > (local checksum offload). Though that is only relevant to patch 2.
> > > > Relevant here is that in the current proposal if NEEDS_CHECKSUM is
> > > > set, this is a checksum offload request of the inner TCP packet, an=
d
> > > > the outer UDP header has checksum zero. The inverse, for TSO, would
> > > > not be very useful.
> > >
> > > I read the above as we are basically on the same page.
> > >
> > > > An alternative is to support multiple checksum offload requests at
> > > > once, at a minimum two. But most hardware only supports one
> > > > csum_start/_csum_off. And due to LCO, the complexity of supporting
> > > > multiple levels is just not needed.
> > >
> > > patch 2 is about supporting offload of 2 checksums. In the v9
> > > incarnation allows either CSUM_PARTIAL or CSUM_COMPLETE for both the
> > > offloaded csum. FTR I'm aware of at least a (old, low-end) H/W
> > > supporting offload of 2 separate, concurrent running csums.
> >
> > [1]
> >
> > >
> > > In any case my understanding is that the most controversial point in
> > > this thread is the previous one: which header should csum_start point=
 to
> > > for GSO over UDP tunnel, as Jason prefer to have csum_start point to =
the
> > > outer header. Let's try to solve such point first.
> >
> > I think I would not stick to that. Just wonder if it would be more
> > convenient since it gives us better consistency and is more hardware
> > friendly (seems not a point any more as we have LCO and you mentioned
> > [1] that it's an old low-end one) if it supports more than one.
>
> If we can rely on LCO everywhere, I would also not try hard to make the o=
ne
> piece of hardware work that has another, now superfluous, mechanism.
>

Ok.

Thanks

