Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88AB23F422
	for <virtio-comment@lists.linux.dev>; Thu, 19 Jun 2025 05:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750309846; cv=none; b=DiIH9by2n4UGmIhHzUIQcmQ6KCxIESYppPw9bZBEGrFstI6MRq188lMIDqHXKNw6k9IoTf5k5u8O/LTfDO9cfOlUj2eoe47MfZI12atjQ9GkLN01akhVUwW+cYzQJH3Wt7fS+erXjR52DrykCmS0FM7P3KG3qiBiBE8c4A64iBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750309846; c=relaxed/simple;
	bh=y9xWFTfvtqWGbl8LtDJC88p01JEcVwVLl5jIfEWxXpc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uwHl5Z6iJvpecNkDI9EK8uZ3YKEcg7rvGfH0uGwCOd3XK84nEhdqBvUce+xz4BAlackuENyVNfxVZ7Lf5Dr87JDuPLo3WO95APAZaLNWxf2nOW6hUOa3+YX7E+H1oNl7x8q2DrFZtsOVg+gKcCz/uqqmCzlC+xRo7f2tmx3rxY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIirU59T; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIirU59T"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-748764d8540so353139b3a.0
        for <virtio-comment@lists.linux.dev>; Wed, 18 Jun 2025 22:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750309843; x=1750914643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzC4kwUvflgVEYBuQ01s+5fF0quSO3FJO/zoULCAJ7c=;
        b=eIirU59TTn1bpnIlukYQqhtIl06qi87+/BOnST/RSO4Za5ixVDmJtyO21tSl+TDnF3
         0Gcn5/5IiUU64PnxdWjNy2/amCrcQyuMIi7hmLtDVt9zbkcefUesckce8wEXZlVlsEsc
         lRVLsO5Z8GqKNuPyjOulCBhan+cFngU/nQyvkYLys0VTr0cpRtRCKNULhi3joCjoXyQf
         9Qwgo0GjgyXfC1BAp8kRl4FSF71WAXSpS6996pq4KNchW6iI5Gva/TkTj7g3J+el1DzL
         x20E4zXgzUE43nX9nKnMp/YEH9OFMB91RSocMJKRWgqRwGqonJDj4ZPuRCP37rAxihAd
         9V7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750309843; x=1750914643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzC4kwUvflgVEYBuQ01s+5fF0quSO3FJO/zoULCAJ7c=;
        b=atHQN2XgdmWBDEiQAazN10AJXBFlrtvzCoKE5d3NUFn/agecYKMYGm/eFWfJg1oCIs
         nrcSPXRleABA7uxdaxE2R+wiOp88JfbXcDgEY7XFjtQH+XfncWUMiGQ2NkKIRab7KgyM
         /8uMCTgdDgoz2ZmOXtitHjmesEpFE0jg5cDsIe5kEtD7aJ2u0fODpcqxtRC+xk5B91gG
         JzBzyDLn+m42rFj3zF6Wh4CvRva9kBNMy5Jj65YFh48o72pL5X7xrkbg3VFmsYJ1p0yM
         RZnb3HSLeBPkqt0iAL+7rT5ZDvFbkypYYadhgfMYls2oxnbrcMsyJAcYdnc+EG4+V7Vx
         0phw==
X-Forwarded-Encrypted: i=1; AJvYcCURqdf7cWibhybBNFyq19gdDZes6v2ORoo5ujhsmkUTxkfWTDuEdWlmvppQFGHoYOSLBXUqjbTWqb6rU9Nhdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwanCS/QfMHlPfkUaaXgOrHMoOgbCOrDeqJMPPCYaxf34bn+i+d
	7WUaAlPXJ8LhZHTC0M0O+XXL8vH3pzf6BbEXl5tYk/QrrfJQmqESTeUt
X-Gm-Gg: ASbGncuG6oroXO5RdQqc5cOx7uZAguRQUIK2YNhP+mYzhac0UMEPK+gq5+HBF7iztq/
	Bys42KrqXVVn112WZEOY0zzkeHZuhvjPHHIJrmHiFiT7QNtRr5hNOwMU6yZ259cv1Bme9qBnHwH
	Pa5zLhrxL0qycA7HBooa9K13Te1a6ydZk5u7gC2wQE56G5ipctFXphMeTmXMCrBsg1A5nuIMQOv
	2sJFsDaBm+4j8n2iJtXvvCDt+NDAGf0R5GDI6obqcQd1dh4pO07RE4/5sgau5ZKNt7MFDbdjUNf
	kXEa/Gl8IkweNVjFWgv1jubpi1bDbRNvWVev4MDLRi+ogSh/40WFTgSsv5n8Au304B2juI4pml1
	edBoT+FyT
