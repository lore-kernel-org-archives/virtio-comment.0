Return-Path: <virtio-comment-return-2913-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 191049864DC
	for <virtio-comment@lists.oasis-open.org>; Wed,  6 Apr 2022 08:59:59 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20220404134931.28697-1-lauralg@amazon.com>
References: <20220404134931.28697-1-lauralg@amazon.com>
Date: Wed, 06 Apr 2022 10:59:54 +0200
Message-ID: <875ynmfuyd.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] virtio-vsock: add max payload size
 config field
Content-Type: text/plain
To: Laura Loghin <lauralg@amazon.com>, virtio-comment@lists.oasis-open.org
Cc: Laura Loghin <lauralg@amazon.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Apr 04 2022, Laura Loghin <lauralg@amazon.com> wrote:

> Added a new field to the vsock device config space that
> is limiting the size of the packet payload. This way
> the driver is not allowed to allocate huge buffers, and
> potentially fill up the entire memory.
> Also defined a new feature bit for this, VIRTIO_VSOCK_F_SIZE_MAX,
> in order to keep backwards compatibility.
>
> Signed-off-by: Laura Loghin <lauralg@amazon.com>
> ---
>  virtio-vsock.tex | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)

(...)

> +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> +
> +The device MUST set \field{data_max_size} to between 0 and 65536 inclusive, if
> +it offers VIRTIO_VSOCK_F_SIZE_MAX.
> +
> +The device MUST NOT modify \field{data_max_size} once it has been set.

I'm not sure this is the best way to frame this. Maybe

"The device MUST NOT change the value exposed through
\field{data_max_size}."

?


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

