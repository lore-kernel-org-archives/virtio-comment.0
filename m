Return-Path: virtio-comment-return-1801-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9DE409861F7
	for <virtio-comment@lists.oasis-open.org>; Mon, 29 Mar 2021 16:12:35 +0000 (UTC)
Date: Mon, 29 Mar 2021 17:11:14 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YGH8IqLRdh5JCZyT@stefanha-x1.localdomain>
References: <20210326090154.1144100-1-arseny.krasnov@kaspersky.com>
 <20210326090254.1144486-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210326090254.1144486-1-arseny.krasnov@kaspersky.com>
Subject: Re: [virtio-comment] [RFC PATCH v4 2/2] virtio-vsock: SOCK_SEQPACKET
 description
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xeRT9Ca9nRFlG2L/"
Content-Disposition: inline
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Cc: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Andra Paraschiv <andraprs@amazon.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Alexander Popov <alex.popov@linux.com>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

--xeRT9Ca9nRFlG2L/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 12:02:50PM +0300, Arseny Krasnov wrote:
> This adds description of SOCK_SEQPACKET socket type
> support for virtio-vsock.
>=20
> Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
> ---
>  virtio-vsock.tex | 65 +++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 59 insertions(+), 6 deletions(-)
>=20
> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
> index ad57f9d..c366de7 100644
> --- a/virtio-vsock.tex
> +++ b/virtio-vsock.tex
> @@ -17,6 +17,10 @@ \subsection{Virtqueues}\label{sec:Device Types / Socke=
t Device / Virtqueues}
>  \subsection{Feature bits}\label{sec:Device Types / Socket Device / Featu=
re bits}
> =20
>  There are currently no feature bits defined for this device.

^ This line is now out of date :)

> +\begin{description}
> +\item VIRTIO_VSOCK_F_SEQPACKET (0) SOCK_SEQPACKET socket type is
> +    supported.
> +\end{description}
> =20
>  \subsection{Device configuration layout}\label{sec:Device Types / Socket=
 Device / Device configuration layout}
> =20
> @@ -98,6 +102,10 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Socket Device / Device Op
>  #define VIRTIO_VSOCK_OP_CREDIT_UPDATE  6
>  /* Request the peer to send the credit info to us */
>  #define VIRTIO_VSOCK_OP_CREDIT_REQUEST 7
> +/* Message begin for SOCK_SEQPACKET */
> +#define VIRTIO_VSOCK_OP_SEQ_BEGIN      8
> +/* Message end for SOCK_SEQPACKET */
> +#define VIRTIO_VSOCK_OP_SEQ_END        9

The struct virtio_vsock_hdr->flags field is le32 and currently unused.
Could 24 bits be used for a unique message id and 8 bits for flags? 1
flag bit could be used for end-of-message and the remaining 7 bits could
be reserved. That way SEQ_BEGIN and SEQ_END are not necessary. Pressure
on the virtqueue would be reduced and performance should be comparable
to SOCK_STREAM.

>  \end{lstlisting}
> =20
>  \subsubsection{Virtqueue Flow Control}\label{sec:Device Types / Socket D=
evice / Device Operation / Virtqueue Flow Control}
> @@ -135,15 +143,16 @@ \subsubsection{Addressing}\label{sec:Device Types /=
 Socket Device / Device Opera
>  consists of a (cid, port number) tuple. The header fields used for this =
are
>  \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}=
.
> =20
> -Currently only stream sockets are supported. \field{type} is 1 (VIRTIO_V=
SOCK_TYPE_STREAM)
> -for stream socket types.
> +Currently stream and seqpacket sockets are supported. \field{type} is 1 =
(VIRTIO_VSOCK_TYPE_STREAM)
> +for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpack=
et socket types.
> =20
>  \begin{lstlisting}
> -#define VIRTIO_VSOCK_TYPE_STREAM 1
> +#define VIRTIO_VSOCK_TYPE_STREAM    1
> +#define VIRTIO_VSOCK_TYPE_SEQPACKET 2
>  \end{lstlisting}
> =20
>  Stream sockets provide in-order, guaranteed, connection-oriented deliver=
y
> -without message boundaries.
> +without message boundaries. Seqpacket sockets also provide message bound=
aries.

