Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDCD24DCF9
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 11:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095225; cv=none; b=OD094IFtjo311+5umu3J4Y3rV/NsbfnxrHX679pK/gE9tp3P/1sDn+eE/P5EfznVzbDA6YYtzXkIm3cw9tuYV0ZZubdsAIVdv0oVYTD8kjaQjSFbwHujaiShlYo6EKZGortd/b4tKzpMrKT6tlJDSZcho52V20FXvQmBBQo0FrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095225; c=relaxed/simple;
	bh=M4tdKAfwKVOsPdvguzCnP84XiD02Uoadhuk0MBod84k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h1vQJviYE5TsrG2n3dAik078eA8LC2UjIW9nlrrFgVAVDbzU4kBcd0kiPUn7C84ItXHbuT9TjmkS6xg239JzN6Zv2xm6Lv9VqXsavLhBI02RV47+VKagGfhDg+G7wooM+XCxjEU7NchL35IY+MQJGyzXQJtaAK9gAl/r2WS4AYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OmcvBQlk; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OmcvBQlk"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b48d8deaef9so352118966b.2
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 04:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760095222; x=1760700022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrxUJbQQIHD7jz+aCVtJqpGj5XFsTBfbvu/oq8MtPco=;
        b=OmcvBQlkb5HOqh71PA4Gn/ZR6xFiA2KHJxpGR9kavdTBOINTCJGevrKbDSiVJKS0e6
         LzM53LhGqTrHhOshzFMMbON5bIo2NzQiiprLcVoJq2bcGlEBFOIwYpQRkXXJlk7wAIHS
         YQShXJkl///ziev7DQlws/tRqLZ+Zw4cf/byPZ5nBm5APBPts16xhsv0P33kkIIyOZbF
         raI0hZVtFO2CXlDhBqkYFAyW0fpZV21vKG0QhA1aDONmXzQwI+37AMO8nOumpCrZR9eF
         djwRp1FR+zARE9VHSZgh/a7V9WxXGWCRZhGN2T1Uw+kFtIqiY1TtaUMQWBC2PM5NmmwP
         4bRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760095222; x=1760700022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrxUJbQQIHD7jz+aCVtJqpGj5XFsTBfbvu/oq8MtPco=;
        b=GTWVBNrM20uceqtn1ZilBx5azkXHvWBSTPZ4oIZNoRHZixJpOYrlEaOugOWc6Pd5Vm
         yiYmt9T+vYa5cx0LykXTtF9KR+cCYzFqlsFN/K4qkQyfhUK8erZ0Ygpl2DKI3Kzyb+YP
         LKrv6OumPEhfe8EGrwZuZ7aDEzjW6R1Wigw4/LBulS39KkZO2xmGPSJEz59yCyUlzJU7
         Z52LDGFY5JRMh/kLfv4Yi/xKxCC3qeKrsbxxp1AV6xAonVRWllWi0HqgTaUnh00ey6Y8
         byXiwHu2V/3UERsl4u0vkqx+WEynNuJ707pkT5IFQaITPSLerlpkr/BsaYD2tt+IQEsY
         P54g==
X-Gm-Message-State: AOJu0YyM4hgrN2ZMfRmRom8fvQwCTuP51R/H7gSgXN+wxeoZQFa7kUOS
	foHM5G1onq7xlkTH8qNOdh+HEnhMcwV0ixE8W5AuWB6nvZ79ksZjXXdsFT5XyLpp6n9cYGpwptl
	8qZry
X-Gm-Gg: ASbGncuNHWFwEwMLe9AqjL7+87pSUcG+WJCXZv8AbDLDXzFH0Hc+Stho5gxy+cXw1vi
	HhPW9QKWHoiF3+obXl+lRZ4DE/gh8XI0t5/827tHL7DXDycxgejnwUIV5Mh9y6V19JSJ/rgMPaS
	UjbvpOiUzu06rLTkQYX2vi96SRo8dLZ5N+pqZ1WYd6+0A75BGZ/tfGYjZ5NfScOhv0KGjlYu107
	/PfGfHAWvgc8dxVJLNG8SbekaoYAHQjLstIMWE9E2Jd49GFuk9gmi1KxNcma515CpAQuH4Ww1cF
	Q7PjjV8Z5xsdD72yLC3bqSVx1v14dRApJoX3cmN9SsTRYoRuumvxRgiZxwuC882+LRIjR0oLlN6
	PTLZeuYSWK27fZeHaAXg4zkBbMgh6pQdgqeU690adp9w2IfsBiLpQZztK
X-Google-Smtp-Source: AGHT+IHsCA6y65EPuCxnzKS1kESVypZbjEdo9S8NX/KS0dcVDgLyWNOCjXZCyrbKI8O71wzwzwVa5w==
X-Received: by 2002:a17:906:4fc3:b0:b41:12bf:e3aa with SMTP id a640c23a62f3a-b50aab9c91dmr1237084266b.16.1760095221940;
        Fri, 10 Oct 2025 04:20:21 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b567a9ceae5sm90242666b.91.2025.10.10.04.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:20:15 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 0EBA65FAA0;
	Fri, 10 Oct 2025 12:20:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Parav Pandit <parav@nvidia.com>
Subject: [PATCH v2 09/10] Makefile: add some simple make automations
Date: Fri, 10 Oct 2025 12:20:09 +0100
Message-ID: <20251010112010.3880438-10-alex.bennee@linaro.org>
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

This is just a helpful shortcut, especially when editing the documents
within an IDE which will offer up make targets to build the documents.

Reviewed-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-ID: <20251008145916.2626143-9-alex.bennee@linaro.org>
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

