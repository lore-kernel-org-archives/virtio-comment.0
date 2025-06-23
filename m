Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C692A1AA
	for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 09:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672073; cv=none; b=mEb3h6Ev3+YcnVEi68Ho4KEdMW8X4Z8l4q026ilOeQJJ3lUeZgBxGNmAszVIRUWA9vPhKAhx1tZ4YcQQvd2r/mHosAjTy9i8YjiM2ASxfAiiiEFMwPuIaYuynb0vA/HpIjuHKTG/BMJfHq0PAesBCGzYQQ4niZnXU0D3s5GVt94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672073; c=relaxed/simple;
	bh=v2nf/LV6eJ3Qopuxrwm021QZaZVLcZDcyEVMZLY8Zfk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cqbVHeyVlaU0X6S0+lY4oZk/mHOluM+E8W+UOhet2cGYsYOw11KA09rMwDNbuS4KFthBazq1CwJrdEYRQsZnadnVqrZ190//7PBKqEB6jHHTi+IVUfNYjNmKRQp4NNvGV/yfvuze1aXAR8e4Av3OTa5si7x3cqCnI3/oM+QCIKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5N1BtCJ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5N1BtCJ"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-742c3d06de3so4624552b3a.0
        for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 02:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750672071; x=1751276871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NrSqrIGbeGkRwKLzZekFmwDO3b2jSWeTrOumzre1bA=;
        b=N5N1BtCJ92APY3dDuKOL5ybo3EFtX+yw/4JX1KUxNrSoruLCzf6zjenb+ycncOgHrR
         4PXg+eltJMtfwN7DjsupaDOX8Nttgw4KxP1rZxCdGr8poSrmlG8/8mj4vfa3eMjXjfYq
         QwVFaM2/5bHjqPQn/+DQzbIDhcZyDMyGhBuJVUYVsCHmAdpwdQXitMtx6gs/q1kziQxX
         yb6LWCqzatbR8oKekaOUyvzw4knLuT6RvrlyxsMcY0NWC9AGIjXg0kAVhgQRkx3uB4qb
         qAvZ2U/OFD8llf+STI2fc0gBn+jtGkM+D93yUZmJ0QKZNqLmEKUQeLsEatI3a9GYRzDn
         Fnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750672071; x=1751276871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NrSqrIGbeGkRwKLzZekFmwDO3b2jSWeTrOumzre1bA=;
        b=WhQ8E/odqirmV862TGgt4h6m67BrwGv6Xa6a79Z8AaLe/A7X4jR55X4BeMYacv1lg4
         kuEIpr6zsMJ7uG6SSvfbHseAmAGJjg7+K+zbDgoOVWxwTtOqALftTv3zn/IU5K/3ESGT
         aAhJ1okRMlT2sydElB3mQ2xQ0xJgdIL49Jj+d94OguqLBQigoALFmAi8fiCPwZz3XzEP
         O6/iIOy6jUw6hSm9oBAZ0nkxuc0Aqa/QFWXJVTwpAVJ6ynnnumvefYHzz1ZsanXl9PJm
         CZD3UcQaouxZWzH5JOOOTcdnQs/jBvQF9I4WUitTmgz7mHvHI0GEKysjmn43iJFJ977G
         aESQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAvI/+Gcj+aEs+9X7EqZV6G4bmsiEw62r/JpzOO5Zq8TwaV0psTA7MZEpcqQBUWYF7mejwcsLAvNEU/V14+w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzYDLUTSU0DZPCLr1ss1qVmmMDhVBcNnvCDujKxQ2gLgwXKkUY
	THhksSCxFMPKcLGLl3ItncgG7jDEke8m4xyp8V6VnuMb/CTpqQiMLDhxc2dTd7sORdM0YmCX
