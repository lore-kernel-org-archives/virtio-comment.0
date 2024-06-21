Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99D010795
	for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 13:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718977527; cv=none; b=KhJZonWvpEmkod0kKhnT5hlzNs77cI/vYAViR0S6kliySv57+GBYnt+8uq1pIlvGgCuO6if+niRFb0UiMZiqGusaPLmy8J9mEqG9XYhiblTfVT399K5gciGPcCYYNtRlv9wTq/+S2x38w8v4rJKpdLKSg+wGScpjICn0+Xc1TSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718977527; c=relaxed/simple;
	bh=VyyZIGDzR/1lAk30KbJPcM9K2aKb3FT82O34+vrWURM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=boaLayAcQrZqcX0mBDkVUdzx/wnBQQUFZKCi7rraPTEV2aOwio35Fg5pJxN2o6RYI+PXQqTzYE/XpN376F1cTvxjYuVTdxP3QX3vLLBhOJh6tAjHNm8VuE2WRsM0qYbXZXqhbPygmWAl/ffXemzrIAjH+8p87AQmW0iqtbxX5x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SI5rOkox; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SI5rOkox"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718977524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2NG+tNas2FfxDHIxqnAGm3J/EdNfe9P6BnRh9ZriZ8g=;
	b=SI5rOkoxvlf3GYImUQ+sYobZq4dvHeRxaaO+2lLMLX9ST44qME0QF2UiB4pPFZWNpwWg/3
	g//5clZEIWsOWqmbccCQ4lTG1vCrcFy5TeNmhyjFGk7iTVenbVAHtaETUlWXl6M430lreL
	2ogINxbfua1G1EN1xTiNED2FW6ukioc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-wqWzQ95LOZm6TzM4qEzsTQ-1; Fri, 21 Jun 2024 09:45:23 -0400
X-MC-Unique: wqWzQ95LOZm6TzM4qEzsTQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3580f213373so1180325f8f.3
        for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 06:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718977522; x=1719582322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NG+tNas2FfxDHIxqnAGm3J/EdNfe9P6BnRh9ZriZ8g=;
        b=EA8/osJnBuLyeN3tHDgcc7G0OVtlDxhE/Kno5MsHvUJ71sKpob+qLKVqCJKh/+57h2
         BGfUhyoq0jcjyuT70Do49umQriCu14bJJCZfH4p0a5iAEUwTOyht1d92GuNm+xjuz+JP
         2YjSsSKDSukjgoMqpU2CSY2TaOWbVq8yxm2WMONqFyAKEReGNNL0wo4ywJY7sbebSwLT
         /gBsypzgVliyj1YoWgyvC/Hlw9rTFFn4x8/WxeYY+LZUNGI1AyCYV+c2l3DgLSGM8+V+
         WqEay9FxUCEyX5p0CJiUOIyc1PpZJD+meRC/Sy7tPC/e51HKtGVF5wrGUJAyw8GkjREh
         YPGA==
X-Gm-Message-State: AOJu0YyKsE+DtInKWTL2BW712y4qj52fsQZ/DO0QPxYUxpmwIHwiwHk9
	RL/XiKgnqlSMmPe2ZbmbVIcyzYblBSiU2oFy0Opaeu2loG48ey2N4P6EPQ8B67fXtvoBf8/YEC2
	/Nnae/mahic/tdo5F+GTszMYKwO/pAGpLST02hqOmoXqEln3HRTHupA8X1r8kpW4uLXXZhwc42R
	NNGmkT7dA6LOIw4D7kQTWacn57PZJLpDNjMcV1bskJz/qi8dgB
X-Received: by 2002:a5d:63ca:0:b0:35f:2030:d42c with SMTP id ffacd0b85a97d-363175b8160mr5644360f8f.17.1718977522077;
        Fri, 21 Jun 2024 06:45:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs3BygBCcH9JW5yHRS8sjb2Zq5F37xBTBiuFJ5QT+IFcX1bRWmKZlvX6noLjroUgROgOOcvg==
X-Received: by 2002:a5d:63ca:0:b0:35f:2030:d42c with SMTP id ffacd0b85a97d-363175b8160mr5644338f8f.17.1718977521661;
        Fri, 21 Jun 2024 06:45:21 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663ada0db7sm1801156f8f.116.2024.06.21.06.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 06:45:21 -0700 (PDT)
Date: Fri, 21 Jun 2024 15:45:19 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: harald.mommer@opensynergy.com, sgarzare@redhat.com
Subject: Re: [PATCH v1] virtio-can: rephrase notification mechanism
Message-ID: <ZnWD73DL6ISAaPqb@fedora>
References: <ZmsXXumHlQXnU2Wm@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZmsXXumHlQXnU2Wm@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 13, 2024 at 05:59:26PM +0200, Matias Ezequiel Vara Larsen wrote:
> Rephrase when the device may omit to notify the driver due to a status
> change in a more straight-forward way.
> 
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
> * This patch applies on top of virtio-1.4, which has not been released
>   yet.
> 
> v0 -> v1:
>     * Rephrase commit message
> ---
>  device-types/can/description.tex | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/device-types/can/description.tex b/device-types/can/description.tex
> index 2511d9c..b13da9c 100644
> --- a/device-types/can/description.tex
> +++ b/device-types/can/description.tex
> @@ -128,13 +128,12 @@ \subsubsection{Controller Mode}\label{sec:Device Types / CAN Device / Device Ope
>  \end{lstlisting}
>  
>  If the transition succeeded the \field{result} is VIRTIO_CAN_RESULT_OK
> -otherwise it is VIRTIO_CAN_RESULT_NOT_OK. If a status update is
> -necessary, the device updates the configuration \field{status} before
> -marking the request used. As the configuration \field{status} change is
> -caused by a request from the driver the device is allowed to omit the
> -configuration change notification here. The device marks the request
> -used when the CAN controller has finalized the transition to the
> -requested controller mode.
> +otherwise it is VIRTIO_CAN_RESULT_NOT_OK. If a status update is necessary, the
> +device updates the configuration \field{status} before marking the request
> +used. The device may omit the configuration change notification when the
> +configuration \field{status} change is requested by the driver. The device
> +marks the request used when the CAN controller has finalized the transition to
> +the requested controller mode.
>  
>  On transition to the STOPPED state the device cancels all CAN messages
>  already pending for transmission and marks them as used with
> 
> base-commit: 37c6a406678a5ee891fdf5671298cb4fcfa517f2
> -- 
> 2.42.0
> 
Dear TC,

I'd like to request a vote on solving issue 199.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/199

