Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722402;
	b=oteeFO5MuwtfWAaD5SfHWP5KCSp1eC+ydenBWmt/NtQ4S/OWDGJcgP5oJo1og6QlhR13
	 1faac36AdKzpzAkVEfyUaJLt5kwjwefiD8bcNgJ/Eq7a/R5EWIGjvTW+nSvUskd8fhsLd
	 puigdYhIi8Rp3FQJHDY/0TI2l6A6mVoq4eJxaA9VWFw6JORHZ9BIVJhtnIATmep/LIZ8z
	 LwBgXY881ws5r0msqOzlufCJoy1dI9Nn5mlFtb3l//6DE4WbVwW5GTglkNxwjy+0IQtIU
	 cdNBupRTbRbODyigGOv2W7FqQ+x3AtlXNjPGkJYfaP87b0RzvSgqVtGlRfQCnQ3t3AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Sl3Bdlt+VUeBBBzWP1iq9ABzqGn1XO0Sm1LLJvvh1c0=;
	b=O5EK0vmMVhjNMlp9ifM//mEjnSF8NSqvAFMRa51+t50OYf5F7Dtb5TYaIN1YJfVW8vz6
	 JDPb8IiDhTRmEDaxnupUayToaySLbGE9Eo6x6F+FR7DRgFMIG7nZAhpYCC1A6TKUXuVbF
	 JXUX6I5kAl9hGThd05R9wpPy4lX3amL1saNiAWZyV0rkn1G4oDkuhelQDDYSz2hZRchUN
	 d59mC8MYK4ORBVJgMTmj/L3XOfkPUkuMTuAMMbokxROv2UYqqLD97EkmVjIAWrAw19IDz
	 ISYb9N8bFGqF9/44jhFBUkAvPqtYM4NoeQsbcbezdDBnPWqZYeLnhccLyd+wsVi8KAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bVOTvHRl;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F313606A321
	for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 19:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F313606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bVOTvHRl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb61185057so47603935e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 11:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795722401; x=1796327201; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sl3Bdlt+VUeBBBzWP1iq9ABzqGn1XO0Sm1LLJvvh1c0=;
        b=bVOTvHRlXs5AiyneYUt+Q/hFLIgWrLY2XupYgwbqOWjjrvwoDUHukACXHBSOSKuLkG
         6z+I/+o28RP/IMRf2PqYWQS/kar903AV6XtKD9GOD1cBEdcxOc0W3n8IPyRJTcM7lGoE
         GU14xtUAmB+lURGOUNEBraRwwcGulc3+lu5ddmil2r7GGcRQesMNZhS7Y7wgxdAgc51P
         mcbUh02Lids2A/8xtJg77pkj4vaFrlS8VtTd0H2R6MS2pf+QSqT4NoTvGL6ySvbq8oBH
         luj3jtVhGVlooXHK1Ru14iIyP9f4qkNPoQ15AUArgPLzul85y46KNYRCh//BrVYkKhpH
         XC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722401; x=1796327201;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sl3Bdlt+VUeBBBzWP1iq9ABzqGn1XO0Sm1LLJvvh1c0=;
        b=kXcsBlEC/gmR2Qg4WQMm7Yiv1PranTLOE1rn7brCSzUgneQS8DvHC84rwlmTasaODA
         TYVdRcqW9bP+Rx+HGqyp+i929K/ozfQNUjug6+tWt4JdBjCGyZQ9OsdNxvhw77lzx4JE
         vYngQvOaWEUqs/9K4hqJxdHxwsDTt3Y6i7mq9FowmKj4QLYR2vXFWX5AGY/vYwfJo2tp
         ZjjvLAyO7qQNhif2Arkm3PxafJaOt6Warr7xPx33dcOX2KpAvYuO/IN+szI9yxzg3AhN
         dZ3WWlv8i0QKP12ojGwQ1CyuZRizRuVhwTnWBQwuJ131wp2GndOWsiw/kTjtf1EAw2Jb
         a5VA==
X-Gm-Message-State: APuU4Z8oAKccT6B+WyV4Xk8iZIllIu/XFWABuqlwEDmF28ZFCGmYiktr
	TnRSLUjk24km+0hc0zPPlXbEUGR7evs8YEHQ3k6Zg5sTe9pvf14Po9X01a6EsPBMTgZhKf+FeDX
	gxgLS
