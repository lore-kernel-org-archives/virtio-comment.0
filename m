Return-Path: <virtio-comment-return-3167-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0767C98662C
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Jun 2022 03:13:19 +0000 (UTC)
MIME-Version: 1.0
References: <20220615143916.3563008-1-alvaro.karsz@solid-run.com>
In-Reply-To: <20220615143916.3563008-1-alvaro.karsz@solid-run.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 23 Jun 2022 11:13:03 +0800
Message-ID: <CACGkMEtX-tbROTsTNGjnNcsf8UCa4HYFZ_xonDGj8To3iWRMXQ@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH v7] Introduction of Virtio Network device
 notifications coalescing feature.
Content-Type: text/plain; charset="UTF-8"
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Jun 15, 2022 at 10:39 PM Alvaro Karsz
<alvaro.karsz@solid-run.com> wrote:
>
> Control a network device notifications coalescing parameters using the control virtqueue.
> A new control class was added: VIRTIO_NET_CTRL_NOTF_COAL.
>
> This class provides 2 commands:
> - VIRTIO_NET_CTRL_NOTF_COAL_TX_SET:
>   Ask the network device to change the tx_usecs and tx_max_packets parameters.
>   - tx_usecs: Maximum number of usecs to delay a TX notification.
>   - tx_max_packets: Maximum number of packets to send before a TX notification.
>
> - VIRTIO_NET_CTRL_NOTF_COAL_RX_SET:
>   Ask the network device to change the rx_usecs and rx_max_packets parameters.
>   - rx_usecs: Maximum number of usecs to delay a RX notification.
>   - rx_max_packets: Maximum number of packets to receive before a RX notification.
>
> --
>
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
>
> v5:
>         - Usage of subparagraphs.
>         - Add driver requirements and device requirements references in conformance.tex.
>
> v6:
>         - LaTex formatting fixes.
>         - Clarify the meaning of every coalescing parameter.
>         - Usage of packets terminology instead of used buffers.
>
> v7:
>         - Clarify the example of notifications coalescing when  used_event is set.
> --
>
> Signed-off-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
> ---
>  conformance.tex |  2 ++
>  content.tex     | 94 +++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 96 insertions(+)
>
> diff --git a/conformance.tex b/conformance.tex
> index 663e7c3..c9ccc89 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -149,6 +149,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Automatic receive steering in multiqueue mode}
>  \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Offloads State Configuration / Setting Offloads State}
>  \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) }
> +\item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
>  \end{itemize}
>
>  \conformance{\subsection}{Block Driver Conformance}\label{sec:Conformance / Driver Conformance / Block Driver Conformance}
> @@ -411,6 +412,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Gratuitous Packet Sending}
>  \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Automatic receive steering in multiqueue mode}
>  \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS processing}
> +\item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
>  \end{itemize}
>
>  \conformance{\subsection}{Block Device Conformance}\label{sec:Conformance / Device Conformance / Block Device Conformance}
> diff --git a/content.tex b/content.tex
> index 7508dd1..a6ccfd6 100644
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
> @@ -4464,6 +4467,97 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
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
> +    le32 rx_max_packets;
> +    le32 rx_usecs;
> +};
> +
> +struct virtio_net_ctrl_coal_tx {
> +    le32 tx_max_packets;
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
> +\item \field{rx_usecs}: Maximum number of usecs to delay a RX notification.
> +\item \field{tx_usecs}: Maximum number of usecs to delay a TX notification.
> +\item \field{rx_max_packets}: Maximum number of packets to receive before a RX notification.
> +\item \field{tx_max_packets}: Maximum number of packets to send before a TX notification.
> +\end{itemize}
> +
> +
> +The class VIRTIO_NET_CTRL_NOTF_COAL has 2 commands:
> +\begin{enumerate}
> +\item VIRTIO_NET_CTRL_NOTF_COAL_TX_SET: set the \field{tx_usecs} and \field{tx_max_packets} parameters.
> +\item VIRTIO_NET_CTRL_NOTF_COAL_RX_SET: set the \field{rx_usecs} and \field{rx_max_packets} parameters.
> +\end{enumerate}
> +
> +\subparagraph{RX Notifications}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing / RX Notifications}
> +
> +If, for example:
> +\begin{itemize}
> +\item \field{rx_usecs} = 10.
> +\item \field{rx_max_packets} = 15.
> +\end{itemize}
> +
> +The device will operate as follows:
> +
> +\begin{itemize}
> +\item The device will count received packets until it accumulates 15, or until 10 usecs elapsed since the first one arrived.

I guess "first one was received" is better? (To be paired with "first
one was sent") in the next example.

> +\item If the notifications are not suppressed by the driver, the device will send a notification, otherwise, the device will not send a notification until notifications are not suppressed.
> +\end{itemize}
> +
> +\subparagraph{TX Notifications}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing / TX Notifications}
> +
> +If, for example:
> +\begin{itemize}
> +\item \field{tx_usecs} = 10.
> +\item \field{tx_max_packets} = 15.
> +\end{itemize}
> +
> +The device will operate as follows:
> +
> +\begin{itemize}
> +\item The device will count sent packets until it accumulates 15, or until 10 usecs elapsed since the first one was sent.
> +\item If the notifications are not suppressed by the driver, the device will send a notification, otherwise, the device will not send a notification until notifications are not suppressed.

It's better to use "used buffer notification" to be more accurate.

> +\end{itemize}
> +
> +\subparagraph{Coalescing and Notifications Suppression}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing / Coalescing and Notifications Suppression}
> +
> +If the driver sets the VIRTQ_AVAIL_F_NO_INTERRUPT flag, the device should not send notifications to the driver.

Note that the keyword "SHOULD" must be used in the normative part.

> +
> +If the VIRTIO_F_EVENT_IDX feature is negotiated, and \field{used_event} field is set, the device will operate as follows:
> +
> +\begin{itemize}
> +\item If either \field{rx_usecs} or \field{rx_max_packets} exceeds, but \field{used_event} does not exceed, the notification will be delayed until \field{used_event} exceeds.
> +\item If neither \field{rx_usecs} nor \field{rx_max_packets} exceeds, but \field{used_event} does exceed, the notification will be delayed until either \field{rx_usecs} or \field{rx_max_packets} exceeds, whichever occurs first.

Not a native speaker, but I wonder if "exceed" can accurately define
the behaviour here. What's more used_event is only used in the case of
split virtqueue.

So instead of trying to partially duplicate the definition for
notification suppression, I wonder if we can simply remove this
example, and add references to the subsection that explains the
packet/split notification suppression in the first two examples?

Thanks

> +\end{itemize}
> +
> +Note: The same is true for \field{tx_usecs} and \field{tx_max_packets}.
> +
> +\drivernormative{\subparagraph}{Notifications Coalescing}{Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
> +
> +If the VIRTIO_NET_F_NOTF_COAL feature has not been negotiated, the driver MUST NOT issue VIRTIO_NET_CTRL_NOTF_COAL commands.
> +
> +\devicenormative{\subparagraph}{Notifications Coalescing}{Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
> +
> +A device SHOULD respond to the VIRTIO_NET_CTRL_NOTF_COAL commands with VIRTIO_NET_ERR if it was not able to change the parameters.
> +
> +A device SHOULD NOT send notifications to the driver, if the notifications are suppressed.
> +
> +Upon reset, a device MUST initialize all coalescing parameters to 0.
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

