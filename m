Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A99199954
	for <virtio-comment@lists.linux.dev>; Thu, 17 Oct 2024 06:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729148216; cv=none; b=TiEDe8Ytt7u80wl7eguWv96JSYeeC/IdZ/CUgWmP9YHkhEss07Cnu1+MBgp+zlk76mwm/Kb3VvfozD8n5cy3eVuIdFV98JnIrBGHBiUDiMlJGAUOCrCaQe8vQTojSyAKNPjbdyi0s0QI4VYe3RSTBmPf8K0dU4if5y28J3cQbxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729148216; c=relaxed/simple;
	bh=6LOM7m/0Sz/OiexC5gcPDCwzkwlmchCW7PKGHy9m9iE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bJU5tBvC+ru/bCVVuA2N4AW6TkrkA4+SnPGNIV2olqkUUp9JnSg0vwpY1LFE2ifO2A2qb1yJgHMXmDCV7tyrR28zIP8vy7Xwla4s67Ge9A7FHiHTfk7zp+D8tB+UlgcnLnETWZ85oERlg2fMcmfE2lG5OJ0eIe1poocAjm2gFhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KOazDCqb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KOazDCqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729148213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1v6GMQwTDTMGxSWui+IXAXhJqs/NTdQ3v4+zXR56Xgo=;
	b=KOazDCqbQLto4B79cYolw0QsEkTrm+AtT89Ork/7DYmscCWLTe0eqvpfpxEryb8IhBaPPV
	/pXF4k2lj4HbOlV4RcC1oR68hRyO5zBC7zGhXDLsofshjKgeSjeHrilKZazHKos/En5mdf
	+a5CHrrhZSw0V6uTht92LsK3yYsjGT0=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-uZaXZS1ZPD2FxCdctieDRQ-1; Thu, 17 Oct 2024 02:56:51 -0400
X-MC-Unique: uZaXZS1ZPD2FxCdctieDRQ-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-71e5b492465so744786b3a.0
        for <virtio-comment@lists.linux.dev>; Wed, 16 Oct 2024 23:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729148211; x=1729753011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1v6GMQwTDTMGxSWui+IXAXhJqs/NTdQ3v4+zXR56Xgo=;
        b=kIOVDPT1B0A7/KlZLBKV6k/qfOcuj8y8s/2WuJrKfpbaPUi36rGWvIuC95X0+StQvi
         bvdbDhKxVeyecMW9w6qI8uLco6mKwmQAPnXArduVOo9bfvYTXSTqcnzjgSY2ttdGSezP
         ZOTw1ErZz9VI1EHNwRVValbP3U6TepxTjwSHLb8YNhUD3HbqL9+43f59k5rNNBZFOuB6
         ZFJMptezlbymWojS2Jhobsk3rnFuCZn+xgQF5iaatRpn87IVCFaNmNzIEcvVbMu/9WHs
         w6V8+jx8wGHMijXtg4WP/jsH+s9vKgQN/NI/zIvkuS8Hv1Dt+1eS/y9J2FqRXuc1Ht9r
         ewyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyFTZgworsWUZ77UAxHXWT5HCd3jUSdElSJdueGRfcCkkZNk26ac9FqX9P1wcddaVKAOjk0UbCQUjHzwI/9A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3AnquRHoHHqFGoWTJWqGlVHrskGxe50B/hL+N1G/Y7+Ere5UY
	jeDBqwN7KDLzooNd7Sl5eIcnELJI3h+g6wOIz/ylIiNjI/pZjr1d/w4quSrEWKUnioQ5eVJUmOK
	gBMcC3PtDdjIHIoVZEq/nl1aV94NWwpRZwkHK6xOIlvZqBD0hvjlLsKi79GnrKcm0BGu9bpzyK/
	Gf8txHoaBA4oADEAouRkdlpo+npVAndwMTlpTNThA=
