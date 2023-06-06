Return-Path: <virtio-comment-return-6155-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B623C7EE24
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 13:44:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C9D6A71C8C
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 13:44:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AD7E49864A3
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 13:44:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 98BD3986491; Tue,  6 Jun 2023 13:44:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 861B9986492
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 13:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: wESjTZo8OdKD53TrypERnw-1
Date: Tue, 6 Jun 2023 09:44:19 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, houp@yusur.tech,
	helei.sig11@bytedance.com, xinhao.kong@duke.edu
Message-ID: <20230606134419.GD1958291@fedora>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-7-pizhenwei@bytedance.com>
 <20230531171036.GH1248296@fedora>
 <8cfdc9bf-03c9-92fc-f2e0-d59b180b0d82@bytedance.com>
 <20230605163046.GB1624556@fedora>
 <5756d99a-6ffc-3b8e-6488-19d17a1c0ec2@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TTs1LBMokLYSVrrV"
Content-Disposition: inline
In-Reply-To: <5756d99a-6ffc-3b8e-6488-19d17a1c0ec2@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [virtio-comment] Re: Re: Re: [PATCH v2 06/11] transport-fabrics: introduce command set

--TTs1LBMokLYSVrrV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 06, 2023 at 10:02:51AM +0800, zhenwei pi wrote:
>=20
>=20
> On 6/6/23 00:30, Stefan Hajnoczi wrote:
> [snip]
> > >=20
> > > > > +
> > > > > +The Target ID of 0xffff is reserved, then:
> > > >=20
> > > > Please move this after the fields have been shown and the purpose o=
f the
> > > > Target ID field has been explained.
> > > >=20
> > > > > +\begin{itemize}
> > > > > +\item The Target ID of 0xffff MUST be specified as the Target ID=
 in a Connect
> > > > > +Command for the control queue.
> > > > > +\item The target SHOULD allocate any available Target ID to the =
initiator,
> > > > > +and return the allocated Target ID in the Completion.
> > > > > +\item The returned Target ID MUST be specified as the Target ID,=
 and the Queue ID
> > > > > +MUST be specified in a Connect Command for the virtqueue.
> > > > > +\end{itemize}
> > > >=20
> > > > What is the purpose of the Target ID? Is it to allow a server to pr=
ovide
> > > > access to multiple targets over the same connection?
> > > >=20
> > >=20
> > > A target listens on a port, and provides access to 0 or more targets.=
 An
> > > initiator connect the specific target by TVQN of connect command.
> > > An initiator could connect a single target, multiple initiators could
> > > connect the same target(typically, shared disk/fs).
> >=20
> > Why is the target ID separate from the TVQN? If the Target ID is a
> > separate parameter then users will have to learn additional
> > syntax/command-line options to specify the TVQN + Target ID and that
> > syntax may vary between software.
> >=20
>=20
> The TVQN is the location of a target, for example:
> virtio-tcp://192.168.1.110:8549/blk-dev/hdd-pool/238151a7-acd7-4621-bbdf-=
382ddbccb6a1
>=20
> A target can be shared by multi initiators, they accesses the target by t=
he
> same address(transport: tcp, ip: 192.168.1.110, port: 8549, TVQN:
> blk-dev/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1):
>=20
> Initiator_A launches Control Queue, issues connect command, gets the Targ=
et
> ID of Target_A(typically, dynamically allocated by target), then virtqueu=
es
> connect to Target_A.
>=20
> Initiator_B launches Control Queue, issues connect command, gets the Targ=
et
> ID of Target_B(typically, dynamically allocated by target), then virtqueu=
es
> connect to Target_B.

In your example you say "A target can be shared by multi initiators" but
then say "Target_A" and "Target_B", so the two initiators are not really
communicating with the same target?

Maybe instead of Target ID it should be called Device Instance ID? Then
the "Target" is the server that listens on 192.168.1.110:8549 and the
"Device Instance" is the VIRTIO device that the initiator is accessing
through the Target. One Target may contain many Device Instances.

I think that's clearer than calling boths Targets and Device Instances
the same thing.

Stefan

--TTs1LBMokLYSVrrV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR/ODMACgkQnKSrs4Gr
c8iIDAgAkG4rzz1NWiQrYi4W1OlMPoooZa4ynC+YqYFODC6f2W6ZcSpBuacIizUP
Z4juVD7Qb4d7IvzaoF20n8IZ8oNcs+wB0wN7lm15FTrpK5atgXEnBB9Bb2yU1/Zl
RuVQlOOOBee52vOS2hRQfQdh4dAs5radHd4E67aiZPPT4nx9mJlzQO/IX1cWuqSG
3tIErHrya1n7JbJcxWY0KrDNOvrz2gmeyPWQ/FxCreNElDsjX3zCrcNfBgatG9up
tHDYzVwE8hj6DsurpvUT8cdkS8SZ7DoF6DfVdmKHgvRBQw0/cAtzjPmFNnxkaIjk
mVFG2AtAN+rT68k/elTtUr+9VCnE/w==
=WDZL
-----END PGP SIGNATURE-----

--TTs1LBMokLYSVrrV--

