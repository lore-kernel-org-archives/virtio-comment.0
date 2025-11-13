Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04A223D7F8
	for <virtio-comment@lists.linux.dev>; Thu, 13 Nov 2025 15:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763049366; cv=none; b=siE/q4j2QZrmu3q3w7XFQjDOIR+emNd1nTbrfGnXK4ISK5h+10VNhm9nSHZCW/tGIVZnWmmByOqv6aGnydYVzOAdLYUNFNRFuOxp+A9mbUDDnjJuu5gwaSTFKLBL0Bu908guuawHdR5fJhaQSYtH/T8F2K3j8x2wKeca6Zzcpqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763049366; c=relaxed/simple;
	bh=/YBERbDnlNvEEju8P6J9fLCKmEXJAW07il2rpCb+LQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdy9kIT/WFyDd7V3Ch+c9Xa2rGx5Kvgt4bmGh56TkPpzqYOyg6Mzq6qaUo8BWPWek0oryAk8feYrVFh7/3YHtV8PfrY65jXf3qXabj4IP/BznGMSJbBBbxjkxIv4taaqdS5NE5Fxs4y79+2nqT2u80KWksklhRSNSzxDvejPSLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hIkJ+u6G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hIkJ+u6G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763049362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=miUKLDvjdcr115mhmReQ07Cxokwhp3zFzSa5up0L5NQ=;
	b=hIkJ+u6GharSjMFIq3dLiHAY720tZyRe0QvIYuB7IeSLSFEVsdeU0i8ka/zjhfYZLdJz3t
	gH6nai2SXL/FO1oJAeNYu/uXZ7sjggUnFBSPjEV518kFNTHyBU8OLSmxj0NGmKgVzwS2/U
	QoQ2EsCR8iOO6OhAFOXSX4/gbnvlR6g=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-142-jnJ5IVUsMlOgbu9GMGxhJw-1; Thu,
 13 Nov 2025 10:56:00 -0500
X-MC-Unique: jnJ5IVUsMlOgbu9GMGxhJw-1
X-Mimecast-MFC-AGG-ID: jnJ5IVUsMlOgbu9GMGxhJw_1763049359
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8DBA11956080;
	Thu, 13 Nov 2025 15:55:59 +0000 (UTC)
Received: from localhost (unknown [10.2.16.177])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A6CE2300018D;
	Thu, 13 Nov 2025 15:55:58 +0000 (UTC)
Date: Thu, 13 Nov 2025 10:55:57 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, dverkamp@chromium.org
Subject: Re: [PATCH v4] virtio-blk: Add support for "Force Unit Access" writes
Message-ID: <20251113155557.GD189474@fedora>
References: <20251112055113.62207-1-afaria@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="//My83XEFAD5o8g2"
Content-Disposition: inline
In-Reply-To: <20251112055113.62207-1-afaria@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4


--//My83XEFAD5o8g2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 05:51:13AM +0000, Alberto Faria wrote:
> Add a VIRTIO_BLK_F_REQ_FLAGS feature bit converting the current
> `virtio_blk_req::reserved` field into a `flags` bit field, which can be
> used to modify the behavior of an entire request. The meaning of each
> bit depends on the request type.
>=20
> Define a single VIRTIO_BLK_REQ_FLAG_OUT_FUA bit as signaling that a
> VIRTIO_BLK_T_OUT request should be a "Force Unit Access" (FUA) write,
> i.e., should become stable once the request completes. FUA writes enable
> better performance compared to the alternative of waiting for a write to
> complete and subsequently submitting a flush.
>=20
> Also add a VIRTIO_BLK_F_REQ_FLAGS_OUT_FUA feature bit indicating device
> support for the aforementioned FUA bit.
>=20
> This approach allows for future expansion to other request-level flags
> and allows the same flag bit to be used for different purposes on
> different request types. The VIRTIO_BLK_F_REQ_FLAGS feature bit ensures
> compatibility with legacy devices/drivers that interpret the
> previously-`reserved` field as a priority indicator.
>=20
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>=20
> v4:
> - Have the semantics of each request flag depend on the request type, as
>   suggested by Stefan.
> - Some other smaller rewordings suggested by Stefan.
>=20
> v3:
> - Changed to a more future-proof approach somewhat similar to what was
>   suggested by Stefan.
> - Included a brief rationale for the introduction of FUA write requests,
>   as suggested by Michael.
>=20
> v2:
> - Redefine VIRTIO_BLK_T_OUT_FUA to 27 since 15 is already in use.
> - Clarify that the cache mode has no impact on VIRTIO_BLK_T_OUT_FUA
>   semantics.
> - Allow drivers to negotiate VIRTIO_BLK_F_OUT_FUA even if they are
>   incapable of sending VIRTIO_BLK_T_OUT_FUA commands.
>=20
>  device-types/blk/description.tex | 43 +++++++++++++++++++++++++++++---
>  1 file changed, 39 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Please see here on how to bring this issue to a vote:
https://github.com/oasis-tcs/virtio-spec/tree/master?tab=3Dreadme-ov-file#u=
se-of-github-issues

Thanks,
Stefan

--//My83XEFAD5o8g2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmkV/40ACgkQnKSrs4Gr
c8gayggAnUjM5GEcHbUWb6GYAylqRbBXB3RhwBnafsqv7/mvMrBP1sN87rIHZqCB
t/GwE+yT+7t44A3huGLXNJNjueKxdIeF4zw6FA9xmyxWzZomLbdswZtImy+MeTBC
V8DYbagb9wSG5VKXWC1IOoxvcD290hvdtKlH9n1C21XsGKAmY59yCiFLenjuBmJE
cmPvS0MjTKfbMvwVcYO83yZ3yS8snKC/uu7eKl1emVlnJ7gozO3cDjlRg3Q7R/I8
LGF5Vb3mRqU9ZZIqJYD0QrI/sqvbSRb+zM/hn/KAyycKVLrhuYbXTsi5AM85FDNZ
XX2rOc3JPmGmxRPrOzPJldkVGjuF3Q==
=Qykw
-----END PGP SIGNATURE-----

--//My83XEFAD5o8g2--

