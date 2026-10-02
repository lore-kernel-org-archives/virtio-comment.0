Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F2F263F5D
	for <virtio-comment@lists.linux.dev>; Fri,  2 Oct 2026 05:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790920098; cv=none; b=gR3cMGRNTn0DS19oG81N0Mo5liiozhq0h4VgppIU15rTLRpS+5MTW/2gjcty21Tf1g/f1/GlATH1TI0lO3EIWfMOGCYs7U/xdumLTWwa/oNBUObhB3cEd6/7rOgGErauf6uHMgORv2hKjmf60Jh1wTu6/GYGsOgZdqFStsQ4dyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790920098; c=relaxed/simple;
	bh=hnA0QPiSJqjwGBoJ610Y0zG6FgyF+rF+YWwlJ4/ja5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eezIj6+PLpyoTcbK9M5uUI/MQ2bHGUtkMIII1DbWacEYgbtj5cT8Ydia3sajPbKMDVYsHgAe2BOeQlmX4f75rjYgXcOZXbQewyaLYjLa1TNWXVUgWLBgKg4mtFw3zHAp2S4xYejfMPhZ9qyQYekWl6IM6tuyyJHUDVYId8HEqdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AokL9Bpn; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AokL9Bpn"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-895fd505824so64331097b3.1
        for <virtio-comment@lists.linux.dev>; Thu, 01 Oct 2026 22:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790920096; x=1791524896; darn=lists.linux.dev;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FkfhdgJJfVCcF6JGfwG+BKRd+LBGvZjf8IfjQzXjYOQ=;
        b=AokL9BpnQ+63NkFZ4cHprI4r5yoX/mMYMywOJiPaXC8WdGWypHqLXMR5Jm3PpwcNtM
         pjFuE1P9Yoz+FLLgxfO20kGQs7xM3ek5063He16mhp/5WCNdINwwJwpASavxye5ROgaE
         MvobAVAk5VO8Mucb3z4gY/WazAiTqbwvw+Qox7I8jwYg1Agx+mHZpZtgphqVO/kU0ga6
         dJsihdwxuUPkldJwWHKvHabcdp6LyXHf4WV9OGbP9wWungModm9X+vNNsABNwPs4K9m4
         nhkf1kKI+jsi4oVBbZDA2BrAWAKD+4b4yzYuAsb6dOtWl15kb8Jg366uHn8jJVwoW9Ta
         q+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790920096; x=1791524896;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FkfhdgJJfVCcF6JGfwG+BKRd+LBGvZjf8IfjQzXjYOQ=;
        b=JrABoScBed5yQGSe1PpssCmMpOcjI2vzLT8tWbbUZZG9XrFjbbzXDssKosGMJIBQry
         yWTH8mkn9rwpcc5ZY9FTIvJBRcuZmCoU2PTvyAlMd2KgUHYcI8djbCoCZfcL0SZXrb4p
         KVgi0cj5oadsxs0l4/6vlBScWR3PH9b49oibE3hKq9i8Qo8zeCdC+glcMkkl3kvmpU8m
         tJJNGbxEmNXxqooAyVnMYI8LbMXETO6NHw8lIf5ZxbKGphd39eaRcFh/FLcQc9ILA2Yn
         E7NuVDwlUbBx/IUUDVR21bGZs+h//iK9uCpgtx0zZqFhkp0zlm47q7hmr+HUQHtSioSN
         9K1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxcNuxPWnrGWyMznvWbvfM5MWTEUyKbPIhnbRaRd2/BaDjYWN8+iVB7/uv1FnqAxdLfi8N+TiA7ELcker1ecQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJxTcI/7fgKLhtDrxwQmPqgP7fxm3GDuaKk9QxYNDPtZIOJxl/v
	xebwRDDZONi9vQ3mIswU9mNz3NGeqUf4SDWVx0AH20yHdgFU0c1f/LTY
