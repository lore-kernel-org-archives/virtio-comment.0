Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD84419AD9E
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 12:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725538928; cv=none; b=jexQAQBVNhEZMquljy6PlXKLdzkd3GnYwvJJRPmkYJcQduMTDD94EhgevVkgQhJGK5YsalQyLWDMPgUnLInsf6IR1q4jS+tS4WXXydZ82/VTjXKup2ZgV2qQQHdjsFEFXRvsyp6UHHbrUZjP2aKB2t2PskRSrzjoxqQXeSKs2+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725538928; c=relaxed/simple;
	bh=W7I9NRg5o6E2OJiBvIk8pCsF/NFRLCXEYFlJSi4MCOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=piaTiJIeZJ1F3llpfBjI5DBsq6bJ0GGZK3lLsvSSAdV6/2C7eQfJsjHA5jEuHrTLBLUroZiAhRqOzOYMeb1AhPffqDODUyHxN3Qsoi2QYKp8ur4tP0m/AXyPgLwQWpD+O6HReLhyJ4uhXBv+mQIB9X3KizCCvyGUsBhmUrveIAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g6SkpnNT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g6SkpnNT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725538925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K259Ch1vTOaDkAGxcYlNbl9dEgEL/71iP/PSZmqJS+o=;
	b=g6SkpnNT9SKFIdLdRP0ra7BQ0iGUwZkQDyKkolXBi5kdD9CLF5mCLWe6MZsRhPqKwPhKg4
	l3gd4yebj8Dog48EgGWCf5NmSVmlZ/wkyVe0EtFZ7snElVPOQlJpD5p/afP5halm3q+Yz1
	bLTWhg0GVF3MyndSa1W48G8uc1ilS0o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-hNmz0lCDMvu1-iV-MY7lGw-1; Thu, 05 Sep 2024 08:22:04 -0400
X-MC-Unique: hNmz0lCDMvu1-iV-MY7lGw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42ac185e26cso6234385e9.3
        for <virtio-comment@lists.linux.dev>; Thu, 05 Sep 2024 05:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725538923; x=1726143723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K259Ch1vTOaDkAGxcYlNbl9dEgEL/71iP/PSZmqJS+o=;
        b=Wz304LSPt98t6fZSTd4/7T4QRwdzkj8yqoxjuJdWYD0RtnywB/kjMzH4atBvhO+GV0
         DYmpD7AXObpu8DZZF8buXsWfKuqjec9TuYLOWqgCcieouAQ7SdHMSzpPU3Bv1EJjP7dz
         2lIXfvv+jzL1pSWY3XEYu5cmx6KCPPaFHERa4YuadvTQv4MxKMFMKYiVG9XnfWPxsXaJ
         xOTcHcULu7hRJnFkiwdXAbZgrmwKmx9w85WHuU/KjndwuePOJKDNV2Vpofkl9FBn6idO
         fume+4lWzdcy/4zA1y6t/WYnsIK8YAWE5Y6A3dsO/QRPPZKsm7nBLnXstfTdhikEpinR
         E+aA==
X-Gm-Message-State: AOJu0YxCtVjr1pOfjmX1En36T478nk97TkzFpA9zYbQKYyfFxN4Ta1vi
	KhF2C/biLntBofFqiQ4YD6u+WQ6yqedoYC+2Vyce4YEBNn1Mk7Dwq1jYrXKeMgwnJuKqfYn7R05
	ev6Fb42Aw0Nl+2RuohBhMXMrIj5yS9xvg5tMHUJ73YUw8UowwKMgEDTd7v/ZqiPg1kQ8MKu3h
X-Received: by 2002:a5d:4cc6:0:b0:371:8c06:82ee with SMTP id ffacd0b85a97d-374cd0d4572mr8932847f8f.49.1725538922852;
        Thu, 05 Sep 2024 05:22:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESfKaa21T7RnjxiUaRtucWCJLPj6FmhNHQiZyb+N5FZaKzNAhr9r8y8y+HMIbvCh9eXsoxJg==
X-Received: by 2002:a5d:4cc6:0:b0:371:8c06:82ee with SMTP id ffacd0b85a97d-374cd0d4572mr8932818f8f.49.1725538922183;
        Thu, 05 Sep 2024 05:22:02 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1ee:dac1:384c:40cd:a203:ee4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c08e07b6sm13992340f8f.63.2024.09.05.05.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:22:01 -0700 (PDT)
Date: Thu, 5 Sep 2024 08:21:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gowrishankar Muthukrishnan <gmuthukrishn@marvell.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Cornelia Huck <cohuck@redhat.com>,
	Anoob Joseph <anoobj@marvell.com>,
	Satananda Burla <sburla@marvell.com>,
	Jerin Jacob <jerinj@marvell.com>, "lhestz@163.com" <lhestz@163.com>,
	"pizhenwei@bytedance.com" <pizhenwei@bytedance.com>,
	"helei.sig11@bytedance.com" <helei.sig11@bytedance.com>
Subject: Re: [PATCH v1] virtio-crypto: add ECDSA op parameters
Message-ID: <20240905082045-mutt-send-email-mst@kernel.org>
References: <20240702151500.2280738-1-gmuthukrishn@marvell.com>
 <CO1PR18MB4714E39350107952D4AF1F4ECBB72@CO1PR18MB4714.namprd18.prod.outlook.com>
 <CO1PR18MB471439B64145B57CCBE99493CB9D2@CO1PR18MB4714.namprd18.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CO1PR18MB471439B64145B57CCBE99493CB9D2@CO1PR18MB4714.namprd18.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I suggest you follow
https://github.com/oasis-tcs/virtio-spec/blob/master/README.md#use-of-github-issues
to request a vote.



On Thu, Sep 05, 2024 at 12:16:44PM +0000, Gowrishankar Muthukrishnan wrote:
> Hi,
> Since it has been more than a month without a review, I would like to check if there is any information missing or any comments needed. Please help. Additionally, we need to capture this feature in the specifications to support SM2 and EDDSA in a similar way.
> 
> Also opened new ticket https://github.com/oasis-tcs/virtio-spec/issues/203 if it can help us.
> 
> Thanks,
> Gowrishankar
> 
> > 
> > >
> > > In ECDSA SIGN operation, a random scalar 'k' is used to generate one
> > > part of signature. As this value SHOULD be randomly secure, the
> > > application might supply it through secure RNG rather than relying on SIGN
> > implementation.
> > >
> > > Another parameter is prehash algorithm to hash source data before SIGN
> > > operation on it.
> > >
> > > Current data queue struct for AKCIPHER do not hold any option to input
> > > algorithm specific parameter. Hence, in this patch new fields are
> > > introduced in data queue struct for AKCIPHER to support additional
> > parameters.
> > >
> > > Signed-off-by: Gowrishankar Muthukrishnan <gmuthukrishn@marvell.com>
> > 
> > Ping ?.
> > 
> > Regards,
> > Gowrishankar

