Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BB52ECD32
	for <virtio-comment@lists.linux.dev>; Wed,  8 Oct 2025 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759935568; cv=none; b=Jxv5Xnip2OPtExVxe6L9sbg28ryuPaNbbjXEwGhBTku7TgzTfNjcm+xn1HDrer2yxRAv5zObMgGPMTNAMxqqVwRP5f0yjilobtcW9zDMOPquYsWm/VWnBON9vLVdXTfM2zzzDdcHr5+uBpcPqN6eDtap+332kyL+brORRsm8+tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759935568; c=relaxed/simple;
	bh=WbYdv/Zgzi17lHuyrogPMpmhXF/V1uaa3Ottd9c9JqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lrwawxl+e7bZXXTKNB567HOn1NLn0Kt1S8nXeXpj7liZvI3g4prtn+UA0jy0znpYH0Mkhw9y++X6pz0dezxQsDnQ81tMcG9kbEWY210wKyvv70FNkBj41YgQfZq+SVXwg1RV+8pcoI6vTQC7AQrACYCrm/iScLh+dJB3fxY0vDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kh30wEPx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kh30wEPx"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e61ebddd6so71408965e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 08 Oct 2025 07:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759935564; x=1760540364; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uu+NLu4nuI8DO713rjM5sOnbJKMoA6tbUBAz142uQXE=;
        b=Kh30wEPxP30T8vMkgT2OMvBOSQtMOoRgbeMfMR307KiIwRP4FoEMNHWzg4315w74QG
         FX+Wcm7dxUFzTbPznW0Ac3u5iwzIH0S5x8ztn9eEqga4E3Y1YFlGQG1gy6uuoXRGBfAq
         3qMhSIszyl7gucuYDSzhsY8QK7lDIS7MdlTVdOuShTHfFVDy5ii7gs5y2177UfaBTQVX
         HkJz9OzdpsUyGBsKf6lYAeYrsz/bj0OUAzAehTQcUArFk2/ea7nkLYhtOcUZPTzpnG1b
         BnlR0EWqxMO8n4hCprfqM47gQKFOsw9e6Ij87pFVVVnlO9aacsoM49qVk4TEuRoJu50m
         ofWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759935564; x=1760540364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uu+NLu4nuI8DO713rjM5sOnbJKMoA6tbUBAz142uQXE=;
        b=U3HfsB5VNxXYIuZb09GJg3bznV6QIOse1XEs0BBoBMTbtELpZnDLmF6Yvev1/G7Eg1
         /7po5RjO/J1vop4uWHgm3m6mghxYACH4igebL4L06u0rBYDlv9mHcy2oqmB+X4k92p4f
         na6qn8znZnLBrPcWdYUQb8IpP2BofSEMkbtdknXcDgrf94zFq0I+gLqzG0ojaabAMrqp
         u1Jf02JtbW6ul2X4El9+9oWu1zaQSwaENFKQeKx03NRGS+5f5+TTLV/OSniRDC5v4cw1
         8BPO2DbpbSKGTcb/6ObN5vbq7YG2CBUbkXvBlGTZ+zc5ue9iMTNaPi/WVXKabvdUEwjs
         O8qw==
X-Gm-Message-State: AOJu0Yz1GyUmOtqcGhQ962ZqZnj/6i0ehx8LhgappewHjThtuWGzPZNv
	NIJ7wcuX6FeiPzYfHwI7PAZRlbd+wwqFOJEL3xsv7U7wpTAs1GujWtWo87gWZZI19Y+9BE+w0qR
	MWf8D
X-Gm-Gg: ASbGncu7ShjY1W/JhXXbR6iFEqn4pZuu2MsiRsCihDAyK1blH7OlAhJc4HTIPOi0adn
	/v4vJfELtb/7QnAr2LX/igQpjEWIZ3Exi5yLfsUzIv1gwLMVUfURiIPE1rckQ4ep6riZV+Ip31y
	j9Y04mE7VeTlfNEcWNz4JkY2vwTEL+gEactEUsxG7qcJsrTRo6Q5jnB9mdob8VN4EnCfVLsSSDk
	WU8Ty5wL25tJ+1LjJ+sdtkYf9qOXX+30K3UYx3vBCwqETGxPc/PJBClrCTSGinYQVovrimDFWi0
	B4bQG+plM56WgnIvHr25KrGi4+L8Dh11zfOlgkAUSabJ2VW8hukW4/qmWeAnq3nn8uvqrI5jFJs
	OSRFCrUhMKSquwbU5rIRmTKo+2jxoVFE1mqEoFh7AMX49Fog1TDI=
X-Google-Smtp-Source: AGHT+IELVHOBp3o3vr1npA347HnuvRfcHkr9VH2zFcQx1RnF2ppSzsmu1GxAo6AiVsUp3ClCfX2gUw==
X-Received: by 2002:a05:6000:22c2:b0:3ec:e285:546b with SMTP id ffacd0b85a97d-4266e8dd0bcmr2264699f8f.50.1759935564450;
        Wed, 08 Oct 2025 07:59:24 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6b5csm30506615f8f.5.2025.10.08.07.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:59:22 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 4C90C5FA42;
	Wed, 08 Oct 2025 15:59:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 5/9] specvars.tex: properly wrap arguments to \urldef
Date: Wed,  8 Oct 2025 15:59:12 +0100
Message-ID: <20251008145916.2626143-6-alex.bennee@linaro.org>
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

While the space in this case is probably harmless we should be using
non-ambiguous argument wrappers if don't want to drown linter output
with noise.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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

