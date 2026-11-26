Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722403;
	b=eh+Q3xpvWVVeJLD2NETO1XtshJgMWhBfJtHa42qeo7+nwv6B3vjSKYK1fPy4aQ73ixaM
	 fU+C6dwwrsuaaouT/Aty7yEbKBtcgaNd2zHzcM4PD0JNYYK/CzpeF8ZTJkX/QQ9ZnGYwg
	 99goFC2iK+rrtpF7Te2i8GrEaz6mePgk2f1A98Ejmmf2/OVuvQXvnBSWvvMhgjex+tGa7
	 6LBfNAYlpaq4q4aXGO9nqIGkcJmhNlmmdYHiSsveDTLklg48Hl2owc1QP335AsPGl5Y53
	 EOMRewaq8PtB9E7LSuxyXT0zj12InNmcvMuFgdmlTj9R4tOr6ftNmD3XXcqxcFuHXhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=JBN2v/LkLZBCY3FtAUmecQhJZh+4Q7ZOwUIzR+mHoTw=;
	b=TaLCd38rNV9Ds77aTp7ErIkLGn8UYjsBe6Wy8LBHVxzcQZZs5zwtlbVwOh0AxtYo+9lJ
	 wfsRvcQvub090X3tQt3cTUmpfIYRhDhyqWj1XLZrvemCJa2uYfXendEwkQ47D611rDLgh
	 xsKAFsgUwSrsvXCMDG0Rn53p5Oo3m1khLK47rVi3m/Wks9xx6JlxWL7SBOFAhkib4ROr1
	 XREFVMHx1O5MnnTir0NWWtiGaEcAhpcnQme6EcgmVpVi6GkzVzAXcEDZsh6Wvg6NzUkuO
	 1wNOb/HVbyT9/s9I1BcZMZUfBW693iu+0oYBfz/FNTqirdVjZXuKXckFLRHAOdWhcFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=soRwzykJ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3313606A323
	for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 19:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3313606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=soRwzykJ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so95377995e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 11:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795722401; x=1796327201; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JBN2v/LkLZBCY3FtAUmecQhJZh+4Q7ZOwUIzR+mHoTw=;
        b=soRwzykJQg0NankJFtpfFcFzUwlY93mvOUyrsZFQFxjLuE5nDcTSX717E3H+FGyQx5
         8fYXqtvk/pEfTQJRW6cCJLrR1kmgvge+62nj/a5HYgJ57VNUOz7oW9KgTeqBHrF4SWta
         QeTuBKigmEEskxdgN1B5lXPuB+w0yKX4C9iNAoOiGEPazTJuL+kwMm0pjJXkGbhY8qp2
         2kxNga/uLL2aec2L639+v4zErXjhxP2wCAItJEqJ4UT/NPt3KNos5symuSLlMaJpP4Bt
         OH7j5jWOBL53R5tfA/G+kZTgv5WCrF47F8YXWs8q3e4VGAKXktebBuclqfTWfL3Lolu6
         gdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722401; x=1796327201;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JBN2v/LkLZBCY3FtAUmecQhJZh+4Q7ZOwUIzR+mHoTw=;
        b=CTl/z6m4p0L8MDeuSJ8/jwLtIaEg5VjJn8rGl+81xhMyn9pPgmIwB5BzP9JaB5HcUs
         sc9xSTTYpIh5d6nfHnEqy3RgQR3/oAE0+YCozLIufJ0S+LDFmXieItr45cwLKAZpWRfU
         LfjjNTIgl3U8VaJb9i/IjNa14WLNC2jFdXvOKZnKkdGoDoL0P9buf0jUc9j8QQ2LcAKj
         3AUS1PCv3156o3d2HyjJtvzidNHdDPSK+pWoyFHiE7InVWMwxmIugG/skXegBtC5jnEO
         MUb4CCa6OXpkZ+NrgeqKOorbfwM9CP9TiiREMSUZG+lNNpnpNPOnz7U1RFxWTOrVybmR
         vF5A==
X-Gm-Message-State: APuU4Z/4wPe27HdCG3DIB2HOMxRmVgu6G2mYkcBXEEzWStfy1tF+O0Y0
	6pw9tWKxKIB2dOy7as2po40b7Nqzel4OzekuKEf+IOkpFbnMce+ohfgUqHI+vqtAdUE=
X-Gm-Gg: AZFdTZd1Lo2JLN4bhCks5Tk6itlq++5pG0q2ISob8Awmv8sZaJKtIW9YKlNNP6PnMR6
	FLSctqRwCZhG01GbacK7D9ZRq7hz8BXxrgh193frdRL83yg4hx11DT/4tdeiAHYULNnERn5WH5N
	X6IjUtloHi97lBdUjIc9l+11DxfE4V56+CaTRjfXvC8kC9/DdCIheEWl3cEIFruumYWrywaAx40
	gXGB7k+G07nn1KiZElL0IZ/dLfhmzsPso8BwM5iM0pTyKPYEyUs/Lj8pYvUDXg17YSpylfVUb7n
	m2fP97LIf+NhqGyiMcKdZxtZRcEq9w+GgopKjYP6OYNUl9mvWKPLp+klQLtyvaZPRVsOyAM2ief
	FGKKKqfhpKf2CPVhJkX8YFVWw9r1HnryCZcs5Kl9sgoxkRbUN9LtcGFf5VGwsQKJLKejLHaVcgK
	JmRPp83s8kWxnaV3iM7xcvg/k/OVSnI3hhBYrUiewZbno7YkOS5rfUdR+d9VCkm2aSUQNIsPsJe
	hVY/q/cqlNAdf51bcEr/bnf0dXeFk63/izgYazYQ2h8KtqibRAyT/6Fcl8777noUwbQ9v125oXL
	zo3d0IZ9QfVdC1p1XOisQEGFTQn/
X-Received: by 2002:a05:600c:8905:b0:4bb:6816:127c with SMTP id 5b1f17b1804b1-4bb861468cdmr421987935e9.8.1795722401143;
        Thu, 26 Nov 2026 11:46:41 -0800 (PST)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm39972818f8f.18.2026.11.26.11.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:46:37 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E81605FD3D;
	Thu, 26 Nov 2026 19:46:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v4 09/12] virtio-html.cfg: implement workaround for htlatex regression
Date: Thu, 26 Nov 2026 19:46:29 +0000
Message-ID: <20261126194632.2429425-10-alex.bennee@linaro.org>
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

A regression in htlatex broke the building of html in new Debian
Trixie systems. The bug has been reported upstream:

  https://tug.org/pipermail/tex4ht/2025q4/003774.html

and the following change is a suggested workaround until the eventual
fix is reaches the texlive (and by implication distro) repos:

  https://svn.gnu.org.ua/viewvc/tex4ht/trunk/lit/tex4ht-html4.tex?r1=1750&r2=1749&pathrev=1750

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Tested-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
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

