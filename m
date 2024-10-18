Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A87165EFC
	for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 15:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729267087; cv=none; b=RPDPYNydB5gdIiBKDzs6xn9wv1IpupSotKMW44FPDPxWVFLaLwfi55glnfSZy6Uj+KYMfrdfQLTuMkpb8aXxc+59T1SIFvCJ7R55zn15veMG6+TOWkpZiZOKapAo5O3i16kikjagfpmGxDr+FOEroENOW3lv8dOQg2XXgKoX3i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729267087; c=relaxed/simple;
	bh=qhPibUIy+xu8w+3hRwy2pZ5m9AgPdujbEvr8cnsmNzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=OKKiRn46DlrPLV9Ov9Y+YEypyQhIuvJ9Wj83VU51mfH3wQ+mYVKZZJFtY5R3kGixZH0oM/jUVnwUb4J1gXzhrjytuTc6hDtrrNuM44Hp+ZLQsiQYUJJz6j7yIDAgkeViBuTgP8sJcxOTQouJ/pWhxPbRBLo4TnnvLJbEwrZ2Ltc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aHy9LhN5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aHy9LhN5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729267084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oZZe0K/PZehqmjeVf3aUjRR7M5iURfpfwILRSYwuAHU=;
	b=aHy9LhN5vT3TpFS4Z8F/I7JwWzkbluUv+qiDI8rUbTmCX0hkbZX64yePKIplHztgkmBrgt
	OUsM+UnhLEwh6v1262UpXMeFVRayGSwJ9WoSNduRaFXVy40XdsEsXwbM18ef8J62uSkCD8
	7IKcH56N1fW/zz5QeoTYTwPTTTk6JHY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-C1FaL8QqNlK-Hn2HCHL0Fg-1; Fri, 18 Oct 2024 11:58:00 -0400
X-MC-Unique: C1FaL8QqNlK-Hn2HCHL0Fg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-431604a3b47so8479525e9.3
        for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 08:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729267079; x=1729871879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZZe0K/PZehqmjeVf3aUjRR7M5iURfpfwILRSYwuAHU=;
        b=ZO8vmsPzK9xKm1aXSAmuvuNMy5zLI8u/FkUEKimrCAbCOfnECSsrnZLsB3/8XOH+NX
         SVXRBiSGZGurXa6ZXOV4xERfOKrMYfgUZA8VNsKP4aOwKsOQPJd1lvKHyQDlrmgN6h8j
         ONPM2ucVl5cIxW4NKjm2UqPNIN/d+4dXNFnqUVheHeWojF+lt0zK3KQ8ZSERfAsnJ2k0
         yPCN+/JjfH2+J+r+f/F6CthTKuSSqTojlxYrnsnwp+mq409fT9W/KF3FKxphCV6G6R3g
         fg8fWCsi5WPRr/2aa1tHOj0LppxZaFk2l3+hy01iPFhMwASJVvUAtcFwYKbKzjcUyazq
         QqiQ==
X-Gm-Message-State: AOJu0YzH6S6IYn6RP4xTdYlwwJzwPMUfRnq5OIF43WievEyHiPY8lDMF
	kRZvvvI3INpPfviti4f1/hYxXN9iLctdviuyk/U58JMtDMdTuRGm7hniljWVnyBBTEuE2pfkLHR
	I5E4NCuIv7E/giLoWtU1ZtAJ7vxzBi/e93rD2NrRdPWbwq3XnIqyKGJX2HuTxjr90
X-Received: by 2002:a05:600c:1c9b:b0:42c:a6da:a149 with SMTP id 5b1f17b1804b1-4316168988fmr23192005e9.25.1729267079681;
        Fri, 18 Oct 2024 08:57:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNdTOZHQcGhMo41J6XZvUbkMhii5oX8RGzweY7/myx6rBItK4p4k7FD19WxKnnxuoVtmkloQ==
X-Received: by 2002:a05:600c:1c9b:b0:42c:a6da:a149 with SMTP id 5b1f17b1804b1-4316168988fmr23191835e9.25.1729267079301;
        Fri, 18 Oct 2024 08:57:59 -0700 (PDT)
Received: from fedora ([78.242.166.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160dc9791sm27252815e9.15.2024.10.18.08.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 08:57:58 -0700 (PDT)
Date: Fri, 18 Oct 2024 17:57:55 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
	shahafs@nvidia.com
Subject: Re: [PATCH 1/3] device-parts: editorial: Replace duplicated part type
Message-ID: <ZxKFg2gR8EiRK+7g@fedora>
References: <20241018131741.443635-1-parav@nvidia.com>
 <20241018131741.443635-2-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241018131741.443635-2-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 18, 2024 at 04:17:39PM +0300, Parav Pandit wrote:
> Device part type VIRTIO_DEV_PART_VQ_CFG was duplicated in
> the description; it is supposed to be VIRTIO_DEV_PART_VQ_NOTIFY_CFG.
> Fix it.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/209
> Fixes: 617aa2d62a88 ("Signed-off-by: Parav Pandit <parav@nvidia.com>")
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  device-parts.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

> 
> diff --git a/device-parts.tex b/device-parts.tex
> index 7197929..e59c0f9 100644
> --- a/device-parts.tex
> +++ b/device-parts.tex
> @@ -75,7 +75,7 @@ \section{Device parts}\label{sec:Basic Facilities of a Virtio Device / Device pa
>  
>  \field{selector.vq_index.index} is the index of the virtqueue. It is valid
>  only when the \field{part_type} is VIRTIO_DEV_PART_VQ_CFG or
> -VIRTIO_DEV_PART_VQ_CFG.
> +VIRTIO_DEV_PART_VQ_NOTIFY_CFG.
>  
>  \subsection{Common device parts}\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts}
>  
> -- 
> 2.34.1
> 

