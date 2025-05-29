Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE8B24EA8D
	for <virtio-comment@lists.linux.dev>; Thu, 29 May 2025 06:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748501461; cv=none; b=m6oXh11WHNojWf/K3ZaZZg0Y1yLzITQkhHtd3kkAqgGa3I1CDO2Mxl6FsVArq9wTuGvn5wICt9nr1L/nXTdBClZGsuXndig4jFrynZE3z92N3UcyRIG+9SfrLtBsGjjGalpnDcx2q/UyjzI8bzGu6L+vlRRTQU/KS690Ei4WqkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748501461; c=relaxed/simple;
	bh=EzrJd8kPJWdME4JEp/rJfCdiP6tvbtmPhEvidAG8fy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=MsVIUWAJBAkDv0awaHG1o7le/rZyFkQSwxwULaHxteu7jklYQEU1c36icB6bVfgqaBwOVbDbBocf3LBH+SBR0h0BZVhpV3bW+nuesEQo6nHRkxUTRenjYZMIeNk59jafvmozvzseb8DfIersRqOcdwHo5oh5flX1Pl9MjatpqFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NAmsPA6d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NAmsPA6d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748501458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BZlaTB8yOe+fc0GTP+j6k28yYwVnB4rCE7HTNsUKL9A=;
	b=NAmsPA6dYRjI8f0ITWdwYSEf89462lbnvhfwC5+NVDaNboon1iKK5syoho4KmaFcBeXO+L
	agZXU7VnUcKu+Bc866Xuuuq7GHmtZdjijhf2QR13F5ZsB+GLHSfBmliHlJqT/jNLOV9LYV
	u7hGlyxLQItaWVikrzYFKL8bvX9SijI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-zGrobGwRPcyaPhUCe_pdug-1; Thu, 29 May 2025 02:50:57 -0400
X-MC-Unique: zGrobGwRPcyaPhUCe_pdug-1
X-Mimecast-MFC-AGG-ID: zGrobGwRPcyaPhUCe_pdug_1748501456
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4d95f197dso389070f8f.3
        for <virtio-comment@lists.linux.dev>; Wed, 28 May 2025 23:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748501455; x=1749106255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZlaTB8yOe+fc0GTP+j6k28yYwVnB4rCE7HTNsUKL9A=;
        b=kgD7IlgMfgBdylNlZgK4X8u47eleKa+k8mxzG+ptSd5mKLX560X1fHan6ZuLB+ofsn
         5OxqGr71DxN4Xfe7uAGjIwT6HZQjFEn84bEgQsaoYIa2wEMghVXvEtK+nok54cvxG8XD
         T333iDjHAM68kDw7sjTq/URZEJ7CSjXMkTmGVkFzAl8kafvnC3ka83mUxtrBmt5gUS75
         yuQ2r192i2vT4UJ0l7GU59nofkNSaf4w+8HwPMQ/RKGqa604czm/hOu7Sk/deOZPELTs
         J/DeNMEWMymOs/k2RkL8gRBKn+aOsrrJ3FoZclbAtADmPn4MoAG3hXdbg5s4rlZD5vH6
         cn8Q==
X-Gm-Message-State: AOJu0YxSqGkntcRgjPeacivaW4ALzGLHcuzaHlHBm6q2qS1znMM1mknF
	9V7PRCVOkem2dsiTxoUn1FI5ZvCH0gFoGzAYj0aEVvAgdt78sKNybvl2mZ+fS9eoypqw+laV+9v
	W2F5YB2FKu0O1ADvISl9nn77eFPVsRknu/9G6dCbd3CXV2mjCP73VuFwlYXtZ+EV0n/4rXDT7dR
	wm
