Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0693E7EF09
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 10:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720781177; cv=none; b=Dap5nXiszMjldKQR+pTEPwcyGfMKyIuxdj0mMIY77hRu1G/lM4HVSx8ww83GHEWnxSK0yaWLJueT7OECGL7gUHcUdVid2Hd9KOlNE0RO/OJ3B9ZivHm9PB0b3sApra/7T8lHN8CProQu2xuRxnT/ivu/1S2W05yCPx0rwhqW3aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720781177; c=relaxed/simple;
	bh=5RnEWRTKAN67CCaC9CbcSBebL6Q4Y5JZgPX+rGtZLEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Aw7T30nnRwc+c6B17VX/xD/Dqr6ZSwjv1YEEqWj5IGHVn3i3fkb97EPo/5PT4eaqPWXHrHU5zawPbsSfUrsgXNF/dOQmvvWESCMqpPBjXhTSRNBtAgFNNXT/gAirXPpom/IoFpzZa5FREXVQlDwjcKWgnQM1bQxa0mzrARYEpCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CuZSpGVf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CuZSpGVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720781174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oTOEegfoV+q1czJS9uALpynyVfLpiCxxEOTXlWtZLyg=;
	b=CuZSpGVfqgYie/6xv/VdTv2RWfvRACAc9zPQKFYHfyAcdA/nU5ilGObXb2pdEDQUdlzsF5
	3HgEAHDaHr0m59rlTIhoMh3o01Ne3eNeLkHmv8UcT651WIA/SfqqM/HEaJ1d0ExSuPya9T
	JI/t3DsxKV8k0PhoakaZ63Dr+h32p6k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-oNPTTLA_NAOQe9z7JI0PeA-1; Fri, 12 Jul 2024 06:46:13 -0400
X-MC-Unique: oNPTTLA_NAOQe9z7JI0PeA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-426724679f0so15337145e9.0
        for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 03:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720781172; x=1721385972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTOEegfoV+q1czJS9uALpynyVfLpiCxxEOTXlWtZLyg=;
        b=wyEwfICOM2OpMwlcbzTam4crH9docjGlCQxyKdSrLrMjKWU7B0TGlfUhWwh8eCM05i
         8Y4UNTWb4KORfR6frMg89Do8jy7Q7jxASBD+OyRebWxNykmkHDi5AaGqV/bKr9E21+g2
         5h2r5Nd7MSOU7LolkVI6wnMku4iw/Cg/RjUY2tfLokOd5YTFWP/eJMZi7P4SHMw9Fi60
         rBiRlITREyzepaqVbG1U1zR1NF/m8X1D9Zuiq1cCAbSp+O0rmXKUjP2rbkKFE9RZ4V8R
         WHozcbTDfDuJgDvb/bJ4hpsRIxTpdh4qTJi8/nZP/VpUHMYhs8JzpGo2KxAemtjYRlpF
         QavQ==
X-Gm-Message-State: AOJu0Ywx0C7IHGsnSxBWx0iH6rYxjyiqGZBcNbIGw4PjC5XVpJmN4aFd
	bxX0mfDKl3MBirVRMj9+/py7kELuvww6SvRLJQVc2qicJiDe7nY/S5A/ZnSJDtBEoDF+P3e7Z2g
	1PI3l3aWaUV9m7DwkRv7blvDHQqvJmfgo2AZagZyMUjXDrhoxtCR/ggWE9WMmCAz/
X-Received: by 2002:adf:fd87:0:b0:367:40b6:b90b with SMTP id ffacd0b85a97d-367ff6ee148mr1712249f8f.10.1720781172188;
        Fri, 12 Jul 2024 03:46:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv9hA24L47sQoGcYqVLnatkpgQPGtRaOuC3OPIKmn/NWT3qPQ9Quyc33WfoVogp6gi08s3SQ==
X-Received: by 2002:adf:fd87:0:b0:367:40b6:b90b with SMTP id ffacd0b85a97d-367ff6ee148mr1712232f8f.10.1720781171800;
        Fri, 12 Jul 2024 03:46:11 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2c262dsm20502715e9.48.2024.07.12.03.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 03:46:11 -0700 (PDT)
Date: Fri, 12 Jul 2024 12:46:09 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, harald.mommer@opensynergy.com
Subject: Re: [PATCH] can: drop a broken conformance link
Message-ID: <ZpEJcaI2D1ETfqkF@fedora>
References: <87a6c3c4463e9f304cdd5dd5fac2194a95a8bcd2.1720724591.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87a6c3c4463e9f304cdd5dd5fac2194a95a8bcd2.1720724591.git.mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 11, 2024 at 03:03:17PM -0400, Michael S. Tsirkin wrote:
> CAN device has a single device conformance section, drop
> a link to a non-existent section, fixing a Latex error.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  device-types/can/device-conformance.tex | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/device-types/can/device-conformance.tex b/device-types/can/device-conformance.tex
> index f944ffd..3725164 100644
> --- a/device-types/can/device-conformance.tex
> +++ b/device-types/can/device-conformance.tex
> @@ -3,6 +3,5 @@
>  A CAN device MUST conform to the following normative statements:
>  
>  \begin{itemize}
> -\item \ref{devicenormative:Device Types / CAN Device / Feature bits}
>  \item \ref{devicenormative:Device Types / CAN Device / Device Operation / CAN Message Transmission}
>  \end{itemize}
> -- 
> MST
> 
> 

I wonder if authors just forgot the`\devicenormative{}` in 5.20.3
section: `Device Requirements: Feature bits`. I added Harald in CC.

Matias

