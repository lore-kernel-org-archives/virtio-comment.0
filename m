Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C84BA34
	for <virtio-comment@lists.linux.dev>; Sun, 22 Jun 2025 13:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750600473; cv=none; b=UvQDyKrUmJSwWrr5LsojhwiQIEhjy/RoQKzOkwnmh3lF4o/kglHJM5zIyuvD7NUL6UYkyXIxGM6p3yzOaVt4V0LnZ4HdDN4zIBxDrOU036akuzje9qBi26Xt1/jbJnWIEBvg0IwzEy5broAGNe5Pm3D3BK3DNeFJwPSpy/bkUH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750600473; c=relaxed/simple;
	bh=/eALwoqnTUUmDjFl9CkMyFBMUs7sfDjfiUVGWN231EE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LegNmrYTXwadCTPaYlaRuBdL70w8t+oVlnt0OOUe2NwVNDdRD+FrGdVR4eZuHwRNtQk14RulGL9YBKaSnXR4Ln87xI+aFwhxjnVG9o/ysOzycxVLz4Q/qcCIcdEobWX1OCk941Dfa5+JECreKBPTwgwrPjPBPSuY4iyKSy5jQGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SD8Dah/S; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SD8Dah/S"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-235f9ea8d08so31393895ad.1
        for <virtio-comment@lists.linux.dev>; Sun, 22 Jun 2025 06:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750600471; x=1751205271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vQPgh71Rtx2GCtWUgcb5rluqVBmf69DJoQawAiaEJk=;
        b=SD8Dah/SoHuMfgAzhHscFGNp/arH5962WqxbXf+EIlIThjPkwyOIyVkivJpVmIDJ+h
         iHq/ZUU3LY8C3EZtSVLOgQXm6vGqjcsRVzIqgLoQrhLGKwSInoH5m3cuoop7kvNuAB8O
         feuxoE3AQVC8G2qrUNwZ/8UPFGfVgQN8N1GD1H2E7fD/L93X1+Vyn7mE4DR72Kv4+in/
         0dhZL2QSse4ZL8qAmXuqGUpTuydfOIkT474gGS02fe8/RlPiWIs/jLYxscOu3ppIUa6J
         WTzvuCXiQD0fb+l5AynjQgrhHrlkblZwXJ1ZeBkBtnL9ppOZYM49GPbCUcG6LgG0lac+
         tuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750600471; x=1751205271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vQPgh71Rtx2GCtWUgcb5rluqVBmf69DJoQawAiaEJk=;
        b=hBiOJyGz/fFsvlUtnc2zQbAmOXhnlbSRKiceFYb39uxaQlG2QQeKS1xwB0vHnrvTnf
         WZXZKksui2uIGWGvf4BxegWXREKcd3owmDrES+oiacCy6dTW4RepzoK2FN0SqUcnV/BX
         m3wL1Dm9OCwZhc5kFe/QIXpMKLNUzyJOkHl9RKjeS9hBqrbqnv/OzBg41rEVJ6xMhP7m
         95T5nwh9Ut/eB9519kLgumQlXlTvrOrKjq/Tp7FLZTH6qG11N5vrKRejwkm/8tSrquf4
         kt6vDw6yj8XFMmQfXq0vgsjMKHH0EktGGdNzi7vrQq81hYuMmdJfXXQThR9OjONkeRU4
         2lnA==
X-Forwarded-Encrypted: i=1; AJvYcCU/+iMq+WWaROkyAAQR5Y8OdQdbk7QoM6gx4HgeN0k/oRfNwluTWa7xvneg/xh8SBAbygDUWZIwWvR8bjW0MA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxvydb2nl3W5pblcmlFTldl1YgjGd3NFFdkqbJdqy3p9rc2HL35
	LyMFACm+3PK39e1DbByaGfwmA5o3X6ZwEsD2LRAwUmvZfgVcRbEcwn7a
X-Gm-Gg: ASbGncvQN+G3qgXcdGsFj2yoj+jmW+weLD3nzCtWicVQEMHqmzUOqGAZ3Kqs5oS9npc
	a8m8KDREFjwwJBDfQ9qQ9++feD2bTT2cj+J3eLHegJbzSY7bIa3//BBO5e4bP/Z6KMH7H04gQvB
	Qwcs/G8/vBALgpZmwJgEwSFmR4LSGhMe/BsUorKYnX18RC4z5CnP9rhNdyCL8NILB8ZJTy16GGu
	UmOhL9nnJ1gfu6ML2xOmRV5E37+wCuPrX6wL/oehGxO1jaV22pdEKtMvi8L6RXHv6NE2rye0GVB
	ANOGkN2PmtPM0vr6kyAatGTz0kQujcY04wrKos6foErrHy+6hWKoppBJmJgkBex3vSydRx9eirB
	I3bsCG+EQ
