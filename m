Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429D528376
	for <virtio-comment@lists.linux.dev>; Thu,  6 Jun 2024 06:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717654206; cv=none; b=DIS9e68pLAcOLIpHAFl/jWsEdYItXbOdZJYSSWATFG8AbYkB7yMgzOi//hxQuvLlRx5TYC1/UPcnKM3BfyRFZ5LLjcp9aLi+IFpYhUG06+ooZIT4q8mDYsbCkW4ZO5F6aCUeJOJyeepB/1gRZpDkXfYPGxkWrxNz4R1k32TN60I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717654206; c=relaxed/simple;
	bh=Dzq5hQu3tGg2JIjQ2Fp3i8vUy+CGbRj0/FFKMf4INSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=dzemSrUbCM6S2k22FRF1o60S50/sjqDfxdxVv42mkLPHSnP4JW8Iz4WmL8+9lL1mDxJP1Szvv1ZXBdMYpj8dXgHiRv9SNAeLn/Sq/cTRJOxOssDpB51/zkgdGhv+GfsNYXnt4LxyTeBMWSjD8MEZAr8VK1bi2R0Ymj1n22tR06g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FOCb4tCF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FOCb4tCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717654203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nE7o9bMWtya3pAzra0va/LorKVWOQpS09TpYdOkEMfA=;
	b=FOCb4tCF3iywBbApLf99F63zOGTR+VeNJZxlvqjn7tS3zr+VYwpS7yhmAd9xQrPkfQ/vp7
	uMaP2gQPtvz7dikf8EqCOPxbF5OyV9XLkM0IshhYYSzZwxW8PyWdu21ak032++06VsLOHR
	TE8bQDj7ObYrmY2+bgX64EYxuTeWV8E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-Vhn4PqECP2yDxgviIg9p4Q-1; Thu, 06 Jun 2024 02:10:01 -0400
X-MC-Unique: Vhn4PqECP2yDxgviIg9p4Q-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-57a48571907so1791336a12.0
        for <virtio-comment@lists.linux.dev>; Wed, 05 Jun 2024 23:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717654200; x=1718259000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nE7o9bMWtya3pAzra0va/LorKVWOQpS09TpYdOkEMfA=;
        b=EF2xqq3BiZefm5bX0UM7y40nPHwLGftvqZ4hSxRG0j0FObgxTWFV1t44WPUWF8NwPj
         rIfdD9oqKnRY+kw3pVsvUmqYLnjWwwylZR/D0d7GmXEqdHFYi/96J0ifArb5npIQjdjT
         eW7H26q5tpLXVTcguM0egxqNk45fN5fMCX9QRiL+/aOS2dg/GvGuvtVCIzUdQnsEfCNU
         OE9GHmSyCXwdivK98oTv5vXxGs5NzU/sYlmnttsSGWsc1vR5Ech5aF4eOrZcnt8T0PM3
         BU6Y4xA624RrZWtTOfYnL7mIffMsuQUo5npOq3BdCtweAwd8EFhJcOoNCjE1Hz4G+OHH
         nSEg==
X-Gm-Message-State: AOJu0Yx/DP9ol2BBYUxfabAzSR6SroCyOggW53QpN/BYDhlsQinMSr3L
	RDyCIExvTXJFvFuKZkJ8E6geFbGi4TI/v7wfDc303Whf5T3hpoEwHWstuvAlc7Bsn0/Vv108Qdo
	Rj9J/hhcgMuVpa0zIeGjFptSiLlDHsRZKcGFR4KSFbqUjUblJNwClWWq2CdaDFdmI
X-Received: by 2002:a50:d4cf:0:b0:574:c3e4:1fa3 with SMTP id 4fb4d7f45d1cf-57aa55c7454mr1198796a12.20.1717654199971;
        Wed, 05 Jun 2024 23:09:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/gj5OaKEdHPmaNKIKNj5EcXJL/bcE3tDIXuflNHjEMqRAvcju9l50w5etLS444eHUQPocxw==
X-Received: by 2002:a50:d4cf:0:b0:574:c3e4:1fa3 with SMTP id 4fb4d7f45d1cf-57aa55c7454mr1198750a12.20.1717654198721;
        Wed, 05 Jun 2024 23:09:58 -0700 (PDT)
