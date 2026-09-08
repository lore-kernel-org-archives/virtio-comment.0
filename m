Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2D5559C8C
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 15:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880503; cv=none; b=Ndc1pmq/R0bbsZCRvLHoUUSb2L8/NZZy2xk6BkJWxwnDd4vW3K62OnavER2BmKWjTZPSEKzP9bime+XUPemOGvOiUGjPLdG6++Yg8W31OQLWTrL3EHE26d9yNQjYbmOWbOIOgk+WVDMP1m7mvndVVPQx5Ns6GpdeQU4yW4oWgbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880503; c=relaxed/simple;
	bh=1PtVrud4LWEa1CJ9DlGtRHgBzTrjT6dnTC0/DzNM9cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnKhu9qMHy7YWo67huYJ5usbpV1qbZZbjITK9So3E8IB4E+GEjZWhwuSROxw77v+oRSm8svDZO5KdNb+T9nBkM/np8XN9ps367fdq9g4MUSraNAJIkWM25KvHaDRQ04Fp2LD5XniPQqJUQcNmG951i8D7+CZpTvm71OZaNoaJwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Okg+wsRR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Okg+wsRR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788880491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qS1IfTnIcZXllCvP5UyHgVGilSdM/QjyxlCE6AcuwVs=;
	b=Okg+wsRRKKEVabFuCb3N5xFF9AAA8OFFqyAJoRwEun/3zvkTLCb74eYplStrOtN+oqyNgw
	URFXY62ceWp14gj6Hs8bNGRJdYSnulKg9jCDmHHaxQmB/laEhZUQbWLznofsAP263EM1MK
	7hN/f2RRnvrkcuBQvWFXb5yV6phzxs4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-620-XiF9_PfdPEG6vXYqSXVoxQ-1; Tue,
 08 Sep 2026 11:14:49 -0400
X-MC-Unique: XiF9_PfdPEG6vXYqSXVoxQ-1
X-Mimecast-MFC-AGG-ID: XiF9_PfdPEG6vXYqSXVoxQ_1788880488
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 53A71195E906
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 15:14:48 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9D0151955F09;
	Tue,  8 Sep 2026 15:14:47 +0000 (UTC)
Date: Tue, 8 Sep 2026 11:14:46 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: virtio-comment@lists.linux.dev, "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260908151446.GC1016680@fedora>
References: <20260908094050.915173-1-rjones@redhat.com>
 <20260908094050.915173-2-rjones@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q3B26Nyi3RvKngh0"
Content-Disposition: inline
In-Reply-To: <20260908094050.915173-2-rjones@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

