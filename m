Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E320D4A02
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 16:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760113750; cv=none; b=nXy/2yCkdjnTyKNQHaf0UHFEtV7ibSewceRoecgDZNcV1T6SmXprWY5+SgIi6LKvLXZOw0CjjN1az+/EDMfHMDindahVy2VUwdpjkOW3FMJPB0faE021d+m9y9rg11m8T+TuK+b8tZIgNAC/30Mh6jVLY2RMWGZEiSBvcDYRuZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760113750; c=relaxed/simple;
	bh=JIQ+MGkaC14g/odPXZBWqjUL0n43hahCnM/pzPBTbRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=os7WnDy2SMNlkOGnZyjLgeRrTY3JhtOyzzWq2OVkDXKjSQIY19BCWS7nBlJbkKPQodx11SfOs/FNbjqpbjRYCDTL2kKUSoM7ls+w+8qEjZd/J3PwZsIEO8vW0HdjuNJJNjHXpAY8U8DQZ0SeTj1rg1sEy1y5TuVEo01dIan3kG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g5zflFjp; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g5zflFjp"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd68bso187365a12.0
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 09:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760113747; x=1760718547; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gy9z3CLwadL3CfU5/ZQyW7RbOiSje7xMm7zT/POXpu0=;
        b=g5zflFjpkAwjgZflYcuGiDQLhX3kuP2wEyUY7ad0/u9E9cRe41Y95lLlHfML6fZIKg
         y5OBRFINYVgDZTXyV/wWGPnX3V0m65ON5MrKu/HEwM60wR2oEkL+tgMzq/qz1bx7TFZL
         Kab5C+ishVmbIjwdxXfMTWm1We1wnWqt+cjsc3iNh6UjZSIo6LwRyQikkef7u74YV8PM
         3AeYAksAtsrSUym02Wib/L/6avHqJvXLfeqTJmvPZGEs8hH8T9URn8Cq6v7cLsLxTTmR
         oIf/hpnDhdqWdizAbtkaQewHMV0zemFurqWdjANeG751KnmLfwGU2wfkT+jY9PSd/QPZ
         +dmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760113747; x=1760718547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gy9z3CLwadL3CfU5/ZQyW7RbOiSje7xMm7zT/POXpu0=;
        b=rggE5HU0+lXigRgKDpflGjWbP1qE/X3vWzjLy1Ay+2LtKdnRJ78kMW2vQwXOpyeO7Q
         +GNOz9GpgcI71deQZWXaN3i6tUPWktOmY7BOIKObZY0t5bQ8EddGNoG3KbJAMIKLe7Mb
         6ay98SY4yI0/0jpfX5JoNshF7yz4C3+iw1T0arjMWWedVOTr7N4IZgBmOPgjy0yBs8EO
         VoPET5QeL2QAvqDD/LgmYZn6EGrJYXFFV6cBSqSXK2lhGPPjY5hmBh8/QvDoz4pOWnpb
         BzwKaUIcQEgxjhi8GVRW1Z4zvWndFsQ9J0qjuQY9JVq2aL5PFbfd1NpxCX0tH5j5KcxM
         3T1A==
X-Gm-Message-State: AOJu0YwezSZxqwVgynIQO6Pch8j+MFrfWT1BW8XkEYlihlFFCl++MByt
	OZ/d0g+q3jp9LEpkWoR08Epj/tAgFtUDuu1GSGJU14pZ+9l0ypflTa71bHVfS9qTByBOqki3UL9
	wmhuR
X-Gm-Gg: ASbGnct3E/ZpM0LH9Kk8eVn+rNQZGWcIw9vmPDJWh52z3qD9ZMfRujAJGj3FRE6Ht1A
	l0rci/Lf4HSFDz0kzwhlAMAU8sxrnngZUaD/VzL6RdHXfCGoDn/YrteO9HUaFVM8IaFhJPNUTcy
	geNLPveKr1DeBaRj6BO3oymwv5XZdbpjkjDyAPgfO87UkoHZDBXgy0yHLDdoJvXAXDMs0Ntfnfk
	biGOq0V8n9phMIda7cXwPPaF5o2v9tLOMB8m+/ZiLrGse7B+cEh5Z67HXqao6Y5soMBJ1nDk8Ga
	1eA4d3MIH4mF0Ohx/aL2C0A9hMVPn9ywEF93KVG7q4VSw2E4zSdRlgOAloCg+nXRCgCFzAB7IKl
	5C8nbFFAoYsCYiGNX5vP6Ov4eD+yig5S03r+zJGvhbSAYhA==
X-Google-Smtp-Source: AGHT+IFvPq2ygQ51QYEtox1BgddFPsyHWn6LOvUzhNgC1xEfkR0zpexMVZEeTpBXqxg7nnbwZO/FRg==
X-Received: by 2002:a17:907:6ea9:b0:b0b:f228:25a with SMTP id a640c23a62f3a-b50ac8e5713mr1234478466b.64.1760113747260;
        Fri, 10 Oct 2025 09:29:07 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d951deb6sm271215366b.76.2025.10.10.09.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 09:29:03 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id EDD675FAA7;
	Fri, 10 Oct 2025 17:28:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Parav Pandit <parav@nvidia.com>
Subject: [PATCH v3 10/11] Makefile: add some simple make automations
Date: Fri, 10 Oct 2025 17:28:57 +0100
Message-ID: <20251010162858.4107388-11-alex.bennee@linaro.org>
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

This is just a helpful shortcut, especially when editing the documents
within an IDE which will offer up make targets to build the documents.

Reviewed-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - rename local to draft to make intent clear
  - update help text
---
 Makefile | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Makefile

diff --git a/Makefile b/Makefile
new file mode 100644
index 0000000..f08f13c
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,34 @@
+# -*- Mode: makefile -*-
+#
+# Basic Makefile to aid automation of document building
+#
+
+.PHONY: all draft
+all:
+	./makeall.sh
+
+draft:
+	./makeall.sh draft
+
+.PHONY: html draft-html
+html:
+	./makehtml.sh
+
+draft-html:
+	./makehtml.sh draft
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
+	@echo " $(MAKE)            Build everything"
+	@echo " $(MAKE) draft      Build unofficial draft"
+	@echo " $(MAKE) html       Build just html"
+	@echo " $(MAKE) draft-html Build just draft html"
+	@echo " $(MAKE) clean      Remove all intermediate files"
-- 
2.47.3

