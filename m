Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793148895;
	b=e/ei6SNMgLnxZoo7Yh8Zskl9E5pNrAbxpXDOJ4LHsFIru4KIAgkMB8MQi6dJ3fo7/OUr
	 BTMBYw9w39xaUeAhBcro9F5CZlHkBUnGs/vVQ9qsIQUtBYMaZrTvFLu6lQjr5JeGzNuE6
	 9UqqVEeHVeiDMs+gtmOawFsd1wrgdyq+Y012m+Rxm8s4h7NqAfknYY3rlLM7v+QH3a/hs
	 kGxObnoPaLwDCOV5rmeBsbJ4fxM57Bfm+RIG2p6vZlUenKzDzETagVX6RakyGACHk8fAx
	 PHB+sLX7RrNRtOW3LffB59ceqlhp9CH1CV6qf6YNOqhCm4bgJeGeAQ3IvTJjW77QdGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793148895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=i/3ItVoVQ6BcNe+HejhuHoTqrmNNCj9/kHIna1+Gpsg=;
	b=0NJAgFit7l4nY7t9Yp5jnzPd0dEL0aJXxBBONF/mA+Ap63pjZKPGcHZ4qh8sQ2BPw3Jk
	 aCRV2J2Oh88w1TFgOUie6RIlhh6oq1NdzXFGsEmc4oEN65FTaTYwJKSyG1oY7KNhR+v4B
	 ++GNCcWtMkvfgVH6aV4sSLu0hKkFC20qquT/hVuVmqtL0RSDHhEUu+DVjT4+AcTs1+RuF
	 4ego5MRiOGeMi9NgdqW80y46u3U5yW5v3t81UJ0Ah27a/lwSxksaT8krgVZ6FDk8Ig1D/
	 UvnElSLJ7tL+LijP80okgQphLcJaByr/GTYX8hcXIS+cmi/wGBs7H9jZlcxEDPGScow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gLerJyl3;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790E7606A31A
	for <virtio-comment@lists.linux.dev>; Wed, 28 Oct 2026 00:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 790E7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gLerJyl3
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-679e86015e2so1736298d50.1
        for <virtio-comment@lists.linux.dev>; Tue, 27 Oct 2026 17:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793148893; x=1793753693; darn=lists.linux.dev;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i/3ItVoVQ6BcNe+HejhuHoTqrmNNCj9/kHIna1+Gpsg=;
        b=gLerJyl3LI1F08dZHbyjUDu7vjlSx/quw/C385WV1q+C0waxi6DeBgLeGMkvWKoioK
         S7jdgj2j9kYCUlyPQqttOkJvJrcI4mA7ZfF6LpGuQiMkL8ROrW+B6bIvdjNkJxlRS+Sv
         1FBkjHIegHZE24wt4O/WPHSiyl3Uhc2qOtSOvNaL0Jd/bHYjCJGgo64JCIfxa0ZND+J/
         dRErOX8VpxaEQf/gBxnMDxLfzeagBGtjgDx9sMyrTuvVlnbfp0RIWP7HVbq0N5mLST/I
         TPEICV5xNkTePJruvFatt8M4RqW+IE2NfC7hmfSr/BZA+f1adWriu+PEipCUIPh0p9xw
         w3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793148893; x=1793753693;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/3ItVoVQ6BcNe+HejhuHoTqrmNNCj9/kHIna1+Gpsg=;
        b=KTXTbTav17BkYo69r8T468f7SGcpExtJxeVshZXrjcYzdqsMPxLZf/WwdQmLW1jprI
         8xg5sZENAaQ1uxZoYQKBYkM8Sy65urD0BgYLbkqCPHhc7oKGuSbjINeONCWaDzlpSgQP
         3EYYXrDBAWabREEFIUivunrkNNutmaGmUwkt9hUPLuvQ9meVk90Fj8lerQG7EFM59qL/
         toqW9NIuI0RSxYxjBXxVtjZvVLm5NS4F1+N8xqT5MvCo7NPN1AlQZLSP4QQZkRJ/z7Ch
         6O+WWoyTTWcGbrs2FHKhuJ/Ik4QgQcwIawQbJeFfb2pC3UU3UZZaafSlwyGmAyu+mWl5
         nfVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzD7ItTRB0YzxzlGDoKs0v/E68F84KTiE+wTuXTDrBrtBWrL9nF+6chLyWT0vjcf/54cnQNk828Sn7d4OYNlg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKNIsLHy0tbRUC2BEf+k3EHDGkVS37TwtnHKv9ab6QCDpOSJ8gx
	UusxBmlb9Ij8shk3rSABsmIr1GBcH01yfOyfYRwlgNCReXA2ygBvGbuk
