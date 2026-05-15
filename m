Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C6441B35F
	for <virtio-comment@lists.linux.dev>; Fri, 15 May 2026 08:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835254; cv=pass; b=p0pGodsicN0EPet9urpd116IDsEvvW+DN1ECD54rMiY1tvijXQfpjSDyycg0Itm1/rmXAYZ4ZS3LWB43c871f1/BlX9U/nepfdi+GigrQ+oWA5EbR1t9LEMSfJiKaUSK7qe+0HLLMcNIAtsb680APpY8332QVyHLGy0E1OQLO44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835254; c=relaxed/simple;
	bh=DTK14Nh8xr5bpvo9nWOw7fASxPuCaf38fs5qIqc2VJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c/OoaTtJLX/FAlFpR0gLMt7cy+VOjiB/v4F4/W9mrVZ6bakme5b20C75N6uoFoANWvCqkePuk4KyZNqybiQ+ya+MBvUfSbXnbrGc1m6ex9cONg0cIA2Auzxnr4jQCW6KUpWBA483wqlQv4J6/F8MyxMR5cFJIXJM3OkCC2RfDJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xZWU3bAa; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xZWU3bAa"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso7276772f8f.2
        for <virtio-comment@lists.linux.dev>; Fri, 15 May 2026 01:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778835252; cv=none;
        d=google.com; s=arc-20240605;
        b=TByrvZCseAX5PJzUYSv6CmBdGsrw09QBOYSLB2e/2PVQshF6kqsaf7yeFg5UTH/8c+
         m0t4Q1cpBYcLnX2I55Tk6dMYSIlaGe9eRANEd+SRXLswsvV60TvCFnFTto0ke5tcyKMH
         r0PjDmsQXtON+WRpDm6Hti5WnaX5ChS0jebphwEpWhot9Tlz4HyLLWzhKYd2xmS86U1l
         73bMSO2xqn9+WyI5OTx9Nx5up8xxMSy9VQQPzOhTMAWpmZbrLWwX1tJ5WwPEpUG9tua9
         HD8qj5rBKCSlMPqFtbezp/FUaeeSq/+lo3TvuYwWUUgb0JD5ZO8giVy1tHo5Z3p8F31N
         AyvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aJ7kwZDSg8jEbmk1PBh9gH9ftKtZOzvrUtV1u6S+Sr0=;
        fh=rjBb7IxhhnsGnt8HksEH6pMEU66l46qhxJFEEALZbJk=;
        b=LhoVXfhnCZHoTkHwbmb+tX0SqT2xPcu8d64NWtDBBQOdheHOunUU0AUSIBC8YUzJWq
         ODJUzDhtcMH+CDlKZsz4WQRlw6lZYQnsacvn85PVnh89O18+YXedLFdVmrXxP/sJE4xU
         5nD9MFhr/rcGX8/PWOJKoFzJOc/2ptAASMJZScVbQQn0a4Em96g2/omDrJq+IERsVRDI
         pHav6LaGKN9lJZ3zDkcEyyFlV3cq7t23FNQ5YxXdYBQ/Aw14Kx1YSZTdlB5JODRIImel
         rV4OHFsT4ExM5RMNUII4OCT1gHA8x08qRxqp4LoakOi3egG7y3j86Aj9BAg+2ABF839h
         Vgzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778835252; x=1779440052; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJ7kwZDSg8jEbmk1PBh9gH9ftKtZOzvrUtV1u6S+Sr0=;
        b=xZWU3bAay/O4XW3gR2D7FLZJf8uLZlS/ctVJ9zh0yrchOfWZ54HKZSCcEEGmXyAE+K
         FhOLl8hCMgy3jjSrRCf5ggaZbSvFU7qkXd1XK+9v5MAu4FCxBasMDetdJd+ELDDs2+GY
         2wCFLB9ZYq1faQ5qB9ASP5dp9Fs68PR44gVNONAfRbTKTHWDA6TMam/vW7CSEhg6NSXL
         2YX1/g6DOOMkEKQ/GoCh83cYzwXSO9PxaE8L3nKU4c8QUyEjdg+4aaAn6M4PI0LJ+AGc
         2UsXbm1pKg4I4vBRJQP/GK0WxbMWDyTb8RzIKijlWKvE7RP1TNmOe1UhHRM8bceuTfIi
         iCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835252; x=1779440052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aJ7kwZDSg8jEbmk1PBh9gH9ftKtZOzvrUtV1u6S+Sr0=;
        b=QRNki5blJ5aLtyozwtt2gB9re4HA0ktXMqvR3IZXS7mOsKl54trb8FxsxiYLpxthil
         Bva/HszIWvk1a156vuPoag9ZgMoaZ1U8zo8LAyCsuAZsZDBd+b/OaThjM1emwAEpoRUW
         gr5I/H2l1OIXe5ljkIH8L40EcpTdFO11sM2I9whnsvX6mkwH/JVHKSN9jIhYyXBzA9yd
         a5nTdJyjoRLnqG9B9sm8FRcxeKZn7F2jNd3jl9ss4AKWedVcR22cIwLIldH+AIZVNxvR
         ZosugjfcF08H7cZI/Swqco30w317S3EtltFZtLTs237rZ0hYqssutKB2w+k+jyLEkYos
         YfHg==
