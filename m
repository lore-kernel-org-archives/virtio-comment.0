Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B052269CE8
	for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 08:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747642525; cv=none; b=o3+iXu+9u8GDPWiZrRf2hfKOcwexiMBFdyxeehTmm2+YdlHijY9ZnaYrnlI2E5O6f6RkWmuqhQiOUBTKa4q3baU9ezZ0jeHSv4Kna8kCcvOySvS11meMPACYmyo0qb/8JhNjPsOfuhdrpTJu5yS0uVRVp1zz2Yuf1oy7/GSfQec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747642525; c=relaxed/simple;
	bh=OfG5SD0VusI2l4bkr/ORJINhIBYTVUa3XNBNPgVpYrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=owpbF8TrDAypxf9PWdLjh5+lMU5i4E/cCofZQntCLNGZYQgs+sgtOcfuUX8IbPQW2y/FEgiI61wsDcXEOXCwXXKDc1jPm68kE7p9VBJGLp4D0bKezCiScaWKUK0oTI45eWyVhZrOfxal+e1g0Rtfg6bZkuSY7DjkvpJz5AbuIFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dhNDTn+5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dhNDTn+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747642522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gexG3R0s39lzjbGBPXdG/BI3vH65Yjm/9pD4sHiS+MU=;
	b=dhNDTn+51uczFsO26KXIsoLKh4wiFOCcQlfUaZpEGj5HZoH2S2rqY9ey49t+NRECno6G+y
	pHv6W6bE/hTUZhCUB284uvzN2ygrAaUuYKKWJT/WYm9cl/YsKT52iyh1SdmifMxD39FWmC
	REl3m0nWIvqvhXzaCl67o0REdCelnUA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-eneUjMYPOeyAxpSEJowYwQ-1; Mon, 19 May 2025 04:15:19 -0400
X-MC-Unique: eneUjMYPOeyAxpSEJowYwQ-1
X-Mimecast-MFC-AGG-ID: eneUjMYPOeyAxpSEJowYwQ_1747642518
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso436665e9.0
        for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 01:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747642518; x=1748247318;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gexG3R0s39lzjbGBPXdG/BI3vH65Yjm/9pD4sHiS+MU=;
        b=EQMTQlAQ45QTMQog7C46f42n7uDaUu8byhXvRSUQNmX5pJO2AMosrs4c+J65budgFQ
         Qn77X7hBoouMdKQbeKMRXlWZbUWjAf6XeXBq6iBrfnW9PFMxILHDwjGjJkrsEcvF147u
         DzSx1y0+H32dtqMWhca5eQUXyI8smY35FdiwYs2dzxc+A0Y+rb0J02Ai8yIu6GZu6671
         fGGEHyAl0KC4lXYW/kZeovlbk86ymYeAeor+y6Wq5GjwUYZv+4eSz3YRdmExjQKJYucW
         NGUfPZlyUV2qHQ2A08pbkwHyN4PS1Hw5zU6YAfT9ayU+vf5gyx316SRAx0tlNxp9zSlp
         8BBA==
X-Gm-Message-State: AOJu0YwooRuU/dDlpyNrUjM8tCnj34pK7Bml/7m+SXzYbRzkwrPcfsQT
	qbaDoHzry3q4W6+sSfOzZaJ89+9bvqh/L5AQuaGhOSEhWZ7AA283W+M89asA5/Ndo7Guo9NoQM6
	74vSR58Nc69OnuW4up1y1LwIOiWdjnC/jroCAPO9EPU48+ud5gGX3s6W3S89YpyJlE39L
X-Gm-Gg: ASbGncshXacnUzWBi130aY+wVz0lueCAruPL4tHxzcO3T5eMCx7AWrIM1sUELkxb0xS
	GP6ndd7DfdO9X9rjydBQZKLzeffQ0jxe9WrwJDLnFnt34GB32pVvTx2I86xz8YhXDWJAjtzOa2F
	8bf0rzvaF6ol2zA8r73i2Q20/liTntv0JNIjym79RV1MO2K0SZyvjOy7gHvkEYb2kqz8tovYD0C
	4p1jrATV3IpbCMxCvILRs4jUMtYo7LXfVzBAyk1rIrstyQjfcfjnNuQMM0nnXWuMf0+Ks8QbV+s
	/KQUbQ==
X-Received: by 2002:a05:600c:34d4:b0:442:f12f:bd9f with SMTP id 5b1f17b1804b1-442fd671f28mr108219495e9.27.1747642517934;
        Mon, 19 May 2025 01:15:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQde6l3GjhJClh2R7qExVk5SBQhudSuWbw1DfLXAAlnoPwNIuuj3sL49lQK7PiPuPbhw1jeg==
