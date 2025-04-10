Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860D520ADF4
	for <virtio-comment@lists.linux.dev>; Thu, 10 Apr 2025 07:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269684; cv=none; b=ZlNW7cHAnIT7wzAs0sHF+ubrV3Q6Ku8fxuQV9QMgrTIyoF+qYDxxnZ0l3UTFgGLvEPy/0yLHeppjzj8WCgQI7Rvy469jx4Q0ZdPnMTF0tGflTLkCd1QeNgZBbpPiAiEoCw20XW61NbxB7QzLqk19HTUdmZcVa2zuxpfSmXGpnuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269684; c=relaxed/simple;
	bh=3uQKojl889e7gcgMKy3dP3SgiqStzIWdJLj7z2gEoII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pBVIr8kdq6xIXEyumXBvYf1eo4gRilYsRO/xPJHLM0ltVZu1WYYquL8057aOrMHQMjGz28v4IK1GBttCcyriwTS52Iru412ci92MDlhaZF5bek/UGqEu2r+YIQyLbfrw4hH1i9HilCcI1sFrAYhIHR+BVWuitrADSe0OQAGXyuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gtjjFsBU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gtjjFsBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744269681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3uQKojl889e7gcgMKy3dP3SgiqStzIWdJLj7z2gEoII=;
	b=gtjjFsBUo2CNoz6YuFsMx5FdsGf9AGswe1vC17goi2BUWtr6dbxdCkQ21ZALBKZfxfpaEA
	6hXfysBDzbk7DjM1zmB7CO/PiynDu82jMoD7sUkuzLNgIesQz+2wmUZZXU6HxP5RINux5V
	EanHp5uU5yv9c6vmW7DM7VaYYmU6YZ8=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-BBdjJNxVMCaN1KMSb9HbtQ-1; Thu, 10 Apr 2025 03:21:17 -0400
X-MC-Unique: BBdjJNxVMCaN1KMSb9HbtQ-1
X-Mimecast-MFC-AGG-ID: BBdjJNxVMCaN1KMSb9HbtQ_1744269677
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-70494232f1cso7856257b3.3
        for <virtio-comment@lists.linux.dev>; Thu, 10 Apr 2025 00:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269677; x=1744874477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3uQKojl889e7gcgMKy3dP3SgiqStzIWdJLj7z2gEoII=;
        b=JqJJbn75FnjvX3yj88Me+nG2a2r0+tNCfGBIdgbW+uSV1yCH5VaxNZexp3xIdTBX9N
         zsU/JWr2JaRNuiBGvW3A+s4sn/pQFIHgNWDIqEwpGElijJcSd6eSqTHnmM7HcLNsvcVc
         Xq/hBAC5eNx8OMR9BpHuytn6ewrJVI318PRDqOcHNrqeXIT6KnDO4sblAJMtWe44D2k2
         zJ2+VQfunkCjke3ICn/3h+avTUmbDvV9Dxad9S4YNeFk5vHdjQpv7gKA7FsEZxskOJ/w
         EayW0sSaWE2afDZvC3yV7xlVFt8JnstyZrZLnuRbPk1W3De4uueLfmiwQWgmZzt/Hrzd
         Ar+A==
X-Forwarded-Encrypted: i=1; AJvYcCWYaadYo3C2m6rqgSU7nOtg4oh//sryJ+h5Ro7p7U9HVl7h8ObRymrw480iLKCMJzjAJ8LERt2uXbpLSWSTZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh+gUBQFA/BvzMaGdwibgf9PuAbc6RYxIvryfaI6eh4Rxd+4p1
	pMJxPno1gfKoXSoQmNo74hxIE8OXi4Dmfl/nYRIzmJ2vL5vMOzrSMTm3SCssNEB20Fl1sd38qjp
	YVb0Ut73PrKu2S1gZFqdhMM7xEjWEAxMY1v9UhR2lrvpNtwKQQAWV5CRPO5q4nyvsgQmcc7CqGk
	KDCrLR/Igw55EHvKf1+JvXAYWG0/OvQJKPz+AFUg4=
X-Gm-Gg: ASbGncudRpfZ7JF95Ki6kso9PmxzpnRQtLUfcK2DrMnnQpiUdge+GzG8YPUN11pFNZu
	Q9n+vihs8wWYaK0xtj8TyzhnMP8yGJQ0cam/Ep5hEeP4srD+yL9zHSqvugJhEbR92XlA=
X-Received: by 2002:a05:690c:4d48:b0:6f6:d01c:af1f with SMTP id 00721157ae682-70549e9ae8bmr27042287b3.16.1744269676982;
        Thu, 10 Apr 2025 00:21:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT7rYRBI7Komu2ic9oI1SXxVFJSVngJtMGypcW72/0Fq04Ca91415XWQCIYid9crEgr7EXch0ZXgpzjf/8J9o=
X-Received: by 2002:a05:690c:4d48:b0:6f6:d01c:af1f with SMTP id
 00721157ae682-70549e9ae8bmr27041997b3.16.1744269676627; Thu, 10 Apr 2025
 00:21:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGxU2F4EpyYg2z5RKq9C-hTDK3Cb06wKJzB_pF_NH_XipAYw=g@mail.gmail.com>
 <20250410030547.3108952-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250410030547.3108952-1-niuxuewei.nxw@antgroup.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 10 Apr 2025 09:21:04 +0200
