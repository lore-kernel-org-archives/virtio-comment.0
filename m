Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F296211460
	for <virtio-comment@lists.linux.dev>; Mon,  7 Apr 2025 02:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743992251; cv=none; b=O/HNF2cgeyMwpJNDvMDFYGIdIKQXVIIKnGpn8KhVvYpPbWvpU+UnDRgls1VH5RKzHIxyB7LkIoz2EeKnDY8435ppDwKc6z14EyE9BWL9sDqiWi64Mr5uwaQNY1WUmlR7d4Nm5+EgB8EBmDUpWzXXFwUuYea2Ap7Ki+u4bl3qGP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743992251; c=relaxed/simple;
	bh=cN+PcoP7vI89gMlY2GObuU0LRQiVBuJ9vJgLSs7d8dA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Time1f1xdB7VccfUkxW6xbUjuxgsDuvu4pN+a+SeuY4e4KB9whCeMe7z8svZeMnmy1Tv19FGK2MbhhevLxnnyx/o5lZjffgtxadNiYndCaKOPv4dAUf1BiIgz8ZH2ez+vI48xGHsVPHNyiV3g1VuA2b707j6KF5/lirpoSEUk4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKxP/lOX; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKxP/lOX"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223fb0f619dso35179725ad.1
        for <virtio-comment@lists.linux.dev>; Sun, 06 Apr 2025 19:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743992248; x=1744597048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnEj2cLqCMV3TbszvDv9h6ziPBULrx2hP/6V0NW5IdE=;
        b=dKxP/lOXqvTPRRU57nH+EWYjxl7ldndERfUoBoeMcYLhWNEK1ishubjyqjhytRGyNH
         UdRltpegDTphQzUeov6YEL4Vri/xfHIC570V6dgAKBz1j8eR4LaLvRaDL/8hpXxKP2bI
         nDEsnEFm3DtodkUyjovA2MFIZcrbld1ofkI8oJNWRq0gFvgS9hVxIpPs3dezDLfVx/mJ
         +HlXoeypFiIUcO6P2U0hHOk1ZcA+hCuHGnQDXal6ClIHmPkPkawaxkWJsypIDb54dkhW
         LTr0I+Gio2427YTAg7A7HUN0rmqMMFvqjPG4QT2ZZchMlj3Bxqr5qatS1tkWCsM8bWzO
         E2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743992248; x=1744597048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnEj2cLqCMV3TbszvDv9h6ziPBULrx2hP/6V0NW5IdE=;
        b=H+m0Z6cCDMGGyR6NU+Fp9c2CGb4cCPjKd4U7dSG2ig2jFxa1911lO0QjDqjC6Yx+eb
         qXKEIfWS6JVP0AQltkNjyqj3E1winl/7qcAS04aLj31VAo75r9UT3Fc9wkKDOSkSbBJ5
         GL+8ey2ctQm+0H/xADklc0kw+c4R9HLKfNxXloOGC3wlGalRufjDd5/P96apLv1uV7cI
         fisO3EPR3sV9uE1LwFOYs0TngjVzvBii8WuxYXsHc81Zpzjz4fWRCV8mGT9KmARghcC7
         1wGRHmfurzvsMYyRo+7UmQk+ICgLZJnmEwzCEUI+On6cuy0Nrc230SE2Jfiwl0+CMMuB
         TJBg==
X-Forwarded-Encrypted: i=1; AJvYcCXnycsM/n87S2OxjDQ1imDV1XzMdapA/D2vlz3+jKBEbSkr1gg6ZzLJEr1dwM8s5SJn1w5+I1YXLPy2AQIe7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoCI2sgJyqiUokD8xDlgk6d3emTG3e6iIKdhmU9ofCe+e+aZdF
	JYigoSEfkFs3QpE1EywJWqR/u/6XUQn1XIH01CYiETRyn8tj6Qr6
X-Gm-Gg: ASbGnctoJ0Jt4WojbVNaXnDz4HEztrxm3a0fcn4Job3qtM4vUVB2ymvMwffQXrl+g/T
	gxCMotXkAuGnAzle7PvI0gTb9XLJpZYcBHYwCpOKPXQzrWGcLMPUb4yw1scBX3o0bDziAzvjVVU
	/KyDNr71+wLem3LRy99anYygDoh7OF1mhJwE3Ly3MPa6QpArYpLffBO22bDeUa+8HQSJ23rzpQ+
	Jjo1gPpkQxzsNeH9D4DUlJ9rNc2pjVoPDeQr7KYCCGUWbPRYH/khViM80TeYC+ZpB2QIUqwYFop
	iOeJih+M6YEWxakx8f9ytusyd6esz6w9pqtd7gun0xCogc5YkuJmqD1KHBjX6ftWMeGocecfSVS
	hgQ==
