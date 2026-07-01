Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D2A192D8A
	for <virtio-comment@lists.linux.dev>; Wed,  1 Jul 2026 15:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782919254; cv=none; b=fm5PuFAqDAb0Jr0Om5fo7lrQrJhTC/vgoAIO989Xhrfn3Rb2AJJSeHbXf2cwhsQuACt5kLlkTul5l6gi9pVHPcfrBM/iSktmUhTjN5G9RZIYrmEMWkQB1qmf5ZeVs1HYHSqrqH83eXLqteXsuy7FQjLgOnRsdziH3di3elLDwuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782919254; c=relaxed/simple;
	bh=o9GBXCAAoARCj11DZsn2swxPhQ0HYpA7QhOegDwtJtc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A+HVraNSxoCSMrQcoAP5WPoXYPMInJKtb8KjFwkLHX3y1chM8siAJlrGXvmEoqGE6o8O+XVJg09aWv/C+7LuILrSevh7fOusi5pQoyA6t/d730lAqmDhd8aiZZAtwqnl4+8RJ6vlTMviNzwIhGiY0LJZHkU7e112RPd+wfkh32A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o0GDF0uf; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o0GDF0uf"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-473ba028d46so775713f8f.1
        for <virtio-comment@lists.linux.dev>; Wed, 01 Jul 2026 08:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782919251; x=1783524051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9GBXCAAoARCj11DZsn2swxPhQ0HYpA7QhOegDwtJtc=;
        b=o0GDF0ufFEC9t2aAhVv1utLriJQ4sLcelVfFNnxI8pXooUmIiO9c+PvQbRDXUG3VwI
         vQ+dh0UNC6S42KrcCNui4VJNFmekBP7SiOpWQPJ+ry6TakO3EmFJO1l3loryOXU4ev3L
         nShKH6NKQ3HCdoYFC5phq9QXJZ6yCUl1vFpQV+PmFqYRI+dpAftkpv3MfAMmgP2EZwbb
         mHdjdXb/DeYw+8oqgbmiz23uet5H4Gl8ynmWdo7QYlIUfjUuLcv78JaH0Lwepcaml3Mj
         YgdVdhp2ftIelXwksMCWwVJPuz2V5OXubtnhBeomxipEEOhNJUPYApVmStWyWSDW9Gic
         Em1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782919251; x=1783524051;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o9GBXCAAoARCj11DZsn2swxPhQ0HYpA7QhOegDwtJtc=;
        b=EptyoeqSvvv1YkK0j3MFlEtwXXrxVID8ZXeAM+awZxpzm8y80zXn9gY22eRFozpvcQ
         7cg8oNWGclIpDj7lmfqpJeg2z5s7QXu7JQ4jEyGive9zB1yvgLET44NLQhJi/bs7AUgW
         GwLski5+Q+PoeCoNx4TFTPWUzbBed8T49KDDqY1xLcyVP1Lmjv1U3j/VBZBNC1EQuR3j
         3w/yY9W9d8HuIvx0cnN7tr0J9VBYi3sbQ70q36S7dtBGID144PnEyMYxpMyB3tFtNSrm
         M/z2qxpvyNE/cfuSRXDrU7FtMru8JU4+0KWFpvfuKwUTOOM71kWX0VKxSUIK2i++Or/X
         Bczg==
X-Gm-Message-State: AOJu0YxlQT6qvVw4l1uzHS2uMM1NJlX2/K5PQSc8LLfNXU3zCfjy/4zc
	Bgu+kqxBoXlIRwaPVxhwSocwdIpso3FXDmHJ7hTjHnj7mFfAq83PnGPNQY+DTMj3Te4=
X-Gm-Gg: AfdE7cnp0DZKNsFxNe9jsfSePxLa+Wrh+Km3/bblE0HBXZa+YIQnEPJUSgmiei/C5j0
	u2RAkWjsP858P+ydBCBI6LPGeJ9sDesSonoCAyihSkWAcn8fcalYDydCB0cV3hM3QtQlAmqO847
	zv3rGbkYL0AQBf1EKe8HTdnE/b1OMHU8JVgdVAAEFxCH1z827PQQ2F/djhpyAXtSeqPTwj5Cnx0
	IiG30wcGnqQzZOJhC0+9iNCgrJfCzOEOc8IUtgYVjJjygMWcxLeHDUZnQgWXr4WoPIanv/1d+Of
	QnzIOPAEZwWV0AkD/KvUMsY9Gmw5AfSZVkGn9tdzTHryqES7/QnlBb9h8CKDVM3/IpvBOeA9X6p
	Mo7g3C/07Bm4jOqd/2imeCMefD/BZHNuXT4D1GLRtJB8joy8Z2uFNOjky7FqbXh/CEqgDVXFCaL
	3hIvjm25kFAtG8VCfsafSfZI4=
X-Received: by 2002:a05:6000:4203:b0:46f:f12b:e456 with SMTP id ffacd0b85a97d-47758db8316mr3421096f8f.25.1782919250793;
        Wed, 01 Jul 2026 08:20:50 -0700 (PDT)
Received: from draig.lan ([185.124.0.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm608217f8f.9.2026.07.01.08.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 08:20:49 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id F1AB45F889;
	Wed, 01 Jul 2026 16:20:47 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: virtio-comment@lists.linux.dev,  "Edgar E . Iglesias"
 <edgar.iglesias@amd.com>,  Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>,  Viresh Kumar <viresh.kumar@linaro.org>,
  Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v2 0/6] virtio-msg transport layer
In-Reply-To: <cover.1781514628.git.bertrand.marquis@arm.com> (Bertrand
	Marquis's message of "Mon, 15 Jun 2026 11:10:22 +0200")
References: <cover.1781514628.git.bertrand.marquis@arm.com>
User-Agent: mu4e 1.14.2; emacs 30.1
Date: Wed, 01 Jul 2026 16:20:47 +0100
Message-ID: <87ldbuu46o.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Bertrand Marquis <bertrand.marquis@arm.com> writes:

> This series adds the virtio-msg transport layer.
>
> The individuals and organizations involved in this effort have had diffic=
ulty in
> using the existing virtio-transports in various situations and desire to =
add one
> more transport that performs its transport layer operations by sending and
> receiving messages.
>
> Implementations of virtio-msg will normally be done in multiple layers:
> * common / device level
> * bus level

If there are no comments how long should we leave it before requesting a vo=
te?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
