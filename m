Return-Path: virtio-comment-return-1783-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5570E9860E0
	for <virtio-comment@lists.oasis-open.org>; Tue, 23 Mar 2021 13:20:41 +0000 (UTC)
References: <20210323090449.527947-1-arseny.krasnov@kaspersky.com>
 <YFnigCXUZrOUzi+G@stefanha-x1.localdomain>
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Message-ID: <e8399633-f082-174c-d0ba-f1f1d5eccdce@kaspersky.com>
Date: Tue, 23 Mar 2021 16:20:37 +0300
MIME-Version: 1.0
In-Reply-To: <YFnigCXUZrOUzi+G@stefanha-x1.localdomain>
Subject: [virtio-comment] Re: [RFC PATCH v2] virtio-vsock: use C style defines for constants
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Andra Paraschiv <andraprs@amazon.com>, Jeff Vander Stoep <jeffv@google.com>, Alexander Popov <alex.popov@linux.com>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 23.03.2021 15:43, Stefan Hajnoczi wrote:
> On Tue, Mar 23, 2021 at 12:04:44PM +0300, Arseny Krasnov wrote:
>> This:
>> 1) Replaces enums with C style defines.
> Why? Please include the rationale for this change in the commit
> description.
Ack
>
>> @@ -227,6 +226,11 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
>>  hints are permanent once sent and successive packets with bits clear do not
>>  reset them.
>>  
>> +\begin{lstlisting}
>> +#define VIRTIO_VSOCK_SHUTDOWN_RECEIVE_BIT 0
>> +#define VIRTIO_VSOCK_SHUTDOWN_SEND_BIT    1
>> +\end{lstlisting}
> Please reference these constants in the text.

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

