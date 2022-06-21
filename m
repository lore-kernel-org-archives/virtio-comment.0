Return-Path: <virtio-comment-return-3152-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C41459863A8
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Jun 2022 09:48:44 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20220615143916.3563008-1-alvaro.karsz@solid-run.com>
References: <20220615143916.3563008-1-alvaro.karsz@solid-run.com>
Date: Tue, 21 Jun 2022 11:48:39 +0200
Message-ID: <87v8su8hzc.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v7] Introduction of Virtio Network
 device notifications coalescing feature.
Content-Type: text/plain
To: Alvaro Karsz <alvaro.karsz@solid-run.com>, virtio-comment@lists.oasis-open.org
Cc: Alvaro Karsz <alvaro.karsz@solid-run.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Jun 15 2022, Alvaro Karsz <alvaro.karsz@solid-run.com> wrote:

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
>
> v6:
> 	- LaTex formatting fixes.
> 	- Clarify the meaning of every coalescing parameter.
> 	- Usage of packets terminology instead of used buffers.
>
> v7:
> 	- Clarify the example of notifications coalescing when  used_event is set.
> --
>
> Signed-off-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
> ---
>  conformance.tex |  2 ++
>  content.tex     | 94 +++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 96 insertions(+)
>

(...)

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

Note that we are currently voting on
https://lists.oasis-open.org/archives/virtio-comment/202110/msg00010.html,
which uses feature bits 54 + 55, so this would need to pick another
one. No big deal, though, as we still have spare bits until we reach
50. [Should we need to go to the range above 63, IIRC at least PCI would
need a tweak to support more than 64 feature bits, but that's not urgent
yet.]

>  \item[VIRTIO_NET_F_HOST_USO (56)] Device can receive USO packets. Unlike UFO
>   (fragmenting the packet) the USO splits large UDP packet
>   to several segments when each of these smaller packets has UDP header.

Looks fine to me from a non-net POV.


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