X-Gm-Features: ATxdqUE3FZ2DMVYvBFe0KNRKJ0SvKDOnE3zuSAhxwIfcds7FWJtpRczIIRp3NZU
Message-ID: <CAGxU2F4m4gO0cRz9kqHOmRG4fKDjUMOnNaes6_dik84T5bNsxQ@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND] virtio-vsock: Add support for multi devices
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, stefanha@redhat.com, virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EaN7iLWVKsvghNz9SysQsN-WEnyUiz-BNMbBWLYaayc_1744269677
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Apr 2025 at 05:06, Xuewei Niu <niuxuewei97@gmail.com> wrote:
>
> > On Wed, 9 Apr 2025 at 08:56, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > [...]
> > > >
> > > > The idea is to inform the guest which addresses are reachable by the
> > > > device, so the guest can easily decide which device to use. I'm
> > > > talking about the destination, so CID_HOST(2), CID_HYPERVISOS(0) or a
> > > > sibling VM (CID >=3).
> > > >
> > > > >
> > > > > We have had the guest_cid field in the config space. The guest knows all
> > > > > devices present in the VM.
> > > >
> > > > Okay, but how can the guest figure out from this information which
> > > > device to use to talk to the hypervisor or an application in the host?
> > > >
> > > > >
> > > > > If the app tries to bind a random CID, it will fail since the driver can't
> > > > > find the device by the CID.
> > > >
> > > > I'm not talking about the source CID on which to do bind() (which I
> > > > honestly don't like), but I'm talking about the destination CID on
> > > > which to do connect().
> > > >
> > > > > > so that the guest knows which device to use depending on the destination
> > > > > > CID.
> > > > >
> > > > > Yes, this is what I was describing in the previous comment. The message
> > > > > will be directed to the device by the destination CID.
> > > >
> > > > Sorry, I don't understand how you do this without having an
> > > > information from the device about what addresses it supports. Can you
> > > > elaborate a bit?
> > >
> > > Thanks for your explanation. So things you were talking about are as
> > > follows:
> > >
> > > 1) guest app as a server: the app MUST do `bind()` to a CID that is
> > > available in current VM.
> > > 2) guest app as a client: the guest driver picks a device and uses the
> > > device's CID as src CID, so that the guest app don't need to do `bind()`,
> > > but only do `connect()`.
> > >
> > > The key point is who takes responsibility for picking a device:
> > >
> > > 1) I prefer the guest app to do such thing: do `bind()` to pick one, then
> > > do `connect()`.
> >
> > Why?
> >
> > This implies that users must be informed in some way that they must
> > use a certain CID to communicate with the VMM and another to
> > communicate with the host application, when they could just as well
> > use CID_HYPERVISOS(0) or CID_HOST(2) for that and everything would be
> > transparent.
>
> Sorry, I didn't express it clearly. I just listed my original idea and your
> idea.
>
> What types of services can be considered as hypervisor services?

TSI.
The vsock used to implement it end up in the VMM (i.e. libkrun), right?

> In our
> case, the kata-agent is a control service for Kata, so could we consider it
> as a hypervisor service?

Nope, kata-agent is clearly a host application.

>
> How does the driver know which device is for hypervisor? A possible way is
> to add a feature, like `VIRTIO_VSOCK_F_HYPERVISOR`? If it is possible, I
> think the CID_HYPERVISOR can still be used in the case of 3+ devices to
> maintain the same behavior.

Or adding a bitfield in the config space, where the device set several
flags depending on what kind of CIDs is able to handle.
They don't need to be negotiated, IMHO. Just advertised by the device.

>
> > > 2) You prefer the guest driver: only do `connect()`, and the guest driver
> > > picks one according to the dst CID.
> > >
> > > Am I right?
> >
> > Yes, I prefer to keep things simple.
> >
> > Obviously what I said works if we only have 2 devices (or at most 3
> > where one supports only CID_HYPERVISOR, the other only CID_HOST, and
> > the third CID >=3).
> > As I anticipated, if we want to support more, then we have to
> > necessarily go with the original option of this proposal with the
> > default device, etc.
> >
> > That's why IMO we should support both.
> >
> > >
> > > I'm open to both ideas, but I have some concerns:
> > >
> > > 1) Two devices are in the different namespaces, e.g. host kernel(vhost) and
> > > hybrid vsock(vhost-user), which might cause two same CIDs (e.g.
> > > VMADDR_CID_HOST). If that happened, the driver can't distinguish them.
> > > Instead, we can avoid this by letting the guest app pick a device.
> >
> > Yep, in this case you need that, but how the user knows which source CID
> > to use?
>
> The CID should be confirmed in advance, and users should ensure that there
> are no conflicts with CIDs.

Exactly, this is kind of against what we call zero-config for vsock.

We could look at it the same way as ports, though, where the user has
to know which one to use to reach a service, so I'm not completely
against that.

>
> > Again I'm not saying we should not implement this proposal, I'm saying
> > that we should also add the other option in order to keep vsock simple
> > when you have 2 devices, one used to talk with the VMM and the other
> > to talk with applications.
>
> Got it. Thanks for clarifying this.
>
> > > 2) What if the number of VMs is too large? For instance, 1,000 VMs (1,000
> > > CIDs) will need at least 8000B of config space. (Hmm, it looks like an
> > > extreme example, I don't know if it will happen in real world.)
> >
> > I didn't get sorry, can you elaborate a bit?
>
> I misunderstood. I thought you are trying to have an array to save all
> supported dst CIDs in the case of 3+ devices. Please just ignore this.
>
> > Anyway, for me we can also go ahead with this proposal and add the
> > other one later.
> > I would like to keep the guest simple, and IMO hiding the complexity
> > in the driver is not bad for your use case where one device talks to
> > the VMM and the other talks to applications in the host.
>
> Fair enough. I am very glad to see that we can move forward with this
> feature ;)

:-)

Thanks,
Stefano

