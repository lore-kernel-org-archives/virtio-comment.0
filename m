Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCFC47A62
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 07:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719300396; cv=none; b=VdH5JadXn5TQ8EnGPVsrR/Pbc7wA75DPgoR63lBuAGzOnaZywbXJ/lYdwkTGiQTkA0FehPxFUq3hf5Fs2aRXNWY0F5dhktRbITcouMsskn+iM4Z2UYUKAU+hU0tItrTflEOp2vPS7dO2c3CeZjK3uiOq43zKt9R7HqygxCJtXRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719300396; c=relaxed/simple;
	bh=CS7/VvB7XuapTe9RBOMc76+shSJ03GbhG9U3+NA5xFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=EO5OPfSUptgywfZNSP4rpOA7qYHhVHUccSs4wC6EphE4jGkD9wuwqDNKrLFfgo58irM1bKcgTLps6XlfVJAOOTy5pwPdz7WtHoT+gJ161Eo+RZf5uIq6V7JiZJ5GJM/BEbdMGLp14SMiOFrR3I9HoW9iF9KCF+RSyWClbiElH5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CWcPnVnk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CWcPnVnk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719300394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ok9A2ftkGS9tEWWiqM67Yq9uVcCvNatT0ZZyTLPjQc4=;
	b=CWcPnVnkr5yWB/cWAY4ze2zlSM1iKFb3G8VXTUmWErKzZkw/CLJRHglNP2wthT8WhUjFnG
	PY0JDcI5FWAhDMPRHlqUunAAc3ctWAwtYSEnKQQuWCavsyMcEIIjEBpP4Wr5a2/XecilZp
	SE0m72bfuEAdowU4NjdEZQNxIYBYmPk=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-NvNJ17GiPzK_CIvFaxKfcQ-1; Tue, 25 Jun 2024 03:26:32 -0400
X-MC-Unique: NvNJ17GiPzK_CIvFaxKfcQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52cd7e63b2aso2790187e87.3
        for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 00:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719300391; x=1719905191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ok9A2ftkGS9tEWWiqM67Yq9uVcCvNatT0ZZyTLPjQc4=;
        b=R9Xz3o+AK3twaZ83Nqp+cIY7xIBqzqNGP3Q1nejfMpNGesxu6Z8D9QUn7asYOR1uww
         wdmYr9+euJqZWHZ6HiUnt1AecoW4PrMy510aerkh79XqVe/+/flDb2zqIIp4xw1PSYGu
         mgehlwTYZ2IAKNPLmjNrMdpzIheSIsOiYhSSfFvJDt5WCqpdzTzoxdGkWJ3vx5nWEtR+
         opnjMPuei9MjtuuTuFKY9Z9wxiHpao+LUDBP8eyqAlPQp0J/vRUYpjldLAxksJHKz2C0
         PukXCE9a0tXD1+EZxZfLY57h8e282hY/NB73NRcswdiKqVmXR6G2sSHP9+SwDF4SNRdF
         YTjA==
X-Gm-Message-State: AOJu0YxEHDgHx1UOWEk08L0Dnmn2UYaI+pRH/zmsXWmG5HgtDkgbzuvD
	VfZqjYbXRO4OkA7wNliIB4v3+DeXUWn9aq09bvSE5WurzqqX1/pxYgl79NkibhiTdRXUBamxgQy
	YNy8gaKgeWtsGUDJO2kGlu4nT7+AzAYzV89DRqvQqTQJrof4EwV5dAWwTnmFzdgau
X-Received: by 2002:ac2:44da:0:b0:52c:dc6f:75a3 with SMTP id 2adb3069b0e04-52ce062007bmr5255558e87.40.1719300390900;
        Tue, 25 Jun 2024 00:26:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGihBHcmncDRiWln8CwXeZy2dJfhB+CgRxf6o9XMTRmU/aZ5O9uqisRe/bVLGn490uVHGEy5w==
X-Received: by 2002:ac2:44da:0:b0:52c:dc6f:75a3 with SMTP id 2adb3069b0e04-52ce062007bmr5255539e87.40.1719300390096;
        Tue, 25 Jun 2024 00:26:30 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f6:f72:b8c7:9fc2:4c8b:feb3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d208b6bsm203800705e9.32.2024.06.25.00.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 00:26:29 -0700 (PDT)
Date: Tue, 25 Jun 2024 03:26:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240625032237-mutt-send-email-mst@kernel.org>
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
 <20240611184828-mutt-send-email-mst@kernel.org>
 <1718591738.670476-6-hengqi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1718591738.670476-6-hengqi@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 17, 2024 at 10:35:38AM +0800, Heng Qi wrote:
