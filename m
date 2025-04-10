Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5C1202F9A
	for <virtio-comment@lists.linux.dev>; Thu, 10 Apr 2025 08:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275548; cv=none; b=GhMGTfqTdAtqlyT7tQ4cTPSZfaAcseDAk+U09SMdrO6432EluJhMLvaF04H3n2MKhfdxQaGWxpDIxFwtj/Ki4+L61/PFYLwckhHE7NTwx6QMIqr3EuzHozVYWLYl5Ezz9MRp3vyDHviWX8RUspOSRXLbygiJ3oFUdTlv99Ns6Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275548; c=relaxed/simple;
	bh=IFJ/wsYkR7sQeTn0RQut+RarLliOjrMlZAQ9LaXyIgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z0hb1hKDp4htzgFOvM+Q7leoyRAN6xV7ZcifWh0Fc5IUBJLlNee5EuMVsRIV34lU752IQ9qcRvtpzc1SNrtDlr4wuX7E6tZuAfmGQZMmdsM6QexLsIsXPnBJdbPOKC/ooAtI24nJUbUGOARwFrvWEi40jlaei4MI3OuqOSw4wkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKaw7GIt; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKaw7GIt"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-aee79a0f192so390445a12.3
        for <virtio-comment@lists.linux.dev>; Thu, 10 Apr 2025 01:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744275545; x=1744880345; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xU2SrR/Tk0SZYdRrq2SXrzNJOwrXyyKpyBeZ1NXtmjg=;
        b=iKaw7GItEtQh5uGa0ZxK8CaiAfqCTo+3cXcwLa6rOpC3OgLjexHwTvj9w7siuGxRgJ
         yPvf4enpiwJstzi4W9XxUzZKl6LXvCZh9Y1MFUJSgNlbh1Px+7tWcun761wttW99fNQd
         DAjerIpbeX9Q+Y/NHl1DzKyf2Gixs2Xk5SpLQ0axv3L7RaX47Dn720IkpWWa6dRds6WC
         IspGfUxHbStNMm7orE4VwCBDzdtvEElmOiqHoorU1XNAGvg910sZxypphS2LU3xN/xrr
         kvmHiW9Wuupi9VKxDAwsDKBCSwA9q0WDviIvJ9lCGkJcHT5JhWvOi3NEvBxUIF/o/kK7
         5OqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744275545; x=1744880345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xU2SrR/Tk0SZYdRrq2SXrzNJOwrXyyKpyBeZ1NXtmjg=;
        b=aits/D85l58UNVILh2aBBRaU2IHTff8ErxpEulXn+UfD8FmrzynbjLBfAqIh4+z70u
         JKx3t1bpAjNjVX3SU6NEq9j+jaFoa3VUMcni2Ta7aGSsUQkY4TghFW9bE7AYf1F3G8wz
         8aYmCmMbjFNkzuFRutYd9fZJOsJSv5irQF8hNXlpA8LGeV8CM55vBAblqCVzWiSMwXwg
         mHK+pnc2oOFys6UMQ0s4Lice4ESvdbFefA/WjoRYH17fm8YvrFoMGE3sdYHntp/ksGnd
         NaBUBaZcFe3tMuLMRbaUbozBl4kpJpxJzB4coUERtvDg7/TzE3AYFmUmpE7SSQa+tMok
         U1Mg==
X-Forwarded-Encrypted: i=1; AJvYcCU48AWUlfLJyF6d54FnADknP08z1ej1NKdVn2/L7XgW9Ri3tdiAkRt1tNBPXT1ADsXmr2lXBQpIvq3vROIp+A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzhtbks/Eg5SnYl3HOzxpCsr+CTnckUPH8Ti4T50Mzb5Kl3jzJF
	UlicrWqTGCfh1huW2tubiuCDwljBTwXmUSj0283CeHDSUc1lXJLbR4+XEGRhygCJrg==
