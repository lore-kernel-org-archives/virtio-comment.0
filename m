Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B11DF58
	for <virtio-comment@lists.linux.dev>; Sun, 14 Jul 2024 07:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720942792; cv=none; b=ZWNwXBny4iYvAtuabwC9+ah8+JM94Y1rGJpE4VtRvTW1+zyp9pjjxHzO4ARpduSFkF6p7dz/aocCBxlKfgbDDP+uad9ScLR8NsxsrDwI+Pn/8eKrVmjpklquUs0vR9EPolJkfuB5dXrN85yefg9SVUCJ7spb/5bGE088J/rBSuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720942792; c=relaxed/simple;
	bh=7iUdPjFo4IAGDQqKtJAoL1mZHejb80nHfRHvXCMTYqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FLJ0qGZFeF4QFbJAuVCnN0sv1rYLWej4k3WPFD7jENHIs7wRWpeRY3YkfWht6dbRjEHwT7l5YsoFjOqTTc4AgpZ2ylQluGOTGq/d4s6cNNklchzS/i5AOU+Bq4Q9dGCsoehbUpv5cC7S1LVYAUZUHqT25SIn4Az5uJ85+CjQPyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GjEFZ/HS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GjEFZ/HS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720942789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=14BFqUMgBXRKhmtUNiWq63zIGSiLHBOQxmfMdQOU0jY=;
	b=GjEFZ/HSmeJG4AR22Xn1tCzaiiEQvIVfzHInlfre4G90Op3fahohHS+3T0Jq6O8FS+zEuk
	54cQgwd2Gtcy8dRnyPMLPGBZIN4ua3Zj/D63qZsLo27v1GLHxOGsgJWl4g//wYMo7ZxTN2
	IAzdN2oMCW20J0VahakluEWjUY4r98c=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-RLmrGveJMk6kE5lpH_Uz9Q-1; Sun, 14 Jul 2024 03:39:47 -0400
X-MC-Unique: RLmrGveJMk6kE5lpH_Uz9Q-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-52e9b943e6dso3167910e87.2
        for <virtio-comment@lists.linux.dev>; Sun, 14 Jul 2024 00:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720942786; x=1721547586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14BFqUMgBXRKhmtUNiWq63zIGSiLHBOQxmfMdQOU0jY=;
        b=BQyiAfRlXSsV3jevmNLoKg7ERgvs6PGeA6mMXIeGfz61ZTb1SHY4/xnjr7KO9n/G5b
         0ylxYkJACUPH5riQCZjjmGRM3xYGg4CR7pw9wZsjCVz7Ttu8hvn/o75+b/p1pvOjVcIt
         elgoVYaUMKRBwqGoulU1c0aDX3pIWKGmDDY28/n9ZAzLR4572MGKl8wop2xYNDjc+RWC
         rB8p+Cz2UTYChgwtyUCyqmXsrmBGg4LBx9Ei/kqIz+k5Z5SypwEmi8F2gR2QBhcOTg1u
         31WaBEU/R4MxPscaDfJ8IwLIDEkTl12Uiwosl/NsD+pNIBEKXnDYdmYFITs+iaffFAsj
         C61Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPi1B5GCN9/aeJ82yoQQ+3cLRZma+ax3M+O64G7c1Te2EiLX2CCdv3Npw4gITzU3LaiaGhpD7M/c8qtZkynxmleGnZ5WI8AmogWYgF4pY=
X-Gm-Message-State: AOJu0YyRj/ZeG5s544TZm8IFvU66YrWzPUm9eagSEuLie2VN3Qg0L99H
	0STMEHraufOatoMzeEE/9IaSZkYnvEykUhapRtDpYPzmIdnIrGWiDV6c+qGtfYWxF0DGad1WNy8
	DzLXj7VIQvKES52P9RNZ84ZgQGazQRvdfik72UAz7mqJdQFTcrzJlrXm+u5eFupZ8
X-Received: by 2002:a05:6512:4c2:b0:52b:bd97:ffdc with SMTP id 2adb3069b0e04-52eb99d2749mr9740083e87.59.1720942785730;
        Sun, 14 Jul 2024 00:39:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEufyaGq4Yo4vOOY5jK8iJqjFD397z1aulFLptV8Wi+NaMM3b5oV0LW1/Ywe4sio6uyCr1bXQ==
