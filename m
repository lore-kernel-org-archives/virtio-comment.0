Return-Path: <virtio-comment-return-2051-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9306E98636D
	for <virtio-comment@lists.oasis-open.org>; Fri, 23 Jul 2021 09:57:12 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20210722162336.23990-1-mgurtovoy@nvidia.com>
References: <20210722162336.23990-1-mgurtovoy@nvidia.com>
Date: Fri, 23 Jul 2021 11:56:59 +0200
Message-ID: <87tukl5p5g.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [RFC PATCH 1/1] Add virtio Admin Virtqueue
 specification
Content-Type: text/plain
To: Max Gurtovoy <mgurtovoy@nvidia.com>, virtio-comment@lists.oasis-open.org, mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com
Cc: oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com, Max Gurtovoy <mgurtovoy@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jul 22 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:

> Admin virtqueues will be used to send administrative commands to
> manipulate various features of the device which would not easily map
> into the configuration space.
>
> The same Admin command format will be used for all virtio devices. The
> Admin command set will include 4 types of command classes:
> 1. The generic common class
> 2. The transport specific class
> 3. The device specific class
> 4. The vendor specific class
>
> The above mechanism will enable adding various features to the virtio
> specification, e.g.:
> 1. Format virtio-blk devices in various configurations (512B block size,
>    512B + 8B T10-DIF, 4K block size, 4k + 8B T10-DIF, etc..).
> 2. Live migration management.
> 3. Encrypt/Decrypt descriptors.
> 4. Virtualization management.
> 5. Get device error logs.
> 6. Implement advanced vendor/device/transport specific features.
> 7. Run device health test.
> 8. More.
>
> As virtio evolves beyond the para-virt/sw-emulated world, it's mandatory
> for the specification to become flexible and allow a wider feature set.
> The corrent ctrl virtq that is defined for some of the virtio devices is
> device specific and wasn't designed to be a generic virtq for
> admininistration.
>
> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> ---
>  admin-virtq.tex | 69 +++++++++++++++++++++++++++++++++++++++++++++++++
>  content.tex     |  4 +++
>  2 files changed, 73 insertions(+)
>  create mode 100644 admin-virtq.tex
>
> diff --git a/admin-virtq.tex b/admin-virtq.tex
> new file mode 100644
> index 0000000..dc1d2cd
> --- /dev/null
> +++ b/admin-virtq.tex
> @@ -0,0 +1,69 @@
> +\section{Admin Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues}
> +
> +Admin virtqueues are used to send administrative commands to manipulate
> +various features of the device which would not easily map into the
> +configuration space. Admin virtqueues are also used to get advance
> +device properties.

What are "advance device properties"?

> +
> +Use of Admin virtqueues is negotiated by the VIRTIO_F_ADMIN_VQ
> +feature bit.
> +
> +Admin virtqueue index may vary among different device types.

So, the idea is that every device type that supports this states
something like: "If VIRTIO_F_ADMIN_VQ is negotiated, queue<i> is an
admin virtqueue."?

> +
> +All commands are of the following form:
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd {
> +        /* Device-readable part */
> +        u8 class;
> +        u8 command;
> +        u8 command-specific-data[];
> +
> +        /* Device-writable part */
> +        u8 command-specific-result[];
> +        u8 status_type : 4;
> +        u8 reserved : 4;
> +        u8 status;
> +};
> +
> +/* Status type values */
> +#define VIRTIO_ADMIN_STATUS_TYPE_GENERIC               0
> +#define VIRTIO_ADMIN_STATUS_TYPE_CLASS_SPECIFIC        1
> +#define VIRTIO_ADMIN_STATUS_TYPE_COMMAND_SPECIFIC      2
> +#define VIRTIO_ADMIN_STATUS_TYPE_TRANSPORT_SPECIFIC    3
> +#define VIRTIO_ADMIN_STATUS_TYPE_DEVICE_SPECIFIC       4
> +#define VIRTIO_ADMIN_STATUS_TYPE_VENDOR_SPECIFIC       5
> +
> +/* Generic status values */
> +#define VIRTIO_ADMIN_STATUS_GENERIC_OK                     0
> +#define VIRTIO_ADMIN_STATUS_GENERIC_ERR                    1
> +#define VIRTIO_ADMIN_STATUS_GENERIC_INVALID_CLASS          2
> +#define VIRTIO_ADMIN_STATUS_GENERIC_INVALID_COMMAND        3
> +#define VIRTIO_ADMIN_STATUS_GENERIC_DATA_TRANSFER_ERR      4
> +#define VIRTIO_ADMIN_STATUS_GENERIC_DEVICE_INTERNAL_ERR    5
> +\end{lstlisting}

I'd probably rather chop up the status namespace. I.e.
- first bit indicates ok or error
- next i bits indicate any generic errors
- next j bits indicate transport-specific errors
- next m bits indicate device type (class) specific errors
- next n bits indicate command-specific errors

(and ditch status_type/reserve, while making status u16)

> +
> +The \field{class}, \field{command} and \field{command-specific-data} are
> +set by the driver, and the device sets the \field{status_type}, the
> +\field{status} and  the \field{command-specific-result}, if needed.
> +
> +The virtio Admin command class codes are divided in the following form:
> +
> +\begin{lstlisting}
> +/* class values that are transport, device and vendor independent */
> +#define VIRTIO_ADMIN_COMMON_CLASS_START    0
> +#define VIRTIO_ADMIN_COMMON_CLASS_END      63
> +
> +/* class values that are transport specific */
> +#define VIRTIO_ADMIN_TRANSPORT_CLASS_START  64
> +#define VIRTIO_ADMIN_TRANSPORT_CLASS_END    127
> +
> +/* class values that are device specific */
> +#define VIRTIO_ADMIN_DEVICE_CLASS_START     128
> +#define VIRTIO_ADMIN_DEVICE_CLASS_END       191
> +
> +/* class values that are vendor specific */
> +#define VIRTIO_ADMIN_VENDOR_CLASS_START     192
> +#define VIRTIO_ADMIN_VENDOR_CLASS_END       255
> +\end{lstlisting}

I'd probably also make command a 16-bit value and divide up the
namespace between the different cases (i.e. no separate setting of class
and command.)

How can the driver find out which commands the device supports? Should
we define a generic discovery command? Should it all be handled via
feature bits?


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