X-Google-Smtp-Source: AGHT+IEuSE3Ums+R0RcLtXGoxCjd+UtGwKCDHE8Y5OWicmo+KfCY0lrrc63dA4oBa+ilx2g3vLB8aA==
X-Received: by 2002:a17:902:ea12:b0:223:5e6a:57ab with SMTP id d9443c01a7336-22a8a0a3986mr155283615ad.39.1743992248207;
        Sun, 06 Apr 2025 19:17:28 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bfffasm69898255ad.61.2025.04.06.19.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 19:17:27 -0700 (PDT)
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
Date: Mon,  7 Apr 2025 10:17:15 +0800
Message-Id: <20250407021715.2736840-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <lr6fvhjts6ytekqnlbvccvvjbnmbgspzynme4yii4bla6fiyig@mzgor4y3ojsh>
References: <lr6fvhjts6ytekqnlbvccvvjbnmbgspzynme4yii4bla6fiyig@mzgor4y3ojsh>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Mon, Mar 31, 2025 at 02:18:27PM +0800, Xuewei Niu wrote:
> >> > On Wed, 26 Mar 2025 at 11:32, Stefano Garzarella <sgarzare@redhat.com> wrote:
> >> > > On Wed, Mar 26, 2025 at 06:00:31PM +0800, Xuewei Niu wrote:
> >> > > >> On Tue, Mar 25, 2025 at 11:19:46AM +0800, Xuewei Niu wrote:
> >> > > >> >> On Mon, Mar 24, 2025 at 02:43:35PM +0800, Xuewei Niu wrote:
> >> > > >> >> >This patch brings a new feature, called "multi devices", to the virtio
> >> > > >> >> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> >> > > >> >> >"device_order" field to the config for the virtio vsock.
> >> > > >> >> >
> >> > > >> >> >== Motivition ==
> >> > > >> >> >
> >> > > >> >> >Vsock is a lightweight and widely used data exchange mechanism between host
> >> > > >> >> >and guest. Currently, the virtio-vsock only supports one device, resulting
> >> > > >> >> >in the inability to enable more than one backend. For instance, two devices
> >> > > >> >> >are required: one to transfer data to the VMM via virtio-vsock,
> >> > > >> >>
> >> > > >> >> Come to think of it, AF_VSOCK defines CID 0 (VMADDR_CID_HYPERVISOR) to
> >> > > >> >> communicate with the hypervisor, but in virtio-vsock we never supported
> >> > > >> >> it. Could this be the use case?
> >> > > >> >>
> >> > > >> >> We could in this way add a new feature for those devices that
> >> > > >> >> communicate only with the VMM, where the CID of the VM is quite useless.
> >> > > >> >> So instead of having multiple CIDs per VM, we could continue to have a
> >> > > >> >> single CID, but the transport could support 2 devices, one to
> >> > > >> >> communicate with the VMM (CID = 0) and one to communicate with the host
> >> > > >> >> apps (CID = 2).
> >> > > >> >>
> >> > > >> >> Maybe this is orthogonal to this proposal, though, because it might
> >> > > >> >> still make sense to have multiple vsock devices, even though it's not
> >> > > >> >> very clear to me.
> >> > > >> >
> >> > > >> >In terms of the current situation, two devices are enough.
> >> > > >> >
> >> > > >> >We are the team of Kata Containers, so we are focusing on cloud-native
> >> > > >> >computing. What I mentioned below might be beyond the scope of the virtio
> >> > > >> >spec, just for your reference.
> >> > > >> >
> >> > > >> >The background is that the architecture of proxy mesh has been evolved over
> >> > > >> >the past few years: from per-pod to per-host (e.g. Istio Ambient Mesh[1]).
> >> > > >> >
> >> > > >> >Thanks to the TSI[2] and vhost-user protocol, network packets can bypass
> >> > > >> >both host and guest network stacks. It is possible to establish a fast path
> >> > > >> >between the pod and the proxy.
> >> > > >> >
> >> > > >> >When we have multiple networks, it is intuitive to have multiple NICs. So
> >> > > >> >does vsock.
> >> > > >>
> >> > > >> Be careful though, we don't want to complicate vsock to become like a
> >> > > >> NIC.
> >> > > >>
> >> > > >> >
> >> > > >> >When multiple networks are availble, it means that it is possible to have
> >> > > >> >multiple proxies(i.e. user processes). In this case, two devices are not
> >> > > >> >enough. This feature makes vsock more flexible and scalable.
> >> > > >>
> >> > > >> This is a good point, but I really don't understand why a VM should have
> >> > > >> multiple CIDs assigned.
> >> > > >
> >> > > >I think priority is not the biggest issue here. So let us focus on how to
> >> > > >route the connection to the right device among more than two devices.
> >> > >
> >> > > That's why I was recommending a different approach. IMO the user should
> >> > > not do this, but that should be transparent, hidden in the driver.
> >> > >
> >> > > By supporting VMADDR_CID_HYPERVISOR, we know very well if a packet is to
> >> > > be sent to the VMM, then we have to use the device that supports it.
> >> > > Whereas if the user connects to VMADDR_CID_HOST we have to use the other
> >> > > device.
> >> > >
> >> > > The user doesn't have to do anything, only use the right destination CID
> >> > > if it wants to talk to the VMM or another host process.
> >> >
> >> > Obviously, if we want to support more than 2 devices, we need this
> >> > that you are proposing. But IMO we need also to support
> >> > VMADDR_CID_HYPERVISOR, and we should prevent the user from doing
> >> > bind() on a random CID if one of the two devices only talks to the
> >> > VMM.
> >>
> >> I agree with supporting `VMADDR_CID_HYPERVISOR` for virtio-vsock. I can
> >> work on this later.
> 
> Would be nice to have both together, but I'm fine if you want to 
> postpone it.
> 
> >>
> >> > Because, again, how does the user know which CID to bind?
> >>
> >> Nice catch! I am trying to give a solution for this issue regarding the
> >> scenario of more than two devices.
> >>
> >> Let users access the `device_order` and the `guest_cid` field. Host user
> >> program and guest user program can make an advance agreement. For example,
> >> the first device (whose `device_order` is smallest) is used to communicate
> >> with host process 1, the second device is used to host process 2, and so
> >> on.
> >>
> >> The guest user program want to direct the message to host process 2, then
> >> the things would be:
> >>
> >> 1. Guest user program gets the second device's `guest_cid`.
> >> 2. Guest user program binds to the CID.
> >>
> >> This could be worked because the `device_order` is a VM-level
> >> configuration. (On the contrary, the `guest_cid` is a host-level
> >> configuration).
> >>
> >> If people don't need this feature (use 1 or 2 devices only), they can use
> >> vsock as the simple way. Otherwise, people should accept the more
> >> complicated way.
> >>
> >> WDYT?
> >
> >Or we can replace the device_order with the guest_lid (aka local id). The
> >guest_lid is a VM-level address space, while the guest_cid is a host-level
> >address space.
> >
> >```c
> >struct virtio_vsock_config {
> >	__le64 guest_cid;
> >	__le16 guest_lid; /* previous device_order */
> >};
> >```
> >
> >With this design, the relationship between the device and the guest_lid
> >should be set properly before building the guest app and launching the
> >VM.
> >
> >For example, host process 0's guest_lid is 1000, and host process 1's is
> >2000. Their guest_cid will be determined when the VM started. The device
> >table should be like this:
> >
> >* device0: process=VM   guest_lid=0     guest_cid=0 <default device>
> >* device1: process=0    guest_lid=1000  guest_cid=x
> >* device2: process=1    guest_lid=2000  guest_cid=y
> >
> >The driver should expose an interface, such as ioctl, receiving a
> >local_cid. Guest apps can use it to obtain the actual guest_cid.
> 
> No, please, I don't think adding virtio-specific behaviour in AF_VSOCK 
> is what we want.
> 
> Let's continue with device_order and see what others say.
> 
> I think we need to try to get a better understanding of what to do, 
> depending on the direction:
> 
> - host -> guest: it might make sense multiple devices with different
>    CIDs, and the host will know which one to use depending on the CID
>    assigned to the device (e.g. vhost, vhost-user, device in VMM)
> 
> - guest -> host: again I think we should differentiate the device to use
>    depending on the destination CID which can be VMADDR_CID_HOST,
>    VMADDR_CID_HYPERVISOR, or in the case where sibling communication is
>    supported a CID >= 3, so maybe we should have some features or flags
>    in the config space to describe destination CID supported for each
>    device

I don't understand the point of adding a new features/flags. Could you
explain a bit more?

We have had the guest_cid field in the config space. The guest knows all
devices present in the VM.

If the app tries to bind a random CID, it will fail since the driver can't
find the device by the CID.

> so that the guest knows which device to use depending on the destination
> CID.

Yes, this is what I was describing in the previous comment. The message
will be directed to the device by the destination CID.

Thanks,
Xuewei

> I don't want to stop this patch, but I would like to make it easy for 
> the user to use.
> 
> Thanks,
> Stefano
