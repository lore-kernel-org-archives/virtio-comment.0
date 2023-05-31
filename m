Return-Path: <virtio-comment-return-6053-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF74C7EE2D
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 17:10:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 00DDF71C88
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 17:10:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D79469865F8
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 17:10:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C3D3898640C; Wed, 31 May 2023 17:10:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B1225986531
	for <virtio-comment@lists.oasis-open.org>; Wed, 31 May 2023 17:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Zaf_7e4RMm6YPSufmR-Mug-1
Date: Wed, 31 May 2023 13:10:36 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, houp@yusur.tech,
	helei.sig11@bytedance.com, xinhao.kong@duke.edu
Message-ID: <20230531171036.GH1248296@fedora>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-7-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w3IiR37jd1Cuy+Yw"
Content-Disposition: inline
In-Reply-To: <20230504081910.238585-7-pizhenwei@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [virtio-comment] Re: [PATCH v2 06/11] transport-fabrics: introduce command set

--w3IiR37jd1Cuy+Yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 04:19:05PM +0800, zhenwei pi wrote:
> Introduce command structures for Virtio-oF.
>=20
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  transport-fabrics.tex | 209 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 209 insertions(+)
>=20
> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
> index 7711321..37f57c6 100644
> --- a/transport-fabrics.tex
> +++ b/transport-fabrics.tex
> @@ -495,3 +495,212 @@ \subsubsection{Buffer Mapping Definition}\label{sec=
:Virtio Transport Options / V
>                      |value |  -> 8193 (value.u32)
>                      +------+
>  \end{lstlisting}
> +
> +\subsubsection{Commands Definition}\label{sec:Virtio Transport Options /=
 Virtio Over Fabrics / Transmission Protocol / Commands Definition}
> +This section defines command structures for Virtio Over Fabrics.
> +
> +A common structure virtio_of_value is fixed to 8 bytes and MUST be used =
as one
> +of the following format:
> +
> +\begin{itemize}
> +\item u8
> +\item le16
> +\item le32
> +\item le64
> +\end{itemize}

The way it's written does not document where the u8, u16, u32 bytes are
located and that the unused bytes are 0. I think I understand what you
mean though:

  le64 value =3D cpu_to_le64((u64)v); /* v is u8, u16, u32, or u64 */

Please clarify.

> +
> +\paragraph{Command ID}\label{sec:Virtio Transport Options / Virtio Over =
Fabrics / Transmission Protocol / Commands Definition / Command ID}
> +There is command_id(le16) field in each Command and Completion:

"is a command_id"

> +
> +\begin{itemize}
> +\item Generally the initiator allocates a Command ID and specifies the

"allocates a Command ID that is unique for all in-flight commands"?

> +command_id field of a Command, and the target MUST specify the same Comm=
and ID

The "MUST" statement needs to be in a driver-normative section. You can
keep the sentence in this non-normative section by tweaking it:
"target specifies"

The idea is that all MUST/SHOULD/etc statements are in a separate
device/driver-normative section so that they can be easily reviewed by
device/driver implementers without re-reading the entire text.

> +in command_id field of Completion.
> +\item The initiator MUST guarantee each Command ID is unique in the infl=
ight Commands.

Same here about "MUST".

> +\item Command ID 0xff00 - 0xffff is reserved for control queue to delive=
ry asynchronous event.

"for control queue asynchronous events"

> +\end{itemize}
> +
> +The reserved Command ID for control queue is defined as follows:

"The reserved Command IDs for the control queue are as follows:"

> +
> +\begin{tabular}{ |l|l| }
> +\hline
> +Command ID & Description \\
> +\hline \hline
> +0xffff & Keepalive. The initiator SHOULD ignore this event \\

"Ignored by the initiator." + move the SHOULD statement to a
driver-normative section.

> +\hline
> +0xfffe & Config change. The initiator SHOULD generate config change inte=
rrupt to device \\

"Causes the initiator to generate a configuration change notification."

> +\hline
> +0xff00 - 0xfffd & Reserved \\
> +\hline
> +\end{tabular}
> +
> +\paragraph{Connect Command}\label{sec:Virtio Transport Options / Virtio =
Over Fabrics / Transmission Protocol / Commands Definition / Connect Comman=
d}
> +The Connect Command is used to establish Virtio Over Fabrics queue. The =
control
> +queue MUST be established firstly, then the Connect command establishes =
an
> +association between the initiator and the target.

Is a "Virtio Over Fabrics queue" different from a virtqueue?

If I understand correctly, the control queue must be established by the
initiator first and then the Connect command is sent to begin
communication between the initiator and the target?

> +
> +The Target ID of 0xffff is reserved, then:

Please move this after the fields have been shown and the purpose of the
Target ID field has been explained.

> +\begin{itemize}
> +\item The Target ID of 0xffff MUST be specified as the Target ID in a Co=
nnect
> +Command for the control queue.
> +\item The target SHOULD allocate any available Target ID to the initiato=
r,
> +and return the allocated Target ID in the Completion.
> +\item The returned Target ID MUST be specified as the Target ID, and the=
 Queue ID
> +MUST be specified in a Connect Command for the virtqueue.
> +\end{itemize}

What is the purpose of the Target ID? Is it to allow a server to provide
access to multiple targets over the same connection?

> +
> +The Connect Command has following structure:
> +
> +\begin{lstlisting}
> +struct virtio_of_command_connect {
> +        le16 opcode;
> +        le16 command_id;
> +        le16 target_id;
> +        le16 queue_id;
> +        le16 ndesc;

Where is this field documented?

Why does the initiator send ndesc to the target? Normally a VIRTIO Transpor=
t reports the device's max descriptors and then the driver can tell the dev=
ice to reduce the number of descriptors, if desired.

> +#define VIRTIO_OF_CONNECTION_TCP     1
> +#define VIRTIO_OF_CONNECTION_RDMA    2

What does RDMA mean? I thought RDMA is a general concept that several
fabrics implement (with different details like how addressing works).

> +        u8 oftype;
> +        u8 padding[5];
> +};
> +\end{lstlisting}
> +
> +The Connect commands MUST contains one Segment Descriptor and one struct=
ure
> +virtio_of_command_connect to specify Initiator VQN and Target VNQ,
> +virtio_of_command_connect has following structure:

I'm confsued. virtio_of_command_connect was defined above. The struct
defined below is virtio_of_connect. Does this paragraph need to be
updated (virtio_of_command_connect -> virtio_of_connect)?

Why is virtio_of_connect a separate struct and not part of
virtio_of_command_connect?

> +
> +\begin{lstlisting}
> +struct virtio_of_connect {
> +        u8 ivqn[256];
> +        u8 tvqn[256];

If the initiator is already sends tvqn, why also have target_id?

> +        u8 padding[512];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Feature Command}\label{sec:Virtio Transport Options / Virtio =
Over Fabrics / Transmission Protocol / Commands Definition / Feature Comman=
d}
> +
> +The control queue uses Feature Command to get or set features. This comm=
and is used for:
> +
> +\begin{itemize}
> +\item The initiator/target features. This is used to negotiate transport=
 layer features.
> +\item The driver/device features. This is used to negotiate Virtio Based=
 device
> +features which is similar to PCI based device.

Please do not make references to the PCI Transport.

> +\end{itemize}
> +
> +The Feature Command has following structure:
> +
> +\begin{lstlisting}
> +struct virtio_of_command_feature {
> +        le16 opcode;
> +        le16 command_id;
> +        le32 feature_select;
> +        le64 value;        /* ignore this field on GET */
> +};
> +\end{lstlisting}

I guess the opcode tells the target whether this is a VIRTIO Features
Get, VIRTIO Features Set, VIRTIO-Over-Fabrics Features Get, or
VIRTIO-Over-Fabrics Features Set command? Please document the opcodes
here and also include a full opcode table somewhere else.

> +
> +\paragraph{Queue Command}\label{sec:Virtio Transport Options / Virtio Ov=
er Fabrics / Transmission Protocol / Commands Definition / Queue Command}
> +
> +The control queue uses Queue Command to get or set properties on a speci=
fic queue.
> +The Queue Command has following structure:
> +
> +\begin{lstlisting}
> +struct virtio_of_command_queue {
> +        le16 opcode;
> +        le16 command_id;
> +        le16 queue_id;

Does "queue" mean virtqueue here? Or does it also apply to the control
queue? If it's a virtqueue, please call this vq_id.

> +        u8 padding6;
> +        u8 padding7;
> +        struct virtio_of_value value;   /* ignore this field on GET */
> +};
> +\end{lstlisting}

The opcode and their semantics are not documented.

> +\paragraph{Config Command}\label{sec:Virtio Transport Options / Virtio O=
ver Fabrics / Transmission Protocol / Commands Definition / Config Command}
> +
> +The control queue uses Config Command to get or set configure on device.
> +The Config Command has following structure:

I suggest choosing a different name to avoid confusion with the
VIRTIO Configuration Space.

> +
> +\begin{lstlisting}
> +struct virtio_of_command_config {
> +        le16 opcode;
> +        le16 command_id;
> +        le16 offset;
> +        u8 bytes;
> +        u8 padding7;
> +        struct virtio_of_value value;        /* ignore this field on GET=
 */
> +};
> +\end{lstlisting}
> +
> +The bytes field supports on Get only:
> +
> +\begin{itemize}
> +\item 1, then the initiator reads from value field of Completion as u8
> +\item 2, then the initiator reads from value field of Completion as le16
> +\item 4, then the initiator reads from value field of Completion as le32
> +\item 8, then the initiator reads from value field of Completion as le64
> +\end{itemize}
> +
> +The bytes field supports on Set only:
> +
> +\begin{itemize}
> +\item 1, then the initiator specifies the value field of Config Command =
as u8
> +\item 2, then the initiator specifies the value field of Config Command =
as le16
> +\item 4, then the initiator specifies the value field of Config Command =
as le32
> +\item 8, then the initiator specifies the value field of Config Command =
as le64
> +\end{itemize}

I have no idea what virtio_of_command_config does because the opcodes
aren't documented.

> +
> +\paragraph{Common Command}\label{sec:Virtio Transport Options / Virtio O=
ver Fabrics / Transmission Protocol / Commands Definition / Common Command}
> +
> +The control queue uses Common Command to get or set common properties on
> +device(i.e. get device ID). The Common Command has following structure:
> +
> +\begin{lstlisting}
> +struct virtio_of_command_common {
> +        le16 opcode;
> +        le16 command_id;
> +        u8 padding4;
> +        u8 padding5;
> +        u8 padding6;
> +        u8 padding7;
> +        struct virtio_of_value value;        /* ignore this field on GET=
 */
> +};
> +\end{lstlisting}
> +
> +
> +\paragraph{Vring Command}\label{sec:Virtio Transport Options / Virtio Ov=
er Fabrics / Transmission Protocol / Commands Definition / Vring Command}
> +
> +Both control queue and virtqueue use Vring Command to transmit buffer.
> +The Vring Command has following structure:
> +
> +\begin{lstlisting}
> +struct virtio_of_command_vring {
> +        le16 opcode;
> +        le16 command_id;
> +        /* Total buffer size this command contains(not include command&d=
escriptors). */
> +        le32 length;
> +        /* How many descriptors this command contains */
> +        le16 ndesc;
> +        u8 padding[6];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Completion}\label{sec:Virtio Transport Options / Virtio Over =
Fabrics / Transmission Protocol / Commands Definition / Completion}
> +
> +The target responses Completion to the initiator to report command statu=
s,
> +device properties, and transmit buffer. The Completion has following str=
ucture:
> +
> +\begin{lstlisting}
> +struct virtio_of_completion {
> +        le16 status;
> +        le16 command_id;
> +        /* How many descriptors this completion contains */
> +        le16 ndesc;
> +        u8 rsvd6;
> +        u8 rsvd7;
> +        struct virtio_of_value value;
> +};
> +\end{lstlisting}
> +
> +Note that Virtio Over Fabrics does not define an interrupt mechanism, ge=
nerally
> +the initiator receives a Completion, it SHOULD generate a host interrupt
> +(if no interrupt suspending on device).

It's not possible to review this patch because these structs aren't used
yet and the opcodes are undefined.

Defining structs that are shared by multiple opcodes might make
implementations cleaner, but I think it makes the spec less clear. I
would rather have a list of all opcodes and each one shows the full
command layout (even if it is duplicated). That way it's very easy to
look up an opcode you are implementing or debugging and check what's
needed. If the command layout is not documented in a single place, then
it takes more effort to figure out how an opcode works.

Stefan

--w3IiR37jd1Cuy+Yw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR3f4wACgkQnKSrs4Gr
c8ga8gf7B3TdlokR/0PKwWiQH4fVRU/tF8SZCnyOAJKCQJ2z++17VmDJ3HuZveu5
j81bg0n/iJQ8sp0NPLjGsIwpgzihGksPjNP2OHH84N3Vy9FIXsumdwY1gG75pEhY
q7OMNLnzEDBsKAwZq/1Su6sOe4vCE8hZulP4npv8PNtToqRGbkliweL1doTVqrZO
SkR+Nt4ia/YKhWD4rAmTkdgaukuY1lr1WkNgREqLSQkaicRV+W2EVLfjxEEFXnnX
0X2sA0bwFVbxAeJLRkjNIi1TP20U9Byy32JpMn6Wap7EnvphDbwAdzsOv4BofSPj
f3SKfiIQhyQWIGSanu9nb/r6l2oOBQ==
=y2/C
-----END PGP SIGNATURE-----

--w3IiR37jd1Cuy+Yw--