X-Gm-Gg: AYBFou3BCLb10HXJY60FKmoECwHlIWZQTQJU0lBo+uauj3i2ty+V+mp0OVKP68mfc84
	Z/5wbTe9VfCWgPJlX2BqJXOdYmNQs4KdAUHbP9q3bd69obbujSv9vUOZaeMQOqlxNuy19PAn5Bp
	qMqji76uUbjauBXKxjst2mLuTACnm5UO3WNooLhE0U85PcqmLUD1ByXJl+7ztiAv5EbdPXXppxc
	6hgGjpvfkCeNxvpHvIDt9PYzhr9fav9yb40LbUILsnErQS6HPttwRAS9EE+7MNeiKbhKH2QDaiG
	o29qN7HKuFeJj886ppK7UURycMhf0K2nPNwp13x09s952hCpt7uMTUfn4/QH2lpcdhRgK2dBHAB
	JSa6+EsZAAHM3AgN9iKpZuoz6Om6a4gejnQUQxrzhOcjrmiyzSpYJluSGPcDR4ujRMYKlrtuF+1
	6SzKTGrgAjLu/xFBYIG0FNEaVKb1BwCS/G5JL5JL82mwKXLQ+0K7S2IZHQR0FUKAkbAbZXF3eFm
	zw=
X-Received: by 2002:a05:690c:e142:20b0:8ac:c329:6806 with SMTP id 00721157ae682-8ae3b5e1deemr4082417b3.102.1790920096048;
        Thu, 01 Oct 2026 22:48:16 -0700 (PDT)
Received: from [10.138.10.6] ([185.98.168.14])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae330e89ebsm5188847b3.30.2026.10.01.22.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 22:48:14 -0700 (PDT)
Message-ID: <1f656ebb-b547-41f3-9b4f-4f39b3836f37@gmail.com>
Date: Fri, 2 Oct 2026 01:48:09 -0400
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] transport-pci: Allow storing the configuration in the BAR
To: alistair23@gmail.com, virtio-comment@lists.linux.dev
Cc: alistair@alistair23.me, Alistair Francis <alistair.francis@wdc.com>
References: <20261002010456.2053759-1-alistair.francis@wdc.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20261002010456.2053759-1-alistair.francis@wdc.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hABq79XfOtqO02InkZyMlN5Q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hABq79XfOtqO02InkZyMlN5Q
Content-Type: multipart/mixed; boundary="------------pRqO5bpsJyaqP6SITNAC7LpX";
 protected-headers="v1"; hp="clear"
Message-ID: <1f656ebb-b547-41f3-9b4f-4f39b3836f37@gmail.com>
Date: Fri, 2 Oct 2026 01:48:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] transport-pci: Allow storing the configuration in the BAR
To: alistair23@gmail.com, virtio-comment@lists.linux.dev
Cc: alistair@alistair23.me, Alistair Francis <alistair.francis@wdc.com>
References: <20261002010456.2053759-1-alistair.francis@wdc.com>
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
In-Reply-To: <20261002010456.2053759-1-alistair.francis@wdc.com>

--------------pRqO5bpsJyaqP6SITNAC7LpX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/1/26 21:04, alistair23@gmail.com wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
>=20
> Most physical PCI endpoint capable PCIe controllers do not allow modify=
ing the
> capability list, and thus are unable to advertise the Common configurat=
ion
> capability.
>=20
> This results in physical PCIe endpoints implementing virtio-pci falling=

> back to the legacy interface and then needing hacks to deal with DMA
> issues [1].
>=20
> One solution to this is to allow the device to store the configuration
> data in the BAR [2]. This can be used as a fallback mechanism so we
> don't break any existing setups. New drivers and devices can attempt
> to read the configuration from the capabilities first and then fallback=

> to the BAR.
>=20
> We also need to add a go_busy field so that the driver and device have =
a
> basic message box to communicate. This is required for
> device_feature_select for example.
>=20
> 1: https://lkml.org/lkml/2026/9/1/185
> 2: https://lkml.org/lkml/2026/9/1/2370
>=20
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  transport-pci.tex | 85 +++++++++++++++++++++++++++++++++++++++++++++++=

