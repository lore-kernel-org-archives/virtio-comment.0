Return-Path: <lingshan.zhu@intel.com>
Message-ID: <1257ce25-a208-3acb-6a25-707bcdd24e10@intel.com>
Date: Tue, 2 Aug 2022 21:07:33 +0800
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH V2 3/5] Introduce the commands set of
 the transport vq
References: <20220801093216.362119-1-lingshan.zhu@intel.com>
 <20220801093216.362119-4-lingshan.zhu@intel.com>
 <20220801162817-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20220801162817-mutt-send-email-mst@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>



On 8/2/2022 4:53 AM, Michael S. Tsirkin wrote:
> On Mon, Aug 01, 2022 at 05:32:14PM +0800, Zhu Lingshan wrote:
>> This commit introduces the commands set of the
>> transport virtqueue, including:
>>
>> The command to query available resources of the management device
>> The commands to create / destroy the managed devices.
>> The commands to config the managed devices.
>> The commands to config virtqueues of the managed devices.
>>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>> ---
>>   content.tex | 656 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 656 insertions(+)
>>
>> diff --git a/content.tex b/content.tex
>> index 143949e..e625faf 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -2980,6 +2980,662 @@ \subsection{Transport Virtqueue Features}\label{sec:Virtio Transport Options /Vi
>>   
>>   The management device MUST not accept VIRTIO_F_TRANSPT_VQ_MDEV if VIRTIO_F_TRANSPT_VQ is not negotiated.
>>   
>> +\subsection{Available Resource of the Management Device}\label{sec:Virtio Transport Options / Virtio Over Transport Virtqueue / Available Resource of the Management Device}
>> +
>> +When VIRTIO_F_TRANSPT_VQ_MDEV is negotiated,
>> +statistical information of available resources of the management device could be fetched
>> +by the following command:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_AVAIL_RES    1 (class)
>> + #define VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET     0 (command)
>> +\end{lstlisting}
>> +
>> +VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET command is used to get the statistical information of the available
>> +resource of a management device. There is no command-out-data for VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET
>> +command. The management device fills command-in-data in the following format:
>> +
>> +\begin{lstlisting}
>> +struct mgmt_dev_avail_res{
> space before {. And pls prefix things with virtio_ .
will fix
>
>> +        /* The number of total remaining virtqueues for the managed devices */
> remaining after what?
this tries to show the available free virtqueues that can be used to 
create managed devices, I will use a better term in the next version.
>
>> +        u16 num_avail_vqs;
>> +        /* The minimal number of virtqueues for a managed device */
>> +        u16 min_mdev_vqs;
>> +        /* The maximum number of virtqueues for a managed device */
>> +        u16 max_mdev_vqs;
>> +        /* The number of managed devices that can be created with min_mdev_vqs virtqueues.
> why with min_mdev_vqs specifically?
>
> can be created generally? or additionally to ones already created?
yes, additional ones already have been "pre-created", like 4 queues 
virtio-net, in this case,
both min_mdev_vqs and max_mdev_vqs are 4.
>
>> +         * This number may not equal to num_avail_vqs divided by min_mdev_vqs due to
>> +         * the limitations of other resources
>> +         */
>> +        u16 num_avail_mdev;
>> +};
>> +\end{lstlisting}
>> +
>> +If \field{min_mdev_vqs} equals to \field{min_mdev_vqs},
> I don't understand what this says
my typo, this should be min_mdev_vqs == max_mdev_vqs
>
>> that means the management device
>> +can only create managed devices with a fixed number of virtqueues, then the managed devices
>> +can be pre-allocated.
> what is this saying? what does pre-allocated mean? is it worth saying
> here?
if min_mdev_vqs == max_mdev_vqs, it implies the management device can 
only create fixed size / capabilities managed devices,
that's usually pre-created.

But I think I should remove this, it does not has to be pre-created, it 
is totally the hardware implementation thing.
>
>> +
>> +\devicenormative{\subsubsection}{Available resource of the management device}{Virtio Transport Options /
>> +Virtio Over Transport Virtqueue / Available resource of the management device}
>> +
>> +The management device MUST fail VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET command if \field{device_id} is not 0
>> +
>> +\drivernormative{\subsubsection}{Available resource of the management device}{Virtio Transport Options /
>> +Virtio Over Transport Virtqueue / Available resource of the management device}
>> +
>> +The management driver MUST use 0 as \field{device_id} for
>> +VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET command.
> Now I am tempted to ask why not put it all in config space.
> Why prefer it there you ask?
> Look how it is handy since it allows using config struct to create
> devices.
> Worth considering.
An implementation in the config space is truly attractive, my concern is 
that has to be PCI.
This seems can not be nested since a nested SIOV ADI can only have the 
transport vq as its
transport layer, no PCI for it.
>
>
>> +
>> +\subsection{Create and Destroy Managed Devices}\label{sec:Virtio Transport Options / Virtio Over Transport Virtqueue / Create and Destroy Managed Devices}
>> +
>> +When VIRTIO_F_TRANSPT_VQ_MDEV is negotiated,
>> +managed devices must be created and destroyed through the transport virtqueue.
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPORTQ_CTRL_MDEV    2
>> + #define VIRTIO_TRANSPORTQ_CTRL_MDEV_CREATE        0
>> + #define VIRTIO_TRANSPORTQ_CTRL_MDEV_DESTROY       1
>> +
>> +struct transportq_ctrl_mdev_attribute {
>> +       u32 virtio_device_id;
>> +       u64 device_features;
>
> alignment issues.
will fix this
>
>
>> +       u8 dev_config[];
>> +};
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPORTQ_CTRL_MDEV_CREATE command is used to create a managed device.
>> +The command-out-data for VIRTIO_TRANSPTQ_CTRL_MDEV_CREATE is the virtio device id (\field{virtio_device_id}),
>
> yes but you do not actually say what this field is.
I will add a description here, define VRITO_ID_NET == 1, BLK == 2, etc
>
>> +feature bits and device type  specific configuration (\field{dev_config}) for creating the managed device.
>> +(as described in struct transportq_ctrl_mdev_attribute)
>> +
>> +The field \field{dev_config} is device type specific configurations. E.g., for a virtio-net device,
>> +it is struct virtio_net_config in section \ref{sec:Device Types / Network Device / Device configuration layout};
>>
>> +for a virtio-block device, it is struct virtio_blk_config in section \ref{sec:Device Types / Block Device / Device configuration layout}
>> +
>> +The field \field{device_features} is the device feature bits for the managed device.
>> +
>> +When succeed, the device returns a 64 bits UUID as an unique identifier of the created managed device in command-in-data.
>> +
>> +The VIRTIO_TRANSPORTQ_CTRL_MDEV_DESTROY command is used to destroy a
>> +managed device which is identified by its 64 bits UUID
>> +\field{device_id}. There's no command-in-data nor command-out-data for
>> +VIRTIO_TRANSPTQ_CTRL_MDEV_DESTROY command.
>> +
>> +\devicenormative{\subsubsection}{Create and Destroy Managed Devices}{Virtio Transport Options / Virtio Over Transport Virtqueue / Create and Destroy Managed Devices}
>> +
>> +The management device MUST fail VIRTIO_TRANSPORTQ_CTRL_MDEV_CREATE command
>> +if \field{device_id} is not 0.
>> +
>> +The management device MUST fail VIRTIO_TRANSPORTQ_CTRL_MDEV CREATE command
>> +if \field{device_features} exceeds the feature bits of the management device.
> this is a bit vague.
this means, the management device should fail command 
VIRTIO_TRANSPOTRQ_CTRL_MDEV_CREATE if the driver asking for a feature 
bit the management device can not fulfill.

E.g., the management device does not have RSS, but the driver wants to 
create a managed device with RSS.

I will work on a better description.

By the way, it may be better remove all mdev/MDEV in the structure and 
the commands macros, only leave _dev_ and "managed device" in the 
descriptions.
>
>> +
>> +The management device MUST fail VIRTO_TRANSPORTQ_CTRL_MDEV_DESTROY command
>> +if \field{device_id} is 0.
>> +
>> +\drivernormative{\subsubsection}{Create and Destroy Managed Devices}{Virtio Transport Options / Virtio Over Transport Virtqueue / Create and Destroy Managed Devices}
>> +
>> +The management driver MUST use 0 as \field{device_id} for
>> +TRANSPORTQ_CTRL_MDEV_CREATE command.
>> +
>> +\subsection{Features Negotiation}\label{sec:Virtio Transport Options / Virtio
>> +Over Transport Virtqueue / Features Negotiation}
>> +
>> +When VIRTIO_F_TRANSPT_VQ_MDEV is negotiated,
> this is very confusing. I assume this refers to the management device?
> we need to somehow move discussion of management device out of this
> section, just focus on commands.
Yes, the management device.
This tries to explain if the feature bit VIRTIO_F_TRANSPT_VQ_MDEV is 
negotiated with the management device,
we can send these commands to control the manged device through the 
transport vq.

But I think it may be better remove the feature bit 
VIRTIO_F_TRANSPT_VQ_MDEV as you pointed out before.
So I would rework it like "When VIRTIO_F_TRANSPT_VQ is negotiated with 
the management device".
Do you think this can make it clear?
>
>
>> +the features negotiation of managed devices is done by the
>> +following commands:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_FEAT   3
>> + #define VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET        0
>> + #define VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_SET        1
>> + #define VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_GET        2
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET command is used to get the features offered
>> +by a managed device.
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_SET command is for the driver to accept feature
>> +bits offered by the managed device.
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_GET command is used to get the features accepted
>> +by both the virtual driver and the device.
> what is virtual driver?
my typo, should be the managed device driver
>
>> +
>> +The features is a 64 bits mask of the virtio features bit.
> let's find a way not to limit this to 64 bit please.
> why should we? why not let driver specify how many driver wants.
OK
>
>> +For VIRTIO_TRANSPTQ_CTRL_DRIVER_SET, the feature bits are passed to the device
>> +through command-out-data. For VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET and
>> +VIRTIO_TRANSPTQ_CTRL_DRIVER_GET the feature is returned for the device
>> +through command-in-data.
>> +
>> +\devicenormative{\subsubsection}{Features Negotiation}{Virtio Transport Options /
>> +Virtio Over Transport Virtqueue / Features Negotiation}
>> +
>> +The management device MUST fail VIRTIO_TRANSPTQ_F_CTRL_FEAT class commands if
>> +\field{device_id} is 0.
>> +
>> +\drivernormative{\subsubsection}{Features Negotiation}{Virtio Transport Options /
>> +Virtio Over Transport Virtqueue / Features Negotiation}
>> +
>> +The management driver MAY mediate between the feature negotiation
>> +request of the managed devices and the transport virtqueue. E.g when
>> +offering features to the managed device, the management driver MAY
>> +exclude some features in order to limit the behaviors of the managed
>> +device.
> I don't understand what you are saying here. how is this different
> from any other transport?
Yes, this section is not necessary here.
>
>> +
>> +\subsection{Device Status}\label{sec:Virtio Transport Options / Virtio Over
>> +Transport Virtqueue / Device Status}
>> +
>> +When VIRTIO_F_TRANSPT_VQ_MDEV is negotiated,
>> +the device status of a managed device can be accessed by the following
>> +commands:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_STATUS    4
>> + #define VIRTIO_TRANSPTQ_CTRL_STATUS_SET        0
>> + #define VIRTIO_TRANSPTQ_CTRL_STATUS_GET        1
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_STATUS_SET command is used to set the device status of
>> +a managed device. The command-out-data is the one byte status
>> +to set to the device. There's no command-in-data for this command.
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_STATUS_GET command is used to get the device status of
>> +a managed device. The command-in-data is the one byte status
>> +returned from the device. There's no command-out-data for this
>> +command.
>> +
>> +\devicenormative{\subsubsection}{Device Status}{Virtio Transport Options / Virtio
>> +Over Transport Virtqueue / Device Status}
>> +
>> +The management device MUST reset the managed device when 0
>> +is set via VIRTIO_TRANSPTQ_CTRL_STATUS_SET, the success of this
>> +command demonstrates the success of the reset.
>> +
>> +The management device MUST present 0 through
>> +VIRTIO_TRANSPTQ_CTRL_STATUS_GET once the reset is successfully done.
>> +
>> +The management device MUST fail the device status access if
>> +\field{device_id} is 0.
>> +
>> +\drivernormative{\subsubsection}{Device Status}{Virtio Transport Options / Virtio
>> +Over Transport Virtqueue / Device Status}
>> +
>> +After writing 0 via VIRTIO_TRANSPTQ_CTRL_STATUS_SET, the driver MUST wait
>> +for the success of the command before re-initializing the device.
>> +
>> +\subsection{Device Generation}\label{sec:Virtio Transport Options / Virtio Over Transport Virtqueue / Device Generation}
>> +
>> +When VIRTIO_F_TRANSPT_VQ_MDEV is negotiated,
>> +the device generation count can be read from the following commands:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_GENERATION    5
>> + #define VIRTIO_TRANSPTQ_CTRL_GENERATION_GET        0
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_GENERATION_GET command is used to get the device configuration generation count
>> +of the managed device. The command-in-data is the one byte device
>> +generation returned from the device. There's no command-out-data for
>> +this command.
>> +
>> +\devicenormative{\subsubsection}{Device Generation}{Virtio Transport Options / Virtio Over Transport Virtqueue / Device Generation}
>> +
>> +The management device MUST present a changed generation count after the driver
>> +has read a device-specific configuration value which has changed since
>> +any part of the device-specific configuration was last read.
> I know PCI says this too but I was never sure what this means ;)
yes, it is confusing, I will try to fix this both in this patch and in 
the PCI section.
>
>> +
>> +The management device MUST fail the device generation access if \field{device_id} is 0.
>> +
>> +\subsection{Device Specific Configuration}\label{sec:Virtio Transport Options /
>> +Virtio Over Transport Virtqueue / Device Specific Configuration}
>> +
>> +When VIRTIO_F_TRANSPT_VQ_MDEV is negotiated,
>> +the device config space contents of a managed device can be accessed through
>> +the following commands:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_CONFIG    6
>> +  #define VIRTIO_TRANSPTQ_CTRL_CONFIG_GET    0
>> +  #define VIRTIO_TRANSPTQ_CTRL_CONFIG_SET    1
>> +
>> +struct transportq_ctrl_mdev_config_get {
>> +       u32 offset;
>> +       u32 size;
>> +};
>> +
>> +struct transportq_ctrl_mdev_config_set {
>> +       u32 offset;
>> +       u32 size;
>> +       u8  data[];
>> +};
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_CONFIG_GET command is used to read data from the
>> +device configuration space.  The command-out-data is the \field{offset}
>> +from the start of the config space and the \field{size}
>> +of the data (as described in struct transportq_ctrl_mdev_config_get).
>> +The command-in-data is an array of the data that read from the config space.
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_CONFIG_SET command is used to write data to the device
>> +configuration space. The command-out-data contains the
>> +\field{offset} from the start of the config space, the \field{size} of the data and
>> +the \field{data} to be written (as described in struct transportq_ctrl_mdev_config_set).
>> +There's no command-in-data for this command.
> alignment limitations? I think what pci does here is good ...
I didn't get it, do you mean the alignment in struct 
transportq_ctrl_mdev_config_set?
I think it may be hard to place padding there, because it's \field{size} 
is dynamic.
>
>> +
>> +\devicenormative{\subsubsection}{Device Specific Configuration}{Virtio Transport
>> +Options / Virtio Over Transport Virtqueue / Device Specific Configuration}
>> +
>> +The management device MUST fail the device configuration space access
>> +if the driver wants to access the range which is outside the config space.
> wants? pls be more specific.
I will remove this "wants to"
>
>> +
>> +The management device MUST fail the device configuration space access
>> +if \field{device_id} is 0.
>
> 0 seems to just be for the get command. Let's get rid of it
> and then we don't need it?
not only for the get command, there can be set commands, like
set some fields of the device config space, or set vq size.

The management device has it's own transport like PCI,
so here we don't allow get/set the device config space through the 
transport vq
>
>> +
>> +\subsection{MSI Configuration}\label{sec:Virtio Transport Options / Virtio Over
>> +Transport Virtqueue / MSI Configuration}
>> +
>> +When VIRTIO_F_TRANSPT_VQ_MDEV is negotiated,
>> +the MSI entries of a managed device are set through the following command:
> wait what? there are msi entries? what are they? we need a chapter
> about signalling.
I will add a new section to explain how the managed devices do interrupts
>
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_MSI    7
>> + #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_SET        0
>> + #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_ENABLE     1
>> + #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_MASK       2
>> + #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_SET    3
>> + #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_ENABLE 4
>> + #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_MASK   5
>
> I think all these SET things really need GET commands too,
> so driver can query device for how it's been configured.
sure
>
>
>> +
>> +struct transportq_ctrl_mdev_msi_vq_config {
>> +       u16 queue_index;
>> +       u64 address;
>> +       u32 data;
>> +};
>> +
>> +struct transportq_ctrl_mdev_msi_vq_enable {
>> +       u16 queue_index;
>> +       u8 enable;
>> +};
>> +
>> +struct transportq_ctrl_mdev_msi_vq_mask {
>> +       u16 queue_index;
>> +       u8 mask;
>> +};
>> +
>> +struct transportq_ctrl_mdev_msi_config {
>> +       u64 address;
>> +       u32 data;
>> +};
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_SET command is used to set the MSI entry for a
>> +specific virtqueue. The command-out-data is the \field{queue_index} and
>> +the MSI \field{address} and \field{data} (as described in struct transportq_ctrl_mdev_msi_vq_config).
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_ENABLE command is used to enable or disable
>> +the MSI interrupt for a specific virtqueue. The command-out-data is the
>> +\field{queue_index} and an \field{enable} which representing ENABLE or DISABLE the MSI.
>> +(as described in struct transportq_ctrl_mdev_msi_vq_enable).
> and what happens if it's disabled? is the interrupt remembered until
> reenabled? or discarded?
once disable, it won't send any MSI interrupts anymore.
>
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_ENABLE     1
>> +#define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_DISABLE    0
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_MASK command is used to mask or unmask the
>> +MSI interrupt for a specific virtqueue. The command-out-data is the
>> +\field{queue_index} and the \field{mask} status
>> +(as described in struct transportq_ctrl_mdev_msi_vq_mask).
> how is mask/unmask different from enable/disable?
mask/unmask means the device should store/re-generate the pending MSI 
interrupts

Maybe I should remove this mask/unmask, only enable/disable is enough.
>
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_MASK       0
>> +#define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_UNMASK     1
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_SET command is used to set the MSI entry
>> +for the config interrupt. The command-out-data is the MSI \field{address} and
>> +\field{data} (as described in struct transportq_ctrl_mdev_msi_config).
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_ENABLE command is used to enable and disable
>> +MSI for config space. The command-out-data is an u8 byte which representing
>> +ENABLE or DISABLE the config MSI.
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_MSI_CFG_ENABLE     1
>> +#define VIRTIO_TRANSPTQ_CTRL_MSI_CFG_DISABLE    0
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_MASK command is used to mask and unmask the
>> +MSI interrupt for config space. The command-out-data is an u8 byte which representing
>> +the mask status.
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_MSI_CFG_MASK      0
>> +#define VIRTIO_TRANSPTQ_CTRL_MSI_CFG_UNMASK    1
>> +\end{lstlisting}
>> +
>> +There's no command-in-data for all the above MSI commands.
>> +
>> +\devicenormative{\subsubsection}{MSI Configuration}{Virtio Transport Options / Virtio
>> +ver Transport Virtqueue / MSI Configuration}
>> +
>> +The managed device MUST record the pending MSI interrupts when masking, and
>> +re-generate the pending MSI interrupts when unmasking.
>> +
>> +The managed device MUST disable the MSI for both virtqueues and config space
>> +upon reset.
>> +
>> +\drivernormative{\subsubsection}{MSI Configuration}{Virtio Transport Options / Virtio
>> +Over Transport Virtqueue / MSI Configuration}
>> +
>> +The driver MUST allocate transport or platform specific MSI entries
>> +for both virtqueues and config space if it wants to use interrupts.
>> +
>> +The driver MAY choose to disable the MSI if polling mode is used.
>> +
>> +\subsection{Virtqueue Address}\label{sec:Virtio Transport Options / Virtio Over
>> +Transport Virtqueue / Virtqueue Address}
>> +
>> +When VIRTIO_F_TRANSPT_VQ_MDEV is negotiated,
>> +the addresses of a specific virtqueue are accessed through the following command:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_VQ_ADDR    8
>> + #define VIRTIO_TRANSPTQ_CTRL_VQ_ADDR_SET       0
>> +
>> +struct transportq_ctrl_mdev_vq_addr {
>> +       u16 queue_index;
>> +       u64 descriptor_area;
>> +       u64 device_area;
>> +       u64 driver_area;
>> +};
>> +\end{lstlisting}
>> +
>> +The command-out-data is the \field{queue_index}, the addresses of \field{device_area},
>> +\field{descriptor_area} and \field{driver_area} (as described in struct
>> +transportq_ctrl_mdev_vq_addr. There's no command-in-data.
>> +
>> +\devicenormative{\subsubsection}{Virtqueue Address}{Virtio Transport Options / Virtio
>> +Over Transport Virtqueue / Virtqueeu Address}
>> +
>> +The management device MUST fail the commands of class
>> +VIRTIO_TRANSPTQ_CTRL_VQ_ADDR if \field{device_id} is 0.
>> +
>> +The management device MUST fail the commands of class
>> +VIRTIO_TRANSPTQ_CTRL_VQ_ADDR if \field{queue_index} is invalid.
>> +
>> +\subsection{Virtqueue Status}\label{sec:Virtio Transport Options / Virtio Over
>> +Transport Virtqueue / Virtqueue Status}
>> +
>> +When VIRTIO_F_TRANSPT_VQ_MDEV is negotiated,
>> +virtqueue status is accessed through the following command:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE    9
>> + #define VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET       0
>> + #define VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_GET       1
>> +
>> +struct transportq_ctrl_mdev_vq_status_set {
>> +  u16 queue_index;
>> +  u8 status;
>> +
>> +#define VIRTIO_TRANSPTQ_VQ_ENABLE     1
>> +#define VIRTIO_TRANSPTQ_VQ_DISABLE    0
>> +
>
> padding to align things to 64 bit pls.
sure
>
>> +};
>> +
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET command is used to set the status of a
>> +specific virtqueue. The command-out-data is the \field{queue_index} and the
>> +\field{status} representing ENABLE or DISABLE that is set to the virtqueue
>> +(as described in struct virtio_transportq_ctrl_vq_status_set).
>> +There's no command-in-data.
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_GET is used to get the status of a
>> +specific virtqueue. The command-out-data is the queue
>> +index. The command-in-data is the virtqueue status.
>> +
>> +\devicenormative{\subsubsection}{Virtqueue Status}{Virtio Transport Options / Virtio
>> +Over Transport Virtqueue / Virtqueue Status}
>> +
>> +When disabled, the managed device MUST stop processing requests from
>> +this virtqueue.
>> +
>> +The management device MUST present a 0 via
>> +VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_GET upon a reset of the managed device.
>> +
>> +The management device MUST fail the virtqueue status access if
>> +\field{device_id} is 0.
>> +
>> +The management device MUST fail the virtqueue status access if
>> +the queue_index is invalid.
>> +
> invalid how?
Like queue_index == 5, but only 4 queues. I will rework on this to be 
"out-of-range invalid"
>
>> +\drivernormative{\subsubsection}{Virtqueue Status}{Virtio Transport Options / Virtio
>> +Over Transport Virtqueue / Virtqueue Status}
>> +
>> +The driver MUST configure other virtqueue fields before enabling
>> +the virtqueue with VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET.
>> +
>> +\subsection{Virtqueue Size}\label{sec:Virtio Transport Options / Virtio Over
>> +Transport Virtqueue / Virtqueue Size}
>> +
>> +When VIRTIO_F_TRANSPT_VQ_MDEV is negotiated,
>> +virtqueue size is accessed through the following command:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_VQ_SIZE    10
>> + #define VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_SET       0
>> + #define VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_GET       1
>> +
>> +struct transportq_ctrl_mdev_vq_size_set {
>> +       u16 queue_index;
>> +       u16 size;
>> +};
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_SET command is used to set the virtqueue
>> +size. The command-out-data is the \field{queue_index} and the \field{size}
>> +of the virtqueue (as described in struct transportq_ctrl_mdev_vq_size_set).
>> +There's no command-in-data.
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_GET command is used to get the virtqueue
>> +size. On reset, the maximum queue size supported by the device is
>> +returned. The command-out-data is an u16 of the queue index. The
>> +command-in-data is an u16 of the queue size of the virtqueue.
>> +
>> +\devicenormative{\subsubsection}{Virtqueue Status}{Virtio Transport Options / Virtio
>> +Over Transport Virtqueue / Virtqueue Size}
>> +
>> +The management device MUST fail the virtqueue size access if
>> +\field{device_id} is 0.
>> +
>> +The management device MUST fail the virtqueue size access if
>> +the queue index is invalid.
>> +
>> +\subsection{Virtqueue Notification}\label{sec:Virtio Transport Options / Virtio
>> +Over Transport Virtqueue / Virtqueue Notification}
>> +
>> +When VIRTIO_F_TRANSPT_VQ_MDEV is negotiated,
>> +the virtqueue notification area information can be get through the following commands:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY    11
>> + #define VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET          1
>> +
>> +struct transportq_ctrl_mdev_vq_notification_area {
>> +       u64 address;
>> +       u64 size;
>> +};
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET is used to get the transport
>> +specific address area that can be used to notify a virtqueue. The
>> +command-out-data is an u16 of the queue index. The command-in-data
>> +contains the \field{address} and the \field{size}
>> +of the notification area (as described in struct transportq_ctrl_mdev_vq_notification_area).
>> +
>> +\devicenormative{\subsubsection}{Virtqueue Notification}{Virtio Transport Options /
>> +Virtio Over Transport Virtqueue / Virtqueue Notification}
>> +
>> +The management device MUST fail the virtqueue notification area information
>> +access if \field{device_id} is 0.
>> +
>> +The management device MUST fail the virtqueue notification area information
>> +access if the queue index is invalid.
>> +
>> +\drivernormative{\subsubsection}{Virtqueue Notification}{Virtio Transport Options /
>> +Virtio Over Transport Virtqueue / Virtqueue Notification}
>> +
>> +The driver MAY choose to notify the virtqueue by writing the queue
>> +index at address \field{address} which is fetched from the
>> +VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET command.
>> +
>> +\subsection{Virtqueue State}\label{sec:Virtio Transport Options / Virtio
>> +Over Transport Virtqueue / Virtqueue State}
>> +
>> +When VIRTIO_F_TRANSPT_VQ_MDEV is negotiated,
>> +the virtqueue state is accessed through the following commands:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_VQ_STATE            12
>> + #define VIRTIO_TRANSPTQ_CTRL_VQ_STATE_SET       0
>> + #define VIRTIO_TRANSPTQ_CTRL_VQ_STATE_GET       1
>> +\end{lstlisting}
>> +
>> +\subsubsection{Split Virtqueue State}\label{sec:Virtio Transport Options / Virtio
>> +Over Transport Virtqueue / Virtqueue State / Split Virtqueue State}
>> +
>> +\begin{lstlisting}
>> +struct transportq_ctrl_mdev_split_vq_state_set {
>> +    u16 queue_index;
>> +    u16 avail_index;
>> +};
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_VQ_STATE_SET command can be used to set the state of a
>> +split virtqueue. The command-out-data contains the \field{queue_index} and the
>> +available index for the virtqueue (as described in struct transportq_ctrl_mdev_split_vq_state_set).
>> +There is no command-in-data.
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_VQ_STATE_GET command can be  used to get the state of a
>> +split virtqueue. The command-out-data is the queue index, the command-in-data is the available index of the virtqueue.
>> +
>> +\subsubsection{Packed Virtqueue State}\label{sec:Virtio Transport Options / Virtio
>> +Over Transport Virtqueue / Virtqueue State / Packed Virtqueue State}
>> +
>> +\begin{lstlisting}
>> +struct transportq_ctrl_mdev_packed_vq_state_set {
>> +    u16 queue_index;
>> +    u16 avail_counter;
>> +    u16 avail_index;
>> +    u16 used_counter;
>> +    u16 used_index;
>> +};
>> +
>> +struct transportq_ctrl_mdev_packed_vq_state_get {
>> +    u16 avail_counter;
>> +    u16 avail_index;
>> +    u16 used_counter;
>> +    u16 used_index;
>> +};
> reuse the structure here to avoid duplication?
There is a u16 queue_index in struct 
transportq_ctrl_mdev_packed_vq_state_set.
And I think it may be a little messy if we define a struct in another struct
to reuse struct transportq_ctrl_mdev_packed_vq_state_get
>
>
>> +\end{lstlisting}
>> +
>> +The state of a packed virtqueue includes :\\
>> +\field{avail_counter}: last driver ring wrap counter observed by device.\\
>> +\field{avail_index}: virtqueue available index.\\
>> +\field{used_counter}: device ring wrap counter.\\
>> +\field{used_index}: virtqueue used index.
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_VQ_STATE_SET command can be used to set the state of a packed virtqueue.
>> +The command-out-data contains the \field{queue_index}, \field{avail_counter}, \field{avail_index},
>> +\field{used_counter} and \field{used_index} for the virtqueue
>> +(as described in transportq_ctrl_mdev_packed_vq_state_set).
>> +There is no command-in-data.
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_VQ_STATE_GET command can be used to get the state of a packed virtqueue.
>> +The command-out-data is the queue index, the command-in-data contains \field{avail_counter}, \field{avail_index},
>> +\field{used_counter} and \field{used_index} of the virtqueue
>> +(as described in transportq_ctrl_mdev_packed_vq_state_set).
>> +
>> +\devicenormative{\subsubsection}{Virtqueue State}{Virtio Transport Options /
>> +Virtio Over Transport Virtqueue / Virtqueue State}
>> +
>> +The management device MUST fail the virtqueue index access if \field{device_id} is 0.
>> +
>> +The management device MUST fail the virtqueue index access if \field{queue_index} is invalid.
>> +
>> +\subsection{Virtqueue ASID}\label{sec:Virtio Transport Options / Virtio Over
>> +Transport Virtqueue / Virtqueue ASID}
>> +
>> +When VIRTIO_F_TRANSPT_VQ_MDEV is negotiated, the address space id of a virtqueue
>> +could be set through the following command:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_VQ_ASID        13
>> + #define VIRTIO_TRANSPTQ_CTRL_VQ_ASID_SET   1
>> +
>> +struct transportq_ctrl_mdev_vq_asid_set {
>> +	u16 queue_index;
>> +	u32 asid;
>> +};
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_VQ_ASID_SET command is used to set the address space id(\field{asid})
>> +of a virtqueue.
>> +
>> +The address space id is an identifier of a memory space which is used to convey the address space targeted by the
>> +memory accesses, and to distinguish memory accesses performed by different virtqueues
>> +
>> +One example of the address space id is PASID (Process Address Space Identifier) which is
>> +defined in \hyperref[intro:PCIe]{[PCIe]} specification.
>> +
>> +The command-out-data of VIRTIO_TRANSPTQ_CTRL_VQ_ASID_SET command is the \field{queue_index}
>> +and the address space id \field{asid}
>> +(as described in struct transportq_ctrl_mdev_vq_asid_set).
>> +
>> +\devicenormative{\subsubsection}{Virtqueue ASID}{Virtio Transport Options /
>> +Virtio Over Transport Virtqueue / Virtqueue ASID}
>> +
>> +Once a virtqueue has been set an asid, it MUST perform any memory accesses with the asid.
>> +
>> +The management device MUST fail the virtqueue index access if \field{device_id} is 0.
>> +
>> +The management device MUST fail the virtqueue index access if \field{queue_index} is invalid.
>> +
>> +\subsection{Virtqueue Reset}\label{sec:Virtio Transport Options / Virtio Over
>> +Transport Virtqueue / Virtqueue Reset}
>> +
>> +When VIRTIO_F_TRANSPT_VQ_MDEV and VIRTIO_F_RING_RESET are negotiated,
>
> wait this is a mess. VIRTIO_F_TRANSPT_VQ_MDEV is on management device.
> VIRTIO_F_RING_RESET is I assume on the managed one?
Yes, there should only be VIRTIO_F_TRANSPT_VQ_MDEV negotiated with the 
management device,
I will remove this VIRTIO_F_RING_RESET requirement because it is the 
guest negotiated feature.
>
>
>> +a virtqueue can be reset through the following command:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_VQ_RESET        14
>> + #define VIRTIO_TRANSPTQ_CTRL_VQ_DO_RESET    1
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_VQ_DO_RESET command is used to reset a virtqueue.
>> +The command-out-data is the virtqueue index, there is no command-in-data.
>> +
>> +\devicenormative{\subsubsection}{Virtqueue Reset}{Virtio Transport Options /
>> +Virtio Over Transport Virtqueue / Virtqueue Reset}
>> +
>> +The management device MUST fail VIRTIO_TRANSPTQ_CTRL_VQ_RESET if
>> +\field{device_id} is 0.
>> +
>> +The management device MUST fail VIRTIO_TRANSPTQ_CTRL_VQ_RESET if
>> +the virtqueue index is invalid.
>> +
>> +The managed device MUST stop consuming the descriptors in the virtqueue once reset it.
>> +
>> +The managed device MUST present default states of a virtqueue after reset it.
>> +
>> +\drivernormative{\subsubsection}{Virtqueue Reset}{Virtio Transport Options /
>> +Virtio Over Transport Virtqueue / Virtqueue Reset}
>> +
>> +After reseting a virtqueue, the driver MUST wait until the reset is successfully
>> +done (by verifying the virtqueue state has been reset to default)
> verifying how? why isn't completion of the command sufficient?
Yes, I will use the completion of the command to indicate the reset is done.
>
>> +before re-enabling it.
>> +
>>   \chapter{Device Types}\label{sec:Device Types}
>>   
>>   On top of the queues, config space and feature negotiation facilities
>> -- 
>> 2.35.3
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>

