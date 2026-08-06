Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394963A2E2B
	for <virtio-comment@lists.linux.dev>; Thu,  6 Aug 2026 16:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786032562; cv=none; b=MJmyk7MzaiNmqzmpMwliu9L97evfnZTrxcslmDnoEtdbEJ+ElVgLZAyJgCJebK7Srjb5OBN8BMkkn0pZ4MmmQdK5kxQpELgnp7vfaLeYv0Pl8HTrK5UmB53gozlmT/riZsmDtEj3GzBCfZLKvYbVRzUAosPE94NyICactqN9ImQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786032562; c=relaxed/simple;
	bh=WRd+t7TN396QQyaFNm6Vck0HX/1GqKVATR6UIaqE1vE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ATeAlgJwdyBzEFbAW1nRLTnkmIjpwOuaIaXptR9yowpYzdVuYmX94JbHmjPpzF4ejruhJhGx9op41bZN9b3cDjKy/tdR6VDvv3T/9vLKGSqDY+CEwZsi1wBgA9gYEo7XMjuoA5SgMps260Q7BRIml75mNzd1RYNYwyV9dRcAQoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7XXPDuk; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7XXPDuk"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-82011c59e66so45729937b3.0
        for <virtio-comment@lists.linux.dev>; Thu, 06 Aug 2026 09:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786032560; x=1786637360; darn=lists.linux.dev;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ecUtq8x+2w3AXA4atD4rhtUaREW0d4jKofRrE8vby5w=;
        b=I7XXPDukRb90ECGJ/oNQnY1qResMkcx46yMA7gIUaoUixplfMEfX581AcwDI290l/G
         6zoYk48/Jbx2Fx60jGwvHSCt8Zo3muQ5iqgaYU95UTU9Rnmrfxk4bYwJZ53i94dotIuX
         WT+mHBLNtVjbItLHSsV4PsrKx4AwdUPJX6eGqU9Pc9UDLaUfzZ4zkfPKSIJ5aNgv2qQA
         AUpOCVWZOz8l6n2H/a7dTJojCgX1DTkUPxokVERw84X8CEY5fOFl0ztuOWWhyme3adam
         UlY6kSug/FBX3WuMcXkXuWMX1Z4JQ+adpvD6uJaRP1FKGxSZ+a0yorhkl3cXgscAk5UB
         qZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786032560; x=1786637360;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ecUtq8x+2w3AXA4atD4rhtUaREW0d4jKofRrE8vby5w=;
        b=FR/4ntMGOmhPCUurUjnGaSsPN1e4TO0E49fubv8GTv6zRUloZTBD9dltCQQGuT5r8d
         dplOFH4tJFCLLoL+5uGGamZb8y0tYO/+UcBTByQhJUrel/7qz1C/U2rQD5/l27N9kkVr
         ySrZuXyFFVyup9GJHpckiweXSSHJg2LStUVbeUEwMtj5jWsnzwNvDTy5FasBWN2RcgBZ
         Pkr0rCR7CuKHUtE0RR/04T8gf0YH4pPdzReASymgZewPrqFigQDd6LBtr1pN5gMQyPQl
         EcLEaaDbWn8YxFyCQzJA1BnBAKJtuBTX/6jnwgLGcE7zG095u3h1H5WGng0inRAfxYo2
         kK2w==
X-Forwarded-Encrypted: i=1; AHgh+Row98xqGFklNCnhmZH/RZqoczKelrjqgU7kcg5BHYUbb6NNM4fXCO3EwqiERIOdecr/w4k590PtT+e60THqMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoiBfasBOhZum3jHo/BDrkaHmfUyOoZk6PO0WA3hdka/IaPEuZ
	WKo0KPTo6OK6TUsFRytnsFsT/xMPZsHfE6dbaWPnjPIIF7Xl+KOT2SqdNwdIPw==
X-Gm-Gg: AR+sD104XzUdaDrn8z1KIg/J6jjbU9Mx2Ngoj6p/oo9XskSqLlkaTJSYIilmtUC5L9L
	ZEa/1HBfQSvX5VoCIDM0IkSiBuLC3weIw2mON2KYlx2SDJsvd+kFjEJ9xRKMgRfc1DBgCAT24iZ
	9+I18qT7nP/AQ7P82XQohBD5dDfJIkVozSNHPy52N3q6tD+oxvbExjVVICj3cGUpeggOKepp5x0
	ue9pkoWkh0U1cc41IWbGtnqufn0ysLqTo2l9azbjIECc7XcP/9EiNgzgFIzJ8SG1qD3pc4ZG2/4
	aQlfxJgMm+/AHeKHFbHXfze1f9T4OoxwHdG/iggmpgqdXTITPs1Dk+plMz2rUE1bMegoo6jwTHT
	UEKQtZOdFj6nap+M4jXNy98aF0LB/qWwIXfb1ZVUWZjApnjj78syqZCd4gkLhbOxzrr11gAYHwL
	WtSUYof3YMQgmT4E+up01W3hZ2dwwRxw7Lfw25DBjO9wbWf+95pwUgDmWbUbnuBaM=
X-Received: by 2002:a05:690c:9c08:b0:7ff:1a93:be35 with SMTP id 00721157ae682-820222ace39mr100569867b3.16.1786032559974;
        Thu, 06 Aug 2026 09:09:19 -0700 (PDT)
