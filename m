Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9443C13D256
	for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716466208; cv=none; b=JBwqcMiD76EP+R0WP/MGhspFqGJ/1LNiHJegYrlRBoNgOGnozSPp6KiOGjTO+q0RfYbZWIH+zd83Ou2yQPrbdjxNF0XEK9A1+c0pE08hQNRGdnIPG+2RzpiGC37jl7Br5VLMfAReemFkNcE10Y0Jpytw1+/JfS4OfOfj6GDEbmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716466208; c=relaxed/simple;
	bh=Acs1go58Ud/i8SgVPtzXhT+2ZIOUR9hXRpp3dPht/SQ=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=ikfI6UQ3eaWl0UZnOdPFY3WcEgg2mn0Aw0CDLErpH09ojKw17oPlCo9yCwGI2SwMFAa4lfj9P1+JxyG0GP9CEjVNKvwk+wfRVKFx6wck62zaFwvZPGpZK6luKeBWoeySOrCtlCcSJgu/qgKR+HailYiwS8ad6vr5VmWYWu1i9VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ZiAlrq6g; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ZiAlrq6g"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1716466200; h=Message-ID:Subject:Date:From:To;
	bh=xERijPHMe+A2bf77GNRLRJIXjoHuWHqshGanyV/QWhE=;
	b=ZiAlrq6ggDap8CWmzAJ6srSZkraalW1jywpmTxWU6lhesdKlOYal3//Lk6NIUctqUbHu+mo5FkxmYhaGp7zcEniE/JYeYZGMYv+4ks0TTfZQ5F0rq1yVTrV0rHn2Cu4mdi9zwvIad9KDIp08IGIcvqj7BfFxv/xzazOVr7ptexk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R521e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067110;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0W72vm2y_1716466198;
Received: from localhost(mailfrom:hengqi@linux.alibaba.com fp:SMTPD_---0W72vm2y_1716466198)
          by smtp.aliyun-inc.com;
          Thu, 23 May 2024 20:10:00 +0800
Message-ID: <1716466182.8680377-1-hengqi@linux.alibaba.com>
Subject: Re: RE: [PATCH v4] virtio-net: clarify coalescing parameters settings
Date: Thu, 23 May 2024 20:09:42 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
References: <20240523095822.116289-1-hengqi@linux.alibaba.com>
 <PH0PR12MB54810DB98B28AE159D0FA089DCF42@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54810DB98B28AE159D0FA089DCF42@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

On Thu, 23 May 2024 11:06:23 +0000, Parav Pandit <parav@nvidia.com> wrote:
> 
> > From: Heng Qi <hengqi@linux.alibaba.com>
> > Sent: Thursday, May 23, 2024 3:28 PM
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
> > v3->v4:
> >   - Doesn't force the device to remember more stuff. @Parav
> > 
> > v2->v3:
> >   - Clarify description to be more generic. @Parav
> > 
> > v1->v2:
> >   - Update description. @Jason
> > 
> >  device-types/net/description.tex | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/device-types/net/description.tex b/device-
> > types/net/description.tex
> > index 61cce1f..2764e04 100644
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
> The word "current" is not necessary here, but it fine.

Ok.

> 
> >  The device may generate notifications more or less frequently than specified
> > by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> > 
> >  If coalescing parameters are being set, the device applies the last coalescing
> > parameters set for a @@ -1885,17 +1893,17 @@ \subsubsection{Control
> > Virtqueue}\label{sec:Device Types / Network Device / Devi  VIRTIO_NET_ERR if
> > the designated virtqueue is not an enabled transmit or receive virtqueue.
> > 
> >  Upon disabling and re-enabling a transmit virtqueue, the device MUST set the
> > coalescing parameters of the virtqueue -to those configured through the
> > VIRTIO_NET_CTRL_NOTF_COAL_TX_SET command, or, if the driver did not set
> > any TX coalescing parameters, to 0.
> > +to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_TX_SET
> > command, or, if the driver did not set any TX coalescing parameters, the device
> > MAY initialize them to any values.
> > 
> >  Upon disabling and re-enabling a receive virtqueue, the device MUST set the
> > coalescing parameters of the virtqueue -to those configured through the
> > VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set
> > any RX coalescing parameters, to 0.
> > +to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET
> > command, or, if the driver did not set any RX coalescing parameters, the
> > device MAY initialize them to any values.
> > 
> >  The behavior of the device in response to set commands of the
> > VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> >  the device MAY generate notifications more or less frequently than specified.
> > 
> >  A device SHOULD NOT send used buffer notifications to the driver if the
> > notifications are suppressed, even if the notification conditions are met.
> > 
> > -Upon reset, a device MUST initialize all coalescing parameters to 0.
> > +Upon reset, a device MAY set any coalescing parameters for all transmit and
> > receive virtqueues.
> > 
> >  \paragraph{Device Statistics}\label{sec:Device Types / Network Device /
> > Device Operation / Control Virtqueue / Device Statistics}
> > 
> > --
> > 2.32.0.3.g01195cf9f
> 
> Reviewed-by: Parav Pandit <parav@nvidia.com>
> 

Thanks!
