Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB3B2EC569
	for <virtio-comment@lists.linux.dev>; Wed,  8 Oct 2025 14:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759935562; cv=none; b=DUWMcPS92XWC97vajVgY3B3j/FPg9TzNViZT/h5goAr9Ic3GP5MGIFAXoP8Cu7I/3FWe4AjlR6jjuHyrGgKECiubMYhnWRF0IGoUaxY3GldzmAPpCzFoBmlq0K3B8+wYVR5uO3FqA6O6c4/oJaLcUQpAyahO2NAj0xpYiOSGD6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759935562; c=relaxed/simple;
	bh=HIbONKFmRxRC7sgNHR8WFHzJpYlAbwUPCcyvdtwtuTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q8VrKbpz6nA8CoW/OeC0I1STW4qV3+5z8dnInESoIoq5JUxzmPzsOg3fzO0xgpuzWIZpxgo/GQgXqEhIvGaovVoswyPCuI2aCMSbnmancO4Fe0sMR6PdS+u7kdE8cWEpkIWS2afzZBftfGmrWmGCwvjrvj2dIygFUz7rPyMc4Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c2fXm0K1; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c2fXm0K1"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so11688f8f.3
        for <virtio-comment@lists.linux.dev>; Wed, 08 Oct 2025 07:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759935559; x=1760540359; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+dcjAo79t2iokAWF4MlW01atqfTTQvj8v/2Cnu69u4=;
        b=c2fXm0K1GAXf9Bn5uz8xeJaLSfWHtVooeAMM5M8B4tdjsOmWPAl6qVmTA2L3z77pFN
         549lTjyxOooikU5lb369rie0QMRpSx7uDZxm3lVywna4QugmKasON3szKfkpUZpJc31l
         1kUgry3dzfXkVIRvS4efADWVi4P7Tl5+P0q5FhY3NbeR8mQx5g+rFT04T38bJHEawk9E
         AdxyxacX9tusGqFhYMjhNnRrFKowZbWPoRWTZBIyHlMZhrJKza9/wiLlukLvfq2sbzpJ
         69TUfazGp8WliZ8LSvr2+XDKsJJvJdbizXyNhzsD/Gkl9BOMgB2YH6F1us7yLyRoC8GP
         o8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759935559; x=1760540359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+dcjAo79t2iokAWF4MlW01atqfTTQvj8v/2Cnu69u4=;
        b=izfApIN3HAFabLMmXafp7w6XWNKdZxUFcWCrb/L6gkwwgsn3vdNd85DmMA2aGsl9KW
         SK9kc79SdjNUhyjiecI7n1zQa398C86p8l+IsdQeIHD70aRGbXDS53a7HdDtvbdeMIvI
         FefeLBLVBFZONqw63wYPRBMKjjuJHxNzR3Ry6RTk6LRUqzjS7or9RDAIvJMr1N6/Zs4H
         1Vt88gvEfp5X2tO6ERQnhbHaHNUXmnsfuMGFdj8aZPgo48AS+cRhSSc0P3BUtEoPXVR3
         GXBPc0UiYLVVpTUj9+beUA08TRQhvWg2uXoRrW3opUmX/PMg5HC2hVIQY5Is6qTaiI5N
         d/bg==
X-Gm-Message-State: AOJu0YwY48YdLyUV8iLoquzntOmNR64ycNxhzrmPLyMb+Q7qELaVZyB3
	is0/30k3Jn9rZMQ3ga3TkHj0JKxOx/FBuotowLGet2+tycOXePqC7rnDlfTZ1CJf05RannDl18A
	nGFEm
X-Gm-Gg: ASbGncvLls62tWuUABgSQp9VdFItaMiBP/sS2eBz3VwOvckqzAii98nCaYLtZw+BTw5
	ppjYWtdr8MQu/FlDevWokLAd3mkUc7xdmWg1FHryxAbXwsye3j7Qckv0+TzWfWgP2L5mnsJPcJ+
	AxpNggZcdlZUmVQ2BE1guq8QQIoJA28JDC0aWkiDh8RtTFnWCXwJjO1sTMtCL3M8x3wla1MFOI+
	Jwec1GoVI2tejw3MZAS9GPfHQZ2a91IjDefjmCxJBfhYXwX4bT8KBGqe4DDhOxMcv3g/U+Jd9bn
	+wncnF4D2TSwIuYe+XtUlNSlpsEy0v+n79Wr6k0XDii+k/vasWV77C4kXtVYOf6MDtjXtI0ITXj
	lxykr+4YLx+fqhtQoF5Pl+cSqtL/8wFHq28fz99GhWppnhL9oqxE=
X-Google-Smtp-Source: AGHT+IFfHEGw3ZHcBrGOCHPkP4JhCXOqXQVIDNDYQBHPsXh8JWKLHgRkAwtb4n8mNv+Yh9LOctdwYg==
X-Received: by 2002:a05:6000:2405:b0:3ee:15bb:72c1 with SMTP id ffacd0b85a97d-4266e8de568mr2406809f8f.52.1759935558966;
        Wed, 08 Oct 2025 07:59:18 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d869d50sm31212460f8f.0.2025.10.08.07.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:59:17 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 249B45FA14;
	Wed, 08 Oct 2025 15:59:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/9] REVISION: update to 1.4-wd01
Date: Wed,  8 Oct 2025 15:59:09 +0100
Message-ID: <20251008145916.2626143-3-alex.bennee@linaro.org>
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

The state of the repo is currently working on the 1.4 specification so
anything we generate should reflect that. It will be updated again on
the official release.

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