X-Gm-Message-State: AOJu0YwVUZreiKli9n7DRO3qEpqPlDC8lHRwK+gV7osE43AfCJBFGizk
	jcMd1eNEcmMHOO5WG5dcVVDNNKkGGrJCGRjJ7ac7urqk+njcfwUzrYfxAOD1nTzVgUvebN+Izog
	b4+QxMMZKtpZ+AZCFRNrJeXUUVYPUfFKI1q/eqVvo9SGPmD+3G8TCciFuIQ==
X-Gm-Gg: Acq92OEf8u7Fkh/bPctNZ3qavdtWqU/accflpb6dGidsJNKPC3bZgOOdkx9z+/RNFBC
	8i6pOGiuH9KcRgyJd0YMBN8P/nmvQw42y0G/KMmKPoVpwfeS6bbUzCrcpxeU5S4J19zwr74A1Tu
	sgIeQyGrqRpG58X3Zsgjzcun5COpHy0PbWAS5svli/abvthvz/YAk0aDOigTD5EiG3Sh5Yz17kk
	SY6S99GmhKxgfbjaseat6HmRWHXN5fzfT2DmxbMvIi82C1s8nczHbqlxt3DD95fYXnv1OdVJkyq
	9R1rYOfQm5hoislez+WUJrCAtvNLMZsb2qDAkrUCID8Xp4cCjw==
X-Received: by 2002:a05:6000:2087:b0:43d:69ff:6898 with SMTP id
 ffacd0b85a97d-45e5c362cccmr3878076f8f.9.1778835251903; Fri, 15 May 2026
 01:54:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1778140241.git.mst@redhat.com> <f349753e62471783378c950a2552e02aa30e50c8.1778140241.git.mst@redhat.com>
In-Reply-To: <f349753e62471783378c950a2552e02aa30e50c8.1778140241.git.mst@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 11:53:45 +0300
X-Gm-Features: AVHnY4I4gZU1RK_xGLL90gbCa0wH8CZQB6OYMC2Hg8rYnlgD-IV8J2P0IeP0k24
Message-ID: <CAAjaMXZHGZzP4JKKFWooLwOwPHCEXDa6b+6qfYVkL63D2y3udQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] balloon: add Security Considerations section
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 10:52=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> Add Security Considerations covering information leakage (balloon
> pages may contain sensitive data), free page reporting exposure,
> and denial of service (malicious num_pages).
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  device-types/balloon/description.tex | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/device-types/balloon/description.tex b/device-types/balloon/=
description.tex
> index a1d9603..a2e4a37 100644
> --- a/device-types/balloon/description.tex
> +++ b/device-types/balloon/description.tex
> @@ -632,3 +632,31 @@ \subsubsection{Free Page Reporting}\label{sec:Device=
 Types / Memory Balloon Devi
>  If the VIRTIO_BALLOON_F_PAGE_POISON feature has been negotiated, the dev=
ice
>  MUST NOT modify the the content of a reported page to a value other than
>  \field{poison_val}.
> +
> +\subsection{Security Considerations}\label{sec:Device Types / Memory Bal=
loon Device / Security Considerations}
> +
> +In environments where the device is not trusted, such as
> +confidential computing, the balloon device presents several
> +security concerns.
> +
> +\subsubsection{Information Leakage}\label{sec:Device Types / Memory Ball=
oon Device / Security Considerations / Information Leakage}
> +
> +When the driver inflates the balloon, the addresses of the pages
> +are communicated to the device. On some systems, the page contents
> +themselves are also accessible to the device. These pages may
> +contain sensitive data from previous use by the guest. In systems
> +where the device is untrusted, the driver should sanitize pages
> +before inflating them.
> +
> +Free page hinting and free page reporting similarly expose
> +information about which pages are free, and in the case of
> +reporting, may make page contents accessible to the device. Memory
> +statistics reporting exposes guest memory usage patterns.
> +
> +\subsubsection{Denial of Service}\label{sec:Device Types / Memory Balloo=
n Device / Security Considerations / Denial of Service}
> +
> +A malicious device could set \field{num_pages} to an
> +unreasonably large value, causing the driver to surrender most
> +of the guest's memory. Drivers should apply reasonable limits
> +and not inflate the balloon to the point where the guest
> +becomes unable to function.
> --
> MST
>
>
