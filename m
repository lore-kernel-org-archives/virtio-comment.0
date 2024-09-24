Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B553417993
	for <virtio-comment@lists.linux.dev>; Tue, 24 Sep 2024 07:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727163375; cv=none; b=AQUWRQDL3xFoGxb2r3PTTbuzpTIoXDFJmmzejK8U00YGEmB/EfjGOrO1vho6XOzZ5J40KsJTgGnGkRxeMpdq8zD03gQc6D1Ez22qwzTGkenkAlyq4u2KCUc0Q4YEjoOpKi8oeq5Y2srLYb0fVp7ut80oOlQqOyauKy6XGbar+Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727163375; c=relaxed/simple;
	bh=V8a6zHtsWFtb5lLmSA2nDhuINaIU1Go4S+DL0KA1yDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aulf3vXlq5uL4PbTenSvAuMzBlFtRROM/93Vnuq7nnaSncgYYnXEMXw6an5eBnmlpPXV8MBX38rySCg+hA6kltpHSNR/jpV74g+XDgoaaUU5Q/S3QjOb5pgCJoqGbeDsvvWyr23MSza7RJpWF5LQdQxMTo9fBiz0/iDB4s3FFNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B/7dW5RA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B/7dW5RA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727163372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHKnw1TEy1mmzbhmqRaXGYM+31BSaoxf6NsSCL+uC9A=;
	b=B/7dW5RAXY9bVQ/FVkEAV/pSNRtegZU4YGQ6sns292/1QMF44FEdd9Ojz8VpA25rKVx7c1
	o9zFZlb1+aYZFCM6/xLAJVh17z4Y2tfdhnjgZZBGGm9DwcBvglxSZWyhNxy9ODex4qIsn9
	75rMIH29/ab/35hxR2Ulsm9vO9g1FZE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-Rr_0HaCGMBOPhMAnqo5X5g-1; Tue, 24 Sep 2024 03:36:11 -0400
X-MC-Unique: Rr_0HaCGMBOPhMAnqo5X5g-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2daf8920c13so4781171a91.1
        for <virtio-comment@lists.linux.dev>; Tue, 24 Sep 2024 00:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727163370; x=1727768170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHKnw1TEy1mmzbhmqRaXGYM+31BSaoxf6NsSCL+uC9A=;
        b=HhIthqufcWQxiRqHogIKrDhFYk/PGyn3OdbBXDTT1VxRO6jb69j9nmLLNgGbBpJLVQ
         kGpymX5Ep1ASpF32YgE5ErUKWnGyFchKHS8RpqEFZwc5sp/8Z49wJ7rchwJrC3NAxhV1
         e85PwzcQh+trun5g5Wo60gQP5Wb0Yolsth4KqwOa7fbZ6L8Aetfx6uifOlyK8bmusGqY
         3sv6mKnUFlFHpnmVwPzjlOdKP/NuyuXC6Tt2P+PQ+pKnpuA1Pd3V/ByVtO3LI74YSP1/
         zN3xsryaGxf9lGSFBpJVrh486XlsPsDy5Y7csOoy9UEiAIRE/jiC/26UsDwsj9ckJtcL
         cyAA==
X-Forwarded-Encrypted: i=1; AJvYcCUipObe+28yU5S/qGdvWXWz+ZiyIvJxD+QGKO84E9S4zVGztBY9UElcnuqcBucC3NjFNEC7BBdTgYXhRD6awA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyoncHU7F+OCnzyPakCArFC8nA/tF1KiCl4ElkU/O7tK5GNMQrJ
	z9f7IF9yZz5H6I19S3aeoPCInTI/g+e5laokNnwODiwX6OlMruD3NzCuV7XGG1AY2j6Ae9LdWcc
	QiX3FgE0jrfikVvey5Nw4muxzN5ScDdGEk4vx32TmL9uHO6sBWRSOG/5OyoM2CLzG3BN9mT5SkG
	A89EwxcdpK8MPEWyZw7p/ku63WlTroXKdgzo4C7eg=
X-Received: by 2002:a17:90b:4d10:b0:2c9:6abd:ca64 with SMTP id 98e67ed59e1d1-2e05683b88fmr3445178a91.9.1727163370004;
        Tue, 24 Sep 2024 00:36:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPtVwgxyDWW6rJv+MvMG0oRqUBny9xbKJ82erbYHq+97lfTXk8EKm2LVulOWYdAP9SmMUM1ickwBffEsqsG44=
X-Received: by 2002:a17:90b:4d10:b0:2c9:6abd:ca64 with SMTP id
 98e67ed59e1d1-2e05683b88fmr3445152a91.9.1727163369475; Tue, 24 Sep 2024
 00:36:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org> <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com> <20240905024935-mutt-send-email-mst@kernel.org>
 <47b21a27-d34f-4836-9af4-b009001536ef@amd.com> <20240905031759-mutt-send-email-mst@kernel.org>
 <CACGkMEtTGHr0+=7X3tTfmXQnfZkbCXv=DqXiBGe54+5JSmETWQ@mail.gmail.com>
 <20240911061712-mutt-send-email-mst@kernel.org> <CACGkMEtW1B_8mKMEx8tQTsqRXSZSVmFwD1bkPucyjJt3ctj0Pg@mail.gmail.com>
 <20240912013755-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240912013755-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 24 Sep 2024 15:35:57 +0800