Received: from redhat.com ([2.55.8.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aae0cc36bsm498195a12.26.2024.06.05.23.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 23:09:56 -0700 (PDT)
Date: Thu, 6 Jun 2024 02:09:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: virtio-comment@lists.linux.dev, david@redhat.com
Subject: Re: [PATCH v2 1/2] balloon: introduce 6 memory statistics
Message-ID: <20240606020800-mutt-send-email-mst@kernel.org>
References: <20240606033544.400000-1-pizhenwei@bytedance.com>
 <20240606033544.400000-2-pizhenwei@bytedance.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240606033544.400000-2-pizhenwei@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 06, 2024 at 11:35:43AM +0800, zhenwei pi wrote:
> Note that virtio balloon statistics are OS independent, the names are
> not completely the same as Linux or Windows. For example, 'reclaim' is
> more general than 'steal' (on linux) and 'repurpose' (on windows) for
> a modern operating system.
> 
> Expose more memory statistics of the virtual memory subsystem from
> guest, it's helpful to analyze the memory performance and pressure
> from host side.
> 
> More, once the memory pressure gets critical, a task hits ALLOC STALL,
> and reclaims pages in batch directly. So the ALLOC STALL count is not
> the same as direct reclaim count.
> 
> Now we have a metric to analyze the memory performance:
> - y: counter increases
> - n: counter does not changes
> - h: the rate of counter change is high
> - l: the rate of counter change is low
> 
> OOM: VIRTIO_BALLOON_S_OOM_KILL
> STALL: VIRTIO_BALLOON_S_ALLOC_STALL
> ASCAN: VIRTIO_BALLOON_S_SCAN_ASYNC
> DSCAN: VIRTIO_BALLOON_S_SCAN_DIRECT
> ARCLM: VIRTIO_BALLOON_S_RECLAIM_ASYNC
> DRCLM: VIRTIO_BALLOON_S_RECLAIM_DIRECT
> 
> - OOM[y], STALL[*], ASCAN[*], DSCAN[*], ARCLM[*], DRCLM[*]:
>   the guest runs under really critial memory pressure
> 
> - OOM[n], STALL[h], ASCAN[*], DSCAN[l], ARCLM[*], DRCLM[l]:
>   the memory allocation stalls due to cgroup, not the global memory
>   pressure (for Linux).
> 
> - OOM[n], STALL[h], ASCAN[*], DSCAN[h], ARCLM[*], DRCLM[h]:
>   the memory allocation stalls due to global memory pressure. The
>   performance gets hurt a lot. A high ratio between DRCLM/DSCAN shows
>   quite effective memory reclaiming.
> 
> - OOM[n], STALL[h], ASCAN[*], DSCAN[h], ARCLM[*], DRCLM[l]:
>   the memory allocation stalls due to global memory pressure.
>   the ratio between DRCLM/DSCAN gets low, the guest OS is thrashing
>   heavily, the serious case leads poor performance and difficult
>   trouble shooting. Ex, sshd may block on memory allocation when
>   accepting new connections, a user can't login a VM by ssh command.
> 
> - OOM[n], STALL[n], ASCAN[h], DSCAN[n], ARCLM[l], DRCLM[n]:
>   the low ratio between ARCLM/ASCAN shows that the guest tries to
>   reclaim more memory, but it can't. Once more memory is required in
>   future, it will struggle to reclaim memory.
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  device-types/balloon/description.tex | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/device-types/balloon/description.tex b/device-types/balloon/description.tex
> index a1d9603..7ef4e3f 100644
> --- a/device-types/balloon/description.tex
> +++ b/device-types/balloon/description.tex
> @@ -305,6 +305,12 @@ \subsubsection{Memory Statistics}\label{sec:Device Types / Memory Balloon Device
>  #define VIRTIO_BALLOON_S_CACHES   7
>  #define VIRTIO_BALLOON_S_HTLB_PGALLOC 8
>  #define VIRTIO_BALLOON_S_HTLB_PGFAIL  9
> +#define VIRTIO_BALLOON_S_OOM_KILL       10
> +#define VIRTIO_BALLOON_S_ALLOC_STALL    11
> +#define VIRTIO_BALLOON_S_ASYNC_SCAN     12
> +#define VIRTIO_BALLOON_S_DIRECT_SCAN    13
> +#define VIRTIO_BALLOON_S_ASYNC_RECLAIM  14
> +#define VIRTIO_BALLOON_S_DIRECT_RECLAIM 15
>          le16 tag;
>          le64 val;
>  } __attribute__((packed));
> @@ -399,6 +405,24 @@ \subsubsection{Memory Statistics Tags}\label{sec:Device Types / Memory Balloon D
>  
>  \item[VIRTIO_BALLOON_S_HTLB_PGFAIL (9)] The number of failed hugetlb page
>    allocations in the guest.
> +
> +\item[VIRTIO_BALLOON_S_OOM_KILL (10)] The count of OOM killer invocations
> +  increases when the kernel invokes the OOM killer. The OOM killer selects a task
> +  to terminate in order to free up memory.
> +
> +\item[VIRTIO_BALLOON_S_ALLOC_STALL (11)] The count of stalls on memory allocation.
> +
> +\item[VIRTIO_BALLOON_S_ASYNC_SCAN (12)] The amount of memory scanned asynchronously
> +  by the kernel background task (in bytes).
> +
> +\item[VIRTIO_BALLOON_S_DIRECT_SCAN (13)] The amount of memory scanned directly by
> +  the running task (in bytes).
> +
> +\item[VIRTIO_BALLOON_S_ASYNC_RECLAIM (14)] The amount of memory reclaimed
> +  asynchronously by the kernel background task (in bytes).
> +
> +\item[VIRTIO_BALLOON_S_DIRECT_RECLAIM (15)] The amount of memory reclaimed
> +  directly by the running task (in bytes).
>  \end{description}

OOM kill description is unnecessarily verbose, the rest not very clear,
and not consistent with existing stats.


>  \subsubsection{Free Page Hinting}\label{sec:Device Types / Memory Balloon Device / Device Operation / Free Page Hinting}
> -- 
> 2.43.0
> 

