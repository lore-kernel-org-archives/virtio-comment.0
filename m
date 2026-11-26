Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722396;
	b=S8RXaiK/svsFYISt6qW8XGb1NcZD0+a8Hhgx73TyihCzxsSIXcjhN5ZXKWKKWkkHDlf1
	 qRQTlwW7bRfEV7HOlzKg2UYCZrhmlJNsKp4n30cfl8ITkPf/DONlbSsA9Tg3D/zfrZz8L
	 Kpc8Hr68ODmlXQUDWr/bBhsHjswW6DFQaknwlSsz9jqdFWUWMY2Dt7rk09JTcAyWiiZU7
	 DjEr40PqLLvkrfh0lKISVzzpmE5eZyYe2ijH/nfFGjpiHF3sWf+43F0YTC6v80czGYG52
	 F31etLkwNRXHlt0/By606lgqv3FyCBxFB2GpUUz2R1QHgNr9JJogapxSncQ7RzAc1jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=+ERvemdXGpDrmmOPWI3Y5SfGIE+QUotOirYR/duJ5fw=;
	b=wWicEAiiDiz3jisJsYggk9pFNuIBrFe+rISx/iiFrDDruSbQlj0v5nFKH9VX14Fbvq3y
	 j/Fi38i2VXMaN2EHgv5ArEDrebyE6JwpGIhtRFZNMKoLm8a9jWzbd4B6Un+klxxqvj8xh
	 diXOoyhY/KOFrS/jZ7DWrXRYPp+zskNPgprIoCAgjr5dwgOU8rH9Jq00XrbIUdJ8f2Ghu
	 2JOOGZT0KBzjI1tP8h+M/E/N8tV6vFB2sMfsrN/9QEAhv6zSrQzjhm99l1glx0XS3N9nm
	 9dzmfDKJV3xJba3h78Z0qYn4ZPlDM4TPBk0L93IsZu/K/8XGdNX5Icwpl0k0h3hr5Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zagxuDIs;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8976B606A323
	for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 19:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8976B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zagxuDIs
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so78877655e9.0
        for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 11:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795722395; x=1796327195; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ERvemdXGpDrmmOPWI3Y5SfGIE+QUotOirYR/duJ5fw=;
        b=zagxuDIsI2zF1qoyKlLMl4JxxbnexvS2tRNvdUwWDtetU3n5ztWYDoD+ItkheM+aRI
         aNisUDaOGlgzK6iqsM714obDUVoNrU2TFZ0nNnMA1atXv9b/u3ixlUAojFXSGfol9sDA
         k5V//8oUKL2RY3Cxz3715meL32kFeeup27BQlPwfeNPfOlPIrn0tMkGZ5HCCuAXxxarr
         /VKuYYwMDG5BDNYH4DeSKBLNLv6qCvJhUUx8ULloK3Xi/aul6q1BNdXxavEiWsPUEGrf
         16Y+r+8z1wQuHIb18VfW8JXGo0uzeRfdzl2M8DCMnV8iq9VlMiQuiZAxzwrONzjpBQln
         dbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722395; x=1796327195;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ERvemdXGpDrmmOPWI3Y5SfGIE+QUotOirYR/duJ5fw=;
        b=kfQLX780IAVD1WJI4jR4mlHsUgU0+xYhRUO+c+nYC79H3BXEhbk56rSciPx22sQeio
         Aw6e8/sZHV/nRjWjB+z7rc2IaRT7eiBf0n5p8wfwpsdGQklAT/L+R9NWQxjcvCnQBpMy
         LLTGrpZPRwebedp8zKvO/D0yZzF4WINxvzAe70nkXZWiki0lUJR9cXWJKRtwTbJYtaBF
         eDW10SN6EN0vS4kpS79seiwXK5MZ0884Ub2Nx3y4QQCPn8exy5DsVB3KyfcQCwIYQWXf
         nVRZ4n53Ku2HeWMQdVtH2liOprwJNmIRm5mpj8TviW+mKhK9tve0Ki0M3zsLFWq3KcFd
         fwCg==
X-Gm-Message-State: APuU4Z/7dELrwPuBPK3UTP+3nAuEUJhxXD//XAlojGyJR9B5gOGNr/6s
	JYYRLQwKVoa3Bq8o6Y6GkKtEuq7CGTJ52EaFfeHi5wb7m20ZFRB/M2s3thRCpZOzJgtRtBXJcQA
	u6+a8
X-Gm-Gg: AZFdTZcF9doRS3G/p47yK9sWDGwqS1wR+9UQGQZoXI+anLvIy9S2mJ9E8MKVvRbmKXZ
	MoE8QjYw+/WZPioWP1zvqdDniPeUj+k82R49QGcXHTDo4og8QX701p5RuP8dVl+Sn4TUFQI08At
	jNTpXeQFetighC+fSpDPrKC4L8sVgFYpCHwHeyiQv2qZKoqE3cYZN2ds1S9geVJFyN9pTMRJWyq
	yfkKnfRaUB4KcInUh7npl3oiF0IniPqej7dyhzqf5sQiZDbyani+ZQO/bYS9QOb4TuTuOUzQb/9
	HVrWBiJm2XYSmtxuzp8v08xuhMwr2btvaS/Nbl0LN+7SirCKMtz3dEh3MWcwDdzzgdY2dfxMKTF
	2DmuuUwnX+ppyg8u62QLiL5+PPPUB1KW20Xebnch3/IooSMyodegDmH4+Tmj+R74WqhsQe58fkF
	XsCQ+3Osdgg0QoW2AzwB9msEvZ1QHk8/5M91iP5gNGNOI9/gerWuCCwhU8GqAPKf/4lHCkQYeiP
	Jp07Dxs94MkMwf4lwlN4nXtrho5R0TzgZ2jJH5tgSgMGZ5h5NIzDRNZh7hC9kTefXeWL0lcXy7d
	/8eqIurBbxXy9bfGUDZ1bToOpcWC
X-Received: by 2002:a05:600c:638f:b0:4bb:6752:8400 with SMTP id 5b1f17b1804b1-4bb8881a2bbmr411293985e9.17.1795722395040;
        Thu, 26 Nov 2026 11:46:35 -0800 (PST)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm430103495e9.4.2026.11.26.11.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:46:33 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A507A5FA33;
	Thu, 26 Nov 2026 19:46:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v4 04/12] .b4-config: add project defaults
Date: Thu, 26 Nov 2026 19:46:24 +0000
Message-ID: <20261126194632.2429425-5-alex.bennee@linaro.org>
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

b4 is another tool used to apply and send patches. We might as well
set our project specific settings here.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

---
v4
  - fix typo in link
---
 .b4-config | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 .b4-config

diff --git a/.b4-config b/.b4-config
new file mode 100644
index 0000000..5177a67
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,9 @@
+#
+# Common b4 settings that can be used to send patches to virtio-comment.
+# https://b4.docs.kernel.org/
+#
+
+[b4]
+    send-series-to = virtio-comment@lists.linux.dev
+    searchmask = https://lore.kernel.org/virtio-comment/?x=m&t=1&q=%s
+    linkmask = https://lore.kernel.org/virtio-comment/%s
-- 
2.47.3

