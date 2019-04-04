Return-Path: virtio-comment-return-713-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6CA1C985D8E
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 Apr 2019 15:22:28 +0000 (UTC)
Date: Thu, 4 Apr 2019 16:22:19 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190404152219.GA27168@stefanha-x1.localdomain>
References: <54DB94AE64EDA14BAB6A1E9641A26B011AC7DF08@hasmsx109.ger.corp.intel.com>
 <20190318184312-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
In-Reply-To: <20190318184312-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] virtio_blk_req.data size - Section 5.2.6 -
 version 1.1 draft 01
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Savir, Gil" <gil.savir@intel.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2019 at 06:44:48PM -0400, Michael S. Tsirkin wrote:
> On Tue, Mar 05, 2019 at 04:18:10PM +0000, Savir, Gil wrote:
> > In version 1.1 draft 01 - Section 5.2.6 - struct virtio_blk_req definit=
ion:
> >=20
> > Data field is defined as array of 512 Byte entries as follows:
> > 	u8 data[][512];
> > It makes sense for IN and OUT requests, since defined for read/write si=
zes that are 512 Bytes multiplication.
> > However, it is confusing when used for DISCARD or WRITE_ZEROES requests=
, since virtio_blk_discard_write_zeroes struct size is 16 Bytes.
> >=20
> > Is implying that DISCARD and WRITE_ZEROES requests must use data-field =
sizes that are 512 Bytes multiplication as well?
> >=20
> > If yes, than the device can't tell how many virtio_blk_discard_write_ze=
roes structs reside within data-field. In that case - indication for number=
 of virtio_blk_discard_write_zeroes structs needs to be added.
> >=20
> > If not, then I suggest to add to the spec clarification, that for DISCA=
RD or WRITE_ZEROES requests, data-field is not required to be with size tha=
t is 512 Bytes multiplication.
> >=20
> >=20
> > Thanks,
> > Gil
> >=20
>=20
> Thanks for the report.
>=20
> I think this was resolved as part of resolution of
> https://github.com/oasis-tcs/virtio-spec/issues/34

Hi,
This was addressed by
https://github.com/oasis-tcs/virtio-spec/issues/32.

Stefan

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcpiErAAoJEJykq7OBq3PI/xwH/3+E4ZldShuaduSky2p9QI1R
tqYbXyUBeDN2Xbsh+TG3ZVJoKlhgOJtqMDL//6N2kYkXUzP3424FoVt6UnHFacxI
TZVWnekYxdvEbP7XQyAybnUReAhggSFYFivpXI+q1TgLB5PH0XngE6ExyWWMCG8U
gKwMVXPoBjtj7iqoo8UYDF6ycMkcyBAurX8HfzX1qvqjUVwb5IVg/2BkX6EttVI2
zdcomfXbpN+yTYEqAnKZi3RJLu1oqyinhFuoxcr23OVYf/ilJlZE5Ew/z640kE2i
NyBJbqp6OiBodHUhq+PWMZXrUjJNG9hjM2+Z+W1XFpDYRoWiZgE7Bqrx/chmwaE=
=HrMc
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
