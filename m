Return-Path: <virtio-comment-return-5294-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C70EC76196
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Apr 2023 12:35:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2A1712AD4B
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Apr 2023 12:35:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0AE969865CE
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Apr 2023 12:35:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E7FB49865BA; Thu,  6 Apr 2023 12:35:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DC7989865BD
	for <virtio-comment@lists.oasis-open.org>; Thu,  6 Apr 2023 12:35:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: VJAIL2IIMt6jLLHvSlnJow-1
Date: Thu, 6 Apr 2023 08:35:05 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: David Stevens <stevensd@chromium.org>
Cc: virtio-comment@lists.oasis-open.org
Message-ID: <20230406123505.GA714885@fedora>
References: <20230406073002.3642873-1-stevensd@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gHxOMXIG20/EPs3i"
Content-Disposition: inline
In-Reply-To: <20230406073002.3642873-1-stevensd@chromium.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [virtio-comment] [RFC] Define a low power state for devices

--gHxOMXIG20/EPs3i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 06, 2023 at 04:30:02PM +0900, David Stevens wrote:
> This RFC defines a low power state for virtio devices, to gives
> drivers an option for power management besides simply resetting their
> device.
>=20
> This patch is a draft aimed at starting a discussion, rather than being
> a finalized patch.
>=20
> To provide some context on where this is coming from, I'm working on
> reducing the power overhead of ARCVM (virtualized Android running on
> ChromeOS). One of the big gaps in ARCVM power management is that it does
> not implement Android's partial wake locks - i.e. the (virtualized) CPUs
> are always on, even if the (virtualized) screen is off. This means we
> can't force apps to stop running when they shouldn't be running, which
> can lead to higher power consumption compared to the ChromeOS baseline.
>=20
> Partial wake locks are built on s2idle, but unfortunately the current
> power management of virtio drivers does not let us use s2idle. The fact
> that power management is based around resetting the virtio device means
> that it doesn't work with stateful devices (e.g. virtio-fs). Even for
> stateless devices, re-initializing all of the devices takes longer than
> we would like, especially on lower end hardware.
>=20
> My rough idea for how to address this would be to make the existing
> virtio power management targeted at S4 specifically (i.e. the freeze
> device callback). For S0/S1/S3 (i.e. the suspend device callback), this
> new lighter weight low power state would be used if available -
> otherwise it would fall back to the existing S4 power management code.
>=20
> I have a very rough prototype that seems to work, and I haven't seen
> anything that makes me think this approach is fundamentally unworkable.
> That said, I would like to get feedback on the approach earlier rather
> than later.
> ---
>  content.tex | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

I'm curious to see how this maps to virtio-pci and the underlying PCI
power management features. Do you have a VIRTIO PCI transport spec
proposal you can share?

Stefan

--gHxOMXIG20/EPs3i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQuvHkACgkQnKSrs4Gr
c8ik3wf9G24c9Yj+1pbtMo6hANN91UyngARC/VwSK1xrbfibHMcBzRIIDDckfJAE
mQmvbrkOK/c8qW0ffRMGKHf1ZmRPkHEHcidUAQ7Q+LqBcTEEV7zxjmSYH70GAdwj
456Z5PH/Kj+a+OLKk7FAtPWo/Ei4tuD5hFWNuEbvy9X8YyKanKJD54WTpA87tMiS
b/3deXQQ67G+K+9oeKlbfZ2ffK1a1G+ta+GoN55ZpY1eZ/oDJFHFNAQ1l1wqe/zR
v0f5VuKKIu4t4kKpWjUJ1o9r+Nxeqim7omvOya+2HPmDScdwM+nRPA9o9Mgapq+5
1MwLkOHS2XqTx6HzM7AkL/XQyjREeQ==
=L9Kz
-----END PGP SIGNATURE-----

--gHxOMXIG20/EPs3i--

