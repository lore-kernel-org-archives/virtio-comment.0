Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CF517C8B
	for <virtio-comment@lists.linux.dev>; Sun, 29 Sep 2024 17:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727632517; cv=none; b=ApnbsCC8GZ/jWX0sYtduaqsILrUX4k+Q3iyNP+prQyS5vzjQviHxzWuQZwPmqn5gAvsA2xft2T3ABrcXci/Qqx7N86UT00K1rgDkn37dE9s83+abGLjwY/uRSwiaNEvCAZB3aU0yCw9B2Y3Cu+aigVXswWLHLLcIWBFsVxhkCQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727632517; c=relaxed/simple;
	bh=Pnm3ZFXpmS183A0XH0PCDo4X9fh6mybaBU1Uf0J+Va8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=tIOSgpAkbEd2Fy0XgbW2MXu1lItEDNd5B62yWO7bedc8hL5JXGoZmHZ10c7urFDPNlg3HY+tLCE5qYitmgrPP5DRMOTsE0U0naONnrSsE0XVBqd4fHVJfzESmVm7U9KfI7085wyC7IEHgBWVqL3U3Jr24zn1EJlmBYIn9W0mAOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fiKsl+q8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fiKsl+q8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727632514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TBOTl7yN6esJxr5PfyOhLBxkzq2W8JN1JGIDmLvv8D4=;
	b=fiKsl+q8wFZslT2go0PaCeipFgvaOFQc65er2yOKJylCB29PX0eVE5d2ljIQvYTYl92WXD
	iyrsXqZI605DfQDpwhN+CgaU9vM5zqG3jTh0Ipco/yRYzfBkc+kdQzM8zhCRM+xMVk3Wss
	JRxIu80HPq3dYVDdgy4iVM3pPX5J4kw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-UG4XHWgsNGatoFnnkYyK8A-1; Sun, 29 Sep 2024 13:55:11 -0400
X-MC-Unique: UG4XHWgsNGatoFnnkYyK8A-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a8a8ee13b44so3219666b.2
        for <virtio-comment@lists.linux.dev>; Sun, 29 Sep 2024 10:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727632510; x=1728237310;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBOTl7yN6esJxr5PfyOhLBxkzq2W8JN1JGIDmLvv8D4=;
        b=pYt3LIOY4VqIgb00TYmur/UyYQkp6/f9YiWFQpMT1+MyYXrP+vwezNbCAwM+DsLkAY
         nT1KHgZiGUCAZMJdao7/E1N6wZYv5R+8dQca8wICjhbGOnCVunR/0UheGRFRcUJKmwVU
         Evv4ZU+i3ifdH8tkgqy0QsW75cG3XcPHUSaWTuZS2A8MLoKCp6a3KWFFapMSHPR0rPtC
         KuKvP6I2OXeEd06oHmUE00+dvzGo4xrsnrFvh3lcEvAQFqffMTn35b84iJzhpMTSgcC4
         EaXH0LM0MXUciqSFq9gd2HXdUTK5BD4d4bOZWfEWBzq4FvFd8Y15hoOfPwf44Np+i5PO
         9K0w==
X-Forwarded-Encrypted: i=1; AJvYcCVY56XTgMj9CMn/HpuYWGe2qPKq4ATNRvZlLkVRwJaAekb97Gh0tR9N/XeRFPMpBKcAVcB/n7ihGAsG5TChVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiCOXpjPNZcSVKlcw8IhZusNMJxpnTLJcVbNqgDEaeVSLbK8nX
	I4B2PLwhFhwTvlrozyU1oRfHZD5J0sBVbfycy4SSzihGgWUD0HxQ3W6Vs6Mhu00wgF1eYqXTwwi
	AxLXDml48kzA98pwWE6gJHS3H+jZLIHHvplRLIl6lVCZLeOFnPIrOIGzt0gL+unKH
X-Received: by 2002:a17:906:da8c:b0:a90:344a:7db6 with SMTP id a640c23a62f3a-a93c4c283d7mr1120263066b.62.1727632509863;
        Sun, 29 Sep 2024 10:55:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiaTF/gQsCk1foTcZ2r71wFaiIC8Msg/Zf9msUvtj48yMWpJ0uaHAyWvccESZs+hJ9+glFhg==
X-Received: by 2002:a17:906:da8c:b0:a90:344a:7db6 with SMTP id a640c23a62f3a-a93c4c283d7mr1120260866b.62.1727632509481;
        Sun, 29 Sep 2024 10:55:09 -0700 (PDT)
