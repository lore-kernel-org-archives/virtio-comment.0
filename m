Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B93E2367CF
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jun 2026 03:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781148674; cv=none; b=VFqZvXL7539UqB5yrR77bYIxBqODI/50SoR1E7CIEIVCOuXGQSlehsjgrFaZIRtQoLBSwk67hR0d8JckgZhtFjrcK2oaIxjMsOcJqlgjgU+ackkzHq4OFcuHAlOEESDUyNqkqZ7p68GG7M2yXxenhCFIjZc82+NT8bTk7N+4onU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781148674; c=relaxed/simple;
	bh=DBeMlPfjVpAv80SA6a7h7AahiPh1ASCNdKR3hijQFBA=;
	h=From:Message-ID:Date:MIME-Version:Subject:Cc:References:To:
	 In-Reply-To:Content-Type; b=F3MSNXbyyWJL+8Z/P53VeU/T8UDMzv/3PhnCOBZEJU2iy75wTuF+B1M1zCLly8OuVlHuvnKMRJJNu8GZ1e6kHKkebAEx/LSnxkGh+fyPJ1GJ/L7i6wHc0BDlAeMFp9F4A9Rz9PrXJ1Xj/dfg450JeR8rGWAmpftOB7y0EQNRY5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNuAXUsj; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNuAXUsj"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7efd49373c0so52742837b3.1
        for <virtio-comment@lists.linux.dev>; Wed, 10 Jun 2026 20:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781148672; x=1781753472; darn=lists.linux.dev;
        h=in-reply-to:to:autocrypt:content-language:references:cc:subject
         :user-agent:mime-version:date:message-id:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=khh7jHkDnMV2bYVXLAI/S2AfWBo0xB7/ejkIYx7U+JA=;
        b=LNuAXUsjHKUPm/7bT6LuZTglZ92e7T45c1tmbvmYNd4uRJURblB8NlMrPwGMxMFrEN
         pM7x3DtRUapk3wTTVWbzSlfKAiGYiyybtj9D+akk/BGWl/0RCc0BcOuQQ1PWyUfJzqkl
         mi19YmJpFzptL2oFqgkyVJmHHUW3GyS9Snyakq0GlC5ISgbYvImOPZOVv9tggbAcCWKP
         d2QqzM3/vtt4WPtueGKFIJdfR7GVFDkhWJnXnLVCeRhJ89XXOgba+J8zvPr4r3+XlJ/t
         guZYPtnCt98adBCGwadbpA2oJt9v5AAnv4GB27vpGgVPvN1R9qNH9GjU5dNa8yYXyJH6
         efjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781148672; x=1781753472;
        h=in-reply-to:to:autocrypt:content-language:references:cc:subject
         :user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=khh7jHkDnMV2bYVXLAI/S2AfWBo0xB7/ejkIYx7U+JA=;
        b=r1Lb88q78cTejfzsXtrgqLvj90/tRJSMbJkfbvHFqZ2vdnRsdH15hp0K3NefYWuFK5
         Mzwt75o8dO2UM/BUelTs3TkeTDGK2K52pFHFtXKxCHJiVDzfjZMOfIBUjtyBZjV3nrqq
         NFAb8r37wlIBUipuqrkTOCwR18G9yzOunNS5PkMmb1U52Jzl61RwiAACoMsYdaOmDlVy
         lWQ7Eja0ZUR+5uoaXzCNVA38975nHS4znhZa+Vt9Lv4rFU2Ki83mqGVXYi9KwM/MdT7C
         toyNnhbdrir/es2r4WMH9pw9fpc5GBDBh3CycRcys/mQj/rUlFQVZYWRAxaoSgXMDsYI
         cCEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TAfPnjE7wPNoNF0Suswdk+NSlgQD4buj0KWpg8OI8ef24jgFmgtI2CszcJHEDY91uBu0zYv698BxyBFJMyw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzY10X7fRIFJG7Bui709OrAWIfX0MNdCwbCMYhVFk5a7lcvVt81
	oGcE8RVu6jKiDJJa2/0u/EOQWkAplrBHJ/uAXRgYcYOMIyRaLlNoVQmP
