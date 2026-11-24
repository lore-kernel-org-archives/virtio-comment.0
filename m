Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560274;
	b=I9EadhBM9mn2TQdQxhgU+l5wF2pHbHKaR5G3C3jkpBaLxV88J+qbi+rNNYY6P7iHcQtJ
	 DwRILRxvFrRy63ufte+T2PpAYnXVevgAa8QzkmPcMsc+VSBggm6cwl4S7pSbACRQaUflW
	 pqudx8LgY4aEpvTHxBQ3GQaislnQRBgeWH2MV2wbRno7T8rjmy+wGsS5SLJo4wlNWPCCl
	 SPEaU6Mq/yc3SvanHpJUz0T7IkiceNRd5LJYAQ2FrP9k8EXY4c9bZBID1bxwZy/pnppQv
	 GXkXhnY3ba7tulBTJZTt12vls0Hv6jECWDbatm6NxILQQLjo4E99FR5keI4n18532cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=eMzLwEbt5QiM6Sf6l3/F1Rtypkv9rMtdlMOhtdnWT3M=;
	b=16wbSTSc4GHEqlpoxnEz5m/b9LaRwyiAzJEQxCB7JLJRIlRz1qjuz+zNqRVk6FFBjOcw
	 r4NrWhfuCOWCdqbzejBjuFmrBX+xLImJdzdralCe0p+BiLF6h94vduL+Ewh1Vb6/x0kqL
	 6F80lHMUCgSYhr1tWQczR+RNWs/KbM1eGmqym2kGGEkC0O5Nzt9JhW483NL3JNSGfpArj
	 qBAn/GGvDWR8qc3fc+60ytXiZS/KkJRIq7RoPpC1nzekcauQp/xlk86bJVnQjyRdPe96c
	 RAv6+LSWPfc+cKtAzhqBvSX7X5c89FpJ9YCLdwvVVTnnfixV/wGH6lYBz0dB6PA77UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FbPHODlP;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB05606A31E
	for <virtio-comment@lists.linux.dev>; Tue, 24 Nov 2026 22:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBB05606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FbPHODlP
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4d07494b0so61639297b3.0
        for <virtio-comment@lists.linux.dev>; Tue, 24 Nov 2026 14:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560273; x=1796165073; darn=lists.linux.dev;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eMzLwEbt5QiM6Sf6l3/F1Rtypkv9rMtdlMOhtdnWT3M=;
        b=FbPHODlP8NLtVhO2OLkyOOv3GqdleNPVp1Iu2AFMtjAtvf+n5J+awcq1RPk2nxNjEO
         yKRGChPRzVZ1dHfUo60/eXP5RQeQH++Jf0GEgmoApuPrgOB9E3qGOh4JZCRBIS4j5RCm
         tTP2+NNDL8UGWkYhjFPegnTxiZUbe8R5jXIUYmc3S3HcGlppuu8MRzCPDuRBJfv769vZ
         6t42b23q1tq+RrnOPRMI3yszsY5/ifA2QACM/qhJ7AQ//Eis/hiXD6Yr5QnVW6bXWepZ
         Um9CFE/S7Mx8JrwqTORaTirLab3nWdntwTKTu345cv75/EwEhhJ3rE3RuPmpsh64nIE4
         Mn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560273; x=1796165073;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMzLwEbt5QiM6Sf6l3/F1Rtypkv9rMtdlMOhtdnWT3M=;
        b=qmqGIk0Z5g2Wrci++/a5zjt+47Mb3onfnvX0D5DODst1ueCXh399MV/z+FCZ6XBVlr
         AzkVyWeHLA5AFPkRR2AGFGFili9ZHnwkJHIkdG/m1uIxvrcqCIHv4E+vsqK2/M5nKl0a
         XiVxyoPNkKlOSGAom4skSt3Zcubg1mEPp1OzelKpqCPmdRZLIEV1duiQBND5ksRKc6zl
         CymsYpWNRttqUMFpp/VjmwA6q3B/HHldzo3IXKdX47Rugz0GqLB0CwUjSWOxeVY3+2lx
         aj9C3pD3LnjjGRMUuhvn9FUCeK2iB8ZEASC5M1HCpFWM7W4cDnYZU8LZgs09aEBeWf05
         qFiA==
