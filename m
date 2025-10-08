Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5ED2ECD20
	for <virtio-comment@lists.linux.dev>; Wed,  8 Oct 2025 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759935566; cv=none; b=RdGeeLK3J4hXhESibkxB4v2Z4JAje5n0iuxvayxtrkSY6pksosDBEE7W1cjHKo9xGzBV5x6xAx293bxBSx7MSufC1TYlXHOb/j7eYAke1oCEeHx4aZ6rXTF18tXPmGQVZ8Yq3N6lgQte4AyDBFfNqGjLYJEyl5SvnX/GUkCh1Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759935566; c=relaxed/simple;
	bh=Q317QFbw/7v881OiQZhclCCSwkysEUZGP0RLNC9Tj84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MUwsFcaa6HGHP4JDzubWRGui9MTKDf3BxdFCEtiZeXdITDxUdjDpKGGW0tnn1dx5Kpz6viHCLygUJ0VqZzTJHpKgz+qtvxnzI3rUitRwAZr4Qjk/UsZyQoleW897XPYjOZzhXZ5e9P80S7djllNX7SHnLXPWb4Fl4tstkfsT/i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IVovMWAC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IVovMWAC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e42fa08e4so72289905e9.3
        for <virtio-comment@lists.linux.dev>; Wed, 08 Oct 2025 07:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759935563; x=1760540363; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mdimeyVK+niEb2MnCDciM9iG8JsqXibgXmc2U/JQDU=;
        b=IVovMWACxk4ootjPNaxKU/ri392CwXHsRkQW/dd261BPo2mNg1fhu3Lr5aWFOR8QZK
         SOcXbqKBaZd92ZeZNDDoXaAWtt6owtcUj7ydcff9kK2+f2e13WEUvIiuc2wMmwnDPUIq
         cI3oxTucj0Psjk2Mn23h6B282tS5TQW88pqXSe/a6tHpMUc2eboYEfUEj2cwKrrfp0RB
         5SnlazBCTk+ePaLWbdCLVAKmHYsyXKEJVUTX9e0papvfd7OQv3TOZUzE/EcnHYKRD2l1
         h9V9dlr0g6IBrxhLyk3JxOHHRnLerCntqjDqsf6ixl9jPU9KkCADm6DXgSoWyz16c/p9
         mB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759935563; x=1760540363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mdimeyVK+niEb2MnCDciM9iG8JsqXibgXmc2U/JQDU=;
        b=HfcuArz7bN9Dl6tSsdB6GENfyE2aRofIUqsxIqF+JP5FGDYiatBLXUC2FSliLPbNbR
         bFlFHuACJtl1Zz8QKl57wvBEptKoMQZeFNZez2uwcKQnT/kn5Kie3bCDhMN6JKCbnWBE
         LD0FUhCRNSgvuPaRQR7F/t0L82g2DnY84oeLkVR8H/JCmB6UnfX7BZAOaOX3fFfLI1X5
         X2CfjWrwAjg07/h4CVA7sskrsXi/Tzv6P4PACxhjEPbumyvry6MsO9przedRI4TIZRKp
         pNyQKwOatvkmXHtRafqt3i7anlFsRBAv9tclmGu7tYt8q5cvzuOEQeCdx0/VXXJAIMNh
         8gLA==
X-Gm-Message-State: AOJu0YyNEqXs75ArGpduZSI+wX6Q0gue8XrvIhg6O4VnH+4XsgWBgcr2
	TXE+qROfh67IpxKrnCHrlxZdROTKhvQAB2uD7EQdnHSONeErxGQ9LNZ0J1R5uzPMqPm7+3SfXfh
	n3PT0
X-Gm-Gg: ASbGncsrmLjHriFKwkdp/zH1mRFeWMl+cIxMXK/e2NzslfJejxWUWMaLQniY3NtRRgn
	ZnwL70x1zYfPArWWN2Isx1Wi3adEjyKi97nvWP+10/tSu0urpMwqPjDqcsKT7ksmygkINsZ5FDr
	TuUi1CCPuccFSJ3OGWmSwSLst1UTlWL/tGlAjwnTQ+cyuBS+EbMcLXr5t9TNDe1HmNdjtyfeIsp
	waNthykpFXX20b/aTS0PGQAe08mF1UuvxyFFlhJR3dN0EkepU4ESz22h4sx88gxTgmDgT1FNnYA
	aErH0slcbgtWlDtm/x8W/wCEhDfBLjq6ATC0X+n2B+ihhzwsQUZjPfkJCMFLVl1thjeA9VTuoVq
	tsT3WeAVvl/EjusO08Bne2/Ucbrf6AwZR9rghV+IFF3vdq2mDX1I=
X-Google-Smtp-Source: AGHT+IE2SNMvwtFdfAJE2HtgCke4OKeEe4otYnqzCH9KhCsHWzU7DnoaVnVAQOSLjyuyxD6OKFTuKQ==
X-Received: by 2002:a5d:5c8a:0:b0:3e0:2a95:dc90 with SMTP id ffacd0b85a97d-4266e7e1438mr2496098f8f.35.1759935562768;
        Wed, 08 Oct 2025 07:59:22 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6bbesm30150525f8f.12.2025.10.08.07.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:59:22 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5A2895FA53;
	Wed, 08 Oct 2025 15:59:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 6/9] virtio-html.cfg: implement workaround for htlatex regression
Date: Wed,  8 Oct 2025 15:59:13 +0100
Message-ID: <20251008145916.2626143-7-alex.bennee@linaro.org>
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

