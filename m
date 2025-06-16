Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD5020B80D
	for <virtio-comment@lists.linux.dev>; Mon, 16 Jun 2025 10:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750071383; cv=none; b=MC/2aBJMXA5e5OWx8P4E0gu1rW3+dge+TUJ+phhMlSRFiSv8Qlr5nZGciCy/CNfiFBqel5yGDKQMYwiooNVNHEaIANDM5Bqu3U7Yoi6OqehAsbBiTQt4D5ly+M7U48XPf9wVJKsBuTtEHsF4mgMOWtW1QqWoR4Px8fY/ehbqgHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750071383; c=relaxed/simple;
	bh=2/GJO68Q2EfmgnnA96NBOauZxJ2Asj4eom+BKslh3ms=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R/E4ey2hBJO2rsQpT52bzom3tSIRYkbm30CbXM6YAhNhM7uzRNA9SkpD7xl0UxDKjKFJHO4IoUgW7U8rE8oYf/RObfmLRDak3e0viSRckwwinysJe0q8vkafNAVX++y4AoJITVsNJCnSLSwVdnu6hSYBZyrZ57aQDWhaBJjOs44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAyz4K5+; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAyz4K5+"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-747fba9f962so3557831b3a.0
        for <virtio-comment@lists.linux.dev>; Mon, 16 Jun 2025 03:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750071381; x=1750676181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjsrPLzIRkjUcQG6Vr5nbsJDXEG3rn+x9pIE0EE/SZs=;
        b=PAyz4K5+Xs611XpzuRX4tvjGQfQX+LEKaHxnEg7sYwr0JwV6Pj/SXrHXRkw8wOFRLG
         oHIqqlelf8DDFpeB3CJiqNAYhYkwN/3xwy3gSrVrQjbbsPLMhcJBolBHTz5FOHut1Grq
         EF5b3ariuzPwfgp0mFL/sDvDwoJfizFwLgS2rA5QfivHNCwTdJCQqxEUop+5uAduN0Q0
         BgCM/fs85BBBEGaekVCfB2uA5ElzOuayQPa8ey/mPFpAy7iF2IhaculwxPHhfJpeh4BH
         BIOaAEoJ8+99ABJ+mxW9L9XSsxRKAwEyZV1ZsruLsTBWH3dsI9ilXcFZ1vri8uELuwCT
         ZQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750071381; x=1750676181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JjsrPLzIRkjUcQG6Vr5nbsJDXEG3rn+x9pIE0EE/SZs=;
        b=cfSEp4LCJMBjJqTTcKW2XHFI3L9i9DqK8RteyRBmZOSTCmmttpnwZFkXwsDKyqNOwC
         vRVZRNaVHYXVdukvS93xYXU+qhkIBRgpShqb2IzW3pGw58ftuqJ2qeZKqRp39bR+rwH+
         69DhQk8CSXFjs+3QsWIz1egWUx9Rwz54KccC2PZSWRyGsO5GZCEYNV+0N6sCaA2RAOh6
         DXYye3nRiPnwqT5YZDL4B/5R5XAZvbrNaitGosQ1ggOobwEvCm8Llg0sqNIz1iK8HEX2
         yDgWrQqMYFhAmXFvFOTXBhc8CwA7tGm474LX5mVBKxP7+oZGRMp4WqHzjsbLtI6AGKVI
         xWmA==
X-Forwarded-Encrypted: i=1; AJvYcCVp/90TBjmrm53mddGNllrPXIdjeeJdfNeBtErrxXKErZ6FQFLo/A2iIgoX4c3Y17hIq1IvqT9/TO8+GaL7hg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgD77+pZZH0vpNMhQLGbMdut3Qz8S4btVWaToUIDhy5LJRixlc
	4k7LOpytLlbUFIyW8Ld0q3wMnsPHPYSBNG9QkyezD8tfdvWluNxMycuo
X-Gm-Gg: ASbGncuOb+Ls4vKvk/+VtTkNHePB42U4XBtQQS/q6kCzaBuEszsHItyY8Al+HbXRMtV
	oPk/Itq4YU7V50tB36v7sa+loJXkfxJU0QS/4JipzRYl0ux39AxRPwMU7+RJmi5BrzpVY69SdGY
	Meq8YtVoijLsQmPyP8smZX7MRZcYHjle47dyBvW0Zv7JSB+WQFU3J26adOHzwX+2uRLYkrwqGlg
	1jQcec/EH5NGiLhAZNBmIeeyApCd2HZNGpaZp3cGkoiX8o57IiC2GmQmJ58yV1S05HIj6w/Vm+j
	FZzTulV3Flh30zLvIY538rK7oMHaIh2UYFLnsLaeHsnl4qR42Fs9qs2y70aZ1XMoSg1G/B5tZbM
	lPdOiClzC
