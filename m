Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E5B192B91
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725520659; cv=none; b=TNeL7LG9bZrjJV5tD+9Rp5vZPS8+qQKFoEoGmmeD3ufQ8H9zdWbJ9icGjA44kslYll36RhZaOjVH4wknHNLxvxLPxI/A282suJyE2B9H8msWy0i7Br1uZK+nsVVYtZwGis1lkb1NBdG86kWwyO6EcwPAWdnIe8CBAUTawcblsYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725520659; c=relaxed/simple;
	bh=0VPW2TkwFklE4K1qaR+9c7pcVGS3qRb53HU2jyquJh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=lznjp9NooxPWZgS4MzoSC86k2dzEWlPnMVUBuTaaJmlyQ3/erxX4+bYMiUqdZ3QcDe5LJ2b6JOp9VkJjSPZjBTxLhItaPQz/h3jAlfCbTanxANwY+cHS8/WqvfQPqavUoKN7S5gELhiHjJPk1Lr0YG6G0ypUWRbW7ek37TBIT1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JXEMMwRH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JXEMMwRH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725520656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J1J4tb7/cyrhK5o/KlIw57mOVTs5vbYAlBeJygCJ2FI=;
	b=JXEMMwRHBp3To8jcs7pWdvBaDDHySzawh9kzzgAvuwWmWjKwT4QrjYndhxOkPeCcovpnDR
	0z6TsWFyUT3LUbBZZWRyxODSqNfcuF3kbyjt2qs2EY/TRCxIijK+c3Qtu+YNBKLJ4m9YLz
	Nbcy7nseCAi6NSG5yAj/17Fa+nBwooo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-IxpxpcrgMKS4soHoxNfXGg-1; Thu, 05 Sep 2024 03:17:35 -0400
X-MC-Unique: IxpxpcrgMKS4soHoxNfXGg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42ac185e26cso3376825e9.3
        for <virtio-comment@lists.linux.dev>; Thu, 05 Sep 2024 00:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725520654; x=1726125454;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1J4tb7/cyrhK5o/KlIw57mOVTs5vbYAlBeJygCJ2FI=;
        b=CG0K7WecQek9WIMnT15/8JeSnQirG9kX6eYNuo51WhMhGfAGyCoa4dsYPTTzGHlZJO
         G0zCSlWpZJgqTi3wZ00hVEddInsWzegiypDHf1qnOD5grWx0iWtiqDM3c+A1gVWvBJsS
         BA7gp0P8y8afBD9D2qyGde356UDwDebeMG5Kl8zRLtnrrggJVEjaGf4SdNDhhp/QLSPo
         HP6hqAEmLXgDZnYNqUbYqdNJkcxOmhf3nGTTEUPZaJA+HFc4kXdzMHldWjqzvcNOzCG3
         +bjuKbYi9cklyfviFRs8953xq+LQt8z8XzoN9PX2SnChGBRsx4UfF2G1EdDFyecVs2eL
         ZyvA==
X-Forwarded-Encrypted: i=1; AJvYcCWUXwgiEACEUomTfw6mehYmap4oqm+mUcRP4G7mMCOE/ZbIG+BhPmE90A7S9HgfA/Se9zMY/VMeSf8vd/qN2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzZpNkhqDiyQ+7/n7l70t1Kpypi7lTodzJXmxiFmh1Jk89Azsg
	SE3n6Aw0uA07BrZG54kh/fw/MgL6+rpAh1fD1GtlyXV0qVzimO4NVcOpySRiuaHnCi81VgllFJj
	1TPhOGnH3lyDh2KjtKNhZIkqrOMHmedAYbWUS8trY+Si2qYu9IQJsNehIWQZJDQjM
X-Received: by 2002:a05:600c:1d1d:b0:426:5269:1a50 with SMTP id 5b1f17b1804b1-42bbb205a6bmr137009895e9.11.1725520654245;
        Thu, 05 Sep 2024 00:17:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCDf9DoTNIORDA3MyqQNuYklt9bzVryC1niFsYX7rAo6si5/ImUVFI26Mb1yAOIDm0NvL89w==
