Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DBB54FB5
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 11:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720782032; cv=none; b=shf2sm4HQwzkQFgVFCvujqZs3nhEW18yXURI4z8tVW3uFWrnEjX4PB1lAEoqx9u+ROHLqk+cudYroWe1tXYMPRJ2BmU8rowKQBvMJ7T6R21z65A+TD0ZSwpYQEr/ydA63M9fhqprUIVdFsHVHXpZy7arBlqqOdRpW27oMGEqCdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720782032; c=relaxed/simple;
	bh=re4phu6SymAlRnuyv5rkeNJtJ4FARxBDhvRdTAZMXmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TzLK4PjS6m7bPdXhJxDvxPLho/O6iQihr21um5c7LPaUorx9pSHQUNMnvD7yuHOaMhQcJMkCVg461ZbE2t6qLkl3GbnYHWUM6TdeJ2mRme68dvPKJhy1Ke7Uv0wxoE7rEjLkjXTTJ0UfMQmWr4iuKVJwcbmD1MdgIKQh+9t89P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aO6TI0Tj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aO6TI0Tj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720782029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wkcO7S0J5cPb2c05Ze6wlDsibBZ6n32Upt/JzrbVrCA=;
	b=aO6TI0TjxGqcQQlzgWadJ+w6l2jwhlOiQUz7by8d9ejhyFhonY2kM55+0DQLVteb3hvso/
	rHKSe3xNClcwv3swQTHmKCO8tXBgkLuipOzBz6XRwIDxmvK5w95cM90s3RgYHTOSaEj3qV
	pkpKIC5g4w7hJ8vcwvh8QljLfAwQT7c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-HpdYRjFjORydZ4bipPfGzg-1; Fri, 12 Jul 2024 07:00:28 -0400
X-MC-Unique: HpdYRjFjORydZ4bipPfGzg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-367962f0cb0so1308102f8f.1
        for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 04:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720782027; x=1721386827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkcO7S0J5cPb2c05Ze6wlDsibBZ6n32Upt/JzrbVrCA=;
        b=q+Scx5s/L5ii2vM9BpQ0xwcK0f0+pGDFlRCRBFFHIViTztYbsIZWr0yo29EA9jgZzR
         RYFvRxcDFqR1YD9u4nsD2E+GlZc+6eE9hERk4NAJ+aBMxFKC0HWdkhPigVqKiXqiuYi6
         T4CBQWYIbwDZ/wMDvHSQaugpj2GXDAXx66xM2bZmF7YwVJK1B2Zev0CoGkYguIr6mVFa
         0vzeZ1MvPCZf9rjd747WPhMum7DDiNI6byvUg6SFz/2uLoDQH+ShfmFB3sd/uFGpEEci
         hukYCHYotTI7oA0xYxbijnEVUdTSdpNYEmY//1/UdpK22FUzsDr+I/P9aOqfIVEBPCYk
         2ZLg==
X-Gm-Message-State: AOJu0YxxnoL2zZMp+vrIMsfWYJPCYKOlZsTBQxM0p/n+MXH8i2dNd67s
	A5SXBE7Emb6/iqsMwjBlR3gbB+DD3w6RzVKaJJ4Hpyt2cpR6sHsMQtZC+9TyW1Y+C7FJP/C/4z2
	/TMwDLCL0HZ1jacVQqY5HlaepLYTcGZnBQoQlCW2Ha44RuLfkKaMp2c59y/awTo/FKa+FaBb9
X-Received: by 2002:adf:e111:0:b0:367:9903:a79 with SMTP id ffacd0b85a97d-367cead1181mr7736868f8f.48.1720782026951;
        Fri, 12 Jul 2024 04:00:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfb4pawjpe0Sp8HNc2rZY7kr1gHt9A26Ev2fIMZyJKfTNS7aFnYmQNP4V3flgK31qxGwecEA==
