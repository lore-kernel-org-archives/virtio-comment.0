Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A762D05E
	for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 06:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716446433; cv=none; b=uCvjmhUBaPCA1XwFRyX5X7di/cvHrwj9LuXdQwxtdwJvOQdvQcor4Ypw03DV5ob0FEHIf1JJvuT/uRXO+WlkMpnvlErbIhgxMAlat4T+VwAfJJhxZQ+QGRy+/hqEFF5iMRqBlYnZ/4gUs78ry5I6SyOFlHbx/h1Vd+eDsUUyWzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716446433; c=relaxed/simple;
	bh=XUDrxo+QkBU4LP0OhAT0QwQx2c6iRW97D35BDt5cSbA=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=B7uxuqGshX4wX/sRI/WazTA9Vut92fxFOm4YqZuBSUZg/Im1QmwVTW9Ne48sshso9S4XQe7JpAEY2u3uhIkC/JvHLKHqoCqXhmX3VFgMfatYGFrtIAtSIhXBPf51VFxkKf3/PD09L548yilHquYps5NHwij6CFrv5hNI6vPG1aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=vLQ5trbg; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="vLQ5trbg"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1716446422; h=Message-ID:Subject:Date:From:To;
	bh=erqpyBIF8S7FwOZOmGZTNk2zQCuwrObiTeTPrTQoNsM=;
	b=vLQ5trbgw1vecmL49Y6zYXQQ5b8qu71IwpS0YjeV1hcJg/vhyD79FtsSZ1w9C3Ong83bPg1qpvwjU3WRDcCNrNK7AUvTQNdVur8fDq+mNKZ0bbJGxojSrA3X2bfG7ryDPTyrqkSZKILoXktz9pP4v7oQotOwxBJraKTAwQyQ0KI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067109;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0W71nJ4r_1716446420;
Received: from localhost(mailfrom:hengqi@linux.alibaba.com fp:SMTPD_---0W71nJ4r_1716446420)
          by smtp.aliyun-inc.com;
          Thu, 23 May 2024 14:40:21 +0800
Message-ID: <1716446140.4382823-1-hengqi@linux.alibaba.com>
Subject: Re: RE: [PATCH v3] virtio-net: clarify coalescing parameters settings
Date: Thu, 23 May 2024 14:35:40 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
References: <20240523032332.50995-1-hengqi@linux.alibaba.com>
 <PH0PR12MB54819F69F8171B823B9D195FDCF42@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54819F69F8171B823B9D195FDCF42@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

On Thu, 23 May 2024 05:07:16 +0000, Parav Pandit <parav@nvidia.com> wrote:
> 
> > From: Heng Qi <hengqi@linux.alibaba.com>
> > Sent: Thursday, May 23, 2024 8:54 AM
> > 
> > The device can set any initial coalescing parameters (0 or non-zero) for the
> > receive/send queue before the setting command is executed, not just 0,
> > enhancing device performance even without DIM enabled.
> > 
> > So we need to clarify descriptions that don't fit the behavior.
> > 
> > Suggested-by: Jason Wang <jasowang@redhat.com>
> > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > ---
> > v2->v3:
> >   - Clarify description to be more generic. @Parav
> > 
> > v1->v2:
> >   - Update description. @Jason
> > 
> >  device-types/net/description.tex | 20 +++++++++++++-------
> >  1 file changed, 13 insertions(+), 7 deletions(-)
> > 
> > diff --git a/device-types/net/description.tex b/device-
> > types/net/description.tex
> > index 61cce1f..f51e0d8 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -1803,6 +1803,14 @@ \subsubsection{Control
> > Virtqueue}\label{sec:Device Types / Network Device / Devi
> >                                          for an enabled transmit/receive virtqueue whose index is
> > \field{vq_index}.
> >  \end{enumerate}
> > 
> > +If the VIRTIO_NET_F_NOTF_COAL or VIRTIO_NET_F_VQ_NOTF_COAL feature
> > is
> > +negotiated, the device may apply any coalescing parameters to each
> > +transmit/receive virtqueue before the driver successfully performs one of the
> > VIRTIO_NET_CTRL_NOTF_COAL set commands.
> > +
> > +The driver can query the current coalescing parameters of any enabled
> > +transmit/receive virtqueue using the
> > VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET
> > +command, before or after any VIRTIO_NET_CTRL_NOTF_COAL set command
> > is done.
> > +
> >  The device may generate notifications more or less frequently than specified
> > by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> > 
> >  If coalescing parameters are being set, the device applies the last coalescing
> > parameters set for a @@ -1884,18 +1892,16 @@ \subsubsection{Control
> > Virtqueue}\label{sec:Device Types / Network Device / Devi  The device MUST
> > respond to VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET and
> > VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET commands with  VIRTIO_NET_ERR if
> > the designated virtqueue is not an enabled transmit or receive virtqueue.
> > 
> > -Upon disabling and re-enabling a transmit virtqueue, the device MUST set the
> > coalescing parameters of the virtqueue -to those configured through the
> > VIRTIO_NET_CTRL_NOTF_COAL_TX_SET command, or, if the driver did not set
> > any TX coalescing parameters, to 0.
> > -
> > -Upon disabling and re-enabling a receive virtqueue, the device MUST set the
> > coalescing parameters of the virtqueue -to those configured through the
> > VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set
> > any RX coalescing parameters, to 0.
> > -
> 
> These two normative statements are correct, the change should be only for 0 and only for TX and RX commands.
> (no need to extend that to per VQ level commands).
> 
> There is no need to burden the device to remember the old value for each queue when the q is disabled.
> No point in remember something when the device does not know if it will be ever enabled or not.

The current spec already tells the device to remember the old value.

But I think it's ok to be relaxed for the descriptions.

> 
> So it should be,  
> 
> "or, If the driver did not set any coalescing parameters, the device MAY initialize it to any value."

It works.

> 
> >  The behavior of the device in response to set commands of the
> > VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> >  the device MAY generate notifications more or less frequently than specified.
> > 
> >  A device SHOULD NOT send used buffer notifications to the driver if the
> > notifications are suppressed, even if the notification conditions are met.
> > 
> > -Upon reset, a device MUST initialize all coalescing parameters to 0.
> 
> > +Upon disabling and then re-enabling a transmit or receive virtqueue,
> > +the device MUST apply the same coalescing parameters to the virtqueue
> > +as were set before it was disabled.
> > +
> 
> I think it should be, 
> When VIRTIO_NET_F_VQ_NOTF_COAL feature is negotiated, upon disabling and then re-enabling a transmit or receive virtqueue, the device MAY set any coalescing parameters for all transmit or
> receive virtqueues.
> 
> This clarifies the current behavior and also does not burden the device to remember any values related to VQ resource that is disabled (or destroyed).

Makes sense.

Thanks.

> 
> > +Upon reset, a device MAY set any coalescing parameters for all transmit or
> > receive virtqueues.
> > 
> >  \paragraph{Device Statistics}\label{sec:Device Types / Network Device /
> > Device Operation / Control Virtqueue / Device Statistics}
> > 
> > --
> > 2.32.0.3.g01195cf9f
> 
