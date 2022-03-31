Return-Path: <virtio-comment-return-2872-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B0851986716
	for <virtio-comment@lists.oasis-open.org>; Thu, 31 Mar 2022 07:14:50 +0000 (UTC)
Date: Thu, 31 Mar 2022 09:14:39 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <20220331071439.3mv7tspifw7rwdvs@sgarzare-redhat>
References: <20220329150104.2309-1-lauralg@amazon.com>
MIME-Version: 1.0
In-Reply-To: <20220329150104.2309-1-lauralg@amazon.com>
Subject: Re: [virtio-comment] [PATCH v2] vsock: add documentation about len
 header field
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: Laura Loghin <lauralg@amazon.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Mar 29, 2022 at 06:01:04PM +0300, Laura Loghin wrote:
>Signed-off-by: Laura Loghin <lauralg@amazon.com>
>---
> virtio-vsock.tex | 4 ++++
> 1 file changed, 4 insertions(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>index d79984d..26855d3 100644
>--- a/virtio-vsock.tex
>+++ b/virtio-vsock.tex
>@@ -107,6 +107,10 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
> #define VIRTIO_VSOCK_OP_CREDIT_REQUEST 7
> \end{lstlisting}
>
>+\field{len} is the size of the payload, in bytes. However, the driver may
>+provide buffer(s) for the payload that have a total size longer than
>+\field{len}.
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

