Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722396;
	b=2kTgMdDBasPS9fuU1lAqUEqT/MOTJLzZZwEgb883g5QEOgekIVHi5VeTTRB/u53kav4U
	 9+Ok1467AjVpNG3WzmsMds+0mQOHVKOlXlPP64n89pxmORvXq1UzUsg/cAnObEbt2/Omj
	 3c7Mz50xXtBWM023D/On1uCe7X+UeZfIF4kNJ6du00q7XrA6C9K+oEf4fJCaQGNdGglSI
	 abUFtH4QGxVdjqXapySXHygjTaPhxT55yjZqaaCjpqDKQWbzy6Pyc5VaOPjMp4ViXYhEK
	 74GgTMjOhrdi2wqy4VsyyCQN7t/g2auKJ31RjhRozrEmPVA2shjEcu2+gZLSG9AA34w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=JsYDrmnh9hYWMLJYSLFoTI+l4NdyStRlgq404rhYY7M=;
	b=LdcmdW5w+vYe9y+D3w36hTxws8ZmlZw5uxj9XOMgI/03Taqt8PQJrNlyfzLirQm1PI2j
	 a2olyCJ9V2PweIFTmX8u5gsbHOkc3mqTmJfaLHEabTr1Fxb6Fix9x3ad/ocuVatZ8qV/I
	 xWYWmdBVZlhxLyeYxWULPXJj0QqWt9Y31HBWJO/all0YSHisQ5oVa9/mPUn28Xbj6Rley
	 nLHeJgAT0+3j4LJCPtQVN/viNt1nVxFyFUF9I5Qxy9iVIcs9jrCGHq80bhRQxQO/+7esu
	 IyQp/XU5b5C0qd2SynctdoCsxVh6x7cFMfTPr4dSG5T6qmPMGMLcKPTF/tG2o0wBpcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xnFLB27m;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB58606A31C
	for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 19:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEB58606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xnFLB27m
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb606491faso39274175e9.3
        for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 11:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795722394; x=1796327194; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JsYDrmnh9hYWMLJYSLFoTI+l4NdyStRlgq404rhYY7M=;
        b=xnFLB27mpMpqys2wCRgY3bviwiWtv65KAoDy2Fq7v8rZS6ZCS7aiujwmyxxuxV8OSw
         T6rWNzOSz89m7FCZFz3k+GYjIEQcm+tnFQm1nMBgoiDPT3hfh4Z+9zlgB8lu5oNPmsHz
         dOSwXQFGxnW+lzjGaO2c2HlxRzc9Uo7miuGoM/JWeYT0cTPuIIx6HY+KnlFk2laFEv9Z
         zbip9FQnXOEt92PDW1HegHQXoeUJ2C+djvU3nCgUO65EgcFTeabtYS2DO23yk29PjWBl
         WM7h2+SxKPY7stRmS+Quj9cuYlnBGsXX9JZ3QiEIhUDCWL6My6Gy7sP7peKJ3jzY96U3
         ogNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722394; x=1796327194;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JsYDrmnh9hYWMLJYSLFoTI+l4NdyStRlgq404rhYY7M=;
        b=xG1FBOQ4RxiTWT+mwokfMZ+xZZedKitbbocdeXECweuEIiM5ZswhgcaUUQb2novdzu
         OwLJhTVl5fbrVBxgF05X/GPigc9hZq1KG4HEWGtErZ0y5jq8MyoGpYn/JmN6008L8BF2
         849ewaLNOyE2p5FF+tLOni+IFpqvUjROqOXWrvtdeO3EKTim17S8fg+OkkMQqZuLvIVX
         unFH9NW78C1hKGyrav5NqJ73Qs3rQhmQefV7jFHqprotRa2pNqqsH68aVsYhy3ffEoUY
         iUKIG6jvI4MOYfp3sOFg40PZlARa0r051TpSN+qQ2hsmdUgy/bU1ndHQF6hjxeq0U7YI
         WmvA==
X-Gm-Message-State: APuU4Z8iWNH6R+PYwG8Of1X6gX1d837TB2V4Z3vGcVNBZj/93m13EnzE
	umjAS8VBYMfPDLVd734fvlZs/lNoNlJaKEF/dl7ovIOOsV7IwrLsz1XEclDHBP0RUZ0=
