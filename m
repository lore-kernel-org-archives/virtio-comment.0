Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951EB29DB9B
	for <virtio-comment@lists.linux.dev>; Mon, 16 Jun 2025 11:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750071652; cv=none; b=XpbCu1X/qH3XOYHsnsdNT/X4bSLx7yg9e4p8IA6LWs3cgkEJ/nReNxUT4NtZZ2N7Ev99HhiG2aa2P+a8GYq12M9jlA4dGAp0Y66syWLyHiflCzm822W3LyphGfpv0YZGFFAID5SZoKQc2zezDrYnNAGLZHLJV3pw3WtWymAUZjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750071652; c=relaxed/simple;
	bh=jo+Cj/Vu0GCihHhdaylAraD92BJ/QT8naAs5BrZX4qQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qOM3B7M5K/pVpRIbSdKJfkOg0tSHpB+JbGcNwaqbk0VIzeByT924PLEHREPiqQbED8BtIx3pkzlg1rMQLLtzIt2Cpf4ryfnNPWyOL7GBhRzzw0KewU5dxnyu6P1mgfEDqP0djVuzXE9k/9ag+X9H980fhVd/OexXn8EyZ0EF1P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiI6OtXK; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiI6OtXK"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-235ea292956so37786265ad.1
        for <virtio-comment@lists.linux.dev>; Mon, 16 Jun 2025 04:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750071650; x=1750676450; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxRxLWQRSsptiRHkESYiIi7FA6+z+csXdANtG6R/U8M=;
        b=DiI6OtXKCFECqb3yescMmaMfR8z3h40Bt7ULUVl3aWIbt3NTJIxmpcaXGzAGiyJ+j9
         sbboLwobRE59XLQSY6cf3rle0VUqRvgYXx9GRpLPOqYIGUAItVX5jqXw1nJbepvbBDD1
         BHBK4EBiL5oFjIXER65G5Obl3IR592v3ppLqHf8tfcCxhBpQCHO86uGBHMF82tG6JM3B
         rMcnW+1lQqFhbugVaQAuEODDo9KtyuWTdfE9LNVPpU+gpMdlurwmfrDFe/sHfub+9PPm
         yA4IkhzRhIwrr3d3fJG354aDcEbxLoAvOAQHnX2qmd9slXNhWz9sTGOuln1p0WEYx+PC
         VWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750071650; x=1750676450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxRxLWQRSsptiRHkESYiIi7FA6+z+csXdANtG6R/U8M=;
        b=jpVoLTvgVuTC4vSuCu4uPSIYBgToMpWKsXBc6RkYZbFBdoraaHDsAOWAkVRyGNEU2X
         g2x/yuepmXTiaZhKYMIhObsR7HNVNknpNv/0qi66OjUVcSI2jFpsjslX6oaEF8iRsBba
         +MSuLdnuT1zqFSIV4P/9IvyjdrCf0Y5i0bkMpF/C7LnCmmRZNHvLcZ9Sa7G/95bMG8bx
         d32B/AvbIBSvDvn869LYi4vAdiLGsVrhVf4aYi3U7JZepsw6kAQQkSOiZfRZL+HlU8Yt
         4YN9r9akpX31FY2IO8jx+x9Lg46TjdTO1v5Vl75E19XMIU/n6CWsbweAGSKwaEdAR34e
         Ta9A==
X-Forwarded-Encrypted: i=1; AJvYcCX+LbN/uCHWH/k+Ohpotzl9+Fftdra77mnTgdfIniNDObjyNkCeeOqmnirTFTRIRwiZex4NBA0Y+nK4pY+z8w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzrnce+TNcHcCs4hZvfimni6XKe86hsEpBnKlOI3Fb8TqXpnuMx
	m9LbOAFymMgpvU/MDp15HquZqjRppDxUCXGoUxB2/k0ykv7xeaIE90wk
