Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101223085D5
	for <virtio-comment@lists.linux.dev>; Thu, 19 Jun 2025 03:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750303620; cv=none; b=sU2hBCSjVKAIM1Qzi+Mr5TzCCHZpjRU4x+eMzAO+Hxhg3U/fGbF+UtZuAVtpeObS8/DtVhaLLOMHk/05qtQn4rQXfpaoCLJNH+JYF7Qnvz3hQesaDDaOrHp/OM4OHl3FyWCAY0uTW1n9NZfsGtR43+6yCuWRDOZcy1ZwJRq/uPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750303620; c=relaxed/simple;
	bh=N3d17lPmF1lNgL+67zzF9ZEZKtxRIS4RCxuNpjgIlbI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J7vtZKOMFq/VNjBFX89Dmmw9Nz4PposT1WIIYOFXUh8xW0f1g7bE4xWPGuztpLzrscPrrHuTwX7OkJO5xKzvh7Xsk70GsycW4wEODeGO04WaPBjjfLjUKDK6nH1/4P9I/yt+qlHiZgVxK4tnkT0uYqssks3UgnRleZ3sl6+Fi+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i38hyyZ3; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i38hyyZ3"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234b9dfb842so3702305ad.1
        for <virtio-comment@lists.linux.dev>; Wed, 18 Jun 2025 20:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750303618; x=1750908418; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O36v6ir24KiKpGniqdZ5A8x+bDEzfcBZQQBq03m4MD0=;
        b=i38hyyZ3attxPZBSgaIhXZxirJyWudgawnuTwGqj7O+4SBWjyT9kygSLSgSh5Tfckl
         o43bu0OjKPK7QvSu4ohLYi7cCS3gYbcNz5PjCW57yCia0NqzQgTyJTar/5QDiIK4g4Ri
         VuNqNhLTxP3wE5BU7cy5IAzpKX00zsMWEGNIoWaGVEsStitQPMYp2f+FU+umy6TJQMUY
         wRVVsu+8r5Vor7LMoETJRt2KkOrsrKo4e/BbADpNskyQrGVLe6DbEDaWN97cr74p26aY
         zGw73Y+dD1RK5Ei19QKQ+taaQuppYKGBF6pJISrAa5Uq49vO1v4nLMJrkLOGcG24+34Z
         R3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750303618; x=1750908418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O36v6ir24KiKpGniqdZ5A8x+bDEzfcBZQQBq03m4MD0=;
        b=TFXwQeWygmelsjei0GnNGXpHUr8iUHuu5XznfNdCJsOIJ3CU2At5ddIGQePa9fetKR
         w5aJKNT9vlTyiNA8HNleGgWj50zCGpVsBz9NOjMUAZ4n9T4PBf9Sdv+AQj1xSDQMYYWS
         XYy5jgpwz/BI4LnEuhI4dBXCw7s6Lhu2wTyhZjgWySaBlfax/x+2bSOoyZuPu331poa+
         /Rzd7B1fHBAUy6r5XW/RnZcj4GwexWP1YV+FwnI1ApGdwH9mwoEMIg4VGnp1B0bc+QW3
         blA7A6pmZeH9/fPtBpAC9bmUV2Zk3iqLVRPZSGuzjS6pEZIxAn4p73/fz4fMXZZ8V1o7
         l+3w==
X-Forwarded-Encrypted: i=1; AJvYcCW2Ojw/lFn9E8yqPpCBGd+PRzcvSpML+Z8wwMAC6ual/6PrRJBHNHMst55RwfavzWpaHMDb+kdNYEKFyn04ww==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOKbHTHOxg/D0mMPzVhUL6AzzOEiDlUP96ZLTX2vj9mpKz1J2E
	Z0//CUOKfC0ppDHzTgWLyHHZXC940W7k+b0i1Ao0oSUUcRIIQ3WzZda1
X-Gm-Gg: ASbGncurAJ6xcS8PkGqXnb6LQozboYcyllZUj4qNwAKfqM5FbCaxYFvw4KGPssIkQhG
	ijzVviIZbZEwRiH/VVHdRvHtqrXE0FAf9/U7RT9gjcSPzo07oAHZ6jzN1BpcuFzPYh3aSJl9y+E
	7+zIOTUFYK+NwWJPl1w6UTLo7jrPKekn5bloOO1rqZZV1zti3XpO8LQQPad5qbc/s/RowmuHEFv
	siX//wDKzFxN/LscFuHON+dTsZfhD6phQUKmsKsy/2fLn7mXfs35z3XokdYD3Yh4WpZ84UcLCIj
	aimkXF/CeiYZmks18b7oFnedWsIPf8NVqw2R9ZrB2T0Ui3UeNw3HJNzNXd6QM5O0T+NMu+mjSBZ
	4ku4beT3c
