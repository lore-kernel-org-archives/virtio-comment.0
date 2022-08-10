Return-Path: <jasowang@redhat.com>
MIME-Version: 1.0
References: <20220805095343.486546-1-lingshan.zhu@intel.com>
 <20220805095343.486546-3-lingshan.zhu@intel.com> <CACGkMEuYduqSSEVXRK7ThpuKzrC2RcWw8Q6gKD7=3Cf0RSa86Q@mail.gmail.com>
 <6482a483-bccb-26c8-dc4d-cd2d24168009@intel.com>
In-Reply-To: <6482a483-bccb-26c8-dc4d-cd2d24168009@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 10 Aug 2022 09:56:51 +0800
Message-ID: <CACGkMEv06sDGDfxtYnij_WhXus26aTK525fBfc4rLQvNjh7APA@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH V3 RESEND 2/4] Introduce the commands set
 of the transport vq
Content-Type: text/plain; charset="UTF-8"
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: mst <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, nrupal.jani@intel.com, "Uminski, Piotr" <Piotr.Uminski@intel.com>, hang.yuan@intel.com, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Aug 9, 2022 at 9:09 PM Zhu, Lingshan <lingshan.zhu@intel.com> wrote:
>
>
>
> On 8/8/2022 6:04 PM, Jason Wang wrote:
> > On Fri, Aug 5, 2022 at 6:02 PM Zhu Lingshan <lingshan.zhu@intel.com> wrote:
> >> This commit introduces the commands set of the
> >> transport virtqueue, including:
> >>
> >> The command to query available resources of the management device
> >> The commands to create / destroy the managed devices.
> >> The commands to config the managed devices.
> >> The commands to config virtqueues of the managed devices.
> >>
> >> Signed-off-by: Jason Wang <jasowang@redhat.com>
> >> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> >> ---
> >>   content.tex | 636 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >>   1 file changed, 636 insertions(+)
> >>
> >> diff --git a/content.tex b/content.tex
> >> index c747d21..190f3a0 100644
> >> --- a/content.tex
> >> +++ b/content.tex
> >> @@ -2975,6 +2975,642 @@ \subsection{Format of Commands through Transport Virtqueue}\label{sec:Virtio Tra
> >>   The \field{device_id} value 0 is used to identify the management device itself.
> >>
> >>   \field{class} is an identifier of a set of commands with similar  purposes.
> >> +
> >> +\subsection{Available Resource of the Management Device}\label{sec:Virtio Transport Options / Virtio Over Transport Virtqueue / Available Resource of the Management Device}
> >> +
> >> +When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
> >> +statistical information of available resources on the management device could be fetched
> >> +by the following command:
> >> +
> >> +\begin{lstlisting}
> >> +#define VIRTIO_TRANSPTQ_CTRL_AVAIL_RES    1 (class)
> >> + #define VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET     0 (command)
> >> +\end{lstlisting}
> >> +
> >> +VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET command is used to get the statistical information of the available
> >> +resource of a management device. There is no command-out-data for VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET
> >> +command. The management device fills command-in-data in the following format:
> >> +
> >> +\begin{lstlisting}
> >> +struct virtio_mgmt_dev_avail_res {
> >> +        /* The number of management device total remaining available free
> >> +         * virtqueues for the managed devices
> >> +         */
> > It's hard to phrase this sentence.
> How about "The number of remaining available virtqueues for new managed
> devices"
> >
> >> +        u16 num_avail_vqs;
> >> +        /* The minimal number of virtqueues for a managed device */
> >> +        u16 min_dev_vqs;
> >> +        /* The maximum number of virtqueues for a managed device */
> > Nit the min/max_dev_vqs are not the resources, so we'd better rename
> > the virtio_mgmt_dev_avail_res.
> OK, I will use struct virito_mgmt_dev_info{} in the next version, and
> the command and its description
> will change as well.
> >
> >> +        u16 max_dev_vqs;
> >> +        /* The number of managed devices that can be created with min_vqs virtqueues */
> > Is the part "with min_vqs virtqueues" a must? My understanding of the
> > above is a hint that the managed device is loosely coupled with the
> > virtqueue resources.
> Yes, the number of the number of total managed devices can be limited by
> other resources, like the filters.
> >
> > So it would be possible that num_avail_dev = 0 but num_avail_vqs not?
> >
> > Btw, "num" prefix is probably not a must.
> OK
> >
> >> +        u16 num_avail_dev;
> > To be consistent, let's use "num_avail_devs"?
> I will remove all num_ prefix, and it should be avail_devs
> >
> >> +};
> >> +\end{lstlisting}
> >> +
> >> +\field{max_avail_dev} MAY not equal to \field{num_avail_vqs} divided by \field{min_vqs}
> >> +due to the limitations of of other resources.
> > two "of".
> will fix
> >
> > Keywords like "MAY" should go to normatives part.
> OK, so I will only use "may", so it is a normal description.
> >
> >> +
> >> +\devicenormative{\subsubsection}{Available Resource of the Management Device}{Virtio Transport Options /
> >> +Virtio Over Transport Virtqueue / Available Resource of the Management Device}
> >> +
> >> +The management device MUST fail VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET command if \field{device_id} is not 0
> >> +
> >> +\drivernormative{\subsubsection}{Available Resource of the Management Device}{Virtio Transport Options /
> >> +Virtio Over Transport Virtqueue / Available Resource of the Management Device}
> >> +
> >> +The management device driver MUST use 0 as \field{device_id} for
> >> +VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET command.
> >> +
> >> +\subsection{Create and Destroy Managed Devices}\label{sec:Virtio Transport Options / Virtio Over Transport Virtqueue / Create and Destroy Managed Devices}
> >> +
> >> +When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
> >> +managed devices must be created and destroyed through the transport virtqueue.
> >> +
> >> +\begin{lstlisting}
> >> +#define VIRTIO_TRANSPORTQ_CTRL_DEV    2
> >> + #define VIRTIO_TRANSPORTQ_CTRL_DEV_CREATE        0
> >> + #define VIRTIO_TRANSPORTQ_CTRL_DEV_DESTROY       1
> >> +
> >> +struct virtio_transportq_ctrl_dev_attribute {
> >> +       u64 device_features[2];
> > Let's reserve more bits for features here as we are about to reach 64.
> OK, it looks 256bytes may be enough.

It's better to match the parent/management device, but maybe we can
start from something that is fine for the next 5 years. So I'd rather
go with even more than this like device_feautres[10].


> >
> >> +       u32 virtio_device_id;
> >> +       u8 dev_config[];
> > To be consistent, let's use one of "device" or "dev" in the same structure.
> sure, device_config[]
> >
> >> +};
> >> +\end{lstlisting}
> >> +
> >> +The VIRTIO_TRANSPORTQ_CTRL_DEV_CREATE command is used to create a managed device.
> >> +
> >> +As described in struct virtio_transportq_ctrl_dev_attribute, the command-out-data for VIRTIO_TRANSPTQ_CTRL_DEV_CREATE includes:
> >> +\begin{itemize*}
> >> +\item \field{device_features}: the 128-bit device feature bits (defined in section \ref{sec:Basic Facilities of a Virtio Device / Feature Bits})
> >> +of the managed device.
> >> +\item \field{virtio_device_id}: the virtio device id defined in Chapter \ref{sec:Device Types}.
> >> +\item \field{dev_config}: the device type specific configurations. E.g., for a virtio-net device,
> >> +it is struct virtio_net_config in section \ref{sec:Device Types / Network Device / Device configuration layout};
> >> +for a virtio-block device, it is struct virtio_blk_config in section \ref{sec:Device Types / Block Device / Device configuration layout}
> >> +\end{itemize*}
> >> +
> >> +When succeed, the device returns a 64 bits UUID as an unique identifier of the created managed device in command-in-data.
> > We don't need to be universally unique here.
> Why? I think it should be unique to identify a device, or are you
> suggesting to remove "as an unique identifier",
> just UUID is enough?

UUID means it's unique in the universal. If it means ID for managed
device in PF1 must differ from ID for managed device in PF2. This is
not needed.

So if we want to be flexible, we can allow the ID to be allocated by
the driver as the original RFC did. The driver is free to allocate
anything it want (UID or UUID).

> >
> >> +
> >> +The VIRTIO_TRANSPORTQ_CTRL_DEV_DESTROY command is used to destroy a
> >> +managed device which is identified by its 64 bits UUID
> >> +\field{device_id}. There's no command-in-data nor command-out-data for
> >> +VIRTIO_TRANSPTQ_CTRL_DEV_DESTROY command.
> >> +
> >> +\devicenormative{\subsubsection}{Create and Destroy Managed Devices}{Virtio Transport Options / Virtio Over Transport Virtqueue / Create and Destroy Managed Devices}
> >> +
> >> +The management device MUST fail VIRTIO_TRANSPORTQ_CTRL_DEV_CREATE command
> >> +if \field{device_id} is not 0.
> >> +
> >> +The management device MUST fail VIRTIO_TRANSPORTQ_CTRL_DEV CREATE command
> >> +if \field{device_features} exceeds the features that can be provided from the management device.
> > So PCI has le32 device_feature_select. How to make sure it can match
> > the capacity of device_features[] above?
> we present all feature bits in device_features[], the spec says the
> feature bits are valid up to bit 127,
> 128 and above are reserved. So as you suggest, we can use u64
> device_features[4], for 128-bit feature bits
> and another 128 bits for further extensions.
> >
> >> +
> >> +The management device MUST fail VIRTO_TRANSPORTQ_CTRL_DEV_DESTROY command
> >> +if \field{device_id} is 0.
> >> +
> >> +\drivernormative{\subsubsection}{Create and Destroy Managed Devices}{Virtio Transport Options / Virtio Over Transport Virtqueue / Create and Destroy Managed Devices}
> >> +
> >> +The management device driver MUST use 0 as \field{device_id} for
> >> +TRANSPORTQ_CTRL_DEV_CREATE command.
> >> +
> >> +\subsection{Features Negotiation}\label{sec:Virtio Transport Options / Virtio
> >> +Over Transport Virtqueue / Features Negotiation}
> >> +
> >> +When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
> >> +the features negotiation of managed devices is done by the
> >> +following commands:
> >> +
> >> +\begin{lstlisting}
> >> +#define VIRTIO_TRANSPTQ_CTRL_FEAT   3
> >> + #define VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET        0
> >> + #define VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_SET        1
> >> + #define VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_GET        2
> >> +\end{lstlisting}
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET command is used to get the features offered
> >> +by a managed device. The command-in-data is the 128-bit feature bits
> >> +(defined in section \ref{sec:Basic Facilities of a Virtio Device / Feature Bits}).
> > Need to make sure the capacity of the feature bit matches what the
> > transport of the management device can provide.
> I will provide a structure for the features, so both device and driver
> would be aligned on
> the size of the feature bits, like
>
> struct virtio_transportq_ctrl_dev_features {
>      u64 features[4];
> };
> >
> >> +There is no command-out-data.
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_SET command is for the driver to accept feature
> >> +bits offered by the managed device. The command-out-data is the 128-bit feature bits
> >> +passed to the managed device. There is no command-in-data.
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_GET command is used to get the features accepted
> >> +by both the managed device driver and the managed device. The command-in-data is the
> >> +128-bit feature bits. There is no command-out-data.
> >> +
> >> +\devicenormative{\subsubsection}{Features Negotiation}{Virtio Transport Options /
> >> +Virtio Over Transport Virtqueue / Features Negotiation}
> >> +
> >> +The management device MUST fail VIRTIO_TRANSPTQ_F_CTRL_FEAT class commands if
> >> +\field{device_id} is 0.
> >> +
> >> +\subsection{Device Status}\label{sec:Virtio Transport Options / Virtio Over
> >> +Transport Virtqueue / Device Status}
> >> +
> >> +When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
> >> +the device status of a managed device can be accessed by the following
> >> +commands:
> >> +
> >> +\begin{lstlisting}
> >> +#define VIRTIO_TRANSPTQ_CTRL_STATUS    4
> >> + #define VIRTIO_TRANSPTQ_CTRL_STATUS_GET        0
> >> + #define VIRTIO_TRANSPTQ_CTRL_STATUS_SET        1
> >> +\end{lstlisting}
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_STATUS_GET command is used to get the device status of
> >> +a managed device. The command-in-data is the 8-bit status
> >> +returned from the device. There's no command-out-data for this
> >> +command.
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_STATUS_SET command is used to set the device status of
> >> +a managed device. The command-out-data is the 8-bit status
> >> +to set to the device. There's no command-in-data for this command.
> >> +
> >> +\devicenormative{\subsubsection}{Device Status}{Virtio Transport Options / Virtio
> >> +Over Transport Virtqueue / Device Status}
> >> +
> >> +The management device MUST reset the managed device when 0
> >> +is set via VIRTIO_TRANSPTQ_CTRL_STATUS_SET, the success of this
> >> +command demonstrates the success of the reset.
> >> +
> >> +The management device MUST present 0 through
> >> +VIRTIO_TRANSPTQ_CTRL_STATUS_GET once the reset is successfully done.
> >> +
> >> +The management device MUST fail the device status access if
> >> +\field{device_id} is 0.
> >> +
> >> +\drivernormative{\subsubsection}{Device Status}{Virtio Transport Options / Virtio
> >> +Over Transport Virtqueue / Device Status}
> >> +
> >> +After writing 0 via VIRTIO_TRANSPTQ_CTRL_STATUS_SET, the driver MUST wait
> >> +for the success of the command before re-initializing the device.
> >> +
> >> +\subsection{Device Generation}\label{sec:Virtio Transport Options / Virtio Over Transport Virtqueue / Device Generation}
> >> +
> >> +When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
> > Btw, since we're under the transport options (which implies the
> > transport virtqueue), maybe we can drop the above for each command.
> OK, can do, and I will describe this in the Basic Concept section.
> >
> >> +the device generation count can be read from the following commands:
> >> +
> >> +\begin{lstlisting}
> >> +#define VIRTIO_TRANSPTQ_CTRL_GENERATION    5
> >> + #define VIRTIO_TRANSPTQ_CTRL_GENERATION_GET        0
> >> +\end{lstlisting}
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_GENERATION_GET command is used to get the device configuration generation count
> >> +of the managed device. The command-in-data is the one byte device
> >> +generation returned from the device. There's no command-out-data for
> >> +this command.
> >> +
> >> +\devicenormative{\subsubsection}{Device Generation}{Virtio Transport Options / Virtio Over Transport Virtqueue / Device Generation}
> >> +
> >> +The managed device MUST present a changed generation count after the driver
> >> +has read any device-specific configuration values if the values have been changed
> >> +during the last read.
> >> +
> >> +The management device MUST fail the device generation access if \field{device_id} is 0.
> >> +
> >> +\subsection{Device Specific Configuration}\label{sec:Virtio Transport Options /
> >> +Virtio Over Transport Virtqueue / Device Specific Configuration}
> >> +
> >> +When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
> >> +the device config space contents of a managed device can be accessed through
> >> +the following commands:
> >> +
> >> +\begin{lstlisting}
> >> +#define VIRTIO_TRANSPTQ_CTRL_CONFIG    6
> >> +  #define VIRTIO_TRANSPTQ_CTRL_CONFIG_GET    0
> >> +  #define VIRTIO_TRANSPTQ_CTRL_CONFIG_SET    1
> >> +
> >> +struct virtio_transportq_ctrl_dev_config_get {
> >> +       u32 offset;
> >> +       u32 size;
> >> +};
> >> +
> >> +struct virtio_transportq_ctrl_dev_config_set {
> >> +       u32 offset;
> >> +       u32 size;
> >> +       u8  data[];
> >> +};
> >> +\end{lstlisting}
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_CONFIG_GET command is used to read data from the
> >> +device configuration space.  The command-out-data is the \field{offset}
> >> +from the start of the config space and the \field{size}
> >> +of the data (as described in struct virtio_transportq_ctrl_dev_config_get).
> >> +The command-in-data is an array of the data that read from the config space.
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_CONFIG_SET command is used to write data to the device
> >> +configuration space. The command-out-data contains the
> >> +\field{offset} from the start of the config space, the \field{size} of the data and
> >> +the \field{data} to be written (as described in struct virtio_transportq_ctrl_dev_config_set).
> >> +There's no command-in-data for this command.
> >> +
> >> +\devicenormative{\subsubsection}{Device Specific Configuration}{Virtio Transport
> >> +Options / Virtio Over Transport Virtqueue / Device Specific Configuration}
> >> +
> >> +The management device MUST fail the device configuration space access
> >> +if the driver access the range which is outside the config space.
> > "accesses"
> yes
> >
> >> +
> >> +The management device MUST fail the device configuration space access
> >> +if \field{device_id} is 0.
> >> +
> >> +\subsection{MSI Configuration}\label{sec:Virtio Transport Options / Virtio Over
> >> +Transport Virtqueue / MSI Configuration}
> >> +
> >> +When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
> >> +the MSI entries of a managed device can be accessed  through the following command:
> > Rethink of this, it implies a per virtqueue MSI storage which I'm not
> > sure is expensive or not. Do we need an indirection layer as PCI did?
> I think we need this for performance, or are you suggesting to add a
> device scope MSI?

