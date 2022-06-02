Return-Path: <virtio-comment-return-3095-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1B1F19865FD
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Jun 2022 11:14:11 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20220421102939.24758-1-lauralg@amazon.com>
References: <20220421102939.24758-1-lauralg@amazon.com>
Date: Thu, 02 Jun 2022 13:14:06 +0200
Message-ID: <87v8tjb9mp.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v3] virtio-vsock: add max payload size
 config field
Content-Type: text/plain
To: Laura Loghin <lauralg@amazon.com>, virtio-comment@lists.oasis-open.org
Cc: Laura Loghin <lauralg@amazon.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Apr 21 2022, Laura Loghin <lauralg@amazon.com> wrote:

> Added a new field to the vsock device config space that
> is limiting the size of the packet payload. This way
> the driver is not allowed to allocate huge buffers, and
> potentially fill up the entire memory.
> Also defined a new feature bit for this, VIRTIO_VSOCK_F_SIZE_MAX,
> in order to keep backwards compatibility.
>
> Signed-off-by: Laura Loghin <lauralg@amazon.com>
> ---
>  virtio-vsock.tex | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> +
> +The device MUST NOT change the value exposed through \field{data_max_size}.
> +
> +\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> +
> +A driver SHOULD negotiate VIRTIO_VSOCK_F_SIZE_MAX if the device offers it.
> +
> +If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, the receive buffers it
> +supplies for a packet MUST have a total size that doesn't exceed the size
> +\field{data_max_size} (plus header length).
> +
> +If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, it MUST  NOT transmit packets
> +of size exceeding the value of \field{data_max_size} (plus header length).
> +
>  \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
>  
>  \begin{enumerate}

I think you need to hook up the two new sections in conformance.tex.


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

