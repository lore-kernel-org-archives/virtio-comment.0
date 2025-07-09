Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249544A32
	for <virtio-comment@lists.linux.dev>; Wed,  9 Jul 2025 17:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752082026; cv=none; b=ci0orTCaTXQ7Gb2dfqpanYV46cg4rNAm7YCZS8KVc5RtO7+9Zx/oPuScRtn9V0T1KuJK9MpyqLTQaCA+YyOZzBjEylVR9jFnP7+tiftOAKYJrfXG4nmGbJOKQhJa2IFbM7V2Q07KQu2UDxefYBuDmmUEgc7y24pcQMR9nnAvT8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752082026; c=relaxed/simple;
	bh=O4IAGqn0GsG1ZJNjsvOSxDlO9c5NymW60XKxGj5ui+U=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=jxk63TTH+J7o7diTA2+dTVf8g2zaEAW1UKomifiYtZ6gxRYoMG4FI40h94xBMSey+E872RU0Ep5dG8JpdqffPTgadr59zkgfu7zh6Q9j2BVn08reXn42XF+S5pH904CBa8pnAble08q/rQr3EU6itGugf2EYq6bT9IYZuz+GFbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5rnbWX0; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5rnbWX0"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d45f5fde50so11850385a.2
        for <virtio-comment@lists.linux.dev>; Wed, 09 Jul 2025 10:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082024; x=1752686824; darn=lists.linux.dev;
        h=in-reply-to:subject:autocrypt:from:content-language:references:cc
         :to:user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AzsnB6bwTHu5FJNanxsecRuyTXu/fsNJIJIiT4DAvo=;
        b=b5rnbWX0QhNIhH0F43nNoOWa2Yg+JBJmwOPf+cptcrigC48q3MyC+bUmeQzG6UHkws
         OENFhtp6fvlyNPj9DvwcgSLWr7vEQbU5Brjzl0Qh3hklCaEtnV09vVAVr1bmUIR2S0C1
         p9/BTYGVszLAgQr8BwRL0XS4bvVyUkRT89wImg7od9g/mBr0EtKbJ+jMCa/ZXah7CdTU
         5yA0aWBizK6CKTJsCyS8pwdI6YIoJz1rv/WXvTGfvaTI9bhsIZBd47X7vyVJZRCrLH2q
         wVz8kHdyOOqhrinSHvQEipT0fkLF0lVFCyMcps/Sv3mWh54fVCSy08x2OFMVGxGxxjiT
         KBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082024; x=1752686824;
        h=in-reply-to:subject:autocrypt:from:content-language:references:cc
         :to:user-agent:mime-version:date:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2AzsnB6bwTHu5FJNanxsecRuyTXu/fsNJIJIiT4DAvo=;
        b=uKAkClIs1I++hyFf0Knm7nrh2kEV7C/YfAIjXdXPjVBnzQ/i8Rayfhnd/GVOpsFlYL
         YvO5JPs66X8g7Ykjv0kkEKFNxZDMJihKDnZdLVwjPXcIeSu1B9Hh4gYc6ObUPw5p/3Ky
         DagjCuD9n0VaxGhYh1ZEil7SCCs3Gl3cgGQHiKDAt0N2qEd/QOEwBK2FRY6CySifMTWv
         iC60oPIHlD8OZlL11Pnkx/EDUprfIRPQ3oZqn79vaBllMueCXxXfiDv2zoGFhZ6WSCu/
         yhkXhsUY6KU7Vz9WYlwNH+H8XcxlkHHoRouAx5H6BBY8hp083b/9W3ajPOCSO/jNBwkN
         XhXg==
