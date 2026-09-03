Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CE533F8DC
	for <virtio-comment@lists.linux.dev>; Thu,  3 Sep 2026 02:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788401722; cv=none; b=bLJTXOf6kbgdnDrL1LwCHR7oKSnD0PawZ5XUQXPXdGKE9zMrJzcvbkqZjJoB889LEBWWL+x1VSQxoVBUkShWpaq8QvsslHV3zftZk65QBeOetuP2L88h+q1Wk/twF0PRaF56fqyTDDh7LBlUpngsvvQSMl+nPa41KrUmIKSQEvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788401722; c=relaxed/simple;
	bh=UvspVz53nTLqMN7xOMuDdBfRR0qNHXSo1A97dXRGgZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=muE/FiZIBQjG//iCt1YC/70Y/R9oJyMaoliaeYODZNbolbGJhYgAZoOkAe3MM7sETn5UvrT/zSc2LVPCgeDQ6bTMOuIfqljQULnSZ+9lz9DbevymC5RU4Q3bBeE18jQeIO13jTFoPFtaWKrZhvtoaHXNJgWXcZEBlefj4SMyLWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=cD0HbRIF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ypw+raCJ; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="cD0HbRIF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ypw+raCJ"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 920CB1D000BF;
	Wed,  2 Sep 2026 22:15:17 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 02 Sep 2026 22:15:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to; s=fm3; t=
	1788401717; x=1788488117; bh=6O3+Wnj/LuSJki7N5b1LHPCLkHupTGp0rnH
	JzXSlFek=; b=cD0HbRIFZ6vZT3J618/72byhqvCV6q8K4EsgVSTbeFOFkmED5Da
	5LT22MvWpfQNSlW80mUvi9UJNDD87I9QrHINL+jAo54eo6CikRxbjUzFTaNsndPq
	vnxmqUXKTkEq5UZx4UGn6Km2jTtaptdja5LdO4Rasz1jK8SBtQyZH9RXI8e2yPUz
	23vhz94a3GRznFOlrsEGcJWvNjLiSykVSzHlrO1Sjczq/h6MtLUfQTc7+hBzpGef
	D9rno5nbmli6YIXzgYANePet1OAqWrUTr3Mx3UnSI37sBXlCzdpcOWXli/MSLiFB
	9RUtexkritX2/BQRL29qjMyQtni0yYUwnVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788401717; x=1788488117; bh=6O3+Wnj/LuSJki7N5b1LHPCLkHupTGp0rnH
	JzXSlFek=; b=Ypw+raCJaLsRYshY9VbmVjw9NKiqrAQ6WuNcNnRcbBVueHcPJM0
	/KL91mKvvTaZm6cy5TigtUv+S3gvl44y+EVTDuoQJoVvZiGolKKa/eAJVXl+eeJp
	jLxourEnn0yXwbcaUzDijPNhvxcuZG3/kwfqdNUjfNK4pJvSzj0azkM20Wnx7MVC
	JnVj2aqznKw2SAaFL+/laZqSsVxiujCFcWgb2RdX2+h7uIArb7Y9meVcT9oP8OJw
	K5/d7g4kvounmNEsuhVhfx31tqFT7SC5oCDbIPIuP5Kt/lMCBTZ2qXN5nh6r02TY
	+Fti/MVasm4So1fdienxZf3A/Zc/DCzSLOQ==
X-ME-Sender: <xms:NdiYagJ3dlvtZUmaU4SbOa_5i541yzPbNHI50GabJitnYZgFw8aBZg>
    <xme:NdiYasteAEqAKAUtoJhIP1EWmb1r8aNJTneDTS022fsGAUxq2cZ5-gz0eBW8ydKG0
    3rgVfz0TsZtZ5jbYeLe7FqtT1hZmPTRGYx_yxMDLKLx_WhMqZg>
X-ME-Received: <xmr:NdiYalL3HLgQuQn--b31yNvaRVov0rBpMsfJQYG9HLMIZ9leEmRuYKNWaT-qWKmFe1decmXn8syrliU3StkLi22mSMH7w-XGMvINnK23zzHp3aTkLrg3dKN-3CjvDQ>
X-ME-Proxy-Cause: dmFkZTGLv1k3PAMhpZtx65Tnn2x8jVGzT1nlsyuy43uMHDJ+45OzRZHeUnNSSuIyn+xN9K
    g3+Nhyn2h9x9FEij750eYj5jWE3nA+RANiEAXGrkbOVSPJnck5y+qkjpktx8CMRE72gUaq
    oR1yxJaKbK+jVIQ9STUCR4YLQ/q6MHjw0fZtaxM1y4vgcubSbHbDhwTzrXkSBlislUEite
    iyXAAn59RmNzpvZPZKSw/fCwKR7UE0iSLQB4U4+jEqd/rOSYKjXzQevXar/QWkpU91YNxa
    PstLfT0XEkd/ZWRjsl1RMeqx5ABy/x9Ciz0HvtWsx38D+eoNd900sm0wTw4AAJ/A7QZ/pS
    ebvKx/57SBhxHvQMOZYUqiG3Ow6QrOjVJ6eDvkkdEIhc4Mfqa2vdZvopuPORX83knW329+
    ujJoliIVxltmgJaI+tRI8ftOf2cu3jU3Km/sVq4eFlTB8NZhcRretUqVkZ4TNGR4FgqZM7
    ZdI2tp6mySLTciEPY2EFpTU5q/vLLs9Qo+gKrw8xdgWszA/1L5VngKdN6qbj7vf3yleE0p
    UUQw0jMVxTVQJZsbszRXkuW8FQdYwXbT/mdNUB31fy8uGTKiHIhDJXisKx7S1Vh41Y7eEQ
    JYYHX3gsEDggsbPn9Vu9ewkzyspD/FWOqLnh7UoHd1p4914DY1My9b6kFxlg
