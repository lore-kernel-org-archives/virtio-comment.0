Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339A22837F
	for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 22:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719526699; cv=none; b=ooj6IxubTbb/PdWdD30nknhTf8NUrf8vGuapPLMyVnU6faGReWH6D4sAgoDPn5591msdKuGkOT53ZD38H4j5AZtZKu+gtAOrxIrid8WqTyVtYUNtkfbsdUzFEYybV3VG4AqAhq7fCxyawDNKqYayZjWVf4SNO7YVxlSZ6RtGvXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719526699; c=relaxed/simple;
	bh=BVzKOfJo6urM9m2cJpg07Pdb77gcbbedScPFjh5myxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fe5F529/lnbAtwSVyA2TORBGelIsVwmWe9hypei2gOmbHmwvrXC//PVByJhGDoVCEvSvPXi3blThEDZZVhcZkqHhDMzOS5Yc17smOAWbQMWHK+CuR00TarLNzV9ua0n+K58VL8YZPxKr8z+ZZ29/40BSa9K3oirA05ctNXXAr9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S3Vek/yp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S3Vek/yp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719526696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9aGS16q3bhSZuz+PZmzmDVqvZv2dNbn8Tc97TsE5GM0=;
	b=S3Vek/ypOUROMetGPLic76thX9Ad1ogjVQavgHwD2DzfrJDY6KHlbX97jfNz0kynLysxLw
	J9c6jWNiiuPZWLWN3aXPk5Flz++gQTKsPGFwPET75hJf0fY2Vsb4wKfWBqJfHBO5x2V8NA
	cLSbRSbt78ZJq7RkZHvsxD9ltx3nFm8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-EZjJD5fmNcazGTHM2Tcxtw-1; Thu, 27 Jun 2024 18:18:15 -0400
X-MC-Unique: EZjJD5fmNcazGTHM2Tcxtw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3634a25a7beso4972503f8f.1
        for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 15:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719526694; x=1720131494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aGS16q3bhSZuz+PZmzmDVqvZv2dNbn8Tc97TsE5GM0=;
        b=oAKS1NSLAQxUOeqft+3kvT38p11v2WQznDlCQ029jxrNjYCa+y1tQxVT2eybspEkQR
         Hr894VD0MxyosgynG3p8byJMvOHp3+NS+I3cFbrqOfGKYhgrOVSFVxIElU8+LZK/b9KZ
         iBpn8aU27b6AIxSyC4TZHqhoQYLX/zzG3AYYiL4hjhJ/0iTSW3z3/Nk09EOrR3smUPWi
         osTmhLeonE8RqBBK73LC0RrO1TEjtRGmEqGrTjxWOKrS6JZxu1Bg38EDWBbRbqoYNMQ6
         g16DEaVQ3p7QmKSXEagx/f0OaEG7/ItLwoYNu51rV4GeZwggD9q/HectG1KzROt/6EQ+
         goBA==
X-Forwarded-Encrypted: i=1; AJvYcCXxbkOqcv1Gx3mGrelo+nxrp65guUWOqJInJ0xeiza8fa64ie3BCD18nIbaDVKvwM2KTLCeKpO3Z4NlpaOy6ybw9kqqSCv/hAYA2qnyv+c=
X-Gm-Message-State: AOJu0YwZZSBJUuxDKAkSXK6Pizi2SnuTmSocCkmEW8qYpo1za2BGGHcY
	ZQ8EnJH6jbsa5cEINEdG9DnaHWmVJvWZPYxhhwjG1FIwnVw56aYuBZilxXxOP83i2qYqpIAo/Kw
	eGZDW1gcymdEs0S/Gfp1hT4o6sn1l6SxbvjJ8rP2PZNa0mAGTTWhZrBVYbrgj4wqG
X-Received: by 2002:a05:6000:2ab:b0:366:eadc:6ca4 with SMTP id ffacd0b85a97d-366eadc6d3fmr12920235f8f.29.1719526694052;
        Thu, 27 Jun 2024 15:18:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvFcsrrbiCVwEuZZf13d1Me87gWehVs5s4u950PY5HguqL4FAH0yG/1A3u9NRiQYRTcox55w==
X-Received: by 2002:a05:6000:2ab:b0:366:eadc:6ca4 with SMTP id ffacd0b85a97d-366eadc6d3fmr12920213f8f.29.1719526693216;
        Thu, 27 Jun 2024 15:18:13 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7411:8300:1c60:e9bd:26d:3638])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d9376sm434808f8f.37.2024.06.27.15.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 15:18:12 -0700 (PDT)
Date: Thu, 27 Jun 2024 18:18:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, Parav Pandit <parav@nvidia.com>,
	Heng Qi <hengqi@linux.alibaba.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240627181635-mutt-send-email-mst@kernel.org>
