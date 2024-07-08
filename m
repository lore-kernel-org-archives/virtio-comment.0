Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57014639
	for <virtio-comment@lists.linux.dev>; Mon,  8 Jul 2024 01:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720402759; cv=none; b=P9JM5f3KzgPiJkmKure/dw5mhQswp1oZcPv/NGVqAsXCbPEAPovQf75R5Fe7vOFjPUIe+JHltvix27jKtk7q8zj3Heki3wnpyB5SDlIN+clgwa/9njFWnFT8nirOR1dG+LUb5n0bxNOVH4bSYbD9QYNV5N0uRTiYbKsbhvg1ypw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720402759; c=relaxed/simple;
	bh=JythQLs9UvVvTyzznBtGw9chHpsfi06amZEAwTz9/VI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBIN8WRyFhcszMWImd6vWWY7wYc75b92aXh9CdPD7xGBAmJanCzwRlG58fpw61gFRa1aG9oTPkzD+qiC5OUL+TRvIf9b6MZnfTVL8kUg9Q+79e7lbtOEFWNFAfRb8JMfsnjDTbGvxt2HZS5Tr0U/s9SCKfzWrcjXwDHeaIAS5vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uqwovg6G; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uqwovg6G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720402756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2KlOJQWi4+rbQL0pvQkbg4PiMFsuknRcRO+QycRvuOE=;
	b=Uqwovg6G4oQzCeUvCMvZDn9D8LFJCp7hf2xPePXdBQrUHXGlaJkth6RZmkvh2N0KePnL7p
	Tq5xX41on1Iz+tD4FACCJLXW6TvjyyN2VgO9hwhuPgughXeMqOAUbKgUjhfgGsqPxl/ulL
	ZdTQ7H7l4+tJIWMk7BZtgMmZrF3iIX4=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-OO64jhR2N7u_dTToXNRNkg-1; Sun, 07 Jul 2024 21:39:15 -0400
X-MC-Unique: OO64jhR2N7u_dTToXNRNkg-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-25cb4261a5cso1454305fac.2
        for <virtio-comment@lists.linux.dev>; Sun, 07 Jul 2024 18:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720402754; x=1721007554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2KlOJQWi4+rbQL0pvQkbg4PiMFsuknRcRO+QycRvuOE=;
        b=ZQ7Zkc7+bmq9xXkZnvWA2CopS0z9OmeohYQYYgV2JjE4Gz8p/IfDlQS9pLjnIdJ1LT
         kSAMF/yMkyRN8LA6wkyb7GUTWBHc1OscSh0DaeoI6CiwPBoc6dU92thLsWniOf5B4eW1
         cfTGOcL89wjy55/47XHJ+XhLwebrNCT2QsYXWosgI3Ez9QQj/gSP+XiOfJrjCO2KPjaN
         a3CahYw7JM7HAuDiD4YgSvPx5WuyINvzk2odwkBxnqv3JmqZtV9hPLbUhwio5Ql6oVF7
         huV9abvbJKHb3xEJEcdmpFVLDoE2rVvMVlk1VZfgXAEkYdUi2dPtBSoV4raEhVLZs1Cr
         w2AA==
X-Forwarded-Encrypted: i=1; AJvYcCUvjHU88+1MCD/FCbX+NFyiiby0jBLMa/xMV/r9oggkgibwlN7CyWCeMCgUO4rX/Pg6XgB6wZfZSu7aWMLUjRQpHy0b/mwDI3skJBaSxFo=
X-Gm-Message-State: AOJu0Yw4t6xbbMg2jRQIGeZJkbYZTwq5pjgIpc+9B/2Bkil+mj5zdUEO
	60S8CmvkGfS3DSoCDNotCHqIvQ4d3rbivjh0Hl/xt0AFXG5iMZcv9gOu1BUhGXNZye+LYyYcQgx
	6LpIZm2M3mbirU8KpoWGIosTg2FC83jjC/koimrmbieEMyHqQNLpaba/E3WllTQvsQB4YKtyB22
	M+KEqTXmh5c5/vmJ/ZEMC9aj8pakAp9jawCuDPGes=
X-Received: by 2002:a05:6870:91d2:b0:23d:a1d0:7334 with SMTP id 586e51a60fabf-25e2ba21e2dmr9294637fac.17.1720402754192;
        Sun, 07 Jul 2024 18:39:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3FYJ4oxOrLAVUTXy05Z2mEkJkEVxTNA1zNmfyT29YDiuEhWXF7FZq7ReomlU4DB0bDFhCp/OWBESOhGPvQkk=
X-Received: by 2002:a05:6870:91d2:b0:23d:a1d0:7334 with SMTP id
 586e51a60fabf-25e2ba21e2dmr9294626fac.17.1720402753761; Sun, 07 Jul 2024
 18:39:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <SI2PR06MB53850C468CF18A489A6E1ED4FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <CACGkMEtzcaUAauzpUdwjS6MEzF-suGLRv5+7cX4PeoAaqEP9hg@mail.gmail.com>
 <SI2PR06MB5385A261415EB70720DA5749FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <CACGkMEs46tCCqCcoeJ0nqOn6SRk0qqS72GSwgyt2m5p4BvNnrQ@mail.gmail.com>
 <20240703042922-mutt-send-email-mst@kernel.org> <CACGkMEs=ZJdz9=7qNxPMwEk+h3HGTSU3r-R-VfAERXavn_bW_A@mail.gmail.com>
 <20240703050143-mutt-send-email-mst@kernel.org> <CACGkMEtgAD4mPLpf4fLAsVzzUGvbx1+XTxyGLtMSOJzHp-JtGA@mail.gmail.com>
 <20240704042308-mutt-send-email-mst@kernel.org> <CACGkMEunhLoyWD29ycR6cLU6zX2ME8qoNswUhMHhiHuEMtYVRw@mail.gmail.com>
 <20240705034732-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240705034732-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 8 Jul 2024 09:39:01 +0800
