Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833DE748A
	for <virtio-comment@lists.linux.dev>; Wed, 11 Sep 2024 05:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726031214; cv=none; b=iBQk/Q6oFKwimMNRWIFdCwrXDt38JuLi8sjR2ehobC4Y4i3Ibv1aApf1YPRMOobkW0J6hq+RfMIoUbaAGKr9uQPpbiuXgA1jkGd1PiE1ocLkihyMqiH96nz3/d5HJ8pXGdzQ6DKi6nL4afHfC7ZlZYFHdw+KJeNMZe1s6A2rWZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726031214; c=relaxed/simple;
	bh=FMjkCho1OWZL/AkhyFk5nOi2iDhSrTaAYkQlc64l4to=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFlWZV3KpSIWHxG29Z09kVSVBeokAMHuUugg7z+5dZp62BLba+DVbzLvILLAdp4Vomch4mG76lfofEU1s1eTXxg1cazm21g/RYPlmDJ4G/HSRbXJlNk5e0zK6nCoYFx8+sTwBUOExE6IFkH7s20MSc9sidcXYk1oRFsOIhflOXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iRUPeYHz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iRUPeYHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726031210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XEdB3V95JpCMeSBbYvbgPeLf/h0gc8ZrJW/JgeRfplI=;
	b=iRUPeYHzazS6qY3Zl0FuKXMBLY8fX5/sI/IPsgaGiHPpb1g81JxeUJT3z/B4mnGovNbZCR
	CkcDWz/vX00cu/TUNMUae9PdGQp0q6Zca7dVfIj0vMS+pO/GMnrrUBTW2iF33oJtnTjXeE
	ftP45BCl8tR0qZurTiRhUbnapcqVkYY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-pY75mGuqOV-wfi5W0FqS7w-1; Wed, 11 Sep 2024 01:06:49 -0400
X-MC-Unique: pY75mGuqOV-wfi5W0FqS7w-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2d882c11ce4so6548309a91.2
        for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 22:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726031208; x=1726636008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XEdB3V95JpCMeSBbYvbgPeLf/h0gc8ZrJW/JgeRfplI=;
        b=q6b1yRS8RIBxZ8+1mW4dMR4uAMgJaUtIHcl9vzSIkQpGAbrv1jHZyBTw6DRsFS7Vnx
         +us/tinr3TlIqtYAzAqfDfZfM4ojQ1WodyzLEq/SZ4DX9Wlze9I2zNu8f9ukSvjan1Uw
         ZGfmy9J7M+khe9oVdbq8rPiSHVSzTdVLD7wQEmWhVCMJwp/lqlyD2d3njEh/nblwzJWW
         IG8wmHdbAr+2RY3mp1OgsFHkHJYZFnZomxswVM38NY9lpDIm7Sw/9kcsoNrep5STpNqm
         3GzON1k175od6edt6ZQel1bUIQ85DLJ0FCgl/FINj8PGrAmIkVH2TJl74eEuAOliW7ir
         p4SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxZwk/YnS2DJIxcAWNidO0gel9UrRmjp/Jqf2cuQNxVZYyTC8HYi50OP8jRJ3NdThg3ViNt+GKZ7iY8T3efA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8dI9D2RuQ9vFvuK3w5HsVUmjgMND/lHacJKrL3KjmG31liruf
	qs+AVlepAPcNLJtwcXq1iI774c6m8aiWJGKcX1MAvNODJzaNfUbxs0rXUWUAPfZ7Z7iL2Btf2m9
	9SIfn1aNflxyQRISuAqUXnPeKg777JWF6uDNlOM+9fPNzPyN0dPiefU6Oql0ic6PqR/2KXI3tm9
	KSzZheZCVY4J+V97gejUffXHakSVW3B5Upb+G56wZPzHOjQ/0YGw==
X-Received: by 2002:a17:90b:4a0f:b0:2d8:7a1c:b7e2 with SMTP id 98e67ed59e1d1-2dad50fa012mr18896957a91.35.1726031208128;
        Tue, 10 Sep 2024 22:06:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuzXeXO8AVMG4kC0oV0pSPxU1+sn98/L+6D3VZZOvBzKDvvTNvZTdSXYhZVX9T/pyTFjz2UVoTsjVgI43dnOQ=
X-Received: by 2002:a17:90b:4a0f:b0:2d8:7a1c:b7e2 with SMTP id
 98e67ed59e1d1-2dad50fa012mr18896934a91.35.1726031207538; Tue, 10 Sep 2024
 22:06:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240910170723.44537-1-parav@nvidia.com> <20240910142850-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87136FC9671ABFF7123A82CADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910162247-mutt-send-email-mst@kernel.org> <IA0PR12MB8713AC1D273671DF459FA254DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <8a42e214-59b1-4085-aec0-0f31be885525@amd.com> <IA0PR12MB871350EE73BFB2B8B60B7E97DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <CACGkMEtUvJhAq9Y-hZ8NroupJgarYhB8qz-cLXNQYrvnoGKgbQ@mail.gmail.com> <5d0cf855-ead0-46a4-8221-d41c0a3be15f@amd.com>
