Return-Path: <stefanha@redhat.com>
Date: Tue, 3 Aug 2021 15:51:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH] Introduce admin virtqueue as a new transport
Message-ID: <YQlX4XCJ+dVA/zFR@stefanha-x1.localdomain>
References: <20210803032006.48881-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i5MJ/859gPcAual4"
Content-Disposition: inline
In-Reply-To: <20210803032006.48881-1-jasowang@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com, mgurtovoy@nvidia.com, eperezma@redhat.com, lulu@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


--i5MJ/859gPcAual4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 03, 2021 at 11:20:06AM +0800, Jason Wang wrote:
> This patch introduces a new transport - the admin virtqueue. This
> transport is useful for implementing virtual devices with a limited
> transport specific resources or presenting the virtual device in a
> transport independent way.
>=20
> This means, all the basic device facilities are provided solely via
> the the admin virtqueue. Additionally, the admin virtqueue is also in
> charge of the creating and destroying of the virtual device.
>=20
> To be self-contained and not depend on the platform specific
> feature. Device MMU is also introduced for providing the DMA isolation
> among virtual devices.
>=20
> With the help of the admin virtqueue, the presenting of the virtual
> device is done via the co-operation between the management device and
> its driver.
>=20
> This is just a draft for demonstrating the basic ideas. Some possible
> enhancements:
>=20
> - admin event virtqueue for reporting events like interrupts (on the
>   platform withouth MSI) and MMU translation failure
> - hardware friendly MMU translation table (e.g in the memory instead
>   of using control virtqueue commands)
> - command to kick the virtqueue
>=20
> Comments are more than welcomed.
>=20
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  content.tex | 639 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 639 insertions(+)
>=20
> diff --git a/content.tex b/content.tex
> index 620c0e2..1f66d42 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -47,6 +47,9 @@ \section{\field{Device Status} Field}\label{sec:Basic F=
acilities of a Virtio Dev
>  \item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>    drive the device.
> =20
> +\item[DEVICE_MMU_FAIL (32)] Indicates that the device MMU has
> +  experienced an error from which it can't recover.

Will DEVICE_NEEDS_RESET be set together with this bit? The description
suggests that the device operation cannot proceed, so I guess a reset is
required.

> +
>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>    an error from which it can't recover.
>  \end{description}
> @@ -515,6 +518,642 @@ \chapter{Virtio Transport Options}\label{sec:Virtio=
 Transport Options}
>  Virtio can use various different buses, thus the standard is split
>  into virtio general and bus-specific sections.
> =20
> +\section{Virtio Over Admin Virtqueue}\label{sec:Virtio Transport Options=
 / Virtio Over Admin Virtqueue}
> +
> +Sometimes it's hard to implement the device in a transport specific
> +method. One example is that a physical device may try to present
> +multiple virtual devices with a limited transport specific
> +resources. Another example is to implement virtual devices which is

s/which is/which are/

> +transport independent. In those cases, the admin virtqueue provided by
> +the management device could be used to replace the transport specific

"management device" is being defined here but the sentence reads as if
referring to a previously-defined term ("the management device").

I suggest saying "a so-called management device" instead or defining it
more formally ("A management device is a device that acts as a container
for virtual devices. Virtual devices are controlled via the management
device's admin virtqueue." ... plus maybe something about whether
virtual devices are static or can be created/deleted dynamically).

> +method to implement the virtual device. Then the presenting of the
> +virtual device is done through the cooperation between the admin
> +virtqueue and the driver.

"the driver" =3D=3D the management device's driver? (There is also the
virtual device's driver, so it can be confusing.)

> +
> +\subsection{Basic Concepts}\label{sec:Virtio Transport Options / Virtio =
over Admin Virtqueue / Basic Concepts}
> +
> +The device that offers the admin virtqueue (via feature
> +VIRTIO_F_ADMIN_VQ) is the management device of the virtual
> +devices. All commands are of the following form:

I wonder if the name "admin" should be replaced by "management" or
"mgmt". That way it's clear that the virtqueue is located on management
devices, not a generic admin virtqueue that non-management devices can
offer.

> +
> +\begin{lstlisting}
> +struct virtio_admin_ctrl {
> +        u64 device_id;
> +        u16 class;
> +        u16 command;
> +        u8 command-out-data[];
> +        u8 ack;
> +        u8 command-in-data[]
> +};
> +
> +/* ack values */
> +#define VIRTIO_ADMIN_OK     0
> +#define VIRTIO_ADMIN_ERR    1
> +\end{lstlisting}
> +
> +The device_id, class, command and command-out-data are set by
> +the driver, and the device sets the ack and command-in-data. 0 is used

More explicit:
s/0/The device_id value 0/

> +for identify the management device itself.
> +
> +\devicenormative{\subsubsection}{Basic Concepts}{Virtio Transport Option=
s / Virtio Over Admin Virtqueue / Basic Concepts}
> +
> +The virtual device MUST not offer VIRTIO_F_ADMIN_VQ feature.

Is there a design reason why this isn't possible?

> +
> +\drivernormative{\subsubsection}{Basic Concepts}{Virtio Transport Option=
s / Virtio Over Admin Virtqueue / Basic Concepts}
> +
> +The driver SHOULD negotiate VIRTIO_F_ADMIN_VQ if the device offers it.
> +
> +\subsection{Virtual Device Discovery}\label{sec:Virtio Transport Options=
 / Virtio Over Admin Virtqueue / Virtual Device Discovery}
> +
> +The management device is discovered through a transport and device
> +specific method. Virtual devices is created and discovered via the

s/devices is created/devices are created/

> +admin virtqueue.
> +
> +\subsection{Admin Virtqueue Capabilities}\label{sec:Virtio Transport Opt=
ions / Virtio Over Admin Virtqueue / Admin Virtqueue Capabilities}
> +
> +The capabilites that are supported by the admin virtqueue could be
> +fetched through the following commands:
> +
> +\begin{lstlisting}
> +#define VIRTIO_ADMIN_CTRL_CAP    0
> + #define VIRTIO_ADMIN_CTRL_CAP_GET        0
> +\end{lstlisting}
> +
> +The VIRTIO_ADMIN_CTRL_CAP_GET is used to get the capabilites that are
> +supported by the admin virtqueue through a u64 which is a bit mask of
> +the capabilies in command-in-data. There's no command-out-data.

I'm not sure what this paragraph is describing. Is VIRTIO_ADMIN_CTRL_CAP
a struct virtio_admin_ctrl::command value?

> +
> +The capabilies that is currently supported are:
> +
> +\begin{lstlisting}
> +#define VIRTIO_ADMIN_F_CAP_VDEV    1
> +\end{lstlisting}
> +
> +The VIRTIO_ADMIN_F_CAP_VDEV capability demonstrates that the virtual
> +devices is created, configured and destroyed through admin

s/devices is created/devices are created/

s/through admin/through the admin/

> +virtqueue. That means the admin virtqueue is the transport for the
> +virtual devices.

At this point 3 terms have been used: admin, management, and vdev. I
think admin is more general than management or vdev, since there is a
vdev capability and other capabilities could be added later? I think
management and vdev mean the same thing?

Does this mean there are effectively two separate concepts:
- Admin virtqueue: a generic mechanism for special commands
- Vdev: the ability for a management device to create, configure, and
  destroy virtual devices
?

Another question: I wonder why there is an admin virtqueue feature bit
instead of a new VIRTIO device ID for the management device? Does this
mean regular virtio-net, virtio-blk, etc devices can have an admin queue
in addition to their normal role?

> +
> +\devicenormative{Admin Virtqueue Capabilities}\label{sec:Virtio Transpor=
t Options / Virtio Over Admin Virtqueue / Admin Virtqueue Capabilities}
> +
> +The management device MUST support VIRTIO_ADMIN_CTRL_CAP class when

Oh, VIRTIO_ADMIN_CTRL_CAP is a class value. That wasn't clear when the
constant value was defined.

> +VIRTIO_F_ADMIN_VQ is offered.
> +
> +The management device MUST fail VIRTIO_ADMIN_CTRL_CAP class when the
> +\field{device_id} is not zero.
> +
> +\drivernormative{Admin Virtqueue Capabilities}\label{sec:Virtio Transpor=
t Options / Virtio Over Admin Virtqueue / Admin Virtqueue Capabilities}
> +
> +The driver MUST use 0 as \field{device_id} for VIRTIO_ADMIN_CTRL_CAP
> +class.
> +
> +\subsection{Device Management}\label{sec:Virtio Transport Options / Virt=
io Over Admin Virtqueue / Device Management}
> +
> +When the admin virtqueue offers VIRTIO_ADMIN_F_CAP_VDEV capibility,

s/offers/offers the/

s/capibility/capability/

> +virtual devices must be created and discovered through the admin
> +virtqueue.

Are management devices with statically pre-allocated virtual devices
supported? The text makes it sound like vdev creation is dynamic and
always performed by the driver.

> +\begin{lstlisting}
> +struct virtio_admin_ctrl_vdev_attribute {
> +       u32 device_id;

This name is easy to confuse with the struct virtio_admin_ctrl's
device_id. They have different meanings. Want to rename struct
virtio_admin_ctrl's field to "vdev_id"?

> +       u8 config[];

This field contains device-specific creation attributes, not the initial
contents of the Device Configuration Space? Other names like args,
params, or attrs are less likely to be confused with the Device
Configuration Space.

> +};
> +
> +#define VIRTIO_ADMIN_CTRL_VDEV    2
> + #define VIRTIO_ADMIN_CTRL_VDEV_CREATE        0
> + #define VIRTIO_ADMIN_CTRL_VDEV_DESTROY        1
> +\end{lstlisting}
> +
> +The VIRTIO_ADMIN_CTRL_VDEV_CREAT command is used to create a virtual

s/CREAT/CREATE/

> +device. The command-out-data for VIRTIO_ADMIN_CTRL_CREATE is the
> +virtio device id (\field{device_id}) and device specific configuration
> +(\field{config}) for creating the virtual device. When succeed, the
> +device returns a u64 as a unique identifier of the created virtual
> +device in command-in-data.

Is there a way to distinguish between different types of errors:
- No more resources to create another virtual device
- Invalid config value
- Unsupported device_id value
?

> +
> +The VIRTIO_ADMIN_CTRL_VDEV_DESTROY command is used to destroy a
> +virtual device which is identified by its 64bit identifier
> +\field{virtual_device_id}. There's no command-in-data for
> +VIRTIO_ADMIN_CTRL_DESTROY command.
> +
> +\devicenormative{Device Management}\label{sec:Virtio Transport Options /=
 Virtio Over Admin Virtqueue / Device Management}
> +
> +The management device MUST fail the VIRTIO_ADMIN_CTRL_VDEV_CREATE if
> +\field{device_id} is not 0.

This is where the naming really gets confusing. This "device_id" is the
struct virtio_admin_ctrl field and not the struct
virtio_admin_ctrl_vdev_attribute "device_id" field. Please rename one of
them.

> +
> +The management device MUST fail the VIRTIO_ADMIN_CTRL_VDEV_DESTROY if
> +\field{device_id} is 0.
> +
> +All virtual devices MUST be created via admin virtqueue if the admin
> +virtqueue offers VIRTIO_F_CTRL_VDEV.

I'm not sure what the purpose of this statement is. Does it imply that
all virtual devices are destroy on device reset?

> +
> +The management device MAY map implement the virtual device in a
> +transport specific way.

I'm not sure what the purpose of this statement is.

> +
> +\drivernormative{Driver Management}\label{sec:Virtio Transport Options /=
 Virtio Over Admin Virtqueue / Device Management}
> +
> +The management driver MUST use 0 as \field{device_id} for
> +VIRTIO_ADMIN_CTRL_VDEV_CREATE command.
> +
> +The management driver SHOULD make sure the virtual device is not used
> +by any driver before trying to destroy it.
> +
> +\subsection{Features Negotiation}\label{sec:Virtio Transport Options / V=
irtio Over Admin Virtqueue / Features Negotiation}
> +
> +When the admin virtqueue offers VIRTIO_ADMIN_F_CAP_VDEV capability,

s/VIRTIO_ADMIN_F_CAP_VDEV capability/the VIRTIO_ADMIN_F_CAP_VDEV capability/

> +the feature negotiation of virtual devices could be done by the
> +following commands:

What does "could" mean? IIUC this mechanism is the only way to negotiate
features because this admin queue *is* the VIRTIO Transport for the
virtual device. Therefore:
s/could be/is/

> +
> +\begin{lstlisting}
> +#define VIRTIO_ADMIN_CTRL_FEAT    3
> + #define VIRTIO_ADMIN_CTRL_FEAT_DEVICE_GET        0
> + #define VIRTIO_ADMIN_CTRL_FEAT_DRIVER_SET        1
> + #define VIRTIO_ADMIN_CTRL_FEAT_DRIVER_GET        2
> +\end{lstlisting}
> +
> +The VIRTIO_ADMIN_CTRL_FEAT_DEVICE_GET is to get the features offered
> +by a virtual device.
> +
> +The VIRTIO_ADMIN_CTRL_FEAT_DRIVER_SET is for driver to accept feature
> +bits offered by the virtual device.
> +
> +The VIRTIO_ADMIN_CTRL_FEAT_DRIVER_GET is to get the features accepted
> +by both the virtual driver and the device.
> +
> +The features is 64 bits mask of the virtio features bit. For
> +VIRTIO_ADMIN_CTRL_DRIVER_SET, the feature is passed to the device
> +through command-out-data. For VIRTIO_ADMIN_CTRL_FEAT_DEVICE_GET and
> +VIRTIO_ADMIN_CTRL_DRIVER_GET the feature is returned for the device
> +through command-in-data.
> +
> +\devicenormative{Features Negotiation}\label{sec:Virtio Transport Option=
s / Virtio Over Admin Virtqueue / Features Negotiation}
> +
> +The management device MUST fail VIRTIO_ADMIN_F_CTRL_FEAT class for the
> +command that use 0 as its \field{virtual_device_id}.

s/virtual_device_id/device_id/ in this version of the document, but I
think virtual_device_id would be clearer :)

