Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821602FC00F
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760113751; cv=none; b=Mvrm8ZNVWQbFw+NoliP+df8EjUp7omaia/bsAWjpoBXsrYVUVvzkEFmhrvRbgXsVp+WuAcQiwW30yJ0RDvaYGhvkT4QK1eO1b3uP+ZhcdFxEQJI8FKkigdUQzwM9jUNdlzjmxdlVwchcu+TZZQfGWNAHGy7naOqW0p3ClvZZCQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760113751; c=relaxed/simple;
	bh=Q317QFbw/7v881OiQZhclCCSwkysEUZGP0RLNC9Tj84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F8q+2Warn3MFdrKk3lkhSzOKc3EWoMkJUu/Z+MLNOVeUGD6rEO1DCFu98Zafl77KOCWqLC4jYQKjws12XZkY3nAikA3NGExvzQnLG1QfL+uDzHkjAoqCsbLN2eUAopYnKwoE0aChHdnWgKSfzwX18jRs+YkP7SUzusltELX/83E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WqinxEvB; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WqinxEvB"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b4539dddd99so462362566b.1
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 09:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760113748; x=1760718548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mdimeyVK+niEb2MnCDciM9iG8JsqXibgXmc2U/JQDU=;
        b=WqinxEvBY6LNzs3zyn6dlTbYX8VJbwQT5EHY1CI8u1ZY0tfCXmT943/Ct+B2R6KAHv
         g/VC6r8Wnya5IF6F/4vO4HRX7ZGRYwFtFRQWpZbW3ZpCZpa8Yi2WcEs3/FvvXwZlMifm
         FEUqsI363eH++E9lHn9GqrKRfnq60V1UL1BIFL4hUoMS+emNdJp0BwIZeci23ZpO+QU9
         hWgyUC5OhbTBp4iNLjrKzICyyOAS4rkFppFX07wi7mz1gqu+hS2nme8JVuUgzrRmDj+Y
         DnO9RGYnD+xdVAi3nzhY9yqhCLS3T80WaqHbIzx46OORFIHAiEbNRncKk51EbVykkwxz
         l41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760113748; x=1760718548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mdimeyVK+niEb2MnCDciM9iG8JsqXibgXmc2U/JQDU=;
        b=CVmYXhRlEESh4Rv/YPfQu81gkOTPEPeqYcOfxCRSGQwmtR22d+Wq/8DVX6uFD6XXZg
         KpXhDT5+lKSTPCjWv2AwqwGFg2Z94qXJXuknXVG8DuY3AtC5wqg/ufdjPzESEGbi0pCC
         ffr4W0prAqw4u8CQc8Rmobgb/1MD58Z31klR1tbjQ/MrTuaQOhSgVN0lcen/j6lCA4LW
         0+2w9svaP/1yQwSAxtST1jM3HpYBqK3WqRLWKi1Tlp/vw6OgY06B62QoBPLzT8rLvEsT
         GT+NXl72YC1gIPqmrIjJrknwzadFbn/8doTPCz1UV1Sw6tPn0sBcxm4kAhth+xHmjmNK
         gGeA==
X-Gm-Message-State: AOJu0Ywgmato7aIhKSMqb7dlIarI6UM9icjpF8+dHrb8znI4UswcJ7qy
	mLdqtKXbjTwVXwixMPfWc1nQifbc4RxXGWdGPMee/90V7PKwQ5OpV9Xk1a4KsYy2Ax+GbLt6IP6
	TZNN8
X-Gm-Gg: ASbGncv3faobh5mpPvJvrYd6t6s6KOwe7tUEk+lkuvgCqRzASd+IG+siLVXBUVnGqv4
	NE7YaaxThZgccIArxHP/B1ynnvIvoEF6QXwz4r6VNOei0xWyE0DBQzQ6PvHha5oChxmOxwo+Nsj
	087odALDiO9ndM/BmfCfTBkf14vmBriFOtEjUuaYed/bQ9iAX6oCMX1LyVNJR0RMWpb6/PAstMF
	r+YmOl46q5lpAMI4Yvt92kb9aQlI4+jOm/qKfmobsQ/RyG8yOywshtiH6+y/cdGqm9VhCCRqx1A
	poeZIHvp+jTHyxuU5/zEnOPGa4KfrGF/t3hwsv4xPIPGzmnsgyKURtqkJn4stPx8PXpLq+EPXua
	HFdxRtewglUgSY70wfhYk828cdHAlM9d3rz1zuUwM0tLfBg==
X-Google-Smtp-Source: AGHT+IGsp0TWFSxbOLVtZz/xvRC11/FXSUDLiwDsj8Kh9a7thHqVenoCdqkj1rBBEzUSN7KbB5YDrw==
X-Received: by 2002:a17:907:961b:b0:b3a:ecc1:7769 with SMTP id a640c23a62f3a-b50ac0cb195mr1270105866b.52.1760113747704;
        Fri, 10 Oct 2025 09:29:07 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cacbeesm256381966b.15.2025.10.10.09.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 09:29:03 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D2EE55FA6F;
	Fri, 10 Oct 2025 17:28:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 08/11] virtio-html.cfg: implement workaround for htlatex regression
Date: Fri, 10 Oct 2025 17:28:55 +0100
Message-ID: <20251010162858.4107388-9-alex.bennee@linaro.org>
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

A regression in htlatex broke the building of html in new Debian
Trixie systems. The bug has been reported upstream:

  https://tug.org/pipermail/tex4ht/2025q4/003774.html

and the following change is a suggested workaround until the eventual
fix is reaches the texlive (and by implication distro) repos:

  https://svn.gnu.org.ua/viewvc/tex4ht/trunk/lit/tex4ht-html4.tex?r1=1750&r2=1749&pathrev=1750

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 virtio-html.cfg | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/virtio-html.cfg b/virtio-html.cfg
index c5b9a94..63bf9af 100644
--- a/virtio-html.cfg
+++ b/virtio-html.cfg
@@ -1,4 +1,5 @@
-\Preamble{html} 
+\Preamble{html}
+\expandafter\providecommand\csname hline:color\endcsname{000}
 \begin{document}
 	\ConfigureMark{chapter}{\HCode{<hr><span class="titlemark">}\thechapter\HCode{</span>}}
 	\ConfigureMark{paragraph}{\HCode{<span class="titlemark">}\theparagraph\HCode{</span>}}
-- 
2.47.3