Message-ID: <CACGkMEvWiNLXCUAXfDox=pz4gWvJWQfScHTv5u_LJqdO3Nmz=A@mail.gmail.com>
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

On Thu, Sep 12, 2024 at 1:44=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Thu, Sep 12, 2024 at 10:05:02AM +0800, Jason Wang wrote:
> > On Wed, Sep 11, 2024 at 6:20=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Fri, Sep 06, 2024 at 07:51:08AM +0800, Jason Wang wrote:
> > > > On Thu, Sep 5, 2024 at 4:12=E2=80=AFPM Michael S. Tsirkin <mst@redh=
at.com> wrote:
> > > > >
> > > > > On Thu, Sep 05, 2024 at 03:12:41PM +0800, Zhu Lingshan wrote:
> > > > > >
> > > > > >
> > > > > > On 9/5/2024 2:51 PM, Michael S. Tsirkin wrote:
> > > > > > > On Wed, Sep 04, 2024 at 02:38:36PM +0800, Zhu Lingshan wrote:
> > > > > > >>
> > > > > > >> On 9/4/2024 2:31 PM, Jason Wang wrote:
> > > > > > >>> On Wed, Sep 4, 2024 at 12:03=E2=80=AFPM Michael S. Tsirkin =
<mst@redhat.com> wrote:
> > > > > > >>>> On Wed, Sep 04, 2024 at 11:07:25AM +0800, Jason Wang wrote=
:
> > > > > > >>>>> On Tue, Sep 3, 2024 at 6:37=E2=80=AFPM Michael S. Tsirkin=
 <mst@redhat.com> wrote:
> > > > > > >>>>>> On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsi=
rkin wrote:
> > > > > > >>>>>>>>> But I don't like it that looking at the registers, on=
e does not know the device
> > > > > > >>>>>>>>> state. Hidden state is bad for debuggability.
> > > > > > >>>>>>>>> We have 4 states:
> > > > > > >>>>>>>>> suspending->suspended->resuming->resumed
> > > > > > >>>>>>>>> so we need a register with at least 2 bits.
> > > > > > >>>>>>>>>
> > > > > > >>>>>>>>> we could steal 2 bits from status but it seems a bit =
much.
> > > > > > >>>>>>>>>
> > > > > > >>>>>>>> This is why letting the status tell the status and con=
trol register to control thing is elegant.
> > > > > > >>>>>>> No argument here.
> > > > > > >>>>>> Or, to be more precise, our status is driver status.
> > > > > > >>>>> It looks like the device actually otherwise there's no ne=
ed for
> > > > > > >>>>> re-read or poll for things like reset and others.
> > > > > > >>>> The need is there for complex device state transitions, wh=
ich
> > > > > > >>>> can not reasonably block a read response.
> > > > > > >>>> Another standard approach with PCI is to specify the time
> > > > > > >>>> transitions can take. I consider that less elegant -
> > > > > > >>>> is this what you are advocating? The advantage is that
> > > > > > >>>> driver does not load the pci bus with constant re-polling.
> > > > > > >>>> The disadvantage is that it is hard to pick a universal
> > > > > > >>>> number.  A combination of these approaches might work,
> > > > > > >>>> e.g. a recommended timeout then poll.
> > > > > > >>> We've already had msleep() for vp_reset(), anyhow we can in=
crease the
> > > > > > >>> sleep time, if it can overload the pci:
> > > > > > >>>
> > > > > > >>>         while (vp_modern_get_status(mdev))
> > > > > > >>>                 msleep(1);
> > > > > > >>>
> > > > > > >>> We can do the same for suspending.
> > > > > > >>>
> > > > > > >>> The main blocker for timeout is that it may break migration=
 and
> > > > > > >>> complicate the hardening. Another proposal in the past is t=
o have a
> > > > > > >>> notification.
> > > > > > >>>
> > > > > > >>> But what I don't understand here is that suspend/resume sho=
uld be
> > > > > > >>> lighter than reset. If we can afford a reset, so did the
> > > > > > >>> suspending/resume. If we want to have something new, that's=
 fine but