X-Gm-Gg: ASbGncv+p2RjXU4PJFQt2wRJ1Yc6NBNmIirNYINjz+BFmv/2pJ8Eae1YtjuVk5Yzc5d
	cqarWbhHpiRD+0PX9s9wSmq+/UPHBHKurYfGJyFiDY3F6PUZjSxNVtK4c6teMEKNAnfvRaAaE9p
	DoWgjjQeoYRZUsbw0aen1c/usG6nmN5ePsjjrCNjQ/WE8Fm3vxCgwp4efCBO9InD7ze36mh5ld1
	5+kAMrPuYSsw8ikY21/2vc2x3+nyWP7Y09k9606yzZTwUJ6oQdW76EEYyJ8hvb8AAI8aMBCPPqT
	KC0EsiZ0cVHdeDmBNdkOle7gD7NgGfh3ayjVU1S6/oblgCQKP57o/NSIavt3BS8=
X-Google-Smtp-Source: AGHT+IFd28ogN9AdPnxeGywhUt3JCLaNL0y9lhnIskNz9dsrvBN6RXqNPBNyCuSUVWt/FpVsjRVNig==
X-Received: by 2002:a05:6a20:43a4:b0:1f5:6c94:2cd7 with SMTP id adf61e73a8af0-201695dcac0mr3265243637.42.1744275545387;
        Thu, 10 Apr 2025 01:59:05 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e4f77fsm2798413b3a.139.2025.04.10.01.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 01:59:04 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	parav@nvidia.com,
	stefanha@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v6 RESEND] virtio-vsock: Add support for multi devices
Date: Thu, 10 Apr 2025 16:58:54 +0800
Message-Id: <20250410085854.3127511-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAGxU2F4m4gO0cRz9kqHOmRG4fKDjUMOnNaes6_dik84T5bNsxQ@mail.gmail.com>
References: <CAGxU2F4m4gO0cRz9kqHOmRG4fKDjUMOnNaes6_dik84T5bNsxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Thu, 10 Apr 2025 at 05:06, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> >
> > > On Wed, 9 Apr 2025 at 08:56, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > [...]
> > > > >
> > > > > The idea is to inform the guest which addresses are reachable by the
> > > > > device, so the guest can easily decide which device to use. I'm
> > > > > talking about the destination, so CID_HOST(2), CID_HYPERVISOS(0) or a
> > > > > sibling VM (CID >=3).
> > > > >
> > > > > >
> > > > > > We have had the guest_cid field in the config space. The guest knows all
> > > > > > devices present in the VM.
> > > > >
> > > > > Okay, but how can the guest figure out from this information which
> > > > > device to use to talk to the hypervisor or an application in the host?
> > > > >
> > > > > >
> > > > > > If the app tries to bind a random CID, it will fail since the driver can't
> > > > > > find the device by the CID.
> > > > >
> > > > > I'm not talking about the source CID on which to do bind() (which I
> > > > > honestly don't like), but I'm talking about the destination CID on
> > > > > which to do connect().
> > > > >
> > > > > > > so that the guest knows which device to use depending on the destination
> > > > > > > CID.
> > > > > >
> > > > > > Yes, this is what I was describing in the previous comment. The message
> > > > > > will be directed to the device by the destination CID.
> > > > >
> > > > > Sorry, I don't understand how you do this without having an
> > > > > information from the device about what addresses it supports. Can you
> > > > > elaborate a bit?
> > > >
> > > > Thanks for your explanation. So things you were talking about are as
> > > > follows:
> > > >
> > > > 1) guest app as a server: the app MUST do `bind()` to a CID that is
> > > > available in current VM.
> > > > 2) guest app as a client: the guest driver picks a device and uses the
> > > > device's CID as src CID, so that the guest app don't need to do `bind()`,
> > > > but only do `connect()`.
> > > >
> > > > The key point is who takes responsibility for picking a device:
> > > >
> > > > 1) I prefer the guest app to do such thing: do `bind()` to pick one, then
> > > > do `connect()`.
> > >
> > > Why?
> > >
> > > This implies that users must be informed in some way that they must
> > > use a certain CID to communicate with the VMM and another to
> > > communicate with the host application, when they could just as well
> > > use CID_HYPERVISOS(0) or CID_HOST(2) for that and everything would be
> > > transparent.
> >
> > Sorry, I didn't express it clearly. I just listed my original idea and your
> > idea.
> >
> > What types of services can be considered as hypervisor services?
> 
> TSI.
> The vsock used to implement it end up in the VMM (i.e. libkrun), right?
> 
> > In our
> > case, the kata-agent is a control service for Kata, so could we consider it
> > as a hypervisor service?
> 
> Nope, kata-agent is clearly a host application.

