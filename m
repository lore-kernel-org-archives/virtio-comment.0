Return-Path: <virtio-comment-return-9156-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0E4C54798
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Feb 2024 10:56:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 172982CAD6
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Feb 2024 10:56:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EC183986531
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Feb 2024 10:56:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D424F983D68; Tue, 27 Feb 2024 10:56:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C48BA9863DE
	for <virtio-comment@lists.oasis-open.org>; Tue, 27 Feb 2024 10:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: XiOo1ho1OUuhqq29-xexUA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709031372; x=1709636172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6Q+hIeMKOwBoSF7SfSTwPkADIaQP4FG82RCxOadXjY=;
        b=I2aqXV53StNh4hi2wRS7mcM0ohN/VkJaStY5VpuKDTdKjiGArdmYNm+WNhXVXLjUk5
         RrsUbWol7H57UARQpDcCdVie0Ex8KM8D58P0DeWAHHiYjh0I1NMOqAo3Uz21WhGJsCUd
         +D23mHE1jJS6nnhfOCNj8uvzwZW4pUcL4YP+twbwV8fomJb/DjZVdqtJ3WDYV1w057FI
         PxdeHsHK0AcNHqTB2GBzUWRi0K8vDFrdX5d6NTODi44JoktfOozCeR8GWXvobowDtdSt
         AOYOY1ZI9+5WTVkEqdKVuekIq9naKDyFpcGBQjc0OJ2Lnf7fgqlKjjMVBTVMDNkco8SQ
         Kq6g==
X-Gm-Message-State: AOJu0Yzr9D0+6Yil5wh/Hb+SPd+3nMhraoUmnqADYouLsR6cMl0AmEc3
	rVO9Z3inxCe+f6U78H7n/D7MQQtatGGxEU8jTtclBKhuoiIwv9xEj1rGEtK5+eFisx6pgwVHU3s
	hKRsaGwcG+gdlFUqJ924IarsSZOugejHv53vOe1iH2LpmuKT6GhUW64mcVgIq6/r24cx2m/O3TO
	ZJkKyyr/5FJOeTDkojm3FpPmVYwwirWnhBaAz4Qy/UyktI0htELSL/N+E=
X-Received: by 2002:a25:7456:0:b0:dcb:ff73:2262 with SMTP id p83-20020a257456000000b00dcbff732262mr1748743ybc.36.1709031372485;
        Tue, 27 Feb 2024 02:56:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFL1I2w0qZYzGxA8pamtNVafvmieSNjDrfAV/+PV8iqwHoLnd9wfg3Zv30tsFWAYoAeBk1hNg==
X-Received: by 2002:a25:7456:0:b0:dcb:ff73:2262 with SMTP id p83-20020a257456000000b00dcbff732262mr1748733ybc.36.1709031372171;
        Tue, 27 Feb 2024 02:56:12 -0800 (PST)
Date: Tue, 27 Feb 2024 11:56:09 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.oasis-open.org
Cc: anton.yakovlev@opensynergy.com
Message-ID: <Zd2/yfi74afJnhRs@fedora>
References: <ZXbpzOFix95Pfeoc@fedora>
MIME-Version: 1.0
In-Reply-To: <ZXbpzOFix95Pfeoc@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v1] virtio-sound: add latency_bytes definition

On Mon, Dec 11, 2023 at 11:51:56AM +0100, Matias Ezequiel Vara Larsen wrote:
> This commit aims at providing a better definition of latency_bytes. To
> do so, this commit defines latency_bytes as is defined in Crosvm.
> 
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
> Changelog:
> v0 -> v1:
>  * specify that the delay is due to the device implementation.
> ---
>  device-types/sound/description.tex | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
> index 54c9c8e..a138e5b 100644
> --- a/device-types/sound/description.tex
> +++ b/device-types/sound/description.tex
> @@ -694,7 +694,10 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
>  \begin{description}
>  \item[\field{status}] contains VIRTIO_SND_S_OK if an operation is successful,
>  and VIRTIO_SND_S_IO_ERR otherwise.
> -\item[\field{latency_bytes}] indicates the current device latency.
> +\item[\field{latency_bytes}] indicates the current additional delay caused by
> +the device's implementation. For playback, this is the amount of bytes that
> +must be consumed before the current request can be played. For capture, this is
> +the latency in terms of bytes that the capture buffer was recorded.
>  \end{description}
>  
>  Since all buffers in the queue (with one exception) should be of the size
> -- 
> 2.41.0
> 
Ping @Anton, thanks.

Matias


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

