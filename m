Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792652840;
	b=ceKAd+OCVk4ni7HMI2KoXRqsz7Oc0A2pttthtXmdZFGMP/xDanpHfQ/1C0s8aubTlQnL
	 Cl2UiVLkdm1HK90384Oc1j2ONzh2GAuoC3VBMsDpraP9TOry339e48Dbnkd+TL/T3uS2h
	 2z6PkwF+orGmrFnzR9+p0xHmhPxKiAiq/gVgcUPDImeifQCsw8VI3jTXKd3FuDO8e9RDY
	 vj74vnS3NHMYDXL381H/FFU9MeNeHuq41DpxuXv95vG+t4Y4eNaaPXOaqE51rWC/OP802
	 361gzFK9k0zwHUz+p/dljVykwXEINfavRfvOTPqaCqY2PnTWAOcnG0QevymhGz1P1hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792652840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=UiUOEAnoYvGSruMUcMm4XQ4GJL/ShCLlnZ5yq4RxR4o=;
	b=vhdmr6POzaH2q0gtykpw30XcWWSFmNk7/BbqT4WMx8dWGwGkc+RuMv4Tnau4mQPS2x8d
	 oAOQw6rydzBfmfcJskoFk71szseeiH0mPMksdynbTB+sCMOoW7QqoeNgBs55FFkhwEEVX
	 3UZQwbH35rWLQHTCvBZ7QKO9i5TKWnQYirOqitXYlCR0Q4eBRGWvIcEI6xtqhEBdz+IOL
	 y/61cXeqUYBmGSTvvm8rK09crm0nwZmlK10frORvj58sDDlOIWTIDg9qAT1Ge1d8KjTbK
	 kxRP40cAdbk3pbv6PyPUD0c+i7Gpo8XOUXM9IqrVrZnkMQys+d6ss7hZLZorditSscg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SsHjuXwp;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC5C606A319
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 07:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDC5C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SsHjuXwp
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67989a98f8bso999789d50.2
        for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 00:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792652839; x=1793257639; darn=lists.linux.dev;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UiUOEAnoYvGSruMUcMm4XQ4GJL/ShCLlnZ5yq4RxR4o=;
        b=SsHjuXwpcXL4ORahVkLEXqX+qWTcJFCTVy1XEFRFYkZkMlOLZDJkAQmbxZBytgcQ/F
         wxTWF89Q01HL1gYsfKMePNybi6iK5g9JOnV47SaGvUQ2kY5IGsaXscREANddKHluEn86
         CWNSG4u29CB6ooxL8J689Yjx+jm9eSXSduB6vbaU/r5yWaIJmQDnOg7dlqTxGBiocbcL
         oy4Fh8F74xPwabz1si9Pv9PkQ/78aqLcP6OsoHjaj9nlhewGpeMyuow5sjBJ+TWvjiY2
         VaNdHJ916Uc11oPm5Qdx0p1ZvXfOKv04DA1zGsHHx5+1xyWoeWJlBnvdrOLb6z+x/lCG
         Wefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792652839; x=1793257639;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UiUOEAnoYvGSruMUcMm4XQ4GJL/ShCLlnZ5yq4RxR4o=;
        b=02F/PcX0rGJU9tcyIofDUwY7TIWMjsYM4Jw41JZbtE0ioRSuOBfoqJx188NB0M1p4L
         pOMCzTN4+1J6Db1EyVLIKLO3bGEg2SuYr36Rv/Bj6YqzXFhzljAXrraZ/eco+2qL7/XS
         ivsXlh/AzQAJhxDw8CXg/0Sts+mzuQKr7yadIQS21lKHjEyuU00kzMU4PODjg/QKnFRM
         zQlvysjo/CWwy+Wswmgnmp12af98SxPgqP8fRHprplXbB/Kmn58o8HIxRVDR1Lh+yikl
         4N7Risk764+swPRM5CVGCzGg3A9RyCoEuL63yQXOAwqpWsM0no5Mh+4XbyNE9xRMby8X
         BieA==
X-Forwarded-Encrypted: i=1; AKwUvBwesjkHhVFZ2AbNfRy7pmQQEAfH48jjcCjA5zxVSYgY0f+5nF7n60zbI5yNIL+fFt8RyQXQ3YpHDKwJoA/Niw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJtzhLEtFGj+56bsHxYxYEIXnTMdv92/QQFxODcaExgx6LfhFHO
	UVNXI/OMoefUXSL/0dZNrteHYXRInJedMvuTKIZznjdnzCHotPjew96N
