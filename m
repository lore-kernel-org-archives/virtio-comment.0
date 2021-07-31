Return-Path: <mgurtovoy@nvidia.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com>
 <20210730032625-mutt-send-email-mst@kernel.org>
 <0bffb13f-4e88-266d-e072-bafa44ec86fe@nvidia.com>
 <20210731175617-mutt-send-email-mst@kernel.org>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <8360728a-68e7-3727-be2c-20b3a259a633@nvidia.com>
Date: Sun, 1 Aug 2021 02:46:13 +0300
MIME-Version: 1.0
In-Reply-To: <20210731175617-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, jasowang@redhat.com, cohuck@redhat.com, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 8/1/2021 1:17 AM, Michael S. Tsirkin wrote:
> On Sat, Jul 31, 2021 at 02:53:45PM +0300, Max Gurtovoy wrote:
>> On 7/30/2021 10:36 AM, Michael S. Tsirkin wrote:
>>> On Thu, Jul 29, 2021 at 05:51:07PM +0300, Max Gurtovoy wrote:
>>>> On 7/28/2021 3:48 PM, Michael S. Tsirkin wrote:
>>>>> On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wrote:
>>>>>> Admin virtqueues will be used to send administrative commands to
>>>>>> manipulate various features of the device which would not easily map
>>>>>> into the configuration space.
>>>>>>
>>>>>> The same Admin command format will be used for all virtio devices. T=
he
>>>>>> Admin command set will include 4 types of command classes:
>>>>>> 1. The generic common class
>>>>>> 2. The transport specific class
>>>>>> 3. The device specific class
>>>>>> 4. The vendor specific class
>>>>>>
>>>>>> The above mechanism will enable adding various features to the virti=
o
>>>>>> specification, e.g.:
>>>>>> 1. Format virtio-blk devices in various configurations (512B block s=
ize,
>>>>>>       512B + 8B T10-DIF, 4K block size, 4k + 8B T10-DIF, etc..).
>>>>>> 2. Live migration management.
>>>>>> 3. Encrypt/Decrypt descriptors.
>>>>>> 4. Virtualization management.
>>>>>> 5. Get device error logs.
>>>>>> 6. Implement advanced vendor/device/transport specific features.
>>>>>> 7. Run device health test.
>>>>>> 8. More.
> I still don't really see what do all these things have in common?

I don't think you need to look on this in that direction.

This is a queue for administration.

Cornelia and Stefan already agreed on this approach.

Please lets progress and not go back to the beginning.

> Why are they grouped behind the same feature bit? Share same VQ?

They are grouped behind an admin q.


>
>>>>>> As virtio evolves beyond the para-virt/sw-emulated world, it's manda=
tory
>>>>>> for the specification to become flexible and allow a wider feature s=
et.
>>>>>> The corrent ctrl virtq that is defined for some of the virtio device=
s is
>>>>>> device specific and wasn't designed to be a generic virtq for
>>>>>> admininistration.
>>>>>>
>>>>>> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
>>>>> Lots of things on this list seem to make sense when
>>>>> done from PF and affecting a VF.
>>>>> I think from this POV the generic structure should include
>>>>> a way to address one device from another.
>>>> This will be defined per command.
>>>>
>>>> For example, funcion_id will be given as command data.
>>> Why? Sounds like a generic thing to me.
>> Generic to a command that handles virtualization management.
>
> It could be that mixing up virtualization management and arbitrary
> other management commands in the same interface is a mistake.

It's not a mistake.

This is the right design.

Creating a new interface for each feature is madness.


> Or maybe not - do we want host to have ability to run health tests
> for a VF without loading VF driver? Get error logs?

This can be an optional feature.

We need to define it in the future. We can't define the entire command=20
set now.

We need to define the infrastructure.

>
> In fact besides migration and virtualization management the rest of
> examples that you give all seem to be more or less device specific, with
> the possible exception of 3. Encrypt/Decrypt descriptors.  what does
> this one imply, exactly?

For storage devices there is an option to have a self encrypted drive.

Maybe we can develop encryption/decryption also=C2=A0 for net devices.

This will be developed in the future.

But the infrastructure will allow it. This is the beauty if it, you=20
create infrastructure today and add optional commands tomorrow.

Nobody can think of thousands of features and commands today, and we=20
also can't push thousands of pages to the spec.

Lets push 2-3 mandatory commands with the infrastructure and build new=20
features incrementally.

