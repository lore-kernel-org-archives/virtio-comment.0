Return-Path: <virtio-comment-return-3218-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 253EE9867DB
	for <virtio-comment@lists.oasis-open.org>; Thu,  7 Jul 2022 10:33:13 +0000 (UTC)
Message-ID: <d69e53d7-501f-9718-1a41-f7a576ff1eb9@intel.com>
Date: Thu, 7 Jul 2022 18:32:59 +0800
MIME-Version: 1.0
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
References: <20220704074142.80791-1-lingshan.zhu@intel.com>
 <CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3weWNwweO2Q@mail.gmail.com>
In-Reply-To: <CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3weWNwweO2Q@mail.gmail.com>
Subject: Re: [virtio-comment] Re: [PATCH] Introduce virtio virtual device and
 transport vq
Content-Type: multipart/alternative;
 boundary="------------M0GGyuIfbxdPzPmmaucit4JO"
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, eperezma <eperezma@redhat.com>, Cindy Lu <lulu@redhat.com>, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com
List-ID: <virtio-comment.lists.oasis-open.org>

--------------M0GGyuIfbxdPzPmmaucit4JO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable



On 7/5/2022 5:27 PM, Jason Wang wrote:
> On Mon, Jul 4, 2022 at 3:44 PM Zhu Lingshan<lingshan.zhu@intel.com>  wrot=
e:
>> This patch introduces a new device type: virtio virtual device.
>> An virtio virtual device example is virtio based
>> Scalable I/O Virtualization devices.
>>
>> This commit also introduces a new transport other than PCI and MMIO - th=
e
>> transport virtqueue.
>>
>> This transport is useful for implementing virtual devices with a limited
>> transport specific resources or presenting the virtual device in a
>> transport independent way.
>>
>> This means, all the basic device facilities are provided solely via
>> the the transport virtqueue. Additionally, the transport virtqueue is al=
so in
> Two "the".
will fix
>> charge of the creating and destroying of the virtual device.
>>
>> With the help of the transport virtqueue, the presenting of the virtual
>> device is done via the co-operation between the management device and
>> its driver.
> Having a dedicated virtqueue is probably fine but there is some
> overlap at the description of management/managed device with the admin
> virtqueue proposal from Max. Need to consider a way to unify the
> definition at least.
OK, I can re-phrase this part
>> Signed-off-by: Jason Wang<jasowang@redhat.com>
>> Signed-off-by: Zhu Lingshan<lingshan.zhu@intel.com>
>> ---
>>   content.tex      | 621 ++++++++++++++++++++++++++++++++++++++++++++++-
>>   introduction.tex |   3 +
>>   2 files changed, 622 insertions(+), 2 deletions(-)
>>
>> diff --git a/content.tex b/content.tex
>> index 3aeb4a4..1cdb683 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -2784,6 +2784,619 @@ \subsubsection{Resetting Devices}\label{sec:Virt=
io Transport Options / Virtio ov
>>   In order to reset a device, a driver sends the
>>   CCW_CMD_VDEV_RESET command.
>>
>> +\section{Virtio Over Transport Virtqueue}\label{sec:Virtio Transport Op=
tions Virtio Over Transport Virtqueue}
>> +Sometimes it's hard to implement the device in a transport specific met=
hod.
>> +One example is that a physical device may try to present multiple virtu=
al devices
>> +with limited transport specific resources.
>> +Another example is to implement virtual devices which are transport ind=
ependent.
>> +In those cases, the transport virtqueue provided by the management devi=
ce could be used to replace
>> +the transport specific method to implement the virtual device.
>> +Then the presenting of the virtual device is done through the cooperati=
on between
>> +the transport virtqueue and the management device's driver.
>> +
>> +Feature bit VIRTIO_F_TRNSPT_VQ indicates that the device offers a trans=
port virtqueue.
>> +
>> +\subsection{Basic Concepts}\label{sec:Virtio Transport Options / Virtio=
 over Transport Virtqueue / Basic Concepts}
>> +
>> +All transport virtqueue commands are of the following form:
>> +
>> +\begin{lstlisting}
>> +struct virtio_transportq_ctrl {
>> +        u64 device_id;
>> +        u16 class;
>> +        u16 command;
>> +        u32 length_out;
>> +        u8 command-out-data[];
>> +        u32 length_in;
>> +        u32 ack;
>> +        u8 command-in-data[];
> Any reason we need length_in/length_out (we have length in
> descriptors)? FYI, we don't have them for ctrl virtqueue of networking
> devices.
OK, I can remove length_in and length_out, just pick the length from the=20
descriptors.
>> +};
>> +
>> +/* ack values */
>> +#define VIRTIO_TRANSPTQ_OK     0
>> +#define VIRTIO_TRANSPTQ_EIO    1
>> +#define VIRTIO_TRANSPTQ_EAGAIN 11
>> +#define VIRTIO_TRANSPTQ_EBUSY  16
>> +#define VIRTIO_TRANSPTQ_EINVAL 22
>> +#define VIRTIO_TRANSPTQ_ERR    255
>> +\end{lstlisting}
>> +
>> +The \field{device_id}, \field{class}, \field{command}, \field{length_ou=
t} and
>> +\field{command-out-data} are set by the management driver,
>> +and the device sets the \field{ack}, \field{length_in} and \field{comma=
nd-in-data}.
>> +
>> +\field{device_id} is an UUID to address a virtio virtual device,
>> +The \field{device_id} value 0 is used for identify the management devic=
e itself
> identifying?
yes, will fix
>> +
>> +\subsubsection{The managment devices}\label{sec:Virtio Transport Option=
s / Virtio over Transport Virtqueue / Basic Concepts / The management devic=
es}
> s/managment/management/
will fix
>> +A device that offers a transport virtqueue (via feature VIRTIO_F_TRNSPT=
_VQ)
>> +is the management device of the virtual devices which are the managed d=
evices.
> Not a native speaker but I couldn't parse this sentence.
OK, I can re-phrase this one.
>> +
>> +For example, a PCIe PF with a transport virtqueue is a management devic=
e.
>> +
>> +\subsubsection{The virtual devices}\label{sec:Virtio Transport Options =
/ Virtio over Transport Virtqueue / Basic Concepts / The virtual devices}
> I think to be consistent, per Michael's suggestion, we should use
> "managed" here which is better than "virtual".
do you mean replace all "virtual device" with "managed device" in this=20
patch?
We can emphasize a virtual device is a type of managed device here,=20
however "virtual device"
implies that the device is a logical device may not has a dedicated=20
physical transport,
like SIOV devices=20
(https://www.opencompute.org/documents/ocp-scalable-io-virtualization-techn=
ical-specification-revision-1-v1-2-pdf).=20

>> +A device that is created through a transport virtqueue which is offered=
 by a management
>> +device is a virtual device. Virtual devices are logical devices, manage=
d by the management devices,
>> +they usually don't have a dedicated physical transport.
>> +
>> +For example, a Scalable I/O Virtualization \hyperref[intro:SIOV]{[SIOV]=
} device which is created and managed through a transport virtqueue of
>> +a management device is a virtual device.
> Maybe we can remove the "is a virtual device" here, since we use "For
> example" in the subsection of "The virtual device"
sure
>> +
>> +\devicenormative{\subsubsection}{Basic Concepts}{Virtio Transport Optio=
ns / Virtio Over Transport Virtqueue / Basic Concepts}
>> +The management device MUST offer feature bit VIRTIO_F_TRNSPT_VQ and a t=
ransport virtqueue as a device specific virtqueue.\\
>> +The virtual devices MUST not offer VIRTIO_F_TRNSPT_VQ feature.\\
> Is this a must? What's the value of prohibiting the nesting of the
> management device?
Of course it is not a must, I mean it is possible to implement=20
VIRTIO_F_TRANSPT_VQ for a virtual device.
But I am not sure whether it is meaningful to have nested virtual=20
devices, creating virtual device on
another virtual device, both layers are logical devices.
And this introduce extra complexities for hardware implementation and=20
resource management,
like usually don't create VFs from another VF.
>> +The management device MUST fail all commands against the transport virt=
queue if VIRTIO_F_TRNSPT_VQ is not negotiated.
>> +
>> +\drivernormative{\subsubsection}{Basic Concepts}{Virtio Transport Optio=
ns / Virtio Over Transport Virtqueue / Basic Concepts}
>> +The management driver MUST not send any commands against the transport =
virtqueue if VIRTIO_F_TRNSPT_VQ is not negotiated.
>> +
>> +\subsection{Virtual Devices Discovery}\label{sec:Virtio Transport Optio=
ns /Virtio Over Transport Virtqueue / Virtual Devices Discovery}
>> +
>> +The management device is discovered through its own transport and devic=
e specific method.
>> +Virtual devices are created and discovered via the transport virtqueue.
>> +
>> +\subsection{Transport Virtqueue Features}\label{sec:Virtio Transport Op=
tions /Virtio Over Transport Virtqueue / Transport Virtqueue Features}
>> +
>> +Feature bit VIRTIO_F_TRNSPT_VQ_VDEV indicates that the virtual devices =
are created, configured
>> +and destroyed through the transport virtqueue.
>> +This means the transport virtqueue is the transport for the virtual dev=
ices.
>> +
>> +Feature bit VIRTIO_F_TRNSPT_VQ_VDEV depends on VIRTIO_F_TRNSPT_VQ
>> +
>> +\devicenormative{\subsubsection}{Transport Virtqueue Features}{Virtio T=
ransport Options / Virtio Over Transport Virtqueue / Transport Virtqueue Fe=
atures}
>> +The management device MUST not accept VIRTIO_F_TRNSPT_VQ_VDEV if VIRTIO=
_F_TRNSPT_VQ is not negotiated.
>> +
>> +\subsection{Device Management}\label{sec:Virtio Transport Options / Vir=
tio Over Transport Virtqueue / Device Management}
>> +
>> +When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
>> +virtual devices must be created and destroyed through the transport vir=
tqueue.
>> +
>> +\begin{lstlisting}
>> +struct virtio_transportq_ctrl_vdev_attribute {
>> +       u32 virtio_device_id;
>> +       u32 asid;
>> +       u8 config[];
>> +};
>> +
>> +#define virtio_transportq_ctrl_vdev    1 (class)
>> + #define virtio_transportq_ctrl_vdev_CREATE        0 (command)
>> + #define virtio_transportq_ctrl_vdev_DESTROY       1 (command)
>> +\end{lstlisting}
>> +
>> +The virtio_transportq_ctrl_vdev_CREATE command is used to create a virt=
ual device.
>> +The command-out-data for VIRTIO_TRANSPTQ_CTRL_CREATE is the virtio devi=
ce id (\field{virtio_device_id}),
>> +the address space id (\field{asid})
> We need to be verbose here. Is this a transport specific identifier or
> a device specific identifier?
This asid field is an id for the device, it should be the PASID. I will=20
add more explanations here.
>
> I also wonder if this is the best place for this. To me, it looks more
> suitable to have a dedicated command to configure it before DRIVER_OK
> like virtqueue address. Then we can configure it per virtqueue per
> device with more flexibility.
I understand the point, this can gives the device more flexibility for sure=
.
It is the guest driver initialize the device. Device status and vq=20
configs are usually set by the guest driver,
and the guest driver is not aware of the asid, it is the host side=20
setting the asid.
So shall we set the asid upon DRIVER_OK?
And how to decide whether the device should use a device-global asid or=20
a per-vq asid,
or even hybrid? I think this is transparent to the guest
>
>> +and device specific configuration (\field{config}) for creating the vir=
tual device.
>> +When succeed, the device returns an u64 as a unique identifier of the c=
reated virtual device in command-in-data.
>> +
>> +The field \field{config} is device type specific. E.g., for virtio-net,=
 it should follow the struct virtio_net_config
> I think we need a dedicated section to describe the transport
> virtqueue support for virtio-net.
More hints for what should be discussed in the section?
I see all the descriptions for virtio device types are in chapter 5=20
Device Types,
other transports don't have their own sections for the device types, and=20
chapter 5 discussed
that in general.

Here we take virtio-net device as an example to explain the filed config=20
contents.
>
>> +in section \ref{sec:Device Types / Network Device / Device configuratio=
n layout}
>> +
>> +The virtio_transportq_ctrl_vdev_DESTROY command is used to destroy a
>> +virtual device which is identified by its 64bit identifier
>> +\field{virtual_device_id}. There's no command-in-data for
>> +VIRTIO_TRANSPTQ_CTRL_DESTROY command.
>> +
>> +\devicenormative{\subsubsection}{Device Management}{Virtio Transport Op=
tions / Virtio Over Transport Virtqueue / Device Management}
>> +
>> +The management device MUST fail the virtio_transportq_ctrl_vdev_CREATE =
if
>> +\field{device_id} is not 0.
> Let's use VIRTIO_TRANSPTQ_OK instead of the magic number here.
this zero is the filed device_id =3D 0, means identifying the management=20
device.
And I found I have mixed up the upper and lower cases in the commands, they
should all be upper cases, I will fix this.
>
>> +
>> +The management device MUST fail the virtio_transportq_ctrl_vdev_DESTROY=
 if
>> +\field{device_id} is 0.
> Same here.
>
>> +
>> +All virtual devices MUST be created via the transport virtqueue if the =
management
>> +device offers VIRTIO_F_TRNSPT_VQ_VDEV.
> Does this imply no pre-created virtual devices? If this is true, we
> don't need a dedicated feature bit (VIRTIO_F_TRNSPT_VQ_VDEV).
There can be pre-created virtual devices, in the following sections,

struct mgmt_dev_avail_res{}, if min_vdev_vqs =3D=3D max_vdev_vqs, means the=
 management device
only supports creating virtual devices with fixed capabilities, this kind o=
f virtual devices
can be pre-created. Like the slab allocator, vendors can pre-create the dev=
ice. Then when the management
device receiving the VDEV_CREATE command,  it can just pick up a free virtu=
al device, and return the
virtual device.

>
> The bit only makes sense for the case when some managed(virtual)
> devices are pre-created like initial_vfs in SR-IOV. If we allow
> pre-creation, we need commands to discover them.

I think we need the feature bit VIRTIO_F_TRNSPT_VQ_VDEV, this feature bit i=
ndicates that the transport
virtqueue is the transport layer for the virtual devices, like PCI for a vi=
rtio PCI hardware.
So, not only create, we use the transport virtqueue to config the device as=
 well.

And if the virtual devices are pre-created, we can just send the create com=
mand, and the management device
can find a available device for us, this is also discovery.

>
>> +
>> +\drivernormative{\subsubsection}{Driver Management}{Virtio Transport Op=
tions / Virtio Over Transport Virtqueue / Device Management}
>> +
>> +The management driver MUST use 0 as \field{device_id} for
>> +virtio_transportq_ctrl_vdev_CREATE command.
>> +
>> +\subsection{Available resource of the management device}\label{sec:Virt=
io Transport Options / Virtio Over Transport Virtqueue / Available resource=
 of the management devic}
>> +When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
>> +statistical information of available resource of the management device =
could be fetched
>> +by the following command:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_AVAIL_RES    2
>> + #define VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET     0
> Nit, I think this command should come first, mgmt need to query this
> before creating devices.
sure, I can re-order the commands.
>
>> +\end{lstlisting}
>> +
>> +VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET command is used to get the statstica=
l information of available
> s/statstical/statistical/
will fix
>
>> +resource of the management device. There is no command-out-data for VIR=
TIO_TRANSPTQ_CTRL_AVAIL_RES_GET
>> +command. The management device fills command-in-data in the following f=
ormat:
>> +
>> +\begin{lstlisting}
>> +struct mgmt_dev_avail_res{
>> +        /* The number of total remaining virtqueus of the management de=
vice */
> Should be virtqueues.
>
> Actually the description here is confusing, something like this might be =
better
>
> "The number of total remaining virtqueues for the managed(virtual) device=
s */
will fix this.
>
>> +        u16 num_avail_vqs;
>> +        /* The minimal number of virtqueues of the virtual devices */
> "of a virtual device"?
will fix
>
>> +        u16 min_vdev_vqs;
>> +        /* The maximum number of virtqueues of the virtual devices */
>> +        u16 max_vdev_vqs;
>> +        /* The number of virtual devices that can be created with min_v=
dev_vqs virtqueues.
>> +         * This number may not equal to num_avail_vqs divided by min_vd=
ev_vqs due to
>> +         * the limitations of other resource
>> +         */
>> +        u16 num_avail_vdev;
>> +};
>> +\end{lstlisting}
>> +
>> +If \field{min_vdev_vqs} equals to \field{min_vdev_vqs}, that means the =
management device
>> +can only create virtual devices with a fixed number of virtqueues
>> +
>> +\devicenormative{\subsubsection}{Available resource of the management d=
evice}{Virtio Transport Options /
>> +Virtio Over Transport Virtqueue / Available resource of the management =
device}
>> +The management device MUST fail the VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET =
command if \field{device_id} is not 0
>> +
>> +\drivernormative{\subsubsection}{Available resource of the management d=
evice}{Virtio Transport Options /
>> +Virtio Over Transport Virtqueue / Available resource of the management =
device}
>> +The management driver MUST use 0 as \field{device_id} for
>> +VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET command.
>> +
>> +\subsection{Features Negotiation}\label{sec:Virtio Transport Options / =
Virtio
>> +Over Transport Virtqueue / Features Negotiation}
>> +
>> +When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
>> +the feature negotiation of virtual devices is done by the
>> +following commands:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_FEAT   3
>> + #define VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET        0
>> + #define VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_SET        1
>> + #define VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_GET        2
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET is to get the features offered
>> +by a virtual device.
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_SET is for driver to accept featur=
e
>> +bits offered by the virtual device.
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_GET is to get the features accepte=
d
>> +by both the virtual driver and the device.
>> +
>> +The features is 64 bits mask of the virtio features bit. For
>> +VIRTIO_TRANSPTQ_CTRL_DRIVER_SET, the feature is passed to the device
>> +through command-out-data. For VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET and
>> +VIRTIO_TRANSPTQ_CTRL_DRIVER_GET the feature is returned for the device
>> +through command-in-data.
>> +
>> +\devicenormative{\subsubsection}{Features Negotiation}{Virtio Transport=
 Options /
>> +Virtio Over Transport Virtqueue / Features Negotiation}
> Can one of the above three commands fail? If yes, we need to document
> the behaviour.
can the ack values cover this? Like if failed to read the device feature=20
bits due to IO errors,
it can set this EIO below. Or do I miss something?

+/* ack values */
+#define VIRTIO_TRANSPTQ_OK     0
+#define VIRTIO_TRANSPTQ_EIO    1
+#define VIRTIO_TRANSPTQ_EAGAIN 11
+#define VIRTIO_TRANSPTQ_EBUSY  16
+#define VIRTIO_TRANSPTQ_EINVAL 22
+#define VIRTIO_TRANSPTQ_ERR    255
+\end{lstlisting}

>
>> +
>> +The management device MUST fail VIRTIO_TRANSPTQ_F_CTRL_FEAT class for t=
he
>> +command that use 0 as its \field{device_id}.
>> +
>> +\drivernormative{\subsubsection}{Features Negotiation}{Virtio Transport=
 Options /
>> +Virtio Over Transport Virtqueue / Features Negotiation}
>> +
>> +The management driver MAY mediate between the feature negotiation
>> +request of the virtual devices and the transport virtqueue. E.g when
>> +offering features to the virtual device, the management driver MAY
>> +exclude some features in order to limit the behaviour of the virtual
>> +device.
>> +
>> +\subsection{Device Status}\label{sec:Virtio Transport Options / Virtio =
Over
>> +Transport Virtqueue / Device Status}
>> +
>> +When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
>> +the status of virtual device is accessed by the following
>> +commands:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_STATUS    4
>> + #define VIRTIO_TRANSPTQ_CTRL_STATUS_SET        0
>> + #define VIRTIO_TRANSPTQ_CTRL_STATUS_GET        1
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_STATUS_SET is used to set the device status of
>> +a virtual device here. The command-out-data is the one byte status
>> +to set to the device. There's no command-in-data for this command.
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_STATUS_GET is used to get the device status of
>> +a virtual device. The command-in-data is the one byte status
>> +returned from the device. There's no command-out-data for this
>> +command.
>> +
>> +\devicenormative{\subsubsection}{Device Status}{Virtio Transport Option=
s / Virtio
>> +Over Transport Virtqueue / Device Status}
>> +
>> +The management device MUST reset the virtual device when 0
>> +is written via VIRTIO_TRANSPTQ_CTRL_STATUS_SET, the success of this
>> +command demonstrate the success of the reset.
>> +
>> +The management device MUST present 0 through
>> +VIRTIO_TRANSPTQ_CTRL_STATUS_GET once the reset is done.
>> +
>> +The management device MUST fail the device status access if
>> +\field{device_id} is 0.
>> +
>> +\drivernormative{\subsubsection}{Device Status}{Virtio Transport Option=
s / Virtio
>> +Over Transport Virtqueue / Device Status}
>> +
>> +After writing 0 via VIRTIO_TRANSPTQ_CTRL_STATUS_SET, the driver MUST wa=
it
>> +for the success of the command before re-initializing the device.
> So we need to clarify which is the condition for the succeed of a reset:
>
> 1) the succeed of STATUS_SET (this is how ccw did)
> 2) 0 is read from STATUS_GET (this is how pci did)
sure, I think we can use the pci way, present 0 after reset.
>
>> +
>> +\subsection{Device Generation}\label{sec:Virtio Transport Options / Vir=
tio Over Transport Virtqueue / Device Generation}
>> +
>> +When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
>> +the device generation count is read from the following commands:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_GENERATION    5
>> + #define VIRTIO_TRANSPTQ_CTRL_GENERATION_GET        0
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_GENERATION_GET is used to get the device confi=
guration generation field
>> +of the virtual device. The command-in-data is the u32 device
>> +generation returned from the device. There's no command-out-data for
>> +this command.
>> +
>> +\devicenormative{\subsubsection}{Device Generation}{Virtio Transport Op=
tions / Virtio Over Transport Virtqueue / Device Generation}
>> +
>> +The management device MUST present a changed generation count after the=
 driver
