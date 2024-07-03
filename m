Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E14B136986
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 08:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719996480; cv=none; b=UYzNpr4A06a2qQTqZR07VWgn3K4INGvvHtS6xI1bg2j4ixzGf/qBR/tWHPjk++XscUrE3QT4TWoi8bXUXqohYQpgtMpZ8apDHjC3nel4HVg7Tc2EjtlVpaJBVvpOXJb6pdT4PXatMRqs3IKasZ0ntLu6TEQfPlLJHrrCyuqGiJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719996480; c=relaxed/simple;
	bh=6OAh3nZp3YVvCQ3u9pglJgjJQInXDENrvXiE1madtXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E2JycH7ez99ipBJf0sas2XQsI+bLWYLEofirhBaF7CyGiOrzZg8DLmpsjM9ZBHSDSBLbLFobe8FEzf3OdP/LtzrbxYhDvg5CP30kHotpdND7O0UOWGqKtHVcuhsFKpyZlGa/3oxv9var2nyO/V1pU3eUSGIc3WihN+VHoGKVd/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RH2Y440y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RH2Y440y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719996477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WmIUg8ipgdrYR1GpC1+dreW2y552R3g6hiryN4xvhlI=;
	b=RH2Y440yDB5YR+PiS73mkT3NfV0mmpysxoA0Z045kCzlJf17Bd/Q7HPfcI/ozw5ISuRJGU
	QWV7QHV06+Owm1SBO/5lbLG432dpr7RjY91VoYzSXTpzIQ3I5QphQjzLPHYlT6kOJgrxaA
	6nxn26qQFrVk9Q8pR5VI8XqOjz+cgwA=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-nsuMU51WML65sInEhg_OlQ-1; Wed, 03 Jul 2024 04:47:54 -0400
X-MC-Unique: nsuMU51WML65sInEhg_OlQ-1
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-80fe896d0e4so1193230241.3
        for <virtio-comment@lists.linux.dev>; Wed, 03 Jul 2024 01:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719996474; x=1720601274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmIUg8ipgdrYR1GpC1+dreW2y552R3g6hiryN4xvhlI=;
        b=TNyap4waHK3iiR+yiRQ1vonCrUCke6DYhRHYyr7MPQP5ZM+C/0TCY7Rd4vGpz8Cfj0
         rgte40asDNxjr1mKsSJ0LmyGpyv2X7zTUMdK4zBI2mOKBWIhgY2/wEI0tlLchC2GNQLB
         9qS+GrnUPzN7iHK046FWLn+tUmfsMLS2Tarm6C4jiYM4AUcnQb5pVMKBUJq2GRwvgNU3
         9P8bU2bNXl+C5SSItr2eub08+hgFCkndCbmsEdSonFRgecK4kEWWd0hT193qD8PUKmgJ
         hYyl6zCCQnDSXTReCg3Yo1lJP7U+DnJ1Yj9cnShjzpfZm0El8rA4Frd6aj+1vfHUXFRz
         a/1A==
X-Forwarded-Encrypted: i=1; AJvYcCUGa8/ErqCIisQAuRqc9HVIAVTjclLa0mIwHdtC3gW7W5nl0YMPuL4NdKS5Cvkw84uXsQZAsmjyhIo1tyR3ziiT+FbQkWsOXHEb+7ks1Lw=
X-Gm-Message-State: AOJu0Yyk2MXdA6sEKCU1nr1MLa1iEC4bABDzVFHHGdUtrqXMAmXpkqgo
	eBdZdLBourLMuxeVUFYafC8tGqYCUmCYGpG5Xjv8Kp8QxVBl6DFU+T3xSta9bIUoz8wPdII/A2k
	u7WiasjO9zFOmMFh6ApIQbgX2IEWPzlZn7YBMmS1pddm4/bDUTOYN73ocNC1+/b+7mE4uxitNhY
	YKwvabQ47f0PovVE2ICdagRZPOR6xAF4TVdxJuqgo=
X-Received: by 2002:a05:6102:e14:b0:48f:23b4:1d96 with SMTP id ada2fe7eead31-48faf0a9f5dmr11003662137.16.1719996474214;
        Wed, 03 Jul 2024 01:47:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJttA3j59k0p4hWkhl8qWeq3DRwcxHGhxLFzlJyh/3+lIMoAaR9sGs/dVA+0bT5z59c8jk/yjqO6weRW8VUYI=
X-Received: by 2002:a05:6102:e14:b0:48f:23b4:1d96 with SMTP id
 ada2fe7eead31-48faf0a9f5dmr11003641137.16.1719996473767; Wed, 03 Jul 2024
 01:47:53 -0700 (PDT)
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
 <CACGkMEs46tCCqCcoeJ0nqOn6SRk0qqS72GSwgyt2m5p4BvNnrQ@mail.gmail.com> <20240703042922-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240703042922-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 3 Jul 2024 16:47:41 +0800
