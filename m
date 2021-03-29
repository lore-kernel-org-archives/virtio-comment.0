Return-Path: virtio-comment-return-1803-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D6E95986297
	for <virtio-comment@lists.oasis-open.org>; Mon, 29 Mar 2021 21:28:27 +0000 (UTC)
Date: Mon, 29 Mar 2021 23:28:18 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <20210329212818.qdeprjhep745yeur@steredhat>
References: <20210326090154.1144100-1-arseny.krasnov@kaspersky.com>
 <20210326090254.1144486-1-arseny.krasnov@kaspersky.com>
 <YGH8IqLRdh5JCZyT@stefanha-x1.localdomain>
 <230d95fd-29e8-465b-0ab2-b406d614c11b@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <230d95fd-29e8-465b-0ab2-b406d614c11b@kaspersky.com>
Subject: Re: [virtio-comment] [RFC PATCH v4 2/2] virtio-vsock: SOCK_SEQPACKET
 description
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, cohuck@redhat.com, virtio-comment@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Andra Paraschiv <andraprs@amazon.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Alexander Popov <alex.popov@linux.com>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Mar 29, 2021 at 08:33:27PM +0300, Arseny Krasnov wrote:
>
>On 29.03.2021 19:11, Stefan Hajnoczi wrote:
>> On Fri, Mar 26, 2021 at 12:02:50PM +0300, Arseny Krasnov wrote:
>>> This adds description of SOCK_SEQPACKET socket type
>>> support for virtio-vsock.
>>>
>>> Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>>> ---
>>>  virtio-vsock.tex | 65 +++++++++++++++++++++++++++++++++++++++++++-----
>>>  1 file changed, 59 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>>> index ad57f9d..c366de7 100644
>>> --- a/virtio-vsock.tex
>>> +++ b/virtio-vsock.tex
>>> @@ -17,6 +17,10 @@ \subsection{Virtqueues}\label{sec:Device Types / Socket Device / Virtqueues}
>>>  \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>>>
>>>  There are currently no feature bits defined for this device.
>> ^ This line is now out of date :)
>Ack
>>
>>> +\begin{description}
>>> +\item VIRTIO_VSOCK_F_SEQPACKET (0) SOCK_SEQPACKET socket type is
>>> +    supported.
>>> +\end{description}
>>>
>>>  \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
>>>
>>> @@ -98,6 +102,10 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
>>>  #define VIRTIO_VSOCK_OP_CREDIT_UPDATE  6
>>>  /* Request the peer to send the credit info to us */
>>>  #define VIRTIO_VSOCK_OP_CREDIT_REQUEST 7
>>> +/* Message begin for SOCK_SEQPACKET */
>>> +#define VIRTIO_VSOCK_OP_SEQ_BEGIN      8
>>> +/* Message end for SOCK_SEQPACKET */
>>> +#define VIRTIO_VSOCK_OP_SEQ_END        9
>> The struct virtio_vsock_hdr->flags field is le32 and currently unused.
>> Could 24 bits be used for a unique message id and 8 bits for flags? 1
>> flag bit could be used for end-of-message and the remaining 7 bits could
>> be reserved. That way SEQ_BEGIN and SEQ_END are not necessary.  
>> Pressure
>> on the virtqueue would be reduced and performance should be comparable
>> to SOCK_STREAM.
>
>Well, my first versions of SOCK_SEQPACKET implementation, worked
>something like this: i used flags field of header as length of whole
>message. I discussed it with Stefano Garzarella, and he told that it 
>will
>be better to use special "header" in packet's payload, to keep some
>SOCK_SEQPACKET specific data, instead of reusing packet's header
>fields.

IIRC in the first implementation SEQ_BEGIN was an empty message and we 
didn't added the msg_id yet. So since we needed to carry both id and 
total length, I suggested to use the payload to put these extra 
information.

IIUC what Stefan is suggesting is a bit different and I think it should 
be cool to implement: we can remove the boundary packets, use only 8 
bits for the flags, and add a new field to reuse the 24 unused bits, 
maybe also 16 bits would be enough.
At that point we will only use the EOR flag to know the last packet.

The main difference will be that the receiver will know the total size 
only when the last packet is received.

Do you see any issue on that approach?

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

