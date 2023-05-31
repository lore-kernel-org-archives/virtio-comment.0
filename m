Return-Path: <virtio-comment-return-6049-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D512C7EE23
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 14:23:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8410729FCC
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 14:23:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 751C19863D7
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 14:23:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 657AD98634C; Wed, 31 May 2023 14:23:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 532A998634E
	for <virtio-comment@lists.oasis-open.org>; Wed, 31 May 2023 14:23:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: aVQHNOpzMo-4Cg7kuh13bw-1
Date: Wed, 31 May 2023 10:23:29 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, houp@yusur.tech,
	helei.sig11@bytedance.com, xinhao.kong@duke.edu
Message-ID: <20230531142329.GE1248296@fedora>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-4-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y0Eiu0duRpP2ZZPY"
Content-Disposition: inline
In-Reply-To: <20230504081910.238585-4-pizhenwei@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [virtio-comment] [PATCH v2 03/11] transport-fabircs: introduce
 Segment Descriptor Definition

--y0Eiu0duRpP2ZZPY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 04:19:02PM +0800, zhenwei pi wrote:
> Introduce segment descriptor to describe the Virtio device buffer
> segments.
>=20
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  transport-fabrics.tex | 43 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>=20
> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
> index 26b0192..b88acfd 100644
> --- a/transport-fabrics.tex
> +++ b/transport-fabrics.tex
> @@ -45,3 +45,46 @@ \subsection{Virtio Qualified Name}\label{sec:Virtio Tr=
ansport Options / Virtio O
>  \item The string is null terminated.
>  \item There is no strict style limitation.
>  \end{itemize}
> +
> +\subsection{Transmission Protocol}\label{sec:Virtio Transport Options / =
Virtio Over Fabrics / Transmission Protocol}
> +This section defines transmission protocol for Virtio Over Fabrics. All =
the

What does "transmission protocol" mean? I guess this is what is often
called a network protocol or a wire protocol or just a protocol, but it
wasn't clear to me maybe whether the "transmission protocol" is one
protocol out of a set of protocols that make up Virtio Over Fabrics.

This paragraph should describe which connections use this protocol. For
example:

  This protocol is used for both control and virtqueue connections.

> +fields use little endian format.
> +
> +\subsubsection{Segment Descriptor Definition}\label{sec:Virtio Transport=
 Options / Virtio Over Fabrics / Transmission Protocol / Segment Descriptor=
 Definition}
> +Virtio Over Fabrics uses the following structure to describe data segmen=
t:

What is a data segment? I guess it's a message/command/request?

There should be an explanation of how data segments are used. For
example:

  The initiator sends a data segment containing the command to the
  target. The target sends a data segment containing the response to the
  command back to the initiator.

> +
> +\begin{lstlisting}
> +struct virtio_of_vring_desc {

I think the name "vring" should be avoided. The vring is an in-memory
layout for implementing virtqueues where shared memory is available.
Calling it virtio_of_vq_desc makes it clear that Virtio Over Fabrics
does not use vrings to implement virtqueues.

> +        le64 addr;
> +        le32 length;
> +        /* This marks the unique ID within a command, no limitation amon=
g inflight commands */

What is a command?

> +        le16 id;
> +        /* This marks a buffer as keyed transmission (otherwise stream t=
ransmission) */
> +#define VIRTIO_OF_DESC_F_KEYED     1
> +        /* This marks a buffer as device write-only (otherwise device re=
ad-only). */
> +#define VIRTIO_OF_DESC_F_WRITE     2
> +        le16 flags;
> +        le32 key;
> +};
> +\end{lstlisting}
> +
> +The structure virtio_of_vring_desc is used for both keyed transmission
> +(i.e. RDMA) and stream transmission(i.e. TCP). The fields is described a=
s follows:
> +
> +\begin{tabular}{ |l|l|l| }
> +\hline
> +Field & keyed transmission & stream transmission \\
> +\hline \hline
> +addr & Start address of remote memory buffer & Start address within the =
stream buffer \\

What is a stream buffer?

> +\hline
> +length & The length of remote memory buffer & The length of buffer withi=
n the stream \\

I'm not sure what buffer means here. I guess it's not the same as a
virtqueue buffer, it's probably a virtqueue descriptor (element)?

Can you avoid using buffer here since it usually means something else in
Virtio?

> +\hline
> +id & The ID of this descriptor & The ID of this descriptor \\
> +\hline
> +flags & both keyed transmission and stream transmission supported & stre=
am transmission only \\

I'm not sure what this means.

> +\hline
> +key & Key of the remote Memory Region & Ignore \\

Should "Ignore" be "Reserved" so that stream transmission can use this
field for something else in the future?

> +\hline
> +\end{tabular}
> +
> +Depending on the opcode, a Command contains zero or more structure virti=
o_of_vring_desc.

opcode hasn't been defined yet. I guess that's because the first
virtio_of_vring_desc contains a Command and that has an opcode field?
Please make sure the text is ordered so that terms are defined before
they are used.

Stefan

--y0Eiu0duRpP2ZZPY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR3WGEACgkQnKSrs4Gr
c8jX1AgAua/pyzGdYp3Aqd5PnW43oVHXuVNy4I7J0ogIp4NVXAM0PvPdDTmW0l8G
a3G8LGFdYYzYhohvi6VkWy3KdkK6PhWpzdnBNM9vvpqLy6j1M5/+B0WbiZL7mTws
g1D3BV8NuvFSaVYiBUWzqgCOpwK+Hth5q9lDkSJqwt96sdtt3Ua5jNG07Or19PE9
oi1D4U1Kd3fWzubA6WshyUS2ZhYIVeKvi0ZeavJNkW1ydWNwXtJ3SLhN/gYoWZbA
hbmqfdKqYN265MxP3HGB4K8Q09fh5mR6NML+2xNpLr60Q10Pplk/EjL3rgwV1G8C
HbzSIRrRv2Zm4MqpZZ6fx/W6PbbKSw==
=iPY3
-----END PGP SIGNATURE-----

--y0Eiu0duRpP2ZZPY--

