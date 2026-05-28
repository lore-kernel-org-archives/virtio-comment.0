Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4603B3F4DF7
	for <virtio-comment@lists.linux.dev>; Thu, 28 May 2026 13:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975403; cv=none; b=iik1cbkIm5WbOo/73+Oh9xHPatuWswhPxT9OsiQQHMAqUGLxkApUbh4Xw36FeQGdCv/vhHDVN4WFA/89PqoQyo9JhHd+OjAKR+P/Ri8YdOmsUZdWezLt+J/WxzN+sb+zmQyCslNLj6yDKP9aPhevwtHL/0DiLsXX8cdMsoaiHZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975403; c=relaxed/simple;
	bh=8aqO8+G9DRd2d5B2Yho6kewIVD3sY18FqplaMcnlEdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X22R9ubt/dxuRsF4e/74Nxl+ZFTJKqBemyBvMOLNWT7g5Xd4ZX1eYNUf8VxiWUBYaOk5cR6WPfe9ECsvBH35c52rwVkFqeA7cFrpHiWfm0GiF6dV7AUaAwTN/iVQOci9WsVD0jf5xhaUpa2fgadAY2AhlSrhi9b3L6PL6adV48U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CJL53iJE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CJL53iJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779975401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pL78MkQJHoHepSh4XUcbnvy159epezgo6oVkPfuLm0U=;
	b=CJL53iJEm8elVHN+8urbnpOywpqqpqh8bZcZ5jNbK1ajPCCC496dYeAZZuQ9U9cbuMnaaU
	ep7p6l669sJBapWtIPbNJUTq2d/idS/pZQ85Tiz1QVJxsTI6U+l61lQ56zgMkg1FeNKyE8
	8MuI5Irt7odTZuJSHvkuQnwkXTezyts=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-245-P-J7UxovPlqlSrQdJqDxYQ-1; Thu,
 28 May 2026 09:36:37 -0400
X-MC-Unique: P-J7UxovPlqlSrQdJqDxYQ-1
X-Mimecast-MFC-AGG-ID: P-J7UxovPlqlSrQdJqDxYQ_1779975395
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8502A18005B9;
	Thu, 28 May 2026 13:36:35 +0000 (UTC)
Received: from localhost (unknown [10.2.16.62])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2925418004A3;
	Thu, 28 May 2026 13:36:34 +0000 (UTC)
Date: Thu, 28 May 2026 09:36:33 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Parav Pandit <parav@nvidia.com>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: MSI-X vector limits and reserving a virtio device ID
Message-ID: <20260528133633.GB40266@fedora>
References: <11771164-7919-43e1-a980-03f036bdae2e@gmail.com>
 <SJ0PR12MB6806C5A16CB0899E095E835EDC092@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <CAAjaMXYGMTok_a2CJK8aKSqbTbgLx1CbkCVZw2VnZdJVuPJ38w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GIkM2LLcpkUHVxTN"
Content-Disposition: inline
In-Reply-To: <CAAjaMXYGMTok_a2CJK8aKSqbTbgLx1CbkCVZw2VnZdJVuPJ38w@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93


--GIkM2LLcpkUHVxTN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 08:47:25AM +0300, Manos Pitsidianakis wrote:
> On Thu, May 28, 2026 at 8:22=E2=80=AFAM Parav Pandit <parav@nvidia.com> w=
rote:
> >
> >
> > > From: Demi Marie Obenour <demiobenour@gmail.com>
> > > Sent: 28 May 2026 05:23 AM
> > > To: virtio-comment@lists.linux.dev
> > > Subject: MSI-X vector limits and reserving a virtio device ID
> > >
> > > I'd like to reserve a virtio device ID for virtio vhost-guest,
> > > formally virtio vhost-user.  Would this be possible?
> > >
> > Vhost user is an implementation of the device.
> > I believe it stays as implementation and not a new device type.
>=20
> This exactly.
>=20
> Furthermore, we already have a mechanism for "providing" an arbitrary
> virtio device; it's called a transport.
>=20
> Demi, I suggest you look into virtio-msg transport, which would allow
> you to do what you want.

I think the "virtio vhost-guest" device is a continuation of the
virtio-vhost-user device work:
https://wiki.qemu.org/Features/VirtioVhostUser

It is a VIRTIO device type, not a transport.

The idea is that a driver VM runs a normal VIRTIO driver (e.g.
virtio-net-pci) and a second device VM runs the virtio-net device
implementation. It's similar to running a vhost-user-net device on the
host, except now the device implementation runs inside a VM instead of a
process on the host. The virtio-vhost-user device is what the device VM
sees and uses to provide the virtio-net device to the driver VM.

Stefan

>=20
> >
> > > Also, I'd like to know which systems have a small limit on the number
> > > of MSI-X vectors.
> > I didn=E2=80=99t follow the question. Typically, Intel cpu has a limit =
of 256 vectors per core.
> >
> > > The vhost-guest device uses lots of MSI-X vectors.
> > > Typical implementations will use 256 * 3 + 7 =3D 775 of them!  That c=
an,
> > > of course, be reduced by sharing vectors, but this is undesirable
> > > as it comes at a performance cost.
> > Did you get a chance to measure the performance, for which device type?
> > Interrupts are generally moderated.
> > In other devices (scalable functions of mlx5) I have measured perf of 8=
 to 16 queues sharing a vectors has < 4% perf drop.
> >
> > > --
> > > Sincerely,
> > > Demi Marie Obenour (she/her/hers)
>=20
> --=20
> Manos Pitsidianakis
> Emulation and Virtualization Engineer at Linaro Ltd
>=20

--GIkM2LLcpkUHVxTN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmoYROEACgkQnKSrs4Gr
c8iY7gf+OFlvve9iwwDpHhFNW2SxEEC73JkyDY90aaFjDgEXlMBk7OvdERn93sQg
3bdPwe2+C0ncYmiaLhvU6C9TcsgjVF5uWfFl7h1NliDN4LA9cGEOj13SyUMKSYHI
JeFZgZefhTOua4XILjmWeTJSXgNngY5XhnRyiyTd3a6vJn8s0zb8TY8CaEg/kfEL
Er7rNGYHLTrxZFqpTk88HSo5BMNFZtFoeT//hz5S4ojvnGyaHGDccJaKFgGs+p2B
ub4gGoCbuA99qtH+7giNKlttXWblCWVULMUclf6qwNuuXohCH3WYHnU5MfJf/y16
pYFou3RX2g2Vvr2Fo9SKoSr2UklVnQ==
=wcFT
-----END PGP SIGNATURE-----

--GIkM2LLcpkUHVxTN--

