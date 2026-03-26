Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0848B37A48A
	for <virtio-comment@lists.linux.dev>; Thu, 26 Mar 2026 23:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566848; cv=none; b=XUXl/nFhaOTTnYSsiL4O4YUuUC0PzAAG6gu14YBno6lNXkUI+aejrOToU7chkca0oG6EczWhoD6k2WX6hlvtOvy8Gyy3mDQvrSuaRUq17yoMUVecj97nkn/2bJzb0FmfRZQZtmVa2oRzXppWVwHWPz/EVNea3WQUYiueJKU1zho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566848; c=relaxed/simple;
	bh=zdYh6xKfZbMXRJg91NYBybDTWRhguB4b85cFVfndzjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=mdeBQaBCG/S/U4fprB7fy2N90Ijjjc5IraqkbwDZ0DzsvMl5TPsT1t0Yso77niqGLuFk3gdt+efDWGpVX/JPmbaX4dqUF++mRM7v3mgMJd4+gUbjwFC8hVuso9RUwbI7I1WzL5gcJQpt2/cx6VkYvzeUyPca2XxhTEsybPrFEIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CK671I2W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CK671I2W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774566846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s+ifnAIm5l1I+GhYCwnt9SGw9dmqlq+YIS9sq/DYnew=;
	b=CK671I2WoPN+EfkXQp4cuJaccYOYJEUz3qdN5Ch1CsRVOQ6TPGkEFKdrDdrGOrDC+EFP52
	0an2CIK+AEn8fxyFNgWqPX77+uR1JWe2u7HpS8VrclxJgDa1N+oYLjY/Kc1fz/92oGT8it
	95RpDPi9Gg+PqdbwKNaDfoNxGs+Nchc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-fnpYGLh0PF-8b6RKK4iwig-1; Thu, 26 Mar 2026 19:14:04 -0400
X-MC-Unique: fnpYGLh0PF-8b6RKK4iwig-1
X-Mimecast-MFC-AGG-ID: fnpYGLh0PF-8b6RKK4iwig_1774566843
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4837b6f6b93so15718355e9.3
        for <virtio-comment@lists.linux.dev>; Thu, 26 Mar 2026 16:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774566843; x=1775171643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+ifnAIm5l1I+GhYCwnt9SGw9dmqlq+YIS9sq/DYnew=;
        b=X4GLVDXK5LngdYzD5nBgSP4gieTaFe/OOGFwE7Be7jULFf18hYpGTNFnz4sLpE6lA9
         6fuKd4WVQPZZbTXDlKvtYGEEcFsA3uAcqK/JXmU1lH8WfcajdflXXFhiV4BcECCEY77r
         HuFJ2vEdzpGnTKc9b/evtnf1FIVy1BbGcqY5oNL+/Fhyv17l4ZXbiNTAFyXyrS7ihxnx
         MT4VOrcjpBPOFmbDs9iJ0g5M8oQKFl6cDWQoXq4Jjuvq3HNSdVvPXe78xdTJ2auIos/k
         qEYOLeK4n3Wv31/xIZWVv9te0yoSXxsPU7f5x+XkX5FRrMLIdK8VXpQJHpJKAAXkaSpf
         6XwA==
X-Gm-Message-State: AOJu0YxAXwKYfdVTjKEbeng3DDkSsFBMkkXw/tLjg5HTZRmLive2f/0W
	no0AatugzNyBUHYrA4iiBdJK9UnpJXlX9ZL3fDa91KMEzAULFAgKP1qm20d/oyhkuL/PBpS831Z
	TixbwuzjhMyc51muDbXzzq8wc54sqbnMmZJ1UtMvyBpaKW7oyW9A4AYGXDoeuoaVnWrqZGCZYzU
	Ep
X-Gm-Gg: ATEYQzz1E4TH7VP+MX7BwE/evsbhisY7KT7osNlrfno3BGaChsXqvc4/PyPF9Txc4Ia
	CDTgaSMWRvHWE6VeRNlzEF9PvBtncutWJrWf5Z4GUpVN8iuGVkPTmh0kTRybTsFVJamHC8rWnDE
	WrA2JRNbj3bct+HkGZFzUGi/fmjsJkeET8HVpewZodrhnugiYnb2QdQjv8oEGNmKVeSYpJ62wbb
	NhSHvY+QZj1KOxlvkCp9N9YYIrSAnnH6RBZ54pD5iZBA/MukrLm7TGX8kHF0SnBGS+VYQiCUHSB
	dGGoE4e3l1Ji4Wr7zghl2Ymmmrw0DhRJU9vsQseoLbZR86tQYiAz3dN/6uo3oHg6jYrohu3TBlj
	V/mGSl8xoULF+V2kT
