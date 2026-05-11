Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9E2407562
	for <virtio-comment@lists.linux.dev>; Mon, 11 May 2026 17:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521748; cv=none; b=lneMM6gbR7kXMT2AuuEjySVI2Y3YYz8EngRmSs4mNdwsAuKDnnYSUatiXrGR/2VpFohGJmL4r3W9JyhVSRpMVLfTuStkfIkdULzHUgzQB8bJc+vzfUaj1qPWCRZGbMsT99GgIXXhRtiQ2+FJeAg1x4538bqgiuCkYjlRon5GmfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521748; c=relaxed/simple;
	bh=JtiVW1xrxCHhSVqNz9w8XS5y00iqjBy7jFfb4Ay690s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCmf9KQo0dQLcyCi4rnepRWMGuqjgT067MbmDjV1v0qo7nlt4tFIfvNZlLhd8ZFwnkdoSVllRV+mz3KimFeDgPiMR+HjZjk04LN4HVxaofMQUeTkhd5BxQgfZ7+CbIAqhOXHDt9ot54e1Enpn20vHNeh6abUnb3r+AugyrqOk10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K6rnCMSt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K6rnCMSt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778521745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JtiVW1xrxCHhSVqNz9w8XS5y00iqjBy7jFfb4Ay690s=;
	b=K6rnCMStk2767iSW5XpwMkAWUVrM3pZri/pn4fISZd1e2zn4QN3f4z/17eS+ZUIs6tYtME
	eIZYZvVnv8XkyxJEd4xMIZ9lT/SIk1WPTtzblSLPrFdzb7E4u5gfHAaLnx/ZC8E1rzIgh3
	eQNCxPNzRUke3gbX2oDi/ePf1Y6BZuo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-539-YR__fkU2OfWuKGYUNpa8cQ-1; Mon,
 11 May 2026 13:49:02 -0400
X-MC-Unique: YR__fkU2OfWuKGYUNpa8cQ-1
X-Mimecast-MFC-AGG-ID: YR__fkU2OfWuKGYUNpa8cQ_1778521741
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E1C9E19560AE;
	Mon, 11 May 2026 17:49:00 +0000 (UTC)
Received: from localhost (unknown [10.2.16.172])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3FC9D1955D84;
	Mon, 11 May 2026 17:48:59 +0000 (UTC)
Date: Mon, 11 May 2026 13:48:59 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: mst@redhat.com
Cc: afaria@redhat.com, dverkamp@chromium.org,
	virtio-comment@lists.linux.dev, sansshar@redhat.com
Subject: Re: [PATCH v4] virtio-blk: Add support for "Force Unit Access" writes
Message-ID: <20260511174859.GB536999@fedora>
References: <CAELaAXxJy7vyjq+zegKzGL_W24GC_k0cRmVnqLCuiFmVtXpL1Q@mail.gmail.com>
 <20260511134832.503803-1-stefanha@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JoJMex5E7BkQHnGC"
Content-Disposition: inline
In-Reply-To: <20260511134832.503803-1-stefanha@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17


--JoJMex5E7BkQHnGC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2026 at 09:48:32AM -0400, Stefan Hajnoczi wrote:
[Resent from my virtio-comment list subscriber email address]

Hi Michael,
I don't think this issue was ever voted on?

I have verified that the spec patch still applies cleanly to the master branch.

Please begin the vote.

Thanks,
Stefan

--JoJMex5E7BkQHnGC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmoCFooACgkQnKSrs4Gr
c8iFbgf/UD3GNYGL9bvJcTuAzJJXT6gL4LFy4hZhPtcfjEdq33+KjbfyRKWpoZrF
I/NQOubu9nhYy5FeaeRiuMhAheEXvEZR3MgWMLDJUeFLWkBKzVjUhA0RSRve3nn0
XeOfRRJObDYKP1f8PnqI8q6xuly5UAn48N1BB2A3jyQsxAemCbNkzKVDTfNriY7Q
pzBXDaZl/97KDlKlryRTPfx5le6C8XP5Yrllamahqg+59G4cWLLyeiGmOSIUwc+A
U2zR4FNpl67l80iy1gUIjXVncrjgN1w4jkIpdrobdr/uBcY5yGTESZ2MdCJLxFY3
ROO0cGFEUmamHV7qk8aFgKwdYTGrlQ==
=YKty
-----END PGP SIGNATURE-----

--JoJMex5E7BkQHnGC--

