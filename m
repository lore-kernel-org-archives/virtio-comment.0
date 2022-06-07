Return-Path: <virtio-comment-return-3105-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0FA8A9863DD
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Jun 2022 10:45:57 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20220606064411.2630179-1-alvaro.karsz@solid-run.com>
References: <20220606064411.2630179-1-alvaro.karsz@solid-run.com>
Date: Tue, 07 Jun 2022 12:45:48 +0200
Message-ID: <87bkv4bvkz.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v5] Introduction of Virtio Network
 device notifications coalescing feature.
Content-Type: text/plain
To: Alvaro Karsz <alvaro.karsz@solid-run.com>, virtio-comment@lists.oasis-open.org
Cc: rabeeh@solid-run.com, Alvaro Karsz <alvaro.karsz@solid-run.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Jun 06 2022, Alvaro Karsz <alvaro.karsz@solid-run.com> wrote:

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
> 	- Usage of notification terminology.
> 	- Add a few lines on what device should do when driver asked to
> 	  suppress notifications.
>
> v3:
> 	- Remove whitespaces.
> 	- Explain with examples how the device should act.
>
> v4:
> 	- Example of a scenarion when VIRTIO_F_EVENT_IDX is negotiated.
> 	- Usage of separate commands for RX coalescing and TX  coalescing.
>
> v5:
> 	- Usage of subparagraphs.
> 	- Add driver requirements and device requirements references in conformance.tex.
> --
>
> Signed-off-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
> ---
>  conformance.tex |  2 ++
>  content.tex     | 88 +++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 90 insertions(+)
>

(...)

> +Coalescing parameters:
> +\begin{itemize}
> +\item rx_usecs: Time to delay a notification after a RX buffer is used in microseconds.

Can you please use \field{...} for the various structure fields? (here
and in the rest of the patch)

> +\item tx_usecs: Time to delay a notification after a TX buffer is used in microseconds.
> +\item rx_max_buffers: Number of RX buffers to delay a notification after a RX buffer is used.
> +\item tx_max_buffers: Number of TX buffers to delay a notification after a TX buffer is used.
> +\end{itemize}

(...)

> +\subparagraph{Coalescing and Notifications Suppression}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing / Coalescing and Notifications Suppression}
> +
> +If the driver sets the VIRTQ_AVAIL_F_NO_INTERRUPT flag, the device should not send notifications to the driver. \\
> +In this case, the device will increase the coalescing counters until the flag is cleared, and only then the device will send a notification and clear the coalescing counters. \\ \\

Can you please drop the "\\"? Just let the paragraphs be formatted naturally.

> +
> +If the VIRTIO_F_EVENT_IDX feature is negotiated, and used_event field is set, the device will send a notification only after used_event index is reached, even if the coalescing counters expired before.
> +
> +For example: \\
> +rx_usecs = 10, rx_max_buffers = 7, used_event = 5, and current virtqueue location is 0: \\
> +If the timer elapses before the \#5 buffer is used, the device will send a notification only after the \#5 buffer is used. \\
> +If the \#5 buffer is used before the timer elapses, the device will send a notification after the \#7 buffer is used, or after the timer elapses, whichever occurs first.

Can you please put that into an itemize, as for the other examples?

> +
> +\drivernormative{\subparagraph}{Notifications Coalescing}{Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
> +
> +
> +If the VIRTIO_NET_F_NOTF_COAL feature has not been negotiated, the driver MUST NOT issue VIRTIO_NET_CTRL_NOTF_COAL commands.
> +
> +\devicenormative{\subparagraph}{Notifications Coalescing}{Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
> +
> +A device SHOULD respond to the VIRTIO_NET_CTRL_NOTF_COAL commands with VIRTIO_NET_ERR if was not able to change the parameters.\\ \\

s/if/if it/

> +A device MUST NOT accept tx_buffers_max/rx_buffers_max values bigger than the virtqueue size.\\ \\
> +A device SHOULD NOT send notifications to the driver, if the notifications are suppressed.\\ \\
> +A device SHOULD initialize all coalescing values to 0, meaning that a notification is sent after every used buffer (if events aren't suppressed). \\ \\

I think we prefer the non-contracted forms (i.e. "are not").

I would also like an ack from someone more familiar with virtio-net than
me (nothing seemed wrong to me).


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