> +
> +\drivernormative{Features Negotiation}\label{sec:Virtio Transport Option=
s / Virtio Over Admin Virtqueue / Features Negotiation}
> +
> +The management driver MAY mediate between the feature negotiation
> +request of the virtual devices and the admin virtqueue. E.g when
> +offering features to the virtual device, the management driver MAY
> +exclude some features in order to limit the behaviour of the virtual
> +device.
> +
> +\subsection{Device Status}\label{sec:Virtio Transport Options / Virtio O=
ver Admin Virtqueue / Device Status}
> +
> +When the admin virtqueue offers VIRTIO_ADNIN_F_CAP_VDEV capability,

s/VIRTIO_ADNIN_F_CAP_VDEV/the VIRTIO_ADNIN_F_CAP_VDEV/

s/ADNIN/ADMIN/

> +the status of virtual device could be accessed by the following
> +commands:

s/could be/is/

> +
> +\begin{lstlisting}
> +#define VIRTIO_ADMIN_CTRL_STATUS    4
> + #define VIRTIO_ADMIN_CTRL_STATUS_SET        0
> + #define VIRTIO_ADMIN_CTRL_STATUS_GET        1
> +\end{lstlisting}
> +
> +The VIRTIO_ADMIN_CTRL_STATUS_SET is used to set the device status of
> +the virtual device here. The command-out-data is the one byte status
> +to set to the device. There's no command-in-data for this command.
> +
> +The VIRTIO_ADMIN_CTRL_STATUS_GET is used to get the device status of
> +the virtual device. The command-in-data is the one byte status
> +returned from the device. There's no command-out-data for this
> +command.
> +
> +\devicenormative{Device Status}\label{sec:Virtio Transport Options / Vir=
tio Over Admin Virtqueue / Device Status}
> +
> +The management device MUST start the reset of a virtual device when 0
> +is written via VIRTIO_ADMIN_CTRL_STATUS_SET, the success of this
> +command demonstrate the success of the reset.
> +
> +The management device MUST present 0 through
> +VIRTIO_ADMIN_CTRL_STATUS_GET once the reset is done.
> +
> +The management device MUST fail the device status access if
> +\field{device_id} is zero.
> +
> +\drivernormative{Device Status}\label{sec:Virtio Transport Options / Vir=
tio Over Admin Virtqueue / Device Status}
> +
> +After writing 0 via VIRTIO_ADMIN_CTRL_STATUS_SET, the driver MUST wait
> +for the success of the command before re-initializing the device.
> +
> +\subsection{Device Generation}\label{sec:Virtio Transport Options / Virt=
io Over Admin Virtqueue / Device Genreation}

