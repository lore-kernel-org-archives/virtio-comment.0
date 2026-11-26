Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722396;
	b=2AWAJGiToEVukGQPkwIY7/lBTjz2dhz+RVAd15UIqjEq5fOVCum9geeSN2+2SlhThu2u
	 9xul8aAGXI45eebFoNQ1xt59fPjIm/tI3NvVaIHOiNQbuZoRX9tb6kz5LZxzCJXCCSs4J
	 /vYjKTpDiK2HSMOnnr9H1raCDNQCCpQOzF5GtK6W17tAv6AtV9NRuR8PrfacHy/l2Q2jU
	 mroJOjgq5aBpMIQEBnW8pU3e9n5Gu8bIH0O+9WZKOjE935xHWnUpX5sQEjOO1IcMMbd6e
	 nd/v+x5S6wX2WuR9y1Om4E+qkLO0Jg7qB8KTaI5NuQeMFlYQrCGZqeQV0Sd3GCAZtBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=jngdE9GBDPOrYDbPoGYsmnLiRcx90Wwfuqa590NZzxw=;
	b=b13vUI0SYjrUO4Od2jvsd+9neDsiCGX7Dw5arkzS3s2Rksj4DU1IwOy2oLsr8mSMGlgs
	 sd4F24CZm88Kyeeyw6+uLJZ23QTyoJXcsn1no0ba9N1Aa3JklgNZL4rbpqLH8eD9WOnZK
	 a2zFoa36Lf2DSZsYB9ybBvO+t1kPNRPj1VogsOi3Dcng3Jct1rTI3uK3OxA7Kjp+1q1Nh
	 P/q7gaKpQZ3Y4bnnKpsatOFMpEYRqykYmkXzwNYMeJGMTQMQxyRbzJUrPUuklAl0nMax2
	 2RBd4liiWkMc2XOG4sjTQf6GWhECeh1kXsu9+xMytcLkqzLuiyxOKnrUgbqwkR6pUMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="WuMDz/3c";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47346606A31E
	for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 19:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47346606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WuMDz/3c
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so48217275e9.0
        for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 11:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795722395; x=1796327195; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jngdE9GBDPOrYDbPoGYsmnLiRcx90Wwfuqa590NZzxw=;
        b=WuMDz/3cKxd4Eg0OhvOLf4dHVwVjzjB4azsqowzUyw9yQ84hecpQSEEFsyg9SBTYaS
         rd7al5WI9OJU8tUqeReg4gP/bCRAIOhds0omJiXpB+qr3kNhib6xQ9Mt7fkESZAYgWhF
         UxKM2pNOucr2Zm9dh6HjYS2fb7kRDj1BCaSIWEwDWsWgAIVr+cCU0eeIZI+ePXwjAzLT
         foVyvXFJ2WNZKblcM7xgtBAO7Cmu6aFKmdQ0nBhTBgHBFK86ePlqq9sI5QeWwFyw+Crc
         mIiav6DUdaX++uLYtz9Po3V6TuUxjONZ9LRMCW53IPECQ22GHhlZT8r/xfytazQcsoT4
         l2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722395; x=1796327195;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jngdE9GBDPOrYDbPoGYsmnLiRcx90Wwfuqa590NZzxw=;
        b=qEGeld0kQiEwuGm2w9PrzCiJ3OnO5Q4wlKPvYBENFPp7Y6WVy9isyryxIV7m2yDGrS
         s9bnHnixNWtrIBT7HLFaX+ijX2DMPLDsDimVivpS+HtOfzoEvRtNV5RO3S8dYHg9QQ1a
         kOwxK6ObkPFAn5FHjUtkPnMu0FBzyC0k2NvNmIEoaUtR5j7liI/Nzq3tBb3E1n3KOcSP
         9d+FAFML1gbuvjm3nogtjBHViccdojsDWT5YZFJJrfGrb026XAylk8qe8cSRiyQ/V/E0
         LHRgpbq0u/E5Ztx7zJsd27v5Z9da+X8IFg6aCztgtA0v4Jan9Tw6oyYjlgAxP/ZtP6je
         VkIQ==
X-Gm-Message-State: APuU4Z8OMEDMmN+q+eFMoL/7LCCH9H+51IYet8ziyhiwX/ZPYH8hLGsP
	NYv8i3mO0pQClfZM4HQHZeMQyWg7yeHci+4DfuS2xadN24iDmbhuITsOpxvt3TPtHCc=
X-Gm-Gg: AZFdTZdtnOk3LCvarOQM97A3aHK+etl3LrMbPRYNzMC4eE6IrBzca2uHxdMKKm+Adfv
	pqnIXggHXEf1wYt/LW+VObbnd9SUk7IgMQ55cG9jprd4V1UQxUpM39Dt2NC48ROdlnG21z+LSKZ
	2ZPmLJJa0l/6oSdan4jtgLVeqgXl5a1t4H2OPiZ55N3kdCCb+sOfJXiU/fNmkvQt8m1QPivRIYM
	/d9xfpgjKs7PAkeYlEXbMkd7DqT9bE8nA3L0HdHV46Cpsd72fQmg6LAcN5a4y489NwUNeQfsnXG
	nxvzkWeUjt+6C7wLWnQu9UVwotIi6hZ4cMMOWivJ7qvAO0GIQyw0iJBLYytaoM6lD++YheELpaL
	fSOYvlTIVLMNwfqu1ruWi3zC5Q9S8JBTiKOp+t5yrxj6Gai/lH65yvqM+OdsOoaFUaEy9YEWvFb
	mWtbMm+8J/TQiFje7fc8H4iSk/grUuQ8G/eaQFybmY89CgQhuvMTj2cd7p/ujhDIVB2/oYHygyQ
	tnXKGrFCpByOhGMtPRqI55a8wMj5xWGaZhmnHa8PabH4UQyJdTPDDD93vRqTF6j1qYbgmRputuf
	ErFHUWqB6SxqB2iHAOnQTlwtNjuI54klWaHYw5XoBeECVSaZBQ==
X-Received: by 2002:a05:600d:4:b0:4bb:8898:a591 with SMTP id 5b1f17b1804b1-4bb8898a596mr407294905e9.15.1795722394543;
        Thu, 26 Nov 2026 11:46:34 -0800 (PST)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bbab390cf5sm119266075e9.7.2026.11.26.11.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:46:33 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 975515FA1A;
	Thu, 26 Nov 2026 19:46:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 03/12] .gitpublish: update base to current working branch
Date: Thu, 26 Nov 2026 19:46:23 +0000
Message-ID: <20261126194632.2429425-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126194632.2429425-1-alex.bennee@linaro.org>
References: <20261126194632.2429425-1-alex.bennee@linaro.org>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use origin/master for the reference branch as that is more likely to
be up to date.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v4
  - stick to origin/master instead of the virtio-1.4 branch
  - drop r-bs
---
 .gitpublish | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitpublish b/.gitpublish
index d412896..9d42ee8 100644
--- a/.gitpublish
+++ b/.gitpublish
@@ -1,3 +1,3 @@
 [gitpublishprofile "default"]
-base = master
+base = origin/master
 to = virtio-comment@lists.linux.dev
-- 
2.47.3

