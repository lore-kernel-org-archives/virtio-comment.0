Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354581A0BEC
	for <virtio-comment@lists.linux.dev>; Tue,  3 Sep 2024 10:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725359766; cv=none; b=VkDUx9LIhmFg2I1I5N2MkhSBw2GUKX8kySPzBnqByqv4G49EGD6LmravawsjcEEyJldGqWlyYAkLBWPVwBBduAQdctHU3IALttZL8RSMsM0TT/vrMHOlyGUsKVPQkkcWd3b5hw1GR1Bnr1mUErYrM1PWFDxeqrNo0lq/2lji92A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725359766; c=relaxed/simple;
	bh=uy6S3HF8pFnbnEhtdr0DEUPaxaBzp1dNlzqDyzG+uyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=G63pawoxR7XxWfKNRtp6ASGRE3VuXeR2f2yqZlQF5FdglaZy77CCx8FvTn8/1+kDi729nsGD9WF+7MJL6tOO6clMgmlMNei7585xmIsii8XWqimHLf2/d3ZdgUgcXro4UvA41/kVgMjrGOhDHYkMXPQiAo2ZLJmZZOXIzlMDPik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jKi1aWAm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jKi1aWAm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725359762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b2NJLahFDdDslnCF1x/wLGeFvJ5k5flaspXRrfUZ9/o=;
	b=jKi1aWAmR61Ez4kb0W7RKaPMluQvCm7c/E3bzUYR6q+BdvzxNXNeAYFFjXg0auljkSrS8z
	JCzpAiL8ofneyYhsBmOUNU36cBLnnWi66qCowZheeI70CKFB/QpzPjqcX7vDUKOgIT0pxa
	WrxhSJxJTb81b0BfY8p0NM31/KbMhI0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-j0ta2vFWM2GnjGtvkLRvaQ-1; Tue, 03 Sep 2024 06:36:01 -0400
X-MC-Unique: j0ta2vFWM2GnjGtvkLRvaQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-374b35856aeso2669436f8f.3
        for <virtio-comment@lists.linux.dev>; Tue, 03 Sep 2024 03:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725359760; x=1725964560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2NJLahFDdDslnCF1x/wLGeFvJ5k5flaspXRrfUZ9/o=;
        b=XNuO8i5kyGl1fY4A21AIQxnPZ7C9ii8H7oeW8rTh1txNIuNPEagBBcmOpWeEeLThK+
         YiBxEYj2Xvz6chMpAEEpJdKWR3ZxXQROeQwCVBNzBtGuR+o0Iyl04enztvBLIQ869Fd7
         Gwq6lTtbfia/7ckfUvF5OjWVJENLyFtpMBxZyJlwwYXtG7kEqqG7qGo4vHv9gM7gevOc
         oV6NCVA8yMbI8jy/3axrcnfBIDoVFJXJVOQQbmzFxQSQ69+73TV4vgLF5iBj/w96/lW9
         F+pGlCfKLl9mH4B0x5qwnZ1q1vQZ9/ixt2tUwQfoGJUAUwtWupmNYZs2eY1ylD+sXPY8
         nP0g==
X-Forwarded-Encrypted: i=1; AJvYcCXZ88USC52eMqnttShj8p8XOwsJ8cTDjT4YHKzgrOJ2tEjnmhFkTbi67fk3un6r8NZc8OIOkS8SKxO0cy2aDw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8jpL6lhDl47GXEt+k0IircjQTqrdwqDN+U6OpbYtdYVawbBqf
	xQhu0KddO0oM7imzLmuJXE2Q4F+POmQ2IbT1BozQsEmz/ExRQ02C7Zfx20Et7lbwxtzExuZ79ZS
	6+PbvwXSP31jAONthI24nOJj1E1KIEYZW3TXWDrDB7Adqp4C7Nm7ER6Jw/CSd9LGL
X-Received: by 2002:a5d:51cf:0:b0:374:c9f0:752d with SMTP id ffacd0b85a97d-374f9e39a5dmr1839797f8f.47.1725359759767;
        Tue, 03 Sep 2024 03:35:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhFO2AjPwd6XVj7gpYASQcBTq2/mVDYlS0HmhxJytUsSCg3MAySYuN4yPkAHQte/1h4NsxhQ==
X-Received: by 2002:a5d:51cf:0:b0:374:c9f0:752d with SMTP id ffacd0b85a97d-374f9e39a5dmr1839768f8f.47.1725359759001;
        Tue, 03 Sep 2024 03:35:59 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:95c6:9977:c577:f3d1:99e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4a55fsm13852707f8f.10.2024.09.03.03.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 03:35:58 -0700 (PDT)
Date: Tue, 3 Sep 2024 06:35:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240903063424-mutt-send-email-mst@kernel.org>
References: <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
 <IA0PR12MB87133AC3C33E8D319194E361DC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <47b314dc-d8a2-489e-a84d-6670c176675c@amd.com>
 <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com>
 <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2024 at 10:09:34AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, September 3, 2024 3:16 PM
> > 
> > On Tue, Sep 03, 2024 at 05:05:40PM +0800, Zhu Lingshan wrote:
> > > >> Are there any similar
> > > >> constraining for other states like RESET or DRIVER_OK? Don't assume
> > > >> any other states transitions are faster than SUSPEND.
> > > > DRIVER_OK does not suffer from it because it is async notification.
> > > > A device may start slow after DRIVER_OK.
> > > > SUSPEND operation cannot rely on such async behavior.
> > > The driver can set suspend and re-read & wait. This is a common routine in
> > the driver.
> > 
> > I don't buy all this talk about special machinery, some 10 nor gates, the cost
> > is in the noise - we are talking about cards with several ARM processors on
> > chip.
> They may not respond back under 50nsec.
> How many cores would you like to dedicate and for how many PCI functions?
> And how they can be easily underutilized...
> So, it is not a noise.
> 
> Circuity is the device abstraction that we keep instead of digging down on gates.
> 
> Also can you please explain how can it work without VM_EXIT? You have better insight to this than me..

I don't know which interface we are arguing about here, when there's
a specific proposal, I can comment.

> > 
> > But I don't like it that looking at the registers, one does not know the device
> > state. Hidden state is bad for debuggability.
> > We have 4 states:
> > suspending->suspended->resuming->resumed
> > so we need a register with at least 2 bits.
> > 
> > we could steal 2 bits from status but it seems a bit much.
> >
> This is why letting the status tell the status and control register to control thing is elegant.


No argument here.

