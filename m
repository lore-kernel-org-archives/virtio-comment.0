Return-Path: <stefanha@redhat.com>
Date: Wed, 4 Aug 2021 09:09:35 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH] Introduce admin virtqueue as a new transport
Message-ID: <YQpLP/NofUOMIsOA@stefanha-x1.localdomain>
References: <20210803032006.48881-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="csEJwpLHigGUskHr"
Content-Disposition: inline
In-Reply-To: <20210803032006.48881-1-jasowang@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com, mgurtovoy@nvidia.com, eperezma@redhat.com, lulu@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


--csEJwpLHigGUskHr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 03, 2021 at 11:20:06AM +0800, Jason Wang wrote:

It might be clearer to call the management device the "parent"
and virtual devices "children". That way the term "virtual" is avoided -
it's already used a lot in the spec :).

> +The VIRTIO_ADMIN_CTRL_CONFIG_SET is used to write data to the device
> +configuration space. As described in struct
> +virtio_admin_ctrl_vdev_config_set, the command-out-data contains the
> +offset since the start of the config space, the size of the data and
> +the data that will be wrote. There's no command-in-data for this

s/wrote/written/

> +command.
> +
> +\devicenormative{Device Specific Configuration}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Device Specific Configuration}
> +
> +The management device MUST fail the device configuration space access
> +if the driver want to access the range which is out of the config

s/want/wants/

s/out of/outside/

> +\subsection{Virtqueue Address}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Virtqueue Address}
> +
> +When the admin virtqueue offers VIRTIO_ADMIN_F_CAP_VDEV, the address of
> +a specific virtqueue could be done through the following command:

s/could be done/is set/

> +\subsection{Virtqueue Status}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Virtqueue Status}
> +
> +When the admin virtqueue offers VIRTIO_F_ADMIN_F_CAP_VDEV, virtqueue
> +status could be set and get through the following command:
> +
> +\begin{lstlisting}
> +#define VIRTIO_ADMIN_CTRL_VQ_ENABLE    10
> + #define VIRTIO_ADMIN_CTRL_VQ_ENABLE_SET       0
> + #define VIRTIO_ADMIN_CTRL_VQ_ENABLE_GET       1
> +
> +struct virtio_admin_ctrl_vq_status_set {
> +  u16 queue_index;
> +  u8 status;
> +};
> +
> +\end{lstlisting}
> +
> +The VIRTIO_ADMIN_CTRL_VQ_ENABLE_SET is used to set the status to a
> +specific virtqueue. The command-out-data is the queue index, the
> +status that is set to the virtqueue (0 disabled, 1 enabled); There's
> +no command-in-data.
> +
> +The VIRTIO_ADMIN_CTRL_VQ_ENABLE_GET is used to get the status of a
> +specific virtqueue. The command-out-data is the u16 of queue
> +index. The command-in-data is the virtqueue status (0 disalbed, 1

s/disalbed/disabled/

> +\subsection{Virtqueue Notification}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Device MMU}
> +
> +When the admin virtqueue offers VIRTIO_ADMIN_F_VDEV, management device

Is the device MMU feature mandatory when VIRTIO_ADMIN_F_VDEV is
supported?

> +offers a device MMU for a secure DMA context for each virtual

"MMU" is not used elsewhere in the VIRTIO specification so it's an
undefined term. Should this paragraph mention VIRTIO_F_ACCESS_PLATFORM
in order to explain how the Device MMU affects the virtual device?

> +device. The device MMU will translate I/O Virtual Address to transport

s/Address/Addresses/

> +specific DMA address before using a transport specific way for DMA:

s/address/addresses/

