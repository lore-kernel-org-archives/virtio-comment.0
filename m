Return-Path: <stefanha@redhat.com>
Date: Wed, 28 Jul 2021 09:52:37 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Message-ID: <YQEa1b2QfW05e0iZ@stefanha-x1.localdomain>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <YP/ffFbeJpDJ3sTG@stefanha-x1.localdomain>
 <87im0v4yrj.fsf@redhat.com>
 <3657bbc8-3299-97a5-b45a-04030da35c51@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zqJn+4ijPcX6eCCK"
Content-Disposition: inline
In-Reply-To: <3657bbc8-3299-97a5-b45a-04030da35c51@nvidia.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, mst@redhat.com, jasowang@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


--zqJn+4ijPcX6eCCK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 27, 2021 at 06:29:49PM +0300, Max Gurtovoy wrote:
>=20
> On 7/27/2021 5:28 PM, Cornelia Huck wrote:
> > On Tue, Jul 27 2021, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >=20
> > > On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wrote:
> > > > Admin virtqueues will be used to send administrative commands to
> > > > manipulate various features of the device which would not easily map
> > > > into the configuration space.
> > > >=20
> > > > The same Admin command format will be used for all virtio devices. =
The
> > > > Admin command set will include 4 types of command classes:
> > > > 1. The generic common class
> > > > 2. The transport specific class
> > > > 3. The device specific class
> > > > 4. The vendor specific class
> > > >=20
> > > > The above mechanism will enable adding various features to the virt=
io
> > > > specification, e.g.:
> > > > 1. Format virtio-blk devices in various configurations (512B block =
size,
> > > >     512B + 8B T10-DIF, 4K block size, 4k + 8B T10-DIF, etc..).
> > > > 2. Live migration management.
> > > > 3. Encrypt/Decrypt descriptors.
> > > > 4. Virtualization management.
> > > > 5. Get device error logs.
> > > > 6. Implement advanced vendor/device/transport specific features.
> > > > 7. Run device health test.
> > > > 8. More.
> > > >=20
> > > > As virtio evolves beyond the para-virt/sw-emulated world, it's mand=
atory
> > > > for the specification to become flexible and allow a wider feature =
set.
> > > > The corrent ctrl virtq that is defined for some of the virtio devic=
es is
> > > > device specific and wasn't designed to be a generic virtq for
> > > > admininistration.
> > > >=20
> > > > Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> > > > ---
> > > >   admin-virtq.tex | 241 +++++++++++++++++++++++++++++++++++++++++++=
+++++
> > > >   content.tex     |   4 +
> > > >   2 files changed, 245 insertions(+)
> > > >   create mode 100644 admin-virtq.tex
> > > >=20
> > > > diff --git a/admin-virtq.tex b/admin-virtq.tex
> > > > new file mode 100644
> > > > index 0000000..ccec2ca
> > > > --- /dev/null
> > > > +++ b/admin-virtq.tex
> > > > @@ -0,0 +1,241 @@
> > > > +\section{Admin Virtqueues}\label{sec:Basic Facilities of a Virtio =
Device / Admin Virtqueues}
> > > > +
> > > > +Admin virtqueues are used to send administrative commands to manip=
ulate
> > > > +various features of the device which would not easily map into the
> > > > +configuration space.
> > > > +
> > > > +Use of Admin virtqueues is negotiated by the VIRTIO_F_ADMIN_VQ
> > > > +feature bit.
> > > > +
> > > > +Admin virtqueue index may vary among different device types.
> > > > +
> > > > +All commands are of the following form:
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_admin_cmd {
> > > > +        /* Device-readable part */
> > > > +        u8 class;
> > > > +        u8 command;
> > > > +        u8 command-specific-data[];
> > > > +
> > > > +        /* Device-writable part */
> > > > +        u8 command-specific-result[];
> > > > +        u8 status_type : 4;
> > > > +        u8 reserved : 4;
> > > > +        u8 status;
> > > > +};
> > > > +
> > > > +/* Status type values */
> > > > +#define VIRTIO_ADMIN_STATUS_TYPE_GENERIC               0
> > > > +#define VIRTIO_ADMIN_STATUS_TYPE_CLASS_SPECIFIC        1
> > > > +#define VIRTIO_ADMIN_STATUS_TYPE_COMMAND_SPECIFIC      2
> > > > +#define VIRTIO_ADMIN_STATUS_TYPE_TRANSPORT_SPECIFIC    3
> > > > +#define VIRTIO_ADMIN_STATUS_TYPE_DEVICE_SPECIFIC       4
> > > > +#define VIRTIO_ADMIN_STATUS_TYPE_VENDOR_SPECIFIC       5
> > > > +
> > > > +/* Generic status values */
> > > > +#define VIRTIO_ADMIN_STATUS_GENERIC_OK                     0
> > > > +#define VIRTIO_ADMIN_STATUS_GENERIC_ERR                    1
> > > > +#define VIRTIO_ADMIN_STATUS_GENERIC_INVALID_CLASS          2
> > > > +#define VIRTIO_ADMIN_STATUS_GENERIC_INVALID_COMMAND        3
> > > > +#define VIRTIO_ADMIN_STATUS_GENERIC_DATA_TRANSFER_ERR      4
> > > > +#define VIRTIO_ADMIN_STATUS_GENERIC_DEVICE_INTERNAL_ERR    5
> > > > +\end{lstlisting}
> > This is very complex, and it feels like we're overengineering this.
>=20
> Do you mean the status type and the status ?
>=20
> >=20
> > > > +
> > > > +The \field{class}, \field{command} and \field{command-specific-dat=
a} are
> > > > +set by the driver, and the device sets the \field{status_type}, the
> > > > +\field{status} and  the \field{command-specific-result}, if needed.
> > > > +
> > > > +The virtio Admin command class codes are divided in the following =
form:
> > > > +
> > > > +\begin{lstlisting}
> > > > +/* class values that are transport, device and vendor independent =
*/
> > > > +#define VIRTIO_ADMIN_COMMON_CLASS_START    0
> > > > +#define VIRTIO_ADMIN_COMMON_CLASS_END      63
> > > > +
> > > > +/* class values that are transport specific */
> > > > +#define VIRTIO_ADMIN_TRANSPORT_CLASS_START  64
> > > > +#define VIRTIO_ADMIN_TRANSPORT_CLASS_END    127
> > > > +
> > > > +/* class values that are device specific */
> > > > +#define VIRTIO_ADMIN_DEVICE_CLASS_START     128
> > > > +#define VIRTIO_ADMIN_DEVICE_CLASS_END       191
> > > > +
> > > > +/* class values that are vendor specific */
> > > > +#define VIRTIO_ADMIN_VENDOR_CLASS_START     192
> > > > +#define VIRTIO_ADMIN_VENDOR_CLASS_END       255
> > > > +\end{lstlisting}
> > > > +
> > > > +\subsection{Admin command set}\label{sec:Basic Facilities of a Vir=
tio Device / Admin Virtqueues / Admin command set}
> > > > +
> > > > +Each virtio device that advertise VIRTIO_F_ADMIN_VQ feature, MUST
> > > "advertises the VIRTIO_F_ADMIN_VQ feature"
> > >=20
> > > > +support all the mandatory admin commands. A device MAY support also
> > > > +one or more optional admin commands.
> > > > +
> > > > +\subsubsection{Common command set}\label{sec:Basic Facilities of a=
 Virtio Device / Admin Virtqueues / Admin command set / Common command set}