X-Received: by 2002:a05:600c:4f91:b0:486:fb69:4960 with SMTP id 5b1f17b1804b1-48727edde49mr5786145e9.19.1774566843017;
        Thu, 26 Mar 2026 16:14:03 -0700 (PDT)
X-Received: by 2002:a05:600c:4f91:b0:486:fb69:4960 with SMTP id 5b1f17b1804b1-48727edde49mr5785805e9.19.1774566842508;
        Thu, 26 Mar 2026 16:14:02 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1525:da00:3ac2:1a22:72ff:4256])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722cb0d83sm54424645e9.13.2026.03.26.16.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 16:14:01 -0700 (PDT)
Date: Thu, 26 Mar 2026 19:13:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Hilber <peter.hilber@oss.qualcomm.com>
Cc: virtio-comment@lists.linux.dev,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH 1/1] transport-mmio: Add v3, which polls for reset
 completion
Message-ID: <20260326191118-mutt-send-email-mst@kernel.org>
References: <20260204115022.1930-1-peter.hilber@oss.qualcomm.com>
 <20260204115022.1930-2-peter.hilber@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260204115022.1930-2-peter.hilber@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xJtjryW2qeTrMx9fVg_c1W-EG2cWYKbg5swSQEcyKgg_1774566843
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 04, 2026 at 12:50:22PM +0100, Peter Hilber wrote:
> Let devices using the MMIO transport avoid stalling the driver (virtual)
> CPU during device reset, which requires introducing a new MMIO transport
> version.
> 
> Unlike the PCI transport, the MMIO transport does not require the driver
> to poll for reset completion. This requires a device using the MMIO
> transport to complete reset during the write of 0 to the Status
> register. Device reset may take more than 100 ms if it involves
> terminating ongoing device activity which accesses driver memory. When
> the (virtual) CPU writing 0 to the Status register needs to be stalled
> during this, this may violate real-time requirements (including those
> for hypervisor trap-and-emulate).
> 
> Address this by introducing a new MMIO transport version, v3, where the
> driver must poll for reset completion, and, hence, the device reset does
> not have to complete during the write to the Status register.
> 
> For clarity, also add some related requirements for v2. These
> requirements are implied by the rest of the specification and therefore
> do not alter the v2 semantics.
> 
> With MMIO transport v3, reset essentially works as with the PCI
> transport, and the change is therefore not expected to cause problems.
> 
> Existing devices with MMIO transport v2 are not required to implement
> v3, which will not work with current drivers. Drivers have to support
> the MMIO transport versions of the used devices. Portable MMIO transport
> drivers should therefore support both v2 and v3, which is simple.
> 
> Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>
> ---
>  transport-mmio.tex | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/transport-mmio.tex b/transport-mmio.tex
> index 94a93a1..6504a6b 100644
> --- a/transport-mmio.tex
> +++ b/transport-mmio.tex
> @@ -64,7 +64,8 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
>    }
>    \hline
>    \mmioreg{Version}{Device version number}{0x004}{R}{%
> -    0x2.
> +    0x2 or 0x3. With version 0x3, the driver waits until it reads 0 from the
> +    \field{Status} register before considering a reset complete.
>      \begin{note}
>        Legacy devices (see \ref{sec:Virtio Transport Options / Virtio Over MMIO / Legacy interface}~\nameref{sec:Virtio Transport Options / Virtio Over MMIO / Legacy interface}) used 0x1.
>      \end{note}

But this means there's no way to support existing (non polling) and new (polling)
drivers both in the same hypervisor:

        /* Check device version */
        vm_dev->version = readl(vm_dev->base + VIRTIO_MMIO_VERSION);
        if (vm_dev->version < 1 || vm_dev->version > 2) {
                dev_err(&pdev->dev, "Version %ld not supported!\n",
                                vm_dev->version);
                rc = -ENXIO;
                goto free_vm_dev;
        }



Don't we want to?



-- 
MST

