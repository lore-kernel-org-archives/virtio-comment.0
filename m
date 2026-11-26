Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722402;
	b=t+GL+bOSgXMBb8qoFPpLDnWCmQM4xDKWZ+2Br/dtyTfNNbW1MfDxP4kyHlx433oAwZju
	 CEQ+kmMLGhlvssl1DbyLt2Psc1molrzLkxTJ2UFcaOh0MW1T4DjQCpKeGExC0Kcj4v1o9
	 +szsHQy9CN5HcQHGCzd8Ot+xGNixa/RsG6x4Ny5C/2yw9uh4XSDc6WSsXDpPNnN01XIb9
	 GEa3u014U+5O8OnqPQJlLklXt7I0Cf1is8S9ps4UJXKrJnI6sOAi7GD/2rl2VmrahfQdP
	 4jYtHfWMBXxp8G920fkveBM3KXDV5C2r8bMcYn35hvPB67faynAgkvDcT56HbZydlfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=dj7z6yUV0BtBIrDzNGvwPahQ4W8k+4khdZvTJ1tlBo8=;
	b=sFgmdHenMLS+r1KkI8qN9KLVhdOdweUaktSZB0nCfanlowkESobtxM39QvoNvbpPTbV2
	 YW1/7XYfd18gZKgOxGcTMrGGh4sI61dqQL37V9wqebtq70Bb5ejtcya/9rMIcyQ6D3Rk8
	 6nDnrVhGWJe9l7hYnxrZsMfbm79BFH5PvF1Hp8hPZ5xMNDKXFkfkJwsr5UdH4UqfkX0WW
	 1xishPvNds7/Q1th4ED2wTxyjt9xK0sPH1EhOfsfY7QKo6sWBYOSNJg+opestZGmKMSHi
	 cfsMRFmdy8ImjT+W/Sxx8H+2va69v+Xr3fJ2kTuFtCrYkW8OJRGhGegFVMxaz90SVgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cXKrq31y;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A5E606A323
	for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 19:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4A5E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cXKrq31y
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso4655792f8f.2
        for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 11:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795722400; x=1796327200; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dj7z6yUV0BtBIrDzNGvwPahQ4W8k+4khdZvTJ1tlBo8=;
        b=cXKrq31y11dlrdE72unU5JKX/ajs429YT2DjwY0wENOttR7G2mWLv2djvU/Q1QyUry
         cAxIlAT1PaPQCiicgVxM4XKl89TqgFandOWOptoacGb5ZC8zaCHE6KBgGdZ6nq+JFUOq
         gU5SHeLJF1p+q9myMxRa/D3fo/NlFV1roxzmLpJ+bkrrFZfrRRJzDHR03j7o+4XOb9ou
         1eyKKPpi8SXbzyDt2MukE+BxMWN8u42DrNOpeHVB9XqEPg2n0D6/FgoFzGdnIFEMZIjT
         IBiZ3R2hd3RCLblIQuQ/gZn1V+5GRnVMgjQFKk72b6MvStPr0aUCrge/2p47FpQh+scD
         RIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722400; x=1796327200;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dj7z6yUV0BtBIrDzNGvwPahQ4W8k+4khdZvTJ1tlBo8=;
        b=vsZaiMAykG32E8VjiV65Koki9q271u1x2QDesALYv55escfVychQ4Y0DUDaGfeweo5
         3miEDcn3V9LZjS0Oo2xTyQDrav6RboWBCVa9IJmhj4YdultVo1vPBaobW/FNtikhb24d
         CCoWZbPu+yVJFq6ThGwtvo083a3uHPx8k2BOnzFISJfp61ENbCBaKk6+w9I5fKTQKIdK
         zwJ2XfIvGniLGSqsyv4Xgwpl5ru2lWjiFNNdxR7/KH9+nCFavggJbuIRIGu1EW2l2npK
         Ctt6Fvg4ok4Tmvvezq1aYjOiFxGmoMkedX8dtVyctyG1wHTDtL+7M9gGwQh4LVmii5mQ
         I5bA==
X-Gm-Message-State: APuU4Z8wKvOIqNQ/k5s0jsQhCvN2A/PaxWs2yjEZ4V+cc4VCriTHm3Au
	juOFav0/82LyOSVLcHkkslFf86e90Drk4PmMCLSjz/VvK5i1FOh3pYJIQcuuQqtnUro=