Received: from [10.138.10.6] ([185.98.168.14])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201341ddedsm42498287b3.23.2026.08.06.09.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 09:09:18 -0700 (PDT)
Message-ID: <044ee495-d958-4c91-9627-da4ce591e737@gmail.com>
Date: Thu, 6 Aug 2026 12:09:04 -0400
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Add VIRTIO_F_DMB (Device Memory Buffer)
To: Alexander Graf <graf@amazon.com>, virtio-comment@lists.linux.dev
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20260716215426.46037-1-graf@amazon.com>
 <20260804161202.38619-1-graf@amazon.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260804161202.38619-1-graf@amazon.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------V7arfOKMJro00jS9u0Q50DXY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------V7arfOKMJro00jS9u0Q50DXY
Content-Type: multipart/mixed; boundary="------------6YOMba9iqXF8gBpGGqGvBdVm";
 protected-headers="v1"; hp="clear"
Message-ID: <044ee495-d958-4c91-9627-da4ce591e737@gmail.com>
Date: Thu, 6 Aug 2026 12:09:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Add VIRTIO_F_DMB (Device Memory Buffer)
To: Alexander Graf <graf@amazon.com>, virtio-comment@lists.linux.dev
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20260716215426.46037-1-graf@amazon.com>
 <20260804161202.38619-1-graf@amazon.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260804161202.38619-1-graf@amazon.com>

--------------6YOMba9iqXF8gBpGGqGvBdVm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 8/4/26 12:12, Alexander Graf wrote:
> When a transport uses a shared bounce region for virtqueue memory today=
,
> that region is global and shared by multiple devices at once. Devices
> then contend over one small region, so a busy device can starve the
> others, and one device's emulation cannot be isolated or torn down on i=
ts
> own because its state lives in memory everyone else is using too.
>=20
> VIRTIO_F_DMB gives each device its own shared memory region, the Device=

> Memory Buffer, that holds that device's virtqueues (Descriptor, Driver
> and Device Areas) and the buffers the descriptors reference. When the
> feature is negotiated, every address the driver places in a virtqueue i=
s
> an offset into that region rather than a physical or bus address, so th=
e
> device only ever touches memory the driver placed there. Because each
> device owns its region, its emulation can run in a separate host proces=
s
> and be terminated independently, and devices no longer contend over one=

> shared region.
>=20
> The device reports the region's shmid through a transport-specific
> mechanism (dmb_shm_id in the PCI common configuration structure, DMBSHM=
Id
> on MMIO), so the shmid does not collide with device-specific or future
> transport-specific shared memory regions. The driver locates the region=

> through the existing Shared Memory Regions facility. VIRTIO_F_DMB refin=
es
> VIRTIO_F_ACCESS_PLATFORM and is negotiated only together with it.
>=20
> To provide the confinement guarantee, the device bounds-checks every
> driver-supplied offset against the region and sets DEVICE_NEEDS_RESET o=
n
> violation.
>=20
> The general requirement on shared memory regions forbids a device to
> expose a region used to control its operation or to stream data, and a
> Device Memory Buffer is used for both, so it is named as that
> requirement's exception.
>=20
> The Device Memory Buffer is memory the driver shares with the device on=

> platforms that distinguish shared from private mappings, and the device=

> provides coherency without cache maintenance by the driver. A device
> that requires the platform's barriers offers VIRTIO_F_ORDER_PLATFORM,
> and a driver accepts VIRTIO_F_DMB only together with it. Offset 0 in
> the region is reserved: a device that predates the feature reads a
> Descriptor Area address of 0 as a queue that is not in use, as the
> legacy QueuePFN register states.

I think this is going to be a prerequisite for strongly isolating
vhost-user backends (so they can't compromise the frontend) while
maintaining high performance.  One can use shadow virtqueues, but
this will add extra round-trips.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------6YOMba9iqXF8gBpGGqGvBdVm--

--------------V7arfOKMJro00jS9u0Q50DXY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmp0saoACgkQszaHOrMp
8lNrWg/+OBI3qvsQsCR8P2foqBCAU7vtYucTuUS6RtpsVHt+HDtMWJ7pceT01bzG
Y89dLUBFwVlIUwdbV4LD2f6ydGfY5lJvQFyjnqUAsq0lito8GTaetqasO1Fi1j8m
XBFhtpCRV+08A2ycboXwL6RNzc0ubjIX3gdxSar/dh34xvc2gHDkqG4wa3kH1i5O
qZ7ZQn3Er3P4lwpz1dyREKN88nfxzMMKTO4F4jRpdEsvKdNYs7ij6EOahnh8ipq/
bCMK5PyqLGl1GgUPo63yPm63QcZ6QaJtbL2QDgwRXxv+qooY2CJ2TQMAUVijk8EB
sSWcrAFzUPddn6WdMfcbK+Le1ICJbwJf69AnSxcmXgKW6Nv36qetHAysPPxr8mOA
t6uzXFS8m18ABua0p/mHCC3ZStWd69do387N7BUlPmx4KeZnIij5hCAsbz2+Pfvm
a8G/AkptveDDwKSNt4p9wZ/woOGmYBUcJeYd77gwTnTP8poJ4RQUO4Oe7KOi3BVB
8C3eXYZzx3lAiWsds8c46uXJsuSa9jn9fI7eQvkr9elGdOe6fbtByvYrInQpYrs3
oMZmiSGDa77fgH8VFDslIDaGKcaytDJeElA8J8e1FhpAa6K6Fw2i8lEVCk32h2J6
I/fh1HAr4CKJNTPxv3sGTenCED9mOx/TDTv3qXztAtunMEaZDQQ=
=dVBY
-----END PGP SIGNATURE-----

--------------V7arfOKMJro00jS9u0Q50DXY--