I meant having MSI vectors and let the virtqueue refer to the MSI vectors.

Current design means for a 1024 virtqueues device to store 1024 MSI entries.
With the indirection of the MSI vectors array, the device is free to
have 1 to 1024 MSI entries.

> >
> >> +
> >> +\begin{lstlisting}
> >> +#define VIRTIO_TRANSPTQ_CTRL_MSI    7
> >> + #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_GET        0
> >> + #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_SET        1
> >> + #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_ENABLE     2
> >> + #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_GET    3
> >> + #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_WET    4
> > I think you mean CONFIG_SET here.
> yes
> >
> >> + #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_ENABLE 5
> >> +
> >> +struct virtio_transportq_ctrl_msi_vq_config {
> >> +       u16 queue_index;
> >> +       u64 address;
> >> +       u32 data;
> >> +       u8 padding[2];
> >> +};
> >> +
> >> +struct virtio_transportq_ctrl_msi_vq_enable {
> >> +       u16 queue_index;
> >> +       u8 enable;
> >> +       u8 padding[5];
> >> +};
> >> +
> >> +struct virtio_transportq_ctrl_msi_config {
> >> +       u64 address;
> >> +       u32 data;
> >> +       u8 padding[4];
> >> +};
> >> +\end{lstlisting}
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_GET command is used to read the MSI entry of a
> >> +specific virtqueue. The command-out-data is the queue index. The command-in-data contains
> >> +\field{queue_index}, the \field{address} and \field{data}
> >> +(as described in struct virtio_transportq_ctrl_msi_vq_config).
> > Let's split or reuse the virtio_transportq_ctrl_msi_config since
> > virtio_transportq_ctrl_msi_vq_config will not be used a as single
> > buffer.
> I don't get it, if we re-use the struct virtio_transportq_ctrl_msi_config,
> it would be like:
>
> struct virtio_transportq_ctrl_msi {
>      u64 addr;
>      u32 data;
> };
>
> struct virtio_transportq_ctrl_msi_vq_config {
>      u16 queue_index;

What I meant is, for GET. queue_index is out buffer, and re-use
virtio_transportq_ctrl_msi is in buffer.

>      struct virtio_transportq_ctrl_msi;
> };
>
> it is still two structs and a struct in another struct.
> >
> >> +
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_SET command is used to set the MSI entry for a
> >> +specific virtqueue. The command-out-data is the \field{queue_index},
> >> +\field{address} and \field{data} (as described in struct virtio_transportq_ctrl_msi_vq_config).
> >> +There is no command-in-data.
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_ENABLE command is used to enable or disable
> >> +the MSI interrupt for a specific virtqueue. The command-out-data is the
> >> +\field{queue_index} and a byte \field{enable} which representing ENABLE or DISABLE the MSI.
> > Should be "represents".
> OK
> >
> > Btw, is there a chance that we may lose an interrupt?
> No, I think we won't lose any interrupts, because once disabled, it can
> not send new interrupts,
> but the last interrupt send by the MSI entry is still there, it's in-band.

