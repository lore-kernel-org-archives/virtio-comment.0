Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCBE4B2029
	for <virtio-comment@lists.linux.dev>; Wed, 14 Oct 2026 08:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967637; cv=none; b=DjW3iZUaDK5xI1WQY9XNqI3N5SWCUAnh2Gk2RIqCODA+wfZ3swf/FixbBfQpTsHnUFN6MgotChkvLc5QEQz64813sFIynLuT+OlclSgcbets+Da+3v3Fexo0O/HulOsJIgwd9UmR46M3lTXfh18mEt3UxJeYdDKlgEDpt9e1V9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967637; c=relaxed/simple;
	bh=6+yVPRWbotgP3CwDL29oVFCIsePFRY/lrvrQspELluM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=adbTALLXKcx2G9AdbRqKiCjLSfatoCAcPhTapg292Ro/mtDKuM+d3lN+cYBN7sskvZiF0iVlrwHvkXoFLpbs01xPmx3RsKWun/8patRUw0p6b1jKdoOWEIQ8+qpdAMAQcfKwObl+ckbd69vqEcegvtS21waurlzW+c5yTXhr670=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dzbMoJ3y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dzbMoJ3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791967630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3C92zCxuUkO4XPOquJpFfBaAJfqB0dZn4yZZcCeNzIk=;
	b=dzbMoJ3yyrlr3MJAJUq5mb3NWGmBDUpn5rzB9uIJOZKkLQIpnnKtjAW8yj984/bUSipgOs
	AB2xMnLPlvCCLuD+2TMnY1kL0bT6aZjWQNaiSm1rS1jx0oN4RDr+sORbvkBpDKI8p3YTXT
	ieCh9COwJ6u+h9koiRX0dXjFSGhGOBo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-ka20pTTUO1uHPgsN1LvjfQ-1; Wed, 14 Oct 2026 08:47:09 +0000
X-MC-Unique: ka20pTTUO1uHPgsN1LvjfQ-1
X-Mimecast-MFC-AGG-ID: ka20pTTUO1uHPgsN1LvjfQ_1791967628
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49febef74e3so45751755e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 14 Oct 2026 01:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967628; x=1792572428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3C92zCxuUkO4XPOquJpFfBaAJfqB0dZn4yZZcCeNzIk=;
        b=biuc0SetKVlpzm7LjXz2Z9wdhG/4m9Fl65TN67xdvOM/0bEME2VpXLlLonJqz5PMO6
         P2vndO++KaKKgMw6FAO40gYR0sH60PUWqpi6Li8eRLdVp8j5E7k7XQBgcow9sFQlYqsE
         LaYL4/2/haLxLNtCaHTtJhTe/h04lZYPXzydW6LK22/DBmJvKx3sEQB97ZKqEV/C9MkD
         3DEstcqMr2cfA8VVEd+OzHOgsY6DbirThXN4WxmISY+ylBIjw3YUuxM9bdY2TinkjNK8
         yCfShb454Y1638+sc1Oqx7GTpELxdWcdViojIm+iKhJWtnrtLNazjnvrXXBEO4tbYiro
         2eaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlpnCnlMszSlS/x5eyVLSLDZEVa6uEnnlRsN/5El0uHYPMiFKmM5J+MP1gJTauphSxrzJMhYCtiFNJFVgi7w==@lists.linux.dev
X-Gm-Message-State: AFq9FYJEy15bSxXyqIMPfT/O9o3RdKQJcMv0tUU6/LKDYmuudR0+dOk2
	PsyfKCxZp6z1PEsma2J11KK3bXXEn9lF+GyHFr7H6Hc3usbzaPAmjNC74OguD2SVV+z9uhGbqiJ
	a0QDPezEBidklu10S5a4MguX3Kj517Dq3L2ZWI5XdVKnszJMhDF99A72kOkVbCZu8FPlQ
X-Gm-Gg: AYBFou1BF7VnhDM7G0zL/S5qVI3Me8nu2Y4K2pujRjuYswaerLPbt0/I+cTA+4/eYzZ
	/Ati3Xa5G1Nc2Sp3U2B9JANjysb+iYIb41h4XcMFq6G8Ge+CiD7hdz7xKDz02o1X8xPJnFjyXqc
	yVsLXyEi5MAICR4KhLaWgaHa9i4Ph4+So6t0W4flrTdV5b2pZOf7xH4ZWBMoJEuijXkm/X2Pr64
	fj9oHHssR9E/mc42B5zaAgKSnsKojl732bPGu6pMw1te50ftYGMESBmW1qiQXg6e7QVml30gIk/
	4bWZWYis1EAP6jCW4nnj/mjuwjCcagfZe0Edw112JO4V86bb5qYJw850j3HGAf03p2O7NA==
X-Received: by 2002:a05:600c:154e:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a18e49ad83mr298406775e9.11.1791967627676;
        Wed, 14 Oct 2026 01:47:07 -0700 (PDT)
X-Received: by 2002:a05:600c:154e:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a18e49ad83mr298406325e9.11.1791967627149;
        Wed, 14 Oct 2026 01:47:07 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be96549sm628280565e9.6.2026.10.14.01.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:47:06 -0700 (PDT)
Date: Wed, 14 Oct 2026 04:47:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Linlin Zhang <linlin.zhang@oss.qualcomm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	virtio-comment@lists.linux.dev, ebiggers@kernel.org,
	neeraj.soni@oss.qualcomm.com, parav@nvidia.com
Subject: Re: [PATCH v3 0/2] virtio-blk: Add inline encryption support
Message-ID: <20261014043959-mutt-send-email-mst@kernel.org>
References: <20260913161628.368484-1-linlin.zhang@oss.qualcomm.com>
 <20260917210841.GD331587@fedora>
 <2f9affb3-0d1b-4469-9a66-ba052d2d1b6a@oss.qualcomm.com>
 <20260922131442.GB18339@fedora>
 <3a933df3-dff7-4ef3-a120-4c6e22c1fcc1@oss.qualcomm.com>
 <de535820-591b-40f2-b840-d987c3253765@nvidia.com>
 <9515779b-a6da-407f-99f2-011e51683d15@oss.qualcomm.com>
 <20261008060644-mutt-send-email-mst@kernel.org>
 <d503aee0-9920-4c0b-b9a0-c08e505cc3ea@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <d503aee0-9920-4c0b-b9a0-c08e505cc3ea@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nqlNnvLAoEwElyKjYGIt2r2WLL31fd5K21OihIeU048_1791967628
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2026 at 02:12:09AM +0300, Max Gurtovoy wrote:
> > Random device specific commands - I am not sure we want that.
> > It remains to be proven.
> 
> Admin vq was added for mgmt/control/admin/non-DATA_IO operations.
> 
> Fundamentally, it does not make sense to force random device to create new
> control VQ since we already defined admin VQs for this purpose.
> 
> We could have introduced control VQ on each device type, but we didn't.

The feature is still pci specific sadly, even after X years.
The instrastructure is just not there for all transports.

I do not think it is reasonable to ask new contributors
to build such amount of infrastructure, where even experienced ones
seem to struggle.

-- 
MST