X-Gm-Gg: Acq92OEtaw8FGL5PB1ozlo+hArf5BvJwWqLd/ochLfloYyD3M5f4nzRdHminoDxsFSg
	emQOjqooD/tsfCaUD+CXXDFTfOXTIIWp0W+MaekA1wm6EMbl+IVzO6OoSYVXnN2XrGqrHX89VrZ
	vHHo5NQZJqDZ0rbau7+lbuVNK5oB/dXBmqVj/yOXnhMJEPFrWWSl8TDxxZRB6GttDUqcTNowDvU
	nI1wlc7216duwjRbHQIgOyK6fpf9OWxKbZNBKKZpjTg5gZscEERWn6ifLmHL87tvCpqaCgSYXkF
	omXseQXnTxk2Yr6OVBUGpsqsMrmwzh8hCZet7eFK2BLQzH9XVGjWAOw77vcusjvNReAHHCscQzR
	nNuxAI5Ttvywt5iji6jgdhFkFey3LRWqAkUFGBOZFDB5Q/nWB/9cUWCOfQJIGGAKQemQXcQSxDb
	0gU6bp+iB3wvo94P+4lYTOdkpQEQCaLHMudHToTBj2pD1JvbpoDw41J6kmGXOTJLmEIvLY8KQZM
	swx5ARfEuFfFmBeOO6a2rjYlu1EvntoxEgC5yLSrnoJvwhq/ei2BiY=
X-Received: by 2002:a05:690c:e3d3:b0:7f5:6009:7669 with SMTP id 00721157ae682-7f651eeaa6cmr13743917b3.0.1781148671843;
        Wed, 10 Jun 2026 20:31:11 -0700 (PDT)
Received: from [10.138.34.110] (h69-131-147-66.cncrtn.broadband.dynamic.tds.net. [69.131.147.66])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7f695fb985dsm810237b3.38.2026.06.10.20.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 20:31:09 -0700 (PDT)
From: demiobenour@gmail.com
X-Google-Original-From: junk
Message-ID: <d0d53bd1-f9ae-4f43-8f64-c0aa04075f0e@gmail.com>
Date: Wed, 10 Jun 2026 23:31:04 -0400
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Vhost-guest (was virtio vhost-user) vs virtio-msg
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Parav Pandit <parav@nvidia.com>, Alyssa Ross <hi@alyssa.is>,
 Spectrum OS Development <devel@spectrum-os.org>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Bill Mills <bill.mills@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <11771164-7919-43e1-a980-03f036bdae2e@gmail.com>
 <SJ0PR12MB6806C5A16CB0899E095E835EDC092@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <CAAjaMXYGMTok_a2CJK8aKSqbTbgLx1CbkCVZw2VnZdJVuPJ38w@mail.gmail.com>
 <4ba67246-3a2b-43ee-b827-000c16ff07ed@gmail.com>
 <877bonqzqo.fsf@draig.linaro.org>
Content-Language: en-US
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
In-Reply-To: <877bonqzqo.fsf@draig.linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fRATFYQRPev4YgSHgwMMsWhM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fRATFYQRPev4YgSHgwMMsWhM
Content-Type: multipart/mixed; boundary="------------TGTweTYxhqWutEJVAIEnqlbR";
 protected-headers="v1"
