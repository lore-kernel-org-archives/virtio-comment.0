Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0531213A265
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 11:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095217; cv=none; b=bk6/5j/73tjGsdvSt8R85XtsdHU+MkvU5EbVIraBOK2kcNLRhwAMhj+rhsCZYwbcC8per0sPM4y6+Tg2mVdj/MolJ1GlmMcWsLvcT4D54kp1Htnpa4NP78y4aLABJ6xwc/nqSDNadk4OoiuPHjYf0rb82w5mOu2Il8UMK5lTv0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095217; c=relaxed/simple;
	bh=/xeLRDd83IJMFV15qf/OpQVHjvtT7MCaFa0BduYEBWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KOmukYKhHqWYoxuBNXcOib+0eiISg9Xzj++hYYrrvCbMyGzINDWZzBNiJ+r12k1IBnqxWkVI8NfXsdWsLZe4rSYumL+SzCiHeZTKIMAud3imUeIqRsos8aVC18Np182H+Qf7QhQelUKEc7zVxfvAk4EqXg1h3btwX37YpGlX8j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=scNN/2fq; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="scNN/2fq"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd68bso3904364a12.0
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 04:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760095212; x=1760700012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vrL6uJ5s31mkdEkKN2rVhe02uDchwCdsaj39RLJnfOA=;
        b=scNN/2fqkiWT8wB8V2G5m5WE09V7+1NxTHYGCb3Os1wdbm3Aa7VAAd1VeQ1LOkB7GE
         yD+dpHCCW+fxlf/0Z5pzy8kktVYhxTLeNO1uRqE92QfF9k4cWPM6q2Vdxlg/SsimPOKf
         s5ll/wvzsDYm9EK6Ns3lZPEh3pKUANPbhgAklwhqZPCh0gt30V+pX4eEHDqmFWaxx7Kf
         JcTt1ytBS4PuflLoQ5h6xXVPzAxUFwPYF0poQpzrl+IKVHKZJSFCjNXiWaJKxAX/Uw4s
         3+IegT1ntQ6dDnyggoQ92oGsaQa6OwmfV4s69hTg43cBR3OuXxYI6I1gY1DEHHyoX1kb
         DyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760095212; x=1760700012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrL6uJ5s31mkdEkKN2rVhe02uDchwCdsaj39RLJnfOA=;
        b=hAqJnqOsgpkSBaj1hiNFBYalWoZCNbsncB15oIa6gwFvPhbLie6v3Vur7DWkzyuSsz
         oyIhBie+blSBj5vxOw3liygXFVBZCnL3smaML8aJwuVmkrvkeP//slCt2aJ7ZY0vGOjN
         njE8v0tBPSsFn7dKYKymMcO6n1fFltKA0eePOt1Dmolglq5YAcufufkGbmP1R6Ink0bH
         VGjUbfNalAW+Hb3+C58+2B5q1vWh8uUaaRBvhqfwHRNquptyGTHo+vqKy6hRE1bmTElz
         fZD0zM2fFxYh10n70Zfy3pup43AoxFHOzGWP9Qo5oDjEg2q7IHltBxXcl6qaRZzQ4CEw
         3rjA==
X-Gm-Message-State: AOJu0YxQ7SYiss7xl7TN6zK1wOWbldH8/DMbtfqQ5lCAVT8SGbsaeCkG
	XrCeiRbzdtJocBRhol5VYBXNh5qcpeYRAlGCYfbennEyBh/v8WEexE6vcLHloZcwDkI=
X-Gm-Gg: ASbGncul0ySaEwMQwf9uefST7mACm3S6M3YWrdnYr0H/dcehYS5j+STs5hiRHC/3bvf
	iHVdZs8SDCjRU4G0NZME4g98jdDgycBbNXoR4QxgubCU4OZ+d/GPO0u0+xwc20ZUfrKfE9+Huz/
	zZornPi1+p4FBnPBw8TsO601xbULq2Z19UYHBrJQtK8dkphZrVpUfQpWFTIEcA/71K+3bPlZV84
	inYzGrBowg6g12NnHuuP7Tr+8LKk9vNCX+Q61OIxFmNridCNmjidIdStxWp/ckTdO0O48Gc55aE
	1yMV0SQ0+STI1UhGf38ggIyuCh8CDzaIoKkmD00WJEBiH5mjh14xlINJN92cItJYGxJT4BjDvig
	P0S4JmiasIYAWa/pqAv8b6oe4frGFhPnge6bQ8n+NCM19NATg/whs3mlc
X-Google-Smtp-Source: AGHT+IFMrfjpsUOzrL32NdZKOU3D88JMb+OG7nvIbC2kuprNwD/FP0ktmf8dES2ESx93JSjppdvdaA==
X-Received: by 2002:a05:6402:2747:b0:634:a8fb:b91d with SMTP id 4fb4d7f45d1cf-639d5978f36mr10569803a12.0.1760095212185;
        Fri, 10 Oct 2025 04:20:12 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b71503sm2043021a12.27.2025.10.10.04.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:20:11 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8BE835F7F6;
	Fri, 10 Oct 2025 12:20:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 00/10] QoL tweaks and github action
Date: Fri, 10 Oct 2025 12:20:00 +0100
Message-ID: <20251010112010.3880438-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Some of these patches I've posted before. Along with general
quality of life tweaks to the build scripts we also introduce a github
workflow to build and publish the current working draft of the spec.

I also fixed a build regression with htlatex which became apparent
when I upgraded to Debian Trixie with a newer htlatex build.

v2

  - added README.md cleanup
  - applied r-b tags

The following still need review:

  .github: add a runner to build the latest draft
  make-setup-generated: optionally add GIT metadata
  virtio-html.cfg: implement workaround for htlatex regression
  specvars.tex: properly wrap arguments to \urldef
  README.md: convert embedded html to proper MarkDown
  LICENSE.md: convert html to proper MarkDown

Alex.

Alex Bennée (10):
  LICENSE.md: convert html to proper MarkDown
  README.md: convert embedded html to proper MarkDown
  REVISION: update to 1.4-wd01
  .gitpublish: update base to current working branch
  virtio-html.tex: sort package list
  specvars.tex: properly wrap arguments to \urldef
  virtio-html.cfg: implement workaround for htlatex regression
  make-setup-generated: optionally add GIT metadata
  Makefile: add some simple make automations
  .github: add a runner to build the latest draft

 .github/workflows/deploy.yaml |  37 ++++
 .github/workflows/test.yml    |  15 ++
 .gitpublish                   |   2 +-
 LICENSE.md                    |   8 +-
 Makefile                      |  33 +++
 README.md                     | 387 +++++++++++++---------------------
 REVISION                      |   2 +-
 make-setup-generated.sh       |  32 ++-
 makeall.sh                    |   4 +-
 makehtml.sh                   |   2 +-
 makepdf.sh                    |   2 +-
 specvars.tex                  |  14 +-
 virtio-html.cfg               |   3 +-
 virtio-html.tex               |  30 +--
 14 files changed, 298 insertions(+), 273 deletions(-)
 create mode 100644 .github/workflows/deploy.yaml
 create mode 100644 .github/workflows/test.yml
 create mode 100644 Makefile

-- 
2.47.3

