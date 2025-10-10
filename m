Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5502FC01C
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 16:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760113749; cv=none; b=fv+UUm0r4F/h/bhdqcTRaO37+ZNXuWpDafKln0pDee4S3YDJBZI7rMvUGXcHf/xIgveOSFjiX68eKDUGkZb47lAkaFORqvncdX1I5hHg4sMoerhDdS9PPH4Oxiszpfw3OBvGDvLC5tq9uDB4hRXbSpEnfy8Kg94/aXP9ToM4nBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760113749; c=relaxed/simple;
	bh=K9WM/4dAAO/m/GQXcnI5XW0Dtcdby6wQoZH34Wapp44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cpX+gmSw3kGdxjsRKsETokJfh2tSO0qyBTIT5O+OWmmNv/BomVnjiIJuWFJ3/euPt39hHF9zvHxHcgHvucnQhrMry+oO0JLC3A8Yvuq43KWGWffwAwF9mmvhOQTYb3D5fdjVGQmcz8ScJVFdz26w7GdvMdumOBTD+yB2AA3spDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nxJ3ZFEG; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nxJ3ZFEG"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b48d8deafaeso517235666b.1
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 09:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760113746; x=1760718546; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2z0owahIl6gp469LuA+wpDcZiMsLKnOB7e4XPT/s9w=;
        b=nxJ3ZFEGOZ6krzVCMAC41Ub/3sePBvjcynl2So0CTU2bmz4z7ZmpfTtCjtXv2KU/Yq
         ZxNeuk+VCPkRMzW/Wiuq6oVFvPRmz9e4vFvqktYj+nxih2bQ8bKFAj4k1UaKroAXzgSk
         OjSp/4LMbMyXNV7OktddY6NnrvUnH+H58envOeQqmXuxRuVeG8WJle/P5EdN58vQCWD/
         RUAx5hyhT4F+qXM64gra+gu42o/50Wpnfji2tgh1tWm56gJ+3i2dv1dxQm3g5wpaIn4N
         /5qrVOgdVhdIRmAiqpndeOKfxfijOCs9ZU9oPx4Wk31auvzyUJjbUDLIyrJ9OuJ44YXX
         ga+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760113746; x=1760718546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2z0owahIl6gp469LuA+wpDcZiMsLKnOB7e4XPT/s9w=;
        b=CzoNp6LDiHJ/96kw6hF1CrQtlseUe+7CXkNgwk5hLZwG0QtonFl3vaGlrdK507oe4j
         R1bHBN6/HQC26E0wOp0WfDkew41RV/9sLEtT7DANtE7kU2x7RHEwTrbh68tcE6mDq87g
         p8s+Dt8CnwNmyTwu/HNt5QuAKkGcAyYKYM2lw3JZ9qUWGDwSNY9LmPNChqyStI7D64ic
         cV8qMvg59DszcsawtS7s0rw45GyD2M/mcAuD2ujnaGlujabgiAjlp3EJv5C0Ns3zJf4r
         HnyCc7SJfkY7OzniU1K8gffdqTD+CY5aFL3nRGQcg0Fs9WY546kHsxwvzySusIVHN9wx
         wghw==
X-Gm-Message-State: AOJu0YzszBJTEqzncP+o2Qvn2JnHqvzin3qpJ+vRX7IKoZb5hzywYVCW
	nsHheI78vXvmDVdps6OzjaIGxVYiGEI2TE8p3wZyOWwNIyFGKNrpwQvee3Jw6RSdwV8KFoFlESW
	84KYe
