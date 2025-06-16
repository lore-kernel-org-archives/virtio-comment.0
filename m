Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECDA273D69
	for <virtio-comment@lists.linux.dev>; Mon, 16 Jun 2025 08:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750064394; cv=none; b=aDYnedJ4FGkqsUeU2lFl+lUX7CvpD0CUM0wlv3AOmNV+A/pCt0QSqwgMjcwXWMuLQO8vwL/fe1DIRv/UnSNC+WJcsZo7f7Gr8fBi5qZ2jISWgvZEFFZcPhHzCGdPSmfk8dbUxg9eWXYxD0NEksqWWR7curL9wOCRnU9pS7w4wBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750064394; c=relaxed/simple;
	bh=tnywwmJ6/snCPCBBOqntRFAy9jFQofQKMMPQtLT8HqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H+Z1oLE7dHWgjc4gpZiL/Xig3L/AninbHPjpwtc3OGdas3aabfOhTBTj3AIbFashWaD1aB9slTijrYbzh++OXXfb4APVpBu9RaLQzTVRqgbn8xkCRKY/zheCPMAsVdkwareIApxGHNuasyvlX8eK3JqCjCvLVfMup5ujf59oST4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuM8e8wu; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuM8e8wu"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-235f9ea8d08so40269815ad.1
        for <virtio-comment@lists.linux.dev>; Mon, 16 Jun 2025 01:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750064392; x=1750669192; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsdHdbRNotj8lQ+2XbtFlR52ttHOSHLgBVWSKVs8eJM=;
        b=KuM8e8wuXmn/a9rt24dF2dq7ePIT4FICGyOERGvvqQA2PfIlCSACxHjaCUe/FvwMuR
         HO3W0XIxyiEI2vsycZ7yRu//gWW9qSnvbh6uuFIixhhSZAln+0708g2V8pKCabrG2L2v
         MTvmrBIrrsIjZn6YbxDauteQzSV3lJOL+0mv8SAh7hWVWdoq6zHn7BDmCR43sLDj5fpY
         7H+Qy58N2LH0UMH9dqfovZFLiCQ+4wRuFgYgwy1tCiu3mv0zwuXv8kr+IzY9JWH309kj
         X+NWaAgm04fNpiIwmAYf/NKsiLmWnRC12xQZ8t78ti6vWjkRQZHtLq71wVIi3mDS/yUw
         OUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750064392; x=1750669192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KsdHdbRNotj8lQ+2XbtFlR52ttHOSHLgBVWSKVs8eJM=;
        b=WLhLzUHimTpHD9dPIQsU1pKnC1sHm30oNmX4F+yrYh9S7dZ62B6gElrzPMVnXCRVoQ
         FWEb/++6m0b2yRHnF6QE7izYRBBuseXQG+TaWUERrCjo2oIuFdhXhld9XISMTEKJM63B
         IZz3I+3ikvvE/PKItSgJqX6zcSKO7JrufcTo134olmqzkGQ3yBnCju64Pb7+75nuK3TY
         Xr2rLFNoCAV7c2IrC8EyPpLk6XVwaPTA5L0vqnlmbdDkehpYHggFYlBXxfw2Tm8Ihelv
         k9JSMzUX8c8o1S+xOWQtOpoEmikJAVazAGJEt+m9wScVDPshVxuHBYvPdTtcHPJoo/s1
         SgVA==
X-Forwarded-Encrypted: i=1; AJvYcCUG0moBl4/cASzIc1JgFSpLjCfSDI8qwNz0lzFvraj8iWo8i/grtvI3NGZjkB5RR0RINbUEoznI1KQuqasYQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJBJXC0iOP1eezTeT1jTcvS/gdw82laSO2VFR/G+6rP7X++Ml7
	Y3tmNg4D+6sJU2Uoxn45/QmImLqcttuiUEFmzslcxh8OlWqmzBDwBJkl
X-Gm-Gg: ASbGnctK2w0chHdbXdfRq/3qdQLTvACGX0IZfc/zMQamFtHfeDWhSy4ZX9PEzxqG/uM
	6iBp6kYyyJkPvvXU1kSxY2gdgml1qCW3Xjwuzfvf/a/jlPWQf8a25i6YsXNc8AzzwbwGkBuFiVf
	nErmWsIDZULrH3IxCQhDHu32ta6lc9ST/uJJc8PjsdFG/teMzOCXxhkPCot0xvMIxAWbZ5QRQ+e
	WmJXStDSQm12gVioiDKGJtyI1T17HBTYXu3s5JFJ8agb/BCO+9wE/MntMU0Xcmo0E1KuckeI5OI
	7yXgAP5vCpZ4VFRetpjh2tTmIvsI4Fp1ZMAxBpkhQXsdTgVlN5eW4EwWkO3TdYqDHN7yUB4H5MC
	CD65nVN9E