X-Google-Smtp-Source: AGHT+IFSnAh5WcOB0XEf5w4+HU2wPMXY/Jk8cKsWYBZjOoffqsKf2ui5I/wV5Rha6zExO0FDL7r8KA==
X-Received: by 2002:a17:903:1988:b0:236:93cb:48b with SMTP id d9443c01a7336-237d996a6c5mr162532465ad.44.1750600470424;
        Sun, 22 Jun 2025 06:54:30 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393784sm60522185ad.11.2025.06.22.06.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 06:54:29 -0700 (PDT)
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
Date: Sun, 22 Jun 2025 21:54:15 +0800
Message-Id: <20250622135415.1554070-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CY8PR12MB7195C2745AA7465D34E86F7CDC7DA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <CY8PR12MB7195C2745AA7465D34E86F7CDC7DA@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> > From: Xuewei Niu <niuxuewei97@gmail.com>
> > Sent: 19 June 2025 10:41 AM
> > 
> > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > Sent: 19 June 2025 08:57 AM
> > > >
> > > > Hi Parav,
> > > >
> > > > Could you please take a look at the diagram in [1]?
> > > >
> > > > IIUC, for VM0, there are two groups, and for VM1, there is only one group.
> > > > Am I right? If yes, I think the group concept is reasonable but we
> > > > don't need at this time.
> > > >
> > > > I think the first thing is to figure out how to pick the right group.
> > > >
> > > > Standard socket doesn't provide a way to access the group information.
> > > >
> > > > Source and destination are from `bind()` and `connect()`,
> > > > respectively. If we don't call `bind()`, only the destination is known.
> > > >
> > > > However, only destination is not enough to find the group. For
> > > > example, the well-known CIDs (e.g. 2) are valid for all groups.
> > > >
> > > > 1:
> > > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flo
> > > > re.kernel.org%2Fvirtio-comment%2F20250618095139.1412138-1-
> > niuxuewei.
> > > >
> > nxw%40antgroup.com%2F&data=05%7C02%7Cparav%40nvidia.com%7C9d4a
> > 762f95
> > > >
> > 49433be00208ddaeefa4ba%7C43083d15727340c1b7db39efd9ccc17a%7C0%7
> > C0%7C
> > > >
> > 638859066500269242%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOn
> > RydWUsI
> > > >
> > lYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D
> > %
> > > >
> > 7C0%7C%7C%7C&sdata=ANv4q7h1Z1Jw5AyypDRE9brIbeyt4siy4g4hiYf8Lis%3
> > D&re
> > > > served=0
> > >
> > > Right. Sock addressing scheme is naïve presently to select the group. Not
> > sure when/how you or others plan to do.
> > > This is transport layer problem to solve (not to confuse with transport =
> > pci/mmio etc).
> > >
> > > However, at device level, we should have the construct of grouping.
> > > Without this construct, all devices will be part of single group and one will
> > not be able to build the group concept later.
> > > So even if you don't need it explicitly now, grouping the device is what you
> > need when connect() is called.
> > >
> > > So I was imagining a relatively simple scheme:
> > > For example, virtio device level, some kind of group id is present.
> > > So two devices which has same group id, are part of single group.
> > > An example group id format can be a UUID.
> > >
> > > And this is completely optional for devices to implement.
> > > Generic enough and usable beyond just vsock device in other use cases we
> > discussed in past.
> > 
> > Fair enough.
> > 
> > @Stefano, could you please take a look at this? I'd love to have some input
> > from you.
> > 
> > A brief summary of the idea is: The config space will be extended to include a
> > group id. 
> UUIDs are long even though they are read only.
> And config space is readable only after feature bits are negotiated.
> 
> I didn't think enough if the driver needs to know early enough when creating the 'struct virtio_device' with two legs of virtio_pci_dev * in it.
> Need some more thoughts on it.

I think it is okay to do so. It is used in socket layer. By that time, the
driver will be able to access the config space.

Thanks,
Xuewei

