Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BFB40DFCC
	for <virtio-comment@lists.linux.dev>; Thu,  7 May 2026 05:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778133028; cv=none; b=tQYwZtP16Ou85K9nQvtGrr+7bSeWp54xdTflXzTfpWxcpEHD17+Vvl2M+mkmFgXnU2tShv+ucsrYe1xND58a0JJble1s6eAerm6M4TJ02Ij1aDiSw6oDwNXpURTba99eMU2VN+7ouQsWdamRUlyYdJLDe2MBjWlrhLDpRw3Brlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778133028; c=relaxed/simple;
	bh=oDLFri1h7C9O092VKuD8mc0gZ3AHwvCJ/a5iGWSmHpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cb1b5vOAgY5DFBHq1bJeKmZO8MPHSyHSb2L4LeBRn9BraWZKJtSr1kTwsttJIXzHDuNSWdb6zyvc8lMQs1EpYqxdBtqpJqZBTHYZPY//iIsB8CwRZVXMVnw+/2f7d24xZHo+EgvQ0h8ZCsKSjMIZltDDGwpOfoVZDjlr1uC0RmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cficlXfC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cficlXfC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778133026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FpGjyeyJhw3ShiJaj2Wgfbb/iFBaCpWwKYt+na7iMAw=;
	b=cficlXfCdxCmMVF13gJ9+yAd/kCdEIp6Po9Z2Jtz4dh53vsDaKS6I/mBSQHoO4GOx2t2Tm
	V/wEA+/TaY0n9MK6zqJeX3bWw94XC4OPsguvN5jH/BwrgDSOM1vSibM+LguW3e833KuR0G
	GcoXsYgz9wHAoEJeU+mCPsUqWQvxnFU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-KFP3a3MpMmq5sg4NVD0-mg-1; Thu, 07 May 2026 01:50:24 -0400
X-MC-Unique: KFP3a3MpMmq5sg4NVD0-mg-1
X-Mimecast-MFC-AGG-ID: KFP3a3MpMmq5sg4NVD0-mg_1778133023
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-44cc3c9b2feso399726f8f.1
        for <virtio-comment@lists.linux.dev>; Wed, 06 May 2026 22:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778133023; x=1778737823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpGjyeyJhw3ShiJaj2Wgfbb/iFBaCpWwKYt+na7iMAw=;
        b=KQ9nxe1oi+xTNBXdEEJzWP7PAnIDY010raQUTyusq7bgTId7sCQjDJ4u0av4/Ja57v
         iBe++Ccv4wOT5OENy+UINQaiYptYqHSfGa1iL30iAtQaZxQ350oydw0pTtu7kGBJ/4/n
         SGECK8eENNoPgOC3hYI2yhnNNEOZgkJZIg6xQadSM3MScZK4DLZm2nOMaQ/umFYHtDLj
         eDPNGjEqpv5mOh0oClMN4hSpXZGWa6R1J7jqCJ+HRcc2Ad7YsY+XfbX3z60hLHuyxdgs
         bHVvBtucOjSCk8zM3dAwa6bG027RxqLbFy2BHcNb+FzZV7TPommnb5obVmjWQa43rw1D
         nIBQ==
X-Gm-Message-State: AOJu0YyD7Z4t0kOEmo+Z2DIep4a+n+Y5GurL5vhT/eFGaKNQFmf5ABNF
	bIQqfqznQb+GTru1/g01KO4oKLupiR+YYFXN9J0x0bGnNf2FREpRSWWe4OpxhVV0rHGDIGmkgn1
	FwWYO+C92nPxLf609k8RLx0qXbgz/NPWywsqWL5d3IGEoFVCC1QJpRB0xYEgdF0qgkAWz
X-Gm-Gg: AeBDietyjkWqClRS93w0aykD2G/bLQdCRifBsHKqyGr0XIaTOr1amPmIIxs+QdNLnUP
	Lohy/V2rMxam+AVoIYPz2Xp0F+26wp2PxpTiyB0AaBWSQhCROd1oSFwqaky6qBdD2wxywKbSIrw
	+u7GfwAbP+6wFfq4190igQ5uBPK9mQtgEevhk6JZca58blsf2TXrtOOes4f1B1hbZ1ecvMm898r
	Ei9oSVC5yucEK9r2iBzeSoc3BqYT2XAJ2H/aekJue5Ajs7Qpa24TKsKJ7Y6mPGbPVcPmBLxdzLr
	N/bzuPEP1dyS5TXgbw+/Li7GTWnnWYTfdPxdF+5mMCNHTg6HKFYoLeA1WNHMaCGEPPeAho/M7Dn
	CzVDB2mhSQDDygRdAxG2pSXRecTRnUd1RdisI0Q7C3+oo4Iz3UjQ=