X-Google-Smtp-Source: AGHT+IG9QBioQYGZQKxYrqUlDlmDWc4DCIdpOm7ZF5WYgjDPfXhRtOokFdoM5Sm15FMu1UAW4oDS1g==
X-Received: by 2002:a05:6a00:2dc:b0:742:ccf9:317a with SMTP id d2e1a72fcca58-748985aff94mr10881292b3a.12.1750071380805;
        Mon, 16 Jun 2025 03:56:20 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890083029sm6486299b3a.81.2025.06.16.03.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 03:56:20 -0700 (PDT)
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
Date: Mon, 16 Jun 2025 18:56:10 +0800
Message-Id: <20250616105610.1163586-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CY8PR12MB719558D3E9B840AC0E7C398FDC70A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <CY8PR12MB719558D3E9B840AC0E7C398FDC70A@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > From: Xuewei Niu <niuxuewei97@gmail.com>
> > Sent: Monday, June 16, 2025 2:30 PM
> > 
> > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > Sent: Monday, June 16, 2025 1:48 PM
> > > >
> > > > Hi, Parav.
> > > >
> > > > Thanks for your detailed comments.
> > > >
> > > > > Hi Xuewei,
> > > > >
> > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > Sent: Monday, May 19, 2025 3:08 PM
> > > > > >
> > > > > > > On Sat, Apr 12, 2025 at 10:28:25PM +0800, Xuewei Niu wrote:
> > > > > > > > This patch brings a new feature, called "multi devices", to
> > > > > > > > the virtio vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES"
> > > > > > > > feature bit, and a "device_order" field to the config for the virtio
> > vsock.
> > > > > > > >
> > > > > > > > == Motivition ==
> > > > > > > >
> > > > > > > > Vsock is a lightweight and widely used data exchange
> > > > > > > > mechanism between host and guest.
> > > > >
> > > > > Even though it is the current use, the specification does not
> > > > > prevent its usage
> > > > between two guests via a host.
> > > > > So we should not assume such guest <-> host communication as the
> > > > > only
> > > > case to add new feature.
> > > > >
> > > > > For example, in the spec only must requirement is that src_cid ==
> > > > config.guest_cid.
> > > > > Dst_cid can be anything, it need not be well known 0x2 (for the host).
> > > >
> > > > Yes.
> > > >
> > > > > With this flexibility in the spec, one can connect vsock devices
> > > > > with multiple
> > > > different backends.
> > > > >
> > > > > For example,
> > > > > QEMU can insert one vsock device for VM to HV communication.
> > > >
> > > > It is also able to communicate with other devices on the same host, i.e.
> > > > VM-to-VM.
> > > >
> > > > > A real PCI device can insert one voscket device for VM-to-VM
> > > > communication bypassing a full TCP/IP stack.
> > > >
> > > > AFAIK, all devices are implemented in software. Is it a real PCI HW device?
> > > >
> > > Yes. virto PCI devices are implemented as hw or as vdpa for many years now by
> > cloud operators and by NIC vendors.
> > 
> > Thanks for your confirmation.
> > 
> > > > > This means there are two different backends.
> > > > > And these two devices should not be grouped in the use case you
> > described.
> > > >
> > > > I think one group is enough for all use cases. It is required that
> > > > CIDs are unique in global, i.e. all backends.
> > > >
> > > > As your example, let me assume there are two VMs
> > > >
> > > > 1. VM0 (two vsock backends)
> > > >     1.1 device0 (cid=3, default), backend is host kernel (vhost-vsock);
> > > >     1.2 device1 (cid=4), backend is HV (virtio-vsock).
> > > > 2. VM1
> > > >     2.1 device2 (cid=5, default), backend is host kernel (vhost-vsock).
> > > >
> > > > The device0 is able to do VM0-HOST (src_cid=3, dst_cid=2) and
> > > > VM0-VM1 (src_cid=3, dst_cid=5) communicatation, while the device1 is
> > > > only able to do VM0-HV (src_cid=4, dst_cid=2) communicatation.
> > > >
> > > In example 1.1 and 1.2 no devices are grouped.
> > > Your proposal of this patch wants to group the two devices and pick one of
> > them as default device.
> > 
> > Yes. I just wonder if it is possible to have more than one groups in one guest?
> > 
> For example
> Group_1: two devices dev0 and dev1, implemented as PCI HW devices.
> Group_2: two devices by QEMU SW implemented as sw backend.
> 
> All the 4 devices has _F bit indicating they can be grouped.
> But there is no indication that they are part of which group.
> And hence the guest VM driver is in dark on how to forward requests without the bind() call.

I see. Thanks!

My idea is that there is only one default device, no matter how many types
of backends are. If the users intend to use other devices, `bind()` call
is required.

For example, we set `dev0` as the default device:

1. Do not call `bind()`: use dev0;
2. Call `bind(${dev0_cid})`: use dev1;
...
5. Call `bind(${dev4_cid})`: use dev4;

Even though we introduce the group concept, if we don't call `bind()`, how
does driver know which group to use? If the driver recoginizes the dst_cid,
it can use the group to find the device, then the things will be
complicated. The driver needs to know the relationship between the dst_cid
and the group.

WDYT?

Thanks,
Xuewei

> > > If device0 and device1 are inserted to the VM0 with the feature bit you
> > suggested, the guest things that they are part of the same group.
> > 
> > In this patch, we don't allow to insert devices without the feature bit if there are
> > already devices with the feature bit.
> > 
> In above example of two groups, all the 4 devices spread across two groups has the feature bit set.
> Yet, they cannot be grouped correctly.
> Driver driving blind thinks that all 4 devices are part of the same group.
> 
> > As a result, there can be either multiple devices with the feature bit or just a
> > single device.
> > 
> 
> > > When bind() call is not done, host sw does not know which device to pick up
> > between device0 and device1 when binding the devices.
> > 
> > Are you referring to an vsock application on the host? If yes, "host sw" is able to
> > pick up one device according to the dst cid. For example, pick up
> > device0 if `connect(3)` is called.
> > 
> > Please be aware that the "host sw" can not pick up device1, since its device is not
> > in the host kernel.
> > 
> > > > In a word, a tuple identifies a connection.
> > > >
> > > > "Refuse to connect" will be raised if the device1 attempts to
> > > > connect to the device2. "They are not in the same group" is a reasonable
> > explaination.
> > > > Am I right?
> > > >
> > > During bind call, one needs to select the device when the devices are coming
> > from multiple different backends.
> > 
> > Yes.
> > 
> > Thanks,
> > Xuewei
