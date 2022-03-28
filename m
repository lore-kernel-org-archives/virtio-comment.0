Return-Path: <virtio-comment-return-2862-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E875C986269
	for <virtio-comment@lists.oasis-open.org>; Mon, 28 Mar 2022 11:09:38 +0000 (UTC)
MIME-Version: 1.0
References: <20220322094940.3486-1-lauralg@amazon.com>
In-Reply-To: <20220322094940.3486-1-lauralg@amazon.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 28 Mar 2022 13:09:23 +0200
Message-ID: <CAGxU2F5EtepBLC9XzjHk+Rgz70PErnA7hqfLbMJ0K5gH1FU6Qw@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH] vsock: add documentation about len
 header field
Content-Type: text/plain; charset="UTF-8"
To: Laura Loghin <lauralg@amazon.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

Hi Laura,

On Tue, Mar 22, 2022 at 10:50 AM Laura Loghin <lauralg@amazon.com> wrote:
>
> Signed-off-by: Laura Loghin <lauralg@amazon.com>
> ---
>  virtio-vsock.tex | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
> index d79984d..e32cad8 100644
> --- a/virtio-vsock.tex
> +++ b/virtio-vsock.tex
> @@ -107,6 +107,11 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
>  #define VIRTIO_VSOCK_OP_CREDIT_REQUEST 7
>  \end{lstlisting}
>
> +\field{len} is the size of the payload, in bytes. However, the driver may
> +provide buffer(s) for the payload that have a total size longer than
> +\field{len}. If that is the case, only the first \field{len} bytes MUST be
> +used for the actual data.
> +

IIUC MUST and friends are for normative sections, so I would remove
the last sentence.


Thanks,
Stefano


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

