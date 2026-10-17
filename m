Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07DD15E5BB
	for <virtio-comment@lists.linux.dev>; Sat, 17 Oct 2026 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792243376; cv=none; b=VE0hhpPMmzpYwAxWPA182U+Q5XNq00y8flFJpZWkiTBrCqKy6RQzw3Ftvxmq5But1sq2DNbAUM50gahQp8/j9l1WHcGqWxx7gpVBAfXamwAx2pXnoVZQejJs8uTJA0DFdq8i48G1Yy8Up5QXYW7StltHBtUSrPY1fMORZF4nyMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792243376; c=relaxed/simple;
	bh=JsWa7YPGisY1stCnhYgXRTrZzKweJ3bb4lSmHYTh+dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=HhDGeiPi6w+w8sc5vdVJYPkvis4DhTiL2Bs3UK4gSa9Y/XR0XQ+mAAODeEoZ/HSVwJPMyOQ61lJENdwDEMJ1Vppu5n3EiPZOnpeWQf+4n8+icY67f3HtHnFGD3lKwwlYBnOqQnIIOc8cXTbHVt+uLW6XtaePcRUbjO6PU6o5Y+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dx7+dBcH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dx7+dBcH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792243373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GtUUP4InXaNLse21mRyFlSxYUyJOlphkOnLDI0nkLoA=;
	b=Dx7+dBcH9D9EQjDb1FfNRTd1x2WAyYE+w5ebVVi5wkhjvDpc3yt7QkN1kwzNgFi87J/QxR
	+P/9I1pxpkTRBuh7eXD5E8dShAjTEn2E357QPTXSnjjzcaLj3n4OgudXrOie0lVRMbco2j
	YaeVB9IemR4H/JxbPKReTsDMTJ06lkc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-lWGSXjvwM5uEbVyOGobwQw-1; Sat, 17 Oct 2026 13:22:52 +0000
X-MC-Unique: lWGSXjvwM5uEbVyOGobwQw-1
X-Mimecast-MFC-AGG-ID: lWGSXjvwM5uEbVyOGobwQw_1792243371
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1dcc4f6f4so1527835e9.0
        for <virtio-comment@lists.linux.dev>; Sat, 17 Oct 2026 06:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792243371; x=1792848171;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GtUUP4InXaNLse21mRyFlSxYUyJOlphkOnLDI0nkLoA=;
        b=gKxc1kYWvXB0J+Qm0qlfAJSH71GV20w0cIDKI32+IuE4z0LlHD9VQZIJwzYp9y0vLs
         O1ZUD9Yo3qORHUZqO0T6hJj1yjXdFsHL9zAU5Md32ji19gxqk0XTQxdOWYQIq8gPo0mH
         6myK2g9Q3HhDHm0O1/miDkfiuBys4PkQpZ74dOqJT/40Lie/P89LIFdrXT5EFd27rX1n
         pjRuZv/fmj0AgVNT9WK+fTX6oI4p3/UZVYrk5y9yb5Yj+G/GxaU3L8n6OnzP6z8tdpUS
         KYkMig4b+9LHYHeo4/e6tswksvw8kFppvd+6ekhXmUEUIMecF94lqr9aoh5YdDAXFTGj
         WAeg==
X-Gm-Message-State: AFq9FYJ9X8SQ9olRLUwJCtNTbFV6FZjPxHz01V81JBA9KY38RYQ568Of
	tPO7d1jzsQ8hUVD25TXDIUO4aPhweNvTTocajy00OrJq9mVKFLTawM9hFsbTIwEuQDu9SVi1iK1
	ntqnKr6/NRz0qpetl6h9FInP72raSgrdkhUXpGXlZx2ciRI72BQTzQHC5O3/I56AE69w/
X-Gm-Gg: AYBFou3vlp9kfw3kC/lD0IaKkiAlZk9XsHqC7FlJkw2QA1lMzafhKfn4Bk8OY3ebOyh
	2fbMNpd4CPfNGwa+2TpBLvVU6ZX+xzrgCz9bA2eQ1vLJdNW3lALY3SN5aTGbPg3am7dq8vFFBR5
	Ug5HUjNCU5iXyti4g1PIkps8wQ7Kwul2LCWbaDhkdXEn1ovPBwpqyqzADlvME1947aVWGuGiojc
	q8OKhe9VzSbm481qNQPPRR9izE0su1xxkB1NNmRh5DM1ZVq3nULSrkx+niATZb/bLGb6311Tesb
	6oOSqpBaq86WAKM031l+P7OeIM6bDOSMpVxMIx2qtTDTUC03sYlqPrhCloQS6PJTDD3nBd8=