X-Received: by 2002:a05:6a00:3392:b0:710:5848:8ae1 with SMTP id d2e1a72fcca58-71e7da10f78mr10331826b3a.4.1729148210717;
        Wed, 16 Oct 2024 23:56:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyEUVWbMRbp8dfamd4SuddHeiIWMxcECk6xg84b0j9QMxcQ+K2ePGnZY0JhfWu0HPZakbuAO14tSZE5GnjOGE=
X-Received: by 2002:a05:6a00:3392:b0:710:5848:8ae1 with SMTP id
 d2e1a72fcca58-71e7da10f78mr10331800b3a.4.1729148210232; Wed, 16 Oct 2024
 23:56:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905031759-mutt-send-email-mst@kernel.org>
 <CACGkMEtTGHr0+=7X3tTfmXQnfZkbCXv=DqXiBGe54+5JSmETWQ@mail.gmail.com>
 <20240911061712-mutt-send-email-mst@kernel.org> <CACGkMEtW1B_8mKMEx8tQTsqRXSZSVmFwD1bkPucyjJt3ctj0Pg@mail.gmail.com>
 <20240912013755-mutt-send-email-mst@kernel.org> <CACGkMEvWiNLXCUAXfDox=pz4gWvJWQfScHTv5u_LJqdO3Nmz=A@mail.gmail.com>
 <20240924185950-mutt-send-email-mst@kernel.org> <CACGkMEsn3gy1_NaN6KAh9qDGyE2Q7U5b+vzCUFuk3a4duT0zqQ@mail.gmail.com>
 <20240925071332-mutt-send-email-mst@kernel.org> <CACGkMEtYJOVHMtsqcW2OXSvArcUxHJXMCz3h5KRwaTGe5OzngA@mail.gmail.com>
 <20240929135241-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240929135241-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 17 Oct 2024 14:56:39 +0800
Message-ID: <CACGkMEsTTzJtzFd9L6XeVegzxo7R1A2ZG3s=Z8OZWP53Om0nyA@mail.gmail.com>
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

