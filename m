Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC363DDA9
	for <virtio-comment@lists.linux.dev>; Thu,  4 Jul 2024 05:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720071481; cv=none; b=uIrH+qtiImL+PEyXTN8x7YApWupvGVlGqYSFOe3xA+TlHr+icx8IZ2kRcp4TRHtlzZeqvGP+KaAITzckrSqkKEr0OU471fltxRGw7QrjzMQsc3kHn3AsTML4EqHUQfbB0XwL4oSUlZhdbgJqdUCmjffo3VYi/GgJKQ9F6m3dHqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720071481; c=relaxed/simple;
	bh=SjWe6MhzMKhtshkKY+nR5R/kYZ/P6AciI0/7x6VhEPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ht//ItqvwTvK4ma8Rj8xMPUCD+rxDue1cXu4kTk61wWuBS6/uRyfu2R87e+fxhpxjWVxfVezGoKpHLG5rl5gn4bb9sMsU5FNDO0gSl5otGzuEgfmv8Uv651yiraZvGd2urk47u9L8BqCxENcHxvV0GnfA5H8LHFxh5ezFPFFvKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f0uVUWTD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f0uVUWTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720071478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1CGqTA+s74yDXx/9z8lAu8X9CeH4zVl3AGeBXCTrufo=;
	b=f0uVUWTDM9um7QqJuoI7B3AhJGsFeJ0Q8o4EwSlbQoXhqUEsB1/Kf7ebQdazwJjRdCuUPW
	3W7M5nwDBixZvRkVVXEqisZFj0muy3vtSxH4N3HnIXN4JYWxifFKx0EFQEppIh5IsKVy6k
	0JfGem2VF/aTGVI0UR11qpCGsW/Npq8=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-yTMzpVuqMdKi5gdQDN7q4w-1; Thu, 04 Jul 2024 01:37:56 -0400
X-MC-Unique: yTMzpVuqMdKi5gdQDN7q4w-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-25e1b41efedso365714fac.2
        for <virtio-comment@lists.linux.dev>; Wed, 03 Jul 2024 22:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720071476; x=1720676276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CGqTA+s74yDXx/9z8lAu8X9CeH4zVl3AGeBXCTrufo=;
        b=KKBWvhGIN9oUv7+3AvT7fEgR/jNWmTAhDLzoaLHkI7TpzCGJ7F270lpx9+LRSSjQ4O
         BU2Fbrd+WBgJ9/Wq2pqkRvmgC0NH4hpvyNnN3rGKOdWgtmy4gusaUsYQ9khd5yNn7oBB
         vgtxBo+xMJBuDNkVMmQrxIe9YwmWPXnidCsdYZLngzrcYfOSatOuHwzOD6j9NPm0g4kJ
         Y5Jy20lKVtW2Y8s1+a8MGKv7tj7sfQ3fbuGAo7v/a1du+gPGg4meuXNhsXYrvcfl96dh
         1AZtXx/Yscxc4ncaX8z65GrXDDTZf9iEo7X7Fi/6B8t1PUPLG8Nvn4DQnqQmclthqwS0
         Tsqg==
X-Forwarded-Encrypted: i=1; AJvYcCX1TRJfucWWD0eSmtoYfAo4PQoBri38DWqFhL1LA4/g5iirl6KIWaVPD6nJkcaYp/zwLW0aFIpbBUuobghkvFo9R8l1pVOkoqlpmmaG6Ow=
X-Gm-Message-State: AOJu0YxgVQ0xReWrStSY+qAZ0facNrBfxSXrxTi7MqHX94d+FkHczI6g
	Kct54RIUmZJnO9LwYi7LI0wza2sbnMWQCagZc1jVQXETub/vSTytJMnm7iFS+KeyIQsNyXNVMBX
	AYkuzX1NC4cXl+rzeoZOTcvTzAXi7KOaribISi699fmBkYYbG6BIlRuZRhirOLzmF+yQAKAJ7qe
	Lja5wm62T/wNthqqHBW0/prheDr4KNWY+DYYbaEak=
X-Received: by 2002:a05:6870:b48e:b0:254:a917:cb38 with SMTP id 586e51a60fabf-25e2bb7cfb3mr614312fac.27.1720071476136;
        Wed, 03 Jul 2024 22:37:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1lNLGtuIuteIqOR98WGO9xF2bHQdq3olcM42Z78SG8vwu5LbhkKlAu9hDc7P5oiWvK/U0GDnEgeUmVAco+7k=
