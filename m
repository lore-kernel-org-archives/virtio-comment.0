Return-Path: <virtio-comment-return-7480-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CEDCD5BCD
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 15:10:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C710268469
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 15:10:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B03389865AB
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 15:10:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 97B31986553; Tue, 19 Sep 2023 15:10:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 87BEB986555
	for <virtio-comment@lists.oasis-open.org>; Tue, 19 Sep 2023 15:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: eL6uKDOqMhqVILVX9WDaSA-1
Date: Tue, 19 Sep 2023 11:10:41 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	virtualization@lists.linux-foundation.org,
	virtio-comment@lists.oasis-open.org, mst@redhat.com,
	jasowang@redhat.com
Message-ID: <20230919151041.GA1515067@fedora>
References: <ZQHPeD0fds9sYzHO@pc-79.home>
 <ed568bcf-0fc0-40f5-9cb3-14c2923f8bf7@opensynergy.com>
 <64adaae1-28a6-b175-9fb0-f4f2c26e696e@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MPRpPlfC6SRswXQp"
Content-Disposition: inline
In-Reply-To: <64adaae1-28a6-b175-9fb0-f4f2c26e696e@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [virtio-comment] Re: virtio-sound linux driver conformance to
 spec

--MPRpPlfC6SRswXQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 08:58:32AM +0200, Paolo Bonzini wrote:
> On 9/19/23 02:35, Anton Yakovlev wrote:
> >=20
> > If the Linux virtio sound driver violates a specification, then there
> > must be
> > a conformance statement that the driver does not follow. As far as I kn=
ow,
> > there is no such thing at the moment.
>=20
> There is one in 2.7.13.3: "The device MAY access the descriptor chains the
> driver created and the memory they refer to immediately"
>=20
> And likewise for packed virtqueues in 2.8.21.1: "The device MAY access the
> descriptor and any following descriptors the driver created and the memory
> they refer to immediately"
>=20
> I think it's a mistake to use MAY here, as opposed to "may".  This is not=
 an
> optional feature, it's a MUST NOT requirement on the driver's part that
> should be in 2.7.13.3.1 and 2.8.21.1.1.
>=20
> This does not prevent the virtio-snd spec from overriding this.  If an
> override is desirable (for example because other hardware behaves like
> this), there should be a provision in 2.7.13.3.1 and 2.8.21.1.1.  For
> example:
>=20
> 2.7.13.3.1 Unless the device specification specifies otherwise, the driver
> MUST NOT write to the descriptor chains and the memory they refer to,
> between the /idx/ update and the time the device places the driver on the
> used ring.
>=20
> 2.8.21.1.1 "Unless the device specification specifies otherwise, the driv=
er
> MUST NOT write to the descriptor, to any following descriptors the driver
> created, nor to the memory the refer to, between the /flags/ update and t=
he
> time the device places the driver on the used ring.
>=20
>=20
> In the virtio-snd there would be a normative statement like
>=20
> 5.14.6.8.1.1  The device MUST NOT read from available device-readable
> buffers beyond the first buffer_bytes / period_bytes periods.
>=20
> 5.14.6.8.1.2  The driver MAY write to device-readable buffers beyond the
> first buffer_bytes / period_bytes periods, even after offering them to the
> device.
>=20
>=20
>=20
> As an aside, here are two other statements that have a similar issue:
>=20
> - 2.6.1.1.2 "the driver MAY release any resource associated with that
> virtqueue" (instead 2.6.1.1.1 should have something like "After a queue h=
as
> been reset by the driver, the device MUST NOT access any resource associa=
ted
> with a virtqueue").
>=20
> - 2.7.5.1 "[the device] MAY do so for debugging or diagnostic purposes"
> (this is not normative and can be just "may")

The spec should not make an exception for virtio-sound because the
virtqueue model was not intended as a shared memory mechanism. Allowing
it would prevent message-passing implementations of virtqueues.

Instead the device should use Shared Memory Regions:
https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html=
#x1-10200010

BTW, the virtio-sound spec already has VIRTIO_SND_PCM_F_SHMEM_HOST and
VIRTIO_SND_PCM_F_SHMEM_GUEST bits reserved but they currently have no
meaning. I wonder what that was intended for?

Stefan

--MPRpPlfC6SRswXQp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmUJufAACgkQnKSrs4Gr
c8gClwf/cCH9P+sVA2HWuhoxsfx2HZaANGkyqRoWh74H+sbex0Ii7uwIF0TCqEZ1
Jl9FthEFC5vBq0qPcfdeZ3A0Ve8KGyNoSQ/p3blZxqffD9eVvWQ9yZ9/yKSzz1IH
u9dBCBZKlYYCSSElvMKwwnX+Pr85bvz41yxOaGHIjLsNnn33X4u0UhNlhMOAgm+T
yiAF0rrl6yix2V1C1vorge907kDGynM9VxOD6OyNdL4Vc5lr1TQKJF6hoas4Ansl
NLqjOPdelzAv6vX2MzSDeVIuo8iTmFF5XpvCv5XI19Kf1x8glNN9ElyJZi2/3Lf7
tfSM8JK/qyzk59Y2/MR/PUisektIug==
=7g9W
-----END PGP SIGNATURE-----

--MPRpPlfC6SRswXQp--