X-Gm-Gg: AZFdTZdnTGa3Riv3GcAp3G/JrG9fV4QXgI8Hki3SFSOOdtON1+j5CRWb8dSJDcjxDLF
	vejhS+aiVT4bN/U04K6CwaYotnP/I00n96/UNs9fHozzbK7WJGbDnfo72M7l54nRFCl7ULKO8/r
	Mprh2GSVh4FDAlbgbEygvkHcpNfGnJpOgLFFJAc3GTn4jSlT9u++gp3w7s32qw5LMrNSPJTUUq3
	/lzH9M192yAN/39YJTrzG/WBRvaJdIrUi1F2WjSOi9vOkxnwpPtYi6qc4+SU9UUn0kHxMJoPgSV
	Nzo4887VBTkTDx7osOIv5pd688VF6ql+qyFdVr/8cX1RjjeQeYghPYrmAll3G7OHQ16TZOlnPsz
	61RxzcDz4XLxJv7xbSGAm3T139JC9+aAd0Cz4NMrWh1ONOMs6QyoD3HkG7GsN9mKPIwOEsHinNp
	7HfRsTgRSjNHBjnF0baF2m2cNB/AwcPT4ltTNFI9K5Ehpt/IbwlraPaSryUVbFgwhCdFI/nx4uZ
	deFeQ9yHLkWsDO6GsCWAPmz93FzUG19afB83OctrhNir6OeED3wttMSauxjY9mRiEMbcK829vu9
	BT0tyVGP6MTIo/8AN3DEhN4E5cOiBLZt99vtiyZ3RwncUoGc3A==
X-Received: by 2002:a05:600c:3103:b0:4bb:69d8:3e92 with SMTP id 5b1f17b1804b1-4bb8881f095mr462739385e9.29.1795722400651;
        Thu, 26 Nov 2026 11:46:40 -0800 (PST)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm859039445e9.13.2026.11.26.11.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:46:37 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C10DF5FA5F;
	Thu, 26 Nov 2026 19:46:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 06/12] virtio.tex: sort package list
Date: Thu, 26 Nov 2026 19:46:26 +0000
Message-ID: <20261126194632.2429425-7-alex.bennee@linaro.org>
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

This will make auditing and adding new packages easier. Unlike its
cousin for virtio-html.tex it is slight complicated by the additional
optional arguments for each packages.

There is one package that breaks things so we keep it out of order and
add commentary.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v4
  - handle the fontspec special case
---
 virtio.tex | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/virtio.tex b/virtio.tex
index e02b341..9071cb2 100644
--- a/virtio.tex
+++ b/virtio.tex
@@ -6,40 +6,43 @@
 
 \documentclass[10pt,titlepage]{report}
 
-\usepackage[top=1in,left=1in,bottom=0.5in,right=1in,paperwidth=8.5in, paperheight=11in]{geometry}
-\usepackage{parskip}
-\usepackage{setspace}
-\usepackage[english]{babel}
 \usepackage{ae,aecompl} 
+\usepackage{array}
+\usepackage[english]{babel}
+\usepackage{courier}
+\usepackage{enumitem}
+\usepackage{etoolbox}
+\usepackage{fancyhdr}
+\usepackage{fancyvrb}
+\usepackage{float}
 \usepackage[T1]{fontenc}
-\usepackage[xetex]{graphicx}
-\usepackage{placeins}
 \usepackage{framed}
+\usepackage[top=1in,left=1in,bottom=0.5in,right=1in,paperwidth=8.5in, paperheight=11in]{geometry}
+\usepackage[xetex]{graphicx}
 \usepackage[xetex]{hyperref}
+\usepackage{lastpage}
 \usepackage{lineno} 
 \usepackage{listings}
-\usepackage{courier}
-\usepackage{fancyvrb}
-\usepackage{array}
 \usepackage{longtable}
+\usepackage{ltablex}
+\usepackage{mdwlist}
 \usepackage{multirow}
+\usepackage{parskip}
+\usepackage{placeins}
 \usepackage{rotating}
-\usepackage{fancyhdr}
-\usepackage{lastpage}
-\usepackage{xcolor}
+\usepackage{setspace}
+\usepackage{tabularx}
 \usepackage[explicit]{titlesec}
-\usepackage{mdwlist}
+\usepackage{underscore}
 \usepackage{url}
+\usepackage{xcolor}
 \usepackage{xifthen}
+% fontspec must be loaded after titlesec (which freezes ex-based heading
+% spacing at load time) and before xltxtra (which loads fontspec without
+% [no-math]).
 \usepackage[no-math]{fontspec}
 \usepackage{xltxtra}
-\usepackage{etoolbox}
-\usepackage{tabularx}
-\usepackage{ltablex}
-\usepackage{underscore}
 \usepackage{xstring}
-\usepackage{enumitem}
-\usepackage{float}
 \IfFileExists{ellipsis.sty}{\usepackage{ellipsis}}{
 \message{!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!}
 \message{LaTeX Warning: Missing ellipsis.sty: dots (...) will look ugly}
-- 
2.47.3

