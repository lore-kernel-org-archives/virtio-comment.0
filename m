Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA5B28135D
	for <virtio-comment@lists.linux.dev>; Thu, 10 Apr 2025 10:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744281502; cv=none; b=WoJ5I6T59pqmhSGXaQ24ruKVS1/ktF32+bARfawJgnrrDnleOo5eDosT6HabntxYfCuCEeAdZKErbmeR8mP3YcmTg72brShz4TGT+erxqv4xPnc/7hhtrBIZ927pYYjQ7NGWb3O9CDY0tXjqCwSW8KUfy64Tv+IB4lmW5Ib+7Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744281502; c=relaxed/simple;
	bh=L1YsXPWH0DWoafjm325Rbrz7b5cc8vst+MuCOxnG+ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FR5VmnRA6upr/qh/Lm5bsVm7G7ahRnlm80PRT7hQoowAO1MIL7sa/CbY8hBsIK+r0MLObvx60952GBFC0My9OTCMc5zFI16eB9P9Y1brJiEsSWJmxtiB9yOWhGWLELA49Wx5Lc2v8o9PftT/XbEYy7p0eoGxXwRgLfssHMtLs7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hK8Y+C2a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hK8Y+C2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744281498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L1YsXPWH0DWoafjm325Rbrz7b5cc8vst+MuCOxnG+ys=;
	b=hK8Y+C2azot2fjBYkWSvAhRikBqov+SjoTXd+sv6gFVUgNoJbeM5aHIxREh+ZTYokrRIG+
	9mYcDdEFrH2RXiiCFm2h47QJQXiai3O1rV7PhRHa922YnkXeSeBn3bDGxHBgx+B7J31I8e
	41c9UBSj+zR+PUmNCZwxACMhRYfzQIQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581--BIkpjT7PRiJTTA1UQmKag-1; Thu, 10 Apr 2025 06:38:17 -0400
X-MC-Unique: -BIkpjT7PRiJTTA1UQmKag-1
X-Mimecast-MFC-AGG-ID: -BIkpjT7PRiJTTA1UQmKag_1744281497
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-6fedcc61536so24466537b3.0
        for <virtio-comment@lists.linux.dev>; Thu, 10 Apr 2025 03:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744281497; x=1744886297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1YsXPWH0DWoafjm325Rbrz7b5cc8vst+MuCOxnG+ys=;
        b=Haj5S1ETvmOO4kgmsaMG/m9x/Z9VgTCEm4ilY1QrWDNSCPTH3avSfyMK/aTgu0irPe
         Z/Q+oeJdk5auH00BBOJakcTLJ79wkNtKXmcxOhSTTupo/0oGPN0MdloLLm9Gfxas9j+P
         SvDqLB9Vv3oZFbeI/fHLiBTyOkxxxsCfUAWA/z7ksxPGomh9Ts6vkQuCWNpoDuh5hI/y
         dRCE9uVo6KRz6tPiMU6XWYOeiLYW230iXH52AMnekYNW8M/LqjaftSc1wyNqC06Yji/J
         xY7i649OEDtq0k1Gx+A9Xdsuw5u9x98RSDMtwq5MtUoAbZfc4UJyA0/brw99pYMV2XfS
         IFVA==
X-Forwarded-Encrypted: i=1; AJvYcCVCgFiK5HtOB3lt1n7+eyimGwelHoJTYPQ8LVQ2nDb4scZMLVXbi8mlI8KxQDKIWTxMiZbt0izlxkdbynunZw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMdqXiZVZxcX5y5wp1neSERq9a2pbLSz/SQjzqEXftPG5vUT4P
	XBawS3WHelAo4IF0Wr6ZwFwHkrKv4Pi0aOjoOgzQjz5GDIly++aPLtl+b4WT4GvSjqtHbQgaMIx
	BYVeCJGS9kqXKLlI/fUP0yhQHrt8Qu9VbSwfERvzPTuM7SQIiCqgocMoQWF2keZRvS7ltOxHQwn
	05p82tqzLqLwfoz7BZa6EaVv3r7YioN6WisfVLBGE=
X-Gm-Gg: ASbGncu+EaXFYdv009TwTp9CkBbeuB5cm3FLQS2zukGFWoCwv6jwnV2ormqntRbq7dV
	AJhstksUwLftB37K8/oFVJ+ZSUhHAl+eWSjN51uR0PpLpsrlCNyMPxw86a3OQeTEMeDk=
X-Received: by 2002:a05:6902:2311:b0:e6e:19f5:ebd0 with SMTP id 3f1490d57ef6-e703e707400mr3812914276.14.1744281496977;
        Thu, 10 Apr 2025 03:38:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnAitYgSy66WYi0+N43DyenkutCFw1cqrUHh/ZcnE+IY81Xs2Lf53WqzEA97BIGkAapiKVHXDuu/voGRW7sPM=