X-Gm-Gg: AYBFou3t1sA9OBj1ZZRBDvPZDNWXo0j7qMwd4HJH3P1yS+iObbxWrGmAzGled5KaVyc
	ucZ7eTuy2MJNfkkeCYMDzzG24u1++PVp4SzqENk5Xx5Yhj2+vu5VhioKytqCboBi3oEjIYc2Ji6
	JGX9gjgFrq+Nq1COFpP/mSv1LNn/aGp8ikSjiJ2f8nk0UcxxvcttvKSW1AqhA9n8Qv4+bGYJEQl
	4WC3X8YEVPlTx9nL8MZX4ErTTo8qj+dCyiyJcV2s5j18eWah5e5Sj0gmGWSRXCxEBoreedE3nA+
	RUqUD9GcLIs3vFmcTI8Rgz8tE3HWRcLl8ze/n25oT8u7QZs8/3qUHuYXqQj+ZR9rKDt6sr+buVV
	IvvStJPlQ3WC0YgmSqGTGzP9uQZaOyBafbAo2eN6sLTYrTZthwAzgPa3T5FfHZZPXH8dDvzhwRF
	AKgVt1c9lAGBPnQWHemZWRU0D7wPUa2yBxiaeu3bz8dB4Ej63dAp+cIQFypJ/ovc8M3gtUXx40z
	GyLaVnOAkK0YTgqHHFbC7qYUtvyng7ILTmah6id83HlVBasSD37DRXlzAz/
X-Received: by 2002:a53:df83:0:b0:677:cbfc:be34 with SMTP id 956f58d0204a3-67a0e538c1amr1672831d50.66.1792652838750;
        Thu, 22 Oct 2026 00:07:18 -0700 (PDT)
Received: from [10.138.10.6] ([149.102.242.31])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a0e491a8dsm2347330d50.8.2026.10.22.00.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:07:16 -0700 (PDT)
Message-ID: <cb8fa241-b02b-425f-89e2-bdb3d3c6bf30@gmail.com>
Date: Thu, 22 Oct 2026 03:07:11 -0400
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
To: Alistair <alistair@alistair23.me>, alistair23@gmail.com,
 virtio-comment@lists.linux.dev
References: <20261002010456.2053759-1-alistair.francis@wdc.com>
 <1f656ebb-b547-41f3-9b4f-4f39b3836f37@gmail.com>
 <fac44696a94a41a715a0f725cafb44a54d2eef4c.camel@alistair23.me>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <fac44696a94a41a715a0f725cafb44a54d2eef4c.camel@alistair23.me>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0ocUKR0oL215TWymHLPpvC9X"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0ocUKR0oL215TWymHLPpvC9X
Content-Type: multipart/mixed; boundary="------------G3RU5n0Z0qizlUdBXXRgdScc";
 protected-headers="v1"; hp="clear"
Message-ID: <cb8fa241-b02b-425f-89e2-bdb3d3c6bf30@gmail.com>
Date: Thu, 22 Oct 2026 03:07:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] transport-pci: Allow storing the configuration in the BAR
To: Alistair <alistair@alistair23.me>, alistair23@gmail.com,
 virtio-comment@lists.linux.dev
References: <20261002010456.2053759-1-alistair.francis@wdc.com>
 <1f656ebb-b547-41f3-9b4f-4f39b3836f37@gmail.com>
 <fac44696a94a41a715a0f725cafb44a54d2eef4c.camel@alistair23.me>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <fac44696a94a41a715a0f725cafb44a54d2eef4c.camel@alistair23.me>