X-Google-Smtp-Source: AGHT+IGVmNCB8RAWjR0+vvF011qwGbxc+JT2CD4MCuRC6dtoNxihsRmbVql3UF73E4OHdRD8xTnGmA==
X-Received: by 2002:a17:902:ebd1:b0:234:d7c5:a0ea with SMTP id d9443c01a7336-2366b12212cmr148625165ad.24.1750064392329;
        Mon, 16 Jun 2025 01:59:52 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a183asm56365465ad.53.2025.06.16.01.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 01:59:51 -0700 (PDT)
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
Date: Mon, 16 Jun 2025 16:59:44 +0800
Message-Id: <20250616085944.1161455-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CY8PR12MB719509E84C1BDDDE468A1E19DC70A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <CY8PR12MB719509E84C1BDDDE468A1E19DC70A@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > From: Xuewei Niu <niuxuewei97@gmail.com>
> > Sent: Monday, June 16, 2025 1:48 PM
> > 
> > Hi, Parav.
> > 
> > Thanks for your detailed comments.
> > 
> > > Hi Xuewei,
> > >
> > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > Sent: Monday, May 19, 2025 3:08 PM
> > > >
> > > > > On Sat, Apr 12, 2025 at 10:28:25PM +0800, Xuewei Niu wrote:
> > > > > > This patch brings a new feature, called "multi devices", to the
> > > > > > virtio vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES"
> > > > > > feature bit, and a "device_order" field to the config for the virtio vsock.
> > > > > >
> > > > > > == Motivition ==
> > > > > >
> > > > > > Vsock is a lightweight and widely used data exchange mechanism
> > > > > > between host and guest.
> > >
> > > Even though it is the current use, the specification does not prevent its usage
> > between two guests via a host.
> > > So we should not assume such guest <-> host communication as the only
> > case to add new feature.
> > >
> > > For example, in the spec only must requirement is that src_cid ==
> > config.guest_cid.
> > > Dst_cid can be anything, it need not be well known 0x2 (for the host).
> > 
> > Yes.
> > 
> > > With this flexibility in the spec, one can connect vsock devices with multiple
> > different backends.
> > >
> > > For example,
> > > QEMU can insert one vsock device for VM to HV communication.
> > 
> > It is also able to communicate with other devices on the same host, i.e.
> > VM-to-VM.
> > 
> > > A real PCI device can insert one voscket device for VM-to-VM
> > communication bypassing a full TCP/IP stack.
> > 
> > AFAIK, all devices are implemented in software. Is it a real PCI HW device?
> > 
> Yes. virto PCI devices are implemented as hw or as vdpa for many years now by cloud operators and by NIC vendors.

Thanks for your confirmation.

> > > This means there are two different backends.
> > > And these two devices should not be grouped in the use case you described.
> > 
> > I think one group is enough for all use cases. It is required that CIDs are unique
> > in global, i.e. all backends.
> > 
> > As your example, let me assume there are two VMs
> > 
> > 1. VM0 (two vsock backends)
> >     1.1 device0 (cid=3, default), backend is host kernel (vhost-vsock);
> >     1.2 device1 (cid=4), backend is HV (virtio-vsock).
> > 2. VM1
> >     2.1 device2 (cid=5, default), backend is host kernel (vhost-vsock).
> > 
> > The device0 is able to do VM0-HOST (src_cid=3, dst_cid=2) and VM0-VM1
> > (src_cid=3, dst_cid=5) communicatation, while the device1 is only able to do
> > VM0-HV (src_cid=4, dst_cid=2) communicatation.
> > 
> In example 1.1 and 1.2 no devices are grouped.
> Your proposal of this patch wants to group the two devices and pick one of them as default device.

Yes. I just wonder if it is possible to have more than one groups in one guest?

> If device0 and device1 are inserted to the VM0 with the feature bit you suggested, the guest things that they are part of the same group.

In this patch, we don't allow to insert devices without the feature bit if
there are already devices with the feature bit.

As a result, there can be either multiple devices with the feature bit or
just a single device.

> When bind() call is not done, host sw does not know which device to pick up between device0 and device1 when binding the devices.

Are you referring to an vsock application on the host? If yes, "host sw" is
able to pick up one device according to the dst cid. For example, pick up
device0 if `connect(3)` is called.

Please be aware that the "host sw" can not pick up device1, since its device
is not in the host kernel.

> > In a word, a tuple identifies a connection.
> > 
> > "Refuse to connect" will be raised if the device1 attempts to connect to the
> > device2. "They are not in the same group" is a reasonable explaination.
> > Am I right?
> > 
> During bind call, one needs to select the device when the devices are coming from multiple different backends.

Yes.

Thanks,
Xuewei
