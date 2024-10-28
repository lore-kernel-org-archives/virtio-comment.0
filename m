Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3691991C3
	for <virtio-comment@lists.linux.dev>; Mon, 28 Oct 2024 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730108964; cv=none; b=Wy869iE/S+B67DUeqlBfefSyTpaxQPvsEE3Y+JcFXjTDZUynJAyrZtQ2oljDF1nfCVG3JnfJ7kim6CWIEPIbX0GXf/0lwJnSOQGvTODynGEcHK6xSGC6rCaA1UnG9pNBjGYd/nJjwQLR8pemtSKFw6rApPSLkQ4u0THSxFh6oy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730108964; c=relaxed/simple;
	bh=HOsdtcAKtjFLsecdDFJr7SQoYaUeH87WdVPWUB9+txo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=t/3ymx/eZlufmSDBTGhElvjzgNszFwvIQs8E2YeiILpf8288hr7WI43GENQz4OWcMS6J/4xTTfw5Oj80U0TKzqeRjxgVUEtqKiNLj4qpNUQZm7SvQIe51BzmRR7Ww1Zr6+kGNHZzPsbbxRcpFNNPbaIOxuCVfVTUTI39TMz/jWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OwWeFQUt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OwWeFQUt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730108961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SqfhTrRC90Dd+PKtvLPkiBw2YWdMYKe2gx/XQnBau04=;
	b=OwWeFQUt/hAMIMN0l6LEBL/c6TSSih3yZn7ReAJodZyC9hK2lL+oDxc38mHDLXp2UkO/Af
	6blEHsuH1G+Px5pMLQ4U3mydnGTlQIQZoe6GhWlvzgjpDBdHS62xy+7IeG0L+VXphCv1aK
	yzsxUW3H75XGOblwC34QAFMa1lSne7g=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-idIkfLryMP2PqWVglcuDhw-1; Mon, 28 Oct 2024 05:49:20 -0400
X-MC-Unique: idIkfLryMP2PqWVglcuDhw-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-539ebb67c28so2634153e87.3
        for <virtio-comment@lists.linux.dev>; Mon, 28 Oct 2024 02:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730108959; x=1730713759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqfhTrRC90Dd+PKtvLPkiBw2YWdMYKe2gx/XQnBau04=;
        b=i2KXWTrPRDtlHv9e75468JUaKoyzrAn3QB1D3vglm8cW5A+9VeCveQ/yMBPojM+e94
         +qxjX8PEE/Zh4qQHoBWPL2LZlV2YVtYjmw4GhsX0tW6EpM4vaydMSQ3dFr49INWfRsz1
         CrrJmtp4hItXHGVMwLBtCfi63UMos0B60ZZ3Q8uioGUMEJ2+y7kBGJNhJdBQ3eNmzL7I
         J+nWvcGUtkTUd82CyAYo6eCghLzhJtMJIdGXFuCut+hSF4Fe1EgJdRNmPFko6fSbtyId
         AKME/doqtSwD9hl4adaR731x7ow1Zbb4JLrzzM7n5BcVtWqZbhOxhqa5PwBleyWD8HwM
         6CFw==
X-Gm-Message-State: AOJu0YwlezIks0b+36K1MRcZt493hXyM3D7q4CGcR5pwdeVnhO8fHVaq
	kRKQE/qYXrx0cwXbbqUJmDHaat+e6MUw0NtGZDxPkpoCDbQlJhz6o/irIXAn83tF9FWy5X5RsO6
	ztnKlu/DEnbvEf+QLrCSffeBMrpa+XFSsppQvDQqGQ5GdsTtWyIDXN7TJ5R5gP9jT
X-Received: by 2002:a05:6512:68d:b0:538:9e1e:b068 with SMTP id 2adb3069b0e04-53b348cf9ecmr2727176e87.15.1730108958586;
        Mon, 28 Oct 2024 02:49:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWTRHP7Im9HSEsNkGJzuAvRLS5O95OGOc5jA0iKPPSKDWaIw9AZzNUuRIN+VRk4WPa3oOHcQ==
X-Received: by 2002:a05:6512:68d:b0:538:9e1e:b068 with SMTP id 2adb3069b0e04-53b348cf9ecmr2727160e87.15.1730108958136;
        Mon, 28 Oct 2024 02:49:18 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935f74b6sm103644075e9.33.2024.10.28.02.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:49:17 -0700 (PDT)
Date: Mon, 28 Oct 2024 10:49:15 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
	shahafs@nvidia.com
Subject: Re: [PATCH] virtio-gpu: Fix spelling error
Message-ID: <Zx9eG4VOSzo1UK7i@fedora>
References: <20241027044457.495730-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241027044457.495730-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 27, 2024 at 06:44:57AM +0200, Parav Pandit wrote:
> Fix spelling error.
> 
> Fixes: fed64230bf31 ("Add virtio gpu device specification.")
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/192
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

>  device-types/gpu/description.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
> index ba4ea76..c5706bc 100644
> --- a/device-types/gpu/description.tex
> +++ b/device-types/gpu/description.tex
> @@ -128,7 +128,7 @@ \subsubsection{Device Operation: Create a framebuffer and configure scanout}
>  \item Allocate a framebuffer from guest ram, and attach it as backing
>    storage to the resource just created, using
>    VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING.  Scatter lists are
> -  supported, so the framebuffer doesn't need to be contignous in guest
> +  supported, so the framebuffer doesn't need to be contiguous in guest
>    physical memory.
>  \item Use VIRTIO_GPU_CMD_SET_SCANOUT to link the framebuffer to
>    a display scanout.
> -- 
> 2.34.1
> 

