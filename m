Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D5A27A442
	for <virtio-comment@lists.linux.dev>; Thu, 30 Oct 2025 07:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761808390; cv=none; b=UHejytU261rPVarBUu6Hk7tNU+a+GvJUCMytshSj92XBlcjtI9IjIhD495uVdctSi8Y6l7lLL93JsHopfPRF28I3rh7axcNkVc8/12BCzbo2QRGzRAkW95dorX1HyAG2w0MnyKEi6QKGeTgH8QBBdka4g6djsoZtmjp1EsqMcxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761808390; c=relaxed/simple;
	bh=4eaq6UTF2Yg94zldvRWYqrZ5ECqUszTZy4+yojYhaTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q1dX1S5O5aOya5s5VpODjizBxfUuNV25Lg2NyihRBzVj1Rr2ooDJra4yQlmiLYJmT/CHeJyvO4sW+we9CqKIVhXeip2Of6Vc5k5j9q9KT3romfF9Xjw3N6qV5QlijekKMVxS1khDIqfd4eWs6ZvT9sUkNhzP89V9QjVLw0opqZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TiF42Lsv; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TiF42Lsv"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64034284521so1093491a12.1
        for <virtio-comment@lists.linux.dev>; Thu, 30 Oct 2025 00:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761808387; x=1762413187; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O03OQVZg8+1rSc7t+vtZURlt/94Kb4xGEwZi9w8BmrQ=;
        b=TiF42LsvjWWVdErc7jvDUSJnBRNfJuY3Aeddvnuhi6s+F/+Kwxw/EMzAdM8zwuldXX
         DK3/cHpkXjrxZwC+b5xGPxo7jKFPO/+TRBYar/9/CTuslKKA5XHy2n+2Xq4ETUwoYW7i
         BXPA+/2afAeuPRu4CZkKLF8USZQfsll3LtYkGoyS62CCE6Wo4M0gx2wTOhAIIgKjjESk
         3smg/PfcsLNh7YUMo0vioTm5tWpHuw916wuHIh9hcN2J+A5+eE6Ipq7KPcaGM6GYTFTP
         mjS1PZcEw8JRCC+yWqWeKDLFHfabSlHSqJ8UaF/uRLNAylVWs7igVw4+6JML1G5W7M6/
         yzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761808387; x=1762413187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O03OQVZg8+1rSc7t+vtZURlt/94Kb4xGEwZi9w8BmrQ=;
        b=DVGAQJ6mA3PiG8Vryh6VOxNKgDHR8mhGMfX9tV9YiVoOoYRH1Wt03zQ4FdZRgmqub1
         nCakjOZrNiqynH9/g0bZQK8LeLrZ35x0o0xqyLDz4w5F5Z//CNpdPjmj7U2LRXFA6MeW
         zPV3efxPKfTVC8bAuCPrXBUIlFLND92ORk2ekkC3G3CIgxgB7h2yorh8WpbvkYYRd5R7
         evX6rNp5q/vJm7FK8fy2wWZqz91ommO4L6tQVcHAXKdpgq0JoyXM0+lb2BYB0JVHcHKE
         Pe7hUTp7Fdf4/+1u35X/QsFnHUp8lm4WqqmNiPgNvM+LqMbUyicLkk9p9Hc7tNNTa0jK
         4PYQ==
X-Gm-Message-State: AOJu0YzBjNBZiQ/fWMXcn7zW2TjNDyX7FEt1jbTqjFEF4SPEIRlduDG8
	3DF+APOrU8MtrJefeACho7uDVlNkSAzgLPwrpqPf1FVuZOj6nJdfIQpqbU+gygfsWRz4oQlQ2so
	pKjV0vzjWHDTNPl+5shbLw7GBgIIhlbG3do0W+x/auQ==
X-Gm-Gg: ASbGncuFdF2YlvjW52mmtDjUv4e0vj36M2eEi0anXf1IfUqf2a9CN48WbWTCiVP8qep
	soNBnm4qRdNPaPDotWQc84kaq9NBDHv9cbaEnl64tvNCPdeSqQCk/y6Ybet4Q1mF919XCRJTLJr
	CMASQuz5qalRfxwWzAR9cWH4HYzuwKldH0KmD/Zd6PZmM4vJcMUvgRHxNPH54w0gTqmDK9W6hER
	4KHqKV8Owv7RA0qcQjWkA4864z1ezB2oEQ6fSl3hHN6Rcwu2njeOGvNKXt8