Make sense for me.

> > How does the driver know which device is for hypervisor? A possible way is
> > to add a feature, like `VIRTIO_VSOCK_F_HYPERVISOR`? If it is possible, I
> > think the CID_HYPERVISOR can still be used in the case of 3+ devices to
> > maintain the same behavior.
> 
> Or adding a bitfield in the config space, where the device set several
> flags depending on what kind of CIDs is able to handle.
> They don't need to be negotiated, IMHO. Just advertised by the device.

Will do in the v7.

Thanks,
Xuewei

> > > > 2) You prefer the guest driver: only do `connect()`, and the guest driver
> > > > picks one according to the dst CID.
> > > >
> > > > Am I right?
> > >
> > > Yes, I prefer to keep things simple.
> > >
> > > Obviously what I said works if we only have 2 devices (or at most 3
> > > where one supports only CID_HYPERVISOR, the other only CID_HOST, and
> > > the third CID >=3).
> > > As I anticipated, if we want to support more, then we have to
> > > necessarily go with the original option of this proposal with the
> > > default device, etc.
> > >
> > > That's why IMO we should support both.
> > >
> > > >
> > > > I'm open to both ideas, but I have some concerns:
> > > >
> > > > 1) Two devices are in the different namespaces, e.g. host kernel(vhost) and
> > > > hybrid vsock(vhost-user), which might cause two same CIDs (e.g.
> > > > VMADDR_CID_HOST). If that happened, the driver can't distinguish them.
> > > > Instead, we can avoid this by letting the guest app pick a device.
> > >
> > > Yep, in this case you need that, but how the user knows which source CID
> > > to use?
> >
> > The CID should be confirmed in advance, and users should ensure that there
> > are no conflicts with CIDs.
> 
> Exactly, this is kind of against what we call zero-config for vsock.
> 
> We could look at it the same way as ports, though, where the user has
> to know which one to use to reach a service, so I'm not completely
> against that.
> 
> >
> > > Again I'm not saying we should not implement this proposal, I'm saying
> > > that we should also add the other option in order to keep vsock simple
> > > when you have 2 devices, one used to talk with the VMM and the other
> > > to talk with applications.
> >
> > Got it. Thanks for clarifying this.
> >
> > > > 2) What if the number of VMs is too large? For instance, 1,000 VMs (1,000
> > > > CIDs) will need at least 8000B of config space. (Hmm, it looks like an
> > > > extreme example, I don't know if it will happen in real world.)
> > >
> > > I didn't get sorry, can you elaborate a bit?
> >
> > I misunderstood. I thought you are trying to have an array to save all
> > supported dst CIDs in the case of 3+ devices. Please just ignore this.
> >
> > > Anyway, for me we can also go ahead with this proposal and add the
> > > other one later.
> > > I would like to keep the guest simple, and IMO hiding the complexity
> > > in the driver is not bad for your use case where one device talks to
> > > the VMM and the other talks to applications in the host.
> >
> > Fair enough. I am very glad to see that we can move forward with this
> > feature ;)
> 
> :-)
> 
> Thanks,
> Stefano