Received: from redhat.com ([2a02:14f:17b:822e:847c:4023:a734:1389])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27776a1sm406356966b.8.2024.09.29.10.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 10:55:08 -0700 (PDT)
Date: Sun, 29 Sep 2024 13:55:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>, Parav Pandit <parav@nvidia.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240929135241-mutt-send-email-mst@kernel.org>
References: <20240905031759-mutt-send-email-mst@kernel.org>
 <CACGkMEtTGHr0+=7X3tTfmXQnfZkbCXv=DqXiBGe54+5JSmETWQ@mail.gmail.com>
 <20240911061712-mutt-send-email-mst@kernel.org>
 <CACGkMEtW1B_8mKMEx8tQTsqRXSZSVmFwD1bkPucyjJt3ctj0Pg@mail.gmail.com>
 <20240912013755-mutt-send-email-mst@kernel.org>
 <CACGkMEvWiNLXCUAXfDox=pz4gWvJWQfScHTv5u_LJqdO3Nmz=A@mail.gmail.com>
 <20240924185950-mutt-send-email-mst@kernel.org>
 <CACGkMEsn3gy1_NaN6KAh9qDGyE2Q7U5b+vzCUFuk3a4duT0zqQ@mail.gmail.com>
 <20240925071332-mutt-send-email-mst@kernel.org>
 <CACGkMEtYJOVHMtsqcW2OXSvArcUxHJXMCz3h5KRwaTGe5OzngA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtYJOVHMtsqcW2OXSvArcUxHJXMCz3h5KRwaTGe5OzngA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Sep 27, 2024 at 12:08:54PM +0800, Jason Wang wrote:
> On Wed, Sep 25, 2024 at 7:17 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Sep 25, 2024 at 11:47:49AM +0800, Jason Wang wrote:
> > > On Wed, Sep 25, 2024 at 7:05 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Tue, Sep 24, 2024 at 03:35:57PM +0800, Jason Wang wrote:
> > > > > >
> > > > > > > And I still don't see why
> > > > > > > introducing a single new bit in the status brings any new troubles
> > > > > > > compared with the existing reset and other state transitions.
> > > > > >
> > > > > > reset is not a state.
> > > > >
> > > > > Well, I'm not sure I get this. Each value read from status should
> > > > > represent a device state.
> > > >
> > > > What makes you say so?
> > > > status represents driver state, not device state.
> > > > In fact, driver writes there and does not double check with the
> > > > sole exception of reset.
> > >
> > >
> > > For example, spec said
> > >
> > > """
> > >
> > > 2.1 Device Status Field
> >
> > yes, this is confusingly written
> 
> Anything makes you think it is confusing?


It says Device Status but most of it reflects the driver probe progress.
Compare to pci RO status and RW control.

> >
> > > During device initialization by a driver, the driver follows the
> > > sequence of steps specified in 3.1.
> > >
> > > The device status field provides a simple low-level indication of the
> > > completed steps of this sequence.
> >
> > And note the sequence is driver sequence.
> 
> Right but it means the driver needs to know the status of the device
> in order to proceed.

again this is not device status at all.



> >
> > > It’s most useful to imagine it
> > > hooked up to traffic lights on the console indicating the status of
> > > each device. The following bits are defined (listed below in the order
> > > in which they would be typically set):
> > >
> > > """
> >
> >
> >
> >
> > > Driver knows its own state, so there's no need for the driver to read
> > > it from the device.
> >
> > That is why it never reads status.
> 
> Well, looking at the current Linux drivers there're plenty (in virtio
> core, there could be other in the transport)
> 
> drivers/virtio/virtio.c:        return sysfs_emit(buf, "0x%08x\n",
> dev->config->get_status(dev));
> drivers/virtio/virtio.c:        dev->config->set_status(dev,
> dev->config->get_status(dev) | status);
> drivers/virtio/virtio.c:        status = dev->config->get_status(dev);
> drivers/virtio/virtio.c:        if (!(dev->config->get_status(dev) &
> VIRTIO_CONFIG_S_DRIVER_OK))
> drivers/virtio/virtio.c:        WARN_ON_ONCE(dev->config->get_status(dev));
> drivers/virtio/virtio.c:        dev->failed =
> dev->config->get_status(dev) & VIRTIO_CONFIG_S_FAILED;
> drivers/virtio/virtio.c:        if (!(dev->config->get_status(dev) &
> VIRTIO_CONFIG_S_DRIVER_OK))

It's done like this for robustness and simplicity.
But we could easily cache it in the driver on write.


> >
> >
> > > >
> > > > > And 0 is a valid status which means device
> > > > > is resetted:
> > > > >
> > > > > """
> > > > > The driver SHOULD consider a driver-initiated reset complete when it
> > > > > reads device status as 0.
> > > > > """
> > > >
> > > > It means all registers have their reset values,
> > >
> > > This is exactly the device status? Drivers need to know that there's a
> > > device state that is safe to start to program.
> >
> > yes but otherwise, all registers respond normally
> > device is assumed to be fully operational, and
> > it is assumed that no time at all is needed to
> > get from that to DRIVER.
> >
> >
> > > > but it is
> > > > not a special state in that device behaves normally in this
> > > > state, it does not need to be handles in any special way.
> > > >
> > > > Contrast with suspend where device does not respond and
> > > > must be first resumed.
> > >
> > > I think not. Driver can choose to reset the device when the device is suspended.
> > >
> > > Thanks
> >
> > Yes, reset should take device out of suspend.
> 
> Thanks
> 
> >
> > > >
> > >
> > >
> > > >
> > > > --
> > > > MST
> > > >
> >