X-Gm-Gg: ASbGncuOQOjqwWORov3h5Hew7Bo7O+XPuMUI/uakTVrn9CfwfiiEK7F6eRMXS/JoKY2
	I/vYjC4BqfuEpdL+6Qu72YrI/iAd19H30jALweE5Ezsy2YQ6SdwsDV5xSOFQt+KturAyWqNwGjp
	6l5GbnEhOOi1xPDuT1xw+fSYFewT2HOnB7iTED0vOMoQ+ooMr5qQs+MFgnwL7iB9YSG72qoa1SA
	wzBoSXP4XINJAqPldQLKVQdDBRFxEOt3Z8xHIHx1iSY+B8d6KBJmCNNU6BvHPHWZrGCfQQUhXWA
	cnpvRILLxBfU90LcFP/Y0ceEKvTxLDpjnf57AFJQKNcpQeK24RazgoX1YicpZXngcDfO84jGQv8
	uqUnKvUvjNIK8/f9gbXI=
X-Google-Smtp-Source: AGHT+IEoYD6qhZuJ7T4dBE3Jgl43IwdFLeHEDqIU9YR7yEWP4bUPPA+zHh7kCsKWNkA9mXrFq6ZQwQ==
X-Received: by 2002:a17:902:e84c:b0:235:779:edfa with SMTP id d9443c01a7336-2366b13cafdmr137064025ad.32.1750071649800;
        Mon, 16 Jun 2025 04:00:49 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236736cb4f9sm32537885ad.138.2025.06.16.04.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 04:00:49 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: niuxuewei97@gmail.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	parav@nvidia.com,
	sgarzare@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Date: Mon, 16 Jun 2025 19:00:42 +0800
Message-Id: <20250616110042.1163784-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616105610.1163586-1-niuxuewei.nxw@antgroup.com>
References: <20250616105610.1163586-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > Sent: Monday, June 16, 2025 2:30 PM
> > > 
> > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > Sent: Monday, June 16, 2025 1:48 PM
> > > > >
> > > > > Hi, Parav.
> > > > >
> > > > > Thanks for your detailed comments.
> > > > >
> > > > > > Hi Xuewei,
> > > > > >
> > > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > > Sent: Monday, May 19, 2025 3:08 PM
> > > > > > >
> > > > > > > > On Sat, Apr 12, 2025 at 10:28:25PM +0800, Xuewei Niu wrote:
> > > > > > > > > This patch brings a new feature, called "multi devices", to
> > > > > > > > > the virtio vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES"
> > > > > > > > > feature bit, and a "device_order" field to the config for the virtio
> > > vsock.
> > > > > > > > >
> > > > > > > > > == Motivition ==
> > > > > > > > >
> > > > > > > > > Vsock is a lightweight and widely used data exchange
> > > > > > > > > mechanism between host and guest.
> > > > > >
> > > > > > Even though it is the current use, the specification does not
> > > > > > prevent its usage
> > > > > between two guests via a host.
> > > > > > So we should not assume such guest <-> host communication as the
> > > > > > only
> > > > > case to add new feature.
> > > > > >
> > > > > > For example, in the spec only must requirement is that src_cid ==
> > > > > config.guest_cid.
> > > > > > Dst_cid can be anything, it need not be well known 0x2 (for the host).
> > > > >
> > > > > Yes.
> > > > >
> > > > > > With this flexibility in the spec, one can connect vsock devices
> > > > > > with multiple
> > > > > different backends.
> > > > > >
> > > > > > For example,
> > > > > > QEMU can insert one vsock device for VM to HV communication.
> > > > >
> > > > > It is also able to communicate with other devices on the same host, i.e.
> > > > > VM-to-VM.
> > > > >
> > > > > > A real PCI device can insert one voscket device for VM-to-VM
> > > > > communication bypassing a full TCP/IP stack.
> > > > >
> > > > > AFAIK, all devices are implemented in software. Is it a real PCI HW device?
> > > > >
> > > > Yes. virto PCI devices are implemented as hw or as vdpa for many years now by
> > > cloud operators and by NIC vendors.
> > > 
> > > Thanks for your confirmation.
> > > 
> > > > > > This means there are two different backends.
> > > > > > And these two devices should not be grouped in the use case you
> > > described.
> > > > >
> > > > > I think one group is enough for all use cases. It is required that
> > > > > CIDs are unique in global, i.e. all backends.
> > > > >
> > > > > As your example, let me assume there are two VMs
> > > > >
> > > > > 1. VM0 (two vsock backends)
> > > > >     1.1 device0 (cid=3, default), backend is host kernel (vhost-vsock);
> > > > >     1.2 device1 (cid=4), backend is HV (virtio-vsock).
> > > > > 2. VM1
> > > > >     2.1 device2 (cid=5, default), backend is host kernel (vhost-vsock).
> > > > >
> > > > > The device0 is able to do VM0-HOST (src_cid=3, dst_cid=2) and
> > > > > VM0-VM1 (src_cid=3, dst_cid=5) communicatation, while the device1 is
> > > > > only able to do VM0-HV (src_cid=4, dst_cid=2) communicatation.
> > > > >
> > > > In example 1.1 and 1.2 no devices are grouped.
> > > > Your proposal of this patch wants to group the two devices and pick one of
> > > them as default device.
> > > 
> > > Yes. I just wonder if it is possible to have more than one groups in one guest?
> > > 
> > For example
> > Group_1: two devices dev0 and dev1, implemented as PCI HW devices.
> > Group_2: two devices by QEMU SW implemented as sw backend.
> > 
> > All the 4 devices has _F bit indicating they can be grouped.
> > But there is no indication that they are part of which group.
> > And hence the guest VM driver is in dark on how to forward requests without the bind() call.
> 
> I see. Thanks!
> 
> My idea is that there is only one default device, no matter how many types
> of backends are. If the users intend to use other devices, `bind()` call
> is required.
> 
> For example, we set `dev0` as the default device:
> 
> 1. Do not call `bind()`: use dev0;
> 2. Call `bind(${dev0_cid})`: use dev1;
> ...
> 5. Call `bind(${dev4_cid})`: use dev4;

