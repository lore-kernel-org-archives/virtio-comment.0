Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722399;
	b=oex77JFUz0xq0vdYPmWpZi+Bkex9DrRfUKykDhYcnXmYnimX12VpGbAwkTf8ki13MS2T
	 ybLor1rZgr6YleJSHPnQqvN9N7UQNvZIUyOj0v9bZ+/EbXEODNN30ehuw0sa4ygu5yd5t
	 2uRA3mw0xZpjnLLP4rfRvj1FJ7mhXx9QUQHyp2woxqKBgaQdR4e4+7ciuWaWNkNhp4sPC
	 A11QTUQi4ZM3gEWjeLplvhigLrhe1ZQySt3p2k2JB+p/SDnwBMzpgPiAljx2YFjFqJoGc
	 hU8aERQ79hFEoapnO4K87Vh7ICAfR4ua6SW6azOGMNESdLNFe1fIUFhz4DbKQa/vTKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=VsRJ33DCsOM+FatQUUNvurBGtVRVGIElUGawg5/y7eE=;
	b=E2tX/kgm1b+SuS8xdHQt0oenL6GefDKMqwKIYmvwnBmkyudOhSsClu+TEoBqUWEq4JDE
	 AwzA5tGkIC6SnPHViVXNAiedtKqX27MIQkge97DIXK+A+DrtC4z80CL1ibITljYZLIlEd
	 DkgByx3GdNyP8dY/NdCCN5rw2GyS8jsp0JaumVqf/mWQTNFHTweR4YXlvIHZXFF+J2B6N
	 QQHcwIIVWptSXmWkOh0o5DhO+7BQqmCfNt8152oACffevdZ7lKsO/EO06ZSgPop5yRLsY
	 b8kt8CyBznNWj8HvvN/q0oagz8VJTexASkn/vXN1EWHRoyO20dSAO6d16B2yZOx6TWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oOQUT5k+;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8EE606A323
	for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 19:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C8EE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oOQUT5k+
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso20903495e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 11:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795722398; x=1796327198; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VsRJ33DCsOM+FatQUUNvurBGtVRVGIElUGawg5/y7eE=;
        b=oOQUT5k+Sh6+HGTg+BBZX2pmWmTkyJ7wJYgsaNVg0XehycGntCZvaJOHQqSkqWtvGi
         5XUdsSoXFk6ov5BfnHo5f8jFPbEs/WEYEpAC+Ox0gppwYycw5efFUbWrwqnIVinWDPgO
         rikTtRocc56OA5LEK4RGr4ochb4pbo/M/IjI/Vzl3X0AZwEaPVGbznqLo9+MSqBLcRA0
         pwtvz5tsBA/cHGIIrYvYdz8w7m7/ie7AbjJL24Qs0UFCKVxqE6pB+RyDa8aQ9PrVEe6C
         2susUVO6ykXBbms9Z8oqkABDwkTBhdyuI+wM8MLz/bmUnHR+7h62vVxVIG2AZ7JGLoWa
         6/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722398; x=1796327198;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsRJ33DCsOM+FatQUUNvurBGtVRVGIElUGawg5/y7eE=;
        b=SXMfVj1rjRf3JGSHfbHlqrqvG2SrS01tV01kaSInneV3EFL10PIDeINTxwToIwHSyy
         EdEWECwQDmNHxfUw0qrCb5cupejxyzvqvk/18vpsex31hxkqGA/LDIZFqBBAFkzPzXga
         N4yTayMbQ81khBZoDtcUDTJh9bf0wVTRbMiZz6zMSqA3ViLiKgMTTFBKaJMdbbpzJZzp
         aafPAnE7Y05Dj8q/NJZGMMvvgM0u9v2+WrC+aFb1BwWhGddMkBf0xY5280ydgzzmWe6h
         YF5htOrIstA7vLoRZYs2TFh05YuZfKLrGuYzNoAXqpyYQxYzpY2qaQ+QoT8MIJtQzAgV
         ny4w==
X-Gm-Message-State: APuU4Z9M+t1EXB/6x3zT+rRZvgdE5P4i7HpyJ0cC8zIFuTQRvG/gzwZJ
	ZtwjHMUAo0FVguopWG5hBrKd8A/+wJeIpD3zLQl4Kl7h0lhTgq4e/fdkPwVT6Bm3W/bS+TrbptG
	FK5Lz
X-Gm-Gg: AZFdTZc7tDKZ+k91IdkOffZ1vwmgM3Z6vWqA99/PnWucSrnXplPnoeC16dvEx36BmdX
	AUGAyNwwI04qQBki+XmRKQkpQpTG0jx9pLtIR1GJeMY0oC4dP7oWnwZveDzu+rIBNK8/3FxsBT6
	03A8OAvM+WSKfxmMvwcLf4wOLIJ8exf/CIL0gA/rlGH+vgZc/9Rl5eF4UEoH4zJ2ETKjT1Q5Pwr
	3dzXat1lZywhnqmFESdKq5qjAB0B8g38ZoMeSXf9OR4MEPOJJA3RZsjYM5DvlCelVmoRtb9Rcvd
	BmlvtqFMbUrVc6szT6aPneXGQ3zJA59w21wDeHYmBd58BoLV/c52L7yoedq+RhIscSOvGNAwouw
	fC5clGuN+Nt6gpb4c6apCMt1GmtQY+4t8etZkF+zOjgWSKByZKmvlFGsbaF5+xTqGyf9Fq2iUAG
	VR074pPC30dUocWfbev5q9BTCk9TG85Bl7xptZXdlUKXv0wu8ke+l4UdTzYfq6Qmm3b3aZDSmMG
	Xjoax0qGw+GFnS5CR7BwsijLHN69LsjyexznTKjknpcyHxD68IuEgBko7OkeGIJ7T9bgMPmgsgU
	DBaLuG56mrfcyGZFv+oxr6XGupQY
X-Received: by 2002:a05:600c:4e02:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4bb88812b1cmr447416655e9.24.1795722397863;
        Thu, 26 Nov 2026 11:46:37 -0800 (PST)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1151956845e9.4.2026.11.26.11.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:46:37 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id DA3785FAC3;
	Thu, 26 Nov 2026 19:46:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 08/12] title.tex: drop vspace hack
Date: Thu, 26 Nov 2026 19:46:28 +0000
Message-ID: <20261126194632.2429425-9-alex.bennee@linaro.org>
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

This came with the original tex layout but runs the risk of causing
the next section to clash into the end of the artefact section. Let
tex worry about the layout without putting a thumb on the scales.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 title.tex | 1 -
 1 file changed, 1 deletion(-)

diff --git a/title.tex b/title.tex
index fec6906..547101d 100644
--- a/title.tex
+++ b/title.tex
@@ -54,7 +54,6 @@
 	\virtiourllistings
 \end{itemize*}
 \end{oasistitlesection}
-\vspace{-0.2in}
 
 \begin{oasistitlesection}{Related work}
 This specification replaces or supersedes:
-- 
2.47.3