--q3B26Nyi3RvKngh0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 10:40:50AM +0100, Richard W.M. Jones wrote:
> SCSI-based paravirtualized block devices including virtio-scsi and
> VMware's pvscsi allow longer device IDs.  This presents an issue when
> we change the backing of a disk from one type to another, eg from
> pvscsi to virtio-blk, or virtio-scsi to virtio-blk.  The longer device
> ID has to be truncated to 20 bytes.  This results in guest visible
> changes, notably /dev/disk/by-id/ paths are different, so any
> mountpoints or configuration files that use these paths will break.
>=20
> Therefore extend virtio-blk to allow longer device IDs.  I chose 247
> bytes (ASCII chars) as the new limit since SCSI serials can in theory
> be this long.  Real serials will be much shorter than this; the aim is
> to allow UUIDs to be preserved which would use 32 or 36 ASCII chars.
>=20
> A new feature bit is introduced to indicate that long device IDs are
> supported.
>=20
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  device-types/blk/description.tex | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
>=20
> diff --git a/device-types/blk/description.tex b/device-types/blk/descript=
ion.tex
> index 3b3a4e7..aa3ec66 100644
> --- a/device-types/blk/description.tex
> +++ b/device-types/blk/description.tex
> @@ -73,6 +73,9 @@ \subsection{Feature bits}\label{sec:Device Types / Bloc=
k Device / Feature bits}
>      VIRTIO_BLK_REQ_FLAG_OUT_FUA flag in the \field{flags} bitfield of the
>      \field{virtio_blk_req} structure for VIRTIO_BLK_T_OUT requests.
> =20
> +\item[VIRTIO_BLK_F_LONG_ID (20)] Device supports long device ID
> +    strings.
> +
>  \end{description}
> =20
>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / =
Block Device / Feature bits / Legacy Interface: Feature bits}
> @@ -516,8 +519,23 @@ \subsection{Device Operation}\label{sec:Device Types=
 / Block Device / Device Ope
>  zeroes.
> =20
>  VIRTIO_BLK_T_GET_ID requests fetch the device ID string from the device =
into
> -\field{data}.  The device ID string is a NUL-padded ASCII string up to 2=
0 bytes
> -long.  If the string is 20 bytes long then there is no NUL terminator.
> +\field{data}.  The device ID string is an ASCII string which can be
> +up to 247 bytes long.
> +
> +If VIRTIO_BLK_F_LONG_ID was not negotiated, VIRTIO_BLK_T_GET_ID
> +fetches the first 20 bytes of the device ID string.  If the ID is
> +shorter than 20 bytes, then the response is padded with NUL bytes so
> +its length is 20 bytes.  (Note that if the ID is 20 bytes or longer,
> +this means the response will not be NUL terminated.)
> +
> +If VIRTIO_BLK_F_LONG_ID was negotiated, VIRTIO_BLK_T_GET_ID fetches
> +the complete device ID string.  The response is always 248 bytes long,
> +padded to this length with NUL bytes.  Since the longest permitted
> +device ID string is 247 bytes, the response is NUL terminated.
> +
> +Although 247 byte device ID strings are allowed, there may be
> +interoperability problems if strings longer than 128 bytes are used.

Can you be more specific? Is the concern that the guest software stack
above of the driver may not be prepared for serial strings longer than
128 bytes?

> +It is also advisable to use only 7 bit ASCII characters.

Versus "The device ID string is an ASCII string which can be up to 247
bytes long" earlier in this patch. Is ASCII a "SHOULD" or a "MUST"?

> =20
>  The \field{data} used for VIRTIO_BLK_T_GET_LIFETIME requests is populated
>  by the device, and is of the form
> @@ -911,7 +929,10 @@ \subsection{Device Operation}\label{sec:Device Types=
 / Block Device / Device Ope
>  virtio_blk_discard_write_zeroes for VIRTIO_BLK_T_DISCARD,
>  VIRTIO_BLK_T_SECURE_ERASE and VIRTIO_BLK_T_WRITE_ZEROES requests.
> =20
> -The length of \field{data} MUST be 20 bytes for VIRTIO_BLK_T_GET_ID requ=
ests.
> +For VIRTIO_BLK_T_GET_ID requests the length of \field{data} depends
> +on the feature VIRTIO_BLK_F_LONG_ID.  If VIRTIO_BLK_F_LONG_ID was
> +negotiated the length of \field{data} MUST be 248 bytes, else
> +it MUST be 20 bytes.
> =20
>  VIRTIO_BLK_T_DISCARD requests MUST NOT contain more than
>  \field{max_discard_seg} struct virtio_blk_discard_write_zeroes segments =
in
> --=20
> 2.55.0
>=20
>=20

--q3B26Nyi3RvKngh0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmqgJmYACgkQnKSrs4Gr
c8jM+wgAqoL6jxTfMQ0a2HDQFBQsbnaGT9/MeinMTeRFk1W6j0ca2uGMv1S+AeDZ
Y45aQhzhGUT6rtOIGezZo1HTwNMyqyxX3sTwG/3NjdezfCUeeIyQRigYJtJFXLpG
n23tAP4qRUH/2nNSsss7zMuVKVUp1HH35NgntFSfPpaGJ+5+d85vATJkY44NZyzl
Ag7db5ro2bwHb/EbOPok2g87RMIfn6j+Us94eF39/ow0Gs4Kiex2RnSsH4WybgcV
nk1b3v2qDG4LzT4l6pMOXPpiNXPGTMEgr3+KOUuHI/m2Ebfcl1VKamdxMxnWZ3yv
pJRt5EdQiOcCLAqBRbnspJpj8+QPMg==
=UuC2
-----END PGP SIGNATURE-----

--q3B26Nyi3RvKngh0--

