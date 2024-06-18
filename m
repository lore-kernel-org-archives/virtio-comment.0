Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B9E13A248
	for <virtio-comment@lists.linux.dev>; Tue, 18 Jun 2024 10:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718708326; cv=none; b=ui/O1VTkPwU9MQoalB/FdISzRORqamssreBFkyYM1HUgAKTrHDmkyripTyxu5CKhoeRqRrckQE+xiBFDgNEucnyX0YXsYLfH6+xPosAWQPwOo0vlZNHJHnRT7XD6O91mmuArdNxnTP1gMUVd6TpsorOoGHFv/2UKaT7dYV5C6pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718708326; c=relaxed/simple;
	bh=kbWUJ1NKJH4WwR6SK4qywWN9jiCRczXp8H/UO5hl+ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=j57aK92E+yTaSfUGDV7ukDRrKCNUGhEpr1mMTAP+Y5U31FhIW9OfQY7qPddoDsqovm6z0EH1UBuu08B+hIFe7edTb9fffUAFkQTDHEeVbeioGI1g6IWlBsLmkQ0lHQIYVQlATJF716x1DLLh0+0UOZiS3X3m4wWXshpqOmzPWxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MD9DAVc+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MD9DAVc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718708323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zi3ZBytc1ZBbQu5ZqDShk0RiUBQ+Ivy/b5wScf7Nn2I=;
	b=MD9DAVc+x7HDJjd/enSCYZeYoaYYW7sPo8S32BXEFAoHlPzbBVk8nYKXwjnN/HNgcJ/tjl
	ILcFfFbBOmqzVvwWnk6oQ8YnajtkPGqYCTN/ZcSN9BHlmPvOj2Nuk9fX2Zgu5IARBeWnsf
	eyjfFQfmtVpse2a0sNBV/XHIRZZV638=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-xfRWcdJ0MjWvBUalRbFP7A-1; Tue, 18 Jun 2024 06:58:42 -0400
X-MC-Unique: xfRWcdJ0MjWvBUalRbFP7A-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-362c8b9a09cso8782f8f.1
        for <virtio-comment@lists.linux.dev>; Tue, 18 Jun 2024 03:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718708321; x=1719313121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zi3ZBytc1ZBbQu5ZqDShk0RiUBQ+Ivy/b5wScf7Nn2I=;
        b=hekwbAloecoRGD7EW142Sit6q3dUoL1fBd8ouHw6q67jED8Ep4mWVsF8LGkxQcL3FH
         cfIdJYAqGRzNZ5xTTA88EsTzLAIZo1CvHd3nswWYMN7g1SUfvgzsyfJdIGTjpPD6sHk3
         WkanrdMMQBj3lOTXgZ7IAgF0oe/LoBoCYuVtCSPpJ3uOZnodLW8QARNGHx2Za3Kv9mml
         RM9erDgyYkdLERGXXM5yil1tD+4UhFUMgadogSNvJbrk/fTlvQFU/CNoTvaiKA2xHCBi
         Vf8b/yTVmsAiJSP6ERdm1YgfB5wsPMaTB3p7cIg0HCDBISgQ5YiYgAFEWKaRxZnAdiAa
         kh8Q==
X-Gm-Message-State: AOJu0YzOu5VM/lZGMbaeo0fEzeHnMdK4ZYqcZy863vFhfWJud8Q3BZqc
	KvG0VvBaY0cIM+f2uv+uccR6Eq2BQDVLLIGaXlICj1o5NtHArxhYG7WY9ltMKACJqHDDlaQzbCw
	gKWuhap90R6Wreh5kd33amCBtKaIwczKLYrAQFmAfCIAD/aNmvzAPCHDFFYgbElqy
X-Received: by 2002:a05:6000:47:b0:35f:1bc3:50b0 with SMTP id ffacd0b85a97d-3607a7844e7mr8890868f8f.63.1718708320896;
        Tue, 18 Jun 2024 03:58:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5e5LfxFkm84Dg4Ev2N/DqImPeZsmbelNcdAxvtw5y2TITqRT/rZfL7mnXU0hTlsS7j9H6sw==