> > > > +
> > > > +The Common command set is a group of classes and commands within e=
ach
> > > > +of these classes which are transport, device and vendor independen=
t.
> > > > +A mandatory class is a class that has at least one mandatory comma=
nd.
> > > > +The Common command set is summarized in following table:
> > > > +
> > > > +\begin{tabular}{|l|l|l|}
> > > > +\hline
> > > > +Class  & Description    & M/O \\
> > > > +\hline \hline
> > > > +0  & VIRTIO_ADMIN_DISCOVER_DEVICE    & M \\
> > > > +\hline
> > > > +1  & VIRTIO_ADMIN_DISCOVER_DEVICE_CLASS_COMMANDS    & M \\
> > > > +\hline
> > > > +2-63  & reserved    & - \\
> > > > +\hline
> > > > +\end{tabular}
> > > > +
> > > > +\paragraph{Discover device class}\label{sec:Basic Facilities of a =
Virtio Device / Admin Virtqueues / Admin command set / Common command set /=
 Discover device class}
> > > > +
> > > > +This class (opcode: 0) of commands is used to query generic device
> > > > +information. The following table describes the commands supported =
for
> > > > +this class:
> > > > +
> > > > +\begin{tabular}{|l|l|l|}
> > > > +\hline
> > > > +Command  & Description    & M/O \\
> > > > +\hline \hline
> > > > +0  & VIRTIO_ADMIN_DISCOVER_DEVICE_IDENTITY    & M \\
> > > > +\hline
> > > > +1  & VIRTIO_ADMIN_DISCOVER_DEVICE_SUPPORTED_CLASSES    & M \\
> > > > +\hline
> > > > +2-255  & reserved    & - \\
> > > > +\hline
> > > > +\end{tabular}
> > > > +
> > > > +\subparagraph{Device identity command}\label{sec:Basic Facilities =
of a Virtio Device / Admin Virtqueues / Admin command set / Common command =
set / Discover device class / Device identity command}
> > > > +
> > > > +This mandatory command should return device identity in the follow=
ing
> > > > +structure:
> > > > +
> > > > +\begin{tabular}{|l|l|l|}
> > > > +\hline
> > > > +Bytes  & Description    & M/O \\
> > > > +\hline \hline
> > > > +03:00  & VIRTIO DEVICE ID    & M \\
> > > > +\hline
> > > > +05:04  & VIRTIO TRANSPORT ID    & M \\
> > > These fields are not defined. I wonder why they are necessary - the
> > > driver should already have this information.
> > Agreed.
>=20
> These are initial fields.
>=20
> We can add also model, serial_number and more in the future.
>=20
>=20
> >=20
> > > In general, I'm a little concerned that this whole infrastructure will
> > > increase the complexity of VIRTIO significantly with little benefit. I
> > > do think an admin virtqueue makes sense, e.g. for migration, but would
> > > prefer it if we focus on actual commands first instead of
> > > infrastructure. That way it will be clear what infrastructure is need=
ed.
>=20
> admin virtq is not only for migration.
>=20
> You'll be able to configure virtio device properties using user space too=
ls
> like: virtio-cli.
>=20
> For example: format a block device, manage virtual function resources usi=
ng
> its PF, query for error logs, device health and more.

