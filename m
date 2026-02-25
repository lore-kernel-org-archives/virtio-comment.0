Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C46327280F
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 15:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032911; cv=none; b=ezI3fAI3WBf15nyHFTfTM/fW3vsUjysBwdw3IQ8Uubarqeeo34jJdS8VhtAOYa5ozfvQ8OsWn5Op4r6s4MNVl4STYUtUvfxf1iG21M6ycOKZgXBXKQA4Xhv3ZRdR32F1t7bzZD6uGbec+6wvljKJxjQ5Vk5Q/XyZdIb5Zc6GCxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032911; c=relaxed/simple;
	bh=cP/PqhCix7l1oq72tS+vIXxZ0Kz4ubHS3XxiGjxIAm0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WurEv3VR8MaiFwUaOieOULusAp9Rw50Jq+wmUQLBva1J+WpB9R9no2Ry+pV7vRMdAhlBkvhS0TODEBeTSAiOhHftswaqO4zpQ9Zt3tLwU0+NGWtq/Oy73Mh+nLAvDct4c7t/KRZoZCXbPSXXcwrTx/gKewFsYcohqILDD63OJWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JYYY7nTi; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JYYY7nTi"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8f92f3db6fso1127649466b.0
        for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 07:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032908; x=1772637708; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhmCnRq4egt/Q+aCqNMsPCThW0IsbU7a7SUil2rQ9jo=;
        b=JYYY7nTiEw6EU1+wCMFV3eXCNTMhUplBJYXrIpQ5nm28JE0DJSo1XW0J1AbeeotNZ5
         Z4YzNlw/va8dr5+kBZDOtV3T6Q/ZyEqn+/7pO5WUE/pXXChndnvXOOqAvM0uGDg8c5gF
         EMm5ua6ELkErRspULXrzihx1Z5SDI74N+OSgJAkAGkSU9++uFMvLDc5EUu0/9dw5gDwH
         R25nU56pf3VWfT/lio6OVX5VJ87izJRkSpsbYV3wcd/Wr8UMHW21xfHk294UYnfhPY/L
         Se7/ltsypqL2vfmp6QP+waiZMy+6Rwq5yGoKa4uVV8atoI75oR4u51vkKZxD3yetqHC5
         Bjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032908; x=1772637708;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MhmCnRq4egt/Q+aCqNMsPCThW0IsbU7a7SUil2rQ9jo=;
        b=eyRr5m3BB9WOJBo8jWxm+2RfHWQ5k+5aVm9DhufO0zaEqWaSAeHtv23wmswtwsfl+9
         82Wo9+7j6d6CD4nPIuzTK+qlZROSSvBMVb0OFyNowPhQd+8P0LeKtHsEMEjZHs/YzJUe
         nWWaaV8K3wCnmjPotxQRZT9FHoAW32mc9IUewE8c1Btzc+NxidUcGfPnHCAASspq1xWX
         DZBP/5YpczjO+kJ7avuJNdBWbFCL+tamSA6QuafaVB2Yuqy6m/6OOild07l1v1i7dsul
         9QI4gYSYXdJSx3HyqT89a8NlxgjBBQDvVAD6T2lKTHxbgzAZ31XBVxRgPm/8RbZ5ZFIh
         7e3A==
X-Forwarded-Encrypted: i=1; AJvYcCW2IptJeYwPPDqDFX1oaeU+GO9ZQoJ5lCsVO/VIYCiCWpqjss500CmGJWG+EXDvuC2KtG1eHdF+R8IgelDDkg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw61+pbQsLSX1d3LbjYjZbL4C8NvU5ef6dE6sfIc2b5N/swCswV
	2RQ3rBNsoUIb9YPFX10UaW0bdf2/UleR23sPbaxI7hwn/82GfDEcEA1myVfKQvpv+XU=
X-Gm-Gg: ATEYQzy4Gs8yanhYZybiSqNVuCtPV0YPRO+ZihjdnwCvh6hjMCRVzDtsZVD70c0H7mg
	GhQXTNfVL+55/UZ1zydy4zM877kyP0lAf4RjCPKD0ezyEEehh7/ulULTvuPa95MiQuMpzf1Lims
	tob+ivJ40ZN53S5xFpg7PbLOlF8Q6MjvCuYQ2kPBVpIzx+vyIzgIYxYMdFxd6Ha6tNFc1Xry5lK
	mNS45hll62hPQCam37d69NjfNEXD+HxUkClTCcD7hGFAhsxusO7JuAE4QNcNcsG/LqE6SieYosG
	XWEOaEojeCAW6Y0RcfmOkgv7WlToATfOU8WupZLtF+qshWK20zTj/wo0vEoaUB3VBVVauu51VTO
	1ncSLuuoRICFPGtEj0FjSsFSfZoETKOdYOdCXt7KfZc999YjCp7so6ACAkoUSTSSTqigFc94VQD
	DXnCUEIVBsQ87wVGaquFizuwdrZUMXJz1XgA==
