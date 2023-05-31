Return-Path: <virtio-comment-return-6052-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2016AC7EE23
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 16:20:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 22E413308B
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 16:20:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 08FD69865F8
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 16:20:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E892698643E; Wed, 31 May 2023 16:20:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D61929864B3
	for <virtio-comment@lists.oasis-open.org>; Wed, 31 May 2023 16:20:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: HFJUD-YlMLOW_hWljyUlNA-1
Date: Wed, 31 May 2023 12:20:48 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, houp@yusur.tech,
	helei.sig11@bytedance.com, xinhao.kong@duke.edu
Message-ID: <20230531162048.GG1248296@fedora>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-6-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KmqHt1HjFTqcNOy9"
Content-Disposition: inline
In-Reply-To: <20230504081910.238585-6-pizhenwei@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [virtio-comment] Re: [PATCH v2 05/11] transport-fabrics: introduce Keyed Transmission

--KmqHt1HjFTqcNOy9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 04:19:04PM +0800, zhenwei pi wrote:
> Keyed transmission is used for message oriented communication(Ex RDMA),
> also add virtio-blk read/write 8K example.
>=20
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  transport-fabrics.tex | 178 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 178 insertions(+)
>=20
> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
> index c02cf26..7711321 100644
> --- a/transport-fabrics.tex
> +++ b/transport-fabrics.tex
> @@ -317,3 +317,181 @@ \subsubsection{Buffer Mapping Definition}\label{sec=
:Virtio Transport Options / V
>                      |......|
>                      +------+  -> 8193
>  \end{lstlisting}
> +
> +\paragraph{Keyed Transmission}\label{sec:Virtio Transport Options / Virt=
io Over Fabrics / Transmission Protocol / Commands Definition / Keyed Trans=
mission}
> +Command and Segment Descriptors are transmitted in a message within a
> +connection, and buffer is transmitted by remote memory access.  The layo=
ut in message:

With RDMA it is theoretically possible to implement virtqueues without
messages in the data path (i.e. by using something similar to vring with
RDMA). Why did you decide to use a mixed messages + RDMA approach
instead of a 100% RDMA approach?

> +
> +\begin{lstlisting}
> +CMDx contains 0 descriptor, CMDy contains (n - m + 1) descriptors:

"0 descriptors"

> +
> +     +-----+     +-----++-----+     +-----+
> + ... | CMDx| ... | CMDy||DESCm| ... |DESCn| ...
> +     +-----+     +-----++-----+     +-----+
> +
> +COMPx contains 0 descriptor, COMPy contains 0 descriptor:

"0 descriptors"

--KmqHt1HjFTqcNOy9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR3c98ACgkQnKSrs4Gr
c8gRGggAmKwxV8H6GyDehWHRxIQWLuwhik047kzuqvbqhaeuSxHVgcErBs6cgvWE
vq5+mK+T4jLzGd73xVZbqN66XSmGn7Ds7e9koRgODstp/mYNYd534JY2VCGF0fVS
o+tS6+B3TPoHYGqa5QNHgFF7o52j7AVOXE76QleO0L6vADNJD+ZDU0g6zlJTVuy1
BZbiXuQSmSw7Vb4C/1ohakGvvU2xYRjJrrq1Pzvkx40qV4RiD+SW+zR9/Ic5RNpI
x7ib491ntVbLN2fHfz/q35+nTLGkftAejuOxcSl3JtDeA14UextZGhTDl2EvZGSp
2vTKPZCDtnuTpoPmV5bl5ZTphk1BkA==
=L4U7
-----END PGP SIGNATURE-----

--KmqHt1HjFTqcNOy9--

