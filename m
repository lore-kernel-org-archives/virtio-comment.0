Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358F0285CAE
	for <virtio-comment@lists.linux.dev>; Thu, 27 Aug 2026 14:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842170; cv=none; b=ch/KSM/oGbWHt2zEOQICD9pEgIe5FG2QMHXSxiV8597Y4H0xdgg5pZd+bFHSC9t6iXG107uP6fRA+2GFKSerebn+Ghxm8sXVxFAWmvnWwAcpRiUmyiFaFQHAcKp0kbb/ScbgA7uJsNTYhu10k5WSENzEXWpomKXtpW4OZMSsYgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842170; c=relaxed/simple;
	bh=c/IMwoDLjcfDS0WvqGHJoZbIysJfW2YhJoBuNii6Xsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eR6Qgu/6CZMkPGHx45bJWsn/W8yJ7gW/YAw7RTFlgAe7XTF7lAXaD4t5VJw4l2+/91K3Dj4dbn8H2B0H2Hc3ATgniA9p3KrAkkeJYolvvcoZbWcqXjEKe09QvoGBfMZ+W2DOv8atk79GCWszZ7iMro3VFuCFPqdQn2EvLahue/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yvqd2jMb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yvqd2jMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787842159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aO60Js0jeQ1Cknyz82yjHgOu/RDdthQ618PRXdnudas=;
	b=Yvqd2jMbv5v3LftTphImFRa+6yhT6SoJrK/OPR5Wk/0KH1BQOlBt7V4NMuMqqhUMBp0HYD
	sEy18r40ePNiIx8rOYXTB+PxTT/pimah7p0vmr5sNWPNk5Ob1TsiOjP6Z0rf5N/F/SE+vh
	KaUcwEM4FOOReIttv4mZwZjWWlitAR0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-333-VCNJOGkDMMGH8b6RxHzHdA-1; Thu,
 27 Aug 2026 10:49:17 -0400
X-MC-Unique: VCNJOGkDMMGH8b6RxHzHdA-1
X-Mimecast-MFC-AGG-ID: VCNJOGkDMMGH8b6RxHzHdA_1787842156
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 92D7B19539A4;
	Thu, 27 Aug 2026 14:49:16 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B844D3000239;
	Thu, 27 Aug 2026 14:49:15 +0000 (UTC)
Date: Thu, 27 Aug 2026 10:49:13 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Peter Hilber <peter.hilber@oss.qualcomm.com>,
	virtio-comment@lists.linux.dev,
	Trilok Soni <trilok.soni@oss.qualcomm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] content: Reserve ID 52 for Snapdragon device
Message-ID: <20260827144913.GA358650@fedora>
References: <20260826115504.1955-1-peter.hilber@oss.qualcomm.com>
 <1982f2c0-9dad-43b2-94ce-31d03d6a36e5@siemens.com>
 <20260826184427.GA329888@fedora>
 <6140152c-7e99-444d-a408-ec90a589a47b@siemens.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YB+MCab9RBfKv1iR"
Content-Disposition: inline
In-Reply-To: <6140152c-7e99-444d-a408-ec90a589a47b@siemens.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

--YB+MCab9RBfKv1iR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 03:24:18PM +0200, Jan Kiszka wrote:
> On 26.08.26 20:44, Stefan Hajnoczi wrote:
> > On Wed, Aug 26, 2026 at 05:31:54PM +0200, Jan Kiszka wrote:
> >> On 26.08.26 13:55, Peter Hilber wrote:
> >>> Reserve a device ID for the Snapdragon device.  A Virtio Snapdragon
> >>> device exposes functionality across Snapdragon SoC subsystems through=
 a
> >>> common Virtio-based protocol.
> >>>
> >>
> >> Virtio is supposed to provide generic hardware models, not so much a
> >> channel to expose concrete, physical chip IP over it. This looks very
> >> weird to me.
> >=20
> > Device IDs assignments don't have to result in standardized devices. See
> > "5 Device Types" in VIRTIO 1.4 where there is a table of currently
> > reserved Device IDs.
> >=20
> > While I'm in favor of defining generic device interfaces with many
> > possible implementations like virtio-net, virtio-blk, etc, I think a
> > SoC-specific control device is unlikely to fit into that category and
> > it's acceptable to allocate the Device ID with the understanding that
> > there will never be standardization of the device.
>=20
> Would still list this ID by that vendor branding in the spec.
>=20
> For me the question is if reservations for devices that will never be
> acceptable should be in scope for virtio. IIRC, the currently available
> ID range for virtio over PCI is 63, of which 50 (including invalid 0)
> are officially reserved already. If we see an inflation of such
> vendor-specific reservations, we might be force to hunt for another PCI
> device ID range earlier.

Interesting, maybe Michael Tsirkin knows what options are available for
extending the PCI Device ID range.

Stefan

--YB+MCab9RBfKv1iR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmqQTmkACgkQnKSrs4Gr
c8gt4AgAut6dGvJYVVaowgeGDTNmWzFqJFaohnJSMFSagYmc6L+j9FCaOFGTA5QY
Tg0VXihbkMuStJDC7fiYhYuqZ2dxsjo48tfOsz2OQSnT4LeVvpo4mIuHtxvf/PyI
z8bc6GvO9hx+eY+gi+18hSeQNPIBN8AMSgEvdLUbwvjR/0VUuTbFb2qaLICYH8e8
WbGMOxt7YgkhMafX2lUD3c/EHWFCc2GHtbMUdOWJc+1rHduQN9JDZ1sSytmqH2G9
NaYl+bWhvBTd1HejYlmduV3xoOiTBDebari4Lmu5HX3eAsMB8qRSAVFv7AJlP/Ff
lrkAkSW91+NZzzAjaV0geeuILnTJiQ==
=ttI5
-----END PGP SIGNATURE-----

--YB+MCab9RBfKv1iR--

