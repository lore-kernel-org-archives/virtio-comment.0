Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0FF2E7365
	for <virtio-comment@lists.linux.dev>; Thu, 28 May 2026 16:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779984800; cv=none; b=IfRRm1jFROlGqF7fNxejgpHHLsddhyJHQDlA2cANYP5aNBJeUwvY0xHEBPgVXCJeavjyhDdBe6n6GoTLkN0Ep/zK+nCAKTv+rTgm18mjE6frmWjQiFNvXTVnU6N2KIJZBoBkSIIDciX5o0cndUsQ1vJiUigTPvSsT0Dbhu8iyLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779984800; c=relaxed/simple;
	bh=WdO5PkTxnNu+g5UBaFiTBR4kdczHXFihr+d1cORha4w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BctWagoza7lRTlKqoppMUU+JZnNbF0WADNw34rtPKeSAna+eP+U7bbEt+BeY1t7KUIcMirYUoGQ+6J5p/D2ZvZpR0MyVjMrF0wJAgiCgP9SI8VBb5H9o5Z2BXzwKUTg3dTrdUK4DvVgW8vVJpW76EP/3hv6TEhIheMWuhx54o/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K6f/LKwY; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K6f/LKwY"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45eee266c6cso277520f8f.1
        for <virtio-comment@lists.linux.dev>; Thu, 28 May 2026 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779984797; x=1780589597; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JWT+VWYM1XqareEencxyOMF9mKtVF1ZIOZBhiJl2yJ8=;
        b=K6f/LKwY8QvEupbhXSwN8Mp4XmKyN/T2DNNeDStJ542GDqEtTuuAdC34rblpag7qL6
         5bTU4Ap4nT6N7YI985yWNjnpGNO9ylL9d4i6iBFYKTOYvODdVX1bw+KVtE+0/3J2zPuX
         S33gW8r8arth5JgpanixSM8eNepOOaHMWdPGf4AYpmqkfjriee89O0LwRLs/710QNImy
         bPvt7rLGxV97H5i6ih0+xLD4bdFCvcSvNJDdBpn2feDplljLOpLmeJlL7TJS+/lcfQJS
         bUhF2PM2yWXrtMcPXp6Me7H7widbYujioinsbTUJu4XKn8w8+FGFYz6LgOAuFA84e5V/
         0jpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779984797; x=1780589597;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JWT+VWYM1XqareEencxyOMF9mKtVF1ZIOZBhiJl2yJ8=;
        b=jVsSGPWrGNiVqArPijRoQgWvsrQPhTnBoOz1z9XLc0SVaJfcdcYVnhr0fsnl3KafKo
         FxqaoZ3jhntqrUX1W7H6xUqYjaK6yMKN+brlw7dXP1fWw9OzXP+yn69HbYSIF5H9WMeB
         Zhxhkpz3AILcFblkksRO8O/1lErSkDnz/YvILNuNM2HRtEmFcRsRWp7Hbz5M1o8wyFB5
         pT4NgJXTtBrw2eBgZdwYxlCMFYazlL/OnJ/7BmKjDlfbrLF5N3PGOMNdYkr7R4jHOtNr
         FUippRtTEbn47JevNnQ2gk0l/hIH8Lr8FbrKJWpd7gIBIzC0prRt5wpO4YAGanzMCI7M
         hXBA==
X-Forwarded-Encrypted: i=1; AFNElJ8ouGkHvR3iaXRc6myz2cSodpPOKUXFez72OOyp/WJqG5dcAUjVpu6aU2+b5thadiVKQJGSHxg96xQO+0FYCw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKDL83jdNjLgX95j/A3a0Kaaq+V/6QC+mweUeWgELKIay+bHqA
	mm/pLnchz6gbwfJMeuAwpn7TXGDtKl+dQnOu6OCKugyesdCWGRC6CC43ra/Z2q1e1wM=
X-Gm-Gg: Acq92OHykT/sp+Ix7c35GTFpzFSD/KpahO3RIWajZ779IpeamzEUIGAGnQvBxxItMZY
	Btt22jUExOdXelOcqgPyYhOldXJbU+X1KEbN5gidjUEMPjroBAWZQmyC3MhuXz2qqcvn04tMRWv
	cFM+u5D/m12yVteLJTuLoloZClREsMYB1KyEk6QfpeHSDJzIOkzFyjxhk37kohQ96uvFn8bhYpl
	H2CApyBtROwzCmRFidqWvhtn/P9kCFNNChRyc2GS3VBHk7Pj5Hr8GXIiIpfJdUh3tUF12QG3ote
	r4PeCbmTP3kz3X5psBQePAtPHPL+oLtRoxW6pjQ//aYYmbsPz8QfoH3LXSEMF/3T7cg2t8/0jF0
	t+Zoo9SnJMyDH5BVoqMA1xpczRliC3RUknf6Hp5Zw6XDUi/Qll4IOYU6HUzPfdlgc/xC4Ip3ihx
	iL3EUjuHQPjCY2D2kB1TNK/u+0ChX7JDdnu5SAVlFyMLJ2
