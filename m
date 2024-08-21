Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E790E15B134
	for <virtio-comment@lists.linux.dev>; Wed, 21 Aug 2024 13:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724247041; cv=none; b=qf9GZIjEfx905/U8Fqkgzr93AkD3q/a2bhWLwBhv1hhir7tjLNYQq/msMCt2TrD/xFkzWxGVazdWZBHgJ3ZK5y6pN0FngROpqmeisYN3LcaYBWpMnybMdcW0t+rM9gqzyj61GZ2Yv2Tji267qBI4qzF9s3LS+1p/avhj2hzxhpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724247041; c=relaxed/simple;
	bh=4iGFORjv002wZ2+SqMMgjM2330/pfCF+Z4Ia4yzqp44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Udd8zwUx1vF6t7qZHN2FHNu+6IExwQPGCc2Q65LQaksLgNLGw9KnprzYBhb/PcYhYR20EFhrO2Bzhl2fhOUooLl0nt+Hhqrg2YyZCDJDCd7POJYD+Sj1TK0/CpDPmY8gfUjEZrPSy7sJypjUAn7YLiAPLqAxcLZXMCqMyr2UNBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i/PdKwUa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i/PdKwUa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724247038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=enKH8cGw+po7iihEyakdBw/+qLWiYB60l1wPgbGmCTc=;
	b=i/PdKwUa7En+CxwnZXY9Yh3StRU/0x7kfVG6Ab/j/G1KeWMFl9zT2cfTKYVeLfPyxkY93s
	ziyRTGNzI3memdfyji5BdFP9p0Vc+/EDrMMRhcbN0/LXdEeJ4NU7J4ojgfcHKJIr1ufJ5J
	iEWTLArz33Fcbo3hL2rZH2jihvECLoU=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-Vg9_ruWROIuKWLAvkSuv1w-1; Wed, 21 Aug 2024 09:30:37 -0400
X-MC-Unique: Vg9_ruWROIuKWLAvkSuv1w-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-70941ab4a01so6700267a34.1
        for <virtio-comment@lists.linux.dev>; Wed, 21 Aug 2024 06:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724247036; x=1724851836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enKH8cGw+po7iihEyakdBw/+qLWiYB60l1wPgbGmCTc=;
        b=cuZIN8lKtGWLhQR/w21yBS9m4+xWuuk54pqSwbzHgwl4um0Jxssax92BGR4er/YX2C
         h7sWy22+oSOH7kW7slQIQZmZ8QVU73c55y3SmN03Y3ONCvN/4WyKIbBjldaAgRGcBKeD
         z2KbDJ3IUlGqdmBdhuQXk0/xDNV9WBTbSs1pZlvT4j59WuMdjKkKSSnMw6l7AqG4GjgD
         ySTr1fDCHcrbb9RMhfOMFveMcNYFX/CeT/Szl3eqL1CN8aN3OdJ+YZQv+zZd5ola1smE
         /eSyYE7bYqK8twVTfED6WEgcQ7rgfOf4IEVYTqpVJplvsLqx+XKo5IXjAcpiwlONIx9B
         TfCQ==
X-Gm-Message-State: AOJu0Yzl1LkNhi307EZvACsZSwBR/Cp346UveGRWJpWv/zZ7X+vsuKaz
	CwvCP/QfNQf4SVBf/La6YOR75/hizzyqGEedzvC+M6/oKZgqOJBFMd3tM0U7Ufx5BCwSNSrHehw
	HSqD6KF6hcM7o+Y/XerIN344HnwKUGxan6uHPZcpRdcmO+0y0KYf/kqmdsGBR9xei
X-Received: by 2002:a05:6358:75a8:b0:1b3:9b14:9c94 with SMTP id e5c5f4694b2df-1b59f9690a2mr295047255d.3.1724247035915;
        Wed, 21 Aug 2024 06:30:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlkzl2hgdPIn7Z0LLDvHUaJ9ZrPyqdPdhR5TipA86AkoSgMmjwsyU327aWa6YaJXv3P4V+XQ==
X-Received: by 2002:a05:6358:75a8:b0:1b3:9b14:9c94 with SMTP id e5c5f4694b2df-1b59f9690a2mr295044155d.3.1724247035537;
        Wed, 21 Aug 2024 06:30:35 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff055dfesm620216085a.48.2024.08.21.06.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 06:30:35 -0700 (PDT)
Date: Wed, 21 Aug 2024 15:30:31 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V10] virtio-transport: Add a section to define mandatory
 transport requirements
Message-ID: <ZsXr9/VTQFqOTjr2@fedora>
References: <4c24ede14e2545b2e9c69e7d9b79dc15744fd965.1723647318.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <4c24ede14e2545b2e9c69e7d9b79dc15744fd965.1723647318.git.viresh.kumar@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 14, 2024 at 08:27:00PM +0530, Viresh Kumar wrote:
> The current Virtio documentation lacks a set of generic requirements
> applicable to all transports. Defining these generic requirements could
> be beneficial when integrating support for a new transport.
> 
> This section outlines the essential requirements that any transport
> method must adhere to.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V9->V10:
> - s/multiple// and s/employ/use/
> 
> V8->V9:
> - Change order of the statements.
> - Specify DEVICE_NEEDS_RESET and FEATURES_OK bits.
> - Language improvements.
> 
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
>  newtransport.tex | 43 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
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
> index 000000000000..b3e0df42fa2d
> --- /dev/null
> +++ b/newtransport.tex
> @@ -0,0 +1,43 @@
> +\chapter{Creating New Transports}\label{sec:Creating New Transports}
> +
> +Devices and drivers utilize various transport methods to facilitate
> +communication, such as PCI, MMIO, or Channel I/O. These transport
> +methods determine aspects of the interaction between the device and the
> +driver, including device discovery, capability exchange, interrupt
> +handling, and data transfer. For instance, in a host/guest architecture,
> +the host might expose a device to the guest via a virtual PCI bus, and
> +the guest would use a PCI device driver to interface with the device.
> +
> +This section outlines the mandatory requirements that a transport method
> +implements.
> +
> +A transport provides a mechanism to implement configuration space for
> +the device.
> +
> +A transport provides a mechanism for the driver to identify the device
> +type.
> +
> +A transport provides a mechanism for the driver to read the device's
> +FEATURES_OK and DEVICE_NEEDS_RESET status bits.
> +
> +A transport provides a mechanism for the driver to modify the device's
> +status.
> +
> +A transport provides a mechanism for the driver to read and modify the
> +device's feature bits.
> +
> +A transport allows one or more virtqueues to be implemented by the
> +device. The number of virtqueues is device specific and not specified by
> +the transport.
> +
> +A transport provides a mechanism for the driver to communicate virtqueue
> +configuration and memory location to the device.
> +
> +A transport provides a mechanism for the device to send device
> +notifications to the driver, such as used buffer notifications.
> +
> +A transport provides a mechanism for the driver to send driver
> +notifications to the device, such as available buffer notifications.
> +
> +A transport provides a mechanism for the driver to initiate a device
> +reset.


LGTM!

Matias

