Return-Path: virtio-comment-return-1790-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0D744986574
	for <virtio-comment@lists.oasis-open.org>; Wed, 24 Mar 2021 10:05:42 +0000 (UTC)
Date: Wed, 24 Mar 2021 10:05:31 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YFsO61ZqKIbx2uV9@stefanha-x1.localdomain>
References: <20210322034717.35135-1-jasowang@redhat.com>
 <YFnFpcaAg0atjwTt@stefanha-x1.localdomain>
 <48f5695e-9a34-88cd-44a4-a9d31426e6eb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <48f5695e-9a34-88cd-44a4-a9d31426e6eb@redhat.com>
Subject: Re: [virtio-comment] [PATCH V2 0/2] Introduce VIRTIO_F_QUEUE_STATE
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XJVlhmYkvj3t+XqD"
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, virtio-comment@lists.oasis-open.org, eperezma@redhat.com, lulu@redhat.com, rob.miller@broadcom.com, pasic@linux.ibm.com, sgarzare@redhat.com, cohuck@redhat.com, jim.harford@broadcom.com
List-ID: <virtio-comment.lists.oasis-open.org>

--XJVlhmYkvj3t+XqD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 03:05:30PM +0800, Jason Wang wrote:
>=20
> =E5=9C=A8 2021/3/23 =E4=B8=8B=E5=8D=886:40, Stefan Hajnoczi =E5=86=99=E9=
=81=93:
> > On Mon, Mar 22, 2021 at 11:47:15AM +0800, Jason Wang wrote:
> > > This is a new version to support VIRTIO_F_QUEUE_STATE. The feautre
> > > extends the basic facility to allow the driver to set and get device
> > > internal virtqueue state. This main motivation is to support live
> > > migration of virtio devices.
> > Can you describe the use cases that this interface covers as well as th=
e
> > steps involved in migrating a device?
>=20
>=20
> Yes. I can describe the steps for live migrating virtio-net device. For
> other devices, we probably need other state.

Thanks, describing the steps for virtio-net would be great.

>=20
>=20
> >   Traditionally live migration was
> > transparent to the VIRTIO driver because it was performed by the
> > hypervisor.
>=20
>=20
> Right, but it could be possible that we may want live migrate between
> hardware virtio-pci devices. So it's up to the hypversior to save and
> restore states silently without the notice of guest driver as what we did
> for vhost.

This is where I'd like to understand the steps in detail. The set/get
state functionality introduced in this spec change requires that the
hypervisor has access to the device's hardware registers - the same
registers that the guest is also using. I'd like to understand the
lifecycle and how conflicts between the hypervisor and the guest are
avoided (unless this is integrated into vDPA/VFIO/SR-IOV in a way that I
haven't thought of?).

>=20
>=20
> >=20
> > I know you're aware but I think it's worth mentioning that this only
> > supports stateless devices.
>=20
>=20
> Yes, that's why it's a queue state not a device state.
>=20
>=20
> >   Even the simple virtio-blk device has state
> > in QEMU's implementation. If an I/O request fails it can be held by the
> > device and resumed after live migration instead of failing the request
> > immediately. The list of held requests needs to be migrated with the
> > device and is not part of the virtqueue state.
>=20
>=20
> Yes, I think we need to extend virtio spec to support save and restore
> device state. But anyway the virtqueue state is the infrastructure which
> should be introdouced first.

Introducing virtqueue state save/load first seems fine, but before
committing to a spec cange we need an approximate plan for per-device
state so that it's clear the design can be extended to cover that case
in the future.

> >=20
> > I'm concerned that using device reset will not work once this interface
> > is extended to support device-specific state (e.g. the virtio-blk faile=
d
> > request list). There could be situations where reset really needs to
> > reset (e.g. freeing I/O resources) and the device therefore cannot hold
> > on to state across reset.
>=20
>=20
> Good point. So here're some ways:
>=20
>=20
> 1) reuse device reset that is done in this patch
> 2) intorduce a new device status like what has been done in [1]
> 3) using queue_enable (as what has been done in the virtio-mmio, pci forb=
ids
> to stop a queue currently, we may need to extend that)
> 4) use device specific way to stop the datapath
>=20
> Reusing device reset looks like a shortcut that might not be easy for
> stateful device as you said. 2) looks more general. 3) have the issues th=
at
> it doesn't forbid the config changed. And 4) is also proposed by you and
> Michael.
>=20
> My understanding is that there should be no fundamental differences betwe=
en
> 2) and 4). So I tend to respin [1], do you have any other ideas?

2 or 4 sound good. I prefer 2 since one standard interface will be less
work and complexity than multiple device-specific ways of stopping the
data path.

3 is more flexible but needs to be augmented with a way to pause the
entire device. It could be added on top of 2 or 4, if necessary, in the
future.

Stefan

--XJVlhmYkvj3t+XqD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBbDusACgkQnKSrs4Gr
c8jGOwf9F0rKNr8p6iMbsifpljG9OLaAq/OcqKk37RqMRTlU0gzwyzNa3Dpy0vx1
IvdX//Dh8/FWWT0yYAE1XDiiMCi9pGjpW9LYwO46lb+eNAZCFkPPW++LFJ5d5pnO
8RAB5lZpMQn5w41OAQbCRkHLUOTvlUpKktvEjkXeasB+NNk3HMMjSzieqF7XOLrt
huEYaOJ9BTb07xtc7x9OL+4Z6zwFAtvzj85abdtI75NSaL/z7GDSrYP3P6qVOKCG
b78FktM2hc47w3PzA+DJrQikao4ued5g9H2rJuWijf5TYjDAZngYcsW7Sdnm2ceG
Uso3d/bD39jhdIK+Q8zC6S8wVLzDnw==
=O93W
-----END PGP SIGNATURE-----

--XJVlhmYkvj3t+XqD--

