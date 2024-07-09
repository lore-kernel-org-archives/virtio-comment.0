Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12AF13C3C9
	for <virtio-comment@lists.linux.dev>; Tue,  9 Jul 2024 12:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720527297; cv=none; b=XQ7XOlELlL3eYigqssmUNKQqfK7xXB6Alt8R6xnJYlnSLfWxTWdgLjd4DZPeY4Of3pXjHU0BN4Ul/0eZeXVxFi9G9ZHUx1T7jggq22+xilLaYXA2kedLIc5otbjVuByxJfYBsrcOLBoy64ITsMRFwyNN8/k9KLm4s/87hJwfbjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720527297; c=relaxed/simple;
	bh=G3xs/yRO6R5V3R9NfMm4B7Hbe6dhsbbqQRaDbZiSmGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvtejP1dLDphaNv9TNqQq/ux6l9JD0dBGf2ucw4vqGZueRUquMatHzUB/CBWjzUjlSmPeHgD9suujcEQ0DLiztW/OTnuKfuzF5PUdpolMdvdZwArdX+B5WsV/xouc9iz8erd0C9mtcI463Eg8m+TG2cyljgumaBGRFoImY/5/fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YtCZv+QZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YtCZv+QZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720527294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G3xs/yRO6R5V3R9NfMm4B7Hbe6dhsbbqQRaDbZiSmGs=;
	b=YtCZv+QZmZT/VK/ronOMR2VUEyLWhkCp52BxxCnqNITwMhBXHSThfm0HGWwZv7cugEKIx+
	kfchAO9K8/oKlyAcjuQlj7o38o2gLT3almpbZrjTQskRdwinjr2PDADCx003FCy+Wlp9wL
	/PfsFLO5fPeEV2wxsDAX+Yumy/0EoFM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-13-DwRequqKOFiPxceI-4osGg-1; Tue,
 09 Jul 2024 08:14:51 -0400
X-MC-Unique: DwRequqKOFiPxceI-4osGg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DE2D71955F44;
	Tue,  9 Jul 2024 12:14:49 +0000 (UTC)
Received: from localhost (unknown [10.39.194.43])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E040E1955F40;
	Tue,  9 Jul 2024 12:14:48 +0000 (UTC)
Date: Tue, 9 Jul 2024 14:14:47 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Keiichi Watanabe <keiichiw@chromium.org>,
	virtio-comment@lists.linux.dev, uekawa@chromium.org,
	takayas@chromium.org, dverkamp@chromium.org, tytso@google.com
Subject: Re: [PATCH 0/1] A new virtio-blk error code for host-side ENOSPC
Message-ID: <20240709121447.GA505842@dynamic-pd01.res.v6.highway.a1.net>
References: <20240618081858.2795400-1-keiichiw@chromium.org>
 <20240619140024.GA57633@fedora.redhat.com>
 <20240703185505-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rC5rwNAC+ukWmMzY"
Content-Disposition: inline
In-Reply-To: <20240703185505-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17


--rC5rwNAC+ukWmMzY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2024 at 06:55:38PM -0400, Michael S. Tsirkin wrote:
> On Wed, Jun 19, 2024 at 10:00:24AM -0400, Stefan Hajnoczi wrote:
> > On Tue, Jun 18, 2024 at 05:18:57PM +0900, Keiichi Watanabe wrote:
> > > This patch proposes a new error code VIRTIO_BLK_S_NOSPC to report
> > > the device's ENOSPC error to the driver so the driver can treat it
> > > in a different way from other IO errors.
> > > More motivation is explained in fs-devel mail [1].
> > >=20
> > > [2] is a prototype implementation in crosvm and [3] is in virtio-blk
> > > driver. Idealy, the error should be propagated to the guest file syst=
em
> > > and handled smartly, but the part is still under discussion.
> > >=20
> > > [1]: https://lore.kernel.org/linux-fsdevel/CAD90VcZybb0ZOVrhE-MqDPwEy=
a8878uzA1RBwd68U7x4CufkTQ@mail.gmail.com/T/#u
> >=20
> > I have replied on linux-fsdevel so we can discuss a bit more about the
> > context and get input from storage and file systems people.
> >=20
> > Thanks,
> > Stefan
>=20
> Stefan could you also comment on whether we are likely to add many more
> errno values soonish?

I'm not aware of other in-flight or upcoming work that will add new
virtio-blk error codes.

Stefan

--rC5rwNAC+ukWmMzY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmaNKbYACgkQnKSrs4Gr
c8g1Uwf+M9EJjByLT9Tocj2FgqCw/KWTZszTmQxBTS/zfpxLPsi6673qrcxT4ap1
A0zSfTZlzcEz3OdKvVhwMLaBAWcgQ15YtjAQeVPkHvLK+ZZ2kwq5Id3KIvmcEfGK
TsW/aWtFrhxo6dVCDtNTXtN3bxhYv0HnnRj4VLSwG0wsNgaqjwzeuT5EHLY14xnx
H37FLU9DVF8owKF4no1W/YwxNWTQLCPNgMh0CC5En8V6B3X5qyc5kaSm7C7PZDHC
oNO70R5N5pgZy7/KS9218pV/aYIj1m3QLmIAJ7IRU0Rc2pIGakfor7Un8NQgPiKh
1/N64fUSd6zqePa4z5xHnhF2fHZGOg==
=PqhL
-----END PGP SIGNATURE-----

--rC5rwNAC+ukWmMzY--