>> +has read a device-specific configuration value which has changed since
>> +any part of the device-specific configuration was last read.
>> +
>> +The management device MUST fail the device generation access if \field{=
device_id} is 0.
>> +
>> +\subsection{Device Specific Configuration}\label{sec:Virtio Transport O=
ptions /
>> +Virtio Over Transport Virtqueue / Device Specific Configuration}
>> +
>> +When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
>> +the device config space contents of a virtual device are accessed throu=
gh
>> +VIRTIO_TRANSPTQ_CTRL_CONFIG_GET and VIRTIO_TRANSPTQ_CTRL_CONFIG_SET.
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_CONFIG    6
>> +  #define VIRTIO_TRANSPTQ_CTRL_CONFIG_GET    0
>> +  #define VIRTIO_TRANSPTQ_CTRL_CONFIG_SET    1
>> +
>> +struct virtio_transportq_ctrl_vdev_config_get {
>> +       u32 offset;
>> +       u32 size;
>> +};
>> +
>> +struct virtio_transportq_ctrl_vdev_config_set {
>> +       u32 offset;
>> +       u32 size;
>> +       u8  data[];
>> +};
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_CONFIG_GET is used to read data from the
>> +device configuration space. As described in struct
>> +virtio_transportq_ctrl_vdev_config_get, The command-out-data is the off=
set
>> +from the start of the config space and the size of the data. The
>> +command-in-data is an array of u8 data that read from the config
>> +space.
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_CONFIG_SET is used to write data to the device
>> +configuration space. As described in struct
>> +virtio_transportq_ctrl_vdev_config_set, the command-out-data contains t=
he
>> +offset from the start of the config space, the size of the data and
>> +the data that will be written. There's no command-in-data for this
>> +command.
>> +
>> +\devicenormative{\subsubsection}{Device Specific Configuration}{Virtio =
Transport
>> +Options / Virtio Over Transport Virtqueue / Device Specific Configurati=
on}
>> +
>> +The management device MUST fail the device configuration space access
>> +if the driver wants to access the range which is outside the config spa=
ce.
>> +
>> +The management device MUST fail the device configuration space access
>> +if \field{device_id} is 0.
>> +
>> +\subsection{MSI Configuration}\label{sec:Virtio Transport Options / Vir=
tio Over
>> +dmin Virtqueue / MSI Configuration}
>> +
>> +When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
>> +the MSI entry for a specific virtqueue is set through following command=
:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_MSI    7
>> + #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_SET        0
>> + #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_ENABLE     1
>> + #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_MASK       2
>> + #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_SET    3
>> + #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_ENABLE 4
>> + #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_MASK   5
>> +
>> +struct virtio_transportq_ctrl_vdev_msi_vq_set {
> To be consistent with msi, let's use _vdev_mst_vq_config?
OK, it will be virtio_transportq_ctrl_vdev_msi_vq_config in the next=20
version
>
>> +       u16 queue_index;
>> +       u64 addr;
>> +       u32 data;
>> +};
>> +
>> +struct virtio_transportq_ctrl_vdev_msi_vq_enable {
>> +       u16 queue_index;
>> +       u8 enable;
>> +};
>> +
>> +struct virtio_transportq_ctrl_vdev_msi_vq_mask {
>> +       u16 queue_index;
>> +       u8 mask;
>> +};
>> +
>> +struct virtio_transportq_ctrl_vdev_msi_config {
>> +       u64 addr;
>> +       u32 data;
>> +};
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_SET command is used to set the MSI entr=
y for a
>> +specific virtqueue. The command-out-data is the virtqueue index and
>> +the MSI address and data (as described in struct
>> +virtio_transportq_ctrl_vdev_msix_vq_set).
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_ENABLE command is used to enable or dis=
able
>> +the MSI interrupt for a specific virtqueue. The command-out-data is the
>> +virtqueue index and whether to enable the MSI: 0 means to enable and 1
> It might be better to use macros instead of magic numbers.
sure!
>
>> +means to disable (as described in struct
>> +virtio_transportq_ctrl_vdev_msi_vq_enable).
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_MASK command is used to mask or unmask =
the
>> +MSI interrupt for a specific virtqueue. The command-out-data is the
>> +virtqueue index and the mask status: 0 means unmak and 1 means mask
>> +(as described in struct virtio_transportq_ctrl_vdev_msi_vq_mask).
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_SET command is used to set the MSI =
entry
>> +for the config interrupt. The command-out-data is the MSI address and
>> +data (as described in struct virtio_transportq_ctrl_vdev_msi_config).
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_ENABLE command is used to enable an=
d disable
>> +MSI for config space. The command-out-data is an u8: 0 means to
>> +disable and 1 means to enable.
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_MASK command is used to mask and un=
mask MSI
>> +interrupt for config space. The command-out-data is an u8: 0 means to
>> +mask and 1 means to unmask.
>> +
>> +There's no command-in-data for all the above MSI commands.
>> +
>> +\devicenormative{\subsubsection}{MSI Configuration}{Virtio Transport Op=
tions / Virtio
>> +ver Transport Virtqueue / MSI Configuration}
>> +
>> +The virtual device MUST record the pending MSI interrupts and
>> +re-generate the pending MSI interrupts when unmasking.
>> +
>> +The virtual device MUST disable the MSI for both virtqueue and config s=
pace
>> +upon reset.
>> +
>> +\drivernormative{\subsubsection}{MSI Configuration}{Virtio Transport Op=
tions / Virtio
>> +Over Transport Virtqueue / MSI Configuration}
>> +
>> +The driver MUST allocate transport or platform specific MSI entries
>> +for both virtqueue and config space if it wants to use interrupt.
>> +
>> +The driver MAY choose disable the MSI if polling mode is used.
> "choose to disable" ?
when use polling mode, I think it is not a must to disable the interrupts.
So the driver may disable the interrupts for better performance or not.

