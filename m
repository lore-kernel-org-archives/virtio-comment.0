Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490EC2D2389
	for <virtio-comment@lists.linux.dev>; Thu, 16 Oct 2025 06:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760595552; cv=none; b=k+q38IDBKU5/uBf1v2jPaFXZl+81Uem2xyGAnByMFJBwrY+lZk2Xjb2x2Pe13hh8ZfNoRSICe2HWEnxRZXJ1Of7DxxwmYnq56z9LGwecMiMrw9SA75MOZsKyUzIBL18eXkWPes/pHEO+KDU2JcjM78qPUxWWIHLJssCtUoDbQvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760595552; c=relaxed/simple;
	bh=vfghFemiw7HxvFlzdmTKx/5iC3qVEkQzXLVOL0R5JoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=nqpTIOwto0h1FAtMmXt98S9ekU8AcBqd5Gpd2Rh68mrfm+X9lAPlpHVcsNh5DzXx3p0H0oTLxSaM6Q3cDYQLpLEfxWtomdCUKkM9Lf/9Vx7F1yOSPeat+AJfMJjuYmiMr+3WitwTmsNRXFZ5w4jOzwalzlUM3/8eZiI9TvNBLek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hF8s5iPh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hF8s5iPh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760595548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=itzGf64cnIQRh0oSgiqA93w8faqpTeHWXZ5s7ry8flo=;
	b=hF8s5iPhhCwkHfUaxBO5OwymSL1HZs7M3JCKQJEjYN3+mNZEa8vMVjYrG74CEF5FoRnA7J
	XJtsFNCZGn7E7hk+fdhBazlSxTEiEiGGu1HoeNV7RLQpUNUMF+d2J3paZjfvyFKY5s62N2
	DKPaeZaMO0qCFY960+w2dOQyo3rbXh8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-8ehJm6gzOwiMQ-xAN9mSRA-1; Thu, 16 Oct 2025 02:19:07 -0400
X-MC-Unique: 8ehJm6gzOwiMQ-xAN9mSRA-1
X-Mimecast-MFC-AGG-ID: 8ehJm6gzOwiMQ-xAN9mSRA_1760595546
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-426d3ee72f5so284712f8f.2
        for <virtio-comment@lists.linux.dev>; Wed, 15 Oct 2025 23:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760595546; x=1761200346;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=itzGf64cnIQRh0oSgiqA93w8faqpTeHWXZ5s7ry8flo=;
        b=jhkuxfHV8ENpYTpbd0nijW7f+eUJjZ8MzgzWBMhc0evzHENqE6BVS1Ec7JhVOt0v77
         iSdhOEdFEfWuCMpAmI9eP3vbjtdm7tFDtyXyo/C/ifYLZ6Z1diag76/oYqml9trI/5A1
         M0nbmiyJFo4GjuMOBKJNQdqc/bjDr3wz7kfqR56HXkMjcI8RkhZqzCSmbAX/T7t9b04t
         chIZ/zT+joDbbDEJ7/HmbyrfyufnoT0ZKsyTah4h35W9lDEwMdD42GEc7vf88NGeBKtV
         Sk35ots3IirHMkpmsYkbxq0RMWtR04l//K5kqGyIbIQqDroQ5JP9aTIXiwkEum/LkIwL
         AHBA==
X-Gm-Message-State: AOJu0Yy18zhEy5s0YVlmp0xNXPjp1AWnGhWnaSXn4neD8XdM4hOuKgr1
	hEEWrgeSdj+9BkdSqgGUeyXjrIqQ1Y0+cv7zpX1n0rL1Rgbi1XjgkEPTtjG/sfVTYDZu15SbNDy
	wqOU+llA2Zbv7IMM/XVOFagrTd+LTuFkMQEVr8WhuJ8ORKOeLEFaDSQeSqieg+YrPgZml
X-Gm-Gg: ASbGncvSo4WNFqOzGO+7voYqZrAAuq3PCAZFTGLXmjuX5/tKSi03yKtGYWbcLKGDPnf
	HiZaJCmVOLPpOu/9mZ8tCjiVsl5gMw1Wi9p7BaPJMM7HL1XmkALEWH19mc0GUE4i4cjueqJDpS3
	dsJAsf8OpkRNLtbj5idwPJLJ8I2DZLqdDkuc+IfUgGGfFtAjLkybiYGN7xBk5OmPmvmn9lyq5Gh
	GYQthHnqiNo26DgqkAL5t62Y3lUFNvO2w4SJG07g6/lzkMhY3IPfVP8qKlKWIjbGRlyt7fcuNkh
	k+GOdXDQ6dDM3+i6Ry57h3za1boFAMSgr2sNIfFKjHeriaSu6CYi0Xl0cN4LrtVRBvp2
