Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F44284B4C
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 11:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095219; cv=none; b=SCD5DkoGfBOhIKHCp6pJxE1BiABOH37EYDAABxUxDR7KbVvH/fNG0TfASJ1TizJ0pnd/ebo9EAx54YzQsQCwMXr3buA6svWeF3zuTi8Vxe+nwCXKTIdFNYq7gGPO6GREpI4oACqNVzMWbwU0Yw473N1SZqucY/tpOBs7DPTbQek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095219; c=relaxed/simple;
	bh=ppxL2CkoS4cJ9pIEQTG3v0jZpyKiaNn+zV0hMjCsnkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DdQBMLukokaZXsp0dSchAXqgXpU+iMa3DAFjpyBsr6xBpDa2XzRaoIa+Q4viDGPrCtp9ksY/j6/KQU8UcqR6bQsKw6qH9Kk8GJvs1LEfBsbExnPlNFGQIJBBcIR3wKdtOvgiXtfwVhgTIwNWRkxjKVgJn90WDl1JdSi7HfW1XSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c7/uPErZ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c7/uPErZ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63994113841so3341705a12.3
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 04:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760095216; x=1760700016; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+uVu0uTaDUz5PEpqS6iVo6Ox+wZvrg7dQgJZQEZ2Dk=;
        b=c7/uPErZZE/Ng+6p4X00C4ZqAdtgQ68ulRWlqxUNmizHjSRYIsft3kHd1+Blp13MID
         tO8GJldQCKFE75tF9ypm97vx0QvfwBW0aLupq5vpwdUaGAeCfjVDRsb1q6gBIAf1XzEL
         zarP6Bm3EHkRgCVV21Hyj6HapKqzTxcv4B/ezpuP3D6fW6lrwJtzT0IsCVjPEnsSmBCD
         RtRC3yieMZY3oRoFLsaJH3lwsWh80+d+clALUln9uppxi7hCVNwy4nxdF9MaiEVJEWfI
         gPQ7IlPJRi12tXTfFsjOaVxcEAce4MHNkqNPbdUQg7scDq9Jv/gnrG38XYRxTUTbU2yd
         sq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760095216; x=1760700016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+uVu0uTaDUz5PEpqS6iVo6Ox+wZvrg7dQgJZQEZ2Dk=;
        b=MD64D2hhjApuv7jDvoiSN0ruM6JKPs2lwk4tfr0woLXI0QvZga+rjp5ujMT5s0ZudK
         8HfsjVHdaarQX7AmvW1KuN32+PQsf49znV32Z7/QvngoMx58zGL6GIPOG7QnJ4mdqjy/
         CQKF+xjDyXcpG/vPXIgIhieetbT8CIxg0GIWQ/f9PjgImBwB5FNqx0YccX7sPYYD3L5u
         vSxRfbAS3GeQE96K3CsI7/zxeMrqu6TQyOK17shXgYU3CDI7z8w8SI2/9fRhO/rB46oD
         lqF9tpEaUf2KooUWZClnDQDW9in3qjT8WEuqlkpG9G5uykdKPASEPK1OC5zGB6P8guq/
         7/xg==
X-Gm-Message-State: AOJu0YxvlQWJ1j1n6dSBN4ElEpU52rNXZ6bcSt3W6y5pCT/rnlNJDeeb
	N9l0VzsYmhcf6BmNNKGGAyAP/59QijMiUNybcC8ou+bmXthKX0ZaB5o9vmK/x0teTO10VSiuJDr
	OU2+W
X-Gm-Gg: ASbGnctJc/BOm+XAQY4VddjDnPoVl2zNUQvb5so59mMpUXI08D1dKMn6Q1inyGyHZ9n
	pXvi2PSCs2EyhKyC35V4FWvwvMhS3r3xqFSbwAg459ijs4X7MTzJZPPSFHwWA1LCZWnfOT0XZFS
	6Lj5pwBkZjT4Ur7uf7dUFKqVCO6M3bb14uzubQilkZeT9kwpQRYg/I3ZcJ3ESpnoWaxDCsrXv6l
	kIbMZSEDBwBWSd8x//hwcSYTFkGNZqwD+XDR1TFvrEMZBKwhUg7bg9xkXaF719IritleKFBiJdy
	lYPXbeDjU/v4wrzB8gNFthVDlODPhCh7tAt7C9jtm7FhOHnzb1qnwNm9G8Dytj2YpeMZzHf4l0U
	hjwMeAccso5ehkyYBXJBENT3Z4ym5gGnHI6Fc9z7jHaUwwbgFb1cWPXLg
X-Google-Smtp-Source: AGHT+IEFYzxOtfqyHfUXq/FhtCaes4s+b19W+XUDUhmjgrqDqsLvwceN/GaSlzEWEukAKhm34X9sWQ==
X-Received: by 2002:a17:907:9445:b0:b3e:5f20:889f with SMTP id a640c23a62f3a-b50aa79f502mr1228024066b.26.1760095215607;
        Fri, 10 Oct 2025 04:20:15 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d952a273sm221064066b.83.2025.10.10.04.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:20:11 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C1C9F5FA53;
	Fri, 10 Oct 2025 12:20:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Parav Pandit <parav@nvidia.com>
Subject: [PATCH v2 04/10] .gitpublish: update base to current working branch
Date: Fri, 10 Oct 2025 12:20:04 +0100
Message-ID: <20251010112010.3880438-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010112010.3880438-1-alex.bennee@linaro.org>
References: <20251010112010.3880438-1-alex.bennee@linaro.org>
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
Message-ID: <20251008145916.2626143-4-alex.bennee@linaro.org>
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