>
>
>
>> It has nothing to do with a discovery command for the device itself.
>>
>> I guess we can add few bytes to be mandatory after the <u8 class, u8
>> command> pair.
>>
>> Something like <u8 class, u8 command, u16 mandatory_command_data >.
>>
>> But I think it's not a must and it's already covered by:=C2=A0 "u8
>> command-specific-data[];"
> I would say we should include the device ID as well as a definition
> what the ID is at least for SRIOV. This isn't a command
> specific data, any virt management command will need this.

of course it will be defined for virt management. But is only for PCI=20
devices.

Not needed for MMIO devices, right ?

>
>
>>>
>>>>>> ---
>>>>>>     admin-virtq.tex | 241 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>>>>>>     content.tex     |   4 +
>>>>>>     2 files changed, 245 insertions(+)
>>>>>>     create mode 100644 admin-virtq.tex
>>>>>>
>>>>>> diff --git a/admin-virtq.tex b/admin-virtq.tex
>>>>>> new file mode 100644
>>>>>> index 0000000..ccec2ca
>>>>>> --- /dev/null
>>>>>> +++ b/admin-virtq.tex
>>>>>> @@ -0,0 +1,241 @@
>>>>>> +\section{Admin Virtqueues}\label{sec:Basic Facilities of a Virtio D=
evice / Admin Virtqueues}
>>>>>> +
>>>>>> +Admin virtqueues are used to send administrative commands to manipu=
late
>>>>>> +various features of the device which would not easily map into the
>>>>>> +configuration space.
>>>>>> +
>>>>>> +Use of Admin virtqueues is negotiated by the VIRTIO_F_ADMIN_VQ
>>>>>> +feature bit.
>>>>>> +
>>>>>> +Admin virtqueue index may vary among different device types.
>>>>>> +
>>>>>> +All commands are of the following form:
>>>>>> +
>>>>>> +\begin{lstlisting}
>>>>>> +struct virtio_admin_cmd {
>>>>>> +        /* Device-readable part */
>>>>>> +        u8 class;
>>>>>> +        u8 command;
>>>>>> +        u8 command-specific-data[];
>>>>>> +
>>>>>> +        /* Device-writable part */
>>>>>> +        u8 command-specific-result[];
>>>>>> +        u8 status_type : 4;
>>>>>> +        u8 reserved : 4;
>>>>>> +        u8 status;
>>>>>> +};
>>>>>> +
>>>>>> +/* Status type values */
>>>>>> +#define VIRTIO_ADMIN_STATUS_TYPE_GENERIC               0
>>>>>> +#define VIRTIO_ADMIN_STATUS_TYPE_CLASS_SPECIFIC        1
>>>>>> +#define VIRTIO_ADMIN_STATUS_TYPE_COMMAND_SPECIFIC      2
>>>>>> +#define VIRTIO_ADMIN_STATUS_TYPE_TRANSPORT_SPECIFIC    3
>>>>>> +#define VIRTIO_ADMIN_STATUS_TYPE_DEVICE_SPECIFIC       4
>>>>>> +#define VIRTIO_ADMIN_STATUS_TYPE_VENDOR_SPECIFIC       5
>>>>>> +
>>>>>> +/* Generic status values */
>>>>>> +#define VIRTIO_ADMIN_STATUS_GENERIC_OK                     0
>>>>>> +#define VIRTIO_ADMIN_STATUS_GENERIC_ERR                    1
>>>>>> +#define VIRTIO_ADMIN_STATUS_GENERIC_INVALID_CLASS          2
>>>>>> +#define VIRTIO_ADMIN_STATUS_GENERIC_INVALID_COMMAND        3
>>>>>> +#define VIRTIO_ADMIN_STATUS_GENERIC_DATA_TRANSFER_ERR      4
>>>>>> +#define VIRTIO_ADMIN_STATUS_GENERIC_DEVICE_INTERNAL_ERR    5
>>>>>> +\end{lstlisting}
>>>>>> +
>>>>>> +The \field{class}, \field{command} and \field{command-specific-data=
} are
>>>>>> +set by the driver, and the device sets the \field{status_type}, the
>>>>>> +\field{status} and  the \field{command-specific-result}, if needed.
>>>>>> +
>>>>>> +The virtio Admin command class codes are divided in the following f=
orm:
>>>>>> +
>>>>>> +\begin{lstlisting}
>>>>>> +/* class values that are transport, device and vendor independent *=
/
>>>>>> +#define VIRTIO_ADMIN_COMMON_CLASS_START    0
>>>>>> +#define VIRTIO_ADMIN_COMMON_CLASS_END      63
>>>>>> +
>>>>>> +/* class values that are transport specific */
>>>>>> +#define VIRTIO_ADMIN_TRANSPORT_CLASS_START  64
>>>>>> +#define VIRTIO_ADMIN_TRANSPORT_CLASS_END    127
>>>>>> +
>>>>>> +/* class values that are device specific */
>>>>>> +#define VIRTIO_ADMIN_DEVICE_CLASS_START     128
>>>>>> +#define VIRTIO_ADMIN_DEVICE_CLASS_END       191
>>>>>> +
>>>>>> +/* class values that are vendor specific */
>>>>>> +#define VIRTIO_ADMIN_VENDOR_CLASS_START     192
>>>>>> +#define VIRTIO_ADMIN_VENDOR_CLASS_END       255
>>>>>> +\end{lstlisting}
>>>>>> +
>>>>>> +\subsection{Admin command set}\label{sec:Basic Facilities of a Virt=
io Device / Admin Virtqueues / Admin command set}
>>>>>> +
>>>>>> +Each virtio device that advertise VIRTIO_F_ADMIN_VQ feature, MUST
>>>>>> +support all the mandatory admin commands. A device MAY support also
>>>>>> +one or more optional admin commands.
>>>>>> +
>>>>>> +\subsubsection{Common command set}\label{sec:Basic Facilities of a =
Virtio Device / Admin Virtqueues / Admin command set / Common command set}
>>>>>> +
>>>>>> +The Common command set is a group of classes and commands within ea=
ch
>>>>>> +of these classes which are transport, device and vendor independent=
.
>>>>>> +A mandatory class is a class that has at least one mandatory comman=
d.
>>>>>> +The Common command set is summarized in following table:
>>>>>> +
>>>>>> +\begin{tabular}{|l|l|l|}
>>>>>> +\hline
>>>>>> +Class  & Description    & M/O \\
>>>>>> +\hline \hline
>>>>>> +0  & VIRTIO_ADMIN_DISCOVER_DEVICE    & M \\
>>>>>> +\hline
>>>>>> +1  & VIRTIO_ADMIN_DISCOVER_DEVICE_CLASS_COMMANDS    & M \\
>>>>>> +\hline
>>>>>> +2-63  & reserved    & - \\
>>>>>> +\hline
>>>>>> +\end{tabular}
>>>>>> +
>>>>>> +\paragraph{Discover device class}\label{sec:Basic Facilities of a V=
irtio Device / Admin Virtqueues / Admin command set / Common command set / =
Discover device class}
>>>>>> +
>>>>>> +This class (opcode: 0) of commands is used to query generic device
>>>>>> +information. The following table describes the commands supported f=
or
>>>>>> +this class:
>>>>>> +
>>>>>> +\begin{tabular}{|l|l|l|}
>>>>>> +\hline
>>>>>> +Command  & Description    & M/O \\
>>>>>> +\hline \hline
>>>>>> +0  & VIRTIO_ADMIN_DISCOVER_DEVICE_IDENTITY    & M \\
>>>>>> +\hline
>>>>>> +1  & VIRTIO_ADMIN_DISCOVER_DEVICE_SUPPORTED_CLASSES    & M \\
>>>>>> +\hline
>>>>>> +2-255  & reserved    & - \\
>>>>>> +\hline
>>>>>> +\end{tabular}
>>>>> So there are several problems with this approach.
>>>>> One is that there is no two way negotiation.
>>>> you negotiate the adminq feature.
>>>>
>>>> then you can send admin commands and discover the supported commands.
>>>>
>>>>> No way for device to know what will driver use in the end.
>>>> device will be designed to support mandatory admin commands and some
>>>> optional.
>>>>
>>>> It doesn't need to care whether the driver will use it or not.
>>>>> This breaks things like e.g. accelerating some configurations
>>>>> but not others.
>>>> I don't understand what it breaks exactly.
>>> Long practice taught us that it is good for device to know
>>> what is driver going to use.
>>> For example, some features can be implemented in hardware
>>> and some in hypervisor software. If driver is going to use software
>>> features then you need to switch to a slower software
>>> implementation. Doing that dynamically at time of use is
>>> often much harder that up-front at negotiation time.
>> I don't think we should write specifications that should consider hyperv=
isor
>> SW.
> Well considering hypervisors is clearly one of the purposes of virtio TC.
> Look it up in the charter, section 2. Statement of Purpose.
>
>
>> You might use virtio device without hypervisor at all.
> Yes and supporting that is also clearly an objective:
>
> =09With the 1.1, 1.2 and future revisions of the Specification, we aim to
> =09evolve the VIRTIO standard further, addressing such new requirements
> =09while both continuing to honor the goals of the 1.0 Specification and
> =09including new objectives.
>
>
There is nothing in admin queue that doesn't honor old spec.

