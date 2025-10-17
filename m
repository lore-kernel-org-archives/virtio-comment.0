Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07D82F690B
	for <virtio-comment@lists.linux.dev>; Fri, 17 Oct 2025 14:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760710247; cv=none; b=kTcFPeOm0vvdw28t4AIo0U/3QLx5m+HEB1/vK/Qv0riD2mgPx0wK8QNA3ORjYUQ5tBAvoq1/dLo14AgAzIr8yw/fZGOId6Hfi9szkz2eB3vPV4OKv3iBORVhixrDr0P/4CDI2KlP0pftXeQznFkIj24DHjbHqIjmfWr7/RRY99E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760710247; c=relaxed/simple;
	bh=w2Y32OaFC6gF6GobT4BixM4qnFoBEJ+wD1Dr22ZOKgk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bSp6caN+YWIMUvBzPze8sQZF8kXQNoLD/hEHWy467gLc3HgbCt5Obifyt53DpWlXTz3IyAegsnn1j04JvBSrsM3ArBfPZpiTv6txMr9BAS7NB9VVVrZja5jf+t+6E7AOGLQlJCodb1bBrisU77Z6rMMQvclj/9lfJSO9qCVqWdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k4vwWPZg; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k4vwWPZg"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b5a8184144dso299156666b.1
        for <virtio-comment@lists.linux.dev>; Fri, 17 Oct 2025 07:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760710244; x=1761315044; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3jCXWlAPgQLnXlFElXGKECvnnY1zNgmY9zpGuq84+g=;
        b=k4vwWPZg7dSgoTRxY2QvLgHkt0MYaOlr01qjogOpjV4dnxBkRxC6jCRy1lFja/r9uZ
         WYcBCzZdIMDq8ZgBYPYQMt9/sjHjE6hgW7Gy0dj1FRZfzJzvbEBqMyysbES51l7guCvF
         ZIN5ozRpgFznOTCd18bMQg1H0MKbD9nUIMwPX+YkvMj+HTqltvj4gu2SDCIUWnKFy8Wn
         LV7rz1DbbXdQ+fFVJV+1rywFDNigseEB8OIzSSAay9pO0eD5+BUzeLI5mKpJv2iJn1NL
         KlkkTHv2JKRTv5oZaajgect6c85l538gh2FN8A7RL2IZ+U4cjCa7osgM6oDqGBkBXd94
         M/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760710244; x=1761315044;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s3jCXWlAPgQLnXlFElXGKECvnnY1zNgmY9zpGuq84+g=;
        b=NeS3cbg7P1BSR35np1p5eVoFNjgMoU95T0ub8oPlUseuNY/byG2otry2ovXXJfpQ87
         WFfXmZDoOH7xFHz9jy03xLWy64VovRnGEfvl3XQGXmNnBw9y5FBCfSliDrzPF90I+KCQ
         u8rceZ9DtdbT8RAxNnDtNHfUUO3kz87iUpqc9R1uOja/HFXe/WA8kfzD8qTlHzMniyzY
         5+PXO92aC3v8QwaUeWm02gZ6L+ar5wvLB90egjq7WZZWZ3HZT+qjqnbK+/9QCpqX64LV
         L5Pi33KAtYrjs7nx4EKZj/2AJnj3glCw2CWjIMnLhB1jxLHsXAF2FKlRy+T068ExdnXx
         6I3Q==
X-Gm-Message-State: AOJu0Yz0mpbbwiv5pKiyQa2tM3zDysq8HvwlwV8Pyeolr0z3PULefguw
	B4MueUWXSg9ptPchi8GZizIlvNOzyPEOLuNR3ril5Fdnq8rx1dmHVEU3UCsl3K2lF1b9UaeUWJE
	mOjizVHs=
