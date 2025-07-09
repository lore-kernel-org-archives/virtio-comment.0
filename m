Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B53111A8
	for <virtio-comment@lists.linux.dev>; Wed,  9 Jul 2025 19:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752090554; cv=none; b=BOD2w9y3t/JeGSfbafsX2ABX3M8Tb5QZz5grsK/LXrtg2c3QXb28/qBNWMUlMZXCU81uUHOTOg3WjzpnqCbjbb/u4MxNvnWWdwCX5Kr5oAXvxf4OyugleqZxO6rPLZrwecIyV9hbMapTqDetyPpDbzyLfO6tq8IOoe/b8TGGTu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752090554; c=relaxed/simple;
	bh=eRSKCYQe5go9+d0B4Y3AguKTFi+J7c1wA0NmYsBFT+I=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=eLA5oiE3C1kNb1mN0Au0p0/j6G90uBWHyWUmtf2pkxVc+of8cgz3XM00aKvhxQ1J8zjI3nXpWbFKW3YrcSCx++BkDvLnh1tO27Opq781PTX4tbdlmi3ViuurKxLax+sQ0XdNio26U3Pw9VlBcmv5bxBxR6VnFAaaouC5sZMybCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/3BQivz; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/3BQivz"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e812fc35985so193528276.0
        for <virtio-comment@lists.linux.dev>; Wed, 09 Jul 2025 12:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752090552; x=1752695352; darn=lists.linux.dev;
        h=in-reply-to:subject:autocrypt:from:content-language:references:cc
         :to:user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UJDy0YlrpBQF+06QLfz+618HjibPy/YACa+iyFEzLY=;
        b=O/3BQivzFWTVQ5FyKLDYSFt+8GRtMWxjzcvubWcft0Xlm2oMKtNJOueT7XBfmqRWiQ
         9Iqf+TAvbUq0Uuvovfe16VcX8cIG4LCu86u8qCMSHRl+m7yVH9SANM9DsgfQRzrPdWXj
         Ri8K+t4/GDsiYe3UWgBtLH9mGO/5xhz6Z5LYdZjZ/gOl1EWfBZj1o84kOIKsji+LbCOU
         M24ArQcfr89WGTh4+0TAZ/TMvn6qVKGxiMWvP+E7NjSZWxDUubxNSJFxup+B7kz62CaY
         QLqu3E2Olp5iZnttl9VXokatGpWRLw7lmEnPN0EtXWHJvoUfVixABKqaWwm27Uxu+bS3
         lQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752090552; x=1752695352;
        h=in-reply-to:subject:autocrypt:from:content-language:references:cc
         :to:user-agent:mime-version:date:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9UJDy0YlrpBQF+06QLfz+618HjibPy/YACa+iyFEzLY=;
        b=SGJNMwkspAtNlNP36su/NVST3/1metXckahU3+QDdwWJm6kjhch9BreAz76kG84j8D
         /aDeSi6DjrFPjMDZ6EE4jLdwqjIccT+of5XWjQQrcIf8DUIkhUQthhKEQm5H+AyooX8s
         SKrGc48il6kDYbzSytLC0WVKjdHEq+WS1r5I58s6kF2thYDA41ZGNJtS0ITUmkvY0EgO
         /ZNihjQkks0uQTph8/FQn9rp8Hr9nROkeCiEN3pBQ7DfF+DBPjYP8QmtDaUZNjhIMxqN
         CQw+o/OKh8D8ZluOim08qQP+ZIdV4RpwrenHV3Xs8rJdvR/P2TrtcgpV/3MnUhYGTIrG
         bylw==
X-Forwarded-Encrypted: i=1; AJvYcCV+b3OrL2d/+ExzdzSxhvR0SQuv9/IGmVjvAeE5meN+9CkcY3Akvi/l4ilL1g3i5d36TYejQoxla8b7qu0ORQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YycLeHXYDVbLOlMtnJLEp8Oxek2nPubqZ20uqKobPrown4nP8rf
	c/CJGZl3fiaCTG4PTNwFv9wv8J25nKHS7Ekj4uAdKCwEWbsW5jPwpoyC
X-Gm-Gg: ASbGncv8dV74Bn889rwirzxQrigAahaZVrfBqVdsa5TFV2OWCVg0I7riEN0e+j80HDh
	GJjyJme5OFk53CEBOnXx/Ce5XRarhpsFBhfSx4vX63FceXJuGoD7YnydWhZWc1NKzX21Z5lByYs
	ypXs6Pcqc9w1fUKk2PcFQ/ZyhqTUfjgxXX3Nwsz8RV0CqXKSmpXWHBy3BjjdrT+EVFpwGn/zr4w
	IZLPrnhoF2F4nUgRxizZxNJLd6RfEiN6feyNdaaoRoDa/h3wjDY4m1rAk2fHF4+ObDO5p8Dab/D
	pXXTZlUXYawqEpYEHn+e4xGdAq8ymVtdZLS7wPnQLJb1X3LKDzjeTt6Os7xkqGp6usoFMKAfbBn
	X5A==
