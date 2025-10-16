Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5A6328602
	for <virtio-comment@lists.linux.dev>; Thu, 16 Oct 2025 10:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760609795; cv=none; b=Q69/wzZgWByvGf+wbjJGuVGgDQmqM485qH8JlaRXlJEBMPjCcdPDFEsWc3wMchxEiKb41X2f6JNPy8ERVFH6w1r9X/LZRTF+cBbFPfyvv1aOf5iqWSuCogp73fJILou99rg91VoAuVWZoEdhyPk2X+3VUEJyrsHDqUNjD9oHgpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760609795; c=relaxed/simple;
	bh=Q3VMfx1DBKPHN0a3ujAbnrAfQOBlIX69RH96Nelu9KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=QQ5Tm8TxH7+7jaNzSaFf/GJ4UhtBWgpv/97fTH3MYuVA1NVj5E7bbw8RPovx0qdgGWKg8Wc4hH5xqnVpu6SWQelE4RdXYcDNhRVClP/JyRam/MdTwLNwE7mVttcRhZSjVnkKBEqu+nh+7ZzRr4EiaaqDDS13AY5keWak6Lt1eh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G1cNY/9W; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G1cNY/9W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760609792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j1EBciwFxEdcJ+KaiRIs9BGXopFe3yBuqledXRhZohA=;
	b=G1cNY/9Wgj1mGtJAGQbqYFIkgSxUaF6MQinS2TH+uNS/GxoKu3w+kGgFYGLSLB3Ia3453e
	9GHl4vUXVkX9wWt2VKHJHIcseI2rytjifmVJhoZlPhRyN3tgF80h3/dmnivNW5DSgiLRb0
	eWbu+Nobc94cl37kmeu3eEHSz8OchIo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-cT-79TEIMjWMao4YutJZGw-1; Thu, 16 Oct 2025 06:16:31 -0400
X-MC-Unique: cT-79TEIMjWMao4YutJZGw-1
X-Mimecast-MFC-AGG-ID: cT-79TEIMjWMao4YutJZGw_1760609790
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47111dc7c35so9810175e9.2
        for <virtio-comment@lists.linux.dev>; Thu, 16 Oct 2025 03:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760609789; x=1761214589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1EBciwFxEdcJ+KaiRIs9BGXopFe3yBuqledXRhZohA=;
        b=Vj0jbkqnS+Pr8xIAY3ZwxUZfestN0Rdz8G8ptHX0b83vSKNKSEz4akKBB2GYKr5zlQ
         UWx5MrUP93HNJOCGPLb1WJRR+Zy5kcSscM1yUqOJ0L2LpBi0IfxcIgrQ7zl0ZHAj+9LQ
         JIbysCSgk/aNCUzl8rcsaEkzcHgxlPLWlDpp+e2uwmER+f2S0PZy74pTiBkzuhyxMSfB
         6RBpwxDLfKCzdruiXhkURiEOnwUt+2okqUj937/nS9ZdyA2F090qV4U/tvPnBSnvNKQW
         8X8toyOVSfJXblYnICGgCoqRazzoP2AvbHU6j5OM+MAwIAbseTORiuqHQCFxW2R/YT1Y
         kTnQ==
X-Gm-Message-State: AOJu0YzoTk2pb+cUnebd5og1tDT4AGhAY2ElkQHNqKZ1TzpQjemsRxTN
	QjMaaXGsqhbeuyp6T/A4cDO/dNbYrAyIZpQx+S+25wIj/M2xq4U/6UI+lMRwQKYVC1B2Mrc42sQ
	WP8l+VxZe90q1dO7zQyYkVsOj8JXzRn4FzEG+diySTT3uDlQI7aWcPMQtLdihS5Bog+PWvmDNSC
	W9
X-Gm-Gg: ASbGncsYJ8NJ5wemrwXogn33Ho0TQxSedu7xl89orBpOEyCwraVSU5M7cB/zjmJPNTN
	HyYnaLz++tJ+NLSB48PfOp1J6EONSUJwJgEstjf8XvJ9XVv3FNfUUxxITY/Hz4Kj3h4okomOytP
	1IPsKF9osHEZCQqp+nyFFcgLAekL17ofKdGrIyN4kqjl4aXYvaKf9pS5/k357T23yVP23FlkuFn
	3SDck6pE9OV2Tvj6AhOvmYAvvV84WcUs0G/LwNy51giJjG5neFDpe3Pyx7BubtaXTkw9/4WpzH4
	/m5F5XhjaG/xcKsoS/mCae4U+efKdvHFG0lJCNcZOfcespO+C/4vuTk04nyKmHd3
X-Received: by 2002:a05:600c:4753:b0:46e:1d8d:cfb6 with SMTP id 5b1f17b1804b1-46fa9af0621mr242227495e9.19.1760609789549;
        Thu, 16 Oct 2025 03:16:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH477Bcm6rt690qcUrxpGeGUQhNeneETkdGg+JtdUt+/XqdsDxECdGykH0+qkO6Ac7T+EwM8w==
X-Received: by 2002:a05:600c:4753:b0:46e:1d8d:cfb6 with SMTP id 5b1f17b1804b1-46fa9af0621mr242227195e9.19.1760609789146;
        Thu, 16 Oct 2025 03:16:29 -0700 (PDT)
Received: from redhat.com ([77.137.36.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444e3fesm18484505e9.15.2025.10.16.03.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 03:16:28 -0700 (PDT)
Date: Thu, 16 Oct 2025 06:16:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, lulu@redhat.com,
	nguyenlienviet@google.com
Subject: Re: [PATCH] virtio-net: introduce TSO limit feature
Message-ID: <20251016061550-mutt-send-email-mst@kernel.org>
References: <20251014042243.22087-1-jasowang@redhat.com>
 <20251014044005-mutt-send-email-mst@kernel.org>
 <CACGkMEs7Y9DLuRp_3ex8ac3Hv5y7X5Q-PnS61DMjOVjAkvazjA@mail.gmail.com>
 <20251015024018-mutt-send-email-mst@kernel.org>
 <CACGkMEt77EDs4MKo9RSnXRxuVD8hZFca+W3mAxv6sQ3sWN-xZw@mail.gmail.com>
 <20251016021820-mutt-send-email-mst@kernel.org>
 <CACGkMEtJUhH2CTbUfF08=tv0kQGZa3R_KdvwyXZKtxDWgVsHPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtJUhH2CTbUfF08=tv0kQGZa3R_KdvwyXZKtxDWgVsHPg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jmdcdaDcCQvIN4e3IiJ9nJcPOpvHXRq6UHNHW_XCKhc_1760609790
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 16, 2025 at 02:22:53PM +0800, Jason Wang wrote:
> > Wait a second this does not make any sense. Bridge disables tso,
> > it only works with gso.
> >
> 
> I don't understand here, we have used similar setups for a very long
> time and TSO works well?


My bad, I was thinking about LRO/GRO.


-- 
MST