> > The devices with the same group id are considered to be in the
> > same group.
> >
> Sounds good.
>  
> > Thanks,
> > Xuewei
> > 
> > > >
> > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > Sent: Monday, June 16, 2025 4:26 PM
> > > > > >
> > > > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > > > Sent: Monday, June 16, 2025 2:30 PM
> > > > > > > >
> > > > > > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > > > > > Sent: Monday, June 16, 2025 1:48 PM
> > > > > > > > > >
> > > > > > > > > > Hi, Parav.
> > > > > > > > > >
> > > > > > > > > > Thanks for your detailed comments.
> > > > > > > > > >
> > > > > > > > > > > Hi Xuewei,
> > > > > > > > > > >
> > > > > > > > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > > > > > > > Sent: Monday, May 19, 2025 3:08 PM
> > > > > > > > > > > >
> > > > > > > > > > > > > On Sat, Apr 12, 2025 at 10:28:25PM +0800, Xuewei Niu
> > wrote:
> > > > > > > > > > > > > > This patch brings a new feature, called "multi
> > > > > > > > > > > > > > devices", to the virtio vsock. It introduces a
> > > > > > "VIRTIO_VSOCK_F_MULTI_DEVICES"
> > > > > > > > > > > > > > feature bit, and a "device_order" field to the
> > > > > > > > > > > > > > config for the virtio
> > > > > > > > vsock.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > == Motivition ==
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Vsock is a lightweight and widely used data
> > > > > > > > > > > > > > exchange mechanism between host and guest.
> > > > > > > > > > >
> > > > > > > > > > > Even though it is the current use, the specification
> > > > > > > > > > > does not prevent its usage
> > > > > > > > > > between two guests via a host.
> > > > > > > > > > > So we should not assume such guest <-> host
> > > > > > > > > > > communication as the only
> > > > > > > > > > case to add new feature.
> > > > > > > > > > >
> > > > > > > > > > > For example, in the spec only must requirement is that
> > > > > > > > > > > src_cid ==
> > > > > > > > > > config.guest_cid.
> > > > > > > > > > > Dst_cid can be anything, it need not be well known 0x2
> > > > > > > > > > > (for the
> > > > host).
> > > > > > > > > >
> > > > > > > > > > Yes.
> > > > > > > > > >
> > > > > > > > > > > With this flexibility in the spec, one can connect
> > > > > > > > > > > vsock devices with multiple
> > > > > > > > > > different backends.
> > > > > > > > > > >
> > > > > > > > > > > For example,
> > > > > > > > > > > QEMU can insert one vsock device for VM to HV
> > communication.
> > > > > > > > > >
> > > > > > > > > > It is also able to communicate with other devices on the
> > > > > > > > > > same host,
> > > > i.e.
> > > > > > > > > > VM-to-VM.
> > > > > > > > > >
> > > > > > > > > > > A real PCI device can insert one voscket device for
> > > > > > > > > > > VM-to-VM
> > > > > > > > > > communication bypassing a full TCP/IP stack.
> > > > > > > > > >
> > > > > > > > > > AFAIK, all devices are implemented in software. Is it a
> > > > > > > > > > real PCI HW
> > > > device?
> > > > > > > > > >
> > > > > > > > > Yes. virto PCI devices are implemented as hw or as vdpa
> > > > > > > > > for many years now by
> > > > > > > > cloud operators and by NIC vendors.
> > > > > > > >
> > > > > > > > Thanks for your confirmation.
> > > > > > > >
> > > > > > > > > > > This means there are two different backends.
> > > > > > > > > > > And these two devices should not be grouped in the use
> > > > > > > > > > > case you
> > > > > > > > described.
> > > > > > > > > >
> > > > > > > > > > I think one group is enough for all use cases. It is
> > > > > > > > > > required that CIDs are unique in global, i.e. all backends.
> > > > > > > > > >
> > > > > > > > > > As your example, let me assume there are two VMs
> > > > > > > > > >
> > > > > > > > > > 1. VM0 (two vsock backends)
> > > > > > > > > >     1.1 device0 (cid=3, default), backend is host kernel (vhost-
> > vsock);
> > > > > > > > > >     1.2 device1 (cid=4), backend is HV (virtio-vsock).
> > > > > > > > > > 2. VM1
> > > > > > > > > >     2.1 device2 (cid=5, default), backend is host kernel (vhost-
> > vsock).
> > > > > > > > > >
> > > > > > > > > > The device0 is able to do VM0-HOST (src_cid=3,
> > > > > > > > > > dst_cid=2) and
> > > > > > > > > > VM0-VM1 (src_cid=3, dst_cid=5) communicatation, while
> > > > > > > > > > the
> > > > > > > > > > device1 is only able to do VM0-HV (src_cid=4, dst_cid=2)
> > > > > > communicatation.
> > > > > > > > > >
> > > > > > > > > In example 1.1 and 1.2 no devices are grouped.
> > > > > > > > > Your proposal of this patch wants to group the two devices
> > > > > > > > > and pick one of
> > > > > > > > them as default device.
> > > > > > > >
> > > > > > > > Yes. I just wonder if it is possible to have more than one
> > > > > > > > groups in one
> > > > guest?
> > > > > > > >
> > > > > > > For example
> > > > > > > Group_1: two devices dev0 and dev1, implemented as PCI HW
> > devices.
> > > > > > > Group_2: two devices by QEMU SW implemented as sw backend.
> > > > > > >
> > > > > > > All the 4 devices has _F bit indicating they can be grouped.
> > > > > > > But there is no indication that they are part of which group.
> > > > > > > And hence the guest VM driver is in dark on how to forward
> > > > > > > requests without
> > > > > > the bind() call.
> > > > > >
> > > > > > I see. Thanks!
> > > > > >
> > > > > > My idea is that there is only one default device, no matter how
> > > > > > many types of backends are. If the users intend to use other
> > > > > > devices, `bind()` call
> > > > is required.
> > > > > >
> > > > > > For example, we set `dev0` as the default device:
> > > > > >
> > > > > > 1. Do not call `bind()`: use dev0; 2. Call `bind(${dev0_cid})`:
> > > > > > use dev1; ...
> > > > > > 5. Call `bind(${dev4_cid})`: use dev4;
> > > > > >
> > > > > > Even though we introduce the group concept, if we don't call
> > > > > > `bind()`, how does driver know which group to use? If the driver
> > > > > > recoginizes the dst_cid, it can use the group to find the
> > > > > > device, then the things will be complicated. The driver needs to
> > > > > > know the
> > > > relationship between the dst_cid and the group.
> > > > > >
> > > > > Based on the dst_cid picking the right vscock group would be
> > > > > needed. This
> > > > is vsock level issue at driver level.
> > > > > Driver would need enough hints or encoding or of dst_cid or
> > > > > something
> > > > else.
> > > > >
> > > > > So even though we miss vsock level construct, it should be the
> > > > > reason to not
> > > > group the devices.
> > > > > As both attempt to solve issue at different level.
> > > > >
> > > > > > WDYT?
> > > > > >
> > > > > > Thanks,
> > > > > > Xuewei
> > > > > >
> > > > > > > > > If device0 and device1 are inserted to the VM0 with the
> > > > > > > > > feature bit you
> > > > > > > > suggested, the guest things that they are part of the same group.
> > > > > > > >
> > > > > > > > In this patch, we don't allow to insert devices without the
> > > > > > > > feature bit if there are already devices with the feature bit.
> > > > > > > >
> > > > > > > In above example of two groups, all the 4 devices spread
> > > > > > > across two groups has
> > > > > > the feature bit set.
> > > > > > > Yet, they cannot be grouped correctly.
> > > > > > > Driver driving blind thinks that all 4 devices are part of the same
> > group.
> > > > > > >
> > > > > > > > As a result, there can be either multiple devices with the
> > > > > > > > feature bit or just a single device.
> > > > > > > >
> > > > > > >
> > > > > > > > > When bind() call is not done, host sw does not know which
> > > > > > > > > device to pick up
> > > > > > > > between device0 and device1 when binding the devices.
> > > > > > > >
> > > > > > > > Are you referring to an vsock application on the host? If
> > > > > > > > yes, "host sw" is able to pick up one device according to
> > > > > > > > the dst cid. For example, pick up
> > > > > > > > device0 if `connect(3)` is called.
> > > > > > > >
> > > > > > > > Please be aware that the "host sw" can not pick up device1,
> > > > > > > > since its device is not in the host kernel.
> > > > > > > >
> > > > > > > > > > In a word, a tuple identifies a connection.
> > > > > > > > > >
> > > > > > > > > > "Refuse to connect" will be raised if the device1
> > > > > > > > > > attempts to connect to the device2. "They are not in the same
> > group"
> > > > > > > > > > is a reasonable
> > > > > > > > explaination.
> > > > > > > > > > Am I right?
> > > > > > > > > >
> > > > > > > > > During bind call, one needs to select the device when the
> > > > > > > > > devices are coming
> > > > > > > > from multiple different backends.
> > > > > > > >
> > > > > > > > Yes.
> > > > > > > >
> > > > > > > > Thanks,
> > > > > > > > Xuewei
