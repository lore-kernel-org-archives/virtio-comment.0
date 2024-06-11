Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428681553B5
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 23:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718147522; cv=none; b=PU/TOUffLVVW1yJpy5cigx4G9xrEq+ZT2BxWyr/N6DSxaKHwsZ7kI0K6Q47PHJXz8zyEOVtK84riS4RQLxL9cQDOae+2ZZrJkgXFlMuixxrgPGV6KZqZ4W3trzd9D6aGSrXPSG5c8Czd9zzpv7oX3dkykVsu62GZM5F2kLj5Fd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718147522; c=relaxed/simple;
	bh=myveip1TP36uQ7/o2jZC9Lt5VGWJn+MAanFpm8U5cEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=lnuC4PFMKx4U8ZetNHF7DL2G6Y+hxI4dEsLi7cwN+teG7BL3UF9BVXLvTGYldWTchEXZqJUG1Zk+aMQwgFCczPsl94nrPiZmSCJ9jV0cg1BVdnFnGreTU4mhNrrCkAVvlZtKt8OmK5Nt5cFlJn5NlGhe50g0kJlP1o37EF2+7Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jVPcZL1c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jVPcZL1c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718147520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=naOzbf8clgGT+b4KN4QLHvd5549VPU/weD7QEfEWCrI=;
	b=jVPcZL1cKrWmdu5I6dECNG/x2U3oRBiYkGbQmXdHnmKwELfxD8GUgnvVKPxjxuzXO3tYtL
	zQzRyS98Pex5p/FjwteN4elFfDNHh4BAyl9cIhIxoUPbot8eDhDeSy2V7ZXmSKU0SDbC6K
	gsMdwAzEEuvl3HtnPlsp3KAGJqM9oIQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-l3sNcMcOPCm31H9duDcrXQ-1; Tue, 11 Jun 2024 19:11:58 -0400
X-MC-Unique: l3sNcMcOPCm31H9duDcrXQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-421eed70e30so19046055e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 16:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718147517; x=1718752317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naOzbf8clgGT+b4KN4QLHvd5549VPU/weD7QEfEWCrI=;
        b=q944VfwBk4/k9duVIIlNzLGIkuJh6wC6OMtRqSVWHeJI+uHnXIlf7d4tyyUPlDwtnZ
         0/bCcTY22DIh1VaV0KwHbwyeWNivQ6DATSAadLpdwXZA8yYzsIZntj/IBioz4Nl1gxnS
         HV2iTS8q16aPMa19bb8LlYukoYlPHLTTds7+BvPamTzDDXi2FD0vpylTBZGCba5MMIfd
         5QwRPrRvWwfz8ZS6wdm173utlBStxKOEpC/EmkQQz2DuXUuSaBQgYoWJDo0moARNX2d7
         mF2+8Y4f6Q6s2BrpMANDRtF/T1XqdJhpyA5fNKtELfORsVKYSrU1lTqiMnz1Ei/CDnhV
         P1uQ==
X-Gm-Message-State: AOJu0YzOR7gbw2OR50Jn0Iw7EhBFeouaDNaaZnhMDYGlFg2YmvTWYT9J
	z4RwNF/qBoe6nAwasz7ih58Knuo5u+wLsP456t5AYULhpg18m0xE35uOGrLR6NjHEpTZ4ORD9J1
	bWbHhUiVXB1QS1Z/M0NlIzx2GXOkf8CXUrPlnN/u1KlOTjfZQ0QBcWIp6JUoXK/rIkJ72CU8m
X-Received: by 2002:a05:600c:4c12:b0:421:9502:3f24 with SMTP id 5b1f17b1804b1-422862ace31mr1532495e9.14.1718147516857;
        Tue, 11 Jun 2024 16:11:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpehwqA3AAPhLnXCMTNLuhp5zAyIdSB7whJYDoheQ146Gk4rgFXjzEJNjgLpdULcMMnPyywQ==
X-Received: by 2002:a05:600c:4c12:b0:421:9502:3f24 with SMTP id 5b1f17b1804b1-422862ace31mr1532415e9.14.1718147516362;
        Tue, 11 Jun 2024 16:11:56 -0700 (PDT)
Received: from redhat.com ([2.52.131.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe9263sm3138445e9.15.2024.06.11.16.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 16:11:55 -0700 (PDT)
Date: Tue, 11 Jun 2024 19:11:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com
Subject: Re: [PATCH] content: Add link for the feature bits chapter
Message-ID: <20240611190949-mutt-send-email-mst@kernel.org>
References: <20240611175721.2550759-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240611175721.2550759-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2024 at 08:57:21PM +0300, Parav Pandit wrote:
> Device common feature bits overview in the basic facilities and
> their actual description are apart by 24 chapters.
> 
> Help reader to directly reach out to feature bits definitions from
> the basic chapter.
> 
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  content.tex | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/content.tex b/content.tex
> index 8849522..c3531e2 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -97,12 +97,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>  Feature bits are allocated as follows:
>  
>  \begin{description}
> -\item[0 to 23, and 50 to 127] Feature bits for the specific device type
> -
> -\item[24 to 41] Feature bits reserved for extensions to the queue and
> -  feature negotiation mechanisms
> -
> -\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
> +\item\textbf{0 to 23, and 50 to 127} Feature bits for the specific device type
> +\item\textbf{\hyperref[sec:Reserved Feature Bits]{24 to 41}} Feature bits reserved for extensions
> +to the queue and feature negotiation mechanisms
> +\item\textbf{42 to 49, and 128 and above} Feature bits reserved for future extensions.
>  \end{description}

Not everyone is browsing online, printing and reading should also work.
So no need to be cute, just add (see \ref[sec:Reserved Feature Bits]) or some such at the end
of the sentence.


>  \begin{note}
> -- 
> 2.34.1

