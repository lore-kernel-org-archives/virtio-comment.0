Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CCE22AE45
	for <virtio-comment@lists.linux.dev>; Tue, 17 Jun 2025 07:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750146088; cv=none; b=MdR1Ncy60uXheDKHfLfsLDoRUsUHTxvpE1XDsooQ4oldYZdNjBXQiLhjI5LnmdR3cGfYuk8uTd9whNF+8IM3jwFrjiHNi0ot0Nx5TXAB/vQSGb3YSrZfQP+Dx2jGlTWEFPYPSMKeepcrGTw6+s4nuOs49/atojFYTI5sxo9y0Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750146088; c=relaxed/simple;
	bh=U7suqWWt3F0/yRetZvG/lPnlIlCoQbYmy+TW78nt/Vk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BqT/lfefEhGl2jkL9pGfZyuiekq04yMvCRl8q4AI8Wt4jr/VvAxV0CKHtxBGTHVbfJ1mE8JjGeUvxwPMK8RZbFiLsATZKg9JiXQ4jAhlJRK05YtaPBbOk/krKEEDtJfCkn62RkoNTgeg921phpNFx0y2wnIO4f9d1HAlUuLzt18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjuPMlfd; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjuPMlfd"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-31223a4cddeso3911936a91.1
        for <virtio-comment@lists.linux.dev>; Tue, 17 Jun 2025 00:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750146086; x=1750750886; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpojfvUV/oqIk6SBYbbzt2268ToDTncNZx6ycYeL3QQ=;
        b=bjuPMlfd634E0v6mEZtxe7iM/frS6YHem90CAbo9/xpOJcS2ISjyHXudEcWR9NQFPI
         wE8SX4GoxFTUrQM10BUpLxJ//nVxrlo+wJssg4fEi89IkRpSeIrUDw/nBzvO8vzLprQB
         221aYLIY/6UU8fkyUGmPgTKsWxuDtuvIN+U6nlHRjKMHTc2DW1cVeUVB7ypShQHkbyER
         Pkd4b5dIPqv2pl2W4LhJ9XWpKQP95kwWu2WcBHOrF4VViVtbo3MDO48pd2uzcJQSFUpZ
         tybZpzYJs/kITlvUn+L7XE+ln3wXaMp8tPLnE8dlY/jr9+hMU+lIc9lWBHLvtSkQB4DD
         TiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750146086; x=1750750886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpojfvUV/oqIk6SBYbbzt2268ToDTncNZx6ycYeL3QQ=;
        b=S14xuCF+5jzlcH1Pxp1EP4rIBLW7BPRarE6eFrkyXgr05tKU79DERyzWJMNgpyWoci
         ZXZWmNJlrgVKLoxnqJVlW1FbC3Yg+XZK5wdO+mU0yt+0EHR+rwOXHp1+sACDKQBGH7Tc
         3GAzb8Qmqk4zgeD3fa9yjwoYIwZhBeQ4A4C3b3hzUAcFlmJgUocaPqk/Othnyh63GXsk
         +y/1I273cp+sTNN/a3CGPMZIQZf79lEGiffNS5eut1OaWFmiCzQBeakeF9Qn8wqSq5Dk
         kUBPQZiFio8Lg4wScarfiTGWVYVZ6/I1CwRKSGRBi6QOQYU8LWc1+8lUObcNGoUf9Bh3
         p/qQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3YHND3tjQIsDdQQGXrnpTvAK1110h8+fZrnziHuzsQRWhUhg9MkAbpj3NWbTf9hd1C33t+fBWLQyowD1DqA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzG7kl1EEW54iCnHieaOMWMEBn6i0zYH052kruaQHPn5yKyZP6T
	mcU6CbzMobzHhUSFjfWH65Z9kQ6D7Mvvom/uPV+wF8qiuLCGcCUH6dFx
X-Gm-Gg: ASbGnctqoQCUVZeaXF8ZxrLiWqcULLDp38Wy1UZdwsfRd/ij1PYyVq8wMMJJWcF5CIR
	FjaJ9HAbX1P+EsSz4Hv0zUyQ3uLTNhZaZATXbsBJWdDMAR4ThmsJ8hcRXzlTCqK/k56d6DfzWaJ
	DAS6BW+N0AAZt3w1iBPZRU1zBcmUcMYUuR/oy62E3libDgqmEUnifMlSCc/d6LuKXdd4TlxQUe5
	wCir0rfGlZVQyMdOAAj1NbUR1DveTUmhg4bOt6qe7NgiS/EhDDXF6y97rX9jokSrVWX/+Haigw9
	mrNsiMDlzuPAtuK1cIz/VAPd9wYGmYVSv+D6aSFhhKcNZFDqYnxvqgt7W8wIFpQ0leEZ+vbH2Xg
	0k1uXvMrU
X-Google-Smtp-Source: AGHT+IHiqzfHSdjszyM/n/LXBcPqA26q1QZ27ykHPp06TMQkREUIlE7vRA04FqteX3m2l4yb0fjKyA==
X-Received: by 2002:a17:90b:1a87:b0:311:abba:53c0 with SMTP id 98e67ed59e1d1-313f1c03004mr19442314a91.9.1750146086101;
        Tue, 17 Jun 2025 00:41:26 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b4993fsm9955302a91.30.2025.06.17.00.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:41:25 -0700 (PDT)
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
Date: Tue, 17 Jun 2025 15:41:13 +0800
Message-Id: <20250617074113.1319690-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CY8PR12MB71953DBC944921FDD7AB630DDC73A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <CY8PR12MB71953DBC944921FDD7AB630DDC73A@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Resend, because it isn’t listed in the mailing list due to my mistake.

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

Here is an example of the guest client.

All operations for hinting addresses are as follows:

- `connect()` is required, to specify the destination;
- `bind()` is optional, to specify the source. (We don't call in this case)

We set destination to host (CID=2), which is a valid dst_cid for every
group existed, the driver still don't have enough information to pick up a
device.

In a word, even though we have the group, the driver is still in dark on
how to forward requests.

As I mentioned in the another email, I think there is one default device
for HV-VM communication, to gather the information about other devices,
e.g. CID, purpose, and other details of other devices. This is a job at
the application level. If the apps intend to establish connections with
others (not HV), they must call `bind()` explicitly to select a device,
regardless of its backend.

Hey @Stefano, could you please give your opinion on this?

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
