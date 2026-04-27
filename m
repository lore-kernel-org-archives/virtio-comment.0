Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3214C3CB2F0
	for <virtio-comment@lists.linux.dev>; Mon, 27 Apr 2026 13:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297107; cv=none; b=pz2zgzr8oFoe2IdpnHKcYYGtkpJN/KDrtj473jsgt23McrzQfe5yngpsY1AGobrfiF7OEdELREsE0ryIbrR+pIbHpu0qrfGv4QJtqbsDTwO8VwtGHG2bTrmEJawIaqOjTTtsIe9gUQb3IF5T4311eRJ0KuFN9zgCWq6qIAHT2hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297107; c=relaxed/simple;
	bh=jmZ6dGq4cHwXGaCaHtO1xX5keXTmjfgQkIdiMe+cdiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1ZDG54drfgGZSLUSlwHWFRTFCvb17GfX5nel7vJAIKNdSqdSYA7hDrC/loUma8SJr8vDZV8jD9+hfG6NUsRtc01uc1cT2Q840l9JJyrXhGGm1PyuLWdOTAr6YJTPYUwn4L0jvlW383WlNXxl1wdWnNlESjzvAR1o02hU4MhHvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z5V2gtMz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z5V2gtMz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777297104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u2djng5Y569uKmd7iO5X0r4ivmqXs6Ik77Cm7W3CEPU=;
	b=Z5V2gtMzR59nCptKDOIymGoT6HvW1+B1EMleaPFCTaHrVmFbrWQFd0cbMFjwtAdAkUjRF5
	icBQUTBsOzucPUDm4OmnFb5j/rvGeYLSjrybFjgizq23dP53FMUK5EiU+Pcw2NXpPLMNbG
	Dse4KkR4qGksjmvYEREUH9wCUwV0qLc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-45-Kr7hpfoTOHOn1mJBtKHQcQ-1; Mon,
 27 Apr 2026 09:38:22 -0400
X-MC-Unique: Kr7hpfoTOHOn1mJBtKHQcQ-1
X-Mimecast-MFC-AGG-ID: Kr7hpfoTOHOn1mJBtKHQcQ_1777297101
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 790001800378
	for <virtio-comment@lists.linux.dev>; Mon, 27 Apr 2026 13:38:21 +0000 (UTC)
Received: from localhost (unknown [10.44.34.59])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BBC8A195608E;
	Mon, 27 Apr 2026 13:38:20 +0000 (UTC)
Date: Mon, 27 Apr 2026 09:38:18 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v2] content: clarify feature negotiation terminology and
 init sequence
Message-ID: <20260427133818.GA218226@fedora>
References: <05b081b9c5a3a904fda3e378ca3e91a2c9375c27.1776982968.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dp0ghqQr6k4VQZMO"
Content-Disposition: inline
In-Reply-To: <05b081b9c5a3a904fda3e378ca3e91a2c9375c27.1776982968.git.mst@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17


--dp0ghqQr6k4VQZMO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 06:24:12PM -0400, Michael S. Tsirkin wrote:
> Make several clarifications to the init sequence documentation:
>=20
> The Linux virtio core (drivers/virtio/virtio.c) initializes devices
> as follows:
>   1. Intersect driver and device feature bits
>   2. finalize_features() - write accepted features to the device
>   3. drv->validate() - read config space, may clear feature bits
>      (e.g. virtio-net clears VIRTIO_NET_F_MTU if mtu < MIN_MTU,
>      balloon clears PAGE_POISON if guest does not init pages)
>   4. If validate changed any features, finalize_features() again
>   5. virtio_features_ok() - set FEATURES_OK, confirm with device
>=20
> this allows the device to know which fields will be read:
> recommend this in the spec.
>=20
> Legacy driver detection is specified using a mechanism that
> does not work on all transports. Make it clear that it's an
> example: what matters is that devices do detection in some way
> and are compatible with legacy drivers.
>=20
> Define "negotiated" for features confirmed via FEATURES_OK.
>=20
> "acknowledged" is used as a synonym for "accepted", but only in two
> places. Just use "accepted" consistently.
>=20
> Spec describes multiple moving pieces then ends with "before accepting
> it" - vague, and is overloading "accept". Replace with a reference to
> FEATURES_OK.
>=20
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/241
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>=20
> changes:
> address review comments by Stefan
>=20
>  content.tex | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--dp0ghqQr6k4VQZMO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmnvZsoACgkQnKSrs4Gr
c8iJdQf+L0YV16stVkhBl+S0wBkyAqjaSSsOfzEtrzvIFv6MnsGOBpMNLKB8BoEt
4ds+3AoAHmybOWUqwVml/xW9N4ZJbhnfC1VeFRCBQ/jTc/qC7NcLgFOzOVjw7FCG
6d1sGMKNObIM40CF5VH1tyuImXzUtiP7jLjXCxx06lwPZRd4jaum7qQvPTu4Cz6/
aszMA87zom30vxJPzpKmp0BGthF3l0jrJzz6bZefbRbZ4Ox7Jwj4APPHKDdjk2Hc
TmtuMTTXcDC+r5rzd79AFTQcQPsqVBKRaegcbQVj+RE8F1TmFh9YFsgBgL/NGpwT
w7bHAUvzXkPqYWUYrOS+05QNMqVrvg==
=7jX/
-----END PGP SIGNATURE-----

--dp0ghqQr6k4VQZMO--

