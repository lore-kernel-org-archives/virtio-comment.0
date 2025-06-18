Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBABD15746E
	for <virtio-comment@lists.linux.dev>; Wed, 18 Jun 2025 02:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750214838; cv=none; b=PAnRcEmVwIzPvl+DlbYBRpIXn+z1g8O7Yv1MlegovjeTbGLJQij/tdR8k9fQkKSZ9ky37cXN8YYPrFS6stz1TaVCZgXxHbfe+I1V9IM/7EcQQKNFFWC+X/BMahFm/JGNJ0hooTz8rGs6ylO/LR5FeqHX05QXD9bQ2E45p/mbOh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750214838; c=relaxed/simple;
	bh=kPiPvX8EvaBchcL1aoqiRiMXB1tKIwtpOHc+38I2jhE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qBeBhQVS4met9L2Y2mZN/i2Ie48KQL7lujvqykPgIc41tf31QE1uCphumAGI/3Z3brvyR6HNUPV9+oxEQTOUoAwukS6MvffaOrdAUq4EjC3+fG3ExXjt7CMVa0C9DNdp2frAJaL0RCfcwAW94hLqyNA18VIF/CNpvwRgzG/Gamw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=To5VMtnL; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="To5VMtnL"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b31bca0a32bso947799a12.2
        for <virtio-comment@lists.linux.dev>; Tue, 17 Jun 2025 19:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750214836; x=1750819636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWDN8yXK7mF24/cJjXAktevQyIZVpHrQFW0erq+w8Oo=;
        b=To5VMtnLeCsR4KzCcx+lhliMlHRoNHMuyN7MMFZJYSTtf0n6mnrjsVP3/G0IWzU38I
         S6GZWTFvzAdR+wGA6f53DZ1xMtjnRNNB5G672nuY2xL4/GCypsHh7db/unuQI41kldxg
         /BVLlVnawcCABKO6pjCRthLH2KGXAHemg4RtgGMjldPqXMNfFhD3gT9FGO3ptH9cjXtm
         +b0vObs4njN8aCoCteQzxT8Z8fOd7JJQ72Jb+7JMkxpMqn+LLqIBJb9TsIolWtC1/oGJ
         3WiYpg5fzzQ9WGn9YbLHVdJVn2AU8sGOun65zONE9HMH+0YQ4WDa34FKUidjWJpFAZQr
         8mCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750214836; x=1750819636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWDN8yXK7mF24/cJjXAktevQyIZVpHrQFW0erq+w8Oo=;
        b=wZYmxHnfY8x7AR7fQckMvgDC0O6qjqd5JuGTLBXYonCD9LMWdvU4pCKWuyBfP6qPDQ
         SgO6qGfPnofCijA+en2TVlcAM05lZsxCQF/C9zXwo/tdySgDF9cd7Sh9QYSz9ohMqUaY
         ecHn07310VJG/MjF2sdQCLm6XgRGViLRUUKd6cgDgbQZ8XISadCZxaAFZu31bgVMgJBA
         zUlq9RrBo+pvnpQzZLMVZPLLuk0Gvxnkua758cn2kUjSId4GYjNRR0phWAf2SOVTfIQu
         2YMjLh+IWB8Ccl7drPgibrQUA5ltz6dhz5poEZeVJHtZh+GH+fiMkMuHV+wH0vtpm1Lb
         dHTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1iy4dXKLlKXZ3aUH2XdCaTfKDGzJ0gd2MYJdgru8MMIwdEGzexuY1QA0Oj0zK1H5wqntkNri5yodS7rTrJg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7+pKYK1s4m+O4R25/ZODKKPo1TOlUxsbWN6Nr7WPYGglAcNrO
	UxjfZc25agE++iOWiq424zxF7y0b2tTSsxOby4pswFpwUXyrSJlfH4zJ
X-Gm-Gg: ASbGncvQwYq1iqSC79SAPRHdrkX/MCGKuZLKuRxroysiE57RYdHRHuiGawQ+tM/u320
	dU+OmPxwTE/2t4OO8Zeuh8H8s9iFsWBXl6oowz8agy24JV/Wul0l76pD3ATUjtMUbtwGFR/op1b
	6eIGWnOueVaRc6v+rcMZ0d/Sevc4SlZgggKoSjtJm7TM3/n7AAQ67xr35fhA/Gwh6R6+gY8/PCr
	f7eATFk8vSx0kDOCiLEQlrEtSkCHSfyutyLiJ+kcIVxQX0ePYuT0OdMx74lnO2SOceskqtA4kTO
	C5ppIazDUqKccIPEziRMNqfrLdWegdf3rcCFTBe+d7u/dhh7Z71l82Ygwp3BGjeY6nzam1tuI67
	GqESYn35g
X-Google-Smtp-Source: AGHT+IFpp12X9WBylWl61ULgt5TIJ+SAoNWj9adX2ZPLwaBZzL+FVvvya4NQgIAJoZb5o1W0SfPa3A==
X-Received: by 2002:a17:903:120f:b0:234:8eeb:d834 with SMTP id d9443c01a7336-2366b006032mr230658535ad.16.1750214836039;
        Tue, 17 Jun 2025 19:47:16 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm88990645ad.110.2025.06.17.19.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 19:47:15 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: jasowang@redhat.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	parav@nvidia.com,
	sgarzare@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Date: Wed, 18 Jun 2025 10:47:06 +0800
