Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578702EC571
	for <virtio-comment@lists.linux.dev>; Wed,  8 Oct 2025 14:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759935563; cv=none; b=uLw9/9Ry+tmw0bO16FLBAtRRpyjxesSWc8H61C34yUq4xgP1beqN8a6vc+uIXID5fVAZ9Pn5ps9WoXrOfVGaelLQQpzXqJVtq8EtFCDLdXwmCYc+58ZjQhMXVFEMgzcHZB17iOsXEWpAGd0+Maph6hbNhFAfUWUByRhHK9WWoHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759935563; c=relaxed/simple;
	bh=Hx17qSWRp1fFcUJSBFjYG1jxd6Sq0ql4kbs6bEAEg5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uhJoyusAFCkyXVeLsrMNNjyfTEFv6N4q6p5x0RETIgiPPqfGtuWZM1ccmix3nUlumSA5v9zBKCz5ddHCJtC3941WB7pyIRtTmkVCxa8tu4jGtsxCPRYR6FyRUsob98I/DTuNgVlgQ0KWRGuRCk+B7IULym8e0+dsoztHwN5EuEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RRb6AZ1L; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RRb6AZ1L"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e47cca387so79135345e9.3
        for <virtio-comment@lists.linux.dev>; Wed, 08 Oct 2025 07:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759935560; x=1760540360; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0LinBB0Ez/wbDOWrOvWylBwNtaMi2FygR8BagNkfl/A=;
        b=RRb6AZ1Li3zKHz9bmhVUu23CALaHIPnpTpB0IMt0CmPUhwWp2d83b+r8Aavw0BLmTN
         C78iDbgtDuwqPgNXaRQfbYncvgjIHSEVYwSpqlwDjy43GV1gmVTsz0rhEA/ZpFIwRT4r
         mcmlW1AYobIlrIKsuQuFoD+gmS8W15dFyFnQc/xPg1WDRFbuvtGo8Da9M0csSWnX19qp
         TCe7mA0zQXXOtZH6UxwTi3HgGo2oqM4PMTdb5Wz3k1AJ1/DP5Jw1KqEZcHv90tX/em1g
         a5cmhlFcmiXCGRz4ZG/6TOo1aGz82c/So0PvOcQ1hcup/DMPT9KSN2tk4HpPxADfJieO
         YKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759935560; x=1760540360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LinBB0Ez/wbDOWrOvWylBwNtaMi2FygR8BagNkfl/A=;
        b=bSma/1T6H2+PgJRDwdqtJfPsD8D2Wj/Jy3Z2tj7maulJKtwlhjCe85g6dAb6yoOnpe
         JiV6Pm0LBUMTxMDbBRWTjY4b9B9t4bPH6XwEMzSLBD4BF//sKYcf8pQPG4Ppwh38IuPC
         hTBK7kSI6qhDRvrMllWIiIMGlfdci/lCGOETxOHHss4okaDMlgcdFKzqRpSO7jBFKQUA
         Bi3xJ93DwoyFcmAoVdt9+UGg4N8iEsdgCMIFF3XVxo/Y+YhiIL+JKgniV+9P9goA436a
         O6A7oVQ6Vj1JVUIItuwRwaBf42iMptTUIaCc0O2zGn+N6cqT9v94G3+vw+AduENWYd+d
         l3sw==
X-Gm-Message-State: AOJu0YyMZhbYpqPLWU97fbE/0x4sVYqoxbhXq2Xvy1OmH7cNrjHVq0B5
	daAIwJ/4wfpZYXdQmhZwtXe7aTgpbPizp95FrrsM54AeIG8ZYH3kwfSnwlDDOAiunOXNqJpQ5Cz
	pCmPu
X-Gm-Gg: ASbGnct7NrotsdR/MAAPSeSeQMJSwDC9A7U1Vwaz/IEjmQU7laCmFrkBZb0O2MA+Knz
	HXCkJ7E7R0FYH5PLbV+RrbwnXxgho6GgUVbzEAPFKRAXs+rLZh4T0u87OIDfhNZDx/Lv61a1E1X
	k8vE4q+os1yZl/UJYZ3l1u0iQ2wm/qWEOQXHexB6vV9vAmw8uRqlfeAoJP5dSN3dcxNlcmcIBpi
	zJqOOG/bX2JnrO1mmgaYpj79mfKEdtTqoN/LQ5gYQ0znbRgP6qPf5uHoQ1QnKxomC5Psxwy5spA
	vnH2GGBeAmbDj10hrAC9+iUiLDBoDcmqxhKg6A+ta6e4fMkouXreLB6O5c09N4YJC+N0qeNOcJ6
	waP+fZzrIChdl0mznGlAqUWW+CafFHmPup0vavdKA3Gr7cF5gT8o=
X-Google-Smtp-Source: AGHT+IEe3ysMFOgKI9zA0zNS/HaBQgxA0pFToAnVjW1NP7qTDbZFDgL1kbP0GTLnuTTic+4f1Kk7Cg==
X-Received: by 2002:a05:600c:3e08:b0:45f:2bc1:22d0 with SMTP id 5b1f17b1804b1-46fa9b144b2mr25348035e9.33.1759935559633;
        Wed, 08 Oct 2025 07:59:19 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46faf185c7esm2907565e9.19.2025.10.08.07.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:59:18 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 09E825F83B;
	Wed, 08 Oct 2025 15:59:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/9] QoL tweaks and github action
Date: Wed,  8 Oct 2025 15:59:07 +0100
Message-ID: <20251008145916.2626143-1-alex.bennee@linaro.org>
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

Alex.

Alex Bennée (9):
  LICENSE.md: convert html to proper MarkDown
  REVISION: update to 1.4-wd01
  .gitpublish: update base to current working branch
  virtio-html.tex: sort package list
  specvars.tex: properly wrap arguments to \urldef
  virtio-html.cfg: implement workaround for htlatex regression
  make-setup-generated: optionally add GIT metadata
  Makefile: add some simple make automations
  .github: add a runner to build the latest draft

 .github/workflows/deploy.yaml | 37 +++++++++++++++++++++++++++++++++++
 .github/workflows/test.yml    | 15 ++++++++++++++
 .gitpublish                   |  2 +-
 LICENSE.md                    |  9 ++++-----
 Makefile                      | 33 +++++++++++++++++++++++++++++++
 REVISION                      |  2 +-
 make-setup-generated.sh       | 32 ++++++++++++++++++++++++++----
 makeall.sh                    |  4 ++--
 makehtml.sh                   |  2 +-
 makepdf.sh                    |  2 +-
 specvars.tex                  | 14 ++++++-------
 virtio-html.cfg               |  3 ++-
 virtio-html.tex               | 30 ++++++++++++++--------------
 13 files changed, 147 insertions(+), 38 deletions(-)
 create mode 100644 .github/workflows/deploy.yaml
 create mode 100644 .github/workflows/test.yml
 create mode 100644 Makefile

-- 
2.47.3