--------------G3RU5n0Z0qizlUdBXXRgdScc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/22/26 00:27, Alistair wrote:
> On Fri, 2026-10-02 at 01:48 -0400, Demi Marie Obenour wrote:
>> On 10/1/26 21:04, alistair23@gmail.com=C2=A0wrote:
>>> From: Alistair Francis <alistair.francis@wdc.com>
>>>
>>> Most physical PCI endpoint capable PCIe controllers do not allow
>>> modifying the
>>> capability list, and thus are unable to advertise the Common
>>> configuration
>>> capability.
>>>
>>> This results in physical PCIe endpoints implementing virtio-pci
>>> falling
>>> back to the legacy interface and then needing hacks to deal with
>>> DMA
>>> issues [1].
>>>
>>> One solution to this is to allow the device to store the
>>> configuration
>>> data in the BAR [2]. This can be used as a fallback mechanism so we
>>> don't break any existing setups. New drivers and devices can
>>> attempt
>>> to read the configuration from the capabilities first and then
>>> fallback
>>> to the BAR.
>>>
>>> We also need to add a go_busy field so that the driver and device
>>> have a
>>> basic message box to communicate. This is required for
>>> device_feature_select for example.
>>>
>>> 1: https://lkml.org/lkml/2026/9/1/185
>>> 2: https://lkml.org/lkml/2026/9/1/2370
>>>
>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>> ---
>>> =C2=A0transport-pci.tex | 85
>>> +++++++++++++++++++++++++++++++++++++++++++++++
>>> =C2=A01 file changed, 85 insertions(+)
>>>
>>> diff --git a/transport-pci.tex b/transport-pci.tex
>>> index 95b08b8..7d09169 100644
>>> --- a/transport-pci.tex
>>> +++ b/transport-pci.tex
>>> @@ -262,6 +262,83 @@ \subsection{Virtio Structure PCI
>>> Capabilities}\label{sec:Virtio Transport Option
>>> =C2=A0fields provide the most significant 32 bits of a total 64 bit
>>> offset and
>>> =C2=A0length within the BAR specified by \field{cap.bar}.
>>> =C2=A0
>>> +\subsubsection{Virtio Structure Capabilities in a memory
>>> BAR}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI
>>> Device Layout / Capabilities in a memory BAR}
>>> +
>>> +Some devices, for example implementions using physical PCI
>>> endpoint
>>> +controllers, are unable to add capabilities to the existing PCI
>>> capability
>>> +list. This means they are unable to advertise the virtio structure
>>> +capabilities as described above.
>>> +
>>> +In this case a device MAY instead publish the same capability
>>> structures in
>>> +one of its memory BARs, at offset VIRTIO_PCI_CAP_BAR_OFFSET (0),
>>> prefixed by
>>> +the following header:
>>> +
>>> +\begin{lstlisting}
>>> +#define VIRTIO_PCI_CAP_BAR_OFFSET 0
>>> +#define VIRTIO_PCI_CAP_BAR_MAGIC=C2=A0 0x74726976 /* "virt" */
>>> +#define VIRTIO_PCI_CAP_BAR_VERSION_ONE=C2=A0 1
>>> +
>>> +struct virtio_pci_bar_cap_hdr {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 le32 magic;=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* VIRTIO_PCI_C=
AP_BAR_MAGIC */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 hdr_ver;=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Version of t=
his header */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 num_caps;=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Number of capabili=
ty entries
>>> that follow */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 go_busy;=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Indicates to=
 start an operation
>>> and when it's ongoing */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 padding[1];
>>> +};
>>> +\end{lstlisting}
>>> +
>>> +The fields are interpreted as follows:
>>> +
>>> +\begin{description}
>>> +\item[\field{magic}]
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Magic value that identifi=
es the presence of capabilities
>>> in this BAR.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Must be set to VIRTIO_PCI=
_CAP_BAR_MAGIC.
>>> +
>>> +\item[\field{hdr_ver}]
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The version of this heade=
r (virtio_pci_bar_cap_hdr),
>>> currently
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 only version VIRTIO_PCI_C=
AP_BAR_VERSION_ONE is supported.
>>> +
>>> +\item[\field{num_caps}]
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The number of struct virt=
io_pci_cap entries that follow
>>> this header.
>>> +
>>> +\item[\field{go_busy}]
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The driver writes VIRTIO_=
PCI_CAP_BAR_VERSION_ONE to this
>>> field to indicate
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 that the device should ta=
ke action. The device is
>>> considered busy until
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the driver reads this as =
0.
>>> +\end{description}
>>> +
>>> +The header is followed by \field{num_caps} struct virtio_pci_cap
>>> entries
>>> +(see \ref{sec:Virtio Transport Options / Virtio Over PCI Bus /
>>> Virtio Structure PCI Capabilities}),
>>> +the first of which begins immediately after struct
>>> +virtio_pci_bar_cap_hdr.
>>> +
>>> +The entries are packed one immediately after another. Each entry
>>> is interpreted
>>> +the same as if they are in configuration space and locate the
>>> +corresponding structure within a memory BAR.
>>> +
>>> +Note that the \field{cap_vndr} and \field{cap_next} fields are not
>>> used in
>>> +this case.
>>> +
>>> +For read-write communication with the device, for example
>>> \field{device_feature_select},
>>> +the driver should set the value of the field then write the header
>>> version to
>>> +\field{go_busy}. This indicates to the device that an action is
>>> required.
>>> +
>>> +The device will then read the fields, take action according to the
>>> sections above
>>> +and when complete clear the \field{go_busy}. The driver MUST NOT
>>> read or write
>>> +other fields until \field{go_busy} has been cleared by the device.
>>> +
>>> +Note the driver can write to multiple fields before triggering
>>> \field{go_busy}. The
>>> +device MUST then take all actions before clearing \field{go_busy}.
>>> +
>>> +A device that publishes capabilities in a memory BAR MUST place
>>> struct
>>> +virtio_pci_bar_cap_hdr at offset VIRTIO_PCI_CAP_BAR_OFFSET within
>>> a memory
>>> +BAR.
>>> +
>>> +A device MUST follow struct virtio_pci_bar_cap_hdr with
>>> \field{num_caps} struct virtio_pci_cap entries.
>>> +
>>> +The device MUST provide the same capabilities it usually would,
>>> just in the memory
>>> +BAR.
>>> +
>>> =C2=A0\drivernormative{\subsubsection}{Virtio Structure PCI
>>> Capabilities}{Virtio Transport Options / Virtio Over PCI Bus /
>>> Virtio Structure PCI Capabilities}
>>> =C2=A0
>>> =C2=A0The driver MUST ignore any vendor-specific capability structure=

