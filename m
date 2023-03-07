Return-Path: <virtio-comment-return-4759-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1571FC6FD1E
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Mar 2023 19:35:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 49EE42B01E
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Mar 2023 19:35:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 38E539866E3
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Mar 2023 19:35:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2EE6C9866DB; Tue,  7 Mar 2023 19:35:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1D05D9866DD
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Mar 2023 19:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: O3ohOrCBMTKzLmgDhHiy7g-1
Date: Tue, 7 Mar 2023 14:35:36 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
	"Afsa, Baptiste" <Baptiste.Afsa@harman.com>,
	Eugenio Perez Martin <eperezma@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20230307193536.GC153228@fedora>
References: <20221013074513.25141-1-baptiste.afsa@harman.com>
 <6380471.4BWXO1n1mU@silver>
 <20230301095017-mutt-send-email-mst@kernel.org>
 <2812377.Px9Efocobp@silver>
 <20230306124013-mutt-send-email-mst@kernel.org>
 <20230306204601.GC78491@fedora>
 <20230306164500-mutt-send-email-mst@kernel.org>
 <20230307132627.GA124259@fedora>
 <20230307114632-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I2BoVVZDWtt62RCe"
Content-Disposition: inline
In-Reply-To: <20230307114632-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [virtio-comment] Re: VIRTIO_RING_F_INDIRECT_SIZE status

--I2BoVVZDWtt62RCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 07, 2023 at 11:47:32AM -0500, Michael S. Tsirkin wrote:
> On Tue, Mar 07, 2023 at 08:26:27AM -0500, Stefan Hajnoczi wrote:
> > On Mon, Mar 06, 2023 at 04:50:53PM -0500, Michael S. Tsirkin wrote:
> > > On Mon, Mar 06, 2023 at 03:46:01PM -0500, Stefan Hajnoczi wrote:
> > > > On Mon, Mar 06, 2023 at 12:41:25PM -0500, Michael S. Tsirkin wrote:
> > > > > On Mon, Mar 06, 2023 at 04:00:37PM +0100, Christian Schoenebeck w=
rote:
> > > > > > On Wednesday, March 1, 2023 3:55:57 PM CET Michael S. Tsirkin w=
rote:
> > > > > > > On Wed, Mar 01, 2023 at 01:55:14PM +0100, Christian Schoenebe=
ck wrote:
> > > > > > > >   2.8 Packed Virtqueues
> > > > > > > >   ...
> > > > > > > >   2.8.5 Scatter-Gather Support [1]
> > > > > > > >   ...
> > > > > > > >   While unusual (most implementations either create all lis=
ts solely using  =20
> > > > > > > >   non-indirect descriptors, or always use a single indirect=
 element), if both=20
> > > > > > > >   features have been negotiated, mixing indirect and non-in=
direct descriptors=20
> > > > > > > >   in a ring is valid, as long as each list only contains de=
scriptors of a=20
> > > > > > > >   given type.
> > > > > > > >=20
> > > > > > > >   [1] https://docs.oasis-open.org/virtio/virtio/v1.2/cs01/v=
irtio-v1.2-cs01.html#x1-770005
> > > > > > > >=20
> > > > > > > > To avoid misapprehensions: the way I understand it, same re=
strictions apply to
> > > > > > > > packed queues as split queues, in the sense that you may ne=
ither chain several
> > > > > > > > tables in a single message, nor multi-level nest tables, no=
r mix a list of
> > > > > > > > direct descriptors and indirect descriptors on the same lev=
el within one
> > > > > > > > message. So the explicit exception described here, only mea=
ns you may use
> > > > > > > > *one* indirect table in one message, while using chained di=
rect descriptors in
> > > > > > > > another message. But that's it, right?
> > > > > > >=20
> > > > > > >=20
> > > > > > > That's my understanding.
> > > > > > >=20
> > > > > > > > > 2. Given this is a lot of work I am trying to find a way =
to
> > > > > > > > > make the impact bigger. In particular to cover the use-ca=
se
> > > > > > > > > of limiting s/g to 1k while making queues deeper (with
> > > > > > > > > or without indirect). For this I proposed:
> > > > > > > > >=20
> > > > > > > > > 	So I think that given this, we can limit the total number
> > > > > > > > > 	of non-indirect descriptors, including non-indirect ones
> > > > > > > > > 	in a chain + all the ones in indirect pointer table if a=
ny,
> > > > > > > > > 	and excluding the indirect descriptor itself, and this
> > > > > > > > > 	will address the issue you are describing here, right?
> > > > > > > > >=20
> > > > > > > > > people seemed to be ok with this idea?
> > > > > > > >=20
> > > > > > > > IIUIC it would not make a difference from design perspectiv=
e from what I
> > > > > > > > proposed, as virtio currently neither allows to mix, chain =
or mult-level nest
> > > > > > > > indirect descriptor tables within a single message), and he=
nce it would just
> > > > > > > > boil down to adjusting the wording. So yes, it would theref=
ore cover my
> > > > > > > > intended use case.
> > > > > > > >=20
> > > > > > > > Best regards,
> > > > > > > > Christian Schoenebeck
> > > > > > >=20
> > > > > > >=20
> > > > > > > Sounds good to me. One interesting case is scsi and blk which=
 have
