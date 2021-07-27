Return-Path: <mgurtovoy@nvidia.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <YP/ffFbeJpDJ3sTG@stefanha-x1.localdomain> <87im0v4yrj.fsf@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <3657bbc8-3299-97a5-b45a-04030da35c51@nvidia.com>
Date: Tue, 27 Jul 2021 18:29:49 +0300
MIME-Version: 1.0
In-Reply-To: <87im0v4yrj.fsf@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, jasowang@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 7/27/2021 5:28 PM, Cornelia Huck wrote:
> On Tue, Jul 27 2021, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
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
>>> 1. Format virtio-blk devices in various configurations (512B block size,
>>>     512B + 8B T10-DIF, 4K block size, 4k + 8B T10-DIF, etc..).
>>> 2. Live migration management.
>>> 3. Encrypt/Decrypt descriptors.
>>> 4. Virtualization management.
>>> 5. Get device error logs.
>>> 6. Implement advanced vendor/device/transport specific features.
>>> 7. Run device health test.
>>> 8. More.
>>>
>>> As virtio evolves beyond the para-virt/sw-emulated world, it's mandatory
>>> for the specification to become flexible and allow a wider feature set.
>>> The corrent ctrl virtq that is defined for some of the virtio devices is
>>> device specific and wasn't designed to be a generic virtq for
>>> admininistration.
>>>
>>> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
>>> ---
>>>   admin-virtq.tex | 241 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>   content.tex     |   4 +
>>>   2 files changed, 245 insertions(+)
>>>   create mode 100644 admin-virtq.tex
>>>
>>> diff --git a/admin-virtq.tex b/admin-virtq.tex
>>> new file mode 100644
>>> index 0000000..ccec2ca
>>> --- /dev/null
>>> +++ b/admin-virtq.tex
>>> @@ -0,0 +1,241 @@
>>> +\section{Admin Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues}
>>> +
>>> +Admin virtqueues are used to send administrative commands to manipulate
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
>>> +        /* Device-readable part */
>>> +        u8 class;
>>> +        u8 command;
>>> +        u8 command-specific-data[];
>>> +
>>> +        /* Device-writable part */
>>> +        u8 command-specific-result[];
>>> +        u8 status_type : 4;
>>> +        u8 reserved : 4;
>>> +        u8 status;
>>> +};
>>> +
>>> +/* Status type values */
>>> +#define VIRTIO_ADMIN_STATUS_TYPE_GENERIC               0
>>> +#define VIRTIO_ADMIN_STATUS_TYPE_CLASS_SPECIFIC        1
>>> +#define VIRTIO_ADMIN_STATUS_TYPE_COMMAND_SPECIFIC      2
>>> +#define VIRTIO_ADMIN_STATUS_TYPE_TRANSPORT_SPECIFIC    3
>>> +#define VIRTIO_ADMIN_STATUS_TYPE_DEVICE_SPECIFIC       4
>>> +#define VIRTIO_ADMIN_STATUS_TYPE_VENDOR_SPECIFIC       5
>>> +
>>> +/* Generic status values */
>>> +#define VIRTIO_ADMIN_STATUS_GENERIC_OK                     0
>>> +#define VIRTIO_ADMIN_STATUS_GENERIC_ERR                    1
>>> +#define VIRTIO_ADMIN_STATUS_GENERIC_INVALID_CLASS          2
>>> +#define VIRTIO_ADMIN_STATUS_GENERIC_INVALID_COMMAND        3
>>> +#define VIRTIO_ADMIN_STATUS_GENERIC_DATA_TRANSFER_ERR      4
>>> +#define VIRTIO_ADMIN_STATUS_GENERIC_DEVICE_INTERNAL_ERR    5
>>> +\end{lstlisting}
> This is very complex, and it feels like we're overengineering this.

Do you mean the status type and the status ?

