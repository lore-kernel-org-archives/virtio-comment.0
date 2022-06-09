Return-Path: <virtio-comment-return-3110-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E8A5298651B
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Jun 2022 06:50:30 +0000 (UTC)
MIME-Version: 1.0
References: <20220601073330.2468384-1-alvaro.karsz@solid-run.com>
In-Reply-To: <20220601073330.2468384-1-alvaro.karsz@solid-run.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 9 Jun 2022 14:50:12 +0800
Message-ID: <CACGkMEvHG78xA5phUVeFM-+k6ZZk68TABHRKP_WdtL3_=r-qyA@mail.gmail.com>
Subject: [virtio-comment] Re: [PATCH v4] Introduction of Virtio Network device notifications
 coalescing feature.
Content-Type: text/plain; charset="UTF-8"
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Cc: virtio-comment@lists.oasis-open.org, Rabeeh Khoury <rabeeh@solid-run.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Jun 1, 2022 at 3:33 PM Alvaro Karsz <alvaro.karsz@solid-run.com> wrote:
>
> Control a network device notifications coalescing parameters using the control virtqueue.
> A new control class was added: VIRTIO_NET_CTRL_NOTF_COAL.
>
> This class provides 2 commands:
> - VIRTIO_NET_CTRL_NOTF_COAL_TX_SET:
>   Ask the network device to change the tx_usecs and tx_max_buffers parameters.
>   - tx_usecs: Time to delay a notification after a TX buffer is used in microseconds.
>   - tx_max_buffers: Number of TX buffers to delay a notification after a TX buffer is used.
>
> - VIRTIO_NET_CTRL_NOTF_COAL_RX_SET:
>   Ask the network device to change the rx_usecs and rx_max_buffers parameters.
>   - rx_usecs: Time to delay a notification after a RX buffer is used in microseconds.
>   - rx_max_buffers: Number of RX buffers to delay a notification after a RX buffer is used.
> --
> v2:
>         - Usage of notification terminology.
>         - Add a few lines on what device should do when driver asked to
>           suppress notifications.
>
> v3:
>         - Remove whitespaces.
>         - Explain with examples how the device should act.
>
> v4:
>         - Example of a scenarion when VIRTIO_F_EVENT_IDX is negotiated.
>         - Usage of separate commands for RX coalescing and TX  coalescing.
> --
>
> Signed-off-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
> ---
>  content.tex | 88 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>
> diff --git a/content.tex b/content.tex
> index 7508dd1..2c75056 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -3084,6 +3084,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
>
> +\item[VIRTIO_NET_F_NOTF_COAL(55)] Device supports notifications coalescing.
> +
>  \item[VIRTIO_NET_F_HOST_USO (56)] Device can receive USO packets. Unlike UFO
>   (fragmenting the packet) the USO splits large UDP packet
>   to several segments when each of these smaller packets has UDP header.
> @@ -3129,6 +3131,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
>  \item[VIRTIO_NET_F_GUEST_ANNOUNCE] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_MQ] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
> +\item[VIRTIO_NET_F_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
>  \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
>  \end{description}
> @@ -4464,6 +4467,91 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  (necessarily when not using the legacy interface) little-endian.
>
>
> +\paragraph{Notifications Coalescing}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
> +
> +If the VIRTIO_NET_F_NOTF_COAL feature is negotiated, the driver can
> +send control commands for dynamically changing the coalescing parameters.
> +
> +\begin{lstlisting}
> +struct virtio_net_ctrl_coal_rx {
> +    le32 rx_max_buffers;
> +    le32 rx_usecs;
> +};
> +
> +struct virtio_net_ctrl_coal_tx {
> +    le32 tx_max_buffers;

Considering RX may use multiple buffers per packet, I wonder if it's
better to stick to "packet" here.

> +    le32 tx_usecs;
> +};
> +
> +#define VIRTIO_NET_CTRL_NOTF_COAL 6
> + #define VIRTIO_NET_CTRL_NOTF_COAL_TX_SET  0
> + #define VIRTIO_NET_CTRL_NOTF_COAL_RX_SET 1
> +\end{lstlisting}
> +
> +Coalescing parameters:
> +\begin{itemize}
> +\item rx_usecs: Time to delay a notification after a RX buffer is used in microseconds.
> +\item tx_usecs: Time to delay a notification after a TX buffer is used in microseconds.
> +\item rx_max_buffers: Number of RX buffers to delay a notification after a RX buffer is used.

Does this work like: if we set rx_max_buffers to 10, it means after 1
buffers is used, we still need another 10 buffers?

> +\item tx_max_buffers: Number of TX buffers to delay a notification after a TX buffer is used.
> +\end{itemize}
> +
> +Note: A chain of buffers counts as one, just like it would if this feature is not negotiated.

I think we should explicitly say mergeable rx buffers here. And that's
why I think mentioning "packet is sent/received" is probably better
than the buffer used here.

> +
> +The class VIRTIO_NET_CTRL_NOTF_COAL has 2 commands:
> +\begin{itemize}
> +\item VIRTIO_NET_CTRL_NOTF_COAL_TX_SET: set the tx_usecs and tx_max_buffers parameters.
> +\item VIRTIO_NET_CTRL_NOTF_COAL_RX_SET: set the rx_usecs and rx_max_buffers parameters.
> +\end{itemize}
> +
> +Note: rx_usecs = 0 or rx_max_buffers = 0 means that a notification should be sent for every used buffer, so if one of these values is 0, the other value is meaningless.
> +The same is true for tx_usecs and tx_max_buffers.

It's better to clarify it in the part of coalescing parameters, or we
can just borrow the comments of kernel's ethtool_coalesce, then it
should explain itself like:

@rx_usecs: How many usecs to delay an RX notification after a packet arrives
@rx_max_buffers: Maximum number of packets to receive before an RX notification

Not a native speaker but then rx_usecs=0 it means the notification is
sent immediately and by saying "maximum number" it means best effort.

> +
> +\paragraph{RX Notifications}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing / RX Notifications}
> +
> +If, for example, rx_usecs = 10 and rx_buffers_max = 15.
> +
> +\begin{itemize}
> +\item The device will count used buffers from the RX virtqueue until it accumulates 15, or until 10 usecs elapsed since the usage of the first one.
> +\item The device will send a notification to the driver, only if the driver hasn't suppressed notifications.