X-Forwarded-Encrypted: i=1; AL+hErHUVjMGIQsW2f2mXOq4bx84eKrNzu0Icgt4YKpSPFXfoaC28WjpgjMYXyCm+xgvsRHqzP7GJhdTZtxNfiLRww==@lists.linux.dev
X-Gm-Message-State: APuU4Z8hTmd43dmrZZEDJYrWLRaKn44GkXHfZrkT6V2TfGWE9Es+7oXq
	52PMhR08bUWD+FM/+HPNXhq9aAnaopHCwHJTBwDTqZYVSqR/o1zIFbtm
X-Gm-Gg: AZFdTZfH7IdbfpZta1wBgmMN6DHnmslFlbGgDiZHzMU1uSGK+BRHuhdoUK59gE7NXSB
	3CxGOAt7oCQ9tdcD/1qtJr6hbacOk3GczBEPxYn3opc8reutlg/1TgHP8f1ayDul+RrUUIWqMGE
	m4KF2uZTDeARvQqVd4RUiN5ApPi2PEdL9p29U2gvMzg+6Eiyjw+BtAhBkTfkz+4719UbKOlAP5P
	tXOXEvmqNPEV0b97PrmIetSd2EIdNFPm/UzulN78zyiOvYKgoUsnA9rzg8vZc0ofJ5K9XhdIWUq
	Qo6OPhRiyvYzG2z7FMnFYhKwUFegODO96er2zkboPRsmieV+/qVf0c99wJT/hCynwWNWU78bCpK
	f0BJiIZqWx4L6U3+Irbqa1HTD300/RoOVyUrzzxlP3683tLBcpuBBaeTe+J5Oe+L4B+aEL1HIaG
	ixYGJN3QambDoMgkbVJz9cGfrvsvkC+Au64I3yPcRwLWw50QOd+f+R1ZmYHMvUUzkr21nvacY9+
	mtJF7YF8+TbupycukNG2FKEa3EoIvNpcRc5iloOBEZqNgbULV9FTmAOPY+ou9XpLLBgSvSW1XKE
	3U1D33S2jq2LRH3fHw9qAGmsALbsYPZOug==
X-Received: by 2002:a05:690c:d1e:b0:8b0:a30a:7f31 with SMTP id 00721157ae682-8b5204efc58mr62797457b3.29.1795560272621;
        Tue, 24 Nov 2026 14:44:32 -0800 (PST)
Received: from [10.138.10.6] ([149.102.242.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201b8cdbsm63970117b3.1.2026.11.24.14.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 14:44:31 -0800 (PST)
Message-ID: <a1f26459-fc0e-4a7f-b72e-244efbe276c4@gmail.com>
Date: Tue, 24 Nov 2026 17:44:27 -0500
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] virtio-gpu: add F_BLOB_GUEST_SHAREABLE (ex
 CREATE_GUEST_HANDLE) and F_BLOB_CTX_ID_FIX
To: Val Packett <val@invisiblethingslab.com>, virtio-comment@lists.linux.dev
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 Sergio Lopez <slp@redhat.com>, Parav Pandit <parav@nvidia.com>,
 dmitry.osipenko@collabora.com, mst@redhat.com,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Alyssa Ross <hi@alyssa.is>
References: <20261124211931.809982-1-val@invisiblethingslab.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20261124211931.809982-1-val@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dtXzCcUHDfxFOF5hZB7Bf6b8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dtXzCcUHDfxFOF5hZB7Bf6b8
Content-Type: multipart/mixed; boundary="------------jBeP62K4N3j7yHmie7acSnH2";
 protected-headers="v1"; hp="clear"
Message-ID: <a1f26459-fc0e-4a7f-b72e-244efbe276c4@gmail.com>
Date: Tue, 24 Nov 2026 17:44:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] virtio-gpu: add F_BLOB_GUEST_SHAREABLE (ex
 CREATE_GUEST_HANDLE) and F_BLOB_CTX_ID_FIX
To: Val Packett <val@invisiblethingslab.com>, virtio-comment@lists.linux.dev
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 Sergio Lopez <slp@redhat.com>, Parav Pandit <parav@nvidia.com>,
 dmitry.osipenko@collabora.com, mst@redhat.com,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Alyssa Ross <hi@alyssa.is>
References: <20261124211931.809982-1-val@invisiblethingslab.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20261124211931.809982-1-val@invisiblethingslab.com>