X-Google-Smtp-Source: AGHT+IFw+VlrG8/CqSpOJF0FCpZ0BBhvZ/sVvipunQGLrM1rQFWtA4bdYJ7ntWviGYhx3vwyBB/pxw==
X-Received: by 2002:a05:6902:18d3:b0:e89:7ed5:f8a3 with SMTP id 3f1490d57ef6-e8b6e164e4cmr4897701276.39.1752090551342;
        Wed, 09 Jul 2025 12:49:11 -0700 (PDT)
Received: from [10.138.10.6] ([89.187.178.201])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e899c440e7bsm4180443276.37.2025.07.09.12.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 12:49:10 -0700 (PDT)
Message-ID: <67378956-e1dd-4d7f-9b66-97887b625936@gmail.com>
Date: Wed, 9 Jul 2025 15:48:56 -0400
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Albert Esteve <aesteve@redhat.com>, virtio-comment@lists.linux.dev
Cc: ribalda@google.com, alex.bennee@linaro.org, adelva@google.com,
 cohuck@redhat.com, mvaralar@redhat.com, hverkuil@xs4all.nl,
 gurchetansingh@google.com, daniel.almeida@collabora.com,
 changyeon@google.com, acourbot@google.com, mst@redhat.com,
 eballetb@redhat.com, agordeev@qti.qualcomm.com, gnurou@gmail.com,
 dverkamp@chromium.org, Spectrum OS Development <devel@spectrum-os.org>,
 Alyssa Ross <hi@alyssa.is>
References: <20250709093456.350242-1-aesteve@redhat.com>
 <f6dc2d4d-89d9-4721-9c67-a214025cb3c3@gmail.com>
 <acc37ff248e70493a8068d8fc8c810effdc44093.camel@collabora.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
Subject: Re: [PATCH v9 0/1] virtio-media: Add device specification
In-Reply-To: <acc37ff248e70493a8068d8fc8c810effdc44093.camel@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2yHig4W7k91MJfxs4L8rDBw0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2yHig4W7k91MJfxs4L8rDBw0
Content-Type: multipart/mixed; boundary="------------7RYCKgzm9POVdATS2BfWtAkR";
 protected-headers="v1"
From: Demi Marie Obenour <demiobenour@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Albert Esteve <aesteve@redhat.com>, virtio-comment@lists.linux.dev
Cc: ribalda@google.com, alex.bennee@linaro.org, adelva@google.com,
 cohuck@redhat.com, mvaralar@redhat.com, hverkuil@xs4all.nl,
 gurchetansingh@google.com, daniel.almeida@collabora.com,
 changyeon@google.com, acourbot@google.com, mst@redhat.com,
 eballetb@redhat.com, agordeev@qti.qualcomm.com, gnurou@gmail.com,
 dverkamp@chromium.org, Spectrum OS Development <devel@spectrum-os.org>,
 Alyssa Ross <hi@alyssa.is>
Message-ID: <67378956-e1dd-4d7f-9b66-97887b625936@gmail.com>
Subject: Re: [PATCH v9 0/1] virtio-media: Add device specification
References: <20250709093456.350242-1-aesteve@redhat.com>
 <f6dc2d4d-89d9-4721-9c67-a214025cb3c3@gmail.com>
 <acc37ff248e70493a8068d8fc8c810effdc44093.camel@collabora.com>
In-Reply-To: <acc37ff248e70493a8068d8fc8c810effdc44093.camel@collabora.com>

--------------7RYCKgzm9POVdATS2BfWtAkR
Content-Type: multipart/mixed; boundary="------------ijSFhXnrS6ZiSF0iiDVk3o4B"

--------------ijSFhXnrS6ZiSF0iiDVk3o4B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7/9/25 13:58, Nicolas Dufresne wrote:
> Hi Demi,
>=20
> Le mercredi 09 juillet 2025 =C3=A0 13:26 -0400, Demi Marie Obenour a =C3=
=A9crit=C2=A0:
>> On 7/9/25 05:34, Albert Esteve wrote:
>>>
> [...]
>=20
>>
>> It's probably too late, but I have some serious concerns about this
>> device.=C2=A0 Specifically:
>>
>> 1. I don't see a reasonable way to support untrusted virtio-media
>> =C2=A0=C2=A0 devices.=C2=A0 v4l2 has too many ioctls and I can't reali=
stically
>> =C2=A0=C2=A0 see a way to enforce that the return values from all of t=
hem
>> =C2=A0=C2=A0 are consistent with each other.=C2=A0 It is possible to o=
nly allow
>> =C2=A0=C2=A0 a fixed format (such as uncompressed ARGB) and only allow=
 the
