Return-Path: <mst@redhat.com>
Date: Wed, 4 Aug 2021 09:36:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH] Introduce admin virtqueue as a new transport
Message-ID: <20210804091916-mutt-send-email-mst@kernel.org>
References: <20210803032006.48881-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210803032006.48881-1-jasowang@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, cohuck@redhat.com, stefanha@redhat.com, mgurtovoy@nvidia.com, eperezma@redhat.com, lulu@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Aug 03, 2021 at 11:20:06AM +0800, Jason Wang wrote:
> This patch introduces a new transport - the admin virtqueue. This
> transport is useful for implementing virtual devices with a limited
> transport specific resources or presenting the virtual device in a
> transport independent way.
> 
> This means, all the basic device facilities are provided solely via
> the the admin virtqueue. Additionally, the admin virtqueue is also in
> charge of the creating and destroying of the virtual device.
> 
> To be self-contained and not depend on the platform specific
> feature. Device MMU is also introduced for providing the DMA isolation
> among virtual devices.
> 
> With the help of the admin virtqueue, the presenting of the virtual
> device is done via the co-operation between the management device and
> its driver.
> 
> This is just a draft for demonstrating the basic ideas. Some possible
> enhancements:
> 
> - admin event virtqueue for reporting events like interrupts (on the
>   platform withouth MSI) and MMU translation failure
> - hardware friendly MMU translation table (e.g in the memory instead
>   of using control virtqueue commands)
> - command to kick the virtqueue
> 
> Comments are more than welcomed.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  content.tex | 639 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 639 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index 620c0e2..1f66d42 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -47,6 +47,9 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>  \item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>    drive the device.
>  
> +\item[DEVICE_MMU_FAIL (32)] Indicates that the device MMU has
> +  experienced an error from which it can't recover.
> +
>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>    an error from which it can't recover.
>  \end{description}
> @@ -515,6 +518,642 @@ \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>  Virtio can use various different buses, thus the standard is split
>  into virtio general and bus-specific sections.
>  
> +\section{Virtio Over Admin Virtqueue}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue}
> +
> +Sometimes it's hard to implement the device in a transport specific
> +method. One example is that a physical device may try to present
> +multiple virtual devices with a limited transport specific
> +resources. Another example is to implement virtual devices which is
> +transport independent. In those cases, the admin virtqueue provided by
> +the management device could be used to replace the transport specific
> +method to implement the virtual device.

terminology here needs clarification. Especially talking about
virtual devices is confusing. I propose management device and
managed device. Other options exist. Also pls give examples
such as PF/VF.


> Then the presenting of the
> +virtual device is done through the cooperation between the admin
> +virtqueue and the driver.

A natural question to ask is why is this a VQ and not a device?
Is this because people want to implement a VQ as part
of an arbitrary device?



> +\subsection{Basic Concepts}\label{sec:Virtio Transport Options / Virtio over Admin Virtqueue / Basic Concepts}
> +
> +The device that offers the admin virtqueue (via feature
> +VIRTIO_F_ADMIN_VQ) is the management device of the virtual
> +devices.

Don't we need a way to specify how many such VQs are there and what
their numbers are? Doing this in a device specific way seems a bit
annoying ...



> All commands are of the following form:
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
> +for identify the management device itself.
> +
> +\devicenormative{\subsubsection}{Basic Concepts}{Virtio Transport Options / Virtio Over Admin Virtqueue / Basic Concepts}
> +
> +The virtual device MUST not offer VIRTIO_F_ADMIN_VQ feature.
> +
> +\drivernormative{\subsubsection}{Basic Concepts}{Virtio Transport Options / Virtio Over Admin Virtqueue / Basic Concepts}
> +
> +The driver SHOULD negotiate VIRTIO_F_ADMIN_VQ if the device offers it.
> +
> +\subsection{Virtual Device Discovery}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Virtual Device Discovery}
> +
> +The management device is discovered through a transport and device
> +specific method. Virtual devices is created and discovered via the
> +admin virtqueue.
> +
> +\subsection{Admin Virtqueue Capabilities}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Admin Virtqueue Capabilities}
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
> +
> +The capabilies that is currently supported are:
> +
> +\begin{lstlisting}
> +#define VIRTIO_ADMIN_F_CAP_VDEV    1
> +\end{lstlisting}
> +
> +The VIRTIO_ADMIN_F_CAP_VDEV capability demonstrates that the virtual
> +devices is created, configured and destroyed through admin
> +virtqueue. That means the admin virtqueue is the transport for the
> +virtual devices.