Old driver will not be aware of it.


>
>>>>> Another is that everything is going through the admin vq.
>>>>> Hard for hypervisor to intervene and change just some aspects
>>>>> of the device.
>>>> we'll develop virtio-cli tool.
>>> will that be part of the spec somehow then?
>>> I'm not sure it can be ...
>> of course not.
>>
>> This is just a channel for the admin to send admin command to the virtio
>> device.
>>
>>>> I don't know what should be changed in the device by the hypervisor.
>>> Look at vdpa as an example, guest device can be different from
>>> host device.
>> VDPA is an acceleration. I can write different acceleration on to of vir=
tio
>> device.
>>
>> Is shouldn't be considered in the specification.
>>
>> Nevertheless, there is nothing in this RFC that VDPA can't handle.
>>
>>
>>>>> This is also a problem for validation, tricky
>>>>> to find out during probe what does device support and whether
>>>>> driver can work with it.
>>>> device will support admin q with mandatory commands.
>>>>
>>>> Old driver shouldn't care and it won't negotiate this feature.
>>>>
>>>> New drivers will adjust and will be extended.
>>> Does not sound like I got the issue across.
>>>
>>> Operating VQs just to know whether to bind to device is
>>> problematic since there's an assumption that once
>>> DRIVER_OK is set driver is happy. Before DRIVER_OK
>>> device will not consume buffers.
>> Nothing is changed in DRIVER_OK negotiation rules.
> Right and that means you can't really use the admin vq to validate
> device during driver probe.
You said that before DRIVER_OK is set the device will not consume=20
buffers, so what is the question/problem here ?

