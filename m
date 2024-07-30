Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FEC19754A
	for <virtio-comment@lists.linux.dev>; Tue, 30 Jul 2024 13:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722345280; cv=none; b=Di0RNezO7NFBFSyg9b51/clC5hVzgTrvRheYXubw+qhuXcov3oALFBlxH4wPf4WNBIZC6nkMQKB8tP/KaF2Rd5I5XcSlT6QdTKa2K1YKxLPIV4Kj98vXXgjJjdBvhbnTzU+RDarga7+mKv+6eaWVO8gzR0MK4sxjgRCyvidld+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722345280; c=relaxed/simple;
	bh=xoDELP/lIG+L2NyQxv4EL2E7zRmZ+0czf2kvEo5EeIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GOge/hEawUBd5U3tqDBy4LxeqyZFMJXBiivLSST2jbneHZs/fjAVj8epzIpK59J7qNjQNNtC7WKnHErX2wia16gaAcjKAWGH4VBRFvQZDDhl/7UDe2h1mYK8gmG8c8j9GsxHxITVKxVamvKtRdJUbYP/Vkl8Eiib98ViiWIz0Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LI4Y6ZVT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LI4Y6ZVT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722345277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P6qi0L1XByGZi0JTpqpFjDdHn2DrR0zLc4DjFvYQ+Xg=;
	b=LI4Y6ZVTP0Y9B4EoOHqnSnQ6OAR09HUOIPSr+uQpOgT9cJf676EAJd6rnBUbCkvztSsrM0
	+D4degrtvbXta3sk73EB1MgWIxF4gTG9h9+6z+qujkjPB+xpYPALA2PnCy/53FAyXE6XgK
	Va7ql3ToP8z737Yu2pZMCcvDr2tJGwc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-3dcpoHjgMhmAEaRcDgWRjw-1; Tue, 30 Jul 2024 09:14:35 -0400
X-MC-Unique: 3dcpoHjgMhmAEaRcDgWRjw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a7a83fad218so361990366b.3
        for <virtio-comment@lists.linux.dev>; Tue, 30 Jul 2024 06:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722345274; x=1722950074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6qi0L1XByGZi0JTpqpFjDdHn2DrR0zLc4DjFvYQ+Xg=;
        b=kDqcvD7LEqsdjeEq3Fyud02QJqMXiHVp9+AZip3S9BrOg17cMAgSLbbEjhb32PxCfL
         KLgCMOSDZDYOTM9zQPtaqZSPEo9Jr1IkTzNYcONMGB079NEPjUPoyM50+umUHoqJTdJo
         5NDa7mcbhVoIICdS33CQEUGVmW6MQVKS4/PH6dkY9d6lWXyX1Jmv8qzG0jA7AETWDDCb
         LBDYYk9o9LNOfyIvSMDH4rXFKjYhGCAs9VrbnoIo6jDqX/At1jxIfe5XVnNWyDKgNNVS
         4oi/vkDprQDHHyrDTI/3xuZCEZkx4Kzi9as52+0sKryn+35qSpgMtSlzEBi6a46g9u8A
         4DUA==
X-Gm-Message-State: AOJu0YzyEtNDftEU5H/ASBdIHtogGOwXS/VR319KUHJMDvhuKu5H+RkW
	CR6MlTYsy+fHpVQ6la4xuUYdiS/+Hqy/rLh5Ujx3krvm1nlktEFLMY9NN3IQY/J4ruvTZW79tNp
	T2oNa8MU5TMgyOWjIAUCJg4eh21yiWYH5ombqtvo07veCmdDvhUc86AvyPnziQXfZ
X-Received: by 2002:a17:907:3e1a:b0:a75:23bb:6087 with SMTP id a640c23a62f3a-a7d40095f19mr727768866b.29.1722345274415;
        Tue, 30 Jul 2024 06:14:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxS5TapzSix+IHrQWJZDbrVd/W528pXDUZBoI9CiGvyRs7l08bOoVZ+65FIJHHTSI1zADeuw==
X-Received: by 2002:a17:907:3e1a:b0:a75:23bb:6087 with SMTP id a640c23a62f3a-a7d40095f19mr727766266b.29.1722345273714;
        Tue, 30 Jul 2024 06:14:33 -0700 (PDT)
