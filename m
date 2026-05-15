Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0792942E016
	for <virtio-comment@lists.linux.dev>; Fri, 15 May 2026 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835760; cv=pass; b=gqxchgJjatuJ0aldnnFykuKpJ0pOdzuLaxWQHlTsGrT4oW2/E0gY2zb8PLm79gzIffa/PtKfVDnNxUdzYKS65YoIsvgybNS6z0vLUGL82iMEu6WXReVjdPR9pOEegCa30uz8jMA1T9D4OWEsw3S7QocjO9wtecidX/v8dCGiAJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835760; c=relaxed/simple;
	bh=WqpMoDhxa0ClP4+FW3hq2AYvnQ56eX86kX+jACWd9A4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hrXOmOlN5x4QzCk9j4x/1us8Avn4qVPpQVueBDMts6BFVHIOxUcr8JPCghZ7IpJgrOHoLydRlDCDPFIumhzlPvDsi1Vp7VP3rRw2F7jSnllfbLf6GwsMeVi/k6v2ADqOVG4n7T6B2WvH/PpIo9wtvNav/F86l6cqwWjueuulKxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nAUipTJx; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nAUipTJx"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so98727475e9.2
        for <virtio-comment@lists.linux.dev>; Fri, 15 May 2026 02:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778835757; cv=none;
        d=google.com; s=arc-20240605;
        b=aby9r+cK9nR4jNQfOG8+woDKqnp+X7oMl463hrZC176aUVlJJEBf3Jd25/Vjqu6Bnu
         knV4l7mjmGVJ0mIQQWXH1En8b2vWk+TVepDrqLcVxAQheS4CTkTCJSSKjlp7uW/zbFUR
         qfMzJtIOvjgndSxxZZTlErv664/MX7NlzyvQGLimLwAQIcVsmt2Uu6De8RImYOijW3UU
         eDXPb5Nyun0GWKsNUPO6T2R6KNWsullje2gK2yO5YzktbO92talngdiWWhRkMqQNaOwc
         U3ddJOPX4YQwv2HEXbXqLG0n/kYBJ9D4as3EAmbhUovQeV4L34POcx6YFcNgCQq3H/cS
         NsLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fsFg+7NNuQr7nsy8i5LCcYLlphD3eq9IFWVAOWLzA1c=;
        fh=rjBb7IxhhnsGnt8HksEH6pMEU66l46qhxJFEEALZbJk=;
        b=Um02OIV0dGaN955OLpha7aQvHyYRaHykj2VH7l2NZRPKQK4G8/U+BOrXab877iwC/f
         RyW6xHHBqeisM7DlzCWnuMxmhsaZ2O9K4/cWKMwMOzCCbi1ty0iiov8Pg4jPfwIWTRGN
         R29032H9ROg8Dnfly1P1sXPQNc1Eb72PH1P7LrvI99SLvBWaCQuIanqGv6QC1MGegxlP
         HgEVQ/tVqjbCGUiTtKkAm42SlInXXXTDo4U2oR0B7gy8NgZ4MsDFpGxBR1l4cbgg7sCX
         VFOF6eUvhcxDaOekA4oLk89SO2lqDDf4cTD76rdX1+UcQnFpJwWsPZKhrhhubl73Cr05
         hbOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778835757; x=1779440557; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsFg+7NNuQr7nsy8i5LCcYLlphD3eq9IFWVAOWLzA1c=;
        b=nAUipTJxElxQsLChAkGD14bWS+eOr1GY+hIl6JrPARJz7ugUejBYHfw9Q2arGsyZI/
         /vRWu7aZVfD6SgSbrwjDx25KHOEn4gGDCIBYuPECQNfR50NMgiNZGUUH27IN8vDrkWZ4
         FuoReJhK50koGDdnQ6mihXwx1n7Ulo9Dqx4UujEUZTjb4onAgHj4UrQy5k9SiRjfQZ82
         ayid9GNu+rwC0ULoZNfVVGzWw5UEIR7WpLgK+mgwV2CiX+pqm7QZdkt7cX4P75ef5HKj
         ed65XCNfASeoUeRpwbFBjjBhvg3AqexEF/KlZw6AjO7hJruN5CnSwq53w4VGCryq4T1i
         lcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835757; x=1779440557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fsFg+7NNuQr7nsy8i5LCcYLlphD3eq9IFWVAOWLzA1c=;
        b=f0t/40+gE22nFh+vbyo0mp5+Sk/9otXVrg7FB2f94yrlJieGo55s5vTtzX0DXJP/8v
         QtTpvTgxsUNZTzQrhpppimSzMkfXlhIuRdtakwkLoUr2RxqMgh2KXZIC8843FT9aJdTE
         9Y+rW4z07fgE6QgaaDSV8NK9Y9pJPjCuAqGNAL3Ja9wd1U0+u8UWV1v0rBYIodZAYhkX
         u221WUsWGlx6LLJ1z9FfkLpqYhWCiGWIpezc+naIyLTdO+CVb53PAeLf45m9KFXX53LC
         l6MunOdoSKAv3sWU9R6aw/bToBoWxcB/afVCzHtZlXAZ5Uh6nEMt4NjwNzIclFwco1l2
         O59w==
