Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27E920262E
	for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 16:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729267997; cv=none; b=gsp2KEFf0ea4PgDPxJ6aEkHOS2cr9wvDyFrHemRgwx2u1w6lcMkAohuUAlRdzYzID6A8hEofT/0/ZVxU1h2v6TlQvEGgFr4B69qqDXemb+XM9yOypFylWa0sxAo7pE2AtT+2+TNp95rHy3q1ENYkqKuo64sCwhD26A3OqzqALCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729267997; c=relaxed/simple;
	bh=5Pahm4QHl8osRK43eyjsoYJymSqxItX2i+xMf5895JM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=u62Ai5vqOENmhyjmv+66guBSaReG9+lyfJnSEE/NWjc1Km47uSJoTMvnVc33qePnVKCS2qXlsMA89TKNpIMFq0AcDCu3BD6yZKWWSey8f53cMhLQTfgpTWfOvYtnOVAVRTZ6EDyK2YRv23uI2YyBHH80fRyEvJOF9ubSllqhg5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TlVwwUaM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TlVwwUaM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729267994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nhECZN8mkQrOcWlrAMzLEkBOTL8dyVZLgYQI9IzqrEQ=;
	b=TlVwwUaMzlKLIPyYpPEwLDwpI8jT7jbovjYXLH2DVNWgepVKn489DiRTTgWz/VwUe0QNBM
	qfBF1lmul7FAqQmOb8znBn1xaGWndiX8pmQdu+lstyhDP73lq/79EV0gsQmOi46RrgQ9zq
	LpieMKzKUQ3ORzPFM9xfodAlyZuebHs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-82fbL_iROj-GWhhzQ072EA-1; Fri, 18 Oct 2024 12:13:13 -0400
X-MC-Unique: 82fbL_iROj-GWhhzQ072EA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43113dab986so21076475e9.2
        for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 09:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729267992; x=1729872792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhECZN8mkQrOcWlrAMzLEkBOTL8dyVZLgYQI9IzqrEQ=;
        b=WDLXsjWarUiKo/QMbQe7yJTeZVl7zmQcB7N6yNk5p7Jr3dvayfD2BL5e6a3vVKf8zV
         Bhrt3ap079as3SaReU2OOMe0jr7H/T/xwv/qN/lpS3Bp2NavHyXcPUSaL5nSLCMp4hxe
         Wr5qTf1nky8gBn0MwiGhxPuB+0U6pRS/N1dsCbMYEkmHwIVNyavdQ6vDqGqk/weKJ8O5
         lQay10Tx7H2nK5nFhBvKhR/0wk9LkThVQ3QEd1IuY3JA1suTwHSqBIZfdXLm/NdXgVkP
         ZG+9C+Wir5yYtzDn5pbH8v27QXIvl8JgiUDTAjQ4jUfo039WJQvKYhuh95LIjXMROhWH
         KLeA==
X-Gm-Message-State: AOJu0YyD3ncsuUZE5sp5G49y2s3Pl8g2MiIIZhlmxBIwakBpdakO+imT
	fI5/OKcGJBrATNQQSLhn7pcXL0sMOdCl3l4r7y0hDjpD3z7P4kzmhK/YiXE+g9ApxWLQxEJfvmu
	SrqtQSXDegPUMiUHEyE9G0z0WarkzahW429b0WqFUkHTWL7FWKI+ZE/0DiSc660QMM8g86Pzm7B
	0=
X-Received: by 2002:a05:600c:4f10:b0:431:52cc:877a with SMTP id 5b1f17b1804b1-4316169151cmr29522065e9.34.1729267991704;
        Fri, 18 Oct 2024 09:13:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD6o1tNfqUfoKdO0Wc2eV7g2XOcdqJj6jHmKQejTtFLS/Tdi//9maR9yNRbI9oP07yBEm+Ug==
X-Received: by 2002:a05:600c:4f10:b0:431:52cc:877a with SMTP id 5b1f17b1804b1-4316169151cmr29521895e9.34.1729267991391;
        Fri, 18 Oct 2024 09:13:11 -0700 (PDT)
Received: from fedora ([78.242.166.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431606c09c9sm26481265e9.1.2024.10.18.09.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 09:13:11 -0700 (PDT)
Date: Fri, 18 Oct 2024 18:13:08 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
	shahafs@nvidia.com
Subject: Re: [PATCH 2/3] device-parts: Add device type specific raw selector
Message-ID: <ZxKJFLT5Ewn5Qhf/@fedora>
References: <20241018131741.443635-1-parav@nvidia.com>
 <20241018131741.443635-3-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241018131741.443635-3-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 18, 2024 at 04:17:40PM +0300, Parav Pandit wrote:
> The subsequent patch defines the device-type-specific parts. For
> these parts, the raw selector format is defined to ensure that
> each device type can specify its format accurately.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/209
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  device-parts.tex | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/device-parts.tex b/device-parts.tex
> index e59c0f9..ee743c2 100644
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
> @@ -77,6 +78,9 @@ \section{Device parts}\label{sec:Basic Facilities of a Virtio Device / Device pa
>  only when the \field{part_type} is VIRTIO_DEV_PART_VQ_CFG or
>  VIRTIO_DEV_PART_VQ_NOTIFY_CFG.
>  
> +\field{selector.device_type_raw} is only used when a device-specific part is
> +utilized, with \field{part_type} ranging from 0x0200 to 0x05FF.

Why is important here to mention the range of `part_type`?

Matias