Do you think we need to change it ? I don't think it's needed.

>
>
>>>
>>>>> Can't we map this stuff into memory instead?
>>>>> Maybe have an admin config structure
>>>>> that is separate from regular config?
>>>>> Only issue we can't then make it too big.
>>>>> But so far I don't see a lot of info used, most is reserved.
>>>> This is initial commit to add infrastructure. I can't add 255 commands=
 at
>>>> once.
>>>>
>>>> We need to add it incrementally.
>>> How about a list of future extensions?
>> Added a partial list in the commit message and in the answer to Cornelia=
.
>>
>>
>>>
>>>>>
>>>>>> +
>>>>>> +\subparagraph{Device identity command}\label{sec:Basic Facilities o=
f a Virtio Device / Admin Virtqueues / Admin command set / Common command s=
et / Discover device class / Device identity command}
>>>>>> +
>>>>>> +This mandatory command should return device identity in the followi=
ng
>>>>>> +structure:
>>>>>> +
>>>>>> +\begin{tabular}{|l|l|l|}
>>>>>> +\hline
>>>>>> +Bytes  & Description    & M/O \\
>>>>>> +\hline \hline
>>>>>> +03:00  & VIRTIO DEVICE ID    & M \\
>>>>>> +\hline
>>>>>> +05:04  & VIRTIO TRANSPORT ID    & M \\
>>>>>> +\hline
>>>>>> +4095:06  & reserved    & - \\
>>>>>> + \hline
>>>>>> +\end{tabular}
>>>>>> +
>>>>>> +\subparagraph{Device supported classes command}\label{sec:Basic Fac=
ilities of a Virtio Device / Admin Virtqueues / Admin command set / Common =
command set / Discover device class / Device supported classes command}
>>>>>> +
>>>>>> +This mandatory command should return device identity in the followi=
ng
>>>>>> +structure:
>>>>>> +
>>>>>> +\begin{tabular}{|l|l|l|}
>>>>>> +\hline
>>>>>> +Bytes  & Description    & M/O \\
>>>>>> +\hline \hline
>>>>>> +03:00  & VIRTIO_ADMIN_CLASS_0_PROPERTIES    & M \\
>>>>>> +\hline
>>>>>> +07:04  & VIRTIO_ADMIN_CLASS_1_PROPERTIES    & M \\
>>>>>> + \hline
>>>>>> +11:08  & VIRTIO_ADMIN_CLASS_2_PROPERTIES    & M \\
>>>>>> +\hline
>>>>>> +...  & ...    & M \\
>>>>>> +\hline
>>>>>> +1023:1020  & VIRTIO_ADMIN_CLASS_255_PROPERTIES    & M \\
>>>>>> +\hline
>>>>>> +4095:1024  & reserved    & - \\
>>>>>> +\hline
>>>>>> +\end{tabular}
>>>>>> +
>>>>>> +The above structure is divided to 256 sections of 4B each, that wil=
l
>>>>>> +describe whether a device supports a certain class code. The
>>>>>> +following 3072B are reserved. each of the non-reserved 4B sections =
will
>>>>>> +follow the following data structure:
>>>>>> +
>>>>>> +\begin{tabular}{|l|l|l|}
>>>>>> +\hline
>>>>>> +Bits  & Description    & M/O \\
>>>>>> +\hline \hline
>>>>>> +0  & SUPPORTED (1: yes, 0:no)    & M \\
>>>>>> +\hline
>>>>>> +31:01  & reserved    & - \\
>>>>>> + \hline
>>>>>> +\end{tabular}
>>>>>> +
>>>>>> +\paragraph{Discover device class commands class}\label{sec:Basic Fa=
cilities of a Virtio Device / Admin Virtqueues / Admin command set / Common=
 command set / Discover device class commands class}
