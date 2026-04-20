Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47EE2D876B
	for <virtio-comment@lists.linux.dev>; Mon, 20 Apr 2026 13:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693175; cv=none; b=oVua1pH92Qiu89O44bZGfS/JM9rpp/2Rt61KPlabgijQYWhJFVASoguYyo26qSqYfru2FjInGptIBdgejiT2PFMifsMmKD/2nfuZXFVOM5m035spqIrrvvAmx/fmGWu43ItcENzTwC87/HOLg69NiULWBXUXcjTWn/CMHTHaJdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693175; c=relaxed/simple;
	bh=clgHs/y9MH28vZYebWTqfzXLjipN4bs5hqzo69Io1+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=nh4MQOANqtbllraCSVXKKLiD7ngb9+mYv3SjxiKyl3oAQtv5LGuu/tzbGCXHbivgE7y+BdoiXDcBVK0MqgeSC2glguJPVjofmKW4UPG2MzvowBW58QVLopn9IR17mcegxRurNDKaBrnRQNcUyteymTt91U52Y1W9g482MirZQGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pilz0ssT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pilz0ssT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776693172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B/NZRZFCgKDylxfh60EKXiBATt2Hg/2SDppv8xzoyU8=;
	b=Pilz0ssTtEShDOnPvPEdsamHzh6/+bdvK3jWr+6mgAlCjr2jaKO1yf58Fb5PbG6PLgLQuC
	ZEakIXIOnxR48QIL/k6TEyq25O2RAc6RKj+7ncHyPafvcRSrodmAXKE1+EXlhF5O1Di3Bt
	qMlf7VrTgoBvGnToQPCnAtQXVoWsEeM=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-pyqOOA0fOFSuCKIGXPz8bQ-1; Mon, 20 Apr 2026 09:52:51 -0400
X-MC-Unique: pyqOOA0fOFSuCKIGXPz8bQ-1
X-Mimecast-MFC-AGG-ID: pyqOOA0fOFSuCKIGXPz8bQ_1776693170
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35dacc40f92so3002915a91.2
        for <virtio-comment@lists.linux.dev>; Mon, 20 Apr 2026 06:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776693170; x=1777297970;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/NZRZFCgKDylxfh60EKXiBATt2Hg/2SDppv8xzoyU8=;
        b=fqyeIp6d5104WB0L1KuRHyaidkW84V2E7BnbeLSZbUEqKKgGZYq6S4202W6F0P6dZ+
         EW81CIsCPYOqUb5vl9c+DKgCCq2nADu7BpjvqOMYmCUhbYmSpLExfmoiqMR9a+SrHzId
         05gwSu1fb4/jTFw0n8YItY+0xjMh06hASfe1PF/NCXRoQWuIe/YH7A6gkzLUMOpAFqbK
         wJUPIHy0yes6cMfGIaSCh0qGQ5HpsdPWrfPCux+ARFnOVze0VvkR9tceEj/xC8EzIkIl
         gA7hUOMqP/CqQ/Ig9lq2HxdREWwuSTfwuwlKi3fpjjOtf70OjbLCRnALpoq8/8ccDzhX
         pnRQ==
X-Gm-Message-State: AOJu0Yz3yB6MDJ59FmFGMx5yJJh2/Lav43ciYbqKWyBzcsImb0VLzj4b
	IytUh9dRViddw8e5D35UaVx6qfK5H8l7Yp1X9JTBer7NCjeZI+g9ixN1dlBfp+pP3A5id6/jgIf
	Gy5DO5i4YC7MvwqBP/D1ee4C9QgixO/6UlDS8rDMY1M+eJ0fElXdoQf1gNJvadiVmqPj4
X-Gm-Gg: AeBDiesUuHfjytGjxCmcINtCyaO0LDVmNn8R/UV2Yf/I2icLW4J4YncgOqPxwVYAS2V
	CLgDZnL31leem7XoBNA0xgrRFzJpnUIn2LyOt0LvykRvfI63R0SRj2dL43uBrCHmCv4Die8Py8a
	sqhJcUEFoRTGIuahXR3wTL9OlabCiaMeX8UFu26LwGGyBMeVSfBdrogi/XnV9M9f1sOjnpJvzBL
	hIwqQoIPJie8VfZ7EEidfgkFBmkvKcObLWkzn33rYvv03iQaezfbjC0qEWjBpulGDBfgngNiPMp
	U3IB9Qn8FIUTz3dCAp2j97d2yEfBzutgtd9Ref7vXywi+nOOC4g2wqNM5fcN7K3FRFWJSwpeeRT
	s6JsK1VGPK3dwtke9dLuv3o0/lA==
X-Received: by 2002:a17:90b:4ccf:b0:35f:b647:d973 with SMTP id 98e67ed59e1d1-36140229b13mr13547185a91.0.1776693170093;
        Mon, 20 Apr 2026 06:52:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4ccf:b0:35f:b647:d973 with SMTP id 98e67ed59e1d1-36140229b13mr13547164a91.0.1776693169562;
        Mon, 20 Apr 2026 06:52:49 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fbd970fsm4141716a91.14.2026.04.20.06.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 06:52:48 -0700 (PDT)
