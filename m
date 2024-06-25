Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B3816D33B
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 14:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719327120; cv=none; b=XH8VOtSaioQeQgPYsblTgW9BoZoIUsxnNUA0BZQDX+4yvQ2ytoskZbhEYJVBrUPP1AiNkeYxeErUOXwmBKki83RjFbSDkVmbJ7Np6o6AbzR5LuUE7upaZYwyF1b7HENAG3I2MP9XQdAUOSq0+qRvD0Dm5ALdlMBDMhI3XBDKiQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719327120; c=relaxed/simple;
	bh=crChbcw3c4i5sZvdKNrVvRrpfjfk3SPCozFv+2ZGsik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Vz4bWgMCSnpFa2jz9YP2IoRUh4tiATIUvLw6b19aj9/Nzy250oC9GHYz/zDPtO0dTR/+S6/iI9LkG15mox0HX+ZTIattoV4jSswVRVZHdy6UL2WVfeNaJUQyq73xHjTRtEpGOSHi6cExXOqOr3XYNSWY0QxJ1FrRdgEawkN+B34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f1rKt4V2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f1rKt4V2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719327118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tabu8PUDZqTmGSfCozgHlo48R7IFn5cQpgAo/bHhisk=;
	b=f1rKt4V2lmYsJMS2b/Dy8VOJNiVg4UZBWqrOn6MnOAOikf8xZulCJuVN7old/uFAR8JsUj
	NuOChxTJkdkulKDYjmkZHojtS6NIqLFEFa9iIXbGY19KIT4r0OXgtpOMAIB03Dn32mfUlD
	V15ZF/7DIZ6Po5SwidXp8JeWLLcL7hk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-IKHM5NWvO1mJ3uTZ7YOvNA-1; Tue, 25 Jun 2024 10:51:56 -0400
X-MC-Unique: IKHM5NWvO1mJ3uTZ7YOvNA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6b077178ca4so96354946d6.0
        for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 07:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719327116; x=1719931916;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tabu8PUDZqTmGSfCozgHlo48R7IFn5cQpgAo/bHhisk=;
        b=T4wafHLM1qliAc1FLCiSS2hcVYZzbQp/Pl1K8vTNjlSSUrrWas62wRxH9xZMbxspMy
         q686YNASz1sWQkT8NOjKCfK8F6EBMcRBKLKamUZvbgni0Beu/g1Cuyg73YcXpwkdJ01b
         IRLMogJOulrglEEE+fMrgkSRKeXXbfULmDd/YIOJUCYk60Skf7lSjEKeaMIwstz6Q213
         Cc/bRClgGtKcEY9aLL1jYWRTTqZ5Whgh8x0nLyQTA5cttelQmTmH8JnmEBTJUl8B4/BX
         Ppc2Hm9Ox0Y/OOa/ynQrYzn39RF6+8ZY4uK8t44Z7WDl/5wc20ARNia9JW6UiVh4zSXC
         dMpw==
X-Gm-Message-State: AOJu0YwNXLOauliiRCdumuCqsFbV5KoH58RAV7r0ItnWmNVtYUNmRq+c
	i7d7Ze22BDzHSvwJTXrSrs87fAObCTYaizyv6ro8y/V9rrJCwljLUDhxpmrOFL4RRvIBDRkcLP9
	mAR9e2QOocRfqwLgzbYvrYaw4EygmFYTLB992OlFnfPz/sMf49VAjtRCopvQwhiqt
X-Received: by 2002:a0c:cc0f:0:b0:6b0:6400:3b6f with SMTP id 6a1803df08f44-6b5409987c8mr84560846d6.8.1719327116114;
        Tue, 25 Jun 2024 07:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFESKwTMyAIiby3n1ugZPmu7bMHfMRmY7bFdlyAKDOcaWgFEFvqSlMiEYEIJ3FetUB4dpCIGw==
X-Received: by 2002:a0c:cc0f:0:b0:6b0:6400:3b6f with SMTP id 6a1803df08f44-6b5409987c8mr84560546d6.8.1719327115605;
        Tue, 25 Jun 2024 07:51:55 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b5223fa509sm42710826d6.51.2024.06.25.07.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:51:55 -0700 (PDT)
Date: Tue, 25 Jun 2024 16:51:51 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH V6] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <ZnrZh5lfnFNMn5bM@fedora>
References: <51a926b4ea2240753bcda6041a9076d58e980082.1719299462.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <51a926b4ea2240753bcda6041a9076d58e980082.1719299462.git.viresh.kumar@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jun 25, 2024 at 12:43:34PM +0530, Viresh Kumar wrote:
> The virtio documentation currently doesn't define any generic
> requirements that are applicable to all transports. They can be useful
> while adding support for a new transport.
> 
> This commit tries to define the same under a new appendix section.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
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
>  newtransport.tex | 82 ++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 84 insertions(+)
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
> index 000000000000..05996c814f09
> --- /dev/null
> +++ b/newtransport.tex
> @@ -0,0 +1,82 @@
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
> +The device doesn't access the contents of a virtqueue before the driver
> +notifies, in a transport defined way, the device that the virtqueue is
> +ready to be accessed.
> +
> +The device doesn't access or modify buffers on a virtqueue after it has
> +notified the driver about their availability.
> +

Why are the last two requirements in this section? Are not these
requirements independent of the transport layer?

Thanks, Matias.