s/Genreation/Generation/

> +
> +When the admin virtqueue offers VIRTIO_ADMIN_F_CAP_VDEV capability,
> +the device generation could be read from the following commands:
> +
> +\begin{lstlisting}
> +#define VIRTIO_ADMIN_CTRL_GENERATION    5
> + #define VIRTIO_ADMIN_CTRL_GENERATION_GET        0
> +\end{lstlisting}
> +
> +The VIRTIO_ADMIN_CTRL_GENERATION_GET is used to get the device generation
> +of the virtual device. The command-in-data is the u32 device
> +generation returned from the device. There's no command-out-data for
> +this command.

The term "device generation" is undefined. IIUC this is the
"configuration generation field", "config_generation", or "configuration
atomicity value" in the spec. Please use one of those existing terms.

I have run out of time and am pausing the review here for now.

Will drivers sleep or busy wait for admin vq command completion? I guess
it's unavoidable since other transports usually offer synchronous
operations. The driver code may not able to deschedule since it was not
necessary with the other transports.

An interesting by-product of this approach may be that the admin
virtqueue transport can enable inter-VM device emulation. It might be a
natural way to let VM A emulate devices for VM B by letting VM A handle
the admin virtqueue. Basically a variant of the virtio-vhost-user
approach I tried out a few years ago, but now we're using the admin
virtqueue instead of the vhost-user protocol for inter-VM device
emulation.

Stefan

--i5MJ/859gPcAual4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEJV+EACgkQnKSrs4Gr
c8jhVQf+PfRWUrq7paHRwzxt5epsyzN5hWC+zFzlQcII/IG0yke0ZX14HhGFIz/G
GiQhcYbLndquRfvf1CtQopF9J28iOXF6HsmDFyXmbCSjYhfJvZymAsTm5H07w8Sw
sfknvhRbebeMMmAre1iGMs7IfpxX8wqxZiaPIm364Mg4D+zAPixnlr+z+24vhKb6
sVeYUsOo6R6LN6FCwgPketPJ1ZzgDwijRaFUWttKlpPuZAO0C63XQlhQhSsskpiz
2puTbeTVyY6UynvfdX8NARBfS9JAnZfdE2ryRnFrXIjMirvZBgGkiZyLxFLjKPLv
fnJffxtDhoLxFT8Di71sHhpdKdGJkA==
=MaRQ
-----END PGP SIGNATURE-----

--i5MJ/859gPcAual4--

