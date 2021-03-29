Return-Path: virtio-comment-return-1802-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DB4B39861F8
	for <virtio-comment@lists.oasis-open.org>; Mon, 29 Mar 2021 17:33:38 +0000 (UTC)
References: <20210326090154.1144100-1-arseny.krasnov@kaspersky.com>
 <20210326090254.1144486-1-arseny.krasnov@kaspersky.com>
 <YGH8IqLRdh5JCZyT@stefanha-x1.localdomain>
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Message-ID: <230d95fd-29e8-465b-0ab2-b406d614c11b@kaspersky.com>
Date: Mon, 29 Mar 2021 20:33:27 +0300
MIME-Version: 1.0
In-Reply-To: <YGH8IqLRdh5JCZyT@stefanha-x1.localdomain>
Subject: Re: [virtio-comment] [RFC PATCH v4 2/2] virtio-vsock: SOCK_SEQPACKET
 description
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Andra Paraschiv <andraprs@amazon.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Alexander Popov <alex.popov@linux.com>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 29.03.2021 19:11, Stefan Hajnoczi wrote:
> On Fri, Mar 26, 2021 at 12:02:50PM +0300, Arseny Krasnov wrote:
>> This adds description of SOCK_SEQPACKET socket type
>> support for virtio-vsock.
>>
>> Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>> ---
>>  virtio-vsock.tex | 65 +++++++++++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 59 insertions(+), 6 deletions(-)
>>
>> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>> index ad57f9d..c366de7 100644
>> --- a/virtio-vsock.tex
>> +++ b/virtio-vsock.tex
>> @@ -17,6 +17,10 @@ \subsection{Virtqueues}\label{sec:Device Types / Socket Device / Virtqueues}
>>  \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>>  
>>  There are currently no feature bits defined for this device.
> ^ This line is now out of date :)
Ack
>
>> +\begin{description}
>> +\item VIRTIO_VSOCK_F_SEQPACKET (0) SOCK_SEQPACKET socket type is
>> +    supported.
>> +\end{description}
>>  
>>  \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
>>  
>> @@ -98,6 +102,10 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
>>  #define VIRTIO_VSOCK_OP_CREDIT_UPDATE  6
>>  /* Request the peer to send the credit info to us */
>>  #define VIRTIO_VSOCK_OP_CREDIT_REQUEST 7
>> +/* Message begin for SOCK_SEQPACKET */
>> +#define VIRTIO_VSOCK_OP_SEQ_BEGIN      8
>> +/* Message end for SOCK_SEQPACKET */
>> +#define VIRTIO_VSOCK_OP_SEQ_END        9
> The struct virtio_vsock_hdr->flags field is le32 and currently unused.
> Could 24 bits be used for a unique message id and 8 bits for flags? 1
> flag bit could be used for end-of-message and the remaining 7 bits could
> be reserved. That way SEQ_BEGIN and SEQ_END are not necessary. Pressure
> on the virtqueue would be reduced and performance should be comparable
> to SOCK_STREAM.

Well, my first versions of SOCK_SEQPACKET implementation, worked

something like this: i used flags field of header as length of whole

message. I discussed it with Stefano Garzarella, and he told that it will

be better to use special "header" in packet's payload, to keep some

SOCK_SEQPACKET specific data, instead of reusing packet's header

fields.

>
>>  \end{lstlisting}
>>  
>>  \subsubsection{Virtqueue Flow Control}\label{sec:Device Types / Socket Device / Device Operation / Virtqueue Flow Control}
>> @@ -135,15 +143,16 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
>>  consists of a (cid, port number) tuple. The header fields used for this are
>>  \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>>  
>> -Currently only stream sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
>> -for stream socket types.
>> +Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
>> +for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
>>  
>>  \begin{lstlisting}
>> -#define VIRTIO_VSOCK_TYPE_STREAM 1
>> +#define VIRTIO_VSOCK_TYPE_STREAM    1
>> +#define VIRTIO_VSOCK_TYPE_SEQPACKET 2
>>  \end{lstlisting}
>>  
>>  Stream sockets provide in-order, guaranteed, connection-oriented delivery
>> -without message boundaries.
>> +without message boundaries. Seqpacket sockets also provide message boundaries.
> "also" is ambiguous, I guess it means "is the same except ..." here. I
> suggest writing out the characteristics of seqpacket sockets in full:
>
>   Seqpacket sockets provide in-order, guaranteed, connection-oriented
>   delivery with message boundaries.
>
> If "also" is intended to mean that message boundaries are optional, then
> my understanding is that they are mandatory, not optional. Seqpacket
> sockets deliver entire messages and therefore communication is
> impossible without message boundaries.
Yes, message boundaries is mandatory.
>>  
>>  \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device / Device Operation / Buffer Space Management}
>>  \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management of
>> @@ -170,8 +179,10 @@ \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device /
>>  communicating updates any time a change in buffer space occurs.
>>  
>>  \drivernormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Buffer Space Management}
>> -VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
>> -sufficient free buffer space for the payload.
>> +VIRTIO_VSOCK_OP_RW data packets as well as VIRTIO_VSOCK_OP_SEQ_BEGIN and
>> +VIRTIO_VSOCK_OP_SEQ_END message boundary packets MUST only be
>> +transmitted when the peer has sufficient free buffer space for the
>> +payload.
>>  
>>  All packets associated with a stream flow MUST contain valid information in
>>  \field{buf_alloc} and \field{fwd_cnt} fields.
>> @@ -244,6 +255,48 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
>>  destination) address tuple for a new connection while the other peer is still
>>  processing the old connection.
>>  
>> +\subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets}
>> +
>> +\paragraph{Message boundaries}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets / Message boundaries}
>> +
>> +Seqpacket sockets differ from stream sockets only in data transmission way: in
> s/in data transmission way/in how data is transmitted/
Ack
>
>> +stream sockets all data is sent using only VIRTIO_VSOCK_OP_RW packets. In
>> +seqpacket sockets, to provide message boundaries, every sequence of
>> +VIRTIO_VSOCK_OP_RW packets of each message MUST be headed with
>> +VIRTIO_VSOCK_OP_SEQ_BEGIN and tailed with VIRTIO_VSOCK_OP_SEQ_END packets.
>> +Both VIRTIO_VSOCK_OP_SEQ_BEGIN and VIRTIO_VSOCK_OP_SEQ_END packets MUST carry
> s/MUST//
>
> MUST/MAY/CAN/SHOULD/etc are only used in normative sections of the spec.
Ack
>
>> +special structure in payload:
> s/carry special structure in payload/carry the following payload/
Ack
>
>> +
>> +\begin{lstlisting}
>> +struct virtio_vsock_seq_hdr {
>> +	__le32  msg_id;
>> +	__le32  msg_len;
>> +};
>> +\end{lstlisting}
>> +
>> +This data MUST be placed starting from the first byte of payload and no more
> s/MUST be/is/
>
> s/starting from/starting at/
Ack
>
>> +data is allowed to be beyond it. Also payload of such packet MUST be transmitted
> s/to be//
>
> s/MUST be/is/
>
> Which "payload" is this sentence referring to? The previous sentence
> referred to the payload of
> VIRTIO_VSOCK_OP_SEQ_BEGIN/VIRTIO_VSOCK_OP_SEQ_END packets, but here I'm
> not sure if the text is referring to VIRTIO_VSOCK_OP_RW packets.

