Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663B31741E8
	for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 20:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726000547; cv=none; b=J0qPuP8uIe2KawNIXYcuZsWzqwosUfGtRnGuYy4iHeODQWAxGf7hlyaUQcLhMswhac0JostjDvJjS/xqfa9TYPIzPRIImIDHy8Q9CUwyiXQmfBT6921WkMO+BHIdzdTZj42BL5EwgapB21UDVADVP7ppd88vt+t18TkYaav06t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726000547; c=relaxed/simple;
	bh=h3Fwpg3sUpSTfFmZ4LjAcx8uUAEL5EjZ74xbvbqIY6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=IFoAU/KqjeJFA8+hhhDDyWt9WujWliSrdZEDwZhEF737iOvYSOB9QppwQtj17sNlclehQsKw0u/Q2jzuVOdCum3/ymdJbxC5MljR39c+7XUhkimfWxYOiR8VsGLiK3zx0sLyNX4o8UUEvSRYW4LZW4jDH8zwI+Fq7+9ruq60j7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PpDqCLNB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PpDqCLNB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726000544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KhBCoXAN8RAZa3Liliv85vUYAqb0aLLkuMss9rbU2N4=;
	b=PpDqCLNBvZT8sXo7J/BTVu5pAn42Bixv2kQ4z0OsN83lm5AJZH3tMrdujQxrZ0CR84wyE9
	w98pAIpQObeUK8l0ppclZeYK0teoQRTkrHXGl4DMERf/565WdUCryEOSo+Ge8hEPcfYbH/
	uqAaO3O4vCp9TKIHxg0pPJ2h7yl0OY8=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-g018sjd9M6-GPkIXNrIfnQ-1; Tue, 10 Sep 2024 16:35:43 -0400
X-MC-Unique: g018sjd9M6-GPkIXNrIfnQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5365fdec97fso3287747e87.1
        for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 13:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726000541; x=1726605341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KhBCoXAN8RAZa3Liliv85vUYAqb0aLLkuMss9rbU2N4=;
        b=qhdyEZN+gYDMqC0QswUOmcq4UIBBP2LxkL5hhmAtjFs0vgyqXjsMlondzmU/NI7ou3
         KsfWEBil94qSInFn2yG8d+GYeRUxQhm2YGOUkGOWc37VPxMRFxHJDDxvLV7hC2IJ+YHV
         1R+5cre5fHSSsos6OH+Q+Q7zRm76g8Ah14oox0Mv5gyOPrlyb0DsYIsoPN8p9Cvcv/o6
         Xx183wYx+b9Rr8lDor5qX0wiOLAhdfU8hjPq1Bes2ySyVohodOlxKnLvXOwyrlAx0hXZ
         +WEnOblEXW+LYpx/Iq6jLDRdL/aFhNKyA185/Fpv9Ajdlohb1FyWR/tTIbNJQZG6hbgI
         7A9g==
X-Gm-Message-State: AOJu0YwXvvw8fb0tqBUeRmImZYuUSXmdwdPJ2g4rj4TwcNsxVZOzySyn
	mO3YOIqBCZi6sVcO8VP1J2iIoOviUQO1IHy8ARrTZ61W3eQCd7l1eYxQGCa1XnfeE/SOVkzlaJX
	iGJVmhh2eaNaQ9gfichyWGgFSBDKwWm5wnLOPSDbLTsidQB5/ur66/jhbvJ0bt2I8
X-Received: by 2002:a05:6512:3ba5:b0:533:901:e455 with SMTP id 2adb3069b0e04-536587a545emr11581937e87.2.1726000541220;
        Tue, 10 Sep 2024 13:35:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/W+hd572+mDeoAXBz1mc17m60Bkt+ZHj5XSuBezBlhd5qY/YBCUzH79s2lmcDrIo4Oyyupw==
X-Received: by 2002:a05:6512:3ba5:b0:533:901:e455 with SMTP id 2adb3069b0e04-536587a545emr11581913e87.2.1726000540391;
        Tue, 10 Sep 2024 13:35:40 -0700 (PDT)