>>>>>> +
>>>>>> +This class (opcode: 1) of commands is used to query supported comma=
nds
>>>>>> +for each supported device class.
>>>>>> The following table describes the commands
>>>>>> +supported for this class:
>>>>>> +
>>>>>> +\begin{tabular}{|l|l|l|}
>>>>>> +\hline
>>>>>> +Command  & Description    & M/O \\
>>>>>> +\hline \hline
>>>>>> +0  & VIRTIO_ADMIN_CLASS_0_COMMANDS_IDENTITY    & M \\
>>>>>> +\hline
>>>>>> +1  & VIRTIO_ADMIN_CLASS_1_COMMANDS_IDENTITY    & M \\
>>>>>> +\hline
>>>>>> +2  & VIRTIO_ADMIN_CLASS_2_COMMANDS_IDENTITY    & M \\
>>>>>> +\hline
>>>>>> +...  & ...    & M \\
>>>>>> +\hline
>>>>>> +255  & VIRTIO_ADMIN_CLASS_255_COMMANDS_IDENTITY    & M \\
>>>>>> +\hline
>>>>>> +\end{tabular}
>>>>>> +
>>>>>> +Each command in this class, will return class identity in the follo=
wing structure:
>>>>>> +
>>>>>> +\begin{tabular}{|l|l|l|}
>>>>>> +\hline
>>>>>> +Bytes  & Description    & M/O \\
>>>>>> +\hline \hline
>>>>>> +03:00  & VIRTIO_ADMIN_COMMAND_0_PROPERTIES    & M \\
>>>>>> +\hline
>>>>>> +07:04  & VIRTIO_ADMIN_COMMAND_1_PROPERTIES    & M \\
>>>>>> + \hline
>>>>>> +11:08  & VIRTIO_ADMIN_COMMAND_2_PROPERTIES    & M \\
>>>>>> +\hline
>>>>>> +...  & ...    & M \\
>>>>>> +\hline
>>>>>> +1023:1020  & VIRTIO_ADMIN_COMMAND_255_PROPERTIES    & M \\
>>>>>> +\hline
>>>>>> +4095:1024  & reserved    & - \\
>>>>>> +\hline
>>>>>> +\end{tabular}
>>>>>> +
>>>>>> +The above structure is divided to 256 sections of 4B each, that wil=
l
>>>>>> +describe whether a class supports a certain command code. The
>>>>>> +following 3072B are reserved. each of the non-reserved 4B sections =
will
>>>>>> +follow the following data structure:
>>>>>> +
>>>>>> +\begin{tabular}{|l|l|l|}
>>>>>> +\hline
>>>>>> +Bits  & Description    & M/O \\
>>>>>> +\hline \hline
>>>>>> +0  & SUPPORTED (1: yes, 0:no)    & M \\
>>>>>> +\hline
>>>>>> +31:01  & reserved    & - \\
>>>>>> + \hline
>>>>>> +\end{tabular}
>>>>>> +
>>>>>> +\subsubsection{Transport command set}\label{sec:Basic Facilities of=
 a Virtio Device / Admin Virtqueues / Admin command set / Transport command=
 set}