>  1 file changed, 85 insertions(+)
>=20
> diff --git a/transport-pci.tex b/transport-pci.tex
> index 95b08b8..7d09169 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -262,6 +262,83 @@ \subsection{Virtio Structure PCI Capabilities}\lab=
el{sec:Virtio Transport Option
>  fields provide the most significant 32 bits of a total 64 bit offset a=
nd
>  length within the BAR specified by \field{cap.bar}.
> =20
> +\subsubsection{Virtio Structure Capabilities in a memory BAR}\label{se=
c:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Ca=
pabilities in a memory BAR}
> +
> +Some devices, for example implementions using physical PCI endpoint
> +controllers, are unable to add capabilities to the existing PCI capabi=
lity
> +list. This means they are unable to advertise the virtio structure
> +capabilities as described above.
> +
> +In this case a device MAY instead publish the same capability structur=
es in
> +one of its memory BARs, at offset VIRTIO_PCI_CAP_BAR_OFFSET (0), prefi=
xed by
> +the following header:
> +
> +\begin{lstlisting}
> +#define VIRTIO_PCI_CAP_BAR_OFFSET 0
> +#define VIRTIO_PCI_CAP_BAR_MAGIC  0x74726976 /* "virt" */
> +#define VIRTIO_PCI_CAP_BAR_VERSION_ONE  1
> +
> +struct virtio_pci_bar_cap_hdr {
> +        le32 magic;             /* VIRTIO_PCI_CAP_BAR_MAGIC */
> +        u8 hdr_ver;             /* Version of this header */
> +        u8 num_caps;            /* Number of capability entries that f=
ollow */
> +        u8 go_busy;             /* Indicates to start an operation and=
 when it's ongoing */
> +        u8 padding[1];
> +};
> +\end{lstlisting}
> +
> +The fields are interpreted as follows:
> +
> +\begin{description}
> +\item[\field{magic}]
> +        Magic value that identifies the presence of capabilities in th=
is BAR.
> +        Must be set to VIRTIO_PCI_CAP_BAR_MAGIC.
> +
> +\item[\field{hdr_ver}]
> +        The version of this header (virtio_pci_bar_cap_hdr), currently=

> +        only version VIRTIO_PCI_CAP_BAR_VERSION_ONE is supported.
> +
> +\item[\field{num_caps}]
> +        The number of struct virtio_pci_cap entries that follow this h=
eader.
> +
> +\item[\field{go_busy}]
> +        The driver writes VIRTIO_PCI_CAP_BAR_VERSION_ONE to this field=
 to indicate
> +        that the device should take action. The device is considered b=
usy until
> +        the driver reads this as 0.
> +\end{description}
> +
> +The header is followed by \field{num_caps} struct virtio_pci_cap entri=
es
> +(see \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / Virtio =
Structure PCI Capabilities}),
> +the first of which begins immediately after struct
> +virtio_pci_bar_cap_hdr.
> +
> +The entries are packed one immediately after another. Each entry is in=
terpreted
> +the same as if they are in configuration space and locate the
> +corresponding structure within a memory BAR.
> +
> +Note that the \field{cap_vndr} and \field{cap_next} fields are not use=
d in
> +this case.
> +
> +For read-write communication with the device, for example \field{devic=
e_feature_select},
> +the driver should set the value of the field then write the header ver=
sion to
> +\field{go_busy}. This indicates to the device that an action is requir=
ed.
> +
> +The device will then read the fields, take action according to the sec=
tions above
> +and when complete clear the \field{go_busy}. The driver MUST NOT read =
or write
> +other fields until \field{go_busy} has been cleared by the device.
> +
> +Note the driver can write to multiple fields before triggering \field{=
go_busy}. The
> +device MUST then take all actions before clearing \field{go_busy}.
> +
> +A device that publishes capabilities in a memory BAR MUST place struct=