Received: from redhat.com ([2.55.35.236])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad90fe2sm644884466b.156.2024.07.30.06.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 06:14:33 -0700 (PDT)
Date: Tue, 30 Jul 2024 09:14:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH V8] virtio-transport: Add a section to define mandatory
 transport requirements
Message-ID: <20240730091155-mutt-send-email-mst@kernel.org>
References: <1ef4e58fdbbc2c94305aa8fac856da882da1cdc2.1722324234.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1ef4e58fdbbc2c94305aa8fac856da882da1cdc2.1722324234.git.viresh.kumar@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 30, 2024 at 12:59:26PM +0530, Viresh Kumar wrote:
> The current Virtio documentation lacks a set of generic requirements
> applicable to all transports. Defining these generic requirements could
> be beneficial when integrating support for a new transport.
> 
> This section outlines the essential requirements that any transport
> method must adhere to.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V7->V8:
> - Remove separate sections for device/driver requirements.
> - Remove optional requirements.
> - Other generic improvements.
> 
> V6->V7:
> - Remove parts that talk about accessing content of the virtqueue.
> 
> V5->V6:
> - Move the changes to a new appendix section.
> - Clarify the requirements a bit more based on review comments.
> 
> V4->V5:
> - s/The transport/A transport/
> - s/MUST provide/provides/
> - Added some text for transport requirements.
> 
> V3->V4:
> - Remove the normative sections and use direct speech.
> - Change wording at few places.
> 
> V2->V3:
> - Minor fixes.
> - Added Reviewed by from Alex.
> 
> V1->V2:
> - Lot of changes after discussions with Alex and Cornelia.
> - Almost a rewrite of the first commit.
> - Add Transport normative sections.
> 
>  main.tex         |  2 ++
>  newtransport.tex | 40 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 newtransport.tex
> 
> diff --git a/main.tex b/main.tex
> index b1913d65e964..6d337217a3d1 100644
> --- a/main.tex
> +++ b/main.tex
> @@ -42,6 +42,8 @@
>  
>  \input{newdevice.tex}
>  
> +\input{newtransport.tex}
> +
>  % acknowledgements
>  \input{acknowledgements.tex} 
>  
> diff --git a/newtransport.tex b/newtransport.tex
> new file mode 100644
> index 000000000000..1c424ef907e3
> --- /dev/null
> +++ b/newtransport.tex
> @@ -0,0 +1,40 @@
> +\chapter{Creating New Transports}\label{sec:Creating New Transports}
> +
> +Devices and drivers utilize various transport methods to facilitate
> +communication, such as PCI, MMIO, or Channel I/O. These transport
> +methods determine multiple aspects of the interaction between the device
> +and the driver, including device discovery, capability exchange,
> +interrupt handling, and data transfer. For instance, in a host/guest
> +architecture, the host might expose a device to the guest via a PCI bus,

a virtual PCI bus

> +and the guest would employ a PCI device driver to interface with the
> +device.
> +
> +This section outlines the mandatory requirements that a transport method
> +must implement.

implements.

> +
> +A transport provides a mechanism to implement configuration space for
> +the device.
> +
> +A transport provides a mechanism for the driver to communicate virtqueue
> +configuration and memory location to the device.
> +
> +A transport provides a mechanism for the driver to identify the device
> +type.
> +
> +A transport allows one or more virtqueues to be implemented by the
> +device. The number of virtqueues is device specific and not specified by
> +the transport.
> +
> +A transport provides a mechanism for the device to send device
> +notifications to the driver, such as used buffer notification.
> +
> +A transport provides a mechanism for the driver to send driver
> +notifications to the device, such as available buffer notification.

available buffer notifications (plural)

> +
> +A transport provides a mechanism for the driver to initiate a device reset.
> +
> +A transport provides a mechanism for the driver to read the device's
> +status bit.
> +
> +A transport provides a mechanism for the driver to modify the device's
> +status.

what about feature bits? that is fundamental

Let's order it sensibly though, in the order in which stuff is used

1st identify the device
2 access status

number of vqs

configure vqs

notification

reset

> -- 
> 2.31.1.272.g89b43f80a514

