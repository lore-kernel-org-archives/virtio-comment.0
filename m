Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DAF1DFCF
	for <virtio-comment@lists.linux.dev>; Wed, 19 Jun 2024 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718805636; cv=none; b=pZVbLXPTKD6/8zJJZlk0oK+7jP5pqzMI6jVnxI5J5a3OODq9NRje955tWCBrOdSyfF8fH1oCY0AwcnLTEKcR+o81FmAGBC2Jpd2CgwniJ1xIncNw1lM/jBfqx0jUkTvZYaKzzLt7A6ezXKxQwwDzhl57P45qvX5EGizJy7J3HJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718805636; c=relaxed/simple;
	bh=vyQI/WLDNamalE0O8MPIYBLGfckkr98nZbLWdRmmTyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JN9MoKkWJkGVVyH4dpybYyH/mF6+ZYiQqlKlhTyMPyqqV9itLzjitpjBxmWWuux6McaSRiEXr1qFD6K78APiBRQC3iCX3gEpUtJpYYUrpCcDwPfg62CQM4Xo0OcOwxKHxzXHCxCI9bCZOT2UifuLcwU0jDR4rWQ723l6UT9fjtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fkdiWqZS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fkdiWqZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718805633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Qjy3TpVXVSIvLQswxM70NiU6CS17k14VxMf43R52gw=;
	b=fkdiWqZSXRhXG4U4Nt+y/MWNgSR6KQLPWntqTW8EgR2AazbJOsdOZJRtsVGF57ja1BV3Uf
	F4hmta9oYO34VpxxdO5qr4jSuEEz4fe/cqmHmUYKC5SGZXr38phzXSysgcfLGHuw+wnvVB
	1Y6kea4zkbcAoGy0tfpCuBLqoDzMjeU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-60-40iTPsarMSGHAC04a2BXGQ-1; Wed,
 19 Jun 2024 10:00:29 -0400
X-MC-Unique: 40iTPsarMSGHAC04a2BXGQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AA9111956066;
	Wed, 19 Jun 2024 14:00:27 +0000 (UTC)
Received: from localhost (unknown [10.39.192.3])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C987A1956048;
	Wed, 19 Jun 2024 14:00:26 +0000 (UTC)
Date: Wed, 19 Jun 2024 10:00:24 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Keiichi Watanabe <keiichiw@chromium.org>
Cc: virtio-comment@lists.linux.dev, uekawa@chromium.org,
	takayas@chromium.org, dverkamp@chromium.org, tytso@google.com
Subject: Re: [PATCH 0/1] A new virtio-blk error code for host-side ENOSPC
Message-ID: <20240619140024.GA57633@fedora.redhat.com>
References: <20240618081858.2795400-1-keiichiw@chromium.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Seaz0EGu4P5fIztZ"
Content-Disposition: inline
In-Reply-To: <20240618081858.2795400-1-keiichiw@chromium.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17


--Seaz0EGu4P5fIztZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 05:18:57PM +0900, Keiichi Watanabe wrote:
> This patch proposes a new error code VIRTIO_BLK_S_NOSPC to report
> the device's ENOSPC error to the driver so the driver can treat it
> in a different way from other IO errors.
> More motivation is explained in fs-devel mail [1].
>=20
> [2] is a prototype implementation in crosvm and [3] is in virtio-blk
> driver. Idealy, the error should be propagated to the guest file system
> and handled smartly, but the part is still under discussion.
>=20
> [1]: https://lore.kernel.org/linux-fsdevel/CAD90VcZybb0ZOVrhE-MqDPwEya887=
8uzA1RBwd68U7x4CufkTQ@mail.gmail.com/T/#u

I have replied on linux-fsdevel so we can discuss a bit more about the
context and get input from storage and file systems people.

Thanks,
Stefan

> [2]: https://crrev.com/c/5599649
> [3]: https://crrev.com/c/5600325
>=20
>=20
> *** BLURB HERE ***
>=20
> Keiichi Watanabe (1):
>   virito-blk: Support NOSPC error
>=20
>  device-types/blk/description.tex | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> --=20
> 2.45.2.627.g7a2c4fd464-goog
>=20
>=20

--Seaz0EGu4P5fIztZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmZy5HgACgkQnKSrs4Gr
c8hStQf/R6sKoATWb+QsW5Z2PN09uTbfsjjMiweTDF1FFCQmqHLQ6YdYiwjW9TdM
LHGOjrMbC9J5GnSLqi80agLKK10l2hpZ3z7/VRZZoy92/W3d+VYURNQe0rpvKoSy
zoleNd2gYXxIl4/WE8/anYk1iRnGEPTAndHBt30nxfFxAxl3N7XGhRKVkvyCRRKK
Tx5o2yR4kGPWsJ+biTdJ1opBa/sCfAIlz1xBy/dfxWXUMkC1hPgbhX2iJLk0HHO+
hHKEGeK6CkD9BLJbF+KoRztEJ3zyqt2bpz/wPH/QVdDtA2QSKi+1N7+k3QbxiG1i
4OGf5lYXG1dw3tH8B/Te/+3sFAfk/Q==
=goS+
-----END PGP SIGNATURE-----

--Seaz0EGu4P5fIztZ--

