Return-Path: <virtio-comment-return-6051-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC73C7EE23
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 15:21:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D207A42907
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 15:21:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C4D89986411
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 15:21:15 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BC414986351; Wed, 31 May 2023 15:21:15 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ABB28986384
	for <virtio-comment@lists.oasis-open.org>; Wed, 31 May 2023 15:21:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 6aC8fqSAM_ywapSbQK5N3g-1
Date: Wed, 31 May 2023 11:20:59 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, houp@yusur.tech,
	helei.sig11@bytedance.com, xinhao.kong@duke.edu
Message-ID: <20230531152059.GF1248296@fedora>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-5-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i2DupV3X3bvky7Sf"
Content-Disposition: inline
In-Reply-To: <20230504081910.238585-5-pizhenwei@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [virtio-comment] [PATCH v2 04/11] transport-fabrics: introduce
 Stream Transmission

--i2DupV3X3bvky7Sf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 04:19:03PM +0800, zhenwei pi wrote:
> Stream transmission is used for stream oriented communication(Ex TCP),
> also add virtio-blk read/write 8K example.
>=20
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  transport-fabrics.tex | 229 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 229 insertions(+)
>=20
> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
> index b88acfd..c02cf26 100644
> --- a/transport-fabrics.tex
> +++ b/transport-fabrics.tex
> @@ -88,3 +88,232 @@ \subsubsection{Segment Descriptor Definition}\label{s=
ec:Virtio Transport Options
>  \end{tabular}
> =20
>  Depending on the opcode, a Command contains zero or more structure virti=
o_of_vring_desc.
> +
> +\subsubsection{Buffer Mapping Definition}\label{sec:Virtio Transport Opt=
ions / Virtio Over Fabrics / Transmission Protocol / Buffer Mapping Definit=
ion}
> +Virtio Over Fabrics defines two types of buffer mapping rules.

What is a buffer? Is it a virtqueue buffer (consisting of one or more
descriptors/elements) or are you using the term for a different concept?

> +
> +\paragraph{Stream Transmission}\label{sec:Virtio Transport Options / Vir=
tio Over Fabrics / Transmission Protocol / Commands Definition / Stream Tra=
nsmission}
> +Command, Segment Descriptors, and buffer are transmitted in a stream wit=
hin a

Is a Segment Descriptor a virtio_of_vring_desc?

> +connection. The layout in stream:
> +
> +\begin{lstlisting}
> +CMDx contains 0 descriptor, CMDy contains (n - m + 1) descriptors and bu=
ffer:

"0 descriptors"

> +
> +     +-----+     +-----++-----+     +-----++-----+
> + ... | CMDx| ... | CMDy||DESCm| ... |DESCn|| BUF | ...
> +     +-----+     +-----++-----+     +-----++-----+
> +
> +COMPx contains 0 descriptor, COMPy contains (k - j + 1) descriptors and =
buffer:

I think this is the first time the concept of a completion (COMP) was
introduced. Please describe commands/completions before using them in
the text.

> +
> +     +-----+     +-----++-----+     +-----++-----+
> + ... |COMPx| ... |COMPy||DESCj| ... |DESCk|| BUF | ...
> +     +-----+     +-----++-----+     +-----++-----+
> +\end{lstlisting}
> +
> +An example of a virtio-blk write 8K request(total size: sizeof(Command) +
> +4 * sizeof(Descriptor) + 8208):
> +\begin{lstlisting}
> + COMMAND            +------+
> +                    |opcode|  ->  virtio_of_op_vring
> +                    +------+
> +                    |cmd id|  ->  10
> +                    +------+
> +                    |length|  ->  8208
> +                    +------+
> +                    |ndesc |  ->  4
> +                    +------+
> +                    |rsvd  |
> +                    +------+
> +
> + DESC0              +------+
> +              +-----|addr  |  -> 0
> +              |     +------+
> +              |     |length|  -> 16 (virtio blk write command)
> +              |     +------+
> +              |     |id    |  -> 0
> +              |     +------+
> +              |     |flags |  -> 0
> +              |     +------+
> +              |
> + DESC1        |     +------+
> +              | +---|addr  |  -> 16
> +              | |   +------+
> +              | |   |length|  -> 4096
> +              | |   +------+
> +              | |   |id    |  -> 1
> +              | |   +------+
> +              | |   |flags |  -> 0
> +              | |   +------+
> +              | |
> + DESC2        | |   +------+
> +              | | +-|addr  |  -> 4112
> +              | | | +------+
> +              | | | |length|  -> 4096
> +              | | | +------+
> +              | | | |id    |  -> 2
> +              | | | +------+
> +              | | | |flags |  -> 0
> +              | | | +------+
> +              | | |
> + DESC3        | | | +------+
> +              | | | |addr  |  -> 0

Is this field 0 in all stream connection VIRTIO_OF_DESC_F_WRITE
descriptors?

> +              | | | +------+
> +              | | | |length|  -> 1
> +              | | | +------+
> +              | | | |id    |  -> 3
> +              | | | +------+
> +              | | | |flags |  -> VIRTIO_OF_DESC_F_WRITE
> +              | | | +------+
> +              | | |
> + DATA         +-+-+>+------+  -> 0
> +                | | |......|
> +                +-+>+------+  -> 16
> +                  | |......|
> +                  +>+------+  -> 4112
> +                    |......|
> +                    +------+  -> 8208
> +\end{lstlisting}
> +
> +The Completion of this request(total size: sizeof(Completion) +
> +1 * sizeof(Descriptor) + 1):
> +\begin{lstlisting}
> + COMPLETION         +------+
> +                    |status|  ->  VIRTIO_OF_SUCCESS
> +                    +------+
> +                    |cmd id|  ->  10
> +                    +------+
> +                    |ndesc |  ->  1
> +                    +------+
> +                    |rsvd  |
> +                    +------+
> +                    |value |  -> 1 (value.u32)

What is this field and what does u32 mean?

> +                    +------+
> +
> + DESC0              +------+
> +                  +-|addr  |  -> 0
> +                  | +------+
> +                  | |length|  -> 1
> +                  | +------+
> +                  | |id    |  -> 3

This has to match with the original descriptor id sent with the Command?

> +                  | +------+
> +                  | |flags |  -> VIRTIO_OF_DESC_F_WRITE
> +                  | +------+
> +                  |
> + DATA             |>+------+  -> 0
> +                    |......|
> +                    +------+  -> 1
> +\end{lstlisting}

I think this is more flexible (and has more protocol overhead) than
necessary. When the device has used a virtqueue buffer, it indicates how
many bytes were used (this can be less than the totaly number of F_WRITE
bytes available). I don't think there is a need to communicate F_WRITE
descriptors, especially in the Completion. Just a Completion with a
'length' field instead of an 'ndesc' field followed by data is enough.

Since VIRTIO has flexible framing
(https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.htm=
l#x1-390004),
there isn't really a need to communicate the F_WRITE descriptors at all,
just the maximum number of used bytes that the initiator expects.

Can you explain why you chose to transmit F_WRITE descriptors in both
the Command and the Completion? Maybe I missed a reason why it's
important.

--i2DupV3X3bvky7Sf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR3ZdsACgkQnKSrs4Gr
c8gkwAgAvPKzStxzNwsft+6xONs0VvOVVjt/tPR6gh8vzT5OstJvfAtEWqiCVTyh
BI9zDMmVn19HaQygm/l/ZztZUidUfbFZRT79FRmMH8aBDvM6m5UpntB5ExWvsKfg
xKFliZcBxqiCCYojZ0Bmnm78KkixAGCTpJtDBs5+/gTneJXUqg1Rdc/QD8RsFoPp
RdE2PCGolbtJVCisWKGXDqzVZO+xU2rtWrREVBhcwcfQY1KtDTkDzVG0OjbqO353
DlPd0thO5fdRku7opZzENxyhP1gUBeejCz2s5N9I2l9a8g1aG6EHkusAoP6u6k9i
fzinnqa+Jgl6Q/dpGRBXTTJhxLtvoA==
=Zibb
-----END PGP SIGNATURE-----

--i2DupV3X3bvky7Sf--

