Return-Path: <mgurtovoy@nvidia.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <6de5eb17-1d0d-45d5-b1fa-e21989341b4f@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <29acb062-e541-3359-cbdb-b777249c222c@nvidia.com>
Date: Mon, 2 Aug 2021 12:51:30 +0300
MIME-Version: 1.0
In-Reply-To: <6de5eb17-1d0d-45d5-b1fa-e21989341b4f@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, cohuck@redhat.com, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 8/2/2021 5:25 AM, Jason Wang wrote:
>
> =E5=9C=A8 2021/7/28 =E4=B8=8B=E5=8D=888:48, Michael S. Tsirkin =E5=86=99=
=E9=81=93:
>> On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wrote:
>>> Admin virtqueues will be used to send administrative commands to
>>> manipulate various features of the device which would not easily map
>>> into the configuration space.
>>>
>>> The same Admin command format will be used for all virtio devices. The
>>> Admin command set will include 4 types of command classes:
>>> 1. The generic common class
>>> 2. The transport specific class
>>> 3. The device specific class
>>> 4. The vendor specific class
>>>
>>> The above mechanism will enable adding various features to the virtio
>>> specification, e.g.:
>>> 1. Format virtio-blk devices in various configurations (512B block=20
>>> size,
>>> =C2=A0=C2=A0=C2=A0 512B + 8B T10-DIF, 4K block size, 4k + 8B T10-DIF, e=
tc..).
>>> 2. Live migration management.
>>> 3. Encrypt/Decrypt descriptors.
>>> 4. Virtualization management.
>>> 5. Get device error logs.
>>> 6. Implement advanced vendor/device/transport specific features.
>>> 7. Run device health test.
>>> 8. More.
>>>
>>> As virtio evolves beyond the para-virt/sw-emulated world, it's=20
>>> mandatory
>>> for the specification to become flexible and allow a wider feature set.
>>> The corrent ctrl virtq that is defined for some of the virtio=20
>>> devices is
>>> device specific and wasn't designed to be a generic virtq for
>>> admininistration.
>>>
>>> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
>> Lots of things on this list seem to make sense when
>> done from PF and affecting a VF.
>> I think from this POV the generic structure should include
>> a way to address one device from another.
>>
>>
>>> ---
>>> =C2=A0 admin-virtq.tex | 241=20
>>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>> =C2=A0 content.tex=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
>>> =C2=A0 2 files changed, 245 insertions(+)
>>> =C2=A0 create mode 100644 admin-virtq.tex
>>>
>>> diff --git a/admin-virtq.tex b/admin-virtq.tex
>>> new file mode 100644
>>> index 0000000..ccec2ca
>>> --- /dev/null
>>> +++ b/admin-virtq.tex
>>> @@ -0,0 +1,241 @@
>>> +\section{Admin Virtqueues}\label{sec:Basic Facilities of a Virtio=20
>>> Device / Admin Virtqueues}
>>> +
>>> +Admin virtqueues are used to send administrative commands to=20
>>> manipulate
>>> +various features of the device which would not easily map into the
>>> +configuration space.
>>> +
>>> +Use of Admin virtqueues is negotiated by the VIRTIO_F_ADMIN_VQ
>>> +feature bit.
>>> +
>>> +Admin virtqueue index may vary among different device types.
>>> +
>>> +All commands are of the following form:
>>> +
>>> +\begin{lstlisting}
>>> +struct virtio_admin_cmd {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Device-readable part */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 class;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 command;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 command-specific-data[];
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Device-writable part */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 command-specific-result[=
];
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 status_type : 4;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 reserved : 4;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 status;
>>> +};
>>> +
>>> +/* Status type values */
>>> +#define VIRTIO_ADMIN_STATUS_TYPE_GENERIC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
>>> +#define VIRTIO_ADMIN_STATUS_TYPE_CLASS_SPECIFIC=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 1
>>> +#define VIRTIO_ADMIN_STATUS_TYPE_COMMAND_SPECIFIC=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 2
>>> +#define VIRTIO_ADMIN_STATUS_TYPE_TRANSPORT_SPECIFIC=C2=A0=C2=A0=C2=A0 =
3
>>> +#define VIRTIO_ADMIN_STATUS_TYPE_DEVICE_SPECIFIC=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 4
>>> +#define VIRTIO_ADMIN_STATUS_TYPE_VENDOR_SPECIFIC=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 5
>>> +
>>> +/* Generic status values */
>>> +#define VIRTIO_ADMIN_STATUS_GENERIC_OK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0
>>> +#define VIRTIO_ADMIN_STATUS_GENERIC_ERR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 1
>>> +#define VIRTIO_ADMIN_STATUS_GENERIC_INVALID_CLASS=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2
>>> +#define VIRTIO_ADMIN_STATUS_GENERIC_INVALID_COMMAND=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 3
>>> +#define VIRTIO_ADMIN_STATUS_GENERIC_DATA_TRANSFER_ERR=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 4
>>> +#define VIRTIO_ADMIN_STATUS_GENERIC_DEVICE_INTERNAL_ERR=C2=A0=C2=A0=C2=
=A0 5
>>> +\end{lstlisting}
>>> +
>>> +The \field{class}, \field{command} and=20
>>> \field{command-specific-data} are
>>> +set by the driver, and the device sets the \field{status_type}, the
>>> +\field{status} and=C2=A0 the \field{command-specific-result}, if neede=
d.
>>> +
>>> +The virtio Admin command class codes are divided in the following=20
>>> form:
>>> +
>>> +\begin{lstlisting}
>>> +/* class values that are transport, device and vendor independent */
>>> +#define VIRTIO_ADMIN_COMMON_CLASS_START=C2=A0=C2=A0=C2=A0 0
>>> +#define VIRTIO_ADMIN_COMMON_CLASS_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 63
>>> +
>>> +/* class values that are transport specific */
>>> +#define VIRTIO_ADMIN_TRANSPORT_CLASS_START=C2=A0 64
>>> +#define VIRTIO_ADMIN_TRANSPORT_CLASS_END=C2=A0=C2=A0=C2=A0 127
>>> +
>>> +/* class values that are device specific */
>>> +#define VIRTIO_ADMIN_DEVICE_CLASS_START=C2=A0=C2=A0=C2=A0=C2=A0 128
>>> +#define VIRTIO_ADMIN_DEVICE_CLASS_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 191
>>> +
>>> +/* class values that are vendor specific */
>>> +#define VIRTIO_ADMIN_VENDOR_CLASS_START=C2=A0=C2=A0=C2=A0=C2=A0 192
>>> +#define VIRTIO_ADMIN_VENDOR_CLASS_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 255
>>> +\end{lstlisting}
>>> +
>>> +\subsection{Admin command set}\label{sec:Basic Facilities of a=20
>>> Virtio Device / Admin Virtqueues / Admin command set}
>>> +
>>> +Each virtio device that advertise VIRTIO_F_ADMIN_VQ feature, MUST
>>> +support all the mandatory admin commands. A device MAY support also
>>> +one or more optional admin commands.
>>> +
>>> +\subsubsection{Common command set}\label{sec:Basic Facilities of a=20
>>> Virtio Device / Admin Virtqueues / Admin command set / Common=20
>>> command set}
>>> +
>>> +The Common command set is a group of classes and commands within each
>>> +of these classes which are transport, device and vendor independent.
>>> +A mandatory class is a class that has at least one mandatory command.
>>> +The Common command set is summarized in following table:
>>> +
>>> +\begin{tabular}{|l|l|l|}
>>> +\hline
>>> +Class=C2=A0 & Description=C2=A0=C2=A0=C2=A0 & M/O \\
>>> +\hline \hline
>>> +0=C2=A0 & VIRTIO_ADMIN_DISCOVER_DEVICE=C2=A0=C2=A0=C2=A0 & M \\
>>> +\hline
>>> +1=C2=A0 & VIRTIO_ADMIN_DISCOVER_DEVICE_CLASS_COMMANDS=C2=A0=C2=A0=C2=
=A0 & M \\
>>> +\hline
>>> +2-63=C2=A0 & reserved=C2=A0=C2=A0=C2=A0 & - \\
>>> +\hline
>>> +\end{tabular}
>>> +
>>> +\paragraph{Discover device class}\label{sec:Basic Facilities of a=20
>>> Virtio Device / Admin Virtqueues / Admin command set / Common=20
>>> command set / Discover device class}
>>> +
>>> +This class (opcode: 0) of commands is used to query generic device
>>> +information. The following table describes the commands supported for
>>> +this class:
>>> +
>>> +\begin{tabular}{|l|l|l|}
>>> +\hline
>>> +Command=C2=A0 & Description=C2=A0=C2=A0=C2=A0 & M/O \\
>>> +\hline \hline
>>> +0=C2=A0 & VIRTIO_ADMIN_DISCOVER_DEVICE_IDENTITY=C2=A0=C2=A0=C2=A0 & M =
\\
>>> +\hline
>>> +1=C2=A0 & VIRTIO_ADMIN_DISCOVER_DEVICE_SUPPORTED_CLASSES & M \\
>>> +\hline
>>> +2-255=C2=A0 & reserved=C2=A0=C2=A0=C2=A0 & - \\
>>> +\hline
>>> +\end{tabular}
>> So there are several problems with this approach.
>> One is that there is no two way negotiation.
>> No way for device to know what will driver use in the end.
>> This breaks things like e.g. accelerating some configurations
>> but not others.
>>
>> Another is that everything is going through the admin vq.
>> Hard for hypervisor to intervene and change just some aspects
>> of the device.
>>
>> This is also a problem for validation, tricky
>> to find out during probe what does device support and whether
>> driver can work with it.
>
>
> Yes, so I think it makes sense to make the admin virtqueue as a=20
> transport and then build other stuffs on top.


