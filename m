Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE891FAC42
	for <virtio-comment@lists.linux.dev>; Mon, 21 Oct 2024 18:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729534379; cv=none; b=k3bRT5DLUjvjQkafiLblS866huwc486uOQl9hx2dnroV0sTg23X60Pg6Ej+Ljase7UrFJpy5L/fiqR+NlRWgtAegq7uU1au4ZVtfunu6tuEaFfaqcfGZg8kVylIJbTxtTjLKDUoan32iqKdvQJG3xfDP7b9TMs7z8YiZCCekOOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729534379; c=relaxed/simple;
	bh=jW9wcxlwQLGQRewOcOdwDGxmZyzuCOj1FvejuJtAjSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=JgLikufuh2d689Gwyk/ZXh/tv9QwN6577Y+Y/Oh+1yrPtZOJkWqosPBXKclg3kTYhQVFtp35NdwtT8PCVT+AcIwKuhXzBsCnuZRh5z9gLFzYWLnOH5+j6VQxDwfbO2gpF+aKiGrx15tNDw/pXmMwEMBkC3HOEBY9RfghiZeofDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cqHpFhVk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cqHpFhVk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729534376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RZai4uLy5F0KfULLKGjftpy+gYMNc9sCC6ziVm8f66M=;
	b=cqHpFhVkjx4c8qLWcxCdNWoNOSHpFGPuZk3zTnhOetCrSJxZfvygmM2lN8wPmlIiBDEx3w
	Z6rF3Z5P5z3RFlG3bgH5XSLebaocCFikCzPiMnSADbu5Bnn+ZJjG/UXaUBX+Cx8dJ9ipTv
	L/eQllVFrByyXe+rlYI4GxzH+8wV6II=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-c-Q063nOMyut0FfLhgaBYg-1; Mon, 21 Oct 2024 14:12:55 -0400
X-MC-Unique: c-Q063nOMyut0FfLhgaBYg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-37d52ca258eso2303723f8f.3
        for <virtio-comment@lists.linux.dev>; Mon, 21 Oct 2024 11:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729534374; x=1730139174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZai4uLy5F0KfULLKGjftpy+gYMNc9sCC6ziVm8f66M=;
        b=SYX67/IzceXx7ZtS3DKY9DlbyL6Q9uk4Liw9abwkN7cEavtsSnYoIcDk8POcanMGn2
         2TJO91Icx72EQ+l4+dda9eSI1vEzSLiWV7H/SZB5CQdyNdFp5WhP3AxAEAY5zTs3rVr+
         LWyA7YIpfXTR96a88nA6I2IAbETCE10l6z5eg1pwN1ppOPXVsYlkJphcvhO0qTsweQjI
         Vvzs6BVIzhtSmK6iVMuG6uFkdM6X8A1XhorNM6Ei8lVVpUzoyUraQkLHSMyQI90sfDWe
         IK/ES+n1ax5TR0s5Uq4DIKcS8dGrnWCbLsq3eS6s9WemsPYNqQUjh37iDLJxuVgEQSvF
         BFXA==
X-Gm-Message-State: AOJu0Ywq4Eq/YC3oV0KN3DE8EeQCcFvtwGpSYnh3NnYZeTPOPig0axqb
	MmxENtyKdXVtY3qXBm5wlv3R0t/G1si/t5thFTXUihV5R6RmiNRiPZAJqDMNvq2I+tNT1c5l7iI
	eaGhakZjwskhXuzEh2A3IgQyPwIEvolHkKLpabGVQFGtjgc5uuMYA+WdRXAqNl4Gb
X-Received: by 2002:a5d:44c6:0:b0:37d:39f8:a77a with SMTP id ffacd0b85a97d-37ef0b61df9mr437650f8f.8.1729534374266;
        Mon, 21 Oct 2024 11:12:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL6djhFHs9lEa2GEVYm77JtQIFJK8enB5iQp4GDCgwlmSRtCSeDQhjBvp9lkRGL2MuthEQ6w==
X-Received: by 2002:a5d:44c6:0:b0:37d:39f8:a77a with SMTP id ffacd0b85a97d-37ef0b61df9mr437639f8f.8.1729534373904;
        Mon, 21 Oct 2024 11:12:53 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a58cc2sm4881287f8f.54.2024.10.21.11.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 11:12:53 -0700 (PDT)
Date: Mon, 21 Oct 2024 20:12:51 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
	shahafs@nvidia.com
Subject: Re: [PATCH v1 2/3] device-parts: Add device type specific raw
 selector
Message-ID: <ZxaZo5Qq0QZwDCmo@fedora>
References: <20241020114141.451478-1-parav@nvidia.com>
 <20241020114141.451478-3-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241020114141.451478-3-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 20, 2024 at 02:41:40PM +0300, Parav Pandit wrote:
> The subsequent patch defines the device-type-specific parts. For
> these parts, the raw selector format is defined to ensure that
> each device type can specify its format accurately.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/209
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> 
> ---
> changelog:
> v0->v1:
> - addressed comment from Matias
> - rewrote description of selector without writing the actual
>   part_type range, add description that it is device type specific
> ---
>  device-parts.tex | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

> 
> diff --git a/device-parts.tex b/device-parts.tex
> index e59c0f9..1d6be87 100644
> --- a/device-parts.tex
> +++ b/device-parts.tex
> @@ -21,6 +21,7 @@ \section{Device parts}\label{sec:Basic Facilities of a Virtio Device / Device pa
>                          le16 index;
>                          u8 reserved[6];
>                  } vq_index;
> +		u8 device_type_raw[8];
>          } selector;
>          le32 length;
>  };
> @@ -77,6 +78,10 @@ \section{Device parts}\label{sec:Basic Facilities of a Virtio Device / Device pa
>  only when the \field{part_type} is VIRTIO_DEV_PART_VQ_CFG or
>  VIRTIO_DEV_PART_VQ_NOTIFY_CFG.
>  
> +\field{selector.device_type_raw} is applicable only when the \field{part_type}
> +corresponds to a device-specific range. The format of
> +\field{selector.device_type_raw} is device type specific.
> +
>  \subsection{Common device parts}\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts}
>  
>  Common parts are independent of the device type.
> -- 
> 2.34.1
> 

