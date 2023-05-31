Return-Path: <virtio-comment-return-6048-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C739C77B7A
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 14:07:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 91A3329FD2
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 14:06:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6A32698642D
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 14:06:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4E7C598634C; Wed, 31 May 2023 14:06:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3A93A98634E
	for <virtio-comment@lists.oasis-open.org>; Wed, 31 May 2023 14:06:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: cmjXdaC-PzC8UER4Sin9bw-1
Date: Wed, 31 May 2023 10:06:40 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, houp@yusur.tech,
	helei.sig11@bytedance.com, xinhao.kong@duke.edu
Message-ID: <20230531140640.GD1248296@fedora>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-3-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NukhsXFkpsfpt01B"
Content-Disposition: inline
In-Reply-To: <20230504081910.238585-3-pizhenwei@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [virtio-comment] [PATCH v2 02/11] transport-fabrics: introduce
 Virtio Qualified Name

--NukhsXFkpsfpt01B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 04:19:01PM +0800, zhenwei pi wrote:
> Add VQN section. The VQN is a little different from iSCSI/NVMe-oF on
> style limitation. Because iSCSI/NVMe-of is storage specific protocol,
> the full string IQN(for iSCSI/iSER) and NQN(for NVMe-oF) represents
> a "storage access address". However, Virtio Over Fabrics works as
> transport layer rather than device layer, a URL style string is better
> to Virtio Over Fabrics. For example:
> virtio-of://blk-resource/nvme-pool/849a39ad-8d7b-4a7a-adb6-e7407ace532c
> virtio-of://blk-resource/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1
> ...
> virtio-of://crypto-resource/25307f22-e5a8-4ea2-b7ca-79f5c3bebc3c

I'm not sure what blk-resource and nvme-pool are in these URLs?

Should the patch mention the virtio-of:// URI scheme?

>=20
> A hunam readable VQN is helpful to maintain/debug/distinguish.
>=20
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  transport-fabrics.tex | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
> index 0dc031b..26b0192 100644
> --- a/transport-fabrics.tex
> +++ b/transport-fabrics.tex
> @@ -29,3 +29,19 @@ \section{Virtio Over Fabrics}\label{sec:Virtio Transpo=
rt Options / Virtio Over F
>  initiator to generate a host interrupt. It is the responsibility of the =
host
>  fabric interface to generate host interrupts.
>  \end{itemize}
> +
> +\subsection{Virtio Qualified Name}\label{sec:Virtio Transport Options / =
Virtio Over Fabrics / Virtio Qualified Name}
> +Virtio Qualified Names (VQNs) are used to uniquely describe an initiator=
 or a
> +target for the purposes of identification.
> +
> +A VQN is encoded as a string of Unicode characters with the following
> +properties:
> +
> +\begin{itemize}
> +\item The encoding is UTF-8 (refer to RFC 3629).
> +\item The characters dash('-'), dot ('.'), slash('/') and colon(':') are=
 used
> +in formatting.
> +\item The maximum name is 256 bytes in length.
> +\item The string is null terminated.

Is the maximum name 255 UTF-8 bytes plus a NUL character? Please state
this in the spec. For example:

  \item The string is NUL terminated.
  \item The maximum name is 256 bytes in length, including the NUL characte=
r.

> +\item There is no strict style limitation.

I think it's necessary to define representations for specific fabrics
(e.g. TCP/IP) so that VQNs can be exchanged between different VIRTIO
implementations (VMMs, DPUs, command-line utilities, etc). Otherwise two
different implementations may represent the same address differently.

Stefan

--NukhsXFkpsfpt01B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR3VHAACgkQnKSrs4Gr
c8gZVAf+J5RUgA26hKrksIUyOtH8I5Xp6bONuRmXv8Lhdg25mIVoKQ+58qGWxlRk
GrYuwvr4jmEZQVbFHM0ch0e7zQQ5hh+GPuzOKq270CK5X6z4dazAs2imWfHKIedP
9PTdp7rGFNkOwGqBk8mcwEBbJ4XV/zmDnRMQFSWqta56lerB530hdd4GYWhA19/7
Wk9ZTTlzhxQ76MuslJyCzuTJGbTcx3dzn7h5SVodp++bFHwpiZuNdce1FUCIIz6T
WzS4GKCVtrG0hghl4gK41l6CuIi7yv5RUkMIHlPZvbAfRxTiacktrkGFuA397QN+
5U3I/3dVexJk1z/f/g+sLIaYuGGSbQ==
=vFUd
-----END PGP SIGNATURE-----

--NukhsXFkpsfpt01B--

