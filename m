Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F6B1D63C5
	for <virtio-comment@lists.linux.dev>; Wed,  9 Apr 2025 09:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744191316; cv=none; b=CFVcshwM6ar5ZHnFkRMzw8QHygOfKmN3KwS9qWnAksGhyIKMSdFoXtiqmFYg/DNiXqQO6MKxt1HutyWageJY+jO8WMOl5/EHYUiy8wb+pLflVPormgu2cW2TSDwRuXJzcOq3jShEanYjzHNQsyDmEAXkWyJRY+uvU/1n3eEm+kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744191316; c=relaxed/simple;
	bh=UGCSqG+X26uuJ09ibCXbZZ9ebsK4gT+TodeTPZVpij0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DnnSHieblCXrdSQwzjNfGQA8A4GytexVTdYxM79aZO+ZdNFRhBI4ukZnSANhFtrLyBWbolyVgMJHXdzz4J7aJSPWbUr1ZTevwStyuwfpt5E7iM5kPa2briQOHMebjLNccydcepe8iBCmWEsy3AlJrSupEFCKzkiB/EfO7h2l2wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vhwe+46J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vhwe+46J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744191313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UGCSqG+X26uuJ09ibCXbZZ9ebsK4gT+TodeTPZVpij0=;
	b=Vhwe+46JT3WpC1Nh5L2BeQy/Odv+6C/ECeT9B3MU+0OistJAv9EEnE1aDwaaFF6d9c+Xds
	ZGCf8tvnJp2n60a8D7eOzCJqPsv6/iidxPv50mKbjRs23nrndBmi3OXXoiiPyj69vSq6RG
	7WNJujkeifHWMxnH841cuvyvdEGeaRo=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-NVq36s1sNKCR020rhYwWpQ-1; Wed, 09 Apr 2025 05:35:12 -0400
X-MC-Unique: NVq36s1sNKCR020rhYwWpQ-1
X-Mimecast-MFC-AGG-ID: NVq36s1sNKCR020rhYwWpQ_1744191312
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-6f27dd44f86so91375597b3.0
        for <virtio-comment@lists.linux.dev>; Wed, 09 Apr 2025 02:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744191311; x=1744796111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGCSqG+X26uuJ09ibCXbZZ9ebsK4gT+TodeTPZVpij0=;
        b=huJq4yHqjaj1tYkandyBNt8fu3Y5yPr2Y8MUfw+9fBJtQQ/GtAPM3h8jFzfdOqdiXU
         nS3KOQToxFGcM2tdYqI7Y6dCypLAJCcM2SSUt/BmRGSAtMDrIaOJS0Et0HqsdAuA4uPo
         8q6QpH18moHJTfVc64ud7gqQjuHgy+ut1VKJ3Kg2wZSyna90J5K4SGJ2Ne9MvOt4jX08
         iTj+lcbq3VVI+bSF04ZS5qzAwvD17yZKesTFRCI4Tt6rYzBuKimF1AvPTnLLRd+uj2/7
         qDuz9aLplcoG/+NOb4Jf1IYXfK/cnDnLCNXYb6lnmBqXlbwuKYKJXn/9TOKII/Nhcier
         vCCA==
X-Forwarded-Encrypted: i=1; AJvYcCX0iiRlAwJjGg/07+C/DFA1oZ1PatDcTHe/7f7Kcxx942ZpBqR5+w9X+NR+OA2iDv65FfJ8MUp8h+I8kNab0g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxThi06R0FuxqDFlidFdhEI2sxxKgMcK1+IJvtrqfKRnEOK50D6
	6Ro9HeXevmvTdLSeQ50vXUVghQfPhB2vo+dFtHInQxQvzBUeGiBBJkSkeRwlyWXRMGsxmJJP10Z
	Qf5daXUsNUo2YMV1QsSXQ+a11Wik0h+b6zE/YgthxHL4CcK2Rx5xzbpgt0M7kPCZ21TQIdUWOCX
	S4NZ7lLPdiCmmo3cOm2rJKXiVmK9wdTbjvIFCnCyH5FoEwBwgGYw==
X-Gm-Gg: ASbGncs730as22RtEGFjXzutw4W7JPQlK1iwp55zjWsrk6dVwvkXvI+i2gpoRQUwTRk
	tV1U0zHhaodI6LshOPAg4+tsWufx2mgYBI2y7Rb/lfYapI0AoxXRVs3+N/6CQoTMWuiM=
X-Received: by 2002:a05:6902:4911:b0:e5a:e6eb:d444 with SMTP id 3f1490d57ef6-e702f598b5cmr3212593276.2.1744191311412;
        Wed, 09 Apr 2025 02:35:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCFZyuPMgGYQRoa7FTr1acr4Vnhx6qDpwv4vJfO5teQYdRWZQ98+r/6M/2v80+NOypbbJqOtPsEbEOyz84zoA=