So consider driver is changing affinity what it did is:

disable
write MSI
enable

What if there's an interrupt coming in the middle? Does this mean the
device needs to implement the pending bit internally?

FYI we had similar discussion in the past:

https://lists.oasis-open.org/archives/virtio-dev/202002/msg00027.html

> >
> >> +(as described in struct virtio_transportq_ctrl_msi_vq_enable).
> >> +
> >> +\begin{lstlisting}
> >> +#define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_ENABLE     1
> >> +#define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_DISABLE    0
> >> +\end{lstlisting}
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_GET command is used to read the MSI entry
> >> +of the config interrupt. The command-in-data contains the \field{address} and
> >> +\field{data} (as described in struct virtio_transportq_ctrl_msi_config).
> >> +There is no command-out-data.
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_SET command is used to set the MSI entry
> >> +for the config interrupt. The command-out-data is the \field{address} and
> >> +\field{data} (as described in struct virtio_transportq_ctrl_msi_config).
> >> +There is no command-in-data.
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_ENABLE command is used to enable or disable
> >> +the MSI interrupt for config space. The command-out-data is a byte which representing
> >> +ENABLE or DISABLE the config MSI.
> >> +There is no command-in-data
> >> +
> >> +\begin{lstlisting}
> >> +#define VIRTIO_TRANSPTQ_CTRL_MSI_CFG_ENABLE     1
> >> +#define VIRTIO_TRANSPTQ_CTRL_MSI_CFG_DISABLE    0
> >> +\end{lstlisting}
> >> +
> >> +\devicenormative{\subsubsection}{MSI Configuration}{Virtio Transport Options / Virtio
> >> +ver Transport Virtqueue / MSI Configuration}
> >> +
> >> +The managed device MUST disable the MSI interrupts for both virtqueues and config space
> >> +upon a reset.
> >> +
> >> +Once a MSI entry is disabled, the managed device MUST not send any interrupts
> >> +by this MSI entry.
> > MSI is stored based on virtqueue and config space, so I'm not quite
> > sure "MSI entry" is accurate here.
> I will replace all "MSI entry" with "MSI vector"
> >
> >> +
> >> +\drivernormative{\subsubsection}{MSI Configuration}{Virtio Transport Options / Virtio
> >> +Over Transport Virtqueue / MSI Configuration}
> >> +
> >> +The driver MUST allocate transport or platform specific MSI entries
> >> +for both virtqueues and config space if it wants to use interrupts.
> >> +
> >> +The driver MAY choose to disable the MSI if polling mode is used.
> >> +
> >> +\subsection{Virtqueue Address}\label{sec:Virtio Transport Options / Virtio Over
> >> +Transport Virtqueue / Virtqueue Address}
> >> +
> >> +When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
> >> +the addresses of a specific virtqueue are accessed through the following command:
> >> +
> >> +\begin{lstlisting}
> >> +#define VIRTIO_TRANSPTQ_CTRL_VQ_ADDR    8
> >> + #define VIRTIO_TRANSPTQ_CTRL_VQ_ADDR_SET       1
> >> +
> >> +struct virtio_transportq_ctrl_vq_addr {
> >> +       u16 queue_index;
> >> +       u64 descriptor_area;
> >> +       u64 device_area;
> >> +       u64 driver_area;
> >> +       u8 padding[6];
> >> +};
> >> +\end{lstlisting}
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_VQ_ADDR_SET command is used to set the addresses of a specified
> >> +virtqueue. The command-out-data contains the \field{queue_index}, the addresses of \field{device_area},
> >> +\field{descriptor_area} and \field{driver_area} (as described in struct
> >> +virtio_transportq_ctrl_vq_addr). There's no command-in-data.
> >> +
> >> +\devicenormative{\subsubsection}{Virtqueue Address}{Virtio Transport Options / Virtio
> >> +Over Transport Virtqueue / Virtqueeu Address}
> >> +
> >> +The management device MUST fail the commands of class
> >> +VIRTIO_TRANSPTQ_CTRL_VQ_ADDR if \field{device_id} is 0.
> >> +
> >> +The management device MUST fail the commands of class
> >> +VIRTIO_TRANSPTQ_CTRL_VQ_ADDR if \field{queue_index} is out-of-range invalid.
> >> +
> >> +\subsection{Virtqueue Status}\label{sec:Virtio Transport Options / Virtio Over
> >> +Transport Virtqueue / Virtqueue Status}
> >> +
> >> +When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
> >> +virtqueue status is accessed through the following command:
> >> +
> >> +\begin{lstlisting}
> >> +#define VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE    9
> >> + #define VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_GET       0
> >> + #define VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET       1
> >> +
> >> +struct virtio_transportq_ctrl_vq_status_set {
> >> +       u16 queue_index;
> >> +       u8 status;
> >> +       u8 padding[5];
> >> +
> >> +#define VIRTIO_TRANSPTQ_VQ_ENABLE     1
> >> +#define VIRTIO_TRANSPTQ_VQ_DISABLE    0
> >> +
> >> +};
> >> +
> >> +\end{lstlisting}
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_GET is used to get the status of a
> >> +specific virtqueue. The command-out-data is the queue
> >> +index. The command-in-data is the virtqueue status.
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET command is used to set the status of a
> >> +specific virtqueue. The command-out-data is the \field{queue_index} and the
> >> +\field{status} representing ENABLE or DISABLE that is set to the virtqueue
> >> +(as described in struct virtio_transportq_ctrl_vq_status_set).
> >> +There's no command-in-data.
> >> +
> >> +\devicenormative{\subsubsection}{Virtqueue Status}{Virtio Transport Options / Virtio
> >> +Over Transport Virtqueue / Virtqueue Status}
> >> +
> >> +When disabled, the managed device MUST stop processing requests from
> >> +this virtqueue.
> > Is this a hint that the driver can write VIRTIO_TRANSPTQ_VQ_DISABLE to
> > status? If yes, what's the difference between this and virtqueue
> > reset?
> I think disabling a queue is like "set queue_enable = 0", once disabled,
> the device should not reset the queue configurations like the indexes
> and addresses,
> it just freeze the queue.

