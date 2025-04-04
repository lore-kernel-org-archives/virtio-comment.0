Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D770191F95
	for <virtio-comment@lists.linux.dev>; Fri,  4 Apr 2025 08:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743754177; cv=none; b=IYoq9jZg03ksHQrrWBT/ZuJKisPOqHlwsOKJshY8UBQByvoxyvsARDOmZquPx3YmKMKlj62syeMw99c6ISdEgpQoj4j3QONTxvPF48Rzdpd0poC4pxiUczPzHhqQbK1zsc87s/U7FzrLH0zpRfcgcD2Z2S3IjJwT39H1cqJlX5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743754177; c=relaxed/simple;
	bh=yV9gySGcz9nCBmFuK0MGbtvEcssL7765LlB8XkROYxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=m97Q7qNHjx3gjC1iV+8YsJkp4velM5axaHlCfBIPLebSUwErZJgB+f/QLKRXLEuL3A9GSuG84YxmF3sVnSNXLzKJITAJejHVsoQGlG4qmHT1uojL0Hli+PVmviEZAO9vaqjEZiNPcPco4/dQLwrWOxvanO4UyNbIIVqPx29Vc58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gJxLxyWo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gJxLxyWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743754174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yV9gySGcz9nCBmFuK0MGbtvEcssL7765LlB8XkROYxg=;
	b=gJxLxyWogRh22yA2L/eybZXCNywusMWErQEp2JRDY+t9O1B467IQMacW9M8aSzreCymJGu
	2vxCj+mCFMkWJAkp7tvf5w8mfrRY5dgauEeg2ncJvW9HUd8uLijoh3n37QyUQRw+DthrmB
	DcsK3NcrEhfq3kwaX3adm7xxVT/6E5M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-tQatXJ4zOAaSSQ_j0Z1ZMA-1; Fri, 04 Apr 2025 04:09:31 -0400
X-MC-Unique: tQatXJ4zOAaSSQ_j0Z1ZMA-1
X-Mimecast-MFC-AGG-ID: tQatXJ4zOAaSSQ_j0Z1ZMA_1743754170
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-399744f742bso556248f8f.1
        for <virtio-comment@lists.linux.dev>; Fri, 04 Apr 2025 01:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743754170; x=1744358970;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yV9gySGcz9nCBmFuK0MGbtvEcssL7765LlB8XkROYxg=;
        b=nZ4NzDkpggo1sJ9Ja1hNORVD3fHK1rNQF4IWwE4cK78Cwz0iD2+pvRg25KWiLjpmt1
         yckYTpaZh+tay8FkaZ+CZAmYrnRfDG++mKeRwZ9zAEO6rgSNX3uh4f2YDVQmPIXY89Ip
         moq3tgBi+Duw2G/TlvRmjSLBMPNYdquowoINA1lN5ygHu42zNKIfygsJeAdG8bNzFjke
         r6U42+eS9F4tcMzuD7pFADJCyOHstbvW0ROW44T9xHdyMR4acfO0XJquQPr5mPY8wTgU
         bxfHS4c9iOqsnhtxOnOXrXFqswnx3Ge7oxIJfUsETfEhvWzFFZALvwagj/lo6vZezLXV
         V/JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIzbfvkrRluodZghaD9IiXVQe+4gyswhsYF4GIe3CWuNCucaAAcnGT3sZP0O2UkN5X2ipl7KvhAd7ab8UE3g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk2L7Nizxh1ejigIeq3GhKie7BOyl1+oKOLzHfyt7+0D7AWkIV
	pA4kt5/mry9Y8IUKfSrAcMo3ol8eJljEE3gONKbLU0iUVEvz2PWqs1pfWshZTYL6uLtfGgR5iz5
	mwL6I/NGO0FHGIQdwgv3xAfR/qLz+4ueAD5umdX3nHLyP0YIvb1UYxZI7zc1q7kiF
X-Gm-Gg: ASbGncvOO6Ulxy94bGYG3wSF7tKSE+K9znNQkIyAh7YcslYlo6ECPQuIrN1jR5goa85
	v+OFXN3KIrHsPgHdmUFi8hcmDB0uSKGhcLWkThAmcubUT1j9zNW0Zx3LzwxFKsMiGV80CHUm5ih
	LaZ0SV+71K+UYUMPmNHya7n2+zAAqbA8aLeiutkSaqmiqbROSneUz+F1qWEKcM0H11YGhAoKBRU
	EfrPbibBteXlg2/OGneNpaZVtM1YOZ3YT9tbB+i3YH/bqfXgLQ8RPEFEo+n1x6WiEmoos9PhbDq
	efDNeZJr3w==
X-Received: by 2002:a05:6000:144e:b0:399:7f2b:8531 with SMTP id ffacd0b85a97d-39cba9776d4mr1803218f8f.38.1743754169880;
        Fri, 04 Apr 2025 01:09:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG754OrlwhFHNx9bSdDp3RVe9BAdUN8rbNKS+RMhtY4uj+i5/0n3q6iyPufdrVkEsaxkLy08Q==
X-Received: by 2002:a05:6000:144e:b0:399:7f2b:8531 with SMTP id ffacd0b85a97d-39cba9776d4mr1803184f8f.38.1743754169540;
        Fri, 04 Apr 2025 01:09:29 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c300968cfsm3779154f8f.16.2025.04.04.01.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:09:28 -0700 (PDT)
Date: Fri, 4 Apr 2025 04:09:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>, virtio-comment@lists.linux.dev,
	Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <20250404040838-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <Z-43svGzwoUQaYvg@infradead.org>
 <148a3c8ee53af585b42ec025c2c7821ad852c66c.camel@infradead.org>
 <Z-46TDmspmX0BJ2H@infradead.org>
 <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
 <Z-99snVF5ESyJDDs@infradead.org>
 <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M8eAXHEaNYehu-VxUu7fIMredKzIQxI06Yfn5y-nHdY_1743754170
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Apr 04, 2025 at 08:50:47AM +0100, David Woodhouse wrote:
> What's annoying is that this should work out of the box *already* with
> virtio-mmio and a `restricted-dma-pool` — for systems which aren't
> afflicted by UEFI/ACPI/PCI as their discovery mechanisms.


That specifically would be just a driver bugfix then?

