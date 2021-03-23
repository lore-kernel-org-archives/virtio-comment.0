Return-Path: virtio-comment-return-1774-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3CC89986086
	for <virtio-comment@lists.oasis-open.org>; Tue, 23 Mar 2021 06:18:48 +0000 (UTC)
References: <20210322063804.641923-1-arseny.krasnov@kaspersky.com>
 <YFiE9opnZ976hwbP@stefanha-x1.localdomain>
 <20210322092547-mutt-send-email-mst@kernel.org>
 <YFip8VVJOXy2EpjH@stefanha-x1.localdomain>
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Message-ID: <71e16d33-b5f5-d551-ad5a-22b45e946b9a@kaspersky.com>
Date: Tue, 23 Mar 2021 09:18:34 +0300
MIME-Version: 1.0
In-Reply-To: <YFip8VVJOXy2EpjH@stefanha-x1.localdomain>
Subject: [virtio-comment] Re: [RFC PATCH v1] virtio-vsock: use C style defines for constants
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Andra Paraschiv <andraprs@amazon.com>, Colin Ian King <colin.king@canonical.com>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 22.03.2021 17:30, Stefan Hajnoczi wrote:
> On Mon, Mar 22, 2021 at 09:34:58AM -0400, Michael S. Tsirkin wrote:
>> On Mon, Mar 22, 2021 at 11:52:22AM +0000, Stefan Hajnoczi wrote:
>>> On Mon, Mar 22, 2021 at 09:37:59AM +0300, Arseny Krasnov wrote:
>>>> @@ -227,6 +226,11 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
>>>>  hints are permanent once sent and successive packets with bits clear do not
>>>>  reset them.
>>>>  
>>>> +\begin{lstlisting}
>>>> +#define VIRTIO_VSOCK_SHUTDOWN_RECEIVE_BIT 0
>>>> +#define VIRTIO_VSOCK_SHUTDOWN_SEND_BIT    1
>>>> +\end{lstlisting}
>>> The spec has no other _BIT constants.
>> True. Sometimes there's an _F_ somewhere there instead.
> You're right, I missed the virtio-net bit constants:
>
>   #define VIRTIO_NET_F_GUEST_TSO4 7
>
> Compared to:
>
>   #define VIRTQ_DESC_F_AVAIL     (1 << 7)
>
> or
>
>   #define VIRTQ_DESC_F_WRITE     2
>
> It's an inconsistent mix :). Hard to tell them apart when they aren't
> bitmask constants with '<<'.
>
> Can we use '<<' for clarity on new constants?

So for bit constants, i can use:

#define VIRTIO_VSOCK_SHUTDOWN_RECEIVE (1 << 0)
#define VIRTIO_VSOCK_SHUTDOWN_SEND    (1 << 1)

for this case and all other next cases, when i'll add SEQPACKET
description in spec?


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

