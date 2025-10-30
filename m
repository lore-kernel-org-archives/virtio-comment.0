Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405FBDF71
	for <virtio-comment@lists.linux.dev>; Thu, 30 Oct 2025 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761809173; cv=none; b=HsI0/4e0QxGCl3NdbZu+D2wCWhRYLotxSx/dC4D1lsArdcyD3rrZUZDR5oAeAYgphcFyzqTpUIypIB8zW9DqzjqzNThNPzHqTa7/7kyhdUSsfe7k/d3ciHfw/zb9uaKpFkkdd5j1pD6fn1aYL0uas1ImTp+8VXf4H1Z3qhsT2s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761809173; c=relaxed/simple;
	bh=EIN6QaVj0WH1iC/B5sNJIFCBFGUGEd/ewJXHtWTlISY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XUwTGynUvfXiM29pMY83/Q2Lcz9hOYiTIOu/4Wi0IFwW9VUBvUt7cHjhVf1mktbrPHrCTIlE5tTW3N/o8UY8pR3dajONPGiQlLutU6z59WFzQzVZtEjhxlD9SO94U3pycInfMRe0DQ7fuy/ltNpc3G3IUY/rvHq6azB/qw+zV8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=znf/Jb35; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="znf/Jb35"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-63c3c7d3d53so1218912a12.2
        for <virtio-comment@lists.linux.dev>; Thu, 30 Oct 2025 00:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761809169; x=1762413969; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9gYfxKREgsPzd0oB93Qbx6IYzURJhrsaRrelZrkxhw=;
        b=znf/Jb35RxyAxbMSPO4cPT+EV9qqit0uQBmCnLDwckO+Bl534c2KJLmuW48cJgM6Jf
         30QWL67WTpVDmByvBJFS2N9KNttIIM8dme0nGyJZX4VM7au6J1liajbVbzWzT+Em4/LY
         wlMD5Paj9T5uXDbrO6zDZyEHC4TMheZik1FJdBJIm3EjgvBSh0yfP1Pn5bMj8XYjqb2Z
         JbIpDyrbIBVZ9Ug/wrCZ/dGuW2lryAyLz9t0VcQ+ub8fmU+VSlGehrO+sQxCxLEx3HKP
         CuWc0fXwk+Xhro7WmLLOWUKL0Yjo6epB5gGQx3QivrLYX3BfJZR+KWINmHp79IwCTmsH
         jwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761809169; x=1762413969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9gYfxKREgsPzd0oB93Qbx6IYzURJhrsaRrelZrkxhw=;
        b=ZjYTnTmw3ytalXiXH0+P/4+TbtbGSUXDbVHY09ylWFxltblDtIq5xTOIndwz2cNsHa
         JiMsFxUCvuMUIBU4RwRxiDoYf30i3vTbPLMDr1ufHnFryyFAPUPN9zQD913nP5LTuMmy
         XHn0MWiGLyRSv8ztxDM8Nut0vs5nJjzg1l92fSRi6tZI9ZkLTJ8tguMU2hxnH8uz6+B+
         onqAfbvmjgzm80bId1ZRapK218QvW2iS8eL+zHsVu7h9W21yHXz3qsn65p+mjuRg1svc
         owBmtOOyTuSADOpiC/fvowvOzLZoY3j26kPe5up3o4RFRXxMVXpgRefNFTsTBgFuuOe5
         7iMg==
X-Gm-Message-State: AOJu0Yy1I84rWyXfO/9IDmlRf8fsKFMKRl0zUs5aTnT4R6K68DtoFIDC
	geUb3fCByp1DPeAnQ+ze5LjsTmV+lmHdQVq7SEEwlA5eUiYtYlAyAz117bC9Lxq1zxrihGzhbjw
	Ei2TX1wc12OG/4WPUJi4hZG6WM8SAhlzSMPKODMdapanD7ttr5nxTKDw=
X-Gm-Gg: ASbGncv4VCd6sL7jKl+gO6cL+Fk8bF7QVKBEnOtrWq05CQLv272TaARAkb0sVvUQ8Va
	9bVJtP9yhZasoFE8u3crI2d/4uipBfavchVdGQ+Wty1HXriT0E8ctNGVPeac6Kddd1W08t3teO5
	Sm1TraW9vhPTJ75dxP/yAXvjjPioronRAu6Y4FYDgFUmViiMeWoLrgtCrP98eho+MOu5uqyJjew
	z3ODox7kaCyCUA8/GUfbVXcjYTXuTHLlH8g7KjxZ721RczV8dXECBvqKS4a
X-Google-Smtp-Source: AGHT+IENS5Cov8ZZzX4ooiSt74y2A40OGVXWE5uEPGdTj7k4wwomETYlkJw2ASHnvdSzccqTXAdcPoKqPJNAINnOsso=
X-Received: by 2002:a05:6402:50d2:b0:640:6f9e:cca1 with SMTP id
 4fb4d7f45d1cf-6406f9ed58emr36199a12.8.1761809169451; Thu, 30 Oct 2025
 00:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251010162858.4107388-1-alex.bennee@linaro.org> <20251010162858.4107388-9-alex.bennee@linaro.org>
In-Reply-To: <20251010162858.4107388-9-alex.bennee@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 30 Oct 2025 09:25:43 +0200
X-Gm-Features: AWmQ_bm6V1g5EEb1wvbKLeciMDvyGns3K0JCsqKukffjSJ1u8kk5avKf7uVneNM
Message-ID: <CAAjaMXZuV=efU0tMpHC9+yw=W5TXCHH+HRg-REmz8fOV6WdF7w@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] virtio-html.cfg: implement workaround for
 htlatex regression
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 7:29=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> A regression in htlatex broke the building of html in new Debian
> Trixie systems. The bug has been reported upstream:
>
>   https://tug.org/pipermail/tex4ht/2025q4/003774.html
>
> and the following change is a suggested workaround until the eventual
> fix is reaches the texlive (and by implication distro) repos:
>
>   https://svn.gnu.org.ua/viewvc/tex4ht/trunk/lit/tex4ht-html4.tex?r1=3D17=
50&r2=3D1749&pathrev=3D1750
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  virtio-html.cfg | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/virtio-html.cfg b/virtio-html.cfg
> index c5b9a94..63bf9af 100644
> --- a/virtio-html.cfg
> +++ b/virtio-html.cfg
> @@ -1,4 +1,5 @@
> -\Preamble{html}
> +\Preamble{html}
> +\expandafter\providecommand\csname hline:color\endcsname{000}
>  \begin{document}
>         \ConfigureMark{chapter}{\HCode{<hr><span class=3D"titlemark">}\th=
echapter\HCode{</span>}}
>         \ConfigureMark{paragraph}{\HCode{<span class=3D"titlemark">}\thep=
aragraph\HCode{</span>}}
> --
> 2.47.3
>
>

This fixes the problem for me.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Tested-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
