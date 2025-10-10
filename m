Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06372FC019
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 16:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760113748; cv=none; b=a3p3AuQNIrJNbEHmPG3PXUqtxRZoxG2cOTDZCBZCtyibnHyX1ryD5FyRXdky4LBKnflyl2KrOyWwOREdOAXak/xwh9O4n+4MhZlsnnRf+wdH3rcxyof7ZGE3H+z1OXtjsXPYai90UAjJlquT0xHvuHe6ctIA+nd/EFf5F+vc8rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760113748; c=relaxed/simple;
	bh=TpFlgAdRvgEX+LyMhk1250uk9kCGTLmNrDTqp7tDtdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gDvX+kv0Q9DN+o52ZsZqJfzgZNgbOSoRFpUP5t9Gc7SeROY4fjD6othR9cDbI044CAh0wpiDa9Fyw3Y1sTk6BMOENxWGuIkAnH2iib3/+EGFDoVq2GI0Dvhh8Ej4dGavY0R39Tsb9rR0iTw2cR0oxlFb23Z66G1eAbF9fKAhMk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cG4XhpUd; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cG4XhpUd"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-62fc28843ecso3308938a12.1
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 09:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760113745; x=1760718545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czxI3niA3ZgVUKsT/+qXK9QPwwIaEdlCouIwWwcWtog=;
        b=cG4XhpUda/8h2uaOEVs9biCdeppLFlX0uuQ6ltU8LNncB0TOlRN1qJ+YBY1j3mwGqu
         figEof4Hb0eKcTjb3qFL2MeSUdnUXNHBe3G/gHzR9SYYq4yhgb/31uA/rGnP/l+75CwD
         AsUJg2BNMLXJXeeKIUOsmLKV9UeoPopovT3hkZ2wzhExoB4VRqlyUpOCVVHTFrERTBXn
         gyVgCh6n5sj7kwlVvkm682iwWoaJldokqyLxRgQyZGyfavDIbWtYxirzHTmwDWjyYeHL
         7FsqN4dqGRvMHCR7nAfWm5UiFKzzyIbPOfCm5+eYxZTjzzmFGrcFcyE9LZc2Oa10G5Oh
         U8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760113745; x=1760718545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czxI3niA3ZgVUKsT/+qXK9QPwwIaEdlCouIwWwcWtog=;
        b=V3OGrhJeJDqlwLBTTh4QpHOOWFfiPKi/uGbsSlxEkaSfUdN6XyzpPxMpQgudpP37w5
         7brtvg7ElfidzohUxKhsk6fxsn/7nDttqQcB8akV4vQ0+OiuCupI2BwmksfFup5u2cSk
         7qRm8lZiSIR3Mvcxu7ihytnYEbxr8E47aNf0G1SK/Gv5DEsn5+LubTELwUAcDF2v0XuC
         VE9j42NuBstnGs5y9HaJ0PHvbDowso3a2ZlmYBhIab4decMzHFnD0Vory+++AubQi/zN
         HLRPszF0+IzQRqsTGde5k4u2cMNCkA3hCHWxrS3AGT6wI3CGVnKKn5+Pm87EKPpCRoGj
         Npbw==
X-Gm-Message-State: AOJu0YxgsdYPwKcfjUZkqbHou9Sd8nLnp7BscskbgeVTpeAYbMQbzyNl
	Y9YvIRy796z6nnaKq39T9/UUdik2toTreyuh+iIZ5KujDNzQ8b32z1SbF9rCaH9zzpo=
X-Gm-Gg: ASbGnctxu8sM9js7tskXQdPpUams6NRkKlJ0vZS+3YlVfG86El6TndDGsue9MXRq+fv
	qDkenkixmPHt0IySXk/rB/K2FMLrKS+96X1QpNI+VzFJVGL9s6v/pcAYdmLwAKwFS0ukPZ/ueYk
	BILTypIZyHPTbJsCrVinsDTXTsgk4yCDU9fqnmF1LkWBgOUfwGLTuZi4jBevjZctxnSe+b/tumQ
	IcIji45go3JkvkcEoXiK/fuulruf38aT3+7qCY9WFLZH1/wvxtr38PPIHIy4zPPRy44FG5KXmHM
	Rj4VdlLQOtAUe7tcBdhSjYiHftHi3AvZlU2W0El41iFHtvcNzttuMxntoDunJpOLfTYJeRHP3c4
	Q5uglZVyoEJuuijyRyGy+wMCHaXPrXQH9BPlAhKjlY4YPuoDgAIsbD1DK
X-Google-Smtp-Source: AGHT+IFEAUlwPq2kv68Cc6Vqgjz++SXaSUVgAYOMvbiW8QlhbJNK0N+jIHBckZwX1HHYzCxdmwBu/A==
X-Received: by 2002:a05:6402:26c9:b0:639:dab5:d605 with SMTP id 4fb4d7f45d1cf-639dab5db04mr11930415a12.27.1760113745087;
        Fri, 10 Oct 2025 09:29:05 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b71361sm2994172a12.28.2025.10.10.09.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 09:29:03 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B8BE95FA60;
	Fri, 10 Oct 2025 17:28:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Parav Pandit <parav@nvidia.com>
Subject: [PATCH v3 06/11] virtio-html.tex: sort package list
Date: Fri, 10 Oct 2025 17:28:53 +0100
Message-ID: <20251010162858.4107388-7-alex.bennee@linaro.org>
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

This will make auditing and adding new packages easier.

Reviewed-by: Parav Pandit <parav@nvidia.com>
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

