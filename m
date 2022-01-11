Return-Path: <virtio-comment-return-2503-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 686BF986439
	for <virtio-comment@lists.oasis-open.org>; Tue, 11 Jan 2022 20:29:39 +0000 (UTC)
References: <20220105163505.192146-1-sgarzare@redhat.com>
 <20220105163505.192146-4-sgarzare@redhat.com>
 <YdwWP9QezIinC2HB@stefanha-x1.localdomain>
 <20220111121219.y2hppti7ypwr7qb4@steredhat>
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Message-ID: <71ca56f6-a164-faa4-e995-f1b19a64d71c@kaspersky.com>
Date: Tue, 11 Jan 2022 23:29:30 +0300
MIME-Version: 1.0
In-Reply-To: <20220111121219.y2hppti7ypwr7qb4@steredhat>
Subject: [virtio-comment] Re: [PATCH v10 3/3] virtio-vsock: SOCK_SEQPACKET description
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Stefano Garzarella <sgarzare@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "jasowang@redhat.com" <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 11.01.2022 15:12, Stefano Garzarella wrote:
> On Mon, Jan 10, 2022 at 11:19:27AM +0000, Stefan Hajnoczi wrote:
>> On Wed, Jan 05, 2022 at 05:35:05PM +0100, Stefano Garzarella wrote:
>>> From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>>>
>>> This adds description of SOCK_SEQPACKET socket type
>>> support for virtio-vsock.
>>>
>>> Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>>> ---
>>>  virtio-vsock.tex | 39 +++++++++++++++++++++++++++++++++++----
>>>  1 file changed, 35 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>>> index bf015ac..9fa93f2 100644
>>> --- a/virtio-vsock.tex
>>> +++ b/virtio-vsock.tex
>>> @@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>>>
>>>  \begin{description}
>>>  \item VIRTIO_VSOCK_F_STREAM (0) stream socket type is supported.
>>> +\item VIRTIO_VSOCK_F_SEQPACKET (1) seqpacket socket type is supported.
>>>  \end{description}
>>>
>>>  \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
>>> @@ -139,15 +140,17 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
>>>  consists of a (cid, port number) tuple. The header fields used for this are
>>>  \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>>>
>>> -Currently only stream sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
>>> -for stream socket types.
>>> +Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
>>> +for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
>>>
>>>  \begin{lstlisting}
>>> -#define VIRTIO_VSOCK_TYPE_STREAM 1
>>> +#define VIRTIO_VSOCK_TYPE_STREAM    1
>>> +#define VIRTIO_VSOCK_TYPE_SEQPACKET 2
>>>  \end{lstlisting}
>>>
>>>  Stream sockets provide in-order, guaranteed, connection-oriented delivery
>>> -without message boundaries.
>>> +without message boundaries. Seqpacket sockets provide in-order, guaranteed,
>>> +connection-oriented delivery with message and record boundaries.
>>>
>>>  \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device / Device Operation / Buffer Space Management}
>>>  \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management of
>>> @@ -248,6 +251,34 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
>>>  destination) address tuple for a new connection while the other peer is still
>>>  processing the old connection.
>>>
>>> +\subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets}
>>> +
>>> +\paragraph{Message and record boundaries}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets / Boundaries}
>>> +Two types of boundaries supported: message and record boundaries.
>> s/boundaries supported/boundaries are supported/
> Will fix.
>
>>> +
>>> +A message contains data sent by a single system call. Message boundary means
>>> +that data of single send system call is guaranteed to be read wholly by single
>>> +receive system call. If receive buffer is not enough, then out of size data
>>> +will be dropped.
>> The VIRTIO spec tends to focus on the hardware interface and avoids
>> implementation details and application APIs like system calls. Maybe
>> system calls are an important concept here but I think this could be
>> rephrased in terms of "operations":
>>
>>  A message contains data sent in a single operation. ...
> Okay, I agree to use "operations" instead of "system calls".
>
>> The "Message boundary" sentence isn't clear to me. I guess it's saying
>> that messages are never split into smaller pieces from the perspective
>> of read operations? This seems like an implementation detail and the
>> device would work fine if a different implementation supported read
>> operations that split messages into multiple read buffers - it doesn't
>> make a different from the hardware interface perspective.
> Yes, I would like to remove this part and simply say that the message
> can be split into multiple RW packets and rearrange the paragraph to
> say right away that the last packet will have the EOM bit set.
>
>> "If receive buffer is not enough, then out of size data ..." -> "If the
>> receive buffer is not large enough, then data exceeding the buffer is
>> dropped."
>>
>> I think this receive buffer refers to the read(2)/recv(2) syscall data
>> buffer and not the virtio-vsock credit limit? So this statement relates
>> to the behavior of SOCK_SEQPACKET, which is outside the scope of the
>> VIRTIO spec (it's not part of the hardware interface and it's a
>> Linux/POSIX-specific Sockets API feature). I think it can be dropped
> >from the spec.
>
> Yep, I'll drop it.
>
>
> So the paragraph will be like this:
>
> @@ -248,6 +251,27 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
>   destination) address tuple for a new connection while the other peer is still
>   processing the old connection.
>
> +\subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets}
> +
> +\paragraph{Message and record boundaries}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets / Boundaries}
> +Two types of boundaries are supported: message and record boundaries.
> +
> +A message contains data sent in a single operation. A single message can be
> +split into multiple RW packets.
> +To provide message boundaries, last RW packet of each message has
> +VIRTIO_VSOCK_SEQ_EOM bit (bit 0) set in the \field{flags} of packet's header.
> +
> +Record is any number of subsequent messages, where last message is sent with POSIX
> +MSG_EOR flag set. Record boundary means that receiver gets MSG_EOR flag set
> +in the corresponding message where sender set it.
> +To provide record boundaries, last RW packet of each record has VIRTIO_VSOCK_SEQ_EOR
> +bit (bit 1) set in the \field{flags} of packet's header.
> +
> +\begin{lstlisting}
> +#define VIRTIO_VSOCK_SEQ_EOM (1 << 0)
> +#define VIRTIO_VSOCK_SEQ_EOR (1 << 1)
> +\end{lstlisting}
> +
>   \subsubsection{Device Events}\label{sec:Device Types / Socket Device / Device Operation / Device Events}
>
>   Certain events are communicated by the device to the driver using the event
>
> Thanks,
> Stefano

Thanks for fixes of this patch, seems it was really a little bit strange to

use system call specific things in this spec.

>
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

