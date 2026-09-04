Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523624E66B9
	for <virtio-comment@lists.linux.dev>; Fri,  4 Sep 2026 15:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536167; cv=none; b=FmA0WgFaHaRbyusrX6m3ZOI5s4TDubJjC9pvS+Mpyzva4GX+KVaK8BmIf8olIup3kQ+IPLXtIUuOH5EzphRi1D47EOlVEnSwV2Z5VML8W+iZ5g4nm5APsmA+6ZTp49rumGlyPKp4dtD/HotD0MdyJDyt6jwZ5utUND84kQ8vYjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536167; c=relaxed/simple;
	bh=f03qLXsotyadwvt5o0R9flJ4AnYWiWmLv/cSm4rxWdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LHuMPx7G8ZejXKgveggT0Cl5N7SZaoSu5OrJ5uUYzFhKllHdw8Au8EeEfdBwZGuBdaLHH3CUImPZQX/FQ4DAInQWSUkYACe6xnTnzZ/lZ0/tw8cCJ/ZHk4kFf9s6Q5uQlx+mqjbVstTa4Sk+RLG4fjRQ5xDKlC5ADivMTn/Ng9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLGRvFGv; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLGRvFGv"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66e611e7c05so965001d50.2
        for <virtio-comment@lists.linux.dev>; Fri, 04 Sep 2026 08:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788536164; x=1789140964; darn=lists.linux.dev;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KIXZxuzvzp7LBIRdWabLOSt1VRBnKnYKVtlUM0qY7aY=;
        b=WLGRvFGvLQ0x2Vt4MVBPMKYbM40DmMysYRyYu0beFGi5m1TZb/wTE6ZsMjjCtcimgt
         A7GuOu19aGwgKKsxHEI1n5wlFdNPfb6YQkFoAxn6QdaQ0YcVZFTWGO0T497jiOLyjiLi
         kIXgG68QZixitoIxf9wgjzpJxV6gTwoHxj7XUCYyN2FcOdVr9DoGjgFGvqsV3qYzUSGg
         +OIRrLt0Lgu1hWfKr+vdRmBO1sep3X+I8UL45WCBLThDmsvzN4Kfr/fc3kTXPgwuV6tF
         7DNQUM6h6ld+jut6R0199bnyC4go27St6FGvIZBpRqJEgYEMPf8cjPmSUGX414D7NWkj
         BT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536164; x=1789140964;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIXZxuzvzp7LBIRdWabLOSt1VRBnKnYKVtlUM0qY7aY=;
        b=YUsfrIivsRqtqwIleisn7gwKvRw4xQKGrO4+mSZc+BIFUum8S5BIs4DZMl1P5MRbBk
         640/iHIKG8baupedIHeTbf5mXyfhBF48/IdfsHr3Kcv7vW5eDzd/PirIXqz47q843pB0
         WeOn8s1jPLxLuNesmBQkpX2/8XKD96DWYV634BIRiIh8J1Hjbviwd+iAHgOdvdTVC6H9
         yx75Qguy8hBICRMKdJMuiBCMtmoGMoe75cFhPtBcll1faixuJ0UFFZwXpte0CnKrM4Cw
         eRrtlcp7CQPAruZ3mtuNeYUnTKqUCFYrJukh0iePISGT5aABzl+OYiNWHocBnFayd0vU
         A3NQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSLg7ntKaOGaSVcBQ+w8+T5ckG9FIMfeYP0x4HUmh2YJXaVT1gmaEkOLL1Xb8iLD08O3paiSmXv05vdatFtg==@lists.linux.dev
X-Gm-Message-State: AFuF++lQ3iUQ3mUewmmhg5xkeTbt7yk5bfdbJuidsUhbrzDYofvO3oZy
	ozezuj1Eb2jjkJtMwxK5GARGxIH1iJwn28zHZvyiDCsTKFae1mE1re497ooJRQ==
