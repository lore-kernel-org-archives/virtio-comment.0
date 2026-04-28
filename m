Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB722E7F25
	for <virtio-comment@lists.linux.dev>; Thu,  7 May 2026 03:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778125267; cv=none; b=RrWi7JwIfdwEQWaS2EB/66C6Iwa73eGmMKb7EyIwHU6VPSmYAcjUk1Fc8IZyNC2L7q66EudRUvgK/q4uSUNvKWft0nw3K6B3WXkLP76y4w4pRNMMwKepFPuSDbv14QqJwS46vFG1/grYLND4vgKugewoZ5KGo86x5GwVIXR/lzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778125267; c=relaxed/simple;
	bh=smrS2iZt7dyrUri8PRkivRkt/HByqBchaF6tITHjrPw=;
	h=Message-ID:From:To:Date:Subject; b=FAqqhYZOCtlAz4TgrjPQLJpu/3FgOJOgtuAcjejUMv2UtabIM7XOq4MSqVgO1G8DUnRxfioZd4CTNWtlKawg1AFl9boEA7YwemwqEIaXPtqZAMhzq+lHuzvYflvC1fYRc6MdXkbdmadCPpEg76QkBc4lL19fxLQJWBPP47U7RtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sq/VKuxM; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sq/VKuxM"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-65c2cd216c9so292322d50.3
        for <virtio-comment@lists.linux.dev>; Wed, 06 May 2026 20:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778125265; x=1778730065; darn=lists.linux.dev;
        h=subject:date:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxIp+OCvVFzXkOtNKBXFUycBE5QuMfHmyJlDS/RE8Ac=;
        b=sq/VKuxMHxN7GF/oD1hvyEaJVjusD5Mbp30ep80Fr0tjAs4g18fYvp0/8yJC72TCu/
         7fSw5ljfaNwbd+QJMkrGNAqmJKY1xeTORP8phewI0Q/fq5TI+s0oNzkU34thReMmD0BM
         HsgSFHcNK8z4MwLoxz6aJtLLEP/MYVdhcst2EViicmz3HX3h+g5z4RVGvTM/2t9Uh+P9
         pJc04dQonGhKOyY95HAN1W5DqBIvEOiXwoLHQvKleE6Z31JovtZ03AoP/DJEW/C2rI8l
         /gmX8USqBI1hwKgvV4Ziqqs3kEsbGoaOSTVB5/S/NOoIqc1jTiTEb8ia8Da90D1zJs05
         K1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778125265; x=1778730065;
        h=subject:date:to:from:message-id:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UxIp+OCvVFzXkOtNKBXFUycBE5QuMfHmyJlDS/RE8Ac=;
        b=ip0l4O+DsBpuXMCi/zIfi9lOxg+APrORUO13D6rAfeRnXK4pb8MF/+AtUI8M1FfqiA
         n62ru55xM89sztvoC4+Z5yUAQ6Q2lvqIfsPCY993MXRcDKMEYFMai2k0Qki36jPqipvo
         frARzxxNICsEmI9bvJn6U7E+rLlNG/JDfvC2OK+ou6o6hFIN61hKcJQNgaoT7vnZ+Xqf
         lUxJDnsoV4QD1DFrGUwitedeqgBbC+8K4tSAo60P3IW5cmGTDyJ4fLCevAR15yaN60Mx
         OwOBatvDs0JJZOpMl8pWxdtsM4RdTNKfnbQhT/47bQZIjrJQvUTVMQhT4lI9mQF6HGMP
         S2WA==
X-Gm-Message-State: AOJu0Yzyd76z5dPbqWsPY4lj+LRfsPmspOTINXqfpUmwdQ9hfFHMqG6x
	skYJrcKyrR5e1d+JZhB3BxmgisySBRxoQqgyz7otsZJfyyHiEdMaMSR7G0Tdkg==
X-Gm-Gg: AeBDieuscQNjpcQjjoeEM5JfQfsc//1/shYAyXxeAxJ29FaupIBxdazvOgEChBpfh7a
	V+eaFo0ENBMbLk427czw8k2r9BJ/TZP+tGEPezJSHoPSEPkmTGAEYfxlusfWjWeloST3fD+Ob6B
	jAki2FHeWdoEN6mSPTpbNETJuZkUqTYUxcDjhp4KPeH2BCsmWhf7UasJeZx5yngyNxRLsAXqFie
	XDd/xf76PJYkt91HwgrvccAAcDzYy5r5+bZMf3Jpi+QtNO67096woE+awNs2vxaBiUOqgoHJOqX
	FhkCUX5fbICh2Lt0SSrg4S8tyk+eK/NIhG4etiBOz/cl1iaQigbFZOYczglFDA5ow+VrRA8jgY1
	eLvyiA3eNqFVAW7gIFjM22IdPExLv7o8IWHgQgZ4gWH6Nkw3HScQN1CcOZ0FjMGRL9e1j5qU7La
	mfr1x77Q9FhSjUSHA3nI+uc8CYYCK2hTfYQnO/opmor5em07YQ4yzoJgTRXqK4t1OjSI6LPoAve
	shhTqPRvjE2F2WD2khWm9c9mXfrfD/AZvE829MAQovbvxjMVvmcDikTEOGMAFA97iNw4uw=
X-Received: by 2002:a53:e44c:0:b0:654:27b0:8881 with SMTP id 956f58d0204a3-65c7989fc6fmr4156255d50.3.1778125264851;
        Wed, 06 May 2026 20:41:04 -0700 (PDT)
