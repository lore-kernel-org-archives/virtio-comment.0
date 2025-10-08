Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9BA2ECD20
	for <virtio-comment@lists.linux.dev>; Wed,  8 Oct 2025 14:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759935564; cv=none; b=SYu/0feu3UfeGpAdhQVKPQKrJ/pJEA2B9edAhqzbYa+JPbqup6wTehV0dSxWLd0iAowrB5yYaMhhEGKhnub4LDqUaN0JBoVSWqlAE44v9vvus0bJONl9X8a1KRMqvRRXQ4kMy9VMRtfS22VmpJ9jlL6iyzCbMx8woF38PAbj+88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759935564; c=relaxed/simple;
	bh=6ZYLPKLHc7VpLEumGPaAhXkJsYOrsFaOrvVWDmSnTXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dF9HuvhMi1TcaQcpG+ejPXGwJS0e/JIbQpB6gQXBBFjEKcQhAkeKNogiUUZIbpnkLRqlLXqLJHLP2ag9aPDYvW0KxkprJi25zLC4zdOGgMC6OgbALEL6SRCjbHHhZTvvNVxRAHL9CgzxDfiqDx1AZCUeGi0mGUUoxU2T0puEPUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SYKp9OQK; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SYKp9OQK"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso7419f8f.2
        for <virtio-comment@lists.linux.dev>; Wed, 08 Oct 2025 07:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759935560; x=1760540360; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1i2cVjzri8K68RVmUq+Ppc0dhb+EYQNM7bS2UjZ21+o=;
        b=SYKp9OQKOX1pBjtF7VndZ1Nzf5X7eTfVzrh3zSNQoKGTPtFPRdEdgghWBnDTWYAvph
         gsVcW7/2T4jML95jiQfj2UWfVb0lT0yciWX/uyVMzuniBj1ngVuV8LjIcm1oIEUBzC5K
         TSeHFYmXjxoJi58s4Qn1oBfGxTsLwiZP8Bb80PEa3/LumV6GxbU+s6GTeee33jdUEVI5
         GPUKeuFwKk/C28V8LIedfqULbcFlC8hVazVUWQG7UH43Fq0h/ZjrF6pLXbzPimMRHS5j
         qFHcwdDF4Ks3OxH7XerP+pOHQoOQVYjj8Ag13drofgzgIE1EFWdU1MATeKDDGK5+K+E9
         NXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759935560; x=1760540360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1i2cVjzri8K68RVmUq+Ppc0dhb+EYQNM7bS2UjZ21+o=;
        b=G7LqURDgurqci6v5+vJPK++Wy6tOVztPDljEqPw5HRZyRT/ZZTm8QPwmnd4M34nsft
         qUoQBw+t/RE9uNM4874XrNjKgI08OTrrR+Fx8cffhPaqXmIFxLPWNPTHciouCdWvdw6Z
         JYftKDI5WpKZAZzjc+F8uYHBh/Cy8zD3oXkWyia2Ym8HcbdMhIrCxMlb2itbREERPGNJ
         e+qKCghTSn21fRUbzZuEoKhACjG3A5ALUHhEVx75iCbd9a4xLJhgmxAvTB3a1J0CRuh/
         6vmpHY6YYuYkZZbyC5v2L0Z5HKE6vTyz09qUv6Ha4Q+8SXFNT0pYNcvNqk3W3KCfIFFP
         22pg==
X-Gm-Message-State: AOJu0Yxd3iZOgjR8fvTm5VfSGVdWGXGzOSHppd9MU7kaBIVvp1sBai8U
	qI26KO2qnYoQcNEZ5sCGRPPNE8r9Neq4/+w2eh209H0gi/RCKMQiHA4ZIeiZnx8acII=
X-Gm-Gg: ASbGncv/4avhUMA4qakCAKp+qtAsbRDqXVxs5fchZokOFS1YwL+u0gHPB6obBpOwu68
	L80yggOnJ3KGzGDo4DxclMZuPTX2LVQpcG5aJq8ibpTYe2AjxP/mSL7XKP3sP9TVxv2vSo4Tffn
	2O4R4rnz5Mk+1k9HtwjU7EHnWTHstxBJzr3jgwlKsCrKhpQ0LpCkUJfr8npSBGPfpqMKijHg8P0
	/W5X3GMcij4NMnk+pXrNWnwE7Ods+bKjnMub4zmr8+kuqkiGpb2x2cpTSS71cQIoJ5Rn/BIoaoV
	v3hpSNrkRDkiPrXwjncpPICyVfSHzLbAll+MNvD4+zoLCOt1qiFeQZTnzVI6y2JGLQDZqbFsYCM
	iosrDAeM/If+QGoKCPNKVAb/CRM5+If8WZHeafUkUKjATMptPkhxBHWnJkfR/Bw==
X-Google-Smtp-Source: AGHT+IEdHxNreuw2515l05JI8vcIeQBTGzOn7mqnotgOY7BDdWaGCKHvFQBFet5UYT9Xd/BUQrdyhg==
X-Received: by 2002:a05:6000:2910:b0:3d1:c2cf:da07 with SMTP id ffacd0b85a97d-42666ac48bamr2435894f8f.4.1759935560477;
        Wed, 08 Oct 2025 07:59:20 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6bb2sm29522875f8f.10.2025.10.08.07.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:59:17 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3134F5FA1B;
	Wed, 08 Oct 2025 15:59:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 3/9] .gitpublish: update base to current working branch
Date: Wed,  8 Oct 2025 15:59:10 +0100
Message-ID: <20251008145916.2626143-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251008145916.2626143-1-alex.bennee@linaro.org>
References: <20251008145916.2626143-1-alex.bennee@linaro.org>
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

