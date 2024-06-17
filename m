Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE56D2FE
	for <virtio-comment@lists.linux.dev>; Mon, 17 Jun 2024 02:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718592447; cv=none; b=YVDxc6KDeflNNvwNOsjK4J2ZWuLRclcdKNGo+QkBJc1nQO8wNoJHhPCfhM9Mp8kR8Nzbr3DZpdlTT/RHHk2dFZ2mmLCc4PvaDzIgaYqe24tMX4h0wt8iFnlUlxJENDRQ7UwYU7vKla2k5ThkX1HiA0ahgKM4FXBgLxSOakrqggw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718592447; c=relaxed/simple;
	bh=FT9Qnd+y4yGJuX8gnCnxf0wXwkdCjzQS4NE+T+iTHsg=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=tjl9kh36YO/n4xASsxJ3wva17drDy+qw5jYd+Va9VWqcsI+YRYCnekkJkDA1WLQMRJezPgsJWt+HIVlOSzIhBkaQcV3Fb9ObnmWrGubvhksu/SfTJfa3EeXhSxolmVGqY18KvSSm9lvsvph2o3mnJnXyT+IkiNTcMZvB1D8L+rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=t3o2WNfF; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="t3o2WNfF"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1718592436; h=Message-ID:Subject:Date:From:To;
	bh=kq/Edy8d9EfQb2LcUrOjqnn8f5lp3sg/382VFvOfSWg=;
	b=t3o2WNfFFJaJzjkMBjIuF5NZdMG/fW45P/4f3hJHWJI0v8DJM9+Zj+QuxPe0ZpIkbqxRYh/leyZD0XTiQn0E5NUWCBHm0v5i9r0UWjFCOOdEMpMs63/GNp/bEpvgvzp3WfzTSE3DV/0UpS+4ZzYtXrvT34NLp/IOubEgF6lZP18=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067113;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0W8Wyo-4_1718592434;
Received: from localhost(mailfrom:hengqi@linux.alibaba.com fp:SMTPD_---0W8Wyo-4_1718592434)
          by smtp.aliyun-inc.com;
          Mon, 17 Jun 2024 10:47:15 +0800
Message-ID: <1718591738.670476-6-hengqi@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Date: Mon, 17 Jun 2024 10:35:38 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev,
 Jason Wang <jasowang@redhat.com>,
 Parav Pandit <parav@nvidia.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
 <20240611184828-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240611184828-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

On Tue, 11 Jun 2024 19:03:11 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Tue, May 28, 2024 at 12:47:02PM +0800, Heng Qi wrote:
> > The device can set any initial coalescing parameters (0 or non-zero)
> > for the receive/send queue before the setting command is executed,
> > not just 0, enhancing device performance even without DIM enabled.
> > 
> > So we need to clarify descriptions that don't fit the behavior.
> > 
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/194
> > Suggested-by: Jason Wang <jasowang@redhat.com>
> > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > Reviewed-by: Parav Pandit <parav@nvidia.com>
> > Reviewed-by: Jason Wang <jasowang@redhat.com>
> > ---
> > v4->v5:
> >   - Add RB tags from Parav and Jason. Thanks!
> > 
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
> > diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> > index 61cce1f..00c1b36 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -1803,6 +1803,14 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> >                                          for an enabled transmit/receive virtqueue whose index is \field{vq_index}.
> >  \end{enumerate}
> >  
> > +If the VIRTIO_NET_F_NOTF_COAL or VIRTIO_NET_F_VQ_NOTF_COAL feature is negotiated,
> > +the device may apply any coalescing parameters to each transmit/receive virtqueue
> > +before the driver successfully performs one of the VIRTIO_NET_CTRL_NOTF_COAL set commands.
> 
> may outside of conformance section, not good.

This is outside of the conformance section. Do you want inside?

> 
> > +
> > +The driver can query the coalescing parameters of any enabled transmit/receive
> > +virtqueue using the VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET command, before or after any
> > +VIRTIO_NET_CTRL_NOTF_COAL set command is done.
> > +
> 
> Vague. There are just 3 set commands ust list them.
> 
> >  The device may generate notifications more or less frequently than specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> >  
> >  If coalescing parameters are being set, the device applies the last coalescing parameters set for a
> 
> This needs more work but I guess we can skip the above part.
> 
> > @@ -1885,17 +1893,17 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> >  VIRTIO_NET_ERR if the designated virtqueue is not an enabled transmit or receive virtqueue.
> >  
> >  Upon disabling and re-enabling a transmit virtqueue, the device MUST set the coalescing parameters of the virtqueue
> > -to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_TX_SET command, or, if the driver did not set any TX coalescing parameters, to 0.
> > +to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_TX_SET command, or, if the driver did not set any TX coalescing parameters, the device MAY initialize them to any values.
> >  
> 
> If device does not initialize them then what?

The device's customized behavior, at least, does not conform to the spec.

> Actually something like 
> 0 -> the default TX coalescing parameters chosen by the device?

Deefault coalescing parameters should also have a concrete "value".

> 
> 
> >  Upon disabling and re-enabling a receive virtqueue, the device MUST set the coalescing parameters of the virtqueue
> > -to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set any RX coalescing parameters, to 0.
> > +to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set any RX coalescing parameters, the device MAY initialize them to any values.
> >  
> >  The behavior of the device in response to set commands of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> >  the device MAY generate notifications more or less frequently than specified.
> >  
> >  A device SHOULD NOT send used buffer notifications to the driver if the notifications are suppressed, even if the notification conditions are met.
> >  
> > -Upon reset, a device MUST initialize all coalescing parameters to 0.
> > +Upon reset, a device MAY set any coalescing parameters for all transmit and receive virtqueues.
> 
> Confusing.
> This seems to allow any vq to have a different set of parameters.

YES.

> Now if driver calls VIRTIO_NET_CTRL_NOTF_COAL_RX_SET then what?
> 

Then the coalescing parameters of all RX queues are updated to the values
set by VIRTIO_NET_CTRL_NOTF_COAL_RX_SET, and the coalescing parameters of all
TX queues continue to retain the previous values.

Thanks.

> 
> >  
> >  \paragraph{Device Statistics}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}
> 
> 
> 
> 
> >  
> > -- 
> > 2.32.0.3.g01195cf9f
> 
