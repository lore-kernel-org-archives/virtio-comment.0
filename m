Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928C019883C
	for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 14:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500352; cv=none; b=MAI0mTsqkSB4UNKBr11QM78HwHATpHTLt5TDYjZtn5mVelkm8tVoxbi0/4Dw/HlyaQIe6ZhC84wEeV78y+2nnNDYwgu50v08QZVksXuDPWCs9pFb7g/AjbH0KMMzhzwWKmwb8zD3ggd5Cbhu50OHX7GXFjGxbbR871bvGjBGn5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500352; c=relaxed/simple;
	bh=8xiwEu4I63kUGN0pBO4cL69Z8R435ZFEHilouv8eB3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=oV8uWY5UquVy2MgQVoOC+Z98VPJCpF0AnS+f/6ka9ONiDp0Rr2KOs/PNurQXsW96UurRcWWhlcHDjr33YfyB8+uXBkWpkF/KN4WuICjDyRtOagolDTSIolC+apayLmcEO71iX3n+B8vFUDwemVhjJvf9nZLjl6JVIc+YrcmhnRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AiNagbFQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AiNagbFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719500349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IRB6PRwnuWiiCXMPU7XZj9uIksPiMGRvrHisPg/KM74=;
	b=AiNagbFQTgiYyRxW9ONAx1xdLjRFTSX1plO/sq75RSuwhtrgNwNG+NCMoMA4e1WVZeUuoC
	bvHHPbZxckxh0RiuxmcxpjBKsnY1UsFboheNI2Z17lFpybmGF4MyTo4v/7GDKsXvO1OQeX
	mNc627JEwEGDD9UcUmjIfaAmsj6QH10=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-kJkKZN3QMKWTnilDMgucrw-1; Thu, 27 Jun 2024 10:59:08 -0400
X-MC-Unique: kJkKZN3QMKWTnilDMgucrw-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3669ccc3451so1493779f8f.2
        for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 07:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500347; x=1720105147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRB6PRwnuWiiCXMPU7XZj9uIksPiMGRvrHisPg/KM74=;
        b=sU6qZ+/a1kTo0TotWHUlcJDe02OJ/h6uhpNFeXVHQU1b1CU/yZ/vYPpMEXa9rIN4+T
         oPrG0GflkjS0Wsg9pVxjI24X61itEAHMUx8xzLNGt9g9kuE+yF+nAcUcKcWTix9nTj1D
         nfgsp+cHjRa/Sl4M4MrNGmx/VesEe34Bdrns6dkQcZnoX2faDxo+KLC95lWt7ikEXlYG
         hPyIIyXL+57EQU2AF1sQOLvSbYWzbJRn/nHyxG+Metj4PuyZJVYokoDwC86OXOS95Ea+
         7fJBt/l/9mdHzW36W+Blp59Ofjxgr7l5bgEWls/fI3r6fCW+xhMEU2h84rF66DjjlqTe
         TPBw==
X-Forwarded-Encrypted: i=1; AJvYcCUkH9dBi0UyFTmmgMTV4rTpVD4i6OfLEA8Gk+eAzblBCSY+7XofMv8PQ38V3F1AiB4fJhMT8/nNwhll/VXJdEH/cNr45Fm5TaM9319kdE0=
X-Gm-Message-State: AOJu0YxN3Lz857JA9Fx2SqggYX7ChnfFzReUWmdhZ5AeuDr7jJwo/9D4
	AavaKNPHtPiOkMy2ePL7kHhaXh5iSUfvejtidx7dqiCnkIzBrhOrMXmJ68YmnoB6OkLwMZf3dAQ
	1WxLbSQ5/kQFDjHoS9l4Vq7pbVgR20tWWGTPqNzkMTDju2vnob8uuQ5+gubqXHf2d
X-Received: by 2002:a05:6000:10d:b0:35f:2f3b:ba90 with SMTP id ffacd0b85a97d-366e7a1955amr9860586f8f.18.1719500346915;
        Thu, 27 Jun 2024 07:59:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgCxKfJHk6UE25KVSZjD0Kd8ERjQERemcgtGDP/Y5yocRAXW/e4asQq48m75sP07fZ2lM6CA==
X-Received: by 2002:a05:6000:10d:b0:35f:2f3b:ba90 with SMTP id ffacd0b85a97d-366e7a1955amr9860539f8f.18.1719500346157;
        Thu, 27 Jun 2024 07:59:06 -0700 (PDT)
