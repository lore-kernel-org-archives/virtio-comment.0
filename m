Return-Path: virtio-comment-return-1910-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 70AF0986692
	for <virtio-comment@lists.oasis-open.org>; Fri, 18 Jun 2021 14:50:00 +0000 (UTC)
Date: Fri, 18 Jun 2021 16:49:51 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <20210618144951.dr23qqfuy6qrd2ne@steredhat.lan>
References: <20210524183232.2513690-1-arseny.krasnov@kaspersky.com>
 <20210524183420.2514296-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210524183420.2514296-1-arseny.krasnov@kaspersky.com>
Subject: [virtio-comment] Re: [PATCH v6 2/2] virtio-vsock: SOCK_SEQPACKET description
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Cc: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Andra Paraschiv <andraprs@amazon.com>, Colin Ian King <colin.king@canonical.com>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, May 24, 2021 at 09:34:15PM +0300, Arseny Krasnov wrote:
>This adds description of SOCK_SEQPACKET socket type
>support for virtio-vsock.
>
>Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>---
> virtio-vsock.tex | 26 +++++++++++++++++++++-----
> 1 file changed, 21 insertions(+), 5 deletions(-)
>
>diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>index ad57f9d..9ef2b0e 100644
>--- a/virtio-vsock.tex
>+++ b/virtio-vsock.tex
>@@ -16,7 +16,10 @@ \subsection{Virtqueues}\label{sec:Device Types / Socket Device / Virtqueues}
>
> \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>
>-There are currently no feature bits defined for this device.
>+\begin{description}
>+\item VIRTIO_VSOCK_F_SEQPACKET (1) SOCK_SEQPACKET socket type is
>+    supported.
>+\end{description}

The VIRTIO_VSOCK_F_STREAM is described in the datagram series by Jiang,
so this patch should be fine:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


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

