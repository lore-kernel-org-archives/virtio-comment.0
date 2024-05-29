Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5AF53802
	for <virtio-comment@lists.linux.dev>; Wed, 29 May 2024 11:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716981168; cv=none; b=lYywss7DMaB2naIowsDZGvjzXWH2CMGrmonrOciJMOGAt5LUDfvC/3ZY4LjTqiGEQLjovZs+OpIfUIJb3sPWCs1JheQ0VCBTAQuiLVDu7yzRgAnufDh/HCuhTg9S1DCkKX/P73FYsd5pdI19JeY3kCRFO5L7R6J7Gs+AudAXR7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716981168; c=relaxed/simple;
	bh=DGNj/bfdI1OmlYDcJnbRFJNWUPcFQKVKa/Y2ZUZRABc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FlHwdCg+ezEqyszQTWhbyVgWIn0WvfJk7fopR/5/6Pj0i6P7vrNjzewyN9/RZAt3uPhkZGksgMz28m8W2tp6yV//x7mCMQMf3YrIjPkuOOUM7pKJqlh/Uy30HE49Wm6XFNYBRrDs+DVpvArV2Ix8N32QucYUls4uLUwcGPZULQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pt5ImbM4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pt5ImbM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716981165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rint3JVLpW6kOzOCZE0RPtLHqqSbajY1oxRWDU/n10s=;
	b=Pt5ImbM4MHWbuLafQKapC6IUJ/Jfc1s6ezBtVyP5Wb1ZbudisSgHNSGnjSPS6/hMx8vmfd
	c+8adSsAcYFqwyVMWCg/vv4XIEaMll8BJIjkIpBUS6YU2aOFP6Z73MBGm4uI0ADBAkzoMu
	RoxZ0wlEtRYaah4+xristMATtb2nO6w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-lsrWK0cFMtGSAc4ihXnzJQ-1; Wed, 29 May 2024 07:12:44 -0400
X-MC-Unique: lsrWK0cFMtGSAc4ihXnzJQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-354f28306dfso1681626f8f.0
        for <virtio-comment@lists.linux.dev>; Wed, 29 May 2024 04:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716981163; x=1717585963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rint3JVLpW6kOzOCZE0RPtLHqqSbajY1oxRWDU/n10s=;
        b=OjkgZPmnSnJ7bNcLwtaJOE/ULZbFn6x9uedSKDyAlWGonRQeXAeOnPYohUBjQvnxS5
         Er4zSiGE9+OOl+1Cgz49KjlPYNZcb/luUOP1VchdMWIskm/Wg3OL9tgmLjEP9pyuAykW
         qvReV50fEhtwWjpTJvChwQ9kuaFMuwCMyrY3tHmY1D6Tunxj7IUgQ5M0w452OUJLaMYK
         rKjJX0jW7MQcfwyJhep+awDqNkTNt/tvzU1i9NCA56eGQbwHYquCrbNnDkUH3swW22+c
         CsTyi/SkBl5mAnAI34Oub6ZKZ3MulBlTbR4uGmH8G+SE8/PfJ1TM7772pKq+5By52yve
         AwXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYyl+zYqlhESuinsJ/JLKr/guvHBo4KVOvDD85PTiOYehe5mz5EjrtpdPlE3ENtOGsDMCVH/wix11RUMhNvNNXb6LRwnPN4xemIQQ4Abg=
X-Gm-Message-State: AOJu0YxotUAWxqbg6QCKCfuVD8HuOVRJK01kqkgnWeNv4bUua05gh/+O
	cAw7ja7V2C55R9oPLw/CJCshyTSIAYoIRm+2/DFcb4SGWVINkmfM+QigHywrMZyCPZcf0xlJTWc
	eBczOywYjI+Bx6pOBpolsxd/yA9Acyfs08AKB+teUU/ZF+4qDME0e7PUkT6MelZPI
X-Received: by 2002:a5d:5849:0:b0:356:71d0:3028 with SMTP id ffacd0b85a97d-35671d0323cmr11430594f8f.67.1716981162993;
        Wed, 29 May 2024 04:12:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4aiuVVs/CQFayQmGhcDYuDbwPmE6mJgtsTcahPFApz73dYBka0S7XMeun5PQcmjmY2yY1xA==
X-Received: by 2002:a5d:5849:0:b0:356:71d0:3028 with SMTP id ffacd0b85a97d-35671d0323cmr11430568f8f.67.1716981162494;
        Wed, 29 May 2024 04:12:42 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557dcf0871sm14857213f8f.110.2024.05.29.04.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 04:12:42 -0700 (PDT)
