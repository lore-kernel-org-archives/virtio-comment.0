Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EF71E5B8A
	for <virtio-comment@lists.linux.dev>; Mon, 31 Mar 2025 12:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424617; cv=none; b=k2rs5viOmvLs5tl4zzxmGehPO9pih6Ti446fRTznX92ag74aFE0Jc4FDYg8su6BWZuN5NOXsswGrj76KrC9zX8U7IVpdPr2qAw4/I9Ag48FqAoEOWqFJzbRhDsSP33ciafYTbUWkwZfR1HbXYkzD9XdVvl+LVUrzmi3XLGgEbVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424617; c=relaxed/simple;
	bh=Ise6kFs+Bk9HvZp8Y/NAwr6k28qs0LjsdtQM3/5aZRs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YGIZ7d6s+veg4Lb2c13kjmHoGWqjSDuuvLKw2nz5YJuT05zqpd2ffFi4OnMPSG/SLPMfKeCtGBxxd9QX4j2LzANz/GM1N5lcVKqeGboe3pjIgLS8sP4o+QmOGzSJYMqeBpCmx2LLKAFZtdr5It/qfboybOAPL+Lz7Ac19vr5pCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iurXzh6d; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iurXzh6d"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso41271575e9.2
        for <virtio-comment@lists.linux.dev>; Mon, 31 Mar 2025 05:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743424612; x=1744029412; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ise6kFs+Bk9HvZp8Y/NAwr6k28qs0LjsdtQM3/5aZRs=;
        b=iurXzh6difCb2vSr4Jq6Ax7qYgpwn+5KIUP5FSqK3vThCx0Nl+0GfRiUb7aFsfKSU5
         XqhpFKCO0dMLh3znk7xEuAGM9uHUN9YZDe0a7XfziUkDHjtA+OuLNZ/rVgyIHO5EG4Va
         7C595y4rRrAfK3TtsZGSASXTiRf25Bg8BtZT8YonXGUhU5jB5A8pwnVHCtCtA7W/24HD
         DqASvaLHrQAIFpMoOrNUNtdCCCsjEHzM0l5HlzND46IqQni+VI1B7yOZ9FU2BMNgqp74
         aNnxAVBhdHY+4OqcPB++zW9AUqjeZEEeqsZ974hAsOuGJ76HbwwTg4hEykkwGkx4MyzD
         mfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743424612; x=1744029412;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ise6kFs+Bk9HvZp8Y/NAwr6k28qs0LjsdtQM3/5aZRs=;
        b=rAAP4rvsPsYIkRvKcT0cIIaVJ6QPLrX0s0gwqge7RMExKIEsIZvfTIgkRdKhjKgcy9
         +ky862UVodlqOvp4kTZ49jlTHabD+LZ0aYrzFFwkt96IzeOywk5Lr+bHDBPnFqpx5298
         zyb7HL4zU/yrR0G4lYjwrRvghYb5v14YBDOpApD1AzLCePABaXUdpaohhWOFqS2ffLQh
         eQ5xALuqTwE8ggz0ep1FQgiqlOW3F+LUL2yIL9LHifmtkY/9TLtgvglnc6W2OnnTVTm6
         qcKkl/YpEPPqp8la7z7r2xYzC9IBEOFhX2nAISIRioyljgrZC70+bnzn5f+NvM4S7N6c
         d6LA==
X-Forwarded-Encrypted: i=1; AJvYcCU4GUeWw3WexQeq5VkdQBVyTveTThclxn2kR0g6xhHpqudQ0XsfXdLTwGrAUkAB0aIDaaRfSStbvSD+mc3uGw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywuxj02MLeLnMHiSnFqlvVluKDlRtP4jEel1363ax7/XrZGBGD/
	HoaTKIlpXhrgdTL/lsNT9xeVN7YbKLmsInWwO1Ck2tOS1seHMnGT6gxT8T7E5Bw=
