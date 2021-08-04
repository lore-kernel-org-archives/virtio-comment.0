Return-Path: <stefanha@redhat.com>
Date: Wed, 4 Aug 2021 13:50:16 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH] Introduce admin virtqueue as a new transport
Message-ID: <YQqNCMTwyubfNIkb@stefanha-x1.localdomain>
References: <20210803032006.48881-1-jasowang@redhat.com>
 <YQpLP/NofUOMIsOA@stefanha-x1.localdomain>
 <67baffcb-1719-3909-9496-7eee1dde99af@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="trp+qUq2VipYqLHj"
Content-Disposition: inline
In-Reply-To: <67baffcb-1719-3909-9496-7eee1dde99af@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com, mgurtovoy@nvidia.com, eperezma@redhat.com, lulu@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


--trp+qUq2VipYqLHj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 04, 2021 at 04:51:15PM +0800, Jason Wang wrote:
> =E5=9C=A8 2021/8/4 =E4=B8=8B=E5=8D=884:09, Stefan Hajnoczi =E5=86=99=E9=
=81=93:
> > On Tue, Aug 03, 2021 at 11:20:06AM +0800, Jason Wang wrote:
> > > +for telling whether device MMU is enabled for the virtual device: 0
> > > +means to enable and 1 means to disable.
> > > +
> > > +The VIRTIO_ADMIN_VQ_CTRL_MMU_ASID_SET is used to assign a device
> > > +address space id to a virtqueue. The command-out-data is the queue
> > > +index (\field{queue_index}) and the address space ID (\field{asid})
> > > +assigned to it (as described in struct virtio_admin_ctrl_vdev_mmu_as=
id_set).
> > > +
> > > +The VIRTIO_ADMIN_VQ_CTRL_MMU_MAP is used to map the I/O Virtual
> > > +Address range [\field{iova_start}, \field{iova_end}] to transport
> > > +specific DMA address range [\field{dma_start}, \field{dma_start} +
> > > + \field{iova_end} - \field{iova_start} + 1]. \field{flags} is used to
> > > +specify the device access permission.
> > > +
> > > +The VIRTIO_ADMIN_VQ_CTRL_MMU_UNMAP is used to unmap all the mapped I=
/O
> > > +Virtual Address ranges that are intersected with the range
> > > +[\field{iova_start}, \field{iova_end}].
> > > +
> > > +There's no command-in-data for all the above four commands.
> > > +
> > > +The VIRTIO_ADMIN_VQ_CTRL_MMU_ERR_GET is used to get the error
> > > +information of the device MMU. There's no command-out-data, the
> > > +command-in-date is the queue index and its asid, the iova range and
> > > +the access of the operation (as described in struct
> > > +virtio_admin_ctrl_vdev_mmu_err).
> > > +
> > > +\devicenormative{Virtqueue Status}\label{sec:Virtio Transport Option=
s / Virtio Over Admin Virtqueue / Device MMU}
> > Does the virtual device need to support running with the device MMU
> > disabled?
>=20
>=20
> Yes, device MMU could be disabled.

I'm a little surprised that there is no way to refuse to run without the
device MMU because I got the impression using MMUs is required for
security/isolation on modern systems.

If I have a physical non-SR-IOV PCI management device, how does the
virtual device access memory when the device MMU is disabled? Would its
address space be identical to the management device's IOVA space?

Maybe you can write a paragraph or two explaining how the address spaces
of management and virtual devices are related?

>=20
>=20
> >=20
> > > +
> > > +The management device MUST fail the device MMU command if \field{dev=
ice_id} is
> > > +zero.
> > > +
> > > +The management device MUST fail the VIRTIO_ADMIN_VQ_CTRL_MMU_MAP
> > > +command if the iova range is intersected with a existing range.
> > > +
> > > +The management device MUST set both DEVICE_NEEDS_RESET and
> > > +DEVICE_MMU_FAIL when the device MMU fails to do the translation for a
> > > +virtual device.
> > > +
> > > +The device MMU for the virtual device MUST be disabled upon its rese=
t.
> > > +
> > > +Upon reset, the virtual device must reset the Address Space ID for
> > > +each virtqueue to 0.
> > > +
> > > +\drivernormative{Virtqueue Status}\label{sec:Virtio Transport Options
> > > +  / Virtio Over Admin Virtqueue / Device MMU}
> > > +
> > > +The driver MAY choose to disable the device MMU but it MUST make sure
> > > +the transport specific method could be used to provide a secure DMA
> > > +context for each virtual device.
> > What does this mean?
>=20
>=20
> It means when device MMU is disabled. The management driver must make sur=
e a
> platform specific feature like PASID capable IOMMU is used to isolate DMA
> between the virtual devices.

