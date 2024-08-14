Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E191AC427
	for <virtio-comment@lists.linux.dev>; Wed, 14 Aug 2024 12:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723638067; cv=none; b=BCOegVMNbTXL24KH/77A5dGexvMDtPWxrw2J3zxq1dbBf/HSYmFhdGXfRqQPMZzKHVNFbqXvKzoWv88HXMPO14xyRk2uzZkIDup1uQ4QhT+nh5iKtY4FeNdRi1EdRUAAQK81jhRsBA9YZJeSXBjITJT/ta98JrnKtdDBsFjKu0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723638067; c=relaxed/simple;
	bh=t8v81ShCy9n23XTpPtTte6MWGxgZR0YxpdlY7+Xif4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=k4nSe0fPkqGi0Kxuo1j7DyRgSL9AJrbdKnPMV23jvZNNytEFw3Svagm2NuqnXLtFAMlRnka2AKBBgidC5jbg8vfJ/g3p5tYPp6XjGDFUTAHke9V7Mz/hlDY15MC75lEJnN2cgbHPLdWk5wiBx49m7nvFedZqPGDG4M00jqGVtLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SHtC5P5B; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SHtC5P5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723638064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oL6kbl1YzsoCSSgEAZaVyxogmn5x/yCFPRoS3oZycRQ=;
	b=SHtC5P5BGG9UqAjfoUOpUSY55YC0YiY77FnxJpzlaLsj9/zfxUUsJuDFSaSYjKMbEQJXGA
	qHkpKCDL/BoFTJieJJ2fXnr/MjlGaMS982h/uipBQaH5e/9a7l5vr3EY/XDHhGziESgkOP
	Vhu4yLWDsNDkvzuso0NUb4GrmUTDPw0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-TVzjONyuMUGyWE0KsUjYIw-1; Wed, 14 Aug 2024 08:21:03 -0400
X-MC-Unique: TVzjONyuMUGyWE0KsUjYIw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-36835daf8b7so4663556f8f.2
        for <virtio-comment@lists.linux.dev>; Wed, 14 Aug 2024 05:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723638060; x=1724242860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oL6kbl1YzsoCSSgEAZaVyxogmn5x/yCFPRoS3oZycRQ=;
        b=HPjPDpPitUiZeoU90GhEsvnocrIKmZ+FPNhqmWCRMur7SPkbm+9ZdhFzZNX0bvFge6
         ++g8mH1LDjkCJ29vvsdwVFm1ocSIhVE4wYC2iYsuycH/b/N1Iuav+mws2WlCSgIPUAZP
         Shq7ZvQCem1ZZj3Nc48IJfDSmV1XM33Q8C+A9wVtF1MebGbdzSgC6KNkIFFFXyhG2RO2
         rYQrdBYSaDEWzki4d85B1iiqZYTCynmyORZ3DlgPm6EqmvYb/Yj7rxOrdqY/B0l/lCUC
         jY/2MknENhN9ZmlO/9RcWL/2tvZL8qptTn5rLS+T7iuftsap+F8CRz7IUvauxvUVlmrU
         hsgw==
X-Gm-Message-State: AOJu0Yzgu5lNYdR4kykOMJEM5f8O26Un7qzNJp8XA+Xmg4ETOLdATHx5
	hDFeTbhSjmg2wC8XmA1MokumOtUE9ClZ2mdQPpTNXk7PcPN5VRLgAAc619UXqffSFqMxd4pjD+h
	TfXq9z/6O6ffqN97RztQNsD5o8sHajcHHro1TTsAjg/Oj8nWBP5xadiOoBet2IwOr
X-Received: by 2002:a5d:6248:0:b0:368:7943:8b1f with SMTP id ffacd0b85a97d-371777e1238mr2479902f8f.43.1723638059868;
        Wed, 14 Aug 2024 05:20:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF78qR55F9MCktfD3c0J12q/UR2h1So0VAg6WuqDvWd4hWuOn+2Ewk3nl4JwvXcbYzwz1PeOQ==
X-Received: by 2002:a5d:6248:0:b0:368:7943:8b1f with SMTP id ffacd0b85a97d-371777e1238mr2479879f8f.43.1723638059372;
        Wed, 14 Aug 2024 05:20:59 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded31c48sm18175165e9.14.2024.08.14.05.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 05:20:59 -0700 (PDT)
Date: Wed, 14 Aug 2024 14:20:57 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V9] virtio-transport: Add a section to define mandatory
 transport requirements
Message-ID: <ZryhKR2KooGiGmpn@fedora>
References: <b8b964a8a3e6eba7461bbe7e10876c34e1e313a5.1723198845.git.viresh.kumar@linaro.org>
 <ZrnqBewNnZu5xmJ9@fedora>
 <20240814004203.ruvdkkeuuyhmbkk2@vireshk-i7>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240814004203.ruvdkkeuuyhmbkk2@vireshk-i7>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 14, 2024 at 06:12:03AM +0530, Viresh Kumar wrote:
> Hi Matias,
> 
> On 12-08-24, 12:55, Matias Ezequiel Vara Larsen wrote:
> > On Fri, Aug 09, 2024 at 03:52:28PM +0530, Viresh Kumar wrote:
> > > +Devices and drivers utilize various transport methods to facilitate
> > > +communication, such as PCI, MMIO, or Channel I/O. These transport
> > > +methods determine multiple aspects of the interaction between the device
> > 
> > Maybe remove `multiple` here. I think it does not add much but I do not
> > have an strong opinion about this.
> 
> What about 'various' instead of 'multiple' ? Or just drop the word ?
> 

I would drop the word.

> > > +and the driver, including device discovery, capability exchange,
> > > +interrupt handling, and data transfer. For instance, in a host/guest
> > > +architecture, the host might expose a device to the guest via a virtual
> > > +PCI bus, and the guest would employ a PCI device driver to interface
> > > +with the device.
> > > +
> > 
> > Maybe a verb different than `employ`? But I do not have an strong
> > opinion about this.
> 
> 'use' ? Or something else ?
> 

I think `use` is OK. 

Matias

