Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA92F24211
	for <virtio-comment@lists.linux.dev>; Thu, 12 Sep 2024 02:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726106722; cv=none; b=aracMfwDkVVR1KK2Gs0UcrIS7q9L2FCIlbc850R0g0YlEssPjS8UY6uQqSokPS4da1cgYo6+NSgqKzbFfT4TgTr4RHhLLLquO24j/etyR6wimLouDFdEIx+JMvG6bW/b3I65B0gC6vlLei5o7BJFrNk5Q3bLGtVmF+jM4INIImk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726106722; c=relaxed/simple;
	bh=n3twfXF+rdISwjvR4bB4GuwWYEfdr99q4G5jmbXN2CE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KM/wVFWTwqESOaGMGoxOSjZn3CwAM9/srsHlq+52/mGL5nY+7TxXrYs3bD+fFGTs4qoDKWCNsMy3sCYq6rjNFYkyfOYAMg1cqrJO8qMi4g821Z4GnYRiAsiDy7AfWt+DycR8bDom9qvgfH0iLexpUhiAXMDI1YIZpAlsvUQG9Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UyzTXEcm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UyzTXEcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726106719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5/MuRtWNQa3CgVqmnwCasBsl3NKCMpG8EQUyVlMRcAU=;
	b=UyzTXEcmpmxyxXA7BSwiCdVbLPdvKCSQznsgVvSozhn/qX1f5vh2dDlySJ5k13MH6ilSfo
	GIobqdW49zekdzTcuwgSponhR/We/bcRNT3fBooepkdXRFKfF6YgbQV8mjot5+CgLugZF0
	I+n+H7w3FsRyjtOyW5BZgiJVTkimeiU=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-Esgw1Q1cOku9476CeeY3Aw-1; Wed, 11 Sep 2024 22:05:18 -0400
X-MC-Unique: Esgw1Q1cOku9476CeeY3Aw-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2d8a4fab0d7so630843a91.1
        for <virtio-comment@lists.linux.dev>; Wed, 11 Sep 2024 19:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726106717; x=1726711517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5/MuRtWNQa3CgVqmnwCasBsl3NKCMpG8EQUyVlMRcAU=;
        b=bNSwoIPxGLWvQNDwHbOHv4RCcrW5JrFYXoXRV2qE25TweLN7Sdbj0meGKijBtVOoMM
         kxSagJvZYPrUDugobNjEEFTAnglVhokxpEdO1L3mL5F7QsdiX1LZKB3tqoUqh6L12Fgn
         R3ZYFqXfmD7m9HaGoXgyVY2KS7Rd3m1srNa2vyJY+6qxC+57mZjO7ETKCWHlDV/ERmWw
         6MR1iADqb6JEvtku6C1+e13Ol2QvA/ttWyoGXQDWXDEibS6RQVu+UoK3z++rHNj+F9Aw
         MUouMt/a0VfBTmdLGUU/0Jd36KyOpfI42yfvvEsYyD+tiETsTjj/UUu4fwbve46iY28D
         6W+w==
X-Forwarded-Encrypted: i=1; AJvYcCV3DftjZDXVKtcRvoojmsaJWeiow7+rU04tNyWfvo0woGv2IAtM+g9w3yFqMoav8T9Wh8HUFsIY/9aEG4VQHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZi15xsfbLcOXxuEKPLOwqUijQJ5cKy2KJIHD3yQwYrZBQvnyO
	LB/Ney3iLaGCJjnFKYyZwpnFkE60rZJi8SiIikNaa2Il4taOCUv7e36d9tI2SlJGUb5A7EzVbui
	pNUU9jC/ap56q7+qr+4aCrsOllyK985u1YnQEXuk4ZPDbjK2mJoVXQe0o5/v9HdYUMfbgew788S
	VpZs1Pl5WLqdKgjgkk8DnayhyQGOlli0nFRgF7dwAqreisJWRXLm3y
