Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3BC2836A
	for <virtio-comment@lists.linux.dev>; Mon, 27 May 2024 03:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716780459; cv=none; b=aWfez+mNiG+/i59C06ayJSzoppHYW3x5UR7HG8zeE1dK/h4pW8Q2awAfUkzoDERZa2ubkwVSMAUMnu0h40j0Y8NZZ2cMfPjQJPkvTA7yV9c8Gs0mFrVZff1g28caw0d4bNOtfulJyaRd2bwA+7n2YnAvapfrlOloDMvuicWKCMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716780459; c=relaxed/simple;
	bh=YzHYN0xzIBXx3reBqiQFvmaxOAnpVpiYa1Vphm1SDYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2MrbzBa+LYWlVQ1m1dWFkLK0OlTCtF0kkxjVgclgvy//erTmcPgplXUbZBmY8Qi2e6PWzCVgj6p3dmF7FuOKTeDxxcT0OJrE9UWg3/FgpXNWiB49Rfj6rbm/5t6v2rQo+drriG+GmadN/Mc6gvFn2sfHGJATBqYdcni23NV94A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RKpRSkY8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RKpRSkY8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716780456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iOZWAX7N7ZYbZIFaTrhukXrEqJW1hPDVHJyJW/0xWO8=;
	b=RKpRSkY8pvyUEuCFP/bHxPl6Xteb7q0X/UBLjch42F/9EEqLWrFoOPKl//WL9r6tEhbjgY
	lSF2LAu6rKelMe6tlqua6JD8w5iYlLTQSFEFm2wjvZDzo2oKWR2AbPTmZ26TEOsg/UxPec
	Q65rrfSVBY48pk2xXPu3nXZlSglovaI=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-hRXto5AZPbKO-V7-b3Ow8A-1; Sun, 26 May 2024 23:27:34 -0400
X-MC-Unique: hRXto5AZPbKO-V7-b3Ow8A-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2bf8a8799f1so1171952a91.1
        for <virtio-comment@lists.linux.dev>; Sun, 26 May 2024 20:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716780454; x=1717385254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOZWAX7N7ZYbZIFaTrhukXrEqJW1hPDVHJyJW/0xWO8=;
        b=QeX3CCJXxO7HiYSRkT00oXCJSWgQfw4gI2wzj3zFoK7T32LSpuoDsLqBu2YfpOtjLg
         uLsbWVK1O+5FYD5AOINQzSx42R2CiH+MQlWE7xWCUfbfBy5rAVMHg5XkpeXYf1tqIpvW
         j8XYf9CACHqykllItokx+r2Z+UKDsOiaXn9eDD7fybOVTF3pBhE+ymtUFwnC4NuCD5/X
         k+DZGnl1QVkedeskKfQ7Ku4XpgznnwfxM+ApIvhSEuKSia1/FaTyo77OYc53bM3FhCre
         o5WhnKiApWvGqi4fDpDmWKdh1MTHpYkRRcqNpAGqXu63B/BdlRuwH2XNCPk+d0eCaZK1
         Aocw==
X-Gm-Message-State: AOJu0Yy0jUG+mvPNm64VeEZlI/Oa171oCQhnBKc/zAKpPXqV5qZbu1n0
	XP6OIij0uQNQbgi2nTkjrx4g8vPS4/gwhaA4iwdFMRg/c0kuUVtj5PAzejrhXF91MMzx3b8xLFz
	HfeTnSCcrrADKJU4qyE5g6pqQsu3uCrk2LG3bZpFKbfD5N32BizWvNRBmhLgJNA0yUPy7KXlv5k
	FiZtKFiNgYM+MdolSb6nEU1c/fybxDpsLNHbVGlTU=
X-Received: by 2002:a17:902:fa46:b0:1f3:4232:76df with SMTP id d9443c01a7336-1f4487400b4mr71596525ad.36.1716780453885;
        Sun, 26 May 2024 20:27:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4Q2xh4bfvYmwCl6QQJn+qamG1h7EYuYA/OH0WXtHv0S3rBvtWE10KnsdgpdFtknHAgHIWCMnSF2xV9Gtdj6M=