X-Gm-Message-State: AOJu0YxobkDAz+ADSRILQoud96r4di7+bW60fUmSepIEMxksh014cJvy
	zgfgNgHtyv+kf2GGfbivJgIhmFRm2UF8p733BzSvlGJu03Z8bohu81QtX5OCCyVrP9/0NVta5Rc
	JYZvC++GPC7jkYzWP7LDQ0FtWU3WaHbERgKyw5RVc67arbiltQEjSWVxZNg==
X-Gm-Gg: Acq92OFfuGZO6FsKhJ+Aqi7bmoDa1k6Xav8RhsF5X+J1ulScfTtu2SSN7CvqIiCk7q1
	9Am1IepMq8SKBW88LLQMvsfXVhhzex5xuJyz8QfzQZyZtKFZ2K+NsdW7MzFT+j0RtFZJtQTeaLT
	0bwBp+87DgaRmuTYdvp8SJqorojbs/F9oAhVDXKBeZhDOajPpm9yKHFRgwPLQ2eWdQ3fei7sF4K
	E9uSZeRsrsqEYLfvCXndiBAz9R9x8PwYIj5J5i0Nfi5Z9iG1h674S7/vkGNan8TT81JV7SwxZnH
	8KTt0ipK1hP6JDpkjZEEXT4NVQBNjC7OeejMGUrGq6nOq/cpvg==
X-Received: by 2002:a05:600c:3506:b0:485:40db:d40c with SMTP id
 5b1f17b1804b1-48fe60e13d1mr41758225e9.3.1778835757214; Fri, 15 May 2026
 02:02:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1778140241.git.mst@redhat.com> <80ac17abeb1f1ee51352a179f94eb3fea7731809.1778140241.git.mst@redhat.com>
