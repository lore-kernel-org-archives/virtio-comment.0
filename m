Return-Path: <virtio-comment-return-4710-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1086DC61DA4
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 16:27:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 78F9D41EF1
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 16:27:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 713349866C1
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 16:27:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 685519866B8; Mon,  6 Mar 2023 16:27:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-Id: <virtio-comment.lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 58AFC9866B9
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Mar 2023 16:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: I8QMqkoBOaqcfAsJVUSvMA-1
Date: Mon, 6 Mar 2023 11:27:04 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	"Afsa, Baptiste" <Baptiste.Afsa@harman.com>,
	Eugenio Perez Martin <eperezma@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20230306162704.GB56760@fedora>
References: <20221013074513.25141-1-baptiste.afsa@harman.com>
 <6380471.4BWXO1n1mU@silver>
 <Y/9Z5fphn34/HSKs@fedora>
 <2458440.T3bEdP9vpG@silver>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IYtYDm3WD6H4W8xh"
Content-Disposition: inline
In-Reply-To: <2458440.T3bEdP9vpG@silver>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [virtio-comment] Re: VIRTIO_RING_F_INDIRECT_SIZE status

--IYtYDm3WD6H4W8xh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2023 at 03:51:13PM +0100, Christian Schoenebeck wrote:
> On Wednesday, March 1, 2023 2:57:57 PM CET Stefan Hajnoczi wrote:
> > On Wed, Mar 01, 2023 at 01:55:14PM +0100, Christian Schoenebeck wrote:
> > > On Tuesday, February 28, 2023 1:05:21 PM CET Michael S. Tsirkin wrote:
> > > > On Tue, Feb 28, 2023 at 12:49:00PM +0100, Christian Schoenebeck wro=
te:
> > > > > On Monday, February 27, 2023 6:41:12 PM CET Michael S. Tsirkin wr=
ote:
> > > > > > On Mon, Feb 27, 2023 at 05:13:12PM +0100, Christian Schoenebeck=
 wrote:
> > > > > > > On Monday, February 27, 2023 4:45:45 PM CET Stefan Hajnoczi w=
rote:
> > > > > > > > On Mon, Feb 27, 2023 at 02:53:55PM +0000, Afsa, Baptiste wr=
ote:
> > > > > > > > > The issue that we have now, is that this limitation does =
not seem to be enforced
> > > > > > > > > in Linux virtio drivers today. I came across:
> > > > > > > > >=20
> > > > > > > > > https://github.com/oasis-tcs/virtio-spec/issues/122
> > > > > > > > >=20
> > > > > > > > > which looks like a good base for us to build upon, but I'=
m not sure what is the
> > > > > > > > > status with this issue. Do you know whether there is any =
plan regarding this?
> > > > > > > >=20
> > > > > > > > CCing Christian regarding extending queue size limits.
> > > > > > >=20
> > > > > > > Status on this issue: it was suspended in May last year. AFAI=
CR Michael
> > > > > > > expressed the need to give some more thought about it, and a =
new virtio spec
> > > > > > > release was just ahead at that time.
> > > > > > >=20
> > > > > > > Michael, suggestions how to bring this forward?
> > > > > > >=20
> > > > > > > Best regards,
> > > > > > > Christian Schoenebeck
> > > > > > >=20
> > > > > >=20
> > > > > > How about a summary letter listing various options, pros and co=
ns?
> > > > >=20
> > > > > Actually I had submitted a draft for this feature (latest version=
 linked
> > > > > above), and AFAICR Michael was the only person who expressed conc=
erns from
> > > > > design perspective. Comments by other people were already just ab=
oout precise
> > > > > wording, but not about the design itself.
> > > > >=20
> > > > > We stopped the discussion at the point where Michael expressed th=
e need to
> > > > > think more about it, but as his expressed concerns were a bit vag=
ue, I still
> > > > > don't see how I could bring this issue forward.
> > > > >=20
> > > > > Best regards,
> > > > > Christian Schoenebeck
> > > > >=20
> > > >=20
> > > >=20
> > > > So the last time there were two things:
> > > >=20
> > > >=20
> > > > 1. bugs introduced during the packed ring work. For example:
> > > >=20
> > > > 	>=20
> > > > 	> I don't think so:
> > > > 	>=20
> > > > 	>   2.6.5.3.1 Driver Requirements: Indirect Descriptors
> > > > 	>   ..
> > > > 	>   "A driver MUST NOT set both VIRTQ_DESC_F_INDIRECT and VIRTQ_DE=
SC_F_NEXT in
> > > > 	>   flags."
> > > > 	> So as far as I can see it, the amount of direct descriptors is c=
urrently
> > > > 	> always exactly one if an indirect table is used.
> > > > 	>=20
> > > > 	> Best regards,
> > > > 	> Christian Schoenebeck
> > > > 	>=20
> > > >=20
> > > > 	Oh. You are right.  Weirdly this text is not in packed-ring.tex - I
> > > > 	think this and a bunch of other cases like this are an oversight,
> > > > 	however we need to fix them first before adding features that assu=
me
> > > > 	they are fixed ...
> > > >=20
> > > > we need to get them fixed before we poke at core ring otherwise it'=
s a
> > > > mess - maybe the TC will accept just fixing this
> > > > without a feature bit, or maybe people will feel a feature bit
> > > > is required.
> > >=20
> > > It's been a while. Looking at v1.2 it says:
> > >=20
> > >   2.8 Packed Virtqueues
> > >   ...
> > >   2.8.5 Scatter-Gather Support [1]
> > >   ...
> > >   While unusual (most implementations either create all lists solely =
using  =20
> > >   non-indirect descriptors, or always use a single indirect element),=
 if both=20
