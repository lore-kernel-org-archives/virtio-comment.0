Return-Path: <mgurtovoy@nvidia.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com>
Date: Thu, 29 Jul 2021 17:51:07 +0300
MIME-Version: 1.0
In-Reply-To: <20210728083306-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, jasowang@redhat.com, cohuck@redhat.com, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 7/28/2021 3:48 PM, Michael S. Tsirkin wrote:
> On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wrote:
>> Admin virtqueues will be used to send administrative commands to
>> manipulate various features of the device which would not easily map
>> into the configuration space.
>>
>> The same Admin command format will be used for all virtio devices. The
>> Admin command set will include 4 types of command classes:
>> 1. The generic common class
>> 2. The transport specific class
>> 3. The device specific class
>> 4. The vendor specific class
>>
>> The above mechanism will enable adding various features to the virtio
>> specification, e.g.:
>> 1. Format virtio-blk devices in various configurations (512B block size,
>>     512B + 8B T10-DIF, 4K block size, 4k + 8B T10-DIF, etc..).
>> 2. Live migration management.
>> 3. Encrypt/Decrypt descriptors.
>> 4. Virtualization management.
>> 5. Get device error logs.
>> 6. Implement advanced vendor/device/transport specific features.
>> 7. Run device health test.
>> 8. More.
>>
>> As virtio evolves beyond the para-virt/sw-emulated world, it's mandatory
>> for the specification to become flexible and allow a wider feature set.
>> The corrent ctrl virtq that is defined for some of the virtio devices is
>> device specific and wasn't designed to be a generic virtq for
>> admininistration.
>>
>> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> Lots of things on this list seem to make sense when
> done from PF and affecting a VF.
> I think from this POV the generic structure should include
> a way to address one device from another.

This will be defined per command.

For example, funcion_id will be given as command data.


>
>> ---
>>   admin-virtq.tex | 241 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   content.tex     |   4 +
>>   2 files changed, 245 insertions(+)
>>   create mode 100644 admin-virtq.tex
>>
>> diff --git a/admin-virtq.tex b/admin-virtq.tex
>> new file mode 100644
>> index 0000000..ccec2ca
>> --- /dev/null
>> +++ b/admin-virtq.tex
>> @@ -0,0 +1,241 @@
>> +\section{Admin Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues}
>> +
>> +Admin virtqueues are used to send administrative commands to manipulate
>> +various features of the device which would not easily map into the
>> +configuration space.
>> +
>> +Use of Admin virtqueues is negotiated by the VIRTIO_F_ADMIN_VQ
>> +feature bit.
>> +
>> +Admin virtqueue index may vary among different device types.
>> +
>> +All commands are of the following form:
>> +
>> +\begin{lstlisting}
>> +struct virtio_admin_cmd {
>> +        /* Device-readable part */
>> +        u8 class;
>> +        u8 command;
>> +        u8 command-specific-data[];
>> +
>> +        /* Device-writable part */
>> +        u8 command-specific-result[];
>> +        u8 status_type : 4;
>> +        u8 reserved : 4;
>> +        u8 status;
>> +};
>> +
>> +/* Status type values */
>> +#define VIRTIO_ADMIN_STATUS_TYPE_GENERIC               0
>> +#define VIRTIO_ADMIN_STATUS_TYPE_CLASS_SPECIFIC        1
>> +#define VIRTIO_ADMIN_STATUS_TYPE_COMMAND_SPECIFIC      2
>> +#define VIRTIO_ADMIN_STATUS_TYPE_TRANSPORT_SPECIFIC    3
>> +#define VIRTIO_ADMIN_STATUS_TYPE_DEVICE_SPECIFIC       4
>> +#define VIRTIO_ADMIN_STATUS_TYPE_VENDOR_SPECIFIC       5
>> +
>> +/* Generic status values */
>> +#define VIRTIO_ADMIN_STATUS_GENERIC_OK                     0
>> +#define VIRTIO_ADMIN_STATUS_GENERIC_ERR                    1
>> +#define VIRTIO_ADMIN_STATUS_GENERIC_INVALID_CLASS          2
>> +#define VIRTIO_ADMIN_STATUS_GENERIC_INVALID_COMMAND        3
>> +#define VIRTIO_ADMIN_STATUS_GENERIC_DATA_TRANSFER_ERR      4
>> +#define VIRTIO_ADMIN_STATUS_GENERIC_DEVICE_INTERNAL_ERR    5
>> +\end{lstlisting}
>> +
>> +The \field{class}, \field{command} and \field{command-specific-data} are
>> +set by the driver, and the device sets the \field{status_type}, the
>> +\field{status} and  the \field{command-specific-result}, if needed.
>> +
>> +The virtio Admin command class codes are divided in the following form:
>> +
>> +\begin{lstlisting}
>> +/* class values that are transport, device and vendor independent */
>> +#define VIRTIO_ADMIN_COMMON_CLASS_START    0
>> +#define VIRTIO_ADMIN_COMMON_CLASS_END      63
>> +
>> +/* class values that are transport specific */
>> +#define VIRTIO_ADMIN_TRANSPORT_CLASS_START  64
>> +#define VIRTIO_ADMIN_TRANSPORT_CLASS_END    127
>> +
>> +/* class values that are device specific */
>> +#define VIRTIO_ADMIN_DEVICE_CLASS_START     128
>> +#define VIRTIO_ADMIN_DEVICE_CLASS_END       191
>> +
>> +/* class values that are vendor specific */
>> +#define VIRTIO_ADMIN_VENDOR_CLASS_START     192
>> +#define VIRTIO_ADMIN_VENDOR_CLASS_END       255
>> +\end{lstlisting}
>> +
>> +\subsection{Admin command set}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set}
>> +
>> +Each virtio device that advertise VIRTIO_F_ADMIN_VQ feature, MUST
>> +support all the mandatory admin commands. A device MAY support also
>> +one or more optional admin commands.
>> +
>> +\subsubsection{Common command set}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Common command set}
>> +
>> +The Common command set is a group of classes and commands within each
>> +of these classes which are transport, device and vendor independent.
>> +A mandatory class is a class that has at least one mandatory command.
>> +The Common command set is summarized in following table:
>> +
>> +\begin{tabular}{|l|l|l|}
>> +\hline
>> +Class  & Description    & M/O \\
>> +\hline \hline
>> +0  & VIRTIO_ADMIN_DISCOVER_DEVICE    & M \\
>> +\hline
>> +1  & VIRTIO_ADMIN_DISCOVER_DEVICE_CLASS_COMMANDS    & M \\
>> +\hline
>> +2-63  & reserved    & - \\
>> +\hline
>> +\end{tabular}
>> +
>> +\paragraph{Discover device class}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Common command set / Discover device class}
>> +
>> +This class (opcode: 0) of commands is used to query generic device
>> +information. The following table describes the commands supported for
>> +this class:
>> +
>> +\begin{tabular}{|l|l|l|}
>> +\hline
>> +Command  & Description    & M/O \\
>> +\hline \hline
>> +0  & VIRTIO_ADMIN_DISCOVER_DEVICE_IDENTITY    & M \\
>> +\hline
>> +1  & VIRTIO_ADMIN_DISCOVER_DEVICE_SUPPORTED_CLASSES    & M \\
>> +\hline
>> +2-255  & reserved    & - \\
>> +\hline
>> +\end{tabular}
> So there are several problems with this approach.
> One is that there is no two way negotiation.

