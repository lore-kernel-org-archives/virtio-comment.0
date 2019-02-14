Return-Path: virtio-comment-return-611-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1C892986074
	for <virtio-comment@lists.oasis-open.org>; Thu, 14 Feb 2019 03:43:11 +0000 (UTC)
Date: Thu, 14 Feb 2019 11:43:07 +0800
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190214034307.GF21877@stefanha-x1.localdomain>
References: <20190111114200.10026-1-dgilbert@redhat.com>
 <20190111114200.10026-2-dgilbert@redhat.com>
 <20190213022549.GB14307@stefanha-x1.localdomain>
 <20190213104426.GC2601@work-vm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p8PhoBjPxaQXD0vg"
Content-Disposition: inline
In-Reply-To: <20190213104426.GC2601@work-vm>
Subject: [virtio-comment] Re: [PATCH 1/3] shared memory: Define shared memory regions
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--p8PhoBjPxaQXD0vg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 13, 2019 at 10:44:27AM +0000, Dr. David Alan Gilbert wrote:
> * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > On Fri, Jan 11, 2019 at 11:41:58AM +0000, Dr. David Alan Gilbert (git) =
wrote:
 > >  We start with an overview of device initialization, then expand on the
> > > diff --git a/shared-mem.tex b/shared-mem.tex
> > > new file mode 100644
> > > index 0000000..6da249c
> > > --- /dev/null
> > > +++ b/shared-mem.tex
> > > @@ -0,0 +1,25 @@
> > > +\section{Shared Memory Regions}\label{sec:Basic Facilities of a Virt=
io Device / Shared Memory Regions}
> > > +
> > > +Shared memory regions are an additional facility
> > > +available to devices that need a region of memory that's
> > > +continuously shared between the host and the guest, rather
> > > +than passed between them in the way virtqueue elements are.
> > > +
> > > +Example uses include shared caches and version pools for versioned
> > > +data structures.
> >=20
> > Another motivation for shared memory regions is to accommodate memory
> > resources that must be allocated by the device rather than the driver.
> >=20
> > For example, some GPU hardware restrictions make it impossible for the
> > driver to select a suitable RAM region.
>=20
> I've added:
>=20
>   The region is chosen by the host and presented to the guest, as
>   such it is useful in situations where the memory is accessed on
>   the host by other libraries that can't safely access guest RAM.

Great!

"libraries" can be made more general:
s/libraries/components/

--p8PhoBjPxaQXD0vg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcZOPLAAoJEJykq7OBq3PI95gIAKf/P/uCuFgeUF8+e/BEO7WN
pqsqoWl5H3MxXtAPaeDS2UCzKYKTv+XaJC47/Iayjid6qmKTxFB7jXYPNpJky3pU
a2EeuLTv4YFJuf6J6WADDdsItYS0m8W+trnTLlsFhkg/EZhi86f9SrNxAFgpmlaG
x9oUvlFrmL1aksMU0l5VcdWywt4HjBBGTfC7VLcaBqS+iLHLsJdN9J4JrY6Gy6CA
8zps3uRDwMoDkEF1VdVXhySczIASAE5a+GbjLo3O9gVxz2cGjkwh/byH+9c9b0P8
mZg+Sz0XEn9KO4+dLQtnj6/tZrR5T2dGRud6UgUMN8d+OTHdQEqpldES2mD3nJc=
=dA+z
-----END PGP SIGNATURE-----

--p8PhoBjPxaQXD0vg--