X-Google-Smtp-Source: AGHT+IHvgABCG45S2RKAq4RvrgH3hWwp8sgAFttr4gdzU02g1pPtGyjL4HXm3Lklg6N/WC/zgDH3Nw==
X-Received: by 2002:a05:6a00:99c:b0:73d:b1ff:c758 with SMTP id d2e1a72fcca58-7489d02e3bfmr28460543b3a.18.1750309842889;
        Wed, 18 Jun 2025 22:10:42 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748e03df1aesm3666268b3a.78.2025.06.18.22.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 22:10:42 -0700 (PDT)
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
Date: Thu, 19 Jun 2025 13:10:33 +0800
Message-Id: <20250619051033.1433974-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CY8PR12MB7195BE725E1871233857FE57DC7DA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <CY8PR12MB7195BE725E1871233857FE57DC7DA@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> > From: Xuewei Niu <niuxuewei97@gmail.com>
> > Sent: 19 June 2025 08:57 AM
> > 
> > Hi Parav,
> > 
> > Could you please take a look at the diagram in [1]?
> > 
> > IIUC, for VM0, there are two groups, and for VM1, there is only one group.
> > Am I right? If yes, I think the group concept is reasonable but we don't need
> > at this time.
> > 
> > I think the first thing is to figure out how to pick the right group.
> > 
> > Standard socket doesn't provide a way to access the group information.
> > 
> > Source and destination are from `bind()` and `connect()`, respectively. If we
> > don't call `bind()`, only the destination is known.
> > 
> > However, only destination is not enough to find the group. For example, the
> > well-known CIDs (e.g. 2) are valid for all groups.
> > 
> > 1:
> > https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/
> 
> Right. Sock addressing scheme is naïve presently to select the group. Not sure when/how you or others plan to do.
> This is transport layer problem to solve (not to confuse with transport = pci/mmio etc).
> 
> However, at device level, we should have the construct of grouping.
> Without this construct, all devices will be part of single group and one will not be able to build the group concept later.
> So even if you don't need it explicitly now, grouping the device is what you need when connect() is called.
> 
> So I was imagining a relatively simple scheme:
> For example, virtio device level, some kind of group id is present.
> So two devices which has same group id, are part of single group.
> An example group id format can be a UUID.
> 
> And this is completely optional for devices to implement.
> Generic enough and usable beyond just vsock device in other use cases we discussed in past.

Fair enough.

@Stefano, could you please take a look at this? I'd love to have some input
from you.

A brief summary of the idea is: The config space will be extended to
include a group id. The devices with the same group id are considered to be
in the same group.

Thanks,
Xuewei
 
