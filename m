Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722401;
	b=sCH5+IcsL7iAvtt9sQ19dqvvgePNQZmpulWlJxRDdxPstSgfUek3m9DGl4eB2GzjlW8A
	 zSq3IELqEfO1jWEJ6QrE3v148CIYIYJsRBZ9HMXY/S1L2csbqqiR/XIpy/ILMIOnOK9h0
	 8p7QgmaoOUy5Bg6+9Gt4boyavlZAOzzY5HSXsTFQng9dPEOwnTTBJ0eQN73q+HbSB0087
	 UMv3PrDsF4YKxc4oV1RjCH14ZwoqzGvd7N7pXvJNWpovwtF3aRQ047RZ+Ao9NQivR5UVm
	 zZy/aXo/lRCR3Y3QRBll6LO6F7uxU5ngX5g8IszgYmB0agS0ZRKvTgvYwwm9UbtWCbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=oj39b6HuKYI8tzAv32OkffYouO7PSOOIwngkUOsw9PY=;
	b=N5eBKsCJU4JzKVJhaCB7pdgtN+c4lLbm++aDyqioFj0cKFOgWrlHndwyL2p184C2VQsn
	 HDY41mT0c0RDXO/ykTYs9bt4aMYngt3gORiYUEqBYFwk+yQYCHzPjUgfQL5VPEoaKLEFT
	 cNajU5MYsmHhz4xGzUvVYj9IC/SJGZMgh1FPbGI3WHuN73qY1nTNCopOliX5qSBQl9c1D
	 hROWZ/WFJXUuASE31FH57i1FoxTlKcBkKib7biMiz0O0iSJbS4lOu1soO6cqhl5RQMve0
	 5+dIrvVtyMwXUUz1ugDuFrVm4jcberA6sdWVbUm3CqRlkIgTJikPL39Ree60pTJ+s2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XxrD9WT5;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0AA606A32C
	for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 19:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF0AA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XxrD9WT5
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso20903625e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 11:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795722399; x=1796327199; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oj39b6HuKYI8tzAv32OkffYouO7PSOOIwngkUOsw9PY=;
        b=XxrD9WT5HXF4ALE6nfyf6aDLZZ7MghiZnRe+G95UCBSN+EpFJELvSgxJdr9S/SZIZ4
         n/rAGYDgBgd36pfUHfDdVVcFb1Obe99/R0EeQi6ZOLj0ouVZvSxMP54/JwEp2KY2tBxr
         7zKodYIrT9nsGku/kOx6E/DwZBz3VF8/5yVBTD9hye5CVxhDT5eY/oGhpGcRacSOrclk
         cIJqJMqrGs1m5SjDQj0zs52+SU6uKWHoj54Oj7RflSWJEvwb2bJibAGPCA/yXwLEYqSn
         EB+EeTdmZeBi6J4yC5K2e8uyI780rPCc+cJKsTOv1OKr1h3v/+/rAtVFOa9ByoX3K6bw
         8LzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722399; x=1796327199;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oj39b6HuKYI8tzAv32OkffYouO7PSOOIwngkUOsw9PY=;
        b=co6j/XFTIseAx6yNKe96ETLLNakqBCgyKXpcS6LrTwcPYII0Hgkl07IXiwoCRg3EfQ
         OfaHuRZol3Y/HXGPrvj+McipqEgu8OiPoAIKfpprXwqFik0uqmw9sZYXaCS+WYMg5VJO
         ltu+yZlpqDm/P4m2xmRv7jfbg2F2Gvzomsn+JK27rHwTOTy6/7B3ZIfTzLI9+Lqfo5Vl
         2uPxbCmdAAsXcfdDjEjwCCKtQsDMpiFT896kHNluDi8hpKZiRNgH376F/iGIJqYV9BLS
         xp7BF+DO17x45rNqrRUKsR1fqsiMCs1vKGU5D9voo4Y6hU+yF73wwGe/EQ8KISTf4mne
         M4aQ==
X-Gm-Message-State: APuU4Z8S2qDjGyEdJ0Yf69UG6vUu9Na+jAMUnFRQmqcA2a42Oqgc00T2
	JgBKfuY/dvKm4fIwwA0wSTK3jh6Uqb6Wd2kI9onQuhOQIAB2PYsd1U5A9+Vi5sNwSV4=
X-Gm-Gg: AZFdTZceZ1XMh96wpxNOVAu/YysnqI3yInDDKzDLPsUj3+zj12w6PiOQsBqoQR1OFpW
	CqxQArvCtk68YGtammSVIrx2GI5MpTDJzS1I2uSCpkrjmUASTi6NSii3xSOTu8RWHwAWl72xzzR
	LMhfqBKSLxaZi9KhJWEyRPbCsm9nDQgHwrzmIMw5qOJihAsMLqR9s+Vz+ACs+Pf9GLwC9NahY4I
	BELbyoQUQ+7brL+bSQumAD1c4sW4LcdYWqfgA22Qk/+j7DkXrCeCA8jS8Fszw18Qpy+3RvMT5lV
	ceT06YkoWPa0CACgUeWMt+VqpoFi+Sij3+CwipVqDdhMFZvlCn9idV/+lcsGbjV2Iu03NgTnN4v
	WpdJR8AtM8R0leIYIILD+1xgqSrA1pjaFIgyk3g9kJCe24oM+6g2dUJD+rNr3hkjulWvz+iXyiE
	X6rjplgEeLNIAcjextwDUfbXGL/AGTl/Pi73/qfFi3wd9rmpiha39dCyFdlYt3ECe+IruxUuvc9
	Sva5UOmm2eD6qzTjInAT6wMtmGWt2nbpA4e2OuKBsdUii4eehzxPU2jIIFn79RTe052bpoKWwbi
	772xE46N8R1/EqUliGPshVNe/Guk
X-Received: by 2002:a05:600c:6749:b0:4bb:5f95:c014 with SMTP id 5b1f17b1804b1-4bb8880f283mr450155355e9.19.1795722399030;
        Thu, 26 Nov 2026 11:46:39 -0800 (PST)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b33a596f9csm19436791f8f.12.2026.11.26.11.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:46:37 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B27E95FA55;
	Thu, 26 Nov 2026 19:46:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Parav Pandit <parav@nvidia.com>
Subject: [PATCH v4 05/12] virtio-html.tex: sort package list
Date: Thu, 26 Nov 2026 19:46:25 +0000
Message-ID: <20261126194632.2429425-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126194632.2429425-1-alex.bennee@linaro.org>
References: <20261126194632.2429425-1-alex.bennee@linaro.org>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This will make auditing and adding new packages easier.

Reviewed-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 virtio-html.tex | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/virtio-html.tex b/virtio-html.tex
index f746919..6107f49 100644
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