Ah, this is related to what I asked above. It's still not 100% clear to
me.

>=20
>=20
> >=20
> > During which stages of the virtual device's lifecycle (ACKNOWLEDGE,
> > DRIVER, FEATURES_OK, DRIVER_OK) may the management driver enable/disable
> > the device MMU?
>=20
>=20
> My understanding is that it doesn't matter which stage. E.g it should be
> safe to be enabled before DRIVER_OK since it doesn't have any virtqueue
> operations.
>=20
> The driver just need to make sure:
>=20
> - device MMU is enabled before DRIVER_OK
> - when device MMU is disabled, the transport/platform DMA hardware has be=
en
> setup

Thanks, please include that information.

> > I tried to imagine what the virtio-blk vdev creation parameters need to
> > look like. Here is what I came up with:
> >=20
> >    Virtual Device Creation Parameters for Block Devices
> >    ----------------------------------------------------
> >    The following creation parameters specify the details of a new virtu=
al
> >    block device:
> >=20
> >    Field        Type   Meaning
> >    --------------------------------------------------------------------=
--
> >    blkdev_id    u64    Identifier of the underlying block device that
> >                        provides storage. The enumeration and creation of
> >                        underlying block devices is
> >                        implementation-specific.
> >    num_queues   u16    Number of request virtqueues.
> >    features_len u8     Number of elements in features[].
>=20
>=20
> For 'elements' do you mean the 'u32 elements'?

Yes, u32 array elements.

> >    features[]   u32    Device feature bits to report.
> >=20
> >    Creation error codes are as follows:
> >=20
> >    Error               Meaning
> >    --------------------------------------------------------------------=
--
> >    INVALID_BLKDEV_ID   The underlying block device does not exist.
> >    BLKDEV_BUSY         The underlying block device is already in use.
> >    BLKDEV_READ_ONLY    The underlying block device is read-only.
> >    INVALID_NUM_QUEUES  The number of request queues was 0 or too large.
> >    UNSUPPORTED_FEATURE A feature bit was given that the device does not
> >                        support.
> >=20
> >    If the VIRTIO_BLK_F_RO bit is set in features[] then the underlying
> >    block device is made available for read-only access.
> >=20
> >    Creation MAY fail with BLKDEV_BUSY if a blkdev_id value that is
> >    already in use is given.
> >=20
> >    Creation MAY fail with BLKDEV_READ_ONLY if the underlying block devi=
ce
> >    does not support writes and the VIRTIO_BLK_F_RO bit is not set in
> >    features[].
> >=20
> >    The configuration space parameters (see 5.2.4 Device configuration
> >    layout) are determined by the device based on the underlying block
> >    device capacity, block size, etc.
> >=20
> > Note that this doesn't allow overriding configuration space parameters
> > (e.g. block size). We probably need to support that in the future for
> > live migration compatibility.
>=20
>=20
> I wonder do we need those configuration to be self-descriptive? E.g how d=
id
> the device know that the config contains the blk_size. (I guess it's not a
> good practice to infer this from the config len).

The device configuration space size and layout is determined by the
device feature bits.

Stefan

--trp+qUq2VipYqLHj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEKjQgACgkQnKSrs4Gr
c8hNjgf+MR5qVW+LTg51OpZR0DNeo6OHjss/or/9j+udk+WKzpW2fVsu6tlihAjq
SgbSjhF9JUK8prf8JrmV3gKvvFldVaojO2ud3AyWgRAbfLZBkM0/mcLjeOONuAXQ
z3JAVmplt759yHHbWtsYlMPA5M8JHQM6UrKWdVv3hpQSfDHJlX9W23cq9fzjAA/f
KwF023wKNYSMB6C1OqO4DOPF8+owst8Y2II7J0boeThL8ZpLaZKTDvlZx51taj1I
n11abts32o/jRSvOuJqueT8WDdAK75UMZ0Qg/7EYLU6drB39ms60cfegVBx7kSJB
vXD1G0yseYH2K+vzYZihal3Y8F3hZQ==
=rzL0
-----END PGP SIGNATURE-----

--trp+qUq2VipYqLHj--