X-Gm-Gg: ASbGncuACLWO6opdRMx7w+JGxfj9UWUdYS/c0hLVVcHVGhemZXKhgaI0EyxTcCYf/O7
	feCKWfBH2RnnzBPoi75EMq55TmkoXaVXVRrCtP9X1i3owUpNvVPlfBaoI6XyVVKA34mCdAFG6rq
	fK1CYhPDc45FmLaBA0Glct45LL5IKT5HVm6o29bQ7Iq/Alb0U9Vok5lkf0AtbSQ9YWNYYnvtjKE
	NQWQkUskuGIMVW5T+d395CEB1LZcshLXdj8rmXK6at5930JTtQLyGVU2dlea0kuYidWcLrUncVm
	VlISvg==
X-Received: by 2002:a05:6000:2dc1:b0:3a4:dfc1:ecb8 with SMTP id ffacd0b85a97d-3a4dfc1ed20mr9791471f8f.53.1748501455428;
        Wed, 28 May 2025 23:50:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlkmCO62QCRMQkqv0ksYi7CJ32mEvA4v3Y3PoIZ1v5rbOFyWej1gMcBCcYI3YSal0seGhhWw==
X-Received: by 2002:a05:6000:2dc1:b0:3a4:dfc1:ecb8 with SMTP id ffacd0b85a97d-3a4dfc1ed20mr9791451f8f.53.1748501455014;
        Wed, 28 May 2025 23:50:55 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc17a04sm11066665e9.24.2025.05.28.23.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 23:50:53 -0700 (PDT)
Date: Thu, 29 May 2025 02:50:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: virtio-comment@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Parav Pandit <parav@nvidia.com>, devel@daynix.com
Subject: Re: [PATCH v4] virtio-net: Ignore num_buffers when unused
Message-ID: <20250529024047-mutt-send-email-mst@kernel.org>
References: <20250526-reserved-v4-1-70231a8edc79@daynix.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250526-reserved-v4-1-70231a8edc79@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xoOAXD5crU79Yty7AHGcE-brMPbEWqVdQPt4ETcehEE_1748501456
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 26, 2025 at 02:15:19PM +0900, Akihiko Odaki wrote:
> If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, vhost_net of Linux
> prior to 6.14 and QEMU prior to 10.0.0 leave num_buffers uninitialized
> while the specification tells to set it to one.
> 
> Let drivers ignore this field to make them compatible with old
> vhost_net/QEMU, similar to the hdr_len field, which is also marked as
> unreliable due to implementation bugs.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Parav Pandit <parav@nvidia.com>
> ---
> Changes in v4:
> - Noted that the mentioned bugs are fixed with newer implementation
>   versions in the patch message.
> - Noted that the bugs are of devices. (Parav Pandit)
> - Link to v3: https://lore.kernel.org/r/20250110-reserved-v3-1-2ade0a5d2090@daynix.com
> 
> Changes in v3:
> - s/MUST/SHOULD/ (Michael S. Tsirkin)
> - Link to v2: https://lore.kernel.org/r/20241227-reserved-v2-1-de9f9b0a808d@daynix.com
> 
> Changes in v2:
> - Corrected the change description to tell vhost_net and QEMU leaves
>   num_buffers uninitialized where it used to tell they set it to zero.
> - Restored statements that require devices to set num_buffers to one.
> - Link to v1: https://lore.kernel.org/r/20241226-reserved-v1-1-39ca566889c0@daynix.com
> ---
>  device-types/net/description.tex | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 76585b0..4a2df5a 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -863,6 +863,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>  This is due to various bugs in implementations.
>  \end{note}
>  
> +If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the driver SHOULD ignore
> +\field{num_buffers}.
> +\begin{note}
> +This is due to bugs in device implementations.
> +\end{note}
> +
>  If neither VIRTIO_NET_HDR_F_NEEDS_CSUM nor
>  VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
>  rely on the packet checksum being correct.

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> ---
> base-commit: b495841a8e80d12c1130f8868f4128866291142d
> change-id: 20241226-reserved-d5960f173223
> 
> Best regards,
> -- 
> Akihiko Odaki <akihiko.odaki@daynix.com>

