Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAA5286891
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 11:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095223; cv=none; b=D1RxiX3no6xItoe8uji1QVRshP+2I6le0WdghAn4L0qUMxxgdyFT7rYSOJsnkmC15T6sWiJSQaOfTgZOoG8q0L4olrEbZl0rtppsEIrOdsBkqiltNso72j78eynLszQCzgLj7zwP43s7qhXOjRMLQYRMbf4U6tI0mxWgHSMUOcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095223; c=relaxed/simple;
	bh=C1XgU0eVRRQZ7do59HfvUhP6o/SJy9YGfGqx17NCd7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c25CKWxFYCXTCuKyH04J1seGWqJGKbltkeu21DZobm8U3O3L7j58y15VO/2+BwqeL5mGA9M3wMq+/J2ueZpHBrPPRu/OLQO7qqFbD/OTsX7oSq6+iTVJstec7SeRsAY2PiZt64JOdcs0eLSq+ygSNtDvERgcQpiyBaNQx/5LmYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IKhJcy7O; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IKhJcy7O"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-631787faf35so3773223a12.3
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 04:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760095220; x=1760700020; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lztXD1u6c5xN26yQND66uecq2w50/5DlP9eXc/sCQ5E=;
        b=IKhJcy7OrE2DbMsYvpZ6JwfJOkpDBTcpGlR7sk4vk6l5RR3qM66AfhbH3ffqNyyfkb
         tHZrWjhs26jQQ6TSpqwsb+9BoQNTcHTK/OrY9zg7crDcNlDlWjUsHYAYE8MKdWLwgQbT
         /ySJPjULdye6oMa499V4txG55xgG7tUY2szX2mLVvyU1Uhk/blgWmUICg+dAOBkH2gim
         YUKw85l6ctIcnX4oE1FtxVtXrsqi2WUeqt0QYI96k4rgADtpe43jhtpkBf+XQ2G9nOJa
         IWwRQGKlIJ87Yt48aKY7psAGF8Q1yWGLCynNcaSlVQ1ejB/PZV4XC5gHT2iyWLd93Q9D
         lXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760095220; x=1760700020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lztXD1u6c5xN26yQND66uecq2w50/5DlP9eXc/sCQ5E=;
        b=LJnXzkrymLEhfXu31fOOjPlVq0Sm+ljSjeTswgtyvmwmZSDwx54cxzWHx63lSTNFuP
         MGpr5Py+OiyOBn8mEovYq/AE7GOXnmnPm+HHbb8sfQuH7FJH1yYsxliZkisGTmpqkkjC
         1KfHcCyuHke5suRs3eAplUqVfTbDccJbrmTg6L32wPw5mETmmpn+nRLSwZkV/3eKL61N
         Lmprcif7HzgqJG+hCpCyhBhX8nTaDuNKbl2QFhzTKyzQ1Tbx28RMh+cGSg7A4DbjWfn7
         4zBGuJ3rw3WrF1hPrWYEibOhVR7CkfLiILApNgd1ircxjG/GmYayxnhA+AYHef1s0eMH
         SbNw==
X-Gm-Message-State: AOJu0Yy//+mUziEkOHqccWHP7yNoKL//iZ6jWq3lUjFfP8Bvnh3z1E/X
	kJGNpAKHYRJPzLvexIki5OIOifjZY/swHI4gV1i0r1S4G3Sptrp23mo6fRrqhWQb5A8=
X-Gm-Gg: ASbGnctwfzv4p42bgtIZzQ8B+BWFFrvUzAiSR1T2Y6FWY+pnFQ8xe6VJyb1jvL+V3sa
	RmD3Xm2dEQl1IFLNY6zjRMO/lHXHfzLr8FtZH6S6WZPsj4Ea/6Vu1g89qVxAushkPhbxIwaVZ+j
	wKwqd3q7HEgo0w/6FVE2nyC7QY4MCWbCrfcZIV/5gOFCb++aa4bm5egr4rdoStQHMhadcqW17PA
	uHfD4bdO1gUvaxq7iCYIj/6A4vYnMqzSRaOmajFZfjeE2pAt5moCq/5T1bB7Tga06W7nsjerfmQ
	UE8edIE+qmjnTbWLXnZ3c4JWDjtJ97tIOy7viS9gHoyILasoiAgX8oWczsONkAxAbyR/VEGROBe
	6zK38FOMz+vokrpz5BnWg30IrsOMYGj4+Mj9I08kSoBSl6g==
X-Google-Smtp-Source: AGHT+IG+MMrWapo5fRD6KREMi8utXUsWA6yVm3+5Or4hkITV8+qgbDihStXP7mtRJAsp2KDdWs4afA==
X-Received: by 2002:a05:6402:2807:b0:637:e4d1:af00 with SMTP id 4fb4d7f45d1cf-639d5b8c020mr10879300a12.10.1760095218329;
        Fri, 10 Oct 2025 04:20:18 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a461703dbsm2173564a12.0.2025.10.10.04.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:20:15 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CE67B5FA5C;
	Fri, 10 Oct 2025 12:20:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Parav Pandit <parav@nvidia.com>
Subject: [PATCH v2 05/10] virtio-html.tex: sort package list
Date: Fri, 10 Oct 2025 12:20:05 +0100
Message-ID: <20251010112010.3880438-6-alex.bennee@linaro.org>
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

This will make auditing and adding new packages easier.

Reviewed-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-ID: <20251008145916.2626143-5-alex.bennee@linaro.org>
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

