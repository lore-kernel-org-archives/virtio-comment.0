Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EB2262FFC
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 11:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095223; cv=none; b=PaCoVf/3TrqukVdNg7LE0qdh9ibkRIm+T88GcBPMMHSovmKr/rFwHvXt7h67GAsoqViZGJT0gbiIj58cXNQJvxJbjHntNAImkDeORLIDB5bpQniWxcC0UjB40wa1YawtsafYDN0fcNcz7PPBtBsuzO6PHyFVhefb6cNnDCTQFC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095223; c=relaxed/simple;
	bh=vmskyK3tTRhtSBTKCizS2v5DuNCpW6m+DaMmrt76EFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KGfm2Z90idAJPhIMMV2K2oNJSGtgkpadB8fYRQvbfWlltkyoX2GKBhKz3BEvCgmBoIcnXIsDa6+LHS6831rOVjegZRb1JN+FTg9DWMopFeOTILHHjU7PcqTvXUi33MPZBPZzka2S2C4Ph7D+W4nOTJY47f+x8NP2s2NRox7q5ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aGD9gZVw; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aGD9gZVw"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3ee18913c0so305573866b.3
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 04:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760095220; x=1760700020; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jB8GfsSEXecO3YpDXpkHSjy0Tk3eJ9OZRIPeCbOJQqA=;
        b=aGD9gZVwuiQfmCcL4M2Z8pQoUGS6np97TtrokG9rozsbSmexOMkcZkWgXkhz9JYleu
         kmx/q4tLMM5gtGEQE2f0QR/ntA0E5BME8uIQ9d05uX8vt2KQkAuEXzQBKpOi8AXuxfpQ
         09Pncf4s6+fZpTo/XWPRZa71SKDKR2KZoYfBRHOEnrrwItUyIf2QRawd+ouUpR4uUGQP
         ipYahEATmbd363jguZ72lOaJtd/5HrzlpsRYJqJAVnDVK5fbPqF0LYJ7EMibNuOIF5y+
         fZgX6mbOq3BeuD8IA0lyaPLarKDp4zRvHPLHr91F9LicTIcxvu/CGtD+TeVtbYCf1NnE
         4edA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760095220; x=1760700020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jB8GfsSEXecO3YpDXpkHSjy0Tk3eJ9OZRIPeCbOJQqA=;
        b=M+sEk4St9Bcp10serzoirF5ekzMpGP2GSgfnnbaEPaU6O7I6Nfr9QlVNToZ3lLlX4u
         HES1Xo3IOPtQrHXK8ZzMJ9tQzUlBMrs02D6E3oPb3J/jwDTgSeLUZHLWxTqRbcOiSfal
         uNbTs2C6ARb3oee2RtCuRdRWpDpqZYZYNzkCreSdo9JRBfXuyyP49AgfVTOrYK9poKR5
         xqW5jidNrUIK5T7lcmU63/QkiQIfUZTOpQ8kb8UGFYjrXmjS8roDnOufT9MVPsdgiogj
         /6j8baEdtL6y5xY36tyz34LlcVbb27CVxOSLRw5dxODhk5c6xq0Uz7HUgyNnNkPyzyZl
         IjuA==
X-Gm-Message-State: AOJu0Yz1dgT7CoEbu2xI4pJw5AtpETJTSzH5CTXXofzHU+SZjnltJ0Lc
	WlS87bbM8Ecku5QdLlmpE1tns9S2/wftolvvQlanZgfXvHoHtdEQdBhkg+wFAZNnL68EwgIMZtj
	HUfj5
X-Gm-Gg: ASbGncuttwlUOYLc0hE1sBYUl7vrXy47uZ4pdsB9WFlVTjZfzacLz885hhhqmfN8RA4
	EQ2w7yMNCxprvSjU6ewW3vKFn9wBk38Sc3xVGPKy8tzbXSi6es31ckj4gfFBs5DABZayUxZ+ff6
	+o0TR2aVMtgT7iQYbTDbqKhPSiyPrVRAfKayXjSOZN5tqgEST1b3ERmUn/IqFqKyMiBGA0bXQvK
	H9X/L5utlqmaPNsgiDk8koUBs4ZUHk7w2kfLrbR3c3rKoGMLCeXaq6vUzc3Wa6Bl/AnI9VWtDbR
	myuHc1QqNtbP1F6MNi7V9rCmOw7dd3kgMFGgsPUO3+WDA0/DY6Tp5DaYOzO7nrBGKVkmWIRXF7V
	dWpqKgDsFh4Qn9zj4HN8RfsSDF7/hHCYODjv7DxUi7oP+bXanP8b1ykCU
X-Google-Smtp-Source: AGHT+IFpkyZ5Yr9mZYPd0HCXj3teF9ELG6Jqy2aapJlyktH02SjKzwJQ3ogSfOcFq3Q0DJGB0iH/Nw==
X-Received: by 2002:a17:907:3e22:b0:b3e:b226:5bad with SMTP id a640c23a62f3a-b50a9a6d8a3mr1266462166b.8.1760095219553;
        Fri, 10 Oct 2025 04:20:19 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d9525bdesm208612566b.78.2025.10.10.04.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:20:15 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E8C955FA6C;
	Fri, 10 Oct 2025 12:20:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 07/10] virtio-html.cfg: implement workaround for htlatex regression
Date: Fri, 10 Oct 2025 12:20:07 +0100
Message-ID: <20251010112010.3880438-8-alex.bennee@linaro.org>
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

A regression in htlatex broke the building of html in new Debian
Trixie systems. The bug has been reported upstream:

  https://tug.org/pipermail/tex4ht/2025q4/003774.html

and the following change is a suggested workaround until the eventual
fix is reaches the texlive (and by implication distro) repos:

  https://svn.gnu.org.ua/viewvc/tex4ht/trunk/lit/tex4ht-html4.tex?r1=1750&r2=1749&pathrev=1750

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-ID: <20251008145916.2626143-7-alex.bennee@linaro.org>
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