X-Google-Smtp-Source: AGHT+IGZ5Y37wAMM4soV3tmu6j6WjBKiB59wSiFlj7s+7XCdFyapBunk/rq8BORTxruhuMAhXPEJ0bgoYg8YpfgaRaI=
X-Received: by 2002:a05:6402:1d4b:b0:63c:b2:c63b with SMTP id
 4fb4d7f45d1cf-64061a2083cmr1648048a12.6.1761808386907; Thu, 30 Oct 2025
 00:13:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251010162858.4107388-1-alex.bennee@linaro.org> <20251010162858.4107388-8-alex.bennee@linaro.org>
In-Reply-To: <20251010162858.4107388-8-alex.bennee@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 30 Oct 2025 09:12:40 +0200
X-Gm-Features: AWmQ_bmssq6Y4Xr8u2c3vjpgjtNAEcnEDYYZDDUlx5xSCq5nfMeMlglQ9ZDGt0A
Message-ID: <CAAjaMXa0by5dymnrP9tCEq9bAye8qdskSPrt82A_dJ7SF-u6_g@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] specvars.tex: properly wrap arguments to \urldef
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 7:29=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> chktex reports:
>
>   Warning 1 in specvars.tex line 6: Command terminated with space.
>   \urldef \virtiourllistings\url{\virtiourlbase/listings/}
>          ^
>   ...
>
> While the space in this case is probably harmless we should be using
> non-ambiguous argument wrappers if don't want to drown linter output
> with noise.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v2
>   - mention the linter
> ---
>  specvars.tex | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/specvars.tex b/specvars.tex
> index a80557a..cf67070 100644
> --- a/specvars.tex
> +++ b/specvars.tex
> @@ -3,13 +3,13 @@
>  \newcommand{\virtiospecfile}{virtio-v\virtiorev-\virtiodraftstage\virtio=
workingdraft}
>  \newcommand{\virtiourlbase}{https://docs.oasis-open.org/virtio/virtio/v\=
virtiorev/\virtiodraftstage\virtioworkingdraft}
>  %Below must be used to make links work correctly in HTML
> -\urldef \virtiourllistings\url{\virtiourlbase/listings/}
> -\urldef \virtiourltex\url{\virtiourlbase/tex/}
> -\urldef \virtiourlpdf\url{\virtiourlbase/\virtiospecfile.pdf}
> -\urldef \virtiourlhtml\url{\virtiourlbase/\virtiospecfile.html}
> -\urldef \virtiourlh\url{\virtiourlbase/listings/virtio_queue.h}
> -\urldef \virtiourllatestpdf\url{https://docs.oasis-open.org/virtio/virti=
o/v\virtiorev/virtio-v\virtiorev.pdf}
> -\urldef \virtiourllatesthtml\url{https://docs.oasis-open.org/virtio/virt=
io/v\virtiorev/virtio-v\virtiorev.html}
> +\urldef{\virtiourllistings}\url{\virtiourlbase/listings/}
> +\urldef{\virtiourltex}\url{\virtiourlbase/tex/}
> +\urldef{\virtiourlpdf}\url{\virtiourlbase/\virtiospecfile.pdf}
> +\urldef{\virtiourlhtml}\url{\virtiourlbase/\virtiospecfile.html}
> +\urldef{\virtiourlh}\url{\virtiourlbase/listings/virtio_queue.h}
> +\urldef{\virtiourllatestpdf}\url{https://docs.oasis-open.org/virtio/virt=
io/v\virtiorev/virtio-v\virtiorev.pdf}
> +\urldef{\virtiourllatesthtml}\url{https://docs.oasis-open.org/virtio/vir=
tio/v\virtiorev/virtio-v\virtiorev.html}
>  \newcommand{\virtioworkproduct}{Standards Track Work Product}
>  \newcommand{\virtiooasiscopyright}{Copyright =C2=A9 OASIS Open 2023. All=
 Rights Reserved.}
>
> --
> 2.47.3
>
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