X-Gm-Gg: AZFdTZc58t25sfxpIYc9DQSVHyczukNYe8TSTYXzsRePbX0zY+KXygrwXh+DwEst2o+
	k2tN5juheG4uVWCO/SDpLN3LNbp273padmDHyRJjV6FpvWakvDqY28vWpTGb1YTnF22MEwHdmTA
	QUqtUUcP3+KLFan2FYvT1eR4Zb7CV6GhWt2ueD91qUJmFX13bDE6ewHrjdyVLGccLV4UKDL1suB
	op9hnuz9a1dZ2FWCwUNUQQnDk30yv7+lsC54UWn2Jq+Cl3gXAO4Gyc74eL94DE0e9wWt5YJv2ZT
	LCppzv6WULa5OTSSbuZ621n4q/bWY5ofElvzllEBfTTXIrHk6gTNKp1IT0ldqhPOghlEAwnI0oi
	hMtXSMZibFpAZDCR9F0Sfup+NLVzTuV330e0fIqjnOTwmH7uj4qczQ0CZWTzcl5md2saDTrxjjC
	6/nrIVsUhmWYSFnPUJXmPvzRuoE9dbGb54G0FSnxkb6/UNPXMnZhx/VvY/k/kMtyS6bVpCbpFex
	f9livdCluVOVgwleAGg9jGVKhtVjBdmfnKOscJY5sQx2BYw7S/TdWwjD4p1gbi+S0k2clsBpSlL
	fznesPzSBDDKn6fgRTSf5Ma1wcyL
X-Received: by 2002:a05:600c:468b:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4bb8881b511mr455935685e9.18.1795722394167;
        Thu, 26 Nov 2026 11:46:34 -0800 (PST)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm658031525e9.8.2026.11.26.11.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:46:33 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6D4E15F885;
	Thu, 26 Nov 2026 19:46:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 00/12] QoL tweaks and github action
Date: Thu, 26 Nov 2026 19:46:20 +0000
Message-ID: <20261126194632.2429425-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Some of these patches I've posted before. Along with general
quality of life tweaks to the build scripts we also introduce a github
workflow to build and publish the current working draft of the spec.

I also fixed a build regression with htlatex which became apparent
when I upgraded to Debian Trixie with a newer htlatex build.

v4
  - added review tags
  - switched to origin/master base
  - fixed some conversion typos
  - fixed some rendering glitches
  - made the draft version smarter

v3
  - make unofficial version clearer
  - tweak the make targets for clarity
  - update commit messages

v2

  - added README.md cleanup
  - applied r-b tags

The following still need review:

  .github: add a runner to build the latest draft
  make-setup-generated: optionally add GIT metadata
  title.tex: drop vspace hack
  virtio.tex: sort package list
  .gitpublish: update base to current working branch
  README.md: convert embedded html to proper MarkDown

Alex.

Alex Bennée (12):
  LICENSE.md: convert html to proper MarkDown
  README.md: convert embedded html to proper MarkDown
  .gitpublish: update base to current working branch
  .b4-config: add project defaults
  virtio-html.tex: sort package list
  virtio.tex: sort package list
  specvars.tex: properly wrap arguments to \urldef
  title.tex: drop vspace hack
  virtio-html.cfg: implement workaround for htlatex regression
  make-setup-generated: optionally add GIT metadata
  Makefile: add some simple make automations
  .github: add a runner to build the latest draft

 .b4-config                    |   9 +
 .github/workflows/deploy.yaml |  36 ++++
 .github/workflows/test.yml    |  31 +++
 .gitpublish                   |   2 +-
 LICENSE.md                    |   8 +-
 Makefile                      |  34 +++
 README.md                     | 387 +++++++++++++---------------------
 make-setup-generated.sh       | 101 +++++----
 makeall.sh                    |   4 +-
 makehtml.sh                   |   2 +-
 makepdf.sh                    |   2 +-
 specvars.tex                  |  14 +-
 title.tex                     |   1 -
 virtio-html.cfg               |   3 +-
 virtio-html.tex               |  30 +--
 virtio.tex                    |  41 ++--
 16 files changed, 378 insertions(+), 327 deletions(-)
 create mode 100644 .b4-config
 create mode 100644 .github/workflows/deploy.yaml
 create mode 100644 .github/workflows/test.yml
 create mode 100644 Makefile

-- 
2.47.3