X-Received: by 2002:a05:6902:2311:b0:e6e:19f5:ebd0 with SMTP id
 3f1490d57ef6-e703e707400mr3812878276.14.1744281496662; Thu, 10 Apr 2025
 03:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGxU2F4m4gO0cRz9kqHOmRG4fKDjUMOnNaes6_dik84T5bNsxQ@mail.gmail.com>
 <20250410085854.3127511-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250410085854.3127511-1-niuxuewei.nxw@antgroup.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 10 Apr 2025 12:38:05 +0200
X-Gm-Features: ATxdqUFmCmKDVWP8XM9kfqitLf4AbTHDZmXQc0M6HVOvskqlu1IuA-k1gxTi7WI
Message-ID: <CAGxU2F4c4E4Bg4F+GhO3pQBk=3Bj7D1jaNisbnyNXUNvjVUs5g@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND] virtio-vsock: Add support for multi devices
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, stefanha@redhat.com, virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _ooxiNHC6CDXWcwVpOa9o4YplDBOsBY05YeQqWyRcBk_1744281497
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Apr 2025 at 10:59, Xuewei Niu <niuxuewei97@gmail.com> wrote:
>
> > On Thu, 10 Apr 2025 at 05:06, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > >
> > > > On Wed, 9 Apr 2025 at 08:56, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > [...]
> > > > > >
> > > > > > The idea is to inform the guest which addresses are reachable by the
> > > > > > device, so the guest can easily decide which device to use. I'm
> > > > > > talking about the destination, so CID_HOST(2), CID_HYPERVISOS(0) or a
> > > > > > sibling VM (CID >=3).
> > > > > >
> > > > > > >
> > > > > > > We have had the guest_cid field in the config space. The guest knows all
> > > > > > > devices present in the VM.
> > > > > >
> > > > > > Okay, but how can the guest figure out from this information which
> > > > > > device to use to talk to the hypervisor or an application in the host?
> > > > > >
> > > > > > >
> > > > > > > If the app tries to bind a random CID, it will fail since the driver can't
> > > > > > > find the device by the CID.
> > > > > >
> > > > > > I'm not talking about the source CID on which to do bind() (which I
> > > > > > honestly don't like), but I'm talking about the destination CID on
> > > > > > which to do connect().
> > > > > >
> > > > > > > > so that the guest knows which device to use depending on the destination
> > > > > > > > CID.
> > > > > > >
> > > > > > > Yes, this is what I was describing in the previous comment. The message
> > > > > > > will be directed to the device by the destination CID.
> > > > > >
> > > > > > Sorry, I don't understand how you do this without having an
> > > > > > information from the device about what addresses it supports. Can you
> > > > > > elaborate a bit?
> > > > >
> > > > > Thanks for your explanation. So things you were talking about are as
> > > > > follows:
> > > > >
> > > > > 1) guest app as a server: the app MUST do `bind()` to a CID that is
> > > > > available in current VM.
> > > > > 2) guest app as a client: the guest driver picks a device and uses the
> > > > > device's CID as src CID, so that the guest app don't need to do `bind()`,
> > > > > but only do `connect()`.
> > > > >
> > > > > The key point is who takes responsibility for picking a device:
> > > > >
> > > > > 1) I prefer the guest app to do such thing: do `bind()` to pick one, then
> > > > > do `connect()`.
> > > >
> > > > Why?
> > > >
> > > > This implies that users must be informed in some way that they must
> > > > use a certain CID to communicate with the VMM and another to
> > > > communicate with the host application, when they could just as well
> > > > use CID_HYPERVISOS(0) or CID_HOST(2) for that and everything would be
> > > > transparent.
> > >
> > > Sorry, I didn't express it clearly. I just listed my original idea and your
> > > idea.
> > >
> > > What types of services can be considered as hypervisor services?
> >
> > TSI.
> > The vsock used to implement it end up in the VMM (i.e. libkrun), right?
> >
> > > In our
> > > case, the kata-agent is a control service for Kata, so could we consider it
> > > as a hypervisor service?
> >
> > Nope, kata-agent is clearly a host application.
>
> Make sense for me.
>
> > > How does the driver know which device is for hypervisor? A possible way is
> > > to add a feature, like `VIRTIO_VSOCK_F_HYPERVISOR`? If it is possible, I
> > > think the CID_HYPERVISOR can still be used in the case of 3+ devices to
> > > maintain the same behavior.
> >
> > Or adding a bitfield in the config space, where the device set several
> > flags depending on what kind of CIDs is able to handle.
> > They don't need to be negotiated, IMHO. Just advertised by the device.
>
> Will do in the v7.

BTW this could be part of another proposal if you don't want to speed this down.
I think we are talking about 2 features here: multiple devices and CID
supported per device.

Stefano

