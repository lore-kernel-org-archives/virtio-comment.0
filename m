Return-Path: <virtio-comment-return-2381-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C92A0986485
	for <virtio-comment@lists.oasis-open.org>; Wed, 24 Nov 2021 10:30:00 +0000 (UTC)
Date: Wed, 24 Nov 2021 10:29:54 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YZ4UIhAXoJOqd6Ba@stefanha-x1.localdomain>
References: <20211124024757.742884-1-yadong.qi@intel.com>
MIME-Version: 1.0
In-Reply-To: <20211124024757.742884-1-yadong.qi@intel.com>
Subject: [virtio-comment] Re: [PATCH v2] virtio-blk: add secure discard feature to
 specification
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m7VgwWqpik+vWn8u"
Content-Disposition: inline
To: yadong.qi@intel.com
Cc: virtio-comment@lists.oasis-open.org, hch@lst.de, luhai.chen@intel.com, kai.z.wang@intel.com
List-ID: <virtio-comment.lists.oasis-open.org>

--m7VgwWqpik+vWn8u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 24, 2021 at 10:47:57AM +0800, yadong.qi@intel.com wrote:
> From: Yadong Qi <yadong.qi@intel.com>
>=20
> There are user requests to use BLKSECDISCARD on virtio-blk device.

If you respin, please s/BLKSECDISCARD/the Linux BLKSECDISCARD ioctl/
because the VIRTIO community is broader than Linux. Some people might
not know what BLKSECDISCARD is.

> Hence in this proposal, extend virtio-blk protocol to support secure
> discard command.
>=20
> Introduced new feature flag and command type:
>     VIRTIO_BLK_F_SECDISCARD
>     VIRTIO_BLK_T_SECDISCARD
>=20
> This feature is a passthrough feature on backend because it is hard
> to emulate a secure discard. So virtio-blk will report this feature
> to guest OS if backend device support such kind of feature. And
> when guest OS issues a secure discard command, backend driver will
> passthrough the command to host device blocks.
>=20
> Introduced new fileds in virtio_blk_config for secure discard commands
> to separate with discard commands:
> struct virtio_blk_config {
>     ...
>     max_secdiscard_sectors;
>     max_secdiscard_seg;
>     secdiscard_sector_alignment;
>     ...
> };
>=20
> v1 -> v2:
> - add separated queue limits for secure discard.
>=20
> Signed-off-by: Yadong Qi <yadong.qi@intel.com>
> ---
>  content.tex | 41 +++++++++++++++++++++++++++++++++--------
>  1 file changed, 33 insertions(+), 8 deletions(-)
>=20
> diff --git a/content.tex b/content.tex
> index 5d112af..686389b 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -4435,6 +4435,11 @@ \subsection{Feature bits}\label{sec:Device Types /=
 Block Device / Feature bits}
> =20
>  \item[VIRTIO_BLK_F_LIFETIME (15)] Device supports providing storage life=
time
>       information.
> +
> +\item[VIRTIO_BLK_F_SECDISCARD (16)] Device can support secure discard co=
mmand,

For consistency with VIRTIO_BLK_F_LIFETIME wording above:

  Device supports secure discard command,

> +    maximum discard sectors size in \field{max_secdiscard_sectors} and m=
aximum

s/sectors size/sector count/