> +
> +\begin{lstlisting}
> +#define VIRTIO_ADMIN_VQ_CTRL_MMU    13
> + #define VIRTIO_ADMIN_VQ_CTRL_MMU_ENABLE       1
> + #define VIRTIO_ADMIN_VQ_CTRL_MMU_ASID_SET     2
> + #define VIRTIO_ADMIN_VQ_CTRL_MMU_MAP          3
> + #define VIRTIO_ADMIN_VQ_CTRL_MMU_UNMAP        4
> + #define VIRTIO_ADMIN_VQ_CTRL_MMU_ERR_GET      5
> +
> +struct virtio_admin_ctrl_vdev_mmu_asid_set {
> +  le16 queue_index;
> +  le64 asid;
> +};
> +
> +struct virtio_admin_ctrl_vdev_mmu_map {
> +  le64 iova_start;
> +  le64 iova_end;
> +  le64 dma_start;
> +  le32 flags;
> +};
> +
> +/* Read access is allowed */
> +#define VIRTIO_ADMIN_VQ_MAP_F_READ   (1 << 0)
> +/* Write access is allowed */
> +#define VIRTIO_IOMMU_VQ_MAP_F_WRITE  (1 << 1)
> +
> +struct virtio_admin_ctrl_vdev_mmu_err {
> +  le32 reason;
> +  le16 queue_index;
> +  le64 asid;
> +  le64 iova_start;
> +  le64 iova_end;
> +  le32 flags;
> +};
> +
> +/* Mapping does not exist */
> +#define VIRTIO_ADMIN_VQ_MAP_ERR_NON_EXIST (1 << 0)
> +/* Access violates the permission */
> +#define VIRTIO_ADMIN_VQ_MAP_ERR_ACC_VIOLATION (1 << 1)
> +
> +\end{lstlisting}
> +
> +The VIRTIO_ADMIN_VQ_CTRL_MMU_ENABLE is used to enable or disable
> +device MMU for a specific virtual device. The command-out-data is a u8

s/device MMU/the device MMU/

> +for telling whether device MMU is enabled for the virtual device: 0
> +means to enable and 1 means to disable.
> +
> +The VIRTIO_ADMIN_VQ_CTRL_MMU_ASID_SET is used to assign a device
> +address space id to a virtqueue. The command-out-data is the queue
> +index (\field{queue_index}) and the address space ID (\field{asid})
> +assigned to it (as described in struct virtio_admin_ctrl_vdev_mmu_asid_set).
> +
> +The VIRTIO_ADMIN_VQ_CTRL_MMU_MAP is used to map the I/O Virtual
> +Address range [\field{iova_start}, \field{iova_end}] to transport
> +specific DMA address range [\field{dma_start}, \field{dma_start} +
> + \field{iova_end} - \field{iova_start} + 1]. \field{flags} is used to
> +specify the device access permission.
> +
> +The VIRTIO_ADMIN_VQ_CTRL_MMU_UNMAP is used to unmap all the mapped I/O
> +Virtual Address ranges that are intersected with the range
> +[\field{iova_start}, \field{iova_end}].
> +
> +There's no command-in-data for all the above four commands.
> +
> +The VIRTIO_ADMIN_VQ_CTRL_MMU_ERR_GET is used to get the error
> +information of the device MMU. There's no command-out-data, the
> +command-in-date is the queue index and its asid, the iova range and
> +the access of the operation (as described in struct
> +virtio_admin_ctrl_vdev_mmu_err).
> +
> +\devicenormative{Virtqueue Status}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Device MMU}

Does the virtual device need to support running with the device MMU
disabled?

> +
> +The management device MUST fail the device MMU command if \field{device_id} is
> +zero.
> +
> +The management device MUST fail the VIRTIO_ADMIN_VQ_CTRL_MMU_MAP
> +command if the iova range is intersected with a existing range.
> +
> +The management device MUST set both DEVICE_NEEDS_RESET and
> +DEVICE_MMU_FAIL when the device MMU fails to do the translation for a
> +virtual device.
> +
> +The device MMU for the virtual device MUST be disabled upon its reset.
> +
> +Upon reset, the virtual device must reset the Address Space ID for
> +each virtqueue to 0.
> +
> +\drivernormative{Virtqueue Status}\label{sec:Virtio Transport Options
> +  / Virtio Over Admin Virtqueue / Device MMU}
> +
> +The driver MAY choose to disable the device MMU but it MUST make sure
> +the transport specific method could be used to provide a secure DMA
> +context for each virtual device.

What does this mean?

During which stages of the virtual device's lifecycle (ACKNOWLEDGE,
DRIVER, FEATURES_OK, DRIVER_OK) may the management driver enable/disable
the device MMU?

