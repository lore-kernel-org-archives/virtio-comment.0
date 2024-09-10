Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB3D17A584
	for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 18:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725993128; cv=none; b=NUoxHWBeH1lEHrqW32ksop0qNr6a6cwsqCZybDY69RQul211T5bQQklzCarhASsVHmzi3DJxCVZvS3x26pxGIcUgyfHfc2tZ1QgrGZpmxeHRxicEn9QvOza47td0wV5flT0mkseuNZIYlve0o72ixIvERml2chom4oE8+KwZWeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725993128; c=relaxed/simple;
	bh=9/03spAAAl1Vc2JlOJBdRZ9qePmJfolBxEW6Bj9T+XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=N0cV7HE6qgqv83NVyk6ruGwIAyK8vU4ESwvSvwttJDaGraUDsn4/uhSM//DlEZL4sMJACFpVYmHNU7SKZ4jhBhQ8wZ6F6+Kumb5Zsr7kgZuupXHk+KRYJEaj2vyFauRLVKn0peTB+uz2WWGrlz+vYH8ewiCbenNGELPAkJrGHcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TCYypaiK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TCYypaiK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725993125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L6R/SUtuv4Ao+ZIboIp55AvWaSXDx8pTbJzJQyhlPl4=;
	b=TCYypaiKugCG9inZRpQJoFFkVRPJ42XYuDGi1VMQ3MPTPuc9c/JeE9JyCQDW2R+vXa/SNN
	UbU7tJVpNOSnmprGrgCJmhko9cHRehtg3cgq1UOblAS98iTNN6I5/cJAX5nD7qBHDg8KpY
	MYhmIGxEoUeWVkJ4ZhSmfIgqE1TbauU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-FbSyXw_yOUyZFTMNH89UAA-1; Tue, 10 Sep 2024 14:32:04 -0400
X-MC-Unique: FbSyXw_yOUyZFTMNH89UAA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42cb5b01c20so20756985e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 11:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725993121; x=1726597921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6R/SUtuv4Ao+ZIboIp55AvWaSXDx8pTbJzJQyhlPl4=;
        b=k8wqpe/dIYBwcAAFBaMJ2e/P67rOjp8ZFDXrP+o0DGBC8AfZF4dJ77CN5KYZvyIilw
         we8SbB8YxSSP+aTFcZQfrfw6ABAdXfuRKLalucxzHElRl5gahREyotENyZwlTaovQZZy
         z5j3bEw1OQL18rSzNTCEcUaIGcuxRAEAP4x4b8tPele6tvPQ/mz+K3KW1i5kq3HyZorP
         VWssboqEZUZAeQDjOMOTHPFKpIeh37biPq3Pxau5S5RONPmOGT34rpP838IgOsuI9zdr
         QISx9OuaZVVt2B1qvUkVeAwZJv6U7WPVruYSrfOF+1NJ7J2svcQ+pigYwzkKlI8M65L8
         w4sA==
X-Gm-Message-State: AOJu0YwzWAt7Dp46SrHck/oEgaoQf/KVHnxAmcdp0qDa86W1WOqWJTi9
	kMS9y9NC1a54rakYQ1WP385krgUO2emWhjhU/3OslRGu4j2L2EDMVaHmaM7LigRVMItDS4LXhg9
	BA8DQ/Zw6NZB0jTtA0mY7pv6FCYicpJCoHKVmbZDkyOVLtbVhXzes+++W/dVo6Nas
X-Received: by 2002:a05:600c:4f41:b0:42c:bb75:4f86 with SMTP id 5b1f17b1804b1-42cbb754f8emr44003605e9.32.1725993121045;
        Tue, 10 Sep 2024 11:32:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCBXlIKJP1a8y12/LhUZsMSwjLLROgA9Qwv+dQH5h+UGtonWUtlTlRp8l+deZvX4gm0uIc4g==
X-Received: by 2002:a05:600c:4f41:b0:42c:bb75:4f86 with SMTP id 5b1f17b1804b1-42cbb754f8emr44003385e9.32.1725993120311;
        Tue, 10 Sep 2024 11:32:00 -0700 (PDT)
