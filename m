Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2972C4218BB
	for <virtio-comment@lists.linux.dev>; Fri, 15 May 2026 09:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836193; cv=pass; b=HmhKiGTjp1UCTcM1lYrekjHyfsxbOI9qE0NQ9f0RbzkFIjnWDjfef3XqmzvHRmgSxnishPKGXmqTiTyd+YxDen8urn+LaJZusa9je0i8/Deic9+ut7yGG6jJMNB7qrBtoqw1eIuinq821fGDDaMH2R7686I+pDdXuEfpajuWLI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836193; c=relaxed/simple;
	bh=yR8QXCiTTyiaY3MjpAbRZtX0RRX8bvDk2IxNwhRovns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uSqgYsLRaVpvVuzGDihtelpb56a1tKU9JjVGVHNUM/zWYKYnbeF2Ka+ZYkoUkHUDjaOr44jnfIGRI07qF9xXReHpgQ3fxxVYBuPx0I4ahmw6dpw+gZLoCPgONAx5+JcG162/W9b4lVDtkxa8MBiBNp0Fhw+Os29VtnqkbqrR558=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FYTv/tfL; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FYTv/tfL"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43eb05b1875so5300961f8f.3
        for <virtio-comment@lists.linux.dev>; Fri, 15 May 2026 02:09:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778836190; cv=none;
        d=google.com; s=arc-20240605;
        b=dAYL8dNYurS21cJ0uBO0sGV0W8iWiXnK4V+lvpUEmx9SqTk5ss+sEzH2ym+tsqtrBC
         3hB7I94RZ/heJKFl7E1t1nnvviO2EORHEqeeO+411CVl0Bf8ODvE0E68d7A/8Op2yLTi
         NyOKrO5fObVZqQh+KHHOhM5/pKsdj8mb2ciq3Sp+DFAxQnpGWde1KFWkoGxZ8vLHXetE
         poGXLYjz1XlWJ8YQOsrZ41x+s4awKd7yua3zchzDAAlWkx5KXweWicQtdkeEhksPdZgz
         z1kjO1SP5Ap0pKr40eBHeE4h/6lcCgYC1MdeDmeg1FqJnhiLX5FzyGI1szJ/OX/GZE0l
         BX4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dgjMJk8GlCIP2Znlb7RoVJBzCJybTVzUrskVsaZDpvk=;
        fh=rjBb7IxhhnsGnt8HksEH6pMEU66l46qhxJFEEALZbJk=;
        b=Fo2JDbA7xbCQLvBY+hHX1+p0tOyLynRQlVv8b6N0cvPOn0dbXOwFgz0Rc7hg2SIgtQ
         B0RoUdvvA7gW3esXa2Iz9nuRvLT8Gz0kkB35aIYOJvimqMV4OD5b/RKxJVcp56k3draU
         M4X4XNhJtFNtkvQyR9GKT1nNBAHjtMENcbtb6UgY/AKX6+SDEQSxPMaE06iAV+nuM4D+
         9PoG8WGsCNXbXAEW4LM7QFnEJZUAl/XpUSNbI/3rwSaQ/1ZtiOVb3/6UmCheO8oUWkiL
         o+3G/nlun2JUChxEGI+NM5FRuayHy812opkgkdYj2/4xZv6HsgQKu37WKEdTnvc/YDL4
         d24w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778836190; x=1779440990; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgjMJk8GlCIP2Znlb7RoVJBzCJybTVzUrskVsaZDpvk=;
        b=FYTv/tfLeMJwLgFpsm6Y5cnfTLIrf0OPzSJXCxzO+o4C6Ud9VoFZ0EVENKQpYanHGT
         uonYxsZdcoiyd/yQ9ITJGn9MbQ6VcmXqD8SYEAFZ9MQVbWGXoq0cHhxwtUhOfHKsBfMN
         ZiFzB3xi57ZeyGuC/y+KL/nJW6fG1GzM4VXCTsryDykwCqAgabR5BY+rL7dwfnLXGaTz
         WfYThItuPwc8qa+LQearNFH7GVQrRE+wu4MGeHTDSlEOa+7S+ivOY7heCj66AnmeFY3e
         5OjmFLqHgiXzxBq5SbRcs7z48uF7AvsXeXJUL92C4Kzxp6A/EE1ECWJUgWPTv19ZMp9n
         xvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836190; x=1779440990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dgjMJk8GlCIP2Znlb7RoVJBzCJybTVzUrskVsaZDpvk=;
        b=EkraXc7TO2XfDKxMs5tltN0uTtdJmbXpmicIlSJDuvpqoc6V8Y7FpwpTH2aQoGUl/z
         ifBVzRy9JnC0EJ0gOrb4dk96CxZ32pg0j3aDLR2WfKp4s9zASZhCJjLzP28m97JEmBOI
         r8bvy4AjvG8jbK2ype7jfws/C/qRpcbsIJnVhBekAsoY+8v2aNxUNSL7S1TaE0Cn/A4f
         CvMdUBCSgV+OkIpXCFf2SkQgLunLnsOJJtNO6nojra0KEFyhJSKnRohGtYRo1lGoWq9Y
         yfFcA81fG0OTZhu1CyP9o0BwUzYXLpXDJfVcwGvp+OYrXNCKFzx6Xnf7dXos9bHFNDiF
         jOuw==
