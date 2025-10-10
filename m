Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4752285CBB
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 11:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095221; cv=none; b=mAaILCf0XTGGLcomZTP1Hmyovq4Tz6jhaS5i62U6DtvoTp1aw5/4BpwTuIgPXbe9fhGQ35MdWMNgQZk9Siki5BeHg3OIh7oxtaZZw1Rvm/eD2Qk0tWVqcKuv8KojKN5tM25vUdZTwxZXLQT5whwLl1RE9mnvtmrOZpCpkF64D2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095221; c=relaxed/simple;
	bh=v2ZEhLMCChCoR5YP372OX/1B7NUuab2fs4sS4Lvxhug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sY9NFMho4V8LvWmlJHaBAAQaVfR/lauonSI3dzOcZX3mx0jUocRqcm7girtHYsWqXFCxGFjMaNwqgWjibKYZTcVSv6xS5wyq7iVd5UobAZiPaPe3dDKe1qtDhfhVU3mvdJrzkREFChuql5L6r6c3POST5PLCBwWBawU+XIevvZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yvKxbwSJ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yvKxbwSJ"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b4539dddd99so398070766b.1
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 04:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760095218; x=1760700018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiTpAvf1nlpvbdedVXHBsLsvLLqYOFh5QBqTjfS/Q9w=;
        b=yvKxbwSJBbxu/x0wnj7hTs/ruf3a7zmQJQqnxIyfQGaV32W0MJBKEEJQ6QMOzBxidC
         J11q5z8yBSViXdYpAEYqQEWiDK8cac+VW059EtPWi5OJncbukoNnT43PzinNp3qcnVdL
         vaORNqlq3swHxT+aj5ic5IopLV0h8pgusmatHOCCQjj2kbwWb5C1/qGkwtgG6Yc9n6Oq
         HBFJZWb52FJDW6YmDdmyH3hhUfVYrCrNJ/BUURil3vRqDfHOT2fQibDX7ny++WAJoZdI
         vhh1s33LxHLf0VZoiPNuaC66bx/XZvI2yAFN3RIlk5kSiIah1RNoOa41cj1rDmA8v2fm
         D8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760095218; x=1760700018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiTpAvf1nlpvbdedVXHBsLsvLLqYOFh5QBqTjfS/Q9w=;
        b=qthS8cBck6vlVkKkQWq4v202C6R0ecE9Rxnzk5833afrhdDYCh9Z66IJRUcFUxvC2N
         TFheRy2s9CVSQ/quVQVSY2awGsTAyjdylUxpnrlFDI0iiev2/nqqj9brrBtsC5y/VLRm
         8ZWv4k+r3yAQ9Uv5revooiiJ9E10+GmlB4sxIfOkopXpQrKEO2pMHs4zRD61xyFy8mXR
         UQVINR/L7l4KlkHBKVFgjIPTJumU9A/q0+hXw5nSzb1yQhxSiZQjwYwSjn9LMD4m3wOk
         B1/FsGTE/DJhli1zKSE9An8dhun65SFJ7mrRSkC03mZucTJSGzpPll6pLNZPlGhbZA64
         V61g==
X-Gm-Message-State: AOJu0Yx3BI9OvZJRVkyMkRLXJTuSQKIcjS49pvkglj0Yksvx/Y1MLRbO
	WC86DUmXW/9Ec9P/M+iCHRCnAiTWGzQGWy81xkD1mM2RLtR09iKtZM1iW+Ur29rz7NZEqbNmjsM
	0VqAR
X-Gm-Gg: ASbGncuBDmSImo6yFaPfX7Oay/CP6uzYXhl4Ark/IxSvP5VLYbdttJlrkWweJ7H3cI0
	i01vtJ726Qq/nRH+DrTFAafgWmiWt/jAGf2r/EuSEf/Byx70uaTowd3f58+z3GjzIgPaQ5PXg0s
	2GoXUsK3Pc6jQ7TWg6RzygHToC6hyZFhe3eYqAeO75H2PUT3QNx7/V3Tua6fPp9vsPjwPZJleFZ
	3ua2sDyZ/OqX9jtJPP1Gn1f1dDLCPEOeivoqNuqrPm6nEhmF7bHOPzvUm+LyDzW/rEaAazA50nk
	pFVu9Nun81M8p70DgTc7AUANV/1u6mOvbDgiWl159iSInLWNwrM1M64xcI6+bR6hIDzkUQxl5kT
	sQO7nFFGNHT5sMOBfe4vB8gsmXma7RjDA79zzUlyHfeEAsg==
X-Google-Smtp-Source: AGHT+IFRRQprGctsWjxIcoYiERBSCkiDJjPIQgHPFoQ7njkErB/EehrgqZCHbNGGmrH05GKCN2vurQ==
X-Received: by 2002:a17:906:eecc:b0:b2e:9926:3919 with SMTP id a640c23a62f3a-b50aa3937efmr1164484666b.22.1760095217243;
        Fri, 10 Oct 2025 04:20:17 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b71503sm2043062a12.27.2025.10.10.04.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:20:15 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id DBC495FA60;
	Fri, 10 Oct 2025 12:20:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 06/10] specvars.tex: properly wrap arguments to \urldef
Date: Fri, 10 Oct 2025 12:20:06 +0100
Message-ID: <20251010112010.3880438-7-alex.bennee@linaro.org>
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

While the space in this case is probably harmless we should be using
non-ambiguous argument wrappers if don't want to drown linter output
with noise.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-ID: <20251008145916.2626143-6-alex.bennee@linaro.org>
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