X-Received: by 2002:a05:6000:3107:b0:43f:df1b:9e07 with SMTP id ffacd0b85a97d-4515df64297mr10136331f8f.42.1778133023093;
        Wed, 06 May 2026 22:50:23 -0700 (PDT)
X-Received: by 2002:a05:6000:3107:b0:43f:df1b:9e07 with SMTP id ffacd0b85a97d-4515df64297mr10136270f8f.42.1778133022482;
        Wed, 06 May 2026 22:50:22 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a48911sm17657449f8f.11.2026.05.06.22.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:50:22 -0700 (PDT)
Date: Thu, 7 May 2026 01:50:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [RFC PATCH] ring: Forbid using descriptors in two chains at once
Message-ID: <20260507013527-mutt-send-email-mst@kernel.org>
References: <69fc1ea7.050a0220.306431.9eeb@mx.google.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <69fc1ea7.050a0220.306431.9eeb@mx.google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NU9bUIXSx4T_HIo8fcWVIMnLIrU9GI68XUcOMnCX_94_1778133023
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 07, 2026 at 12:34:19AM -0400, Demi Marie Obenour wrote:
> Using the same descriptor in multiple chains at once creates
> difficulties.  If the descriptor is device-writeable, this is begging
> for data corruption due to conflicting writes from the device.  Even if
> the descriptor is device-readable, the mere possibility requires devices
> to use more sophisticated internal data structures.

The natural way to index requests is by using the avail ring head,
not descriptors, though? I suspect it's about device memory being
limited, etc. But pls make it more explicit.

> Require descriptors to be used in at most one chain at any given time.
> Indirect descriptors can be used if support for huge batches is needed.

does this imply indirect are exempt from this rule? the text
you propose makes no such exemptions.

> 
> Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
> ---
> I have not checked whether this will break existing drivers, so I'm
> marking this as RFC for now.
> ---
>  packed-ring.tex | 6 ++++++
>  split-ring.tex  | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/packed-ring.tex b/packed-ring.tex
> index 3ee55a18d024d4da1a48d522e98ea563b9809b1c..8fd5a770c7ca4e6f60911b2861e00a273a69ea73 100644
> --- a/packed-ring.tex
> +++ b/packed-ring.tex
> @@ -473,6 +473,12 @@ \subsection{Event Suppression Structure Format}\label{sec:Basic
>  
>  This implies that loops in the descriptor list are forbidden!
>  
> +Drivers MUST NOT include a descriptor in a chain if the
> +descriptor is already part of a previous chain whose processing
> +has not completed.  This implies that the total number of
> +descriptors submitted to the device, but not yet processed, is
> +limited by the queue size.

I do not understand what is this trying to say for the packed ring.
How do you include a descriptor in a chain twice - the ring has to
wrap around, no?

For that matter, I do not think "This implies that loops in the
descriptor list are forbidden!" makes sense for packed either -
I think we copied it from split by mistake.


> +
>  The driver MUST place any device-writable descriptor elements after
>  any device-readable descriptor elements.
>  
> diff --git a/split-ring.tex b/split-ring.tex
> index de9403882df1e6d20e16ec983ecf0a46d39efa6b..014e279ef1da7653c7051e3a24c6169fe8d51983 100644
> --- a/split-ring.tex
> +++ b/split-ring.tex
> @@ -223,6 +223,12 @@ \subsection{The Virtqueue Descriptor Table}\label{sec:Basic Facilities of a Virt
>  Drivers MUST NOT add a descriptor chain longer than $2^{32}$ bytes in total;
>  this implies that loops in the descriptor chain are forbidden!
>  
> +Drivers MUST NOT include a descriptor in a chain if the
> +descriptor is already part of a previous chain whose processing
> +has not completed.

what specifically is "include a descriptor in a chain"? something to do
with making a head available? and what is "whose processing has not
completed"? something to do with a head not used?

>  This implies that the total number of
> +descriptors submitted to the device, but not yet processed, is
> +limited by the queue size.
> +
>  If VIRTIO_F_IN_ORDER has been negotiated, and when making a
>  descriptor with VRING_DESC_F_NEXT set in \field{flags} at offset
>  $x$ in the table available to the device, driver MUST set



We can't really introduce new mandatory requirements without
a feature bit.


> -- 
> 2.54.0
> 

