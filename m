Return-Path: <virtio-comment-return-3096-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 40167986643
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Jun 2022 15:33:55 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20220601073330.2468384-1-alvaro.karsz@solid-run.com>
References: <20220601073330.2468384-1-alvaro.karsz@solid-run.com>
Date: Thu, 02 Jun 2022 17:33:46 +0200
Message-ID: <87sfonaxlx.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v4] Introduction of Virtio Network
 device notifications coalescing feature.
Content-Type: text/plain
To: Alvaro Karsz <alvaro.karsz@solid-run.com>, virtio-comment@lists.oasis-open.org, jasowang@redhat.com
Cc: rabeeh@solid-run.com, Alvaro Karsz <alvaro.karsz@solid-run.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Jun 01 2022, Alvaro Karsz <alvaro.karsz@solid-run.com> wrote:

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
> --
>
> Signed-off-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
> ---
>  content.tex | 88 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>

(...)

> +\drivernormative{\subparagraph}{Notifications Coalescing}{Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
> +
> +
> +If the VIRTIO_NET_F_NOTF_COAL feature has not been negotiated, the driver MUST NOT issue VIRTIO_NET_CTRL_NOTF_COAL commands.
> +
> +\devicenormative{\subparagraph}{Notifications Coalescing}{Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
> +
> +A device SHOULD respond to the VIRTIO_NET_CTRL_NOTF_COAL commands with VIRTIO_NET_ERR if was not able to change the parameters.\\ \\
> +A device MUST NOT accept tx_buffers_max/rx_buffers_max values bigger than the virtqueue size.\\ \\
> +A device SHOULD NOT send notifications to the driver, if the notifications are suppressed.\\ \\
> +A device SHOULD initialize all coalescing values to 0, meaning that a notification is sent after every used buffer (if events aren't suppressed). \\ \\
> +
> +

I think these are missing being referenced in conformance.tex?

[This seems to be easy to miss, I also noticed missing statements while
preparing the changelong for 1.2. Should the build process maybe check
that conformance sections are hooked up properly?]


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