X-Gm-Gg: AYBFou1w5Vq3v0K4YuMvHmL0Qyb0GICNoPXIM7kHMyfxF8s9jiAaN4e83GoSS/pKhzd
	F4dAwOdwwC8SPE82gPq2sFZojz0n1qVviJnZ3bBYCdga+0HPcaR4hyZxkhnlC/1daAo1+tL5znZ
	ws3LGHmdOaRo8dMcUCVsf9E8QnpXWyH8sLDsS3Vyng6zoEUtpAY2rBB/IjTjQF6xsQJHvECiFjZ
	8+PrAiiizofaITk/k0wdP0SvqG4M37EkOB6tJfLDyfSFEckJcDFp2u9eVn3QNdF922/DPeuIqZ0
	yQqnVnhZdyvHRirh9mlloCkOSxIuvRPBqKCnM2F2V6chyW2155dGNsv9m6IcTqIs0OD/Q0yQ7bm
	+1BBBRgUz7Do2UqKTI+t+XAUbCH/2hRfAAReNin2iW+tUKzRL5hQIfq9RhYLHxBwg0fmXDZtN6Y
	1snjtwcGveRy88rcgUCUKHLsg1DKF3BgG5dQvSM86EDohJEQ6E6+JAoS2mnbsrZu4yAG6eFgZ2p
	wC7esHK67480F6tHT1bbtuPrHVUu+Wlq6+geYOzZnhoTt7XTVJqkqPWEFB+2552O3EhJNoewOVp
	CN/o5/FBykR7CBsHMCHhrk6Ow6plax3Fhw==
X-Received: by 2002:a05:690e:14ca:b0:677:bacc:ef24 with SMTP id 956f58d0204a3-67a6dfd844bmr3172872d50.18.1793148893230;
        Tue, 27 Oct 2026 17:54:53 -0700 (PDT)
Received: from [10.138.10.6] ([149.102.242.31])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a10a7dcsm956011d50.13.2026.10.27.17.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 17:54:52 -0700 (PDT)
Message-ID: <aa98e9da-f689-4a6f-9669-f85e1804a30b@gmail.com>
Date: Tue, 27 Oct 2026 20:54:34 -0400
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
Subject: Re: [PATCH] transport-pci: Allow storing the configuration in the BAR
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair <alistair@alistair23.me>, virtio-comment@lists.linux.dev
References: <20261002010456.2053759-1-alistair.francis@wdc.com>
 <1f656ebb-b547-41f3-9b4f-4f39b3836f37@gmail.com>
 <fac44696a94a41a715a0f725cafb44a54d2eef4c.camel@alistair23.me>
 <cb8fa241-b02b-425f-89e2-bdb3d3c6bf30@gmail.com>
 <CAKmqyKPGEXUKfb_OKqfGQmYdZzW2CyA3+Qw4PNhoEkhzvSTX1g@mail.gmail.com>
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
In-Reply-To: <CAKmqyKPGEXUKfb_OKqfGQmYdZzW2CyA3+Qw4PNhoEkhzvSTX1g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0x0q7u20Mj0kDD7fKY5KqHPY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0x0q7u20Mj0kDD7fKY5KqHPY
Content-Type: multipart/mixed; boundary="------------3wX73OHUOaJyamfO0YYuj7i4";
 protected-headers="v1"; hp="clear"
Message-ID: <aa98e9da-f689-4a6f-9669-f85e1804a30b@gmail.com>
Date: Tue, 27 Oct 2026 20:54:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] transport-pci: Allow storing the configuration in the BAR
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair <alistair@alistair23.me>, virtio-comment@lists.linux.dev
References: <20261002010456.2053759-1-alistair.francis@wdc.com>
 <1f656ebb-b547-41f3-9b4f-4f39b3836f37@gmail.com>
 <fac44696a94a41a715a0f725cafb44a54d2eef4c.camel@alistair23.me>
 <cb8fa241-b02b-425f-89e2-bdb3d3c6bf30@gmail.com>
 <CAKmqyKPGEXUKfb_OKqfGQmYdZzW2CyA3+Qw4PNhoEkhzvSTX1g@mail.gmail.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <CAKmqyKPGEXUKfb_OKqfGQmYdZzW2CyA3+Qw4PNhoEkhzvSTX1g@mail.gmail.com>