X-Received: by 2002:a05:6512:4c2:b0:52b:bd97:ffdc with SMTP id 2adb3069b0e04-52eb99d2749mr9740067e87.59.1720942785034;
        Sun, 14 Jul 2024 00:39:45 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:240:5146:27c:20a3:47d4:904])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e77a55sm43091415e9.10.2024.07.14.00.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 00:39:44 -0700 (PDT)
Date: Sun, 14 Jul 2024 03:39:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Parav Pandit <pandit.parav@gmail.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>
Subject: Re: [PATCH] editorial: replace hyperref with ref
Message-ID: <20240714033914-mutt-send-email-mst@kernel.org>
References: <20240712041433.3246718-1-parav@nvidia.com>
 <20240712065953-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A5D993ED79A9AC2BD53BDCA62@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481A5D993ED79A9AC2BD53BDCA62@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 12, 2024 at 01:10:35PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, July 12, 2024 4:30 PM
> > To: Parav Pandit <pandit.parav@gmail.com>
> > Cc: virtio-comment@lists.linux.dev; cohuck@redhat.com; Parav Pandit
> > <parav@nvidia.com>
> > Subject: Re: [PATCH] editorial: replace hyperref with ref
> > 
> > On Fri, Jul 12, 2024 at 07:14:33AM +0300, Parav Pandit wrote:
> > > Replace hyperreference with the reference.
> > > Fix the broken link refernce for the DEVICE_STATUS part.
> > 
> > BTW once you know the hash, add a Fixes tag here for the patch it's fixing up.
> >
> Yes, I am familiar with the flow.
> Will do once, the patches are part of the branch. This patch is sent mainly to fix the editorial in the same PR.
> Hence, I skipped it.

you can do it on the branch itself as opposed to in mail.