>
>>> +
>>> +The \field{class}, \field{command} and \field{command-specific-data} are
>>> +set by the driver, and the device sets the \field{status_type}, the
>>> +\field{status} and  the \field{command-specific-result}, if needed.
>>> +
>>> +The virtio Admin command class codes are divided in the following form:
>>> +
>>> +\begin{lstlisting}
>>> +/* class values that are transport, device and vendor independent */
>>> +#define VIRTIO_ADMIN_COMMON_CLASS_START    0
>>> +#define VIRTIO_ADMIN_COMMON_CLASS_END      63
>>> +
>>> +/* class values that are transport specific */
>>> +#define VIRTIO_ADMIN_TRANSPORT_CLASS_START  64
>>> +#define VIRTIO_ADMIN_TRANSPORT_CLASS_END    127
>>> +
>>> +/* class values that are device specific */
>>> +#define VIRTIO_ADMIN_DEVICE_CLASS_START     128
>>> +#define VIRTIO_ADMIN_DEVICE_CLASS_END       191
>>> +
>>> +/* class values that are vendor specific */
>>> +#define VIRTIO_ADMIN_VENDOR_CLASS_START     192
>>> +#define VIRTIO_ADMIN_VENDOR_CLASS_END       255
>>> +\end{lstlisting}
>>> +
>>> +\subsection{Admin command set}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set}
>>> +
>>> +Each virtio device that advertise VIRTIO_F_ADMIN_VQ feature, MUST
>> "advertises the VIRTIO_F_ADMIN_VQ feature"
>>
>>> +support all the mandatory admin commands. A device MAY support also
>>> +one or more optional admin commands.
>>> +
>>> +\subsubsection{Common command set}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Common command set}
>>> +
>>> +The Common command set is a group of classes and commands within each
>>> +of these classes which are transport, device and vendor independent.
>>> +A mandatory class is a class that has at least one mandatory command.
>>> +The Common command set is summarized in following table:
>>> +
>>> +\begin{tabular}{|l|l|l|}
>>> +\hline
>>> +Class  & Description    & M/O \\
>>> +\hline \hline
>>> +0  & VIRTIO_ADMIN_DISCOVER_DEVICE    & M \\
>>> +\hline
>>> +1  & VIRTIO_ADMIN_DISCOVER_DEVICE_CLASS_COMMANDS    & M \\
>>> +\hline
>>> +2-63  & reserved    & - \\
>>> +\hline
>>> +\end{tabular}
>>> +
>>> +\paragraph{Discover device class}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Common command set / Discover device class}
>>> +
>>> +This class (opcode: 0) of commands is used to query generic device
>>> +information. The following table describes the commands supported for
>>> +this class:
>>> +
>>> +\begin{tabular}{|l|l|l|}
>>> +\hline
>>> +Command  & Description    & M/O \\
>>> +\hline \hline
>>> +0  & VIRTIO_ADMIN_DISCOVER_DEVICE_IDENTITY    & M \\
>>> +\hline
>>> +1  & VIRTIO_ADMIN_DISCOVER_DEVICE_SUPPORTED_CLASSES    & M \\
>>> +\hline
>>> +2-255  & reserved    & - \\
>>> +\hline
>>> +\end{tabular}
>>> +
>>> +\subparagraph{Device identity command}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Common command set / Discover device class / Device identity command}
>>> +
>>> +This mandatory command should return device identity in the following
>>> +structure:
>>> +
>>> +\begin{tabular}{|l|l|l|}
>>> +\hline
>>> +Bytes  & Description    & M/O \\
>>> +\hline \hline
>>> +03:00  & VIRTIO DEVICE ID    & M \\
>>> +\hline
>>> +05:04  & VIRTIO TRANSPORT ID    & M \\
>> These fields are not defined. I wonder why they are necessary - the
>> driver should already have this information.
> Agreed.

These are initial fields.

We can add also model, serial_number and more in the future.


>
>> In general, I'm a little concerned that this whole infrastructure will
>> increase the complexity of VIRTIO significantly with little benefit. I
>> do think an admin virtqueue makes sense, e.g. for migration, but would
>> prefer it if we focus on actual commands first instead of
>> infrastructure. That way it will be clear what infrastructure is needed.

admin virtq is not only for migration.

You'll be able to configure virtio device properties using user space 
tools like: virtio-cli.

For example: format a block device, manage virtual function resources 
using its PF, query for error logs, device health and more.

In the SW world maybe all the above were redundant, but now that you 
have more and more HW virtio devices the protocol should be more 
flexible and adjust.

Few weeks ago I've sent a concrete commands for live migration but then 
I was told that new infrastructure (admin virtq) should be developed and 
this is what I did in this RFC.

if you combine the 2 RFCs you can imagine what is needed here for adding 
Live migration support.

But I want to add it step by step.

We need to agree on the infrastructure.

> A concrete example would be good, but I think we can come up with a
> bare-bones spec to start with.
>
> - feature bit for the admin vq, as defined here
> - location of the admin vq is device specific
> - I think we can get away with two classes, as for feature bits (not
>    device specificic and device specific); I don't think we need separate
>    classes for transport or vendor specific

We need it for live migration probably. It will be a transport class.

Vendor specific is also important to allow vendors develop their special 
souse.

> - make the format for the request simple (command + length + payload?)

I used almost the same format as virtio net ctrl queue.

>
> How many different (groups of) commands can we reasonably expect? Do we
> need a generic discovery command, or can we get away with a feature bit
> covering each new group of commands?

I can't predict the future but IMO we need a discovery command.

We have many devices and more can be added in the future.

