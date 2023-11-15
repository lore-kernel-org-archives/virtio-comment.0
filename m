Return-Path: <virtio-comment-return-8374-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803E6C2BB3F
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 18:20:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C2FE7120D45
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 18:20:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A406B986DC1
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 18:20:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8BAAD986DB7; Wed, 15 Nov 2023 18:20:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7A90B986DB8
	for <virtio-comment@lists.oasis-open.org>; Wed, 15 Nov 2023 18:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: zSL2R96bNK2R0SFGqggONA-1
Date: Wed, 15 Nov 2023 09:20:58 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, houp@yusur.tech,
	helei.sig11@bytedance.com, zhouhuaping.san@bytedance.com,
	xinhao.kong@duke.edu
Message-ID: <20231115142058.GA307546@fedora>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
 <20230626072551.1709389-2-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5g0MNzzAWSTA22r7"
Content-Disposition: inline
In-Reply-To: <20230626072551.1709389-2-pizhenwei@bytedance.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Subject: [virtio-comment] Re: [PATCH v4 1/7] transport-fabrics: introduce Virtio Over Fabrics
 overview

--5g0MNzzAWSTA22r7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 03:25:45PM +0800, zhenwei pi wrote:
> In the past years, virtio supports lots of device specifications by
> PCI/MMIO/CCW. These devices work fine in the virtualization environment.
>=20
> Introduce Virtio Over Fabrics transport to support "network attached
> peripheral devices". With this transport, Many Virtio based devices
> work over fabrics. Note that the balloon device may not make sense,
> shared memory regions won't work.
>=20
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  content.tex           |  1 +
>  transport-fabrics.tex | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 transport-fabrics.tex
>=20
> diff --git a/content.tex b/content.tex
> index d2ab9eb..bbbd79e 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -637,6 +637,7 @@ \chapter{Virtio Transport Options}\label{sec:Virtio T=
ransport Options}
>  \input{transport-pci.tex}
>  \input{transport-mmio.tex}
>  \input{transport-ccw.tex}
> +\input{transport-fabrics.tex}
> =20
>  \chapter{Device Types}\label{sec:Device Types}
> =20
> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
> new file mode 100644
> index 0000000..d10be2a
> --- /dev/null
> +++ b/transport-fabrics.tex
> @@ -0,0 +1,32 @@
> +\section{Virtio Over Fabrics}\label{sec:Virtio Transport Options / Virti=
o Over Fabrics}
> +
> +Virtio Over Fabrics (Virtio-oF) enables operations over fabrics that rely
> +primarily on message passing.
> +
> +Virtio-oF uses a reliable connection to transmit data. The reliable
> +connection facilitates communication between entities playing the follow=
ing roles:
> +
> +\begin{itemize}
> +\item A Virtio-oF initiator functions as a Virtio-oF client.
> +The Virtio-oF initiator sends commands and associated data from the driv=
er
> +to the Virtio-oF target.
> +\item A Virtio-oF target functions as a Virtio-oF server.
> +The Virtio-oF target forwards commands to the device and sends completio=
ns
> +and associated data back to the Virtio-oF initiator.
> +\end{itemize}
> +
> +Virtio-oF has the following features:
> +
> +\begin{itemize}
> +\item A Virtio-oF target is allowed to be connected by 0 or more Virtio-=
oF initiators.
> +\item A Virtio-oF initiator is allowed to connect to a single Virtio-oF =
target only.
> +A Virtio-oF device instance is a virtio device that the Virtio-oF initia=
tor is
> +accessing through the Virtio-oF target.

Let's make sure the protocol is extensible so that multi-path or
persistent sessions (support for reconnect) are possible in the future.
They don't need to be there from the beginning.

Stefan

--5g0MNzzAWSTA22r7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVU08oACgkQnKSrs4Gr
c8i0QAf5AbR/3D7INSa7bcmwIhTydoAAaVKXwpqXBG55yKxMMY7LJCCLFhAbp9Sb
DscxrBqwTZWX+aXFD0vfLpmdhw96GLaafq1w4uYd5jAcDxfguz7svLdtGmRilsP1
irJ6GElnAjLJrit/XJzbVz3Kbcp3N8YpYNJ9E+FAVk9yOOXO1G+45YpMmHqxF624
Afvfg83Vg1ynjbasFEZKSY73acUeN6bSVlm6+JuMPy/iwdNx0g0eOnvQ6EA9++8Z
1idQvMaI3RU9WqhnhWQ4DEkSi/bePnUbKJxjLPLxRHDa7uICNmL1RWCgUXaioE3a
DfnXlXMYU+uNVdYjhW2K5/5lhRNkNg==
=2Kgf
-----END PGP SIGNATURE-----

--5g0MNzzAWSTA22r7--

