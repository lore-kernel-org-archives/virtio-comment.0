Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4ED296BB4
	for <virtio-comment@lists.linux.dev>; Wed, 15 Oct 2025 14:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760539479; cv=none; b=tNlcCimwS3LnW3IjDoF52QXip5DvRtcDST0K8+70S0QG/2Fxv3ggOEK/v7mm+r6ed0h/WpTuUtHrIxf4vA/PzvOJ05MYVufhNYqC3/MwhaMfWxs8QOxWt+BupM66D/N9lg17sqedDc6ZH5J/h8eA0jrnMtHifpuetVw3z9UBG24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760539479; c=relaxed/simple;
	bh=9qYkVMAmgVtpYLZRmIJ3786iUtqnQVQk4zSlSgwBVsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n58Nm24xtFwGy0nQ9Jjq4Faf1A5ZDYEUXsAiHRTRGJYwHFWrrMZS9c51uEayTEIKdxSKJO8gVjsBZTHdIzpfSfPW+NJrdvaBlS+8H6XC8dq1MrL7YuTJlPuusHMGgQj5ibdhfFpWxfA9cTv49msUi340WXNymwoKnQNlUgs/xFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g4utmEnq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g4utmEnq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760539476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EtrPYyFjSdipgq1DfL40yLnRd6mAwM+/Qhdq4fJ72ZI=;
	b=g4utmEnqmLzzCWPrcxJhEly5gYljEDBc1Ydd3u+pnkxZdhsSghafgBIell9bR4mOczrmkr
	CsdoAr1hiO0Nv5+P3tIOWoIWTGzJg0P5iOdJw8BxcYM1NMLG5EzLG1UWiqGbMdSMJfKpIj
	TW/h4bbjPvNkqiDQlRxIcTUuOCA3tCE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-28-NeJa5ZOxPcOxgKVTkjYzeA-1; Wed,
 15 Oct 2025 10:44:30 -0400
X-MC-Unique: NeJa5ZOxPcOxgKVTkjYzeA-1
X-Mimecast-MFC-AGG-ID: NeJa5ZOxPcOxgKVTkjYzeA_1760539468
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 119421954112;
	Wed, 15 Oct 2025 14:44:28 +0000 (UTC)
Received: from localhost (unknown [10.2.16.91])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 68A1119540DA;
	Wed, 15 Oct 2025 14:44:27 +0000 (UTC)
Date: Tue, 14 Oct 2025 15:46:01 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.linux.dev, Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH v3 04/11] .gitpublish: update base to current working
 branch
Message-ID: <20251014194601.GE18850@fedora>
References: <20251010162858.4107388-1-alex.bennee@linaro.org>
 <20251010162858.4107388-5-alex.bennee@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hJJNiEhkkO823POc"
Content-Disposition: inline
In-Reply-To: <20251010162858.4107388-5-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17


--hJJNiEhkkO823POc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 05:28:51PM +0100, Alex Benn=E9e wrote:
> The current working branch is virtio-1.4 so lets use that as our
> reference for gitpublish.
>=20
> Reviewed-by: Parav Pandit <parav@nvidia.com>
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> ---
>  .gitpublish | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--hJJNiEhkkO823POc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmjuqHkACgkQnKSrs4Gr
c8h+0Af8CcdT3eZz8CM/78P3L3AaHjuUARJIe17Dx8hQ9a6mrZhh61LZUkKGSQJb
47lxNnxpxHRtoDyc/taQBXbetuGUSwWzCdN5D3jeIP9tMr552p7hXsNxJyM1XyXT
6ECr3l+V/39vYpplGceyvGj/Jvd8ye6a9iu1imu9Z9hCcN5uwUx7Fi4C1GiBAqJD
j21ALf0JANABKHnPy7qM9UC1eZVRPC+WlxqeHHzZyHfCq5jtykBhDL44YjTQiWUC
+s9SRYH/oTVFFZ+845UrS3Wl+mc4mYLM7QFJw1tyUrujQdidmUCeP82Xq+ZYlP6n
JNUtbX7JqXbuawutMwew1kICnpU8gQ==
=zx/n
-----END PGP SIGNATURE-----

--hJJNiEhkkO823POc--

