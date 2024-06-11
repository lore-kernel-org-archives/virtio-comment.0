Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAF623774
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 23:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718147001; cv=none; b=uLeu7WvoKJDrKhuYVn4PG9v1k3j3JGXvl5aat9SB13Vjr8Q4Q0Zpn2gN5MkCqjtc8m9HQA6m+8WcEvthFoAtbg6cCRVwDlhbBCrL94dxSggsELkETMV/1jdrvcIf1y4ookQUvGw+FxTdOOKafrkNNBC1UWZ6MgO8B1iobjCf/ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718147001; c=relaxed/simple;
	bh=X2YaluTkDfDq1k2UZn4vWognSdgNZuWBEEs2tPSnA0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=eW9BM2x+pyH7UNVcjJi4jeHme5fzTPFn51aThvurAy2pfCl1LYgjtnd5zyGcclrusRq+P7hs4tt4sdja1EiUqJ7GDIgyov7YafGS7/cUGvt4LoUCt3ywIX+iP9SSQgb8lsKdBYmbyK/x44Hleyf/isffnthlehENLyDaAuF4nxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dhIU2nMV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dhIU2nMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718146998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fB9dQgghGbFuJBOMY3marSs5s8MuH1cNW8NwEYKn5/s=;
	b=dhIU2nMVtMl5lbNNJqmu24lo5t28cYT9LGGbbZT/OJHETaD7o+7a4KCOvB66v+hK8ktpFY
	DBjuYEBVoeCL1QWPRtjUFK12XB8738V8KGiqCkdhOI/s0essPADwrqLYr+BfFklMl7mu+g
	9oUSBgbM/FaiCSvFwQNiAy6gSfje0Wc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-o-yYcisnM1G1KRkiSssylA-1; Tue, 11 Jun 2024 19:03:16 -0400
X-MC-Unique: o-yYcisnM1G1KRkiSssylA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-35f1f29ccefso2240441f8f.2
        for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 16:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718146996; x=1718751796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fB9dQgghGbFuJBOMY3marSs5s8MuH1cNW8NwEYKn5/s=;
        b=ANFbCUJTr9f35G8QFc0AZHYkcBFlcQSp6vI9S65eHPNHQ9+k2tDPQpRn/CNE9hk4I7
         uoSDqbWqucf3bX19HgEBt7R1iYv9vlwQ9bbq8Lw79hN1RZjz5NZ8Y02q18nUlYsY8iR1
         j09VpvoW41VgepLhlWSTiXy+d3FHMTFGdxIDrd31sI4pcaPNSE6GPFlpTOIccSCBBx4Z
         2BeSIsnXrCak54jnB0pD7vYXwROe8sF/xzcV4beVX0eY/Lzi4OUcok/8X39uWDiT3If1
         I2oKu8Tfm3Ug+SM9rNJhsk8DV7lJjrxhzNbFLOfWeN7sYK7f8UD1b9uoMyjnklhmmkqi
         s+GQ==
X-Gm-Message-State: AOJu0YwX/Zjb9Ay+GCJ4zQT4WTqAEndfCN26AQGufET6Dh345vf1PWL9
	trTI5Bmp0Z5tnzfLQbKmf4uB+WTOWQ6ilgbNmhJeQtF58DJktUzE9WA2BJxhln3p6gF6EkTrT6J
	Q6EjHp2+XUN3LPC0WdQCSmYxITgQRI4i8pQiSTYX5eCs8//fJRvPe9NadAnVjnaT1
X-Received: by 2002:a05:600c:4b23:b0:420:173f:e1e9 with SMTP id 5b1f17b1804b1-422864ae7cfmr3479155e9.21.1718146995697;
        Tue, 11 Jun 2024 16:03:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu8N588k1eJrWOAEw05kBtcsvQE1yI9BQfBfIrIC3+xnGGd62eqVuyG4Mesr0J0/zbDcYubQ==