Then you need to define what "freeze" means. To reduce the changset,
I'd suggest disallowing such writing as what PCI did.

If needed, we can re-enable it in the future.

>
> When reset a queue, like the spec says, the device needs to reset all queue
> configs.
> >
> >> +
> >> +The management device MUST present a 0 via
> >> +VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_GET upon a reset of the managed device.
> >> +
> >> +The management device MUST fail the virtqueue status access if
> >> +\field{device_id} is 0.
> >> +
> >> +The management device MUST fail the virtqueue status access if
> >> +the queue_index is out-of-range invalid.
> >> +
> >> +
> >> +\drivernormative{\subsubsection}{Virtqueue Status}{Virtio Transport Options / Virtio
> >> +Over Transport Virtqueue / Virtqueue Status}
> >> +
> >> +The driver MUST configure other virtqueue fields before enabling
> >> +the virtqueue with VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET.
> >> +
> >> +\subsection{Virtqueue Size}\label{sec:Virtio Transport Options / Virtio Over
> >> +Transport Virtqueue / Virtqueue Size}
> >> +
> >> +When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
> >> +virtqueue size is accessed through the following command:
> >> +
> >> +\begin{lstlisting}
> >> +#define VIRTIO_TRANSPTQ_CTRL_VQ_SIZE    10
> >> + #define VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_GET       0
> >> + #define VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_SET       1
> >> +
> >> +struct virtio_transportq_ctrl_vq_size_set {
> >> +       u16 queue_index;
> >> +       u16 size;
> >> +       u8 padding[4];
> >> +};
> >> +\end{lstlisting}
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_GET command is used to get the virtqueue
> >> +size. On reset, the maximum queue size supported by the device is
> >> +returned. The command-out-data is the queue index. The
> >> +command-in-data is an 16-bit queue size.
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_SET command is used to set the virtqueue
> >> +size. The command-out-data is the \field{queue_index} and the \field{size}
> >> +of the virtqueue (as described in struct virtio_transportq_ctrl_vq_size_set).
> >> +There's no command-in-data.
> >> +
> >> +\devicenormative{\subsubsection}{Virtqueue Status}{Virtio Transport Options / Virtio
> >> +Over Transport Virtqueue / Virtqueue Size}
> >> +
> >> +The management device MUST fail the virtqueue size access if
> >> +\field{device_id} is 0.
> >> +
> >> +The management device MUST fail the virtqueue size access if
> >> +the queue index is out-of-range invalid.
> >> +
> >> +\subsection{Virtqueue Notification}\label{sec:Virtio Transport Options / Virtio
> >> +Over Transport Virtqueue / Virtqueue Notification}
> >> +
> >> +When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
> >> +the virtqueue notification area information can be get through the following commands:
> >> +
> >> +\begin{lstlisting}
> >> +#define VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY    11
> >> + #define VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET          0
> >> +
> >> +struct virtio_transportq_ctrl_vq_notification_area {
> >> +       u64 address;
> >> +       u64 size;
> >> +};
> >> +\end{lstlisting}
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET is used to get the transport
> >> +specific address area that can be used to notify a virtqueue. The
> >> +command-out-data is an u16 of the queue index. The command-in-data
> >> +contains the \field{address} and the \field{size}
> >> +of the notification area (as described in struct virtio_transportq_ctrl_vq_notification_area).
> >> +
> >> +\devicenormative{\subsubsection}{Virtqueue Notification}{Virtio Transport Options /
> >> +Virtio Over Transport Virtqueue / Virtqueue Notification}
> >> +
> >> +The management device MUST fail the virtqueue notification area information
> >> +access if \field{device_id} is 0.
> >> +
> >> +The management device MUST fail the virtqueue notification area information
> >> +access if the queue index is out-of-range invalid.
> > We probably need to say the management device must reserve sufficient
> > transport specific resources as notification area or we need to have a
> > fallback of using a dedicated command to notify.
> OK, will add this
> >
> >> +
> >> +\drivernormative{\subsubsection}{Virtqueue Notification}{Virtio Transport Options /
> >> +Virtio Over Transport Virtqueue / Virtqueue Notification}
> >> +
> >> +The driver MAY choose to notify the virtqueue by writing the queue
> >> +index at address \field{address} which is fetched from the
> >> +VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET command.
> >> +
> >> +\subsection{Virtqueue State}\label{sec:Virtio Transport Options / Virtio
> >> +Over Transport Virtqueue / Virtqueue State}
> >> +
> >> +When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
> >> +the virtqueue state is accessed through the following commands:
> >> +
> >> +\begin{lstlisting}
> >> +#define VIRTIO_TRANSPTQ_CTRL_VQ_STATE            12
> >> + #define VIRTIO_TRANSPTQ_CTRL_VQ_STATE_GET       0
> >> + #define VIRTIO_TRANSPTQ_CTRL_VQ_STATE_SET       1
> >> +\end{lstlisting}
> >> +
> >> +\subsubsection{Split Virtqueue State}\label{sec:Virtio Transport Options / Virtio
> >> +Over Transport Virtqueue / Virtqueue State / Split Virtqueue State}
> >> +
> >> +\begin{lstlisting}
> >> +struct virtio_transportq_ctrl_split_vq_state_set {
> >> +    u16 queue_index;
> >> +    u16 avail_index;
> >> +    u8 padding[4];
> >> +};
> >> +\end{lstlisting}
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_VQ_STATE_GET command can be  used to get the state of a
> >> +split virtqueue. The command-out-data is the queue index, the command-in-data is the available index of the virtqueue.
> > We need to be accurate for "available index". E.g we have one for in
> > the shared memory, so do you mean last_avail_idx?
> actually there is no definition of "last available index" in the spec,
> so how about we say:
> on-device available index?