X-Received: by 2002:a05:6870:b48e:b0:254:a917:cb38 with SMTP id
 586e51a60fabf-25e2bb7cfb3mr614295fac.27.1720071475663; Wed, 03 Jul 2024
 22:37:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <CACGkMEvrHNnjdgC6Ls=YWRPFxpirCFkbf8_VnNsh-VU4NoK3tw@mail.gmail.com>
 <SI2PR06MB53850C468CF18A489A6E1ED4FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <CACGkMEtzcaUAauzpUdwjS6MEzF-suGLRv5+7cX4PeoAaqEP9hg@mail.gmail.com>
 <SI2PR06MB5385A261415EB70720DA5749FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <CACGkMEs46tCCqCcoeJ0nqOn6SRk0qqS72GSwgyt2m5p4BvNnrQ@mail.gmail.com>
 <20240703042922-mutt-send-email-mst@kernel.org> <CACGkMEs=ZJdz9=7qNxPMwEk+h3HGTSU3r-R-VfAERXavn_bW_A@mail.gmail.com>
 <20240703050143-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240703050143-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 4 Jul 2024 13:37:44 +0800
Message-ID: <CACGkMEtgAD4mPLpf4fLAsVzzUGvbx1+XTxyGLtMSOJzHp-JtGA@mail.gmail.com>
Subject: Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Lege Wang <lege.wang@jaguarmicro.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	"vattunuru@marvell.com" <vattunuru@marvell.com>, "ndabilpuram@marvell.com" <ndabilpuram@marvell.com>, 
	"parav@nvidia.com" <parav@nvidia.com>, Leo Liu <leo.liu@jaguarmicro.com>, 
	Angus Chen <angus.chen@jaguarmicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 5:09=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Wed, Jul 03, 2024 at 04:47:41PM +0800, Jason Wang wrote:
> > On Wed, Jul 3, 2024 at 4:36=E2=80=AFPM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > >
> > > On Wed, Jul 03, 2024 at 03:59:11PM +0800, Jason Wang wrote:
> > > > On Wed, Jul 3, 2024 at 3:37=E2=80=AFPM Lege Wang <lege.wang@jaguarm=
icro.com> wrote:
> > > > >
> > > > > hi,
> > > > >
> > > > > > > >
> > > > > > > > 1) With the event index, as long as the used index doesn't =
pass used
> > > > > > > > events you don't need to fetch even index every time
> > > > > > > Yeah, I agree VIRTIO_F_EVENT_IDX could help here, but I think=
 it's a relatively
> > > > > > > crude mechanism, I have two questions below:
> > > > > > >   1. Used event notification suppression structure is still l=
ocated in
> > > > > > >   host memory(in dpu case), I'm not sure whether used_event w=
ould
> > > > > > >   be allowed to update in the running of one virtio device,
> > > > > >
> > > > > > What did you mean by "update" here?
> > > > > I mean "modify".
> > > > >
> > > > > >
> > > > > > >   If it's allowed,
> > > > > > >   seems devices still need to fetch newest used_event info ti=
mely.
> > > > > >
> > > > > > It depends on how you define "timely", I mean unless the used e=
vent is
> > > > > > not crossed, you don't need to fetch it from the main memory?
> > > > > Yes, I got your point here.
> > > > > >
> > > > > > But basically, I meant putting used_event in a cap/register oth=
er than
> > > > > > inventing something completely new.
> > > > > Sorry, I don't get your point here. What does " cap/register " me=
an, used_event
> > > > > Is located in main memory, right?
> > > >
> > > > I meant something like this.
> > > >
> > > > Introduce a capability to allow the driver to duplicate used_event =
in
> > > > the register. And say when the feature is negotiated, the driver MU=
ST
> > > > update both used_event in the memory and the register.
> > > >
> > > > Not saying it can work, but we need to know why it can't work like =
this.
> > >
> > > Well I feel if you are proposing a mechanism it's up to you to
> > > explain how it works without races.
> >
> > I agree, that's why I'm saying "Not saying it can work". But what I
> > meant is really to find a way to reuse the event index instead of
> > introducing something completely new.
> >
> > > The current notification suppression works because the read
> > > of the notification by the device flushes out used buffer writes by
> > > the device.
> >
> > You meant read after write is ordered by PCI?
>
> pci read responses do not bypass writes, yes.
>
> > > If you move it to a separate domain (such as the pci bar of the devic=
e)
> > > this no longer holds.
> >
> > Would this be implementation specific details or could it be done by PC=
I?
>
> what do you want done by PCI? Generally if things are in one place
> they are easier to synchronize, if you spread them around you
> need to synchronize them.

I meant the synchronization looks more like an implementation detail
in the device.  Synchronizing with device internal logic should be
simpler than with PCI/memory.

For example, did you mean the synchronization between driver write to
register (PCI write) and device read from that (internal logic). If
needed, an implementation needs to serialize those two, then we are
probably fine.

Thanks