you negotiate the adminq feature.

then you can send admin commands and discover the supported commands.


> No way for device to know what will driver use in the end.

device will be designed to support mandatory admin commands and some 
optional.

It doesn't need to care whether the driver will use it or not.

> This breaks things like e.g. accelerating some configurations
> but not others.

I don't understand what it breaks exactly.

>
> Another is that everything is going through the admin vq.
> Hard for hypervisor to intervene and change just some aspects
> of the device.

we'll develop virtio-cli tool.

I don't know what should be changed in the device by the hypervisor.


>
> This is also a problem for validation, tricky
> to find out during probe what does device support and whether
> driver can work with it.

device will support admin q with mandatory commands.

Old driver shouldn't care and it won't negotiate this feature.

New drivers will adjust and will be extended.


>
>
> Can't we map this stuff into memory instead?
> Maybe have an admin config structure
> that is separate from regular config?
> Only issue we can't then make it too big.
> But so far I don't see a lot of info used, most is reserved.

This is initial commit to add infrastructure. I can't add 255 commands 
at once.

We need to add it incrementally.

>
>
>
>> +
>> +\subparagraph{Device identity command}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Common command set / Discover device class / Device identity command}
>> +
>> +This mandatory command should return device identity in the following
>> +structure:
>> +
>> +\begin{tabular}{|l|l|l|}
>> +\hline
>> +Bytes  & Description    & M/O \\
>> +\hline \hline
>> +03:00  & VIRTIO DEVICE ID    & M \\
>> +\hline
>> +05:04  & VIRTIO TRANSPORT ID    & M \\
>> +\hline
>> +4095:06  & reserved    & - \\
>> + \hline
>> +\end{tabular}
>> +
>> +\subparagraph{Device supported classes command}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Common command set / Discover device class / Device supported classes command}
>> +
>> +This mandatory command should return device identity in the following
>> +structure:
>> +
>> +\begin{tabular}{|l|l|l|}
>> +\hline
>> +Bytes  & Description    & M/O \\
>> +\hline \hline
>> +03:00  & VIRTIO_ADMIN_CLASS_0_PROPERTIES    & M \\
>> +\hline
>> +07:04  & VIRTIO_ADMIN_CLASS_1_PROPERTIES    & M \\
>> + \hline
>> +11:08  & VIRTIO_ADMIN_CLASS_2_PROPERTIES    & M \\
>> +\hline
>> +...  & ...    & M \\
>> +\hline
>> +1023:1020  & VIRTIO_ADMIN_CLASS_255_PROPERTIES    & M \\
>> +\hline
>> +4095:1024  & reserved    & - \\
>> +\hline
>> +\end{tabular}
>> +
>> +The above structure is divided to 256 sections of 4B each, that will
>> +describe whether a device supports a certain class code. The
>> +following 3072B are reserved. each of the non-reserved 4B sections will
>> +follow the following data structure:
>> +
>> +\begin{tabular}{|l|l|l|}
>> +\hline
>> +Bits  & Description    & M/O \\
>> +\hline \hline
>> +0  & SUPPORTED (1: yes, 0:no)    & M \\
>> +\hline
>> +31:01  & reserved    & - \\
>> + \hline
>> +\end{tabular}
>> +
>> +\paragraph{Discover device class commands class}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Common command set / Discover device class commands class}
>> +
>> +This class (opcode: 1) of commands is used to query supported commands
>> +for each supported device class.
>> The following table describes the commands
>> +supported for this class:
>> +
>> +\begin{tabular}{|l|l|l|}
>> +\hline
>> +Command  & Description    & M/O \\
>> +\hline \hline
>> +0  & VIRTIO_ADMIN_CLASS_0_COMMANDS_IDENTITY    & M \\
>> +\hline
>> +1  & VIRTIO_ADMIN_CLASS_1_COMMANDS_IDENTITY    & M \\
>> +\hline
>> +2  & VIRTIO_ADMIN_CLASS_2_COMMANDS_IDENTITY    & M \\
>> +\hline
>> +...  & ...    & M \\
>> +\hline
>> +255  & VIRTIO_ADMIN_CLASS_255_COMMANDS_IDENTITY    & M \\
>> +\hline
>> +\end{tabular}
>> +
>> +Each command in this class, will return class identity in the following structure:
>> +
>> +\begin{tabular}{|l|l|l|}
>> +\hline
>> +Bytes  & Description    & M/O \\
>> +\hline \hline
>> +03:00  & VIRTIO_ADMIN_COMMAND_0_PROPERTIES    & M \\
>> +\hline
>> +07:04  & VIRTIO_ADMIN_COMMAND_1_PROPERTIES    & M \\
>> + \hline
>> +11:08  & VIRTIO_ADMIN_COMMAND_2_PROPERTIES    & M \\
>> +\hline
>> +...  & ...    & M \\
>> +\hline
>> +1023:1020  & VIRTIO_ADMIN_COMMAND_255_PROPERTIES    & M \\
>> +\hline
>> +4095:1024  & reserved    & - \\
>> +\hline
>> +\end{tabular}
>> +
>> +The above structure is divided to 256 sections of 4B each, that will
>> +describe whether a class supports a certain command code. The
>> +following 3072B are reserved. each of the non-reserved 4B sections will
>> +follow the following data structure:
>> +
>> +\begin{tabular}{|l|l|l|}
>> +\hline
>> +Bits  & Description    & M/O \\
>> +\hline \hline
>> +0  & SUPPORTED (1: yes, 0:no)    & M \\
>> +\hline
>> +31:01  & reserved    & - \\
>> + \hline
>> +\end{tabular}
>> +
>> +\subsubsection{Transport command set}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Transport command set}
>> +
>> +The Transport command set is a group of classes and commands within
>> +each of these classes which are transport specific. Refer to each
>> +transport section for more information on the supported commands.
>> +
>> +\subsubsection{Device command set}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Device command set}
>> +
>> +The Device command set is a group of classes and commands within
>> +each of these classes which are device specific. Refer to each
>> +device section for more information on the supported commands.
>> +
>> +\subsubsection{Vendor specific command set}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Vendor specific command set}
>> +
>> +The Vendor specific command set is a group of classes and commands
>> +within each of these classes which are vendor specific. Refer to
>> +each vendor specification for more information on the supported
>> +commands.
> Here's another example.
> It's important that there is a way to make a device completely
> generic without vendor specific expensions.
> Would be hard to do here.
>
> That's a generic comment.
>
> but specifically I am very reluctant to add vendor specific stuff like
> this directly in the spec. We already have VIRTIO_PCI_CAP_VENDOR_CFG
> and if that is not sufficient I would like to know why
> before we add more vendor specific stuff.

We are adding an option to add vendor specific commands. We're not 
adding it to the spec since each vendor will have its own manual for that.

For example, we can use virtio-cli to pass command from command line to 
device in pass-through manner without changing driver.


>
>
>> diff --git a/content.tex b/content.tex
>> index c266fd5..d350175 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -407,6 +407,8 @@ \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Expo
>>   types. It is RECOMMENDED that devices generate version 4
>>   UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
>>   
>> +\input{admin-virtq.tex}
>> +
>>   \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
>>   
>>   We start with an overview of device initialization, then expand on the
>> @@ -6671,6 +6673,8 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>>     data to be provided in driver notification and the delivery method is
>>     transport specific.
>>     For more details about driver notifications over PCI see \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Available Buffer Notifications}.
>> +  \item[VIRTIO_F_ADMIN_VQ(40)] This feature indicates that
>> +  the device supports administration virtqueue negotiation.
>>   
>>   \end{description}
>>   
>> -- 
>> 2.21.0

