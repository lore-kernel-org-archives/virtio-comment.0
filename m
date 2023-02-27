Return-Path: <virtio-comment-return-4561-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A69F7986478
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Feb 2023 15:45:53 +0000 (UTC)
Date: Mon, 27 Feb 2023 10:45:45 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <Y/zQKS7WD227Qz2y@fedora>
References: <20221013074513.25141-1-baptiste.afsa@harman.com>
 <20230113073710-mutt-send-email-mst@kernel.org>
 <1673968792585.39097@harman.com>
 <CAJaqyWc-gEJGexf-h6OCez2NWg+L0aVeq=0y9tzFvDxmVkdkoQ@mail.gmail.com>
 <1677509635629.14571@harman.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wTKF63ASl6jNz5qD"
Content-Disposition: inline
In-Reply-To: <1677509635629.14571@harman.com>
Subject: Re: [virtio-comment] [PATCH] Introduce
 VIRTIO_F_ISOLATE_INDIRECT_DESC feature
To: "Afsa, Baptiste" <Baptiste.Afsa@harman.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--wTKF63ASl6jNz5qD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 02:53:55PM +0000, Afsa, Baptiste wrote:
> > Hi Baptiste,
> >
> > It is not the current way of working for shadow virtqueue in qemu, but
> > it is doable.
> >
> > QEMU offers a new address space to the device, including all the guest
> > memory and the shadow vrings in qemu memory. By default, qemu
> > translates each descriptor to this new address space and copies it in
> > the shadow vring, making sure it's a valid guest address.
> >
> > Net CVQ is a special case, as qemu copies also the buffer so a
> > malicious guest will not be able to change it and make vdpa device and
> > qemu's knowledge of it out of sync. This is done in a region mapped at
> > device start for this purpose for performance and simplicity, not for
> > each descriptor.
> >
> > It is technically possible to develop the copy of the buffer content
> > in a memory region too. Once a suitable size is agreed (or given by a
> > parameter in cmdline, for example), SVQ already supports things like
> > backoff in case this region is full. To malloc and map this region
> > dynamically is also possible.
> >
>=20
> Hello Eugenio,
>=20
> Thanks for the insight. It does have some similarities with what we have =
done on
> our side.
>=20
> We have also tried the approach of doing a copy of the buffer content int=
o a
> shared memory region but we did that on the guest side using things like =
the
> swiotlb or restricted DMA pools. This works well when buffers are small, =
but
> when they get larger, we get better performance by granting the memory
> dynamically.
>=20
> > > This new feature bit helps supporting indirect
> > > descriptors in this context.
> > >
> > > When an indirect descriptor is added to a virtqueue, we need to "shar=
e" the
> > > indirect descriptor table in addition to the buffers themselves. To d=
o this we
> > > have two options:
> > >
> > >   - Share a shadow copy of the table with the device but this require=
s some kind
> > >     of dynamic memory allocation in the hypervisor.
> > >
> > >   - Grant the indirect descriptor table from the guest as-is. Note th=
at in our
> > >     use case we do not translate buffer addresses when importing them=
 into the
> > >     device address space.
> > >
> >
> > The plan with indirect descriptors is similar to CVQ buffer treatment:
> > To preallocate a big enough chunk of memory able to hold a copy of the
> > indirect table and then translate each descriptor. The current dynamic
> > allocation scheme is very simple but it should work as long as there
> > is enough memory. As commented before, backoff is already available
> > for other cases.
>=20
> Ok. This is one of the options we considered initially, but that we rejec=
ted
> because we wanted to avoid dynamic memory allocation.
>=20
> However, we are reconsidering this idea now. We initially overlooked the =
fact
> that the spec limits the size of an indirect descriptor table to the queue
> size. Having this allows us to figure out the maximum size for a single i=
ndirect
> descriptor table and the total size needed for the memory pool that will =
store
> the copies of the indirect descriptor tables.
>=20
> The issue that we have now, is that this limitation does not seem to be e=
nforced
> in Linux virtio drivers today. I came across:
>=20
> https://github.com/oasis-tcs/virtio-spec/issues/122
>=20
> which looks like a good base for us to build upon, but I'm not sure what =
is the
> status with this issue. Do you know whether there is any plan regarding t=
his?

CCing Christian regarding extending queue size limits.

> > Going a step forward with current qemu's SVQ, a feature that would
> > help is to allow the device to translate buffers addresses with a
> > different IOVA from vring and indirect table. But this is far from
> > standard POV, since it does not have even an address space concept.
>=20
> I'm not sure to see what this would bring compared to the current design.
>=20
> > Do you think both modes can converge?
>=20
> I think so since we are now thinking of using a copy of the indirect desc=
riptor
> table. This would eliminate the need for any additional feature bit.
>=20
> > > The issue with the second option is that we need to ensure that the d=
river will
> > > not modify the indirect descriptor table while it is on the device si=
de.
> > > Otherwise the device could attempt to access the buffers using the ne=
w addresses
> > > which would not correspond to the one the hypervisor used when granti=
ng memory.
> > >
> > > Since this is something that a correct driver implementation would no=
t do, this
> > > led to the idea of remapping the table read-only while it is used by =
the device.
> > > Because an indirect descriptor table may not fill an entire page, we =
needed a
> > > way to ensure that the OS would not re-use the rest of these pages fo=
r other
> > > purposes while we have made them read-only.
> > >
> >
> > How do you guarantee it for vring itself?
>=20
> For the vrings we do exactly what you described for QEMU. The virtqueues =
that
> the device sees are not the virtqueues allocated by the driver but the sh=
adow
> copies managed by the hypervisor. If the driver touches the descriptors a=
fter
> they have been copied to the shadow virtqueue, the hypervisor will ignore=
 these
> changes.
>=20
> Thanks.
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>=20
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>=20
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>=20

--wTKF63ASl6jNz5qD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmP80CkACgkQnKSrs4Gr
c8gzJwf/YgcJkCtavmpYbXPVJTbIqoqUq3cjf6NgNttp0ZNriRCPPGrGY/9uDLyt
9CO0FB32TAeq/bbsWnQcJ/UNJKu0cFaojDykFl0sU/rLiKLYAN5QCmPwbWbcfvBb
thpQk3xlTx5m9LvBb67AlBt44031fJzyGa5GjvHZH63b6wpGNczsIjcABHSSnU6I
TGHB+DYvVJXk0xoMKFvMEZ7RO+u34zbQ5OZLddxrfyppYOxW03NPdTjWk36m4jJD
7w3HUT0QNn2oFKyxKOtw51ondyZtoeL2aIEFzJCKxo5lC8A54Rg76xclnrAHBH7J
4jlgOYVV922GfrjA04eFDek+McU2Yg==
=v2pP
-----END PGP SIGNATURE-----

--wTKF63ASl6jNz5qD--