X-Received: by 2002:a05:600c:1d1d:b0:426:5269:1a50 with SMTP id 5b1f17b1804b1-42bbb205a6bmr137009495e9.11.1725520653500;
        Thu, 05 Sep 2024 00:17:33 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:25b:d02e:ab32:7c17:4d7a:fa4a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df84b9sm224263985e9.24.2024.09.05.00.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 00:17:32 -0700 (PDT)
Date: Thu, 5 Sep 2024 03:17:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240905031617-mutt-send-email-mst@kernel.org>
References: <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org>
 <20240903063625-mutt-send-email-mst@kernel.org>
 <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org>
 <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
 <IA0PR12MB8713995E39DD585341C47520DC9C2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <ef72f0af-3a04-4a79-9f9d-c6dd7fb24d53@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ef72f0af-3a04-4a79-9f9d-c6dd7fb24d53@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Sep 05, 2024 at 03:14:45PM +0800, Zhu Lingshan wrote:
> 
> 
> On 9/4/2024 2:46 PM, Parav Pandit wrote:
> >> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >> Sent: Wednesday, September 4, 2024 12:09 PM
> >>
> >> On 9/4/2024 2:31 PM, Jason Wang wrote:
> >>> On Wed, Sep 4, 2024 at 12:03 PM Michael S. Tsirkin <mst@redhat.com>
> >> wrote:
> >>>> On Wed, Sep 04, 2024 at 11:07:25AM +0800, Jason Wang wrote:
> >>>>> On Tue, Sep 3, 2024 at 6:37 PM Michael S. Tsirkin <mst@redhat.com>
> >> wrote:
> >>>>>> On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin wrote:
> >>>>>>>>> But I don't like it that looking at the registers, one does not
> >>>>>>>>> know the device state. Hidden state is bad for debuggability.
> >>>>>>>>> We have 4 states:
> >>>>>>>>> suspending->suspended->resuming->resumed
> >>>>>>>>> so we need a register with at least 2 bits.
> >>>>>>>>>
> >>>>>>>>> we could steal 2 bits from status but it seems a bit much.
> >>>>>>>>>
> >>>>>>>> This is why letting the status tell the status and control register to
> >> control thing is elegant.
> >>>>>>> No argument here.
> >>>>>> Or, to be more precise, our status is driver status.
> >>>>> It looks like the device actually otherwise there's no need for
> >>>>> re-read or poll for things like reset and others.
> >>>> The need is there for complex device state transitions, which can not
> >>>> reasonably block a read response.
> >>>> Another standard approach with PCI is to specify the time transitions
> >>>> can take. I consider that less elegant - is this what you are
> >>>> advocating? The advantage is that driver does not load the pci bus
> >>>> with constant re-polling.
> >>>> The disadvantage is that it is hard to pick a universal number.  A
> >>>> combination of these approaches might work, e.g. a recommended
> >>>> timeout then poll.
> >>> We've already had msleep() for vp_reset(), anyhow we can increase the
> >>> sleep time, if it can overload the pci:
> >>>
> >>>         while (vp_modern_get_status(mdev))
> >>>                 msleep(1);
> >>>
> >>> We can do the same for suspending.
> >>>
> >>> The main blocker for timeout is that it may break migration and
> >>> complicate the hardening. Another proposal in the past is to have a
> >>> notification.
> >>>
> >>> But what I don't understand here is that suspend/resume should be
> >>> lighter than reset. If we can afford a reset, so did the
> >>> suspending/resume. If we want to have something new, that's fine but
> >>> it should be orthogonal to a specific new status bit?
> >> I agree, if we want new status indicator, then the new indicator should not be
> >> specific to SUSPEND.
> >>
> > Sounds good to me as long as new functionality does not force the device to react in 50nsec.
> > In the current state it forces the device so please upgrade the proposal as Michael guided.
> Trap and emulate is very often in virtualization, of course the sooner the better for emulation.
> But there are no 50nsec assumption and no one can force the hypervisor to finish any emulations within
> a certain time 

The spec should not assume devices are virtual, there are baremetal
deployments of virtio. In such setups, there is no one to trap or
emulate: driver must do everything itself.


> > Thanks.

