Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067362ED141
	for <virtio-comment@lists.linux.dev>; Wed,  8 Oct 2025 14:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759935565; cv=none; b=I6kbm4eP6N+iD103DEF694M3GHi0YSEQWN1ENnfig2F5JSXLVCiOLtWVrOHc71A5DnmqoIOJhOXwsukRslH/xN4Sz9WWpjcjm96D/FeM6rHCuf06kn2r4avHiLjl2dUVlQOlhzG1ctO/SYDi+laKcNZtBzF9y/SJUM1hF6wkyGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759935565; c=relaxed/simple;
	bh=bqPf3jb67rvWZIQC6EPEHw09xi4ZBFXCcOQpR/nqXrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FbeKrHxigbB3ZdioB/dUKqm8XB67E/yl6JoqZj68/IjR8e8/cTCCDi/2e9wwzmK0Exw72Agq+yjd9F0e3M2oKtAMLzroiKX1mm7RxG75PFRa12DikR5sC5aL5rIPgqj3Y2kwbCHuA4mW6Q1sSb7ZbYSkR4uCHbDCrwmMZo1at6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f2XMsiSo; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f2XMsiSo"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42420c7de22so10224f8f.1
        for <virtio-comment@lists.linux.dev>; Wed, 08 Oct 2025 07:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759935562; x=1760540362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2k7e9gv/b6hFvP05blOwQ3zgGcrMeKiE4cNSWQrSZQ=;
        b=f2XMsiSoG1K1esPPzsDtczeugMOw3vhoejkU7172D+oSLpS+odRkbHwKebR3txDS98
         RwY9QsVikJpZ/IEvF27E8YBDmGuNkEqHp6s/9HxdNRYAZ1Q9qZfk482P2DPBgWfgvXUT
         ke8Oie9Kefb4T08kTpJ00GoYtDI5DIlyabpQlY0ttg0lLL9gddW/wMGpx6fHRxA0XfjK
         5n5LJZRrSYyL9nlweTz3vwvg29CZWd0NBbrmXufa8sJHppSZlQ9OIhSP1V54IPO174rb
         ThQwjLz/1Hr/mnMYl2SEoJpFFDlvz9c2OBBV3NnnB35iryGBrGuyQwT9I9GChT3ZVhGE
         0wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759935562; x=1760540362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2k7e9gv/b6hFvP05blOwQ3zgGcrMeKiE4cNSWQrSZQ=;
        b=WoEau602fi10s/hNjDCC24KqXNV97cpAaL0yhsFP/FhMdF84jPRggKWq63zpCRasQ1
         01Vy+UlDw48tk3GLarNcZVwcrAxYdJNvDIkHJ5PNVuM6TQB3VjN8rsaiNHrrrIbaJFkM
         bnyXtdFBpOsEFtaAbD+t0GlvAX4nzb1GW87VOhInflnOeDSummBwVDQsXqniQusDSRpn
         lqKHjWjMcIq9VlH59gJ4I6/wQaJWJJn1wDVnEN1oBz05/ABVcPhfTN11fRW3zxFNjT85
         NfwHsQ7foo+NtjqbUYouRshHQQS5NbZeyzhaNx1HD9aHJQuecHGLNHzamrOtt61ek0FC
         GIAw==
X-Gm-Message-State: AOJu0Yzw71TqKxSz/bR1IGO5xqlEmJ650Krdli+rPsnfH//CFzabaZ19
	+CMbOaS0amwwS2Q6cEnWQ/iIj5GhvfeGULN5U53PwjIWfle6PRbVcZEZvGPuiijAFdpMxvsEw5+
	tXh3/
X-Gm-Gg: ASbGncvcV3sYgcydJs6gEvOyhqvEntW0/N68uos4gl9U1MFAUVvUNC5O74Bdvv6U/et
	cr/IpDLb8IlpeuzWvU1z8oD8x8wmfzZgCWcs6hYYV7uxevwBIZ02FkZV9XYyOF94h4ZzXSierkL
	UlKt0XIDZOOlouuEdqXMJv+dZj1kF7tpPZKnKFHeBFpsRCZcMZHI22ZdZv/E3n0MqsnlMl3huEw
	BU0h9GD1mCfJrVYq24YbrIWEdrbasqukMhlo2wcEPfBAhXRsXD5+9wlcfF8DiMlrFdlu7X2Da7Y
	bKuU+m32bsjnwSFHW7xFTI1p+zJ+cek4QZ4IWzyrjF1n2MJGBh4e20eGcCCitma21o7VEWGe9VY
	k5Tm+3sxhVVw1fe1QFmfWrJ3Yd2Z2CIZnTE5ZgJUdR7318VQ4sps=
X-Google-Smtp-Source: AGHT+IFWnPPkmU37gcw58K2Bh7jdqZCi0/wIyajIJZqUd85IyGFZgoNazpIaNI6C55T+2hjghsg+0Q==
X-Received: by 2002:a05:6000:2c0d:b0:3e9:9282:cfdf with SMTP id ffacd0b85a97d-4266e8d777bmr2443641f8f.41.1759935562204;
        Wed, 08 Oct 2025 07:59:22 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46faf10563dsm3374855e9.3.2025.10.08.07.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:59:18 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3FC305FA2E;
	Wed, 08 Oct 2025 15:59:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 4/9] virtio-html.tex: sort package list
Date: Wed,  8 Oct 2025 15:59:11 +0100
Message-ID: <20251008145916.2626143-5-alex.bennee@linaro.org>
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

This will make auditing and adding new packages easier.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 virtio-html.tex | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/virtio-html.tex b/virtio-html.tex
index 48c633d..a43017a 100644
--- a/virtio-html.tex
+++ b/virtio-html.tex
@@ -5,34 +5,34 @@
 
 \documentclass[10pt,titlepage]{report}
 
-\usepackage{parskip}
-\usepackage{setspace}
+\usepackage[T1]{fontenc}
 \usepackage[english]{babel}
 \usepackage{ae,aecompl} 
-\usepackage[T1]{fontenc}
-\usepackage{graphicx}
+\usepackage{array}
+\usepackage{chngcntr}
+\usepackage{courier}
+\usepackage{enumitem}
+\usepackage{fancyhdr}
+\usepackage{fancyvrb}
 \usepackage{framed}
+\usepackage{graphicx}
 \usepackage{hyperref}
+\usepackage{lastpage}
 \usepackage{lineno} 
 \usepackage{listings}
-\usepackage{courier}
-\usepackage{fancyvrb}
-\usepackage{array}
 \usepackage{longtable}
+\usepackage{mdwlist}
 \usepackage{multirow}
+\usepackage{parskip}
 \usepackage{rotating}
-\usepackage{fancyhdr}
-\usepackage{lastpage}
-\usepackage{xcolor}
+\usepackage{setspace}
+\usepackage{tabularx}
 \usepackage{titlesec}
-\usepackage{mdwlist}
+\usepackage{underscore}
 \usepackage{url}
+\usepackage{xcolor}
 \usepackage{xifthen}
-\usepackage{tabularx}
-\usepackage{underscore}
 \usepackage{xstring}
-\usepackage{enumitem}
-\usepackage{chngcntr}
 \counterwithout{footnote}{chapter}
 
 \usepackage[utf8x]{inputenc}
-- 
2.47.3