Any should be fine but need to explain what does it mean.

> >
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_VQ_STATE_SET command can be used to set the state of a
> >> +split virtqueue. The command-out-data contains the \field{queue_index} and the
> >> +available index (\field{avail_index}) for the virtqueue (as described in struct virtio_transportq_ctrl_split_vq_state_set).
> >> +There is no command-in-data.
> >> +
> >> +\subsubsection{Packed Virtqueue State}\label{sec:Virtio Transport Options / Virtio
> >> +Over Transport Virtqueue / Virtqueue State / Packed Virtqueue State}
> >> +
> >> +\begin{lstlisting}
> >> +struct virtio_transportq_ctrl_packed_vq_state {
> >> +    u16 queue_index;
> >> +    u16 avail_counter;
> >> +    u16 avail_index;
> >> +    u16 used_counter;
> >> +    u16 used_index;
> > Let's simply reuse the structure in the kernel headers.
> >
> > Using u16 for wrap_couter seems unnecessary etc.
> OK, the bit operations are not often.

It should be very common in the hardware interface.

> >
> >> +    u8 padding[6];
> >> +};
> >> +\end{lstlisting}
> >> +
> >> +The state of a packed virtqueue includes :\\
> >> +\field{avail_counter}: last driver ring wrap counter observed by device.\\
> >> +\field{avail_index}: virtqueue available index.\\
> >> +\field{used_counter}: device ring wrap counter.\\
> >> +\field{used_index}: virtqueue used index.
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_VQ_STATE_GET command can be used to get the state of a packed virtqueue.
> >> +The command-out-data is the queue index, the command-in-data contains the \field{queue_index},
> >> +\field{avail_counter}, \field{avail_index}, \field{used_counter} and \field{used_index} of the virtqueue
> >> +(as described in transportq_ctrl_packed_vq_state).
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_VQ_STATE_SET command can be used to set the state of a packed virtqueue.
> >> +The command-out-data contains the \field{queue_index}, \field{avail_counter}, \field{avail_index},
> >> +\field{used_counter} and \field{used_index} for the virtqueue
> >> +(as described in transportq_ctrl_packed_vq_state).
> >> +There is no command-in-data.
> >> +
> >> +\devicenormative{\subsubsection}{Virtqueue State}{Virtio Transport Options /
> >> +Virtio Over Transport Virtqueue / Virtqueue State}
> >> +
> >> +The management device MUST fail the virtqueue index access if \field{device_id} is 0.
> >> +
> >> +The management device MUST fail the virtqueue index access if \field{queue_index} is out-of-range invalid.
> >> +
> >> +\subsection{Virtqueue ASID}\label{sec:Virtio Transport Options / Virtio Over
> >> +Transport Virtqueue / Virtqueue ASID}
> >> +
> >> +When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
> >> +the address space id of a virtqueue could be set through the following command:
> >> +
> >> +\begin{lstlisting}
> >> +#define VIRTIO_TRANSPTQ_CTRL_VQ_ASID        13
> >> + #define VIRTIO_TRANSPTQ_CTRL_VQ_ASID_SET   1
> >> +
> >> +struct virtio_transportq_ctrl_vq_asid_set {
> >> +       u16 queue_index;
> >> +       u32 asid;
> >> +       u8 padding[2];
> > I'd reserve more here. E.g in the future each virtqueue may have a
> > secondary ASID,
> like asid[2]? But why? For a device, there may needs a secondary ASID
> because it
> may need to access different memory region on behalf of different DMA
> sources.
> But for a virtqueue, it only has one purpose, to access the queue
> buffer, maybe it
> doesn't need a secondary asid

E.g for transparent shadow virtqueue.

> >
> >> +};
> >> +\end{lstlisting}
> >> +
> >> +The VIRTIO_TRANSPTQ_CTRL_VQ_ASID_SET command is used to set the address space id(\field{asid})
> >> +of a virtqueue.
> >> +
> >> +The address space id is an identifier
> > Let's add "transport specific" before "identifier"
> OK
> >
> >> of a memory space which is used to convey the address space targeted by the
> >> +memory accesses
> > We need to say the ASID is for DMA not here at least.

I meant you need to explain how address space is used. (e.g it it used
only for DMA).

> I don't get it, we need to explain what ASID is used for after
> we introduce it.
> >
> >> , and to distinguish memory accesses performed by different virtqueues
> > This may confuse the readers since a single ASID could be shared by virtqueues.
> so it should be "by different virtqueues or virtqueue groups"

I think we can refer to the explanation of transport specific ASID here.

Thanks