> +
> +The driver MAY query the error of device MMU after DEVICE_MMU_FAIL is set.
> +
> +\subsection{Presenting Virtual Device}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Presenting Virtual Device}
> +
> +If VIRTIO_ADMIN_F_VDEV is offered by the device. The presenting of
> +the virtual device requires co-operation between the management
> +driver and the admin virtqueue. This means, from the view of the
> +virtual device driver, the transport is done via the communication
> +with the management device driver. It's up to the software to decide
> +what kind of method that is needed be used for those communications.

I think what this is saying is that the management device's admin
virtqueue is the VIRTIO Transport for the virtual device. In practice
the VMM will emulate another VIRTIO Transport like virtio-pci for the
virtual device and then forward operations to the management device's
admin virtqueue?

> +The management driver typically do the following steps for creating a

s/do/takes/

> +virtual device:
> +
> +\begin{enumerate}
> +\item Determine the virtio id and device specific configuration.
> +\item Create the virtual devices using VIRTIO_ADMIN_CTRL_VDEV_CREATE

s/VIRTIO_ADMIN_CTRL_VDEV_CREATE/the VIRTIO_ADMIN_CTRL_VDEV_CREATE/

> +command.
> +\item Optionally, configure the MSI.
> +\item Optionally, enable and initialize the device MMU.
> +\item Setup the necessary communication methods with virtual device driver.
> +\item Perform device specific setups.

s/setups/setup/

I tried to imagine what the virtio-blk vdev creation parameters need to
look like. Here is what I came up with:

  Virtual Device Creation Parameters for Block Devices
  ----------------------------------------------------
  The following creation parameters specify the details of a new virtual
  block device:

  Field        Type   Meaning
  ----------------------------------------------------------------------
  blkdev_id    u64    Identifier of the underlying block device that
                      provides storage. The enumeration and creation of
                      underlying block devices is
                      implementation-specific.
  num_queues   u16    Number of request virtqueues.
  features_len u8     Number of elements in features[].
  features[]   u32    Device feature bits to report.

  Creation error codes are as follows:

  Error               Meaning
  ----------------------------------------------------------------------
  INVALID_BLKDEV_ID   The underlying block device does not exist.
  BLKDEV_BUSY         The underlying block device is already in use.
  BLKDEV_READ_ONLY    The underlying block device is read-only.
  INVALID_NUM_QUEUES  The number of request queues was 0 or too large.
  UNSUPPORTED_FEATURE A feature bit was given that the device does not
                      support.

  If the VIRTIO_BLK_F_RO bit is set in features[] then the underlying
  block device is made available for read-only access.

  Creation MAY fail with BLKDEV_BUSY if a blkdev_id value that is
  already in use is given.

  Creation MAY fail with BLKDEV_READ_ONLY if the underlying block device
  does not support writes and the VIRTIO_BLK_F_RO bit is not set in
  features[].

  The configuration space parameters (see 5.2.4 Device configuration
  layout) are determined by the device based on the underlying block
  device capacity, block size, etc.

Note that this doesn't allow overriding configuration space parameters
(e.g. block size). We probably need to support that in the future for
live migration compatibility.

Stefan

--csEJwpLHigGUskHr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEKSz8ACgkQnKSrs4Gr
c8h2sQgAj0z97U4v0lDRedBN/N7KOca9zg+hAOz/z1mUQCW1Ecc8x3KpPWMXM2mx
qJTRFr4PHmOg+rmYH500h4r9bZg8gf7xXpVHOjMxvmU0dZYTsFSK41pR4ghch+0K
bKBZBSUfmHuGMdIA9iSjhFjOb8ueK1MVU4sWOofG8tQOy4ReGzpb8KV2Hy/JOoaT
k8a6fE4BHwUp248gBSXucObw7uEiq+3IWxE6Pb9+V3tXrKyJX6Luj+CKMOrn2E3m
iCwx2CsotBKFBedzmbCQE5hje0QR4uUs+xInVARdp8OCa5JLmZAp5/8Khd7ZsBWR
kapAmmWcNrgM8Xtk0iRkFtanOqZqwg==
=H1N9
-----END PGP SIGNATURE-----

--csEJwpLHigGUskHr--

