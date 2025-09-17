Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9E31A9FBD
	for <virtio-comment@lists.linux.dev>; Thu, 18 Sep 2025 13:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758202718; cv=none; b=dC3lhpJVvvVpsus/zhsXELBTzMgZe8qfoOpJgDTjQGbBfluHTHk4pg0TjZRno/MidRTIdkFGe9jSFSQxxGLKUWj7OUVs4cxeHMHfHIOLNaZ2JzAnJ21TOecjL6mNDU3ZarUWlkxDwOgpBJysSZhLqRTRAxZWK3IK4wc5nmLTw1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758202718; c=relaxed/simple;
	bh=AxNCcCZE80l4nYIvonObHapGAcxADgipI8aH8VyLTOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsWqapqCW60eAVGSP1QPSAvPTKigyFNp1EvEhXBfoJYjdl/N+3XX24yV4XvGIbD92Gx6zhD2sBpkLCI1gxBSugvV7xC0x9gaCKaUGf5AR/MowcwaOWGHsXuvSP60K2/lulYrBRPrfBRPEoFuhlyGpCWqW0t00ehLkypP70MViIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MullIP79; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MullIP79"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758202715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SLh5h0lUnCqnJ2sGginqVCfE9k/aUnLZpYXxlglFwNc=;
	b=MullIP79ZOHtXILFvU0Rs8dXmjBxWwDGnayL2/DKkTbQu1uDUxvjHMBAu1/eB9dCn0Bt8v
	o0+x8iat9Od5tgD5fmX8dSd+pl7XKURmQU5zCJj1IrQamKHbLJ7Dnqa3QZt9gyrnzqhzCO
	VkNxNKOpoGSC8JG3EYqhZxwkW5rWfSo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-394-jjfSyP1AMgm4enxepWoJqw-1; Thu,
 18 Sep 2025 09:38:33 -0400
X-MC-Unique: jjfSyP1AMgm4enxepWoJqw-1
X-Mimecast-MFC-AGG-ID: jjfSyP1AMgm4enxepWoJqw_1758202712
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 06FFF19560B5;
	Thu, 18 Sep 2025 13:38:32 +0000 (UTC)
Received: from localhost (unknown [10.2.16.159])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3CC4F1955F19;
	Thu, 18 Sep 2025 13:38:31 +0000 (UTC)
Date: Wed, 17 Sep 2025 15:26:22 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: dverkamp@chromium.org, mst@redhat.com, virtio-comment@lists.linux.dev
Subject: Re: [PATCH v3] virtio-blk: Add support for "Force Unit Access" writes
Message-ID: <20250917192622.GC172838@fedora>
References: <20250917071249.1689417-1-afaria@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PK/LpXiSPghmsDPq"
Content-Disposition: inline
In-Reply-To: <20250917071249.1689417-1-afaria@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17