Received: from redhat.com ([2a02:14f:177:a007:5be4:b928:19f7:7c2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36743585633sm2170454f8f.59.2024.06.27.07.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 07:59:05 -0700 (PDT)
Date: Thu, 27 Jun 2024 10:59:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
	Heng Qi <hengqi@linux.alibaba.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240627105707-mutt-send-email-mst@kernel.org>
References: <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
 <1719020069.8729858-17-hengqi@linux.alibaba.com>
 <f03e76fe-9ee8-4000-b41c-0b284f2f237d@oracle.com>
 <PH0PR12MB54818CFB447152A25130F9B8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <bca1e5e8-65af-4825-b6fe-2ca3b6c41feb@oracle.com>
 <20240627123732.0cf541b3.pasic@linux.ibm.com>
 <20240627080346-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810E5C9E7B309C5A296F7CDCD72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240627084719-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481AC5003763A6C07947DA5DCD72@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481AC5003763A6C07947DA5DCD72@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 27, 2024 at 01:03:51PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, June 27, 2024 6:23 PM
> > 
> > On Thu, Jun 27, 2024 at 12:45:49PM +0000, Parav Pandit wrote:
> > > Hi Michael,
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Thursday, June 27, 2024 6:05 PM
> > > >
> > > > On Thu, Jun 27, 2024 at 12:37:32PM +0200, Halil Pasic wrote:
> > > > > On Tue, 25 Jun 2024 18:14:15 -0700 Si-Wei Liu
> > > > > <si-wei.liu@oracle.com> wrote:
> > > > >
> > > > > > On 6/24/2024 10:56 PM, Parav Pandit wrote:
> > > > > [..]
> > > > > > > I saw the need of this proposal slightly differently in the
> > > > > > > discussion with
> > > > Heng in v4.
> > > > > > > The way I understood is, proposed relaxation enables below
> > > > > > > Linux driver
> > > > flow to work as equally as without device offering
> > > > VIRTIO_NET_F_VQ_NOTF_COAL.
> > > > > > >
> > > > > > > Flow is:
> > > > > > > 1. The device offered feature VIRTIO_NET_F_VQ_NOTF_COAL 2. The
> > > > > > > virtio-net driver negotiated VIRTNET_FEATURES that has
> > > > > > > VIRTIO_NET_F_VQ_NOTF_COAL
> > > > > > >
> > > > > > > 3. Because VIRTIO_NET_F_VQ_NOTF_COAL is negotiated, device is
> > > > > > > not
> > > > applying any coalescing on the VQ, in a good hope that driver will
> > > > perform VQ notification coalescing.
> > > > >
> > > > > I have certainly understood this differently. When
> > > > > VIRTIO_NET_F_VQ_NOTF_COAL is not negotiated then the device is not
> > > > supposed/allowed to do any interrupt coalescing (notification
> > > > suppression may still apply).
> > > > >
> > > > > If VIRTIO_NET_F_VQ_NOTF_COAL is negotiated the device is supposed
> > > > > to/MUST do the coalescing according to the parameters as described
> > > > > by the virtio spec.
> > > > >
> > > > > Michael, Jason: Can you guys weigh in on this?
> > > >
> > > > I still don't understand why this change is needed.
> > > > We have this text:
> > > >
> > > > 	The device may generate notifications more or less frequently than
> > > > 	specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL
> > class.
> > > >
> > > > and
> > > >
> > > > 	The behavior of the device in response to set commands of the
> > > > VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> > > > 	the device MAY generate notifications more or less frequently than
> > > > specified.
> > > >
> > > > So with no spec changes, devices already can do what this patch says
> > > > they can do - send notifications less frequently.
> > > >
> > > > Re-reading this spec text, maybe the confusion is that it mentions
> > > > set commands specifically? And it's also stuck in the middle where
> > > > it's easy to miss.
> > > >
> > > > So it would seem that the following should be sufficient, and it
> > > > looks like a small clarification we could just apply and include in
> > > > the vote for the csd. What do you guys think?
> > > >
> > > >
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > >
> > > > ----
> > > >
> > > >
> > > > diff --git a/device-types/net/description.tex b/device-
> > > > types/net/description.tex index 76585b0..d6788df 100644
> > > > --- a/device-types/net/description.tex
> > > > +++ b/device-types/net/description.tex
> > > > @@ -1711,8 +1711,6 @@ \subsubsection{Control
> > > > Virtqueue}\label{sec:Device Types / Network Device / Devi
> > > >                                          for an enabled
> > > > transmit/receive virtqueue whose index is \field{vq_index}.
> > > >  \end{enumerate}
> > > >
> > > > -The device may generate notifications more or less frequently than
> > > > specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> > > > -
> > > >  If coalescing parameters are being set, the device applies the last
> > > > coalescing parameters set for a  virtqueue, regardless of the
> > > > command used to set the parameters. Use the following command
> > > > sequence  with two pairs of virtqueues as an example:
> > > > @@ -1726,6 +1724,9 @@ \subsubsection{Control
> > > > Virtqueue}\label{sec:Device Types / Network Device / Devi  \item
> > Command6:
> > > > VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET with \field{vq_index} = 1, the
> > > > device responds with coalescing parameters of index 1 set by command5.
> > > >  \end{itemize}
> > > >
> > > > +The device can generate notifications more or less frequently than
> > > > +specified by the coalescing parameters.
> > > > +
> > > >  \subparagraph{Operation}\label{sec:Device Types / Network Device /
> > > > Device Operation / Control Virtqueue / Notifications Coalescing /
> > > > Operation}
> > > >
> > > >  The device sends a used buffer notification once the notification
> > > > conditions are met and if the notifications are not suppressed as
> > > > explained in \ref{sec:Basic Facilities of a Virtio Device /
> > > > Virtqueues / Used Buffer Notification Suppression}.
> > > > @@ -1798,7 +1799,7 @@ \subsubsection{Control
> > > > Virtqueue}\label{sec:Device Types / Network Device / Devi  Upon
> > > > disabling and re-enabling a receive virtqueue, the device MUST set
> > > > the coalescing parameters of the virtqueue  to those configured
> > > > through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the
> > > > driver did not set any RX coalescing parameters, to 0.
> > > >
> > > > -The behavior of the device in response to set commands of the
> > > > VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> > > > +The behavior of the device in response to specific coalescing
> > > > +parameters is
> > > > best-effort:
> > > >  the device MAY generate notifications more or less frequently than
> > specified.
> > > >
> > > >  A device SHOULD NOT send used buffer notifications to the driver if
> > > > the notifications are suppressed, even if the notification conditions are
> > met.
> > > >
> > >
> > > Your changes above are good and they are applicable when the specific
> > coalescing parameters are set by the driver.
> > 
> > What makes you say this?
> Because I was reading this in the CVQ section of the spec where CVQ commands are setting it.


So? Reset also sets it.

> > No they apply universally whenever parameters are specified by the spec:
> > whether parameters are set by driver or by device.
> I see. Upon reset they are set to 0 in the below text, means no coalescing, means quick interrupts, right?

But device can make them as slow as it likes, spec says so.


> > Is that unclear somehow?
> > I suspect you are just reading the wrong part of the patch ...
> > 
> > 
> > > The issue that is being resolved is, when these parameters are NOT set by the
> > driver, when feature is negotiated.
> > > What should device do?
> > > The parameters are not specified...
> > 
> > They are specified - set to 0.
> > 
> > > The spec says " Upon reset, a device MUST initialize all coalescing parameters
> > to 0.".
> > 
> > yes. and device can then coalesce if it wants to.
> > 
> You mean 0 means coalescing is disabled (and not quick notifications) ?
> And hence, it is device chosen value?
> If so, that interpretation would work too.

No 0 means send notification after any # of packets.


> > > And Heng attempt is to clarify that by adding a changing above line
> > > something like,
> > >
> > > "when driver does not set coalescing params, but have negotiated the
> > feature, device may generate notifications more or less frequently than
> > specified".
> > 
> > 
> > Maybe that is the intention, but the proposed text is instead saying the
> > parameters themselves are !0. 
> A clarification like above would be better or 0 means device chosen parameters would also work fine.


> > Which is what triggered the whole mess with a
> > misvote: commit log says it's a clarification when it is actually a behaviour
> > change.
> > 
> It is a behavior change to fix/restore.
> But if you suggest: 0 means device chosen value, that will work too to restore current regression.