> > > > > > >>> it should be orthogonal to a specific new status bit?
> > > > > > >> I agree, if we want new status indicator, then the new indic=
ator should not be
> > > > > > >> specific to SUSPEND.
> > > > > > >>
> > > > > > >> Thanks
> > > > > > >> Zhu Lingshan
> > > > > > > If you mean reset, we have a problem.
> > > > > > > Specifically, reset has to work before feature
> > > > > > > negotiation. So we can not do as we would with
> > > > > > > SUSPEND and use a feature bit to expose presence
> > > > > > > of the indicator register.
> > > > > > I guess the driver can reset the device even after DRIVER_OK.
> > > > >
> > > > > in fact, unlike suspend - at any point at all.
> > > > >
> > > > > > IMHO the indicator should work for all device_status transition=
s,
> > > > > > not only for RESET or SUSPEND, it should also apply for FEATURE=
_OK
> > > > > > and DRIVER_OK.
> > > > >
> > > > > I don't  know what kind of transition is there for DRIVER/DRIVER_=
OK.
> > > > > FEATURES_OK brings with it more issues, e.g. it can fail.
> > > > >
> > > > >
> > > > > > So we don't need a feature bit, we may just
> > > > > > place it in the common config space as you proposed before to
> > > > > > define common config space for all transport. We can do this fo=
r sure!
> > > > >
> > > > > I have to say, this project is really ballooning out ;)
> > > > >
> > > > > > Of course another approach is what Jason proposed, the existing
> > > > > > msleep and poll, driver knows whether the device is in progress
> > > > > > of status transitions because it is the driver writes device_st=
atus.
> > > > > >
> > > > > > Thanks
> > > > >
> > > > > or just a register for suspend transitions, worry about
> > > > > extending it later/
> > > >
> > > > Is this for PCI only?
> > >
> > > It's best to add it to all transports. Not rocket science at all.
> >
> > I'm asking since I wonder if the "issue" exists only for PCI.
> > If yes,
> > solving the PCI transport (registers) issue at the basic facility
> > level seems like a layer violation.
>
>
> I don't think so. Suspend is fundamentally a slow operation for
> any transport.

Probably, but how such slowness makes a new register a must? And my
understanding is, reset should be even slower than suspend.

>
>
> > And I still don't see why
> > introducing a single new bit in the status brings any new troubles
> > compared with the existing reset and other state transitions.
>
> reset is not a state.

Well, I'm not sure I get this. Each value read from status should
represent a device state. And 0 is a valid status which means device
is resetted:

"""
The driver SHOULD consider a driver-initiated reset complete when it
reads device status as 0.
"""

>
> > As
> > mentioned before, re-read has been used for both FEAUTRES_OK and
> > reset.
>
> FEAUTRES_OK is driver state, so can take place immediately

I'm not sure how to define immediately, but suspend could be very fast
depending on the implementation.

>
> > >
> > > > Another question is that, if suspend needs that,
> > > > reset would also want.
> > >
> > > I don't know what does "reset would also want" means.
> >
> > I meant we have already had a state transition like reset.
> >
> > For example, you worries about:
> >
> > suspending->suspended->resuming->resumed
> >
> > But we've already had
> >
> > setting_features -> feature_ok(or not) -> resetting -> reseted
>
>
> features ok just has to validate the bitmap, so it
> can take place immediately. no intermediate state.

True but there's an intermediate state between resetting and reseted.
When is the state when the driver has written 0 to status but not read
0 from status.

>
> > > Unlike suspend, reset is not a special state,
> >
> > It depends but we had a dedicated chapter in the basic facility to
> > describe the reset state.
>
> this is two different meanings of the same word.
> reset is not a special state, device operates normally.
>
>
> > > so it
> > > does not really require a spcial register to track
> > > that state.
> >
> > This seems to be PCI specific. Note that ccw has a dedicated command fo=
r reset:
> >
> > #define CCW_CMD_VDEV_RESET 0x33
> > ...
> > #define CCW_CMD_WRITE_STATUS 0x31
>
>
> maybe reusing state 0 to reset was a bad idea.

Not sure, but it's too late to change that.

>
>
> > >
> > > > Or it doesn't justify itself as reset needs to
> > > > take longer time than reset.
> > > >
> > > > Thanks
> > > >
> > >
> > > Don't know what this means, either.
> >
> > I meant
> >
> > 1) driver knows its own status and it can read device status
> > 2) reset may take much longer time than suspend
>
> that is why driver re-reads status to check for reset.

Yes, but this is exactly how suspend is supposed to work for this patch.

Reset has one intermediate state and drivers need to poll for the completio=
n.
Suspending has two intermediate states, drivers need to poll the
completion for them.

>
>
> >
> > If we really need a new status register (I don't see why so far), we
> > should not only suspend.
> >
> > Thanks
>
> it's not a new status register, it's a suspend register used for PM.

I think power management should belong to the transport layer, not the
virtio layer.

Thanks



>
>
> > >
> > > > >
> > > > > > >
> > > > > > > Regrettably, reset will have to still be supported
> > > > > > > through clearing status just because this is always there.
> > > > > > >
> > > > > > >
> > > > > > >>>>> Anyhow driver know
> > > > > > >>>>> its own status.
> > > > > > >>>>>
> > > > > > >>>>> Thanks
> > > > > > >>>> indeed, the status register is there to inform the device =
about
> > > > > > >>>> the driver status.
> > > > > > >>>>
> > > > > > >>>>
> > > > > > >>>>
> > > > > > >>>>>> If we need
> > > > > > >>>>>> to reflect and control device status, we need something =
else.
> > > > > > >>>>>>
> > > > > > >>> Thanks
> > > > > > >>>
> > > > >
> > >
>