Did I miss something?

>
>> +
>> +\subsection{Virtqueue Address}\label{sec:Virtio Transport Options / Vir=
tio Over
>> +Transport Virtqueue / Virtqueue Address}
>> +
>> +When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
>> +the addresses of a specific virtqueue are accessed through the followin=
g command:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_VQ_ADDR    8
>> + #define VIRTIO_TRANSPTQ_CTRL_VQ_ADDR_SET       0
>> +
>> +struct virtio_transportq_ctrl_vdev_vq_addr {
>> +       u16 queue_index;
>> +       u64 device_area;
>> +       u64 descriptor_area;
>> +       u64 driver_area;
>> +};
>> +\end{lstlisting}
>> +
>> +The command-out-data is the queue index, the addresses of device area,
>> +descriptor area and driver area (as described in struct
>> +virtio_transportq_ctrl_vdev_vq_addr); There's no command-in-data.
>> +
>> +\devicenormative{\subsubsection}{Virtqueue Address}{Virtio Transport Op=
tions / Virtio
>> +Over Transport Virtqueue / Virtqueeu Address}
>> +
>> +The management device MUST fail the commands of class
>> +VIRTIO_TRANSPTQ_CTRL_VQ_ADDR if \field{device_id} is 0.
>> +
>> +\subsection{Virtqueue Status}\label{sec:Virtio Transport Options / Virt=
io Over
>> +Transport Virtqueue / Virtqueue Status}
>> +
>> +When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
>> +virtqueue status is set and get through the following command:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE    9
>> + #define VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET       0
>> + #define VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_GET       1
>> +
>> +struct virtio_transportq_ctrl_vq_status_set {
>> +  u16 queue_index;
>> +  u8 status;
>> +};
>> +
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET command is used to set the statu=
s of a
>> +specific virtqueue. The command-out-data is the queue index and the
>> +status that is set to the virtqueue (0 disabled, 1 enabled),
>> +as described in struct virtio_transportq_ctrl_vq_status_set.
>> +There's no command-in-data.
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_GET is used to get the status of a
>> +specific virtqueue. The command-out-data is an u16 of the queue
>> +index. The command-in-data is the virtqueue status (0 disabled, 1
>> +enabled).
>> +
>> +\devicenormative{\subsubsection}{Virtqueue Status}{Virtio Transport Opt=
ions / Virtio
>> +Over Transport Virtqueue / Virtqueue Status}
>> +
>> +When disabled, the virtual device MUST stop processing requests from
>> +this virtqueue.
>> +
>> +The management device MUST present a 0 via
>> +VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_GET upon a reset of the virtual device.
>> +
>> +The management device MUST fail the virtqueue status access if
>> +\field{device_id} is 0.
>> +
>> +\drivernormative{\subsubsection}{Virtqueue Status}{Virtio Transport Opt=
ions / Virtio
>> +Over Transport Virtqueue / Virtqueue Status}
>> +
>> +The driver MUST configure other virtqueue fields before enabling
>> +the virtqueue with VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET.
>> +
>> +\subsection{Virtqueue Size}\label{sec:Virtio Transport Options / Virtio=
 Over
>> +Transport Virtqueue / Virtqueue Size}
>> +
>> +When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
>> +virtqueue size is accessed through the following command:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_VQ_SIZE    10
>> + #define VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_SET       0
>> + #define VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_GET       1
>> +
>> +struct virtio_transportq_ctrl_vdev_vq_size_set {
>> +       u16 queue_index;
>> +       u16 size;
>> +};
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_SET command is used to set the virtque=
ue
>> +size. The command-out-data is the queue index and the size of the
>> +virtqueue (as described in struct
>> +virtio_transportq_ctrl_vdev_vq_size_set). There's no command-in-data.
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_GET command is used to get the virtque=
ue
>> +size. On reset, the maximum queue size supported by the device is
>> +returned. The command-out-data is an u16 of the virtqueue index. The
>> +command-in-data is an u16 of queue size for the virtqueue.
>> +
>> +\devicenormative{\subsubsection}{Virtqueue Status}{Virtio Transport Opt=
ions / Virtio
>> +Over Transport Virtqueue / Virtqueue Size}
>> +
>> +The management device MUST fail the virtqueue size access if
>> +\field{device_id} is 0.
>> +
>> +\subsection{Virtqueue Notification}\label{sec:Virtio Transport Options =
/ Virtio
>> +Over Transport Virtqueue / Virtqueue Notification}
>> +
>> +When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
>> +the virtqueue notification is done through the following commands:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY    11
>> + #define VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET          1
>> +
>> +struct virtio_transportq_ctrl_vdev_vq_notification_area {
>> +       le64 addr
>> +       le64 size;
>> +};
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET is used to get the transport
>> +specific address area that can be used to notify a virtqueue. The
>> +command-out-data is an u16 of the virtqueue index. The command-in-data
>> +contains the address and the size of the notification area (as
>> +described in struct virtio_transportq_ctrl_vdev_vq_notification_area).
>> +
>> +\devicenormative{\subsubsection}{Virtqueue Notification}{Virtio Transpo=
rt Options /
>> +Virtio Over Transport Virtqueue / Virtqueue Notification}
>> +
>> +The management device MUST fail the VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET =
command
>> +if there's no transport specific notification address for a virtqueue o=
f
>> +its virtual device.
> Then how can we kick a device in this case?
I think I should remove this sub-section. Because there should be a=20
notification area, or it is
a defective device, and if failed to get the notification area, the=20
command should set a proper
ack value reflecting the error
>
>> +
>> +The management device MUST fail the virtqueue notification access if
>> +\field{device_id} is 0.
>> +
>> +The management device MUST forbid the notification area of a specific
>> +virtual device to be accessed from another virtual device.
>> +
>> +\drivernormative{\subsubsection}{Virtqueue Notification}{Virtio Transpo=
rt Options /
>> +Virtio Over Transport Virtqueue / Virtqueue Notification}
>> +
>> +The driver MAY choose to notify the virtqueue by writing the queue
>> +index at address \field{addr} which is fetched from the
>> +VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET command.
>> +
>> +\subsection{Virtqueue Index}\label{sec:Virtio Transport Options / Virti=
o
>> +Over Transport Virtqueue / Virtqueue Index}
>> +
>> +When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
>> +the virtqueue available index is accessed through the following command=
s:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_TRANSPTQ_CTRL_VQ_AVAIL_INDEX    12
>> + #define VIRTIO_TRANSPTQ_CTRL_VQ_AVAIL_INDEX_SET       0
>> + #define VIRTIO_TRANSPTQ_CTRL_VQ_ AVAIL_INDEX_GET       1
>> +
>> +struct virtio_transportq_ctrl_vdev_vq_avail_idx_set {
>> +        u16 queue_index;
>> +        u16 avail_idx;
>> +};
>> +\end{lstlisting}
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_VQ_AVAIL_INDEX_SET commmand is used to set the=
 available index of a specific virtqueue.
