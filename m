Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085D0645
	for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 04:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716871917; cv=none; b=HB4Ar0/ELuXTNR/c4cfBwdqGHck0gIi5pK7aPt29VSerxdEB2IpYtGq7rYrR/7VF9XbWUZvUVjOwkTSI+nYYdbR3PbslnUY4N10MEIWPQ3h18i37WqZXWogksrezZGMkX8dW/sQoXqP+S/lTK5fS2MlKaYeypgez2yeHEJK3YMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716871917; c=relaxed/simple;
	bh=cITnsxRkwIxj1RCfeQx9w430YU1XMWj+JdylkGHB+4U=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=qZTJO8pIbASLhVlHN5fqX2r+8C4wO1fnMfPirdpAiJHpW5m3ITHlgSkilXbTkjqTR7giweDjmoW1GJx0RYimwQeIc7+NvgxkEke+bhVQoQfI/JhQar6HhHC9Qj5VF5J6oLlfZAmk2ixzdZcY+lPdEC4n8AZic09uajkrOjq58a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=GFiBWeVg; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="GFiBWeVg"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1716871905; h=Message-ID:Subject:Date:From:To;
	bh=2Ba2/LeU+/sBKIXIiL/UKrGfrmFnXZZs3DeoPET6ZFQ=;
	b=GFiBWeVgzo9cQpKsSLHhlZIPHCL9vFhJDffDdbPVubzA/shYh2btJJoayoAK6CZgLeb2dSDFqGPBuWSDo4UAS04FuK2pc00FhdeqB6Wg2YQ3S3ejVgueFM3Egl/mhK49Lg4UGTk7fmsuX84+O8BZEX6Wvnu+D5xofYbNTeFcOs0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032014031;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0W7OPRSe_1716871903;
Received: from localhost(mailfrom:hengqi@linux.alibaba.com fp:SMTPD_---0W7OPRSe_1716871903)
          by smtp.aliyun-inc.com;
          Tue, 28 May 2024 12:51:44 +0800
Message-ID: <1716871834.4226007-3-hengqi@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Date: Tue, 28 May 2024 12:50:34 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: Cornelia Huck <cohuck@redhat.com>,
Cc: Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Parav Pandit <parav@nvidia.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 virtio-comment@lists.linux.dev
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
In-Reply-To: <20240528044702.50603-1-hengqi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

On Tue, 28 May 2024 12:47:02 +0800, Heng Qi <hengqi@linux.alibaba.com> wrote:
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

Hi, Cornelia!

I'm wondering if our voting infrastructure is already working properly, and if
so, can we turn on voting for this update patch?

Thanks a lot!

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
> +
> +The driver can query the coalescing parameters of any enabled transmit/receive
> +virtqueue using the VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET command, before or after any
> +VIRTIO_NET_CTRL_NOTF_COAL set command is done.
> +
>  The device may generate notifications more or less frequently than specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
>  
>  If coalescing parameters are being set, the device applies the last coalescing parameters set for a
> @@ -1885,17 +1893,17 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  VIRTIO_NET_ERR if the designated virtqueue is not an enabled transmit or receive virtqueue.
>  
>  Upon disabling and re-enabling a transmit virtqueue, the device MUST set the coalescing parameters of the virtqueue
> -to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_TX_SET command, or, if the driver did not set any TX coalescing parameters, to 0.
> +to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_TX_SET command, or, if the driver did not set any TX coalescing parameters, the device MAY initialize them to any values.
>  
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
>  
>  \paragraph{Device Statistics}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}
>  
> -- 
> 2.32.0.3.g01195cf9f
> 
> 
