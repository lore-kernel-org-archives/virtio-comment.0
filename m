Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B58746AF
	for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 11:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716462082; cv=none; b=CT+NinzhLi37yStGjdtpzBZ/FURbIngfama6CdTRPb54BZjgSyZ36aoyp8Yt9jZs1m5858Jjlj07ThZuiDkiJpNvBlCoxAqC1wOdSLW/BSDWMCBL85FcdyhXaQ3jxP2ZRothJfvX4XuraGTIrPjTIkXV5uidJi0SRcQNvJwj+a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716462082; c=relaxed/simple;
	bh=QKVdrD/gR9ISPIYcscOPURJjUwp8hfj10wJq0bxOJE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gOZXuPuHIzShQ1d7qciZa96GnP+EWBH+CqTjsZgziZfiqq4Fr9JsLj3HVPzpWFNNCzigCIpLs9WiiEzfghV/nRKt3u1qCKEJqaKPxemqiZda6ClYYmh2IfnoBeKQTVQBHBbau1eiP2ksWL734mHd5yIdeir2X7g7KXDPrfOfYvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bZvFbvSA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bZvFbvSA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716462080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NP2ra1j0AXZMzI2eI20I7q9OShz7/zWDwo5zggJTN/k=;
	b=bZvFbvSAnARNrPUlUTwvSegM7F314Y5eJnIh/W418PTfU/fxovawpcEoe34yVjcXaXpFV+
	8PpLTdpPy7NKcFbC66PuqMoXKnQdFeBfJfLZcBkJMN/iPUwuAWnAvjGJPFY1DUlWJ2uezo
	TcIfrEp8+K2ofhage5hhEHUXr3apxpA=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-cS1ypLQnP2mWsoo07HhuGA-1; Thu, 23 May 2024 07:01:18 -0400
X-MC-Unique: cS1ypLQnP2mWsoo07HhuGA-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-24c5dbf4d0eso1102331fac.1
        for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 04:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716462078; x=1717066878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NP2ra1j0AXZMzI2eI20I7q9OShz7/zWDwo5zggJTN/k=;
        b=Hry8kSpZfOCUA+S0u261COdClOlimkJResoDb1+QZCCLo3ifN7pLPbcyHbExBOLMBS
         Gj756gWPG0CJzHUAUGekAECVlOxBbEOKFXSKTGnakxnlNZERbEk3geaQAdX+9mBHXEP/
         Y79veyUSqQdeUMAuWHSfHq0heJCiHsUUNwqyOteVPbBaw/tPGgJUs1VCfUWHhAVVu5Ap
         ZVHR6Opbbiise3gMP80W7l3ObNDyUmOAODpDAP5oz2c/HxCguRN4098GncGsBt6wPHE7
         igjuhKMny+NrDDpnA2bpguhAIgKMtyP1w+WT1zn7HicpbwpKQTJg31qMx0ldjJJKOQOj
         4o8w==
X-Gm-Message-State: AOJu0YwnkWNMexJ+v/FgGhkXUCKk7wLxAxqnvqfOjUf9Smgh+0RcttFT
	nX1Mi5UpYttzNvmtqCUVr/KVD1SbWDk8/M6W/lS2BiX2qSBY6+vQkkwA/QnGxqqbvjs8hFZPQXV
	YqkIfXn/e2uRj8XWm6AN/C+yDH3vJLCxalyBLONCW42o0O+XBre2WCCZL1GJ0O+0O
X-Received: by 2002:a05:6870:b156:b0:23f:ba54:5f41 with SMTP id 586e51a60fabf-24c68a5e625mr5145972fac.1.1716462077737;
        Thu, 23 May 2024 04:01:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7o8JZjJr/6XZOCOxx9laPFNXg3ABonUpNGpSDeWC7mFTeStKYHk/CltGdJkTrPlthzcQjUQ==
X-Received: by 2002:a05:6870:b156:b0:23f:ba54:5f41 with SMTP id 586e51a60fabf-24c68a5e625mr5145949fac.1.1716462077493;
        Thu, 23 May 2024 04:01:17 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-109.retail.telecomitalia.it. [79.53.30.109])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43df54b58c0sm184775191cf.9.2024.05.23.04.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 04:01:17 -0700 (PDT)
Date: Thu, 23 May 2024 13:01:13 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com, 
	shahafs@nvidia.com, Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: Re: [PATCH] virtio-blk: Fix data type of num_queues field
Message-ID: <hqicqs6p5h4r4xcdhmathfiegvcaly76ityqe67erj7c4b65ck@d2n6v53is5ya>
References: <20240521122119.2004071-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240521122119.2004071-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, May 21, 2024 at 03:21:19PM GMT, Parav Pandit wrote:
>Correct the endianness of num_queues field to be little endian.
>
>Suggested-by: Max Gurtovoy <mgurtovoy@nvidia.com>
>Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
>Signed-off-by: Parav Pandit <parav@nvidia.com>
>---
> device-types/blk/description.tex | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
>index f04c932..2712ada 100644
>--- a/device-types/blk/description.tex
>+++ b/device-types/blk/description.tex
>@@ -108,7 +108,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Block Device /
>         } topology;
>         u8 writeback;
>         u8 unused0;
>-        u16 num_queues;
>+        le16 num_queues;
>         le32 max_discard_sectors;
>         le32 max_discard_seg;
>         le32 discard_sector_alignment;
>-- 
>2.34.1
>
>

