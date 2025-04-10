Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703E01E9B23
	for <virtio-comment@lists.linux.dev>; Thu, 10 Apr 2025 03:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744254362; cv=none; b=f4q1FkO8F3DqJU9HqAmDmbJqb/I6kmoy5kGvqUqedMUWdWf2Rw7wsp62PSihZOlA8g9bV/QYwj4FwjA54Rc+OsF+KHXL/BzdfLrH3ETUo7LvhP8nj6NrcpnUTo7OJ1B2NTDPqIJtNTgdmQb1Q6FJa3CloL8QQaz6buI7+/UeQyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744254362; c=relaxed/simple;
	bh=t/Zjv1pWWxxHt1asi77fKX80YxQ1xXZe8H+lO23iopA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U366eEFW+UH0iipyVtXlzzfsCjM44iynSHsYp2Nes30W7DNwxfPPfIn9f01v+elUxdNrD2mguYhR6uR9F4djvByFjJaV51NkkfKospwQrXtVaH9A+4+F2GAhkYz6FNzZTN4D3lj5a9oxMoynZPVyTt8BMYSGh/hXzZoCiofItBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wb25yHjm; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wb25yHjm"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-226185948ffso3092205ad.0
        for <virtio-comment@lists.linux.dev>; Wed, 09 Apr 2025 20:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744254360; x=1744859160; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuzvWLIF6GgPdlAizW0sj/tei5XJP1oDh++98x5VzP4=;
        b=Wb25yHjmeXekwOtgWQIyOgyc6o3Tzf6Xv75MA6w96LCo9F0JMTFKceAsyu0Yvq20ZD
         wCRsWekRoy1nSzIkKoAhgMMX2mQ0oRdGP6bvVykh5znNQvVD0t3oWlh6wmD9vjJ2axZk
         gLH0787JA71VGVWI8BGG1D2hLZwaONdi469DEOy/TfTPoSFd5I3XvluklJokHKbUxNiD
         6g+F3AVeYrQLjv3ms72PXEPvgohEwOthViKbcyTNMDywl2RFdfGXUAjhP9e/CjSQ9tLL
         QoX2jjTo7oiODRW3+f4okV/TcNabofBeMGl80jvoiy9Td1Fpbreu9Z8lnvrfGmELPolS
         8Cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744254360; x=1744859160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MuzvWLIF6GgPdlAizW0sj/tei5XJP1oDh++98x5VzP4=;
        b=SLccAWGwJQqx9EuGiBRf75EfE9V0ai+QYDPLheSxNPa2I5B9/c4B6pDk3qV2hGfRQY
         0q7BieVRsmOtnlGCZlOgtGyp5454oS/7auievWoSMd/B0G6cnjsgMEcAtFXIgKJi7Erq
         LB1RL/AMoVUO/zdaUK9eSUOuCiqjL6CQkWl9cgMX0zZ2srRaVAzQK5DR9X3bPKGd76tT
         bJzFjRE68saEILYcX4gtc3MbG67u5ywGe/1M/PIwAsBAvVixLM7mKEzpJa0bstvcXQMG
         CSFBdbhoA4J4pXAUumpEKtSTV8OIEIjxXRx541KoWnPrvkUH2Hb1vOtCQxOhOdcbwgGd
         9VVA==
X-Forwarded-Encrypted: i=1; AJvYcCUK1UDoHPD7CgtYgKmsc52u/MjMMGLpsW6c/4bGYZNLDLCaZ9ZAGlLq9/8tSEIUiAkjeoNVCtmEqwUkODo8LA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwV/qvmmGOUafGmn/eQsZKpRE7xZHOGHp1PMjOoahC3NcI/xh38
	bT6BHzJzIDyFL10jmIp0CcLJx+3X+4sT8pW7+fFxZTWeeAHPr/gu
X-Gm-Gg: ASbGncuzTfvrTAoKpoWSxLio8B1H4pHTQU1drkS5N74cltXRe5uWx9k5B25e5WQESxL
	2Mj4xFHuzalD6EPQOkUPo6TGBs1GaPQZjOGwQeH3jB7qg5uO2NpJrzeZlaY2xGKfs+E15A3+xcs
	QDoT66VGienLuI4d47+ZNgXRT42/WglgPRdWgVT6X2S4afrA2IAnOyzpEjqoRAbnfmdJDTrUOTb
	N63cs/Tw8yil0TlFxlsVNBq2yzDqJoFc2iraOreBYdE6ab97gYg2+UfAHLj5iRnakmmn+UkATW+
	z2UfgDc6oGCQj/N6UgH+DF3BRJde/lfWEwYRLjaA8rjOhDHTxTcb4cY475lBs8Q=
