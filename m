Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA7A41C85
	for <virtio-comment@lists.linux.dev>; Thu, 12 Sep 2024 05:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726119893; cv=none; b=XErheSrUh13VQjibaJ61IGoH/0uEj6UO0yMyDHlzj79OrHEjYXXYeJYeEPEi0dBn+jg9VhiAd4GZLMFaBLG0lez+6kobeqZ++3QrYiDzvhgFhqdTWMR/v8lCst58U53MKwrMDRWzJvGdZZQOa/wVvIEuMNUSSJxTq2nqfs6S0Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726119893; c=relaxed/simple;
	bh=t4jMzgxri9wPAq6htrSpXdgDaHhBds44aO0/CYpQtzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=F7FTmZOuFBCcXB0Kuh3qwMKhMuFXs4dXFZldrjtGRD7pfnDiFF5aLsalbDskbrQ82oTM8SHi4Xr8C91nNxnNsR6LiGsSOFItg47GjPjRAvTfmEITjwUB6m+9LLNvhf/By55Vsl4jEzR6BBUQCamb8KMXTaYW6BNaX6BV2RT0xLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PtSVBgGA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PtSVBgGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726119890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LvNALYbyYegcNYIDmmxILm9zw2u2tlYVPODzE0etHKc=;
	b=PtSVBgGA5jSb53Uspfz7CNdknNYK2034G9gbk14YvbdGvYdByW87pJxnxJnT90pqOWgA0A
	WZoE5vmxkiPUd4ZKvAnO0c3tb8T18hfxQqOWqBL8vzONWt8a5UqADFhJwrbZbrYsOS1nBZ
	aCxe6ImrQqNfE1PSkZx/fVab5stwTN0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-Px1-LpXVNpqzHxOEpJI-zA-1; Thu, 12 Sep 2024 01:44:48 -0400
X-MC-Unique: Px1-LpXVNpqzHxOEpJI-zA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42cb33e6299so3091795e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 11 Sep 2024 22:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726119888; x=1726724688;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LvNALYbyYegcNYIDmmxILm9zw2u2tlYVPODzE0etHKc=;
        b=mIGa5yImyUqSVx753qJoscXo6mIe/sJDZJAUeejgU1bZsMmYNm0DQRGr26K4/SqlVF
         BcjJctMMgdeiZ/yeGRE+blUmcuXEDd91GYCyqgWwyOtgZ4Fqr21+rJlrCC3B2/1FOTsf
         ey/OPn88/GTzcYOviIU64YE7ohrXj9x3EhsMAgIA9Qpi3kD6Oix1g7Zf2xTpVDlV9IzO
         CdXjQoC0U9PBZb3N23hU8SLfcwlJwGGAsLBfP0u/qo2dFUGwFF1ovZw/QMLqiHjO+ysZ
         E2BJHiyLsVCQogGpaH3r8nxfcN3/iL5BEQNma7GwRjdC8fbWk2LmrxBZ/m75saoxSup1
         hEog==
X-Forwarded-Encrypted: i=1; AJvYcCUuYHS5nhY7vUaX334c3/bzpGXVc5gGQDx+Hh6aLuVpx3/0mfIUNUpeppj90FmXIYmTl2M8lvhNeLUOVcEuIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxD+2ZsKrf5GrPnmoo4Yu/iTGcKB7a8dhU0WJeXVnrG0/a5QUgA
	yN88LmGcSWkdertiE26GSpxnJY/uIQeCp0QXPHchpqqJfaHRg00ARZ9dUvmJAfQkW7TjjAqPm3B
	fOhGO6ujdQZzHzxuf9sc9YP7C3/p+xE7mFF9wYbxiK93L+lFmyNzAQJz+V0MBk4XG
X-Received: by 2002:a05:600c:5127:b0:426:67ad:38e3 with SMTP id 5b1f17b1804b1-42cdb531b27mr12432915e9.3.1726119887513;
        Wed, 11 Sep 2024 22:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKP3zvZ5v9mWAKJXWGx9DTid4en7iaOWiq4JxzINuCHbf3tdqwxOPGT83NyXU+FYsydDLYJQ==
X-Received: by 2002:a05:600c:5127:b0:426:67ad:38e3 with SMTP id 5b1f17b1804b1-42cdb531b27mr12432695e9.3.1726119886599;
        Wed, 11 Sep 2024 22:44:46 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:55d:cf1c:50e8:cd2d:1a0a:6371])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb322fdsm158075155e9.11.2024.09.11.22.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 22:44:45 -0700 (PDT)