X-Gm-Message-State: AOJu0YzQekfkiQT+HHMcQ8ViLvEbrlaUoq52Y1aOlMLCQ5MQ+GzDDlYl
	bSCKrlIsVOtz2i84y02Vb5OSMw+XfMjiSDI2Cj0DVza8jn0hR6JHJ0sTnwi0YZulDXXuzZixc7A
	Rxcyy0imZBaIz1P5n50w6j5KKTIhRIQFNFpsiKTczCg==
X-Gm-Gg: Acq92OH6oibH1rpd1ea9JELbItynm/Cs7WmEvmsJuyTxKqFiF88IQ7sh8mchMBtce7M
	tZa9Ei6QED5SRSn9z3FlErGdf7CBAYCiSS8AlbGhqx4BOSLsvdkKmk8kexbn+912vvDgNUCLIO5
	71HMf54Mb2zqAcXJPot1i07MtkEWFVZia4l44GmUAmiTuNaAd1ak1XryGH4oVPsQW8x7VWX2Z/b
	3PmhZd5ohhSsY2xniNGWtrjxeSegcENG5RrfeyT1Nnx2Tqx5Ca1LDRKMRBl7ILosKlox6X5faTT
	p/175IqBFCIk+HjNIfGM/n5j9rFDZQyJKv155zNUd9mRbaSP0A==
X-Received: by 2002:a05:6000:2007:b0:441:1c18:f779 with SMTP id
 ffacd0b85a97d-45e5c605c2bmr3706517f8f.37.1778836190412; Fri, 15 May 2026
 02:09:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1778140241.git.mst@redhat.com> <b29dee815f250b3332651a1a5aeabc4e49ec6914.1778140241.git.mst@redhat.com>
In-Reply-To: <b29dee815f250b3332651a1a5aeabc4e49ec6914.1778140241.git.mst@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 12:09:24 +0300
X-Gm-Features: AVHnY4L_4K7BF12GQInXlovEnj5ui5KhGhAHp4J708XIZ5tXvdxK5kietThwaqw
Message-ID: <CAAjaMXZggBhThMSrR8-YWx=AZDi00hm9or6CSB+v3xgjvbaotg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] balloon: add VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 10:52=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> Add VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE (bit 7): the device
> initializes inflated pages and returns a per-page bitmap indicating
> which pages were successfully initialized.
>
> Update Security Considerations Data Integrity subsection to cover
> both DEVICE_INIT_REPORTED and DEVICE_INIT_ON_INFLATE.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/242
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  device-types/balloon/description.tex | 73 +++++++++++++++++++++++++++-
>  1 file changed, 71 insertions(+), 2 deletions(-)
>
> diff --git a/device-types/balloon/description.tex b/device-types/balloon/=
description.tex
> index fa33105..7afdb24 100644
> --- a/device-types/balloon/description.tex
> +++ b/device-types/balloon/description.tex
> @@ -52,6 +52,9 @@ \subsection{Feature bits}\label{sec:Device Types / Memo=
ry Balloon Device / Featu
>  \item[ VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED(6) ] The device initializes
>      reported pages.
>
> +\item[ VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE(7) ] The device initializ=
es
> +    inflated pages.
> +
>  \end{description}
>
>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Memory=
 Balloon Device / Feature bits / Feature bit requirements}
