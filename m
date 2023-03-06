Return-Path: <virtio-comment-return-4719-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08858C61DA4
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 20:46:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2CC7E93622
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 20:46:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 26D239866BF
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 20:46:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 15E7B983C2D; Mon,  6 Mar 2023 20:46:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 01E6A9866BE
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Mar 2023 20:46:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Lil67vBxO_SoM5WBVUhc0g-1
Date: Mon, 6 Mar 2023 15:46:01 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
	"Afsa, Baptiste" <Baptiste.Afsa@harman.com>,
	Eugenio Perez Martin <eperezma@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20230306204601.GC78491@fedora>
References: <20221013074513.25141-1-baptiste.afsa@harman.com>
 <6380471.4BWXO1n1mU@silver>
 <20230301095017-mutt-send-email-mst@kernel.org>
 <2812377.Px9Efocobp@silver>
 <20230306124013-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PX1M4FkB/djfC5Md"
Content-Disposition: inline
In-Reply-To: <20230306124013-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [virtio-comment] Re: VIRTIO_RING_F_INDIRECT_SIZE status

--PX1M4FkB/djfC5Md
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2023 at 12:41:25PM -0500, Michael S. Tsirkin wrote:
> On Mon, Mar 06, 2023 at 04:00:37PM +0100, Christian Schoenebeck wrote:
> > On Wednesday, March 1, 2023 3:55:57 PM CET Michael S. Tsirkin wrote:
> > > On Wed, Mar 01, 2023 at 01:55:14PM +0100, Christian Schoenebeck wrote:
> > > >   2.8 Packed Virtqueues
> > > >   ...
> > > >   2.8.5 Scatter-Gather Support [1]
> > > >   ...
> > > >   While unusual (most implementations either create all lists solel=
y using  =20
> > > >   non-indirect descriptors, or always use a single indirect element=
), if both=20
> > > >   features have been negotiated, mixing indirect and non-indirect d=
escriptors=20
> > > >   in a ring is valid, as long as each list only contains descriptor=
s of a=20
> > > >   given type.
> > > >=20
> > > >   [1] https://docs.oasis-open.org/virtio/virtio/v1.2/cs01/virtio-v1=
=2E2-cs01.html#x1-770005
> > > >=20
> > > > To avoid misapprehensions: the way I understand it, same restrictio=
ns apply to
> > > > packed queues as split queues, in the sense that you may neither ch=
ain several
> > > > tables in a single message, nor multi-level nest tables, nor mix a =
list of
> > > > direct descriptors and indirect descriptors on the same level withi=
n one
> > > > message. So the explicit exception described here, only means you m=
ay use
> > > > *one* indirect table in one message, while using chained direct des=
criptors in
> > > > another message. But that's it, right?
> > >=20
> > >=20
> > > That's my understanding.
> > >=20
> > > > > 2. Given this is a lot of work I am trying to find a way to
> > > > > make the impact bigger. In particular to cover the use-case
> > > > > of limiting s/g to 1k while making queues deeper (with
> > > > > or without indirect). For this I proposed:
> > > > >=20
> > > > > 	So I think that given this, we can limit the total number
> > > > > 	of non-indirect descriptors, including non-indirect ones
> > > > > 	in a chain + all the ones in indirect pointer table if any,
> > > > > 	and excluding the indirect descriptor itself, and this
> > > > > 	will address the issue you are describing here, right?
> > > > >=20
> > > > > people seemed to be ok with this idea?
> > > >=20
> > > > IIUIC it would not make a difference from design perspective from w=
hat I
> > > > proposed, as virtio currently neither allows to mix, chain or mult-=
level nest
> > > > indirect descriptor tables within a single message), and hence it w=
ould just
> > > > boil down to adjusting the wording. So yes, it would therefore cove=
r my
> > > > intended use case.
> > > >=20
> > > > Best regards,
> > > > Christian Schoenebeck
> > >=20
> > >=20
> > > Sounds good to me. One interesting case is scsi and blk which have
> > > a seg_max field. This is defined as
> > >=20
> > > \item[\field{seg_max}] is the maximum number of segments that can be =
in a
> > >     command. A bidirectional command can include \field{seg_max} input
> > >     segments and \field{seg_max} output segments.
> > >=20
> > > it is never explained what *are* the segments, or how does it
> > > interact with VQ depth. Current drivers interpret this
> > > strictly and assume that this limits the s/g length but does not
> > > allow you to exceed vq size.
> > >=20
> > > Do we thus want two limits (for read and write descriptors)?
> >=20
> > No opinion on that, as my intended use case was just extending the buff=
er size
> > beyond queue size, not limiting it below queue size. Either way is fine=
 with
> > me.
> >=20
> > Anyhow, as this now gets broader scope, that also means the suggested f=
lag
> > VIRTIO_RING_F_INDIRECT_SIZE needs to be renamed. VIRTIO_RING_F_BUFFER_S=
IZE?
> >=20
> > Best regards,
> > Christian Schoenebeck
>=20
>=20
> Hmm that's unclear in that it might be in bytes too.
> Given blk and scsi call these "segments" how about
> VIRTIO_RING_F_SEG_MAX?

The VIRTIO equivalent of a "segment" is an "element". I don't think the
term "segment" is needed at the VIRTIO device model level since there is
already a word for it.

I'm confused because VIRTIO_RING_F_BUFFER_SIZE and VIRTIO_RING_F_SEG_MAX
mean different things to me and have different units (bytes vs number of
segments).

I wouldn't worry about virtio-blk/scsi seg_max. Although the segments
map to virtqueue elements, seg_max has a specific SCSI/block level
meaning related to data transfer and is not about constraints that apply
to all virtqueue requests. I/O requests have headers/footers, so they
can actually consume more elements than seg_max. Also, there could be
non-data transfer requests that happen to consume more than seg_max and
the storage controller would be happy with that (e.g. because VIRTIO
mandates flexible framing so you could break a request into 1-byte
elements). It's confusing the talk about seg_max at the VIRTIO device
model level - it's not about virtqueues at all.

Stefan

--PX1M4FkB/djfC5Md
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQGUQkACgkQnKSrs4Gr
c8jYQQf/XGd5H0nl4QaOOPpgmKxk19qdJw07jhQ2y8r3bpCsGR3HEhttV6llEzO6
jPq667AdjGxMIKV5xsvYPR2yFFQjKWtsuBXIhdmK8rsPNgn3qAXaj7CNoStP7Ha/
DuyVl55j4P2xTBzn/FEbKCs89fDQWa8alRoAO9DBpFRCxeIALX/e0VpawxCoiOQH
bRWcuW0lvyxamKKZ43+v/wPzhwkk+MW/uXh3g+6k5lw3oCuyuwZbgKqnD+dHljUS
FRdb++1D5zU+j6qd/IaVIE0nNrQSgLb9r589MpwtdDZitA14xz/kMwwJ/MRmM4YP
JrlSfoKrU+SfhhphvARzRxyVhrfR7w==
=Fug/
-----END PGP SIGNATURE-----

--PX1M4FkB/djfC5Md--

