Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9CF15F410
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 11:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720696245; cv=none; b=CZJjD4CCTbwlnPdqMYp1347jxAOE51gKBYVMj39VN/Lq7ZcM3GG9aLmjtN4jORqo8dhx5HB7v/Z9zYFFhM2KDuQ5yNoeTKRTGBUq1xUWgXaS3EGE8ZEPh6T+mudVtyNxAPzhnNPjFOROioI9Et9JnKyE3zxILBkaMCa7LFDEBtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720696245; c=relaxed/simple;
	bh=Xnki/fEVan1fe6sCp7lt+R92xURCgYSU3YdJ88/2PuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=XQACzos1eTCjlYLyWn+M2JWIcYJcEU5qlGvZG+eIF5k4Ca7uQJh3fclT999bR6mHAWqqFejkCRthqoin1wCc9hXsjKXxY1dmNEpro61s9nlmIDKw0iV5cRuzqMiVFwAIXiva4Lzpgb698VpWMJrrbMWmCtrrmC4/VMvp22yPEXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CdJRV0j9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CdJRV0j9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720696242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rEosFQCI0G2AYrT1ax3eBr5UGWEfcMUZz5hI4tfLW0s=;
	b=CdJRV0j9R8xDYrb4rFrUL1QUzINm0OCCKypNiTxEBBHG3n0oKM0hjlAwbXEDOJ5NNFihkR
	cVUHGPty+j/KSP7EygDPMq695PUjPeFKocXLWjlX9eOg59SZTj6pqAwxP9PuCpb2eRokQM
	lh/ltuLd269RhcCORqWhv4QsgIjOyKc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-R6Ft69ZOOZyHDpHvIksksA-1; Thu, 11 Jul 2024 07:10:39 -0400
X-MC-Unique: R6Ft69ZOOZyHDpHvIksksA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42667cc80e8so4780655e9.2
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 04:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696238; x=1721301038;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rEosFQCI0G2AYrT1ax3eBr5UGWEfcMUZz5hI4tfLW0s=;
        b=mXHs4gCkNfS8rQ/ux8DXws1zg1KLFXDHIRF1PE6+kFIUrze26fCCKXojg8rvxeipTO
         3K0yp5ji2XsfTb6kdB+BfAS+uqGwnOXNSoZIEtXjl5SvxTUZw/j8Otm7jfbQ6pPB6ThP
         FBscb/K+4puI/l9U+g8WpLAqegBYx8T/n8/Bg9Ec9SVUtrZTvLmmp84UR6NMlgO/rWwF
         qDKqGrLR8EYEwWHC1dYRJfxRno4Fb46VRG1FZYfCVZah293x7BhH3OA7C4zhf3B/Vzyj
         gOwS1G764vEMxJdxWUKx9rGmooGPNAhZAAqICm6e2UAasNOkpXaJrvFpLkZc8zOLDXEH
         /EUw==
X-Gm-Message-State: AOJu0YyADkdep/nB4SU8Dl3QUyfR7SbVjxmb3b5LnTwAeuVfI/RBmmo+
	78htzrPez1eVfddFYG3FxJR8az5YlZ1SJIhnWZ4EFufNVn7Dds4tgtd/qKmMogjv5xSR2MSU62i
	mqxgbWnJlnxn5nX5wegmcncxdo62WKaPmKC5fePx40r6+8L29wtWhcAX7tenDftYl
X-Received: by 2002:a05:600c:5345:b0:426:602d:a243 with SMTP id 5b1f17b1804b1-426707d8a90mr57684175e9.16.1720696238012;
        Thu, 11 Jul 2024 04:10:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvS9oFQNXhCnQ9Ms3AVU7kUP1Kmz7kwblRMRDCf7HZzHFh0LT0+D1e8SxvHj/MT9tzPlvuHg==
X-Received: by 2002:a05:600c:5345:b0:426:602d:a243 with SMTP id 5b1f17b1804b1-426707d8a90mr57683965e9.16.1720696237435;
        Thu, 11 Jul 2024 04:10:37 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:341:761e:f82:fc9a:623b:3fd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f22acsm283288475e9.24.2024.07.11.04.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:10:36 -0700 (PDT)
Date: Thu, 11 Jul 2024 07:10:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <20240711070740-mutt-send-email-mst@kernel.org>
References: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jul 11, 2024 at 01:18:18PM +0530, Viresh Kumar wrote:
> The virtio documentation currently doesn't define any generic
> requirements that are applicable to all transports. They can be useful
> while adding support for a new transport.
> 
> This commit tries to define the same under a new Appendix section.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

I am not sure what is this supposed doing - just listing basic things
transport does or all things it can do?

If the later, this ignores several things that transports can do,
such as shared memory, data in notification, etc.






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
>  newtransport.tex | 72 ++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
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
> index 000000000000..2abd76e5b037
> --- /dev/null
> +++ b/newtransport.tex
> @@ -0,0 +1,72 @@
> +\chapter{Creating New Transports}\label{sec:Creating New Transports}
> +
> +Devices and drivers can use different transport methods to enable
> +interaction, for example PCI, MMIO, or Channel I/O. The transport
> +methods define various aspects of the communication between the device
> +and the driver, like device discovery, exchanging capabilities,
> +interrupt handling, data transfer, etc. For example, in a host/guest
> +architecture, the host might expose a device to the guest on a PCI bus,
> +and the guest will use a PCI-specific driver to interact with it.
> +
> +There are some mechanisms that any transport is required to implement,
> +and some requirements that devices and drivers are required to follow.
> +
> +\section{Transport Requirements}\label{sec:Creating New Transports / Transport Requirements}
> +
> +A transport provides a mechanism for the driver to discover the device.
> +
> +A transport provides a mechanism for the driver to identify the device
> +type.
> +
> +A transport provides a mechanism for communicating virtqueue
> +configurations between the device and the driver.
> +
> +A transport allows multiple virtqueues per device. The number of
> +virtqueues for a pair of device-driver are governed by the individual
> +device protocol.
> +
> +A transport provides a mechanism that the device and the driver use to
> +access memory for implementing virtqueues.
> +
> +A transport provides a mechanism for the device to notify the driver and
> +a mechanism for the driver to notify the device, for example regarding
> +availability of a buffer on the virtqueue.
> +
> +A transport provides a mechanism for the driver to initiate a reset of
> +the device.
> +
> +A transport provides a mechanism to reset an individual virtqueue.
> +
> +A transport provides a mechanism for the driver to read the device
> +status. A transport provides a mechanism for the driver to change the
> +device status.
> +
> +A transport provides a mechanism to implement configuration space
> +between the device and the driver.
> +
> +\section{Device Requirements}\label{sec:Creating New Transports / Device Requirements}
> +
> +The device keeps any data associated with a device-initiated transaction
> +accessible to the driver until the driver acknowledges the transaction
> +to be complete.
> +
> +The device resets itself if requested by the driver, in a transport
> +defined way, if the transport provides such a method.
> +
> +The device resets an individual virtqueue if requested by the driver,
> +in a transport defined way, if the transport provides such a method.
> +
> +\section{Driver Requirements}\label{sec:Creating New Transports / Driver Requirements}
> +
> +The driver acknowledges device notifications, as mandated by the
> +transport.
> +
> +The driver accesses queued buffers after the device has processed them
> +and notified the driver of their availability. This mechanism is
> +transport defined.
> +
> +The driver asks the device to reset itself if, for example, the driver
> +times out waiting for a notification from the device for a previously
> +queued request.
> +
> +The driver asks the device to reset an individual virtqueue.
> -- 
> 2.31.1.272.g89b43f80a514

