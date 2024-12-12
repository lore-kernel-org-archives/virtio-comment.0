Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1889720E02C
	for <virtio-comment@lists.linux.dev>; Thu, 12 Dec 2024 10:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733998784; cv=none; b=Rh30diAqwOyUkrwHjhdOXOwR3L1CFjx10776ORVfi5PILwdeIbCRSZoNgVFJtEQy2na7NXMu0ow7ty6wHcWzPhX4ePiPLYQnhjl5uqjtUG2Zks2xZpsHqyRBDM2hMz+cJtO+iRWqwxmlOyFe6wN6RufqCnbo8hlvM6IAO7C2MoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733998784; c=relaxed/simple;
	bh=k4PfiTeLdYQoeD2sdq2RZmJHgOXbdvb+0SG1y1PIqXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=A4jZbJosDrLYJIc+YGALhXp3FhI2ml3GSarNqgskbgTc4BSxZz2/9eXrTIzrgtiP/uuyOYTyGYhHvWIWkV6N1BxNFTKQIqN4NChCCfrXTBV1bdgQ0Jnu+rJJR0N5OHvy1jxUn0WgIRyKDbBoiQ2CoCz0cgWhXEUFDr3bksmagF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V1Lugfif; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V1Lugfif"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733998782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sJPxQD1Gw5pEEfFssbi3xL/NR9GKKNe+XEV71lfZ0mo=;
	b=V1LugfifNknllNB06fbW+NX2I32bg7L64IlPHvRtsZ/kEzCQPjEQiLJt3G/3MI0k5ZABJD
	LkTo7qoRxgyZnxSr0la7oPdX8A52+GFcMc5BjhTwGUyqlN3sjBMw6phzOq5F6Puhk9CAY0
	OV2IdyaPTA+E6oUaMoYlWCdcDlkVezs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-XlNsmB9hOsGP7Hzf7NlmvA-1; Thu, 12 Dec 2024 05:19:41 -0500
X-MC-Unique: XlNsmB9hOsGP7Hzf7NlmvA-1
X-Mimecast-MFC-AGG-ID: XlNsmB9hOsGP7Hzf7NlmvA
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4361c040ba8so2214475e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 12 Dec 2024 02:19:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733998780; x=1734603580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJPxQD1Gw5pEEfFssbi3xL/NR9GKKNe+XEV71lfZ0mo=;
        b=BQvlsZrEo39h7dUnFu56+L2Q5dGV0N6x+HHY/t1tAUXxbERBSbPxv/Y2PAoQeRWIaN
         N8//gsj6BJ7RJkWN8LGjOnSi291tqLY2GNa0MP/NDZcuYmwEwjTxtmF+PIrrYmr+4cnv
         VRovKO8g/b5/FD1Z8j1Cwxhp+yQdp38GjVhRgU5yHYso90JSicKXubzVpEv8Y7V3bF1L
         y56+V8sG3nmOlqpDuBrfvukm2Tr5AwBoB1Hze+ycvwxDAdxRS7s2xNpajE0laeOwkC2p
         +6k2Vdv2kM78pE19gu5wwf6xXUVQJIABq9ZL7Tan13Fjxh+QhOlobKLUo3XqzDUE/v9+
         THwg==
X-Gm-Message-State: AOJu0YzFO3rinAERpLicN1jGWfJe5aeVEFheAJKIU9G91JqLg23fr82m
	mrzxWcyZ5w0MhKNkullNcHDU5Uz3g6Dd9pqAcKQNbRnu2r5Nah0IsfqmOrxjgZ/fpN/g3RlZfyT
	9P2uL1Cl28Dcdo2c2KWQIBvU+FF1A3WpCDMCWnEOe015ekye77p8nh64fdyD5ESWa
