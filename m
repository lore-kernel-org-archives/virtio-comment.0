Return-Path: virtio-comment-return-652-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 74C99985AA7
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Feb 2019 17:00:40 +0000 (UTC)
Date: Mon, 25 Feb 2019 17:00:36 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190225170036.GG379@stefanha-x1.localdomain>
References: <54DB94AE64EDA14BAB6A1E9641A26B011AC60D30@hasmsx109.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NGIwU0kFl1Z1A3An"
Content-Disposition: inline
In-Reply-To: <54DB94AE64EDA14BAB6A1E9641A26B011AC60D30@hasmsx109.ger.corp.intel.com>
Subject: Re: [virtio-comment] Block Device: Legacy SCSI 'cmd' Framing
 Requirements
To: "Savir, Gil" <gil.savir@intel.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--NGIwU0kFl1Z1A3An
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 24, 2019 at 12:30:48PM +0000, Savir, Gil wrote:
> When using Block-device, legacy scsi commands, while VIRTIO_F_ANY_LAYOUT is negotiated, it is not clear if 'cmd' field must reside in a single, separate device-readable buffer.

I haven't looked into this but it's worth mentioning that virtio-blk
SCSI commands are discouraged and probably disabled in modern Linux
distros (for example, I just checked that the Fedora 29 kernel disables
it in the guest driver).

If anyone is planning to make use of this legacy feature, it would be
worth checking carefully that the required set of guest drivers and
hypervisors actually implement this feature.

Stefan

--NGIwU0kFl1Z1A3An
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcdB80AAoJEJykq7OBq3PI4PgIAJskOkOpXdGv4GcPn5Nm36pM
WrjLg9dPa0x3+7hnJhdlYn6CXc+f5oIprPMlu1fzOoqlFgRMZGxs3rfjnngunjQ8
yeMDPFKChwrPdyi7b2+va7tHFmHyi7cV+3rSb/MeHQwgoXpRHSXg2B9rJEGesajZ
6XC+n6SbWH56SghaW1plMxuqdyGbRLVdbYEffKFuTRJrtdEEBIzRmrFqfiuDQR+Q
kfevGkSs9uiL/MDpuUO1ddhGWNN2B991441gzFh4VVK74rT0T0cSLOHfJRuMk3Cm
paGbBZGkdb1QDpoYZUGLQNfYwv3urHTFX8x6go2qzLFqH+7/tLjBhnxZRYAP/TM=
=EN2D
-----END PGP SIGNATURE-----

--NGIwU0kFl1Z1A3An--