> On Tue, 11 Jun 2024 19:03:11 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > On Tue, May 28, 2024 at 12:47:02PM +0800, Heng Qi wrote:
> > > The device can set any initial coalescing parameters (0 or non-zero)
> > > for the receive/send queue before the setting command is executed,
> > > not just 0, enhancing device performance even without DIM enabled.
> > > 
> > > So we need to clarify descriptions that don't fit the behavior.
> > > 
> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/194
> > > Suggested-by: Jason Wang <jasowang@redhat.com>
> > > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > > Reviewed-by: Parav Pandit <parav@nvidia.com>
> > > Reviewed-by: Jason Wang <jasowang@redhat.com>
> > > ---
> > > v4->v5:
> > >   - Add RB tags from Parav and Jason. Thanks!
> > > 
> > > v3->v4:
> > >   - Doesn't force the device to remember more stuff. @Parav
> > > 
> > > v2->v3:
> > >   - Clarify description to be more generic. @Parav
> > > 
> > > v1->v2:
> > >   - Update description. @Jason
> > > 
> > >  device-types/net/description.tex | 14 +++++++++++---
> > >  1 file changed, 11 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> > > index 61cce1f..00c1b36 100644
> > > --- a/device-types/net/description.tex
> > > +++ b/device-types/net/description.tex
> > > @@ -1803,6 +1803,14 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> > >                                          for an enabled transmit/receive virtqueue whose index is \field{vq_index}.
> > >  \end{enumerate}
> > >  
> > > +If the VIRTIO_NET_F_NOTF_COAL or VIRTIO_NET_F_VQ_NOTF_COAL feature is negotiated,
> > > +the device may apply any coalescing parameters to each transmit/receive virtqueue
> > > +before the driver successfully performs one of the VIRTIO_NET_CTRL_NOTF_COAL set commands.
> > 
> > may outside of conformance section, not good.
> 
> This is outside of the conformance section. Do you want inside?

needs to be rephrased to avoid using reserved keywords.

> > 
> > > +
> > > +The driver can query the coalescing parameters of any enabled transmit/receive
> > > +virtqueue using the VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET command, before or after any
> > > +VIRTIO_NET_CTRL_NOTF_COAL set command is done.
> > > +
> > 
> > Vague. There are just 3 set commands ust list them.
> > 
> > >  The device may generate notifications more or less frequently than specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> > >  
> > >  If coalescing parameters are being set, the device applies the last coalescing parameters set for a
> > 
> > This needs more work but I guess we can skip the above part.
> > 
> > > @@ -1885,17 +1893,17 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> > >  VIRTIO_NET_ERR if the designated virtqueue is not an enabled transmit or receive virtqueue.
> > >  
> > >  Upon disabling and re-enabling a transmit virtqueue, the device MUST set the coalescing parameters of the virtqueue
> > > -to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_TX_SET command, or, if the driver did not set any TX coalescing parameters, to 0.
> > > +to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_TX_SET command, or, if the driver did not set any TX coalescing parameters, the device MAY initialize them to any values.
> > >  
> > 
> > If device does not initialize them then what?
> 
> The device's customized behavior, at least, does not conform to the spec.

Then why do you say "may"?


> > Actually something like 
> > 0 -> the default TX coalescing parameters chosen by the device?
> 
> Deefault coalescing parameters should also have a concrete "value".

and I just proposed how to say this in a clear way.


> > 
> > 
> > >  Upon disabling and re-enabling a receive virtqueue, the device MUST set the coalescing parameters of the virtqueue
> > > -to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set any RX coalescing parameters, to 0.
> > > +to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set any RX coalescing parameters, the device MAY initialize them to any values.
> > >  
> > >  The behavior of the device in response to set commands of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> > >  the device MAY generate notifications more or less frequently than specified.
> > >  
> > >  A device SHOULD NOT send used buffer notifications to the driver if the notifications are suppressed, even if the notification conditions are met.
> > >  
> > > -Upon reset, a device MUST initialize all coalescing parameters to 0.
> > > +Upon reset, a device MAY set any coalescing parameters for all transmit and receive virtqueues.
> > 
> > Confusing.
> > This seems to allow any vq to have a different set of parameters.
> 
> YES.
> 
> > Now if driver calls VIRTIO_NET_CTRL_NOTF_COAL_RX_SET then what?
> > 
> 
> Then the coalescing parameters of all RX queues are updated to the values
> set by VIRTIO_NET_CTRL_NOTF_COAL_RX_SET, and the coalescing parameters of all
> TX queues continue to retain the previous values.
> 
> Thanks.

It's not at all nice that there's apparently no way for driver to
get back to the default values.


> > 
> > >  
> > >  \paragraph{Device Statistics}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}
> > 
> > 
> > 
> > 
> > >  
> > > -- 
> > > 2.32.0.3.g01195cf9f
> > 

