Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CAA2ED159
	for <virtio-comment@lists.linux.dev>; Wed,  8 Oct 2025 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759935568; cv=none; b=jix/jcnnpvr0V3FzXZsiPwDBnndeywLb7hVVeTb7fIu3pATSUZh4KQq2Y73yEg0C9vC6Zapje3ba2UXtm6nZlwYLPeW3p1Iwm3EB0GvP3/6+BAnxE+0b0n6KEzyZnSr7PtPaHi/2i+6a6E2Gp8WmIxCNHlWnJvPpVCKFQAL8iJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759935568; c=relaxed/simple;
	bh=XjOQdGtp/0Ms387RSKcu01PUIA18sxULf30qsqhlvfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ih4zHxlBKJDUPF8BEMfyT713cii8rlQISZATPsoyB9L3QdLvNv3YoymqwxnVaEiw7ios0iTaIs8Ky1RT+TNzG5ByoJdvGtfdm9l8FhGGOwG4fH9hLEp0jtUibwcO/k5yh1311Fw+YppL/VFweFARdqGubDmLk3hGwLhBYf/5TRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p24f1hc0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p24f1hc0"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e52279279so52573345e9.3
        for <virtio-comment@lists.linux.dev>; Wed, 08 Oct 2025 07:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759935565; x=1760540365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcDf1kndKSJ3qGoRaJ2GFBY0Fr8MF6fECAqXbVXjMds=;
        b=p24f1hc0u9Y75iDgQ/+9hb/+pSiDX6wJfwxFjj1//yKxj1qRcSOs4/8oiDiJ5yyBFe
         Yg12NyxDPh1wPP10Dpnd/uO1gQnv0mj8dE16A9+kraAQYHNfosnx1gphpQLpDVo8FIQt
         GVx0Gkc02Ls6OvKz2zAp01piDjISI480JLba1VyiFXI6JD5Mx2h9hELzF6en6v98iQJX
         lPDuquYHO8BdxZDTmEwKuh7yw2lN5wAstdU7g7AZbOeguGcXcAGDQ4IuCFX6cAh8zlLh
         siQvr6slABWSfxLbH9BKe4t3olNqPwgfhTIk8Eb/TKgfCd1F5mshiuXNd/Rzy5fr3+ZS
         +fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759935565; x=1760540365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcDf1kndKSJ3qGoRaJ2GFBY0Fr8MF6fECAqXbVXjMds=;
        b=sSTmM8B91P7vaTm08sHRFu5923yUR1VYahCnqay+wEYk4loCfwgktvCYeHtrBMHT+G
         qc6OHCnsC1ErVV+s3uyLEv5l2IfgK8PIImY4Y355ZTDuzIpMNGQNfM6Ikvf74eotEawG
         y/TeAnyFZ7FL9nQNhCQUX/SimsVIoS7lkMC3wFY46g5RjbAYS7aTSJ8LnqyGIPOQAUvt
         CExSqaE5UczAGLHFJuUJq+jxfExIDqYdUBi9m2zgS5sYzj+OxckuR31vPWWBal2AYec9
         fqBJjsz7CZCZk3NMlV1ANLPya4ZiZEtAvR/FTlazRo8szXKkG7LjSyF864qx/fhEV0kk
         lWrg==
X-Gm-Message-State: AOJu0YxTIQHLCv8fRbOR+DxHxXWDjofqpt3sfhxn3D0L0My1WlIo8ZGU
	nf9ixLvfKIUG0qqIMY7lyF1fUJXilGOtxdSibWzwlGrf8U1XfEu9SWiub8mMu6qJOo/nYl1+65+
	Ew5VN
X-Gm-Gg: ASbGnctaX61+q/hUR63lvF9i4GYfgc/PCmhClhKWq6s5jenzmFUNlEG4bWdFfEHIDP8
	QE6tooO88+OlScCfz0ftTU/uiF+OV2gSJKOys5VGe6oW91um/OWLeE57jOMuuV3FNBUKt6uO6bo
	wgZi0py3uKEHMMTT9JxBlMdET7USDU86rjdRA69O6QN1K+IrSGDn9Jx98caQc1htuym3xIVIyC5
	Td7QzJFpNkF8/QXrzitbE5C56j83iRqi0zMzlqjJP1aP7n1iQvSU4GDliR97eVbx1SxbiKx2JfP
	tVvAT4jwdVvMZiORDSPfcmi70ExBBytw2u7qQ1WGo855b/J7Cc68PW3D9GGrE0lm6kEwXC2X/3A
	rtabUylp/sY4J9QJci2A4x/1gKT8FBQd/8SyroVP8X2pswhptwJkuesUJqO0clA==
X-Google-Smtp-Source: AGHT+IEO7F6Xu7LouYg04dqJ3juo0205wAXg4ZiRFni0ivvB7sRURQni/fNkbTT9TdROoVhHgvTXog==
X-Received: by 2002:a05:600c:1395:b0:46e:37fc:def0 with SMTP id 5b1f17b1804b1-46fa9a9efaamr28586255e9.9.1759935564914;
        Wed, 08 Oct 2025 07:59:24 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e97f0sm30059272f8f.27.2025.10.08.07.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:59:22 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 749C35FA60;
	Wed, 08 Oct 2025 15:59:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 8/9] Makefile: add some simple make automations
Date: Wed,  8 Oct 2025 15:59:15 +0100
Message-ID: <20251008145916.2626143-9-alex.bennee@linaro.org>
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

This is just a helpful shortcut, especially when editing the documents
within an IDE which will offer up make targets to build the documents.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Makefile

diff --git a/Makefile b/Makefile
new file mode 100644
index 0000000..989b429
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,33 @@
+# -*- Mode: makefile -*-
+#
+# Basic Makefile to aid automation of document building
+#
+
+.PHONY: all local
+all:
+	./makeall.sh
+
+local-all:
+	./makeall.sh local
+
+.PHONY: html local-html
+
+html:
+	./makehtml.sh
+
+local-html:
+	./makehtml.sh local
+
+.PHONY: clean
+clean:
+	git clean -fd
+
+.PHONY: help
+help:
+	@echo "Build the VIRTIO specification documents."
+	@echo ""
+	@echo "Possible operations are:"
+	@echo
+	@echo " $(MAKE)         Build everything"
+	@echo " $(MAKE) html    Build local html"
+	@echo " $(MAKE) clean   Remove all intermediate files"
-- 
2.47.3