X-Gm-Gg: ASbGncuVyIULTNOr9rRXlazQIfp3n0+wEBAhGaUmQead4YSVprZsGRrD7kwLLxp89zX
	jxdBmmhtbRi8bFEkphXOeh5kP9vLIWe3icNby7HjsiJT5zE2RR92Jp205bjsD4RzYYWFgUoXIbU
	+njyPmYYXHN5+oY+eNKKG9uojbmxPfo4gLfGssKlXgOszTdF2ruasCCjh2KA40hJH6Ng8YOR+X7
	RBQvmS8wa+ZNh262e5s36tRFJVuFnB5c+8WoCP9smDVItL1k+n/A984v20HLRsibqpLN7/vQGLF
	hmwz845HksHSZ2+OjlaeMHsWi0kBs3M1KPPqkAMSnw92egb0gUzzvEEWigSFG8uD9Ms6TaYQxtA
	Olwdv56ow
X-Google-Smtp-Source: AGHT+IGdSZ3TIMIDbAFQeKo6jcG7TU8AHaraLtoR4mZRmwJpKf5r8t9AFhq6hQA4H+uzDjFZtcVyJw==
X-Received: by 2002:a05:6a00:3c90:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-7490da07100mr16895292b3a.21.1750672070390;
        Mon, 23 Jun 2025 02:47:50 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74933e6d117sm3577350b3a.53.2025.06.23.02.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:47:49 -0700 (PDT)
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
Date: Mon, 23 Jun 2025 17:47:36 +0800
Message-Id: <20250623094736.1649323-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CACGkMEsjNw3ELRxf4aZ3=Zh=EsqbTpqKp61C8mVjd_zEAOuW1w@mail.gmail.com>
References: <CACGkMEsjNw3ELRxf4aZ3=Zh=EsqbTpqKp61C8mVjd_zEAOuW1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Thu, Jun 19, 2025 at 10:42 AM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> >
> > > On Wed, Jun 18, 2025 at 5:51 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > >
> > > > > On Wed, Jun 18, 2025 at 1:40 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > >
> > > > > > > On Wed, Jun 18, 2025 at 10:47 AM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > >
> > > > > > > > > On Tue, Jun 17, 2025 at 3:46 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > Resend, because it isn’t listed in the mailing list due to my mistake.
> > > > > > > > > >
> > > > > > > > > > > On Mon, Jun 16, 2025 at 4:38 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > On Mon, 16 Jun 2025 at 10:29, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > > On Fri, Jun 13, 2025 at 4:46 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > On Fri, 13 Jun 2025 at 06:57, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > On Sat, Apr 12, 2025 at 10:39 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > This patch brings a new feature, called "multi devices", to the virtio
> > > > > > > > > > > > > > > > > > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> > > > > > > > > > > > > > > > > > > "device_order" field to the config for the virtio vsock.
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > == Motivition ==
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > Vsock is a lightweight and widely used data exchange mechanism between host
> > > > > > > > > > > > > > > > > > > and guest. Currently, the virtio-vsock only supports one device, resulting
> > > > > > > > > > > > > > > > > > > in the inability to enable more than one backend.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > I wonder which part of the spec forbids more than one device.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > No. The spec, however, is designed for a single device, and lacks some
> > > > > > > > > > > > > > > > > specifications for multiple devices.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > For example, we should have a mechanism to select a device from all to
> > > > > > > > > > > > > > > > > communicate with a peer.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I wonder if this is a:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > 1) mechanism that needs to be mandated by the device
> > > > > > > > > > > > >
> > > > > > > > > > > > > Yes.
> > > > > > > > > > > > >
> > > > > > > > > > > > > > 2) a policy that is allowed to be tweaked by the user as TCP/IP did
> > > > > > > > > > > > >
> > > > > > > > > > > > > Not allowed in the current version.
> > > > > > > > > > > > >
> > > > > > > > > > > > > > (Note anyhow the driver can override what the device suggests...)
> > > > > > > > > > > >
> > > > > > > > > > > > I think we should follow what we described in the spec:
> > > > > > > > > > > > "The virtio socket device is a zero-configuration socket communications device."
> > > > > > > > > > >
> > > > > > > > > > > We probably need to define "configuration" first.
> > > > > > > > > > >
> > > > > > > > > > > For example, if it means zero configuration from the user, it does not
> > > > > > > > > > > conflict with 2), the driver can use its own algorithm to elect a
> > > > > > > > > > > "default" device.
> > > > > > > > > >
> > > > > > > > > > IMHO, it can be done, but it is not the current design.
> > > > > > > > >
> > > > > > > > > Well, you need at least explain the advantages or why you choose to do this.
> > > > > > > >
> > > > > > > > I listed in the previous message. Maybe it is not clear enough. I'll try to
> > > > > > > > explain it again.
> > > > > > > >
> > > > > > > > I think people should pick up the device by a `bind()` call, which takes a
> > > > > > > > CID as an argument.
> > > > > > > >
> > > > > > > > Generally, the device is picked up by the source CID, which is achieved
> > > > > > > > through a `bind()` call.
> > > > > > > >
> > > > > > > > The default device, which is equivalent to the current single device, is
> > > > > > > > used to be compatible with the existing applications.
> > > > > > > >
> > > > > > > > Apart from that, the default device is used to communicate with hypervisor
> > > > > > > > for some init works, such as gathering information about other vsock
> > > > > > > > devices.
> > > > > > > >
> > > > > > > > To summarize, users must do `bind()` call explicitly to select the desired
> > > > > > > > device for non-HV-VM communications.
> > > > > > >
> > > > > > > So if I understand correctly you need a way to select the default when
> > > > > > > bind() is not called?
> > > > > >
> > > > > > Yes.
> > > > > >
> > > > > > > > > > I prefer to set the default device for VM-HV communication to do some init
> > > > > > > > > > work. I don't think people have a strong need for this.
> > > > > > > > > >
> > > > > > > > > > > Another perspective, making decisions in guests may be even more
> > > > > > > > > > > helpful for the case where the device is not trusted
> > > > > > > > > >
> > > > > > > > > > How does the guest realize the vsock device is not trusted?
> > > > > > > > >
> > > > > > > > > There're various ways to build trust (for example device attestation)
> > > > > > > > > and more might come in the future.
> > > > > > > > >
> > > > > > > > > > The guest only
> > > > > > > > > > knows the information from its config space, which is provided by the host.
> > > > > > > > >
> > > > > > > > > The way to build trust is probably beyond the scope of virtio, but it
> > > > > > > > > is something we need to consider.
> > > > > > > >
> > > > > > > > Agree with you. If it comes in the future, I think the driver should have
> > > > > > > > the ability to make decisions.
> > > > > > >
> > > > > > >
> > > > > > > Actually, I meant the way to build trust via virtio is something that
> > > > > > > needs to be considered. But now we have other ways to build trust.
> > > > > > > That would result a situlation:
> > > > > > >
> > > > > > > 1) "default" vsock device is not trusted but other might
> > > > > >
> > > > > > I think this topic might be beyond the scope of this patch.
> > > > > >
> > > > > > With the current version, there is only one device supported, which can be
> > > > > > considered as the "default".  We don't have a mechanism to say "we don't
> > > > > > trust you", right?
> > > > >
> > > > > No. I meant we don't have it in the virtio core but we already have it
> > > > > in other layers (for example the transport layer).
> > > >
> > > > Are you referring to virito-vsock transport layer?
> > >
> > > Yes, for example the PCI layer.
> > >
> > > >
> > > > > > That is, it is assumed that we trust the device provided
> > > > > > by the hypervisor.
> > > > > >
> > > > > > This patch is for multiple devices support, based on the same assumption. I
> > > > > > think trust is a good point to consider, but perhaps we have to address it
> > > > > > in the follow-up patches.
> > > > >
> > > > > My point is not about how to build trust, it's about letting the
> > > > > driver decide by itself in some cases.
> > > > >
> > > > > A better way might be something like:
> > > > >
> > > > > "The device_order is a hint for the driver to select a default vsock
> > > > > device. Device MAY choose ...."
> > > >
> > > > Okay, I'll do that.
> > > >
> > > > > >
> > > > > > > or
> > > > > > >
> > > > > > > 2) two device claims that they are all "default"
> > > > > > >
> > > > > > > This means anyhow we need a decision from the driver side so the
> > > > > > > device side order seems to be useless here.
> > > > > >
> > > > > > There is only one default device. The device with the lowest device_order
> > > > > > is considered the default. It is not allowed to have the same device_order.
> > > > >
> > > > > Who can forbid two same device_order? Note that in various security
> > > > > models, hypervisors are not trusted at all.
> > > >
> > > > The driver does. Indeed, the driver is able to deny devices if they violate
> > > > the spec.
> > >
> > > Yes, that's the point, anyhow driver need to do the decision.
> > >
> > > >
> > > > > > > > > > > > So, IMO the guest (driver) should not be allowed to change anything.
> > > > > > > > > > > > E.g. Right now it's not allowed to change the CID assigned by the host (device).
> > > > > > > > > > >
> > > > > > > > > > > A dumb question when having two cids (cid1 and cid2) in the same
> > > > > > > > > > > guest, what happens if src=cid1 and dst=cid2?
> > > > > > > > > >
> > > > > > > > > > The packets will be directed to another application, if any, on the same guest.
> > > > > > > > >
> > > > > > > > > Ok, so in your example, vhost-user-vsock should route those packets
> > > > > > > > > back to kernel vsock?
> > > > > > > >
> > > > > > > > It depends. Two cases are possible:
> > > > > > > >
> > > > > > > > 1. dev0(cid1) and dev1(cid2) are from the same type of backend, e.g.
> > > > > > > > vhost-vsock, so the packets will be routed back as you described.
> > > > > > > > 2. dev0(cid1) from vhost-user-vsock, and dev1(cid2) from vhost-vsock, the
> > > > > > > > packets will be dropped if vhost-user-vsock device can't find a device
> > > > > > > > whose cid is cid2.
> > > > > > >
> > > > > > > Well, this means the behavior depends on the implementation which is not good.
> > > > > >
> > > > > > No, it is not. It depends on whether the device can find a proper
> > > > > > target device based on the dst_cid.
> > > > >
> > > > > This sounds really weird, two cids belong to the same guest. So guests
> > > > > should expect that the two vsock devic can talk to each other?
> > > >
> > > > Yes, a little bit complicated.
> > > >
> > > > Two constraints should be applied:
> > > >
> > > > 1. No CID conflicts within the driver;
> > > > 2. No CID conflicts within the address space.
> > > >
> > > > Here is a diagram to illustrate the situation where it does not violate the
> > > > constraints:
> > > >
> > > >  ┌─ kernel─(as0)────────────────────────────────────────────────────┐
> > > >  │   ┌───────────┐                      ┌───────────┐  ┌───────────┐│
> > > >  │   │ dev0(cid0)│                      │ dev2(cid1)│  │ dev3(cid2)││
> > > >  │   └───┬───────┘                      └───┬───────┘  └────────┬──┘│
> > > >  └───────┼──────────────────────────────────┼───────────────────┼───┘
> > > >   ┌──────┼───────────────────────┐   ┌──────┼───────────────────┼───┐
> > > >   │      │  ┌───────────┐        │   │      │  ┌───────────┐    │   │
> > > >   │      └──► dev0(cid0)│        │   │      └──► dev2(cid1)│    │   │
> > > >   │         └───────────┘        │   │         └───────────┘    │   │
> > > >   │         ┌───────────┐        │   │         ┌───────────┐    │   │
> > > >   │      ┌──► dev1(cid1)│        │   │         │ dev3(cid2)◄────┘   │
> > > >   │      │  └───────────┘     VM0│   │         └───────────┘     VM1│
> > > >   └──────┼───────────────────────┘   └──────────────────────────────┘
> > > >    vhost-user-vsock
> > > > ┌────────┼──────────────────────────────────────────────────────────┐
> > > > │   ┌────┼──────┐                                                   │
> > > > │   │ dev1(cid1)│                                                   │
> > > > │   └───────────┘                                                   │
> > > > └─userapp─(as1)─────────────────────────────────────────────────────┘
> > > >
> > > > - VM0
> > > >     - dev0
> > > >         - dst_cid = 2 (well-known cid): connect to host;
> > > >         - dst_cid = cid1: connect to dev2 (they are in the same as0);
> > > >         - dst_cid = cid2: connect to dev3;
> > > >     - dev1
> > > >         - dst_cid = 2 (well-known cid): connect to userapp;
> > > >         - dst_cid = cid0: failure (no cid0 is available in as1, even though
> > > >         cid1 is available in the VM0);
> > > >         - dst_cid = cid1: connect to dev0;
> > > > - VM1
> > > >     - dev2
> > > >         - dst_cid = 2 (well-known cid): connect to host;
> > > >         - dst_cid = cid0: connect to dev0;
> > > >         - dst_cid = cid2: connect to dev3;
> > > >     - dev3: skip the same as dev2.
> > > >
> > > > So back to your question, my answer is that it depends on the address
> > > > space. Hope it could be helpful.
> > >
> > > This brings an interesting question, for example if vm0 tries to
> > > connect to vm1, how does it know which device it needs to use (lacking
> > > the concept like switch/route/address announcing etc...)?
> >
> > The HV should maintain a table for that. The guest things firstly
> > communicate with the HV, through the default device, to know which device
> > to use.
> 
> It's still not clear to me how things work. For example, we had a
> guest1 with two cid 4 ("default"),5 another guest2 with one cid 6. You
> meant guest1 needs to ask the host to know about which device is
> connected to 6? Or actually any device in guest1 can be used to
> connected to guest2?

