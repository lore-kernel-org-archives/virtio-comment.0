Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144343328E5
	for <virtio-comment@lists.linux.dev>; Thu, 30 Oct 2025 07:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761808344; cv=none; b=t9g1Sa8NHqeeX+Wcqb9hz0F9ySk/hdYeFCSk/W1ys6SnYssjNie5ddj8mDKyExfaGaTLWuEj/GcUluF9xPCytx+mRN5Zh6OdeqdKQKZc9XI4Q0iFdVU8fO8hDOGmm3XTB1VY6ibOFMt5RiqejvzEtmjQS2D+fPKm4XyMsV4P4K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761808344; c=relaxed/simple;
	bh=a8erBxMNK9N+cocKCABjAmdPFTs+N4WW2atSm+9UL3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9g8BSgYZhWfdUn0JiV9C+ULFwaJ6N0n3281htZ3bzjvdR4E/HQ1bmyQZqY3p8VZNsKn8xFpDwZj5f5Clet1Wcy7JRkzoYzyYqwIswymYzXpWWvt0lQ6UFK3wWLbgKHskMAFdPdzKpccZFPWE2lPE6NLjeYAwN0jbhsVxRTadu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ALmiwuht; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ALmiwuht"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3e9d633b78so181459266b.1
        for <virtio-comment@lists.linux.dev>; Thu, 30 Oct 2025 00:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761808340; x=1762413140; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ4gyahA0CSjSo4kV1svIcraU0yKYDfLVw0mlfMcZ24=;
        b=ALmiwuhtQhOXp5JrxTBbP05nWYVgbck81GW+PFdmXqtowfD+/NeaJIHYavRH9qis5K
         NbbAHCpDlc8lrzGGU6Y8WjyGKFiDlgmSpw753qSdHE6ZadX2PWJvXsVaLRuprAbX8nUE
         WZa8bvQngoCv4zt/QjHVV9h35h9QwGnCoYeDfw5YuVLq0FWHNUNdCAlfXk6py1pEf2i4
         TKl3UG74FeTje2qKPi2YG3KZWcASDFoxE4TWYr274roDEgTmJ5RU1oI/t6gzDt+KXWl5
         sALWthigaA0SREJn7f5E0vHyddzo3s7PDf1AhXK+L/xVLLOWK4nPKqcQyAB6iAq1uatu
         ZiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761808340; x=1762413140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZ4gyahA0CSjSo4kV1svIcraU0yKYDfLVw0mlfMcZ24=;
        b=ZCt/J1bmKyOnh2icyVOQSoW6wmN4vZnLNdDr5OCPZqWI/J5wABzUIA5Lq2z7blbUXN
         YasJApVIMI3ZtvT5X/2t4r5gSucuVa5kXojWU4oXt/Xvcttcf8l0Lb45IujO0bFeggk0
         xoNW69FYkB5vtkUo1HoFdARYKwHiCdTn5QMMeF0ic43A/SIFVbjPKjpFnePFhihZuoCv
         3O36HqXiIYQPWQdOyHOfh079v6f6q2o/L+UNYEIVQd+dWrmEqVDPkmrAy7mGJS6/69XD
         SlneE4CJna6kTawFIxrACTfKUiB7L/OG+/mWx0lc4d/jn9Rt/rVkymA/HuE2Bu/0TiyX
         PU8Q==
X-Gm-Message-State: AOJu0YwQ3eM9kSzFNgALdmTT2mnwnJQ2jTywVtXX92Ggr3rfcakAzdj5
	cCbxR8D19l9x137GACRUY0gb+IGc6MhTicI2PFOdyA8tpVyjLcPbF2B6jsrtC/JCpj1t5DG993z
	UiLM1e/zDcIVk3vLoL+BPF95xkMBV4y/ykLQQ/ptcbQ==
X-Gm-Gg: ASbGncuwCTzCXWgAmAErQa6K52pF3Zk71rdkXeN+jUEb/KypsMTI6RerGTeZwQ1VxCe
	ScwJZ4nt4ir+GEKfcxbFpU1a4dG01vG/XoSGL3BDI2FSOZcvbLjqLRH+Inisrj6zHa5Hq5d1DP+
	ZldgtYfp84gIsSyzkr5YJxYDKyyqxQ9mC5igox0bDEIxFVft8V2MT5jcRQr+oXTvQHU9GzMlQWi
	b6mi7AOGjum3XTHLiJmocMYB+2wcAjmMq4oMSNo2ZJAsLaus2AgZY7B5I2g
