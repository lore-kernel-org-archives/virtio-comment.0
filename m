Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD301AF4D5
	for <virtio-comment@lists.linux.dev>; Wed,  4 Mar 2026 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630478; cv=none; b=sWHaEMWJBZB4joZnaQJbE8emi36aEMkT8c/ou3Ny8+F9Ax9HvXlLxQUNTbRzjkU6v/UwV6G1r/bvAjQC33DfWh/jZL3xb3KXuF7Y9l9B8qw2QZ37gS8L/hPy1vYFTbEJVRG8d7DENGFDlCRMTHzZLG2ODP2bqMlJ00HuzKPfaYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630478; c=relaxed/simple;
	bh=+MI3w0lt7lt+W85fO5qjCNbGPElfQgtuPsJEie7NKc8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=e/m0qYn8v9Un8RwcToRGMjBOEdBOHSGVtnFshNjUzYKMopoVpNUYBaIZAcdwFuE8XqjB279+xyhugSOh7IFjOh6aoLVk3oSsWXMwolfIAO7LUZmC9wNFFNbm/bVNwVBEBGRcd+uxXk+xN1abfEW4ADxZ+j3p2A7gyS8cvoPRRUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BIiRwXhg; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BIiRwXhg"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9361c771e9so1097544766b.3
        for <virtio-comment@lists.linux.dev>; Wed, 04 Mar 2026 05:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772630475; x=1773235275; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MI3w0lt7lt+W85fO5qjCNbGPElfQgtuPsJEie7NKc8=;
        b=BIiRwXhgs1nMC1mlnAkYdoAOkJwryTVcT9IwKKCfSV2mNs15HEhB5ienuSNfof6zKH
         MQ55BM25E+ByE60lmtzOrRyddFgNOZELPFjwjUesyhW6QUUG553MgqIr+VrW2Zk6KZn+
         54G4v24YHFFB3s+8+h9BxPWMMRJAkH6nrOPhMAjUJ7j7bu+YJ0Sa79LPgiB/g7A7mObp
         MGtDBW+HoCZGmDxbWw0SHdFSFBg9A+nvEzn9MsROHhlrG/xmwN2Sot4BVLnndacScsSi
         xC+5RWRhIoHt0CuwZw6nXwlhgbs2zrjzIntYv+cBbCtcmAkGrS7nYqmFU7K2CKiuk07w
         Qfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772630475; x=1773235275;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+MI3w0lt7lt+W85fO5qjCNbGPElfQgtuPsJEie7NKc8=;
        b=wu0q4qNQ5KFTlREtyVhU7iURb3/tZrRGSpEAZy+UCcwOnN6KCYz+sCbzLpvtuXTEst
         kAFBeTGI3LbpLgTX0KxstZSVGyKa+zXNOF7RLk73VhltQnOkf1L1Ja1jYbzOqI1V/SZ4
         SMMJHMiuZe5OtXrJha0IAtAQoAn2l4zLgdK21nbCFbzK9Cd1iov8QA7v48M9qqecHio9
         rpEVSj9sOpJe9G5o8Q7UANVVSnN0WDp92L9Xu/ZrWHG2fRX7N9YmFqTGJ21uPnIuoxXS
         9kp27Uuol/df3tOdndwMk+InSJoyvkNBnmBZDJoYaWhSfYrA0KEqgdgXt+gGRAUWp5r4
         o21Q==
X-Gm-Message-State: AOJu0YzZXDld68mLNVhk9WDN0JrRI04AVv9JU+S9IzScSR9Qow++4Gg7
	kud1dHXODvEmSwsDCbAl8RVLOzWFr5dBvCZ72sYqh1dENukKDAeUMhT6dqUE1F8Eg6XNkc1647t
	hLoFK
X-Gm-Gg: ATEYQzwiTseE9IWwLzg8U6aQoSDGLPYL+nycF/XFTQmQK6X2cM0xrwlTmdcyQMcernw
	AYOyOtrwg2qkuXbXtFyflVqVjnJ13X5bZktHUGa9Kx+6df6D5KLgdpM/RgZTvY4yGrcNuBWerxB
	ZrfLL2ZFPMCWircQiDBtnZx8rLC86BoOrA8bLchK03dnhULYh6vl0+QZ3vRrwIEDXiOla6C4X3a
	DeMgmpK1HThF59YIu7I1Ks9P47Haal1G03Q7mW2OgjH8s2heA9t9qIvrUUjwQDK8MEm2TpAzO1w
	nXbGpUIYwvyz3GqKoOre1ARrfS2g7tQeGefXas0lyiRjeD17stRwuGP9Ze6ESbKQrF9H6Gecpiw
	rfn0qSVWPEKu5r+uiQTdeCRqeurcDazqNhtOV5rVnyMVlBWv4STrskcdyB/tKaNvT8DigDyWn4j
	4UaueAQcHaUjANXC/MG1Yfu8s=
X-Received: by 2002:a17:906:6a16:b0:b93:5f43:ccbc with SMTP id a640c23a62f3a-b93f158e542mr102685066b.53.1772630474895;
        Wed, 04 Mar 2026 05:21:14 -0800 (PST)
Received: from draig.lan ([185.124.0.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935afe7d28sm720839766b.67.2026.03.04.05.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:21:13 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 34A105F7F5;
	Wed, 04 Mar 2026 13:21:13 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH] gpu: add missing controlq (3d) struct listings
In-Reply-To: <20260304-virtio-gpu-missing-structs-v1-1-654218322e6a@linaro.org>
	(Manos Pitsidianakis's message of "Wed, 04 Mar 2026 09:41:17 +0200")
References: <20260304-virtio-gpu-missing-structs-v1-1-654218322e6a@linaro.org>
User-Agent: mu4e 1.14.0-pre2; emacs 30.1
Date: Wed, 04 Mar 2026 13:21:13 +0000
Message-ID: <87h5qvpw6u.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:

> Lifted from include/uapi/linux/virtio_gpu.h with adjustments.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/239
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
