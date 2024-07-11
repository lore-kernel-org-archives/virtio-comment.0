Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A94DDDF
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 09:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720689428; cv=none; b=DVvtlfbZztkOfaR2phe9LajS4p8rccTIvXcW96kt7hrEJn1xXkoLsSdw4EQXCkodcJ+yxkb110WkGPXb8RfL+2Bl0MK+XWWFomzkc/T2P3Dee1gbsIs+1MnNuSFvvrGO/Hq/agEv1S66CSxdHXnwLgOqdaIYVgOv6OfPEyNZFqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720689428; c=relaxed/simple;
	bh=mL8THqMVjax1FfYOwPRid7xfX6lwIUX2CHt+RtAFLlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNi2TUTdY7dgIV2AMmbjmIjZ7G2T3CGIVQKui21H9RR2dDOKxMET/URxzz51OVZHzBt3oes9Ioh6AwnZNaM+PC23M24VBCudtr85TjfnS/pCWiwX9iIBUEkN5R5Qdp+LDoDdFoQKM4z4oZxA0evZrQdoqKPTKWPiTO3EyRj6dNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cMvBzemb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cMvBzemb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720689425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mL8THqMVjax1FfYOwPRid7xfX6lwIUX2CHt+RtAFLlk=;
	b=cMvBzembHl/kP1VRIE9a9207hKK+qBTccY9pLt0Y90A/OeSjGFKx4iImmXOCqqzVhRraCE
	lhi1XK/r/n2fPU7s3rRpNeQ2+q8DFJeY/NijNXm7cILebK0nX6nAQqL5MxdhXCgwMIEJPu
	XddF/5xkTWED+AlTsYmL27qqqMlN3c0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-159-w_LQ1mtiMmiNiHSxhzfDWQ-1; Thu,
 11 Jul 2024 05:17:00 -0400
X-MC-Unique: w_LQ1mtiMmiNiHSxhzfDWQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2961A1955BC4;
	Thu, 11 Jul 2024 09:16:59 +0000 (UTC)
Received: from localhost (unknown [10.39.192.113])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3F90519560AE;
	Thu, 11 Jul 2024 09:16:57 +0000 (UTC)
Date: Thu, 11 Jul 2024 11:16:55 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Keiichi Watanabe <keiichiw@chromium.org>,
	virtio-comment@lists.linux.dev, uekawa@chromium.org,
	takayas@chromium.org, dverkamp@chromium.org, tytso@google.com,
	Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH 0/1] A new virtio-blk error code for host-side ENOSPC
Message-ID: <20240711091655.GL563880@dynamic-pd01.res.v6.highway.a1.net>
References: <20240618081858.2795400-1-keiichiw@chromium.org>
 <20240619140024.GA57633@fedora.redhat.com>
 <20240703185505-mutt-send-email-mst@kernel.org>
 <20240709121447.GA505842@dynamic-pd01.res.v6.highway.a1.net>
 <20240709092959-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W5PGhYV8XrhKTJM8"
Content-Disposition: inline
In-Reply-To: <20240709092959-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12


--W5PGhYV8XrhKTJM8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2024 at 09:31:08AM -0400, Michael S. Tsirkin wrote:
> On Tue, Jul 09, 2024 at 02:14:47PM +0200, Stefan Hajnoczi wrote:
> > On Wed, Jul 03, 2024 at 06:55:38PM -0400, Michael S. Tsirkin wrote:
> > > On Wed, Jun 19, 2024 at 10:00:24AM -0400, Stefan Hajnoczi wrote:
> > > > On Tue, Jun 18, 2024 at 05:18:57PM +0900, Keiichi Watanabe wrote:
> > > > > This patch proposes a new error code VIRTIO_BLK_S_NOSPC to report
> > > > > the device's ENOSPC error to the driver so the driver can treat it
> > > > > in a different way from other IO errors.
> > > > > More motivation is explained in fs-devel mail [1].
> > > > >=20
> > > > > [2] is a prototype implementation in crosvm and [3] is in virtio-=
blk
> > > > > driver. Idealy, the error should be propagated to the guest file =
system
> > > > > and handled smartly, but the part is still under discussion.
> > > > >=20
> > > > > [1]: https://lore.kernel.org/linux-fsdevel/CAD90VcZybb0ZOVrhE-MqD=
PwEya8878uzA1RBwd68U7x4CufkTQ@mail.gmail.com/T/#u
> > > >=20
> > > > I have replied on linux-fsdevel so we can discuss a bit more about =
the
> > > > context and get input from storage and file systems people.
> > > >=20
> > > > Thanks,
> > > > Stefan
> > >=20
> > > Stefan could you also comment on whether we are likely to add many mo=
re
> > > errno values soonish?
> >=20
> > I'm not aware of other in-flight or upcoming work that will add new
> > virtio-blk error codes.
> >=20
> > Stefan
>=20
> I'd guess the original approach is ok then, if it's going to just be
> this error for the next X years, we are better off with a simple
> change.

Let's wait to see how logical block exhaustion support in Linux is
accepted before adding VIRTIO_BLK_S_NOSPC to the virtio-blk spec. I
think it will be pretty straightforward to merge the virtio-blk spec
once the file systems-level questions about been discussed.

Stefan

--W5PGhYV8XrhKTJM8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmaPowcACgkQnKSrs4Gr
c8g8Twf/Ybs6L0qyipQ53zkYSBO1yLsesLP1zpBPQwyzmfvkBJZhgz3Sd/QoEej8
miAXVwZ/+Ln0gx+1sS9tKPal6LeDOGWIOSl67zuaVFU2TdfXrQBmZgALqFGRBqdd
3HP/51UNpBv2d1lkaw7Lek3sgnzGvl0NI3rqXdPuche9ak+7m7VlMKNQH2DQeBF4
74Qrjka9xRrnFPhVjGBeN5cfRukRlpX07UxIP4dkeys5k6CW+0yr0KDmgA/K/lhm
0gZn8ZGxBsqwc8jZj2ztBD51eTA9geyzpqVHJ+9SNgGBzce80R0nOJz+KLKlNMl2
/fxZYkalmXNxTerYTpWDO2dTkrEFpA==
=wUJM
-----END PGP SIGNATURE-----

--W5PGhYV8XrhKTJM8--

