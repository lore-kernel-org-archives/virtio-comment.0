Return-Path: <stefanha@redhat.com>
Date: Mon, 26 Jul 2021 15:42:19 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH 1/1] Add virtio Admin Virtqueue specification
Message-ID: <YP7Jy0FNHRp+nfUs@stefanha-x1.localdomain>
References: <20210722162336.23990-1-mgurtovoy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4023Nj3Pj7nRTgCn"
Content-Disposition: inline
In-Reply-To: <20210722162336.23990-1-mgurtovoy@nvidia.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, jasowang@redhat.com, cohuck@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


--4023Nj3Pj7nRTgCn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 22, 2021 at 07:23:36PM +0300, Max Gurtovoy wrote:
> Admin virtqueues will be used to send administrative commands to
> manipulate various features of the device which would not easily map
> into the configuration space.
>=20
> The same Admin command format will be used for all virtio devices. The
> Admin command set will include 4 types of command classes:
> 1. The generic common class
> 2. The transport specific class
> 3. The device specific class
> 4. The vendor specific class
>=20
> The above mechanism will enable adding various features to the virtio
> specification, e.g.:
> 1. Format virtio-blk devices in various configurations (512B block size,
>    512B + 8B T10-DIF, 4K block size, 4k + 8B T10-DIF, etc..).
> 2. Live migration management.
> 3. Encrypt/Decrypt descriptors.
> 4. Virtualization management.
> 5. Get device error logs.
> 6. Implement advanced vendor/device/transport specific features.
> 7. Run device health test.
> 8. More.
>=20
> As virtio evolves beyond the para-virt/sw-emulated world, it's mandatory
> for the specification to become flexible and allow a wider feature set.
> The corrent ctrl virtq that is defined for some of the virtio devices is
> device specific and wasn't designed to be a generic virtq for
> admininistration.
>=20
> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> ---
>  admin-virtq.tex | 69 +++++++++++++++++++++++++++++++++++++++++++++++++
>  content.tex     |  4 +++
>  2 files changed, 73 insertions(+)
>  create mode 100644 admin-virtq.tex
>=20
> diff --git a/admin-virtq.tex b/admin-virtq.tex
> new file mode 100644
> index 0000000..dc1d2cd
> --- /dev/null
> +++ b/admin-virtq.tex
> @@ -0,0 +1,69 @@
> +\section{Admin Virtqueues}\label{sec:Basic Facilities of a Virtio Device=
 / Admin Virtqueues}
> +
> +Admin virtqueues are used to send administrative commands to manipulate
> +various features of the device which would not easily map into the
> +configuration space. Admin virtqueues are also used to get advance

s/advance/advanced/

> +device properties.
> +
> +Use of Admin virtqueues is negotiated by the VIRTIO_F_ADMIN_VQ
> +feature bit.
> +
> +Admin virtqueue index may vary among different device types.
> +
> +All commands are of the following form:
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd {
> +        /* Device-readable part */
> +        u8 class;
> +        u8 command;
> +        u8 command-specific-data[];
> +
> +        /* Device-writable part */
> +        u8 command-specific-result[];
> +        u8 status_type : 4;
> +        u8 reserved : 4;
> +        u8 status;
> +};
> +
> +/* Status type values */
> +#define VIRTIO_ADMIN_STATUS_TYPE_GENERIC               0
> +#define VIRTIO_ADMIN_STATUS_TYPE_CLASS_SPECIFIC        1
> +#define VIRTIO_ADMIN_STATUS_TYPE_COMMAND_SPECIFIC      2
> +#define VIRTIO_ADMIN_STATUS_TYPE_TRANSPORT_SPECIFIC    3
> +#define VIRTIO_ADMIN_STATUS_TYPE_DEVICE_SPECIFIC       4
> +#define VIRTIO_ADMIN_STATUS_TYPE_VENDOR_SPECIFIC       5
> +
> +/* Generic status values */
> +#define VIRTIO_ADMIN_STATUS_GENERIC_OK                     0
> +#define VIRTIO_ADMIN_STATUS_GENERIC_ERR                    1
> +#define VIRTIO_ADMIN_STATUS_GENERIC_INVALID_CLASS          2
> +#define VIRTIO_ADMIN_STATUS_GENERIC_INVALID_COMMAND        3
> +#define VIRTIO_ADMIN_STATUS_GENERIC_DATA_TRANSFER_ERR      4
> +#define VIRTIO_ADMIN_STATUS_GENERIC_DEVICE_INTERNAL_ERR    5
> +\end{lstlisting}
> +
> +The \field{class}, \field{command} and \field{command-specific-data} are
> +set by the driver, and the device sets the \field{status_type}, the
> +\field{status} and  the \field{command-specific-result}, if needed.

What are the semantics regarding:

- When can the admin virtqueue be used (only after the Device
  Initialization sequence is complete, while the device is active and
  performing I/O, etc)?
- Are commands executed in order?
- Can multiple commands execute concurrently (e.g. long-running commands
  like formatting a disk)?

> +
> +The virtio Admin command class codes are divided in the following form:
> +
> +\begin{lstlisting}
> +/* class values that are transport, device and vendor independent */
> +#define VIRTIO_ADMIN_COMMON_CLASS_START    0
> +#define VIRTIO_ADMIN_COMMON_CLASS_END      63
> +
> +/* class values that are transport specific */
> +#define VIRTIO_ADMIN_TRANSPORT_CLASS_START  64
> +#define VIRTIO_ADMIN_TRANSPORT_CLASS_END    127
> +
> +/* class values that are device specific */
> +#define VIRTIO_ADMIN_DEVICE_CLASS_START     128
> +#define VIRTIO_ADMIN_DEVICE_CLASS_END       191
> +
> +/* class values that are vendor specific */
> +#define VIRTIO_ADMIN_VENDOR_CLASS_START     192
> +#define VIRTIO_ADMIN_VENDOR_CLASS_END       255

How do vendor commands work? Will they be defined in the spec? If not,
then how can vendors avoid namespace collisions? How does the
availability of vendor commands interact with migration?

Is there a way to enumerate commands or does the driver simply try the
command and handle VIRTIO_ADMIN_STATUS_GENERIC_INVALID_COMMAND in case
the command is unavailable?

Stefan

--4023Nj3Pj7nRTgCn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmD+ycoACgkQnKSrs4Gr
c8jXSAf9EVuC/0WXDBl0eNOhkGo9zthGWdKSttHQNW+dPPM3d1XFLZrt25dTcdaL
ejf/uwLtCCrbwBGfQLHti4GacmrHXB6zljGkQvzzBQcdc1Wh1Fp9wyac2rIU2dr9
ChUUO23i0x2iUVFAgSCq7zu+gjVCpaNAPND4KD304S4fFFFNa4ay5cWv3yptv+ZW
fM/PdGBoriU1e2TzlIjjKHonIX0jQ2Gv19KEfOFPdZQLbcu37emjGL2rtJfJzQbI
Ct8DnZqyDh7tT9OSrdgJe72oah9mqMF6SiqWoyrL3/LZblDkbk/bPKTPiSAqIXBQ
kp5eNGHWDthV4ltLJbafUl80ryLulA==
=B1cr
-----END PGP SIGNATURE-----

--4023Nj3Pj7nRTgCn--

