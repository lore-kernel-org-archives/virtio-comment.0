Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153411D79BE
	for <virtio-comment@lists.linux.dev>; Mon, 31 Mar 2025 10:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743417515; cv=none; b=ajbiw5ZX5jHEf2dweYZNw42c9tgXFb9IAiATIs/XYfsNwhTxCla66GvPkBN30LahRNT5tWDcJ29EHeMZJ+WVFC2Sn3Na5jvf7pHjq/e7Zxj4aRx4Ov25L2YEay6Pk0p2/wgLtZ5r4xuNTQdYZhdLWU8aDnCtO+QGfu+J+YVsy5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743417515; c=relaxed/simple;
	bh=honV8eiPucrAK5Fl+ZactaCppFabUYDF3xqNrh+c5oQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E+gryyNmbrBM9NgBdswb0Vi5buLSVEufdXEDJ4E3Mk2Jiy5IvzKtviVHzxzI5LzjSPOO7LCPkn+2RsjQLJ4yFefx7MfBpQciqifxP3FCaLR/ntUSboWxzxn9k1+x79JOuF/acUPDA6+wrKkAct8IJ3CtsWFTzvXq8pQF4ighv1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YAgtzBtS; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YAgtzBtS"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so763486866b.2
        for <virtio-comment@lists.linux.dev>; Mon, 31 Mar 2025 03:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743417512; x=1744022312; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YyESUsuWRi1PC7E+N28GieaBOXFK2R42TwhkserlSiM=;
        b=YAgtzBtSSHdPWr3M/w75ec/WzjoAGyBs+UuCqM5BiHzOH9qj3zmUS8syEJtS1ehKJA
         aws13aRUMKG1XfXEyFzrB/xMSEq3Oy09zjqUfL26a5rENU/1iiMno9M95P9nzH0fp0gi
         1Em+zwnSopC7kR31HSQxsOY0Nl/34JX4bwcyEwOVOae/RdxnK3wqrkQig7iSZWxaQgag
         vujP0Vb7L4dxAPVtvD5UjNILRDcWaG4QUCZDgusUFdAy17RCOBPkGTKM3sU8Hf6VU3Zl
         aecgRflHy/hlmOZ9X4Ly6EkmBagrWY2P/nQalOsDwZ4+879qSTvJMqZvLpXMlXHSQJFH
         HYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743417512; x=1744022312;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyESUsuWRi1PC7E+N28GieaBOXFK2R42TwhkserlSiM=;
        b=noKAWh5PVCdZ3QdK6gYHXtBjxJh8SpKXFzW5UX+MBBawmFcNcZBmmWY3EbmZBocXEa
         Tv1vYVarQjdsn+/dNQRJQ0m9AzHYluYuSUpIQ2iigk9hZOmCbZzt0Bt03i98W/oITRc+
         DQfPubH+rTjsOV8oeo3xZskzXORa6qjSWa0hRexrx+ONObM4oqx6sfyxOKpmCr3y5PoE
         R8D4eVW7y/u+oXO3D2LUl8J/n+etb3QbXrBplv7tuPIV9qnG87FeUWyH2mAXyRghVw1M
         BPBOnUiwAQgkBPBXPxA/8rKxf5zqzodIp+YWMYS/ZZqCHLe1dCg4U4y5bu3r5n1SK5Tf
         Sarw==
X-Forwarded-Encrypted: i=1; AJvYcCU3UMqrjfIQ3aXtyldxdEKho+l0PlVX9vqBDnsMAVWumfM5FABmcTh5wsOpUi9iA8tB38sg0iIw/DHCz//nIw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/n8NsXGb39rN8bIVE6yNp0X4GAVqokPEHcU5uDoi8BvE9bPjF
	VQY9pnj4ZNyiY58EkmFHoddfXbnL0SpTF5q2DqNPuLlja8djDOmsv44NfK8eOXI=
X-Gm-Gg: ASbGncsEO7igEvWtjuWxL1JD8uoUf0hysIgOC79cdHLzCyf2Xiur95vYZms70ut/+S1
	3WEYgnmbwTTS+bTcVTR4X1BxGMTtC9zBudGmDCNTGJEhzgesNWB4iguzaqIzF95ANSKV2NR2+BF
	wTq+pfHjGJ1fWgHXnAESJ/+O9xj0FEqtzof1FLOFvydRXrM1kOWgjvfJXKLBRFilRAd8cXrSoNd
	N1dZpzv559pnznB7Oc1MbyqVQEYsO5KAgxfPRFi92ccKluf+ganfjWtHBGn+DV+dei1TdV52RtA
	ofMJzoaS2DRzmMujWNb4U7z8xzfRSeszkNN4kG9LomZfjS0=