> @@ -249,6 +252,10 @@ \subsection{Device Operation}\label{sec:Device Types=
 / Memory Balloon Device / D
>  and before detecting its physical number in a deflate request
>  and acknowledging the deflate request.
>
> +If VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE is negotiated, the
> +device MUST NOT modify a page after reporting it as initialized
> +in the bitmap.
> +
>  \paragraph{Legacy Interface: Device Operation}\label{sec:Device
>  Types / Memory Balloon Device / Device Operation / Legacy
>  Interface: Device Operation}
> @@ -672,6 +679,67 @@ \subsubsection{Device Initialized Reported Pages}\la=
bel{sec:Device Types / Memor
>  If VIRTIO_BALLOON_F_PAGE_POISON is not negotiated, the device
>  MUST fill each initialized page with zeros.
>
> +\subsubsection{Device Initialized Pages on Inflate}\label{sec:Device Typ=
es / Memory Balloon Device / Device Operation / Device Initialized Pages on=
 Inflate}
> +
> +When VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE is negotiated, the
> +device initializes inflated pages and reports which pages were
> +successfully initialized via a per-page bitmap.
> +
> +The driver appends a device-writable bitmap buffer to each inflate
> +descriptor chain, after the PFN outbuf.

Maybe we could say "page physical number" instead of PFN to stay
consistent with the rest of the balloon spec.

> The bitmap contains one
> +bit per balloon page (4KB), where bit N corresponds to the Nth PFN
> +in the inflate request (0-indexed). Bit N is stored as bit (N mod 8)
> +of byte (N / 8), with bit 0 being the least significant bit.
> +The device sets a bit to 1 if it successfully initialized the
> +corresponding page, or 0 if it did not.

Does this mean page size cannot be larger than 4kb?

> +
> +If VIRTIO_BALLOON_F_PAGE_POISON is also negotiated, the device fills
> +pages with \field{poison_val}; otherwise, the device fills pages
> +with zeros.
> +
> +When the driver later deflates these pages, it may skip
> +initialization for pages that were marked as initialized in the
> +inflate bitmap.
> +
> +\drivernormative{\paragraph}{Device Initialized Pages on Inflate}{Device=
 Types / Memory Balloon Device / Device Operation / Device Initialized Page=
s on Inflate}
> +
> +Normative statements in this section apply if the
> +VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE feature has been negotiated.
> +
> +The driver MUST append a device-writable bitmap buffer to each
> +inflate descriptor chain. The bitmap buffer MUST be at least
> +$\lceil N/8 \rceil$ bytes, where N is the number of PFNs in the
> +inflate request.
> +
> +The driver MUST NOT treat an inflated page as initialized unless
> +the corresponding bit in the bitmap is set to 1.
> +
> +The driver MAY skip initializing a deflated page if the
> +corresponding inflate bitmap bit was set to 1. This overrides
> +the VIRTIO_BALLOON_F_PAGE_POISON requirement to initialize
> +deflated pages with \field{poison_val} for such pages.
> +
> +\devicenormative{\paragraph}{Device Initialized Pages on Inflate}{Device=
 Types / Memory Balloon Device / Device Operation / Device Initialized Page=
s on Inflate}
> +
> +Normative statements in this section apply if the
> +VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE feature has been negotiated.
> +
> +The device MUST provide an inflateq supporting at least 2 buffers.
> +
> +The device MUST set bit N in the bitmap to 1 if it successfully
> +initialized PFN N, or to 0 otherwise. Bits not covered by the
> +used length are treated as 0 by the driver.
> +
> +The device MAY write fewer or more bytes than $\lceil N/8 \rceil$.
> +Any bits written beyond those corresponding to PFNs in the request
> +MUST be set to 0.
> +
> +If VIRTIO_BALLOON_F_PAGE_POISON is also negotiated, the device
> +MUST fill each successfully initialized page with \field{poison_val}.
> +
> +If VIRTIO_BALLOON_F_PAGE_POISON is not negotiated, the device
> +MUST fill each successfully initialized page with zeros.
> +
>  \subsection{Security Considerations}\label{sec:Device Types / Memory Bal=
loon Device / Security Considerations}
>
>  In environments where the device is not trusted, such as
> @@ -697,14 +765,15 @@ \subsubsection{Data Integrity}\label{sec:Device Typ=
es / Memory Balloon Device /
>  When the device is untrusted, the driver cannot rely on the device
>  to correctly initialize pages. An untrusted device can report a
>  non-zero used length for VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED
> +or set bits in the VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE bitmap
>  without actually initializing the corresponding pages. If the
>  driver treats such pages as initialized (e.g., marking them as
>  zeroed), this could lead to information leakage between guest
>  processes or other security violations.
>
>  Drivers operating in environments with untrusted devices are
> -expected to avoid negotiating
> -VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED, and to initialize
> +expected to avoid negotiating VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED
> +or VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE, and to initialize
>  all pages themselves.
>
>  \subsubsection{Denial of Service}\label{sec:Device Types / Memory Balloo=
n Device / Security Considerations / Denial of Service}
> --
> MST
>
>