--------------3wX73OHUOaJyamfO0YYuj7i4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/27/26 02:05, Alistair Francis wrote:
> On Thu, Oct 22, 2026 at 5:07=E2=80=AFPM Demi Marie Obenour
> <demiobenour@gmail.com> wrote:
>>
>> On 10/22/26 00:27, Alistair wrote:
>>> On Fri, 2026-10-02 at 01:48 -0400, Demi Marie Obenour wrote:
>>>> On 10/1/26 21:04, alistair23@gmail.com wrote:
>>>>> From: Alistair Francis <alistair.francis@wdc.com>
>>>>>
>>>>> Most physical PCI endpoint capable PCIe controllers do not allow
>>>>> modifying the
>>>>> capability list, and thus are unable to advertise the Common
>>>>> configuration
>>>>> capability.
>>>>>
>>>>> This results in physical PCIe endpoints implementing virtio-pci
>>>>> falling
>>>>> back to the legacy interface and then needing hacks to deal with
>>>>> DMA
>>>>> issues [1].
>>>>>
>>>>> One solution to this is to allow the device to store the
>>>>> configuration
>>>>> data in the BAR [2]. This can be used as a fallback mechanism so we=

>>>>> don't break any existing setups. New drivers and devices can
>>>>> attempt
>>>>> to read the configuration from the capabilities first and then
>>>>> fallback
>>>>> to the BAR.
>>>>>
>>>>> We also need to add a go_busy field so that the driver and device
>>>>> have a
>>>>> basic message box to communicate. This is required for
>>>>> device_feature_select for example.
>>>>>
>>>>> 1: https://lkml.org/lkml/2026/9/1/185
>>>>> 2: https://lkml.org/lkml/2026/9/1/2370
>>>>>
>>>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>>>> ---
>>>>>  transport-pci.tex | 85
>>>>> +++++++++++++++++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 85 insertions(+)
>>>>>
>>>>> diff --git a/transport-pci.tex b/transport-pci.tex
>>>>> index 95b08b8..7d09169 100644
>>>>> --- a/transport-pci.tex
>>>>> +++ b/transport-pci.tex
>>>>> @@ -262,6 +262,83 @@ \subsection{Virtio Structure PCI
>>>>> Capabilities}\label{sec:Virtio Transport Option
>>>>>  fields provide the most significant 32 bits of a total 64 bit
>>>>> offset and
>>>>>  length within the BAR specified by \field{cap.bar}.
>>>>>
>>>>> +\subsubsection{Virtio Structure Capabilities in a memory
>>>>> BAR}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI=

>>>>> Device Layout / Capabilities in a memory BAR}
>>>>> +
>>>>> +Some devices, for example implementions using physical PCI
>>>>> endpoint
>>>>> +controllers, are unable to add capabilities to the existing PCI
>>>>> capability
>>>>> +list. This means they are unable to advertise the virtio structure=

