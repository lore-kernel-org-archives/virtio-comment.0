Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AFA22334
	for <virtio-comment@lists.linux.dev>; Sun, 15 Sep 2024 07:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726387003; cv=none; b=FVtPQLQIzlDOu3+Ya3nfC8qY3EeoIipzCQXy32bzCaEvlom3t6aCXmBF61HfMHw/7QKOi72QLLwiKAAH2NAh0VcIwgnzqtg40ndFNKdzZQw2lZlqPMoSeW4FQmVA7V58Terstq8PCUxWYDiG9N0InTRV8FYsQfiE1flgcga5OWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726387003; c=relaxed/simple;
	bh=Vwlht2Sxjz2V6/OKJF/he75Kjej2l3yWX14rsgI86ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fmE9XNgkvljp3KTtW/JQ18CHA2A6GlOZZXgF7P+ALZjzi/ziTMEGEuqjANg8gd5Y+1CD5qAvtchMLRlRV9KVDlJFW8Uzs5H/uAl7ay+ERORZjAcvloyHhAiLkqinqCSvtqdlJw51I+27MP/wdqlidjV0Err/9EmOIXDgPabCMl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=soz7oAaJ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="soz7oAaJ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c3d209db94so4208621a12.3
        for <virtio-comment@lists.linux.dev>; Sun, 15 Sep 2024 00:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726386999; x=1726991799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhFzitJb0umtZWqp49PJUAXNbGfr3W0t6L39uwVPg1E=;
        b=soz7oAaJtTeqYTg7ojjp6PhotZUZjiWsqQfb+j1t+UZabyhj4BS0qEiKX8AMGx/JZW
         N8tDAaxyiivTDmKb2+axe8lojdPNZHDyMhL+DPK5m7Fu7cV6W6peaZstMbFEdqLA79B8
         ELHo1kH4ygtejXfQ4iFy6ULhv8xk1be0x6i+np3ZU311BBOxIhKkDJR92pIMizp46jaL
         r++f/c/pvLek3WPF98GCl1A1bb+LiswPGlTIPxA/ImUS6OMlPkcnhMsEB/2slBuTFQ8P
         yG2sUGUU1AlWgx9+er+Orr+gjYPPjKgIrahqVzRbZsyzi4OhS2d12Kd/XwKz9T+qPgSQ
         zoeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726386999; x=1726991799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhFzitJb0umtZWqp49PJUAXNbGfr3W0t6L39uwVPg1E=;
        b=QgyUUImTsADpR2GFeJTFpRovBkFWS41zEIPUosTaNo2VQtASdIf5ym2cCKfmnW708L
         Y+2fqt3ofREEzAZAg4jk97IgstImoBjsclMXBwzvnBYxbz6Ek4dVlEzPm58IwPl+/2zm
         FiovhYDIHUYdaenuoMnQekS5ffiYL759I3TqeUcFwABwlA2//mbTnJ/dQmObGOuodgv8
         oDMSjPoKPqefO0LlYjzMKQ+mFiKORWlXPAfk30+5J3siZGCkRrSpjEyeH0FeavumOTc9
         gokWnM23A9Omjjn1TQV5zxtzTwqQT5AHiZGTX/b0kNQHgci3cIDmKYgG9QG8J0wELdx6
         HTYg==
X-Gm-Message-State: AOJu0Yy5xPLExTAYcc3jVYYnlvucPxDwcOE9r4SxDAVWM55Syq98IMR4
	Y8K/JNnnfJLAEU2wTGl24xmq4sryw3imHu1yAPpU7kQYM7whYiYLOm3US4iVJVC7cYUesXlWmLR
	I1ns=
X-Google-Smtp-Source: AGHT+IGiGMKY4wI79UkcUPx1+nLBkLxsARzLj92GKHd3sh1+gCAIoo0Mhw4IG7YztC4aV6hsqVVuhQ==
X-Received: by 2002:a05:6402:274a:b0:5c3:d8fd:9a3b with SMTP id 4fb4d7f45d1cf-5c413e4d06cmr11203699a12.28.1726386998369;
        Sun, 15 Sep 2024 00:56:38 -0700 (PDT)
Received: from localhost.localdomain (adsl-13.37.6.161.tellas.gr. [37.6.161.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bc88d82sm1410309a12.81.2024.09.15.00.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 00:56:38 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH v1 1/2] specvars.tex: Add \virtioauthor command
Date: Sun, 15 Sep 2024 10:56:30 +0300
Message-ID: <v1-proposal-attachfiles-1.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <v1-proposal-attachfiles.manos.pitsidianakis@linaro.org>
References: <v1-proposal-attachfiles.manos.pitsidianakis@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit

Add a macro that expands to the spec author "OASIS Virtual I/O Device
(VIRTIO) TC". This will be used in subsequent commits to define the
author of attached files in the pdf build.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 specvars.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/specvars.tex b/specvars.tex
index a80557a..7d3c8f7 100644
--- a/specvars.tex
+++ b/specvars.tex
@@ -1,4 +1,5 @@
 \input{setup-generated.tex}
+\newcommand{\virtioauthor}{OASIS Virtual I/O Device (VIRTIO) TC}
 \newcommand{\virtioversion}{Virtual I/O Device (VIRTIO) Version \virtiorev}
 \newcommand{\virtiospecfile}{virtio-v\virtiorev-\virtiodraftstage\virtioworkingdraft}
 \newcommand{\virtiourlbase}{https://docs.oasis-open.org/virtio/virtio/v\virtiorev/\virtiodraftstage\virtioworkingdraft}
@@ -15,7 +16,7 @@
 
 % PDF setup
 \hypersetup{
-pdfauthor = {OASIS Virtual I/O Device (VIRTIO) TC},
+pdfauthor = {\virtioauthor},
 pdftitle = {Virtual I/O Device (VIRTIO) Version \virtiorev},
 pdfsubject = {Virtual I/O Device (VIRTIO) Version \virtiorev},
 pdfkeywords = {VIRTIO, Virtual I/O Device},
-- 
γαῖα πυρί μιχθήτω

