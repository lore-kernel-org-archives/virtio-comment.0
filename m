Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4F584037
	for <virtio-comment@lists.linux.dev>; Tue, 24 Sep 2024 23:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727219144; cv=none; b=t6RY+lixp4jAL3ZE5OtYpic60++kEm7Kh9gdHD1pVqDbXaSF5VLAUDVqR9zAfJFC0s/MELXqwbfRsFsIozSukQaw1VQ4uvH+0RSqBUCVdknugAw3JNfU5W6Uok5WRMRu5VY/5M19cu0p4enV4w89rdTHjjaCHtmGiwtFm75qmzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727219144; c=relaxed/simple;
	bh=pyNpE8mHX3tu1utThq89clqgK6x9EOO3Fx2Y/3IOmwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=chgCZgySdQaW6AcKgmkvtZBLSX8TrFY6cxWt3Dlkrmtn8ztGoixyZf5w6tZUUKub5pX7KHDdvESUY91m5OR8xk2k7KVO3ajrgKxkYkANf9QxkCvSIn4sOzSUaxVfjPXcWFpPSh00kCP76QpcNcLlFx7tISxP9EpOLPzUfC/gB3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W8JD8AYS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W8JD8AYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727219141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CJa1bpPvOi/h6HRRc/DInSeLfs621ZoJxVss/TB/mbc=;
	b=W8JD8AYSchKYnLcxOGu7pVo+k7yuVepKFCBAPE+PApS/hJogOGCo/26hMrzshkG3IsPYn0
	oqqELlq7TvJY9y6oA5Iw6jjraxlgPAF+OPorJmtUp1rswOJ1Hp2ibCDM5ZqvFM763f3D01
	I34+52GPTyg859TxGMnJ/ENcUbvDPhc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-1TxFBJm7MR2SkTj7vVDxgA-1; Tue, 24 Sep 2024 19:05:40 -0400
X-MC-Unique: 1TxFBJm7MR2SkTj7vVDxgA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42cb22d396cso50473565e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 24 Sep 2024 16:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727219139; x=1727823939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJa1bpPvOi/h6HRRc/DInSeLfs621ZoJxVss/TB/mbc=;
        b=NsaD5+2txlicyc2Qx3Z1AmTCk9JGHJYcXmLG0SWTRSEfI74t3O2VC/8a4vGG+rPTjr
         so+Od4xfndIltM+AOpqitzEKkCr5NZ9Tj23ovVvKwvL4MhoGTWM8prTtm4p+6uQ3YcR0
         EyvdLQYiyZPYZQwmJFUr51QAAMPxxDNNcJB2XqzsrKKxjRSAo8YUEtNFadfuvVCATqUe
         Zk/th4c4QIkAjVjyrGx4AkRIvaEq/mMDvArWhaB9aNkdroP1Vusek5/5TLTWwiYq0CVi
         jOwQHGOsdz1LcFHuqkHYNWL7OXKojn0jh0dJ82mkJDjGsGDFX1dYVC5xBYxK9L43fuim
         darQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJOz819RPwB60G1zmmZRmgkDQrMDEeTwg5g9RVaJmodXpKRJIEy9WRmG7idzsAXfybmlQYiB2l3lBjpyj+eA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwFUAQY6J3qBZTaXu3jVG2GH4llGutnpIeZKMpbVzLRmeh86ee
	CNT7ozhnxYPQvU7JX57tqQrIATYdOseLGmJysW/HyLm7tyD19+fNjyL8czVptbd+9mvdyxfMBAP
	zEnLtbZ0JH9lYqCE51kLGieWdct2l6c+JqBmTxyQUREu+2ELj7IYkwHeXUw7Grvvz
X-Received: by 2002:a05:600c:1da4:b0:42c:a574:6364 with SMTP id 5b1f17b1804b1-42e9610d357mr4055545e9.12.1727219138713;
        Tue, 24 Sep 2024 16:05:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMS7GYJP6x+zlElInxeVqtcKgdU10VoztfZvTNI3jqsSsL7FkMUOk94luev0FmpPbC4C6cAg==
X-Received: by 2002:a05:600c:1da4:b0:42c:a574:6364 with SMTP id 5b1f17b1804b1-42e9610d357mr4055465e9.12.1727219138266;
        Tue, 24 Sep 2024 16:05:38 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7405:9900:56a3:401a:f419:5de9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969fbca4sm1484375e9.19.2024.09.24.16.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 16:05:35 -0700 (PDT)
Date: Tue, 24 Sep 2024 19:05:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>, Parav Pandit <parav@nvidia.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240924185950-mutt-send-email-mst@kernel.org>
References: <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
 <20240905024935-mutt-send-email-mst@kernel.org>
 <47b21a27-d34f-4836-9af4-b009001536ef@amd.com>
 <20240905031759-mutt-send-email-mst@kernel.org>
 <CACGkMEtTGHr0+=7X3tTfmXQnfZkbCXv=DqXiBGe54+5JSmETWQ@mail.gmail.com>
 <20240911061712-mutt-send-email-mst@kernel.org>
 <CACGkMEtW1B_8mKMEx8tQTsqRXSZSVmFwD1bkPucyjJt3ctj0Pg@mail.gmail.com>
 <20240912013755-mutt-send-email-mst@kernel.org>
 <CACGkMEvWiNLXCUAXfDox=pz4gWvJWQfScHTv5u_LJqdO3Nmz=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEvWiNLXCUAXfDox=pz4gWvJWQfScHTv5u_LJqdO3Nmz=A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 24, 2024 at 03:35:57PM +0800, Jason Wang wrote:
> >
> > > And I still don't see why
> > > introducing a single new bit in the status brings any new troubles
> > > compared with the existing reset and other state transitions.
> >
> > reset is not a state.
> 
> Well, I'm not sure I get this. Each value read from status should
> represent a device state.

What makes you say so? status represents driver state, not device state.
In fact, driver writes there and does not double check with the
sole exception of reset.

> And 0 is a valid status which means device
> is resetted:
> 
> """
> The driver SHOULD consider a driver-initiated reset complete when it
> reads device status as 0.
> """

It means all registers have their reset values, but it is
not a special state in that device behaves normally in this
state, it does not need to be handles in any special way.

Contrast with suspend where device does not respond and
must be first resumed.


-- 
MST