That sounds good.

> In the SW world maybe all the above were redundant, but now that you have
> more and more HW virtio devices the protocol should be more flexible and
> adjust.

HW is not special in this regard, I think this will be useful for
software too. In-band admin commands are necessary for nested
virtualization, for example. They also provide a standard admin
interface for out-of-process devices (vhost-user, etc).

> Few weeks ago I've sent a concrete commands for live migration but then I
> was told that new infrastructure (admin virtq) should be developed and th=
is
> is what I did in this RFC.
>=20
> if you combine the 2 RFCs you can imagine what is needed here for adding
> Live migration support.
>=20
> But I want to add it step by step.
>=20
> We need to agree on the infrastructure.
>=20
> > A concrete example would be good, but I think we can come up with a
> > bare-bones spec to start with.
> >=20
> > - feature bit for the admin vq, as defined here
> > - location of the admin vq is device specific
> > - I think we can get away with two classes, as for feature bits (not
> >    device specificic and device specific); I don't think we need separa=
te
> >    classes for transport or vendor specific
>=20
> We need it for live migration probably. It will be a transport class.
>=20
> Vendor specific is also important to allow vendors develop their special
> souse.
>=20
> > - make the format for the request simple (command + length + payload?)
>=20
> I used almost the same format as virtio net ctrl queue.

The virtio_net_ctrl packet format looks good to me, it's close to what
Cornelia's command + length + payload suggestion:

  struct virtio_net_ctrl {
          u8 class;
          u8 command;
          u8 command-specific-data[];
          u8 ack;
  };
 =20
  /* ack values */
  #define VIRTIO_NET_OK     0
  #define VIRTIO_NET_ERR    1

I'm not sure how vendor commands will be allocated though. Will each
vendor get a unique class id to prevent collisions? If we want to
support cross-implementation migration then it may be necessary to allow
vendor command availability to change while the device is running.

I prefer the simpler struct virtio_net_ctrl format to the more
complicated one proposed in this patch series.

>=20
> >=20
> > How many different (groups of) commands can we reasonably expect? Do we
> > need a generic discovery command, or can we get away with a feature bit
> > covering each new group of commands?
>=20
> I can't predict the future but IMO we need a discovery command.
>=20
> We have many devices and more can be added in the future.

A <u8 class, u8 command> space is 65536 bits or 8KB. I think admin
commands would not be included in VIRTIO Feature Bits but instead
reported via a separate admin command that returns up to 8KB of data:

  struct virtio_admin_report_cmds {
      /* Bitmap of available admin commands [Device->Driver]
       * bool command_present =3D
       *        command_bits[class * 32 + command / 8] & (command % 8);
       */
      u8 command_bits[8192];
  };

Stefan

--zqJn+4ijPcX6eCCK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEBGtUACgkQnKSrs4Gr
c8iARwgAjNR0GmFU2Kvpub0Kz5URxXCq7kuiyNXHzaLJOp1G//NkPeBHSDXHKkPz
vyjYxKEJeq6ruwFu962KUZDtuzahutsv1UdcJjAkzsdeLa8I8KYRryXoWGaaEhy6
hwhfctd1LGK8x/CHi8s3t1hL9cJQhSrN7it+fdmPFsIiFRf1w1WFXZRF66BeesV5
SuavKBQvMTqE2gsSZFMTnSLgTzmESkdFS4oDjitaLuYBjy3NgM+9RPyEFxB2uiIO
d0OoGX5/SiIoQO6Uoe5DwmReaJlmZ2iwoLLf5/GKsOTY/uaVEOfzsoGvWDtW9ZXp
hWHy8M0JMnBa4r9ZKXmq5nqoq03yAQ==
=D+K9
-----END PGP SIGNATURE-----

--zqJn+4ijPcX6eCCK--