X-Forwarded-Encrypted: i=1; AJvYcCXiTG9DZ1NrMmYZ50bKkoOQdliA6Ho5ZHlTsPHZmirZ4GqeovSCbmLUmwuqXiW4CYFyD6FKoDqhJ2didJFi1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgHAurXEA0y+mGbDFpHp8R1vXuwnXMchwtIgT9WPTI4M/5jYut
	Hxmo+uSU41BvWiiiK59FQF1dQ9zGFhtEK/EaKDptlVJ054bXVpRQo4sV
X-Gm-Gg: ASbGncuG8GuDWezU8FDnHbFkozbpKCnRtYgfCMV37imy/rE9KVVwE+fm37blhwqbLlY
	YUragRxUHCBXY+1F42zNOg7o/UtZfG8q5+Jn5QgJXI9+BjaMlXCSd22ToRMjdnek5zM4J0CpE/u
	z3SOY7FkcqfFkZEbuG45NN6w6HylumxEih1dVXUz/6c/ltCu3K8pGDldSLM/C364+s9VRTso9Lb
	yMNY/AEtUScX4jCPxpc2z7dVt3cLXgaNgPIq03HEaHmXbxi5xtIKdW2rCF4BenrcMM1zgC1aPg6
	r60ni10BriT3qq1k/18jVsEqiw2uQSqjF9KiyjzV+z1SHdb6oQ9zMGC6SlgYAqR6gL0=
X-Google-Smtp-Source: AGHT+IGZU3cavOBT0K41LsntsmOcqxRbdQ78aCboPnoF3sg+rvsYyuSOByMCasrnHHjIAP4qgOA8Gg==
X-Received: by 2002:a05:620a:1912:b0:7d6:f963:8764 with SMTP id af79cd13be357-7db7cead945mr491085785a.34.1752082022802;
        Wed, 09 Jul 2025 10:27:02 -0700 (PDT)
