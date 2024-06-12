Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB1D6DD08
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 07:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718176758; cv=none; b=hs+7/78uQ58rtYoIw529TdgI5avjcfssBEXHX8DN8wzAZHEDMi8suyFApaGcSmkTz6IXnW4JnJjPevY3VrPOZyzBSBPyRNfLiTo6nmp0loCauSNcfmb7vUw3C8PUqR3jrZrU0uSWd+BMTWF2ProMeDyoNOb1CsAQ9jPM0G8Sxl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718176758; c=relaxed/simple;
	bh=AY2Z1Je3MGQImvNXiLDo4KUgCTIwG0lJbBuuvZlT1FM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ncVHESn9NBPtFiFhj6b6fdQoOPWxkxMPl4LWw2DNxR4irpWZ73ubqbFmWN0oDIFETluSuFoajyjLdAsSI033zdx8E2WLlN8RWy29D9UeekqmytMsFFhadeaMYt0evIhWfx6gD5xbJuMETksR7xTUUJuc4FZRaDji6xT0dWmAC1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dzn7Jfym; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dzn7Jfym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718176756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c/56rs52x1SRzBp+bsGen+ZXEyKMcvr9K05he0P0CVI=;
	b=dzn7Jfym0xS/8MAwO6xSg2CZ5OUOrpFhfJP7jUE9hXVcV3e7y5D5kpwDOaVg0/J4CLUmTn
	PP17rcgnseL3G5aS/sgVaIqifdR2+tkIzB2EGUsCpDXzWQjfRYGU+UAjcgH7yiE9DQqHIg
	F0XGtjIIfB5tpFpUCeK+VDfHa5zsEnk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-Cm6kc3CsPX6Yuff-AtwQUA-1; Wed, 12 Jun 2024 03:19:14 -0400
X-MC-Unique: Cm6kc3CsPX6Yuff-AtwQUA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4219cb14a23so27896235e9.3
        for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 00:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718176753; x=1718781553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/56rs52x1SRzBp+bsGen+ZXEyKMcvr9K05he0P0CVI=;
        b=tj6JeSSvxVwBDgu+R7/rCbr8BHy1x376y9kSBMVw/ud8io/yapu6zrXDUyhY4mrYnk
         QLWHziQ6jwvv+y9Zs0x+12xPMCSqwOevM1kQxm1r8O/bpZlK5bwQfLygbr1knyb8FJPg
         U7c/EKFbMAwoLICJfq9posLyzDsqThw+sdq0crka0lkKBUtCdBcvjF5pYCytPnujrhDj
         V2GASAgvHH1eR6wpYz9hkUZT+xW+wtvUgS0bWdVrpsBTT7cT9nVDde3ZkKXxfqWAYE9T
         4+KJAKEmtV1T2nM+Mco0oUIcCT1qZWXOK9FPJHuGK/NWlCCbWnCx5hXsEcqlRiPIto9i
         lKXw==
X-Forwarded-Encrypted: i=1; AJvYcCXujtFDE8WLHXpNUr2C4pHLLVOfbcxZ3lNexcEn5OjuInYrPh6Ngem+PkqVZyyPWwluTFRhZibJB/WX+93A4cLlRoBPR8xE9/h+RVYIArg=
X-Gm-Message-State: AOJu0YzVY1ruQ9uxEZoM0SOugjMLUGFQMLd5e8pJ79E5mGcYCsxs+Y60
	vPmk4o0AyKawgcVLseq2g4JqNZF7/tfYCPHT3rXesdJ7EdCOFkkMWl4DZGWKY5VgIXC1rYNRrGl
	nXnEOFyPRQkDECDyK6u+7zOHP7RGDp60M3lnHcLC3JI/i8J0xwr2StD+kFunXuI1w
X-Received: by 2002:a05:600c:1c9a:b0:422:1a82:3ed2 with SMTP id 5b1f17b1804b1-42288008175mr10422815e9.27.1718176752819;
        Wed, 12 Jun 2024 00:19:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8oekV39Q39J2c7tvGuMqYtyamWo/zwL7PhJl7+woEi3UhGySR3xDzjDvpt6+eO4mfBPmRHg==