>> =C2=A0=C2=A0 video source and/or sink to provide resolutions and frame=
 rates,
>> =C2=A0=C2=A0 but this means losing a lot of performance and abandoning=
 any
>> =C2=A0=C2=A0 attempt at zero-copy.
>>
>> =C2=A0=C2=A0 The use-case for untrusted virtio-media devices is not
>> =C2=A0=C2=A0 confidential computing, but rather disaggregated systems =
where
>> =C2=A0=C2=A0 video sources (like webcams) may be attached to untrusted=
 virtual
>> =C2=A0=C2=A0 machines.
>=20
> Please consider that you are posting broadly and understanding of what =
you mean
> by untrusted virtio-media can be difficult for non-virtio devs like me.=


My use-case is this:

1. There is a VM that has all USB devices.
2. Some of those USB devices, like untrusted webcams, may be
   passed through to another VM via usbip.
3. The VM with the usbip device provides a video device to yet another VM=
=2E

The VM with the webcam and the VM receiving the video stream do not trust=

each other.

> With the enclosed information, I believe implementer are not forced to =
map to a
> host V4L2 driver. You can implement a userspace layer in between, and p=
ossibly
> even implement reclaiming by simulation some hot-unplug of the devices,=
 or by
> not scheduling any work for M2M.

I expect that any implementation that cares about security is going to do=
 this.

> I don't really see the relation between "trust" and the pixel format se=
lection.
> Nor why preventing zero-copy would help handling untrusted virtual mach=
ines. I
> do believe you should not attempt this if you don't have the required k=
nowledge
> though, as its unlikely the end-result will be safe.

How can I validate the various parameters provided by a backend?

> For me the main issue for untrusted VM is the lack of control measure, =
such as
> cgroup for resource usage. This is being worked on though, Maxime Ripar=
d have
> given an update at the Linux Media Summit in Nice.

Denial of service is not a concern in my use-cases.

>> 2. v4l2 is a chatty protocol and using it implies a lot of
>> =C2=A0=C2=A0 guest <=3D> host round-trips.=C2=A0 This is bad for perfo=
rmance.
>> =C2=A0=C2=A0 Is this overhead actually significant, and if so, are the=
re
>> =C2=A0=C2=A0 plans to reduce it?
>=20
> You should try and demonstrate this. Virtio Video tried to make their o=
wn and
> endup with something kind of similar with about the same level of back =
and
> forth. We already had few concerns with ioctl() overhead, and some meas=
ure have
> been implemented, notably s_ctrl_ext.
I'll leave this for later.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------ijSFhXnrS6ZiSF0iiDVk3o4B
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

--------------ijSFhXnrS6ZiSF0iiDVk3o4B--

--------------7RYCKgzm9POVdATS2BfWtAkR--

--------------2yHig4W7k91MJfxs4L8rDBw0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmhux6oACgkQszaHOrMp
8lOuhw/9ER+Nj4Ylvnpb3E/VSGDZnD0yGhSh9MvEtITrJvgipdJ+2EYs/XhjlRu3
RYkMN2st2ykjYAhX+ZV+Z5eUmtGgh34nHWATOx+VovlD/uVgoW16rVasnos+LDPI
LeIYFDDxlEWxflPDBxSLyHYEfk32O9O9w9BQbh0JmofO9v/I15rMNLapxU6EyejI
eXvxrHAg/UMnY2ibI+7sdyMZ5QvUvzClvvPWfXD8Aol1Glct78tZBNGnB+fozfIg
78Bqpsn0lweeOt7Jks/hyO8au34QJxwB9pJCLtnSkceF0sw+q2eLcNgCFe9te7YE
TO7Gaj2JxBuzRXTVG8l2idwh6LRBBAhz4oV0qhq2OgqayNiDhpgQ3M2kmT4Ttg5y
PkZVB0E9NjtA24qhpTadLx7cOHjRMD9sSkLQK2xBnN0im3asQR8J8Pb10oYr72WX
cl0dNTVcW4o0N8BC6mqB4qWpnC0S/c0oB9AD2Yr5TC4Dmi/2eAFmvxUQnQ/dRQGF
MKJdshc8zrrOKE1/Qk/0dkPgn8BQIcUdjwnFR0UJke1cif/TqpOXaaC1qoKFL9jj
kAFFn6DjjgT2H+jD8C5eNNupCacMp5+rbtG94pmD4alAafcb90kdJ1FVtptguipQ
QCrnN7h8K479IMJXav7I9QaCwVVJ3Ms26775SWyujKoXG0HppTw=
=4xEI
-----END PGP SIGNATURE-----

--------------2yHig4W7k91MJfxs4L8rDBw0--