X-ME-Proxy: <xmx:NdiYakP7lbY6A_2HvWJMpP1ZhCmntKWDCnYMwD_ZyHqe1P1UUvh0Dg>
    <xmx:NdiYaoUFfJUgSEo1tHnDVks3WERyEO1F2jB3Zr6y9jKoh-GqGMD2Yw>
    <xmx:NdiYailPYlgdgrHN-g1D2JgiNzDsAkpBckoxwDj_BLEJfioAkf537Q>
    <xmx:NdiYanPzhhB_vfbFsKtWoQu1DIF4GMs-3om-gzogs1FGPxsvRGURUw>
    <xmx:NdiYanxGsJ7eLAH7VBWsiPVklbfMDmJkNbxx_A6gYSsgn8Av9gML3QWY>
Feedback-ID: i001e48d0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Sep 2026 22:15:14 -0400 (EDT)
From: Val Packett <val@invisiblethingslab.com>
To: virtio-comment@lists.linux.dev
Cc: Val Packett <val@invisiblethingslab.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Sergio Lopez <slp@redhat.com>,
	Parav Pandit <parav@nvidia.com>,
	dmitry.osipenko@collabora.com,
	mst@redhat.com,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Alyssa Ross <hi@alyssa.is>,
	Demi Marie Obenour <demiobenour@gmail.com>
Subject: [PATCH v2 0/2] virtio_gpu: add F_CREATE_GUEST_HANDLE and F_BLOB_CTX_ID_FIX
Date: Wed,  2 Sep 2026 23:14:34 -0300
Message-ID: <20260903021442.423274-1-val@invisiblethingslab.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I've been working on actually implementing the "lost" CREATE_GUEST_HANDLE
feature, previously half-implemented and removed in crosvm
(https://crrev.com/c/8064741), which allows the guest to tell the device
backend to create a shareable handle to a guest-only memory blob (using
facilities like udmabuf or gntdev-dmabuf) which can be e.g. sent over
to the Wayland compositor when using the cross-domain capset.

This allows for cross-domain Wayland passthrough to:

1) have a zero-copy fast path for wl_shm (software rendered buffers)
   thanks to udmabuf being able to wrap memfds from regular clients;
2) share buffers coming from a passed-through dGPU;
3) have an alternative way to share memory when host-only buffers
   cannot be mapped due to lack of a host_visible virtio SHM region,
   which might not be available in some setups (e.g. on Xen).

I have a working implementation with the zero-copy fast path:

Backend: https://github.com/magma-gpu/rutabaga_gfx/pull/81
       + https://github.com/libkrun/libkrun/pull/822
Guest: https://codeberg.org/drakulix/wl-cross-domain-proxy/pulls/24
Kernel: want to link here when posting to lkml :) temporarily:
        https://github.com/valpackett/linux-qclaptops/commits/guest-handle
Demo video: https://social.treehouse.systems/@valpackett/117149550756102167

This requires adding two new virtio-gpu feature flags:

Obviously the original CREATE_GUEST_HANDLE itself; but during implementation
it was discovered that we need to change the CREATE_BLOB cmd handling in a
backwards-incompatible way, to ensure that code changes on both sides are
an clean-up rather than a pile-up of odd spaghetti conditionals.

If you're wondering why the explicit indication from the guest must be used
rather than the backend "lazily" creating the handles based on usage:
it is better for the guest userspace to explicitly know which ways of
sharing memory are supported, so that one can be auto-negotiated.
(discussed in https://github.com/magma-gpu/rutabaga_gfx/issues/66)

v2: added F_BLOB_CTX_ID_FIX
v1 has been lost to the moderation queue, but if it gets approved:
https://lore.kernel.org/all/20260827092120.97295-1-val@invisiblethingslab.com/

Thanks,
~val

---

Val Packett (2):
  virtio-gpu: support requesting host handles for guest-only blob
    resources
  virtio-gpu: add flag to negotiate always passing ctx_id to
    RESOURCE_CREATE_BLOB

 device-types/gpu/description.tex | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

-- 
2.55.0

