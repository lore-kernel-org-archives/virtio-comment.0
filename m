Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B6381AC8
	for <virtio-comment@lists.linux.dev>; Mon, 31 Mar 2025 06:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743401924; cv=none; b=dm2pR1SbqqILZU7o/8sc1qnRvi2mEyjnfSTpvoVdh7YER31c7u4tF1eSkBReiIlMDtx4MRCivUyjdClase6rxYRwApNCnFF9Tms2n5/pc2xDKamiFGRfWDj2aY8YMKmmfl2fQJUDx38ysYlymclt2CNDyiAw4QvH211Bvu1cPg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743401924; c=relaxed/simple;
	bh=aPql1su3wmZNfDCDTzTXe25OAMQxcJT482Dt1q2pflo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nm63L+JyDLILRivxTnQQQ0CfC2mR+qckacoAf41StkzdRD9CMUHNZ6OOU77I5iFS/IAgBhO+vA0jvFY1/ob94S60zba5UstxyU3p3nWrRpgFBTNPGWg2YWzT4zWR4Ovy7IoETQRB/a0KGn3ynH/ERp+JWtW/CerjbKggCAx6qkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYrJgLOp; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYrJgLOp"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223f4c06e9fso74819425ad.1
        for <virtio-comment@lists.linux.dev>; Sun, 30 Mar 2025 23:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743401919; x=1744006719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ivdxs1aZij8wVmAHQlDbq6Hjqx8m2mYaRKklZmyfGS0=;
        b=XYrJgLOpiat/pi70vE4Ki7bHoD0euTrXwDxuhyQS1VKBYzUSb7+yCBmg0nULky7Q9Y
         VhHlm/ipera16ktj4KuQtZh6lCsAymTFGv84ND2mykUKecTThtIJmz6oQvq/r5kjZ3vh
         vXf/pWWWgKFkFzdux4OfB29IPPHC8BlPxDbyBPc3NgjADn80ahSHcVpr6I1rDrXkdLIq
         HZqM5ZrMmO91utxEvAu2Zl6UYIFJ/2h8NZKJgLlb3VHnAkAk2nHlYl/3xKrXrj/uEFLj
         Dz3ri5NRhwnRMAzU5oFjIDzaPta2dStPeGw4UYCypBtGOz2eVbMJMlzInktO7WZVNlTo
         IF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743401919; x=1744006719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ivdxs1aZij8wVmAHQlDbq6Hjqx8m2mYaRKklZmyfGS0=;
        b=Tg6xzcSnzkv+vyC/DdLR0aQcz/8xTMv12tW6hgPcHexGA170lK6bm8ZjhBluEwjeau
         F7SoH+R7SRqPNiu4q7/hsCVu2vqLcOg8whptGxKIRUOWaeDs637lWBEHjkYwR0d1Kl/q
         fwuRgabz0O+/Oqdg1vzd2Q7bdZ8UefVX0Hkn2/h/654wRTcjDEW3chRkrlpdQptbU2Lu
         PwB3FdHxZILwUESOwL9YDiqmQJUQtcdGhO8uxESkWBOPNgqNAdy65Z7pczJLiO55aijz
         fUf1smDOPKPnwdNxNmAXKbBWpLdDZo9gQnSbw+z0MNcee+8l0CrdM3snFVIjvmdiExRN
         /ZJg==
X-Forwarded-Encrypted: i=1; AJvYcCUcononMyqaaqK58Zp9o4oBVObImngRbqDhqWkVk1l3PVzWLfUJgg4QsoMObuTv0V2zZRvsRBzPtDd3lsxVfg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLV4Q8qCiQUu2XMfei8tgWQebehOv/aBKkJ+3jfCGa07noxYNH
	Uvt6PJ2ZYxaUI6wHqTwQ60XWpcCgs/5ANSh4eHd4K8/kRrNky7Ri
