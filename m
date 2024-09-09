Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00B51B9B4B
	for <virtio-comment@lists.linux.dev>; Mon,  9 Sep 2024 14:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725891105; cv=none; b=Wm4/LXEysgytEt3jf9BQtlYrv2nx6R/m1AhikE1q8OK5PIvwVQz8uB6NB6eYxXMB3cjrAmMgFEDvRol5sMLpmVkldusxX0y6DFP6fHcd5djZI/KumKl7NDBJ1mYJx1og6X5LiC5SBf4s4qamjrUi3LmK6DDIc3OKGZ9kiWChfJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725891105; c=relaxed/simple;
	bh=6LPBvAweMT8mI2/bqPsVnoOTi4VYt1oLLc+Ht1lNI+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=CrgPltYVu+y4J2BCHYESNQ1rCTg1ce68hUvEVplA4J5WJLJMSvaa24DBCk64pYdyHzLvUn1j0dNgwB03XA7OMTgaOsGf6zaLus8LAkh6hjpGYdVOaAMkBcFdZvKSW4p9k4ciXg+xMrJCbi+QIVMet8uFlyq7qFl7DHbZ8SrdXSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WcuWMCJN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WcuWMCJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725891102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h+V8JVG1XYYIScFzjk+PjblwF5xIMJJedX6LrtKktpA=;
	b=WcuWMCJNvUiEvfKyt/WRG7MRAyjyYX0LOsbTCuKxIKagI9uThMQi5Z49WG3ZDCvR7HjeNI
	9tSU/z0q1teVUZ+eoD0W30h/u9bH8OcnARtQr9vHUM875TZaadrz6fIKjsVMNcAFWXAzw8
	YaZFYRGMSh4T3KXCQPW5n/Cl1I7KcRs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-igmTDOQBPZGrffnYB2dF6Q-1; Mon, 09 Sep 2024 10:11:41 -0400
X-MC-Unique: igmTDOQBPZGrffnYB2dF6Q-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7a1d06f8f03so617195785a.1
        for <virtio-comment@lists.linux.dev>; Mon, 09 Sep 2024 07:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725891101; x=1726495901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+V8JVG1XYYIScFzjk+PjblwF5xIMJJedX6LrtKktpA=;
        b=IgHIEMIavceIBiyGhbmkh+guPvXO1U07ojNsfjcFVY+tmE7Qn2c9H8OTNaAMoFc7c7
         B4saWm3XO0iP4CJkXRLggm8WJErTavI12Qzw0nMUcChy2kd1BOdSad35VN5iCUXYLkKZ
         juJEQA+INt2UeXQp9ihJdC9f/25xrI614owC74qWCoK0/BviGGIMhpQjuoBGLIXeJD11
         3VqioOQds8tVmml3XUnW/U4S7bLgBRWzK+JXhIkgO/GbYNUogca+38EHrJ3jIhflMnFQ
         7FwZIhM4QKgxXYnAMXrdgp3N7NEm9v/7EZ1eqI/atdT+RLIcGJW6Q/EFKp9XDu1frNev
         Wk3Q==
X-Gm-Message-State: AOJu0YwquijWotXXskjrhyvi1ahX1of6SLRuHNtcacMLs5fWlr1rseBT
	K+hSXAks/KoKH1YW16LIDvXsrfzLuVl3T4OhJ7cLA1B24kM5oc2O45bWXON1w/uLX9SfMMlQ3hJ
	FtFZCjsAUx37l9L/dlN4x0D9adUhLBOpSvaZ7PMXeXgHOz/m5rIvWpIdGQHzbgni3
X-Received: by 2002:a05:620a:410e:b0:79d:536f:7b3a with SMTP id af79cd13be357-7a99738bf11mr1026643485a.56.1725891101359;
        Mon, 09 Sep 2024 07:11:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtDVkkrXWIy81D6UnhN9naD6LdnqOMb8yTU+gJ2HLO+oi7omabre+5Ncqb0glwTeZXX243mA==
X-Received: by 2002:a05:620a:410e:b0:79d:536f:7b3a with SMTP id af79cd13be357-7a99738bf11mr1026640185a.56.1725891100923;
        Mon, 09 Sep 2024 07:11:40 -0700 (PDT)
Received: from fedora (193-248-58-176.ftth.fr.orangecustomers.net. [193.248.58.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a9a7a038ffsm219456885a.87.2024.09.09.07.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 07:11:40 -0700 (PDT)
Date: Mon, 9 Sep 2024 16:11:37 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
	shahafs@nvidia.com
Subject: Re: [PATCH 2/3] gpu: editorial: Fix spelling errors
Message-ID: <Zt8CGfndBTIpbXQX@fedora>
References: <20240907174819.778971-1-parav@nvidia.com>
 <20240907174819.778971-3-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240907174819.778971-3-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 07, 2024 at 08:48:18PM +0300, Parav Pandit wrote:
> Fix spelling errors.
> 
> Branch: virtio-1.4
> Fixes: fed64230bf31 ("Add virtio gpu device specification.")
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  device-types/gpu/description.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
> index 66e4873..ba4ea76 100644
> --- a/device-types/gpu/description.tex
> +++ b/device-types/gpu/description.tex
> @@ -166,7 +166,7 @@ \subsubsection{Device Operation: Multihead setup}
>  
>  \devicenormative{\subsubsection}{Device Operation: Command lifecycle and fencing}{Device Types / GPU Device / Device Operation / Device Operation: Command lifecycle and fencing}
>  
> -The device MAY process controlq commands asyncronously and return them
> +The device MAY process controlq commands asynchronously and return them
>  to the driver before the processing is complete.  If the driver needs

I think here is `completed` instead of `complete` although it is not
part of this patch.

>  to know when the processing is finished it can set the
>  VIRTIO_GPU_FLAG_FENCE flag in the request.  The device MUST finish the
> @@ -345,7 +345,7 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
>  display).
>  
>  The \field{enabled} field is set when the user enabled the display.

I am not sure if it is `enables` instead of `enabled`.

> -It is roughly the same as the connected state of a phyiscal display
> +It is roughly the same as the connected state of a physical display
>  connector.
>  
>  \item[VIRTIO_GPU_CMD_GET_EDID] Retrieve the EDID data for a given
> -- 
> 2.34.1
> 
> 

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

Thanks, Matias.