X-Gm-Gg: ASbGncv4LrNAe2wekPa/7NC9ViqRrBmnaBu9cG70PNtCXDgym6XTuPC9YMVegs29pHe
	z0sB4Fu0PocY0C73NeL0o8aX0J66rhdgsFPVqp+FNAlTDxwnAd/IaS15vYNZS9sbx64VFAclgRA
	9xMirNLR8XT+iZaBK/gCBQNpvZHmHVnJ5MShdtqGw7MPVGGcFzqiNDnAh40k5WDFXc+XJYRTX/+
	97bpPccQVYkMvX832DxdHh2Z2lmdQpmffnvPbSTiwL7mukB4R3d8TuZGcY/TNzoMGlFzs3NY4dK
	/zl81XhIVni4wVqr8rrTYpzAwW8d7icJQS/xCP7ylqOnE8fO/YbJSqXMYC/JARdWLkSfiiYqrxQ
	IeL8eLhnVOCdXnb7QhoydQ7KhYoGXOqvPYwEXu6pIKSzZHQ==
X-Google-Smtp-Source: AGHT+IHEUVKJVxRFl7r2ic9+WChqhd9fH0dPxUFRNFd3EEfcXqA7lN/VWvxjip10QoFjv6aneEa1Gg==
X-Received: by 2002:a17:907:96a9:b0:b40:b54d:e666 with SMTP id a640c23a62f3a-b50aaa96b25mr1463573866b.16.1760113745491;
        Fri, 10 Oct 2025 09:29:05 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d9920ec0sm275787066b.86.2025.10.10.09.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 09:29:03 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C5D995FA6C;
	Fri, 10 Oct 2025 17:28:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 07/11] specvars.tex: properly wrap arguments to \urldef
Date: Fri, 10 Oct 2025 17:28:54 +0100
Message-ID: <20251010162858.4107388-8-alex.bennee@linaro.org>
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

chktex reports:

  Warning 1 in specvars.tex line 6: Command terminated with space.
  \urldef \virtiourllistings\url{\virtiourlbase/listings/}
         ^
  ...

While the space in this case is probably harmless we should be using
non-ambiguous argument wrappers if don't want to drown linter output
with noise.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - mention the linter
---
 specvars.tex | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/specvars.tex b/specvars.tex
index a80557a..cf67070 100644
--- a/specvars.tex
+++ b/specvars.tex
@@ -3,13 +3,13 @@
 \newcommand{\virtiospecfile}{virtio-v\virtiorev-\virtiodraftstage\virtioworkingdraft}
 \newcommand{\virtiourlbase}{https://docs.oasis-open.org/virtio/virtio/v\virtiorev/\virtiodraftstage\virtioworkingdraft}
 %Below must be used to make links work correctly in HTML
-\urldef \virtiourllistings\url{\virtiourlbase/listings/}
-\urldef \virtiourltex\url{\virtiourlbase/tex/}
-\urldef \virtiourlpdf\url{\virtiourlbase/\virtiospecfile.pdf}
-\urldef \virtiourlhtml\url{\virtiourlbase/\virtiospecfile.html}
-\urldef \virtiourlh\url{\virtiourlbase/listings/virtio_queue.h}
-\urldef \virtiourllatestpdf\url{https://docs.oasis-open.org/virtio/virtio/v\virtiorev/virtio-v\virtiorev.pdf}
-\urldef \virtiourllatesthtml\url{https://docs.oasis-open.org/virtio/virtio/v\virtiorev/virtio-v\virtiorev.html}
+\urldef{\virtiourllistings}\url{\virtiourlbase/listings/}
+\urldef{\virtiourltex}\url{\virtiourlbase/tex/}
+\urldef{\virtiourlpdf}\url{\virtiourlbase/\virtiospecfile.pdf}
+\urldef{\virtiourlhtml}\url{\virtiourlbase/\virtiospecfile.html}
+\urldef{\virtiourlh}\url{\virtiourlbase/listings/virtio_queue.h}
+\urldef{\virtiourllatestpdf}\url{https://docs.oasis-open.org/virtio/virtio/v\virtiorev/virtio-v\virtiorev.pdf}
+\urldef{\virtiourllatesthtml}\url{https://docs.oasis-open.org/virtio/virtio/v\virtiorev/virtio-v\virtiorev.html}
 \newcommand{\virtioworkproduct}{Standards Track Work Product}
 \newcommand{\virtiooasiscopyright}{Copyright © OASIS Open 2023. All Rights Reserved.}
 
-- 
2.47.3