> +    discard segment number in \field{max_secdiscard_seg}.
> +
>  \end{description}
> =20
>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / =
Block Device / Feature bits / Legacy Interface: Feature bits}
> @@ -4463,7 +4468,9 @@ \subsection{Device configuration layout}\label{sec:=
Device Types / Block Device /
>  \field{discard_sector_alignment} are expressed in 512-byte units if the
>  VIRTIO_BLK_F_DISCARD feature bit is negotiated. The \field{max_write_zer=
oes_sectors}
>  is expressed in 512-byte units if the VIRTIO_BLK_F_WRITE_ZEROES feature
> -bit is negotiated.
> +bit is negotiated. The parameters in the configuration space of the devi=
ce
> +\field{max_secdiscard_sectors} \field{secdiscard_sector_aligment} are ex=
pressed

s/secdiscard_sector_aligment/secdiscard_sector_alignment/

> +in 512-byte units if the VIRTIO_BLK_F_SECDISCARD feature bit is negotiat=
ed.
> =20
>  \begin{lstlisting}
>  struct virtio_blk_config {
> @@ -4494,6 +4501,9 @@ \subsection{Device configuration layout}\label{sec:=
Device Types / Block Device /
>          le32 discard_sector_alignment;
>          le32 max_write_zeroes_sectors;
>          le32 max_write_zeroes_seg;
> +        le32 max_secdiscard_sectors;
> +        le32 max_secdiscard_seg;
> +        le32 secdiscard_sector_alignment;
>          u8 write_zeroes_may_unmap;
>          u8 unused1[3];
>  };

Please add new fields at the end of struct virtio_blk_config so the
offset of write_zeroes_may_unmap remains unchanged. This is necessary
for compatibility with existing drivers that are not aware of
VIRTIO_BLK_F_SECDISCARD.

> @@ -4552,6 +4562,13 @@ \subsection{Device Initialization}\label{sec:Devic=
e Types / Block Device / Devic
>  \item If the VIRTIO_BLK_F_MQ feature is negotiated, \field{num_queues} f=
ield
>      can be read to determine the number of queues.
> =20
> +\item If the VIRTIO_BLK_F_SECDISCARD feature is negotiated,
> +    \field{max_secdiscard_sectors} and \field{max_secdiscard_seg} can be=
 read
> +    to determine the maximum secure discard sectors and maximum number o=
f
> +    secure discard segments for the block driver to use.
> +    \field{secdiscard_sector_alignment} can be used by OS when splitting=
 a
> +    request based on alignment.
> +
>  \end{enumerate}
> =20
>  \drivernormative{\subsubsection}{Device Initialization}{Device Types / B=
lock Device / Device Initialization}
> @@ -4619,7 +4636,8 @@ \subsection{Device Operation}\label{sec:Device Type=
s / Block Device / Device Ope
>  The type of the request is either a read (VIRTIO_BLK_T_IN), a write
>  (VIRTIO_BLK_T_OUT), a discard (VIRTIO_BLK_T_DISCARD), a write zeroes
>  (VIRTIO_BLK_T_WRITE_ZEROES), a flush (VIRTIO_BLK_T_FLUSH), a get device =
ID
> -string command (VIRTIO_BLK_T_GET_ID), or a get device lifetime command
> +string command (VIRTIO_BLK_T_GET_ID), a secure discard
> +(VIRTIO_BLK_T_SECDISCARD), or a get device lifetime command
>  (VIRTIO_BLK_T_GET_LIFETIME).

Is the meaning of secure discard widely understood or does it make sense
to define it in more detail?

--m7VgwWqpik+vWn8u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGeFCIACgkQnKSrs4Gr
c8i7LggAqBCz1P5as1fhCdg/yYYmVszYxbQO8rCPMSfpORn+ufeXqxa2but8Oblw
hnCG/xjcNJqIuTUm6Jf8LyGJmfMrB9LQBTRV+BcFFcTfNFL1i0AZu9tUXhOapto1
QxdZQ6E0Qw8khfH9w7jg/cY2bGxawrvlCC7BhGh95vHvnWbncPFs7a4OSwUZYxHM
AXWLP/wNCe4NwZK4X02mzvnF+ZYAR9fnbU+ejE2xutOBCdlGzC2Xhii2PJ+4evz0
Ky+wRGrSyPt41IMrZfgoEpdE53JngNpBa2/xsAWHDJkiXgpCrv68s24EUxJH4bug
nOLaXqPDFiMX/JP64/taXolwpn41zw==
=qi3E
-----END PGP SIGNATURE-----

--m7VgwWqpik+vWn8u--