X-Received: by 2002:a05:6000:47:b0:35f:1bc3:50b0 with SMTP id ffacd0b85a97d-3607a7844e7mr8890845f8f.63.1718708320349;
        Tue, 18 Jun 2024 03:58:40 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:67bf:ebbb:9f62:dc29:2bdc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750f241fsm13970721f8f.88.2024.06.18.03.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 03:58:39 -0700 (PDT)
Date: Tue, 18 Jun 2024 06:58:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Keiichi Watanabe <keiichiw@chromium.org>
Cc: virtio-comment@lists.linux.dev, uekawa@chromium.org,
	takayas@chromium.org, dverkamp@chromium.org, tytso@google.com
Subject: Re: [PATCH 1/1] virito-blk: Support NOSPC error
Message-ID: <20240618065456-mutt-send-email-mst@kernel.org>
References: <20240618081858.2795400-1-keiichiw@chromium.org>
 <20240618081858.2795400-2-keiichiw@chromium.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240618081858.2795400-2-keiichiw@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 18, 2024 at 05:18:58PM +0900, Keiichi Watanabe wrote:
> Add a status code to indicate that the storage is full on the virtio-blk
> device side.
> 
> This is useful in scenarios where a virtio-blk disk image is provided on a
> sparse disk and the host storage is full.
> In this scenario, the driver cannot create a new file to the disk image
> because the sparse disk cannot be expanded.
> However, if the host have a service that clean up host stroage regularly
> by wiping cache files, the guest may want to retry the request.
> For this type of special handling, this error should have a separate
> error code in virito-blk.
> 
> Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>

Unfortunately we did not think about it and did not specify how
drivers should handle any new error status.
So I think we need to burn a feature bit on this.


> ---
>  device-types/blk/description.tex | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
> index f04c932..5a34bd5 100644
> --- a/device-types/blk/description.tex
> +++ b/device-types/blk/description.tex
> @@ -532,12 +532,14 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  
>  The final \field{status} byte is written by the device: either
>  VIRTIO_BLK_S_OK for success, VIRTIO_BLK_S_IOERR for device or driver
> -error or VIRTIO_BLK_S_UNSUPP for a request unsupported by device:
> +error, VIRTIO_BLK_S_UNSUPP for a request unsupported by device or
> +VIRTIO_BLK_S_NOSPC for an error that device doesn't have enough space.
>  
>  \begin{lstlisting}
>  #define VIRTIO_BLK_S_OK        0
>  #define VIRTIO_BLK_S_IOERR     1
>  #define VIRTIO_BLK_S_UNSUPP    2
> +#define VIRTIO_BLK_S_NOSPC     7


Hmm. It's the last free bit.
Seems like a bad idea to burn it on a limited use-case like this -
I would say we need to make bit 7 mean "any other
status" and then report the actual status somewhere else.
No?



>  \end{lstlisting}
>  
>  The status of individual segments is indeterminate when a discard or write zero
> @@ -567,10 +569,11 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  Requests of type VIRTIO_BLK_T_OUT, VIRTIO_BLK_T_ZONE_OPEN,
>  VIRTIO_BLK_T_ZONE_CLOSE, VIRTIO_BLK_T_ZONE_FINISH, VIRTIO_BLK_T_ZONE_APPEND,
>  VIRTIO_BLK_T_ZONE_RESET or VIRTIO_BLK_T_ZONE_RESET_ALL may be completed by the
> -device with VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR or VIRTIO_BLK_S_UNSUPP
> -\field{status}, or, additionally, with  VIRTIO_BLK_S_ZONE_INVALID_CMD,
> -VIRTIO_BLK_S_ZONE_UNALIGNED_WP, VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or
> -VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE ZBD-specific status codes.
> +device with VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR, VIRTIO_BLK_S_UNSUPP or
> +VIRTIO_BLK_S_NOSPC \field{status}, or, additionally, with
> +VIRTIO_BLK_S_ZONE_INVALID_CMD, VIRTIO_BLK_S_ZONE_UNALIGNED_WP,
> +VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE ZBD-specific
> +status codes.
>  
>  Besides the request status, VIRTIO_BLK_T_ZONE_APPEND requests return the
>  starting sector of the appended data back to the driver. For this reason,
> -- 
> 2.45.2.627.g7a2c4fd464-goog
> 

