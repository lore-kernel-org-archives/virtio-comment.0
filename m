Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BB1EAE6
	for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718977057; cv=none; b=Bfbxb8w4R2w1287es882WW0EfoaE2SRgW96aCMG4OgUKe1+r9rSTxZuwhIH2sQ+rcb+iBypL2u6wQ0MoJZe5cIh98dhnq992+peYxhe2xY/cfzr4HSCnTDXr5jgpbBypjjQ4yIld2h3boZHIfwqHJ0tVsKxNwm2/AlM77fD2BgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718977057; c=relaxed/simple;
	bh=ZFp9A1cSZIvDpccDJ/A18ZA9AQUcoNAn36FgcjSKE8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=pQjYaz9PfgHAnKdOxc+ozCCzUiupy0BdaBt39sJ407eAc6Eoys7CrB75FOQNlll63kj7kKTP3MoEAF9F+ersQwpRt6LvkPSrw19TPIY7xhX/Eps1VZm3fcWJnk/dO1p9bkfPVrqxOtwHmHoNVsLEOI59nLsX7ZZujYc/+Imbuq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fdezBBD8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fdezBBD8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718977054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AlE9Kcw4s61ECrhWGws8juEp7WYbsdE2USApvMwAF7Q=;
	b=fdezBBD8RnIQvIoN6MaX9RUUoFbPE6cwqIhO6pjDJvZQnTS48zbdElEB+CFC6KWvhh07bX
	CEYHBdb0JpI6IeKCLp7kyqcg7vguRhsGVQEA9ARBsdl2kl1VYeUZP1KHdtnqauMlZ10b2e
	jU71LE7HxDZNqy0sSFnM0mbsKxrXgos=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-oMRFM194NPWhYmVgEcst-Q-1; Fri, 21 Jun 2024 09:37:33 -0400
X-MC-Unique: oMRFM194NPWhYmVgEcst-Q-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-421292df2adso15464175e9.3
        for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 06:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718977052; x=1719581852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlE9Kcw4s61ECrhWGws8juEp7WYbsdE2USApvMwAF7Q=;
        b=HaqBodQZB3p7HUTmdTBsTE3X7DgVhzFHvjjc0XFFudqrgtNg3FXFl2f/rvyOOcUbyz
         Ix8TF0fZ0kINStoy10Bxzr+Ew2xK8r+R1j3ZlWZ/HBaTxuZce013nmOA2p8c01Hfevb1
         JQvG9pFoXYGLbMqNYPFoZSWsA8ZmjZBVQ5wF8S8JlT79e6EYAW66sftBwa5XQ76yeLDB
         4uh8NBX4IiO8VYN2SHe2wqa+A7CoprgkaiUqEJ2KUk9okbtOtlTO3GXEplowq/VdMGe7
         Fx3UC5yFOqTz3UUWDL9FLlDD8WgIX0g4R1+cmjLUdsLB86zqIxanY2EDKN3031QOp4OM
         z5tw==
X-Gm-Message-State: AOJu0YyN3Y9lxUmeewgUAUGimV+r/sGjiow1LHQs8zM/UxoAmUltn33Z
	bpSt89Z9zKMH7fFZJcvLBpYmZ6nBBk10VrWoLcVZABCCx1B/7mUtZOIzcghgucW0TlBKSjP8kvF
	UtMONBDedU7s/vXGynuNyDoygv0w2BOne4Y9IK6X/xo4A3Lng3k06eWs8teAv/zGGE+8+xNT3Ki
	QmlQwtrHi5NkYSa+NiyHzyi0Lnf27fPC7Qfrcz7IZTJs6dC7E5
X-Received: by 2002:a05:600c:56cf:b0:424:85c7:bda8 with SMTP id 5b1f17b1804b1-42485c7c0ddmr2464425e9.6.1718977051920;
        Fri, 21 Jun 2024 06:37:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEjGC95oe8n26yv/lWG+pqzJfqh65+irllzC8RLrPXK3y8c9L5byN33MUr5edN8x2+bco2Wg==
X-Received: by 2002:a05:600c:56cf:b0:424:85c7:bda8 with SMTP id 5b1f17b1804b1-42485c7c0ddmr2464225e9.6.1718977051448;
        Fri, 21 Jun 2024 06:37:31 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b5549sm29808645e9.23.2024.06.21.06.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 06:37:31 -0700 (PDT)
Date: Fri, 21 Jun 2024 15:37:29 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: anton.yakovlev@opensynergy.com, sgarzare@redhat.com
Subject: Re: [PATCH v1 Resend] virtio-sound: add latency_bytes definition
Message-ID: <ZnWCGR9tkSrKPzX2@fedora>
References: <Zky3vZU+P37H4VPb@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Zky3vZU+P37H4VPb@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2024 at 05:03:25PM +0200, Matias Ezequiel Vara Larsen wrote:
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
Dear TC,

I'd like to request a vote on solving issue 198.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/198

Matias