> +virtio_pci_bar_cap_hdr at offset VIRTIO_PCI_CAP_BAR_OFFSET within a me=
mory
> +BAR.
> +
> +A device MUST follow struct virtio_pci_bar_cap_hdr with \field{num_cap=
s} struct virtio_pci_cap entries.
> +
> +The device MUST provide the same capabilities it usually would, just i=
n the memory
> +BAR.
> +
>  \drivernormative{\subsubsection}{Virtio Structure PCI Capabilities}{Vi=
rtio Transport Options / Virtio Over PCI Bus / Virtio Structure PCI Capab=
ilities}
> =20
>  The driver MUST ignore any vendor-specific capability structure which =
has
> @@ -270,6 +347,14 @@ \subsection{Virtio Structure PCI Capabilities}\lab=
el{sec:Virtio Transport Option
>  The driver SHOULD use the first instance of each virtio structure type=
 they can
>  support.
> =20
> +The driver SHOULD first attempt to use the virtio structure capabiliti=
es in
> +the PCI configuration space. If no common configuration capability is
> +present, the driver MAY scan each memory BAR at offset
> +VIRTIO_PCI_CAP_BAR_OFFSET for a struct virtio_pci_bar_cap_hdr whose
> +\field{magic} equals VIRTIO_PCI_CAP_BAR_MAGIC. If found, use the
> +capability entries published there as described in
> +\ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device L=
ayout / Capabilities in a memory BAR}.
> +
>  The driver MUST accept a \field{cap_len} value which is larger than sp=
ecified here.
> =20
>  The driver MUST ignore any vendor-specific capability structure which =
has

How is the driver supposed to know that the memory BAR contains that
structure, and not unrelated data that happens to be correctly formed?

=46rom what I can tell, feature bit 31 is currently not used for any
purpose.  Setting it could be used to indicate that the structure
is present.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------pRqO5bpsJyaqP6SITNAC7LpX--

--------------hABq79XfOtqO02InkZyMlN5Q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmq/RZkACgkQszaHOrMp
8lNbzRAAlAVYwupMR6N+IPd8wDiEe9w49BuubKRuhEpzi5xpLRRHuUntNsVXaMLQ
T/965ffbQ49+S+qbBYveiJyTIpfWULqr4BsfcCvyUqT0U9bv11m59+B/F9bMZiKp
8UCfgfI0MUvsT0y4heqgItfguUsSclcVBb8OXinAvakcUmqm1oUqQxTL8RvB5kTp
faVmHgPfP485LLeQYoSCL43dZ7udKZuTXxmTpxgYy2OaaHw+lbGW3x/HoUBKILri
djW7be3wcKFHFs3YRZXlU3E21ZngSFWOtvtz8P4/DQtlUNJdTQ8FWEt+F100tRpQ
LcfEGpCF9W3YLpSgP5o5u7OODQ54B1AeSIA/jWelm+qnQZam+lAL6prXlNqM1rLM
oXv3PvjUErTfmBOlHB7a+UAG8ZM8a1sqZO/ce47MLt0YxIUR2KYM0/bSIT3a4r3Q
97v+jUj/xZEul44On9fKDbd3LcuCL+ANpp9QVw8KfVh3V1J3IWUVvyKC4wUZsnxd
j1ypfaJ1h9fWtuLnd0caTwJ5N83gkS1r6t63QgwU3JQvPHBPBPno+U2LMnTksw/l
y4rWm10CagflipV85eKvbKjkmcVzv0inEi6n3FS9UDKJyQw8DmYSQt+k0VDdSFf4
soWlTbSD9WTk5AasrnX9PR3Cx+IblZfAJPt4fAOBDmIrGkE0dmA=
=Vgxo
-----END PGP SIGNATURE-----

--------------hABq79XfOtqO02InkZyMlN5Q--
