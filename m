Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805261A8C0E
	for <virtio-comment@lists.linux.dev>; Tue, 18 Jun 2024 08:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718698746; cv=none; b=uBTUmrVIiBTvWYpwdg5VeQgzghPdiAhY62WZzwkE40/ZX6Kr1eI8oAIcta/TJJ2kVyn3Q5IPvj8B9IiVIh/DTitC9af9SNXR5N0yktIjY+Xe7s25GPWLN3QtflJYsLWgwmpjWHBab92H8c61aqM6gvGTYI4gNZZkS/4lisJcagE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718698746; c=relaxed/simple;
	bh=dj4ABLlbz2KzWv9sU5OrqIrBfuj7RPc2XVN80Q7LDeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=muoyBOIoKPeabDfWwwpOOtKy7B64PwXunWH2DWqG5UZ/sQLyP7b1xqp7VnMoRTFot1b4HyC3NePJtSAns3J10X1TZzOwfdA+DEunvpPKMH3nltbxmj/DX77+9KayQjNIYxjcWctAq+aFHTQ95Wi0mArpgaO3BJdshC3c+lqIF9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NEwlthop; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NEwlthop"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70625e8860cso1836b3a.2
        for <virtio-comment@lists.linux.dev>; Tue, 18 Jun 2024 01:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718698744; x=1719303544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bDXIs1Q/FMFba+yXjEoecK5xsIVXjHMkBV1FRuo+diE=;
        b=NEwlthop/sJyJO5s6G0OUtTWQVYwAyp2dopjpn8m6xkrjtC04R1XKO5R0vRfg2sx0b
         94J4pOf02EuvfWgJGJvL0GhuRqH29kZHBEE4qo0vkypCRp++qjBAEjqi1fh5MGF51xFI
         UXzUW5Zhbm0xUFzoIJuJnoT/PcvBLKwQ0uqY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718698744; x=1719303544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDXIs1Q/FMFba+yXjEoecK5xsIVXjHMkBV1FRuo+diE=;
        b=IJCUiq+XWWHVHgLRqv0ywA+uLbxyta9OXaz5/VLHGm0q0KyBmgTTQf20Lsbq2L6uTt
         K0zW+n8o9O0TCM3n3DmXpUERi1RbhnHN3BQp7NAyYIZnEXdb2u9PORGmbkR3BnvEa64q
         6l6ZSEGJcBZJMdewJzRkN+jo0Fn+rywwhI1f3EkMBMF7LhPcrEFGrbeCzbwPGpovQUxz
         kndXYbn0DQOhliZiR4vH3JNXZ6zK3Q5RxjvjH4hnE7SmUB84FaIznVVsRwzWFABsMG5G
         g/80J6AVcrPsYQuVlA8agcRUcUSQgC9Pk1UqBiKa3gvksu797wKVdnVpM6paH4WJ7ENN
         bpIg==
X-Gm-Message-State: AOJu0Yzc6GgwFO1pYhNsoVycyQ2V8rg8lhzwkgPY82pAeQPvI3tIvKKT
	hjgdKy1ZRWWzDHW41vePM4FOEPvBF8VKaVtJiFkXIh1qYVjFhy24GD3rVZWoXsrkaB8rrzYAN9I
	SjA==
X-Google-Smtp-Source: AGHT+IEhOrRwEnG/8pR9VB/zqW2G1+rmpCXOQ7AfKoGSJlU5BlCkj48o46MpT6R29WWyuJpP4uMLmA==
X-Received: by 2002:a05:6a20:7483:b0:1a7:a6f3:1827 with SMTP id adf61e73a8af0-1bae802b28emr14687039637.46.1718698744315;
        Tue, 18 Jun 2024 01:19:04 -0700 (PDT)
Received: from keiichiw1.c.googlers.com.com (122.235.124.34.bc.googleusercontent.com. [34.124.235.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f1dedasm92381725ad.248.2024.06.18.01.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 01:19:03 -0700 (PDT)
From: Keiichi Watanabe <keiichiw@chromium.org>
To: virtio-comment@lists.linux.dev
Cc: keiichiw@chromium.org,
	uekawa@chromium.org,
	takayas@chromium.org,
	dverkamp@chromium.org,
	tytso@google.com
Subject: [PATCH 0/1] A new virtio-blk error code for host-side ENOSPC
Date: Tue, 18 Jun 2024 17:18:57 +0900
Message-ID: <20240618081858.2795400-1-keiichiw@chromium.org>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch proposes a new error code VIRTIO_BLK_S_NOSPC to report
the device's ENOSPC error to the driver so the driver can treat it
in a different way from other IO errors.
More motivation is explained in fs-devel mail [1].

[2] is a prototype implementation in crosvm and [3] is in virtio-blk
driver. Idealy, the error should be propagated to the guest file system
and handled smartly, but the part is still under discussion.

[1]: https://lore.kernel.org/linux-fsdevel/CAD90VcZybb0ZOVrhE-MqDPwEya8878uzA1RBwd68U7x4CufkTQ@mail.gmail.com/T/#u
[2]: https://crrev.com/c/5599649
[3]: https://crrev.com/c/5600325


*** BLURB HERE ***

Keiichi Watanabe (1):
  virito-blk: Support NOSPC error

 device-types/blk/description.tex | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

-- 
2.45.2.627.g7a2c4fd464-goog