what transport exactly ?

it should be a virtq for devices to open.


>
>
>>
>>
>> Can't we map this stuff into memory instead?
>> Maybe have an admin config structure
>> that is separate from regular config?
>> Only issue we can't then make it too big.
>> But so far I don't see a lot of info used, most is reserved.
>
>
> It should work (especially for PCI).

you're trying to invent some mechanism that is not flexible and non trivial=
.

You have already a virtq - so lets use it.



>
> Thanks
>
>
>>
>>
>>
>>> +
>>> +\subparagraph{Device identity command}\label{sec:Basic Facilities=20
>>> of a Virtio Device / Admin Virtqueues / Admin command set / Common=20
>>> command set / Discover device class / Device identity command}
>>> +
>>> +This mandatory command should return device identity in the following
>>> +structure:
>>> +
>>> +\begin{tabular}{|l|l|l|}
>>> +\hline
>>> +Bytes=C2=A0 & Description=C2=A0=C2=A0=C2=A0 & M/O \\
>>> +\hline \hline
>>> +03:00=C2=A0 & VIRTIO DEVICE ID=C2=A0=C2=A0=C2=A0 & M \\
>>> +\hline
>>> +05:04=C2=A0 & VIRTIO TRANSPORT ID=C2=A0=C2=A0=C2=A0 & M \\
>>> +\hline
>>> +4095:06=C2=A0 & reserved=C2=A0=C2=A0=C2=A0 & - \\
>>> + \hline
>>> +\end{tabular}
>>> +
>>> +\subparagraph{Device supported classes command}\label{sec:Basic=20
>>> Facilities of a Virtio Device / Admin Virtqueues / Admin command set=20
>>> / Common command set / Discover device class / Device supported=20
>>> classes command}
>>> +
>>> +This mandatory command should return device identity in the following
>>> +structure:
>>> +
>>> +\begin{tabular}{|l|l|l|}
>>> +\hline
>>> +Bytes=C2=A0 & Description=C2=A0=C2=A0=C2=A0 & M/O \\
>>> +\hline \hline
>>> +03:00=C2=A0 & VIRTIO_ADMIN_CLASS_0_PROPERTIES=C2=A0=C2=A0=C2=A0 & M \\
>>> +\hline
>>> +07:04=C2=A0 & VIRTIO_ADMIN_CLASS_1_PROPERTIES=C2=A0=C2=A0=C2=A0 & M \\
>>> + \hline
>>> +11:08=C2=A0 & VIRTIO_ADMIN_CLASS_2_PROPERTIES=C2=A0=C2=A0=C2=A0 & M \\
>>> +\hline
>>> +...=C2=A0 & ...=C2=A0=C2=A0=C2=A0 & M \\
>>> +\hline
>>> +1023:1020=C2=A0 & VIRTIO_ADMIN_CLASS_255_PROPERTIES=C2=A0=C2=A0=C2=A0 =
& M \\
>>> +\hline
>>> +4095:1024=C2=A0 & reserved=C2=A0=C2=A0=C2=A0 & - \\
>>> +\hline
>>> +\end{tabular}
>>> +
>>> +The above structure is divided to 256 sections of 4B each, that will
>>> +describe whether a device supports a certain class code. The
>>> +following 3072B are reserved. each of the non-reserved 4B sections=20
>>> will
>>> +follow the following data structure:
>>> +
>>> +\begin{tabular}{|l|l|l|}
>>> +\hline
>>> +Bits=C2=A0 & Description=C2=A0=C2=A0=C2=A0 & M/O \\
>>> +\hline \hline
>>> +0=C2=A0 & SUPPORTED (1: yes, 0:no)=C2=A0=C2=A0=C2=A0 & M \\
>>> +\hline
>>> +31:01=C2=A0 & reserved=C2=A0=C2=A0=C2=A0 & - \\
>>> + \hline
>>> +\end{tabular}
>>> +
>>> +\paragraph{Discover device class commands class}\label{sec:Basic=20
>>> Facilities of a Virtio Device / Admin Virtqueues / Admin command set=20
>>> / Common command set / Discover device class commands class}
>>> +
>>> +This class (opcode: 1) of commands is used to query supported commands
>>> +for each supported device class.
>>> The following table describes the commands
>>> +supported for this class:
>>> +
>>> +\begin{tabular}{|l|l|l|}
>>> +\hline
>>> +Command=C2=A0 & Description=C2=A0=C2=A0=C2=A0 & M/O \\
>>> +\hline \hline
>>> +0=C2=A0 & VIRTIO_ADMIN_CLASS_0_COMMANDS_IDENTITY=C2=A0=C2=A0=C2=A0 & M=
 \\