References: <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
 <1718940245.6932242-13-hengqi@linux.alibaba.com>
 <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
 <1719020069.8729858-17-hengqi@linux.alibaba.com>
 <f03e76fe-9ee8-4000-b41c-0b284f2f237d@oracle.com>
 <PH0PR12MB54818CFB447152A25130F9B8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <bca1e5e8-65af-4825-b6fe-2ca3b6c41feb@oracle.com>
 <20240627123732.0cf541b3.pasic@linux.ibm.com>
 <20240627080346-mutt-send-email-mst@kernel.org>
 <b57acf4d-84e1-4360-a229-eeb7b3d752fc@oracle.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b57acf4d-84e1-4360-a229-eeb7b3d752fc@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 27, 2024 at 10:14:49AM -0700, Si-Wei Liu wrote:
> 
> 
> On 6/27/2024 5:35 AM, Michael S. Tsirkin wrote:
> > On Thu, Jun 27, 2024 at 12:37:32PM +0200, Halil Pasic wrote:
> > > On Tue, 25 Jun 2024 18:14:15 -0700
> > > Si-Wei Liu <si-wei.liu@oracle.com> wrote:
> > > 
> > > > On 6/24/2024 10:56 PM, Parav Pandit wrote:
> > > [..]
> > > > > I saw the need of this proposal slightly differently in the discussion with Heng in v4.
> > > > > The way I understood is, proposed relaxation enables below Linux driver flow to work as equally as without device offering VIRTIO_NET_F_VQ_NOTF_COAL.
> > > > > 
> > > > > Flow is:
> > > > > 1. The device offered feature VIRTIO_NET_F_VQ_NOTF_COAL
> > > > > 2. The virtio-net driver negotiated VIRTNET_FEATURES that has VIRTIO_NET_F_VQ_NOTF_COAL
> > > > > 
> > > > > 3. Because VIRTIO_NET_F_VQ_NOTF_COAL is negotiated, device is not applying any coalescing on the VQ, in a good hope that driver will perform VQ notification coalescing.
> > > I have certainly understood this differently. When
> > > VIRTIO_NET_F_VQ_NOTF_COAL is not negotiated then the device is not supposed/allowed to do any interrupt coalescing (notification suppression may still apply).
> > > 
> > > If VIRTIO_NET_F_VQ_NOTF_COAL is negotiated the device is supposed
> > > to/MUST do the coalescing according to the parameters as described by
> > > the virtio spec.
> > > 
> > > Michael, Jason: Can you guys weigh in on this?
> > I still don't understand why this change is needed.
> > We have this text:
> > 
> > 	The device may generate notifications more or less frequently than
> > 	specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> > 
> > and
> > 
> > 	The behavior of the device in response to set commands of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> > 	the device MAY generate notifications more or less frequently than specified.
> > 
> > So with no spec changes, devices already can do what this patch says they can do -
> > send notifications less frequently.
> Right. If I still recall it correctly, the above text was to accommodate the
> interaction with existing used buffer notification mechanism, F_EVENT_IDX or
> whatnot.
> When coalescing is in place and effective, interrupt delivery is a
> collaborative consideration based on the coalescing parameters specified
> *AND * event index / NO_INTERRUPT flag as well.

No, not really.

For that we have the next sentence:

A device SHOULD NOT send used buffer notifications to the driver if the notifications are suppressed, even if the notification conditions are met.


And of course event index never makes you send interrupts
more frequently.

> > 
> > Re-reading this spec text, maybe the confusion is that it mentions set
> > commands specifically? And it's also stuck in the middle where it's easy
> > to miss.
> > 
> > So it would seem that the following should be sufficient, and it looks
> > like a small clarification we could just apply and include in the
> > vote for the csd. What do you guys think?
> 
> The revised text below looks good to me.
> 
> Thanks,
> -Siwei
> > 
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > ----
> > 
> > 
> > diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> > index 76585b0..d6788df 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -1711,8 +1711,6 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> >                                           for an enabled transmit/receive virtqueue whose index is \field{vq_index}.
> >   \end{enumerate}
> > -The device may generate notifications more or less frequently than specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> > -
> >   If coalescing parameters are being set, the device applies the last coalescing parameters set for a
> >   virtqueue, regardless of the command used to set the parameters. Use the following command sequence
> >   with two pairs of virtqueues as an example:
> > @@ -1726,6 +1724,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> >   \item Command6: VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET with \field{vq_index} = 1, the device responds with coalescing parameters of index 1 set by command5.
> >   \end{itemize}
> > +The device can generate notifications more or less frequently
> > +than specified by the coalescing parameters.
> > +
> >   \subparagraph{Operation}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing / Operation}
> >   The device sends a used buffer notification once the notification conditions are met and if the notifications are not suppressed as explained in \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Used Buffer Notification Suppression}.
> > @@ -1798,7 +1799,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> >   Upon disabling and re-enabling a receive virtqueue, the device MUST set the coalescing parameters of the virtqueue
> >   to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set any RX coalescing parameters, to 0.
> > -The behavior of the device in response to set commands of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> > +The behavior of the device in response to specific coalescing parameters is best-effort:
> >   the device MAY generate notifications more or less frequently than specified.
> >   A device SHOULD NOT send used buffer notifications to the driver if the notifications are suppressed, even if the notification conditions are met.
> > 