> > > > > > > a seg_max field. This is defined as
> > > > > > >=20
> > > > > > > \item[\field{seg_max}] is the maximum number of segments that=
 can be in a
> > > > > > >     command. A bidirectional command can include \field{seg_m=
ax} input
> > > > > > >     segments and \field{seg_max} output segments.
> > > > > > >=20
> > > > > > > it is never explained what *are* the segments, or how does it
> > > > > > > interact with VQ depth. Current drivers interpret this
> > > > > > > strictly and assume that this limits the s/g length but does =
not
> > > > > > > allow you to exceed vq size.
> > > > > > >=20
> > > > > > > Do we thus want two limits (for read and write descriptors)?
> > > > > >=20
> > > > > > No opinion on that, as my intended use case was just extending =
the buffer size
> > > > > > beyond queue size, not limiting it below queue size. Either way=
 is fine with
> > > > > > me.
> > > > > >=20
> > > > > > Anyhow, as this now gets broader scope, that also means the sug=
gested flag
> > > > > > VIRTIO_RING_F_INDIRECT_SIZE needs to be renamed. VIRTIO_RING_F_=
BUFFER_SIZE?
> > > > > >=20
> > > > > > Best regards,
> > > > > > Christian Schoenebeck
> > > > >=20
> > > > >=20
> > > > > Hmm that's unclear in that it might be in bytes too.
> > > > > Given blk and scsi call these "segments" how about
> > > > > VIRTIO_RING_F_SEG_MAX?
> > > >=20
> > > > The VIRTIO equivalent of a "segment" is an "element".
> > >=20
> > > Hmm true:
> > > 	A buffer consists of zero or more device-readable physically-contigu=
ous
> > > 	elements followed by zero or more physically-contiguous
> > > 	device-writable elements (each buffer has at least one element).
> > >=20
> > > However we then need to clean this up, since
> > >=20
> > > - At least in one place we say
> > >=20
> > > indirect elements to mean indirect descriptors.
> > >=20
> > > - we also say "queue elements" to mean "avail/desc/used"
> > > - We also say "descriptor elements" - not 100% sure it's the same.
> > >=20
> > > so we need to clean this up a bit first and maybe add
> > > text about indirect descriptors not counting as elements.
> >=20
> > Haha, yes. I also remembered that QEMU's type for a virtqueue buffer is
> > called VirtQueueElement :).
> >=20
> > My impression from the spec is that when talking about virtqueues an
> > element is a data blob that's part of a buffer and when talking about
> > vrings an element descriptor is the ring entry that points to the data
> > blob. Often the terms are used interchangeably (just "descriptors" or
> > "elements").
> >=20
> > I'm not sure if the distinction is necessary. It might be simpler to
> > always talk about descriptors and remove the term "element", since there
> > is no way to avoid talking about descriptors eventually.
> >=20
> > Stefan
>=20
> Well this whole discussion started from the point that
> indirect descriptors do not describe parts of a buffer.
>=20
> So I feel there's a distinction.

Good point.

Stefan

--I2BoVVZDWtt62RCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQHkgcACgkQnKSrs4Gr
c8gK4AgAoaQ0/z7LrD7X4OIoZRqMrUP1i7IiiY1UBqm4NM+nd1pFjJEHRTnTVMo1
sch8+2JQUY8bOxooZB03LnJTYTbBe8NKY6kwdhkEXZgAjOgbIBNAvdb1VtOaLSp5
7Rqfd5K9Q7juAnAbP5aVH6IDzNhgPzPk3ul53llslGiqtOVG9X+janL0/gMor8ex
b2VNb5ar4U+tka3WCOPGu7mm2DZTp9j+W511U46IPHnjsBwhRcLyNlOolhWbov7j
enRFqMShUjuIwk7CWJ6AhnNRaw2AuIwsaLzuz2h+UfZQytlWqIM01dVxnDfEhOI/
ktH39wSZQGf39AhET7QsEiXTB02WRw==
=bZM3
-----END PGP SIGNATURE-----

--I2BoVVZDWtt62RCe--