>>> which has
>>> @@ -270,6 +347,14 @@ \subsection{Virtio Structure PCI
>>> Capabilities}\label{sec:Virtio Transport Option
>>> =C2=A0The driver SHOULD use the first instance of each virtio structu=
re
>>> type they can
>>> =C2=A0support.
>>> =C2=A0
>>> +The driver SHOULD first attempt to use the virtio structure
>>> capabilities in
>>> +the PCI configuration space. If no common configuration capability
>>> is
>>> +present, the driver MAY scan each memory BAR at offset
>>> +VIRTIO_PCI_CAP_BAR_OFFSET for a struct virtio_pci_bar_cap_hdr
>>> whose
>>> +\field{magic} equals VIRTIO_PCI_CAP_BAR_MAGIC. If found, use the
>>> +capability entries published there as described in
>>> +\ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI
>>> Device Layout / Capabilities in a memory BAR}.
>>> +
>>> =C2=A0The driver MUST accept a \field{cap_len} value which is larger
>>> than specified here.
>>> =C2=A0
>>> =C2=A0The driver MUST ignore any vendor-specific capability structure=

>>> which has
>>
>> How is the driver supposed to know that the memory BAR contains that
>> structure, and not unrelated data that happens to be correctly
>> formed?
>=20
> Sorry for the delay, I lost this email while I was travelling.
>=20
> I don't have an answer here. The driver is supposed to search for
> VIRTIO_PCI_CAP_BAR_MAGIC at offset VIRTIO_PCI_CAP_BAR_OFFSET, which
> could exist independently.
>=20
>>
>> From what I can tell, feature bit 31 is currently not used for any
>> purpose.=C2=A0 Setting it could be used to indicate that the structure=

>> is present.
>=20
> Do you mean have the driver probe for feature bit 31 (after searching
> for VIRTIO_PCI_CAP_BAR_MAGIC at offset VIRTIO_PCI_CAP_BAR_OFFSET) to
> confirm that it is supported?
>=20
> Alistair

I meant having a feature bit that is compatible with the legacy
interface, but which tells the driver that the device is really
a modern driver with its common configuration capability in a
specified BAR.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------G3RU5n0Z0qizlUdBXXRgdScc--

--------------0ocUKR0oL215TWymHLPpvC9X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmrZth8ACgkQszaHOrMp
8lO79w//SNmW9CwRjAX/u8z1DkZdT/a1dWbYAvMvc8AePQlLC6Y4WmzVEwP+kam4
CrYCc+MI0Eh0ltiPIFOTJYkzf/PBfVhaI2S0EXyiuTGQFD5lxf9rkXGtDnX1ZjQi
nI0sWhsvLVgOYjteeq6zL5peocaMPB6cxLKa98uhY529D9PlmgZti2iEO5yNebHf
3H5wMo7DR2C7bn8yUJGUAL3xYkGrUUd4kKZ5xzmH4B7Agqnjj3wHtLNnEZ/f6Sbe
EjSPRXy6Fh01XSpgdgNGy5cQEfxMsSlDBs22B/7Hw4YadAJmR4HOohRqq+QKG4gR
iNFXXUHTU0Fn6BWnyrx01hVKtshNzwRmnr+WVgfAh/GIV7rN61rnRyB3hF3ylZXd
Qi82Hxp8YjoNPxXU5YFIUHxkAPZgaSBlD2Dn5+wuCGsyLn8qE5TceDuUEJtC4O+I
MDryozln2jOAEPZvrX9Own8G2XZAhG5FA8dwIpA80Fn+vLDrTITw02kdhnJnzGuX
/XISmDh7uuQEgrQE+XRDsIun48COleqoFuI0SiGmn+JSEH2N8bqX+gHKh9N17z8z
uWq5AetCEE70SXR99WBQoor1oV/5OMU3zRVM9Yw8KLh+L/3zKbnxU49y8ITX42gB
ILkYeovwtxW5e8Ivofz3Te46ElB8IkbB9wAvPHiGKYs9nEpsesA=
=caBZ
-----END PGP SIGNATURE-----

--------------0ocUKR0oL215TWymHLPpvC9X--