In-Reply-To: <5d0cf855-ead0-46a4-8221-d41c0a3be15f@amd.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 11 Sep 2024 13:06:36 +0800
Message-ID: <CACGkMEuytHXQjv9vKO1scGV34n2e-aHZ4ajUrQK+yYsSGgtLVQ@mail.gmail.com>
Subject: Re: [PATCH] admin: Enable driver to send admin commands before DRIVER_OK
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	Shahaf Shuler <shahafs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 12:42=E2=80=AFPM Zhu Lingshan <lingshan.zhu@amd.com=
> wrote:
>
>
>
> On 9/11/2024 12:38 PM, Jason Wang wrote:
> > On Wed, Sep 11, 2024 at 12:12=E2=80=AFPM Parav Pandit <parav@nvidia.com=
> wrote:
> >>
> >>> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >>> Sent: Wednesday, September 11, 2024 9:30 AM
> >>> To: Parav Pandit <parav@nvidia.com>; Michael S. Tsirkin <mst@redhat.c=
om>
> >>> Cc: virtio-comment@lists.linux.dev; cohuck@redhat.com; Shahaf Shuler
> >>> <shahafs@nvidia.com>
> >>> Subject: Re: [PATCH] admin: Enable driver to send admin commands befo=
re
> >>> DRIVER_OK
> >>>
> >>>
> >>>
> >>> On 9/11/2024 11:37 AM, Parav Pandit wrote:
> >>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>> Sent: Wednesday, September 11, 2024 2:06 AM
> >>>>>
> >>>>> On Tue, Sep 10, 2024 at 07:01:08PM +0000, Parav Pandit wrote:
> >>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>> Sent: Wednesday, September 11, 2024 12:02 AM
> >>>>>>>
> >>>>>>> On Tue, Sep 10, 2024 at 08:07:23PM +0300, Parav Pandit wrote:
> >>>>>>>> Currently the driver can operate administration commands using
> >>>>>>>> administration virtqueues. Administration virtqueues must be
> >>>>>>>> enabled before it reached DRIVER_OK stage similar to all other
> >>>>>>>> queues. This is a limiting factor.
> >>>>>>>>
> >>>>>>>> Many of the device functionalties needs to be discovered and
> >>>>>>>> configured early enough before the driver reaches the DRIVER_OK
> >>>>> stage.
> >>>>>>>> Some examples are:
> >>>>>>>>
> >>>>>>>> a. driver wants to dynamically create the virtqueues of virtio-n=
et
> >>>>>>>>    device with more parameters, for example header data split,
> >>>>>>>>    multiple physical addresses.
> >>>>>>>>    Here, the driver needs to tell PCI device early enough that i=
t no
> >>>>>>>>    longer uses queue_* registers for non admin queues.
> >>>>>>>>
> >>>>>>>> b. driver wants to discover these features and related attribute=
s
> >>>>>>>>    early enough so it has chance to decide to proceed via admin
> >>>>>>>>    cmd interface or proceed to DRIVER_OK and follow the current =
flow.
> >>>>>>>>
> >>>>>>>> To overcome these limitations, introduce a feature bit that
> >>>>>>>> enables the driver to send capabilities related admin commands
> >>>>>>>> before DRIVER_OK via the available interface such as
> >>>>>>>> administration
> >>>>> virtqueue.
> >>>>>>>> Signed-off-by: Parav Pandit <parav@nvidia.com>
> >>>>>>> We were there in 1.0 and it's messy. And next thing you do, you
> >>>>>>> will
> >>>> Also if you can explain what exactly is the mess, if there is one?
> >>> As far as I can see, the spec says:
> >>> Set the DRIVER_OK status bit. At this point the device is =E2=80=9Cli=
ve=E2=80=9D.
> >>>
> >> This patch upgrades this detail. Please read through.
> >>
> >>> And no vqs are active before DRIVER_OK. How can the device assume tha=
t the
> >>> driver is ready before DRIVER_OK?
> >> Device does not assume.
> >> When the feature described in this patch is negotiated, device knows t=
hat AQ will be live before DRIVER_OK.
> >>
> >>> Why admin vq is special?
> >> Because it is used to do fundamental device and driver capabilities di=
scovery.
> > Then you need another transport or a control device.
> So Maybe it is a good chance for me to continue the "transport vq" work?

I think this could be one way.

Thanks

