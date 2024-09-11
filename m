Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636CF1714C7
	for <virtio-comment@lists.linux.dev>; Wed, 11 Sep 2024 10:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726050045; cv=none; b=uiYMyhrbQj7NITCivkBBvlxTi3skbxtUzzc9LYnB3bHW45PLOGB8VjpVyLPGZjvMk9FqPD0aphLr5b5HlQ9CYOG46291+pxW2sXSGF7jF4mi7ZiVjTeF/BLKq2PxUY3dw9Uss05v9+UKGyGt74KhHJvEDjkDnNgt10rAm2LAWE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726050045; c=relaxed/simple;
	bh=fnfm1+e9rvg9eLuI0A6PeoaUzR2pOaZ/BlI0XgExg/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gFyi5nRooe1vCgvo4QRNShPsk//A013ifDmAkMBWuQtbpruCQPhzUNB5RTvirOpEFPxYP1GYtExmtlOLojvBYf/UvKLj1T3Lyhw7iAHVA4dVZaxWcRtuuw/UgcJWiBoQC+DAaTkfCCFzbs6wJkzoaZZnihAwO0UtpM84LTOoIZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M73v1ps+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M73v1ps+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726050042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tq5tOfvyaK0GMcIqUvy7qH5ljji+K7i/LZ+PC9vV9vs=;
	b=M73v1ps+gMHNxvZSLAm49bxn3rCNmGzqh+Bl0nf+fupcyVEmL5OW3pDq5dXt/8im1hmwvG
	gRxJimZupGJ9pLxKU4N98b4k9cLPj85Pc2OALJdgSOm8Xgmv1I6/bc21iXtJ61W8yXSWvr
	AUl5N8rnYKqzao/poJZCbdX6utVpQO4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-QpZ9UrHhNji86_WUJL_Ayw-1; Wed, 11 Sep 2024 06:20:41 -0400
X-MC-Unique: QpZ9UrHhNji86_WUJL_Ayw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a8ff95023b6so91923866b.3
        for <virtio-comment@lists.linux.dev>; Wed, 11 Sep 2024 03:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726050040; x=1726654840;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tq5tOfvyaK0GMcIqUvy7qH5ljji+K7i/LZ+PC9vV9vs=;
        b=YnERd9J7Eu9ZE3oOhjFl7o2s399paQmW56lOKrfA0q4tWlsJV2V5T3BPfdxInBWOK+
         8EyRyhgIEG7uT2iHKqaWk3E1YdaEiaI6hpHRJA37GrtZ7LCIXSXrTcHEZMFePST71IfZ
         g79Ri3ZoGWckMQb5Ef8oHM1y1ATOu4wxcYqtfVuE0cPt8G5F2aGr0u+yLC6B8z2yWaPh
         5fVNtkpFs671Gqm8HkRhcY3v/I/oI9ZlbP85zw3FQErq5zwgOj5QrPl2oZSgF0zw6cM+
         105pc2kZFXUJM6xJILVutLPRMF8tWYSmtzsKrC3iVVaHvDWGD8fNB6vHqRNMsNhEeska
         0AzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhVkl6DfQuDT/SfQn3z3/XfQCnRT1cx4CaIYboDO5DLJ3Ls721dhvN94yZbrtNBxnLJBHGqjihOICbPvQ/tg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvTH/1JhmumWBi/KlFBBW8I9gffOhATrAgYnJ7vFqsno0sLFTv
	FcwTu/BKWv9AaYTnLCum6uCik33pQGY/TQEmYuQRcAP8N7Rx/gXzRQR4PDAvVNC3961o71syl0z
	+zRw+qs9kjH+4Z02gsbbRa6CvSwjPc5YulkEgWCQ82UVLjnRaeR1x/rgxTwwnFDP+
X-Received: by 2002:a17:907:7203:b0:a8b:6ee7:ba22 with SMTP id a640c23a62f3a-a90048c1144mr229950566b.39.1726050039880;
        Wed, 11 Sep 2024 03:20:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC2x+JMO+tm0ijU3OQGRRImB3ygbxvszbx4lN/VEWcj1lVdDxUMIryyfqab7LpkK77dq54mw==
X-Received: by 2002:a17:907:7203:b0:a8b:6ee7:ba22 with SMTP id a640c23a62f3a-a90048c1144mr229947366b.39.1726050039147;
        Wed, 11 Sep 2024 03:20:39 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1ec:a3d1:80b4:b3a2:70bf:9d18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c727e4sm594377066b.126.2024.09.11.03.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:20:37 -0700 (PDT)
Date: Wed, 11 Sep 2024 06:20:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>, Parav Pandit <parav@nvidia.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240911061712-mutt-send-email-mst@kernel.org>
References: <20240903063424-mutt-send-email-mst@kernel.org>
 <20240903063625-mutt-send-email-mst@kernel.org>
 <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org>
 <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
 <20240905024935-mutt-send-email-mst@kernel.org>
 <47b21a27-d34f-4836-9af4-b009001536ef@amd.com>
 <20240905031759-mutt-send-email-mst@kernel.org>
 <CACGkMEtTGHr0+=7X3tTfmXQnfZkbCXv=DqXiBGe54+5JSmETWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtTGHr0+=7X3tTfmXQnfZkbCXv=DqXiBGe54+5JSmETWQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Sep 06, 2024 at 07:51:08AM +0800, Jason Wang wrote:
> On Thu, Sep 5, 2024 at 4:12 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Sep 05, 2024 at 03:12:41PM +0800, Zhu Lingshan wrote:
> > >
> > >
> > > On 9/5/2024 2:51 PM, Michael S. Tsirkin wrote:
> > > > On Wed, Sep 04, 2024 at 02:38:36PM +0800, Zhu Lingshan wrote:
> > > >>
> > > >> On 9/4/2024 2:31 PM, Jason Wang wrote:
> > > >>> On Wed, Sep 4, 2024 at 12:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >>>> On Wed, Sep 04, 2024 at 11:07:25AM +0800, Jason Wang wrote:
> > > >>>>> On Tue, Sep 3, 2024 at 6:37 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >>>>>> On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin wrote:
> > > >>>>>>>>> But I don't like it that looking at the registers, one does not know the device
> > > >>>>>>>>> state. Hidden state is bad for debuggability.
> > > >>>>>>>>> We have 4 states:
> > > >>>>>>>>> suspending->suspended->resuming->resumed
> > > >>>>>>>>> so we need a register with at least 2 bits.
> > > >>>>>>>>>
> > > >>>>>>>>> we could steal 2 bits from status but it seems a bit much.
> > > >>>>>>>>>
> > > >>>>>>>> This is why letting the status tell the status and control register to control thing is elegant.
> > > >>>>>>> No argument here.
> > > >>>>>> Or, to be more precise, our status is driver status.
> > > >>>>> It looks like the device actually otherwise there's no need for
> > > >>>>> re-read or poll for things like reset and others.
> > > >>>> The need is there for complex device state transitions, which
> > > >>>> can not reasonably block a read response.
> > > >>>> Another standard approach with PCI is to specify the time
> > > >>>> transitions can take. I consider that less elegant -
> > > >>>> is this what you are advocating? The advantage is that
> > > >>>> driver does not load the pci bus with constant re-polling.
> > > >>>> The disadvantage is that it is hard to pick a universal
> > > >>>> number.  A combination of these approaches might work,
> > > >>>> e.g. a recommended timeout then poll.
> > > >>> We've already had msleep() for vp_reset(), anyhow we can increase the
> > > >>> sleep time, if it can overload the pci:
> > > >>>
> > > >>>         while (vp_modern_get_status(mdev))
> > > >>>                 msleep(1);
> > > >>>
> > > >>> We can do the same for suspending.
> > > >>>
> > > >>> The main blocker for timeout is that it may break migration and
> > > >>> complicate the hardening. Another proposal in the past is to have a
> > > >>> notification.
> > > >>>
> > > >>> But what I don't understand here is that suspend/resume should be
> > > >>> lighter than reset. If we can afford a reset, so did the
> > > >>> suspending/resume. If we want to have something new, that's fine but
> > > >>> it should be orthogonal to a specific new status bit?
> > > >> I agree, if we want new status indicator, then the new indicator should not be
> > > >> specific to SUSPEND.
> > > >>
> > > >> Thanks
> > > >> Zhu Lingshan
> > > > If you mean reset, we have a problem.
> > > > Specifically, reset has to work before feature
> > > > negotiation. So we can not do as we would with
> > > > SUSPEND and use a feature bit to expose presence
> > > > of the indicator register.
> > > I guess the driver can reset the device even after DRIVER_OK.
> >
> > in fact, unlike suspend - at any point at all.
> >
> > > IMHO the indicator should work for all device_status transitions,
> > > not only for RESET or SUSPEND, it should also apply for FEATURE_OK
> > > and DRIVER_OK.
> >
> > I don't  know what kind of transition is there for DRIVER/DRIVER_OK.
> > FEATURES_OK brings with it more issues, e.g. it can fail.
> >
> >
> > > So we don't need a feature bit, we may just
> > > place it in the common config space as you proposed before to
> > > define common config space for all transport. We can do this for sure!
> >
> > I have to say, this project is really ballooning out ;)
> >
> > > Of course another approach is what Jason proposed, the existing
> > > msleep and poll, driver knows whether the device is in progress
> > > of status transitions because it is the driver writes device_status.
> > >
> > > Thanks
> >
> > or just a register for suspend transitions, worry about
> > extending it later/
> 
> Is this for PCI only?

It's best to add it to all transports. Not rocket science at all.

> Another question is that, if suspend needs that,
> reset would also want.

I don't know what does "reset would also want" means.
Unlike suspend, reset is not a special state, so it
does not really require a spcial register to track
that state.

> Or it doesn't justify itself as reset needs to
> take longer time than reset.
> 
> Thanks
> 

Don't know what this means, either.

> >
> > > >
> > > > Regrettably, reset will have to still be supported
> > > > through clearing status just because this is always there.
> > > >
> > > >
> > > >>>>> Anyhow driver know
> > > >>>>> its own status.
> > > >>>>>
> > > >>>>> Thanks
> > > >>>> indeed, the status register is there to inform the device about
> > > >>>> the driver status.
> > > >>>>
> > > >>>>
> > > >>>>
> > > >>>>>> If we need
> > > >>>>>> to reflect and control device status, we need something else.
> > > >>>>>>
> > > >>> Thanks
> > > >>>
> >