X-Received: by 2002:a05:600c:4b23:b0:420:173f:e1e9 with SMTP id 5b1f17b1804b1-422864ae7cfmr3478935e9.21.1718146995116;
        Tue, 11 Jun 2024 16:03:15 -0700 (PDT)
Received: from redhat.com ([2.52.131.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f223dfce9sm7296080f8f.21.2024.06.11.16.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 16:03:14 -0700 (PDT)
Date: Tue, 11 Jun 2024 19:03:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240611184828-mutt-send-email-mst@kernel.org>
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240528044702.50603-1-hengqi@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 28, 2024 at 12:47:02PM +0800, Heng Qi wrote:
> The device can set any initial coalescing parameters (0 or non-zero)
> for the receive/send queue before the setting command is executed,
> not just 0, enhancing device performance even without DIM enabled.
> 
> So we need to clarify descriptions that don't fit the behavior.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/194
> Suggested-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> Reviewed-by: Parav Pandit <parav@nvidia.com>
> Reviewed-by: Jason Wang <jasowang@redhat.com>
> ---
> v4->v5:
>   - Add RB tags from Parav and Jason. Thanks!
> 
> v3->v4:
>   - Doesn't force the device to remember more stuff. @Parav
> 
> v2->v3:
>   - Clarify description to be more generic. @Parav
> 
> v1->v2:
>   - Update description. @Jason
> 
>  device-types/net/description.tex | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 61cce1f..00c1b36 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1803,6 +1803,14 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>                                          for an enabled transmit/receive virtqueue whose index is \field{vq_index}.
>  \end{enumerate}
>  
> +If the VIRTIO_NET_F_NOTF_COAL or VIRTIO_NET_F_VQ_NOTF_COAL feature is negotiated,
> +the device may apply any coalescing parameters to each transmit/receive virtqueue
> +before the driver successfully performs one of the VIRTIO_NET_CTRL_NOTF_COAL set commands.

may outside of conformance section, not good.

> +
> +The driver can query the coalescing parameters of any enabled transmit/receive
> +virtqueue using the VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET command, before or after any
> +VIRTIO_NET_CTRL_NOTF_COAL set command is done.
> +

Vague. There are just 3 set commands ust list them.

>  The device may generate notifications more or less frequently than specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
>  
>  If coalescing parameters are being set, the device applies the last coalescing parameters set for a

This needs more work but I guess we can skip the above part.

> @@ -1885,17 +1893,17 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  VIRTIO_NET_ERR if the designated virtqueue is not an enabled transmit or receive virtqueue.
>  
>  Upon disabling and re-enabling a transmit virtqueue, the device MUST set the coalescing parameters of the virtqueue
> -to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_TX_SET command, or, if the driver did not set any TX coalescing parameters, to 0.
> +to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_TX_SET command, or, if the driver did not set any TX coalescing parameters, the device MAY initialize them to any values.
>  

If device does not initialize them then what?
Actually something like 
0 -> the default TX coalescing parameters chosen by the device?


>  Upon disabling and re-enabling a receive virtqueue, the device MUST set the coalescing parameters of the virtqueue
> -to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set any RX coalescing parameters, to 0.
> +to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set any RX coalescing parameters, the device MAY initialize them to any values.
>  
>  The behavior of the device in response to set commands of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
>  the device MAY generate notifications more or less frequently than specified.
>  
>  A device SHOULD NOT send used buffer notifications to the driver if the notifications are suppressed, even if the notification conditions are met.
>  
> -Upon reset, a device MUST initialize all coalescing parameters to 0.
> +Upon reset, a device MAY set any coalescing parameters for all transmit and receive virtqueues.

Confusing.
This seems to allow any vq to have a different set of parameters.
Now if driver calls VIRTIO_NET_CTRL_NOTF_COAL_RX_SET then what?


>  
>  \paragraph{Device Statistics}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}




>  
> -- 
> 2.32.0.3.g01195cf9f