Message-ID: <d0d53bd1-f9ae-4f43-8f64-c0aa04075f0e@gmail.com>
Date: Wed, 10 Jun 2026 23:31:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Vhost-guest (was virtio vhost-user) vs virtio-msg
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Parav Pandit <parav@nvidia.com>, Alyssa Ross <hi@alyssa.is>,
 Spectrum OS Development <devel@spectrum-os.org>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Bill Mills <bill.mills@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <11771164-7919-43e1-a980-03f036bdae2e@gmail.com>
 <SJ0PR12MB6806C5A16CB0899E095E835EDC092@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <CAAjaMXYGMTok_a2CJK8aKSqbTbgLx1CbkCVZw2VnZdJVuPJ38w@mail.gmail.com>
 <4ba67246-3a2b-43ee-b827-000c16ff07ed@gmail.com>
 <877bonqzqo.fsf@draig.linaro.org>
Content-Language: en-US
From: junk
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
In-Reply-To: <877bonqzqo.fsf@draig.linaro.org>
Autocrypt-Gossip: addr=hi@alyssa.is; keydata=
 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
 PMu8tBGvtGVA

--------------TGTweTYxhqWutEJVAIEnqlbR
Content-Type: multipart/mixed; boundary="------------d8cKLaUFbckTHM0K0FSJ1J3w"

--------------d8cKLaUFbckTHM0K0FSJ1J3w
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5/28/26 12:13, Alex Benn=C3=A9e wrote:
> Demi Marie Obenour <demiobenour@gmail.com> writes:
>=20
> (add virtio-msg authors to CC)
>=20
>> On 5/28/26 01:47, Manos Pitsidianakis wrote:
>>> On Thu, May 28, 2026 at 8:22=E2=80=AFAM Parav Pandit <parav@nvidia.co=
m> wrote:
>>>>
>>>>
>>>>> From: Demi Marie Obenour <demiobenour@gmail.com>
>>>>> Sent: 28 May 2026 05:23 AM
>>>>> To: virtio-comment@lists.linux.dev
>>>>> Subject: MSI-X vector limits and reserving a virtio device ID
>>>>>
>>>>> I'd like to reserve a virtio device ID for virtio vhost-guest,
>>>>> formally virtio vhost-user.  Would this be possible?
>>>>>
>>>> Vhost user is an implementation of the device.
>>>> I believe it stays as implementation and not a new device type.
>>>
>>> This exactly.
>>>
>>> Furthermore, we already have a mechanism for "providing" an arbitrary=

>>> virtio device; it's called a transport.
>>>
>>> Demi, I suggest you look into virtio-msg transport, which would allow=

>>> you to do what you want.
>>
>> I'm aware of virtio-msg, and in fact considered using it.  However, I
>> found that virtio-msg doesn't meet my requirements.
>>
>> 1. Virtio-msg needs to run over a transport of its own.  None of the
>>    proposed transports support KVM guests on x86.  FF-A is the only
>>    one that would make sense with KVM, but FF-A is specific to Arm.
>=20
> Well yes. virtio-msg is a common transport that implements various buse=
s
> on the backend. FF-A is one but we have working implementations that
> just use plain memory sharing for the message bus which work on anythin=
g
> including x86/KVM. Although it does beg the question of what an
> additional transport would being to KVM as it is already well served by=

> PCI and MMIO transports.

My goal is to enable device implementations that run inside a VM,
rather than running on the host, for sandboxing reasons.  The PCI
and MMIO transports don't natively support this.  The purpose of
virtio-vhost-user is to add such support to the PCI transport.

Virtio-msg in KVM is definitely an alternative, but none of the
currently-proposed transports can be used as-is:

1. virtio-msg-ffa is specific to Arm.  Furthermore, the Xen
   implementation is not security supported, and I don't know if the
   pKVM implementation has been hardened against denial of service
   attacks.  The ones in Hafnium and TF-A were not last I checked.

2. virtio-msg-amp requires a (real or emulated) PCI connection.

3. virtio-msg-loopback is only within a single VM.

4. virtio-msg-xen is specific to Xen.

5. virtio-msg over admin virtqueues has not been implemented
   yet, whereas virtio-vhost-user has a nearly-complete device
   implementation.