Received: from redhat.com ([2a02:14f:176:f5ce:2d9:5bfa:9916:aa0a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ce9277sm533074666b.149.2024.09.10.13.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 13:35:39 -0700 (PDT)
Date: Tue, 10 Sep 2024 16:35:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: Re: [PATCH] admin: Enable driver to send admin commands before
 DRIVER_OK
Message-ID: <20240910162247-mutt-send-email-mst@kernel.org>
References: <20240910170723.44537-1-parav@nvidia.com>
 <20240910142850-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87136FC9671ABFF7123A82CADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <IA0PR12MB87136FC9671ABFF7123A82CADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 10, 2024 at 07:01:08PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, September 11, 2024 12:02 AM
> > 
> > On Tue, Sep 10, 2024 at 08:07:23PM +0300, Parav Pandit wrote:
> > > Currently the driver can operate administration commands using
> > > administration virtqueues. Administration virtqueues must be enabled
> > > before it reached DRIVER_OK stage similar to all other queues. This is
> > > a limiting factor.
> > >
> > > Many of the device functionalties needs to be discovered and
> > > configured early enough before the driver reaches the DRIVER_OK stage.
> > > Some examples are:
> > >
> > > a. driver wants to dynamically create the virtqueues of virtio-net
> > >    device with more parameters, for example header data split,
> > >    multiple physical addresses.
> > >    Here, the driver needs to tell PCI device early enough that it no
> > >    longer uses queue_* registers for non admin queues.
> > >
> > > b. driver wants to discover these features and related attributes
> > >    early enough so it has chance to decide to proceed via admin
> > >    cmd interface or proceed to DRIVER_OK and follow the current flow.
> > >
> > > To overcome these limitations, introduce a feature bit that enables
> > > the driver to send capabilities related admin commands before
> > > DRIVER_OK via the available interface such as administration virtqueue.
> > >
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > 
> > 
> > We were there in 1.0 and it's messy. And next thing you do, you will want it
> > before features ok, and we will keep piling up hacks.  
> I don't see any motivation to do before feature bit.

I do. And I keep saying, we need to be proactive, address more than one
problem with each feature and try to predict what will be needed,
otherwise it will be a mess of a million conflicting features.

> Never before features ok, feature negotiation is two ways communication that indicates device, that queue notification is coming.
> 
> > I think that if we want
> > to do admin commands before VQs are active, we should just add a capability
> > with registers for that. People wanted that anyway.
> > 
> We discussed before that pci-sig discourages piling up vendor specific caps.
> So better to avoid that.

Well, that's a separate issue. Actually pci endpoint guys already want
a way to access device without messing up with capabilities.
So we'll likely create a way to put capabilities in a BAR.


> An alternative would be to bump up the pci revision_id, which would align to pci-sig and its known early enough.
> Though it does not take away the feature bit because device preparation is needed to setup early admin commands.
> And feature bit can be a good hint to inform that.
> Only revision_id (from device to driver) is not good enough as there can be large sw stack which may never use it and no point in enabling this in the device without driver using it.
> So feature bit proposed here is self-contained, and its early enough.


I don't really get what this revision_id discussion is about.

> > 
> > 
> > 
> > 
> > > ---
> > >  admin.tex         | 16 ++++++++++++++++
> > >  content.tex       | 13 ++++++++++++-
> > >  transport-pci.tex |  6 ++++++
> > >  3 files changed, 34 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/admin.tex b/admin.tex
> > > index 39fc072..95054ed 100644
> > > --- a/admin.tex
> > > +++ b/admin.tex
> > > @@ -334,6 +334,11 @@ \subsection{Group administration
> > > commands}\label{sec:Basic Facilities of a Virti  supporting multiple
> > > group types, the list of supported commands  might differ between
> > different group types.
> > >
> > > +When the driver has negotiated the feature
> > > +VIRTIO_F_EARLY_CAP_ADMIN_CMD, the driver can use administration
> > > +commands VIRTIO_ADMIN_CMD_LIST_QUERY,
> > VIRTIO_ADMIN_CMD_LIST_USE and
> > > +commands related to device and driver capabilities listed in \ref[sec:Basic
> > Facilities of a Virtio Device / Device groups / Group administration commands
> > / Device and driver capabilities]{device and driver capabilities} for the self-
> > group type before the driver indicates DRIVER_OK status to the device.
> > > +
> > >  \input{admin-cmds-legacy-interface.tex}
> > >  \input{admin-cmds-capabilities.tex}
> > >  \input{admin-cmds-resource-objects.tex}
> > > @@ -608,6 +613,14 @@ \section{Administration
> > > Virtqueues}\label{sec:Basic Facilities of a Virtio Devic  or
> > > VIRTIO_ADMIN_STATUS_ENOMEM, then the command MUST NOT  have
> > any side effects, making it safe to retry.
> > >
> > > +If VIRTIO_F_EARLY_CAP_ADMIN_CMD feature is negotiated, the device
> > > +MUST process administration commands related to device and driver
> > > +capabilities before the driver indicates DRIVER_OK to the device.
> > > +
> > > +If VIRTIO_F_ADMIN_VQ and VIRTIO_F_EARLY_CAP_ADMIN_CMD features
> > are
> > > +negotiated, the device MUST be able to generate notifications related
> > > +to the administration virtqueue before the driver indicates DRIVER_OK to
> > the device.
> > > +
> > >  \drivernormative{\subsection}{Group administration commands}{Basic
> > > Facilities of a Virtio Device / Administration virtqueues}
> > >
> > >  The driver MAY supply device-readable or device-writeable parts @@
> > > -641,3 +654,6 @@ \section{Administration Virtqueues}\label{sec:Basic
> > > Facilities of a Virtio Devic
> > >
> > >  The driver SHOULD retry a command that completed with  \field{status}
> > > VIRTIO_ADMIN_STATUS_EAGAIN.
> > > +
> > > +When the VIRTIO_F_EARLY_ADMIN_CMD feature is negotiated, the driver
> > > +MAY send commands only to the first administration queue defined by
> > the specific transport.
> > > diff --git a/content.tex b/content.tex index c32c218..12f9224 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -540,6 +540,8 @@ \section{Device Initialization}\label{sec:General
> > Initialization And Device Oper
> > >     device, optional per-bus setup, reading and possibly writing the
> > >     device's virtio configuration space, and population of virtqueues.
> > >
> > > +\item\label{itm:General Initialization And Device Operation / Device
> > Initialization / Capabilities Access} Optionally get device capabilities and set
> > driver capabilities if VIRTIO_F_EARLY_CAP_ADMIN_CMD is negotiated.
> > > +
> > >  \item\label{itm:General Initialization And Device Operation / Device
> > Initialization / Set DRIVER-OK} Set the DRIVER_OK status bit.  At this point the
> > device is
> > >     ``live''.
> > >  \end{enumerate}
> > > @@ -550,7 +552,9 @@ \section{Device Initialization}\label{sec:General
> > > Initialization And Device Oper  driver MUST NOT continue initialization in
> > that case.
> > >
> > >  The driver MUST NOT send any buffer available notifications to -the
> > > device before setting DRIVER_OK.
> > > +the device before setting DRIVER_OK; however, the driver MAY send
> > > +buffer available notifications before setting DRIVER_OK if
> > > +VIRTIO_F_EARLY_CAP_ADMIN_CMD is negotiated.
> > >
> > >  \subsection{Legacy Interface: Device
> > > Initialization}\label{sec:General Initialization And Device Operation
> > > / Device Initialization / Legacy Interface: Device Initialization}  Legacy
> > devices did not support the FEATURES_OK status bit, and thus did @@ -879,6
> > +883,13 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature
> > Bits}
> > >  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
> > for
> > >  	handling features reserved for future use.
> > >
> > > +  \item[VIRTIO_F_EARLY_CAP_ADMIN_CMD(42)] This feature indicates
> > that the device
> > > +   exposes an administration command interface which is accessible to the
> > driver
> > > +   before the driver indicates DRIVER_OK device status. When this feature
> > is
> > > +   negotiated, once the the administration commands interface is
> > configured, it can be
> > > +   used by the driver to issue administration commands related to device
> > and driver
> > > +   capabilities.
> > > +
> > >  \end{description}
> > >
> > >  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature
> > > Bits} diff --git a/transport-pci.tex b/transport-pci.tex index
> > > 95b08b8..a612b34 100644
> > > --- a/transport-pci.tex
> > > +++ b/transport-pci.tex
> > > @@ -495,6 +495,12 @@ \subsubsection{Common configuration structure
> > > layout}\label{sec:Virtio Transport  to ensure that indices of valid
> > > admin queues fit into  a 16 bit range beyond all other virtqueues.
> > >
> > > +If VIRTIO_F_ADMIN_VQ and VIRTIO_F_EARLY_ADMIN_CMD has been
> > > +negotiated, the device MUST support administration commands through
> > > +the administration virtqueue identified by the
> > > +\field{admin_queue_index} after the administration virtqueue is
> > > +enabled and before the driver sets DRIVER_OK to the
> > \field{device_status}.
> > > +
> > >  \drivernormative{\paragraph}{Common configuration structure
> > > layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device
> > > Layout / Common configuration structure layout}
> > >
> > >  The driver MUST NOT write to \field{device_feature},
> > > \field{num_queues},
> > > --
> > > 2.34.1