"also" is ambiguous, I guess it means "is the same except ..." here. I
suggest writing out the characteristics of seqpacket sockets in full:

  Seqpacket sockets provide in-order, guaranteed, connection-oriented
  delivery with message boundaries.

If "also" is intended to mean that message boundaries are optional, then
my understanding is that they are mandatory, not optional. Seqpacket
sockets deliver entire messages and therefore communication is
impossible without message boundaries.

> =20
>  \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket =
Device / Device Operation / Buffer Space Management}
>  \field{buf_alloc} and \field{fwd_cnt} are used for buffer space manageme=
nt of
> @@ -170,8 +179,10 @@ \subsubsection{Buffer Space Management}\label{sec:De=
vice Types / Socket Device /
>  communicating updates any time a change in buffer space occurs.
> =20
>  \drivernormative{\paragraph}{Device Operation: Buffer Space Management}{=
Device Types / Socket Device / Device Operation / Buffer Space Management}
> -VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer h=
as
> -sufficient free buffer space for the payload.
> +VIRTIO_VSOCK_OP_RW data packets as well as VIRTIO_VSOCK_OP_SEQ_BEGIN and
> +VIRTIO_VSOCK_OP_SEQ_END message boundary packets MUST only be
> +transmitted when the peer has sufficient free buffer space for the
> +payload.
> =20
>  All packets associated with a stream flow MUST contain valid information=
 in
>  \field{buf_alloc} and \field{fwd_cnt} fields.
> @@ -244,6 +255,48 @@ \subsubsection{Stream Sockets}\label{sec:Device Type=
s / Socket Device / Device O
>  destination) address tuple for a new connection while the other peer is =
still
>  processing the old connection.
> =20
> +\subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device=
 / Device Operation / Seqpacket Sockets}
> +
> +\paragraph{Message boundaries}\label{sec:Device Types / Socket Device / =
Device Operation / Seqpacket Sockets / Message boundaries}
> +
> +Seqpacket sockets differ from stream sockets only in data transmission w=
ay: in

s/in data transmission way/in how data is transmitted/

> +stream sockets all data is sent using only VIRTIO_VSOCK_OP_RW packets. I=
n
> +seqpacket sockets, to provide message boundaries, every sequence of
> +VIRTIO_VSOCK_OP_RW packets of each message MUST be headed with
> +VIRTIO_VSOCK_OP_SEQ_BEGIN and tailed with VIRTIO_VSOCK_OP_SEQ_END packet=
s.
> +Both VIRTIO_VSOCK_OP_SEQ_BEGIN and VIRTIO_VSOCK_OP_SEQ_END packets MUST =
carry

s/MUST//

MUST/MAY/CAN/SHOULD/etc are only used in normative sections of the spec.

> +special structure in payload:

s/carry special structure in payload/carry the following payload/

> +
> +\begin{lstlisting}
> +struct virtio_vsock_seq_hdr {
> +=09__le32  msg_id;
> +=09__le32  msg_len;
> +};
> +\end{lstlisting}
> +
> +This data MUST be placed starting from the first byte of payload and no =
more

s/MUST be/is/

s/starting from/starting at/

> +data is allowed to be beyond it. Also payload of such packet MUST be tra=
nsmitted

s/to be//

s/MUST be/is/

Which "payload" is this sentence referring to? The previous sentence
referred to the payload of
VIRTIO_VSOCK_OP_SEQ_BEGIN/VIRTIO_VSOCK_OP_SEQ_END packets, but here I'm
not sure if the text is referring to VIRTIO_VSOCK_OP_RW packets.

> +without fragmentation. \field{len} of packet header MUST be set to the s=
ize of