X-Received: by 2002:a17:90a:c10:b0:2d8:8991:211f with SMTP id 98e67ed59e1d1-2dba0048376mr1453931a91.28.1726106716893;
        Wed, 11 Sep 2024 19:05:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHujuSeCmk/BooxNOwpFRC06UAERLLPZ3MBQsbv6KwXQ4/DAWFpmLWkjZ7G2oxulKlpiarPYh8SkIa83XWhRTk=
X-Received: by 2002:a17:90a:c10:b0:2d8:8991:211f with SMTP id
 98e67ed59e1d1-2dba0048376mr1453902a91.28.1726106716438; Wed, 11 Sep 2024
 19:05:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240903063424-mutt-send-email-mst@kernel.org>
 <20240903063625-mutt-send-email-mst@kernel.org> <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org> <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com> <20240905024935-mutt-send-email-mst@kernel.org>
 <47b21a27-d34f-4836-9af4-b009001536ef@amd.com> <20240905031759-mutt-send-email-mst@kernel.org>
 <CACGkMEtTGHr0+=7X3tTfmXQnfZkbCXv=DqXiBGe54+5JSmETWQ@mail.gmail.com> <20240911061712-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240911061712-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 12 Sep 2024 10:05:02 +0800
Message-ID: <CACGkMEtW1B_8mKMEx8tQTsqRXSZSVmFwD1bkPucyjJt3ctj0Pg@mail.gmail.com>
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

On Wed, Sep 11, 2024 at 6:20=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Fri, Sep 06, 2024 at 07:51:08AM +0800, Jason Wang wrote:
> > On Thu, Sep 5, 2024 at 4:12=E2=80=AFPM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > >
> > > On Thu, Sep 05, 2024 at 03:12:41PM +0800, Zhu Lingshan wrote:
> > > >
> > > >
> > > > On 9/5/2024 2:51 PM, Michael S. Tsirkin wrote:
> > > > > On Wed, Sep 04, 2024 at 02:38:36PM +0800, Zhu Lingshan wrote:
> > > > >>
> > > > >> On 9/4/2024 2:31 PM, Jason Wang wrote:
> > > > >>> On Wed, Sep 4, 2024 at 12:03=E2=80=AFPM Michael S. Tsirkin <mst=
@redhat.com> wrote:
> > > > >>>> On Wed, Sep 04, 2024 at 11:07:25AM +0800, Jason Wang wrote:
> > > > >>>>> On Tue, Sep 3, 2024 at 6:37=E2=80=AFPM Michael S. Tsirkin <ms=
t@redhat.com> wrote:
> > > > >>>>>> On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin=
 wrote:
> > > > >>>>>>>>> But I don't like it that looking at the registers, one do=
es not know the device
> > > > >>>>>>>>> state. Hidden state is bad for debuggability.
> > > > >>>>>>>>> We have 4 states:
> > > > >>>>>>>>> suspending->suspended->resuming->resumed
> > > > >>>>>>>>> so we need a register with at least 2 bits.
> > > > >>>>>>>>>
> > > > >>>>>>>>> we could steal 2 bits from status but it seems a bit much=
.
> > > > >>>>>>>>>
> > > > >>>>>>>> This is why letting the status tell the status and control=
 register to control thing is elegant.
> > > > >>>>>>> No argument here.
> > > > >>>>>> Or, to be more precise, our status is driver status.
> > > > >>>>> It looks like the device actually otherwise there's no need f=
or
> > > > >>>>> re-read or poll for things like reset and others.
> > > > >>>> The need is there for complex device state transitions, which
> > > > >>>> can not reasonably block a read response.
> > > > >>>> Another standard approach with PCI is to specify the time
> > > > >>>> transitions can take. I consider that less elegant -
> > > > >>>> is this what you are advocating? The advantage is that
> > > > >>>> driver does not load the pci bus with constant re-polling.
> > > > >>>> The disadvantage is that it is hard to pick a universal
> > > > >>>> number.  A combination of these approaches might work,
> > > > >>>> e.g. a recommended timeout then poll.
> > > > >>> We've already had msleep() for vp_reset(), anyhow we can increa=
se the
> > > > >>> sleep time, if it can overload the pci:
> > > > >>>
> > > > >>>         while (vp_modern_get_status(mdev))
> > > > >>>                 msleep(1);
> > > > >>>
> > > > >>> We can do the same for suspending.
> > > > >>>
> > > > >>> The main blocker for timeout is that it may break migration and
> > > > >>> complicate the hardening. Another proposal in the past is to ha=
ve a
> > > > >>> notification.
> > > > >>>
> > > > >>> But what I don't understand here is that suspend/resume should =
be
> > > > >>> lighter than reset. If we can afford a reset, so did the
> > > > >>> suspending/resume. If we want to have something new, that's fin=
e but
> > > > >>> it should be orthogonal to a specific new status bit?
> > > > >> I agree, if we want new status indicator, then the new indicator=
 should not be
