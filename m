Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFB21A0BF0
	for <virtio-comment@lists.linux.dev>; Tue,  3 Sep 2024 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725356764; cv=none; b=uH+sFWCXqmMBy4pyOVkaQRu5Tu5J/nx7gMPcvTukc79kRG+cLf2majwQnpucJRJcG4vd3vwryxHjC7wJU3RsOMoNr9oOwoPr6EamFTS9xBCcv/+HS/gIrfeRV7wCSxYj1WCE0OdWwyDDWd7T/T0pYjOJPUonj8z00tG68/mqG1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725356764; c=relaxed/simple;
	bh=mq5aPaPVwqrohwy0a7I1XZTXP0qdfZQLkF+09OPv3lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fo4jyBhJz2KUCjzm7nFKZCtj6h534s6T4C+CeZnfsrnLg+O2ad4dtR5YXJ3DkwWc92Xd0cqxF+iOxJwvb6ryj44ZOdEBSH29lejGAmxHyRCiaghyMZ7DSa7ZsFMNWlBNQREnPqzyVNF2CGbgSqnZPoXJU74OnsNENk+OVq5+ckU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aiXarstg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aiXarstg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725356761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mq5aPaPVwqrohwy0a7I1XZTXP0qdfZQLkF+09OPv3lc=;
	b=aiXarstg5CkSkH+gii0/ztUu08VWm9oDqcsI+EZtWGOUfqe+vni1fWQKBcyFvudRdrZD5r
	Gp9Yiyb+WC4JfYte42Ye6oT5LplGpDMBIVE7bSLNJmqYq3CysW2nsm5XKm7cjO0bYcmNg4
	3SKODz2o/zp0INW3/2esur45f3za9k8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-okFzyEkuOOmS5b1xnQ5PrQ-1; Tue, 03 Sep 2024 05:46:00 -0400
X-MC-Unique: okFzyEkuOOmS5b1xnQ5PrQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-374bb2f100fso1785036f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 03 Sep 2024 02:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725356759; x=1725961559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mq5aPaPVwqrohwy0a7I1XZTXP0qdfZQLkF+09OPv3lc=;
        b=k2ytY/lBkuHHtiFF8lQDSUiWv6eBIVFd+g5yt9qcGMoT9bVsAPDxBWrU1WlGDU3M0U
         89HsnZjpRM0evoGVjdQqiNJLNWTGxQXW2jVQI6YswKnaQH9zgsAgcp5At+QCLCHvPpop
         u0RdHS9D8vniOSA62UDYnabh9Oge9yOAZe1Eb1wBCblNz3fGcQNh62zG8VX2C+S2LHde
         qpJRJtjNYEP9W38P9qakcoNTmGCzdAAR23I395sJc1Xc/LbhdDJnCHdDV+CRHxU+KyIb
         mqwq1C9wyPvmMRuT8Jf4kM4UjANO5zN9Bz9zDOlpdL18xguszyntaUS1QGjEhmmaDMQP
         +GXg==
X-Forwarded-Encrypted: i=1; AJvYcCXN31HLivLJ60g7mZrzhFEiPZTWTaRtl0TT2i8SPiriWUMSlp7eCLmfFk/ISH1UKPgameVsJz/iBSch/7p7iA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKMBs1+JZCoedjwg4WwxLTS/dmEkJd6eg20ybYTG09hOomUcc+
	Ba4cj6IfBiT8o2FktYAREzc6uf7vCXnUVvSqDKbhIWn2Ai/JPHWTUjeuT/h/9+j3OMHFvBu81qK
	1h+nQeRwluWQlW2aMhbenS55/7jS4FdUX65Y9KC4D0GbDiklOSRjPpLRd5XK3aIBY
X-Received: by 2002:a5d:6747:0:b0:374:ba70:5525 with SMTP id ffacd0b85a97d-374c9455545mr4262472f8f.12.1725356759189;
        Tue, 03 Sep 2024 02:45:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGry5gmYWZB3I6nk8e4jo0KCWrKtEk+EPPxXvIiytD9PFtdqM8BD4lZgNgtPhemitW8/kA7Og==
X-Received: by 2002:a5d:6747:0:b0:374:ba70:5525 with SMTP id ffacd0b85a97d-374c9455545mr4262445f8f.12.1725356758362;
        Tue, 03 Sep 2024 02:45:58 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:95c6:9977:c577:f3d1:99e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374bcdef309sm9477029f8f.71.2024.09.03.02.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 02:45:57 -0700 (PDT)
Date: Tue, 3 Sep 2024 05:45:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240903054018-mutt-send-email-mst@kernel.org>
References: <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
 <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
 <IA0PR12MB87133AC3C33E8D319194E361DC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <47b314dc-d8a2-489e-a84d-6670c176675c@amd.com>
 <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2024 at 05:05:40PM +0800, Zhu Lingshan wrote:
> >> Are there any similar
> >> constraining for other states like RESET or DRIVER_OK? Don't assume any
> >> other states transitions are faster than SUSPEND.
> > DRIVER_OK does not suffer from it because it is async notification.
> > A device may start slow after DRIVER_OK.
> > SUSPEND operation cannot rely on such async behavior.
> The driver can set suspend and re-read & wait. This is a common routine in the driver.

I don't buy all this talk about special machinery, some 10 nor gates,
the cost is in the noise - we are talking about cards with several
ARM processors on chip.

But I don't like it that looking at the registers, one does not know
the device state. Hidden state is bad for debuggability.
We have 4 states:
suspending->suspended->resuming->resumed
so we need a register with at least 2 bits.

we could steal 2 bits from status but it seems a bit much.



> > RESET also suffers from similar inefficiencies.
> > But that is because it is inherited from the past.
> >
> > Here a new functionality is being proposed and it has a chance for efficient device implementation.
> > Therefore the request is to improve it.
> sure, as long as we confirm this new register apply for all device status transitions, not only for SUSPEND.