> s/commmand/command/g
>
> We need the support of packed virtqueue as well here.
sure, will work on this.
>
>> +The command-out-data is the virtqueue index and the available index (as=
 described in struct virtio_transportq_ctrl_vdev_vq_avail_idx).
>> +There is no command-in-data.
>> +
>> +The VIRTIO_TRANSPTQ_CTRL_VQ_ AVAIL_INDEX_GET command is used to get the=
 available index of a specific virtqueue.
>> +The command-out-data is the queue index, the command-in-data is the ava=
ilable index of the queue.
>> +
>> +\devicenormative{\subsubsection}{Virtqueue Index}{Virtio Transport Opti=
ons /
>> +Virtio Over Transport Virtqueue / Virtqueue Index}
>> +
>> +The management device MUST fail the virtqueue index access if \field{de=
vice_id} is 0
>> +The management device MUST fail the virtqueue index access if \field{qu=
eue_id} is invalid.
> We don't have similar normatives for other commands, anything make
> this command different?
If it is PCI, if we set queue_select to an invalid value, I think it is=20
a undefined behavior, this could be ignored by the hardware,
the device has no ways to report such errors.

Here, for the transport virtqueue, it is a must to return an ACK value,=20
and it can be meaningful, like VIRTIO_TRANSPTQ_EINVAL
>
>> +
>> +\subsection{Presenting Virtual Devices}\label{sec:Virtio Transport Opti=
ons /
>> +Virtio Over Transport Virtqueue / Presenting Virtual Device}
>> +
>> +If VIRTIO_TRANSPTQ_F_VDEV is offered by a management device. The presen=
ting of
>> +the virtual devices requires co-operation between the management
>> +driver and the transport virtqueue. This means, from the view of the
>> +virtual device driver, the transport is done via the communication
>> +with the management device driver. It's up to the software to decide
>> +what kind of method that is needed be used for those communications.
>> +
>> +The management driver typically takes the following steps for creating =
a
>> +virtual device:
>> +
>> +\begin{enumerate}
>> +\item Determine the virtio id and device specific configuration.
>> +\item Create the virtual devices using the virtio_transportq_ctrl_vdev_=
CREATE command.
> Need to use the upper case for the command name here.
yes
>
>> +\item Optionally, configure the MSI.
>> +\item Perform device specific setup.
>> +\item Let the virtual device to be probed by the virtual device
>> +driver. The management driver will then use the transport virtqueue to
>> +implement the requests of basic facility from the virtual device
>> +driver.
> I think we need to be more verbose here, e.g to mention the actual
> command that is used.
sure, will add these
>
>> +\end{enumerate}
>>
>>   \chapter{Device Types}\label{sec:Device Types}
>>
>> @@ -2911,12 +3524,14 @@ \subsection{Virtqueues}\label{sec:Device Types /=
 Network Device / Virtqueues}
>>   \item[2(N-1)] receiveqN
>>   \item[2(N-1)+1] transmitqN
>>   \item[2N] controlq
>> +\item[2N+1] transportq
> Let's use a separate patch for this.
can do.

Thanks for your review!
>
>>   \end{description}
>>
>>    N=3D1 if neither VIRTIO_NET_F_MQ nor VIRTIO_NET_F_RSS are negotiated,=
 otherwise N is set by
>>    \field{max_virtqueue_pairs}.
>>
>> - controlq only exists if VIRTIO_NET_F_CTRL_VQ set.
>> + controlq only exists if VIRTIO_NET_F_CTRL_VQ set.\\
>> + transportq only exists if VIRTIO_F_TRNSPT_VQ is offered.
>>
>>   \subsection{Feature bits}\label{sec:Device Types / Network Device / Fe=
ature bits}
>>
>> @@ -4399,10 +5014,12 @@ \subsection{Virtqueues}\label{sec:Device Types /=
 Block Device / Virtqueues}