X-Gm-Gg: AZFdTZc/Gy6sS/R0qFD92SjgHXx1bPZZFXHCq6jrsy0hxKLLeau9AcK+uYZ2EX7HCV+
	DryP37N3eKTOM/VO5DSfDXwbelQ4RMzXeU5gEMn7GaG6AgaZDRKUfMkdT6624fpuCSWP44OWjA1
	4rjIBvOdUqbP4KivF6kPcZEQscPcTEUd7Id2ZAGGWZg4py8OEmOzU0507HuEFsk1ChV1TnrSdOz
	9PCX/5edk4mvcUkuE3eCCJuQ3PRsjumfWnaXCy0ArQejm4SkFRYvU/CmRsyVn/xZ9WngFMgGIlP
	UR7icCp4SJdAKkslI7r12rQgVByJGBv5FHIRX5gsUGuram7J1ufiBMR4qrv9bjsD6YbLIInJT3Y
	jVmx5LflgOFUUSzrd4kdVz/SQEC46CvYDVjrQ3NuDKceCIeH6jnCAQBROXuub2+ijXaPYk6UBWF
	EPYpljzDV51PbKBN85pi+DRdONE/etJRhrm1E1mZXRKTCBt66/MaPgAiOnHmZHFopC70DJnWNXK
	R4wfGYUPlf45fvOsYxt1tRz48t8T6sdkA1FswOkTiMmjeKolee0l/3Vkc/67PiyWAaybcvIzPLj
	RkkAbS+QcW+jrpPB/oyTPX7qF0Um
X-Received: by 2002:a05:6000:460e:b0:4a7:790c:4a34 with SMTP id ffacd0b85a97d-4abb3b42a90mr40329013f8f.20.1795722400091;
        Thu, 26 Nov 2026 11:46:40 -0800 (PST)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b205443sm44770072f8f.39.2026.11.26.11.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:46:37 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CDBB55FAAB;
	Thu, 26 Nov 2026 19:46:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v4 07/12] specvars.tex: properly wrap arguments to \urldef
Date: Thu, 26 Nov 2026 19:46:27 +0000
Message-ID: <20261126194632.2429425-8-alex.bennee@linaro.org>
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

chktex reports:

  Warning 1 in specvars.tex line 6: Command terminated with space.
  \urldef \virtiourllistings\url{\virtiourlbase/listings/}
         ^
  ...

While the space in this case is probably harmless we should be using
non-ambiguous argument wrappers if don't want to drown linter output
with noise.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

---
v2
  - mention the linter
---
 specvars.tex | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/specvars.tex b/specvars.tex
index a80557a..cf67070 100644
--- a/specvars.tex
+++ b/specvars.tex
@@ -3,13 +3,13 @@
 \newcommand{\virtiospecfile}{virtio-v\virtiorev-\virtiodraftstage\virtioworkingdraft}
 \newcommand{\virtiourlbase}{https://docs.oasis-open.org/virtio/virtio/v\virtiorev/\virtiodraftstage\virtioworkingdraft}
 %Below must be used to make links work correctly in HTML
-\urldef \virtiourllistings\url{\virtiourlbase/listings/}
-\urldef \virtiourltex\url{\virtiourlbase/tex/}
-\urldef \virtiourlpdf\url{\virtiourlbase/\virtiospecfile.pdf}
-\urldef \virtiourlhtml\url{\virtiourlbase/\virtiospecfile.html}
-\urldef \virtiourlh\url{\virtiourlbase/listings/virtio_queue.h}
-\urldef \virtiourllatestpdf\url{https://docs.oasis-open.org/virtio/virtio/v\virtiorev/virtio-v\virtiorev.pdf}
-\urldef \virtiourllatesthtml\url{https://docs.oasis-open.org/virtio/virtio/v\virtiorev/virtio-v\virtiorev.html}
+\urldef{\virtiourllistings}\url{\virtiourlbase/listings/}
+\urldef{\virtiourltex}\url{\virtiourlbase/tex/}
+\urldef{\virtiourlpdf}\url{\virtiourlbase/\virtiospecfile.pdf}
+\urldef{\virtiourlhtml}\url{\virtiourlbase/\virtiospecfile.html}
+\urldef{\virtiourlh}\url{\virtiourlbase/listings/virtio_queue.h}
+\urldef{\virtiourllatestpdf}\url{https://docs.oasis-open.org/virtio/virtio/v\virtiorev/virtio-v\virtiorev.pdf}
+\urldef{\virtiourllatesthtml}\url{https://docs.oasis-open.org/virtio/virtio/v\virtiorev/virtio-v\virtiorev.html}
 \newcommand{\virtioworkproduct}{Standards Track Work Product}
 \newcommand{\virtiooasiscopyright}{Copyright © OASIS Open 2023. All Rights Reserved.}
 
-- 
2.47.3

