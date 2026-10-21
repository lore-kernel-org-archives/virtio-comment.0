Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792610752;
	b=J4WxeKWqErp2tx+EujgO+YoXN4RnNMW1F06LqNYKZ2OoNISVOz2mzE5UJ+eEcPk2A388
	 iaAOciEb1BXTCLqRhC/QLd7PMbAgSZ2/OkhxPA/nyxAwNWJyrRjHguuxN3qPeZH3eFTQu
	 x4o/tFH9NW542Xa/dV7J4H3p7rLiKwYWGPsr9px3mvHoScio1y5qJLyG7nam3I6FOnUjl
	 zXkcqlm2EUjvxVqOgIwMxtM7ppQjulQ1tkpAGU4DF8ODGg0kjBDTLAd+z1h/yS0Kz84ku
	 J3+T2ptnW/MnD/DEDfXkKFdadnrXp7Ulc7taYvSDFE3qr5HS4yWM0Sp8+2lyDgtS8CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792610752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=0kWiySdv4xDp2tOYBtqup+0DZ5bNlRohtqkSEMYz61Q=;
	b=1cBpU2U+5FqqC9jj7RpaT3zsBlvvIDj/A8HGoEO3xFPb/GbSfl9aWENerYH/IivHEf0W
	 Lg8aJJ3R1yOmaa1eNgh/rjKnpkXS2Lt+Yg37iUNe9XKuEB004pzgU/KXhYbwsDyLoh9dk
	 IHFQzav4YTbgptKnFZi9W7MU86oOLa8taPtwdMoiwyuVMbAlWtianuZThI3cj4lQpv2ly
	 g6XyLxEYANyhCTHlAwQXHq4LxZi35yJVU/paQ7pbcEhQ4LEoa0L4jM2FPS7mr0epnU3H1
	 IWGMrlFkpClnCVVtm+YkmVVrlnuCaU0dLYTdIBMBGyApVv+WX2E5E5Mb2yM5V2lEsSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p9KQRWUV;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A9A606A31B
	for <virtio-comment@lists.linux.dev>; Wed, 21 Oct 2026 19:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69A9A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p9KQRWUV
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8726acc5eadso10711217b3.0
        for <virtio-comment@lists.linux.dev>; Wed, 21 Oct 2026 12:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792610751; x=1793215551; darn=lists.linux.dev;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0kWiySdv4xDp2tOYBtqup+0DZ5bNlRohtqkSEMYz61Q=;
        b=p9KQRWUVZe662wZosiYInhnbEv9x1MUteNTBIeyoSV0duheST3MiilRI7ojYMuLA2Q
         PKV7kBugOUkc6Gffn16F4p6vxcPxkQiGpmEpPqxpgTI5ResDB+gHZOYIEx8Bk6C8Zagp
         /V5xPqxN0ZQYkm6GRY4aU+tG4FVvvb9n340p8KxD6HHhoCqW/iaP5LHLRLBPZJKsUc9E
         6ewczVwxWUmESui0faDAyNuymgiPD0cMNpgcCAzEKDCgu++h6cgXy3RAdBvhqr3mopLW
         JvYDqRp/N03uanDRHWI9OfRoEmD92zL/37TKBHKiIfj91z8nnvbeBmlSCK48jj5FZQ15
         YFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792610751; x=1793215551;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0kWiySdv4xDp2tOYBtqup+0DZ5bNlRohtqkSEMYz61Q=;
        b=vcyAK5QdxMejRRIWMy6l87X5fVp6Wxvt/zw2KIxNK8xt1dBWKsIjekqBbx/f2S+yDu
         usDb7wl3+n08WK/5FKwubsbLBz1VnAuMwuVvS2ugFFWmtItkNHOfoJR4l4H3W74X8hK1
         nlgXX8A6lUpfXjKztwx+njGPILCxflnrg+jEUlE6iCUstAtJXQOg1fEFTGz+HLgiYuUh
         Eyfo6pghhe2010EEY4uldgn9e9Fy4gznuXM/aeqFk+SMs/VvZp8sGYW9M+XHcjouJZtK
         5FxkweDoh7B/zK2ij1bZLup67uAfkRVBnnIhFio0Dn0Ahl8oRnKZf+1eXtPEUn9cvPGL
         ckuw==