>>   \item[0] requestq1
>>   \item[\ldots]
>>   \item[N-1] requestqN
>> +\item[N] transportq
>>   \end{description}
>>
>>    N=3D1 if VIRTIO_BLK_F_MQ is not negotiated, otherwise N is set by
>> - \field{num_queues}.
>> + \field{num_queues}.\\
>> + transportq only exists if VIRTIO_F_TRNSPT_VQ is offered.
>>
>>   \subsection{Feature bits}\label{sec:Device Types / Block Device / Feat=
ure bits}
>>
>> diff --git a/introduction.tex b/introduction.tex
>> index 6d52717..de3839b 100644
>> --- a/introduction.tex
>> +++ b/introduction.tex
>> @@ -79,6 +79,9 @@ \section{Normative References}\label{sec:Normative Ref=
erences}
>>          \phantomsection\label{intro:SCMI}\textbf{[SCMI]} &
>>          Arm System Control and Management Interface, DEN0056,
>>          \newline\url{https://developer.arm.com/docs/den0056/c}, version=
 C and any future revisions\\
>> +       \phantomsection\la=C3=A7bel{intro:SIOV}\textbf{[SIOV]} &
>> +       Scalable I/O Virtualization,
>> +       \newline\url{https://www.opencompute.org/documents/ocp-scalable-=
io-virtualization-technical-specification-revision-1-v1-2-pdf}\\
>>
>>   \end{longtable} v
> This publicly archived list offers a means to provide input to the
>
> OASIS Virtual I/O Device (VIRTIO) TC.
>
>
>
> In order to verify user consent to the Feedback License terms and
>
> to minimize spam in the list archive, subscription is required
>
> before posting.
>
>
>
> Subscribe:virtio-comment-subscribe@lists.oasis-open.org
>
> Unsubscribe:virtio-comment-unsubscribe@lists.oasis-open.org
>
> List help:virtio-comment-help@lists.oasis-open.org
>
> List archive:https://lists.oasis-open.org/archives/virtio-comment/
>
> Feedback License:https://www.oasis-open.org/who/ipr/feedback_license.pdf
>
> List Guidelines:https://www.oasis-open.org/policies-guidelines/mailing-li=
sts
>
> Committee:https://www.oasis-open.org/committees/virtio/
>
> Join OASIS:https://www.oasis-open.org/join/
>

--------------M0GGyuIfbxdPzPmmaucit4JO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <br>
    <br>
    <div class=3D"moz-cite-prefix"><font face=3D"monospace">On 7/5/2022 5:2=
7
        PM, Jason Wang wrote:</font><br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Mon, Jul 4, 2022 at 3:44 PM=
 Zhu Lingshan <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:lingshan.zh=
u@intel.com">&lt;lingshan.zhu@intel.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">This patch introduces a new =
device type: virtio virtual device.
An virtio virtual device example is virtio based
Scalable I/O Virtualization devices.

This commit also introduces a new transport other than PCI and MMIO - the
transport virtqueue.

This transport is useful for implementing virtual devices with a limited
transport specific resources or presenting the virtual device in a
transport independent way.

This means, all the basic device facilities are provided solely via
the the transport virtqueue. Additionally, the transport virtqueue is also =
in
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Two "the".</pre>
    </blockquote>
    <font face=3D"monospace">will fix</font><br>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">charge of the creating and d=
estroying of the virtual device.

With the help of the transport virtqueue, the presenting of the virtual
device is done via the co-operation between the management device and
its driver.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Having a dedicated virtqueue i=
s probably fine but there is some
overlap at the description of management/managed device with the admin
virtqueue proposal from Max. Need to consider a way to unify the
definition at least.</pre>
    </blockquote>
    <font face=3D"monospace">OK, I can re-phrase this part</font><br>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Signed-off-by: Jason Wang <a=
 class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jasowang@redhat.com">&lt;ja=
sowang@redhat.com&gt;</a>
Signed-off-by: Zhu Lingshan <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:lingshan.zhu@intel.com">&lt;lingshan.zhu@intel.com&gt;</a>
---
 content.tex      | 621 ++++++++++++++++++++++++++++++++++++++++++++++-
 introduction.tex |   3 +
 2 files changed, 622 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index 3aeb4a4..1cdb683 100644
--- a/content.tex
+++ b/content.tex
@@ -2784,6 +2784,619 @@ \subsubsection{Resetting Devices}\label{sec:Virtio =
Transport Options / Virtio ov
 In order to reset a device, a driver sends the
 CCW_CMD_VDEV_RESET command.

+\section{Virtio Over Transport Virtqueue}\label{sec:Virtio Transport Optio=
ns Virtio Over Transport Virtqueue}
+Sometimes it's hard to implement the device in a transport specific method=
.
+One example is that a physical device may try to present multiple virtual =
devices
+with limited transport specific resources.
+Another example is to implement virtual devices which are transport indepe=
ndent.
+In those cases, the transport virtqueue provided by the management device =
could be used to replace
+the transport specific method to implement the virtual device.
+Then the presenting of the virtual device is done through the cooperation =
between
+the transport virtqueue and the management device's driver.
+
+Feature bit VIRTIO_F_TRNSPT_VQ indicates that the device offers a transpor=
t virtqueue.
+
+\subsection{Basic Concepts}\label{sec:Virtio Transport Options / Virtio ov=
er Transport Virtqueue / Basic Concepts}
+
+All transport virtqueue commands are of the following form:
+
+\begin{lstlisting}
+struct virtio_transportq_ctrl {
+        u64 device_id;
+        u16 class;
+        u16 command;
+        u32 length_out;
+        u8 command-out-data[];
+        u32 length_in;
+        u32 ack;
+        u8 command-in-data[];
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Any reason we need length_in/l=
ength_out (we have length in
descriptors)? FYI, we don't have them for ctrl virtqueue of networking
devices.</pre>
    </blockquote>
    <font face=3D"monospace">OK, I can remove length_in and length_out,
      just pick the length from the descriptors.</font><br>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+};
+
+/* ack values */
+#define VIRTIO_TRANSPTQ_OK     0
+#define VIRTIO_TRANSPTQ_EIO    1
+#define VIRTIO_TRANSPTQ_EAGAIN 11
+#define VIRTIO_TRANSPTQ_EBUSY  16
+#define VIRTIO_TRANSPTQ_EINVAL 22
+#define VIRTIO_TRANSPTQ_ERR    255
+\end{lstlisting}
+
+The \field{device_id}, \field{class}, \field{command}, \field{length_out} =
and
+\field{command-out-data} are set by the management driver,
+and the device sets the \field{ack}, \field{length_in} and \field{command-=
in-data}.
+
+\field{device_id} is an UUID to address a virtio virtual device,
+The \field{device_id} value 0 is used for identify the management device i=
tself
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">identifying?</pre>
    </blockquote>
    <font face=3D"monospace">yes, will fix</font><br>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+
+\subsubsection{The managment devices}\label{sec:Virtio Transport Options /=
 Virtio over Transport Virtqueue / Basic Concepts / The management devices}
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">s/managment/management/</pre>
    </blockquote>
    <font face=3D"monospace">will fix</font><br>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+A device that offers a tran=
sport virtqueue (via feature VIRTIO_F_TRNSPT_VQ)
+is the management device of the virtual devices which are the managed devi=
ces.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Not a native speaker but I cou=
ldn't parse this sentence.</pre>
    </blockquote>
    <font face=3D"monospace">OK, I can re-phrase this one.</font><br>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+
+For example, a PCIe PF with a transport virtqueue is a management device.
+
+\subsubsection{The virtual devices}\label{sec:Virtio Transport Options / V=
irtio over Transport Virtqueue / Basic Concepts / The virtual devices}
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">I think to be consistent, per =
Michael's suggestion, we should use
"managed" here which is better than "virtual".</pre>
    </blockquote>
    <font face=3D"monospace">do you mean replace all "virtual device" with
      "managed device" in this patch?<br>
      We can emphasize a virtual device is a type of managed device
      here, however "virtual device"<br>
      implies that the device is a logical device may not has a
      dedicated physical transport,<br>
      like SIOV devices
      (<a class=3D"moz-txt-link-freetext"
href=3D"https://www.opencompute.org/documents/ocp-scalable-io-virtualizatio=
n-technical-specification-revision-1-v1-2-pdf">https://www.opencompute.org/=
documents/ocp-scalable-io-virtualization-technical-specification-revision-1=
-v1-2-pdf</a>).
      <br>
    </font>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+A device that is created th=
rough a transport virtqueue which is offered by a management
+device is a virtual device. Virtual devices are logical devices, managed b=
y the management devices,
+they usually don't have a dedicated physical transport.
+
+For example, a Scalable I/O Virtualization \hyperref[intro:SIOV]{[SIOV]} d=
evice which is created and managed through a transport virtqueue of
+a management device is a virtual device.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Maybe we can remove the "is a =
virtual device" here, since we use "For
example" in the subsection of "The virtual device"</pre>
    </blockquote>
    <font face=3D"monospace">sure</font><br>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+
+\devicenormative{\subsubsection}{Basic Concepts}{Virtio Transport Options =
/ Virtio Over Transport Virtqueue / Basic Concepts}
+The management device MUST offer feature bit VIRTIO_F_TRNSPT_VQ and a tran=
sport virtqueue as a device specific virtqueue.\\
+The virtual devices MUST not offer VIRTIO_F_TRNSPT_VQ feature.\\
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Is this a must? What's the val=
ue of prohibiting the nesting of the
management device?</pre>
    </blockquote>
    <font face=3D"monospace">Of course it is not a must, I mean it is
      possible to implement VIRTIO_F_TRANSPT_VQ for a virtual device.<br>
      But I am not sure whether it is meaningful to have nested virtual
      devices, creating virtual device on<br>
      another virtual device, both layers are logical devices.<br>
      And this introduce extra </font><font face=3D"monospace"><font
        face=3D"monospace">complexities for </font>hardware
      implementation and resource management,<br>
      like usually don't create VFs from another VF.<br>
    </font>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+The management device MUST =
fail all commands against the transport virtqueue if VIRTIO_F_TRNSPT_VQ is =
not negotiated.
+
+\drivernormative{\subsubsection}{Basic Concepts}{Virtio Transport Options =
/ Virtio Over Transport Virtqueue / Basic Concepts}
+The management driver MUST not send any commands against the transport vir=
tqueue if VIRTIO_F_TRNSPT_VQ is not negotiated.
+
+\subsection{Virtual Devices Discovery}\label{sec:Virtio Transport Options =
/Virtio Over Transport Virtqueue / Virtual Devices Discovery}
+
+The management device is discovered through its own transport and device s=
pecific method.
+Virtual devices are created and discovered via the transport virtqueue.
+
+\subsection{Transport Virtqueue Features}\label{sec:Virtio Transport Optio=
ns /Virtio Over Transport Virtqueue / Transport Virtqueue Features}
+
+Feature bit VIRTIO_F_TRNSPT_VQ_VDEV indicates that the virtual devices are=
 created, configured
+and destroyed through the transport virtqueue.
+This means the transport virtqueue is the transport for the virtual device=
s.
+
+Feature bit VIRTIO_F_TRNSPT_VQ_VDEV depends on VIRTIO_F_TRNSPT_VQ
+
+\devicenormative{\subsubsection}{Transport Virtqueue Features}{Virtio Tran=
sport Options / Virtio Over Transport Virtqueue / Transport Virtqueue Featu=
res}
+The management device MUST not accept VIRTIO_F_TRNSPT_VQ_VDEV if VIRTIO_F_=
TRNSPT_VQ is not negotiated.
+
+\subsection{Device Management}\label{sec:Virtio Transport Options / Virtio=
 Over Transport Virtqueue / Device Management}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+virtual devices must be created and destroyed through the transport virtqu=
eue.
+
+\begin{lstlisting}
+struct virtio_transportq_ctrl_vdev_attribute {
+       u32 virtio_device_id;
+       u32 asid;
+       u8 config[];
+};
+
+#define virtio_transportq_ctrl_vdev    1 (class)
+ #define virtio_transportq_ctrl_vdev_CREATE        0 (command)
+ #define virtio_transportq_ctrl_vdev_DESTROY       1 (command)
+\end{lstlisting}
+
+The virtio_transportq_ctrl_vdev_CREATE command is used to create a virtual=
 device.
+The command-out-data for VIRTIO_TRANSPTQ_CTRL_CREATE is the virtio device =
id (\field{virtio_device_id}),
+the address space id (\field{asid})
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">We need to be verbose here. Is=
 this a transport specific identifier or
a device specific identifier?</pre>
    </blockquote>
    <font face=3D"monospace">This asid field is an id for the device, it
      should be the PASID. I will add more explanations here.</font><br>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

I also wonder if this is the best place for this. To me, it looks more
suitable to have a dedicated command to configure it before DRIVER_OK
like virtqueue address. Then we can configure it per virtqueue per
device with more flexibility.</pre>
    </blockquote>
    <font face=3D"monospace">I understand the point, this can gives the
      device more flexibility for sure.<br>
      It is the guest driver initialize the device. Device status and vq
      configs are usually set by the guest driver,<br>
      and the guest driver is not aware of the asid, it is the host side
      setting the asid.<br>
      So shall we set the asid upon DRIVER_OK?<br>
      And how to decide whether the device should use a device-global
      asid or a per-vq asid,<br>
      or even hybrid? I think this is transparent to the guest<br>
    </font>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+and device specific configu=
ration (\field{config}) for creating the virtual device.
+When succeed, the device returns an u64 as a unique identifier of the crea=
ted virtual device in command-in-data.
+
+The field \field{config} is device type specific. E.g., for virtio-net, it=
 should follow the struct virtio_net_config
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">I think we need a dedicated se=
ction to describe the transport
virtqueue support for virtio-net.</pre>
    </blockquote>
    <font face=3D"monospace">More hints for what should be discussed in
      the section?<br>
      I see all the descriptions for virtio device types are in chapter
    </font><span class=3D"fontstyle0"><font face=3D"monospace">5 Device
        Types,<br>
        other transports don't have their own sections for the device
        types, and chapter 5 discussed<br>
        that in general.<br>
        <br>
        Here we take virtio-net device as an example to explain the
        filed config contents.</font></span><br>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+in section \ref{sec:Device =
Types / Network Device / Device configuration layout}
+
+The virtio_transportq_ctrl_vdev_DESTROY command is used to destroy a
+virtual device which is identified by its 64bit identifier
+\field{virtual_device_id}. There's no command-in-data for
+VIRTIO_TRANSPTQ_CTRL_DESTROY command.
+
+\devicenormative{\subsubsection}{Device Management}{Virtio Transport Optio=
ns / Virtio Over Transport Virtqueue / Device Management}
+
+The management device MUST fail the virtio_transportq_ctrl_vdev_CREATE if
+\field{device_id} is not 0.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Let's use VIRTIO_TRANSPTQ_OK i=
nstead of the magic number here.</pre>
    </blockquote>
    <font face=3D"monospace">this zero is the filed device_id =3D 0, means
      identifying the management device.<br>
      And I found I have mixed up the upper and lower cases in the
      commands, they<br>
      should all be upper cases, I will fix this. </font><br>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+
+The management device MUST fail the virtio_transportq_ctrl_vdev_DESTROY if
+\field{device_id} is 0.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Same here.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+
+All virtual devices MUST be created via the transport virtqueue if the man=
agement
+device offers VIRTIO_F_TRNSPT_VQ_VDEV.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Does this imply no pre-created=
 virtual devices? If this is true, we
don't need a dedicated feature bit (VIRTIO_F_TRNSPT_VQ_VDEV).</pre>
    </blockquote>
    <font face=3D"monospace">There can be pre-created virtual devices, in
      the following sections,</font><br>
    <pre class=3D"moz-quote-pre" wrap=3D"">struct mgmt_dev_avail_res{}, if =
min_vdev_vqs =3D=3D max_vdev_vqs, means the management device
only supports creating virtual devices with fixed capabilities, this kind o=
f virtual devices
can be pre-created. Like the slab allocator, vendors can pre-create the dev=
ice. Then when the management
device receiving the VDEV_CREATE command,  it can just pick up a free virtu=
al device, and return the
virtual device.

</pre>
    <font face=3D"monospace"></font>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

The bit only makes sense for the case when some managed(virtual)
devices are pre-created like initial_vfs in SR-IOV. If we allow
pre-creation, we need commands to discover them.</pre>
    </blockquote>
    <pre class=3D"moz-quote-pre" wrap=3D"">I think we need the feature bit =
VIRTIO_F_TRNSPT_VQ_VDEV, this feature bit indicates that the transport
virtqueue is the transport layer for the virtual devices, like PCI for a vi=
rtio PCI hardware.
So, not only create, we use the transport virtqueue to config the device as=
 well.

And if the virtual devices are pre-created, we can just send the create com=
mand, and the management device
can find a available device for us, this is also discovery.=20
</pre>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+
+\drivernormative{\subsubsection}{Driver Management}{Virtio Transport Optio=
ns / Virtio Over Transport Virtqueue / Device Management}
+
+The management driver MUST use 0 as \field{device_id} for
+virtio_transportq_ctrl_vdev_CREATE command.
+
+\subsection{Available resource of the management device}\label{sec:Virtio =
Transport Options / Virtio Over Transport Virtqueue / Available resource of=
 the management devic}
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+statistical information of available resource of the management device cou=
ld be fetched
+by the following command:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_AVAIL_RES    2
+ #define VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET     0
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Nit, I think this command shou=
ld come first, mgmt need to query this
before creating devices.</pre>
    </blockquote>
    <font face=3D"monospace">sure, I can re-order the commands.</font><br>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+\end{lstlisting}
+
+VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET command is used to get the statstical i=
nformation of available
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">s/statstical/statistical/</pre=
>
    </blockquote>
    <font face=3D"monospace">will fix</font><br>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+resource of the management =
device. There is no command-out-data for VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET
+command. The management device fills command-in-data in the following form=
at:
+
+\begin{lstlisting}
+struct mgmt_dev_avail_res{
+        /* The number of total remaining virtqueus of the management devic=
e */
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Should be virtqueues.

Actually the description here is confusing, something like this might be be=
tter

"The number of total remaining virtqueues for the managed(virtual) devices =
*/</pre>
    </blockquote>
    <font face=3D"monospace">will fix this.</font><br>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+        u16 num_avail_vqs;
+        /* The minimal number of virtqueues of the virtual devices */
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">"of a virtual device"?</pre>
    </blockquote>
    <font face=3D"monospace">will fix</font><br>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+        u16 min_vdev_vqs;
+        /* The maximum number of virtqueues of the virtual devices */
+        u16 max_vdev_vqs;
+        /* The number of virtual devices that can be created with min_vdev=
_vqs virtqueues.
+         * This number may not equal to num_avail_vqs divided by min_vdev_=
vqs due to
+         * the limitations of other resource
+         */
+        u16 num_avail_vdev;
+};
+\end{lstlisting}
+
+If \field{min_vdev_vqs} equals to \field{min_vdev_vqs}, that means the man=
agement device
+can only create virtual devices with a fixed number of virtqueues
+
+\devicenormative{\subsubsection}{Available resource of the management devi=
ce}{Virtio Transport Options /
+Virtio Over Transport Virtqueue / Available resource of the management dev=
ice}
+The management device MUST fail the VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET com=
mand if \field{device_id} is not 0
+
+\drivernormative{\subsubsection}{Available resource of the management devi=
ce}{Virtio Transport Options /
+Virtio Over Transport Virtqueue / Available resource of the management dev=
ice}
+The management driver MUST use 0 as \field{device_id} for
+VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET command.
+
+\subsection{Features Negotiation}\label{sec:Virtio Transport Options / Vir=
tio
+Over Transport Virtqueue / Features Negotiation}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+the feature negotiation of virtual devices is done by the
+following commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_FEAT   3
+ #define VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET        0
+ #define VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_SET        1
+ #define VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_GET        2
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET is to get the features offered
+by a virtual device.
+
+The VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_SET is for driver to accept feature
+bits offered by the virtual device.
+
+The VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_GET is to get the features accepted
+by both the virtual driver and the device.
+
+The features is 64 bits mask of the virtio features bit. For
+VIRTIO_TRANSPTQ_CTRL_DRIVER_SET, the feature is passed to the device
+through command-out-data. For VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET and
+VIRTIO_TRANSPTQ_CTRL_DRIVER_GET the feature is returned for the device
+through command-in-data.
+
+\devicenormative{\subsubsection}{Features Negotiation}{Virtio Transport Op=
tions /
+Virtio Over Transport Virtqueue / Features Negotiation}
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Can one of the above three com=
mands fail? If yes, we need to document
the behaviour.</pre>
    </blockquote>
    <font face=3D"monospace">can the ack values cover this? Like if failed
      to read the device feature bits due to IO errors,<br>
      it can set this EIO below. Or do I miss something?<br>
    </font>
    <pre class=3D"moz-quote-pre" wrap=3D"">+/* ack values */
+#define VIRTIO_TRANSPTQ_OK     0
+#define VIRTIO_TRANSPTQ_EIO    1
+#define VIRTIO_TRANSPTQ_EAGAIN 11
+#define VIRTIO_TRANSPTQ_EBUSY  16
+#define VIRTIO_TRANSPTQ_EINVAL 22
+#define VIRTIO_TRANSPTQ_ERR    255
+\end{lstlisting}</pre>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+
+The management device MUST fail VIRTIO_TRANSPTQ_F_CTRL_FEAT class for the
+command that use 0 as its \field{device_id}.
+
+\drivernormative{\subsubsection}{Features Negotiation}{Virtio Transport Op=
tions /
+Virtio Over Transport Virtqueue / Features Negotiation}
+
+The management driver MAY mediate between the feature negotiation
+request of the virtual devices and the transport virtqueue. E.g when
+offering features to the virtual device, the management driver MAY
+exclude some features in order to limit the behaviour of the virtual
+device.
+
+\subsection{Device Status}\label{sec:Virtio Transport Options / Virtio Ove=
r
+Transport Virtqueue / Device Status}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+the status of virtual device is accessed by the following
+commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_STATUS    4
+ #define VIRTIO_TRANSPTQ_CTRL_STATUS_SET        0
+ #define VIRTIO_TRANSPTQ_CTRL_STATUS_GET        1
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_STATUS_SET is used to set the device status of
+a virtual device here. The command-out-data is the one byte status
+to set to the device. There's no command-in-data for this command.
+
+The VIRTIO_TRANSPTQ_CTRL_STATUS_GET is used to get the device status of
+a virtual device. The command-in-data is the one byte status
+returned from the device. There's no command-out-data for this
+command.
+
+\devicenormative{\subsubsection}{Device Status}{Virtio Transport Options /=
 Virtio
+Over Transport Virtqueue / Device Status}
+
+The management device MUST reset the virtual device when 0
+is written via VIRTIO_TRANSPTQ_CTRL_STATUS_SET, the success of this
+command demonstrate the success of the reset.
+
+The management device MUST present 0 through
+VIRTIO_TRANSPTQ_CTRL_STATUS_GET once the reset is done.
+
+The management device MUST fail the device status access if
+\field{device_id} is 0.
+
+\drivernormative{\subsubsection}{Device Status}{Virtio Transport Options /=
 Virtio
+Over Transport Virtqueue / Device Status}
+
+After writing 0 via VIRTIO_TRANSPTQ_CTRL_STATUS_SET, the driver MUST wait
+for the success of the command before re-initializing the device.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">So we need to clarify which is=
 the condition for the succeed of a reset:

1) the succeed of STATUS_SET (this is how ccw did)
2) 0 is read from STATUS_GET (this is how pci did)</pre>
    </blockquote>
    <font face=3D"monospace">sure, I think we can use the pci way, present
      0 after reset.</font><br>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+