> > > > >> specific to SUSPEND.
> > > > >>
> > > > >> Thanks
> > > > >> Zhu Lingshan
> > > > > If you mean reset, we have a problem.
> > > > > Specifically, reset has to work before feature
> > > > > negotiation. So we can not do as we would with
> > > > > SUSPEND and use a feature bit to expose presence
> > > > > of the indicator register.
> > > > I guess the driver can reset the device even after DRIVER_OK.
> > >
> > > in fact, unlike suspend - at any point at all.
> > >
> > > > IMHO the indicator should work for all device_status transitions,
> > > > not only for RESET or SUSPEND, it should also apply for FEATURE_OK
> > > > and DRIVER_OK.
> > >
> > > I don't  know what kind of transition is there for DRIVER/DRIVER_OK.
> > > FEATURES_OK brings with it more issues, e.g. it can fail.
> > >
> > >
> > > > So we don't need a feature bit, we may just
> > > > place it in the common config space as you proposed before to
> > > > define common config space for all transport. We can do this for su=
re!
> > >
> > > I have to say, this project is really ballooning out ;)
> > >
> > > > Of course another approach is what Jason proposed, the existing
> > > > msleep and poll, driver knows whether the device is in progress
> > > > of status transitions because it is the driver writes device_status=
.
> > > >
> > > > Thanks
> > >
> > > or just a register for suspend transitions, worry about
> > > extending it later/
> >
> > Is this for PCI only?
>
> It's best to add it to all transports. Not rocket science at all.

I'm asking since I wonder if the "issue" exists only for PCI. If yes,
solving the PCI transport (registers) issue at the basic facility
level seems like a layer violation. And I still don't see why
introducing a single new bit in the status brings any new troubles
compared with the existing reset and other state transitions. As
mentioned before, re-read has been used for both FEAUTRES_OK and
reset.

>
> > Another question is that, if suspend needs that,
> > reset would also want.
>
> I don't know what does "reset would also want" means.

I meant we have already had a state transition like reset.

For example, you worries about:

suspending->suspended->resuming->resumed

But we've already had

setting_features -> feature_ok(or not) -> resetting -> reseted

> Unlike suspend, reset is not a special state,

It depends but we had a dedicated chapter in the basic facility to
describe the reset state.

> so it
> does not really require a spcial register to track
> that state.

This seems to be PCI specific. Note that ccw has a dedicated command for re=
set:

#define CCW_CMD_VDEV_RESET 0x33
...
#define CCW_CMD_WRITE_STATUS 0x31

>
> > Or it doesn't justify itself as reset needs to
> > take longer time than reset.
> >
> > Thanks
> >
>
> Don't know what this means, either.

I meant

1) driver knows its own status and it can read device status
2) reset may take much longer time than suspend

If we really need a new status register (I don't see why so far), we
should not only suspend.

Thanks

>
> > >
> > > > >
> > > > > Regrettably, reset will have to still be supported
> > > > > through clearing status just because this is always there.
> > > > >
> > > > >
> > > > >>>>> Anyhow driver know
> > > > >>>>> its own status.
> > > > >>>>>
> > > > >>>>> Thanks
> > > > >>>> indeed, the status register is there to inform the device abou=
t
> > > > >>>> the driver status.
> > > > >>>>
> > > > >>>>
> > > > >>>>
> > > > >>>>>> If we need
> > > > >>>>>> to reflect and control device status, we need something else=
.
> > > > >>>>>>
> > > > >>> Thanks
> > > > >>>
> > >
>

