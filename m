Return-Path: <virtio-comment-return-6154-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D50C77B7A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 13:35:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 28AD144549
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 13:35:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0BBF5986494
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 13:35:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E58F2986491; Tue,  6 Jun 2023 13:35:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2BC20986492
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 13:34:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: g9aPPaOXOyi7MwvB2Lp0Uw-1
Date: Tue, 6 Jun 2023 09:34:44 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, houp@yusur.tech,
	helei.sig11@bytedance.com, xinhao.kong@duke.edu
Message-ID: <20230606133444.GC1958291@fedora>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-7-pizhenwei@bytedance.com>
 <20230531171036.GH1248296@fedora>
 <8cfdc9bf-03c9-92fc-f2e0-d59b180b0d82@bytedance.com>
 <20230605163046.GB1624556@fedora>
 <54bb85af-7979-8226-cfef-d72c1cf2332f@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3qR77a29ZL7r2Mcb"
Content-Disposition: inline
In-Reply-To: <54bb85af-7979-8226-cfef-d72c1cf2332f@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [virtio-comment] Re: Re: Re: [PATCH v2 06/11] transport-fabrics: introduce command set

--3qR77a29ZL7r2Mcb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 06, 2023 at 09:31:27AM +0800, zhenwei pi wrote:
> On 6/6/23 00:30, Stefan Hajnoczi wrote:
> > On Fri, Jun 02, 2023 at 01:15:00PM +0800, zhenwei pi wrote:
> > >=20
> > >=20
> > > On 6/1/23 01:10, Stefan Hajnoczi wrote:
> > > > On Thu, May 04, 2023 at 04:19:05PM +0800, zhenwei pi wrote:
> > > > > Introduce command structures for Virtio-oF.
> > > > >=20
> > > > > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> > > > > ---
> > > > >    transport-fabrics.tex | 209 ++++++++++++++++++++++++++++++++++=
++++++++
> > > > >    1 file changed, 209 insertions(+)
> > > > >=20
> > > > > diff --git a/transport-fabrics.tex b/transport-fabrics.tex
> > > > > index 7711321..37f57c6 100644
> > > > > --- a/transport-fabrics.tex
> > > > > +++ b/transport-fabrics.tex
> > > > > @@ -495,3 +495,212 @@ \subsubsection{Buffer Mapping Definition}\l=
abel{sec:Virtio Transport Options / V
> > > > >                        |value |  -> 8193 (value.u32)
> > > > >                        +------+
> > > > >    \end{lstlisting}
> > > > > +
> > > > > +\subsubsection{Commands Definition}\label{sec:Virtio Transport O=
ptions / Virtio Over Fabrics / Transmission Protocol / Commands Definition}
> > > > > +This section defines command structures for Virtio Over Fabrics.
> > > > > +
> > > > > +A common structure virtio_of_value is fixed to 8 bytes and MUST =
be used as one
> > > > > +of the following format:
> > > > > +
> > > > > +\begin{itemize}
> > > > > +\item u8
> > > > > +\item le16
> > > > > +\item le32
> > > > > +\item le64
> > > > > +\end{itemize}
> > > >=20
> > > > The way it's written does not document where the u8, u16, u32 bytes=
 are
> > > > located and that the unused bytes are 0. I think I understand what =
you
> > > > mean though:
> > > >=20
> > > >     le64 value =3D cpu_to_le64((u64)v); /* v is u8, u16, u32, or u6=
4 */
> > > >=20
> > > > Please clarify.
> > > >=20
> > >=20
> > > I want to describe an union structure of 8 bytes:
> > > union virtio_of_value {
> > >      u8;
> > >      u16;
> > >      u32;
> > >      u64;
> > > };
> > >=20
> > > Depending on the opcode, use the right one.
> >=20
> > I was trying to point out that the memory layout of C unions is not
> > portable. Your example does not define the exact in-memory layout of
> > union virtio_of_value. Here is the first web search result I found about
> > this topic:
> >=20
> >    "Q: And a related question: if you dump unions in binary form to a f=
ile,
> >    and then reload them from the file on a different platform, or with a
> >    program compiled by a different compiler, are you guaranteed to get
> >    back what you stored? (I think not, but I'm not sure)
> >=20
> >    A: You're right; you're not."
> >=20
> >    https://bytes.com/topic/c/answers/220372-unions-storage-abis
> >=20
> > In the cpu_to_le64() code example that I gave, the exact in-memory
> > layout is well-defined. There is no ambiguity.
> >=20
>=20
> OK, thanks.
>=20
> > > > > +\hline
> > > > > +0xff00 - 0xfffd & Reserved \\
> > > > > +\hline
> > > > > +\end{tabular}
> > > > > +
> > > > > +\paragraph{Connect Command}\label{sec:Virtio Transport Options /=
 Virtio Over Fabrics / Transmission Protocol / Commands Definition / Connec=
t Command}
> > > > > +The Connect Command is used to establish Virtio Over Fabrics que=
ue. The control
> > > > > +queue MUST be established firstly, then the Connect command esta=
blishes an
> > > > > +association between the initiator and the target.
> > > >=20
> > > > Is a "Virtio Over Fabrics queue" different from a virtqueue?
> > > >=20
> > > > If I understand correctly, the control queue must be established by=
 the
> > > > initiator first and then the Connect command is sent to begin
> > > > communication between the initiator and the target?
> > > >=20
> > >=20
> > > The queue mapping is missing in the '[PATCH v2 01/11] transport-fabri=
cs:
> > > introduce Virtio Over Fabrics overview', like:
> > > A "Virtio Over Fabrics queue" is a reliable connection between initia=
tor and
> > > target. There are 2 types of Virtio Over Fabrics queue:
> > > +\begin{itemize}
> > > +\item A single Control queue is required to execute control operatio=
ns.
> > > +\item 0 or more Virtio Over Fabrics queues map the virtqueues.
> > > +\end{itemize}
> >=20
> > That helps, thanks!
> >=20
> > >=20
> > > > > +
> > > > > +The Target ID of 0xffff is reserved, then:
> > > >=20
> > > > Please move this after the fields have been shown and the purpose o=
f the
> > > > Target ID field has been explained.
> > > >=20
> > > > > +\begin{itemize}
> > > > > +\item The Target ID of 0xffff MUST be specified as the Target ID=
 in a Connect
> > > > > +Command for the control queue.
> > > > > +\item The target SHOULD allocate any available Target ID to the =
initiator,
> > > > > +and return the allocated Target ID in the Completion.
> > > > > +\item The returned Target ID MUST be specified as the Target ID,=
 and the Queue ID
> > > > > +MUST be specified in a Connect Command for the virtqueue.
> > > > > +\end{itemize}
> > > >=20
> > > > What is the purpose of the Target ID? Is it to allow a server to pr=
ovide
> > > > access to multiple targets over the same connection?
> > > >=20
> > >=20
> > > A target listens on a port, and provides access to 0 or more targets.=
 An
> > > initiator connect the specific target by TVQN of connect command.
> > > An initiator could connect a single target, multiple initiators could
> > > connect the same target(typically, shared disk/fs).
> >=20
> > Why is the target ID separate from the TVQN? If the Target ID is a
> > separate parameter then users will have to learn additional
> > syntax/command-line options to specify the TVQN + Target ID and that
> > syntax may vary between software.
> >=20
> > >=20
> > > > > +
> > > > > +The Connect Command has following structure:
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_of_command_connect {
> > > > > +        le16 opcode;
> > > > > +        le16 command_id;
> > > > > +        le16 target_id;
> > > > > +        le16 queue_id;
> > > > > +        le16 ndesc;
> > > >=20
> > > > Where is this field documented?
> > > >=20
> > >=20
> > > OK. Will add.
> > >=20
> > > > Why does the initiator send ndesc to the target? Normally a VIRTIO =
Transport reports the device's max descriptors and then the driver can tell=
 the device to reduce the number of descriptors, if desired.
> > > >=20
> > >=20
> > > A target supports at lease 1 descriptor. The 'ndesc' of struct
> > > virtio_of_command_connect indicates the full PDU contains: struct
> > > virtio_of_command_connect + 1 * virtio_of_vq_desc + data.
> > >=20
> > > > > +#define VIRTIO_OF_CONNECTION_TCP     1
> > > > > +#define VIRTIO_OF_CONNECTION_RDMA    2
> > > >=20
> > > > What does RDMA mean? I thought RDMA is a general concept that sever=
al
> > > > fabrics implement (with different details like how addressing works=
).
> > > >=20
> > >=20
> > > I guest your concern is the difference of IB/RoCE/iWarp ...
> > > We are trying to define the payload protocol here, so I think we can =
ignore
> > > the difference of the HCA.
> >=20
> > I see, maybe this could be called STREAM vs KEYED instead of TCP vs RDM=
A?
> >=20
>=20
> I'd like to define two PDU mapping rules(in '[PATCH v2 04/11]
> transport-fabrics: introduce Stream Transmission' and '[PATCH v2 05/11]
> transport-fabrics: introduce Keyed Transmission'): STREAM and KEYED. A
> transport protocols need to use one.
>=20
> Then we can define protocols:
> #define VIRTIO_OF_CONNECTION_TCP     1		-> use STREAM
> #define VIRTIO_OF_CONNECTION_RDMA    2		-> use KEYED
> #define VIRTIO_OF_CONNECTION_TLS     3(in the future)	-> use STREAM
> #define VIRTIO_OF_CONNECTION_XXX

It's not clear to me whether TCP actually means TCP/IP or if it actually
means STREAM. For example, if I run Virtio Over Fabrics over AF_VSOCK,
would it use VIRTIO_OF_CONNECTION_TCP although there is no TCP/IP? If
so, then I think the name TCP is misleading and STREAM would be clearer.

>=20
> > >=20
> > > > > +        u8 oftype;
> > > > > +        u8 padding[5];
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +The Connect commands MUST contains one Segment Descriptor and on=
e structure
> > > > > +virtio_of_command_connect to specify Initiator VQN and Target VN=
Q,
> > > > > +virtio_of_command_connect has following structure:
> > > >=20
> > > > I'm confsued. virtio_of_command_connect was defined above. The stru=
ct
> > > > defined below is virtio_of_connect. Does this paragraph need to be
> > > > updated (virtio_of_command_connect -> virtio_of_connect)?
> > > >=20
> > > > Why is virtio_of_connect a separate struct and not part of
> > > > virtio_of_command_connect?
> > > >=20
> > >=20
> > > Because I'd like to define all the commands with a fixed length.
> >=20
> > I don't understand. virtio_of_connect and virtio_of_command_connect are
> > both fixed-length. Why can't they be unified into 1 fixed-length struct?
> >=20
>=20
> For stream protocol, it always work fine.
> For keyed protocol, for example RDMA, the target side needs to use
> ibv_post_recv to receive a large size(sizeof virtio_of_command_connect +
> sizeof virtio_of_connect). If the target uses ibv_post_recv to receive
> sizeof(CMD) + sizeof(DESC) * 1, the initiator fails in RDMA SEND.

I read that "A RC connection is very similar to a TCP connection" in the
NVIDIA documentation
(https://docs.nvidia.com/networking/display/RDMAAwareProgrammingv17/Transpo=
rt+Modes)
and expected SOCK_STREAM semantics for RDMA SEND.

Are you saying ibv_post_send() fails when the receiver's work request
sg_list size is smaller (fewer bytes) than the sender's?

Does the receiver have just 1 WR queued in your example? What happens if
the receiver queues multiple small WRs?

Stefan

--3qR77a29ZL7r2Mcb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR/NfQACgkQnKSrs4Gr
c8gs3gf+LgLHnoGHR1FNpwsg8P1rsGgICOtEiZELcwONpCAnl/ftLuKMULx5Oo0A
oFz5d2YWdz8zBFyEvxcF4Ryol/yLf8YjVngWjPgso1ZMJLMNV+/XM39aNn+Pbuwd
Q7Z1FpIGspvSFP9rjZmV3NU8InyG0PTRha4ajJVCkWN5Fi/D50Y/QifKELMakeVI
/Rjso+HWxzA2wn19v1eXwciNErt0GHNkTOoBd/fAM1eNW+7olKugzIN7OmQSOkib
47/KaVY1A0wRWbZPX7w0WiSd/rz0LSa48ooWKQRtx2nXY+0UdwNx5YgRrJARysjw
nTqM9AQDOmefBeXl7Up0yTT38L9A0g==
=ASts
-----END PGP SIGNATURE-----

--3qR77a29ZL7r2Mcb--