X-Received: by 2002:a17:902:fa46:b0:1f3:4232:76df with SMTP id
 d9443c01a7336-1f4487400b4mr71596345ad.36.1716780452925; Sun, 26 May 2024
 20:27:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240523095822.116289-1-hengqi@linux.alibaba.com>
In-Reply-To: <20240523095822.116289-1-hengqi@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 27 May 2024 11:27:21 +0800
Message-ID: <CACGkMEvQOuzBymi-97Uo78KvCJRekgKFWjfzV6PV1ROhDBHJ2g@mail.gmail.com>
Subject: Re: [PATCH v4] virtio-net: clarify coalescing parameters settings
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.linux.dev, Parav Pandit <parav@nvidia.com>, 
	"Michael S . Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 5:58=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.com> =
wrote:
>
> The device can set any initial coalescing parameters (0 or non-zero)
> for the receive/send queue before the setting command is executed,
> not just 0, enhancing device performance even without DIM enabled.
>
> So we need to clarify descriptions that don't fit the behavior.
>
> Suggested-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>

Reviewed-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
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
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index 61cce1f..2764e04 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1803,6 +1803,14 @@ \subsubsection{Control Virtqueue}\label{sec:Device=
 Types / Network Device / Devi
>                                          for an enabled transmit/receive =
virtqueue whose index is \field{vq_index}.
>  \end{enumerate}
>
> +If the VIRTIO_NET_F_NOTF_COAL or VIRTIO_NET_F_VQ_NOTF_COAL feature is ne=
gotiated,
> +the device may apply any coalescing parameters to each transmit/receive =
virtqueue
> +before the driver successfully performs one of the VIRTIO_NET_CTRL_NOTF_=
COAL set commands.
> +
> +The driver can query the current coalescing parameters of any enabled tr=
ansmit/receive
> +virtqueue using the VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET command, before or =
after any
> +VIRTIO_NET_CTRL_NOTF_COAL set command is done.
> +
>  The device may generate notifications more or less frequently than speci=
fied by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
>
>  If coalescing parameters are being set, the device applies the last coal=
escing parameters set for a
> @@ -1885,17 +1893,17 @@ \subsubsection{Control Virtqueue}\label{sec:Devic=
e Types / Network Device / Devi
>  VIRTIO_NET_ERR if the designated virtqueue is not an enabled transmit or=
 receive virtqueue.
>
>  Upon disabling and re-enabling a transmit virtqueue, the device MUST set=
 the coalescing parameters of the virtqueue
> -to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_TX_SET command=
, or, if the driver did not set any TX coalescing parameters, to 0.
> +to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_TX_SET command=
, or, if the driver did not set any TX coalescing parameters, the device MA=
Y initialize them to any values.
>
>  Upon disabling and re-enabling a receive virtqueue, the device MUST set =
the coalescing parameters of the virtqueue
> -to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command=
, or, if the driver did not set any RX coalescing parameters, to 0.
> +to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command=
, or, if the driver did not set any RX coalescing parameters, the device MA=
Y initialize them to any values.
>
>  The behavior of the device in response to set commands of the VIRTIO_NET=
_CTRL_NOTF_COAL class is best-effort:
>  the device MAY generate notifications more or less frequently than speci=
fied.
>
>  A device SHOULD NOT send used buffer notifications to the driver if the =
notifications are suppressed, even if the notification conditions are met.
>
> -Upon reset, a device MUST initialize all coalescing parameters to 0.
> +Upon reset, a device MAY set any coalescing parameters for all transmit =
and receive virtqueues.
>
>  \paragraph{Device Statistics}\label{sec:Device Types / Network Device / =
Device Operation / Control Virtqueue / Device Statistics}
>
> --
> 2.32.0.3.g01195cf9f
>