Additionally, I would much prefer to reuse the existing vhost-user
protocol between frontend VMM and backend VMM.  This avoids having
to implement a third protocol on top of virtio-user and vfio-user.
Virtio-vhost-user maps to that protocol trivially (by design).

It should be possible to define and implement a virtio-msg binding
for virtio-vhost-user, though I have no particular plan to do so at
this time.

Additionally, virtio-vhost-user has more features than virtio-msg.
Some of these features are very useful, such as including the backend's
migration data in the frontend's migration stream.  Implementing them
in virtio-msg would be a nasty layering violation, whereas implementing
them in virtio-vhost-user is natural.

>> 2. Virtio-msg isn't compatible with existing frontend VMMs.
>>    Vhost-guest can be used with any frontend VMM that implements
>>    vhost-user.
>=20
> What exactly do you mean by frontend VMMs?

The frontend VM is the VM that uses the virtio device.  The backend
VM is the VM that implements the device.  The frontend VMM is the
user-space code that runs the frontend VM, and the backend VMM is
the user-space code that runs the backend VM.

> The VMM needs some mechanism to expose a VirtIO transport to the guest
> be it through probing (PCI) or some machine description like ACPI or DT=
=2E
> The guest is completely unaware if the backend implementation is using
> vhost-user. If you were going to expose that to the guest you will need=

> some mechanism for that.

With virtio-vhost-user, the frontend VMM runs a vhost-user client.
It exposes an MMIO or PCI device to its guest as it normally would.
The frontend VMM and its guest aren't aware of virtio-vhost-user.

> For what its worth there are QEMU and rust-vmm implementations of
> various virtio-msg backends although we would expect the host UAPI to b=
e
> stabilised after the VirtIO spec is ratified (because its not guest
> visible).

Would you mind elaborating on "host UAPI"?  Do you mean "UAPI for
implementing a device"?

>> 3. Virtio-msg isn't compatible with existing frontend drivers.  While =
I
>>    expect that drivers for Linux will eventually be upstreamed,
>=20
> This is just plain wrong. No changes are needed to be made to the
> drivers as they are transport agnostic.

I meant the exiting *transport* drivers. =20

>>    I doubt that drivers for Windows or *BSD will ever be written.
>>    I don't even know if the Windows Driver Framework provides enough
>>    to write one.  I don't need this myself, but I suspect that this
>>    is enough to make virtio-msg unsuitable in many environments.
>=20
> Why would Windows or *BSD want to implement virtio-msg when they can
> already use MMIO and PCI? But nothing stops them implementing it if the=
y
> wish.

If VM A is going to expose a device to VM B using virtio-msg, VM B
needs virtio-msg support.  With virtio-vhost-user, VM B gets a MMIO
or PCI device.

>> 4. Virtio-msg requires invasive changes to existing userspace device
>>    implementations.
>=20
> No it doesn't. We test virtio-msg with existing unmodified rust-vmm
> vhost-device implementations because on the host we bridge between
> virtio-msg and vhost-user. In QEMU the transport is abstracted away fro=
m
> the details of the device implementation - you don't need MMIO and PCI
> specific device implementations either.

Makes sense!  I was not aware of QEMU having that abstraction, but
it makes sense that it does.  rust-vmm really ought to also have
an abstraction, so that the same device implementation can support
virtio-vhost-user, vhost-msg, vhost-user, and in-process virtio.

>>    The project I work on doesn't use QEMU, and the
>>    existing frontends are targeted at server use-cases.  Using the
>>    vhost-user protocol lets me reuse these with little effort.
>>
>> 5. To the best of my knowledge, virtio-msg doesn't support live
>>    migration of frontend VMs.  Vhost-guest uses the vhost-user
>>    protocol, which has supported this for a very long time.  I don't
>>    need live migration myself, but for many server use-cases, not
>>    having live migration is a dealbreaker.
>=20
> Live migration isn't in scope for a transport (aside from maybe support=