Received: from localhost.localdomain (h69-131-150-190.cncrtn.broadband.dynamic.tds.net. [69.131.150.190])
        by smtp.gmail.com with UTF8SMTPSA id 956f58d0204a3-65c7aff473asm1966717d50.17.2026.05.06.20.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 20:41:04 -0700 (PDT)
Message-ID: <69fc09d0.050a0220.18d9e0.cc26@mx.google.com>
From: Demi Marie Obenour <demiobenour@gmail.com>
To: virtio-comment@lists.linux.dev
Date: Tue, 28 Apr 2026 01:56:02 -0400
Subject: [PATCH] Avoid repeatedly checking for font availability
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

Checking if a font is available is very expensive.  Do it once and store
the results in a macro.

This also provides an easy way to skip the check entirely.

No normative, informative, or even typesetting change.

Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
---
 commands-pdf.tex | 12 ++++++------
 virtio.tex       | 26 +++++++++++++++++++++++---
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/commands-pdf.tex b/commands-pdf.tex
index 23289d895429f4ef4b50fdefa3f7b6a8a5e9ebbc..b9e57347bba2a69ff51262dbb39cb147d1e70a2c 100644
--- a/commands-pdf.tex
+++ b/commands-pdf.tex
@@ -20,7 +20,7 @@
 \newcommand{\oasistitle}[1]
 {
 \begin{spacing}{1.5}
-\IfFontExistsTF{Arial}{\fontspec[Color=446CAA]{Arial}}{\fontspec[Color=446CAA]{Liberation Sans}}
+\oasiscolor{}
 \fontsize{24}{24}
 \textbf{\noindent#1}
 \end{spacing}
@@ -29,7 +29,7 @@
 \newcommand{\oasisstagelabel}[1]
 {
 \begin{spacing}{1.1}
-\IfFontExistsTF{Arial}{\fontspec[Color=446CAA]{Arial}}{\fontspec[Color=446CAA]{Liberation Sans}}
+\oasiscolor{}
 \fontsize{18}{18}
 \textbf{\noindent#1}
 \end{spacing}
@@ -38,7 +38,7 @@
 \newcommand{\oasisdate}[1]
 {
 \begin{spacing}{1.1}
-\IfFontExistsTF{Arial}{\fontspec[Color=446CAA]{Arial}}{\fontspec[Color=446CAA]{Liberation Sans}}
+\oasiscolor{}
 \fontsize{18}{18}
 \textbf{\noindent#1}
 \end{spacing}
@@ -47,7 +47,7 @@
 \newcommand{\oasisnoticelabel}[1]
 {
 \begin{spacing}{1.5}
-\IfFontExistsTF{Arial}{\fontspec[Color=446CAA]{Arial}}{\fontspec[Color=446CAA]{Liberation Sans}}
+\oasiscolor{}
 \fontsize{18}{18}
 \textbf{\noindent#1}
 \end{spacing}
@@ -56,7 +56,7 @@
 \newcommand{\oasisspecificationuris}[1]
 {
 {
-\IfFontExistsTF{Arial}{\fontspec[Color=446CAA]{Arial}}{\fontspec[Color=446CAA]{Liberation Sans}}
+\oasiscolor{}
 \fontsize{12}{12}
 \textbf{\noindent#1}
 }
@@ -65,7 +65,7 @@
 \newenvironment{oasistitlesection}[1]
 {
 \setlength{\tabcolsep}{0in}\begin{tabular}{p{0in}p{5.8in}}
-\multicolumn{2}{l}{\IfFontExistsTF{Arial}{\fontspec[Color=446CAA]{Arial}}{\fontspec[Color=446CAA]{Liberation Sans}}\fontsize{10}{10}\textbf{#1:}}\\[-0.05in]
+\multicolumn{2}{l}{\oasiscolor{}\fontsize{10}{10}\textbf{#1:}}\\[-0.05in]
 &\setlength{\topsep}{0in}\setlength{\parsep}{0in}\setlength{\partopsep}{0in}   }
 {
 \end{tabular}
diff --git a/virtio.tex b/virtio.tex
index e02b34101d1e3996cdf4d66cf1df398160a82c8a..9a725774f2d077ec74acc828d1db58192592eb8f 100644
--- a/virtio.tex
+++ b/virtio.tex
@@ -55,9 +55,29 @@
 %\def_{\_}
 % Don't hyphenate acronyms
 %\uchyph=0
-\IfFontExistsTF{Arial}{\setmainfont[Mapping=tex-text]{Arial}}{\setmainfont[Mapping=tex-text]{Liberation Sans}}
-%\setromanfont{Arial}
-\IfFontExistsTF{Courier New}{\setmonofont{Courier New}}{\setmonofont{Liberation Mono}}
+
+\newif\iffontcheck
+\fontchecktrue
+% Disable checking for Arial and Courier New
+%\fontcheckfalse
+\newcommand{\oasiscolor}[0]{\fontspec[Color=446CAA]{Liberation Sans}}
+
+\iffontcheck
+   \IfFontExistsTF{Arial}{
+     \setmainfont[Mapping=tex-text]{Arial}
+     \renewcommand{\oasiscolor}[0]{\fontspec[Color=446CAA]{Arial}}
+   }{
+     \setmainfont[Mapping=tex-text]{Liberation Sans}
+   }
+   \IfFontExistsTF{Courier New}{
+     \setmonofont{Courier New}
+   }{
+     \setmonofont{Liberation Mono}
+   }
+\else
+   \setmainfont[Mapping=tex-text]{Liberation Sans}
+   \setmonofont{Liberation Mono}
+\fi
 
 \urlstyle{rm}
 
-- 
2.54.0

