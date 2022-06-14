Return-Path: <virtio-comment-return-3121-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 51F689864EE
	for <virtio-comment@lists.oasis-open.org>; Tue, 14 Jun 2022 11:57:44 +0000 (UTC)
Date: Tue, 14 Jun 2022 13:57:34 +0200
From: Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20220614135734.534dbc0b.pasic@linux.ibm.com>
In-Reply-To: <20220613104038.22010-1-lauralg@amazon.com>
References: <20220613104038.22010-1-lauralg@amazon.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v4] virtio-vsock: add max payload size
 config field
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: Laura Loghin <lauralg@amazon.com>
Cc: virtio-comment@lists.oasis-open.org, Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, 13 Jun 2022 13:40:38 +0300
Laura Loghin <lauralg@amazon.com> wrote:

> @@ -57,6 +62,25 @@ \subsection{Device configuration layout}\label{sec:Dev=
ice Types / Socket Device
>  \hline
>  \end{tabular}
> =20
> +The following driver-read-only field, \field{data_max_size} only exists =
if
> +VIRTIO_VSOCK_F_SIZE_MAX is set. This field specifies the maximum packet =
payload
> +size for the driver to use.
> +
> +\devicenormative{\subsubsection}{Device configuration layout}{Device Typ=
es / Socket Device / Device configuration layout}
> +
> +The device MUST NOT change the value exposed through \field{data_max_siz=
e}.
> +
> +\drivernormative{\subsubsection}{Device configuration layout}{Device Typ=
es / Socket Device / Device configuration layout}
> +
> +A driver SHOULD negotiate VIRTIO_VSOCK_F_SIZE_MAX if the device offers i=
t.
> +
> +If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, the receive buffers it
> +supplies for a packet MUST have a total size that doesn't exceed the siz=
e
> +\field{data_max_size} (plus header length).
> +
> +If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, it MUST  NOT transmit =
packets
> +of size exceeding the value of \field{data_max_size} (plus header length=
).
> +

Hi and sorry for being late to the party!

I believe I do understand why do we want to put a restriction on the
size of the transmitted packets, but I would appreciate if you could
explain to me why do we want to limit the receive buffer size.

Also I find the wording regarding a little bit ambiguous because
in a networking context it also makes sense to talk about the size of the
receive buffer. I guess hear we are talking about a single virtio buffer
(a descriptor chain described potentially non-continuous (or compact in
the mathematical sense of the word) which is composed from as many
continuous chunks of memory as many descriptors are contained within the
descriptor chain). If we are indeed talking about a single virtio buffer,
I don't understand the plural. If not, I'm not sure what are we talking
about.

Also, do we have some sort of packets may not cross virtio buffer
boundaries, or even a single packet per single viritio buffer rule for
vsock. I did a quick search and could not find any. Did I overlook
something? Should we spell this out?

@Michael, Conny: What do you think?=20

Regards,
Halil

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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