X-Gm-Gg: AYBFou28jNdUTHKuW/+ObH0+I2glzdFYiGsUMpOfuBXiPjuvUYlfDQA6uOLVwEAjZyv
	DtSbx0Zt5T6FyQ1i4lAyAPEcGGkVNSp8DLNWT0anwJ4No1X4qpkh15JsHu7OnhB8pTCMPkiV7cf
	Ju3F3a+B/u2lJ/ExdNGtceUWaqMioKA9EYcmitP30gpl3p4af0EzgjjTLEFbFxa2SECL9UDDH49
	HowbBRsJrOGu4oRnp/aBsyCIVNx1iBVLEjuGjKwAI50askJ6UcyeXSZCrWpO8Ho49ceNAw37rgU
	aTHuQXcTkOKB/0QslCysiSfkKooX+A7MI4oVqc10DvF+VRhQNTd7whQCjMaui70znKOOoKkvCSs
	Xvf2ZepISVgMdMkeQK6fHuNoVwSve3Szrlh6F3hppXYtjCIXcESMlHTRzg1oly6Y4Lt/PkZd1I/
	mCqzP4SDP5ViDS6g3rSpXHVOfXpPPo+EZUNavQQ4VPtyMm3E6BpOz2PajXBgtflcg=
X-Received: by 2002:a05:690e:438e:b0:66f:afc0:e2f with SMTP id 956f58d0204a3-66fc1ad4678mr410526d50.8.1788536163812;
        Fri, 04 Sep 2026 08:36:03 -0700 (PDT)
Received: from [10.138.10.6] ([185.98.168.14])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb4914af4sm2485385d50.13.2026.09.04.08.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:36:01 -0700 (PDT)
Message-ID: <a5d79e14-0064-4941-9891-c71a9660cf5a@gmail.com>
Date: Fri, 4 Sep 2026 11:35:46 -0400
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] virtio-gpu: add flag to negotiate always passing
 ctx_id to RESOURCE_CREATE_BLOB
To: Val Packett <val@invisiblethingslab.com>, virtio-comment@lists.linux.dev
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 Sergio Lopez <slp@redhat.com>, Parav Pandit <parav@nvidia.com>,
 dmitry.osipenko@collabora.com, mst@redhat.com,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Alyssa Ross <hi@alyssa.is>
References: <20260903021442.423274-1-val@invisiblethingslab.com>
 <20260903021442.423274-3-val@invisiblethingslab.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260903021442.423274-3-val@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0wIDeXHI8YAIrcmSG4Fqrz6p"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0wIDeXHI8YAIrcmSG4Fqrz6p
Content-Type: multipart/mixed; boundary="------------osB5P0GLBXTNhZK4ckdIweiB";
 protected-headers="v1"; hp="clear"
Message-ID: <a5d79e14-0064-4941-9891-c71a9660cf5a@gmail.com>
Date: Fri, 4 Sep 2026 11:35:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] virtio-gpu: add flag to negotiate always passing
 ctx_id to RESOURCE_CREATE_BLOB
To: Val Packett <val@invisiblethingslab.com>, virtio-comment@lists.linux.dev
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 Sergio Lopez <slp@redhat.com>, Parav Pandit <parav@nvidia.com>,
 dmitry.osipenko@collabora.com, mst@redhat.com,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Alyssa Ross <hi@alyssa.is>
References: <20260903021442.423274-1-val@invisiblethingslab.com>
 <20260903021442.423274-3-val@invisiblethingslab.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260903021442.423274-3-val@invisiblethingslab.com>

--------------osB5P0GLBXTNhZK4ckdIweiB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9/2/26 22:14, Val Packett wrote:
> virtio-gpu device backends typically use ctx_id to route commands to
> different modules that implement distinct context types, e.g.
> virglrenderer vs. cross-domain. Each module may require the blob
> resources intented to use with it to be allocated through it as well.
>=20
> Currently, this happens for host-only and default blobs which are
> allocated from a context-specific local blob_id (e.g. an image
> requirements blob in cross-domain). For guest-only resources however,
> existing software (both the Linux kernel and the rutabaga-gfx library
> used by device backends to implement virtio-gpu) allocates those with
> ctx_id =3D=3D 0, which might be a different "default" context type from=
 the
> one the resource is intended to be used with, e.g. when both
> virglrenderer and cross-domain are present, the socket buffers used by
> cross-domain were processed by virglrenderer which happens to work
> but does not actually make sense.
>=20
> Additionally we would like to support PRIME imported resources (udmabuf=
s
> or dGPU passthrough dma-bufs) being passed over cross-domain with the
> CREATE_GUEST_HANDLE feature, which due to API constraints must also
> perform the creation of a guest-only blob resource with ctx_id but
> without blob_id.
>=20
> Unfortunately changing this without breaking backwards compatibility
> requires a flag to negotiate the use of the "fixed" convention. Otherwi=
se
> new guest kernel + old rutabaga would result in the command failing due=