X-Gm-Gg: ASbGnct0ZQXrOyabQWYUlQaJyUmfBDuPMeWXOdDVxlqXMhitrUL0CDUk+U4HF9YiKwq
	mmf5sgmoRH1HY612Wu9n4924RSfvsI/S2+27tPjrPKyqwAg6ymFf7JhHB2LnuCtvAwFxdFOhti3
	vLJkpjQnvbFFrJwixdWd23BnEnJtRaAZGQXOMK6CwFXzT4H6GUoxU0TJUxbjPhOdXgGJ5OhcvTc
	+8fxOJt1m2Ne7XIcyW28zPpQC9Hpt27jKZS+1kuC4vLcZV65nnmcno00si7NAryJUhI6771iple
	0DhdPXEIqgHpH7Fh77uH6X0rVu6Qkr4Vyv9vZJsY4iuPYww=
X-Google-Smtp-Source: AGHT+IGISowd1iMuLNmrzCa8B/xCpLWjevxA2URko9uRdlwBGYeLcU6CR4bEnHadtTGpS4ZA1/RFWA==
X-Received: by 2002:a05:600c:4593:b0:43d:23fe:e8a6 with SMTP id 5b1f17b1804b1-43db61e037emr74333555e9.5.1743424612045;
        Mon, 31 Mar 2025 05:36:52 -0700 (PDT)
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm119988695e9.28.2025.03.31.05.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 05:36:50 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id BBD5D5F88A;
	Mon, 31 Mar 2025 13:36:49 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Rust VMM <rust-vmm@lists.opendev.org>,  QEMU Devel
 <qemu-devel@nongnu.org>,  virtio-comment@lists.linux.dev,  VirtIO Dev List
 <virtio-dev@lists.linux.dev>,  Bill Mills <bill.mills@linaro.org>,  Manos
 Pitsidianakis <manos.pitsidianakis@linaro.org>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  David Hildenbrand <david@redhat.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Stefano Garzarella <sgarzare@redhat.com>,  Dmitry
 Osipenko <dmitry.osipenko@collabora.com>,  Matias Vara Larsen
 <mvaralar@redhat.com>,  Sergio Lopez <slp@redhat.com>
Subject: Re: Central repo for VirtIO conformance tests?
In-Reply-To: <CAJSP0QW6=SvLwkuTsZTKqCH9OQJdH8XV32hDZ9Z4o6AbCbOqiA@mail.gmail.com>
	(Stefan Hajnoczi's message of "Mon, 31 Mar 2025 07:58:22 -0400")
References: <87semtpjrt.fsf@draig.linaro.org>
	<CAJSP0QW6=SvLwkuTsZTKqCH9OQJdH8XV32hDZ9Z4o6AbCbOqiA@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 31 Mar 2025 13:36:49 +0100
Message-ID: <87msd1peam.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Mon, Mar 31, 2025 at 6:39=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@lin=
aro.org> wrote:
>> The unikernel utilizes rcore-os's no_std VirtIO drivers to discover and
>> initialize a range of VirtIO devices.
>
> https://github.com/rcore-os/virtio-drivers
>
> I noticed that VIRTIO_F_VERSION_1, VIRTIO_F_RING_PACKED, and hardware
> device support are missing according to the readme. Those are
> important features for real-world test coverage.

At the moment most of the testing is around feature negotiation so we
don't get to the point that we are need packed virtqs. However it would
be useful to upstream such support for their use generally - I know
there are some downstream projects that have stuff to upstream in due
course.

The original idea for the feature bit tests was to utilise the kernels
kunit framework. However that was outside the scope of what kunit which
is really focused on testing kernel internals rather than the HW
interface.

We did consider expanding the kvm-unit-test uni-kernels but that would
either involve importing kernel bits or a fairly big C re-implementation
of it. At least by expanding the rcore-os drivers we will have two
different driver stacks in two different languages.

> Or is the idea to use the unikernel for low-level device
> initialization and the Linux image for tests that do I/O?

So far the rootfs images get by far the largest coverage because they
can more easily trigger a whole range of conditions. While VirtIO is
intended to be OS and hypervisor agnostic Linux remains the system with
the widest and most functional coverage of the interfaces.

>
> Stefan

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