>>>>> +capabilities as described above.
>>>>> +
>>>>> +In this case a device MAY instead publish the same capability
>>>>> structures in
>>>>> +one of its memory BARs, at offset VIRTIO_PCI_CAP_BAR_OFFSET (0),
>>>>> prefixed by
>>>>> +the following header:
>>>>> +
>>>>> +\begin{lstlisting}
>>>>> +#define VIRTIO_PCI_CAP_BAR_OFFSET 0
>>>>> +#define VIRTIO_PCI_CAP_BAR_MAGIC  0x74726976 /* "virt" */
>>>>> +#define VIRTIO_PCI_CAP_BAR_VERSION_ONE  1
>>>>> +
>>>>> +struct virtio_pci_bar_cap_hdr {
>>>>> +        le32 magic;             /* VIRTIO_PCI_CAP_BAR_MAGIC */
>>>>> +        u8 hdr_ver;             /* Version of this header */
>>>>> +        u8 num_caps;            /* Number of capability entries
>>>>> that follow */
>>>>> +        u8 go_busy;             /* Indicates to start an operation=

>>>>> and when it's ongoing */
>>>>> +        u8 padding[1];
>>>>> +};
>>>>> +\end{lstlisting}
>>>>> +
>>>>> +The fields are interpreted as follows:
>>>>> +
>>>>> +\begin{description}
>>>>> +\item[\field{magic}]
>>>>> +        Magic value that identifies the presence of capabilities
>>>>> in this BAR.
>>>>> +        Must be set to VIRTIO_PCI_CAP_BAR_MAGIC.
>>>>> +
>>>>> +\item[\field{hdr_ver}]
>>>>> +        The version of this header (virtio_pci_bar_cap_hdr),
>>>>> currently
>>>>> +        only version VIRTIO_PCI_CAP_BAR_VERSION_ONE is supported.
>>>>> +
>>>>> +\item[\field{num_caps}]
>>>>> +        The number of struct virtio_pci_cap entries that follow
>>>>> this header.
>>>>> +
>>>>> +\item[\field{go_busy}]
>>>>> +        The driver writes VIRTIO_PCI_CAP_BAR_VERSION_ONE to this
>>>>> field to indicate
>>>>> +        that the device should take action. The device is
>>>>> considered busy until
>>>>> +        the driver reads this as 0.
>>>>> +\end{description}
>>>>> +
>>>>> +The header is followed by \field{num_caps} struct virtio_pci_cap
>>>>> entries
>>>>> +(see \ref{sec:Virtio Transport Options / Virtio Over PCI Bus /
>>>>> Virtio Structure PCI Capabilities}),
>>>>> +the first of which begins immediately after struct
>>>>> +virtio_pci_bar_cap_hdr.
>>>>> +
>>>>> +The entries are packed one immediately after another. Each entry
>>>>> is interpreted
>>>>> +the same as if they are in configuration space and locate the
>>>>> +corresponding structure within a memory BAR.
>>>>> +
>>>>> +Note that the \field{cap_vndr} and \field{cap_next} fields are not=

>>>>> used in
>>>>> +this case.
>>>>> +
>>>>> +For read-write communication with the device, for example
>>>>> \field{device_feature_select},
>>>>> +the driver should set the value of the field then write the header=

>>>>> version to
>>>>> +\field{go_busy}. This indicates to the device that an action is
>>>>> required.
>>>>> +
>>>>> +The device will then read the fields, take action according to the=

>>>>> sections above
>>>>> +and when complete clear the \field{go_busy}. The driver MUST NOT
>>>>> read or write
>>>>> +other fields until \field{go_busy} has been cleared by the device.=

>>>>> +
>>>>> +Note the driver can write to multiple fields before triggering
>>>>> \field{go_busy}. The
>>>>> +device MUST then take all actions before clearing \field{go_busy}.=

>>>>> +
>>>>> +A device that publishes capabilities in a memory BAR MUST place
>>>>> struct
>>>>> +virtio_pci_bar_cap_hdr at offset VIRTIO_PCI_CAP_BAR_OFFSET within
>>>>> a memory
>>>>> +BAR.
>>>>> +
>>>>> +A device MUST follow struct virtio_pci_bar_cap_hdr with
>>>>> \field{num_caps} struct virtio_pci_cap entries.
>>>>> +
>>>>> +The device MUST provide the same capabilities it usually would,
>>>>> just in the memory
>>>>> +BAR.
>>>>> +
>>>>>  \drivernormative{\subsubsection}{Virtio Structure PCI
>>>>> Capabilities}{Virtio Transport Options / Virtio Over PCI Bus /
>>>>> Virtio Structure PCI Capabilities}
>>>>>
>>>>>  The driver MUST ignore any vendor-specific capability structure
>>>>> which has
>>>>> @@ -270,6 +347,14 @@ \subsection{Virtio Structure PCI
>>>>> Capabilities}\label{sec:Virtio Transport Option
>>>>>  The driver SHOULD use the first instance of each virtio structure
>>>>> type they can
>>>>>  support.
>>>>>
>>>>> +The driver SHOULD first attempt to use the virtio structure
>>>>> capabilities in
>>>>> +the PCI configuration space. If no common configuration capability=

>>>>> is
>>>>> +present, the driver MAY scan each memory BAR at offset
>>>>> +VIRTIO_PCI_CAP_BAR_OFFSET for a struct virtio_pci_bar_cap_hdr
>>>>> whose
>>>>> +\field{magic} equals VIRTIO_PCI_CAP_BAR_MAGIC. If found, use the
>>>>> +capability entries published there as described in
>>>>> +\ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI
>>>>> Device Layout / Capabilities in a memory BAR}.
>>>>> +
>>>>>  The driver MUST accept a \field{cap_len} value which is larger
>>>>> than specified here.
>>>>>
>>>>>  The driver MUST ignore any vendor-specific capability structure
>>>>> which has
>>>>
>>>> How is the driver supposed to know that the memory BAR contains that=

