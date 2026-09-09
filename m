Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E574E7083C
	for <virtio-comment@lists.linux.dev>; Wed,  9 Sep 2026 02:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788919947; cv=none; b=MAzyY9RurdVAo3VjbiNuyel80fbQpUhqr4k5Mysea8MYKvurjXywuK2jjr8n0zTHBMOCvCx0GbVyUcg9yJ/OTMiDVTsew+s/kf788kUPrkUJj/6hM7cP8g8jxY3skxEmcD0Aanh1KA9vafAqLZXGx+fmsKDuJ8sR96lOLayjaXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788919947; c=relaxed/simple;
	bh=lYJSVoCaxk0IqTRqRZQpXhkUZasYy0CrpqjZa280waE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NPtKMaXR7DdVYuptElXXC7bHv22U6Qe4kU4NZXXD6UIY8F4Ah/MMnaRA8vQ/bvQlvw6GDLPRrB2ZapNGQ99rRBYIXUI8ZDwxQ9g4ifDR0ymIzOB2irvlASXouMrjyrf/aELLPRMG+4BIw+qnoWcBUeR2eDNtkXmQaAJrD5TPpXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q41CroQn; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q41CroQn"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67109e0aa0eso7945d50.0
        for <virtio-comment@lists.linux.dev>; Tue, 08 Sep 2026 19:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788919945; x=1789524745; darn=lists.linux.dev;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PVUd4HRID0CV0FISXbWdy+Haw/xjxRcEtsK0cT2fSPs=;
        b=q41CroQn1C9z6dajnMp08oQpwSyFohmriDhVSwdPVijefinI4LwKiRzgOuu8RKq/xC
         LvDxg8ucF9wcXvOjXkscEghewtemt1ikSGnVMSTmE+JOGFVbzC7UplVTk1Oq3etcPOyz
         6iicOGR1Vfx5qbeb3WhkCk6WJB4grq/Q49rn19sqXJIRE3i4yNZ9T5micubjIF72DVFL
         yj8M+zCjqS8THOb73fsKyYEeNTumDzVp/aei+HUQqO1wIiQSzRhlzYwTL3wRL5Cen1Nu
         /zmFQLbwK5GRZoAvIXOw58zi2Fo5fS68grFpTFrOrHMgINRpx4nVT01yg7rd27LF1eXZ
         9BuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788919945; x=1789524745;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVUd4HRID0CV0FISXbWdy+Haw/xjxRcEtsK0cT2fSPs=;
        b=m7YUumEjyo/d3k+yQq15/IkHjXJKe4d0SYD8erIamrPEPy4w5roI0s2augSPlGIe2v
         NTXPQcood+HwGKs4nOwDnVPscX3hFOaxdwNXs33BP2HfpcEF8WkIKB/QTKwueeKHg+09
         CcYPQtD9q77XgC255gRiyAEoc7IAXUM+KUfxZ4u+cbpEZ4fgjuGU50QoYg1TynSFOmmo
         ueT794iWRMkctXqmH27PEL78hoBS08SV6YJxjzHESNcDd4hb/e8b0oKUSp+XwclRKD10
         T3pH7N+hB6Ye8fn5EVCW+gNFnI7VXKZl/NBFPdn5+QbY/wctH26dP9JIyvzfre8NGR9L
         pXpA==
X-Forwarded-Encrypted: i=1; AKwUvByMOzs5Z9VLBCu++YsCK5KhKhfVBccl3ICc9J9yeRWxE55z/bN6565thX2UaWmNmGTFGSeijxzFPkf0EHZfmQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kWh+SUkoMrz2HT732PagNN5Ysz+EgJClhWlE42CsJWNFEdMaL+
	VU+0yXR54h9YELGnao6PK8/mT0ldc5ffZUMsRRHgGGo3wOx84i5bW6Vu