--PK/LpXiSPghmsDPq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 08:12:49AM +0100, Alberto Faria wrote:
> Add a VIRTIO_BLK_F_REQ_FLAGS feature bit converting the current
> `virtio_blk_req::reserved` field into a `flags` bit field, which can be
> used to modify the behavior of an entire request.
>=20
> Define one of the bits as signaling that a VIRTIO_BLK_T_OUT request
> should be a "Force Unit Access" (FUA) write, i.e., should become stable
> once the request completes. FUA writes enable better performance
> compared to the alternative of waiting for a write to complete and
> subsequently submitting a flush.
>=20
> Leave the remaining 31 bits reserved for now.
>=20
> Also add a VIRTIO_BLK_F_REQ_FLAGS_FUA feature bit indicating device
> support for the aforementioned FUA bit.
>=20
> This approach allows for future expansion to other request-level flags
> that may each be applicable to all or just a subset of request types.
> The VIRTIO_BLK_F_REQ_FLAGS feature bit ensures compatibility with legacy
> devices/drivers that interpret the previously-`reserved` field as a
> priority indicator.
>=20
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>=20
> QEMU + kernel patchsets and some performance numbers to follow.
>=20
> v3:
> - Changed to a more future-proof approach somewhat similar to what was
>   suggested by Stefan.
> - Included a brief rationale for the introduction of FUA write requests,
>   as suggested by Michael.
>=20
> v2:
> - Redefine VIRTIO_BLK_T_OUT_FUA to 27 since 15 is already in use.
> - Clarify that the cache mode has no impact on VIRTIO_BLK_T_OUT_FUA
>   semantics.
> - Allow drivers to negotiate VIRTIO_BLK_F_OUT_FUA even if they are
>   incapable of sending VIRTIO_BLK_T_OUT_FUA commands.
>=20
>  device-types/blk/description.tex | 50 +++++++++++++++++++++++++++-----
>  1 file changed, 43 insertions(+), 7 deletions(-)
>=20
> diff --git a/device-types/blk/description.tex b/device-types/blk/descript=
ion.tex
> index 2712ada..6f80451 100644
> --- a/device-types/blk/description.tex
> +++ b/device-types/blk/description.tex
> @@ -66,6 +66,13 @@ \subsection{Feature bits}\label{sec:Device Types / Blo=
ck Device / Feature bits}
>  	(ZNS). For brevity, these standard documents are referred as "ZBD stand=
ards"
>  	from this point on in the text.
> =20
> +\item[VIRTIO_BLK_F_REQ_FLAGS (18)] Device can interpret the \field{flags=
} field
> +    in the \field{virtio_blk_req} structure.
> +
> +\item[VIRTIO_BLK_F_REQ_FLAGS_FUA (19)] Device supports the Force Unit Ac=
cess
> +    (FUA) flag in the \field{flags} field of the \field{virtio_blk_req}
> +    structure for VIRTIO_BLK_T_OUT requests.
> +
>  \end{description}
> =20
>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / =
Block Device / Feature bits / Legacy Interface: Feature bits}
> @@ -402,6 +409,9 @@ \subsection{Device Initialization}\label{sec:Device T=
ypes / Block Device / Devic
>  \item the device MUST initialize padding bytes \field{unused2} to 0.
>  \end{itemize}
> =20
> +If VIRTIO_BLK_F_REQ_FLAGS is not negotiated, then VIRTIO_BLK_F_REQ_FLAGS=
_FUA
> +also MUST NOT be negotiated.

Please structure this as:

  \drivernormative
  ...
  The driver MUST NOT negotiate VIRTIO_BLK_F_REQ_FLAGS_FUA without
  VIRTIO_BLK_F_REQ_FLAGS.

  \devicenormative
  ...
  The device MUST NOT acknowledge FEATURES_OK if the driver sets
  VIRTIO_BLK_F_REQ_FLAGS_FUA without VIRTIO_BLK_F_REQ_FLAGS.

That way driver authors also have a conformance clause informing them
that FUA requires request flags.

> +
>  \subsubsection{Legacy Interface: Device Initialization}\label{sec:Device=
 Types / Block Device / Device Initialization / Legacy Interface: Device In=
itialization}
> =20
>  Because legacy devices do not have FEATURES_OK, transitional devices
> @@ -434,7 +444,10 @@ \subsection{Device Operation}\label{sec:Device Types=
 / Block Device / Device Ope
>  \begin{lstlisting}
>  struct virtio_blk_req {
>          le32 type;
> -        le32 reserved;
> +        struct {
> +                le32 fua:1;
> +                le32 reserved:31;
> +        } flags;

FUA only has meaning for certain request types. I think it's worth
stating that the meaning of the flags field is specific to each request
type. That way there are more bits available in the future and there is
no need to specify how invalid flag bits are handled for the other
request types.

>          le64 sector;
>          u8 data[];
>          u8 status;
> @@ -459,6 +472,9 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Block Device / Device Ope
>  #define VIRTIO_BLK_T_SECURE_ERASE   14
>  \end{lstlisting}
> =20
> +The \field{flags} field is entirely reserved unless VIRTIO_BLK_F_REQ_FLA=
GS is
> +negotiated.

This statement might be interpreted as "the flags field is zero when
VIRTIO_BLK_F_REQ_FLAGS is not negotiated" by device implementors. The
Linux driver populates it with the request's I/O priority even for
non-legacy devices, so it might not be zero.

How about:

  The \field{flags} field is ignored by the device unless
  VIRTIO_BLK_F_REQ_FLAGS is negotiated.

> +
>  The \field{sector} number indicates the offset (multiplied by 512) where
>  the read or write is to occur. This field is unused and set to 0 for
>  commands other than read, write and some zone operations.
> @@ -873,6 +889,14 @@ \subsection{Device Operation}\label{sec:Device Types=
 / Block Device / Device Ope
> =20
>  A driver SHOULD accept the VIRTIO_BLK_F_RO feature if offered.
> =20
> +If VIRTIO_BLK_F_REQ_FLAGS is negotiated:
> +
> +\begin{itemize}
> +\item A driver MUST NOT set the \field{fua} bit in \field{flags} unless =
the
> +    VIRTIO_BLK_F_REQ_FLAGS_FUA feature is negotiated and the request typ=
e is
> +    VIRTIO_BLK_T_OUT.
> +\end{itemize}
> +
>  A driver MUST set \field{sector} to 0 for a VIRTIO_BLK_T_FLUSH request.
>  A driver SHOULD NOT include any data in a VIRTIO_BLK_T_FLUSH request.
> =20
> @@ -962,9 +986,15 @@ \subsection{Device Operation}\label{sec:Device Types=
 / Block Device / Device Ope
>  operation of the device. When this happens, the device SHOULD trigger a
>  configuration change notification.
> =20
> -A device MUST set the \field{status} byte to VIRTIO_BLK_S_IOERR
> -for a write request if the VIRTIO_BLK_F_RO feature if offered, and MUST =
NOT
> -write any data.
> +A device MUST set the \field{status} byte to VIRTIO_BLK_S_IOERR for a wr=
ite
> +request and MUST NOT write any data if any of the following conditions i=
s true:
> +
> +\begin{itemize}
> +\item the VIRTIO_BLK_F_RO feature if offered.
> +
> +\item the VIRTIO_BLK_F_REQ_FLAGS feature was negotiated and the \field{f=
ua} bit
> +    in \field{flags} is set but VIRTIO_BLK_F_REQ_FLAGS_FUA was not negot=
iated.

This statement is in conflict with backwards compatibility. Consider the
case where a new request flag called FOO is added to the spec after this
patch is merged and it uses the same language:

  \item the VIRTIO_BLK_F_REQ_FLAGS feature was negotiated and the
  \field{foo} bit in \field{flags} is set but VIRTIO_BLK_F_REQ_FLAGS_FOO
  was not negotiated.

Existing devices don't know about REQ_FLAGS_FOO but the spec now says
they must fail the request with VIRTIO_BLK_S_IOERR if the foo bit is set
without VIRTIO_BLK_F_REQ_FLAGS_FOO.

New behavior for FUA can only be introduced when
VIRTIO_BLK_F_REQ_FLAGS_FUA has been negotiated. I think that requires
dropping this statement from this patch. (Technically it works in this
patch because VIRTIO_BLK_F_REQ_FLAGS is also introduced in the same
patch, but it won't be possible for future flags bits and therefore it
is strange to treat FUA differently.)

> +\end{itemize}
> =20
>  The device MUST set the \field{status} byte to VIRTIO_BLK_S_UNSUPP for
>  discard, secure erase and write zeroes commands if any unknown flag is s=
et.
> @@ -1000,14 +1030,20 @@ \subsection{Device Operation}\label{sec:Device Ty=
pes / Block Device / Device Ope
>    \field{writeback} field in configuration space was 0 \textbf{all the t=
ime between
>    the submission of the write and its completion};
> =20
> -\item\label{item:flush3} a VIRTIO_BLK_T_FLUSH request is sent \textbf{af=
ter the write is
> +\item\label{item:flush3} the VIRTIO_BLK_F_REQ_FLAGS_FUA feature was nego=
tiated
> +  and the \field{fua} bit in \field{flags} was set in the write request
> +  (regardless of whether the VIRTIO_BLK_F_FLUSH or VIRTIO_BLK_F_CONFIG_W=
CE
> +  features were negotiated, and regardless of the current cache mode as
> +  expressed by the value of the \field{writeback} field in configuration=
 space).

Missing "and the write request is completed"?

> +
> +\item\label{item:flush4} a VIRTIO_BLK_T_FLUSH request is sent \textbf{af=
ter the write is
>    completed} and is completed itself.
>  \end{enumerate}
> =20
>  If the device is backed by persistent storage, the device MUST ensure th=
at
>  stable writes are committed to it, before reporting completion of the wr=
ite
> -(cases~\ref{item:flush1} and~\ref{item:flush2}) or the flush
> -(case~\ref{item:flush3}).  Failure to do so can cause data loss
> +(cases~\ref{item:flush1}, \ref{item:flush2} and~\ref{item:flush3}) or th=
e flush
> +(case~\ref{item:flush4}).  Failure to do so can cause data loss
>  in case of a crash.
> =20
>  If the driver changes \field{writeback} between the submission of the wr=
ite
> --=20
> 2.51.0
>=20

--PK/LpXiSPghmsDPq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmjLC14ACgkQnKSrs4Gr
c8g/ZAf/dzS0Daw+PfhMlrt5rd66Lev1t8Wa+Z20WDJrwm65WG51Bx/hFbmbyRPq
QZVJpsb+ZBxPuFfDMGvQ/Y3/P5C4gDIXfP2KczFOuVuF9ggKBYbDZ1vvYlOR9/N4
VCHPWA4z+0iFJ5MYsmcRvdy8pPmFY+3gnh4modHYdPKfHb4MiBFkNBolZHVGsBze
0lkSFgUOzpoFAayZP6qpaGL4CBLuFkfPTiOh7oXreMfaOc7z/N+BAWEWlxH3hiEk
dheJDfB+omNzyvnBSgpEcpApUcf8SPDhfZYcJ8WuScBO0i6dR3nORUCTibd2HdxZ
HEo8yNRu/GJSoRQ8ulzGWrGEX58rxA==
=WB4l
-----END PGP SIGNATURE-----

--PK/LpXiSPghmsDPq--

