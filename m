Return-Path: <virtio-comment-return-2919-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 673FB98650E
	for <virtio-comment@lists.oasis-open.org>; Thu,  7 Apr 2022 12:04:47 +0000 (UTC)
Date: Thu, 7 Apr 2022 14:04:40 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <20220407120440.opnbf2kxbj4ba4mo@sgarzare-redhat>
References: <20220407081330.17553-1-lauralg@amazon.com>
MIME-Version: 1.0
In-Reply-To: <20220407081330.17553-1-lauralg@amazon.com>
Subject: Re: [virtio-comment] [PATCH v3] vsock: add documentation about len
 header field
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: Laura Loghin <lauralg@amazon.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Apr 07, 2022 at 11:13:30AM +0300, Laura Loghin wrote:
>Signed-off-by: Laura Loghin <lauralg@amazon.com>
>---
> virtio-vsock.tex | 5 +++++
> 1 file changed, 5 insertions(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>index d79984d..1d6579b 100644
>--- a/virtio-vsock.tex
>+++ b/virtio-vsock.tex
>@@ -107,6 +107,11 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
> #define VIRTIO_VSOCK_OP_CREDIT_REQUEST 7
> \end{lstlisting}
>
>+\field{len} is the size of the payload, in bytes. However, the driver may
>+provide buffer(s) for the payload that have a total size longer than
>+\field{len}, in which case only the first \field{len} bytes will be used for
>+the actual data.
>+
> \subsubsection{Virtqueue Flow Control}\label{sec:Device Types / Socket Device / Device Operation / Virtqueue Flow Control}
>
> The tx virtqueue carries packets initiated by applications and replies to
>-- 
>2.17.1
>
>
>
>
>Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in Romania. Registration number J22/2621/2005.
>
>
>This publicly archived list offers a means to provide input to the
>OASIS Virtual I/O Device (VIRTIO) TC.
>
>In order to verify user consent to the Feedback License terms and
>to minimize spam in the list archive, subscription is required
>before posting.
>
>Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>List help: virtio-comment-help@lists.oasis-open.org
>List archive: https://lists.oasis-open.org/archives/virtio-comment/
>Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>Committee: https://www.oasis-open.org/committees/virtio/
>Join OASIS: https://www.oasis-open.org/join/
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

