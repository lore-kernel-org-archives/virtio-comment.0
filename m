Return-Path: <virtio-comment-return-2074-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6021B9863B2
	for <virtio-comment@lists.oasis-open.org>; Tue, 27 Jul 2021 14:28:29 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <YP/ffFbeJpDJ3sTG@stefanha-x1.localdomain>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <YP/ffFbeJpDJ3sTG@stefanha-x1.localdomain>
Date: Tue, 27 Jul 2021 16:28:16 +0200
Message-ID: <87im0v4yrj.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Content-Type: text/plain
To: Stefan Hajnoczi <stefanha@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, jasowang@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Jul 27 2021, Stefan Hajnoczi <stefanha@redhat.com> wrote:

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
>>    512B + 8B T10-DIF, 4K block size, 4k + 8B T10-DIF, etc..).
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
>> ---
>>  admin-virtq.tex | 241 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  content.tex     |   4 +
>>  2 files changed, 245 insertions(+)
>>  create mode 100644 admin-virtq.tex
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

This is very complex, and it feels like we're overengineering this.

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
>
> "advertises the VIRTIO_F_ADMIN_VQ feature"
>
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
>
> These fields are not defined. I wonder why they are necessary - the
> driver should already have this information.

Agreed.

> In general, I'm a little concerned that this whole infrastructure will
> increase the complexity of VIRTIO significantly with little benefit. I
> do think an admin virtqueue makes sense, e.g. for migration, but would
> prefer it if we focus on actual commands first instead of
> infrastructure. That way it will be clear what infrastructure is needed.

A concrete example would be good, but I think we can come up with a
bare-bones spec to start with.

- feature bit for the admin vq, as defined here
- location of the admin vq is device specific
- I think we can get away with two classes, as for feature bits (not
  device specificic and device specific); I don't think we need separate
  classes for transport or vendor specific
- make the format for the request simple (command + length + payload?)

How many different (groups of) commands can we reasonably expect? Do we
need a generic discovery command, or can we get away with a feature bit
covering each new group of commands?


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