X-Gm-Gg: ASbGnctBkWcfb6v9xuNSW4kRrPyB0dQ4emstTCs/LkagZVvA/tWlQdXzDFoie+oxwQg
	Wxkn/wV/FpD8i37TUlqUxqEsqBkN5BfoPA2OyXaw5rE3szJTsgCR4BRyRYHiyAqb985o+1e02mE
	/H++9aKj8F6MZJA7qNhPCSk6PO0Mo2KR0FOJEbUsns5ddck/viPUcFTkn2erd2IveK5JAjaS3WZ
	EgNKJOG6xsTjW0Efvhku/pG9uEmn2K11INk6PtMUOIKSf1BTyKMi+w72Pbx1wJtK8/npbXp3YzH
	CQZf0DFSopzYh8G6+bqu7D0B76aFIFk/4w4M9gq18u6hFtBadPMHVat2jWwqOu45K5HBtacsYpR
	guDA8Z+bWL6pxi1rdEn/0drsJ3ACxN+/f9F1emIezZGbb2QYbOZ85AhZuEzeCBL4xbY3pAEKkoT
	EidFqx3w7q0jZuw6pcpPdHaw==
X-Google-Smtp-Source: AGHT+IHJ0RBgUbi0iV4afZjhkpZ7XjCMJ7A64MTuKda7cmDWW7AgHH3ADzjbibZLBJm6OmvAxcGdQw==
X-Received: by 2002:a17:907:3ea6:b0:b50:34b6:621e with SMTP id a640c23a62f3a-b646fe86339mr443324366b.0.1760710243511;
        Fri, 17 Oct 2025 07:10:43 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cb965d24asm827225466b.10.2025.10.17.07.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 07:10:42 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D08555F81E;
	Fri, 17 Oct 2025 15:10:41 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 00/11] QoL tweaks and github action
In-Reply-To: <20251010162858.4107388-1-alex.bennee@linaro.org> ("Alex
	=?utf-8?Q?Benn=C3=A9e=22's?= message of "Fri, 10 Oct 2025 17:28:47 +0100")
References: <20251010162858.4107388-1-alex.bennee@linaro.org>
User-Agent: mu4e 1.12.14-dev1; emacs 30.1
Date: Fri, 17 Oct 2025 15:10:41 +0100
Message-ID: <87ikgdippa.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

Gentle ping.

Michael are you happy with the marking of the draft now?

> Some of these patches I've posted before. Along with general
> quality of life tweaks to the build scripts we also introduce a github
> workflow to build and publish the current working draft of the spec.
>
> I also fixed a build regression with htlatex which became apparent
> when I upgraded to Debian Trixie with a newer htlatex build.
>
> v3
>   - make unofficial version clearer
>   - tweak the make targets for clarity
>   - update commit messages
>
> v2
>
>   - added README.md cleanup
>   - applied r-b tags
>
> The following still need review:
>
>   .github: add a runner to build the latest draft
>   make-setup-generated: optionally add GIT metadata
>   virtio-html.cfg: implement workaround for htlatex regression
>   specvars.tex: properly wrap arguments to \urldef
>   README.md: convert embedded html to proper MarkDown
>   LICENSE.md: convert html to proper MarkDown
>
> Alex.
>
> Alex Benn=C3=A9e (11):
>   LICENSE.md: convert html to proper MarkDown
>   README.md: convert embedded html to proper MarkDown
>   REVISION: update to 1.4-wd01
>   .gitpublish: update base to current working branch
>   .b4-config: add project defaults
>   virtio-html.tex: sort package list
>   specvars.tex: properly wrap arguments to \urldef
>   virtio-html.cfg: implement workaround for htlatex regression
>   make-setup-generated: optionally add GIT metadata
>   Makefile: add some simple make automations
>   .github: add a runner to build the latest draft
>
>  .b4-config                    |   9 +
>  .github/workflows/deploy.yaml |  37 ++++
>  .github/workflows/test.yml    |  15 ++
>  .gitpublish                   |   2 +-
>  LICENSE.md                    |   8 +-
>  Makefile                      |  34 +++
>  README.md                     | 387 +++++++++++++---------------------
>  REVISION                      |   2 +-
>  make-setup-generated.sh       |  96 +++++----
>  makeall.sh                    |   4 +-
>  makehtml.sh                   |   2 +-
>  makepdf.sh                    |   2 +-
>  specvars.tex                  |  14 +-
>  virtio-html.cfg               |   3 +-
>  virtio-html.tex               |  30 +--
>  15 files changed, 339 insertions(+), 306 deletions(-)
>  create mode 100644 .b4-config
>  create mode 100644 .github/workflows/deploy.yaml
>  create mode 100644 .github/workflows/test.yml
>  create mode 100644 Makefile

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
