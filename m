Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C4713B28A
	for <virtio-comment@lists.linux.dev>; Fri,  5 Jul 2024 05:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720158540; cv=none; b=KWnqy0hUroIWVcy02Hneeb3aZ33KSO7n8vUJ/S8X6m/mb0fnyIQF9Kn/vAL1usf4rn8XprgHGgk2//18d3KUeGBWs4uWGuj1vQlKH/BHL5ms7anGvaJPJjDAfcp+O9TNoyFstu80ePNH/8N5E1NuAEjzomg4O/Omh63INTPPIt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720158540; c=relaxed/simple;
	bh=+nhBnd/b5lPUFeHqM6MRZ1O6dbhVGD7Xa3f/aFRh7cI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q1iR1QdSG6E60it4RJb3IBtxgyW3yN0FRPV7bAakGe7eG/5TWhkemPuN6v+AKRwaHVeCr6Gpi5blcmu7kB2kzRDdbdfUTwqB7BMGVJ4OeZMZ3e1LOE0x2Mgp0YgOb6jsGU2aSeOixvEi1YIbiJ8zcPHsAJXlUgKNQccQtLA4bSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SEf/D2JU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SEf/D2JU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720158536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HgMIuHzY/IQ24OgDXU4m0bIRcklgbA/YDViaB7gSuXo=;
	b=SEf/D2JUvLsxggPBhANvCzULfFddRuSOtM0CGGzz4B9T57bxiH4+aaipFj0U1nU609FSP9
	ynU2ppsh6vM/s0s/BNWNgEUqZ2+FFhSAEuLEzzKAuyqaMnv1+A/mgvaRNPsYluO1pjz3yU
	fJbzTdlza54DfCaRFxxhiG7d8nPKd6U=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-o7vWxZfLOLeZJt9cASRGIQ-1; Fri, 05 Jul 2024 01:48:51 -0400
X-MC-Unique: o7vWxZfLOLeZJt9cASRGIQ-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7034e45cf97so720991a34.3
        for <virtio-comment@lists.linux.dev>; Thu, 04 Jul 2024 22:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720158530; x=1720763330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgMIuHzY/IQ24OgDXU4m0bIRcklgbA/YDViaB7gSuXo=;
        b=Zfb57CIZNxJwtpE1GnHa5adImBCe7jt3WKoanld79zZQqAo4G6kp01IZk6e77q6luZ
         mbSc+/apIuRTvDc5nvM03DbhEYsJCIgzhD9rWqMz7OWFQkJG/IopMX+tm62HUJMma9RH
         nFTM5rgU1jJzkcfp2HAzaDHu7QX3LhMDeGXzMkmB0iDdA2ckjhfCpqSvq6htupuTTu6Y
         s5Ror8IX/Wj7HhQSNBEq4OVgxxjjdK4c6PV6L8kKOk8oj+Pei00Sedeo+MhlOmQFRsXg
         ceDhMoHDuPQ7jE4rv31WZMrqmLWtaaijVZFHZHVdba9rMbzFlnf9oD6EP24bQjmzVxVm
         Z4Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWgVtZmhQgcXRQBtaUbA/tITL8bMmDZz1He8w7txLNhPmIWNyowslMIwf9gwd62A3SHoNPtAHUfPUW3uakjI7ej6nWsvl6P4Yf0QAZ0s/w=
X-Gm-Message-State: AOJu0YxazsvBtx9RFSNj7VasrVsLODkY/j1E8Q9YsXCxxMdNAjA1OjmM
	AXYgbqFhnvStgXg/krgeVvBvCGK90KjJLNbvRwUu5aq0h/dJiGLNLh6Fs++iAG2NL9WLP+nf5bS
	yzQzijXVZeKy1CLT2ef2YKNEqtkJteUUR+a0/vhjewhRYjlzZdOxqdAGA2vZC9Ty7BuPgG7wNMZ
	wnDCp+jocql0PJFg1Q2fpk9fmuXOsVMJAKvrQUGoo=
X-Received: by 2002:a05:6830:3d0b:b0:702:65e:12ec with SMTP id 46e09a7af769-7034a74bdccmr4021340a34.9.1720158530330;
        Thu, 04 Jul 2024 22:48:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu/1kqpl+14XdeC1ZQpGgOrOXol/jpAAkYd3vmAZYhGgBcme85x0B2XntsWeBqqwt7MHZ6Rfr6o65oXF0hIcw=
X-Received: by 2002:a05:6830:3d0b:b0:702:65e:12ec with SMTP id
 46e09a7af769-7034a74bdccmr4021323a34.9.1720158529872; Thu, 04 Jul 2024
 22:48:49 -0700 (PDT)
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
 <20240703050143-mutt-send-email-mst@kernel.org> <CACGkMEtgAD4mPLpf4fLAsVzzUGvbx1+XTxyGLtMSOJzHp-JtGA@mail.gmail.com>
 <20240704042308-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240704042308-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 5 Jul 2024 13:48:36 +0800