Date: Thu, 12 Sep 2024 01:44:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>, Parav Pandit <parav@nvidia.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240912013755-mutt-send-email-mst@kernel.org>
References: <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org>
 <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
 <20240905024935-mutt-send-email-mst@kernel.org>
 <47b21a27-d34f-4836-9af4-b009001536ef@amd.com>
 <20240905031759-mutt-send-email-mst@kernel.org>
 <CACGkMEtTGHr0+=7X3tTfmXQnfZkbCXv=DqXiBGe54+5JSmETWQ@mail.gmail.com>
 <20240911061712-mutt-send-email-mst@kernel.org>
 <CACGkMEtW1B_8mKMEx8tQTsqRXSZSVmFwD1bkPucyjJt3ctj0Pg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtW1B_8mKMEx8tQTsqRXSZSVmFwD1bkPucyjJt3ctj0Pg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Sep 12, 2024 at 10:05:02AM +0800, Jason Wang wrote:
> On Wed, Sep 11, 2024 at 6:20 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Sep 06, 2024 at 07:51:08AM +0800, Jason Wang wrote:
> > > On Thu, Sep 5, 2024 at 4:12 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Thu, Sep 05, 2024 at 03:12:41PM +0800, Zhu Lingshan wrote:
> > > > >
> > > > >
> > > > > On 9/5/2024 2:51 PM, Michael S. Tsirkin wrote:
> > > > > > On Wed, Sep 04, 2024 at 02:38:36PM +0800, Zhu Lingshan wrote:
> > > > > >>
> > > > > >> On 9/4/2024 2:31 PM, Jason Wang wrote:
> > > > > >>> On Wed, Sep 4, 2024 at 12:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > >>>> On Wed, Sep 04, 2024 at 11:07:25AM +0800, Jason Wang wrote:
> > > > > >>>>> On Tue, Sep 3, 2024 at 6:37 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > >>>>>> On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin wrote:
> > > > > >>>>>>>>> But I don't like it that looking at the registers, one does not know the device
> > > > > >>>>>>>>> state. Hidden state is bad for debuggability.
> > > > > >>>>>>>>> We have 4 states:
> > > > > >>>>>>>>> suspending->suspended->resuming->resumed
> > > > > >>>>>>>>> so we need a register with at least 2 bits.
> > > > > >>>>>>>>>
> > > > > >>>>>>>>> we could steal 2 bits from status but it seems a bit much.
> > > > > >>>>>>>>>
> > > > > >>>>>>>> This is why letting the status tell the status and control register to control thing is elegant.
> > > > > >>>>>>> No argument here.
> > > > > >>>>>> Or, to be more precise, our status is driver status.
> > > > > >>>>> It looks like the device actually otherwise there's no need for
> > > > > >>>>> re-read or poll for things like reset and others.
> > > > > >>>> The need is there for complex device state transitions, which
> > > > > >>>> can not reasonably block a read response.
> > > > > >>>> Another standard approach with PCI is to specify the time
> > > > > >>>> transitions can take. I consider that less elegant -
> > > > > >>>> is this what you are advocating? The advantage is that
> > > > > >>>> driver does not load the pci bus with constant re-polling.
> > > > > >>>> The disadvantage is that it is hard to pick a universal
> > > > > >>>> number.  A combination of these approaches might work,
> > > > > >>>> e.g. a recommended timeout then poll.
> > > > > >>> We've already had msleep() for vp_reset(), anyhow we can increase the
> > > > > >>> sleep time, if it can overload the pci:
> > > > > >>>
> > > > > >>>         while (vp_modern_get_status(mdev))
> > > > > >>>                 msleep(1);
> > > > > >>>
> > > > > >>> We can do the same for suspending.
> > > > > >>>
> > > > > >>> The main blocker for timeout is that it may break migration and
> > > > > >>> complicate the hardening. Another proposal in the past is to have a
> > > > > >>> notification.
> > > > > >>>
> > > > > >>> But what I don't understand here is that suspend/resume should be
> > > > > >>> lighter than reset. If we can afford a reset, so did the
> > > > > >>> suspending/resume. If we want to have something new, that's fine but
> > > > > >>> it should be orthogonal to a specific new status bit?
> > > > > >> I agree, if we want new status indicator, then the new indicator should not be
> > > > > >> specific to SUSPEND.
> > > > > >>
> > > > > >> Thanks
> > > > > >> Zhu Lingshan
> > > > > > If you mean reset, we have a problem.
> > > > > > Specifically, reset has to work before feature
> > > > > > negotiation. So we can not do as we would with
> > > > > > SUSPEND and use a feature bit to expose presence
> > > > > > of the indicator register.
> > > > > I guess the driver can reset the device even after DRIVER_OK.
> > > >
> > > > in fact, unlike suspend - at any point at all.
> > > >
> > > > > IMHO the indicator should work for all device_status transitions,
> > > > > not only for RESET or SUSPEND, it should also apply for FEATURE_OK
> > > > > and DRIVER_OK.
> > > >
> > > > I don't  know what kind of transition is there for DRIVER/DRIVER_OK.
> > > > FEATURES_OK brings with it more issues, e.g. it can fail.
> > > >
> > > >
> > > > > So we don't need a feature bit, we may just
> > > > > place it in the common config space as you proposed before to
> > > > > define common config space for all transport. We can do this for sure!
> > > >
> > > > I have to say, this project is really ballooning out ;)
> > > >
> > > > > Of course another approach is what Jason proposed, the existing
> > > > > msleep and poll, driver knows whether the device is in progress
> > > > > of status transitions because it is the driver writes device_status.
> > > > >
> > > > > Thanks
> > > >
> > > > or just a register for suspend transitions, worry about
> > > > extending it later/
> > >
> > > Is this for PCI only?
> >
> > It's best to add it to all transports. Not rocket science at all.
> 
> I'm asking since I wonder if the "issue" exists only for PCI.
> If yes,
> solving the PCI transport (registers) issue at the basic facility
> level seems like a layer violation.