X-Gm-Gg: ASbGncvjN6g3c8cujcZxc8jf0R3pQEByJ1jN1Y3Qg3v12xU5Cw5MpodKKAswx4D1iqi
	9TWz0pI4uyqhyBUk2wOykl/d1rjpfcFOwvJFwGa6ls1wVjrn8IMR7U1IgjtoqPXM8inwOWzaM4B
	qwLRUY2EyDdHsAG6jZ4Xz/ETj5Ot3YXTR+Dqhz4KWsIKQc4b2BKcb7WXd1lqmXDQ86LkP06bkie
	HSMmX5hEGQFhRT3xE1onwbBYcmJrY+DNlSLff47WIMNLmIsWCysi2cW36ije3xlvosP8YEFFU3D
	Q7HP8TsKJBOpAXuh3T9PRk9cx20R5GgWq7ItZ8Pn8685vIlXqnpFsby1Abn7gBofjH8=
X-Google-Smtp-Source: AGHT+IHOzLIIwbXVGzQdIqG2+hT14EeyAkGs32Obplj6NUdxZdCL8P20yFkHZivuXQjnPCHBVFGvig==
X-Received: by 2002:a17:903:2341:b0:21f:6f33:f96 with SMTP id d9443c01a7336-22921ca356bmr182582845ad.6.1743401919353;
        Sun, 30 Mar 2025 23:18:39 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1ce07dsm62079965ad.144.2025.03.30.23.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 23:18:38 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: niuxuewei97@gmail.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	parav@nvidia.com,
	sgarzare@redhat.com,
	stefanha@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v6 RESEND] virtio-vsock: Add support for multi devices
Date: Mon, 31 Mar 2025 14:18:27 +0800
Message-Id: <20250331061827.2500867-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327081830.2309856-1-niuxuewei.nxw@antgroup.com>
References: <20250327081830.2309856-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > On Wed, 26 Mar 2025 at 11:32, Stefano Garzarella <sgarzare@redhat.com> wrote:
> > > On Wed, Mar 26, 2025 at 06:00:31PM +0800, Xuewei Niu wrote:
> > > >> On Tue, Mar 25, 2025 at 11:19:46AM +0800, Xuewei Niu wrote:
> > > >> >> On Mon, Mar 24, 2025 at 02:43:35PM +0800, Xuewei Niu wrote:
> > > >> >> >This patch brings a new feature, called "multi devices", to the virtio
> > > >> >> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> > > >> >> >"device_order" field to the config for the virtio vsock.
> > > >> >> >
> > > >> >> >== Motivition ==
> > > >> >> >
> > > >> >> >Vsock is a lightweight and widely used data exchange mechanism between host
> > > >> >> >and guest. Currently, the virtio-vsock only supports one device, resulting
> > > >> >> >in the inability to enable more than one backend. For instance, two devices
> > > >> >> >are required: one to transfer data to the VMM via virtio-vsock,
> > > >> >>
> > > >> >> Come to think of it, AF_VSOCK defines CID 0 (VMADDR_CID_HYPERVISOR) to
> > > >> >> communicate with the hypervisor, but in virtio-vsock we never supported
> > > >> >> it. Could this be the use case?
> > > >> >>
> > > >> >> We could in this way add a new feature for those devices that
> > > >> >> communicate only with the VMM, where the CID of the VM is quite useless.
> > > >> >> So instead of having multiple CIDs per VM, we could continue to have a
> > > >> >> single CID, but the transport could support 2 devices, one to
> > > >> >> communicate with the VMM (CID = 0) and one to communicate with the host
> > > >> >> apps (CID = 2).
> > > >> >>
> > > >> >> Maybe this is orthogonal to this proposal, though, because it might
> > > >> >> still make sense to have multiple vsock devices, even though it's not
> > > >> >> very clear to me.
> > > >> >
> > > >> >In terms of the current situation, two devices are enough.
> > > >> >
> > > >> >We are the team of Kata Containers, so we are focusing on cloud-native
> > > >> >computing. What I mentioned below might be beyond the scope of the virtio
> > > >> >spec, just for your reference.
> > > >> >
> > > >> >The background is that the architecture of proxy mesh has been evolved over
> > > >> >the past few years: from per-pod to per-host (e.g. Istio Ambient Mesh[1]).
> > > >> >
> > > >> >Thanks to the TSI[2] and vhost-user protocol, network packets can bypass
> > > >> >both host and guest network stacks. It is possible to establish a fast path
> > > >> >between the pod and the proxy.
> > > >> >
> > > >> >When we have multiple networks, it is intuitive to have multiple NICs. So
> > > >> >does vsock.
> > > >>
> > > >> Be careful though, we don't want to complicate vsock to become like a
> > > >> NIC.
> > > >>
> > > >> >
> > > >> >When multiple networks are availble, it means that it is possible to have
> > > >> >multiple proxies(i.e. user processes). In this case, two devices are not
> > > >> >enough. This feature makes vsock more flexible and scalable.
> > > >>
> > > >> This is a good point, but I really don't understand why a VM should have
> > > >> multiple CIDs assigned.
> > > >
> > > >I think priority is not the biggest issue here. So let us focus on how to
> > > >route the connection to the right device among more than two devices.
> > >
> > > That's why I was recommending a different approach. IMO the user should
> > > not do this, but that should be transparent, hidden in the driver.
> > >
> > > By supporting VMADDR_CID_HYPERVISOR, we know very well if a packet is to
> > > be sent to the VMM, then we have to use the device that supports it.
> > > Whereas if the user connects to VMADDR_CID_HOST we have to use the other
> > > device.
> > >
> > > The user doesn't have to do anything, only use the right destination CID
> > > if it wants to talk to the VMM or another host process.
> > 
> > Obviously, if we want to support more than 2 devices, we need this
> > that you are proposing. But IMO we need also to support
> > VMADDR_CID_HYPERVISOR, and we should prevent the user from doing
> > bind() on a random CID if one of the two devices only talks to the
> > VMM.
> 
> I agree with supporting `VMADDR_CID_HYPERVISOR` for virtio-vsock. I can
> work on this later.
> 
> > Because, again, how does the user know which CID to bind?
> 
> Nice catch! I am trying to give a solution for this issue regarding the
> scenario of more than two devices.
> 
> Let users access the `device_order` and the `guest_cid` field. Host user
> program and guest user program can make an advance agreement. For example,
> the first device (whose `device_order` is smallest) is used to communicate
> with host process 1, the second device is used to host process 2, and so
> on.
> 
> The guest user program want to direct the message to host process 2, then
> the things would be:
> 
> 1. Guest user program gets the second device's `guest_cid`.
> 2. Guest user program binds to the CID.
> 
> This could be worked because the `device_order` is a VM-level
> configuration. (On the contrary, the `guest_cid` is a host-level
> configuration).
> 
> If people don't need this feature (use 1 or 2 devices only), they can use
> vsock as the simple way. Otherwise, people should accept the more
> complicated way.
> 
> WDYT?