X-Gm-Gg: AYBFou0swrWc2nMbQpI6qlKHw1LVt0WwGHWLzdC1UbNiB5nQpeNZh3Hgsk+1YjdRYEh
	xHwsMvC/Dd8YRD2OkJSdV4H5+mLMi87BTKw/P39o5UDqpDlALEBJRuOcB0VsSkMZ16oEbj2Rsd2
	0om15AniOTOM6fASZqEG9+9j+ucXmtVwRAKU3Srv6W5rhq87SnXFQ3yEf9OQ50xovCEfOVjf5qS
	Gd3aBoA2avp0dQWAwa09e9FEOhLMVAfbkaj5yH063xGMcM4PizKhtiGuG9U0XeBseM1S6XbU+zJ
	y/OFZcIf3yJ8TgtAMSNkXcjYsxAX1tBWVHZIaxaKjb0Ej6C2PJu0SePssG2sw4orF53XGZ41+1i
	XwGn4Cq9vNJgVPopW7lWTttgvfKw4Cc/qQetXG87npmYgxjoEZcBVKJ82sN+qjK0goay7QcO0Da
	ysLqaTgVRyNLIJWzYF8NtuXzMNuxYof38cOycjZHrYerJ6HPFLwyK2CmunaClY7Stq/JDPCf1a4
	ys=
X-Received: by 2002:a53:ad4c:0:b0:66f:c1be:3185 with SMTP id 956f58d0204a3-66fc1be3544mr6029721d50.92.1788919944644;
        Tue, 08 Sep 2026 19:12:24 -0700 (PDT)