I don't think so. Suspend is fundamentally a slow operation for
any transport.


> And I still don't see why
> introducing a single new bit in the status brings any new troubles
> compared with the existing reset and other state transitions.

reset is not a state.

> As
> mentioned before, re-read has been used for both FEAUTRES_OK and
> reset.

FEAUTRES_OK is driver state, so can take place immediately

> >
> > > Another question is that, if suspend needs that,
> > > reset would also want.
> >
> > I don't know what does "reset would also want" means.
> 
> I meant we have already had a state transition like reset.
> 
> For example, you worries about:
> 
> suspending->suspended->resuming->resumed
> 
> But we've already had
> 
> setting_features -> feature_ok(or not) -> resetting -> reseted


features ok just has to validate the bitmap, so it
can take place immediately. no intermediate state.

> > Unlike suspend, reset is not a special state,
> 
> It depends but we had a dedicated chapter in the basic facility to
> describe the reset state.

this is two different meanings of the same word.
reset is not a special state, device operates normally.


> > so it
> > does not really require a spcial register to track
> > that state.
> 
> This seems to be PCI specific. Note that ccw has a dedicated command for reset:
> 
> #define CCW_CMD_VDEV_RESET 0x33
> ...
> #define CCW_CMD_WRITE_STATUS 0x31


maybe reusing state 0 to reset was a bad idea.


> >
> > > Or it doesn't justify itself as reset needs to
> > > take longer time than reset.
> > >
> > > Thanks
> > >
> >
> > Don't know what this means, either.
> 
> I meant
> 
> 1) driver knows its own status and it can read device status
> 2) reset may take much longer time than suspend

that is why driver re-reads status to check for reset.


> 
> If we really need a new status register (I don't see why so far), we
> should not only suspend.
> 
> Thanks

it's not a new status register, it's a suspend register used for PM.


> >
> > > >
> > > > > >
> > > > > > Regrettably, reset will have to still be supported
> > > > > > through clearing status just because this is always there.
> > > > > >
> > > > > >
> > > > > >>>>> Anyhow driver know
> > > > > >>>>> its own status.
> > > > > >>>>>
> > > > > >>>>> Thanks
> > > > > >>>> indeed, the status register is there to inform the device about
> > > > > >>>> the driver status.
> > > > > >>>>
> > > > > >>>>
> > > > > >>>>
> > > > > >>>>>> If we need
> > > > > >>>>>> to reflect and control device status, we need something else.
> > > > > >>>>>>
> > > > > >>> Thanks
> > > > > >>>
> > > >
> >