Date: Wed, 29 May 2024 13:12:40 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH V3 Resend] virtio-transport: Clarify requirements
Message-ID: <ZlcNqO1ZxmGuUhVO@fedora>
References: <3543c631e29d35a667ca9d9e912d1a6db1feb0ce.1716197180.git.viresh.kumar@linaro.org>
 <20240520092332-mutt-send-email-mst@kernel.org>
 <20240521105706.tbyigihommrasdua@vireshk-i7>
 <20240521073925-mutt-send-email-mst@kernel.org>
 <20240529102424.s7rnq7zqqjy6bfdw@vireshk-i7>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240529102424.s7rnq7zqqjy6bfdw@vireshk-i7>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello, 

I added very minor comments. 

On Wed, May 29, 2024 at 03:54:24PM +0530, Viresh Kumar wrote:
> On 21-05-24, 07:40, Michael S. Tsirkin wrote:
> > I feel a non-normative section is enough for this.
> > Just convert should/must to direct speech.
> 
> Like this ?
> 
> diff --git a/content.tex b/content.tex
> index 0a62dce5f65f..8af005398877 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -631,8 +631,84 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
>  
>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>  
> -Virtio can use various different buses, thus the standard is split
> -into virtio general and bus-specific sections.
> +Devices and drivers can use different transport methods to enable
> +interaction, for example PCI, MMIO, or Channel I/O. The transport
> +methods define various aspects of the communication between the device
> +and the driver, like device discovery, exchanging capabilities,
> +interrupt handling, data transfer, etc. For example, in a host/guest
> +architecture, the host might expose a device to the guest on a PCI bus,
> +and the guest will use a PCI-specific driver to interact with it.
> +
> +The standard contains sections describing the transport-agnostic parts
> +of virtio, and sections describing how individual transports implement
> +virtio.
> +
> +\section{Virtio Transport Requirements}\label{sec:Virtio Transport Options / Virtio Transport Requirements}
> +
> +\subsection{Transport Requirements}\label{sec:Virtio Transport Options / Virtio Transport Requirements / Transport Requirements}
> +
> +The transport provides a mechanism for the driver to discover the
> +device.
> +
> +The transport provides a mechanism for the driver to identify the device
> +type.
> +
> +The transport provides a mechanism for communicating virtqueue
> +configurations between the device and the driver.
> +
> +The transport allows multiple virtqueues per device. The number of
> +virtqueues for a pair of device-driver are governed by the individual
> +device protocol.
> +
> +The transport provides a mechanism that the device and the driver use to
> +access memory for implementing virtqueues.
> +
> +The transport provides a mechanism for the device to notify the driver
> +and a mechanism for the driver to notify the device, for example
> +regarding availability of a buffer on the virtqueue.
> +
> +The transport may provide a mechanism for the driver to initiate a reset
> +of the virtqueues and device.
> +
> +The transport provides a mechanism for the driver to read the device
> +status. The transport MUST provide a mechanism for the driver to change
> +the device status.
> +
> +The transport provides a mechanism to implement configuration space
> +between the device and the driver.
> +
> +\subsection{Device Requirements}\label{sec:Virtio Transport Options / Virtio Transport Requirements / Device Requirements}
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
> +The device resets the virtqueues if requested by the driver, in a
> +transport defined way, if the transport provides such a method.
> +
> +\subsection{Driver Requirements}\label{sec:Virtio Transport Options / Virtio Transport Requirements / Driver Requirements}
> +
> +The driver acknowledges device notifications, as mandated by the
> +transport.
> +
> +The driver doesn't access virtqueue contents before the device notifies
> +about the readiness of the same.
> +
> +The driver doesn't access buffers, after it has added them to the
> +virtqueue and notified the device about their availability. The driver
> +MAY access them after the device has processed them and notified the
> +driver of their availability, in a transport defined way.
> +

I think last sentence could be rewritten as:
- The driver accesses queued buffers after the device has processed them
  and notified the driver of their availability. This mechanism is
  transport defined.


> +The driver may ask the device to reset the virtqueues if, for example,
> +the driver times out waiting for a notification from the device for a
> +previously queued request.
>  

I would rewrite last sentence as:
- The driver asks the device to reset the virtqueues if, for example,
  the driver times out waiting for a notification from the device for a
  previously queued request.


With that, LGTM!

Matias