Message-ID: <CACGkMEtcA+--zuHBGPrpt8z6m-Ubqnc8=TnPu=+vciZKKDmatQ@mail.gmail.com>
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

On Fri, Jul 5, 2024 at 3:48=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Fri, Jul 05, 2024 at 01:48:36PM +0800, Jason Wang wrote:
> > On Thu, Jul 4, 2024 at 4:31=E2=80=AFPM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > >
> > > On Thu, Jul 04, 2024 at 01:37:44PM +0800, Jason Wang wrote:
> > > > On Wed, Jul 3, 2024 at 5:09=E2=80=AFPM Michael S. Tsirkin <mst@redh=
at.com> wrote:
> > > > >
> > > > > On Wed, Jul 03, 2024 at 04:47:41PM +0800, Jason Wang wrote:
> > > > > > On Wed, Jul 3, 2024 at 4:36=E2=80=AFPM Michael S. Tsirkin <mst@=
redhat.com> wrote:
> > > > > > >
> > > > > > > On Wed, Jul 03, 2024 at 03:59:11PM +0800, Jason Wang wrote:
> > > > > > > > On Wed, Jul 3, 2024 at 3:37=E2=80=AFPM Lege Wang <lege.wang=
@jaguarmicro.com> wrote:
> > > > > > > > >
> > > > > > > > > hi,
> > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > 1) With the event index, as long as the used index =
doesn't pass used
> > > > > > > > > > > > events you don't need to fetch even index every tim=
e
> > > > > > > > > > > Yeah, I agree VIRTIO_F_EVENT_IDX could help here, but=
 I think it's a relatively
> > > > > > > > > > > crude mechanism, I have two questions below:
> > > > > > > > > > >   1. Used event notification suppression structure is=
 still located in
> > > > > > > > > > >   host memory(in dpu case), I'm not sure whether used=
_event would
> > > > > > > > > > >   be allowed to update in the running of one virtio d=
evice,
> > > > > > > > > >
> > > > > > > > > > What did you mean by "update" here?
> > > > > > > > > I mean "modify".
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > >   If it's allowed,
> > > > > > > > > > >   seems devices still need to fetch newest used_event=
 info timely.
> > > > > > > > > >
> > > > > > > > > > It depends on how you define "timely", I mean unless th=
e used event is
> > > > > > > > > > not crossed, you don't need to fetch it from the main m=
emory?
> > > > > > > > > Yes, I got your point here.
> > > > > > > > > >
> > > > > > > > > > But basically, I meant putting used_event in a cap/regi=
ster other than
> > > > > > > > > > inventing something completely new.
> > > > > > > > > Sorry, I don't get your point here. What does " cap/regis=
ter " mean, used_event
> > > > > > > > > Is located in main memory, right?
> > > > > > > >
> > > > > > > > I meant something like this.
> > > > > > > >
> > > > > > > > Introduce a capability to allow the driver to duplicate use=
d_event in
> > > > > > > > the register. And say when the feature is negotiated, the d=
river MUST
> > > > > > > > update both used_event in the memory and the register.
> > > > > > > >
> > > > > > > > Not saying it can work, but we need to know why it can't wo=
rk like this.
> > > > > > >
> > > > > > > Well I feel if you are proposing a mechanism it's up to you t=
o
> > > > > > > explain how it works without races.
> > > > > >
> > > > > > I agree, that's why I'm saying "Not saying it can work". But wh=
at I
> > > > > > meant is really to find a way to reuse the event index instead =
of
> > > > > > introducing something completely new.
> > > > > >
> > > > > > > The current notification suppression works because the read
> > > > > > > of the notification by the device flushes out used buffer wri=
tes by
> > > > > > > the device.
> > > > > >
> > > > > > You meant read after write is ordered by PCI?
> > > > >
> > > > > pci read responses do not bypass writes, yes.
> > > > >
> > > > > > > If you move it to a separate domain (such as the pci bar of t=
he device)
> > > > > > > this no longer holds.
> > > > > >
> > > > > > Would this be implementation specific details or could it be do=
ne by PCI?
> > > > >
> > > > > what do you want done by PCI? Generally if things are in one plac=
e
> > > > > they are easier to synchronize, if you spread them around you
> > > > > need to synchronize them.
> > > >
> > > > I meant the synchronization looks more like an implementation detai=
l
> > > > in the device.  Synchronizing with device internal logic should be
> > > > simpler than with PCI/memory.
> > > >
> > > > For example, did you mean the synchronization between driver write =
to
> > > > register (PCI write) and device read from that (internal logic). If
> > > > needed, an implementation needs to serialize those two, then we are
> > > > probably fine.
> > > >
> > > > Thanks
> > >
> > > I mean synchronization between driver write to device and
> > > device write to memory.
> >
> > Not sure I get you, I meant put used_event in a register. Driver will
> > only write to that and the device will only read from that..
>
> But the ring is in driver memory.

Right but which part could be written by both driver and device?

For split virtqueue, avail and descriptor is written by driver. The
used ring is written by device.
For packed virtqueue, avail and used are the same with split and
descriptor ring writes were synchronized with indices.

Or which driver memory writes into its memory needs to be synchronized
with the used_event register? Maybe you can give me an example?

Thanks

