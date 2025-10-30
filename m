Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1B93595D
	for <virtio-comment@lists.linux.dev>; Thu, 30 Oct 2025 07:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761808272; cv=none; b=QzMX4j9D1LM5BC5ES0mRbleNeGXFuA31JNUvGXdZb8EM3A5G1UBzrka9US0zV+jG3+0RaBInrczvDK+t7eWGpF2uth7Vo15rPlsL/pyBmt25W+JOh0+6vAIPyDdQT+POV/tXD2WjlI3yBlT2IzGin+6b3r2OTHh80a78FRomZ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761808272; c=relaxed/simple;
	bh=09Mjs7WhtTted9UMsNib8vFROJkBMmw53yLv3AWE4sM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jG1PK0A0sgZytXO9OWxDYs/s+6f9S0cm9NVk1lFQHjB9e+4z6rcMFcV5vI3Hl6+HOTbjrHQhrKLwqJZZq3jZBR9QK12v1Lo+PXseeK4SJHYFUCeouEKb5xWlV9krv2f6CGdUqyaio5TKkv8P3zQ+fNClbQmJJO+lAHZ+RMU32c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V0oOtW2l; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V0oOtW2l"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-63c1a0d6315so1380276a12.1
        for <virtio-comment@lists.linux.dev>; Thu, 30 Oct 2025 00:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761808267; x=1762413067; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwgnhxUrvD0gh8Ipu8c1dKtMztJtuKZg6BYonBInMRc=;
        b=V0oOtW2lTbaQRV/y5BzjrDJDdueHqn4hCPwPSQD/nOLj2TUWAMRn5cPwYSLplMn0CL
         JXrdGRQUhRQUQky/rUoKP1XcsnKjUzppJB5obfHoBw3NI4LUo2vqw6xBNuKv698CKtwZ
         ljgeYcZ4BM7bVfVseWDxPorHm8EDInPP/AuluYokdnP2o9oYyTuy9H0MEb4Qtc2W6Ilj
         bncvIAjdw06GhgxkgsFRJCdzeQjnxm0GVhEjG2BopXyr8fdzzCQy+XX/t3VOTdNqnQ5U
         71JyJQ9TlLIzBYMHXf8C9BxTRU2e9sF9LTiHXfWw7X+ap0TM75w5GhXMN0tNGOpIopBI
         NEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761808267; x=1762413067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwgnhxUrvD0gh8Ipu8c1dKtMztJtuKZg6BYonBInMRc=;
        b=gHXdN9NeS5/wI3gOK4UTRbT+RcsmMtfLI/0K0smWVdf7hryr0uELVTQLquSmyk7KhO
         VdBT2T8y6CDD81QuDxFJZnKXj3zy6bGhCuNsicyvYmWcD9WLM3p3T9oNt4RAkUv6NgAy
         wbVWf58InATMk7Ll/mss9OVu/8Ymjfm1kjPypLVXcVKLKjVPUh0ebK5hcsZiYHrl/EFx
         ZcLwe3mU+lczV5igckBE3V2YaBmcjbDpgZoPh1UlfVVYvZDEukuhI7oGX9rD7PPO5Teb
         RGaZN95nV7HsNYA6iIvPXH3cEJ+pvvy+TMdvgNdxD54UBsvTs980AtRZEsSknzJwO4gB
         iYUA==
X-Gm-Message-State: AOJu0Yy5ZaqAKETzis/oG/m9WoAwMEbEaNlHhCJ2masloNlxmMF5qNUb
	nYHC+2SXAOhyA/HLyPXEoIRgF3W/CgwPrtUZeddXA0JpRmOEO58weO/T3b9k4Wzj8bVDJxKy3o8
	Limtis1GdA1tbAZ2HUfS1mWxq/cGyebQhEuzb4NloLD4Zuq9ycDq7gS4=
X-Gm-Gg: ASbGnct1M7oHHjsntC+PaVNZzKJNQNmnziR+U8nW6WcUDM5X7ZXa3eYjK6B+I23t9yH
	ZyH7y2zAXsyLk0UEi0AkbpEt9Psle9QwJlna1WB6D1d5LlGiJT4V6VDAFgn0dPBulHZ1wLZRZdq
	5sMFCVFVzTZo2RSfj8glyr+niWScKEYxZgcyJJj4qHXhQ90/m374Hh/I6DhYJyDYonyr+4Dl1ro
	hUHHNql8FoEvgUa5boIrjS23Q1SYrr5tOo+ws3JP3BaK81uVVvKA3kxGydx0Pol+E0cORcXm/63
	Zw2PNg==
X-Google-Smtp-Source: AGHT+IGJZ/CgWDw10EQquGpjGgV6trnLnvEd8fPe7NmZN4JZGkYn04iYxoAcznmqVe7P3gLGpjj/xNjmVOcT+tooCVc=
X-Received: by 2002:a05:6402:4316:b0:63e:b49:c9c3 with SMTP id
 4fb4d7f45d1cf-64044279e25mr4301149a12.31.1761808267300; Thu, 30 Oct 2025
 00:11:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251010112010.3880438-1-alex.bennee@linaro.org> <20251010112010.3880438-2-alex.bennee@linaro.org>
In-Reply-To: <20251010112010.3880438-2-alex.bennee@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 30 Oct 2025 09:10:41 +0200
X-Gm-Features: AWmQ_bk4QWOIJEp3pUGGQqC45uiHkZIq5B3Mdao2P0vItDO0jUXVuFXOuLM5oLE
Message-ID: <CAAjaMXa8dFNR2ds9uvF0P-ZJnYpYOOdxh4GNZ3yCbKM3PsA7sA@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] LICENSE.md: convert html to proper MarkDown
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.linux.dev, Robin Cover <robin@oasis-open.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 2:20=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> There is no point embedding HTML inside the markdown document. It just
> makes it messy to edit. The boilerplate text is maintained.
>
> Cc: Robin Cover <robin@oasis-open.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-ID: <20251008145916.2626143-2-alex.bennee@linaro.org>
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

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