X-Forwarded-Encrypted: i=1; AKwUvBzhoM1qMwsOuL45fKo9iKZGJ6k/NIgUh7mNQsG+RF/76x0CZHzJevYi6WFs+541ROrkpWEknqNuZiStmqbfog==@lists.linux.dev
X-Gm-Message-State: AFq9FYKEpF30o3742tzH5Th2UtL/BP93G9IlVKNXuRwFAkdCN+TqagwU
	Md25oA+vY5kYQ9XQzlXXCATAR+0eCjYAk7Mg2Y9wMlL4M649AvTHYWCo
X-Gm-Gg: AYBFou2QpvYuEnFFMie/aIbz4EqQP2Q2GDysVfLWe2GPjcGddzPpnHPG87Bp7E+cKEA
	t3u2Jw7g6GR+xnPx6tRvkqpqqhsKyb5iUzzH7Bwbw5kl0OVuJ4Z9bCsW4aCeAsWzOGfnxkQY5Nm
	eoLu45/i5BnhKKyIfObdm/Zmfd+AnnX1o4jTv7cZ0An5KsHTBDWF1kFptefyz4b9+ukPRCzJ5Cd
	jeXmOFJNUunIw1QKNsZ9B2peSH5CBvruw1jk9oNrTF4uJdnfOvxk+fXeBF721ohrE5yBeP5UDET
	G1FbNpbyWXONRFPg3IiQgjNnx+18TmGsVJtEso3JTQ0Iu1driZSvoI7j2h75O2yyMZzYyKB4Wcf
	m4uRjFtfuQMeWdCAQfE07qC0bzYfqu6fbODQvVoEIf9QCEdWI6Hf7rCzPhcFWsoaosapX7qCxmF
	j8rE+O2wef7kg88zomxjpN9EQ1Q6L6J6iYhUPhp1rmonOHeskIzZSt1kwIxPcOW0qwO/nAU37Lr
	8cp3n0jl7BR31P1CdLyZhNF7d29z7MF5gk4kaJOXzqg24r4iz6oBp2HMFVT3YLG2pdI+jEDAa8o
	+K0S9g==
X-Received: by 2002:a05:690c:102:b0:8b0:a8c1:b203 with SMTP id 00721157ae682-8b133ccb1b8mr16735177b3.29.1792610751231;
        Wed, 21 Oct 2026 12:25:51 -0700 (PDT)
