Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CDC13CFB8
	for <virtio-comment@lists.linux.dev>; Sun, 30 Jun 2024 16:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719766548; cv=none; b=U2DWSYbWfaZFeFrETazdAdhk5BBqbWPiiHnK7PNVXfDAm0UdN2HAD6GrYxiD1xGkUdx1RnrPXeslBLDNtQ9mXUpJaBnGaSJLec5EpXoTDyuz8gMQwb++hNR/Nu+nPORg5YHFZUV6lgsVIFJH+U6hsGTT44A/bkNslpWcPctuTKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719766548; c=relaxed/simple;
	bh=6SdVlnCrStvhUgs/45ZfwryATc1tgdR8Ud+FenGkcCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=dpzp0mDlnmVhSW0WcP3h2Ohuky4WksThJ7YrcbmrTuPu16f90hVcwghHAhyqbOf9hMbx1bPjKh8oP+FtaKGeE82a7oklZR7Lz0Q1HN+0TebGjw3BVKbhq9IrdtHZiFgvxGObELob8zlacG8KIHTOZfVdY6caQReDJZJSdv59iDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A1T/8iHt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A1T/8iHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719766545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JSy8lcFT50/oZkv9DH6I8HXAZObTbajMv4EraNSMsG0=;
	b=A1T/8iHtcf8r0U70rxgj42P20RfQc54ChWPqwj9uBIcv4Le5DHjqiaFQtbNpqIDEkxOKcn
	BG/BIerF+6jwnk8Zn/9ktFwWxpGoNJtHq/Odyovw0B2BNR3BEz9mk/mkz1yoFX7SB5VZQc
	FlVkCvHV8Y8rtGwZ1gcqa23UcS+nOn4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-sl3fcwpGP1mcyJ5nLdiFeQ-1; Sun, 30 Jun 2024 12:55:42 -0400
X-MC-Unique: sl3fcwpGP1mcyJ5nLdiFeQ-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6b51db044edso34608566d6.2
        for <virtio-comment@lists.linux.dev>; Sun, 30 Jun 2024 09:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719766541; x=1720371341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSy8lcFT50/oZkv9DH6I8HXAZObTbajMv4EraNSMsG0=;
        b=r/QheI1t/wR0iXzARFpGMAgBopxtP+E3JpxUh1NIgIq9iLiAhWiFWtK4KUhBAg6HaL
         Pa/VSDuSeRsO46qHMV6M/CsPa1tdha8QSt1+GJ4/yKkC4gyjBFDy1Z/elNjRFr1HOI3B
         Xq5wwNV5Zj34e5cHFvnN7+nJ26J/wbIEPm6fmm59/DsTwz65uBkxKpm3+fGG5Yf1Zqj/
         utqd5kc9YR/SUXOzw8eINgckQZ8IjTgiO4p2z3MMqhPtFgnd+f240zJ5+S2BNVs50SPN
         TUiZzcUTul09DRxeAYepKrFaZtrF4lHBcZcm/c56NBhoURsbg0L26c03HXsXziLvSOsy
         z9dA==
X-Forwarded-Encrypted: i=1; AJvYcCXE8lndwljeUGUkxdL5dcbLN4qBxpl/zo25ItbVAPYyC6zi0rDP+BgboR3kcVjRLJwFiRp3wFZUwKgLQiYpVIu823vT6eMhOjW3H56XVrU=
X-Gm-Message-State: AOJu0Yxasf3KJsBw8466/jlrF/rlIteZqIvAYcOwtOPnGwHIQP3CG81w
	SWMMU61/dw4KvNC6B79jnCJVyiCxo+YpY6SoqQkNOrUmjXCmsC5fMBwETf0K2Dum907RZhZWhVo
	7++rjsWPcbCAmkCeoaeZfZ4PZ8tfa6M+aQUIi0b+UVV1+5vtxEGupIKQuoUmP9Esg
X-Received: by 2002:ad4:5aec:0:b0:6b4:ffca:ca96 with SMTP id 6a1803df08f44-6b5b70cdf70mr45133436d6.30.1719766541360;
        Sun, 30 Jun 2024 09:55:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFoq97G/9gKd03RCFE8t3i+dEn2ZRR66F0s9ZuufUmXNMgc5lcGNaEjyV7pq//XJA/MxRckA==
