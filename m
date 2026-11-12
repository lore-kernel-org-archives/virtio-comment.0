Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471766;
	b=JwEdlGfrKq+JK1k4ump77WyF2IhPJmyHCE5Kg07a4D4toCehb4PGg4aauXOlzPtonxf4
	 T3CE6K/+8ml7HfHa407/bsudfLrqbYsUMMGosudZILZC1TZfj6pZ+OYdn2n2aCewpMlkB
	 42U7NQa8q3TDxNag7dadLMav46RzbZtTKRpVoWRFvkkBg0MLL/3ced6S0kRUdjB23sat9
	 OTBAo5I07AoPkNoszr39kyGHGXNa9C+C8zPAafAdpAnCL555+8AM/mDk5U15/VIGlANxo
	 pNFd8naEuW+oJVz4q2uqoWza3HwQ5jNhWTPLw8TqEj7RrcRhZ3q+ABo+rN2JljLi1JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471766;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:In-Reply-To:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition;
	bh=03bJhNI0LsDeLWSK4Pfp+moTz4XFgB2H+SUMU1s707I=;
	b=TS64wznsWKTxaM6SHHR9m+iL6q9oTTHot1Jj4s81Yaagbl4umpakJ2EQhtCWPPFDo37P
	 V2fLzCtFy3cWESa2XHwytuI3ynMoIlm6ZENKW4UO2RES1JYA0lb/4bPwWKpeE17PMwMNX
	 kRtzyORGgxMRcmADHxm7ipDzlZHilLQ5ypYxq7u0aPRiW57GalhyrDBckwI40e8z3oVW6
	 HrfC2h8YBFMZWW17a9VOulLhIkTHE5fNN0yMWNJFtA1kwp9/v5BSXr2fVR07l81AjJEUm
	 nyy0zEql6AGoGPOgLzj4CYTUH0fzxq8651rUqp3FcAhLojkyUVsNxrl7m65tl0cFz9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gjc0N0DJ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F56606A33A
	for <virtio-comment@lists.linux.dev>; Thu, 12 Nov 2026 08:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81F56606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gjc0N0DJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794471764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=03bJhNI0LsDeLWSK4Pfp+moTz4XFgB2H+SUMU1s707I=;
	b=gjc0N0DJOSAVUS3s8mtmf26X/KZLlzAg+f/hrLYafXTXjX03g+5IMYosldCXMDZHyeBQ5Y
	JRfU9cS6m1alCxTecmqX4vXtNm9qIpFTtxS+KFiSEzLgDw45FcfeXtWFYDMvx78YPM+Udb
	d5PyJyVyiKdCl3sMiC3wPTskcrAu4eg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-tq6D64tCPTO6wdG_dCStPA-1; Thu, 12 Nov 2026 03:22:42 -0500
X-MC-Unique: tq6D64tCPTO6wdG_dCStPA-1
X-Mimecast-MFC-AGG-ID: tq6D64tCPTO6wdG_dCStPA_1794471761
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-490c1867460so2962526f8f.2
        for <virtio-comment@lists.linux.dev>; Thu, 12 Nov 2026 00:22:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471761; x=1795076561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03bJhNI0LsDeLWSK4Pfp+moTz4XFgB2H+SUMU1s707I=;
        b=Kc9nlorhAgsx0YIz4nMrt7GaC6iW3oCNidcffWCaDSWwjG0WNHGTuTsbgDvZHZeVqk
         ko4IH+N2je7YHIcInDNabD++Lq69kKs+loDgdI8/+azS9K4ucQ/+IO2G7/HiOtKNc2P2
         IDuaZSKcYEuwI4wWShp9EJNS/kGKSR/7k8RaeRrqbbN2bc/6Cfn6KgS5Yx3fODerBL2Y
         mOctPTyNPjh73IeOIE/GzEfdbuJvZzDgBATVr67vnsU6NhdROstuUyPzm3/8pOqOUzjm
         /KMoEO64ki295XYUm0+k4yBoDAolBmwWU3pBy41xMyCopb02Y2vUIFf1yy2d28J8q1ff
         MpmA==