X-Received: by 2002:a05:6000:2f83:b0:3ed:f690:a390 with SMTP id ffacd0b85a97d-4266e7d4413mr19263776f8f.40.1760595545836;
        Wed, 15 Oct 2025 23:19:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg3wt3Rfzp0/qScLwitYYVoENoV1vi8uBI3L0VjJCSSk/y1XHhgE5n6klL4PcjO88CNcchfQ==
X-Received: by 2002:a05:6000:2f83:b0:3ed:f690:a390 with SMTP id ffacd0b85a97d-4266e7d4413mr19263760f8f.40.1760595545261;
        Wed, 15 Oct 2025 23:19:05 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cfe69sm33633484f8f.32.2025.10.15.23.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 23:19:04 -0700 (PDT)
Date: Thu, 16 Oct 2025 02:19:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, lulu@redhat.com,
	nguyenlienviet@google.com
Subject: Re: [PATCH] virtio-net: introduce TSO limit feature
Message-ID: <20251016021820-mutt-send-email-mst@kernel.org>
References: <20251014042243.22087-1-jasowang@redhat.com>
 <20251014044005-mutt-send-email-mst@kernel.org>
 <CACGkMEs7Y9DLuRp_3ex8ac3Hv5y7X5Q-PnS61DMjOVjAkvazjA@mail.gmail.com>
 <20251015024018-mutt-send-email-mst@kernel.org>
 <CACGkMEt77EDs4MKo9RSnXRxuVD8hZFca+W3mAxv6sQ3sWN-xZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEt77EDs4MKo9RSnXRxuVD8hZFca+W3mAxv6sQ3sWN-xZw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ciUEvJ-WLl_8TWYYTsvVXCY-NXYKXBcVQwYu66zySKM_1760595546
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Oct 16, 2025 at 01:46:58PM +0800, Jason Wang wrote:
> On Wed, Oct 15, 2025 at 3:02 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Oct 15, 2025 at 12:29:13PM +0800, Jason Wang wrote:
> > > On Tue, Oct 14, 2025 at 4:59 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > thanks for the patch! yet something to improve.
> > > > I note issues only when encountered 1st time but please
> > > > do go and check all patch for each issue.
> > > >
> > > >
> > > > On Tue, Oct 14, 2025 at 12:22:43PM +0800, Jason Wang wrote:
> > > > > This patch introduces TSO limit feature which allows the device to
> > > > > advertise:
> > > > >
> > > > > - Maximum TCP length of a TSO packet or inner TSO packet when UDP
> > > > >   tunnel is support
> > > > > - Maximum number of segment that can be produced by the device after
> > > > >   segmentation of TSO or inner TSO packet of a UDP tunnel
> > > > >
> > > > > This is a must to implement TCP jumbogram, as networking stack needs
> > > > > to know the limitation of the device in order to produce TSO packet as
> > > > > large as possible.
> >
> >
> > Maybe you can provide an overview of how this all is used?
> 
> Sure, this feature does not implement BIG TCP (jumbogram) itself. BIG
> TCP requires a little bit more to be implemented:
> 
> 1) new gso_type for jumbogram
> 2) when TCP length exceeds 64K, we should mandate ip->tot_len to be
> zero and device can judge from the length of the buffer
> 3) other stuffs
> 
> I guess this is something that Viet wants to work on.
> 
> But before BIG TCP, the driver needs to know the device limitation of
> TSO packets. That is what this patch did. BIG TCP is not the only
> user, it could be used in the software datapath as well. Consider a
> simple datapath:
> 
> virtio-net -> TAP -> bridge -> eth0
> 
> If eth0's tso_max_size is less than 64K, we need to advertise this to
> virtio-net otherwise 64K gso packets will be segmented by software run
> xmit in eth0. We've encountered this in collaboration with mana and
> virtio-net/vhost.


Wait a second this does not make any sense. Bridge disables tso,
it only works with gso.


So what is the actual motivation?

> > I am looking at tcp_fragment and I just do not see
> > where it looks at any device limits.
> >
> 
> It works like a device advertising tso_max_size/segs, and it is capped
> by gso_max_size/segs. The gso_max_size/segs were the ones that are
> used by the stack to determine the skb->len.
> 
> Thanks
> 
> > --
> > MST
> >

