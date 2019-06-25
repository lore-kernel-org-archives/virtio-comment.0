Return-Path: virtio-comment-return-765-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 94BA3985BDB
	for <virtio-comment@lists.oasis-open.org>; Tue, 25 Jun 2019 13:25:04 +0000 (UTC)
Date: Tue, 25 Jun 2019 14:24:56 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190625132456.GA15691@stefanha-x1.localdomain>
References: <20190625073336.7813-1-ybettan@redhat.com>
 <20190625075234.GA12603@stefanha-x1.localdomain>
 <bf58a65d-296e-a3f5-c09b-28cf294feec2@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
In-Reply-To: <bf58a65d-296e-a3f5-c09b-28cf294feec2@redhat.com>
Subject: Re: [virtio-comment] [PATCH V2] Added building instruction to
 README.md.
To: Yoni Bettan <ybettan@redhat.com>
Cc: mst@redhat.com, virtio-comment@lists.oasis-open.org, ehabkost@redhat.com, ailan@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2019 at 11:29:28AM +0300, Yoni Bettan wrote:
>=20
> On 6/25/19 10:52 AM, Stefan Hajnoczi wrote:
> > On Tue, Jun 25, 2019 at 10:33:36AM +0300, Yoni Bettan wrote:
> > > Signed-off-by: Yoni Bettan <ybettan@redhat.com>
> > > ---
> > >   README.md | 34 ++++++++++++++++++++++++++++++++++
> > >   1 file changed, 34 insertions(+)
> > >=20
> > > diff --git a/README.md b/README.md
> > > index 3de0c1e..fc33c9f 100644
> > > --- a/README.md
> > > +++ b/README.md
> > > @@ -29,6 +29,40 @@
> > >   <div>
> > >   <h3>Further Description of this Repository</h3>
> > > +<h4>Building Instructions</h4>
> > > +<p>In order to build the spec you will need <a href=3D"https://www.t=
ug.org/texlive/">Tex-Live</a>.
> > > +Installing it can be done via:<br>
> > > +Fedora:
> > > +<code>
> > > +sudo dnf install texlive-scheme-full
> > > +</code><br>
> > > +Ubuntu:
> > > +<code>
> > > +sudo apt-get install texlive-full
> > > +</code><br></p>
> > > +<p>The building proccess is done with
> > > +<code>
> > > +./makeall.sh
> > > +</code>
> > > +and it contains 3 main parts:
> > > +<code>
> > > +makezip.sh
> > > +</code>,
> > > +<code>
> > > +makehtml.sh
> > > +</code>,
> > > +<code>
> > > +makepdf.sh
> > > +</code>.
> > > +Using
> > > +<code>
> > > +./makehtml.sh
> > > +</code>
> > > +should be enought if you just want to test your changes since
> > > +<code>
> > > +makepdf.sh
> > > +</code>
> > > +may required some font packages.</p>
> > Thanks for adding instructions.  I have hit latex errors in the past
> > that only happened with makepdf.sh, so ideally everyone should use
> > makeall.sh.
>=20
>=20
> Did you mean ideally everyone should use makehtml.sh ?

No.  You may miss errors if you only run one of makehtml.sh or
makepdf.sh.  You need to run makeall.sh to get full coverage.

Stefan

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0SIKgACgkQnKSrs4Gr
c8gq3QgAsz9FkdLSUj2pz8YdxyLC7thfsR8tcIWrjm3S7Y0I4r8+DCPP7cU2UqTs
QIey341nG2BaxF4b69u1DpewnWXBv84VfVTgsuKB/Mf2bE2sIEWQPY3Az5/rq9Dn
H21TbIaSUBgJJ52efSDhq2tmzNsQASs/KoZJW9EtAfnwDLomDv+Te0Oc4gY/AWKY
lw+edlcCAWz6hllWhtK4etfVuF9kOocbiagAk9lgBmTftOwvmxduHKYRQvGLHu8l
SjtFZ/IxeVpACdKfeMlom8jgSxsBlvRGDguc30OMqD7Z4q88+cQAtvMgXMt+njLB
sbsi1JmZfiv4SZj2sxT77BawLDd+Yw==
=QPAb
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
