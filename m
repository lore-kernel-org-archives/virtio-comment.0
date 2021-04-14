Return-Path: virtio-comment-return-1824-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 67A179864CF
	for <virtio-comment@lists.oasis-open.org>; Wed, 14 Apr 2021 06:04:52 +0000 (UTC)
References: <20210413125217.3416876-1-arseny.krasnov@kaspersky.com>
 <20210413125333.3419315-1-arseny.krasnov@kaspersky.com>
 <20210413090642-mutt-send-email-mst@kernel.org>
 <92a6b268-a36a-5f1b-2d67-02accfde70ce@kaspersky.com>
 <20210413155316-mutt-send-email-mst@kernel.org>
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Message-ID: <783d12e5-50b6-2363-f953-bc95d4b59d72@kaspersky.com>
Date: Wed, 14 Apr 2021 09:04:47 +0300
MIME-Version: 1.0
In-Reply-To: <20210413155316-mutt-send-email-mst@kernel.org>
Subject: [virtio-comment] Re: [RFC PATCH v5 2/2] virtio-vsock: SOCK_SEQPACKET description
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "cohuck@redhat.com" <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Colin Ian King <colin.king@canonical.com>, Norbert Slusarek <nslusarek@gmx.net>, Andra Paraschiv <andraprs@amazon.com>, Jeff Vander Stoep <jeffv@google.com>, Alexander Popov <alex.popov@linux.com>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "oxffffaa@gmail.com" <oxffffaa@gmail.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 13.04.2021 22:55, Michael S. Tsirkin wrote:
> On Tue, Apr 13, 2021 at 05:22:44PM +0300, Arseny Krasnov wrote:
>> On 13.04.2021 16:10, Michael S. Tsirkin wrote:
>>> On Tue, Apr 13, 2021 at 03:53:29PM +0300, Arseny Krasnov wrote:
>>>> This adds description of SOCK_SEQPACKET socket type
>>>> support for virtio-vsock.
>>>>
>>>> Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>>>> ---
>>>>  virtio-vsock.tex | 26 +++++++++++++++++++++-----
>>>>  1 file changed, 21 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>>>> index ad57f9d..00e59cc 100644
>>>> --- a/virtio-vsock.tex
>>>> +++ b/virtio-vsock.tex
>>>> @@ -16,7 +16,10 @@ \subsection{Virtqueues}\label{sec:Device Types / So=
cket Device / Virtqueues}
>>>> =20
>>>>  \subsection{Feature bits}\label{sec:Device Types / Socket Device / Fe=
ature bits}
>>>> =20
>>>> -There are currently no feature bits defined for this device.
>>>> +\begin{description}
>>>> +\item VIRTIO_VSOCK_F_SEQPACKET (0) SOCK_SEQPACKET socket type is
>>>> +    supported.
>>> Does it make sense to only support seqpacket and not stream?
>>> I am guessing not since seqpacket is more or less
>>> a superset ...
>> You mean, this sentence must be "Both SOCK_SEQPACKET and SOCK_STREAM typ=
es
>>
>> are supported"?
>
> No. I am asking whether we want a feature bit for SOCK_STREAM too?

I think=A0 there is no practical sense in SOCK_STREAM bit, because SOCK_SEQ=
PACKET

is stream + message boundaries and potential DGRAM is completely different

thing. Of course i can implement it in my patches and also add it to spec p=
atch, but=A0 i see only

esthetic in this: all three socket types have own feature bits.

>
>
>>>> +\end{description}
>>>> =20
>>>>  \subsection{Device configuration layout}\label{sec:Device Types / Soc=
ket Device / Device configuration layout}
>>>> =20
>>>> @@ -135,15 +138,17 @@ \subsubsection{Addressing}\label{sec:Device Type=
s / Socket Device / Device Opera
>>>>  consists of a (cid, port number) tuple. The header fields used for th=
is are
>>>>  \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_po=
rt}.
>>>> =20
>>>> -Currently only stream sockets are supported. \field{type} is 1 (VIRTI=
O_VSOCK_TYPE_STREAM)
>>>> -for stream socket types.
>>>> +Currently stream and seqpacket sockets are supported. \field{type} is=
 1 (VIRTIO_VSOCK_TYPE_STREAM)
>>>> +for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqp=
acket socket types.
>>>> =20
>>>>  \begin{lstlisting}
>>>> -#define VIRTIO_VSOCK_TYPE_STREAM 1
>>>> +#define VIRTIO_VSOCK_TYPE_STREAM    1
>>>> +#define VIRTIO_VSOCK_TYPE_SEQPACKET 2
>>>>  \end{lstlisting}
>>>> =20
>>>>  Stream sockets provide in-order, guaranteed, connection-oriented deli=
very
>>>> -without message boundaries.
>>>> +without message boundaries. Seqpacket sockets provide in-order, guara=
nteed,
>>>> +connection-oriented delivery with message boundaries.
>>>> =20
>>>>  \subsubsection{Buffer Space Management}\label{sec:Device Types / Sock=
et Device / Device Operation / Buffer Space Management}
>>>>  \field{buf_alloc} and \field{fwd_cnt} are used for buffer space manag=
ement of
>>>> @@ -244,6 +249,17 @@ \subsubsection{Stream Sockets}\label{sec:Device T=
ypes / Socket Device / Device O
>>>>  destination) address tuple for a new connection while the other peer =
is still
>>>>  processing the old connection.
>>>> =20
>>>> +\subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Dev=
ice / Device Operation / Seqpacket Sockets}
>>>> +
>>>> +\paragraph{Message boundaries}\label{sec:Device Types / Socket Device=
 / Device Operation / Seqpacket Sockets / Message boundaries}
>>>> +
>>>> +To provide message boundaries, last RW packet of each message has VIR=
TIO_VSOCK_SEQ_EOR
>>>> +bit set in the \field{flags} of packet's header.
>>>> +
>>>> +\begin{lstlisting}
>>>> +#define VIRTIO_VSOCK_SEQ_EOR 1
>>>> +\end{lstlisting}
>>> Problem is, where is device going to hold this boundary?
>>> Currently device discards the header just keeping the payload
>>> around.
>>> I suspect we need to have some kind of header per message
>>> maintained by the device and
>>> accounted for as part of the the credit accounting.
>> IIUC, in Linux, header's are copied by vhost between buffer
>>
>> in virtqueue and buffer in virtio vsock driver(host to guest transmissio=
n and
>>
>> guest to host transmission). E.g. values of header's field are visible b=
y driver.
> The question is about credit accounting.  With stream we can add as
> little as a single byte with no overhead. No so with seqpacket each
> boundary adds memory overhead.  This memory needs to be accounted for.
> How much I'm not sure. Maybe it needs to be negotiated during
> connection?

Sorry, i don't understand. boundary is bit in flags of RW packet. These RW

packets are inserted to rx queue of socket, in the same way as for stream

socket. The only difference is that user is not woken up until boundary fou=
nd.

All credit account logic works same in both stream and seqpacket.

>
>
>
>>>
>>>> +
>>>>  \subsubsection{Device Events}\label{sec:Device Types / Socket Device =
/ Device Operation / Device Events}
>>>> =20
>>>>  Certain events are communicated by the device to the driver using the=
 event
>>>> --=20
>>>> 2.25.1
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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