X-Received: by 2002:a17:907:3f95:b0:b8f:9ef2:bfac with SMTP id a640c23a62f3a-b9081954710mr1070778466b.12.1772032908190;
        Wed, 25 Feb 2026 07:21:48 -0800 (PST)
Received: from draig.lan ([185.124.0.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084f18f7asm528899166b.66.2026.02.25.07.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:21:47 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 984005F87E;
	Wed, 25 Feb 2026 15:21:46 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Bill Mills <bill.mills@linaro.org>,  virtio-comment@lists.linux.dev,
  Bertrand Marquis <bertrand.marquis@arm.com>,  "Edgar E . Iglesias"
 <edgar.iglesias@amd.com>,  Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>,  Viresh Kumar <viresh.kumar@linaro.org>,
  Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
In-Reply-To: <3c414235-ab96-4c25-87a0-bffcaa41b09d@gmail.com> (Demi Marie
	Obenour's message of "Tue, 24 Feb 2026 12:57:27 -0500")
References: <20260126163230.1122685-1-bill.mills@linaro.org>
	<3c414235-ab96-4c25-87a0-bffcaa41b09d@gmail.com>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Wed, 25 Feb 2026 15:21:46 +0000
Message-ID: <87342o26id.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Demi Marie Obenour <demiobenour@gmail.com> writes:

> On 1/26/26 11:32, Bill Mills wrote:
>> This series adds the virtio-msg transport layer.
>>=20
>> The individuals and organizations involved in this effort have had diffi=
culty in
>> using the existing virtio-transports in various situations and desire to=
 add one
>> more transport that performs its transport layer operations by sending a=
nd
>> receiving messages.
>>=20
>> Implementations of virtio-msg will normally be done in multiple layers:
>> * common / device level
>> * bus level
>>=20
>> The common / device level defines the messages exchanged between the dri=
ver
>> and a device. This common part should lead to a common driver holding mo=
st
>> of the virtio specifics and can be shared by all virtio-msg bus implemen=
tations.
>> The kernel implementation in [3] shows this separation. As with other tr=
ansport
>> layers, virtio-msg should not require modifications to existing virtio d=
evice
>> implementations (virtio-net, virtio-blk etc). The common / device level =
is the
>> main focus of this version of the patch series.
>>=20
>> The virtio-msg bus level implements the normal things a bus defines
>> (enumeration, dma operations, etc) but also implements the message send =
and
>> receive operations. A number of bus implementations are envisioned,
>> some of which will be reusable and general purpose. Other bus implementa=
tions
>> might be unique to a given situation, for example only used by a PCIe ca=
rd
>> and its driver.
>>=20
>> The standard bus messages are an effort to avoid different bus implement=
ations
>> doing the same thing in different ways for no good reason. However the
>> different environments will require different things. Instead of trying =
to
>> anticipate all needs and provide something very abstract, we think
>> implementation specific messages will be needed at the bus level. Over t=
ime,
>> if we see similar messages across multiple bus implementations, we will =
move to
>> standardize a bus level message for that.
>>=20
>> We are working on a few reusable bus implementations:
>>=20
>> * virtio-msg-ffa based on Arm FF-A interface for use between:
>>   * normal world and secure world
>>   * host and VM or VM to VM
>>   * Can be used w/ or with out a hypervisor
>>   * Any Hypervisor that implements FF-A can be used
>>   * We have this working with pKVM and Xen
>>   * We have this working with Trusty and OP-TEE
>>=20
>> * virtio-msg-amp for use between heterogenous systems
>>   * The main processors and its co-processors on an AMP SOC
>>   * Two or more systems connected via PCIe
>>   * Minimal requirements: bi-directional interrupts and
>>     at least one shared memory area
>>   * hvac-demo has 2 demos of this
>>   * This is working on two hardware platforms
>>=20
>> * virtio-msg-loopback for userspace implemented devices
>>   * Allows user space to provide devices to its own kernel
>>   * This is similar to fuse, cuse or loopback block devices but for virt=
io
>>   * hvac-demo has a demo
>>=20
>> We also anticipate a few more:
>>=20
>> * virtio-msg-xen specific to Xen
>>   * Usable on any Xen system (including x86 where FF-A does not exist)
>>   * Using Xen events and page grants
>>=20
>> * virtio-msg over admin virtqueues
>>   * This allows any virtio-pci device that supports admin virtqueues to =
also
>>     support a virtio-msg bus that supports sub devices
>>   * [We are looking for collaborators for this work]
>
> Which transport, if any, would be suitable for communication
> between a KVM VM and a userspace process

I think vhost-user already covers this case well enough. However there
is no reason the VMM could terminate a virtio-msg bus and pass the
messages across vhost-user to a device backend.=20

> or between two KVM VMs?
> Would this require a new bus?  If so, should it be implemented in
> terms of vhost-user?

If you want the backend for a VirtIO device in another KVM VM that I
suspect you want to avoid a round-trip through the user-space of the
VMM. If FF-A isn't an option the hypervisor could support some sort of
minimal hypercall transport to pass messages between the two.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
