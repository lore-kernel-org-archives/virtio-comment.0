Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A8814AD2E
	for <virtio-comment@lists.linux.dev>; Wed, 25 Sep 2024 03:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727236086; cv=none; b=DDDQCR2u8u6lf1pYuBmJgv6f+WNOI39TC6602AvpSU80esa8fbS2s3/23LTS5nQRMnb0Fz/sCAayLOE6NtUn97xOxWU6Xf15DuBNZrGbLkxp55h6wLl8KFPeOEYcocbW5U5uXZlhIorkgAWs2fFLxnhXi9zV6/BBCMf9q5b9R5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727236086; c=relaxed/simple;
	bh=HbueUsDMPwnPVdVJFYhJ3/ahMZmq9c4MYD0CRpSdfXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KBKqKQvF/f6+C45cXtkSEZiCcWnWvmsZ9mX3QFRNcwQsf60aGjFM5SYQg3UjTtLnW+v8pWMMzxHTQbLj6OpYMv4ChldHinuLSen7XnnStSML8n1sE1oIPySLPhxlBQI8uOAydYi5FvAk2lzDA2GUru8gvLXAMv2P5x/TAX9P5YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aXMBvu/a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aXMBvu/a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727236083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HbueUsDMPwnPVdVJFYhJ3/ahMZmq9c4MYD0CRpSdfXM=;
	b=aXMBvu/aqUzYTMmZ24qTQSqglgK+ssSwawYWF2JUMZhHDIY6s9IVew4+OxN2WoWsdtV4pA
	XFuPaGqXcP6zESdCYKG0fgzAqgRhrYT2g39TvJehySdfhkXRSUPG/N0PC3ISwZVm/IeI72
	NefBMJ9OpTITgKJ0BspCIv1yAkKEqHE=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-_hVNyAxLOJqYq1PegX8xtQ-1; Tue, 24 Sep 2024 23:48:02 -0400
X-MC-Unique: _hVNyAxLOJqYq1PegX8xtQ-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-206f405f453so64345775ad.1
        for <virtio-comment@lists.linux.dev>; Tue, 24 Sep 2024 20:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727236081; x=1727840881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbueUsDMPwnPVdVJFYhJ3/ahMZmq9c4MYD0CRpSdfXM=;
        b=OmUYgVpZgpDgQtWcd6xuSnig8kvhhfAA5JmPLryHuLYpSbEMXncChj6X3fF7Td1PiX
         lLfZGDq/Ijm9D5vP2vxxgx42OfA+ezZwn+HXjyEgV/zY+QIfYtpOrZjcaLUXaJx66kHE
         QJY4x4mniBsIsULq9O/XtL0/ctiYtf74keag8XVuubUIssWU3oFwfI+oGeULSKpwCOK2
         pIsGDyI4I0G52WQKBFzExFv9C9oVMfz4UL7a9YAR4Wxx/ASF7SNnzIXbGU/oa/LoecHQ
         8UDKWqN6wsFWNLsaVD1VY85FMOnu1k3Pxy05tt3VNLtiJEPYt74H/PyWrBeRLuxjhuRW
         0YxA==
X-Forwarded-Encrypted: i=1; AJvYcCUI7baOAAoiawMVPC61ewAO+9624C75IIRyl/l+0ZQsLzQb0zBOMX5/rZqM6036Lt/zuEZE1i+PvCSQncE1Jw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLw1F2bgvigxbg7RRBLsQK37ax+GLAK3zwwPG3UEkJB4JhgEPu
	Jvx9UiGBuLjyYqdNgiEPO3V1CZEqyqwX5TobWAb3J7TbhboO6JPbFokIFXE0DC+S5cqEFBp9JnV
	c8327wVfAPvZJTrfOJAY+AxS1GkdZ7vAWp48NxPfQwpOu2d/WKvpZepfQ1bJgR7j2+02XCaMso+
	X6w0uVjNiWof89n0pIEGwYVAavbv+/RRjgTIqqRWc=
X-Received: by 2002:a17:90b:384a:b0:2d8:9226:aa94 with SMTP id 98e67ed59e1d1-2e06ae20392mr1654645a91.1.1727236081072;
        Tue, 24 Sep 2024 20:48:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtuNMTSyvXlG3JsHBpco1u9ktwSGMgWf+UHKP+DSKN/cVeai2y2YRl0W6tlWu+2wNvdWj4tazmlDKmTTgsvlA=
X-Received: by 2002:a17:90b:384a:b0:2d8:9226:aa94 with SMTP id
 98e67ed59e1d1-2e06ae20392mr1654621a91.1.1727236080598; Tue, 24 Sep 2024
 20:48:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com> <20240905024935-mutt-send-email-mst@kernel.org>
 <47b21a27-d34f-4836-9af4-b009001536ef@amd.com> <20240905031759-mutt-send-email-mst@kernel.org>
 <CACGkMEtTGHr0+=7X3tTfmXQnfZkbCXv=DqXiBGe54+5JSmETWQ@mail.gmail.com>
 <20240911061712-mutt-send-email-mst@kernel.org> <CACGkMEtW1B_8mKMEx8tQTsqRXSZSVmFwD1bkPucyjJt3ctj0Pg@mail.gmail.com>
 <20240912013755-mutt-send-email-mst@kernel.org> <CACGkMEvWiNLXCUAXfDox=pz4gWvJWQfScHTv5u_LJqdO3Nmz=A@mail.gmail.com>
 <20240924185950-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240924185950-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 25 Sep 2024 11:47:49 +0800
Message-ID: <CACGkMEsn3gy1_NaN6KAh9qDGyE2Q7U5b+vzCUFuk3a4duT0zqQ@mail.gmail.com>
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

On Wed, Sep 25, 2024 at 7:05=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Sep 24, 2024 at 03:35:57PM +0800, Jason Wang wrote:
> > >
> > > > And I still don't see why
> > > > introducing a single new bit in the status brings any new troubles
> > > > compared with the existing reset and other state transitions.
> > >
> > > reset is not a state.
> >
> > Well, I'm not sure I get this. Each value read from status should
> > represent a device state.
>
> What makes you say so?
> status represents driver state, not device state.
> In fact, driver writes there and does not double check with the
> sole exception of reset.


For example, spec said

"""

2.1 Device Status Field

During device initialization by a driver, the driver follows the
sequence of steps specified in 3.1.

The device status field provides a simple low-level indication of the
completed steps of this sequence. It=E2=80=99s most useful to imagine it
hooked up to traffic lights on the console indicating the status of
each device. The following bits are defined (listed below in the order
in which they would be typically set):

"""

Driver knows its own state, so there's no need for the driver to read
it from the device.

>
> > And 0 is a valid status which means device
> > is resetted:
> >
> > """
> > The driver SHOULD consider a driver-initiated reset complete when it
> > reads device status as 0.
> > """
>
> It means all registers have their reset values,

This is exactly the device status? Drivers need to know that there's a
device state that is safe to start to program.

> but it is
> not a special state in that device behaves normally in this
> state, it does not need to be handles in any special way.
>
> Contrast with suspend where device does not respond and
> must be first resumed.

I think not. Driver can choose to reset the device when the device is suspe=
nded.

Thanks

>


>
> --
> MST
>