Received: from [10.138.10.6] ([185.98.168.14])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb4914af4sm11599675d50.13.2026.09.08.19.12.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 19:12:23 -0700 (PDT)
Message-ID: <14dea311-7050-41e5-9645-ee8e3b719db6@gmail.com>
Date: Tue, 8 Sep 2026 22:12:03 -0400
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
To: "Michael S. Tsirkin" <mst@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.linux.dev
References: <20260908094050.915173-1-rjones@redhat.com>
 <20260908094050.915173-2-rjones@redhat.com> <20260908151446.GC1016680@fedora>
 <20260908154640.GW1436@redhat.com>
 <20260908123542-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49yB+l2nipd
 aq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYfbWpr/si88QKgyGSV
 Z7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/UorR+FaSuVwT7rqzGrTlscnT
 DlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7MMPCJwI8JpPlBedRpe9tfVyfu3euTPLPx
 wcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9Hzx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR
 6h3nBc3eyuZ+q62HS1pJ5EvUT1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl
 5FMWo8TCniHynNXsBtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2
 Bkg1b//r6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
 9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nSm9BBff0N
 m0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQABzTxEZW1pIE1hcmll
 IE9iZW5vdXIgKGxvdmVyIG9mIGNvZGluZykgPGRlbWlvYmVub3VyQGdtYWlsLmNvbT7CwXgE
 EwECACIFAlp+A0oCGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJELKItV//nCLBhr8Q
 AK/xrb4wyi71xII2hkFBpT59ObLN+32FQT7R3lbZRjVFjc6yMUjOb1H/hJVxx+yo5gsSj5LS
 9AwggioUSrcUKldfA/PKKai2mzTlUDxTcF3vKx6iMXKA6AqwAw4B57ZEJoMM6egm57TV19kz
 PMc879NV2nc6+elaKl+/kbVeD3qvBuEwsTe2Do3HAAdrfUG/j9erwIk6gha/Hp9yZlCnPTX+
 VK+xifQqt8RtMqS5R/S8z0msJMI/ajNU03kFjOpqrYziv6OZLJ5cuKb3bZU5aoaRQRDzkFIR
 6aqtFLTohTo20QywXwRa39uFaOT/0YMpNyel0kdOszFOykTEGI2u+kja35g9TkH90kkBTG+a
 EWttIht0Hy6YFmwjcAxisSakBuHnHuMSOiyRQLu43ej2+mDWgItLZ48Mu0C3IG1seeQDjEYP
 tqvyZ6bGkf2Vj+L6wLoLLIhRZxQOedqArIk/Sb2SzQYuxN44IDRt+3ZcDqsPppoKcxSyd1Ny
 2tpvjYJXlfKmOYLhTWs8nwlAlSHX/c/jz/ywwf7eSvGknToo1Y0VpRtoxMaKW1nvH0OeCSVJ
 itfRP7YbiRVc2aNqWPCSgtqHAuVraBRbAFLKh9d2rKFB3BmynTUpc1BQLJP8+D5oNyb8Ts4x
 Xd3iV/uD8JLGJfYZIR7oGWFLP4uZ3tkneDfYzsFNBFp+A0oBEAC9ynZI9LU+uJkMeEJeJyQ/
 8VFkCJQPQZEsIGzOTlPnwvVna0AS86n2Z+rK7R/usYs5iJCZ55/JISWd8xD57ue0eB47bcJv
 VqGlObI2DEG8TwaW0O0duRhDgzMEL4t1KdRAepIESBEA/iPpI4gfUbVEIEQuqdqQyO4GAe+M
 kD0Hy5JH/0qgFmbaSegNTdQg5iqYjRZ3ttiswalql1/iSyv1WYeC1OAs+2BLOAT2NEggSiVO
 txEfgewsQtCWi8H1SoirakIfo45Hz0tk/Ad9ZWh2PvOGt97Ka85o4TLJxgJJqGEnqcFUZnJJ
 riwoaRIS8N2C8/nEM53jb1sH0gYddMU3QxY7dYNLIUrRKQeNkF30dK7V6JRH7pleRlf+wQcN
 fRAIUrNlatj9TxwivQrKnC9aIFFHEy/0mAgtrQShcMRmMgVlRoOA5B8RTulRLCmkafvwuhs6
 dCxN0GNAORIVVFxjx9Vn7OqYPgwiofZ6SbEl0hgPyWBQvE85klFLZLoj7p+joDY1XNQztmfA
 rnJ9x+YV4igjWImINAZSlmEcYtd+xy3Li/8oeYDAqrsnrOjb+WvGhCykJk4urBog2LNtcyCj
 kTs7F+WeXGUo0NDhbd3Z6AyFfqeF7uJ3D5hlpX2nI9no/ugPrrTVoVZAgrrnNz0iZG2DVx46
 x913pVKHl5mlYQARAQABwsFfBBgBAgAJBQJafgNKAhsMAAoJELKItV//nCLBwNIP/AiIHE8b
 oIqReFQyaMzxq6lE4YZCZNj65B/nkDOvodSiwfwjjVVE2V3iEzxMHbgyTCGA67+Bo/d5aQGj
 gn0TPtsGzelyQHipaUzEyrsceUGWYoKXYyVWKEfyh0cDfnd9diAm3VeNqchtcMpoehETH8fr
 RHnJdBcjf112PzQSdKC6kqU0Q196c4Vp5HDOQfNiDnTf7gZSj0BraHOByy9LEDCLhQiCmr+2
 E0rW4tBtDAn2HkT9uf32ZGqJCn1O+2uVfFhGu6vPE5qkqrbSE8TG+03H8ecU2q50zgHWPdHM
 OBvy3EhzfAh2VmOSTcRK+tSUe/u3wdLRDPwv/DTzGI36Kgky9MsDC5gpIwNbOJP2G/q1wT1o
 Gkw4IXfWv2ufWiXqJ+k7HEi2N1sree7Dy9KBCqb+ca1vFhYPDJfhP75I/VnzHVssZ/rYZ9+5
 1yDoUABoNdJNSGUYl+Yh9Pw9pE3Kt4EFzUlFZWbE4xKL/NPno+z4J9aWemLLszcYz/u3XnbO
 vUSQHSrmfOzX3cV4yfmjM5lewgSstoxGyTx2M8enslgdXhPthZlDnTnOT+C+OTsh8+m5tos8
 HQjaPM01MKBiAqdPgksm1wu2DrrwUi6ChRVTUBcj6+/9IJ81H2P2gJk3Ls3AVIxIffLoY34E
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260908123542-mutt-send-email-mst@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------byVi35oDLTfe0Pyi05Fy2Vn0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------byVi35oDLTfe0Pyi05Fy2Vn0
Content-Type: multipart/mixed; boundary="------------8aqY0BocD9yuPWvA3UlRXBk9";
 protected-headers="v1"; hp="clear"
Message-ID: <14dea311-7050-41e5-9645-ee8e3b719db6@gmail.com>
Date: Tue, 8 Sep 2026 22:12:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
To: "Michael S. Tsirkin" <mst@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.linux.dev
References: <20260908094050.915173-1-rjones@redhat.com>
 <20260908094050.915173-2-rjones@redhat.com> <20260908151446.GC1016680@fedora>
 <20260908154640.GW1436@redhat.com>
 <20260908123542-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260908123542-mutt-send-email-mst@kernel.org>

