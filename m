Return-Path: <virtio-comment-return-6047-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D398C7EE23
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 14:00:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C56822B03A
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 14:00:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AB43298640F
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 14:00:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9390C98634C; Wed, 31 May 2023 14:00:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7F84498634E
	for <virtio-comment@lists.oasis-open.org>; Wed, 31 May 2023 14:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: gQ3RbzE6MJeTTAuegkUiXg-1
Date: Wed, 31 May 2023 10:00:02 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, houp@yusur.tech,
	helei.sig11@bytedance.com, xinhao.kong@duke.edu
Message-ID: <20230531140002.GC1248296@fedora>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-2-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IrJp/lultb4wDk1N"
Content-Disposition: inline
In-Reply-To: <20230504081910.238585-2-pizhenwei@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [virtio-comment] Re: [PATCH v2 01/11] transport-fabrics: introduce Virtio Over
 Fabrics overview

--IrJp/lultb4wDk1N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 04:19:00PM +0800, zhenwei pi wrote:
> In the past years, virtio supports lots of device specifications by
> PCI/MMIO/CCW. These devices work fine in the virtualization environment.
>=20
> Introduce Virtio Over Fabrics transport to support "network defined
> peripheral devices". With this transport, Many Virtio based devices
> transparently work over fabrics. Note that the balloon device may not
> make sense. Shared memory regions won't work.
>=20
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  content.tex           |  1 +
>  transport-fabrics.tex | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 transport-fabrics.tex
>=20
> diff --git a/content.tex b/content.tex
> index cff548a..f899c3a 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -582,6 +582,7 @@ \chapter{Virtio Transport Options}\label{sec:Virtio T=
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
> index 0000000..0dc031b
> --- /dev/null
> +++ b/transport-fabrics.tex
> @@ -0,0 +1,31 @@
> +\section{Virtio Over Fabrics}\label{sec:Virtio Transport Options / Virti=
o Over Fabrics}
> +
> +This section defines specification to Virtio that enables operation over=
 other
> +interconnects. A central goal of Virtio Over Fabrics is to maintain cons=
istency
> +with the PCI device, so Virtio based devices transparently work over PCI=
 or
> +fabrics.

The reader wants to know what VIRTIO Over Fabrics is, not how it relates
to other Transports that they may not be very familiar with.

Fabrics is a Transport and any Transport is capable of supporting the
VIRTIO device model. Therefore I don't think the stated aim should be to
match PCI specifically. Just being a Transport is already enough. PCI is
not special.

I suggest something like:

  Virtio Over Fabrics enables operation over interconnects that rely
  primarily on message passing. Supported interconnects include TODO.

> +
> +Virtio Over Fabrics uses reliable connection to transmit data, the relia=
ble

"uses a reliable connection"

> +connection betweens two rules:

"connection facilitates communication between entities playing the followin=
g roles:"

> +
> +\begin{itemize}
> +\item An initiator functions as an Virtio Over Fabrics client. An initia=
tor

"as a Virtio ..."

> +typically serves the same purpose to a machine as a Virtio device, issues
> +commands to remote side.

This says that the driver talks to the initiator instead of a local
device and the initiator forwards commands to the actual device on the
remote side?

I find this sentence confusing because I associate the initiator with
the driver, not the device.

Maybe:

  The initiator sends commands from the driver to the target.

> +\item A target functions as an Virtio Over Fabrics server. An target typ=
ically

"A target"

> +handles commands from the initiator side and responses completions.

The concept of the device is missing here. For symmetry it may be good
to say something like:

  The target forwards commands to the device and sends responses back to
  the initiator.

> +\end{itemize}
> +
> +Virtio Over Fabrics has the following differences from the PCI based
> +specification:
> +
> +\begin{itemize}
> +\item Instead of memory sharing mechanism of virtqueue, there is a one-t=
o-one
> +mapping between virtqueue and the reliable connection which executes the=
 vring
> +data transmission.
> +\item An additional control connection is required to execute control co=
mmands
> +which is similar to read/write register on a PCI device.
> +\item Virtio Over Fabrics does not define an interrupt mechanism that al=
lows an
> +initiator to generate a host interrupt. It is the responsibility of the =
host
> +fabric interface to generate host interrupts.
> +\end{itemize}

As mentioned above, comparing against PCI requires that the reader is
familiar with PCI. I think it would be preferrable to explain the unique
characteristics of Virtio Over Fabrics in a self-contained way:

  The basic organization of Virtio Over Fabrics is as follows:

  \begin{itemize}
  \item A reliable connection carries control commands that are not specifi=
c to a virtqueue.
  \item Each virtqueue has its own reliable connection.
  \item There is no interrupt mechanism since the arrival of data on the fa=
bric already indicates when there is activity.
  \end{itemize}

Stefan

--IrJp/lultb4wDk1N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR3UuIACgkQnKSrs4Gr
c8hFtggAq4NTj4dPfzWWjZAGrXmbsIg81QVLa6XkGnRU25RuF/m1elTMsAsHmbyU
zLq0a1G06ZJdV6LsldKVNiRz9jWjA/ITVIU97hjZ5sPO4GnL7boq3wuUrSmIo4sO
o9CQIpsc2PDBX2+qt01moUHyxcOpmfE58Dbl9QdoZ9W58AP+QO/wS2zit6r9cACC
NVsknecO8COBe5EZIFFJFL9WBa4IRjheIMXzYerf2z5PZ2SCW7g3Ld9IxP/8KwxO
5cx/Gg8YA+AKMpG51a2/KE+8gowxHH/lfEVfE6zOqMctMxj1a8utoU1zko4C7Vaf
deRhr8S+Wfq/ua71W9hPwpgNUzHy0A==
=aaHJ
-----END PGP SIGNATURE-----

--IrJp/lultb4wDk1N--