X-Google-Smtp-Source: AGHT+IGQmDu4/Yl+Ru9oUv9y1R8TD4p3y5iZTTLuqCJOkuJ/lZpWddXngEg64vVPJK4PPKosgnj1Tw==
X-Received: by 2002:a17:903:98c:b0:236:9dd9:b75d with SMTP id d9443c01a7336-2369dd9bb57mr119193475ad.40.1750303617885;
        Wed, 18 Jun 2025 20:26:57 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d98sm109685565ad.151.2025.06.18.20.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 20:26:57 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: parav@nvidia.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	sgarzare@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Date: Thu, 19 Jun 2025 11:26:48 +0800
Message-Id: <20250619032648.1426719-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CY8PR12MB71953DBC944921FDD7AB630DDC73A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <CY8PR12MB71953DBC944921FDD7AB630DDC73A@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Parav,

Could you please take a look at the diagram in [1]?

IIUC, for VM0, there are two groups, and for VM1, there is only one group.
Am I right? If yes, I think the group concept is reasonable but we don't
need at this time.

I think the first thing is to figure out how to pick the right group.

Standard socket doesn't provide a way to access the group information.

Source and destination are from `bind()` and `connect()`, respectively. If
we don't call `bind()`, only the destination is known.

However, only destination is not enough to find the group. For example, the
well-known CIDs (e.g. 2) are valid for all groups.

1: https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/