I think it is application-level, like micro services? Here are some
diagrams to illustrate the process:

Step1: app0 asks the host: "I want to connect to app1 inside VM1";
Step2: host replies: "Please use source cid=5, and destination cid=6"

+────────+         +───────────────────────────────+    +──────────────────────────────+
│  host  │         │+───────────────+          VM0 │    │                         VM1  │
│service │◀─step1──┤│dev0(cid=4,def)│──┐           │    │                              │
+────────+         │+───────────────+  │           │    │                              │
                   │+───────────────+  │  +───────+│    │+───────────────+     +──────+│
                   ││  dev1(cid=5)  │  └──│ app0  ││    ││dev1(cid=6,def)│     │ app1 ││
                   │+───────────────+     +───────+│    │+───────────────+     +──────+│
                   +───────────────────────────────+    +──────────────────────────────+

Step3: app0 binds (5, -1), and connects to (6, {PORT}) to establish a
connection.

+────────+         +───────────────────────────────+    +──────────────────────────────+
│  host  │         │+───────────────+          VM0 │    │                         VM1  │
│service │         ││dev0(cid=4,def)│              │    │                              │
+────────+         │+───────────────+              │    │                              │
                   │+──────────────bind(5, -1)────+│    │+───────────────+     +──────+│
                 ┌─┤│  dev1(cid=5)  │◀────│ app0  ││    ││dev1(cid=6,def)│─────▶ app1 ││
                 │ │+───────────────+     +───────+│    │+───────────────+     +──────+│
                 │ +───────────────────────────────+    +────────▲─────────────────────+
                 │                                               │                      
                 └───────────────connect(6,PORT)─────────────────┘                      

This is a little bit complicated, but it is dynamic. Another way is to
assign a fixed CID for app1, so app0 can always connect to it without
needing to ask for the host service.

Thanks,
Xuewei

> Thanks
> 
> >
> > Thanks,
> > Xuewei
> >
