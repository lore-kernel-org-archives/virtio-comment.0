Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924EF1F9A86
	for <virtio-comment@lists.linux.dev>; Tue,  4 Mar 2025 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741078265; cv=none; b=QXpn5pk24NuK9r+asAlwgVATqRz+2t1/XlPMxhNGeavZfU8/MXBDjzMW3C7b3P8T//qThM9SVeQDRVFwMohr8Q7ByzhFLq4mVFSLDgmdMsvdHwi69vQnE48laLED93wSGUH4mGl6L3GHY7tVVx/Jz9rE4CljHvYONcjEeubZck4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741078265; c=relaxed/simple;
	bh=U7ZocbmT9hF0+C78TyUOi6G9ltg5yNc/vOuuk7dJV3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=p7HrDegTRvBuinm9sYOD5zoow0u5KlH5RLLnbDquwn2NOxrVzvAiL1aur9dKVDRaxyBhEqexQSwOUVtUf6Nsn35NknfLVJqURu6BKaeEURthSfWmd5XTnVtrnKjYB4mzJKJPO4wx5SDq/2V5ljeikqkJjnlox9CbXtlitFhoqho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d6+tuF9W; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d6+tuF9W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741078262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pUXt6X6pAuMZlF7Vlhs0krqZgk/eoEmgPEnBCSI7j7I=;
	b=d6+tuF9WL8FbY4euF8ai5WxR0rrWaU35Io3ANzw6l3bVXfvdhI6Ibd+NIIEtV8CGq4tAn2
	DnoQBwnOej34R905Ey3cipLaw8YF/9TlptxXwL0+EjKyG8UpPSYo0d6v0342sEMQhNrh+T
	Buti6lA/Mz1caJzCmG4c3CMsoyBbziM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-NdbPV7Y3PXeJvM7Vx3cH5w-1; Tue, 04 Mar 2025 03:51:01 -0500
X-MC-Unique: NdbPV7Y3PXeJvM7Vx3cH5w-1
X-Mimecast-MFC-AGG-ID: NdbPV7Y3PXeJvM7Vx3cH5w_1741078260
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43935e09897so39170425e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 04 Mar 2025 00:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741078260; x=1741683060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUXt6X6pAuMZlF7Vlhs0krqZgk/eoEmgPEnBCSI7j7I=;
        b=fqUd2mtucEJzXL5pKQcnblhnmCPdy2ur1Aa69iQ4YvNB4ucBeZsh8dEN5XyFXCPbIv
         EDEcMZYw9O/X3utMga37HJe2KD4oQwmcFJoNj1saNgu9Nmpf/N6s1ov7JRL1dXm7AsQS
         /BK5drOsAlxu41Gyet/ZDpX849tob18tIWYVngW6RSEbMgvotv3FHBb6LjoyWtVjSDEH
         k7G9atppr0lDF487/c/mGPRU3Y57PT92tAMayHFFxuB6Z4r6BbJpUTkmZb4+7Vx8g8TE
         37sWXF7MFBAA3P5CTqRE7VILA0KoMBkMQ8a6Tvpj2H0ONpO/bV4/zQ4Ht3fPmsRrVAx3
         mdgg==
X-Forwarded-Encrypted: i=1; AJvYcCUlB+IZkcVja/yksItEC5n/S5uYpUKRTEOos8L4MLoR1KipzghrGdmfwxgmywmlWtEckJCHKZdk/wdIvvQ3fQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKvDe3JC3n0qFPWfmh2F+6VoNlWH/Nz2Y3Bh6oiFF3N0DqMj2k
	P6+FYFNbYBXzs3LK6vk8AxtUpawfq4ifjWZ1LfFtj0avSKoFQyQaucEHbcwx+KGPsey/q1jYyhX
	TQNFjHtaCPPsjDB+H+CktH7Y2uHxCTkP13xIdlNPRGLuUJCsmOIGcaODJo/Ve7dWx
