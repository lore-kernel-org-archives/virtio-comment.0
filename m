Return-Path: <virtio-comment-return-3078-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5E51A986603
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 May 2022 09:36:20 +0000 (UTC)
MIME-Version: 1.0
References: <20220519084551.18119-1-alvaro.karsz@solid-run.com>
In-Reply-To: <20220519084551.18119-1-alvaro.karsz@solid-run.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 26 May 2022 17:36:04 +0800
Message-ID: <CACGkMEuzk_dyZPnNc7UeYFfyxDABXA5+Lj6iMGUUMesJQyf77A@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH v3] Introduction of Virtio Network device
 notifications coalescing feature.
Content-Type: text/plain; charset="UTF-8"
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Cc: virtio-comment@lists.oasis-open.org, Rabeeh Khoury <rabeeh@solid-run.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, May 19, 2022 at 4:46 PM Alvaro Karsz <alvaro.karsz@solid-run.com> wrote:
>
> Control a network device notifications coalescing parameters using the control virtqueue.
> A new control class was added: VIRTIO_NET_CTRL_NOTF_COAL.
>
> This class provides 2 commands:
> - VIRTIO_NET_CTRL_NOTF_COAL_USECS_SET:
>   Ask the network device to change the rx-usecs and tx-usecs parameters.
>   rx-usecs - Time to delay an RX notification after packet arrival in microseconds.
>   tx-usecs - Time to delay a TX notification after a sending a packet in microseconds.
>
> - VIRTIO_NET_CTRL_NOTF_COAL_FRAMES_SET:
>   Ask the network device to change the rx-max-frames and tx-max-frames parameters.
>   rx-max-frames - Number of packets to delay an RX notification after packet arrival.
>   tx-max-frames - Number of packets to delay a TX notification after sending a packet.
>
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
> --
>
> Signed-off-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
> ---
>  content.tex | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>
> diff --git a/content.tex b/content.tex
> index 7508dd1..b0ee98d 100644
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
> @@ -4464,6 +4467,71 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  (necessarily when not using the legacy interface) little-endian.
>
>
> +\paragraph{Notifications Coalescing}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
> +
> +If the VIRTIO_NET_F_NOTF_COAL feature is negotiated, the driver can
> +send control commands for dynamically changing the coalescing parameters.
> +
> +\begin{lstlisting}
> +struct virtio_net_ctrl_coal_usec {
> +    le32 tx_usecs;
> +    le32 rx_usecs;
> +};
> +
> +struct virtio_net_ctrl_coal_frames {
> +    le32 tx_frames_max;
> +    le32 rx_frames_max;
> +};
> +
> +#define VIRTIO_NET_CTRL_NOTF_COAL 6
> + #define VIRTIO_NET_CTRL_NOTF_COAL_USECS_SET  0
> + #define VIRTIO_NET_CTRL_NOTF_COAL_FRAMES_SET 1
> +\end{lstlisting}
> +
> +The class VIRTIO_NET_CTRL_NOTF_COAL has 2 commands:
> +\begin{itemize}
> +\item VIRTIO_NET_CTRL_NOTF_COAL_USECS_SET: set the rx-usecs (time to delay an RX notification after frame arrival in microseconds) and tx-usecs (time to delay a TX notification after a sending a frame in microseconds) parameters.
> +\item VIRTIO_NET_CTRL_NOTF_COAL_FRAMES_SET: set the rx-max-frames (number of frames to delay an RX notification after frame arrival) and tx-max-frames (number of frames to delay a TX notification after sending a frame) parameters.
> +\end{itemize}
> +
> +\paragraph{RX notifications}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing / RX notifications}
> +
> +If, for example, rx_usecs = 10 and rx_frames_max = 15.

If the usecs and frames are required to be used simultaneously, we'd
better tweak the command to pack them together like:

struct rx_coalesce {
    le32 usecs;
    le32.frames;
};

> +
> +\begin{itemize}
> +\item The device will count received frames until it accumulates 15 frames, or until 10 usecs elapsed since the arrival of the first frame.

The description here looks more like GUEST_RSC instead of GUEST_GSO.
The difference is GUEST_GSO doesn't coalesce packets.

> +\item The device will check if at least one descriptor was used from the descriptor area, if not, it will continue to accumulate frames until one descriptor is used.\\
> +An example is if any of the VIRTIO_NET_F_GUEST_TSO/UFO features are negotiated, a device could receive more than 15 frames, and write all in the same buffer.
> +\item The device will reset its internal coalescing counters.

So we need clarify the "packet" definition:

1) is it the packet that the device saw on the wire (before coalescing)

or

2) it's the packet that has been coalesced by the the device and put
in the buffer

And when the device is expected to increase the counter

> +\item The device will send a notification to the driver only if the driver hasn't suppressed notifications.

It's better to describe how it is expected to work with event index
(probably with some examples).

> +\end{itemize}
> +
> +
> +\paragraph{TX notifications}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing / TX notifications}
> +
> +If, for example, tx_usecs = 10 and tx_frames_max = 15.
> +
> +\begin{itemize}
> +\item The device will count sent frames until it accumulates 15 frames, or until 10 usecs elapsed since first frame was sent.
> +\item The device will check if at least one descriptor was used from the descriptor area, if not, it will continue to accumulate frames until one descriptor is used.\\
> +An example is if any of the VIRTIO_NET_F_HOST_TSO/UFO features are negotiated, a device could receive a big buffer, which will take more than 15 frames to send.
> +\item The device will reset its internal coalescing counters.

So the device counts the segmented packets. I wonder what's the
advantage of this over counting the unsegmented packets.

> +\item The device will send a notification to the driver only if the driver hasn't suppressed notifications.
> +\end{itemize}
> +
> +\drivernormative{\subparagraph}{Notifications Coalescing}{Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
> +
> +
> +If the VIRTIO_NET_F_NOTF_COAL feature has not been negotiated, the driver MUST NOT issue VIRTIO_NET_CTRL_NOTF_COAL commands.
> +
> +\devicenormative{\subparagraph}{Notifications Coalescing}{Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
> +
> +A device SHOULD respond to the VIRTIO_NET_CTRL_NOTF_COAL commands with VIRTIO_NET_ERR if was not able to change the parameters.\\ \\
> +A device MUST NOT accept tx_frames_max/rx_frames_max values bigger than the queue size.\\ \\
> +A device SHOULD NOT send notifications to the driver, if the driver asked to suppress notifications.\\ \\
> +A device SHOULD initialize all coalescing values to 0. \\ \\

Let's define the semantics of 0 value here.

Thanks

> +
> +
>  \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
>  Types / Network Device / Legacy Interface: Framing Requirements}
>
> --
> 2.32.0
>
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

