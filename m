Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7F11DE4E7
	for <virtio-comment@lists.linux.dev>; Wed,  9 Apr 2025 06:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744181770; cv=none; b=QYQfEWXvd1uqN29dpDWO1uRwE8hqvg2gM+3Nz7ydW5WM3nwold0+OTSWYuKo7E/rLkvE9Q+7pT+ueBlAAVqGPzoshC5tmemXcCn+kIYEgcqSIWPwQq+V/rdyoSx/xhz6eOBfgg6l2aV3GHM9RUQMcH6y3CxcYBEhE+T0dA5ATes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744181770; c=relaxed/simple;
	bh=qZPqgDRjfOPc+r4mbxm0zDT0s0lFD/XBe1ra3Xk2/wg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ku1FPvEjkp9Fv6YMM7sqIJeBo2cMyIp+QDPbbbrLHMiCt2jweQ0LWxmaqiPtaiO4jCRHWPjs8/gJ4uN1ogsikxxP4ugZ2hjY+lcIHUCl2pWWeXszNWAiLkMb4lVtqac7Relhm2skF9LY8D/aAP7hbLydbWwWZeHzPxsksOPi8iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlq1WdFx; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlq1WdFx"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af5085f7861so4036422a12.3
        for <virtio-comment@lists.linux.dev>; Tue, 08 Apr 2025 23:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744181768; x=1744786568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMEEqRuRYr5lMe6Cjdp0ret91LUNPoiVHhOCj7sjVds=;
        b=nlq1WdFxw+j8sPTWn93y72kepFfkFpZv5tLJ/25gn3sGp0DnGzrylEgyQq7EJuT4T2
         nGZx4BEH9iqs5GQp+1OHjGiqFUaWFcpS+MhgGyKBfsrMdi1AU9N1nUJgOyzef+C51hrm
         36Ya4+33gEqLGFaz/JAkG7VcTYHXQb3Y01ln4+ErDeW2RnwEnA7SL7IrQmqWaVi46/yk
         m8hKcqBv82fBBbuEVE9/bWCaLPeBmlPa9WsKOjUOm5unDob13YAKKNMx14x/gz1qBjhu
         0XLf0d9plFdOTW0kW0EW29QfRFWVEoI6mbo7j1xjZ0TV+ehCejFgHxNRdEC3t7O1agv7
         1uUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181768; x=1744786568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMEEqRuRYr5lMe6Cjdp0ret91LUNPoiVHhOCj7sjVds=;
        b=QIyJIwApk2Evk6fdjKhUqNzPy8VJHFw6SX4zQbpCaHMLJjq1667l6DJCQuL5IJNlYq
         mBD8Dgek7/Xef4FsbjxJ8Z86R9vl+m4vaHM4XFxOlP0IlgTgvyJvmSiegnt7miqQTpSX
         l3rr+wIPHafw2aPshtadXkb/5M+hTISntp54oM3Q4R/5XybLFjAKUZHGuWj4lGQkGPZe
         ai2m9eObUm0qtAVln93yQYfSuOE/YJejIdHtOJpbCiwpGLMCTXgZrHUyV2IAn8ZIw+zo
         egJCtROVWzA5WD7QP55AmBYqe0lQCDXGejmcKE5t4v8Xne1+AWo24gnRggcLxbNOkSMF
         p9Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUoIyI8wHxBfZvKH6MWtg3Wlr3vH9HGo7PHeXBM8U/p0Nbd5Hf0WYJDecnkA49CsoWZYkVqX1+Om45B13ZSfw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzySma4LR23Tq6ZIItZoYY4poFfFDO8kjoN/C0fQ1no1/V1m2VD
	WikzHkcAbnaMXrZct6xpexmLBmMsmdyt9m1NtkQPaRFL4euoAnKk
