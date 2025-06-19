Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEA3184F
	for <virtio-comment@lists.linux.dev>; Thu, 19 Jun 2025 02:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750300961; cv=none; b=IloL4N1Qp0vb1Ov25091wl7JsP2gqNQhs69tRtt3tVjqEj50pznaVZPAb6w7aFN2BVsUDM8rzNs7+BrN9w00KPgmrkZ10wct/8YJKmtogXdRpafw8XezssC6a/0zd6HpRIB1nSnjl98YWjfTEwkF5XN+fFOaeDfHt7g8Ztov40o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750300961; c=relaxed/simple;
	bh=ljNab++GDypF2iVKiFIhoRPr4UvBm3jNdzPp/ZBi+IU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cZNRDmFuArgKXhGxyJvZn+5Otkyob/wb1yp4PQ3aQXCkMWjaMkip3P15sbwvkvfJ3jkZV58ZvbFd868GvTt5tOm9GBa8LVl4ThCBpP1qAs92J2slBx40SerNLKjRRqI+621NIVsC/kvXq4fVbirbV6BJT40DoyHM7dfHe/LboAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAtIu2W1; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAtIu2W1"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-235ef62066eso4245365ad.3
        for <virtio-comment@lists.linux.dev>; Wed, 18 Jun 2025 19:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750300959; x=1750905759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5X+1LxEnGjdWXpj/TLxlQpUn0NsXoBuoAKP344+Vtjs=;
        b=UAtIu2W1UwyOlqjr0PfCk3WLlQrxBaAdXxMLmqpMBSZd0mQKpJwEL42i8dYRdMyh4z
         LoTvJaa/rh+37mIkhsccNCaSBupEZ1aScf9QGYl/M/Wsg3o/KrOMGXX4d8VK+Aqc36lU
         rdSx7COj1D1iIDE7e8AXBMmafMcdlSmOQ29qDDFD98zFvF6nqoNNwCVDh1kJJa+2u7pg
         1EZE5ELMCyRbMP4eFL0SLP6FlDHys2ZAFlqnQMZogzUujWWnqd40T7xmk21bKJkEHc4q
         vZZC4NhJ++3weR1DpWc0H0KsEuMwTCGGBLVom10v8wDcB1Y/AWnj3eJHoyZh+bfe2fuW
         Pbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750300959; x=1750905759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5X+1LxEnGjdWXpj/TLxlQpUn0NsXoBuoAKP344+Vtjs=;
        b=j8t/i/Ccno/QYoIVJHVh9go3Nh4OO7Fr77OmS38ajrOi6WkopltIKSQIo8mSvRYdM4
         03tafiTGY6DAFuTYUkuSrqmtVBdkDRuMCUysC+16vHTtc8yId2nuRliLLikXMBVF47Zi
         WgUGuxJSOQC3jDVmb/pyaDZ+SEEGv+wrFFVX4R6UwDOISz8J1y09jVQ4POHdi6ycqe5f
         Q6C0izw8kADQig1MLNr0nOuPsDsieepvwlFnUgsvNKNEMQ1bl39JY68wSh4l9rO9EpsV
         fOTpMwXejoahWDUZ+PlwpNFMi1IF9QiuVXvSAudaxI/Q1Xqlw/aRu3ToxtdHfrljf2PL
         /ylA==
X-Forwarded-Encrypted: i=1; AJvYcCUwepxNW25YmITNUG4bTV8lYr8zaiP7zM5Y9xF3uMSy+qPakiKLfU55ad7l4d/gr0KKKXYegZzakrYgQ7orXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJC7z10Bj+RWiYQT6ue1Bf5/ovSJV688of9D80u6L71JrI/cJJ
	IsCOZtQwQF3JMjk90KWj2LM8a5r0tE5vWxS3TxiA4XIZTWgHvcKuj7lf