--------------jBeP62K4N3j7yHmie7acSnH2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/24/26 4:19 PM, Val Packett wrote:
> Hi,
>=20
> I've been working on actually implementing the "lost" CREATE_GUEST_HAND=
LE
> feature which allows guest-only blobs to be shareable, particularly ena=
bling
> PRIME-imported (from udmabuf or passthru dGPUs) buffers to be shared wi=
th
> the host Wayland compositor when using the cross-domain context type.
>=20
> This version renames the feature from F_CREATE_GUEST_HANDLE (which was =
too
> host/implementation-centric really) to F_BLOB_GUEST_SHAREABLE, and remo=
ves
> the new blob creation flag in favor of reusing the existing one,
> VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE. While here, I documented all three
> existing flags properly, including which kinds of resources they work w=
ith.
>=20
> It seems correct to me to reuse the SHAREABLE flag because the semantic=
s are
> the same. Sharing between virtio-gpu contexts *is* what the guest relie=
s on
> to instruct the host to effectively share across host processes!
>=20
> The flag has *not* been used with guest-only blobs when 3d contexts are=

> present before. The Linux driver did set the SHAREABLE flag in PRIME im=
port
> code, but PRIME import was restricted to devices that did *NOT* support=

> 3d contexts at all. In Mesa, the use of SHAREABLE corresponds to "being=
 able
> to DMA-BUF export" (non-empty VkExternalMemoryHandleTypeFlags for Venus=
,
> !RADEON_FLAG_NO_INTERPROCESS_SHARING for amdgpu). These are all exactly=

> the semantics that match the cross-process/dma-buf kind of shareability=

> on the host side.
>=20
>=20
> Also addressed feedback: now BLOB_GUEST_SHAREABLE depends on BLOB_CTX_I=
D_FIX
> (therefore BLOB_CTX_ID_FIX is introduced first); s/rendering context/co=
ntext/.
>=20
> Hopefully third time's the charm :)
>=20
>=20
> v2: https://lore.kernel.org/all/20260903021442.423274-1-val@invisibleth=
ingslab.com/
> v1 has been lost to the moderation queue.
>=20
>=20
> Thanks,
> ~val
>=20
> ---
>=20
> Val Packett (3):
>   virtio-gpu: document individual blob_flags
>   virtio-gpu: introduce BLOB_CTX_ID_FIX feature
>   virtio-gpu: introduce BLOB_GUEST_SHAREABLE feature
>=20
>  device-types/gpu/description.tex | 34 +++++++++++++++++++++++++++++++-=

>  1 file changed, 33 insertions(+), 1 deletion(-)

Looks good from what I can tell, though I'm not too familiar with this.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------jBeP62K4N3j7yHmie7acSnH2--

--------------dtXzCcUHDfxFOF5hZB7Bf6b8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmsGE0sACgkQszaHOrMp
8lNJnBAAqZL7E5HBvJRS4oXp8jclGttRVN2OOKEOB9uIVqNFp6+4JHrzhSj6vbKF
c7bUHwhYV9s9pcniTOmP8Ud98GUDog6xEJ+h8fEkjQgFx6aYDALjaK7rhLBbCT2S
wyXgNPjLwmzmdVjFrz/v7QtUZzo9xHTllXJXj+gbxJQ2bt7NZktPnt7BDxZNEIn6
TLbgXVylhOf9TDcr1CJKdMWm36hkCkrLEenOxC4LpWm0857xjCiTi27dU+fuobbb
ce3BOYTpPH+j8R1cGUNkcxOqbFdSHkVdbP8HJa1r4J3gk1TZLvZ+gGtu43oEk4ny
QDBW6em+42fEkxeMF04LMH6vK1sStP1PCl/0nOOk2tmxVwYXw4DTPAztmvGX9NzW
N9eKWocq6qKIAj/CCTucJfrfVGe6NHvGbSblZxdA6CZs0Rqir92c2T9sx5tA+Kf0
on1ZYUrD+pBELYeiz5KDo/ZuVqCQydJL8nuGQf43ItAUVjifvCogbOURG6YTCodv
oD3eXOeNAjZkr5nzxaZPnyePenUj2m6wGUNPq1vCn1Vi/xTsaNmfULA7LV5pN19l
m/7lu/U89NfUZXCw1CrV3ZPX2d4NXcrosq/e25ENw5ySNizVOcLQ7Ke4DuLAZOai
w7L4Crjf6fyz+7X7JIVAv3kGWZxR9eFWIyawten9OF2OOqDfaQE=
=GQUG
-----END PGP SIGNATURE-----

--------------dtXzCcUHDfxFOF5hZB7Bf6b8--