X-Gm-Gg: ASbGncs+CK7rKSrxn1bBFxPmDM17n3g8PHt6FpAWAGcBVpqj8jVdhDngf2Y+3wp2pv+
	WRc5dwtil8QOzj6AsBQkQEstT0CjLfyp16Mg7MR518tNSwkbIbFR7x1S649+OPVp6qq+ANqp25v
	GCeZbxNQ//BqTiKGCY9jF72mNPkd4pXkTNF3V+f6tVg/ZnlmTGs9Qy0q4+edqJCS48xENuIoLoL
	9FQTojp9AdjGTdXv2ztlqxR5zQJvDHbBwuWmcFAZQ/AsEUYROg=
X-Received: by 2002:a5d:64ab:0:b0:385:f7a3:fea6 with SMTP id ffacd0b85a97d-3864ce5471amr4941580f8f.13.1733998779905;
        Thu, 12 Dec 2024 02:19:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMYNj8Q9B1Whcbr4FSwrGk3m2yyV+O7uKwqDhhOlj/6uPGB57ZcH73V8sj6d1OcGtCkg2Yvg==
X-Received: by 2002:a5d:64ab:0:b0:385:f7a3:fea6 with SMTP id ffacd0b85a97d-3864ce5471amr4941558f8f.13.1733998779552;
        Thu, 12 Dec 2024 02:19:39 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878248f680sm3664150f8f.9.2024.12.12.02.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 02:19:39 -0800 (PST)
Date: Thu, 12 Dec 2024 11:19:37 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Srujana Challa <schalla@marvell.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
	parav@nvidia.com, sburla@marvell.com, ndabilpuram@marvell.com,
	jerinj@marvell.com, anoobj@marvell.com
Subject: Re: [PATCH RFC 0/4] introduce IPsec Service in virtio-crypto
Message-ID: <Z1q4uZhvFykp1DO9@fedora>
References: <20241115114523.1787840-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241115114523.1787840-1-schalla@marvell.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AAAhJgNELEXmw1scIbilyjCgTukzdKrFLQUKIq6Uiks_1733998780
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 15, 2024 at 05:15:19PM +0530, Srujana Challa wrote:
> This series enhances virtio-crypto by adding support for IPsec
> services. These patches aim to extend the capabilities of virtio-crypto,
> enabling it to handle IPsec operations efficiently. In addition
> to standard crypto processing, the IPsec protocol processing is
> also offloaded to the Crypto device as lookaside operation.
> 
> It utilizes new virtio basic facilities, including capability and
> resource objects. Below is a summary of the changes introduced:
> 
> Patch1:
> This patch introduces the foundational support for IPsec services within
> the virtio-crypto framework, outlining the necessary capabilities for
> IPsec operations.
> 
> Patch2:
> This patch adds resource objects required for programming IPsec Security
> Associations (SAs) for both encryption and decryption processes.
> 
> Patch3:
> This patch includes new opcodes specific to IPsec operations,
> facilitating the handling of IPsec data requests within the
> virtio-crypto driver.
> 
> Patch4:
> This patch specifies the requirements for both the device and the driver
> to support IPsec operations.
> 
> These enhancements are for providing support for IPsec within the
> virtio-crypto device/driver, improving security and performance for
> virtualized environments. We believe these additions will significantly
> benefit users who rely on virtio-crypto for secure data transmission.
> 
> Srujana Challa (4):
>   virtio-crypto: Add IPsec service operation and Capabilities
>   virtio-crypto: Add resource objects for IPsec outbound and inbound SAs
>   virtio-crypto: Add new IPsec opcodes to data request
>   virtio-crypto: Add device and driver requirements for IPsec operation
> 
>  device-types/crypto/description.tex        | 476 ++++++++++++++++++++-
>  device-types/crypto/device-conformance.tex |   1 +
>  device-types/crypto/driver-conformance.tex |   1 +
>  3 files changed, 473 insertions(+), 5 deletions(-)
> 
> -- 

Hello, 

I went through the patches and I commented some minor changes. I hope to
go deeper in this series in the following iteration to give you better
feedback.

Matias