X-Received: by 2002:a05:600c:608e:b0:4a1:e000:71c0 with SMTP id 5b1f17b1804b1-4a1e0007288mr7367955e9.30.1792243370821;
        Sat, 17 Oct 2026 06:22:50 -0700 (PDT)
X-Received: by 2002:a05:600c:608e:b0:4a1:e000:71c0 with SMTP id 5b1f17b1804b1-4a1e0007288mr7367435e9.30.1792243370302;
        Sat, 17 Oct 2026 06:22:50 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73fb:d100:601d:d7d4:d03f:527b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8af2fcesm143364305e9.8.2026.10.17.06.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 06:22:49 -0700 (PDT)
Date: Sat, 17 Oct 2026 09:22:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment <virtio-comment@lists.linux.dev>,
	Cornelia Huck <cohuck@redhat.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>,
	Linlin Zhang <linlin.zhang@oss.qualcomm.com>,
	neeraj.soni@oss.qualcomm.com, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 0/6] transport-mmio: Support administration virtqueues
Message-ID: <20261017092211-mutt-send-email-mst@kernel.org>
References: <20261017114556.1701355-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20261017114556.1701355-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BbXIWTmD5WdK6USXozdQ9pb7XYgvlWaJXPUZA0rhwgo_1792243371
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 17, 2026 at 02:45:50PM +0300, Parav Pandit wrote:
> Administration virtqueues and group administration commands are
> defined in a transport independent way, but only the PCI transport
> describes how a device exposes administration virtqueues. For
> MMIO, VIRTIO_F_ADMIN_VQ is listed as reserved for future use.
> 
> Group administration commands for the Self group type, such as device
> capabilities and device resource objects, are equally useful for
> memory mapped virtio devices. This series adds administration
> virtqueue support to the MMIO transport. Only the Self group type is
> applicable to MMIO.
> 
> Two read-only registers are added in the unused range between
> QueueReset and ConfigGeneration, mirroring the PCI admin_queue_index
> and admin_queue_num fields:
> 
>   AdminQueueIndex (0x0c4) - index of the first administration virtqueue
>   AdminQueueNum   (0x0c8) - number of administration virtqueues
> 
> Their presence is indicated by VIRTIO_F_ADMIN_VQ, so no new MMIO
> Version is required and existing devices and drivers are unaffected.
> Administration virtqueues are configured, enabled, reset and notified
> like any other virtqueue.
> 
> Patch summary:
> 1. Introduce administration virtqueues for the MMIO transport, limited
>    to the Self group type.
> 2. Add the AdminQueueIndex and AdminQueueNum registers.
> 3. Remove VIRTIO_F_ADMIN_VQ from the MMIO reserved features and update
>    the feature bit description.
> 4. Reference the transport specific discovery from the generic
>    administration virtqueues section.
> 5. Add the missing PCI driver requirement for admin_queue_index and
>    admin_queue_num, which the spec already describes as valid only if
>    VIRTIO_F_ADMIN_VQ has been negotiated.
> 6. Add MMIO device and driver requirements and conformance references.


Thanks, will review. We also need ccw please.

> Parav Pandit (6):
>   transport-mmio: Introduce administration virtqueues
>   transport-mmio: Add administration virtqueue registers
>   transport-mmio: Remove ADMIN_VQ from features reserved for future use
>   admin: Reference transport specific administration virtqueue discovery
>   transport-pci: Add missing driver requirement for admin queue fields
>   transport-mmio: Add administration virtqueue requirements
> 
>  admin.tex          |  6 ++-
>  conformance.tex    |  2 +
>  content.tex        |  3 ++
>  transport-mmio.tex | 96 ++++++++++++++++++++++++++++++++++++++++------
>  transport-pci.tex  |  3 ++
>  5 files changed, 97 insertions(+), 13 deletions(-)
> 
> -- 
> 2.43.0

