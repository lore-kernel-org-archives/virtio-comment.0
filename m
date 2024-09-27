Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E6A1684A8
	for <virtio-comment@lists.linux.dev>; Fri, 27 Sep 2024 04:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727410158; cv=none; b=dUInr0iBfn1O3C9yjDkFY+o5nhCDNscGyvTVY7BBBSFSuiHAucT8d1cr4IcvCUS8cV+lebuv9jGMLEbL9mjI6CM63JDgm3pchdlkCa2OXawN6Ylqr9KPYdO09pFkxZxFtokIRDRtWYSGn9d1mPZHP7X3mBZKadsVb1uDWKm9/0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727410158; c=relaxed/simple;
	bh=j3jEuUUXrmBVKUEtkQoOcXoJP7czQbmN0tiHMc5pM+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YvYRBx2tD7W0upQ1k5fliDZXo+/0wGXWATjkZ8V+11Oo0lwuOQho+VHqyO+MkPrpJNUQ4rQsG11MgUDlqQUQu6Xjr9Rxh46GExWsF016ib42DtkCNcxBszSQaXhQYW2m1/NPy2yJssfIZSh4ReNlVnBC3iOW+pcjE/ckSgGns/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X2Tg55wM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X2Tg55wM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727410155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8qEAaGpLJPxp5509NqzvnH3Dw6IOKb8hThUKd+KGv/g=;
	b=X2Tg55wMiSenerG2KpZnvES41qB/CWxCSFL/qoj7XFYnT4UrkLyFM9b1/ixY0ncUpnQ7S4
	V8PmrV5PuX+biVi/REFV+UTT3yjRUtYY6y54LGxtFPipvDdAW3U6a3WXzepWsft24GBVq1
	3rguaW+x0GeUAENExeaFnpDCWyAMzzE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-HrdApASSPmWwv4Q_nX1kUw-1; Fri, 27 Sep 2024 00:09:07 -0400
X-MC-Unique: HrdApASSPmWwv4Q_nX1kUw-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2e07a5f4d44so1919392a91.2
        for <virtio-comment@lists.linux.dev>; Thu, 26 Sep 2024 21:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727410147; x=1728014947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qEAaGpLJPxp5509NqzvnH3Dw6IOKb8hThUKd+KGv/g=;
        b=g3KDNq9IIVB+NiNsm8L9Lx5DOV2T9Dy7e8qKfGTgsK1qGdQM/9wF8uV5oRHTw9GGNi
         vAUu6x2SzzqWjtrQJp+VQPJhbHB2yBD7YHGOXi+oERUdSMOZT7jXKX5Nw565kQ8NvAzX
         oujKmirPHI/4eglsDoVG4uBq1T1O05Mp2S3YZP8IH4G4IneXloCTv41qDM3ld+767rpo
         GsgxlZcKwx2elxaxua8QZEoIna83F4XPyVO9s13jok5CZz070ZfAsqgKuY3JVeOnqBum
         xBrOugqvnjWS7euH9sxdsiRr2LA6IDHXl7RylEMp2Ym2n9dmivIzVZbNdPS0LHVWe5cR
         tksw==
X-Forwarded-Encrypted: i=1; AJvYcCVKu2v5TtqDhNxNovXeTZWZkvE1KH8CcOiZwzvGODcViJlibVdVLLgV76aYDuZJoiVm9V6M5fo0W+A54ZQOag==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYvd33HXNaETMRQRaHVN6iMcPWMKqIJltpXGT8oUtpI3hOSNSN
	aNokg4DM83X4ASJQ2KTlBGQkeRUwoRVMSUOY6C+BI1+meGkv80vlwpNtIQjf1w0cIFkPZJQbjEs
	JDi2TsOeFV2f2FSBIMQ+mVy5VakDQlc2dV0ctQ5bICQ9DLm5gQfL4oLxZz8MVPj0FgntmgPgR53
	gv2F64kauI6Qv8ccTodvhXajvivx3RCypKNp56tUw=
X-Received: by 2002:a17:90a:3486:b0:2e0:80e8:a31a with SMTP id 98e67ed59e1d1-2e0b8ed490fmr2017480a91.35.1727410146644;
        Thu, 26 Sep 2024 21:09:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOVRF8Gl2POWM96NpVYzC+K03vFGRY8qkERa+KWb3WkWtON055g2xG/J5KlHghYF1l9Qoz5jV81vJSdBAYh98=