> to old rutabaga not expecting guest resources to be allocated w/ ctx_id=
=2E
>=20
> Signed-off-by: Val Packett <val@invisiblethingslab.com>
> ---
>  device-types/gpu/description.tex | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/device-types/gpu/description.tex b/device-types/gpu/descri=
ption.tex
> index 64e8c4ddecc5..c0ff3f34ec1c 100644
> --- a/device-types/gpu/description.tex
> +++ b/device-types/gpu/description.tex
> @@ -42,6 +42,9 @@ \subsection{Feature bits}\label{sec:Device Types / GP=
U Device / Feature bits}
>  \item[VIRTIO_GPU_F_CREATE_GUEST_HANDLE (6)] guest-only blob resources
>    may be created with the VIRTIO_GPU_BLOB_FLAG_CREATE_GUEST_HANDLE fla=
g.
>    Requires VIRTIO_GPU_F_RESOURCE_BLOB.
> +\item[VIRTIO_GPU_F_BLOB_CTX_ID_FIX (7)] it is always safe to pass the
> +  current context ID to VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB,
> +  including for guest-only blobs.
>  \end{description}
> =20
>  \subsection{Device configuration layout}\label{sec:Device Types / GPU =
Device / Device configuration layout}
> @@ -673,6 +676,12 @@ \subsubsection{Device Operation: controlq}\label{s=
ec:Device Types / GPU Device /
>  identified by the \field{blob_id}. The actual allocation is done via
>  VIRTIO_GPU_CMD_SUBMIT_3D.
> =20
> +If VIRTIO_GPU_F_BLOB_CTX_ID_FIX has been negotiated, the \field{ctx_id=
} of
> +the \field{hdr} MUST always be filled in with the ID of the default re=
ndering
> +context associated with the current handle, if one exists. Otherwise, =
it MUST
> +only be filled when the \field{blob_id} has been filled to create a re=
source
> +from a rendering context local object.
> +
>  The driver MUST inform the device if the blob resource is used for
>  memory access, sharing between driver instances and/or sharing with
>  other devices. This is done via the \field{blob_flags} field.

Should VIRTIO_GPU_F_CREATE_GUEST_HANDLE require VIRTIO_GPU_F_BLOB_CTX_ID_=
FIX?
That could simplify drivers.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------osB5P0GLBXTNhZK4ckdIweiB--

--------------0wIDeXHI8YAIrcmSG4Fqrz6p
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmqa5V0ACgkQszaHOrMp
8lPMhw//WYdso0KeR1hyRyDYtpDhmU2+uqORRrqE7O0Xc27tnDxmUZCvjrZL3uUi
jIEueIfneMQuem02OFg6nvgGvssahQEavRjkVCjlxB7rpIQTKku0fgsdNRKWgNGI
GRCH7avOMNoHw4PNG2CS8/1pXdcG94HXNOLQMGIy+WhQRI1amNcRXbSwzNs+CxzY
rIBf1ooP5RY4g2UDLTDng0lLeKG6eTKFKFoGy4ZERsPX83Bo3Afr7BwvSfKI4MPe
vQhbnD5sxiIivcIlVyTXK8qIo46ixUprV5PCw2J83+1BGhhrBfCtKsdAUV9TKR83
E7JOU0c5H/Qz+3rqEW3nwMg//GkIjKftub+fWUmgfv7tfhF0tvEc/HNH8+zzYxc7
ts8ZUZ0HmPVIjuyhtyYcQ6jxpqqWJUXN9HWEgQnTnigfSjvkBWCEYDTrVXhM/B40
BO7L2XFetoQQOno9kTsxmcNFg6PsVJK7+/RHTCreTI2TJoGOlDEok2Nq+W4kdzhc
7GVzSpSyCpSI0SkkcpuXJO0LPoptBL1rfzY/8nh0dlRdch57Nr96CDkH33eD76Fe
OypBgzewnxfN5yqtBj5433nZnGX9OVC+k9n90zeeFV1pY/N27pYD6wqprLo2e5pC
+MYzBJTB2xlbi8zuZx1EN1eibm6P37VnEjcRBih6Uok12RA5hvA=
=kh9x
-----END PGP SIGNATURE-----

--------------0wIDeXHI8YAIrcmSG4Fqrz6p--
