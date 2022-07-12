Return-Path: <virtio-comment-return-3224-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AD8009864BF
	for <virtio-comment@lists.oasis-open.org>; Tue, 12 Jul 2022 10:37:09 +0000 (UTC)
Date: Tue, 12 Jul 2022 11:37:02 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <Ys1OztCwkBFN/aev@stefanha-x1.localdomain>
References: <AM7PR10MB393991E00607F2D6ACE978DBCDA19@AM7PR10MB3939.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB393952B517ACE6A88F279BDECDBB9@AM7PR10MB3939.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aUDwRTapemu6f5a5"
Content-Disposition: inline
In-Reply-To: <AM7PR10MB393952B517ACE6A88F279BDECDBB9@AM7PR10MB3939.EURPRD10.PROD.OUTLOOK.COM>
Subject: Re: [virtio-comment] RE: =?iso-8859-1?Q?vi?=
 =?iso-8859-1?Q?rtio-device_in_=B5C?= of a SoC
To: "Gittinger Joerg (XC-ECO/ESH2)" <Joerg.Gittinger@de.bosch.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--aUDwRTapemu6f5a5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 10:01:28AM +0000, Gittinger Joerg (XC-ECO/ESH2) wro=
te:
> Hi,
>=20
> > I have a concrete request for a use-case to support by virtio, but am n=
ot sure where and how to discuss it.=20
> > So please let me know if this mailing list is not the proper place.
>=20
> Maybe making a concrete proposal is a better way to handle such a proposa=
l.
> Please let me know if this is appropriate or not - just give me some feed=
back, sort of either
> "Go away, we'll never support something like this" or
> "Yes, this use case sounds valid. Let us refine/see how we could support =
this".

Hi Joerg,
This is the right mailing list. Maybe the people who are interested in
similar use cases are busy right now, but don't be discouraged!

Your proposal sounds like it's within the scope of VIRTIO and makes
sense in specific circumstances. The next step to making this more
concrete is to send a specification patch
(https://github.com/oasis-tcs/virtio-spec/) for review and voting.

>=20
> Proposal about:=20
> ---------------
>=20
> Extending virtio-mmio transport by explicit synchronization.
>=20
> Use case:=20
> ---------
>=20
> If virtio device is implemented on a different CPU than virtio driver and=
=20
> accesses to MMIO region by the driver cannot be "trapped" by the device,=
=20
> the need for additional synchronization between virtio driver and device=
=20
> is given.
> The current virtio MMIO transport specification implicitly expects especi=
ally=20
> during device initialization that virtio device synchronously responds to=
=20
> interactive MMIO register write operations by the driver.
> In case of a device implemented by a hypervisor this means the hypervisor=
=20
> traps accesses to the MMIO region of the driver implemented in a guest.
> In case of a device implemented on a different CPU this does not work out=
=20
> anymore. For such a case dedicated device initialization steps require=20
> additional synchronization of MMIO write operations by the driver.

In Linux there is the VIRTIO-based rpmsg inter-processor messaging bus:
https://docs.kernel.org/staging/rpmsg.html

It's not developed as part of the VIRTIO spec and unfortunately I don't
know much about how it works, but it came to mind when I read about your
usecase. I believe it does not notifications (interrupts) though, so
maybe your use case is different.

>=20
> Design proposal:
> ----------------
>=20
> 1. Introduce a new device feature bit indicating requirement for=20
>    synchronization when using the MMIO transport.
>=20
>    E.g. VIRTIO_F_MMIO_SYNCHRONIZE. This feature bit indicates that the de=
vice
>    requires MMIO synchronization. It must be defined in the first 32 feat=
ure=20
>    bits of the device.=20
>=20
> 2. Driver requirements for VIRTIO_F_MMIO_SYNCHRONIZE:
>=20
>    a. The driver must read the first 32 device feature bits at first in o=
rder
>       to identify if MMIO access must be synchronized.
>    b. In case VIRTIO_F_MMIO_SYNCHRONIZE is indicated by the device, the
>       driver must wait for the synchronization acknowledgement by the dev=
ice
>       after writing to:=20
>         DeviceFeaturesSel
>         DriverFeaturesSel
>         DriverFeatures
>         QueueSel
>         Status
>         QueueDescHigh
>         QueueDriverHigh
>         QueueDeviceHigh
>         SHMSel
>         SHMLenHigh
>         SHMBaseHigh
>         QueueReset
>=20
> 3. The MMIO synchronization
>=20
>    The MMIO synchronization is realized by 2 additional registers in the
>    MMIO region:
>=20
>         DriverSyncWatermark (RW)
>         DeviceSyncWatermark (R)
>=20
>    The synchronization works this way:=20
>    Whenever the driver has written to the registers listed in section 2.=
=20
>    above, it increments the value in DriverSyncWatermark by one.
>    The driver does not continue with reading/writing any MMIO registers=
=20
>    before the device has set the DeviceSyncWatermark to the same value as=
=20
>    in DriverSyncWatermark. By updating DeviceSyncWatermark to the same
>    value as DriverSyncWatermark the device indicates acknowledgement of
>    the change to MMIO registers by the driver.

On some CPU architectures there are memory wait instructions for
monitoring the contents of a memory location. DriverSyncWatermark and
DeviceSyncWatermark look like ideal targets for this type of CPU
instruction.

> 4. Issues
>=20
>    - Driver initiated device reset at start of device initialization:
>=20
>      According to the specification, the driver must reset the device
>      before reading the DeviceFeatures. This is before it knows that
>      the device needs synchronization.
>      In this case the driver must restart the device initialization,
>      i.e. reinitiate device reset, this time waiting for=20
>      acknowledgement of the device.

This sounds fine. It doesn't stop your approach from working.

>=20
>    - driver -> device notification of queue updates, i.e. QueueNotify:
>=20
>      If the driver would have to wait for device acknowledgement of=20
>      updates to QueueNotify after device initialization phase, this
>      would have signification impact on the performance and would=20
>      probably be not accepted by users. Therefore the requirement for=20
>      synchronization on updates to QueueNotify is dropped.
>      Instead, the device is supposed to periodically check for updates=20
>      on QueueNotify or check the physical memory location of the
>      driver queues directly for updates.

The queue index or VIRTIO_F_NOTIFICATION_DATA value may be overwritten
by the driver by the time the device sees it. If the device needs to
poll anyway then it might as well poll the vring. QueueNotify can be
skipped entirely and is unnecessary with VIRTIO_F_MMIO_SYNCHRONIZE.

How do Used Buffer Notifications (typically device->driver interrupts)
work? Are they skipped too and the driver polls the vrings?

Stefan

--aUDwRTapemu6f5a5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLNTs4ACgkQnKSrs4Gr
c8j/eAgAwPeZncjPu1UXB0VeZWkwHbWxW/nI6yHr4vl+j28iUnSs536n5aZbXjtw
QmLt2SwYIwVtfGszXV56CmXORbsj0lS/vjmdI58WrIVSQToOGto9tB/+gUrojgUc
KXp33tahM+5Ii7nRgW8qWgKIqxE0YcBSW7K9AQNMP4eLfL0Wtd0rc0g3FeoSGrEL
OREvlyvmPcHppAaAvg/jXKBEgew5fhuGPx9WgwUlwijcoJ5HKm2P+8JnVWm3PbhO
1GSiZsT74V7+AIyQwTeJ9YOUklr+iu1KtIis30cbErqDI7E3c26gjf3SNOrXbGhZ
llglRg8kTenjKx5ryLTAR389GUAdLg==
=iULV
-----END PGP SIGNATURE-----

--aUDwRTapemu6f5a5--