How about using a feature bit for this? Or having this in the config space.
This might call for a generic config space feature, but it's not
the first time we want that, maybe it's time.


> +\devicenormative{Admin Virtqueue Capabilities}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Admin Virtqueue Capabilities}
> +
> +The management device MUST support VIRTIO_ADMIN_CTRL_CAP class when
> +VIRTIO_F_ADMIN_VQ is offered.
> +
> +The management device MUST fail VIRTIO_ADMIN_CTRL_CAP class when the
> +\field{device_id} is not zero.
> +
> +\drivernormative{Admin Virtqueue Capabilities}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Admin Virtqueue Capabilities}
> +
> +The driver MUST use 0 as \field{device_id} for VIRTIO_ADMIN_CTRL_CAP
> +class.
> +
> +\subsection{Device Management}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Device Management}
> +
> +When the admin virtqueue offers VIRTIO_ADMIN_F_CAP_VDEV capibility,
> +virtual devices must be created and discovered through the admin
> +virtqueue.
> +
> +\begin{lstlisting}
> +struct virtio_admin_ctrl_vdev_attribute {
> +       u32 device_id;
> +       u8 config[];
> +};
> +
> +#define VIRTIO_ADMIN_CTRL_VDEV    2
> + #define VIRTIO_ADMIN_CTRL_VDEV_CREATE        0
> + #define VIRTIO_ADMIN_CTRL_VDEV_DESTROY        1
> +\end{lstlisting}
> +
> +The VIRTIO_ADMIN_CTRL_VDEV_CREAT command is used to create a virtual
> +device. The command-out-data for VIRTIO_ADMIN_CTRL_CREATE is the
> +virtio device id (\field{device_id}) and device specific configuration
> +(\field{config}) for creating the virtual device. When succeed, the
> +device returns a u64 as a unique identifier of the created virtual
> +device in command-in-data.

So how are we going to specify config? Per device type?


> +The VIRTIO_ADMIN_CTRL_VDEV_DESTROY command is used to destroy a
> +virtual device which is identified by its 64bit identifier
> +\field{virtual_device_id}. There's no command-in-data for
> +VIRTIO_ADMIN_CTRL_DESTROY command.

So I am confused here. Rest of the spec seems to map driver
actions to commands on the admin VQ. However where do the create and
destroy commands coming from? If they have a separate source
from driver commands, why do they share the same VQ?


> +\devicenormative{Device Management}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Device Management}
> +
> +The management device MUST fail the VIRTIO_ADMIN_CTRL_VDEV_CREATE if
> +\field{device_id} is not 0.
> +
> +The management device MUST fail the VIRTIO_ADMIN_CTRL_VDEV_DESTROY if
> +\field{device_id} is 0.
> +
> +All virtual devices MUST be created via admin virtqueue if the admin
> +virtqueue offers VIRTIO_F_CTRL_VDEV.
> +
> +The management device MAY map implement the virtual device in a
> +transport specific way.


I'm not sure what does this mean.

> +\drivernormative{Driver Management}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Device Management}
> +
> +The management driver MUST use 0 as \field{device_id} for
> +VIRTIO_ADMIN_CTRL_VDEV_CREATE command.
> +
> +The management driver SHOULD make sure the virtual device is not used
> +by any driver before trying to destroy it.

Device drivers are within guests. Not sure how this can be
accomplished.

> +
> +\subsection{Features Negotiation}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Features Negotiation}
> +
> +When the admin virtqueue offers VIRTIO_ADMIN_F_CAP_VDEV capability,
> +the feature negotiation of virtual devices could be done by the
> +following commands:
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

So there's a lot of text here to basically pass config read/writes
over a VQ. How about specifying admin VQ in terms of e.g. virtio PCI
transport? Thus basically supply read/write commands and that's it?