> > From: Xuewei Niu <niuxuewei97@gmail.com>
> > Sent: Monday, June 16, 2025 4:26 PM
> > 
> > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > Sent: Monday, June 16, 2025 2:30 PM
> > > >
> > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > Sent: Monday, June 16, 2025 1:48 PM
> > > > > >
> > > > > > Hi, Parav.
> > > > > >
> > > > > > Thanks for your detailed comments.
> > > > > >
> > > > > > > Hi Xuewei,
> > > > > > >
> > > > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > > > Sent: Monday, May 19, 2025 3:08 PM
> > > > > > > >
> > > > > > > > > On Sat, Apr 12, 2025 at 10:28:25PM +0800, Xuewei Niu wrote:
> > > > > > > > > > This patch brings a new feature, called "multi devices",
> > > > > > > > > > to the virtio vsock. It introduces a
> > "VIRTIO_VSOCK_F_MULTI_DEVICES"
> > > > > > > > > > feature bit, and a "device_order" field to the config
> > > > > > > > > > for the virtio
> > > > vsock.
> > > > > > > > > >
> > > > > > > > > > == Motivition ==
> > > > > > > > > >
> > > > > > > > > > Vsock is a lightweight and widely used data exchange
> > > > > > > > > > mechanism between host and guest.
> > > > > > >
> > > > > > > Even though it is the current use, the specification does not
> > > > > > > prevent its usage
> > > > > > between two guests via a host.
> > > > > > > So we should not assume such guest <-> host communication as
> > > > > > > the only
> > > > > > case to add new feature.
> > > > > > >
> > > > > > > For example, in the spec only must requirement is that src_cid
> > > > > > > ==
> > > > > > config.guest_cid.
> > > > > > > Dst_cid can be anything, it need not be well known 0x2 (for the host).
> > > > > >
> > > > > > Yes.
> > > > > >
> > > > > > > With this flexibility in the spec, one can connect vsock
> > > > > > > devices with multiple
> > > > > > different backends.
> > > > > > >
> > > > > > > For example,
> > > > > > > QEMU can insert one vsock device for VM to HV communication.
> > > > > >
> > > > > > It is also able to communicate with other devices on the same host, i.e.
> > > > > > VM-to-VM.
> > > > > >
> > > > > > > A real PCI device can insert one voscket device for VM-to-VM
> > > > > > communication bypassing a full TCP/IP stack.
> > > > > >
> > > > > > AFAIK, all devices are implemented in software. Is it a real PCI HW device?
> > > > > >
> > > > > Yes. virto PCI devices are implemented as hw or as vdpa for many
> > > > > years now by
> > > > cloud operators and by NIC vendors.
> > > >
> > > > Thanks for your confirmation.
> > > >
> > > > > > > This means there are two different backends.
> > > > > > > And these two devices should not be grouped in the use case
> > > > > > > you
> > > > described.
> > > > > >
> > > > > > I think one group is enough for all use cases. It is required
> > > > > > that CIDs are unique in global, i.e. all backends.
> > > > > >
> > > > > > As your example, let me assume there are two VMs
> > > > > >
> > > > > > 1. VM0 (two vsock backends)
> > > > > >     1.1 device0 (cid=3, default), backend is host kernel (vhost-vsock);
> > > > > >     1.2 device1 (cid=4), backend is HV (virtio-vsock).
> > > > > > 2. VM1
> > > > > >     2.1 device2 (cid=5, default), backend is host kernel (vhost-vsock).
> > > > > >
> > > > > > The device0 is able to do VM0-HOST (src_cid=3, dst_cid=2) and
> > > > > > VM0-VM1 (src_cid=3, dst_cid=5) communicatation, while the
> > > > > > device1 is only able to do VM0-HV (src_cid=4, dst_cid=2)
> > communicatation.
> > > > > >
> > > > > In example 1.1 and 1.2 no devices are grouped.
> > > > > Your proposal of this patch wants to group the two devices and
> > > > > pick one of
> > > > them as default device.
> > > >
> > > > Yes. I just wonder if it is possible to have more than one groups in one guest?
> > > >
> > > For example
> > > Group_1: two devices dev0 and dev1, implemented as PCI HW devices.
> > > Group_2: two devices by QEMU SW implemented as sw backend.
> > >
> > > All the 4 devices has _F bit indicating they can be grouped.
> > > But there is no indication that they are part of which group.
> > > And hence the guest VM driver is in dark on how to forward requests without
> > the bind() call.
> > 
> > I see. Thanks!
> > 
> > My idea is that there is only one default device, no matter how many types of
> > backends are. If the users intend to use other devices, `bind()` call is required.
> > 
> > For example, we set `dev0` as the default device:
> > 
> > 1. Do not call `bind()`: use dev0;
> > 2. Call `bind(${dev0_cid})`: use dev1;
> > ...
> > 5. Call `bind(${dev4_cid})`: use dev4;
> > 
> > Even though we introduce the group concept, if we don't call `bind()`, how does
> > driver know which group to use? If the driver recoginizes the dst_cid, it can use
> > the group to find the device, then the things will be complicated. The driver
> > needs to know the relationship between the dst_cid and the group.
> >
> Based on the dst_cid picking the right vscock group would be needed. This is vsock level issue at driver level.
> Driver would need enough hints or encoding or of dst_cid or something else.
> 
> So even though we miss vsock level construct, it should be the reason to not group the devices.
> As both attempt to solve issue at different level.
> 
> > WDYT?
> > 
> > Thanks,
> > Xuewei
> > 
> > > > > If device0 and device1 are inserted to the VM0 with the feature
> > > > > bit you
> > > > suggested, the guest things that they are part of the same group.
> > > >
> > > > In this patch, we don't allow to insert devices without the feature
> > > > bit if there are already devices with the feature bit.
> > > >
> > > In above example of two groups, all the 4 devices spread across two groups has
> > the feature bit set.
> > > Yet, they cannot be grouped correctly.
> > > Driver driving blind thinks that all 4 devices are part of the same group.
> > >
> > > > As a result, there can be either multiple devices with the feature
> > > > bit or just a single device.
> > > >
> > >
> > > > > When bind() call is not done, host sw does not know which device
> > > > > to pick up
> > > > between device0 and device1 when binding the devices.
> > > >
> > > > Are you referring to an vsock application on the host? If yes, "host
> > > > sw" is able to pick up one device according to the dst cid. For
> > > > example, pick up
> > > > device0 if `connect(3)` is called.
> > > >
> > > > Please be aware that the "host sw" can not pick up device1, since
> > > > its device is not in the host kernel.
> > > >
> > > > > > In a word, a tuple identifies a connection.
> > > > > >
> > > > > > "Refuse to connect" will be raised if the device1 attempts to
> > > > > > connect to the device2. "They are not in the same group" is a
> > > > > > reasonable
> > > > explaination.
> > > > > > Am I right?
> > > > > >
> > > > > During bind call, one needs to select the device when the devices
> > > > > are coming
> > > > from multiple different backends.
> > > >
> > > > Yes.
> > > >
> > > > Thanks,
> > > > Xuewei
