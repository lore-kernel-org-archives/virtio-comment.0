Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E242F4A
	for <virtio-comment@lists.linux.dev>; Wed, 20 Aug 2025 18:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755713233; cv=none; b=GO4A3pT/e5BWjo6jZ95cg3ZCW97theGRpP4WQzA+jaaYmv1a8R1w+qTbcV5jCI1xK5BcF2AIsqCr4ge/y0y9rjdRgPNizE5hLMcEzvkkmDnd3+LRVEOrrCbOqrLxlxm7KAUOAUxK7kmiGM7Mr9j88+Q3nYM9n4RjJJb29qyDM/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755713233; c=relaxed/simple;
	bh=Iseiqqt6SktWHT2CXyRczfT+KxMZqVFWOR8/605lBBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9Pla6qmLqb5z79JYTJ0WRwRo87cSsrFWgWZllLg85HwRFXXFM7LOic1zK437kjY5ZKUJ6Va4tpm8IL/41KDiPRUa5Nrz5wSsUgC4RwLCMddjuojuZAYYkxc/r2hwWmb0Dwusar7fZ3zkADBGOa2KeooK3ECB3FURXwtsguuNvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KHmd0pAJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KHmd0pAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755713230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Iseiqqt6SktWHT2CXyRczfT+KxMZqVFWOR8/605lBBs=;
	b=KHmd0pAJkdC26uF9nKe5/oKzUXBzm4zLTpyj1pnMmo43NIFfIh6ElH6zZq2P1XS7rmB9dr
	zYC2V2gkFOUeo6YvuwMaMg3vJft59MGvrCIoa6OydSo29pMUiGVNjMYArLO3zDnYL2iMEL
	Kh1LUs0TaoOzOIhTwhapDinCG15rufk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-636-xr9-L2O8NYWZZDLogYHDdQ-1; Wed,
 20 Aug 2025 14:07:08 -0400
X-MC-Unique: xr9-L2O8NYWZZDLogYHDdQ-1
X-Mimecast-MFC-AGG-ID: xr9-L2O8NYWZZDLogYHDdQ_1755713227
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5D95A19560B0;
	Wed, 20 Aug 2025 18:07:07 +0000 (UTC)
Received: from localhost (unknown [10.2.16.103])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E7C3F19A4CA1;
	Wed, 20 Aug 2025 18:07:06 +0000 (UTC)
Date: Wed, 20 Aug 2025 14:07:05 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Siddharth Priya <siddharth.priya@uwaterloo.ca>
Cc: virtio-comment@lists.linux.dev
Subject: Re: duplicate ids in used ring
Message-ID: <20250820180705.GB108699@fedora>
References: <b6f972a2-8fe0-4caf-9aa9-2a6b24bf48a8@uwaterloo.ca>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fwgfJoLv/4mDyyNO"
Content-Disposition: inline
In-Reply-To: <b6f972a2-8fe0-4caf-9aa9-2a6b24bf48a8@uwaterloo.ca>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17


--fwgfJoLv/4mDyyNO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 12:14:42PM -0400, Siddharth Priya wrote:
> TL;DR: The virtio spec does not consider duplicate entries (IDs) in the u=
sed
> ring. Should this case be promoted to undefined behaviour [1] in the spec?
>=20
> Background: I am developing proofs that the rust-vmm/virtio-queue [2]
> implementation meets the virtio spec. I noticed that the spec does not st=
ate
> anything about queue behaviour when a device adds a descriptor_table_index
> ID to
> the used ring that is already present. As a result, implementations diver=
ge:
>=20
> * QEMU (with VIRTIO_F_IN_ORDER): The queue enforces a uniqueness invarian=
t =E2=80=94
> only one copy of an element may exist in the ring. If a duplicate is adde=
d,
> QEMU
> overwrites the matching element with the new length [3].
>=20
> * QEMU (with VIRTIO_F_RING_PACKED or split): The implementation assumes t=
he
> device will not add duplicates, and correctness relies on the device [4].
>=20
> Problem: For packed and split queues, the implementation implicitly expec=
ts
> the
> device to uphold the uniqueness invariant. For in-order queues, uniqueness
> emerges implicitly from ordering. From a device developer=E2=80=99s persp=
ective, it
> is
> not clear that duplicates must never be inserted into the used ring. Since
> implementations differ, the invariant is not consistently enforced, making
> device conformance difficult to check.
>=20
> Proposed solution: The spec could explicitly state that breaking the
> uniqueness
> invariant is undefined behaviour. This mirrors the ISO C standard=E2=80=
=99s practice
> of
> using "undefined behaviour" to signal obligations developers must uphold.
> The
> term is widely understood by systems developers and would make expectatio=
ns
> clear.
>=20
> ```
> Example change (to section 2.7.8 The Virtqueue Used Ring):
> =C2=A0 ...
> =C2=A0 Adding an index into the used ring when a virtq_used_elem entry wi=
th the
> same
> =C2=A0 id already exists and has not yet been read by the driver results =
in
> undefined
> =C2=A0 behaviour.
> ```
>=20
> Looking forward to your thoughts.

The conformance clauses (\devicenormative) in the VIRTIO spec provide a
way to forbid things without specifying what has to happen in the
forbidden case. That can be used rather than introducing undefined
behavior into the spec.

How about adding a "The device MUST mark each buffer used at most once"?

Devices could behave in many different ways that make operation
impossible and the spec does not explicitly list each one. The scenario
you mentioned seems like one of these to me.

If it's helpful to add some of them to the spec, that should be fine. I
think the only drawback is that the spec may accumulate a large number
of clauses forbidding nonsensical behavior, making it harder to identify
the non-obvious clauses that implementors really need to watch out for.

Stefan

>=20
> Siddharth
>=20
> [1] https://en.cppreference.com/w/c/language/behavior.html [2]
> https://github.com/rust-vmm/vm-virtio [3]
> https://github.com/qemu/qemu/blob/master/hw/virtio/virtio.c#L938 [4]
> https://github.com/qemu/qemu/blob/5836af0783213b9355a6bbf85d9e6bc4c9c9363=
f/hw/net/virtio-net.c#L1977
>=20
>=20

--fwgfJoLv/4mDyyNO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmimDskACgkQnKSrs4Gr
c8jeWQgArPJZCeHsk+ouOR/dB0Y3zeerAo0FNe0Gnklz/gqRLAJY7F91Sii/iZPl
IHwwl34DQti5zivJYnvEdxbORVCUmUM+RUYtVdPWykPcpvfUgO99fZLCAVrLgQmA
gfOL978G63tdxxETHNrL9bsiZNL5w4nMx+QNxi7VPU3YKgPJg9b4n7AOxipykMut
/1A8kujN1ub0ifCcvBlrD/mOni+W/YJs3D6YYgn++X3G938ceE3/+zrkEkiTWu0l
sLmy7l0RSstMFEWpK1sWxolvBQXRaLfGHLLsKWDVNGTfBXausKdeFUabUKKhZEh0
UtPBRHz2PIkm0TWBm0wiLAzVeDIB/g==
=wPIl
-----END PGP SIGNATURE-----

--fwgfJoLv/4mDyyNO--