X-Received: by 2002:ad4:5aec:0:b0:6b4:ffca:ca96 with SMTP id 6a1803df08f44-6b5b70cdf70mr45133176d6.30.1719766540805;
        Sun, 30 Jun 2024 09:55:40 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:346:7728:cff8:104f:5265:699])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b59e57645asm25683476d6.57.2024.06.30.09.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 09:55:40 -0700 (PDT)
Date: Sun, 30 Jun 2024 12:55:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Si-Wei Liu <si-wei.liu@oracle.com>, Parav Pandit <parav@nvidia.com>,
	Heng Qi <hengqi@linux.alibaba.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240630125153-mutt-send-email-mst@kernel.org>
References: <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
 <1718940245.6932242-13-hengqi@linux.alibaba.com>
 <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
 <1719020069.8729858-17-hengqi@linux.alibaba.com>
 <f03e76fe-9ee8-4000-b41c-0b284f2f237d@oracle.com>
 <PH0PR12MB54818CFB447152A25130F9B8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <bca1e5e8-65af-4825-b6fe-2ca3b6c41feb@oracle.com>
 <20240627123732.0cf541b3.pasic@linux.ibm.com>
 <20240627080346-mutt-send-email-mst@kernel.org>
 <20240629084747.1d173908.pasic@linux.ibm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240629084747.1d173908.pasic@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 29, 2024 at 08:47:47AM +0200, Halil Pasic wrote:
> On Thu, 27 Jun 2024 08:35:16 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Thu, Jun 27, 2024 at 12:37:32PM +0200, Halil Pasic wrote:
> > > On Tue, 25 Jun 2024 18:14:15 -0700
> > > Si-Wei Liu <si-wei.liu@oracle.com> wrote:
> > >   
> > > > On 6/24/2024 10:56 PM, Parav Pandit wrote:  
> > > [..]  
> > > > > I saw the need of this proposal slightly differently in the discussion with Heng in v4.
> > > > > The way I understood is, proposed relaxation enables below Linux driver flow to work as equally as without device offering VIRTIO_NET_F_VQ_NOTF_COAL.
> > > > >
> > > > > Flow is:
> > > > > 1. The device offered feature VIRTIO_NET_F_VQ_NOTF_COAL
> > > > > 2. The virtio-net driver negotiated VIRTNET_FEATURES that has VIRTIO_NET_F_VQ_NOTF_COAL
> > > > >
> > > > > 3. Because VIRTIO_NET_F_VQ_NOTF_COAL is negotiated, device is not applying any coalescing on the VQ, in a good hope that driver will perform VQ notification coalescing.  
> > > 
> > > I have certainly understood this differently. When
> > > VIRTIO_NET_F_VQ_NOTF_COAL is not negotiated then the device is not supposed/allowed to do any interrupt coalescing (notification suppression may still apply).
> > > 
> > > If VIRTIO_NET_F_VQ_NOTF_COAL is negotiated the device is supposed
> > > to/MUST do the coalescing according to the parameters as described by
> > > the virtio spec.
> > > 
> > > Michael, Jason: Can you guys weigh in on this?  
> > 
> > I still don't understand why this change is needed.
> > We have this text:
> > 
> > 	The device may generate notifications more or less frequently than
> > 	specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> 
> The less frequently could be understood like due to notification
> suppression.

I think you are missing that there is a separate text about notification suppression
immediately after it:
	A device SHOULD NOT send used buffer notifications to the driver
	if the notifications are suppressed, even if the notification conditions
	are met.
I think that makes it clear this text is separate from suppression.


> > 
> > and
> > 
> > 	The behavior of the device in response to set commands of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> > 	the device MAY generate notifications more or less frequently than specified.
> 
> To me best-effort implies making an effort. Here we talk about
> intentionally ignoring the parameter values. For me stuff like not being
> precise about the counting or timekeeping, or running into the danger of
> having to drop packets because the queue is about to fill up, would
> qualify as best-effort deviations from the specified behavior.
> 
> I believe we want the drivers written under the assumption that the
> workings of a notification coalescing in any device that implements it
> are close enough to what is described in the spec. Just my opinion.
> 
> Regards,
> Halil

OK, I guess we can clarify:
	in particular, the device MAY coalesce notifications when
	coalescing parameters are set to 0.

will that make it better?

-- 
MST