>>> +\hline
>>> +1=C2=A0 & VIRTIO_ADMIN_CLASS_1_COMMANDS_IDENTITY=C2=A0=C2=A0=C2=A0 & M=
 \\
>>> +\hline
>>> +2=C2=A0 & VIRTIO_ADMIN_CLASS_2_COMMANDS_IDENTITY=C2=A0=C2=A0=C2=A0 & M=
 \\
>>> +\hline
>>> +...=C2=A0 & ...=C2=A0=C2=A0=C2=A0 & M \\
>>> +\hline
>>> +255=C2=A0 & VIRTIO_ADMIN_CLASS_255_COMMANDS_IDENTITY=C2=A0=C2=A0=C2=A0=
 & M \\
>>> +\hline
>>> +\end{tabular}
>>> +
>>> +Each command in this class, will return class identity in the=20
>>> following structure:
>>> +
>>> +\begin{tabular}{|l|l|l|}
>>> +\hline
>>> +Bytes=C2=A0 & Description=C2=A0=C2=A0=C2=A0 & M/O \\
>>> +\hline \hline
>>> +03:00=C2=A0 & VIRTIO_ADMIN_COMMAND_0_PROPERTIES=C2=A0=C2=A0=C2=A0 & M =
\\
>>> +\hline
>>> +07:04=C2=A0 & VIRTIO_ADMIN_COMMAND_1_PROPERTIES=C2=A0=C2=A0=C2=A0 & M =
\\
>>> + \hline
>>> +11:08=C2=A0 & VIRTIO_ADMIN_COMMAND_2_PROPERTIES=C2=A0=C2=A0=C2=A0 & M =
\\
>>> +\hline
>>> +...=C2=A0 & ...=C2=A0=C2=A0=C2=A0 & M \\
>>> +\hline
>>> +1023:1020=C2=A0 & VIRTIO_ADMIN_COMMAND_255_PROPERTIES=C2=A0=C2=A0=C2=
=A0 & M \\
>>> +\hline
>>> +4095:1024=C2=A0 & reserved=C2=A0=C2=A0=C2=A0 & - \\
>>> +\hline
>>> +\end{tabular}
>>> +
>>> +The above structure is divided to 256 sections of 4B each, that will
>>> +describe whether a class supports a certain command code. The
>>> +following 3072B are reserved. each of the non-reserved 4B sections=20
>>> will
>>> +follow the following data structure:
>>> +
>>> +\begin{tabular}{|l|l|l|}
>>> +\hline
>>> +Bits=C2=A0 & Description=C2=A0=C2=A0=C2=A0 & M/O \\
>>> +\hline \hline
>>> +0=C2=A0 & SUPPORTED (1: yes, 0:no)=C2=A0=C2=A0=C2=A0 & M \\
>>> +\hline
>>> +31:01=C2=A0 & reserved=C2=A0=C2=A0=C2=A0 & - \\
>>> + \hline
>>> +\end{tabular}
>>> +
>>> +\subsubsection{Transport command set}\label{sec:Basic Facilities of=20
>>> a Virtio Device / Admin Virtqueues / Admin command set / Transport=20
>>> command set}
>>> +
>>> +The Transport command set is a group of classes and commands within
>>> +each of these classes which are transport specific. Refer to each
>>> +transport section for more information on the supported commands.
>>> +
>>> +\subsubsection{Device command set}\label{sec:Basic Facilities of a=20
>>> Virtio Device / Admin Virtqueues / Admin command set / Device=20
>>> command set}
>>> +
>>> +The Device command set is a group of classes and commands within
>>> +each of these classes which are device specific. Refer to each
>>> +device section for more information on the supported commands.
>>> +
>>> +\subsubsection{Vendor specific command set}\label{sec:Basic=20
>>> Facilities of a Virtio Device / Admin Virtqueues / Admin command set=20
>>> / Vendor specific command set}
>>> +
>>> +The Vendor specific command set is a group of classes and commands
>>> +within each of these classes which are vendor specific. Refer to
>>> +each vendor specification for more information on the supported
>>> +commands.
>> Here's another example.
>> It's important that there is a way to make a device completely
>> generic without vendor specific expensions.
>> Would be hard to do here.
>>
>> That's a generic comment.
>>
>> but specifically I am very reluctant to add vendor specific stuff like
>> this directly in the spec. We already have VIRTIO_PCI_CAP_VENDOR_CFG
>> and if that is not sufficient I would like to know why
>> before we add more vendor specific stuff.
>>
>>
>>> diff --git a/content.tex b/content.tex
>>> index c266fd5..d350175 100644
>>> --- a/content.tex
>>> +++ b/content.tex
>>> @@ -407,6 +407,8 @@ \section{Exporting Objects}\label{sec:Basic=20
>>> Facilities of a Virtio Device / Expo
>>> =C2=A0 types. It is RECOMMENDED that devices generate version 4
>>> =C2=A0 UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
>>> =C2=A0 +\input{admin-virtq.tex}
>>> +
>>> =C2=A0 \chapter{General Initialization And Device=20
>>> Operation}\label{sec:General Initialization And Device Operation}
>>> =C2=A0 =C2=A0 We start with an overview of device initialization, then =
expand=20
>>> on the
>>> @@ -6671,6 +6673,8 @@ \chapter{Reserved Feature=20
>>> Bits}\label{sec:Reserved Feature Bits}
>>> =C2=A0=C2=A0=C2=A0 data to be provided in driver notification and the d=
elivery=20
>>> method is
>>> =C2=A0=C2=A0=C2=A0 transport specific.
>>> =C2=A0=C2=A0=C2=A0 For more details about driver notifications over PCI=
 see=20
>>> \ref{sec:Virtio Transport Options / Virtio Over PCI Bus /=20
>>> PCI-specific Initialization And Device Operation / Available Buffer=20
>>> Notifications}.
>>> +=C2=A0 \item[VIRTIO_F_ADMIN_VQ(40)] This feature indicates that
>>> +=C2=A0 the device supports administration virtqueue negotiation.
>>> =C2=A0 =C2=A0 \end{description}
>>> =C2=A0 --
>>> 2.21.0
>