Message-Id: <20250618024706.1364869-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CACGkMEvWwHSQsAiPt9R+VzwgCkhx=mqW8pXOBfHrK6B1Thc2jA@mail.gmail.com>
References: <CACGkMEvWwHSQsAiPt9R+VzwgCkhx=mqW8pXOBfHrK6B1Thc2jA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Tue, Jun 17, 2025 at 3:46 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> >
> > Resend, because it isn’t listed in the mailing list due to my mistake.
> >
> > > On Mon, Jun 16, 2025 at 4:38 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
> > > >
> > > > On Mon, 16 Jun 2025 at 10:29, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > >
> > > > > > On Fri, Jun 13, 2025 at 4:46 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > >
> > > > > > > > On Fri, 13 Jun 2025 at 06:57, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > > On Sat, Apr 12, 2025 at 10:39 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > This patch brings a new feature, called "multi devices", to the virtio
> > > > > > > > > > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> > > > > > > > > > > "device_order" field to the config for the virtio vsock.
> > > > > > > > > > >
> > > > > > > > > > > == Motivition ==
> > > > > > > > > > >
> > > > > > > > > > > Vsock is a lightweight and widely used data exchange mechanism between host
> > > > > > > > > > > and guest. Currently, the virtio-vsock only supports one device, resulting
> > > > > > > > > > > in the inability to enable more than one backend.
> > > > > > > > > >
> > > > > > > > > > I wonder which part of the spec forbids more than one device.
> > > > > > > > >
> > > > > > > > > No. The spec, however, is designed for a single device, and lacks some
> > > > > > > > > specifications for multiple devices.
> > > > > > > > >
> > > > > > > > > For example, we should have a mechanism to select a device from all to
> > > > > > > > > communicate with a peer.
> > > > > >
> > > > > > I wonder if this is a:
> > > > > >
> > > > > > 1) mechanism that needs to be mandated by the device
> > > > >
> > > > > Yes.
> > > > >
> > > > > > 2) a policy that is allowed to be tweaked by the user as TCP/IP did
> > > > >
> > > > > Not allowed in the current version.
> > > > >
> > > > > > (Note anyhow the driver can override what the device suggests...)
> > > >
> > > > I think we should follow what we described in the spec:
> > > > "The virtio socket device is a zero-configuration socket communications device."
> > >
> > > We probably need to define "configuration" first.
> > >
> > > For example, if it means zero configuration from the user, it does not
> > > conflict with 2), the driver can use its own algorithm to elect a
> > > "default" device.
> >
> > IMHO, it can be done, but it is not the current design.
> 
> Well, you need at least explain the advantages or why you choose to do this.

I listed in the previous message. Maybe it is not clear enough. I'll try to
explain it again.

I think people should pick up the device by a `bind()` call, which takes a
CID as an argument.

Generally, the device is picked up by the source CID, which is achieved
through a `bind()` call.

The default device, which is equivalent to the current single device, is
used to be compatible with the existing applications.

Apart from that, the default device is used to communicate with hypervisor
for some init works, such as gathering information about other vsock
devices.

To summarize, users must do `bind()` call explicitly to select the desired
device for non-HV-VM communications.

> > I prefer to set the default device for VM-HV communication to do some init
> > work. I don't think people have a strong need for this.
> >
> > > Another perspective, making decisions in guests may be even more
> > > helpful for the case where the device is not trusted
> >
> > How does the guest realize the vsock device is not trusted?
> 
> There're various ways to build trust (for example device attestation)
> and more might come in the future.
> 
> > The guest only
> > knows the information from its config space, which is provided by the host.
> 
> The way to build trust is probably beyond the scope of virtio, but it
> is something we need to consider.

Agree with you. If it comes in the future, I think the driver should have
the ability to make decisions.

> > > > So, IMO the guest (driver) should not be allowed to change anything.
> > > > E.g. Right now it's not allowed to change the CID assigned by the host (device).
> > >
> > > A dumb question when having two cids (cid1 and cid2) in the same
> > > guest, what happens if src=cid1 and dst=cid2?
> >
> > The packets will be directed to another application, if any, on the same guest.
> 
> Ok, so in your example, vhost-user-vsock should route those packets
> back to kernel vsock?

It depends. Two cases are possible:

1. dev0(cid1) and dev1(cid2) are from the same type of backend, e.g.
vhost-vsock, so the packets will be routed back as you described.
2. dev0(cid1) from vhost-user-vsock, and dev1(cid2) from vhost-vsock, the
packets will be dropped if vhost-user-vsock device can't find a device
whose cid is cid2.

Thanks,
Xuewei

> Thanks
> 
> >
> > Thanks,
> > Xuewei
> >
> > > > Thanks,
> > > > Stefano
> > > >
> > >
> > > Thanks
> >
