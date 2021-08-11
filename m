Return-Path: <sgarzare@redhat.com>
Date: Wed, 11 Aug 2021 11:22:23 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [virtio-comment] [RFC PATCH v7 1/2] virtio-vsock: use C style
 defines for constants
Message-ID: <20210811092223.5huvk5mewtalnkdg@steredhat>
References: <20210810114616.1216243-1-arseny.krasnov@kaspersky.com>
 <20210810114653.1216436-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210810114653.1216436-1-arseny.krasnov@kaspersky.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Cc: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Andra Paraschiv <andraprs@amazon.com>, Colin Ian King <colin.king@canonical.com>, Norbert Slusarek <nslusarek@gmx.net>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Aug 10, 2021 at 02:46:49PM +0300, Arseny Krasnov wrote:
>This:
>1) Replaces enums with C style "defines", because
>   use of enums is not documented, while "defines"
>   are widely used in spec.
>2) Adds defines for some constants.
>
>Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>---
> virtio-vsock.tex | 54 +++++++++++++++++++++++++-----------------------
> 1 file changed, 28 insertions(+), 26 deletions(-)


Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