I mean payload of SEQ_BEGIN, SEQ_END packets. May be:

s/payload of such/payload of both SEQ_BEGIN and SEQ_END/

>
>> +without fragmentation. \field{len} of packet header MUST be set to the size of
> The word "fragmentation" is not used in the Socket device section and
> it's not clear to me what it means. It seems like SEQ_BEGIN is followed
> by one or more RW packets and then SEQ_END. But does splitting a message
> across multiple RW packets count as "fragmentation"?

I think i can remove this part. Because requirement about "fragmentation"

is specific to Linux driver, which could fragment payload of every packet at

transport layer(it is not ciritical for payload of RW packet, but with SEQ_BEGIN/SEQ_END

it will break special structure which used for message boundaries), but anyway,

in theory, fragmented payload could be defragmented back by receiver.

>
> s/\field{len} of packet header/The packet header \field{len} field/
>
> s/MUST be/is/
Ack
>
>> +the struct virtio_vsock_seq_hdr.
>> +
>> +\field{msg_id} is value to identify message. It MUST be same for pair of
> s/is value to identify message/is a unique valid to identify a message/
>
> s/MUST be/is the/
>
> s/for pair/for a pair/
Ack
>
>> +VIRTIO_VSOCK_OP_SEQ_BEGIN and VIRTIO_VSOCK_OP_SEQ_END of one message, and MUST
> s/of one message/packets related to one message/
Ack
>
>> +differ in next messages. \field{msg_len} contains message length. This header
> "MUST differ in next messages" can be removed here. If we describe
> msg_id as "unique" above the the intent is clear and sentence can be
> added to the driver normative section indicating that all msg_id values
> in use at a given time MUST be unique.
>
> s/contains message length/contains the message length/
Ack
>
>> +is used to check integrity of each message: message is valid if length of data
> s/check integrity/check the integrity/
>
> s/if length/if the total length/
>
> (I suggest adding "total" to make it clear that the lengths of all RW
> packets is summed. This rules out the interpretation that each RW
> packet's length must be msg_len.)
Ack
>
>> +in VIRTIO_VSOCK_OP_RW packets is equal to \field{msg_len} of prepending
> s/in VIRTIO_VSOCK_OP_RW packets/in the VIRTIO_VSOCK_OP_RW packets/
>
> s/prepending/the corresponding/
Ack
>
>> +VIRTIO_VSOCK_OP_SEQ_BEGIN and \field{msg_id} of VIRTIO_VSOCK_OP_SEQ_END is equal
>> +to \field{msg_id} of VIRTIO_VSOCK_OP_SEQ_BEGIN.
>> +
>> +\paragraph{POSIX MSG_EOR flag}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets / MSG_EOR flag}
>> +
>> +When message is sent using one of POSIX functions: send(), sendto() or sendmsg() and
>> +MSG_EOR flag is set in \field{flags} parameter of these functions, then all VIRTIO_VSOCK_OP_RW
>> +packets of this message MUST have \field{flags} field in header set to special constanst:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_VSOCK_RW_EOR 1
>> +\end{lstlisting}
> I'm not familiar with MSG_EOR. It seems to be a hint to send buffered
> data with Linux TCP sockets and it's not implemented for Linux AF_UNIX
> sockets.
>
> How is MSG_EOR useful if SEQ_END already deliminates message boundaries?
>
> It seems like passing the MSG_EOR flag in this way provides an
> additional layer on top of message boundaries? It's not clear to me that
> MSG_EOR has to work like that according to POSIX. Do you have a link to
> the POSIX spec pages that describe how MSG_EOR works?

Yes, that confused me too, i've implemented MSG_EOR as optional

flag, supported by protocol. In practice, it repeats message boundary.

I'll search in web, for more details. May be i can remove MSG_EOR

from my implementation.


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