>>>>>> +
>>>>>> +The Transport command set is a group of classes and commands within
>>>>>> +each of these classes which are transport specific. Refer to each
>>>>>> +transport section for more information on the supported commands.
>>>>>> +
>>>>>> +\subsubsection{Device command set}\label{sec:Basic Facilities of a =
Virtio Device / Admin Virtqueues / Admin command set / Device command set}
>>>>>> +
>>>>>> +The Device command set is a group of classes and commands within
>>>>>> +each of these classes which are device specific. Refer to each
>>>>>> +device section for more information on the supported commands.
>>>>>> +
>>>>>> +\subsubsection{Vendor specific command set}\label{sec:Basic Facilit=
ies of a Virtio Device / Admin Virtqueues / Admin command set / Vendor spec=
ific command set}
>>>>>> +
>>>>>> +The Vendor specific command set is a group of classes and commands
>>>>>> +within each of these classes which are vendor specific. Refer to
>>>>>> +each vendor specification for more information on the supported
>>>>>> +commands.
>>>>> Here's another example.
>>>>> It's important that there is a way to make a device completely
>>>>> generic without vendor specific expensions.
>>>>> Would be hard to do here.
>>>>>
>>>>> That's a generic comment.
>>>>>
>>>>> but specifically I am very reluctant to add vendor specific stuff lik=
e
>>>>> this directly in the spec. We already have VIRTIO_PCI_CAP_VENDOR_CFG
>>>>> and if that is not sufficient I would like to know why
>>>>> before we add more vendor specific stuff.
>>>> We are adding an option to add vendor specific commands. We're not add=
ing it
>>>> to the spec since each vendor will have its own manual for that.
>>> You didn't actually answer the question though.
>>>
>>>> For example, we can use virtio-cli to pass command from command line t=
o
>>>> device in pass-through manner without changing driver.
>>>>
>>> Opaque strings passed all the way from guest userspace to host device?
>>> Not sure why is that a good idea.
>> Where did I mentioned a guest ?
>>
>> Virtio-cli will control a device on the same host that it runs.
>>
>> If it's a bare metal host so it will manage the virtio attached device.
>>
>> If it's a guest it will manage the device attached to the guest.
> Opaqueness of all this is what worries at least me and Cornelia.

guest is not aware of host devices.

Sending raw command from Linux cmdline to a device is not something I=20
invented.

If a user is aware of its HW he can use the virtio-cli tool to configure=20
its unique features.

And if the user is not so smart, we can help him with adding vendor=20
classes to virtio-cli management tool.


>
>>>>>> diff --git a/content.tex b/content.tex
>>>>>> index c266fd5..d350175 100644
>>>>>> --- a/content.tex
>>>>>> +++ b/content.tex
>>>>>> @@ -407,6 +407,8 @@ \section{Exporting Objects}\label{sec:Basic Faci=
lities of a Virtio Device / Expo
>>>>>>     types. It is RECOMMENDED that devices generate version 4
>>>>>>     UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
>>>>>> +\input{admin-virtq.tex}
>>>>>> +
>>>>>>     \chapter{General Initialization And Device Operation}\label{sec:=
General Initialization And Device Operation}
>>>>>>     We start with an overview of device initialization, then expand =
on the
>>>>>> @@ -6671,6 +6673,8 @@ \chapter{Reserved Feature Bits}\label{sec:Rese=
rved Feature Bits}
>>>>>>       data to be provided in driver notification and the delivery me=
thod is
>>>>>>       transport specific.
>>>>>>       For more details about driver notifications over PCI see \ref{=
sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initializ=
ation And Device Operation / Available Buffer Notifications}.
>>>>>> +  \item[VIRTIO_F_ADMIN_VQ(40)] This feature indicates that
>>>>>> +  the device supports administration virtqueue negotiation.
>>>>>>     \end{description}
>>>>>> --=20
>>>>>> 2.21.0