X-Received: by 2002:a05:600c:34d4:b0:442:f12f:bd9f with SMTP id 5b1f17b1804b1-442fd671f28mr108219225e9.27.1747642517480;
        Mon, 19 May 2025 01:15:17 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a8c4sm11772768f8f.27.2025.05.19.01.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:15:16 -0700 (PDT)
Date: Mon, 19 May 2025 04:15:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: virtio-comment@lists.linux.dev,
	VirtIO Dev List <virtio-dev@lists.linux.dev>,
	Bill Mills <bill.mills@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Sergio Lopez <slp@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: Central repo for VirtIO conformance tests?
Message-ID: <20250519041030-mutt-send-email-mst@kernel.org>
References: <87semtpjrt.fsf@draig.linaro.org>
 <CAAjaMXZgeNpExoiDKr3RRms_voE0bU9G033gOmawDqsFbGj2Gw@mail.gmail.com>
 <20250519034810-mutt-send-email-mst@kernel.org>
 <CAAjaMXafNUEk6jAkh-9iY6JNSKzawM+GRJAHAxZ6X9dkwhMyfg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAjaMXafNUEk6jAkh-9iY6JNSKzawM+GRJAHAxZ6X9dkwhMyfg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AjMK94GOpSVGR6mWHwiDF6lRgTBz8Upd8rZhkYvgyGA_1747642518
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, May 19, 2025 at 11:03:43AM +0300, Manos Pitsidianakis wrote:
> Hello Michael, thanks for the reply,
> 
> On Mon, May 19, 2025 at 10:54 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, May 19, 2025 at 10:43:33AM +0300, Manos Pitsidianakis wrote:
> > > Pinging this thread to ask the OASIS people: Would it be possible to
> > > host a software project (this testsuite) under OASIS but with a
> > > lighter contribution process? We expect everyone to be contributing to
> > > them, from open source/proprietary hypervisor developers, to kernel/OS
> > > developers, hobbyists and professionals alike. So I think a low
> > > barrier of entry would be reasonable here.
> >
> > Take a look here pls:
> > https://www.oasis-open.org/open-repositories/#licensingRules
> >
> >
> >
> > > Seeing as a test suite is essentially tied to the published VIRTIO
> > > spec itself it also makes it a good fit semantically. Having a suite
> > > with multiple VIRTIO implementations including slim images with Linux
> > > would also give a wider frame of reference for downstream consumers of
> > > the spec. Currently, the Linux kernel is the de facto (because it's
> > > also open source) VIRTIO implementation on the frontend side and
> > > oftentimes we end up looking at what Linux does to implement backends.
> > >
> > > We'd like to potentially:
> > >
> > > - Expand the array of rootfs images with more Linux userspace tests
> > > for more devices
> > > - Expand the array of rootfs images with other open source OSes as
> > > they gain VIRTIO functionalities
> > > - Implement missing VIRTIO spec features in our unikernel test and
> > > also exercise realistic but basic VIRTIO command use scenarios for
> > > more devices
> > > - (This is on my personal wishlist) write a VIRTIO fuzzer framework,
> > > similar in spirit to Google's syzkaller project (unsupervised
> > > coverage-guided kernel fuzzer)
> > > - As a stretch goal, provide a reference test runner framework to run
> > > the images with QEMU and rust-vmm vhost-user backends for people to
> > > adapt to their setups.
> > >
> > > PS: The git repositories Alex linked are temporarily inaccessible due
> > > to internal unrelated issues, and will be public again.
> >
> >
> > At the moment, from the above link, and if you want it tied to OASIS
> > open repositories, it has to be one of:
> >
> > BSD-3-Clause License (which shall apply if the TC makes no license selection in its approval action); Apache License v 2.0; CC-BY 2.0; CC-BY 4.0; Eclipse Public License v 1.0.
> 
> OK that's doable and completely reasonable.
> 
> > I am not a lawyer, but can full OS images we licensed under one of
> > these? If not, you are better off creating the repository itself outside
> > the confines of OASIS.
> 
> We'd be hosting essentially build recipes for the images, for tests
> where we use other people's code. The build recipes would have the
> same license.
> 
> If I understand the CLA requirement correctly, even if the
> contribution is merged by a maintainer who has signed the CLA, the
> original contributor who has no write access to the repository, has to
> sign the CLA as well?


I think is would be the OASIS equivalent of the Linux DCO:
	Each person making a repo contribution must be bound to the terms of the
	CLA, by obtaining their signature (which may be an equivalent electronic
	assent)

If you like I can reach out to OASIS to confirm.

> > You can still use e.g. virtio-dev mailing list for communication.
> >
> > > --
> > > Manos Pitsidianakis
> > > Emulation and Virtualization Engineer at Linaro Ltd
> >