Sorry for the typo. Correct the item 2:

2. Call `bind(${dev0_cid})`: use dev0;

> Even though we introduce the group concept, if we don't call `bind()`, how
> does driver know which group to use? If the driver recoginizes the dst_cid,
> it can use the group to find the device, then the things will be
> complicated. The driver needs to know the relationship between the dst_cid
> and the group.
> 
> WDYT?
> 
> Thanks,
> Xuewei
> 
> > > > If device0 and device1 are inserted to the VM0 with the feature bit you
> > > suggested, the guest things that they are part of the same group.
> > > 
> > > In this patch, we don't allow to insert devices without the feature bit if there are
> > > already devices with the feature bit.
> > > 
> > In above example of two groups, all the 4 devices spread across two groups has the feature bit set.
> > Yet, they cannot be grouped correctly.
> > Driver driving blind thinks that all 4 devices are part of the same group.
> > 
> > > As a result, there can be either multiple devices with the feature bit or just a
> > > single device.
> > > 
> > 
> > > > When bind() call is not done, host sw does not know which device to pick up
> > > between device0 and device1 when binding the devices.
> > > 
> > > Are you referring to an vsock application on the host? If yes, "host sw" is able to
> > > pick up one device according to the dst cid. For example, pick up
> > > device0 if `connect(3)` is called.
> > > 
> > > Please be aware that the "host sw" can not pick up device1, since its device is not
> > > in the host kernel.
> > > 
> > > > > In a word, a tuple identifies a connection.
> > > > >
> > > > > "Refuse to connect" will be raised if the device1 attempts to
> > > > > connect to the device2. "They are not in the same group" is a reasonable
> > > explaination.
> > > > > Am I right?
> > > > >
> > > > During bind call, one needs to select the device when the devices are coming
> > > from multiple different backends.
> > > 
> > > Yes.
> > > 
> > > Thanks,
> > > Xuewei