X-Google-Smtp-Source: AGHT+IFSJNZuM5smiQqA7G8jICfD2gJxiBrKvXpSL+O5/DVYSx9dIZxsljVHBGy5SlucMLLSuG8ouA==
X-Received: by 2002:a17:907:6092:b0:ac1:f002:d85d with SMTP id a640c23a62f3a-ac738a0c8ebmr784282666b.6.1743417512285;
        Mon, 31 Mar 2025 03:38:32 -0700 (PDT)
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927b205sm618212266b.60.2025.03.31.03.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 03:38:31 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id BC9785F88A;
	Mon, 31 Mar 2025 11:38:30 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Rust VMM <rust-vmm@lists.opendev.org>, QEMU Devel
 <qemu-devel@nongnu.org>, virtio-comment@lists.linux.dev, VirtIO Dev List
 <virtio-dev@lists.linux.dev>
Cc: Bill Mills <bill.mills@linaro.org>,	Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>, Michael S. Tsirkin <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Dmitry
 Osipenko <dmitry.osipenko@collabora.com>, Matias Vara Larsen
 <mvaralar@redhat.com>, Sergio Lopez <slp@redhat.com>
Subject: Central repo for VirtIO conformance tests?
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 31 Mar 2025 11:38:30 +0100
Message-ID: <87semtpjrt.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

We've been working with Panasonic to expand the testing of VirtIO across
a range of hypervisors and VMMs. We've tackled this with two approaches:

  - simple unikernel to verify features and basic functions common
  - rootfs images to exercise the whole device

The unikernel utilizes rcore-os's no_std VirtIO drivers to discover and
initialize a range of VirtIO devices. The tests mostly focus on checking
no unknown feature bits are advertised as well as ensuring features
dependencies are properly realizable. This is useful for those
interested in moving workloads between hypervisors to ensure you don't
end up relying on a proprietary feature that aren't available elsewhere.

The virgl test also does some very basic blob mapping to check the
underlying mechanics are working.

The unikernel outputs a TAP stream to make integrating into a test
harness easier.

You can find the current state here:

  https://git.codelinaro.org/manos.pitsidianakis/virtio-tests

While we only build an aarch64 unikernel the upstream drivers have
examples for riscv and x86_64 as well.

As more complex VirtIO devices like GPUs tend to have a significant
user-space component, we have also started building Linux rootfs images
to exercise those. The images themselves are built against a baseline
architecture so they can be used on as wide a range of hardware as
possible. They have been built with buildroot to make them lightweight
and as close to the upstream projects as possible without relying on
particular distro support. You may have seen the recent aarch64 GPU
image being added to QEMU's functional tests recently:

  https://gitlab.com/qemu-project/qemu/-/blob/master/tests/functional/test_=
aarch64_virt_gpu.py

I'm currently working on a similar image utilizing a subset of the
blktests project to exercise the VirtIO block devices. The various
recipes can be found here:

  https://gitlab.com/stsquad/buildroot/-/tree/adding-blktests?ref_type=3Dhe=
ads

although the intention is for all the recipes and basic QEMU based tests
to be up-streamed into buildroot in due course. While I will no doubt
expand the functional tests in QEMU over time to utilize these images,
there is a wider question of where would be a good place to host a more
comprehensive VirtIO test suite? While useful for validating proprietary
hypervisors there are also a bunch of other VMMs and VirtIO backends
other than QEMU:

  - rust-vmm's vhost-device collection of vhost-user backends
  - CrosVM
  - Cloud Hypervisor
  - libkrun

As well as using VirtIO backends with other hypervisors such as Xen,
Gunyah and WHPX.

So this brings me to the question posed in the subject. Where would a
good place be to host these conformance tests?

My initial thought was to see if this is something OASIS could host as
part of the specification however I'm not sure OASIS is set up for such a
thing.

We could host it as part of the QEMU project as a service to the wider
community. While it should be pretty easy to expand QEMU's own tests to
work with multiple hypervisors, its test machinery isn't really setup
for non-QEMU VMMs. Ideally we would want the core repository to be able
to run on multiple hypervisors and use different VMMs and backends
depending on where they are being run.

The other option I considered was hosting with the rust-vmm project -
although maybe that just makes sense for the unikernel tests as they are
rust based. We certainly need more automated testing of the vhost-device
repository which can serve as a backend to multiple VMMs and
hypervisors.

So what do people think? Where would be a good place for common test
repository to live?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