> Will follow in future patches.
>  
> > 
> > > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > 
> > 
> > > ---
> > >  admin-cmds-device-parts.tex     |  6 +++---
> > >  admin-cmds-resource-objects.tex |  2 +-
> > >  device-parts.tex                | 19 ++++++++++---------
> > >  3 files changed, 14 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/admin-cmds-device-parts.tex b/admin-cmds-device-parts.tex
> > > index ab6e83b..4aa1464 100644
> > > --- a/admin-cmds-device-parts.tex
> > > +++ b/admin-cmds-device-parts.tex
> > > @@ -60,7 +60,7 @@ \subsubsection{Device parts}\label{sec:Basic
> > > Facilities of a Virtio Device / Dev  Before performing any get or set
> > > operation for the device parts, the driver  creates the device parts
> > > resource object  VIRTIO_RESOURCE_OBJ_DEV_PARTS using the
> > > administration command -\hyperref[par:Basic Facilities of a Virtio Device /
> > Device groups / Group administration commands / Device resource objects /
> > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE]{VIRTIO_ADMIN_CMD_RESO
> > URCE_OBJ_CREATE}.
> > > +\ref{par:Basic Facilities of a Virtio Device / Device groups / Group
> > administration commands / Device resource objects /
> > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}.
> > >  The driver indicates the intended purpose (get or set) at the time of
> > > creating the  device parts resource object.
> > >  For the device parts resource object, both
> > > \field{resource_obj_specific_data} and @@ -337,7 +337,7 @@
> > > \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio
> > > Device / Dev  When there are multiple device parts in the command
> > > VIRTIO_ADMIN_CMD_DEV_PARTS_GET, the device MUST respond the
> > device
> > > parts in the  same order as listed in the table -\hyperref[table:Basic Facilities
> > of a Virtio Device / Device groups / Group administration commands / Device
> > parts / Device parts order/ Device parts order]{device parts order}.
> > > +\ref{table:Basic Facilities of a Virtio Device / Device groups / Group
> > administration commands / Device parts / Device parts order/ Device parts
> > order}.
> > >
> > >  The device SHOULD respond with an error status for the command
> > > VIRTIO_ADMIN_CMD_DEV_PARTS_SET if the device is not stopped.
> > > @@ -455,7 +455,7 @@ \subsubsection{Device parts}\label{sec:Basic
> > > Facilities of a Virtio Device / Dev  When there are multiple device
> > > parts in the command  VIRTIO_ADMIN_CMD_DEV_PARTS_SET, the driver
> > MUST
> > > set the device parts in the same  order as listed in the table
> > > -\hyperref[table:Basic Facilities of a Virtio Device / Device groups / Group
> > administration commands / Device parts / Device parts order/ Device parts
> > order]{device parts order}.
> > > +\ref{table:Basic Facilities of a Virtio Device / Device groups / Group
> > administration commands / Device parts / Device parts order/ Device parts
> > order}.
> > >
> > >  For the SR-IOV group type, the driver SHOULD NOT access the device
> > > configuration  space described in section diff --git
> > > a/admin-cmds-resource-objects.tex b/admin-cmds-resource-objects.tex
> > > index 388aa69..d0a6647 100644
> > > --- a/admin-cmds-resource-objects.tex
> > > +++ b/admin-cmds-resource-objects.tex
> > > @@ -69,7 +69,7 @@ \subsubsection{Device resource
> > > objects}\label{sec:Basic Facilities of a Virtio D  \hline  Resource
> > > object type & Name & Description \\  \hline \hline
> > > -0x000 & \hyperref[par:Basic Facilities of a Virtio Device / Device
> > > groups / Group administration commands / Device parts /
> > > VIRTIO_RESOURCE_OBJ_DEV_PARTS]{VIRTIO_RESOURCE_OBJ_DEV_PARTS}
> > & Device
> > > parts object \\
> > > +0x000 & VIRTIO_RESOURCE_OBJ_DEV_PARTS & Device parts object, see
> > > +\ref{par:Basic Facilities of a Virtio Device / Device groups / Group
> > > +administration commands / Device parts /
> > > +VIRTIO_RESOURCE_OBJ_DEV_PARTS} \\
> > >  \hline
> > >  0x001-0x1ff & - & Generic resource object range reserved \\  \hline
> > > diff --git a/device-parts.tex b/device-parts.tex index
> > > 7384408..47ad06d 100644
> > > --- a/device-parts.tex
> > > +++ b/device-parts.tex
> > > @@ -70,7 +70,7 @@ \section{Device parts}\label{sec:Basic Facilities of
> > > a Virtio Device / Device pa  \field{part_type} values.
> > >
> > >  \field{selector.pci_common_cfg.offset} is the offset of the -field in
> > > the \hyperref[sec:Virtio Transport Options / Virtio Over PCI Bus / PCI
> > > Device Layout / Common configuration structure layout]{Virtio PCI
> > > common config space}. It is valid only when the \field{part_type} is
> > > set to VIRTIO_DEV_PART_PCI_COMMON_CFG,
> > > +field in the \ref{sec:Virtio Transport Options / Virtio Over PCI Bus
> > > +/ PCI Device Layout / Common configuration structure layout}. It is
> > > +valid only when the \field{part_type} is set to
> > > +VIRTIO_DEV_PART_PCI_COMMON_CFG,
> > >  otherwise it is reserved and set to 0.
> > >
> > >  \field{selector.vq_index.index} is the index of the virtqueue. It is
> > > valid @@ -89,17 +89,17 @@ \subsection{Common device
> > > parts}\label{sec:Basic Facilities of a Virtio Device /  \hline  Type &
> > > Name & Description \\  \hline \hline
> > > -0x100 & \hyperref[sec:Basic Facilities of a Virtio Device / Device
> > > parts / Common device parts /
> > > VIRTIO_DEV_PART_DEV_FEATURES]{VIRTIO_DEV_PART_DEV_FEATURES} &
> > Device
> > > features \\
> > > +0x100 & VIRTIO_DEV_PART_DEV_FEATURES & Device features, see
> > > +\ref{sec:Basic Facilities of a Virtio Device / Device parts / Common
> > > +device parts / VIRTIO_DEV_PART_DEV_FEATURES} \\
> > >  \hline
> > > -0x101 & \hyperref[sec:Basic Facilities of a Virtio Device / Device
> > > parts / Common device parts /
> > > VIRTIO_DEV_PART_DRV_FEATURES]{VIRTIO_DEV_PART_DRV_FEATURES} &
> > Driver
> > > features \\
> > > +0x101 & VIRTIO_DEV_PART_DRV_FEATURES & Driver features,
> > > +\ref{sec:Basic Facilities of a Virtio Device / Device parts / Common
> > > +device parts / VIRTIO_DEV_PART_DRV_FEATURES} \\
> > >  \hline
> > > -0x102 & \hyperref[sec:Basic Facilities of a Virtio Device / Device
> > > parts / Common device parts /
> > >
> > VIRTIO_DEV_PART_PCI_COMMON_CFG]{VIRTIO_DEV_PART_PCI_COMMON_
> > CFG} & PCI
> > > common configuration \\
> > > +0x102 & VIRTIO_DEV_PART_PCI_COMMON_CFG & PCI common
> > configuration,
> > > +see \ref{sec:Basic Facilities of a Virtio Device / Device parts /
> > > +Common device parts / VIRTIO_DEV_PART_PCI_COMMON_CFG} \\
> > >  \hline
> > > -0x103 & \hyperref[sec:Basic Facilities of a Virtio Device / Device
> > > parts / Common device parts /
> > > VIRTIO_DEV_PART_DEVICE_STATUS]{VIRTIO_DEV_PART_DEVICE_STATUS}
> > & Device
> > > status \\
> > > +0x103 & VIRTIO_DEV_PART_DEVICE_STATUS & Device status, see
> > > +\ref{sec:Basic Facilities of a Virtio Device / Device parts / Common
> > > +device parts / VIRTIO_DEV_PART_DEVICE_STATUS} \\
> > >  \hline
> > > -0x104 & \hyperref[sec:Basic Facilities of a Virtio Device / Device
> > > parts / Common device parts /
> > > VIRTIO_DEV_PART_VQ_CFG]{VIRTIO_DEV_PART_VQ_CFG} & Virtqueue
> > > configuration \\
> > > +0x104 & VIRTIO_DEV_PART_VQ_CFG & Virtqueue configuration, see
> > > +\ref{sec:Basic Facilities of a Virtio Device / Device parts / Common
> > > +device parts / VIRTIO_DEV_PART_VQ_CFG} \\
> > >  \hline
> > > -0x105 & \hyperref[sec:Basic Facilities of a Virtio Device / Device
> > > parts / Common device parts /
> > > VIRTIO_DEV_PART_VQ_NOTIFY_CFG]{VIRTIO_DEV_PART_VQ_NOTIFY_CFG}
> > &
> > > Virtqueue notification configuration \\
> > > +0x105 & VIRTIO_DEV_PART_VQ_NOTIFY_CFG & Virtqueue notification
> > > +configuration, see \ref{sec:Basic Facilities of a Virtio Device /
> > > +Device parts / Common device parts /
> > VIRTIO_DEV_PART_VQ_NOTIFY_CFG}
> > > +\\
> > >  \hline
> > >  0x106 - 0x2FF & - & Common device parts range reserved for future \\
> > > \hline @@ -157,7 +157,8 @@
> > > \subsubsection{VIRTIO_DEV_PART_PCI_COMMON_CFG}
> > >  One or multiple VIRTIO_DEV_PART_PCI_COMMON_CFG parts may exist in
> > the
> > > get or set commands; each such part corresponds to a unique \field{offset}.
> > >
> > > -
> > \subsubsection{VIRTIO_DEV_PART_DEVICE_STATUS}\label{par:VIRTIO_DEV_P
> > A
> > > RT_DEVICE_STATUS}
> > > +\subsubsection{VIRTIO_DEV_PART_DEVICE_STATUS}
> > > +\label{sec:Basic Facilities of a Virtio Device / Device parts /
> > > +Common device parts / VIRTIO_DEV_PART_DEVICE_STATUS}
> > >
> > >  For VIRTIO_DEV_PART_DEVICE_STATUS, \field{part_type} is set to 0x103.
> > >  The VIRTIO_DEV_PART_DEVICE_STATUS field indicates the device status
> > > as listed in @@ -215,7 +216,7 @@
> > > \subsubsection{VIRTIO_DEV_PART_VQ_NOTIFY_CFG}
> > >
> > >  \field{queue_notify_off} and \field{queue_notif_config_data}
> > > corresponds to the  fields in \field{struct virtio_pci_common_cfg}
> > > described in -\hyperref[sec:Virtio Transport Options / Virtio Over PCI Bus /
> > PCI Device Layout / Common configuration structure layout]{Virtio PCI
> > common configuration space}.
> > > +\ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> > Common configuration structure layout}.
> > >
> > >  One or multiple instance of the device part
> > > VIRTIO_DEV_PART_VQ_NOTIFY_CFG may exist  in the get and set
> > commands,
> > > each such device part corresponds to a unique
> > > --
> > > 2.34.1