Date: Mon, 20 Apr 2026 15:52:40 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: marcandre.lureau@redhat.com
Cc: virtio-comment@lists.linux.dev, david@kernel.org
Subject: Re: [PATCH RFC] virtio-mem: add shared/private memory property
 details
Message-ID: <aeYvqOTMziofz2yF@fedora>
References: <20260415145435.2023866-1-marcandre.lureau@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260415145435.2023866-1-marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d6x0uv2_nvnChu_5hvwjAvtkFbNA_zsNpdiXAbzxAIs_1776693170
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello Marc, 

I did a first review of the patch:

On Wed, Apr 15, 2026 at 06:54:35PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Add specification text for platforms where system RAM has a
> shared/private property (e.g., confidential computing environments such
> as AMD SEV-SNP or Intel TDX). Define the device and driver requirements
> for memory state transitions during plug/unplug operations, and
> guidance for VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE case.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  device-types/mem/description.tex | 37 ++++++++++++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/device-types/mem/description.tex b/device-types/mem/description.tex
> index 9acf63f..1eefea0 100644
> --- a/device-types/mem/description.tex
> +++ b/device-types/mem/description.tex
> @@ -42,6 +42,18 @@ \section{Memory Device}\label{sec:Device Types / Memory Device}
>  provides the exact same properties with the exact same semantics for
>  plugged device memory as available for comparable RAM in the same configuration.
>  
> +In some configurations, system RAM might additionally have a shared/private
> +property, indicating whether memory is accessible to both the guest and the
> +host (shared) or only to the guest (private). \footnote{For example, in

How does the driver know if the platform has this memory property?,
i.e., shared/private property. 

> +confidential computing environments such as AMD SEV-SNP or Intel TDX.
> +The mechanism for converting between shared and private states is
> +platform-specific; for example, it might involve dedicated CPU instructions
> +or hypercalls.} The device provides unplugged memory in the shared state.
> +When memory blocks are plugged, the driver is expected to convert them to
> +the private state before use. Unless VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
> +has been negotiated, the driver is expected to convert them back to the
> +shared state before unplugging.
> +
>  \subsection{Device ID}\label{sec:Device Types / Memory Device / Device ID}
>  24
>  
> @@ -58,8 +70,9 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Device / Feature bits}
>  configuration is valid and corresponds to an ACPI PXM.
>  \item[VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE (1)] The driver is not allowed to
>  access unplugged memory. \footnote{On platforms with memory properties that
> -might get modified implicitly on memory access, this feature is expected to
> -be offered by the device.}
> +might get modified implicitly on memory access, or on platforms with a
> +shared/private memory property, this feature is expected to be offered by
> +the device.}
>  \item[VIRTIO_MEM_F_PERSISTENT_SUSPEND (2)] The driver can allow the guest
>  to enter suspended state (deep sleep, suspend-to-RAM).
>  \end{description}
> @@ -176,9 +189,15 @@ \subsection{Device Initialization}\label{Device Types / Memory Device / Device I
>  The device MUST NOT modify memory or memory properties of plugged memory
>  blocks during device reset.
>  
> +On platforms with a shared/private memory property, the device MUST NOT
> +change the shared/private state of memory blocks during device reset.
> +

Is this additional requirement needed? Is not already covered by the
previous one about `plugged memory blocks`? Is shared/private a memory
property?

>  The device SHOULD offer VIRTIO_MEM_F_PERSISTENT_SUSPEND if the platform
>  supports suspending (deep sleep, suspend-to-RAM) with plugged memory blocks.
>  
> +The device SHOULD offer VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE if the platform
> +has a shared/private memory property.
> +
>  \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Operation}
>  
>  The device notifies the driver about the amount of memory the device wants
> @@ -256,6 +275,15 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
>  If VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has been negotiated, the driver
>  MUST NOT read memory or query memory properties of unplugged memory blocks.
>  
> +On platforms with a shared/private memory property, the driver MUST convert
> +plugged memory blocks to the private state before initializing or otherwise
> +using them.
> +
> +On platforms with a shared/private memory property, the driver MUST convert
> +memory blocks to the shared state before requesting to unplug them (for
> +VIRTIO_MEM_REQ_UNPLUG_ALL, this applies to all plugged memory blocks), unless
> +VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has been negotiated.
> +
>  The driver MUST NOT request unplug of memory blocks while corresponding memory
>  or memory properties are still in use.
>  
> @@ -285,6 +313,11 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
>  The device MAY modify memory of unplugged memory blocks or reset memory
>  properties of such memory blocks to platform defaults at any time.
>  
> +On platforms with a shared/private memory property, the device MUST provide
> +unplugged memory blocks in the shared state.  If
> +VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has been negotiated, the device MUST
> +convert memory blocks to the shared state after unplugging them.

I wonder if the device can always do such a conversion, i.e., from
private to shared, or it should go through the guest.

> +
>  The device MUST NOT modify memory or memory properties of plugged memory
>  blocks.
>  
> -- 
> 2.53.0
> 
> 

