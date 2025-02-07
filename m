Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315541DE4FC
	for <virtio-comment@lists.linux.dev>; Fri,  7 Feb 2025 11:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738926447; cv=none; b=jTE1R1sgTOuLIIGtTtWjatduHuGp5rV8Sh8hVei50BQglUX9xCtyaQh1Um4EYVY3QBHefNG2AuwsKGwvfL95HYhhSiLtcbydAvYyDB2oxUZYdzFdEHl5IOAKp9oWfyN3y8ag5lENC8bat/twfMz0v8cH6d+iiCmtLSc/9W+Emw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738926447; c=relaxed/simple;
	bh=AiA8121T1n698bwi5aOTL91Xx8aPvY0hToIWr8+wwQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ah+crKfZBKM62uO0W1e76OnfuzFd1NB6U7CBvdoV/2Y7gOFqlDcmEjd/wV4bQSRLHiq2bbVQsBRoTccEtai+lDAwnX/ALvdJzZpF4NL/8tQ0Jg09lYcykc8m+3ItYG/avcDcg9gjHohDsrM8RE2C252ui5a3UwAtcGZ8vZjs4ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NVI9lC5Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NVI9lC5Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738926444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HGxe/Vyf/PNIRpEs1IBGTMONEC3zsW4H+9q5oEIyJ5s=;
	b=NVI9lC5Ys1N/j3AFiygrswPlOk9mKGSDGKYCkUSVgYvUFeLs5Y5qLHdNd5pev5ZidG3zON
	jlblD68TgnnV1wApTI4UiZXx+7Kc8aDYzEGSCO+sgPAqiVM+42pPmA+iSv54qMg7UWO074
	FF+B6mcqAvI224Swfw69giR8qf3u5Wc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-AEx2kbsROma-2BXe6O26vQ-1; Fri, 07 Feb 2025 06:07:23 -0500
X-MC-Unique: AEx2kbsROma-2BXe6O26vQ-1
X-Mimecast-MFC-AGG-ID: AEx2kbsROma-2BXe6O26vQ
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38c5d9530ebso1456223f8f.1
        for <virtio-comment@lists.linux.dev>; Fri, 07 Feb 2025 03:07:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738926442; x=1739531242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGxe/Vyf/PNIRpEs1IBGTMONEC3zsW4H+9q5oEIyJ5s=;
        b=CPSzM/RUAr0HUptyrhSCT/1K55jx1xnLUb4c6sbemJRiBPLg0fSN6PEQcWlmfRFckU
         F/GNA74YK1pNubFy7hWXNSJVR9tPZsSZMwsVIqiUaeyN22G/VRvAHsTE4rN0GfSTetNz
         jJGgUtIdXvVy0SE6oSeqHFuz1Y1YkbT7t1oU14Y9i29p/81ia+UBZTtMGjCiW6J+AAkF
         vhozz8Bus6KvwdxFzyUxodRjRRwCixIerwdv99ooz9flH7hGpcRwiki+B6WRJ8Zvq5SY
         O+6Z1RHQEH0yuSKeAnb7p7eeECPwKsadQ7DYvux0i79lAmmqy+t2YtUoSPlQFuA4Fz6b
         3lXg==
X-Gm-Message-State: AOJu0YwfGVylNAvRU4TrB8k4kp778Fvoog/SVkC+0saqM0tjO2uBTUvV
	2h6GpjY1bFcK2Pw9YlO48fW5xcQBdeCHE/mZpWR9zX8vXjUdDPt8j4J/i3IqnuAuVtaEYX16zIN
	J9AtT3Vx/OA0lwdL6igyZFEZD6dDftISCYnSUgMOVJlCGRhpEwCu1QfWU8EZfBFabvxM5MEpg