X-Google-Smtp-Source: AGHT+IEwHgyV0vzF5SsIqDrjVxjCPm7uHnaPS6Gk1chga1geKU7OQjjpxELvhi11r7uWn+iRqEV/1NW9CkXHeeGiXO0=
X-Received: by 2002:a17:906:c14c:b0:b61:e088:b560 with SMTP id
 a640c23a62f3a-b7051f28045mr257526866b.4.1761808339658; Thu, 30 Oct 2025
 00:12:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251010162858.4107388-1-alex.bennee@linaro.org> <20251010162858.4107388-2-alex.bennee@linaro.org>
In-Reply-To: <20251010162858.4107388-2-alex.bennee@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 30 Oct 2025 09:11:53 +0200
X-Gm-Features: AWmQ_bl_pKkGkLJe1Arl_KW64Wn-9nTfBSiBrgwK0Llea9ztDkcvwM9p8BzcrpQ
Message-ID: <CAAjaMXZLhdjC5q3KpREyc4sCDAXPZ2ryb2Kkt35_u6vF09DU-w@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] LICENSE.md: convert html to proper MarkDown
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.linux.dev, Robin Cover <robin@oasis-open.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 7:29=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> There is no point embedding HTML inside the markdown document. It just
> makes it messy to edit. The boilerplate text is maintained.
>
> Cc: Robin Cover <robin@oasis-open.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  LICENSE.md | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/LICENSE.md b/LICENSE.md
> index ef558ec..8078023 100644
> --- a/LICENSE.md
> +++ b/LICENSE.md
> @@ -1,7 +1,5 @@
> -<div>
> -<h2>License Terms</h2>
> +## License Terms
>
> -<p>Content in this GitHub code repository has been <a href=3D"https://ww=
w.oasis-open.org/policies-guidelines/ipr#def-contribution">contributed</a> =
by OASIS TC Members, and is governed by the OASIS policies, including the <=
a href=3D"https://www.oasis-open.org/policies-guidelines/ipr">Intellectual =
Property Rights (IPR) Policy</a>, the <a href=3D"https://www.oasis-open.org=
/policies-guidelines/tc-process">Technical Committee (TC) Process</a>, <a h=
ref=3D"https://www.oasis-open.org/policies-guidelines/bylaws">Bylaws</a>, a=
nd the Technical Committee's choice of <a href=3D"https://www.oasis-open.or=
g/policies-guidelines/ipr#def-ipr-mode">IPR Mode</a> (<i>viz</i>, <a href=
=3D"https://www.oasis-open.org/policies-guidelines/ipr#Non-Assertion-Mode">=
Non-Assertion Mode</a>), including any applicable <a href=3D"https://www.oa=
sis-open.org/committees/virtio/ipr.php">declarations</a>. Feedback from non=
-TC members, if any, is governed by the terms of the <a href=3D"https://www=
.oasis-open.org/policies-guidelines/ipr#appendixa">OASIS Feedback License</=
a>.</p>
> +Content in this GitHub code repository has been [contributed](https://ww=
w.oasis-open.org/policies-guidelines/ipr#def-contribution) by OASIS TC Memb=
ers, and is governed by the OASIS policies, including the [Intellectual Pro=
perty Rights (IPR) Policy](https://www.oasis-open.org/policies-guidelines/i=
pr), the [Technical Committee (TC) Process](https://www.oasis-open.org/poli=
cies-guidelines/tc-process), [Bylaws](https://www.oasis-open.org/policies-g=
uidelines/bylaws), and the Technical Committee's choice of [IPR Mode](https=
://www.oasis-open.org/policies-guidelines/ipr#def-ipr-mode) (_viz_, [Non-As=
sertion Mode](https://www.oasis-open.org/policies-guidelines/ipr#Non-Assert=
ion-Mode)), including any applicable [declarations](https://www.oasis-open.=
org/committees/virtio/ipr.php). Feedback from non-TC members, if any, is go=
verned by the terms of the [OASIS Feedback License](https://www.oasis-open.=
org/policies-guidelines/ipr#appendixa).
>
> -<p>Description of this repository is presented in the <a href=3D"https:/=
/github.com/oasis-tcs/virtio-spec/blob/master/README.md">README</a> file, a=
nd guidelines for contribution/participation are given in the <a href=3D"ht=
tps://github.com/oasis-tcs/virtio-spec/blob/master/CONTRIBUTING.md">CONTRIB=
UTING</a> file.</p>
> -</div>
> +Description of this repository is presented in the [README](https://gith=
ub.com/oasis-tcs/virtio-spec/blob/master/README.md) file, and guidelines fo=
r contribution/participation are given in the [CONTRIBUTING](https://github=
.com/oasis-tcs/virtio-spec/blob/master/CONTRIBUTING.md) file.
> --
> 2.47.3
>
>

(Accidentally also replied to the v2 of this patch)

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
