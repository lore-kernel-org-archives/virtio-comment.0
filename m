Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767733D56D
	for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 05:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716875273; cv=none; b=dAN/hiN07Hes8Hdse/n7e0XKjeGro8+zyZdcaUeOQWg1I3QG6ebC96WU3jL+J7kN+C+gkbvUepqhgeH2Hf+nGbmzwa3/oxR+wBSAHkyn/TjD4/lmYfBQ8U1C9hzJNEWadf7j9RBH+gSw5vra/n418L/obu3T0BaEPnVSN2W08Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716875273; c=relaxed/simple;
	bh=eaLRlwJsXX3UQ8JWFW0fcw968bc7DrXTRvLmHDBr4Z4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=usXTNdNRfVETna0KI1VR6o2BnWNnm9DAelMZPsv9saniPc5Sv95izy1R23CYcCQofZ9uQqhC3XY1Xoy5Yos92lsm5ZZhW0Z/NEdKNnDMbs1iTD+Nu/DbVv7IGl2AeX8utmUwQNEm/fSIqNsWZuL45z+1YQTI0X8aOr4loY56VGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7kbMMrd; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7kbMMrd"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c9c36db8eeso257942b6e.0
        for <virtio-comment@lists.linux.dev>; Mon, 27 May 2024 22:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716875271; x=1717480071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W1BSdxo15QMEn8gWpCK4KniTpLaH2vldbcmsuCZr4Ks=;
        b=C7kbMMrdXhrWWf6veKHzo6B0m0EM6CqVgITc198z0ZsMFKikgyIF4k723OW1s1vriU
         1JO4aVhTGu4wXeA9N9b2W3r+DHdL4YYYWhTVIjEZAQ+Tzx8TW3errWl4yv+uj0LZP2ao
         sE6FhfWV5LMH1J7ZMwSVgqJq4uQRgVZhpMeUmbremgAFnhZUzh9nZNwt84kbR2LA646L
         9Rs3JDHppOjxKxNB0fSt+KDykQK6yVaZdk7J0vd9ilmMC2m1AJ6sBgiu5eEmTTj9CnEF
         CJmbyy4Kurll1nm+JVG8V0AbgJKPmwwFoybGQZ00L6FPgudMY9+JqkYQtYrIxtGuzmrZ
         YOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716875271; x=1717480071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1BSdxo15QMEn8gWpCK4KniTpLaH2vldbcmsuCZr4Ks=;
        b=lZiBLvdlt+MeFAGs1AWur6MpXnQbPsS7sWpyL08lKlBt5i+ufzJ+5pTN75lfBfGa7A
         Yy7Zq0r+CAPROlpP5Y+FEx6FmUf57NaUHNa5e/pjC7JFyZXESlkoO7BhAekHUtTv4j2i
         Zl1cU9GQ7kNQbwCnjhuYVOCTP0pXfkX/ixd//poKAqgEo0TrW7rrtDIWrhOrrluiJ4Oi
         JqRJhtXShcyV0vAJLXedGg4obSB1vDGgBcN2k6lPbrMLVA1+PeWF6jFYs7/uogyT3ZVR
         FMDmwWdM7NFLO6Q0tplO/cmiErIyyEqQgf3KKHg+GxWs8D63tvaNCyrSJ8arxGb4uHbP
         MGxA==
X-Gm-Message-State: AOJu0YxgviqFysX8pau0+TDGjgKMBU73tApkFOInmZAsUhtnLEHgmyNF
	clWBZ01UaGIWD0r3E77X+omJxtv4tElDIP5cND1mdJ+ZrEqMrIVj
X-Google-Smtp-Source: AGHT+IFKbVBWGleGuPCBYCGaLN5zMdqvyo/SE6BOCnQqoxWZD4L64FxMhO4ai94T+xwQY0wuTQ2TPA==
X-Received: by 2002:a05:6808:2a88:b0:3c8:311c:ac60 with SMTP id 5614622812f47-3d1a764744bmr11170055b6e.46.1716875271257;
        Mon, 27 May 2024 22:47:51 -0700 (PDT)
Received: from devant.hz.ali.com ([47.89.83.81])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fbd3eb67sm5931570b3a.19.2024.05.27.22.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 22:47:50 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com,
	mst@redhat.com,
	hi@alyssa.is
Cc: virtio-comment@lists.linux.dev,
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: [RFC PATCH 0/2] virtio-vsock: Add support for multi-device feature
Date: Tue, 28 May 2024 13:47:23 +0800
Message-Id: <20240528054725.268173-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, Virtio TC.

I am writing this email to request adding a new field for virtio-vsock spec
for supporting multi-device feature.

The multi-device feature allows a guest to have multiple vsock devices for
virtio transport (maybe for other transports in the future). I've pushed
the first version of the patches to the lkml[1].

This is my first time to contribute to the virtio-vsock spec. Please bear
with me in case I'm wrong.

Thanks!

[1]: https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com

Xuewei Niu (2):
  virtio-vsock: Add a `VIRTIO_VSOCK_F_MULTI_DEVICE` feature
  virtio-vsock: Extend the spec with an `order`

 device-types/vsock/description.tex | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

-- 
2.34.1

