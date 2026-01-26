Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413732264A3
	for <virtio-comment@lists.linux.dev>; Mon, 26 Jan 2026 15:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769442880; cv=none; b=tPnw1GFhyq800iBSj8WkehYtn2mSOL2+6vco9p4qDz0j8bLK4z2epHFzyo80zCX1bhMJdBcgDs7LBe+l44kUX+DDJF5jDVh6XUorZv7gR82ZhADALy4C5NjvdwNMIvgU3zW2UEhgKDIWzH6+OB4cu7fayhS1pgrNL6o4jbJeYnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769442880; c=relaxed/simple;
	bh=rsBLRzA5pdDZsWnnMFGag9ktyDGjNztg0wbFGezo4gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+GpcQlAZ0e6qPRBfE9BBm74oMZ1/pkL28ICXkB6nYh7Wsr6bbEyeFuEIkUdJsFYTvwO3259/MPzu2uqt50pLDEPn9aPQ68P14dDmjXFCC0NUxlhzwGwDuSVYQYxNZfGe9hWJz4FRmgrFGS19rEdwe8K+qAe1kfyDGjZhBdyNd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HXdQSgiu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HXdQSgiu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769442878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WhQSTP0RhnhkI2+PjGUVWz0dY8o9ew1vLF69CruvlNY=;
	b=HXdQSgiuWmi/BhfD+iwn2dMiUBAgwfnnEkfxToS88XZoFQujMG+6YM1KxSXvx/imrQmwJI
	Y9sAKtg6cqMHcQcJi8/tfdRFpXeOPW+FfLybH8q1a7esr+Ns09b2XjyRLbrVa+r9Wz5zAt
	CjHKddQ7HX1Htu5+pzeiKWoUDMmjt3o=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-232-J6SaYQgBNgmSW-dGO8CvmQ-1; Mon,
 26 Jan 2026 10:54:31 -0500
X-MC-Unique: J6SaYQgBNgmSW-dGO8CvmQ-1
X-Mimecast-MFC-AGG-ID: J6SaYQgBNgmSW-dGO8CvmQ_1769442870
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8DCD919560B5;
	Mon, 26 Jan 2026 15:54:30 +0000 (UTC)
Received: from localhost (unknown [10.2.16.173])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 190B11956095;
	Mon, 26 Jan 2026 15:54:29 +0000 (UTC)
Date: Mon, 26 Jan 2026 10:54:28 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Yodel Eldar <yodel.eldar@yodel.dev>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH] packed-ring.tex: Add comma and remove redundancy to
 improve readability
Message-ID: <20260126155428.GB7901@fedora>
References: <20260124001740.34803-1-yodel.eldar@yodel.dev>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E20lDCx8X0ztVUTO"
Content-Disposition: inline
In-Reply-To: <20260124001740.34803-1-yodel.eldar@yodel.dev>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17


--E20lDCx8X0ztVUTO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 06:17:40PM -0600, Yodel Eldar wrote:
> A comma after "set" separates the prepositional phrase from the main
> clause where both the prepositional object and subject of the main
> clause are long descriptor flags, thereby improving readability.
>=20
> Also, the second "is" refers to the same subject as the first and is,
> therefore, redundant. Eliminating it improves the flow of the sentence.
>=20
> Signed-off-by: Yodel Eldar <yodel.eldar@yodel.dev>
> ---
>  packed-ring.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--E20lDCx8X0ztVUTO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAml3jjQACgkQnKSrs4Gr
c8jESwf/U3Kk8VmYJD1nJtnjfuxUdBG71u+v2JJCD9RwHKW8BqfrNdD54P/NcQeL
ReR/VH5wNsUawA57l4cukLnAbdbITqqtnMeOfGDmAUK3Zxv477u/24hVULx/reeP
dw/GP1myh5aRmnuPzYJ9Yjqdg86wiuSSCOnzCmbYvk99CavJCQkXlqkqLDV29LHp
EoxsIbBLTWvCWQRj5uD+CCLSuO8GgspQgf+7CeE/nNhhs267jzarJgmKBY1ZVLpE
h2Nq4VBdWtJEzxRyF3f9Sz7yfFW2OWEiDeolV9MEPUaUP0zuFvs0J+38yznYQ1vQ
BamWqysSGaFa5CLnsEp9fgpPCO5tdg==
=OFl5
-----END PGP SIGNATURE-----

--E20lDCx8X0ztVUTO--