Message-ID: <CACGkMEs=ZJdz9=7qNxPMwEk+h3HGTSU3r-R-VfAERXavn_bW_A@mail.gmail.com>
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

On Wed, Jul 3, 2024 at 4:36=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Wed, Jul 03, 2024 at 03:59:11PM +0800, Jason Wang wrote:
> > On Wed, Jul 3, 2024 at 3:37=E2=80=AFPM Lege Wang <lege.wang@jaguarmicro=
.com> wrote:
> > >
> > > hi,
> > >
> > > > > >
> > > > > > 1) With the event index, as long as the used index doesn't pass=
 used
> > > > > > events you don't need to fetch even index every time
> > > > > Yeah, I agree VIRTIO_F_EVENT_IDX could help here, but I think it'=
s a relatively
> > > > > crude mechanism, I have two questions below:
> > > > >   1. Used event notification suppression structure is still locat=
ed in
> > > > >   host memory(in dpu case), I'm not sure whether used_event would
> > > > >   be allowed to update in the running of one virtio device,
> > > >
> > > > What did you mean by "update" here?
> > > I mean "modify".
> > >
> > > >
> > > > >   If it's allowed,
> > > > >   seems devices still need to fetch newest used_event info timely=
.
> > > >
> > > > It depends on how you define "timely", I mean unless the used event=
 is
> > > > not crossed, you don't need to fetch it from the main memory?
> > > Yes, I got your point here.
> > > >
> > > > But basically, I meant putting used_event in a cap/register other t=
han
> > > > inventing something completely new.
> > > Sorry, I don't get your point here. What does " cap/register " mean, =
used_event
> > > Is located in main memory, right?
> >
> > I meant something like this.
> >
> > Introduce a capability to allow the driver to duplicate used_event in
> > the register. And say when the feature is negotiated, the driver MUST
> > update both used_event in the memory and the register.
> >
> > Not saying it can work, but we need to know why it can't work like this=
.
>
> Well I feel if you are proposing a mechanism it's up to you to
> explain how it works without races.

I agree, that's why I'm saying "Not saying it can work". But what I
meant is really to find a way to reuse the event index instead of
introducing something completely new.

> The current notification suppression works because the read
> of the notification by the device flushes out used buffer writes by
> the device.

You meant read after write is ordered by PCI?

> If you move it to a separate domain (such as the pci bar of the device)
> this no longer holds.

Would this be implementation specific details or could it be done by PCI?

>
>
> > >
> > > >
> > > > >   2. According to virtio-spec, for example, if used_event is 0, t=
hen a device
> > > > with
> > > > >   VIRTIO_F_EVENT_IDX would send a used buffer notification to the=
 driver
> > > > after
> > > > >   the first buffer is used (and again after the 65536th buffer), =
should this
> > > > behavior
> > > > >   be strictly followed?
> > > >
> > > > Used index is best effort, and the driver must handle spurious inte=
rrupt.
> > > OK, I'll discuss this info with my colleague, to see whether it could=
 help.
> >
> > Or if you found a bug in the event index, we need to fix it in the spec=
 first.
>
> I don't think there's a bug but it's designed to reside in same memory
> as the used ring.

Actually, I don't fully understand what Lege said, that's why I'm
saying "if it's a bug" ...

>
> > >
> > > > > >
> > > > > > 1) compare disabling via register against memory
> > > > > > 2) compare auto disable against no auto
> > > > > I see, but sorry, currently we don't have any performance numbers=
 yet,
> > > > > but theoretical analysis
> > > >
> > > > This might be also helpful, for example, without this proposal x pc=
i
> > > > transactions per packet, with this proposal y pci transactions per
> > > > packet.
> > > I see, later I'll need to see if there's any performance data based o=
n our simulation
> > > environment to share.
> >
> > Great.
> >
> > >
> > > >
> > > > >  and think it'll help improve performance. Some
> > > > > popular nic also supports this feature, which disables interrupt =
after sending
> > > > > one and needs driver to enable it again. When enabling interrupt =
again, drivers
> > > > > can attach some extra information.
> > > >
> > > > I'm not saying it doesn't make sense, but t
> > > >
> > > > 1) the movitiaton needs to be well explained
> > > Totally agree.
> > >
> > > > 2) we need to know if the existing mechanism can be reused (e.g pla=
ce
> > > > used_event in a register)
> > > That would be better, here the "register" you mentioned is located in=
 a virtio device's
> > > pci bar?
> >
> > Something like this or other place or we can say it could be placed in
> > a transport specific place.
>
> Moving things around changes ordering rules.

Yes, something needs to be addressed.

Thanks