Or we can replace the device_order with the guest_lid (aka local id). The
guest_lid is a VM-level address space, while the guest_cid is a host-level
address space.

```c
struct virtio_vsock_config {
	__le64 guest_cid;
	__le16 guest_lid; /* previous device_order */
};
```

With this design, the relationship between the device and the guest_lid
should be set properly before building the guest app and launching the
VM.

For example, host process 0's guest_lid is 1000, and host process 1's is
2000. Their guest_cid will be determined when the VM started. The device
table should be like this:

* device0: process=VM   guest_lid=0     guest_cid=0 <default device>
* device1: process=0    guest_lid=1000  guest_cid=x
* device2: process=1    guest_lid=2000  guest_cid=y

The driver should expose an interface, such as ioctl, receiving a
local_cid. Guest apps can use it to obtain the actual guest_cid.

It is expected that there will not be too many virtio-vsock devices (less
than 16). Therefore, conflicts with guest_lid are not a big issue.

Thanks,
Xuewei

> > >
> > > >
> > > >Our solution uses CID as device identification. From the users'
> > > >perspective, they can direct the connection to the appropriate device by
> > > >specifying a CID in either the `connect` or `bind` syscall.
> > >
> > > How does the user know which device/CID to bind if it wants to talk with
> > > the VMM or with the application?
> > >
> > > >
> > > >Assigning one CID to a VM looks good to me. But I am not sure how to
> > > >distinguish the devices. For example, should we expose a ioctl or a
> > > >sockopt?
> > >
> > > Nope, just simply use the right destination CID in the connect()
> > > (VMADDR_CID_HYPERVISOR or VMADDR_CID_HOST), without doing any bind().
> > >
> > > For receiving, the user can check the source CID after connection and
> > > decide to discard connections from VMADDR_CID_HYPERVISOR or
> > > VMADDR_CID_HOST depending of the service.
> > >
> > > Thanks,
> > > Stefano
