Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6011CEAF0
	for <virtio-comment@lists.linux.dev>; Mon, 27 May 2024 06:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716791849; cv=none; b=i9Qw3HGdgwXReiINdwC9yWIdfhHMfCnsNyzjiouQ8cg4NZWHGxJSgXLi4CghPo6e+XycF1jXfJTuiyx2KQexzgsdswJl/glwPzHuIigT3UQ8eWTE/wfFeWvybePN0jBM+JwsDsfwqa5/iNvKDE98C0y3oHQJrCT+ZpbQzUi7iPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716791849; c=relaxed/simple;
	bh=8piPTfQXXPraaeMy6d1QmVK2UUS15nTdYARIh8MLFKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=j/qNydP1dkNvRLY3T6p3XjXkNuiXfpAEKX7V+c5+DMMdSsBRYexMitDXYyfDJFAI3bGabQDniGJy65exZtVRAoyoKrt7i0CWPU465sXq7HOWtqCHUiVtaDEm77l2z5VJkL5nlrdpIvX/R4Tef0vj0H9rVZT+5ulU6VMWrCoq1A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EW6rocVp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EW6rocVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716791846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SSwsPjEIB0hMcShZyl0M+WsILwKvY1Fut9GXA311knk=;
	b=EW6rocVpYWKR2HNnjk/LViuMZN4TXCDf0oqkGNrxue8b0Z7HRmfFdJYaKGXSwcI3ojt4q4
	yPe+xW1kcfkWpLMpamS69hVAB+FlEw7GdEB5K11lg5m1rCy3DrOMHd5KqKl01VSc4wJnts
	4U8LXivNNw1eC02J047G4e5gMWzNyYo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-sA2Fu1ZfPheEbqvWWcWUWQ-1; Mon, 27 May 2024 02:37:22 -0400
X-MC-Unique: sA2Fu1ZfPheEbqvWWcWUWQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4211131673fso1931705e9.3
        for <virtio-comment@lists.linux.dev>; Sun, 26 May 2024 23:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716791841; x=1717396641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSwsPjEIB0hMcShZyl0M+WsILwKvY1Fut9GXA311knk=;
        b=vhmikXuujwt7rUAUVoTHFkW1UABJpRiQ6S5G9k+cAFQyjCpLidhxEXgTCoYlDgTAbk
         Jz6i1Gv04EdVLRidrwfD85kGiff90DXC3xGAKtExVOkcz8eFA4ZerkaopGJQPZzr8htN
         utMvi+fZsKLs3hSdxIYCP2f+LjU7uuSgOCvXkCqqj1aGzzlqYE2gx3FJLd2FFg0p+Y1s
         yOfKwJoGw7FiHTe3Ifzrm8jF3Rf9vDp6bB/Yvcu/kDNlszjjVjGPhKY1BYBVBzDYHS2m
         nMthWeAqLV7pZ55mYmNfXrnIDlC1ertjK+r3TR3Zklcg0X5nKqlJzDt1ySe60KCW56Se
         UACg==
X-Gm-Message-State: AOJu0YwJ+U1RDNQEfg41SzXpr9amFtDSERL30Qftk+TcHRFDs6CBGPRY
	yya8WyNjpPlOzC+Kx44Zxlt2no9fUvvEoqj9//9Wq7jHWEP8dZx5EwwbqatsunfXThNGR4gLQS+
	2x1zPGlTTzDe7EOncMPGOL5YQtOY8mA6r2g4GVwalnpCMVYQSfK/V7ox1gUrC5NURmb7iBb/t
X-Received: by 2002:a05:600c:1c88:b0:41a:908c:b841 with SMTP id 5b1f17b1804b1-42108a0d459mr86452075e9.32.1716791841269;
        Sun, 26 May 2024 23:37:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFou9KXqILQHeg7dioGq35cvZ+DpT+ANq/rkW1jAZSFOWYHQymFZsB+KO90rs8fsw4BurmnKw==
X-Received: by 2002:a05:600c:1c88:b0:41a:908c:b841 with SMTP id 5b1f17b1804b1-42108a0d459mr86451755e9.32.1716791840634;
        Sun, 26 May 2024 23:37:20 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:342:cd82:9c62:7faf:9d73:ba3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42108970967sm98196685e9.17.2024.05.26.23.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 23:37:19 -0700 (PDT)
Date: Mon, 27 May 2024 02:37:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: virtio-comment@lists.linux.dev, david@redhat.com
Subject: Re: [PATCH 1/1] balloon: introduce 6 memory statistics
Message-ID: <20240527022424-mutt-send-email-mst@kernel.org>
References: <20240513121005.459013-1-pizhenwei@bytedance.com>
 <20240513121005.459013-2-pizhenwei@bytedance.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240513121005.459013-2-pizhenwei@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 13, 2024 at 08:10:05PM +0800, zhenwei pi wrote:
> Expose more memory statistics of the virtual memory subsystem from
> guest, it's helpful to analyze the memory performance and pressure
> from host side.
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  device-types/balloon/description.tex | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/device-types/balloon/description.tex b/device-types/balloon/description.tex
> index a1d9603..bc8e109 100644
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


Would it make sense to reference
https://docs.kernel.org/admin-guide/mm/concepts.html ?
you seem to be using terminology from there.
And then pls actually use terminology from there.


> +
> +\item[VIRTIO_BALLOON_S_OOM_KILL (10)] The number of Out-Of-Memory killer
> +  invocations.


What exactly are "invocations"? The number of times a task was killed
to free memory?

> +
> +\item[VIRTIO_BALLOON_S_ALLOC_STALL (11)] The number of stall count on memory
> +  allocation.
>

count and number is mostly the same.

Again what is this counting? pages? stalls? If stalls isn't this always
the same as direct reclaim?

> +\item[VIRTIO_BALLOON_S_ASYNC_SCAN (12)] The amount of memory that has been
> +  scanned asynchronously (in bytes).

scanned by what? which memory do you count as "scanned"?

> +
> +\item[VIRTIO_BALLOON_S_DIRECT_SCAN (13)] The amount of memory that has been
> +  scanned directly (in bytes).

what is "scanned directly"?


> +
> +\item[VIRTIO_BALLOON_S_ASYNC_RECLAIM (14)] The amount of memory that has been
> +  reclaimed asynchronously (in bytes).

again reclaimed by what? free? evict?

> +
> +\item[VIRTIO_BALLOON_S_DIRECT_RECLAIM (15)] The amount of memory that has been
> +  reclaimed directly (in bytes).
>  \end{description}
>  
>  \subsubsection{Free Page Hinting}\label{sec:Device Types / Memory Balloon Device / Device Operation / Free Page Hinting}
> -- 
> 2.34.1
> 