X-Received: by 2002:a05:600c:1c9a:b0:422:1a82:3ed2 with SMTP id 5b1f17b1804b1-42288008175mr10422555e9.27.1718176752313;
        Wed, 12 Jun 2024 00:19:12 -0700 (PDT)
Received: from redhat.com ([2a02:14f:178:39eb:4161:d39d:43e6:41f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870ebadbsm13988205e9.23.2024.06.12.00.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 00:19:11 -0700 (PDT)
Date: Wed, 12 Jun 2024 03:19:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	"stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [PATCH V5] virtio-transport: Clarify requirements
Message-ID: <20240612031606-mutt-send-email-mst@kernel.org>
References: <9d543789de03d26a27a43ae8f7621d07d66e8731.1718084050.git.viresh.kumar@linaro.org>
 <PH0PR12MB5481413D59F2DC236F0B59DFDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87plsnjy6k.fsf@redhat.com>
 <PH0PR12MB5481B721659E596A77AAB756DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481B721659E596A77AAB756DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2024 at 05:40:45PM +0000, Parav Pandit wrote:
> 
> 
> > From: Cornelia Huck <cohuck@redhat.com>
> > Sent: Tuesday, June 11, 2024 8:59 PM
> > 
> > On Tue, Jun 11 2024, Parav Pandit <parav@nvidia.com> wrote:
> > 
> > > Hi Viresh,
> > >
> > >> From: Viresh Kumar <viresh.kumar@linaro.org>
> > >> Sent: Tuesday, June 11, 2024 11:06 AM
> > >
> > > [..]
> > >> diff --git a/content.tex b/content.tex index
> > >> 0a62dce5f65f..e2a836327818 100644
> > >> --- a/content.tex
> > >> +++ b/content.tex
> > >> @@ -631,8 +631,86 @@ \section{Device Cleanup}\label{sec:General
> > >> Initialization And Device Operation /
> > >>
> > >>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport
> > >> Options}
> > >>
> > >> -Virtio can use various different buses, thus the standard is split
> > >> -into virtio general and bus-specific sections.
> > >> +Devices and drivers can use different transport methods to enable
> > >> +interaction, for example PCI, MMIO, or Channel I/O. The transport
> > >> +methods define various aspects of the communication between the
> > >> +device and the driver, like device discovery, exchanging
> > >> +capabilities, interrupt handling, data transfer, etc. For example,
> > >> +in a host/guest architecture, the host might expose a device to the
> > >> +guest on a PCI bus, and the guest will use a PCI-specific driver to interact
> > with it.
> > >> +
> > >> +The standard contains sections describing the transport-agnostic
> > >> +parts of virtio, and sections describing how individual transports
> > >> +implement virtio.
> > >> +
> > >> +\section{Virtio Transport Requirements}\label{sec:Virtio Transport
> > >> +Options / Virtio Transport Requirements}
> > >> +
> > >> +There are some mechanisms that any transport is required to
> > >> +implement, and some requirements that devices and drivers are
> > required to follow.
> > >> +
> > >> +\subsection{Transport Requirements}\label{sec:Virtio Transport
> > >> +Options / Virtio Transport Requirements / Transport Requirements}
> > >> +
> > >> +A transport provides a mechanism for the driver to discover the device.
> > >> +
> > > I would like to add a normative.
> > >
> > > A transport MAY provide a mechanism to create and destroy virtio devices.
> > >
> > > (for example PCI transport provides this).
> > >
> > 
> > I'm not a fan of that statement: the transport already allows for the driver to
> > discover a device, whether that happens statically or dynamically really is the
> > choice of the transport, and I don't think we should go into that much detail.
> > 
> Discovery != life cycle management of the device.
> The whole purpose of this section to clarify the transport requirements scope and guidelines for new transport.
> And if its incomplete I don't see a point of having this section at all.

I see it as complementing the section about adding new devices.  So we
give some hints on how to add a new transport, basically a transport
developer is documenting his/her journey for others to follow.  Yes this
does add support overhead, it will get out of sync so we better make
this clear straight away.  Not enough transports are going to be added
to spend too many cycles making this complete, I think.


> Anyways, not too critical for me either.
> 
> > [I'll go offline now, so please don't expect further responses from me right
> > now...]