Received: from [10.138.10.6] ([149.102.242.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b12ff06a1esm15678837b3.5.2026.10.21.12.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 12:25:49 -0700 (PDT)
Message-ID: <d4a11a65-ebed-41c9-8482-cf0ec94dce79@gmail.com>
Date: Wed, 21 Oct 2026 15:25:31 -0400
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
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
To: Peter Hilber <peter.hilber@oss.qualcomm.com>,
 virtio-comment@lists.linux.dev
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Trilok Soni <trilok.soni@oss.qualcomm.com>
References: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qvkeDZ1Dy8jPwk47I5Z8KYaD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qvkeDZ1Dy8jPwk47I5Z8KYaD
Content-Type: multipart/mixed; boundary="------------Y3otqerTPmt7nXiLYzy0WNN0";
 protected-headers="v1"; hp="clear"
Message-ID: <d4a11a65-ebed-41c9-8482-cf0ec94dce79@gmail.com>
Date: Wed, 21 Oct 2026 15:25:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
To: Peter Hilber <peter.hilber@oss.qualcomm.com>,
 virtio-comment@lists.linux.dev
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Trilok Soni <trilok.soni@oss.qualcomm.com>
References: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>

--------------Y3otqerTPmt7nXiLYzy0WNN0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/21/26 14:00, Peter Hilber wrote:
> Reserve a device ID for QPSFI devices (Qualcomm Platform Subsystem
> Firmware Interface). QPSFI devices expose functionality across SoC
> subsystems through a common Virtio-based protocol. There are no plans t=
o
> standardize the devices.
>=20
> The Linux DCP display driver series is planned as the first user of thi=
s
> device ID:
>=20
> https://lore.kernel.org/all/20261015-jshekhar-drm-msm-dcp-v1-v1-10-48aa=
d0fe4f72@oss.qualcomm.com/
>=20
> Device ID 51 is already reserved for the Virtio HAB device:
>=20
> https://lore.kernel.org/virtio-comment/20260702140939.3535968-1-zeloren=
@qti.qualcomm.com/
>=20
> Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>
> ---
>=20
>     v2:
>    =20
>     - Rename the device from "Snapdragon device" to "QPSFI device".
>    =20
>     - Refer to DCP Linux driver patch as planned first QPSFI user.
>    =20
>     v1:
>    =20
>     - Was posted as "content: Reserve ID 52 for Snapdragon device":
>    =20
>       https://lore.kernel.org/virtio-comment/20260826115504.1955-1-pete=
r.hilber@oss.qualcomm.com/
>=20
>  content.tex | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/content.tex b/content.tex
> index 243ce2dde36b..7416939e67d3 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -805,6 +805,8 @@ \chapter{Device Types}\label{sec:Device Types}
>  \hline
>  50         &   Video encoder/decoder device \\
>  \hline
> +52         &   QPSFI device \\
> +\hline
>  \end{longtable}
> =20
>  Some of the devices above are unspecified by this document,

I think it would be best to have a single ID for vendor-specific devices.=

I believe most of the ID space has already been used, at least for virtio=
-PCI.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------Y3otqerTPmt7nXiLYzy0WNN0--

--------------qvkeDZ1Dy8jPwk47I5Z8KYaD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmrZEbgACgkQszaHOrMp
8lNqgBAAiHr2NKZdIvPLjuPDqzgfJy6Qdki5C5aWTJawoTDRmhRzoeeiQJwD0MZq
rU1R/YVVpfLOwQP9/I1aAionPVEAxFUoSuplEmQS9ZezABqNsCRpJroHyJ2HCjO5
YSy4vB/8cCo8iEXe35iVsmU+6toUn2CSff1pFs64mqT9szt3clNcH501kyjjl12v
u13f2qrn+rIrsSs1OC93ph439FAw4iw+5JulCmJqHIo3syHF+lnkpnvVYhxhugQM
/99bXhPk2HsoiBtYc87CLqvAxT8zBlMDYcfRJtyOom8EPm66ZmXq21oirZsidlZF
eCcig9Ix2Pp9LL/TVU1cIliiujFnS0zdwr6/pohvnoW6mBvRV35y3hT9DGX7xaXv
oryoVRbAqCoF4xGURf3cx98H8gb/W3K1DvSSs8aZXIX7b5oMKwT20KW/CSciwUz6
Z/hCkol0KcIvx3JiFeCIGfgzr3pCMFpm3fiFe4Ou2Kw2xpCw1MH8REXobBP7f901
Jzx8mjsp2qUWcwnjjP/GhpHH780n22NL+joTsUFPcEtO9Nm0k6E5XRffrRBaZqYc
av0KYjTSExoroeSSWPIZFF5vev+J3twSxENbGOXa2nZBKKz69qJph7HqVabuZOlS
ig7QKaC1CqDxXg0+05lFyeQk/clmZKDF7HUWrYoYkdDgLktny6Q=
=O/kM
-----END PGP SIGNATURE-----

--------------qvkeDZ1Dy8jPwk47I5Z8KYaD--