Received: from [10.138.10.6] ([89.187.178.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbd94242sm973102485a.9.2025.07.09.10.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 10:27:01 -0700 (PDT)
Message-ID: <f6dc2d4d-89d9-4721-9c67-a214025cb3c3@gmail.com>
Date: Wed, 9 Jul 2025 13:26:46 -0400
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Albert Esteve <aesteve@redhat.com>, virtio-comment@lists.linux.dev
Cc: ribalda@google.com, alex.bennee@linaro.org, adelva@google.com,
 cohuck@redhat.com, mvaralar@redhat.com, hverkuil@xs4all.nl,
 gurchetansingh@google.com, daniel.almeida@collabora.com,
 changyeon@google.com, acourbot@google.com, mst@redhat.com,
 eballetb@redhat.com, agordeev@qti.qualcomm.com, gnurou@gmail.com,
 dverkamp@chromium.org, nicolas.dufresne@collabora.com,
 Spectrum OS Development <devel@spectrum-os.org>, Alyssa Ross <hi@alyssa.is>
References: <20250709093456.350242-1-aesteve@redhat.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
Subject: Re: [PATCH v9 0/1] virtio-media: Add device specification
In-Reply-To: <20250709093456.350242-1-aesteve@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------j3dFF0pDGSujDU7r7y7nlKh5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------j3dFF0pDGSujDU7r7y7nlKh5
Content-Type: multipart/mixed; boundary="------------0Eej9hAE802OEAIVDazl0XVU";
 protected-headers="v1"
From: Demi Marie Obenour <demiobenour@gmail.com>
To: Albert Esteve <aesteve@redhat.com>, virtio-comment@lists.linux.dev
Cc: ribalda@google.com, alex.bennee@linaro.org, adelva@google.com,
 cohuck@redhat.com, mvaralar@redhat.com, hverkuil@xs4all.nl,
 gurchetansingh@google.com, daniel.almeida@collabora.com,
 changyeon@google.com, acourbot@google.com, mst@redhat.com,
 eballetb@redhat.com, agordeev@qti.qualcomm.com, gnurou@gmail.com,
 dverkamp@chromium.org, nicolas.dufresne@collabora.com,
 Spectrum OS Development <devel@spectrum-os.org>, Alyssa Ross <hi@alyssa.is>
Message-ID: <f6dc2d4d-89d9-4721-9c67-a214025cb3c3@gmail.com>
Subject: Re: [PATCH v9 0/1] virtio-media: Add device specification
References: <20250709093456.350242-1-aesteve@redhat.com>
In-Reply-To: <20250709093456.350242-1-aesteve@redhat.com>

--------------0Eej9hAE802OEAIVDazl0XVU
Content-Type: multipart/mixed; boundary="------------6lOFTHgZt06OIO9YIohcqhwz"

--------------6lOFTHgZt06OIO9YIohcqhwz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7/9/25 05:34, Albert Esteve wrote:
> New attempt of including virtio-media
> device specification.
>=20
> v8->v9:
> - Rebased to virtio-1.4
>=20
> v7->v8:
> - Merged DQBUF and DQEVENT into the same
>   item for unsupported ioctls
> - Rewrote/clarified a couple paragraphs
>   based on previous version reviews.
>=20
> Virtio-media came from a discussion on virtio-dev
> mailing list, which lead to Alex Courbot presenting
> virtio-v4l2[1] specification as an alternative to
> virtio-video.
>=20
> Later, virtio-v4l2 was renamed to virtio-media[2]
> and published at:
>=20
> https://github.com/chromeos/virtio-media
>=20
> The repository above includes a virtio-media driver able
> to pass v4l2-compliance when proxying the vivid/vicodec
> virtual devices or an actual UVC camera using the
> V4L2 vhost device (available in the repository).
> It also includes a FFmpeg-based video encoder
> device. Steps to reproduce are also detailed[3].
>=20
> Recently, virtio-media has landed in AOSP[4].
> Also the driver patch has been sent to the
> kernel, currently in its v2 [5].
>=20
> Furthermore, virtio-media got a proposal to reserve
> device ID 48, which was finally approved for
> inclusion in v1.4.
>=20
> There is some overlap with virtio-video in regards
> to which devices it can handle. However, they take
> different approaches, potentially making them
> the preferable choice for different scenarios.
> Furthermore, virtio-media has matured since it
> was first presented, and there are public efforts
> to have upstream driver and devices.
>=20
> But mainly, given that virtio-media will be the virtualization
> solution for media devices for ChromeOS, Android, and
> possibly others, I think is important that it gets
> standardized and included in the specification,
> despite the aforementioned overlap.
>=20
> Full PDF: https://drive.google.com/file/d/1sDZXWVlvPbHKKguhekCXMzkpNZZ0=
g3hV/view?usp=3Dsharing
> PDF with the media section only: https://drive.google.com/file/d/1JjOIz=
ecnkFFlpFBRjPQEUyAOD3BDHAdw/view?usp=3Dsharing
>=20
> [1] https://mail.google.com/mail/u/0?ui=3D2&ik=3D73ebd65ebd&attid=3D0.1=
&permmsgid=3Dmsg-f:1767388565327924962&th=3D1887068940754ee2&view=3Datt&d=
isp=3Dinline&realattid=3Df_libalimc0
> [2] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg126=
65.html
> [3] https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md
> [4] https://cs.android.com/android/platform/superproject/main/+/main:ex=
ternal/virtio-media/
> [5] https://lore.kernel.org/lkml/20250201-virtio-media-v2-1-ac840681452=
d@gmail.com/T/
>=20
> Albert Esteve (1):
>   virtio-media: Add virtio media device specification
>=20
>  conformance.tex                           |   6 +
>  content.tex                               |   1 +
>  device-types/media/description.tex        | 639 ++++++++++++++++++++++=

>  device-types/media/device-conformance.tex |  15 +
>  device-types/media/driver-conformance.tex |  11 +
>  5 files changed, 672 insertions(+)
>  create mode 100644 device-types/media/description.tex
>  create mode 100644 device-types/media/device-conformance.tex
>  create mode 100644 device-types/media/driver-conformance.tex

It's probably too late, but I have some serious concerns about this
device.  Specifically:

1. I don't see a reasonable way to support untrusted virtio-media
   devices.  v4l2 has too many ioctls and I can't realistically
   see a way to enforce that the return values from all of them
   are consistent with each other.  It is possible to only allow
   a fixed format (such as uncompressed ARGB) and only allow the
   video source and/or sink to provide resolutions and frame rates,
   but this means losing a lot of performance and abandoning any
   attempt at zero-copy.

   The use-case for untrusted virtio-media devices is not
   confidential computing, but rather disaggregated systems where
   video sources (like webcams) may be attached to untrusted virtual
   machines.

2. v4l2 is a chatty protocol and using it implies a lot of
   guest <=3D> host round-trips.  This is bad for performance.
   Is this overhead actually significant, and if so, are there
   plans to reduce it?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------6lOFTHgZt06OIO9YIohcqhwz
Content-Type: application/pgp-keys; name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49y
B+l2nipdaq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYf
bWpr/si88QKgyGSVZ7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/
UorR+FaSuVwT7rqzGrTlscnTDlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7M
MPCJwI8JpPlBedRpe9tfVyfu3euTPLPxwcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9H
zx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR6h3nBc3eyuZ+q62HS1pJ5EvU
T1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl5FMWo8TCniHynNXs
BtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2Bkg1b//r
6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nS
m9BBff0Nm0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQAB
zTxEZW1pIE9iZW5vdXIgKElUTCBFbWFpbCBLZXkpIDxhdGhlbmFAaW52aXNpYmxl
dGhpbmdzbGFiLmNvbT7CwY4EEwEIADgWIQR2h02fEza6IlkHHHGyiLVf/5wiwQUC
X6YJvQIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCyiLVf/5wiwWRhD/0Y
R+YYC5Kduv/2LBgQJIygMsFiRHbR4+tWXuTFqgrxxFSlMktZ6gQrQCWe38WnOXkB
oY6n/5lSJdfnuGd2UagZ/9dkaGMUkqt+5WshLFly4BnP7pSsWReKgMP7etRTwn3S
zk1OwFx2lzY1EnnconPLfPBc6rWG2moA6l0WX+3WNR1B1ndqpl2hPSjT2jUCBWDV
rGOUSX7r5f1WgtBeNYnEXPBCUUM51pFGESmfHIXQrqFDA7nBNiIVFDJTmQzuEqIy
Jl67pKNgooij5mKzRhFKHfjLRAH4mmWZlB9UjDStAfFBAoDFHwd1HL5VQCNQdqEc
/9lZDApqWuCPadZN+pGouqLysesIYsNxUhJ7dtWOWHl0vs7/3qkWmWun/2uOJMQh
ra2u8nA9g91FbOobWqjrDd6x3ZJoGQf4zLqjmn/P514gb697788e573WN/MpQ5XI
Fl7aM2d6/GJiq6LC9T2gSUW4rbPBiqOCeiUx7Kd/sVm41p9TOA7fEG4bYddCfDsN
xaQJH6VRK3NOuBUGeL+iQEVF5Xs6Yp+U+jwvv2M5Lel3EqAYo5xXTx4ls0xaxDCu
fudcAh8CMMqx3fguSb7Mi31WlnZpk0fDuWQVNKyDP7lYpwc4nCCGNKCj622ZSocH
AcQmX28L8pJdLYacv9pU3jPy4fHcQYvmTavTqowGnM08RGVtaSBNYXJpZSBPYmVu
b3VyIChsb3ZlciBvZiBjb2RpbmcpIDxkZW1pb2Jlbm91ckBnbWFpbC5jb20+wsF4
BBMBAgAiBQJafgNKAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCyiLVf
/5wiwYa/EACv8a2+MMou9cSCNoZBQaU+fTmyzft9hUE+0d5W2UY1RY3OsjFIzm9R
/4SVccfsqOYLEo+S0vQMIIIqFEq3FCpXXwPzyimotps05VA8U3Bd7yseojFygOgK
sAMOAee2RCaDDOnoJue01dfZMzzHPO/TVdp3OvnpWipfv5G1Xg96rwbhMLE3tg6N
xwAHa31Bv4/Xq8CJOoIWvx6fcmZQpz01/lSvsYn0KrfEbTKkuUf0vM9JrCTCP2oz
VNN5BYzqaq2M4r+jmSyeXLim922VOWqGkUEQ85BSEemqrRS06IU6NtEMsF8EWt/b
hWjk/9GDKTcnpdJHTrMxTspExBiNrvpI2t+YPU5B/dJJAUxvmhFrbSIbdB8umBZs
I3AMYrEmpAbh5x7jEjoskUC7uN3o9vpg1oCLS2ePDLtAtyBtbHnkA4xGD7ar8mem
xpH9lY/i+sC6CyyIUWcUDnnagKyJP0m9ks0GLsTeOCA0bft2XA6rD6aaCnMUsndT
ctrab42CV5XypjmC4U1rPJ8JQJUh1/3P48/8sMH+3krxpJ06KNWNFaUbaMTGiltZ
7x9DngklSYrX0T+2G4kVXNmjaljwkoLahwLla2gUWwBSyofXdqyhQdwZsp01KXNQ
UCyT/Pg+aDcm/E7OMV3d4lf7g/CSxiX2GSEe6BlhSz+Lmd7ZJ3g32M1ARGVtaSBN
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
EtJuZYM5blWncBOJCoWMnBEcTEo/viU3GgcVRw=3D=3D
=3Dx94R
-----END PGP PUBLIC KEY BLOCK-----

--------------6lOFTHgZt06OIO9YIohcqhwz--

--------------0Eej9hAE802OEAIVDazl0XVU--

--------------j3dFF0pDGSujDU7r7y7nlKh5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmhupl4ACgkQszaHOrMp
8lP4eg//TpyZ5geAb4Qr3trJ5GgcWUpaPzmLCVnKX6QMkG/wjOjYcYOn7zDVB0pe
YDm016tNjsbE43KgZOoinuxfbn2sJE5027oUY8CsXmb/1qD6T8Q9LGBm+grvYorZ
9I4Z0I97RhM7IS/dBs2beH5oMohTvYWlSf9E6RuqNauFuPw6jP3TyiTuj4lgUUM6
kD+P5DgL4av8P0hSpT5fdvs+VfAIm9uQdYM64F++UUTGCg69qm3WfIbhoEf1SVDu
U5UwtrlROOyA7970YG2b2kZE3Zc/abqHQupsU7o+EPbFnDScyQrhSuua+4hytS2+
xx/aEhSTbTrCuT7XC+0NZrNIqm29YxnPeHqC3BX5v47XHNdv7TNCvO7i0GvkMYVn
Gs9SN/JGU/QxQGozYVMkBqGKljmXJYEwH6BxMD/k/zVibjeQSDNOmICSuXGcaw6w
B/D7IL4f/jGVZgue8v5+z0eREGQwbI/ywWXhfagNrS2xQFTmUK54l/QHapK3+r9t
nTSprhfxiKIa7zLGdgGzsranNKtjbhpZz9SaontRS5tCRt70OpufK+L4sANflNlX
K674Z9AlQTpIFW26WbEyNkHVebhK6SdmhUmGQBSeQ8NKto6LOrl5wlWOLHM1GWWv
pMHvUIB1TnPjj1fCsK1wmNmYJgozQKA301SoSIhWolwlGUw+OdU=
=21m9
-----END PGP SIGNATURE-----

--------------j3dFF0pDGSujDU7r7y7nlKh5--
