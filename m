Return-Path: virtio-comment-return-1865-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DA70F9865EB
	for <virtio-comment@lists.oasis-open.org>; Thu, 27 May 2021 13:16:01 +0000 (UTC)
Date: Thu, 27 May 2021 15:15:49 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <20210527131549.qs4z4re7yxsb37f5@steredhat>
References: <20210524183232.2513690-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210524183232.2513690-1-arseny.krasnov@kaspersky.com>
Subject: Re: [virtio-comment] [PATCH v6 0/2] virtio-vsock: introduce
 SOCK_SEQPACKET description
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Cc: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Andra Paraschiv <andraprs@amazon.com>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, May 24, 2021 at 09:32:29PM +0300, Arseny Krasnov wrote:
>This adds description of SOCK_SEQPACKET type for virtio-vsock.
>
>Here is latest RFC implementation for Linux, with more details:
>
>https://lkml.org/lkml/2021/5/20/2386
>
>Also this patchset has patch which replaces enums to defines in
>virtio-vsock part of spec. SOCK_SEQPACKET patch is based on it.
>
> Arseny Krasnov(2):
>  virtio-vsock: use C style defines for constants
>  virtio-vsock: SOCK_SEQPACKET description
>
> virtio-vsock.tex | 74 ++++++++++++++++++++++++++++------------------
> 1 file changed, 46 insertions(+), 28 deletions(-)
>

The series LGTM!

Let's wait for other comments.

I'll send a follow up patch next week about feature bit for stream 
socket (bit 0).

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