X-Gm-Message-State: APuU4Z8aeR++zJuVKYbeGaRv2r64fDNxdMbILUqULI9Jhxl184ngbcZ9
	CO5l0rr4MfgYuKzTSisKfIkeI3TybEn5gFz8h0x5Zx5ilQbmrN9Q8XPX9R6/LQzq0J+v2kii1GC
	+23OuqtSSw/403SU4X/nKJUfcBoaOxu0iIlgN/NQ7Sh2P2JBfW6UFOYm5mgKGyEZnz7CT
X-Gm-Gg: AYBFou1iaW7PbKkTZhu+RRCAnmLW6orAheG4O85rrTI5N/8vpmpWmXOySXcQmyRqqjF
	EM+9zs9sOtvBtU5r2wzuQCJLoy8JAYSOebjUAXKeKW9ldHYGLmmgP6aoIqQ87CIhmPUQ7FtrRnH
	dZyN3lrX4FbAoOjfxeRlgjuLmUvwxM9oRd5DPvquW9wAYyTbZnUSwJDlmTw+v2QEXNSs1E3iaUb
	18yiYJI2sK6Gyax30Cr+gzTYEEyWGz4srn1BR4Y3r6iSfvwSKBNEkLJ2bmexn8BmdZtPVOhijZm
	Ab+v7gJLJZhvS7CQ49Kzn6TV6pzEEUjf5ySZlLpdiOkIvTukFrVxyI3BafkYn+QmUnFuZ0dI5YG
	21G/1wSXPMck7+vaHc15wbli5qZjBgJQG5pCqCHEHee0=
X-Received: by 2002:a5d:5d09:0:b0:499:81db:47a3 with SMTP id ffacd0b85a97d-499c7271480mr8947310f8f.11.1794471761473;
        Thu, 12 Nov 2026 00:22:41 -0800 (PST)
X-Received: by 2002:a5d:5d09:0:b0:499:81db:47a3 with SMTP id ffacd0b85a97d-499c7271480mr8947263f8f.11.1794471761169;
        Thu, 12 Nov 2026 00:22:41 -0800 (PST)
Received: from localhost ([139.47.30.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc8fsm14583616f8f.30.2026.11.12.00.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:22:40 -0800 (PST)
Date: Thu, 12 Nov 2026 09:22:39 +0100
From: Albert Esteve <aesteve@redhat.com>
To: Dorinda Bassey <dbassey@redhat.com>
Cc: virtio-comment@lists.linux.dev, sgarzare@redhat.com, slp@redhat.com
Subject: Re: [PATCH] virtio-gpu: Allow num_scanouts = 0 for headless mode
Message-ID: <avV3TwcW__6QtqLT@aesteve-thinkpadp1gen8.rmtes.csb>
References: <20261103110623.328004-1-dbassey@redhat.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261103110623.328004-1-dbassey@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N011ZNk7tCXHfT3Hf2GApJBtmrLDu9HXmwTMtPC-kFA_1794471761
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 03, 2026 at 12:06:23PM +0100, Dorinda Bassey wrote:
> The specification currently requires num_scanouts minimum value
> of 1, but the Linux kernel has supported num_scanouts = 0 since
> commit 72122c69d71784 ("drm/virtio: Add option to disable KMS
> support", 2023) for headless GPU compute workloads.
> 
> Update Section 5.7.4.1 to allow minimum value 0, aligning the
> specification with existing kernel behavior.
> 
> Signed-off-by: Dorinda Bassey <dbassey@redhat.com>

Reviewed-by: Albert Esteve <aesteve@redhat.com>

Thanks!
Albert

> ---
>  device-types/gpu/description.tex | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
> index ac3b427..83d2126 100644
> --- a/device-types/gpu/description.tex
> +++ b/device-types/gpu/description.tex
> @@ -67,7 +67,8 @@ \subsubsection{Device configuration fields}
>    Writing a '1' into a bit will clear the corresponding bit in
>    \field{events_read}, mimicking write-to-clear behavior.
>  \item[\field{num_scanouts}] specifies the maximum number of scanouts
> -  supported by the device.  Minimum value is 1, maximum value is 16.
> +  supported by the device.  A value of 0 indicates headless mode (no
> +  scanout support).  Minimum value is 0, maximum value is 16.
>  \item[\field{num_capsets}] specifies the maximum number of capability
>    sets supported by the device.  The minimum value is zero.
>  \item[\field{blob_alignment}] specifies the minimal alignment, in bytes,
> -- 
> 2.55.0
> 