Let's clarify what happens if notification is suppressed.

> +\item The device will reset its internal coalescing counters, if a notification was sent.

I think there's probably no need to mention the implementation details
like counters here. The definition of rx_usecs and rx_max_buffers
should be sufficient.

> +\end{itemize}
> +
> +\paragraph{TX Notifications}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing / TX Notifications}
> +
> +If, for example, tx_usecs = 10 and tx_buffers_max = 15.
> +
> +\begin{itemize}
> +\item The device will count used buffers from the TX virtqueue until it accumulates 15, or until 10 usecs elapsed since the usage of the first one.
> +\item The device will send a notification to the driver, only if the driver hasn't suppressed notifications.
> +\item The device will reset its internal coalescing counters, if a notification was sent.
> +\end{itemize}
> +
> +\paragraph{Coalescing and Notifications Suppression}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing / Coalescing and Notifications Suppression}
> +
> +If the driver sets the VIRTQ_AVAIL_F_NO_INTERRUPT flag, the device should not send notifications to the driver. \\
> +In this case, the device will increase the coalescing counters until the flag is cleared, and only then the device will send a notification and clear the coalescing counters. \\ \\
> +
> +If the VIRTIO_F_EVENT_IDX feature is negotiated, and used_event field is set, the device will send a notification only after used_event index is reached, even if the coalescing counters expired before.
> +
> +For example: \\
> +rx_usecs = 10, rx_max_buffers = 7, used_event = 5, and current virtqueue location is 0: \\
> +If the timer elapses before the \#5 buffer is used, the device will send a notification only after the \#5 buffer is used. \\
> +If the \#5 buffer is used before the timer elapses, the device will send a notification after the \#7 buffer is used, or after the timer elapses, whichever occurs first.
> +
> +\drivernormative{\subparagraph}{Notifications Coalescing}{Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
> +
> +
> +If the VIRTIO_NET_F_NOTF_COAL feature has not been negotiated, the driver MUST NOT issue VIRTIO_NET_CTRL_NOTF_COAL commands.
> +
> +\devicenormative{\subparagraph}{Notifications Coalescing}{Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
> +
> +A device SHOULD respond to the VIRTIO_NET_CTRL_NOTF_COAL commands with VIRTIO_NET_ERR if was not able to change the parameters.\\ \\
> +A device MUST NOT accept tx_buffers_max/rx_buffers_max values bigger than the virtqueue size.\\ \\

What's the reason for this?

> +A device SHOULD NOT send notifications to the driver, if the notifications are suppressed.\\ \\
> +A device SHOULD initialize all coalescing values to 0, meaning that a notification is sent after every used buffer (if events aren't suppressed). \\ \\

I think we need use MUST here, something like:

Upon reset, the device must present all zero values ...

Thanks

> +
> +
>  \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
>  Types / Network Device / Legacy Interface: Framing Requirements}
>
> --
> 2.32.0
>


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

