Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3801B582D
	for <virtio-comment@lists.linux.dev>; Mon,  9 Sep 2024 14:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725891507; cv=none; b=FOEFoFo4LHefQnF8zr5WqYnTl2bH0E8Rw1DjqbNSGUPrffPNKiGY7eBPTdIOZJgEH2VKKSSmc+pqkZusiw9pUlVxTm5mUCaa5UoNJg7aiNustpUH+GOardQJZxc5r2gOF/Rnt0QSHlLCSUTuJSJPSjcikdK51YcxFEzd98UgcXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725891507; c=relaxed/simple;
	bh=HbS2voqvZC8ro7R5TZlnadRAltimvWml8At7LcBUWew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=kRP77yay8zoBHMBXmSgEkDseQsmetsuk3tqX1dWvmMN0VdK3RNbYx8xQb6OxogViKVrYTmqhl8q38oe3F8VlPiWsymYJ+BJPbo3UrTidNjj29BryPJwVr5+WG9Artnmb6ukf8xduKBU6RDCJbU3Jachxt4AGCjLMfZeBfSTLI2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N7KYeHmL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N7KYeHmL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725891504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gGPjmRsoEB4AXj11bn9SQRkQezZUu3Ag+ldgA0uoTIo=;
	b=N7KYeHmLqDBBz+HrDIqfZjVU6tOmapcvcWpwWGMg8oq+Ttw3SsPWVgbHKUyiv3vRhktf6c
	2hkC29a762f/srPbe26L5deeOqEgVB/rpxjIS1rmXQYJBNSxl998WtXekOzdgdqUywgKwS
	f49TWGsG/UQtDyKCFBitK/MqH1e9qv8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-z-ZWipJnP3iK46O_XaWQ7w-1; Mon, 09 Sep 2024 10:18:22 -0400
X-MC-Unique: z-ZWipJnP3iK46O_XaWQ7w-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-45677d056c3so63961711cf.3
        for <virtio-comment@lists.linux.dev>; Mon, 09 Sep 2024 07:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725891502; x=1726496302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGPjmRsoEB4AXj11bn9SQRkQezZUu3Ag+ldgA0uoTIo=;
        b=R0Uvv2n+LiNeWdNIXKW5K/zYW+1JXSgbygVUCiEWaZeuUGzwNP0gu+0Sa628ndsFYD
         k8EPdN01tfdl4jzTDJ0xrGTI/sx5J+R20s9hz1S4I5mUTRC++Pvvq8QNVVfZYJ3wolGE
         rAs7SuHl0lr3jG2xMY3t+D9r/64lAtyaefWzxuTaglQWHwMMHy28Sq/KmPS4l7XHFPdh
         beKiJldVaIzgw9lsQWRbT80oEDRopMXC8QH2JtzaQ44UIHYDytVj4cJvXM6spO3tVQ1y
         I73bVymslmPBbTHPNeY+pHRepj4HYxB96rr740ddDtaYjymL2k9FH9/5USMdx96Hh9Jc
         Kg3w==
X-Gm-Message-State: AOJu0Yx5ssd4syMXGzwx6A8VEitXKIZaVjXv2gKuNMR/xqDNkFxbwucy
	Oty2Yge0HpyN8IHE4c6wy3dVCtMb7SOXe2YUCGgjjxpRXyy53pK8pRtORicX5A+yvJiZzLyWlhF
	C+tqCadEboZRP63RmaNUclOeixAwQXnBUGQeX3yw5//jRb6y6ZIR4ecZnF41PXm2S
X-Received: by 2002:a05:622a:118b:b0:451:d75e:abb2 with SMTP id d75a77b69052e-4580c69756dmr82433101cf.19.1725891502290;
        Mon, 09 Sep 2024 07:18:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWj8uaxSny6h8dUwJMXj4f2eNC86zcKebC5ij/mvdKCOLMvGBIdQrNTVXoLu3WM42MdaPV3A==
X-Received: by 2002:a05:622a:118b:b0:451:d75e:abb2 with SMTP id d75a77b69052e-4580c69756dmr82432781cf.19.1725891501764;
        Mon, 09 Sep 2024 07:18:21 -0700 (PDT)
Received: from fedora (193-248-58-176.ftth.fr.orangecustomers.net. [193.248.58.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45822f93978sm20333191cf.83.2024.09.09.07.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 07:18:21 -0700 (PDT)
Date: Mon, 9 Sep 2024 16:18:18 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
	shahafs@nvidia.com
Subject: Re: [PATCH] device-parts: editorial: Fix metadata type name
Message-ID: <Zt8DqrYIXGMM399j@fedora>
References: <20240907165218.778501-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240907165218.778501-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 07, 2024 at 07:52:18PM +0300, Parav Pandit wrote:
> The description is for the type VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST;
> however, it referred to a non-existent definition. Correct it.
> 
> Branch: virtio-1.4
> Fixes: aa4f6f069ab3 ("admin: Add admin commands for device parts")
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  admin-cmds-device-parts.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/admin-cmds-device-parts.tex b/admin-cmds-device-parts.tex
> index 27d8251..3a16692 100644
> --- a/admin-cmds-device-parts.tex
> +++ b/admin-cmds-device-parts.tex
> @@ -152,10 +152,10 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
>  device responds with \field{hdr_list_count.count}. The
>  \field{hdr_list_count.count} indicates an count of
>  \field{struct virtio_dev_part_hdr} metadata entries that the device can
> -provide when the \field{type} is set to VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_HDR
> +provide when the \field{type} is set to VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST
>  in a subsequent VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET command.
>  
> -When \field{type} is set to VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_HDR,
> +When \field{type} is set to VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST,
>  the device responds with \field{hdr_list}. \field{hdr_list}
>  indicates the device parts metadata.
>  
> -- 
> 2.34.1
> 
> 
In previous patches, I see the pattern `\field{type} field`. I wonder if
you would like to do the same here for consistency but I do not have a
strong opinion about this. Otherwise,

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

Thanks, Matias.

