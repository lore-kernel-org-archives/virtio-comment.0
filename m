Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4D4178373
	for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 12:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719492789; cv=none; b=bQjB6fEXJOBIQjl+gYlqYQECQn8SjnQs8utiQsnx9ylT7mA8lq1FnJHGGEoW7MlsbHysBUVpCbiFnrid4l11LUHXJH0/Ct8sjgXGkVb5TBbF+PyJ4F7wqtGzozJDZfhjBrIf2PK1DgvoMH/qqvaqMLjrGQDijVbuPzf5Xye8sEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719492789; c=relaxed/simple;
	bh=HLYZ3jZsRxXHs4Zf3oy71kZFontU9dnolS9KrsLma24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GIMUz+smUP6cnvn2/AZ7dKi+gwHGHI3hlG6VrKaT5WoxlmHDOZ26e5+hi1rRtmVbYIDC4669nKwiUnge+0JVUCAIpDxZ6geeEmDPmsR38VZPN1+8GE5IY9qW8AQGut/XBP4C3TZDfMoNkEKKGV0vV8WNsoJUVFpER5kC95Tpgcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XRJ9iXME; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XRJ9iXME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719492786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9BGSznCpqbuIJuQIaUrkAccnLBFEfMgDDxGlLKRcmWo=;
	b=XRJ9iXME/qNvF0ZrYJq6jngi4bkCs7qdXH653lCSjKx0zvsrXXBPHK8hmErr5WtlM2fi8Q
	ekZGXaCpm7BNtG7AGJSMy/0oqGNzMFTcfyQuMoS06+RPIAugepsJlEH0/YgomtOkRSP0II
	JhmwpIyol2V1bx0jhAsDlNuGhllutIA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-xbQGH9UxObOqXAsBKvMJ2A-1; Thu, 27 Jun 2024 08:53:05 -0400
X-MC-Unique: xbQGH9UxObOqXAsBKvMJ2A-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4256809ae27so1140155e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 05:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719492784; x=1720097584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BGSznCpqbuIJuQIaUrkAccnLBFEfMgDDxGlLKRcmWo=;
        b=LZhAcgitYptnAfkFid6lV4emzJxfJGIFfJfNQMlumdphANWj3/AUxxgwsL3jl3WFS4
         5mPD7+ZVqswWt1R2ftuL4wKRrdb9Paa+CuAGbVXjGAZFmCi80BYVLOjnZK4hn5yZUFP8
         mmts7JIGAXezKaVOeyAHa4soYGB+UHGLKgt7XP/cq8cCDJy8Mow6MEcl8kFqWfXWjt68
         bdJjhtFuJ8SbFtb+ZEdTE0qVvSuO2O/sYnGorbf5+UVH+JK9iWs3jRrSa6a2iagsxM6r
         2GGu7pLQidI+4VhfnupAJB0kOoDM0PaTOjqEwqIyMZsY2Khxsv+su4kUQJuqx86i/IHS
         ZMIA==
X-Forwarded-Encrypted: i=1; AJvYcCXy4lR1CyuO+THUuwZp6EQWpH0Q60wt6w1GUOxb4HxFBJAInc8krTWIungYEWCFJpGdZpAqseygJRsRw6jVU7g+e/wWO1V8DGbw5hBsDQQ=
X-Gm-Message-State: AOJu0YzSTL7CKE3UPK69hZIiIr95JpX3Gagks4CkDEPn7MyA81+dLRQn
	OMDDE6yeRO6klaUz7IqDInfIcbRqgmrGMpdLkNY6WwOiDR3K+FxPM+tdXkWvl65c6UBszTVr6Ik
	TXSUqjM7SjbrR9Ox7wvVO5irQgmbq1Ljlppmydj99108InoUW+GWp/HfQRXvGME/9
X-Received: by 2002:a5d:4092:0:b0:35f:18b9:73e1 with SMTP id ffacd0b85a97d-366e94914cemr7838236f8f.27.1719492783705;
        Thu, 27 Jun 2024 05:53:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt237hRZAdB2iKF3niX1XCUq0yJVlXjUYR1DsWrBtzvfBS+HVXu+JqFiS6mE96Sm9rVvkWHA==
X-Received: by 2002:a5d:4092:0:b0:35f:18b9:73e1 with SMTP id ffacd0b85a97d-366e94914cemr7838204f8f.27.1719492782883;
        Thu, 27 Jun 2024 05:53:02 -0700 (PDT)