> +The features is 64 bits mask of the virtio features bit. For
> +VIRTIO_ADMIN_CTRL_DRIVER_SET, the feature is passed to the device
> +through command-out-data. For VIRTIO_ADMIN_CTRL_FEAT_DEVICE_GET and
> +VIRTIO_ADMIN_CTRL_DRIVER_GET the feature is returned for the device
> +through command-in-data.
> +
> +\devicenormative{Features Negotiation}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Features Negotiation}
> +
> +The management device MUST fail VIRTIO_ADMIN_F_CTRL_FEAT class for the
> +command that use 0 as its \field{virtual_device_id}.
> +
> +\drivernormative{Features Negotiation}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Features Negotiation}
> +
> +The management driver MAY mediate between the feature negotiation
> +request of the virtual devices and the admin virtqueue. E.g when
> +offering features to the virtual device, the management driver MAY
> +exclude some features in order to limit the behaviour of the virtual
> +device.
> +
> +\subsection{Device Status}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Device Status}
> +
> +When the admin virtqueue offers VIRTIO_ADNIN_F_CAP_VDEV capability,
> +the status of virtual device could be accessed by the following
> +commands:
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
> +\devicenormative{Device Status}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Device Status}
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
> +\drivernormative{Device Status}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Device Status}
> +
> +After writing 0 via VIRTIO_ADMIN_CTRL_STATUS_SET, the driver MUST wait
> +for the success of the command before re-initializing the device.
> +
> +\subsection{Device Generation}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Device Genreation}
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
> +
> +\devicenormative{Device Generation}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Device Generation}
> +
> +The device MUST present a changed config_generation after the driver
> +has read a device-specific configuration value which has changed since
> +any part of the device-specific configuration was last read.
> +
> +The device MUST fail the device generation access if \field{device_id} is zero.
> +
> +\subsection{Device Specific Configuration}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Device Specific Configuration}
> +
> +When the admin virtqueue offers VIRTIO_ADMIN_F_CAP_VDEV, the
> +config space of a virtual device could be accessed from
> +VIRTIO_ADMIN_CTRL_CONFIG_GET and VIRTIO_ADMIN_CTRL_CONFIG_SET.
> +
> +\begin{lstlisting}
> +#define VIRTIO_ADMIN_CTRL_CONFIG    6
> +  #define VIRTIO_ADMIN_CTRL_CONFIG_GET        0
> +  #define VIRTIO_ADMIN_CTRL_CONFIG_SET        1
> +
> +struct virtio_admin_ctrl_vdev_config_get {
> +       u32 offset;
> +       u32 size;
> +};
> +
> +struct virtio_admin_ctrl_vdev_config_set {
> +       u32 offset;
> +       u32 size;
> +       u8  data[];
> +};
> +\end{lstlisting}
> +
> +The VIRTIO_ADMIN_CTRL_CONFIG_GET is used to read data from the
> +device configuration space. As described in struct
> +virtio_admin_ctrl_vdev_config_get, The command-out-data is the offset
> +since the start of the config space and the size of the data. The
> +command-in-data is the array of u8 data that read from the config
> +space.
> +
> +The VIRTIO_ADMIN_CTRL_CONFIG_SET is used to write data to the device
> +configuration space. As described in struct
> +virtio_admin_ctrl_vdev_config_set, the command-out-data contains the
> +offset since the start of the config space, the size of the data and
> +the data that will be wrote. There's no command-in-data for this
> +command.
> +
> +\devicenormative{Device Specific Configuration}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Device Specific Configuration}
> +
> +The management device MUST fail the device configuration space access
> +if the driver want to access the range which is out of the config
> +space.
> +
> +The management device MUST fail the device configuration space access
> +if \field{device_id} is zero.
> +
> +\subsection{MSI Configuration}label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / MSI Configuration}
> +
> +When the admin virtqueue offers VIRTIO_ADMIN_F_VDEV, the MSI entry
> +for a specific virtqueue could be set through following command:
>

I think this is a bit problematic. E.g. for PCI MSI is programmed through
standard registers. Specifying address is data is insufficient, neither
is masking and enabling through device specific registers.
Referring to a vector seems more correct.
Further, need to think about how will all this be generalized
outside of PCI.