X-Gm-Gg: ASbGncs86TuuVtd5IyxTu0/9CYuqcz6mYPD6uiJWZW6iBwrwgx+nL+ttcyx7cKJ6rNr
	LKATsflsExBsd5rxYIUYruQJ0brIS4sugvyl9++vPOeUEVJCdmocBWVu8whGDSUTH4SrE2BMRFu
	+BBlaJG2VXY8hxme6iMOsQKRTsvIqgvQYJqIkAIN13KJ/LXghOIpd92AqaB2jMB7nSMTAQqYExY
	rrTn991mtPzOs9PL/zBBvfAKzAm4nQA+Y7VG9L7k84k5OupG9Zu8lo8qKBUglYa59KLKIwddLIv
	MLSfYcFf1g==
X-Received: by 2002:a05:600c:5102:b0:43b:c0fa:f9eb with SMTP id 5b1f17b1804b1-43bc0faff85mr61036335e9.17.1741078260193;
        Tue, 04 Mar 2025 00:51:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnGZdz1ZNMDhP6Dw2tGaqvKXVJLHTy/qIT0Jy+HJ4IRncz6eOEhciTP4cVvrv8EZZ08Kgq8g==
X-Received: by 2002:a05:600c:5102:b0:43b:c0fa:f9eb with SMTP id 5b1f17b1804b1-43bc0faff85mr61036105e9.17.1741078259830;
        Tue, 04 Mar 2025 00:50:59 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1514:ea00:6409:9e94:fe6f:3eb6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bce4313f7sm2796945e9.30.2025.03.04.00.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 00:50:57 -0800 (PST)
Date: Tue, 4 Mar 2025 03:50:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Wei <dw@davidwei.uk>
Cc: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.linux.dev,
	cohuck@redhat.com, hengqi@linux.alibaba.com, sburla@marvell.com,
	shahafs@nvidia.com, si-wei.liu@oracle.com, jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH v11 00/13] flow filter using basic facilities of
 capability and resource objects
Message-ID: <20250304035044-mutt-send-email-mst@kernel.org>
References: <20240604132903.2093195-1-parav@nvidia.com>
 <691016c0-b8e4-48f0-a26b-45296102f501@davidwei.uk>
 <20250303145911-mutt-send-email-mst@kernel.org>
 <8aafe201-db57-4ab0-868e-2216b2d03987@davidwei.uk>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <8aafe201-db57-4ab0-868e-2216b2d03987@davidwei.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iteVyqj9DarMsWZc3UE9FUGk_PwsBjspTauXCJjWSo0_1741078260
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 03, 2025 at 01:34:28PM -0800, David Wei wrote:
> On 2025-03-03 11:59, Michael S. Tsirkin wrote:
> > On Mon, Mar 03, 2025 at 11:10:12AM -0800, David Wei wrote:
> >> On 2024-06-04 06:28, Parav Pandit wrote:
> >>> Summary:
> >>> ========
> >>> This series improves virtio net receive packet steering to
> >>> direct packets to a specific RQ.
> >>>
> >>> This basic functionality will enable Linux ethtool steering,
> >>> and accelerated receive flow steering (ARFS) as a starting point,
> >>> and more use cases in future.
> >>>
> >>> It is using new virtio basic facilities of capability and
> >>> resource objects described later in this cover letter.
> >>>
> >>> Those interested only in the capability and resource object facilities
> >>> can jump in the cover leter to "Overview of capability and resource objects".
> >>>
> >>
> >> Hi folks, what is the state of this virtio spec update adding flow
> >> steering?
> >>
> >> I added io_uring zero copy receive which got merged recently. This
> >> feature requires hardware flow steering and RSS contexts to work. I'm
> >> targeting bnxt and mlx5 for real hardware support but would also like to
> >> add it to virtio. This will be useful for VMs as well as testing w/o
> >> needing real hardware.
> >>
> >> I checked https://github.com/oasis-tcs/virtio-spec but don't see the
> >> patches committed.
> >>
> >> Thanks,
> >> David
> > 
> > Given no one objects, the thing to do is to ask for a vote.
> 
> Hi Michael, how does one do this? I'm unfamiliar with the
> virtio-comments@ list.

Instructions here:
https://github.com/oasis-tcs/virtio-spec?tab=readme-ov-file#use-of-github-issues