> device reset/disable flows). The information needed to deal with
> migration is between the VMM and whatever implements the device backend=
=2E

Virtio-vhost-user has a different scope than virtio-msg.
Virtio-vhost-user lets you run a vhost-user server in a guest instead
of the host, so its scope includes everything that is in scope for
the vhost-user protocol.  That includes live migration.

> Indeed I find it a little confusing how live migration would work if th=
e
> vhost-guest communication is directly between the backend and the guest=
=2E
> The VMM is the one that is responsible for serialistion and if it is cu=
t
> out of the loop how will it know?

Live migration is a control plane operation.  On the sending side, the
backend VM sends migration data to its VMM over a dedicated virtqueue.
The backend VMM then forwards the migration data to the frontend VMM
over a pipe.  On the receiving side, the frontend VMM sends the data
to the backend VMM over a pipe, and the backend VMM sends it to the
backend VMM over a virtqueue.

This feature isn't in any of the currently published virtio-vhost-user
specifications, but the version I plan to submit to this list will
include it.

>> 6. I don't know if virtio-msg can achieve comparable performance.
>>    It appears to be optimized for reliability and isolation,
>>    not processing tens of gigabits of network traffic per second.
>>    Vhost-guest is designed with performance in mind.
>=20
> This is pure supposition. The data plane in virtio-msg is the same as i=
n
> PCI and MMIO, shared memory and virtqs. While virtio-msg does support
> notifications in the message queue it does not preclude direct IRQ
> signalling or indeed switch to pure polling which is what most of the
> high speed networking solutions end up doing to avoid the latency of
> IRQs.

Are shared memory and direct IRQ signalling an option for virtio over
admin virtqueues?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------d8cKLaUFbckTHM0K0FSJ1J3w
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

--------------d8cKLaUFbckTHM0K0FSJ1J3w--

--------------TGTweTYxhqWutEJVAIEnqlbR--

--------------fRATFYQRPev4YgSHgwMMsWhM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmoqK/kACgkQszaHOrMp
8lNIDA//U/tL2Ramk+CINqMsOW8IhlizHTApJTy9ZEdY3yE8nquNT8xM8w4iirXk
0gjkAbGCyAlIyIEaeNbn+NkP/GY4XozO3U49VB53pOzawXayUHSNGRJw+Gd4XJLV
RXHSkVczAVm+PZvkksG9gLMhs2T7RQtmG7rGqxXevJGlzbsmn6fwTQgUZfRfytec
QLo31Jwzj4YjENTFg1gqPCRDk8iwkP7W9JeLsBiQ3gLtgFABqWTnYuRkPsG1Did+
xg62BYTVg+sW04xWBn3kNhFgPakquAK+mcCmx3igoWEpd07PV4TNgjmPrHHvaOXF
ONJyh+ASK2StBfKVypTr3h1r4V74iFE79n9WLGF8D5vJZ3MKOGH72OuyVkTBpCj1
eZhVhrHM5v8FCe/Bpz1KXo+f1vFZvlbOen89gIbQO+C4WSk3su/aEbZDw8x3rnyq
rmCbiLOHI6r22IiKldmerA5sXAMzXw0DbvX9n5rxqbQ/RFkDQtj0wwTlIWaEg2lj
asc152hGfsJLqdXPsUixX0sYHn/vinc3+VxU22cgBNMfHKfBKro89JyPQu8q1BrG
O0MIFVWkyUz0RR4PIlYe6NxCRVbcjrRJQ47ymlv7vu1JjTr5Rel6GYKNlzXMHbV8
dMPZDjlqnY24rxcHbDgfDjMobxOV/ldx3hJtfe+kKGfl2NOXuXw=
=wtEH
-----END PGP SIGNATURE-----

--------------fRATFYQRPev4YgSHgwMMsWhM--