On Mon, Sep 30, 2024 at 1:55=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Fri, Sep 27, 2024 at 12:08:54PM +0800, Jason Wang wrote:
> > On Wed, Sep 25, 2024 at 7:17=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Wed, Sep 25, 2024 at 11:47:49AM +0800, Jason Wang wrote:
> > > > On Wed, Sep 25, 2024 at 7:05=E2=80=AFAM Michael S. Tsirkin <mst@red=
hat.com> wrote:
> > > > >
> > > > > On Tue, Sep 24, 2024 at 03:35:57PM +0800, Jason Wang wrote:
> > > > > > >
> > > > > > > > And I still don't see why
> > > > > > > > introducing a single new bit in the status brings any new t=
roubles
> > > > > > > > compared with the existing reset and other state transition=
s.
> > > > > > >
> > > > > > > reset is not a state.
> > > > > >
> > > > > > Well, I'm not sure I get this. Each value read from status shou=
ld
> > > > > > represent a device state.
> > > > >
> > > > > What makes you say so?
> > > > > status represents driver state, not device state.
> > > > > In fact, driver writes there and does not double check with the
> > > > > sole exception of reset.
> > > >
> > > >
> > > > For example, spec said
> > > >
> > > > """
> > > >
> > > > 2.1 Device Status Field
> > >
> > > yes, this is confusingly written
> >
> > Anything makes you think it is confusing?
>
>
> It says Device Status but most of it reflects the driver probe progress.
> Compare to pci RO status and RW control.

My understanding is that

1) any value that is read from the device status reflects a device status.
2) any value write from the driver for the device status reflects a
device status that driver want to go

Here are some examples:

1) DRIVER_OK:

"""
The device MUST NOT consume buffers or send any used buffer
notifications to the driver before DRIVER_OK.
"""

It's a device status that "Device knows driver is OK"

2) FEATURES_OK

"""
The device MUST NOT offer a feature which requires another feature
which was not offered. The device SHOULD accept any valid subset of
features the driver accepts, otherwise it MUST fail to set the
FEATURES_OK device status bit when the driver writes it.
"""

Device tells the driver that it doesn't support some of the features.

3) NEEDS_RESET:

"""
The device SHOULD set DEVICE_NEEDS_RESET when it enters an error state
that a reset is needed. If DRIVER_OK is set, after it sets
DEVICE_NEEDS_RESET, the device MUST send a device configuration change
notification to the driver.
"""

This is a device status but not a driver.

And usually, device status is a bitmask of several bits of status
defined in the spec.

>
> > >
> > > > During device initialization by a driver, the driver follows the
> > > > sequence of steps specified in 3.1.
> > > >
> > > > The device status field provides a simple low-level indication of t=
he
> > > > completed steps of this sequence.
> > >
> > > And note the sequence is driver sequence.
> >
> > Right but it means the driver needs to know the status of the device
> > in order to proceed.
>
> again this is not device status at all.
>
>
>
> > >
> > > > It=E2=80=99s most useful to imagine it
> > > > hooked up to traffic lights on the console indicating the status of
> > > > each device. The following bits are defined (listed below in the or=
der
> > > > in which they would be typically set):
> > > >
> > > > """
> > >
> > >
> > >
> > >
> > > > Driver knows its own state, so there's no need for the driver to re=
ad
> > > > it from the device.
> > >
> > > That is why it never reads status.
> >
> > Well, looking at the current Linux drivers there're plenty (in virtio
> > core, there could be other in the transport)
> >
> > drivers/virtio/virtio.c:        return sysfs_emit(buf, "0x%08x\n",
> > dev->config->get_status(dev));
> > drivers/virtio/virtio.c:        dev->config->set_status(dev,
> > dev->config->get_status(dev) | status);
> > drivers/virtio/virtio.c:        status =3D dev->config->get_status(dev)=
;
> > drivers/virtio/virtio.c:        if (!(dev->config->get_status(dev) &
> > VIRTIO_CONFIG_S_DRIVER_OK))
> > drivers/virtio/virtio.c:        WARN_ON_ONCE(dev->config->get_status(de=
v));
> > drivers/virtio/virtio.c:        dev->failed =3D
> > dev->config->get_status(dev) & VIRTIO_CONFIG_S_FAILED;
> > drivers/virtio/virtio.c:        if (!(dev->config->get_status(dev) &
> > VIRTIO_CONFIG_S_DRIVER_OK))
>
> It's done like this for robustness and simplicity.
> But we could easily cache it in the driver on write.

Probably not, one example:

        virtio_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
        status =3D dev->config->get_status(dev);
        if (!(status & VIRTIO_CONFIG_S_FEATURES_OK)) {
                dev_err(&dev->dev, "virtio: device refuses features: %x\n",
                        status);
                return -ENODEV;
        }

Devices may refuse the features.

Thanks


>
>
> > >
> > >
> > > > >
> > > > > > And 0 is a valid status which means device
> > > > > > is resetted:
> > > > > >
> > > > > > """
> > > > > > The driver SHOULD consider a driver-initiated reset complete wh=
en it
> > > > > > reads device status as 0.
> > > > > > """
> > > > >
> > > > > It means all registers have their reset values,
> > > >
> > > > This is exactly the device status? Drivers need to know that there'=
s a
> > > > device state that is safe to start to program.
> > >
> > > yes but otherwise, all registers respond normally
> > > device is assumed to be fully operational, and
> > > it is assumed that no time at all is needed to
> > > get from that to DRIVER.
> > >
> > >
> > > > > but it is
> > > > > not a special state in that device behaves normally in this
> > > > > state, it does not need to be handles in any special way.
> > > > >
> > > > > Contrast with suspend where device does not respond and
> > > > > must be first resumed.
> > > >
> > > > I think not. Driver can choose to reset the device when the device =
is suspended.
> > > >
> > > > Thanks
> > >
> > > Yes, reset should take device out of suspend.
> >
> > Thanks
> >
> > >
> > > > >
> > > >
> > > >
> > > > >
> > > > > --
> > > > > MST
> > > > >
> > >
>