> +\begin{lstlisting}
> +#define VIRTIO_ADMIN_CTRL_MSI    7
> + #define VIRTIO_ADMIN_CTRL_MSI_VQ_SET        0
> + #define VIRTIO_ADMIN_CTRL_MSI_VQ_ENABLE     1
> + #define VIRTIO_ADMIN_CTRL_MSI_VQ_MASK       2
> + #define VIRTIO_ADMIN_CTRL_MSI_CONFIG_SET    3
> + #define VIRTIO_ADMIN_CTRL_MSI_CONFIG_ENABLE 4
> + #define VIRTIO_ADMIN_CTRL_MSI_CONFIG_MASK   5
> +
> +struct virtio_admin_ctrl_vdev_msi_vq_set {
> +       u16 queue_index;
> +       u64 addr;
> +       u32 data;
> +};
> +
> +struct virtio_admin_ctrl_vdev_msi_vq_enable {
> +       u16 queue_index;
> +       u8 enable;
> +};
> +
> +struct virtio_admin_ctrl_vdev_msi_vq_mask {
> +       u16 queue_index;
> +       u8 mask;
> +};
> +
> +struct virtio_admin_ctrl_vdev_msi_config {
> +       u64 addr;
> +       u32 data;
> +};
> +\end{lstlisting}
> +
> +The VIRTIO_ADMIN_CTRL_MSI_VQ_SET is used to set the MSI entry for a
> +specific virtqueue. The command-out-data is the virtqueue index and
> +the MSI address and data (as described in struct
> +virtio_admin_ctrl_vdev_msix_vq_set).
> +
> +The VIRTIO_ADMIN_CTRL_MSI_VQ_ENABLE and is used to enable or disable
> +MSI interrupt for a specific virtqueue. The command-out-data is the
> +virtqueue index and whether to enable the MSI: 0 means to enable and 1
> +means to disable (as described in struct
> +virtio_admin_ctrl_vdev_msi_vq_enable).
> +
> +The VIRTIO_ADMIN_CTRL_MSI_VQ_MASK and is used to mask or unmask MSI
> +interrupt for a specific virtqueue. The command-out-data is the
> +virtqueue index and the mask status: 0 means unmak and 1 means mask
> +(as described in struct virtio_admin_ctrl_vdev_msi_vq_mask).
> +
> +The VIRTIO_ADMIN_CTRL_MSI_CONFIG_SET is used to set the MSI entry
> +for the config interrupt. The command-out-data is the MSI address and
> +data (as described in struct virtio_admin_ctrl_vdev_msix_config).
> +
> +The VIRTIO_ADMIN_CTRL_MSI_CONFIG_ENABLE is used to enable and disable
> +MSI for config space. The command-out-data is an u8: 0 means to
> +disable and 1 means to enable.
> +
> +The VIRTIO_ADMIN_CTRL_MSI_CONFIG_MASK is used to mask and unmask MSI
> +interrupt for config space. The command-out-data is an u8: 0 means to
> +mask and 1 means to unmask.
> +
> +There's no command-in-data for all the above MSI commands.
> +
> +\devicenormative{MSI Configuration}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / MSI Configuration}
> +
> +The virtual device MUST record the pending MSI interrupt and
> +generate the MSI interrupt is it was pending after unmasking.
> +
> +The virtual MUST disable the MSI for both virtqueue and config space
> +upon reset.
> +
> +\drivernormative{MSI Configuration}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / MSI Configuration}
> +
> +The driver MUST allocate transport or platform specific MSI entries
> +for both virtqueue and config space if it wants to use interrupt.
> +
> +The driver MAY choose disable the MSI if polling is used.
> +
> +\subsection{Virtqueue Address}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Virtqueue Address}
> +
> +When the admin virtqueue offers VIRTIO_ADMIN_F_CAP_VDEV, the address of
> +a specific virtqueue could be done through the following command:
> +
> +\begin{lstlisting}
> +#define VIRTIO_ADMIN_CTRL_VQ_ADDR    9
> + #define VIRTIO_ADMIN_CTRL_VQ_ADDR_SET        0
> +
> +struct virtio_admin_ctrl_vdev_vq_addr {
> +       u16 queue_index;
> +       u64 device_area;
> +       u64 descriptor_area;
> +       u64 driver_area;
> +};
> +\end{lstlisting}
> +
> +The command-out-data is the queue index, the addresses of device area,
> +descriptor area and driver area (as described in struct
> +virtio_admin_ctrl_vdev_vq_addr); There's no command-in-data.
> +
> +\devicenormative{Virtqueue Address}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Virtqueeu Address}
> +
> +The management device MUST fail the commands of class
> +VIRTIO_ADMIN_CTRL_VQ_ADDR if \field{device_id} is zero.
> +
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
> +enabled).
> +
> +\devicenormative{Virtqueue Status}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Virtqueue Status}
> +
> +When disabled, the virtual device MUST stop processing requests from
> +this virtqueue.
> +
> +The management device MUST present a 0 via
> +VIRTIO_ADMIN_CTRL_VQ_ENABLE_GET on reset of the virtual device.
> +
> +The management device MUST fail the virtqueue status access if
> +\field{device_id} is zero.
> +
> +\devicenormative{Virtqueue Status}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Virtqueue Status}
> +
> +The driver MUST configure the other virtqueue fields before enabling
> +the virtqueue with VIRTIO_ADMIN_CTRL_VQ_ENABLE_SET.
> +
> +\subsection{Virtqueue Size}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Virtqueue Size}
> +
> +When the admin virtqueue offers VIRTIO_ADMIN_F_VDEV, virtqueue size
> +could be accessed through the following command:
> +
> +\begin{lstlisting}
> +#define VIRTIO_ADMIN_CTRL_VQ_SIZE    11
> + #define VIRTIO_ADMIN_CTRL_VQ_SIZE_SET       0
> + #define VIRTIO_ADMIN_CTRL_VQ_SIZE_GET       1
> +
> +struct virtio_admin_ctrl_vdev_vq_size_set {
> +       u16 queue_index;
> +       u16 size;
> +};
> +\end{lstlisting}
> +
> +The VIRTIO_ADMIN_CTRL_VQ_SIZE_SET command is used to set the virtqueue
> +size. The command-out-data is the queue index and the size of the
> +virtqueue (as described in struct
> +virtio_admin_ctrl_vdev_vq_size_set). There's no command-in-data.
> +
> +The VIRTIO_ADMIN_CTRL_VQ_SIZE_GET command is used to get the virtqueue
> +size. On reset, the maximum queue size supported by the device is
> +returned. The command-out-data is the u16 of the virtqueue index. The
> +command-in-data is the u16 of queue size for the virtqueue.
> +
> +\devicenormative{Virtqueue Status}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Virtqueue Size}
> +
> +The management device MUST fail the virtqueue size access if
> +\field{device_id} is zero.
> +
> +\subsection{Virtqueue Notification}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Virtqueue Notification}
> +
> +When the admin virtqueue offers VIRTIO_ADMIN_F_VDEV, the virtqueue
> +notification could be done through the following commands:
> +
> +\begin{lstlisting}
> +#define VIRTIO_ADMIN_CTRL_VQ_NOTIFY    12
> + #define VIRTIO_ADMIN_CTRL_VQ_NOTIFY_GET          1
> +
> +struct virtio_admin_ctrl_vdev_vq_notification_area {
> +       le64 addr
> +       le64 size;
> +};
> +\end{lstlisting}
> +
> +The VIRTIO_ADMIN_CTRL_VQ_NOTIFY_GET is used to get the transport
> +specific address area that can be used to notify a virtqueue. The
> +command-out-data is a u16 of the virtqueue index. The command-in-data
> +contains the address and the size of the notification area (as
> +described in struct virtio_admin_ctrl_vdev_vq_notification_area).
> +
> +\devicenormative{Virtqueue Notification}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Virtqueue Notification}
> +
> +The management device MUST fail the VIRTIO_ADMIN_CTRL_VQ_NOTIFY_GET if
> +there's no transport specific notification address for a virtqueue of
> +its virtual device.
> +
> +The management device MUST fail the virtqueue notification access if
> +\field{device_id} is zero.
> +
> +The management device MUST forbid the notification area of a specific
> +virtual device to be accessed from another virtual device.
> +
> +\drivernormative{Virtqueue Notification}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Virtqueue Notification}
> +
> +The driver MAY choose to notify the virtqueue by writing the queue
> +index at address \field{addr} which is fetched from the
> +VIRTIO_ADMIN_CTRL_VQ_NOTIFY_GET command.
> +
> +\subsection{Virtqueue Notification}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Device MMU}
> +
> +When the admin virtqueue offers VIRTIO_ADMIN_F_VDEV, management device
> +offers a device MMU for a secure DMA context for each virtual
> +device. The device MMU will translate I/O Virtual Address to transport
> +specific DMA address before using a transport specific way for DMA:
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
> +
> +The management driver typically do the following steps for creating a
> +virtual device:
> +
> +\begin{enumerate}
> +\item Determine the virtio id and device specific configuration.
> +\item Create the virtual devices using VIRTIO_ADMIN_CTRL_VDEV_CREATE
> +command.
> +\item Optionally, configure the MSI.
> +\item Optionally, enable and initialize the device MMU.
> +\item Setup the necessary communication methods with virtual device driver.
> +\item Perform device specific setups.
> +\item Let the virtual device to be probed by the virtual device
> +driver. The management driver will then use the admin virtqueue to
> +implement the requests of basic facility from the virtual device
> +driver.
> +\end{enumerate}
> +
>  \section{Virtio Over PCI Bus}\label{sec:Virtio Transport Options / Virtio Over PCI Bus}
>  
>  Virtio devices are commonly implemented as PCI devices.
> -- 
> 2.24.3 (Apple Git-128)