X-Received: by 2002:a05:6000:2883:b0:43c:f66e:f24 with SMTP id ffacd0b85a97d-45eb38c8b80mr48858338f8f.35.1779984796735;
        Thu, 28 May 2026 09:13:16 -0700 (PDT)
Received: from draig.lan ([185.124.0.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5579b8sm14740521f8f.9.2026.05.28.09.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 09:13:15 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C9E555F92B;
	Thu, 28 May 2026 17:13:14 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,  Parav Pandit
 <parav@nvidia.com>,  Alyssa Ross <hi@alyssa.is>,  Rob Bradford
 <rbradford@meta.com>,  Bo Chen <bchen@crusoe.ai>,
  "dev@lists.cloudhypervisor.org" <dev@lists.cloudhypervisor.org>,
  Spectrum OS Development <devel@spectrum-os.org>,
  "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Viresh
 Kumar <viresh.kumar@linaro.org>, Sumit  Semwal <sumit.semwal@linaro.org>,
 Bill Mills <bill.mills@linaro.org>, Edgar E. Iglesias
 <edgar.iglesias@amd.com>
Subject: Re: Vhost-guest (was virtio vhost-user) vs virtio-msg
In-Reply-To: <4ba67246-3a2b-43ee-b827-000c16ff07ed@gmail.com> (Demi Marie
	Obenour's message of "Thu, 28 May 2026 02:59:13 -0400")
References: <11771164-7919-43e1-a980-03f036bdae2e@gmail.com>
	<SJ0PR12MB6806C5A16CB0899E095E835EDC092@SJ0PR12MB6806.namprd12.prod.outlook.com>
	<CAAjaMXYGMTok_a2CJK8aKSqbTbgLx1CbkCVZw2VnZdJVuPJ38w@mail.gmail.com>
	<4ba67246-3a2b-43ee-b827-000c16ff07ed@gmail.com>
User-Agent: mu4e 1.14.1; emacs 30.1
Date: Thu, 28 May 2026 17:13:03 +0100
Message-ID: <877bonqzqo.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Demi Marie Obenour <demiobenour@gmail.com> writes:

(add virtio-msg authors to CC)

> On 5/28/26 01:47, Manos Pitsidianakis wrote:
>> On Thu, May 28, 2026 at 8:22=E2=80=AFAM Parav Pandit <parav@nvidia.com> =
wrote:
>>>
>>>
>>>> From: Demi Marie Obenour <demiobenour@gmail.com>
>>>> Sent: 28 May 2026 05:23 AM
>>>> To: virtio-comment@lists.linux.dev
>>>> Subject: MSI-X vector limits and reserving a virtio device ID
>>>>
>>>> I'd like to reserve a virtio device ID for virtio vhost-guest,
>>>> formally virtio vhost-user.  Would this be possible?
>>>>
>>> Vhost user is an implementation of the device.
>>> I believe it stays as implementation and not a new device type.
>>=20
>> This exactly.
>>=20
>> Furthermore, we already have a mechanism for "providing" an arbitrary
>> virtio device; it's called a transport.
>>=20
>> Demi, I suggest you look into virtio-msg transport, which would allow
>> you to do what you want.
>
> I'm aware of virtio-msg, and in fact considered using it.  However, I
> found that virtio-msg doesn't meet my requirements.
>
> 1. Virtio-msg needs to run over a transport of its own.  None of the
>    proposed transports support KVM guests on x86.  FF-A is the only
>    one that would make sense with KVM, but FF-A is specific to Arm.

Well yes. virtio-msg is a common transport that implements various buses
on the backend. FF-A is one but we have working implementations that
just use plain memory sharing for the message bus which work on anything
including x86/KVM. Although it does beg the question of what an
additional transport would being to KVM as it is already well served by
PCI and MMIO transports.

> 2. Virtio-msg isn't compatible with existing frontend VMMs.
>    Vhost-guest can be used with any frontend VMM that implements
>    vhost-user.

What exactly do you mean by frontend VMMs?

The VMM needs some mechanism to expose a VirtIO transport to the guest
be it through probing (PCI) or some machine description like ACPI or DT.
The guest is completely unaware if the backend implementation is using
vhost-user. If you were going to expose that to the guest you will need
some mechanism for that.

For what its worth there are QEMU and rust-vmm implementations of
various virtio-msg backends although we would expect the host UAPI to be
stabilised after the VirtIO spec is ratified (because its not guest
visible).

> 3. Virtio-msg isn't compatible with existing frontend drivers.  While I
>    expect that drivers for Linux will eventually be upstreamed,

This is just plain wrong. No changes are needed to be made to the
drivers as they are transport agnostic.

>    I doubt that drivers for Windows or *BSD will ever be written.
>    I don't even know if the Windows Driver Framework provides enough
>    to write one.  I don't need this myself, but I suspect that this
>    is enough to make virtio-msg unsuitable in many environments.

Why would Windows or *BSD want to implement virtio-msg when they can
already use MMIO and PCI? But nothing stops them implementing it if they
wish.

>=20=20=20=20
> 4. Virtio-msg requires invasive changes to existing userspace device
>    implementations.

No it doesn't. We test virtio-msg with existing unmodified rust-vmm
vhost-device implementations because on the host we bridge between
virtio-msg and vhost-user. In QEMU the transport is abstracted away from
the details of the device implementation - you don't need MMIO and PCI
specific device implementations either.

>    The project I work on doesn't use QEMU, and the
>    existing frontends are targeted at server use-cases.  Using the
>    vhost-user protocol lets me reuse these with little effort.
>
> 5. To the best of my knowledge, virtio-msg doesn't support live
>    migration of frontend VMs.  Vhost-guest uses the vhost-user
>    protocol, which has supported this for a very long time.  I don't
>    need live migration myself, but for many server use-cases, not
>    having live migration is a dealbreaker.

Live migration isn't in scope for a transport (aside from maybe support
device reset/disable flows). The information needed to deal with
migration is between the VMM and whatever implements the device backend.

Indeed I find it a little confusing how live migration would work if the
vhost-guest communication is directly between the backend and the guest.
The VMM is the one that is responsible for serialistion and if it is cut
out of the loop how will it know?

>=20=20=20=20
> 6. I don't know if virtio-msg can achieve comparable performance.
>    It appears to be optimized for reliability and isolation,
>    not processing tens of gigabits of network traffic per second.
>    Vhost-guest is designed with performance in mind.

This is pure supposition. The data plane in virtio-msg is the same as in
PCI and MMIO, shared memory and virtqs. While virtio-msg does support
notifications in the message queue it does not preclude direct IRQ
signalling or indeed switch to pure polling which is what most of the
high speed networking solutions end up doing to avoid the latency of
IRQs.

>
> Vhost-guest is designed for storage and networking appliances on
> servers, whereas virtio-msg is designed for safety-critical embedded
> systems.  These domains have very different requirements, and as a
> result they arrived at very different solutions.
>
> I work on Spectrum (https://spectrum-os.org), which uses Cloud
> Hypervisor.  As the name implies, Cloud Hypervisor is primarily
> intended for cloud workloads, though it can also be used on clients.
> I don't think that an implementation of virtio-msg would be accepted,
> as it benefits none of Cloud Hypervisor's other users.

=2D-=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFLBAEBCgA1FiEEZoWumedRZ7yvyN81+9DbCVqeKkQFAmoYaZoXHGFsZXguYmVu
bmVlQGxpbmFyby5vcmcACgkQ+9DbCVqeKkTk4wf6AokfXLzNP6PWxrGjTsU19W5x
MEayiyyE+2dZOA/vHD6w2qPUFW/HpduURw9egu05NEK4rTSSTPvUMRRuXC6gvesW
UvuuGFHqOeAPZJeG97VvH8cWZ+Tqei23x2onrV0URZZ5Tv6ZXFApp41BsAPtpNuE
fay4P/nbYWBgYdbSjLvrcEw+yNCpY4h+do3dRYhHR1oYYoAD8v2QKuMVGMzm6HUS
fLP/g7re1gWck0P4cXrx+4E2GPh6ofI7EEkiyZS7s55jBcdZRq+1O99Jmduj65G3
/SBiGf3bBOg02fX+qwhO45wyPVj8j2DTtHzMFcqYJ3OEqRdaTK4MJDNIfMVh7A==
=mT+u
-----END PGP SIGNATURE-----
--=-=-=--
