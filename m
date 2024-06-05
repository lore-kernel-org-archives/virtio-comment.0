Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF8149653
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 08:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717577196; cv=none; b=dZRxbxTcvHFaFngxZPHgkW2IfyYe0TTrkjjz1m99xORObcl367kvkImIDBh4RX76p9NUMYcqdXBe5/8dcDuiUugxKHdkmnJ04vauAhXZ8KU0z5n3mCTFvI4dvTxew+2LUOqKeRTi3V2SS2YAEvW+gM3uc7ryBfCszUjS8xanimA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717577196; c=relaxed/simple;
	bh=LDz4GcWeuyeZAK+KOmAKpZfuJPbuAhLJh2wbgTtJBi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=EA/URMI6Z7XTw/T1ju8Pk0pZ+IBgiYBTvOc2eO7AJ/u5MVJQ7kZm4r2uo8nZdLdzGyTuhdy2y6CPo/iyP7PyeuGJPwqrfsdvwBjmpUzX9WnYMhGCtGLGO8/5WIe14vlXeRFz22gWkBkPqYuX+SLLCSMjT5DWZj1oJp0/+fAgxbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LlDf2pHZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LlDf2pHZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717577193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XtMwsCsJoI/j+63itLjBvz0tdP72pKJG6dHkI+3SD28=;
	b=LlDf2pHZX1DCvnd05XyaAJvJvz/pfQJFgtDJ8Xh30fcuUy/nfquguc5mBpYw+REmgB5hBY
	K8s060p9KZ+JkvyitZ6pH0sQu8+XxqW3fYWwQdX9T2h4hEVM85MUf5q4R0njjgAyb3R4Ui
	pi9EIggRJqg9OUfwbMdDuWSacPMp+nU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-I3sbJP_xMtyka7lpOKOsGw-1; Wed, 05 Jun 2024 04:46:32 -0400
X-MC-Unique: I3sbJP_xMtyka7lpOKOsGw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-57a50752cd2so669845a12.0
        for <virtio-comment@lists.linux.dev>; Wed, 05 Jun 2024 01:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717577191; x=1718181991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtMwsCsJoI/j+63itLjBvz0tdP72pKJG6dHkI+3SD28=;
        b=Wc1STFE4bw28MTPSTcUaxBYQpW+Ibuj1IR3KKFBj8wIkeep4W2EbWf7xVkw0tzRs/Q
         23oUPmwYGoAcT99lkhby37Tevay9euGXc2FvNa3mgEDxdR1TifeQPu6UrlARdF0E+Szf
         CrYMO4tSW+A56bwPY54ECQHzR+bPKoarcvEDoGjROj3wAAcvhqxce+wImSpuOEEzWDaF
         0b1/31n+8IwI+D13vfn0LfuVhFZY7Jos49znM/sZjA/YAjPvK3PQp3s76tB/2EelERvn
         uM1Af9RM16snPFbCIEts8GLOcRKWQc0sdOxzKJH7et2DmiBeifW8AihGQTPHWeTX9khz
         hQ9w==
X-Gm-Message-State: AOJu0YxFOxX5qkP5G8Cci8b38sUNeiSi2nLzxzv+ujLG7YlrsR8jTBZ0
	cVvZp9EGLVejV9SpuzB/R3paxxjFgAGgKFvAKWGXrGP8PMosBPevZd6roJjF2kBGlg50XHePtf1
	YGrF7JOyQNZLJr8v1vI9ArSJ47ZQCYEo0OFhQOaGwtfmRcMeOtTj8zmF7bsxaGpsv
X-Received: by 2002:a50:9995:0:b0:578:6019:265a with SMTP id 4fb4d7f45d1cf-57a7a6a3441mr4188417a12.8.1717577191049;
        Wed, 05 Jun 2024 01:46:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUtgxiZI9Tp2g4SL+XjhSE5Kt7VV8nxd+f/0uKLCG8+2zjH/M1tyu9BsTJl8Agi2MiPyjfhA==
X-Received: by 2002:a50:9995:0:b0:578:6019:265a with SMTP id 4fb4d7f45d1cf-57a7a6a3441mr4188397a12.8.1717577190571;
        Wed, 05 Jun 2024 01:46:30 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-58.retail.telecomitalia.it. [82.53.134.58])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31be5695sm9048609a12.55.2024.06.05.01.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:46:30 -0700 (PDT)
Date: Wed, 5 Jun 2024 10:46:25 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, harald.mommer@opensynergy.com
Subject: Re: [PATCH] virtio-can: rephrase notification mechanism
Message-ID: <7wfenngxylsnl73xnspd7r7icc5upuopxcr353tddxpiqlcp2o@4juhjr3m4m3v>
References: <Zkyr3eaCOctSn7BD@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Zkyr3eaCOctSn7BD@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, May 21, 2024 at 04:12:45PM GMT, Matias Ezequiel Vara Larsen wrote:
>Rephrase the notification mechanism.

I'd suggest to explain here what are we clarifying with the rephrase.
Sorry, I'm not a CAN expert, so I don't understand the difference 
between the two versions.

Stefano

>
>Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>---
>* This patch applies on top of virtio-1.4, which has not been released
>  yet.
>---
> device-types/can/description.tex | 13 ++++++-------
> 1 file changed, 6 insertions(+), 7 deletions(-)
>
>diff --git a/device-types/can/description.tex b/device-types/can/description.tex
>index 2511d9c..2931aa9 100644
>--- a/device-types/can/description.tex
>+++ b/device-types/can/description.tex
>@@ -128,13 +128,12 @@ \subsubsection{Controller Mode}\label{sec:Device Types / CAN Device / Device Ope
> \end{lstlisting}
>
> If the transition succeeded the \field{result} is VIRTIO_CAN_RESULT_OK
>-otherwise it is VIRTIO_CAN_RESULT_NOT_OK. If a status update is
>-necessary, the device updates the configuration \field{status} before
>-marking the request used. As the configuration \field{status} change is
>-caused by a request from the driver the device is allowed to omit the
>-configuration change notification here. The device marks the request
>-used when the CAN controller has finalized the transition to the
>-requested controller mode.
>+otherwise it is VIRTIO_CAN_RESULT_NOT_OK. If a status update is necessary, the
>+device updates the configuration \field{status} before marking the request
>+used. The device may omit the configuration change notification as the
>+configuration \field{status} change is requested by the driver. The device
>+marks the request used when the CAN controller has finalized the transition to
>+the requested controller mode.
>
> On transition to the STOPPED state the device cancels all CAN messages
> already pending for transmission and marks them as used with
>
>base-commit: 37c6a406678a5ee891fdf5671298cb4fcfa517f2
>-- 
>2.42.0
>
>