--------------8aqY0BocD9yuPWvA3UlRXBk9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9/8/26 12:43, Michael S. Tsirkin wrote:
> On Tue, Sep 08, 2026 at 04:46:40PM +0100, Richard W.M. Jones wrote:
>> On Tue, Sep 08, 2026 at 11:14:46AM -0400, Stefan Hajnoczi wrote:
>>> On Tue, Sep 08, 2026 at 10:40:50AM +0100, Richard W.M. Jones wrote:
>>>> +Although 247 byte device ID strings are allowed, there may be
>>>> +interoperability problems if strings longer than 128 bytes are used=
=2E
>>>
>>> Can you be more specific? Is the concern that the guest software stac=
k
>>> above of the driver may not be prepared for serial strings longer tha=
n
>>> 128 bytes?
>>
>> I'll add more detail in the next version, but in brief the problems
>> are twofold:
>>
>> (1) Windows supports up to 128 "characters" (they're not precise but
>> they probably mean Unicode codepoints from the Basic Multilingual Plan=
e):
>>
>> https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/storpor=
t/ns-storport-stor_serial_number
>>
>> (2) When udev tries to encode a very long serial into a
>> /dev/disk/by-id path you end up uncomfortably close to NAME_MAX (255).=

>>
>>>> +It is also advisable to use only 7 bit ASCII characters.
>>>
>>> Versus "The device ID string is an ASCII string which can be up to 24=
7
>>> bytes long" earlier in this patch. Is ASCII a "SHOULD" or a "MUST"?
>>
>> It's "SHOULD".  I can't see any good coming from trying to use
>> anything except letters, numbers and dashes in a serial, but both
>> Linux and Windows (see above) could in theory handle Unicode.
>>
>> Rich.
>=20
>=20
> Linux actually has code to try and handle that. unicode
> is actually the less problematic part - ascii is
> full of pitfalls, eith things like
> slashes are much weirder - e.g. udev will create
> a subdirectory with slashes. what will windows do?
> and what will it do with backslashes? /me shrugs

What about /../../../../../../../../..?

Honestly, the simplest way to protect against problems is to
just use a hex-encoded or base32-encoded cryptographic hash as
the name.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------8aqY0BocD9yuPWvA3UlRXBk9--

--------------byVi35oDLTfe0Pyi05Fy2Vn0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmqgwIAACgkQszaHOrMp
8lMgkw/+MUWTU5+sGt0QxkafDEfIN2VDtktz15KM4CvRftmKmli6GOic1FqrHmqG
9l33VcgUmx3TiBK/2sTnno49LeAxEmd182r3NFsfGGjeVDDsZ/MBngonWv8WMf+u
pwmtKMhXz6LlNX+zAiOI6KneG/uVJIz5Ky/cvm9MpuU3MYKU6EYpJ+1MLwDFbzzH
HlLivzWYoFGGcmaPpnOuP08Fvx2PgMIBfVokCZNGulB6pYGjyBgKG4hITIUPCOFJ
244thnHCwKcMTitDVm3UxaQ9TnPIvbqh5Zy3OjPfI6bHvFzGxxy9/49Jg/s7sUU/
CsDrFTsgL40IPsnP+lVWPqxTjNK8eGKlLyIws/C/+VULdwbKL2y55IfQs1p9ATkw
Frjy3TSOkKqd78Pj+Kma1Wy9MrHHNlj+bn5+L76z8K53kEUCPwp87YAMQABvR1N5
kTLJEI8vdrJNFSw7CNxKUZYerwnPl9Apg9OLVsY0Kp4zolc2vdlJi1dx1jsF5YsW
3X+n/Txu6L06jlhEOnKieQ8rmuGBE8N+LsCagx0eJTvjnsvvBRsNCRmjRYSexYSd
yI6mQe+FUMQHwVIIHR1Bn7M/bmYVwKSHKV+1epJ9FuTPPrQEtlEfymLMQO2nEq3e
bqh6gRFTTaNsE9A1th/sUVLkLD8CS38xMSPORKqVtXzuWBhwCdQ=
=VhJC
-----END PGP SIGNATURE-----

--------------byVi35oDLTfe0Pyi05Fy2Vn0--
