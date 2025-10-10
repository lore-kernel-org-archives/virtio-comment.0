Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CF62FBE08
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 16:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760113748; cv=none; b=scY9X0KwBdMXZ+eOnoIa5dfC2/nTR1z3VNrtixKy+RlMsEbanyJwxdtVmUKYQiVkmxjwzXq6CoZZI4ZLH/L6TOnAlbNhCPy3uPgdSNGueWrCZumMIWJRNfIQbNxjNxOvn1D7ndSp6LZ6s1YMweVD3GpWAACO3vGLpXHoFVJZZVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760113748; c=relaxed/simple;
	bh=PboghuCPv7SPqWehPGt6efyLRi4RZ8Cou+PeKC6nAdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WYqyvfF0EhTebL3zt1T8rGCANqpp7DqGGo8ur/2eeWpvHeMbT1zU0pJ7Kf9Q/Jqi9+rVxdCf3eznQ/oqH9HTwzhPalmWvbr3WIrM4G84KwULiyslQIKo/j4ylMI6hG6wwPVx79OS+cyI52sYYg/36VgBgVSX83ATzvLXg495EU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LeEp4Kab; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LeEp4Kab"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b48d8deafaeso517227766b.1
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 09:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760113743; x=1760718543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8Gzv866SMWASjn8Lhw4HcY4HbILaxV2ZO1/oC8UrAE=;
        b=LeEp4KabNJDXpdaoV2F8PkyLqDE4Eh4M5Gq++D8oxisiIf/fhDeMNZcCw7JPnp5gzd
         ZC1zhCqSq7wF3cnskyHU1+d0tSih/cGtNoSnOhUwx/oVJaDE3vvphZGye5RWFzJxh1P3
         zMnPDWo1SxaD5Hi/CAllCJgY7zW0u58bqjDroDN5mNWeYgKCXrkeadw+AGh28KUQOwXA
         w/17wq2xYU16J/Th1rpM7CNtruLXSGVXUd5tbMhY/z4AHu3wE58GTe+jFZYMhDO7UTK8
         VNK9K449FEQ5jp1r1PVrgziwj6gFKK/KrNGQOQnggl80zW7Kckl+QXp+ZiwhDAhM0H7Q
         LOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760113743; x=1760718543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g8Gzv866SMWASjn8Lhw4HcY4HbILaxV2ZO1/oC8UrAE=;
        b=GhVwTWEpRl7cUZ+uHxwmPJbnTRKBy6EajEtZFopt01EVfU3///eg6hbQW7jI1uAjC/
         TqNR5XKufeZx09kTV/Zsv/vndfJA+IW0NLvu8/RNWEwUffQR/ezsbN0PIQKQwaGB+xe1
         9R+FAHbb+72Z3A46ooUXVn79GQu8JoDt5QizohAWpfYiF+t61H7JrU2PHQPJYLmJCNoa
         IKBXlZIElgY43lXJFSLkquahqoQ1xf8pNZ8BsJDAIZy28lgGO0ZlybiHzRqu92lVmqnH
         rdeaEmsegIlsU7oSPllVs9qa59RBuyEb1DJlRDsky3+V8BQFUT4FR7vDqu+ZYP1n7/Sd
         dEaw==
X-Gm-Message-State: AOJu0YyWjoUL48FrckDrzvgh0khfEAJ69/Ls+sKBoIvjP5GmpWiUN5iL
	ul9kC1vkm++JwU72LIDZsnFxv1XebDsXmcIwXeiHg61x+VEwGUmUMVf1kt0pnsNqPWQ=
X-Gm-Gg: ASbGncu2FPRxl+NhCfd4U1M3sgcBvVdl/wC/JiP5ZREFvidXeN83CN5wBif15c0iZPA
	t7vguqK5d+Ef1qax215seRSu0MDwz6VBWeOQWVdpHRTn2nP3JPKNZyph1IptSAKe0LisqfL0uGl
	DBlgLxR38b3N81O+3yRqoGVkddx3yI7nViIs2MJDiM27lMK3EAXrA+7aJay2I64fr2QJrZotL2y
	T7gvVTVkleRbSKacmc+Bs9CIuYzgziguNuKNpHqrG3kurRIzWUcGMA049kyNvKG8n2B2wbazytV
	1VqauNK4YiWaFMrKcQoeSBHJiQixIaji0UQKqKarRMdi1AKvCHvy55aj88Hqk5yjRW2btd7qYX5
	YuDIPMYoYyXUEq8JH35MgZSPEWfNLhXQxgEkm+WF4GT8xvg==
X-Google-Smtp-Source: AGHT+IFwmJ0YmG9Mr7pJC7fx0ZNHw2a2qFFnIf9QwFfBz1qKWrtz+T7o2dfcUnjr5BxQrEOQbJA7nw==
X-Received: by 2002:a17:907:96a9:b0:b40:b54d:e666 with SMTP id a640c23a62f3a-b50aaa96b25mr1463562366b.16.1760113743387;
        Fri, 10 Oct 2025 09:29:03 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d65d6994sm271457866b.28.2025.10.10.09.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 09:28:59 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8F96F5FA42;
	Fri, 10 Oct 2025 17:28:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Parav Pandit <parav@nvidia.com>
Subject: [PATCH v3 03/11] REVISION: update to 1.4-wd01
Date: Fri, 10 Oct 2025 17:28:50 +0100
Message-ID: <20251010162858.4107388-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010162858.4107388-1-alex.bennee@linaro.org>
References: <20251010162858.4107388-1-alex.bennee@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The state of the repo is currently working on the 1.4 specification so
anything we generate should reflect that. It will be updated again on
the official release.

Reviewed-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 REVISION | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/REVISION b/REVISION
index ba56baf..e3c043e 100644
--- a/REVISION
+++ b/REVISION
@@ -1 +1 @@
-virtio-v1.3-csd01
+virtio-v1.4-wd01
-- 
2.47.3

