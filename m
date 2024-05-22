Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706301422C2
	for <virtio-comment@lists.linux.dev>; Wed, 22 May 2024 18:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716401414; cv=none; b=nb01xGbV5XY/XQ7ruedNlpXiSOveTgLaiajmcztHOffcF+2VOLPioysLR2C++gnoTHm/+noT7NSOjf99qyfv+wbqnSmhZC/hIgUX/lPcforEWzBD/vhEedfyzxhtCBaT8DH/oBD3EsgJiNiVZNXaCwKGSn2Kqv1BnToi7mtq3zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716401414; c=relaxed/simple;
	bh=U2UhrCkBoBCzdOqwrjaNUmdaFSihsVkSoNztS2qnge4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJlc17Bx60Y1eWpymFlSR0xyUnxQpvF8k0BKIGG6LyMf2RoYSCa+Ea/u6NfW/dwggg19g0chJAHGIWw6EXc6mRiQ4Z8Apss6zWchpxTEnY+Qe37HuWG3Wc2tdY71MGxMNjUIBnayrUtb6poRVNj4eCAeYe+tdoKhZbmwIKBUbJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R/nDCX1E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R/nDCX1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716401412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rp0RJusEGGQRS8Id9adCrCaGs++6ED5kl9+wS9fO/oc=;
	b=R/nDCX1Emk1EnDLyvyRXfjn6t2rRYT6jSuSShPc37ian1qSHNy0anz8LmyRqQHz6GlndOm
	QYBoaOfR8kbzvDqfhvn9Ayb66k4RVQJ7hZEIho+bPWsRjK1ZXNtb8t95dXZAhoQ6BpIfAm
	Ii+kuEPSHCOcF2Z8dkO/PL7/0bzwKwA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-uHV0cMABNveouMdb9avQsQ-1; Wed, 22 May 2024 14:10:08 -0400
X-MC-Unique: uHV0cMABNveouMdb9avQsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEFE38058D1;
	Wed, 22 May 2024 18:10:07 +0000 (UTC)
Received: from localhost (unknown [10.39.194.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 977D02026D68;
	Wed, 22 May 2024 18:10:06 +0000 (UTC)
Date: Wed, 22 May 2024 14:10:04 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
	shahafs@nvidia.com, Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: Re: [PATCH] virtio-blk: Fix data type of num_queues field
Message-ID: <20240522181004.GA262143@fedora.redhat.com>
References: <20240521122119.2004071-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AxbIsV+t3BZhVco5"
Content-Disposition: inline
In-Reply-To: <20240521122119.2004071-1-parav@nvidia.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4


--AxbIsV+t3BZhVco5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 03:21:19PM +0300, Parav Pandit wrote:
> Correct the endianness of num_queues field to be little endian.
>=20
> Suggested-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  device-types/blk/description.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--AxbIsV+t3BZhVco5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmZONPwACgkQnKSrs4Gr
c8iUtAf/bwnz7zewUfngQBVXKwVUZ07YfunqlOXpTAcPfbtNsplMcHE01qYVLSqM
BHoAGKnyLK+zeLDZ42ZA3/uRl74oyPG4khD5Erpq+TI9r+8c3GtdRo2rdeHogT0f
tFBwhBKQ6vF4BLC7TEyipVr1SOvg/TFoGpeHdqodPS57ahhdZv4s34LYsD2RI2B/
kQO9QMSTI/G6DzRLwVweKjNwxd3WfM1iBWCOtIOf5roZUBQjuSB5WVnriBR6G+ci
1SbwLVc8vUepsa5iI94FDYavvqcm+U0Gp5jIjDDA+Kc3fVVGfSChU1D5tyYgk97+
z1ATsNUnRpqdq5HrwcpUrVremFufHA==
=If/B
-----END PGP SIGNATURE-----

--AxbIsV+t3BZhVco5--

