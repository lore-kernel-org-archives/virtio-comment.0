Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5055B2FBE08
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 16:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760113744; cv=none; b=L46rSi7I32UFEm7fqQQZ3cqhhp008v6aropol0EngGB60mUslhYIBkFL7n33oDxQOQAg703bek5VrkGxGRLEJ/3as8fLTGL9XainjKdpCDAOZhuA7mggoRRXr8UqR2taK1IIryrPQQ0NFPWktHcAwluY6phL1yuVls7br++owww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760113744; c=relaxed/simple;
	bh=W30feZ6ADX8rFQuiVI2Yz+C5U7L/XCNK83yso7cwSfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y9J5mC/YZB+EMu3LJgpE3/shRmvqy32P0rSfTj8X6Vh2sCoq4GekvFFLK/7x4nC78qRgtbacWLYg2miRLxfVT/APZEZE4uH1ZCOFTTZO1b87Gec2ALMcLBsFufN855ULoUY14fPphoKpIGT8QAHarELhrAmOPx0HQwlftSjEj4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ipfmnpbi; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ipfmnpbi"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6394b4ff908so4334696a12.3
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 09:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760113740; x=1760718540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y2dBmIeANangwa6RI6Sg73VNzSTPRciTNtd4GYaSkoY=;
        b=ipfmnpbi5WC/ytoGL6WgYMJRYxoVH60tTaH9jmQrkHK3M7cTCbheZV7vQFfHl3JMF8
         w1EGJrN5cfr3tdM3+DFjPf7xw7OeSZwHqHGm4FbFpv/0cj+dMw7gZ/aqr2ETcvRejpA8
         jw+1xHZ2DnqF99Rk3y61B0asOPKETmnZ4n8w+J8qhzE4VRke0OZuhp9WPWTpHH6gn2bA
         j/49xfzXGRsZAdtj5fpnyC+YNxxemGO7HI19Bkvt2Wxjz3+zLVSCBpucOhaxTmn44h9V
         SP0FA+ZwQm1hWo+VW2fyh5zYH4AwvR5ginISnZl+JiBf0qyjKTuttjSeDAS+lo51t/yK
         6jiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760113740; x=1760718540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2dBmIeANangwa6RI6Sg73VNzSTPRciTNtd4GYaSkoY=;
        b=DcDg0EnkjTDDBDz3dmo4eANXWo0KwYDfbWdf+Mc8bXZ6G7GqvRRs6Zeg0W4oLWULdn
         ugt6VA7byru+e+WDjgX6iP4MlmMfjQgFqKRqbL7OggTSxu+HxyXxbEHKdIhvFuM3kFUq
         jde9QcPV/2hmJUypNvYgceFJaeSoMaVYykojXkIOVYn4fRULVprBaQskDdbG6qQ3QA7c
         SEE29ACrHEVYW/grFKE0ZMx3i4VqduEiQ6c1+seARRZle4x3sHH7l+bBZoNmRFzkYeQo
         iHzrui6dTltI3hcZ4RGUuttgabiLD4PUm3T9HvK4tgrfuwmJGMClW2bveNhS1YUCB97n
         602A==
X-Gm-Message-State: AOJu0Yx4zQy/N2XZEZk+8TeZgbqIEvAkGcSQyIaVl6YD95kikBXEFfo5
	V+gyLmVXMvOEI3sDlmXXAWUxel0Fl4PCfzm7h8qpzhNv4Na/xnyopwGtX+YRI/hdxr5ZK1PReHs
	2hB2K
X-Gm-Gg: ASbGncvQO9PcqKT6Y+2F6tV3pdyF1SpUWx52+0saj00U5JZYHNmXgGIEWXrB8BgwgIg
	F6nsL0EpW0lyqBrs8ylbOvEedUJay+yI/bDsZ+6tXGFNRULC/iOpRhBQlYRMwWr/unLAFdUGm9c
	IEKXX68LsTUaHj9xVU4u1TShxSJe5shMEtr0WUhYeHDH0q1uz4HPOLCLbiYBzdLqRFLbHO4InAq
	Ff5s38wwPYQRQs+ocDKL3bdmS1Pxala5DzGFJrUSMf1YubTpEWtALFJS9dvKQgf96d7SrBQHiC1
	66Zm9Cn0vo/k7yHoOw5+a4mUrOkB49oYj1mR8pg044KcytmbsVz24llf5Olgtl4+wYYWoqdI4WE
	zL/VxKzEFlLEUsRHN0aB0FuSK5K7tvwKyD6G1FuHl9/kUeqAbOjpaVIvT
X-Google-Smtp-Source: AGHT+IGUxK+CUMycTNNgbW4ryi6Rf6LarpDqwd/+IX6w38CAhN4iAMuCcPDLWhAWS2gIfc6uItb+EQ==
X-Received: by 2002:a17:906:730a:b0:b0b:20e5:89f6 with SMTP id a640c23a62f3a-b50ac5d07b5mr1180950966b.60.1760113739938;
        Fri, 10 Oct 2025 09:28:59 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cadb18sm272740666b.3.2025.10.10.09.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 09:28:59 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 66CDE5F811;
	Fri, 10 Oct 2025 17:28:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 00/11] QoL tweaks and github action
Date: Fri, 10 Oct 2025 17:28:47 +0100
Message-ID: <20251010162858.4107388-1-alex.bennee@linaro.org>
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
  virtio-html.cfg: implement workaround for htlatex regression
  specvars.tex: properly wrap arguments to \urldef
  README.md: convert embedded html to proper MarkDown
  LICENSE.md: convert html to proper MarkDown

Alex.

Alex Bennée (11):
  LICENSE.md: convert html to proper MarkDown
  README.md: convert embedded html to proper MarkDown
  REVISION: update to 1.4-wd01
  .gitpublish: update base to current working branch
  .b4-config: add project defaults
  virtio-html.tex: sort package list
  specvars.tex: properly wrap arguments to \urldef
  virtio-html.cfg: implement workaround for htlatex regression
  make-setup-generated: optionally add GIT metadata
  Makefile: add some simple make automations
  .github: add a runner to build the latest draft

 .b4-config                    |   9 +
 .github/workflows/deploy.yaml |  37 ++++
 .github/workflows/test.yml    |  15 ++
 .gitpublish                   |   2 +-
 LICENSE.md                    |   8 +-
 Makefile                      |  34 +++
 README.md                     | 387 +++++++++++++---------------------
 REVISION                      |   2 +-
 make-setup-generated.sh       |  96 +++++----
 makeall.sh                    |   4 +-
 makehtml.sh                   |   2 +-
 makepdf.sh                    |   2 +-
 specvars.tex                  |  14 +-
 virtio-html.cfg               |   3 +-
 virtio-html.tex               |  30 +--
 15 files changed, 339 insertions(+), 306 deletions(-)
 create mode 100644 .b4-config
 create mode 100644 .github/workflows/deploy.yaml
 create mode 100644 .github/workflows/test.yml
 create mode 100644 Makefile

-- 
2.47.3