X-Gm-Gg: ASbGncvQ9NrtVq/dP2NzF+1hWmNC84qxKOi1/kxoxXbD/hP6WRxeWPCoM9iStZDo7j+
	hEYteD240RiEQLU44mRSRT6igX32W8w+SNTElxCIfThnr1gJadrygo1PB6TXpDR2vEHLWa4/5r3
	M+TOrdkFId2GMi6K42Qk37F4pM0B+kzTVrC4WjiQ2pz/fntPVfF7Bappgk6o3E+kCYXwbHaf6eI
	P+9iVGVdqUbBpAgyda17JE0slPcwjYBG3NYN1lkcpoQN2Gw5GDiQM0fWYctmOpuKdLcPtq4GNR5
	WohUvXOauuYVO8mWIjB5J76AUGgNRVGDzkguWZvaaPcBnM70r2pwqt1MjiY0rbI=
X-Google-Smtp-Source: AGHT+IEDTkhi47+Xiq7xvEr5wTcT2wcQm79QbFUE1kysYcwQPbT0Hkp0HLXWNUwx6WZfN7niz+clXg==
X-Received: by 2002:a05:6a21:8cc3:b0:1f5:7280:1cf2 with SMTP id adf61e73a8af0-2015aec71ecmr1831187637.12.1744181767929;
        Tue, 08 Apr 2025 23:56:07 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e51fdfsm549918b3a.149.2025.04.08.23.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:56:07 -0700 (PDT)
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
Date: Wed,  9 Apr 2025 14:55:58 +0800
Message-Id: <20250409065558.3052615-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAGxU2F4Qejw2hd45SduH=OwzUZVR6xYJATRyDskukHU8+2nkGw@mail.gmail.com>
References: <CAGxU2F4Qejw2hd45SduH=OwzUZVR6xYJATRyDskukHU8+2nkGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Mon, 7 Apr 2025 at 04:17, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> >
> > > On Mon, Mar 31, 2025 at 02:18:27PM +0800, Xuewei Niu wrote:
> > > >> > On Wed, 26 Mar 2025 at 11:32, Stefano Garzarella <sgarzare@redhat.com> wrote:
> > > >> > > On Wed, Mar 26, 2025 at 06:00:31PM +0800, Xuewei Niu wrote:
> > > >> > > >> On Tue, Mar 25, 2025 at 11:19:46AM +0800, Xuewei Niu wrote:
> > > >> > > >> >> On Mon, Mar 24, 2025 at 02:43:35PM +0800, Xuewei Niu wrote:
> > > >> > > >> >> >This patch brings a new feature, called "multi devices", to the virtio
> > > >> > > >> >> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> > > >> > > >> >> >"device_order" field to the config for the virtio vsock.
> > > >> > > >> >> >
> > > >> > > >> >> >== Motivition ==
> > > >> > > >> >> >
> > > >> > > >> >> >Vsock is a lightweight and widely used data exchange mechanism between host
> > > >> > > >> >> >and guest. Currently, the virtio-vsock only supports one device, resulting
> > > >> > > >> >> >in the inability to enable more than one backend. For instance, two devices
> > > >> > > >> >> >are required: one to transfer data to the VMM via virtio-vsock,
> > > >> > > >> >>
> > > >> > > >> >> Come to think of it, AF_VSOCK defines CID 0 (VMADDR_CID_HYPERVISOR) to
> > > >> > > >> >> communicate with the hypervisor, but in virtio-vsock we never supported
> > > >> > > >> >> it. Could this be the use case?
> > > >> > > >> >>
> > > >> > > >> >> We could in this way add a new feature for those devices that
> > > >> > > >> >> communicate only with the VMM, where the CID of the VM is quite useless.
> > > >> > > >> >> So instead of having multiple CIDs per VM, we could continue to have a
> > > >> > > >> >> single CID, but the transport could support 2 devices, one to
> > > >> > > >> >> communicate with the VMM (CID = 0) and one to communicate with the host
> > > >> > > >> >> apps (CID = 2).
> > > >> > > >> >>
> > > >> > > >> >> Maybe this is orthogonal to this proposal, though, because it might
> > > >> > > >> >> still make sense to have multiple vsock devices, even though it's not
> > > >> > > >> >> very clear to me.
> > > >> > > >> >
> > > >> > > >> >In terms of the current situation, two devices are enough.
> > > >> > > >> >
> > > >> > > >> >We are the team of Kata Containers, so we are focusing on cloud-native
> > > >> > > >> >computing. What I mentioned below might be beyond the scope of the virtio
> > > >> > > >> >spec, just for your reference.
> > > >> > > >> >
> > > >> > > >> >The background is that the architecture of proxy mesh has been evolved over
> > > >> > > >> >the past few years: from per-pod to per-host (e.g. Istio Ambient Mesh[1]).
> > > >> > > >> >
> > > >> > > >> >Thanks to the TSI[2] and vhost-user protocol, network packets can bypass
> > > >> > > >> >both host and guest network stacks. It is possible to establish a fast path
> > > >> > > >> >between the pod and the proxy.
> > > >> > > >> >
> > > >> > > >> >When we have multiple networks, it is intuitive to have multiple NICs. So
> > > >> > > >> >does vsock.
> > > >> > > >>
> > > >> > > >> Be careful though, we don't want to complicate vsock to become like a
> > > >> > > >> NIC.
> > > >> > > >>
> > > >> > > >> >
> > > >> > > >> >When multiple networks are availble, it means that it is possible to have
> > > >> > > >> >multiple proxies(i.e. user processes). In this case, two devices are not
> > > >> > > >> >enough. This feature makes vsock more flexible and scalable.
> > > >> > > >>
> > > >> > > >> This is a good point, but I really don't understand why a VM should have
> > > >> > > >> multiple CIDs assigned.
> > > >> > > >
> > > >> > > >I think priority is not the biggest issue here. So let us focus on how to
> > > >> > > >route the connection to the right device among more than two devices.
> > > >> > >
> > > >> > > That's why I was recommending a different approach. IMO the user should
> > > >> > > not do this, but that should be transparent, hidden in the driver.
> > > >> > >
> > > >> > > By supporting VMADDR_CID_HYPERVISOR, we know very well if a packet is to
> > > >> > > be sent to the VMM, then we have to use the device that supports it.
> > > >> > > Whereas if the user connects to VMADDR_CID_HOST we have to use the other
> > > >> > > device.
> > > >> > >
> > > >> > > The user doesn't have to do anything, only use the right destination CID
> > > >> > > if it wants to talk to the VMM or another host process.
> > > >> >
> > > >> > Obviously, if we want to support more than 2 devices, we need this
> > > >> > that you are proposing. But IMO we need also to support
> > > >> > VMADDR_CID_HYPERVISOR, and we should prevent the user from doing
> > > >> > bind() on a random CID if one of the two devices only talks to the
> > > >> > VMM.
> > > >>
> > > >> I agree with supporting `VMADDR_CID_HYPERVISOR` for virtio-vsock. I can
> > > >> work on this later.
> > >
> > > Would be nice to have both together, but I'm fine if you want to
> > > postpone it.
> > >
> > > >>
> > > >> > Because, again, how does the user know which CID to bind?
> > > >>
> > > >> Nice catch! I am trying to give a solution for this issue regarding the
> > > >> scenario of more than two devices.
> > > >>
> > > >> Let users access the `device_order` and the `guest_cid` field. Host user
> > > >> program and guest user program can make an advance agreement. For example,
> > > >> the first device (whose `device_order` is smallest) is used to communicate
> > > >> with host process 1, the second device is used to host process 2, and so
> > > >> on.
> > > >>
> > > >> The guest user program want to direct the message to host process 2, then
> > > >> the things would be:
> > > >>
> > > >> 1. Guest user program gets the second device's `guest_cid`.
> > > >> 2. Guest user program binds to the CID.
> > > >>
> > > >> This could be worked because the `device_order` is a VM-level
> > > >> configuration. (On the contrary, the `guest_cid` is a host-level
> > > >> configuration).
> > > >>
> > > >> If people don't need this feature (use 1 or 2 devices only), they can use
> > > >> vsock as the simple way. Otherwise, people should accept the more
> > > >> complicated way.
> > > >>
> > > >> WDYT?
> > > >
> > > >Or we can replace the device_order with the guest_lid (aka local id). The
> > > >guest_lid is a VM-level address space, while the guest_cid is a host-level
> > > >address space.
> > > >
> > > >```c
> > > >struct virtio_vsock_config {
> > > >     __le64 guest_cid;
> > > >     __le16 guest_lid; /* previous device_order */
> > > >};
> > > >```
> > > >
> > > >With this design, the relationship between the device and the guest_lid
> > > >should be set properly before building the guest app and launching the
> > > >VM.
> > > >
> > > >For example, host process 0's guest_lid is 1000, and host process 1's is
> > > >2000. Their guest_cid will be determined when the VM started. The device
> > > >table should be like this:
> > > >
> > > >* device0: process=VM   guest_lid=0     guest_cid=0 <default device>
> > > >* device1: process=0    guest_lid=1000  guest_cid=x
> > > >* device2: process=1    guest_lid=2000  guest_cid=y
> > > >
> > > >The driver should expose an interface, such as ioctl, receiving a
> > > >local_cid. Guest apps can use it to obtain the actual guest_cid.
> > >
> > > No, please, I don't think adding virtio-specific behaviour in AF_VSOCK
> > > is what we want.
> > >
> > > Let's continue with device_order and see what others say.
> > >
> > > I think we need to try to get a better understanding of what to do,
> > > depending on the direction:
> > >
> > > - host -> guest: it might make sense multiple devices with different
> > >    CIDs, and the host will know which one to use depending on the CID
> > >    assigned to the device (e.g. vhost, vhost-user, device in VMM)
> > >
> > > - guest -> host: again I think we should differentiate the device to use
> > >    depending on the destination CID which can be VMADDR_CID_HOST,
> > >    VMADDR_CID_HYPERVISOR, or in the case where sibling communication is
> > >    supported a CID >= 3, so maybe we should have some features or flags
> > >    in the config space to describe destination CID supported for each
> > >    device
> >
> > I don't understand the point of adding a new features/flags. Could you
> > explain a bit more?
> 
> The idea is to inform the guest which addresses are reachable by the
> device, so the guest can easily decide which device to use. I'm
> talking about the destination, so CID_HOST(2), CID_HYPERVISOS(0) or a
> sibling VM (CID >=3).
> 
> >
> > We have had the guest_cid field in the config space. The guest knows all
> > devices present in the VM.
> 
> Okay, but how can the guest figure out from this information which
> device to use to talk to the hypervisor or an application in the host?
> 
> >
> > If the app tries to bind a random CID, it will fail since the driver can't
> > find the device by the CID.
> 
> I'm not talking about the source CID on which to do bind() (which I
> honestly don't like), but I'm talking about the destination CID on
> which to do connect().
> 
> > > so that the guest knows which device to use depending on the destination
> > > CID.
> >
> > Yes, this is what I was describing in the previous comment. The message
> > will be directed to the device by the destination CID.
> 
> Sorry, I don't understand how you do this without having an
> information from the device about what addresses it supports. Can you
> elaborate a bit?

Thanks for your explanation. So things you were talking about are as
follows:

1) guest app as a server: the app MUST do `bind()` to a CID that is
available in current VM.
2) guest app as a client: the guest driver picks a device and uses the
device's CID as src CID, so that the guest app don't need to do `bind()`,
but only do `connect()`.

The key point is who takes responsibility for picking a device:

1) I prefer the guest app to do such thing: do `bind()` to pick one, then
do `connect()`.
2) You prefer the guest driver: only do `connect()`, and the guest driver
picks one according to the dst CID.

Am I right?

I'm open to both ideas, but I have some concerns:

1) Two devices are in the different namespaces, e.g. host kernel(vhost) and
hybrid vsock(vhost-user), which might cause two same CIDs (e.g.
VMADDR_CID_HOST). If that happened, the driver can't distinguish them.
Instead, we can avoid this by letting the guest app pick a device.
2) What if the number of VMs is too large? For instance, 1,000 VMs (1,000
CIDs) will need at least 8000B of config space. (Hmm, it looks like an
extreme example, I don't know if it will happen in real world.)

Thanks,
Xuewei