X-Gm-Gg: ASbGncv3PkQF+KalpBXTAKMTHdrfFtkrNN8/Z0Z4nlqjO9IViUaT4b4EOJ+rrvfXkmQ
	MpSNLeCGAp5MrJbqObBopHvNzWAEixkiakUJCXKwZMT0g9tA+2Xq+oAZQPV2pgpfrMzZ/+/+N7a
	p7WwgVr4zncIIUbLw7AxPRHk2awfv0NgMNc1jL9XT7go6rHRUlkvmg2OaTxPM3kuGGMCVQawzwf
	QcOvARfqykAf+DyOkgCxMQTt1WtrLe6denjM6Fft0yGOdCYnxi8cSLXUqQLOGAX4iWhZnkBRg==
X-Received: by 2002:adf:f58d:0:b0:38d:a8f7:cb73 with SMTP id ffacd0b85a97d-38dc9138f08mr1817875f8f.40.1738926441998;
        Fri, 07 Feb 2025 03:07:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ2BLKsP7AGTwK/3Q1c8gG4C+2vIMvRxtM8+L5DTgZXpvExzTEjEG7B1c34FQ8do0pRobeUA==
X-Received: by 2002:adf:f58d:0:b0:38d:a8f7:cb73 with SMTP id ffacd0b85a97d-38dc9138f08mr1817844f8f.40.1738926441568;
        Fri, 07 Feb 2025 03:07:21 -0800 (PST)
Received: from redhat.com ([2a02:14f:178:610a:fb15:126:1857:dec9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc846e980sm1950110f8f.73.2025.02.07.03.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 03:07:20 -0800 (PST)
Date: Fri, 7 Feb 2025 06:07:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: virtio-comment@lists.linux.dev, Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH] virtio-net: Fix receive buffer size typo
Message-ID: <20250207060551-mutt-send-email-mst@kernel.org>
References: <20250207-v1-4-topic-virtio-net-receive-buffer-fix-v1-1-efcef167d6bc@pengutronix.de>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250207-v1-4-topic-virtio-net-receive-buffer-fix-v1-1-efcef167d6bc@pengutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TgPspYWWejw5OPtJ-26d-79n7V0xDLHc_I7a65ebmVM_1738926443
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 07, 2025 at 08:48:47AM +0100, Steffen Trumtrar wrote:
> The commit 00806815385340dd411cc67df3f6837935bb5e26 introduced a slight
> typo in the struct virtio_net_hdr size calculation depending on
> VIRTIO_NET_F_HASH_REPORT negotiation.
> 
> Without VIRTIO_NET_F_HASH_REPORT the struct is smaller than with the
> feature. This mix up only occurs in one instance; sizes are correct in
> all other occurences.
> 
> Fix this typo.
> 
> Fixes: 008068153853 ("virtio-net: Fix receive buffer size calculation text")
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Reviewed-by: Parav Pandit <parav@nvidia.com>


Thanks!

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Can you follow the process outlined here:
https://github.com/oasis-tcs/virtio-spec/blob/master/README.md#use-of-github-issues
to get it merged, or do you need help with that?


> ---
>  device-types/net/description.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 4e4ffdb6e04e346af491edf65886fa096e506abc..08736b6804eafb303a5cfb2f27ec200cec8bd942 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -789,10 +789,10 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
>  the IPv6 header, plus 65535 bytes of maximum IPv6 payload including any
>  extension header), otherwise 1514 bytes.
>  When VIRTIO_NET_F_HASH_REPORT is not negotiated, the required receive buffer
> -size is either 65601 or 1526 bytes accounting for 20 bytes of
> +size is either 65601 or 1526 bytes accounting for 12 bytes of
>  \field{struct virtio_net_hdr} followed by receive packet.
>  When VIRTIO_NET_F_HASH_REPORT is negotiated, the required receive buffer
> -size is either 65609 or 1534 bytes accounting for 12 bytes of
> +size is either 65609 or 1534 bytes accounting for 20 bytes of
>  \field{struct virtio_net_hdr} followed by receive packet.
>  
>  \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
> 
> ---
> base-commit: b2990c8a6642e696d6f269d1db991b2c928d3a9f
> change-id: 20250207-v1-4-topic-virtio-net-receive-buffer-fix-b6487b58813c
> 
> Best regards,
> -- 
> Steffen Trumtrar <s.trumtrar@pengutronix.de>
> 

