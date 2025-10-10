Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE324A02
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 16:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760113743; cv=none; b=OYvMSCDRVTcC9HG8c/MkEjWnS2DO3XnT002tkCxnTUOzMPUUmLPrb/UYqnlAHtk9kt9vJhjmA771Mz8rmxoDn3ELY6Xn44NSSVZGfcxPmQM2+SarOw4ODNmzylDvcxC215ysDsERVcG0SpxYn/7Hjapjj0AopmEl+ZON0kmyE1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760113743; c=relaxed/simple;
	bh=wEM0SBW764xNr6rtltsxb0T2I5ONMFa4rDMNaZab6oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q/ZW+6MGNQRHWtSiXo1/EWh6ofL6Wnu1ipt69MhF072ClnEMa1osYqnwCjEHijvYtA0cIaRn8m4z/hJR4s6yhKomHVfcI4XjawAB/Xce+/ddr4t6cW6ZD+KflKeZCFwCcpKOiGUe3MK7CogD8VLW/juGqKexSBC5f3u6W7h3UT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AjNC2VbT; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AjNC2VbT"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb7322da8so412599366b.0
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 09:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760113740; x=1760718540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7arIVL9mDcfG6Q7FS4HMKQdeWguurNiYuqIjIXROM68=;
        b=AjNC2VbTk0+yW1/Rs3stPVygwWWx5cgCtrIJ0UjDlMdAASL2x14yaYR/21TPHxrdfz
         6O0P0t2odtgPd06WWplVQoIKGiQ555NlYbyH5u2zGWk7/mJFvg40whv8Q8ITNJWIyenY
         To7bClw7gKXBeQIXwZFjeeqMtGPSjkZkjgaucfzm+AB5AoIC34NR6jU+SU+IAD3128ls
         XDxg7Y6hHnnWuV+MhI1mI0ARxh6hYhevj9pphQ51sll9zUeCDbBKKUSXp2NxQCB4VWV+
         U/2egTWmsOHc5XmCY/Ap9UkXVwApMUy3EfrENbnke/5bIs5Q4fLdHn3eS9p7tL64CI0T
         4jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760113740; x=1760718540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7arIVL9mDcfG6Q7FS4HMKQdeWguurNiYuqIjIXROM68=;
        b=uMCB6SLZFRbEbqrk9Y9b5yVk2BhcLv3a632tSNGwvlasYeuHXNJr5686LkvmvCkkUg
         1TsblNAt+N/bTpxEQWXWEiX+yJoVWEgo6oYJkLyYmkhYBemYJ5CR9J7FhCszfZoMHlZ/
         ZcLgSwtg75qUBVggnal+PdFTWR3kPzMcDEILlQh1pY3PFfYkILbYCfMw1WOVbjJdOq09
         YEIg8RDb2C6Or1t7g/mbhVsxDj8IxOBLHWSHUBAczNBRSHQ3PUZuXhgH2mlMaBdQzIkm
         72YeTk9Ydu0k0LLOibpo7BGtx6WK8jdiwR+rdWt3XQ9XLY1IWdOT5JR13OcvUsT1Zllh
         bz0A==
X-Gm-Message-State: AOJu0Yy01EyrX+X9yeEek8vhAb3+n41tnL+DNqQdyudqtVD4QdHzPhhN
	IUqxWtwu4+FxqxRkezNLB8JO42bdoSJiKDjqZcfCKVfLHOtS/YzC3BZC9+Ejeix/6L4=
X-Gm-Gg: ASbGncs3OVz+5cUHmn0A0wyM9dOA/BkCYIctpvXcgd2GKxcpws/p3fulhxsjWp8ATfc
	A8nVRe/MvdVobrzKghN1dEhSuAk6KMq7r+5b5ekTHqRtrVp3m4XOdxUl/kgVVnc19XGAXuWro7X
	glYVw23qgyZCXyWjoUY0J1IuYx7P9hWyF6IMoMJ/tgiXm7r0cRAjjkEBBAQdruN01U51tvJ662k
	RqcGEW7uqg1k+Y9PEPwMo1pmSPB6MmL87Bi0e/z9OFP/tMIDvNfVpP3wkl8TUCI/swWX8FGpZF3
	IC072aHJq+1kVxQTZUBBGbEJJIglYW1GAeTC45ONINO/Rhk5rp7wmINaf/OxIxleKe7qUpHKF/R
	/wp5IqS8VBME3VKZg75mBmaNwCc1w7jGF7cZQTDzE9J3pvQ==
X-Google-Smtp-Source: AGHT+IEUaSZ6+bBq+AO6J3mcx26lRKoKirKWWnPEfg3+xpakP0iy4V8prgy9IIXqO9+T+zy65KAWAQ==
X-Received: by 2002:a17:906:6a14:b0:b3e:c7d5:4cb0 with SMTP id a640c23a62f3a-b50ac5d0864mr1198302166b.50.1760113740322;
        Fri, 10 Oct 2025 09:29:00 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cada4fsm280980666b.6.2025.10.10.09.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 09:28:59 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9D56F5FA53;
	Fri, 10 Oct 2025 17:28:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Parav Pandit <parav@nvidia.com>
Subject: [PATCH v3 04/11] .gitpublish: update base to current working branch
Date: Fri, 10 Oct 2025 17:28:51 +0100
Message-ID: <20251010162858.4107388-5-alex.bennee@linaro.org>
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

The current working branch is virtio-1.4 so lets use that as our
reference for gitpublish.

Reviewed-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitpublish | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitpublish b/.gitpublish
index d412896..84414a7 100644
--- a/.gitpublish
+++ b/.gitpublish
@@ -1,3 +1,3 @@
 [gitpublishprofile "default"]
-base = master
+base = origin/virtio-1.4
 to = virtio-comment@lists.linux.dev
-- 
2.47.3