> > 
> > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > Sent: Monday, June 16, 2025 4:26 PM
> > > >
> > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > Sent: Monday, June 16, 2025 2:30 PM
> > > > > >
> > > > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > > > Sent: Monday, June 16, 2025 1:48 PM
> > > > > > > >
> > > > > > > > Hi, Parav.
> > > > > > > >
> > > > > > > > Thanks for your detailed comments.
> > > > > > > >
> > > > > > > > > Hi Xuewei,
> > > > > > > > >
> > > > > > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > > > > > Sent: Monday, May 19, 2025 3:08 PM
> > > > > > > > > >
> > > > > > > > > > > On Sat, Apr 12, 2025 at 10:28:25PM +0800, Xuewei Niu wrote:
> > > > > > > > > > > > This patch brings a new feature, called "multi
> > > > > > > > > > > > devices", to the virtio vsock. It introduces a
> > > > "VIRTIO_VSOCK_F_MULTI_DEVICES"
> > > > > > > > > > > > feature bit, and a "device_order" field to the
> > > > > > > > > > > > config for the virtio
> > > > > > vsock.
> > > > > > > > > > > >
> > > > > > > > > > > > == Motivition ==
> > > > > > > > > > > >
> > > > > > > > > > > > Vsock is a lightweight and widely used data exchange
> > > > > > > > > > > > mechanism between host and guest.
> > > > > > > > >
> > > > > > > > > Even though it is the current use, the specification does
> > > > > > > > > not prevent its usage
> > > > > > > > between two guests via a host.
> > > > > > > > > So we should not assume such guest <-> host communication
> > > > > > > > > as the only
> > > > > > > > case to add new feature.
> > > > > > > > >
> > > > > > > > > For example, in the spec only must requirement is that
> > > > > > > > > src_cid ==
> > > > > > > > config.guest_cid.
> > > > > > > > > Dst_cid can be anything, it need not be well known 0x2 (for the
> > host).
> > > > > > > >
> > > > > > > > Yes.
> > > > > > > >
> > > > > > > > > With this flexibility in the spec, one can connect vsock
> > > > > > > > > devices with multiple
> > > > > > > > different backends.
> > > > > > > > >
> > > > > > > > > For example,
> > > > > > > > > QEMU can insert one vsock device for VM to HV communication.
> > > > > > > >
> > > > > > > > It is also able to communicate with other devices on the same host,
> > i.e.
> > > > > > > > VM-to-VM.
> > > > > > > >
> > > > > > > > > A real PCI device can insert one voscket device for
> > > > > > > > > VM-to-VM
> > > > > > > > communication bypassing a full TCP/IP stack.
> > > > > > > >
> > > > > > > > AFAIK, all devices are implemented in software. Is it a real PCI HW
> > device?
> > > > > > > >
> > > > > > > Yes. virto PCI devices are implemented as hw or as vdpa for
> > > > > > > many years now by
> > > > > > cloud operators and by NIC vendors.
> > > > > >
> > > > > > Thanks for your confirmation.
> > > > > >
> > > > > > > > > This means there are two different backends.
> > > > > > > > > And these two devices should not be grouped in the use
> > > > > > > > > case you
> > > > > > described.
> > > > > > > >
> > > > > > > > I think one group is enough for all use cases. It is
> > > > > > > > required that CIDs are unique in global, i.e. all backends.
> > > > > > > >
> > > > > > > > As your example, let me assume there are two VMs
> > > > > > > >
> > > > > > > > 1. VM0 (two vsock backends)
> > > > > > > >     1.1 device0 (cid=3, default), backend is host kernel (vhost-vsock);
> > > > > > > >     1.2 device1 (cid=4), backend is HV (virtio-vsock).
> > > > > > > > 2. VM1
> > > > > > > >     2.1 device2 (cid=5, default), backend is host kernel (vhost-vsock).
> > > > > > > >
> > > > > > > > The device0 is able to do VM0-HOST (src_cid=3, dst_cid=2)
> > > > > > > > and
> > > > > > > > VM0-VM1 (src_cid=3, dst_cid=5) communicatation, while the
> > > > > > > > device1 is only able to do VM0-HV (src_cid=4, dst_cid=2)
> > > > communicatation.
> > > > > > > >
> > > > > > > In example 1.1 and 1.2 no devices are grouped.
> > > > > > > Your proposal of this patch wants to group the two devices and
> > > > > > > pick one of
> > > > > > them as default device.
> > > > > >
> > > > > > Yes. I just wonder if it is possible to have more than one groups in one
> > guest?
> > > > > >
> > > > > For example
> > > > > Group_1: two devices dev0 and dev1, implemented as PCI HW devices.
> > > > > Group_2: two devices by QEMU SW implemented as sw backend.
> > > > >
> > > > > All the 4 devices has _F bit indicating they can be grouped.
> > > > > But there is no indication that they are part of which group.
> > > > > And hence the guest VM driver is in dark on how to forward
> > > > > requests without
> > > > the bind() call.
> > > >
> > > > I see. Thanks!
> > > >
> > > > My idea is that there is only one default device, no matter how many
> > > > types of backends are. If the users intend to use other devices, `bind()` call
> > is required.
> > > >
> > > > For example, we set `dev0` as the default device:
> > > >
> > > > 1. Do not call `bind()`: use dev0;
> > > > 2. Call `bind(${dev0_cid})`: use dev1; ...
> > > > 5. Call `bind(${dev4_cid})`: use dev4;
> > > >
> > > > Even though we introduce the group concept, if we don't call
> > > > `bind()`, how does driver know which group to use? If the driver
> > > > recoginizes the dst_cid, it can use the group to find the device,
> > > > then the things will be complicated. The driver needs to know the
> > relationship between the dst_cid and the group.
> > > >
> > > Based on the dst_cid picking the right vscock group would be needed. This
> > is vsock level issue at driver level.
> > > Driver would need enough hints or encoding or of dst_cid or something
> > else.
> > >
> > > So even though we miss vsock level construct, it should be the reason to not
> > group the devices.
> > > As both attempt to solve issue at different level.
> > >
> > > > WDYT?
> > > >
> > > > Thanks,
> > > > Xuewei
> > > >
> > > > > > > If device0 and device1 are inserted to the VM0 with the
> > > > > > > feature bit you
> > > > > > suggested, the guest things that they are part of the same group.
> > > > > >
> > > > > > In this patch, we don't allow to insert devices without the
> > > > > > feature bit if there are already devices with the feature bit.
> > > > > >
> > > > > In above example of two groups, all the 4 devices spread across
> > > > > two groups has
> > > > the feature bit set.
> > > > > Yet, they cannot be grouped correctly.
> > > > > Driver driving blind thinks that all 4 devices are part of the same group.
> > > > >
> > > > > > As a result, there can be either multiple devices with the
> > > > > > feature bit or just a single device.
> > > > > >
> > > > >
> > > > > > > When bind() call is not done, host sw does not know which
> > > > > > > device to pick up
> > > > > > between device0 and device1 when binding the devices.
> > > > > >
> > > > > > Are you referring to an vsock application on the host? If yes,
> > > > > > "host sw" is able to pick up one device according to the dst
> > > > > > cid. For example, pick up
> > > > > > device0 if `connect(3)` is called.
> > > > > >
> > > > > > Please be aware that the "host sw" can not pick up device1,
> > > > > > since its device is not in the host kernel.
> > > > > >
> > > > > > > > In a word, a tuple identifies a connection.
> > > > > > > >
> > > > > > > > "Refuse to connect" will be raised if the device1 attempts
> > > > > > > > to connect to the device2. "They are not in the same group"
> > > > > > > > is a reasonable
> > > > > > explaination.
> > > > > > > > Am I right?
> > > > > > > >
> > > > > > > During bind call, one needs to select the device when the
> > > > > > > devices are coming
> > > > > > from multiple different backends.
> > > > > >
> > > > > > Yes.
> > > > > >
> > > > > > Thanks,
> > > > > > Xuewei