X-Received: by 2002:a17:90a:3486:b0:2e0:80e8:a31a with SMTP id
 98e67ed59e1d1-2e0b8ed490fmr2017464a91.35.1727410146208; Thu, 26 Sep 2024
 21:09:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905024935-mutt-send-email-mst@kernel.org>
 <47b21a27-d34f-4836-9af4-b009001536ef@amd.com> <20240905031759-mutt-send-email-mst@kernel.org>
 <CACGkMEtTGHr0+=7X3tTfmXQnfZkbCXv=DqXiBGe54+5JSmETWQ@mail.gmail.com>
 <20240911061712-mutt-send-email-mst@kernel.org> <CACGkMEtW1B_8mKMEx8tQTsqRXSZSVmFwD1bkPucyjJt3ctj0Pg@mail.gmail.com>
 <20240912013755-mutt-send-email-mst@kernel.org> <CACGkMEvWiNLXCUAXfDox=pz4gWvJWQfScHTv5u_LJqdO3Nmz=A@mail.gmail.com>
 <20240924185950-mutt-send-email-mst@kernel.org> <CACGkMEsn3gy1_NaN6KAh9qDGyE2Q7U5b+vzCUFuk3a4duT0zqQ@mail.gmail.com>
 <20240925071332-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240925071332-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 27 Sep 2024 12:08:54 +0800
Message-ID: <CACGkMEtYJOVHMtsqcW2OXSvArcUxHJXMCz3h5KRwaTGe5OzngA@mail.gmail.com>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>, Parav Pandit <parav@nvidia.com>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	David Stevens <stevensd@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 7:17=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Wed, Sep 25, 2024 at 11:47:49AM +0800, Jason Wang wrote:
> > On Wed, Sep 25, 2024 at 7:05=E2=80=AFAM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Tue, Sep 24, 2024 at 03:35:57PM +0800, Jason Wang wrote:
> > > > >
> > > > > > And I still don't see why
> > > > > > introducing a single new bit in the status brings any new troub=
les
> > > > > > compared with the existing reset and other state transitions.
> > > > >
> > > > > reset is not a state.
> > > >
> > > > Well, I'm not sure I get this. Each value read from status should
> > > > represent a device state.
> > >
> > > What makes you say so?
> > > status represents driver state, not device state.
> > > In fact, driver writes there and does not double check with the
> > > sole exception of reset.
> >
> >
> > For example, spec said
> >
> > """
> >
> > 2.1 Device Status Field
>
> yes, this is confusingly written

Anything makes you think it is confusing?

>
> > During device initialization by a driver, the driver follows the
> > sequence of steps specified in 3.1.
> >
> > The device status field provides a simple low-level indication of the
> > completed steps of this sequence.
>
> And note the sequence is driver sequence.

Right but it means the driver needs to know the status of the device
in order to proceed.

>
> > It=E2=80=99s most useful to imagine it
> > hooked up to traffic lights on the console indicating the status of
> > each device. The following bits are defined (listed below in the order
> > in which they would be typically set):
> >
> > """
>
>
>
>
> > Driver knows its own state, so there's no need for the driver to read
> > it from the device.
>
> That is why it never reads status.

Well, looking at the current Linux drivers there're plenty (in virtio
core, there could be other in the transport)

drivers/virtio/virtio.c:        return sysfs_emit(buf, "0x%08x\n",
dev->config->get_status(dev));
drivers/virtio/virtio.c:        dev->config->set_status(dev,
dev->config->get_status(dev) | status);
drivers/virtio/virtio.c:        status =3D dev->config->get_status(dev);
drivers/virtio/virtio.c:        if (!(dev->config->get_status(dev) &
VIRTIO_CONFIG_S_DRIVER_OK))
drivers/virtio/virtio.c:        WARN_ON_ONCE(dev->config->get_status(dev));
drivers/virtio/virtio.c:        dev->failed =3D
dev->config->get_status(dev) & VIRTIO_CONFIG_S_FAILED;
drivers/virtio/virtio.c:        if (!(dev->config->get_status(dev) &
VIRTIO_CONFIG_S_DRIVER_OK))

>
>
> > >
> > > > And 0 is a valid status which means device
> > > > is resetted:
> > > >
> > > > """
> > > > The driver SHOULD consider a driver-initiated reset complete when i=
t
> > > > reads device status as 0.
> > > > """
> > >
> > > It means all registers have their reset values,
> >
> > This is exactly the device status? Drivers need to know that there's a
> > device state that is safe to start to program.
>
> yes but otherwise, all registers respond normally
> device is assumed to be fully operational, and
> it is assumed that no time at all is needed to
> get from that to DRIVER.
>
>
> > > but it is
> > > not a special state in that device behaves normally in this
> > > state, it does not need to be handles in any special way.
> > >
> > > Contrast with suspend where device does not respond and
> > > must be first resumed.
> >
> > I think not. Driver can choose to reset the device when the device is s=
uspended.
> >
> > Thanks
>
> Yes, reset should take device out of suspend.

Thanks

>
> > >
> >
> >
> > >
> > > --
> > > MST
> > >
>