X-Google-Smtp-Source: AGHT+IFGeWdmzoWrpljkx9nthPVY9GOhxYr17WKBhq3Fajx54crfDH0QqHE/KVNNfmzEZPAcCQoZqw==
X-Received: by 2002:a17:903:1b67:b0:220:ea90:191e with SMTP id d9443c01a7336-22b2eda927cmr22354845ad.4.1744254359485;
        Wed, 09 Apr 2025 20:05:59 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c93ab8sm19900585ad.110.2025.04.09.20.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:05:58 -0700 (PDT)
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
Date: Thu, 10 Apr 2025 11:05:47 +0800
Message-Id: <20250410030547.3108952-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAGxU2F4EpyYg2z5RKq9C-hTDK3Cb06wKJzB_pF_NH_XipAYw=g@mail.gmail.com>
References: <CAGxU2F4EpyYg2z5RKq9C-hTDK3Cb06wKJzB_pF_NH_XipAYw=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Wed, 9 Apr 2025 at 08:56, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> [...]
> > >
> > > The idea is to inform the guest which addresses are reachable by the
> > > device, so the guest can easily decide which device to use. I'm
> > > talking about the destination, so CID_HOST(2), CID_HYPERVISOS(0) or a
> > > sibling VM (CID >=3).
> > >
> > > >
> > > > We have had the guest_cid field in the config space. The guest knows all
> > > > devices present in the VM.
> > >
> > > Okay, but how can the guest figure out from this information which
> > > device to use to talk to the hypervisor or an application in the host?
> > >
> > > >
> > > > If the app tries to bind a random CID, it will fail since the driver can't
> > > > find the device by the CID.
> > >
> > > I'm not talking about the source CID on which to do bind() (which I
> > > honestly don't like), but I'm talking about the destination CID on
> > > which to do connect().
> > >
> > > > > so that the guest knows which device to use depending on the destination
> > > > > CID.
> > > >
> > > > Yes, this is what I was describing in the previous comment. The message
> > > > will be directed to the device by the destination CID.
> > >
> > > Sorry, I don't understand how you do this without having an
> > > information from the device about what addresses it supports. Can you
> > > elaborate a bit?
> >
> > Thanks for your explanation. So things you were talking about are as
> > follows:
> >
> > 1) guest app as a server: the app MUST do `bind()` to a CID that is
> > available in current VM.
> > 2) guest app as a client: the guest driver picks a device and uses the
> > device's CID as src CID, so that the guest app don't need to do `bind()`,
> > but only do `connect()`.
> >
> > The key point is who takes responsibility for picking a device:
> >
> > 1) I prefer the guest app to do such thing: do `bind()` to pick one, then
> > do `connect()`.
> 
> Why?
> 
> This implies that users must be informed in some way that they must
> use a certain CID to communicate with the VMM and another to
> communicate with the host application, when they could just as well
> use CID_HYPERVISOS(0) or CID_HOST(2) for that and everything would be
> transparent.

Sorry, I didn't express it clearly. I just listed my original idea and your
idea.

What types of services can be considered as hypervisor services? In our
case, the kata-agent is a control service for Kata, so could we consider it
as a hypervisor service?

How does the driver know which device is for hypervisor? A possible way is
to add a feature, like `VIRTIO_VSOCK_F_HYPERVISOR`? If it is possible, I
think the CID_HYPERVISOR can still be used in the case of 3+ devices to
maintain the same behavior.

> > 2) You prefer the guest driver: only do `connect()`, and the guest driver
> > picks one according to the dst CID.
> >
> > Am I right?
> 
> Yes, I prefer to keep things simple.
> 
> Obviously what I said works if we only have 2 devices (or at most 3
> where one supports only CID_HYPERVISOR, the other only CID_HOST, and
> the third CID >=3).
> As I anticipated, if we want to support more, then we have to
> necessarily go with the original option of this proposal with the
> default device, etc.
> 
> That's why IMO we should support both.
> 
> >
> > I'm open to both ideas, but I have some concerns:
> >
> > 1) Two devices are in the different namespaces, e.g. host kernel(vhost) and
> > hybrid vsock(vhost-user), which might cause two same CIDs (e.g.
> > VMADDR_CID_HOST). If that happened, the driver can't distinguish them.
> > Instead, we can avoid this by letting the guest app pick a device.
> 
> Yep, in this case you need that, but how the user knows which source CID
> to use?

The CID should be confirmed in advance, and users should ensure that there
are no conflicts with CIDs.

> Again I'm not saying we should not implement this proposal, I'm saying
> that we should also add the other option in order to keep vsock simple
> when you have 2 devices, one used to talk with the VMM and the other
> to talk with applications.

Got it. Thanks for clarifying this.

> > 2) What if the number of VMs is too large? For instance, 1,000 VMs (1,000
> > CIDs) will need at least 8000B of config space. (Hmm, it looks like an
> > extreme example, I don't know if it will happen in real world.)
> 
> I didn't get sorry, can you elaborate a bit?

I misunderstood. I thought you are trying to have an array to save all
supported dst CIDs in the case of 3+ devices. Please just ignore this.

> Anyway, for me we can also go ahead with this proposal and add the
> other one later.
> I would like to keep the guest simple, and IMO hiding the complexity
> in the driver is not bad for your use case where one device talks to
> the VMM and the other talks to applications in the host.

Fair enough. I am very glad to see that we can move forward with this
feature ;)

Big thanks to you!
Xuewei

> Thanks,
> Stefano
