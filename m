Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56628233722
	for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 18:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776881474; cv=none; b=cHHn7YB699fK6XSFRKVQAuPgexhvjYGd5AkGgeUq+hJOPUACWZYQMsM+g0iKH37c2mp9g9DV2YNxhIMWrSq68qVz1gb4460XpGhbSCSSGrm9vYIhRSJfV73QQ1e/68LhedJ9y7Zin6HwJFL2V+/GYUISz91IMxTQChH0dtJ1psM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776881474; c=relaxed/simple;
	bh=QtDIqL7J6/LU2B0Y//ygFbtSoqYgYJZEHeVn2rm6swY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQ8kmQTqkcDySYFekwV+AJSXN9SDmxIGlZJ/8v8QVzu7btp6dvGZHhgqUGwWVFY3mBjLUl62zvTcbPU9B/VibtVCh1XrikNOEsRG81oyXTVu5YKC8RIB3Qy6Rx+KYmIdx/04obZkKCzXcswZRhmHYyhpjU2EVnl4Io5/cqgdo4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RtTJVb3V; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RtTJVb3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776881472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/8NfjT5dajVkOm+K4KA/1uzKfa3Y5RoQPy90blWc6Zs=;
	b=RtTJVb3V580mD+xvJ6MuWjtdN7unfGD0tMJs8I6nKhiNNwflBjmKE7L/f0VkoQTNkq3oWn
	ezveGPpOd3eSCzoeKU//INfDNecYERV+3dX+HmXwQiM5xSKA07grXVAdT8zj7sT4FKjGhv
	Qqab5klopbBB78FOzmdP0tCvX0Lzfpc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-216-rxEsv59qP3GkzzHHjPw8_g-1; Wed,
 22 Apr 2026 14:11:08 -0400
X-MC-Unique: rxEsv59qP3GkzzHHjPw8_g-1
X-Mimecast-MFC-AGG-ID: rxEsv59qP3GkzzHHjPw8_g_1776881467
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 115E91956061;
	Wed, 22 Apr 2026 18:11:07 +0000 (UTC)
Received: from localhost (unknown [10.44.48.184])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3594E180057E;
	Wed, 22 Apr 2026 18:11:05 +0000 (UTC)
Date: Wed, 22 Apr 2026 14:11:04 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	virtio-comment <virtio-comment@lists.linux.dev>
Subject: Re: Max number of descriptors in a virtio-blk chain
Message-ID: <20260422181104.GC498202@fedora>
References: <8a7f186f-f240-4f58-a857-5900a2c0c217@gmail.com>
 <aejrkBlN3VtoNFwx@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3hmKfY5BbtmIx4pf"
Content-Disposition: inline
In-Reply-To: <aejrkBlN3VtoNFwx@fedora>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93


--3hmKfY5BbtmIx4pf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 05:38:56PM +0200, Matias Ezequiel Vara Larsen wrote:
> Hello,
>=20
> On Wed, Apr 22, 2026 at 04:02:06AM -0400, Demi Marie Obenour wrote:
> > Is there a limit to the number of descriptors that a virtio-blk driver
> > can use in a request?  In at least Cloud Hypervisor's implementation,
>=20
> I think this is limited to the number of descriptors that you expose to
> the device in the descriptor ring. In addition, I think the index is 16
> bits long.

Virtqueue size is the upper limit. There are also additional
Configuration Space fields that limit virtio-blk requests:

- seg_max: max number of descriptors in a request
- max_discard_seg: max number of descriptors for discard requests
- max_write_zeroes_seg: max number of descriptors for write zeroes
  requests
- max_secure_erase_seg: max number of descriptors for secure erase
  requests

Stefan

--3hmKfY5BbtmIx4pf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmnpDzgACgkQnKSrs4Gr
c8h7UQf4yU369k0yIf5nt6EN/04pPMCCSSdgLeB4Tp891KkWhEd0E5pfUS9LU/uQ
XTblTRaox4DSsMhmNiR59pL0SKUNqcN4nQ4Hiv1YSgALqrXGJ7N6NfZkz6fvj699
xAyeZZEBQs57VEsGXaQJV/3cG01JwSjfIXMVN3YYNpkOYDA+GvKikUyN587GU7T/
Ae7rIjUSqB9rGh/Ka0Ikvoh/dVcBP/rLibagJ0YsPxP275hPXNgDalr0t4fbiRMT
pGjfONyjAcO7XPHHoxC9jVHnEEBzkLg7eaR3VdsUioeJOcn7hINeKpOtbZ/JmsZT
qC29qFcndw0VN9EeL8CBuwT8uTjs
=qwFJ
-----END PGP SIGNATURE-----

--3hmKfY5BbtmIx4pf--