X-Gm-Gg: ASbGncswk6jxLivB+B7B3ZCP7Ny7JLsBZNvzW/L8WfANkOaHoSdRpKczeQqtIYTfMdh
	gQbPXuyLWAvKNaYTJDjZBIXNaSwG6Lrp10mEXHBFQl8kuzDGVgL875XQlEWJKk+q0T5zQ9miM+p
	WQGRO5ZnJZXhpSdfiGvtrA8pjqhTmlM29JaClEppDzxJGHCmV5OBQDr85SNPyMd8NE9CE3xj/DT
	bvjXYsD5V1OkdKVnphaKoCaSBgKFQTC+cOeCoM+/2T/DddLWrD5vNidDFjwzYU8mbFUmXIiLPJd
	y02VwFLorc35zke04s/i/8SXXidd40UeA5WZn+0vwdWa/14XnLV9fnA4KWPhRKlGES6pDrN0BHd
	f4MPUELJq
X-Google-Smtp-Source: AGHT+IHnsE3Htr7PW6UOVH4kpi8uvLF5YPbj3DO7YAZBQXRUfWIzCJlXsESHPyn34LtRFemUsB/AdQ==
X-Received: by 2002:a17:902:da8c:b0:234:ed31:fcae with SMTP id d9443c01a7336-2366b3504b7mr319069465ad.22.1750300958893;
        Wed, 18 Jun 2025 19:42:38 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2366e4d67adsm89164705ad.75.2025.06.18.19.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 19:42:38 -0700 (PDT)
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
Date: Thu, 19 Jun 2025 10:42:27 +0800
Message-Id: <20250619024227.1423598-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CACGkMEseO0Y2jTYNswvdcr9ihN9ZN7s-TXGMNdLyHwRyNFys2g@mail.gmail.com>
References: <CACGkMEseO0Y2jTYNswvdcr9ihN9ZN7s-TXGMNdLyHwRyNFys2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Wed, Jun 18, 2025 at 5:51 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> >
> > > On Wed, Jun 18, 2025 at 1:40 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > >
> > > > > On Wed, Jun 18, 2025 at 10:47 AM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > >
> > > > > > > On Tue, Jun 17, 2025 at 3:46 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > >
> > > > > > > > Resend, because it isn’t listed in the mailing list due to my mistake.
> > > > > > > >
> > > > > > > > > On Mon, Jun 16, 2025 at 4:38 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Mon, 16 Jun 2025 at 10:29, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > > On Fri, Jun 13, 2025 at 4:46 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > > On Fri, 13 Jun 2025 at 06:57, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > On Sat, Apr 12, 2025 at 10:39 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > This patch brings a new feature, called "multi devices", to the virtio
> > > > > > > > > > > > > > > > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> > > > > > > > > > > > > > > > > "device_order" field to the config for the virtio vsock.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > == Motivition ==
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Vsock is a lightweight and widely used data exchange mechanism between host
> > > > > > > > > > > > > > > > > and guest. Currently, the virtio-vsock only supports one device, resulting
> > > > > > > > > > > > > > > > > in the inability to enable more than one backend.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > I wonder which part of the spec forbids more than one device.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > No. The spec, however, is designed for a single device, and lacks some
> > > > > > > > > > > > > > > specifications for multiple devices.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > For example, we should have a mechanism to select a device from all to
> > > > > > > > > > > > > > > communicate with a peer.
> > > > > > > > > > > >
> > > > > > > > > > > > I wonder if this is a:
> > > > > > > > > > > >
> > > > > > > > > > > > 1) mechanism that needs to be mandated by the device
> > > > > > > > > > >
> > > > > > > > > > > Yes.
> > > > > > > > > > >
> > > > > > > > > > > > 2) a policy that is allowed to be tweaked by the user as TCP/IP did
> > > > > > > > > > >
> > > > > > > > > > > Not allowed in the current version.
> > > > > > > > > > >
> > > > > > > > > > > > (Note anyhow the driver can override what the device suggests...)
> > > > > > > > > >
> > > > > > > > > > I think we should follow what we described in the spec:
> > > > > > > > > > "The virtio socket device is a zero-configuration socket communications device."
> > > > > > > > >
> > > > > > > > > We probably need to define "configuration" first.
> > > > > > > > >
> > > > > > > > > For example, if it means zero configuration from the user, it does not
> > > > > > > > > conflict with 2), the driver can use its own algorithm to elect a
> > > > > > > > > "default" device.
> > > > > > > >
> > > > > > > > IMHO, it can be done, but it is not the current design.
> > > > > > >
> > > > > > > Well, you need at least explain the advantages or why you choose to do this.
> > > > > >
> > > > > > I listed in the previous message. Maybe it is not clear enough. I'll try to
> > > > > > explain it again.
> > > > > >
> > > > > > I think people should pick up the device by a `bind()` call, which takes a
> > > > > > CID as an argument.
> > > > > >
> > > > > > Generally, the device is picked up by the source CID, which is achieved
> > > > > > through a `bind()` call.
> > > > > >
> > > > > > The default device, which is equivalent to the current single device, is
> > > > > > used to be compatible with the existing applications.
> > > > > >
> > > > > > Apart from that, the default device is used to communicate with hypervisor
> > > > > > for some init works, such as gathering information about other vsock
> > > > > > devices.
> > > > > >
> > > > > > To summarize, users must do `bind()` call explicitly to select the desired
> > > > > > device for non-HV-VM communications.
> > > > >
> > > > > So if I understand correctly you need a way to select the default when
> > > > > bind() is not called?
> > > >
> > > > Yes.
> > > >
> > > > > > > > I prefer to set the default device for VM-HV communication to do some init
> > > > > > > > work. I don't think people have a strong need for this.
> > > > > > > >
> > > > > > > > > Another perspective, making decisions in guests may be even more
> > > > > > > > > helpful for the case where the device is not trusted
> > > > > > > >
> > > > > > > > How does the guest realize the vsock device is not trusted?
> > > > > > >
> > > > > > > There're various ways to build trust (for example device attestation)
> > > > > > > and more might come in the future.
> > > > > > >
> > > > > > > > The guest only
> > > > > > > > knows the information from its config space, which is provided by the host.
> > > > > > >
> > > > > > > The way to build trust is probably beyond the scope of virtio, but it
> > > > > > > is something we need to consider.
> > > > > >
> > > > > > Agree with you. If it comes in the future, I think the driver should have
> > > > > > the ability to make decisions.
> > > > >
> > > > >
> > > > > Actually, I meant the way to build trust via virtio is something that
> > > > > needs to be considered. But now we have other ways to build trust.
> > > > > That would result a situlation:
> > > > >
> > > > > 1) "default" vsock device is not trusted but other might
> > > >
> > > > I think this topic might be beyond the scope of this patch.
> > > >
> > > > With the current version, there is only one device supported, which can be
> > > > considered as the "default".  We don't have a mechanism to say "we don't
> > > > trust you", right?
> > >
> > > No. I meant we don't have it in the virtio core but we already have it
> > > in other layers (for example the transport layer).
> >
> > Are you referring to virito-vsock transport layer?
> 
> Yes, for example the PCI layer.
> 
> >
> > > > That is, it is assumed that we trust the device provided
> > > > by the hypervisor.
> > > >
> > > > This patch is for multiple devices support, based on the same assumption. I
> > > > think trust is a good point to consider, but perhaps we have to address it
> > > > in the follow-up patches.
> > >
> > > My point is not about how to build trust, it's about letting the
> > > driver decide by itself in some cases.
> > >
> > > A better way might be something like:
> > >
> > > "The device_order is a hint for the driver to select a default vsock
> > > device. Device MAY choose ...."
> >
> > Okay, I'll do that.
> >
> > > >
> > > > > or
> > > > >
> > > > > 2) two device claims that they are all "default"
> > > > >
> > > > > This means anyhow we need a decision from the driver side so the
> > > > > device side order seems to be useless here.
> > > >
> > > > There is only one default device. The device with the lowest device_order
> > > > is considered the default. It is not allowed to have the same device_order.
> > >
> > > Who can forbid two same device_order? Note that in various security
> > > models, hypervisors are not trusted at all.
> >
> > The driver does. Indeed, the driver is able to deny devices if they violate
> > the spec.
> 
> Yes, that's the point, anyhow driver need to do the decision.
> 
> >
> > > > > > > > > > So, IMO the guest (driver) should not be allowed to change anything.
> > > > > > > > > > E.g. Right now it's not allowed to change the CID assigned by the host (device).
> > > > > > > > >
> > > > > > > > > A dumb question when having two cids (cid1 and cid2) in the same
> > > > > > > > > guest, what happens if src=cid1 and dst=cid2?
> > > > > > > >
> > > > > > > > The packets will be directed to another application, if any, on the same guest.
> > > > > > >
> > > > > > > Ok, so in your example, vhost-user-vsock should route those packets
> > > > > > > back to kernel vsock?
> > > > > >
> > > > > > It depends. Two cases are possible:
> > > > > >
> > > > > > 1. dev0(cid1) and dev1(cid2) are from the same type of backend, e.g.
> > > > > > vhost-vsock, so the packets will be routed back as you described.
> > > > > > 2. dev0(cid1) from vhost-user-vsock, and dev1(cid2) from vhost-vsock, the
> > > > > > packets will be dropped if vhost-user-vsock device can't find a device
> > > > > > whose cid is cid2.
> > > > >
> > > > > Well, this means the behavior depends on the implementation which is not good.
> > > >
> > > > No, it is not. It depends on whether the device can find a proper
> > > > target device based on the dst_cid.
> > >
> > > This sounds really weird, two cids belong to the same guest. So guests
> > > should expect that the two vsock devic can talk to each other?
> >
> > Yes, a little bit complicated.
> >
> > Two constraints should be applied:
> >
> > 1. No CID conflicts within the driver;
> > 2. No CID conflicts within the address space.
> >
> > Here is a diagram to illustrate the situation where it does not violate the
> > constraints:
> >
> >  ┌─ kernel─(as0)────────────────────────────────────────────────────┐
> >  │   ┌───────────┐                      ┌───────────┐  ┌───────────┐│
> >  │   │ dev0(cid0)│                      │ dev2(cid1)│  │ dev3(cid2)││
> >  │   └───┬───────┘                      └───┬───────┘  └────────┬──┘│
> >  └───────┼──────────────────────────────────┼───────────────────┼───┘
> >   ┌──────┼───────────────────────┐   ┌──────┼───────────────────┼───┐
> >   │      │  ┌───────────┐        │   │      │  ┌───────────┐    │   │
> >   │      └──► dev0(cid0)│        │   │      └──► dev2(cid1)│    │   │
> >   │         └───────────┘        │   │         └───────────┘    │   │
> >   │         ┌───────────┐        │   │         ┌───────────┐    │   │
> >   │      ┌──► dev1(cid1)│        │   │         │ dev3(cid2)◄────┘   │
> >   │      │  └───────────┘     VM0│   │         └───────────┘     VM1│
> >   └──────┼───────────────────────┘   └──────────────────────────────┘
> >    vhost-user-vsock
> > ┌────────┼──────────────────────────────────────────────────────────┐
> > │   ┌────┼──────┐                                                   │
> > │   │ dev1(cid1)│                                                   │
> > │   └───────────┘                                                   │
> > └─userapp─(as1)─────────────────────────────────────────────────────┘
> >
> > - VM0
> >     - dev0
> >         - dst_cid = 2 (well-known cid): connect to host;
> >         - dst_cid = cid1: connect to dev2 (they are in the same as0);
> >         - dst_cid = cid2: connect to dev3;
> >     - dev1
> >         - dst_cid = 2 (well-known cid): connect to userapp;
> >         - dst_cid = cid0: failure (no cid0 is available in as1, even though
> >         cid1 is available in the VM0);
> >         - dst_cid = cid1: connect to dev0;
> > - VM1
> >     - dev2
> >         - dst_cid = 2 (well-known cid): connect to host;
> >         - dst_cid = cid0: connect to dev0;
> >         - dst_cid = cid2: connect to dev3;
> >     - dev3: skip the same as dev2.
> >
> > So back to your question, my answer is that it depends on the address
> > space. Hope it could be helpful.
> 
> This brings an interesting question, for example if vm0 tries to
> connect to vm1, how does it know which device it needs to use (lacking
> the concept like switch/route/address announcing etc...)?

The HV should maintain a table for that. The guest things firstly
communicate with the HV, through the default device, to know which device
to use.

Thanks,
Xuewei