The word "fragmentation" is not used in the Socket device section and
it's not clear to me what it means. It seems like SEQ_BEGIN is followed
by one or more RW packets and then SEQ_END. But does splitting a message
across multiple RW packets count as "fragmentation"?

s/\field{len} of packet header/The packet header \field{len} field/

s/MUST be/is/

> +the struct virtio_vsock_seq_hdr.
> +
> +\field{msg_id} is value to identify message. It MUST be same for pair of

s/is value to identify message/is a unique valid to identify a message/

s/MUST be/is the/

s/for pair/for a pair/

> +VIRTIO_VSOCK_OP_SEQ_BEGIN and VIRTIO_VSOCK_OP_SEQ_END of one message, an=
d MUST

s/of one message/packets related to one message/

> +differ in next messages. \field{msg_len} contains message length. This h=
eader

"MUST differ in next messages" can be removed here. If we describe
msg_id as "unique" above the the intent is clear and sentence can be
added to the driver normative section indicating that all msg_id values
in use at a given time MUST be unique.

s/contains message length/contains the message length/

> +is used to check integrity of each message: message is valid if length o=
f data

s/check integrity/check the integrity/

s/if length/if the total length/

(I suggest adding "total" to make it clear that the lengths of all RW
packets is summed. This rules out the interpretation that each RW
packet's length must be msg_len.)

> +in VIRTIO_VSOCK_OP_RW packets is equal to \field{msg_len} of prepending

s/in VIRTIO_VSOCK_OP_RW packets/in the VIRTIO_VSOCK_OP_RW packets/

s/prepending/the corresponding/

> +VIRTIO_VSOCK_OP_SEQ_BEGIN and \field{msg_id} of VIRTIO_VSOCK_OP_SEQ_END =
is equal
> +to \field{msg_id} of VIRTIO_VSOCK_OP_SEQ_BEGIN.
> +
> +\paragraph{POSIX MSG_EOR flag}\label{sec:Device Types / Socket Device / =
Device Operation / Seqpacket Sockets / MSG_EOR flag}
> +
> +When message is sent using one of POSIX functions: send(), sendto() or s=
endmsg() and
> +MSG_EOR flag is set in \field{flags} parameter of these functions, then =
all VIRTIO_VSOCK_OP_RW
> +packets of this message MUST have \field{flags} field in header set to s=
pecial constanst:
> +
> +\begin{lstlisting}
> +#define VIRTIO_VSOCK_RW_EOR 1
> +\end{lstlisting}

I'm not familiar with MSG_EOR. It seems to be a hint to send buffered
data with Linux TCP sockets and it's not implemented for Linux AF_UNIX
sockets.

How is MSG_EOR useful if SEQ_END already deliminates message boundaries?

It seems like passing the MSG_EOR flag in this way provides an
additional layer on top of message boundaries? It's not clear to me that
MSG_EOR has to work like that according to POSIX. Do you have a link to
the POSIX spec pages that describe how MSG_EOR works?

--xeRT9Ca9nRFlG2L/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBh/CIACgkQnKSrs4Gr
c8gcdQgAkbhF3uRjnxvBoF+hPrnutBm/yM4p01Xbe2+szxYOfPd5PijfVhbg8TmH
Qx7Fq1axQm7DLryuwYzSQpFdqf8s94+tXstn8gApvdJ31oX1knph2KHL5awArvzN
qut6ZUWVAyTgtcSLONDZKY8TK/daqNP5Yfr28oENKbgCSrezWNILwSQ0FrpK4OKJ
1FLPOcc2m6n8Am275MnWplQN2TGb5+dQt3gBFFXdvwlg1TUtwU8DFg2LLGqkABiL
8xDAoR5F9nEE1RMS5+NtNk+mjtFeJyongzAWBF+LUvSOOIWiE3763oX9go/wFHHA
a+MyRxdiQgSSxvoit1jELBfCztCgHw==
=9gv0
-----END PGP SIGNATURE-----

--xeRT9Ca9nRFlG2L/--