Received: from redhat.com ([31.187.78.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb218d7sm121454325e9.9.2024.09.10.11.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 11:31:59 -0700 (PDT)
Date: Tue, 10 Sep 2024 14:31:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com, shahafs@nvidia.com
Subject: Re: [PATCH] admin: Enable driver to send admin commands before
 DRIVER_OK
Message-ID: <20240910142850-mutt-send-email-mst@kernel.org>
References: <20240910170723.44537-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240910170723.44537-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 10, 2024 at 08:07:23PM +0300, Parav Pandit wrote:
> Currently the driver can operate administration commands using
> administration virtqueues. Administration virtqueues must be
> enabled before it reached DRIVER_OK stage similar to all other
> queues. This is a limiting factor.
> 
> Many of the device functionalties needs to be discovered and
> configured early enough before the driver reaches the
> DRIVER_OK stage. Some examples are:
> 
> a. driver wants to dynamically create the virtqueues of virtio-net
>    device with more parameters, for example header data split,
>    multiple physical addresses.
>    Here, the driver needs to tell PCI device early enough that it no
>    longer uses queue_* registers for non admin queues.
> 
> b. driver wants to discover these features and related attributes
>    early enough so it has chance to decide to proceed via admin
>    cmd interface or proceed to DRIVER_OK and follow the current flow.
> 
> To overcome these limitations, introduce a feature bit that enables
> the driver to send capabilities related admin commands before DRIVER_OK
> via the available interface such as administration virtqueue.
> 
> Signed-off-by: Parav Pandit <parav@nvidia.com>


We were there in 1.0 and it's messy. And next thing you do, you will
want it before features ok, and we will keep piling up hacks.  I think
that if we want to do admin commands before VQs are active, we should
just add a capability with registers for that. People wanted that
anyway.





> ---
>  admin.tex         | 16 ++++++++++++++++
>  content.tex       | 13 ++++++++++++-
>  transport-pci.tex |  6 ++++++
>  3 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/admin.tex b/admin.tex
> index 39fc072..95054ed 100644
> --- a/admin.tex
> +++ b/admin.tex
> @@ -334,6 +334,11 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
>  supporting multiple group types, the list of supported commands
>  might differ between different group types.
>  
> +When the driver has negotiated the feature VIRTIO_F_EARLY_CAP_ADMIN_CMD, the
> +driver can use administration commands VIRTIO_ADMIN_CMD_LIST_QUERY,
> +VIRTIO_ADMIN_CMD_LIST_USE and commands related to device and driver capabilities
> +listed in \ref[sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities]{device and driver capabilities} for the self-group type before the driver indicates DRIVER_OK status to the device.
> +
>  \input{admin-cmds-legacy-interface.tex}
>  \input{admin-cmds-capabilities.tex}
>  \input{admin-cmds-resource-objects.tex}
> @@ -608,6 +613,14 @@ \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
>  or VIRTIO_ADMIN_STATUS_ENOMEM, then the command MUST NOT
>  have any side effects, making it safe to retry.
>  
> +If VIRTIO_F_EARLY_CAP_ADMIN_CMD feature is negotiated, the device MUST process
> +administration commands related to device and driver capabilities before the
> +driver indicates DRIVER_OK to the device.
> +
> +If VIRTIO_F_ADMIN_VQ and VIRTIO_F_EARLY_CAP_ADMIN_CMD features are negotiated,
> +the device MUST be able to generate notifications related to the administration
> +virtqueue before the driver indicates DRIVER_OK to the device.
> +
>  \drivernormative{\subsection}{Group administration commands}{Basic Facilities of a Virtio Device / Administration virtqueues}
>  
>  The driver MAY supply device-readable or device-writeable parts
> @@ -641,3 +654,6 @@ \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
>  
>  The driver SHOULD retry a command that completed with
>  \field{status} VIRTIO_ADMIN_STATUS_EAGAIN.
> +
> +When the VIRTIO_F_EARLY_ADMIN_CMD feature is negotiated, the driver MAY send commands
> +only to the first administration queue defined by the specific transport.
> diff --git a/content.tex b/content.tex
> index c32c218..12f9224 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -540,6 +540,8 @@ \section{Device Initialization}\label{sec:General Initialization And Device Oper
>     device, optional per-bus setup, reading and possibly writing the
>     device's virtio configuration space, and population of virtqueues.
>  
> +\item\label{itm:General Initialization And Device Operation / Device Initialization / Capabilities Access} Optionally get device capabilities and set driver capabilities if VIRTIO_F_EARLY_CAP_ADMIN_CMD is negotiated.
> +
>  \item\label{itm:General Initialization And Device Operation / Device Initialization / Set DRIVER-OK} Set the DRIVER_OK status bit.  At this point the device is
>     ``live''.
>  \end{enumerate}
> @@ -550,7 +552,9 @@ \section{Device Initialization}\label{sec:General Initialization And Device Oper
>  driver MUST NOT continue initialization in that case.
>  
>  The driver MUST NOT send any buffer available notifications to
> -the device before setting DRIVER_OK.
> +the device before setting DRIVER_OK; however, the driver MAY send
> +buffer available notifications before setting DRIVER_OK if
> +VIRTIO_F_EARLY_CAP_ADMIN_CMD is negotiated.
>  
>  \subsection{Legacy Interface: Device Initialization}\label{sec:General Initialization And Device Operation / Device Initialization / Legacy Interface: Device Initialization}
>  Legacy devices did not support the FEATURES_OK status bit, and thus did
> @@ -879,6 +883,13 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
>  	handling features reserved for future use.
>  
> +  \item[VIRTIO_F_EARLY_CAP_ADMIN_CMD(42)] This feature indicates that the device
> +   exposes an administration command interface which is accessible to the driver
> +   before the driver indicates DRIVER_OK device status. When this feature is
> +   negotiated, once the the administration commands interface is configured, it can be
> +   used by the driver to issue administration commands related to device and driver
> +   capabilities.
> +
>  \end{description}
>  
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> diff --git a/transport-pci.tex b/transport-pci.tex
> index 95b08b8..a612b34 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -495,6 +495,12 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>  to ensure that indices of valid admin queues fit into
>  a 16 bit range beyond all other virtqueues.
>  
> +If VIRTIO_F_ADMIN_VQ and VIRTIO_F_EARLY_ADMIN_CMD has been negotiated,
> +the device MUST support administration commands through the
> +administration virtqueue identified by the \field{admin_queue_index}
> +after the administration virtqueue is enabled and
> +before the driver sets DRIVER_OK to the \field{device_status}.
> +
>  \drivernormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
>  
>  The driver MUST NOT write to \field{device_feature}, \field{num_queues},
> -- 
> 2.34.1

