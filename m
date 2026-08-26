Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EC639795B
	for <virtio-comment@lists.linux.dev>; Wed, 26 Aug 2026 18:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769888; cv=none; b=a7fJbRIJManrZy0ifImgexLf75ld4z1cGhceMcSa1VRKS6g2OydF8UGTaZ6uPnMrHN4DkiZWzHgzaBwSABhBbKtVwxjwkp2x15FATJgsgtiL3qNxPKHHsIbWAf1lBehNssaeN4HIcFj6DNpDAdx4OalG/nll4MtWqPdr/4CkCow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769888; c=relaxed/simple;
	bh=9YL4Tuk7oVAOB00euVtUuOdhHiWYwJvNCKp57WZJpZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGZgElOaPy/GPmIaidCD22mhhJcHAZgveyQRVuL7o/31oEM7YmnXbQi762JdnXBbsrwXiV34XoFkG+CVqWB+DGL9Hz880XQKhBJNzLyANtOZoXYMoG57+J1IfzjZcSmPbtTthOKznq7BIUpYiUbK2VbH+QGPCj8Qj63/ELXsFYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QCCtiQCp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QCCtiQCp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787769877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vBnCWmnLJe6XBvNVAPFm/uyNOp5HPSa/zyXEC0AeJu0=;
	b=QCCtiQCp/lJ5OMDfRDyhuVGofCJXmelSUVodn1N1HqiuXHLVOzIbasEmc0aiGl4qPMNSGn
	msccrXe7vcFn/XjE/UkPvlf0Lw0Au5n2P448+pDt3kKWA8gPriAS1Eiw1pigT8V1w1rSFs
	bSUvS0t2+fVWMdPr6jDRafuSRkL5gHc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-664-3691oc06MRiOjvO3UvO-4Q-1; Wed,
 26 Aug 2026 14:44:33 -0400
X-MC-Unique: 3691oc06MRiOjvO3UvO-4Q-1
X-Mimecast-MFC-AGG-ID: 3691oc06MRiOjvO3UvO-4Q_1787769872
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 42A6419540CD;
	Wed, 26 Aug 2026 18:44:32 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BC64418005BC;
	Wed, 26 Aug 2026 18:44:31 +0000 (UTC)
Date: Wed, 26 Aug 2026 14:44:28 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Peter Hilber <peter.hilber@oss.qualcomm.com>,
	virtio-comment@lists.linux.dev,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH] content: Reserve ID 52 for Snapdragon device
Message-ID: <20260826184427.GA329888@fedora>
References: <20260826115504.1955-1-peter.hilber@oss.qualcomm.com>
 <1982f2c0-9dad-43b2-94ce-31d03d6a36e5@siemens.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3urcsGvZ9ZTEIicf"
Content-Disposition: inline
In-Reply-To: <1982f2c0-9dad-43b2-94ce-31d03d6a36e5@siemens.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

--3urcsGvZ9ZTEIicf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 05:31:54PM +0200, Jan Kiszka wrote:
> On 26.08.26 13:55, Peter Hilber wrote:
> > Reserve a device ID for the Snapdragon device.  A Virtio Snapdragon
> > device exposes functionality across Snapdragon SoC subsystems through a
> > common Virtio-based protocol.
> >=20
>=20
> Virtio is supposed to provide generic hardware models, not so much a
> channel to expose concrete, physical chip IP over it. This looks very
> weird to me.

Device IDs assignments don't have to result in standardized devices. See
"5 Device Types" in VIRTIO 1.4 where there is a table of currently
reserved Device IDs.

While I'm in favor of defining generic device interfaces with many
possible implementations like virtio-net, virtio-blk, etc, I think a
SoC-specific control device is unlikely to fit into that category and
it's acceptable to allocate the Device ID with the understanding that
there will never be standardization of the device.

Stefan

>=20
> Also, isn't Snapdragon a protected brand by Qualcomm? Would it even
> legally be fine use it in the spec?
>=20
> > Device ID 51 is already reserved for the Virtio HAB device:
> >=20
> > https://lore.kernel.org/virtio-comment/20260702140939.3535968-1-zeloren=
@qti.qualcomm.com/
> >=20
>=20
> I think I even voted for this, but likely without checking back what
> this may become. I was expecting (hoping?) for a generic, portable inter
> VM channel using shared memory. I hope HAB can be that as well - besides
> enabling some very Qualcomm-specific and unportable pass-through of
> accelerators or so.
>=20
> Does a "Snapdragon device" have any relation to / dependency on HAB, or
> is this just the ID collision why it is mentioned here?
>=20
> Jan
>=20
> --=20
> Siemens AG, Foundational Technologies
> Linux Expert Center
>=20

--3urcsGvZ9ZTEIicf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmqPNAsACgkQnKSrs4Gr
c8iaOggAhPoTkrbyFWdeXwuoIMiTgDLdJ3VWImNAZmy19k3WBPmtGInZah4CPQae
r3T2SPUr7pB6KFacgj2GheDI2cvkz5y+7m88GxWc/t/nTQfoYqV4YBk+U1qbIK1r
rslX0JbjZxBGU3VicI34v4r3rViVXShfqPqWzHS7nlFmlPfnoLVJRW7MSC/Uc8Yj
Mgc/AL0R2GUIe8v3fm1tA4V8q1CABEQYM8aS0C4cKRkpKLt85jODR6t3JL2Yq1OL
Drz6TE8REtY1s67m6H/CsA0QUn5NItMh9qbbd5B4v806rEXigxaXKJoKB2SicOEI
GC6d0CkjOWJ5Y8gONG76p84dnlBU+Q==
=2BYD
-----END PGP SIGNATURE-----

--3urcsGvZ9ZTEIicf--