> > >   features have been negotiated, mixing indirect and non-indirect des=
criptors=20
> > >   in a ring is valid, as long as each list only contains descriptors =
of a=20
> > >   given type.
> > >=20
> > >   [1] https://docs.oasis-open.org/virtio/virtio/v1.2/cs01/virtio-v1.2=
-cs01.html#x1-770005
> > >=20
> > > To avoid misapprehensions: the way I understand it, same restrictions=
 apply to
> > > packed queues as split queues, in the sense that you may neither chai=
n several
> > > tables in a single message, nor multi-level nest tables, nor mix a li=
st of
> > > direct descriptors and indirect descriptors on the same level within =
one
> > > message. So the explicit exception described here, only means you may=
 use
> > > *one* indirect table in one message, while using chained direct descr=
iptors in
> > > another message. But that's it, right?
> >=20
> > Hi Christian,
> > Yes, for packed virtqueues it is forbidden to mix normal and indirect
> > descriptors in a single buffer. Further support for this interpretation
> > is in 2.8.19 Driver Requirements: Indirect Descriptors:
> >=20
> >   A driver MUST NOT write direct descriptors with VIRTQ_DESC_F_INDIRECT
> >   set in a scatter-gather list linked by VIRTQ_DESC_F_NEXT. flags.
> >=20
> > VIRTQ_DESC_F_INDIRECT cannot be set if the descriptor chain uses
> > VIRTQ_DESC_F_NEXT, therefore it's not possible to mix normal and
> > indirect descriptors in a single buffer.
> >=20
> > However, the Split Virtqueues section documents an exception where
> > mixing normal and indirect descriptors in a single buffer is allowed,
> > but only in a specific order. 2.7.5.3.2 Device Requirements: Indirect
> > Descriptors says:
> >=20
> >   The device MUST handle the case of zero or more normal chained
> >   descriptors followed by a single descriptor with
> >   flags&VIRTQ_DESC_F_INDIRECT. Note: While unusual (most implementations
> >   either create a chain solely using non-indirect descriptors, or use a
> >   single indirect element), such a layout is valid.
> >=20
> > So what degree of mixing normal and indirect descriptors is allowed
> > depends on the virtqueue format.
>=20
> Oh, good catch! I was not aware about this device requirement for split
> queues. I thought 2.7.5.3.1 "A driver MUST NOT set both VIRTQ_DESC_F_INDI=
RECT
> and VIRTQ_DESC_F_NEXT in flags" would rule that mixed case out, but right=
, if
> the indirect descriptor is last in the buffer then 2.7.5.3.1 is not viola=
ted.
>=20
> Which makes Michael's suggestion even mandatory.
>=20
> Out of pure curiosity: is this mixed case actively used by somebody?

I would love to know as well. :)

Stefan

--IYtYDm3WD6H4W8xh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQGFFgACgkQnKSrs4Gr
c8jlwQf+N1jT+SufUG2cjb9S87daU+Vj8+Un/bAI3TE7ov8Ql1eQo1Qp3ach+al8
38Snq7yHs+8fC+djDNzZMubu6WEzHdzq1QY0KNPnOuQQGxZwnIlajyUJ/XiUZlir
6lCidE0iG+nM2l+YjdXFbJm+/U9Pv3K8fGOozayiBSRNPq1uA50DpQcST5B3odUn
/3Ygz8VjqSlKRFh7CyPpF6ZbCH+fyaY8dKjWj3HWK1EYDENlSkHULl2HS7QYYRkC
7/HujpOti7mcU4VULKFMg1Yt8hZarh3XZ6xtNr4a7RUpYUGOAPjr5lW53kbCC3o0
cap+OJccvRTt8UB5s0Rtf2TqFCH4eg==
=/ntJ
-----END PGP SIGNATURE-----

--IYtYDm3WD6H4W8xh--