X-Received: by 2002:a05:6902:4911:b0:e5a:e6eb:d444 with SMTP id
 3f1490d57ef6-e702f598b5cmr3212553276.2.1744191310879; Wed, 09 Apr 2025
 02:35:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGxU2F4Qejw2hd45SduH=OwzUZVR6xYJATRyDskukHU8+2nkGw@mail.gmail.com>
 <20250409065558.3052615-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250409065558.3052615-1-niuxuewei.nxw@antgroup.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 9 Apr 2025 11:34:59 +0200
X-Gm-Features: ATxdqUHqydLMOfaH9bAhNCZE5bHljniP0PytLgR66ZXztSQfFcKwisoTmkHjzN4
Message-ID: <CAGxU2F4EpyYg2z5RKq9C-hTDK3Cb06wKJzB_pF_NH_XipAYw=g@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND] virtio-vsock: Add support for multi devices
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, stefanha@redhat.com, virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iUhCBkbMMeCmFHZhvOPxg-zUSaGAG2Loqw44K98D3VU_1744191312
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Apr 2025 at 08:56, Xuewei Niu <niuxuewei97@gmail.com> wrote:
[...]
> >
> > The idea is to inform the guest which addresses are reachable by the
> > device, so the guest can easily decide which device to use. I'm
> > talking about the destination, so CID_HOST(2), CID_HYPERVISOS(0) or a
> > sibling VM (CID >=3).
> >
> > >
> > > We have had the guest_cid field in the config space. The guest knows all
> > > devices present in the VM.
> >
> > Okay, but how can the guest figure out from this information which
> > device to use to talk to the hypervisor or an application in the host?
> >
> > >
> > > If the app tries to bind a random CID, it will fail since the driver can't
> > > find the device by the CID.
> >
> > I'm not talking about the source CID on which to do bind() (which I
> > honestly don't like), but I'm talking about the destination CID on
> > which to do connect().
> >
> > > > so that the guest knows which device to use depending on the destination
> > > > CID.
> > >
> > > Yes, this is what I was describing in the previous comment. The message
> > > will be directed to the device by the destination CID.
> >
> > Sorry, I don't understand how you do this without having an
> > information from the device about what addresses it supports. Can you
> > elaborate a bit?
>
> Thanks for your explanation. So things you were talking about are as
> follows:
>
> 1) guest app as a server: the app MUST do `bind()` to a CID that is
> available in current VM.
> 2) guest app as a client: the guest driver picks a device and uses the
> device's CID as src CID, so that the guest app don't need to do `bind()`,
> but only do `connect()`.
>
> The key point is who takes responsibility for picking a device:
>
> 1) I prefer the guest app to do such thing: do `bind()` to pick one, then
> do `connect()`.

Why?

This implies that users must be informed in some way that they must
use a certain CID to communicate with the VMM and another to
communicate with the host application, when they could just as well
use CID_HYPERVISOS(0) or CID_HOST(2) for that and everything would be
transparent.

> 2) You prefer the guest driver: only do `connect()`, and the guest driver
> picks one according to the dst CID.
>
> Am I right?

Yes, I prefer to keep things simple.

Obviously what I said works if we only have 2 devices (or at most 3
where one supports only CID_HYPERVISOR, the other only CID_HOST, and
the third CID >=3).
As I anticipated, if we want to support more, then we have to
necessarily go with the original option of this proposal with the
default device, etc.

That's why IMO we should support both.

>
> I'm open to both ideas, but I have some concerns:
>
> 1) Two devices are in the different namespaces, e.g. host kernel(vhost) and
> hybrid vsock(vhost-user), which might cause two same CIDs (e.g.
> VMADDR_CID_HOST). If that happened, the driver can't distinguish them.
> Instead, we can avoid this by letting the guest app pick a device.

Yep, in this case you need that, but how the user knows which source CID to use?
Again I'm not saying we should not implement this proposal, I'm saying
that we should also add the other option in order to keep vsock simple
when you have 2 devices, one used to talk with the VMM and the other
to talk with applications.

> 2) What if the number of VMs is too large? For instance, 1,000 VMs (1,000
> CIDs) will need at least 8000B of config space. (Hmm, it looks like an
> extreme example, I don't know if it will happen in real world.)

I didn't get sorry, can you elaborate a bit?

Anyway, for me we can also go ahead with this proposal and add the
other one later.
I would like to keep the guest simple, and IMO hiding the complexity
in the driver is not bad for your use case where one device talks to
the VMM and the other talks to applications in the host.

Thanks,
Stefano