+\subsection{Device Generation}\label{sec:Virtio Transport Options / Virtio=
 Over Transport Virtqueue / Device Generation}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+the device generation count is read from the following commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_GENERATION    5
+ #define VIRTIO_TRANSPTQ_CTRL_GENERATION_GET        0
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_GENERATION_GET is used to get the device configur=
ation generation field
+of the virtual device. The command-in-data is the u32 device
+generation returned from the device. There's no command-out-data for
+this command.
+
+\devicenormative{\subsubsection}{Device Generation}{Virtio Transport Optio=
ns / Virtio Over Transport Virtqueue / Device Generation}
+
+The management device MUST present a changed generation count after the dr=
iver
+has read a device-specific configuration value which has changed since
+any part of the device-specific configuration was last read.
+
+The management device MUST fail the device generation access if \field{dev=
ice_id} is 0.
+
+\subsection{Device Specific Configuration}\label{sec:Virtio Transport Opti=
ons /
+Virtio Over Transport Virtqueue / Device Specific Configuration}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+the device config space contents of a virtual device are accessed through
+VIRTIO_TRANSPTQ_CTRL_CONFIG_GET and VIRTIO_TRANSPTQ_CTRL_CONFIG_SET.
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_CONFIG    6
+  #define VIRTIO_TRANSPTQ_CTRL_CONFIG_GET    0
+  #define VIRTIO_TRANSPTQ_CTRL_CONFIG_SET    1
+
+struct virtio_transportq_ctrl_vdev_config_get {
+       u32 offset;
+       u32 size;
+};
+
+struct virtio_transportq_ctrl_vdev_config_set {
+       u32 offset;
+       u32 size;
+       u8  data[];
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_CONFIG_GET is used to read data from the
+device configuration space. As described in struct
+virtio_transportq_ctrl_vdev_config_get, The command-out-data is the offset
+from the start of the config space and the size of the data. The
+command-in-data is an array of u8 data that read from the config
+space.
+
+The VIRTIO_TRANSPTQ_CTRL_CONFIG_SET is used to write data to the device
+configuration space. As described in struct
+virtio_transportq_ctrl_vdev_config_set, the command-out-data contains the
+offset from the start of the config space, the size of the data and
+the data that will be written. There's no command-in-data for this
+command.
+
+\devicenormative{\subsubsection}{Device Specific Configuration}{Virtio Tra=
nsport
+Options / Virtio Over Transport Virtqueue / Device Specific Configuration}
+
+The management device MUST fail the device configuration space access
+if the driver wants to access the range which is outside the config space.
+
+The management device MUST fail the device configuration space access
+if \field{device_id} is 0.
+
+\subsection{MSI Configuration}\label{sec:Virtio Transport Options / Virtio=
 Over
+dmin Virtqueue / MSI Configuration}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+the MSI entry for a specific virtqueue is set through following command:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_MSI    7
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_SET        0
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_ENABLE     1
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_MASK       2
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_SET    3
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_ENABLE 4
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_MASK   5
+
+struct virtio_transportq_ctrl_vdev_msi_vq_set {
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">To be consistent with msi, let=
's use _vdev_mst_vq_config?</pre>
    </blockquote>
    <font face=3D"monospace">OK, it will be
      virtio_transportq_ctrl_vdev_msi_vq_config in the next version</font>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+       u16 queue_index;
+       u64 addr;
+       u32 data;
+};
+
+struct virtio_transportq_ctrl_vdev_msi_vq_enable {
+       u16 queue_index;
+       u8 enable;
+};
+
+struct virtio_transportq_ctrl_vdev_msi_vq_mask {
+       u16 queue_index;
+       u8 mask;
+};
+
+struct virtio_transportq_ctrl_vdev_msi_config {
+       u64 addr;
+       u32 data;
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_SET command is used to set the MSI entry f=
or a
+specific virtqueue. The command-out-data is the virtqueue index and
+the MSI address and data (as described in struct
+virtio_transportq_ctrl_vdev_msix_vq_set).
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_ENABLE command is used to enable or disabl=
e
+the MSI interrupt for a specific virtqueue. The command-out-data is the
+virtqueue index and whether to enable the MSI: 0 means to enable and 1
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">It might be better to use macr=
os instead of magic numbers.</pre>
    </blockquote>
    <font face=3D"monospace">sure!</font><br>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+means to disable (as descri=
bed in struct
+virtio_transportq_ctrl_vdev_msi_vq_enable).
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_MASK command is used to mask or unmask the
+MSI interrupt for a specific virtqueue. The command-out-data is the
+virtqueue index and the mask status: 0 means unmak and 1 means mask
+(as described in struct virtio_transportq_ctrl_vdev_msi_vq_mask).
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_SET command is used to set the MSI ent=
ry
+for the config interrupt. The command-out-data is the MSI address and
+data (as described in struct virtio_transportq_ctrl_vdev_msi_config).
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_ENABLE command is used to enable and d=
isable
+MSI for config space. The command-out-data is an u8: 0 means to
+disable and 1 means to enable.
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_MASK command is used to mask and unmas=
k MSI
+interrupt for config space. The command-out-data is an u8: 0 means to
+mask and 1 means to unmask.
+
+There's no command-in-data for all the above MSI commands.
+
+\devicenormative{\subsubsection}{MSI Configuration}{Virtio Transport Optio=
ns / Virtio
+ver Transport Virtqueue / MSI Configuration}
+
+The virtual device MUST record the pending MSI interrupts and
+re-generate the pending MSI interrupts when unmasking.
+
+The virtual device MUST disable the MSI for both virtqueue and config spac=
e
+upon reset.
+
+\drivernormative{\subsubsection}{MSI Configuration}{Virtio Transport Optio=
ns / Virtio
+Over Transport Virtqueue / MSI Configuration}
+
+The driver MUST allocate transport or platform specific MSI entries
+for both virtqueue and config space if it wants to use interrupt.
+
+The driver MAY choose disable the MSI if polling mode is used.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">"choose to disable" ?</pre>
    </blockquote>
    <font face=3D"monospace">when use polling mode, I think it is not a
      must to disable the interrupts.<br>
      So the driver may disable the interrupts for better performance or
      not.<br>
      <br>
      Did I miss something?<br>
      <br>
    </font>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+
+\subsection{Virtqueue Address}\label{sec:Virtio Transport Options / Virtio=
 Over
+Transport Virtqueue / Virtqueue Address}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+the addresses of a specific virtqueue are accessed through the following c=
ommand:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_ADDR    8
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_ADDR_SET       0
+
+struct virtio_transportq_ctrl_vdev_vq_addr {
+       u16 queue_index;
+       u64 device_area;
+       u64 descriptor_area;
+       u64 driver_area;
+};
+\end{lstlisting}
+
+The command-out-data is the queue index, the addresses of device area,
+descriptor area and driver area (as described in struct
+virtio_transportq_ctrl_vdev_vq_addr); There's no command-in-data.
+
+\devicenormative{\subsubsection}{Virtqueue Address}{Virtio Transport Optio=
ns / Virtio
+Over Transport Virtqueue / Virtqueeu Address}
+
+The management device MUST fail the commands of class
+VIRTIO_TRANSPTQ_CTRL_VQ_ADDR if \field{device_id} is 0.
+
+\subsection{Virtqueue Status}\label{sec:Virtio Transport Options / Virtio =
Over
+Transport Virtqueue / Virtqueue Status}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+virtqueue status is set and get through the following command:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE    9
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET       0
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_GET       1
+
+struct virtio_transportq_ctrl_vq_status_set {
+  u16 queue_index;
+  u8 status;
+};
+
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET command is used to set the status o=
f a
+specific virtqueue. The command-out-data is the queue index and the
+status that is set to the virtqueue (0 disabled, 1 enabled),
+as described in struct virtio_transportq_ctrl_vq_status_set.
+There's no command-in-data.
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_GET is used to get the status of a
+specific virtqueue. The command-out-data is an u16 of the queue
+index. The command-in-data is the virtqueue status (0 disabled, 1
+enabled).
+
+\devicenormative{\subsubsection}{Virtqueue Status}{Virtio Transport Option=
s / Virtio
+Over Transport Virtqueue / Virtqueue Status}
+
+When disabled, the virtual device MUST stop processing requests from
+this virtqueue.
+
+The management device MUST present a 0 via
+VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_GET upon a reset of the virtual device.
+
+The management device MUST fail the virtqueue status access if
+\field{device_id} is 0.
+
+\drivernormative{\subsubsection}{Virtqueue Status}{Virtio Transport Option=
s / Virtio
+Over Transport Virtqueue / Virtqueue Status}
+
+The driver MUST configure other virtqueue fields before enabling
+the virtqueue with VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET.
+
+\subsection{Virtqueue Size}\label{sec:Virtio Transport Options / Virtio Ov=
er
+Transport Virtqueue / Virtqueue Size}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+virtqueue size is accessed through the following command:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_SIZE    10
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_SET       0
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_GET       1
+
+struct virtio_transportq_ctrl_vdev_vq_size_set {
+       u16 queue_index;
+       u16 size;
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_SET command is used to set the virtqueue
+size. The command-out-data is the queue index and the size of the
+virtqueue (as described in struct
+virtio_transportq_ctrl_vdev_vq_size_set). There's no command-in-data.
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_GET command is used to get the virtqueue
+size. On reset, the maximum queue size supported by the device is
+returned. The command-out-data is an u16 of the virtqueue index. The
+command-in-data is an u16 of queue size for the virtqueue.
+
+\devicenormative{\subsubsection}{Virtqueue Status}{Virtio Transport Option=
s / Virtio
+Over Transport Virtqueue / Virtqueue Size}
+
+The management device MUST fail the virtqueue size access if
+\field{device_id} is 0.
+
+\subsection{Virtqueue Notification}\label{sec:Virtio Transport Options / V=
irtio
+Over Transport Virtqueue / Virtqueue Notification}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+the virtqueue notification is done through the following commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY    11
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET          1
+
+struct virtio_transportq_ctrl_vdev_vq_notification_area {
+       le64 addr
+       le64 size;
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET is used to get the transport
+specific address area that can be used to notify a virtqueue. The
+command-out-data is an u16 of the virtqueue index. The command-in-data
+contains the address and the size of the notification area (as
+described in struct virtio_transportq_ctrl_vdev_vq_notification_area).
+
+\devicenormative{\subsubsection}{Virtqueue Notification}{Virtio Transport =
Options /
+Virtio Over Transport Virtqueue / Virtqueue Notification}
+
+The management device MUST fail the VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET com=
mand
+if there's no transport specific notification address for a virtqueue of
+its virtual device.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Then how can we kick a device =
in this case?</pre>
    </blockquote>
    <font face=3D"monospace">I think I should remove this sub-section.
      Because there should be a notification area, or it is<br>
      a defective device, and if failed to get the notification area,
      the command should set a proper<br>
      ack value reflecting the error<br>
    </font>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+
+The management device MUST fail the virtqueue notification access if
+\field{device_id} is 0.
+
+The management device MUST forbid the notification area of a specific
+virtual device to be accessed from another virtual device.
+
+\drivernormative{\subsubsection}{Virtqueue Notification}{Virtio Transport =
Options /
+Virtio Over Transport Virtqueue / Virtqueue Notification}
+
+The driver MAY choose to notify the virtqueue by writing the queue
+index at address \field{addr} which is fetched from the
+VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET command.
+
+\subsection{Virtqueue Index}\label{sec:Virtio Transport Options / Virtio
+Over Transport Virtqueue / Virtqueue Index}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+the virtqueue available index is accessed through the following commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_AVAIL_INDEX    12
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_AVAIL_INDEX_SET       0
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_ AVAIL_INDEX_GET       1
+
+struct virtio_transportq_ctrl_vdev_vq_avail_idx_set {
+        u16 queue_index;
+        u16 avail_idx;
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_AVAIL_INDEX_SET commmand is used to set the av=
ailable index of a specific virtqueue.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">s/commmand/command/g

We need the support of packed virtqueue as well here.</pre>
    </blockquote>
    <font face=3D"monospace">sure, will work on this.</font><br>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+The command-out-data is the=
 virtqueue index and the available index (as described in struct virtio_tra=
nsportq_ctrl_vdev_vq_avail_idx).
+There is no command-in-data.
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_ AVAIL_INDEX_GET command is used to get the av=
ailable index of a specific virtqueue.
+The command-out-data is the queue index, the command-in-data is the availa=
ble index of the queue.
+
+\devicenormative{\subsubsection}{Virtqueue Index}{Virtio Transport Options=
 /
+Virtio Over Transport Virtqueue / Virtqueue Index}
+
+The management device MUST fail the virtqueue index access if \field{devic=
e_id} is 0
+The management device MUST fail the virtqueue index access if \field{queue=
_id} is invalid.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">We don't have similar normativ=
es for other commands, anything make
this command different?</pre>
    </blockquote>
    <font face=3D"monospace">If it is PCI, if we set queue_select to an
      invalid value, I think it is a undefined behavior, this could be
      ignored by the hardware,<br>
      the device has no ways to report such errors.<br>
      <br>
      Here, for the transport virtqueue, it is a must to return an ACK
      value, and it can be meaningful, like VIRTIO_TRANSPTQ_EINVAL</font>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+
+\subsection{Presenting Virtual Devices}\label{sec:Virtio Transport Options=
 /
+Virtio Over Transport Virtqueue / Presenting Virtual Device}
+
+If VIRTIO_TRANSPTQ_F_VDEV is offered by a management device. The presentin=
g of
+the virtual devices requires co-operation between the management
+driver and the transport virtqueue. This means, from the view of the
+virtual device driver, the transport is done via the communication
+with the management device driver. It's up to the software to decide
+what kind of method that is needed be used for those communications.
+
+The management driver typically takes the following steps for creating a
+virtual device:
+
+\begin{enumerate}
+\item Determine the virtio id and device specific configuration.
+\item Create the virtual devices using the virtio_transportq_ctrl_vdev_CRE=
ATE command.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Need to use the upper case for=
 the command name here.</pre>
    </blockquote>
    <font face=3D"monospace">yes</font><br>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+\item Optionally, configure=
 the MSI.
+\item Perform device specific setup.
+\item Let the virtual device to be probed by the virtual device
+driver. The management driver will then use the transport virtqueue to
+implement the requests of basic facility from the virtual device
+driver.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">I think we need to be more ver=
bose here, e.g to mention the actual
command that is used.</pre>
    </blockquote>
    <font face=3D"monospace">sure, will add these</font><br>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+\end{enumerate}

 \chapter{Device Types}\label{sec:Device Types}

@@ -2911,12 +3524,14 @@ \subsection{Virtqueues}\label{sec:Device Types / Ne=
twork Device / Virtqueues}
 \item[2(N-1)] receiveqN
 \item[2(N-1)+1] transmitqN
 \item[2N] controlq
+\item[2N+1] transportq
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Let's use a separate patch for=
 this.</pre>
    </blockquote>
    <font face=3D"monospace">can do.<br>
      <br>
      Thanks for your review!<br>
    </font>
    <blockquote type=3D"cite"
cite=3D"mid:CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3D3weWNwweO2Q@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D""> \end{description}

  N=3D1 if neither VIRTIO_NET_F_MQ nor VIRTIO_NET_F_RSS are negotiated, oth=
erwise N is set by
  \field{max_virtqueue_pairs}.

- controlq only exists if VIRTIO_NET_F_CTRL_VQ set.
+ controlq only exists if VIRTIO_NET_F_CTRL_VQ set.\\
+ transportq only exists if VIRTIO_F_TRNSPT_VQ is offered.

 \subsection{Feature bits}\label{sec:Device Types / Network Device / Featur=
e bits}

@@ -4399,10 +5014,12 @@ \subsection{Virtqueues}\label{sec:Device Types / Bl=
ock Device / Virtqueues}
 \item[0] requestq1
 \item[\ldots]
 \item[N-1] requestqN
+\item[N] transportq
 \end{description}

  N=3D1 if VIRTIO_BLK_F_MQ is not negotiated, otherwise N is set by
- \field{num_queues}.
+ \field{num_queues}.\\
+ transportq only exists if VIRTIO_F_TRNSPT_VQ is offered.

 \subsection{Feature bits}\label{sec:Device Types / Block Device / Feature =
bits}

diff --git a/introduction.tex b/introduction.tex
index 6d52717..de3839b 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -79,6 +79,9 @@ \section{Normative References}\label{sec:Normative Refere=
nces}
        \phantomsection\label{intro:SCMI}\textbf{[SCMI]} &amp;
        Arm System Control and Management Interface, DEN0056,
        \newline\url{<a class=3D"moz-txt-link-freetext" href=3D"https://dev=
eloper.arm.com/docs/den0056/c">https://developer.arm.com/docs/den0056/c</a>=
}, version C and any future revisions\\
+       \phantomsection\la=C3=A7bel{intro:SIOV}\textbf{[SIOV]} &amp;
+       Scalable I/O Virtualization,
+       \newline\url{<a class=3D"moz-txt-link-freetext" href=3D"https://www=
.opencompute.org/documents/ocp-scalable-io-virtualization-technical-specifi=
cation-revision-1-v1-2-pdf">https://www.opencompute.org/documents/ocp-scala=
ble-io-virtualization-technical-specification-revision-1-v1-2-pdf</a>}\\

 \end{longtable} v
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">This publicly archived list of=
fers a means to provide input to the

OASIS Virtual I/O Device (VIRTIO) TC.



In order to verify user consent to the Feedback License terms and

to minimize spam in the list archive, subscription is required

before posting.



Subscribe: <a class=3D"moz-txt-link-abbreviated moz-txt-link-freetext" href=
=3D"mailto:virtio-comment-subscribe@lists.oasis-open.org">virtio-comment-su=
bscribe@lists.oasis-open.org</a>

Unsubscribe: <a class=3D"moz-txt-link-abbreviated moz-txt-link-freetext" hr=
ef=3D"mailto:virtio-comment-unsubscribe@lists.oasis-open.org">virtio-commen=
t-unsubscribe@lists.oasis-open.org</a>

List help: <a class=3D"moz-txt-link-abbreviated moz-txt-link-freetext" href=
=3D"mailto:virtio-comment-help@lists.oasis-open.org">virtio-comment-help@li=
sts.oasis-open.org</a>

List archive: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.oasi=
s-open.org/archives/virtio-comment/">https://lists.oasis-open.org/archives/=
virtio-comment/</a>

Feedback License: <a class=3D"moz-txt-link-freetext" href=3D"https://www.oa=
sis-open.org/who/ipr/feedback_license.pdf">https://www.oasis-open.org/who/i=
pr/feedback_license.pdf</a>

List Guidelines: <a class=3D"moz-txt-link-freetext" href=3D"https://www.oas=
is-open.org/policies-guidelines/mailing-lists">https://www.oasis-open.org/p=
olicies-guidelines/mailing-lists</a>

Committee: <a class=3D"moz-txt-link-freetext" href=3D"https://www.oasis-ope=
n.org/committees/virtio/">https://www.oasis-open.org/committees/virtio/</a>

Join OASIS: <a class=3D"moz-txt-link-freetext" href=3D"https://www.oasis-op=
en.org/join/">https://www.oasis-open.org/join/</a>

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------M0GGyuIfbxdPzPmmaucit4JO--

