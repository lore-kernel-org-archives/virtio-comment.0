Return-Path: virtio-comment-return-569-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1B5CF985B91
	for <virtio-comment@lists.oasis-open.org>; Tue, 27 Nov 2018 09:27:49 +0000 (UTC)
Date: Tue, 27 Nov 2018 09:27:34 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20181127092734.GB9360@stefanha-x1.localdomain>
References: <20180921095459.GA2842@work-vm>
 <20181126111612.GG15869@stefanha-x1.localdomain>
 <20181126135245.v4lklw6qwa2ggv4t@sirius.home.kraxel.org>
 <20181126140338.GC2547@work-vm>
 <20181126145145.cbuzccf3qo4z2nau@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Content-Disposition: inline
In-Reply-To: <20181126145145.cbuzccf3qo4z2nau@sirius.home.kraxel.org>
Subject: [virtio-comment] Re: PCI cap for larger offsets/lengths
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-comment@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 26, 2018 at 03:51:45PM +0100, Gerd Hoffmann wrote:
>   Hi,
>=20
> > > So, I'm wondering whenever it makes sense to just do the same for your
> > > device.  Just use one pci bar as shared memory umbrella, specify that
> > > one using the virtio vendor cap, then have sub-regions within that bar
> > > for the various regions you have.  Manage them dynamically (using
> > > device-specific virtio commands) or just have a static configuration =
(in
> > > device-specific config space).
> >=20
> > Ours are static subdivisions; so it felt easier to declare them; it's a
> > shame to make that device specific.
>=20
> Shared memory handling is device specific anyway, so I fail to see why
> this is a problem.  Or do you want place virtio queues there (which
> could be common ground for multiple device types) ?
>=20
> > > That avoids the problem with multiple capabilities of the same kind, =
and
> > > it also avoids exhausting the cap IDs quicky if every device defines
> > > their own VIRTIO_FOO_DEVICE_PCI_SHMCAP_ID_BAR_REGION.
> >=20
> > Is having multiple capabilities of the same type actually a problem, or
> > is it just historical in the defitinition of virtio?
>=20
> I think the reason is that you can in theory have the same region twice,
> once in an IO bar and once in an MMIO bar, and then the guest could
> prefer the IO bar if possible and use the MMIO bar otherwise (PCIe slot
> without IO address window for example).  I think that was never actually
> done in practice, and for (prefetchable) memory bars it doesn't make
> sense at all.  So that would unlikely be a problem in practice.
>=20
> Running out of capability IDs could become a real problem though.

If we use a dedicated prefetchable MMIO BAR for shared memory resources,
then that BAR is unavailable.  For example, if the virtio-pci transport
itself ever wants to use a prefetchable MMIO BAR too.

I would keep the indirection offered by PCI capabilities so that devices
retain the ability to decide how exactly BARs are used without requiring
spec or driver changes.

Stefan

--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJb/Q4GAAoJEJykq7OBq3PIbGEH/jHmSL/JBKF6ComwKTLqPf9Q
GeIipsy+3Ljih/6loApsi1CQ56U96UyrwqzjPwlwY20mqjtFI5GHt7do16XuVQ7A
sYsCs8QHfKc8Dl0RY4VBEk9kSFqkp8urSYIPL7jfx7boT89dgLMCJEzK8mcwodvy
lfYSelyLSeQ3DVzG/NBwd6c4UGO13/fBxdfVECa/trWJ+AMsFX1FTpNuR41epNWD
bQGfUc5tVbdpm4pPyL0cjik7OFcOia2D9+Uah0/gnVZzNkj/0YWu/jsfqmmxrs+t
RTWqzSsSjY9j2aBAroRHDhCdd21pDq8x4ceL4G0n+L1N2X08HJb20dE555zymRQ=
=olG0
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--
