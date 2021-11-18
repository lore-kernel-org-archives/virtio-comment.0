Return-Path: <virtio-comment-return-2360-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F5989864C6
	for <virtio-comment@lists.oasis-open.org>; Thu, 18 Nov 2021 09:26:17 +0000 (UTC)
Date: Thu, 18 Nov 2021 09:26:07 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YZYcL6z83ltZ7u23@stefanha-x1.localdomain>
References: <20211118025741.230748-1-yadong.qi@intel.com>
MIME-Version: 1.0
In-Reply-To: <20211118025741.230748-1-yadong.qi@intel.com>
Subject: Re: [virtio-comment] [PATCH] virtio-blk: add secure discard feature
 to specification
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LOXmcMqqnoN+idg4"
Content-Disposition: inline
To: yadong.qi@intel.com
Cc: virtio-comment@lists.oasis-open.org, luhai.chen@intel.com, kai.z.wang@intel.com, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
List-ID: <virtio-comment.lists.oasis-open.org>

--LOXmcMqqnoN+idg4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2021 at 10:57:41AM +0800, yadong.qi@intel.com wrote:
> From: Yadong Qi <yadong.qi@intel.com>
>=20
> There are user requests to use BLKSECDISCARD on virtio-blk device.
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
> Signed-off-by: Yadong Qi <yadong.qi@intel.com>
> ---
>  content.tex | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>=20
> diff --git a/content.tex b/content.tex
> index 5d112af..305c51f 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -4435,6 +4435,13 @@ \subsection{Feature bits}\label{sec:Device Types /=
 Block Device / Feature bits}
> =20
>  \item[VIRTIO_BLK_F_LIFETIME (15)] Device supports providing storage life=
time
>       information.
> +
> +\item[VIRTIO_BLK_F_SECDISCARD (16)] Device can support secure discard co=
mmand,
> +    share the same maximum discard sectors size and discard segment numb=
er with
> +    VIRTIO_BLK_F_DISCARD. Maximum discard sectors size in
> +    \field{max_discard_sectors} and maximum discard segment number in
> +    \field{max_discard_seg}.

Christoph suggested separate queue limits for secdiscard. Please include
this in the spec from the start.

If the guest operating system does not support that and the secdiscard
queue limits reported by the device are different from the discard
limits, then the driver can disable secdiscard.

This way virtio-blk is future-proof and can also act as the first Linux
driver to use secdiscard queue limits.

> +
>  \end{description}
> =20
>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / =
Block Device / Feature bits / Legacy Interface: Feature bits}
> @@ -4619,7 +4626,8 @@ \subsection{Device Operation}\label{sec:Device Type=
s / Block Device / Device Ope
>  The type of the request is either a read (VIRTIO_BLK_T_IN), a write
>  (VIRTIO_BLK_T_OUT), a discard (VIRTIO_BLK_T_DISCARD), a write zeroes
>  (VIRTIO_BLK_T_WRITE_ZEROES), a flush (VIRTIO_BLK_T_FLUSH), a get device =
ID
> -string command (VIRTIO_BLK_T_GET_ID), or a get device lifetime command
> +string command (VIRTIO_BLK_T_GET_ID), a secure discard
> +(VIRTIO_BLK_T_SECDISCARD), or a get device lifetime command
>  (VIRTIO_BLK_T_GET_LIFETIME).
> =20
>  \begin{lstlisting}
> @@ -4630,6 +4638,7 @@ \subsection{Device Operation}\label{sec:Device Type=
s / Block Device / Device Ope
>  #define VIRTIO_BLK_T_GET_LIFETIME 10
>  #define VIRTIO_BLK_T_DISCARD      11
>  #define VIRTIO_BLK_T_WRITE_ZEROES 13
> +#define VIRTIO_BLK_T_SECDISCARD   14
>  \end{lstlisting}
> =20
>  The \field{sector} number indicates the offset (multiplied by 512) where
> @@ -4729,13 +4738,13 @@ \subsection{Device Operation}\label{sec:Device Ty=
pes / Block Device / Device Ope
>  and VIRTIO_BLK_T_OUT requests.
> =20
>  The length of \field{data} MUST be a multiple of the size of struct
> -virtio_blk_discard_write_zeroes for VIRTIO_BLK_T_DISCARD and
> -VIRTIO_BLK_T_WRITE_ZEROES requests.
> +virtio_blk_discard_write_zeroes for VIRTIO_BLK_T_DISCARD,
> +VIRTIO_BLK_T_SECDISCARD and VIRTIO_BLK_T_WRITE_ZEROES requests.
> =20
>  The length of \field{data} MUST be 20 bytes for VIRTIO_BLK_T_GET_ID requ=
ests.
> =20
> -VIRTIO_BLK_T_DISCARD requests MUST NOT contain more than
> -\field{max_discard_seg} struct virtio_blk_discard_write_zeroes segments =
in
> +VIRTIO_BLK_T_DISCARD and VIRTIO_BLK_T_SECDISCARD requests MUST NOT conta=
in more
> +than \field{max_discard_seg} struct virtio_blk_discard_write_zeroes segm=
ents in
>  \field{data}.
> =20
>  VIRTIO_BLK_T_WRITE_ZEROES requests MUST NOT contain more than
> @@ -4764,7 +4773,7 @@ \subsection{Device Operation}\label{sec:Device Type=
s / Block Device / Device Ope
>  write any data.
> =20
>  The device MUST set the \field{status} byte to VIRTIO_BLK_S_UNSUPP for
> -discard and write zeroes commands if any unknown flag is set.
> +discard, secure discard and write zeroes commands if any unknown flag is=
 set.
>  Furthermore, the device MUST set the \field{status} byte to
>  VIRTIO_BLK_S_UNSUPP for discard commands if the \field{unmap} flag is se=
t.
> =20
> --=20
> 2.25.1
>=20
>=20
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>=20
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>=20
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>=20

--LOXmcMqqnoN+idg4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGWHC8ACgkQnKSrs4Gr
c8gnxQgAmG6stabLF5XD/WBxY6TXGZHf97bnWwctGA3vYJ8bbWFBC6msTtsEIyTk
YUao0Qv6SHSGwP3P77SmS/HIzXYDQ1GJgKcZBgwm6uDjxKT+/h0qcJljpIxkh4RF
n0QLB3gUxwmoojJSMa8SoauwgkMnxdT08n6UIXou3XbHICAEAKpvyaogZwDm5ao9
KUyfmqcIU9sKNOk+w4tiYmScvvO/ydS9DV74UQLKIG21EVm1NeuN2As49z+4g/Bx
J8jby12O7yUm0su57rNSmbr1S42K4i1OZsF69XiLCnInjJD1U5IE07AEC+hI4UVk
zYL4+u5/ovEQ5vV5FvGTJELlcDeCaw==
=Zcri
-----END PGP SIGNATURE-----

--LOXmcMqqnoN+idg4--