Message-ID: <CACGkMEunhLoyWD29ycR6cLU6zX2ME8qoNswUhMHhiHuEMtYVRw@mail.gmail.com>
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

On Thu, Jul 4, 2024 at 4:31=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Thu, Jul 04, 2024 at 01:37:44PM +0800, Jason Wang wrote:
> > On Wed, Jul 3, 2024 at 5:09=E2=80=AFPM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > >
> > > On Wed, Jul 03, 2024 at 04:47:41PM +0800, Jason Wang wrote:
> > > > On Wed, Jul 3, 2024 at 4:36=E2=80=AFPM Michael S. Tsirkin <mst@redh=
at.com> wrote:
> > > > >
> > > > > On Wed, Jul 03, 2024 at 03:59:11PM +0800, Jason Wang wrote:
> > > > > > On Wed, Jul 3, 2024 at 3:37=E2=80=AFPM Lege Wang <lege.wang@jag=
uarmicro.com> wrote:
> > > > > > >
> > > > > > > hi,
> > > > > > >
> > > > > > > > > >
> > > > > > > > > > 1) With the event index, as long as the used index does=
n't pass used
> > > > > > > > > > events you don't need to fetch even index every time
> > > > > > > > > Yeah, I agree VIRTIO_F_EVENT_IDX could help here, but I t=
hink it's a relatively
> > > > > > > > > crude mechanism, I have two questions below:
> > > > > > > > >   1. Used event notification suppression structure is sti=
ll located in
> > > > > > > > >   host memory(in dpu case), I'm not sure whether used_eve=
nt would
> > > > > > > > >   be allowed to update in the running of one virtio devic=
e,
> > > > > > > >
> > > > > > > > What did you mean by "update" here?
> > > > > > > I mean "modify".
> > > > > > >
> > > > > > > >
> > > > > > > > >   If it's allowed,
> > > > > > > > >   seems devices still need to fetch newest used_event inf=
o timely.
> > > > > > > >
> > > > > > > > It depends on how you define "timely", I mean unless the us=
ed event is
> > > > > > > > not crossed, you don't need to fetch it from the main memor=
y?
> > > > > > > Yes, I got your point here.
> > > > > > > >
> > > > > > > > But basically, I meant putting used_event in a cap/register=
 other than
> > > > > > > > inventing something completely new.
> > > > > > > Sorry, I don't get your point here. What does " cap/register =
" mean, used_event
> > > > > > > Is located in main memory, right?
> > > > > >
> > > > > > I meant something like this.
> > > > > >
> > > > > > Introduce a capability to allow the driver to duplicate used_ev=
ent in
> > > > > > the register. And say when the feature is negotiated, the drive=
r MUST
> > > > > > update both used_event in the memory and the register.
> > > > > >
> > > > > > Not saying it can work, but we need to know why it can't work l=
ike this.
> > > > >
> > > > > Well I feel if you are proposing a mechanism it's up to you to
> > > > > explain how it works without races.
> > > >
> > > > I agree, that's why I'm saying "Not saying it can work". But what I
> > > > meant is really to find a way to reuse the event index instead of
> > > > introducing something completely new.
> > > >
> > > > > The current notification suppression works because the read
> > > > > of the notification by the device flushes out used buffer writes =
by
> > > > > the device.
> > > >
> > > > You meant read after write is ordered by PCI?
> > >
> > > pci read responses do not bypass writes, yes.
> > >
> > > > > If you move it to a separate domain (such as the pci bar of the d=
evice)
> > > > > this no longer holds.
> > > >
> > > > Would this be implementation specific details or could it be done b=
y PCI?
> > >
> > > what do you want done by PCI? Generally if things are in one place
> > > they are easier to synchronize, if you spread them around you
> > > need to synchronize them.
> >
> > I meant the synchronization looks more like an implementation detail
> > in the device.  Synchronizing with device internal logic should be
> > simpler than with PCI/memory.
> >
> > For example, did you mean the synchronization between driver write to
> > register (PCI write) and device read from that (internal logic). If
> > needed, an implementation needs to serialize those two, then we are
> > probably fine.
> >
> > Thanks
>
> I mean synchronization between driver write to device and
> device write to memory.

Not sure I get you, I meant put used_event in a register. Driver will
only write to that and the device will only read from that..

>
>
>
> What I see working, is something I proposed a long time ago:
> notify devices about changes to the notification suppression
> area.

I think this is something similar to my proposal, but the difference
is that I propose to carry the notification suppression into the write
(e.g used event).

> This adds more overhead
> driver notify -> device read -> memory read response
> but I think it works.
>
> What I couldn't decide, is whether it's worth sending a notification
> when switching from enable to disable with packed ring.

It needs a feature so for software devices it can choose to not have
those overheads.

Thanks

>
>
>
> --
> MST
>