Received: from redhat.com ([2a02:14f:177:a007:5be4:b928:19f7:7c2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367436a28d2sm1756118f8f.114.2024.06.27.05.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 05:53:02 -0700 (PDT)
Date: Thu, 27 Jun 2024 08:52:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
	Heng Qi <hengqi@linux.alibaba.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240627084719-mutt-send-email-mst@kernel.org>
References: <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
 <1718940245.6932242-13-hengqi@linux.alibaba.com>
 <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
 <1719020069.8729858-17-hengqi@linux.alibaba.com>
 <f03e76fe-9ee8-4000-b41c-0b284f2f237d@oracle.com>
 <PH0PR12MB54818CFB447152A25130F9B8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <bca1e5e8-65af-4825-b6fe-2ca3b6c41feb@oracle.com>
 <20240627123732.0cf541b3.pasic@linux.ibm.com>
 <20240627080346-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810E5C9E7B309C5A296F7CDCD72@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54810E5C9E7B309C5A296F7CDCD72@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 27, 2024 at 12:45:49PM +0000, Parav Pandit wrote:
> Hi Michael,
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, June 27, 2024 6:05 PM
> > 
> > On Thu, Jun 27, 2024 at 12:37:32PM +0200, Halil Pasic wrote:
> > > On Tue, 25 Jun 2024 18:14:15 -0700
> > > Si-Wei Liu <si-wei.liu@oracle.com> wrote:
> > >
> > > > On 6/24/2024 10:56 PM, Parav Pandit wrote:
> > > [..]
> > > > > I saw the need of this proposal slightly differently in the discussion with
> > Heng in v4.
> > > > > The way I understood is, proposed relaxation enables below Linux driver
> > flow to work as equally as without device offering
> > VIRTIO_NET_F_VQ_NOTF_COAL.
> > > > >
> > > > > Flow is:
> > > > > 1. The device offered feature VIRTIO_NET_F_VQ_NOTF_COAL 2. The
> > > > > virtio-net driver negotiated VIRTNET_FEATURES that has
> > > > > VIRTIO_NET_F_VQ_NOTF_COAL
> > > > >
> > > > > 3. Because VIRTIO_NET_F_VQ_NOTF_COAL is negotiated, device is not
> > applying any coalescing on the VQ, in a good hope that driver will perform VQ
> > notification coalescing.
> > >
> > > I have certainly understood this differently. When
> > > VIRTIO_NET_F_VQ_NOTF_COAL is not negotiated then the device is not
> > supposed/allowed to do any interrupt coalescing (notification suppression
> > may still apply).
> > >
> > > If VIRTIO_NET_F_VQ_NOTF_COAL is negotiated the device is supposed
> > > to/MUST do the coalescing according to the parameters as described by
> > > the virtio spec.
> > >
> > > Michael, Jason: Can you guys weigh in on this?
> > 
> > I still don't understand why this change is needed.
> > We have this text:
> > 
> > 	The device may generate notifications more or less frequently than
> > 	specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL
> > class.
> > 
> > and
> > 
> > 	The behavior of the device in response to set commands of the
> > VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> > 	the device MAY generate notifications more or less frequently than
> > specified.
> > 
> > So with no spec changes, devices already can do what this patch says they can
> > do - send notifications less frequently.
> > 
> > Re-reading this spec text, maybe the confusion is that it mentions set
> > commands specifically? And it's also stuck in the middle where it's easy to
> > miss.
> > 
> > So it would seem that the following should be sufficient, and it looks like a
> > small clarification we could just apply and include in the vote for the csd. What
> > do you guys think?
> > 
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > ----
> > 
> > 
> > diff --git a/device-types/net/description.tex b/device-
> > types/net/description.tex
> > index 76585b0..d6788df 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -1711,8 +1711,6 @@ \subsubsection{Control
> > Virtqueue}\label{sec:Device Types / Network Device / Devi
> >                                          for an enabled transmit/receive virtqueue whose index is
> > \field{vq_index}.
> >  \end{enumerate}
> > 
> > -The device may generate notifications more or less frequently than specified
> > by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> > -
> >  If coalescing parameters are being set, the device applies the last coalescing
> > parameters set for a  virtqueue, regardless of the command used to set the
> > parameters. Use the following command sequence  with two pairs of
> > virtqueues as an example:
> > @@ -1726,6 +1724,9 @@ \subsubsection{Control
> > Virtqueue}\label{sec:Device Types / Network Device / Devi  \item Command6:
> > VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET with \field{vq_index} = 1, the device
> > responds with coalescing parameters of index 1 set by command5.
> >  \end{itemize}
> > 
> > +The device can generate notifications more or less frequently than
> > +specified by the coalescing parameters.
> > +
> >  \subparagraph{Operation}\label{sec:Device Types / Network Device / Device
> > Operation / Control Virtqueue / Notifications Coalescing / Operation}
> > 
> >  The device sends a used buffer notification once the notification conditions
> > are met and if the notifications are not suppressed as explained in
> > \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Used Buffer
> > Notification Suppression}.
> > @@ -1798,7 +1799,7 @@ \subsubsection{Control
> > Virtqueue}\label{sec:Device Types / Network Device / Devi  Upon disabling
> > and re-enabling a receive virtqueue, the device MUST set the coalescing
> > parameters of the virtqueue  to those configured through the
> > VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set
> > any RX coalescing parameters, to 0.
> > 
> > -The behavior of the device in response to set commands of the
> > VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> > +The behavior of the device in response to specific coalescing parameters is
> > best-effort:
> >  the device MAY generate notifications more or less frequently than specified.
> > 
> >  A device SHOULD NOT send used buffer notifications to the driver if the
> > notifications are suppressed, even if the notification conditions are met.
> > 
> 
> Your changes above are good and they are applicable when the specific coalescing parameters are set by the driver.

What makes you say this?
No they apply universally whenever parameters are specified by the spec:
whether parameters are set by driver or by device.
Is that unclear somehow?
I suspect you are just reading the wrong part of the patch ...


> The issue that is being resolved is, when these parameters are NOT set by the driver, when feature is negotiated.
> What should device do?
> The parameters are not specified...

They are specified - set to 0.

> The spec says " Upon reset, a device MUST initialize all coalescing parameters to 0.".

yes. and device can then coalesce if it wants to.

> And Heng attempt is to clarify that by adding a changing above line something like,
> 
> "when driver does not set coalescing params, but have negotiated the feature, device may generate notifications more or less frequently than specified".


Maybe that is the intention, but the proposed text is instead saying the
parameters themselves are !0. Which is what triggered the whole
mess with a misvote: commit log says it's a clarification when it is actually
a behaviour change.


-- 
MST