>>>> structure, and not unrelated data that happens to be correctly
>>>> formed?
>>>
>>> Sorry for the delay, I lost this email while I was travelling.
>>>
>>> I don't have an answer here. The driver is supposed to search for
>>> VIRTIO_PCI_CAP_BAR_MAGIC at offset VIRTIO_PCI_CAP_BAR_OFFSET, which
>>> could exist independently.
>>>
>>>>
>>>> From what I can tell, feature bit 31 is currently not used for any
>>>> purpose.  Setting it could be used to indicate that the structure
>>>> is present.
>>>
>>> Do you mean have the driver probe for feature bit 31 (after searching=

>>> for VIRTIO_PCI_CAP_BAR_MAGIC at offset VIRTIO_PCI_CAP_BAR_OFFSET) to
>>> confirm that it is supported?
>>>
>>> Alistair
>>
>> I meant having a feature bit that is compatible with the legacy
>> interface, but which tells the driver that the device is really
>> a modern driver with its common configuration capability in a
>> specified BAR.
>=20
> Ah! That's a good idea. That should mostly work.
>=20
> One issue though. When using an older driver (that doesn't know about
> this new feature bit) what should happen? In theory the device is
> advertising the legacy flow with bit 31 set. So the driver will just
> use the legacy flow and ignore bit 31 being set.
>=20
> But in reality the legacy flow doesn't actually work, so if the driver
> tries to set things up it will crash or hang or error. Maybe we can
> just report an error on the first operation or something, but it does
> seem a bit clunky
>=20
> Alistair

If the driver doesn't accept the feature, or if it accepts the UNUSED
feature, the device can report an error over PCIe AER (if that's
supported) or just stop working.

FYI, I think your race conditions are because your PCIe endpoint
hardware doesn't support stalling the bus until software catches up.
If I understand PCIe correctly, the proper solution is for the endpoint
to withhold flow control credits until software has handled all the
pending MMIO writes.  That allows software to exert backpressure.

That said, virtio-msg is a vastly better solution to this problem.
The virtio-msg AMP transport is designed for exactly this use-case.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------3wX73OHUOaJyamfO0YYuj7i4--

--------------0x0q7u20Mj0kDD7fKY5KqHPY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmrhR9YACgkQszaHOrMp
8lNSexAAldjmMh1jz0+4QLfRopQbtwPx9ojZirVze7yUBIO8tnaqnNsjTZKgJzaV
YhPMQGjcYu9gGT1CqCpJ6+4bKOXa8IjT8gK1Hr+sVdHw525r2LjSleKdbQ2plqDL
EUV2nkbWogEc0Y6jxgahjfj6jEg5CnY/83qEPZY6xJJ3hV6BwO0JlDgPL5VR+ODN
thY9rEL9p9DjjDaLVJbNFyFfvwAkprV6LWEF8DC1I/CsH5GtDE6cx23otX72XwWl
WwziAP+nm86kZ43jedjjHcMyYwfo+QeTDoNnzUEuBz0Ck4f6d3EK+PYNqL2d7Gae
5IptMRKjxd00414eXy1oXYmwD6t5J42hhxWg16qgoMaMGWmbxFvzGqgVrXuXDi/q
7VxfTk6RLIWxFZSC8osRHX8gbXa9WWCWh3R8BxakYQQQQSFKWIlKAeCWQ1tR3LYn
dGCg1tVN498cPQMZgWRx5oemx/XFNINQvYfmqbA5meV77Wjg3v07sYUT+hQnyE01
tZZtUaP/4WfJsqWWeLZGCIkn8EY+UtSAgxOxjuFiw2GrLC7OnvBT6AKFy44EMCou
1lLA7pXFk4LA/8Oyk+kdHoi7zmfOx3EyVzM6id//Vb5PxGda8DMumbU+oFr5OEfS
qAgtUq7Cs3kdx1LEhGmuHhYRVBFL/EGyqYCWHi3F3UOXU5KNNOM=
=VVvG
-----END PGP SIGNATURE-----

--------------0x0q7u20Mj0kDD7fKY5KqHPY--