In-Reply-To: <80ac17abeb1f1ee51352a179f94eb3fea7731809.1778140241.git.mst@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 12:02:08 +0300
X-Gm-Features: AVHnY4Jl8TwZM955YvZrnpuvDRkSdOsRLqP6HKobWH2Bd-anxl4oraF2i4GwyoQ
Message-ID: <CAAjaMXZw=98zx9rooogJh6nYJZ36oGpY4p5OD8Q7K27pEY6j2Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] balloon: add VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 10:52=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> Add VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED (bit 6): the device
> initializes reported pages by writing into each byte of the page.
>
> Add Feature bit requirements subsection.
> Add Data Integrity security text for DEVICE_INIT_REPORTED.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/244
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  device-types/balloon/description.tex | 60 ++++++++++++++++++++++++++--
>  1 file changed, 57 insertions(+), 3 deletions(-)
>
> diff --git a/device-types/balloon/description.tex b/device-types/balloon/=
description.tex
> index a2e4a37..fa33105 100644
> --- a/device-types/balloon/description.tex
> +++ b/device-types/balloon/description.tex
> @@ -49,6 +49,18 @@ \subsection{Feature bits}\label{sec:Device Types / Mem=
ory Balloon Device / Featu
>  \item[ VIRTIO_BALLOON_F_PAGE_REPORTING(5) ] The device has support for f=
ree
>      page reporting. A virtqueue for reporting free guest memory is prese=
nt.
>
> +\item[ VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED(6) ] The device initializes
> +    reported pages.
> +
> +\end{description}
> +
> +\subsubsection{Feature bit requirements}\label{sec:Device Types / Memory=
 Balloon Device / Feature bits / Feature bit requirements}
> +
> +Some balloon feature bits require other balloon feature bits
> +(see \ref{drivernormative:Basic Facilities of a Virtio Device / Feature =
Bits}):
> +
> +\begin{description}
> +\item[VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED] Requires VIRTIO_BALLOON_F_P=
AGE_REPORTING.
>  \end{description}
>
>  \drivernormative{\subsubsection}{Feature bits}{Device Types / Memory Bal=
loon Device / Feature bits}
> @@ -61,7 +73,8 @@ \subsection{Feature bits}\label{sec:Device Types / Memo=
ry Balloon Device / Featu
>
>  If the driver is expecting the pages to retain some initialized value,
>  it MUST NOT accept VIRTIO_BALLOON_F_PAGE_REPORTING unless it also
> -negotiates VIRTIO_BALLOON_F_PAGE_POISON.
> +negotiates VIRTIO_BALLOON_F_PAGE_POISON or
> +VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED.
>
>  \devicenormative{\subsubsection}{Feature bits}{Device Types / Memory Bal=
loon Device / Feature bits}
>  If the device offers the VIRTIO_BALLOON_F_MUST_TELL_HOST feature
> @@ -603,7 +616,8 @@ \subsubsection{Free Page Reporting}\label{sec:Device =
Types / Memory Balloon Devi
>  Normative statements in this section apply if the
>  VIRTIO_BALLOON_F_PAGE_REPORTING feature has been negotiated.
>
> -If the VIRTIO_BALLOON_F_PAGE_POISON feature has not been negotiated, the=
n
> +If neither the VIRTIO_BALLOON_F_PAGE_POISON nor
> +VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED feature has been negotiated, then
>  the driver MUST treat all reported pages as uninitialized memory.
>
>  If the VIRTIO_BALLOON_F_PAGE_POISON feature has been negotiated, the
> @@ -625,7 +639,8 @@ \subsubsection{Free Page Reporting}\label{sec:Device =
Types / Memory Balloon Devi
>  Normative statements in this section apply if the
>  VIRTIO_BALLOON_F_PAGE_REPORTING feature has been negotiated.
>
> -If the VIRTIO_BALLOON_F_PAGE_POISON feature has not been negotiated, the
> +If neither the VIRTIO_BALLOON_F_PAGE_POISON nor
> +VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED feature has been negotiated, the
>  device MAY modify the contents of any page supplied in a report request
>  before acknowledging that request by using the reporting_vq descriptor.
>
> @@ -633,6 +648,30 @@ \subsubsection{Free Page Reporting}\label{sec:Device=
 Types / Memory Balloon Devi
>  MUST NOT modify the the content of a reported page to a value other than
>  \field{poison_val}.
>
> +\subsubsection{Device Initialized Reported Pages}\label{sec:Device Types=
 / Memory Balloon Device / Device Operation / Device Initialized Reported P=
ages}
> +
> +When VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED is negotiated, the device
> +initializes reported pages by writing into each byte of the page.
> +
> +\drivernormative{\paragraph}{Device Initialized Reported Pages}{Device T=
ypes / Memory Balloon Device / Device Operation / Device Initialized Report=
ed Pages}
> +
> +Normative statements in this section apply if the
> +VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED feature has been negotiated.
> +
> +The driver MUST NOT treat a reported page as initialized unless
> +the used length covers it.
> +
> +\devicenormative{\paragraph}{Device Initialized Reported Pages}{Device T=
ypes / Memory Balloon Device / Device Operation / Device Initialized Report=
ed Pages}
> +
> +Normative statements in this section apply if the
> +VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED feature has been negotiated.
> +
> +If VIRTIO_BALLOON_F_PAGE_POISON is also negotiated, the device
> +MUST fill each initialized page with \field{poison_val}.
> +
> +If VIRTIO_BALLOON_F_PAGE_POISON is not negotiated, the device
> +MUST fill each initialized page with zeros.
> +
>  \subsection{Security Considerations}\label{sec:Device Types / Memory Bal=
loon Device / Security Considerations}
>
>  In environments where the device is not trusted, such as
> @@ -653,6 +692,21 @@ \subsubsection{Information Leakage}\label{sec:Device=
 Types / Memory Balloon Devi
>  reporting, may make page contents accessible to the device. Memory
>  statistics reporting exposes guest memory usage patterns.
>
> +\subsubsection{Data Integrity}\label{sec:Device Types / Memory Balloon D=
evice / Security Considerations / Data Integrity}
> +
> +When the device is untrusted, the driver cannot rely on the device
> +to correctly initialize pages. An untrusted device can report a
> +non-zero used length for VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED
> +without actually initializing the corresponding pages. If the
> +driver treats such pages as initialized (e.g., marking them as
> +zeroed), this could lead to information leakage between guest
> +processes or other security violations.
> +
> +Drivers operating in environments with untrusted devices are
> +expected to avoid negotiating
> +VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED, and to initialize
> +all pages themselves.
> +
>  \subsubsection{Denial of Service}\label{sec:Device Types / Memory Balloo=
n Device / Security Considerations / Denial of Service}
>
>  A malicious device could set \field{num_pages} to an
> --
> MST
>
>