X-Received: by 2002:adf:e111:0:b0:367:9903:a79 with SMTP id ffacd0b85a97d-367cead1181mr7736834f8f.48.1720782026076;
        Fri, 12 Jul 2024 04:00:26 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:341:761e:f82:fc9a:623b:3fd1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367ebb77edasm5788537f8f.9.2024.07.12.04.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 04:00:25 -0700 (PDT)
Date: Fri, 12 Jul 2024 07:00:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <pandit.parav@gmail.com>
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com,
	Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH] editorial: replace hyperref with ref
Message-ID: <20240712065953-mutt-send-email-mst@kernel.org>
References: <20240712041433.3246718-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240712041433.3246718-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 12, 2024 at 07:14:33AM +0300, Parav Pandit wrote:
> Replace hyperreference with the reference.
> Fix the broken link refernce for the DEVICE_STATUS part.

BTW once you know the hash, add a Fixes tag here
for the patch it's fixing up.


> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>


> ---
>  admin-cmds-device-parts.tex     |  6 +++---
>  admin-cmds-resource-objects.tex |  2 +-
>  device-parts.tex                | 19 ++++++++++---------
>  3 files changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/admin-cmds-device-parts.tex b/admin-cmds-device-parts.tex
> index ab6e83b..4aa1464 100644
> --- a/admin-cmds-device-parts.tex
> +++ b/admin-cmds-device-parts.tex
> @@ -60,7 +60,7 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
>  Before performing any get or set operation for the device parts, the driver
>  creates the device parts resource object
>  VIRTIO_RESOURCE_OBJ_DEV_PARTS using the administration command
> -\hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE]{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}.
> +\ref{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}.
>  The driver indicates the intended purpose (get or set) at the time of creating the
>  device parts resource object.
>  For the device parts resource object, both \field{resource_obj_specific_data} and
> @@ -337,7 +337,7 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
>  When there are multiple device parts in the command
>  VIRTIO_ADMIN_CMD_DEV_PARTS_GET, the device MUST respond the device parts in the
>  same order as listed in the table
> -\hyperref[table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts order/ Device parts order]{device parts order}.
> +\ref{table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts order/ Device parts order}.
>  
>  The device SHOULD respond with an error status for the command
>  VIRTIO_ADMIN_CMD_DEV_PARTS_SET if the device is not stopped.
> @@ -455,7 +455,7 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
>  When there are multiple device parts in the command
>  VIRTIO_ADMIN_CMD_DEV_PARTS_SET, the driver MUST set the device parts in the same
>  order as listed in the table
> -\hyperref[table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts order/ Device parts order]{device parts order}.
> +\ref{table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts order/ Device parts order}.
>  
>  For the SR-IOV group type, the driver SHOULD NOT access the device configuration
>  space described in section
> diff --git a/admin-cmds-resource-objects.tex b/admin-cmds-resource-objects.tex
> index 388aa69..d0a6647 100644
> --- a/admin-cmds-resource-objects.tex
> +++ b/admin-cmds-resource-objects.tex
> @@ -69,7 +69,7 @@ \subsubsection{Device resource objects}\label{sec:Basic Facilities of a Virtio D
>  \hline
>  Resource object type & Name & Description \\
>  \hline \hline
> -0x000 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / VIRTIO_RESOURCE_OBJ_DEV_PARTS]{VIRTIO_RESOURCE_OBJ_DEV_PARTS} & Device parts object \\
> +0x000 & VIRTIO_RESOURCE_OBJ_DEV_PARTS & Device parts object, see \ref{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / VIRTIO_RESOURCE_OBJ_DEV_PARTS} \\
>  \hline
>  0x001-0x1ff & - & Generic resource object range reserved \\
>  \hline
> diff --git a/device-parts.tex b/device-parts.tex
> index 7384408..47ad06d 100644
> --- a/device-parts.tex
> +++ b/device-parts.tex
> @@ -70,7 +70,7 @@ \section{Device parts}\label{sec:Basic Facilities of a Virtio Device / Device pa
>  \field{part_type} values.
>  
>  \field{selector.pci_common_cfg.offset} is the offset of the
> -field in the \hyperref[sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout]{Virtio PCI common config space}. It is valid only when the \field{part_type} is set to VIRTIO_DEV_PART_PCI_COMMON_CFG,
> +field in the \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}. It is valid only when the \field{part_type} is set to VIRTIO_DEV_PART_PCI_COMMON_CFG,
>  otherwise it is reserved and set to 0.
>  
>  \field{selector.vq_index.index} is the index of the virtqueue. It is valid
> @@ -89,17 +89,17 @@ \subsection{Common device parts}\label{sec:Basic Facilities of a Virtio Device /
>  \hline
>  Type & Name & Description \\
>  \hline \hline
> -0x100 & \hyperref[sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DEV_FEATURES]{VIRTIO_DEV_PART_DEV_FEATURES} & Device features \\
> +0x100 & VIRTIO_DEV_PART_DEV_FEATURES & Device features, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DEV_FEATURES} \\
>  \hline
> -0x101 & \hyperref[sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DRV_FEATURES]{VIRTIO_DEV_PART_DRV_FEATURES} & Driver features \\
> +0x101 & VIRTIO_DEV_PART_DRV_FEATURES & Driver features, \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DRV_FEATURES} \\
>  \hline
> -0x102 & \hyperref[sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_PCI_COMMON_CFG]{VIRTIO_DEV_PART_PCI_COMMON_CFG} & PCI common configuration \\
> +0x102 & VIRTIO_DEV_PART_PCI_COMMON_CFG & PCI common configuration, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_PCI_COMMON_CFG} \\
>  \hline
> -0x103 & \hyperref[sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DEVICE_STATUS]{VIRTIO_DEV_PART_DEVICE_STATUS} & Device status \\
> +0x103 & VIRTIO_DEV_PART_DEVICE_STATUS & Device status, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DEVICE_STATUS} \\
>  \hline
> -0x104 & \hyperref[sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_VQ_CFG]{VIRTIO_DEV_PART_VQ_CFG} & Virtqueue configuration \\
> +0x104 & VIRTIO_DEV_PART_VQ_CFG & Virtqueue configuration, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_VQ_CFG} \\
>  \hline
> -0x105 & \hyperref[sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_VQ_NOTIFY_CFG]{VIRTIO_DEV_PART_VQ_NOTIFY_CFG} & Virtqueue notification configuration \\
> +0x105 & VIRTIO_DEV_PART_VQ_NOTIFY_CFG & Virtqueue notification configuration, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_VQ_NOTIFY_CFG} \\
>  \hline
>  0x106 - 0x2FF & - & Common device parts range reserved for future \\
>  \hline
> @@ -157,7 +157,8 @@ \subsubsection{VIRTIO_DEV_PART_PCI_COMMON_CFG}
>  One or multiple VIRTIO_DEV_PART_PCI_COMMON_CFG parts may exist in the
>  get or set commands; each such part corresponds to a unique \field{offset}.
>  
> -\subsubsection{VIRTIO_DEV_PART_DEVICE_STATUS}\label{par:VIRTIO_DEV_PART_DEVICE_STATUS}
> +\subsubsection{VIRTIO_DEV_PART_DEVICE_STATUS}
> +\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DEVICE_STATUS}
>  
>  For VIRTIO_DEV_PART_DEVICE_STATUS, \field{part_type} is set to 0x103.
>  The VIRTIO_DEV_PART_DEVICE_STATUS field indicates the device status as listed in
> @@ -215,7 +216,7 @@ \subsubsection{VIRTIO_DEV_PART_VQ_NOTIFY_CFG}
>  
>  \field{queue_notify_off} and \field{queue_notif_config_data} corresponds to the
>  fields in \field{struct virtio_pci_common_cfg} described in
> -\hyperref[sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout]{Virtio PCI common configuration space}.
> +\ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}.
>  
>  One or multiple instance of the device part VIRTIO_DEV_PART_VQ_NOTIFY_CFG may exist
>  in the get and set commands, each such device part corresponds to a unique
> -- 
> 2.34.1

