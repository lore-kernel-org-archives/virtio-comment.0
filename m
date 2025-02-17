Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C4C1D52B
	for <virtio-comment@lists.linux.dev>; Mon, 17 Feb 2025 02:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739759283; cv=none; b=Hb6Fxp0k5kqGwdwIsB1Yb8FHKM2iHg+fYIB100V8dCNpLxNheQqgIdHySeodpXT+WoM96k6mZ8i/nzxtSNMmBcyAy20bSks9XYI+C9je34i+fPCaxKdHc8a/7rL7HVprapZeF/Q2AbSXG/Od5wTyFFs5BYjEMJkbEThMf7CAoKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739759283; c=relaxed/simple;
	bh=2x03+kRYC9s8FYtn/bbwM6EPWy6bXE3jgS8zRHJAX8k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KylN4H2b43pgkiWMLYTKrnN+XlhiFPLPU2WVS6IS7MAP4ANmTe+7z2YUMF8f9Ti+reF7uUd9JVGwGJVoc5LHOj+AC3mlgZjtYCWIjfg6UcM1FZVeSLfIdzvvr3/zCODfBWVZT9PYaiVHIL4u1dzdCBhNXHZ7BcJKtCWVfSLZpog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iE9p+rN/; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iE9p+rN/"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-220e6028214so59904025ad.0
        for <virtio-comment@lists.linux.dev>; Sun, 16 Feb 2025 18:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739759280; x=1740364080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5koiDOl1wV/Q04Wzsqvq2lyi22BNjIAvD7SMZoWhSVc=;
        b=iE9p+rN/gE+KsnM7PEi2LMSNWNVsDH5e/6dNuKOQHCI5IbWFTZnJIbH8xznOaxfB7k
         0azqtxWTeAaNfQQv0s9MSZGIebFIJd/okcdMp1MOKl7ZXXIgcfoYKJcqs9qekQ9CConL
         vwriPsxfXhQykTDjgzewTAvIJ5OZIKNDzxUNmIQYwIhW+X18RYU5bJ/9E2aR4RqaAnsV
         fmCxM+GHxatYl3+RQJ1LPzKR8uZjYbgbjms78P+O1VUVVqg7xUEv8NA0dBE0djXBWJcg
         R3vQiHgkM3608TU1PYWviBN0NkRapk2EXdM4nTv4W7j5r8TzLAinhkFFsL2m32CX5GHx
         RtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739759280; x=1740364080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5koiDOl1wV/Q04Wzsqvq2lyi22BNjIAvD7SMZoWhSVc=;
        b=aD0YGWFrPyFxZdiGBPzOMytwLeVvmHEppaHY5mpmNWHfVtoj+GuExel1LK3oCd1M3e
         oc2WclIGxZoK01njVv+mLJkwz0p7UX0qL5ANF8EXk8kpB7xZijEC8zFFPVrOyCoPm1iG
         ELvILov1XDf8Q//SDH5W/18Vfy3WN7hAqw7kPTkedJVTo3wRjUxcTA/OdDwGLLyCjNCG
         BuBBp8EGUZVhWYGmIEqCCcQImLtrhcKm64I0C8eJ/D0573uCTCRzyKJGdbG2isvo/qo6
         Q8c1SdeVuOGdhULt2o9GIrVZr6UGGgG1AFmliZNZi68eorWUjl9zJSv7N1wvVGXBw6oO
         KogA==
X-Forwarded-Encrypted: i=1; AJvYcCVQUwa4FVhHB3p6EbElrL62fGOqdaIVuBEehnO3oySckbPVc+S4Gaa0kTj1q/3hbnLGZ168uR/gmwUk9g8Yeg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUE9fYNU47bIJ+xFAwC/YXo3ODPVR5uEs2zSVH7c/iAWIYb9sz
	pssf7jTWqWBsNuvxhuT7oRVhOXfa+Dt/9H2xAqwoYRev4BLfFPOe
X-Gm-Gg: ASbGncvnJaOJbcCQLIHbd7RIo6unnxwHBfEQmZDoK4iiWv4wgAjIc/Qo1kFfxSGpFB6
	D1F+IK6DXkuPyOx1rMIm+/wThQQHOEDqYMp62LL0T5FJiqfy/W+GERb6yp9ZtemznuSB/DZDzoR
	yZLN37rA3bAtVPmm85pKNRChXw8HrzcqB57ADKZAjcxG4kiXEN+up3PE86q/lnFTlTUoRk7ioyq
	8j7XFNyZvqCBXfmLR0XM3jj8snBGvRPqgdO7mGIhQuZn2xEwi/UWdAnB//ih3OnbV7Yi+7U3UYz
	4XqUEBJzA66jGYAt3sKjla9ctrFT+VqxkTov4Q==
X-Google-Smtp-Source: AGHT+IHtvxeRB1NHGo7f5FilIaS3OWX2RYJVQ4TVCCb3pgEmSoYG1gILomUZ0AdA5sSvs2QxqpQu6w==
X-Received: by 2002:a05:6a21:3988:b0:1ee:2d62:fab with SMTP id adf61e73a8af0-1ee8cc2590dmr16272766637.36.1739759279518;
        Sun, 16 Feb 2025 18:27:59 -0800 (PST)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324277f28asm6899100b3a.163.2025.02.16.18.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 18:27:58 -0800 (PST)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: parav@nvidia.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	sgarzare@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v5] virtio-vsock: Add support for multi devices
Date: Mon, 17 Feb 2025 10:27:48 +0800
Message-Id: <20250217022748.278559-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CY8PR12MB7195C5BE96AC5811B368882CDCF92@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <CY8PR12MB7195C5BE96AC5811B368882CDCF92@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> > From: Xuewei Niu <niuxuewei97@gmail.com>
> > Sent: Monday, January 20, 2025 6:46 PM
> > 
> > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > Sent: Tuesday, December 31, 2024 12:43 PM
> > > >
> > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > Sent: Tuesday, December 31, 2024 11:03 AM
> > > > > >
> > > > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > > > Sent: Thursday, December 5, 2024 11:59 AM
> > > > > > > >
> > > > > > > > Hi Parav,
> > > > > > > >
> > > > > > > > Sorry for the late reply. I was super busy in the past few
> > > > > > > > weeks. I hope things become more regular from now on.
> > > > > > > >
> > > > > > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > > > > > Sent: Thursday, October 24, 2024 12:38 PM
> > > > > > > > > >
> > > > > > > > > > This patch brings a new feature, called "multi devices",
> > > > > > > > > > to the virtio vsock. It introduces a
> > "VIRTIO_VSOCK_F_MULTI_DEVICES"
> > > > > > > > > > feature
> > > > > > > > bit, and a "index"
> > > > > > > > > > field to the config for the virtio vsock.
> > > > > > > > > >
> > > > > > > > > > == Motivition ==
> > > > > > > > > >
> > > > > > > > > > Vsock is a lightweight and widely used data exchange
> > > > > > > > > > mechanism between host and guest. Kata Containers, a
> > > > > > > > > > secure container runtime, leverages the capability to
> > > > > > > > > > exchange control data between the shim and the
> > > > > > > > kata-agent.
> > > > > > > > > >
> > > > > > > > > > Currently, the virtio-vsock only supports one device,
> > > > > > > > > > resulting in the following
> > > > > > > > > > limitations:
> > > > > > > > > >
> > > > > > > > > > * Poor performance isolation: All vsock connections
> > > > > > > > > > share the same virtqueue.
> > > > > > > > > Do you have rough estimates on how much performance is
> > > > > > > > > affected (or is
> > > > > > > > poor) due to single queue?
> > > > > > > > > I am not familiar vsock application space.
> > > > > > > > > It is something like 10K socket msg/sec or 10 million
> > > > > > > > > socket msg/sec due to
> > > > > > > > single queue?
> > > > > > > >
> > > > > > > > Yes, but the data shows the performance doesn't grow much.
> > > > > > > If so, please update the commit log description to not have
> > > > > > > performance as
> > > > > > the motivation.
> > > > > > > Rather performance as side gain.
> > > > > > > Please write it as main motivation is ... TSI etc details.
> > > > > >
> > > > > > Will do.
> > > > > >
> > > > > > > > I think we can
> > > > > > > > skip the performance part for now. Here are reasons:
> > > > > > > >
> > > > > > > > - The biggest motivition to make us support this feautre is
> > > > > > > > mutli-
> > > > backends
> > > > > > > >   support. In the Kata Containers cases, we'd like to use Transparent
> > > > > > > >   Socket Impersonation (TSI) to use virtio-vsock for data plane. The
> > > > > > > >   limitation of the single vsock device is quite clear.
> > > > > > > Do you mean TSI functionality requires multiple vsock device
> > > > > > > as the only
> > > > > > way forward?
> > > > > > > I thought even one vsock device can do TSI too?
> > > > > > > Which information is mandatory from multiple devices to do TSI?
> > > > > >
> > > > > > Yes. TSI doesn't rely on this feature.
> > > > > Hmm. So I lost you. :(
> > > > > If TSI can be achieved without mult-device, you probably need to
> > > > > rewrite it
> > > > which one needs multi-device.
> > > >
> > > > Will do.
> > > >
> > > > > > However, we have finished a POC that integrates vhost-user-vsock
> > > > > > with Ztunnel, a per-host proxy for Istio service mesh. The
> > > > > > diagram is as following.
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > ╔═════════════════════════════════════════
> > > > ═══
> > > > > > ═══╗
> > > > > >                              ║ VMM                                           ║
> > > > > >                              ║                                               ║
> > > > > >                              ║   ╔═════════════╗
> > > > ╔═════════════╗
> > > > > > ║
> > > > > >                              ║   ║    device   ║ <════════ ║  kata-agent ║   ║
> > > > > >     ╔════════════════════╗   ║
> > > > ╚═════════════╝virtio-
> > > > > > vsock═════════════╝   ║
> > > > > >     ║                    ║   ║                                               ║
> > > > > >     ║  Ztunnel           ║   ║                                               ║
> > > > > >     ║                    ║   ║                                               ║
> > > > > >     ║    ╔═════════════╗ ║   ║    vhost-user-vsock
> > > > > > ╔═════════════╗   ║
> > > > > >     ║    ║    device   ║ ║
> > > > <══════════════════════════════ ║
> > > > > > user app  ║   ║
> > > > > >     ║    ╚═════════════╝ ║   ║
> > > > > > ╚═════════════╝   ║
> > > > > >     ║                    ║   ║                                               ║
> > > > > >     ╚════════════════════╝
> > > > > >
> > > > ╚═════════════════════════════════════════
> > > > ═══
> > > > > > ═══╝
> > > > > >
> > > > > > Kata-agent is a required component to manage containers in Kata
> > > > Containers.
> > > > > > It uses virtio-vsock to communicate with the shim.
> > > > > >
> > > > > > The device for networking is offloaded to the Ztunnel using
> > > > > > vhost-user protocol in order to bypass network stacks on both
> > > > > > host and guest. We can't achieve this without the multi-device feature.
> > > > > The above diagram achieves the described feature using single device.
> > > > > Or the arrow 'virtio-vsock' consist of multiple devices? If so,
> > > > > better to
> > > > upgrade the diagram box 'device' to 'devices'.
> > > >
> > > > The diagram shows two devices: one in the VMM, and one in the
> > > > Ztunnel. So I update the diagram with number to make it clear.
> > > >
> > > >
> > > > ╔═════════════════════════════════════════
> > > > ══════╗
> > > >                              ║ VMM                                           ║
> > > >                              ║                                               ║
> > > >                              ║   ╔═════════════╗
> > ╔═════════════╗
> > > > ║
> > > >                              ║   ║   device1   ║ <════════ ║  kata-agent ║   ║
> > > >     ╔════════════════════╗   ║
> > > > ╚═════════════╝virtio-vsock═════════════╝   ║
> > > >     ║                    ║   ║                                               ║
> > > >     ║  Ztunnel           ║   ║                                               ║
> > > >     ║                    ║   ║                                               ║
> > > >     ║    ╔═════════════╗ ║   ║    vhost-user-vsock
> > > > ╔═════════════╗   ║
> > > >     ║    ║   device2   ║ ║
> > > > <══════════════════════════════ ║   user app  ║   ║
> > > >     ║    ╚═════════════╝ ║   ║
> > > > ╚═════════════╝   ║
> > > >     ║                    ║   ║                                               ║
> > > >     ╚════════════════════╝
> > > > ╚═════════════════════════════════════════
> > > > ══════╝
> > > >
> > >
> > > From my limited understanding, it appears that the driver that is using
> > device1 and device2 are two different drivers, is that right?
> > 
> > Yes, you are right,
> > 
> > > > > > > > - This feature gives vsock device the capability to improve
> > performance.
> > > > > > > >   Apart from the driver side, optimizations on the VMM side are
> > also
> > > > > > > >   required. For example, VMM spawns an exclusive thread for
> > > > > > > > each
> > > > vsock
> > > > > > > >   device. But we don't have enough time to do that.
> > > > > > > > - Stefano said that they have a plan to add support
> > > > > > > > multi-virtqueues in
> > > > > > the
> > > > > > > >   feature to enhance the isolation of vsock devices. We are
> > > > > > > > doing the
> > > > > > same
> > > > > > > >   thing, but with different approaches.
> > > > > > > >
> > > > > > > > > > By the way, although multi-queues can solve this
> > > > > > > > > > problem, they do not conflict.
> > > > > > > > > > * Cannot enable more than one backend: Virtio-vsock,
> > > > > > > > > > vhost-vsock, and vhost-user-vsock cannot be enabled
> > > > > > > > > > simultaneously
> > > > > > on the transport.
> > > > > > > > > >
> > > > > > > > > > We'd like to transfer networking data, based on TSI
> > > > > > > > > > (Transparent Socket
> > > > > > > > > > Impersonation) technique, over vsock via the vhost-user
> > > > > > > > > > protocol to reduce overhead. However, by default, the
> > > > > > > > > > vsock device is occupied by the kata- agent, a control
> > > > > > > > > > component for Kata
> > > > Containers.
> > > > > > > > > >
> > > > > > > > > > == Typical Usages ==
> > > > > > > > > >
> > > > > > > > > > Assuming there are two virtio-vsock devices on the
> > > > > > > > > > guest, with CIDs
> > > > > > > > > > 3 and 4 respectively. And the device with CID 3 is default.
> > > > > > > > > >
> > > > > > > > > > ==== Guest -> Host ====
> > > > > > > > > >
> > > > > > > > > > Use the device with CID 3.
> > > > > > > > > >
> > > > > > > > > > ```c
> > > > > > > > > > fd = socket(AF_VSOCK);
> > > > > > > > > > bind(fd, 3, -1);
> > > > > > > > > > connect(fd, 2, 1234);
> > > > > > > > > > n = write(fd, buffer);
> > > > > > > > > >
> > > > > > > > > > // or use default (no bind) fd = socket(AF_VSOCK);
> > > > > > > > > > connect(fd, 2, 1234); n = write(fd, buffer); ```
> > > > > > > > > >
> > > > > > > > > > Use the device with CID 4.
> > > > > > > > > >
> > > > > > > > > > ```c
> > > > > > > > > > fd = socket(AF_VSOCK);
> > > > > > > > > > bind(fd, 4, -1);
> > > > > > > > > > connect(fd, 2, 1234);
> > > > > > > > > > n = write(fd, buffer);
> > > > > > > > > > ```
> > > > > > > > > Above and below example is not using the index that you
> > > > > > > > > are introducing in
> > > > > > > > this patch.
> > > > > > > > > Can you please elaborate?
> > > > > > > >
> > > > > > > > When we have many vsock devices, we need to know the
> > > > > > > > position of those devices. The devices are arranged in a (linked)
> > array, see below:
> > > > > > > How does the driver know how many devices would be accessible
> > > > > > > to the
> > > > > > driver?
> > > > > > > I suppose it does not need to know it. It can just work with
> > > > > > > current number
> > > > > > of active devices. Isn't it?
> > > > > >
> > > > > > Seems like it is not very clean here.
> > > > > >
> > > > > > Yes, the driver doesn't need to know it.
> > > > > >
> > > > > > The "index" is not the real index of devices. It is a kind of
> > > > > > ordering for devices. The device with less index is at the front
> > > > > > of other devices in the device list. But the real index depends
> > > > > > on how many
> > > > devices are discovered.
> > > > > >
> > > > > > For example, there are three devices, vsock device (cid=4,
> > > > > > index=4), vsock device (cid=3, index=5), vsock device (cid=5,
> > > > > > index=1). The driver maintains a linked list to store the devices.
> > > > > >
> > > > > > Assuming that the driver firstly discovered the vsock
> > > > > > device(4,4), then place it in the first place.
> > > > > >
> > > > > > ```
> > > > > > [real index 0]: vsock device (cid=4, index=4) <default device>
> > > > > > ```
> > > > > >
> > > > > > Then, the vsock device (3,5) was discovered. The driver should
> > > > > > place it in the second place, as its index 5 is greater.
> > > > > >
> > > > > > ```
> > > > > > [real index 0]: vsock device (cid=4, index=4) <default device> [real
> > index 1]:
> > > > > > vsock device (cid=3, index=5) ```
> > > > > >
> > > > > > Finally, the vsock device (5,1) was discovered. The driver
> > > > > > should place it in the first place, as its index 1 is less than the previous
> > devices.
> > > > > >
> > > > > > ```
> > > > > > [real index 0]: vsock device (cid=5, index=1) <default device> [real
> > index 1]:
> > > > > > vsock device (cid=4, index=4) [real index 2]: vsock device
> > > > > > (cid=3,
> > > > > > index=5) ```
> > > > > >
> > > > > > The "index" in device's config space is a logical index to be used for
> > sorting.
> > > > > >
> > > > > I see. In that case we should rename index to a more intuitive
> > > > > name, such as
> > > > device_order.
> > > >
> > > > Lol. In fact, the original name is "order", but I think it doesn't
> > > > look pro. I don't have any problem with the name. Will change it.
> > > >
> > > > > > > In other words, say, if the first vsock device discovered, is
> > > > > > > index=1, can
> > > > > > cid==4 make progress with it?
> > > > > >
> > > > > > Yes. If device (3,1) is discovered first, the device (4,0) can
> > > > > > make progress with it. Apart from that, the final order is the
> > > > > > same with the
> > > > below.
> > > > > >
> > > > > If device (3,1) can make the progress, then why any ordering is needed?
> > > >
> > > > Currently, the order is used to determine **the default device**. In
> > > > the single- device mode, the user app doesn't need to specify a CID
> > > > as there is only one CID avilable. However, we can't expect every
> > > > app to update their code to support multiple CIDs. When the CID is
> > > > not persent, the driver will use the default device's.
> > > >
> > > > Assuming that there is no `device_order`. We intent to set device
> > > > (cid=4) to the default device. Then, we must ensure that the device
> > > > (cid=4) is discovered before any other devices. **Indeed, we can't
> > > > guarantee this.**
> > > >
> > > > Let us go through this case: The device (cid=3) is discovered firstly.
> > > >
> > > > ```
> > > > [0]: vsock device (cid=3) <default device> ```
> > > >
> > > > Then the device (cid=4) comes:
> > > >
> > > > ```
> > > > [0]: vsock device (cid=3) <default device>
> > > > [1]: vsock device (cid=4)
> > > > ```
> > > >
> > > > Now the device (cid=3) becomes the default device which is not what
> > > > we want.
> > > >
> > > > If we have "device_order", the result will change. All we need to do
> > > > is we assign device (cid=4) a less order than device (cid=3).
> > > >
> > > Since the connection can progress through (4,0), why (3,1) should be a
> > default device?
> > > What breaks if (3,0) stays as default device?
> > 
> > The point is that we should have an ability to specify a device as the default.
> > 
> > Assuming that there is no `device_order`, the devices are indicated by (4) and
> > (3). And we want to set (4) as the default device.
> > 
> > We can't guarantee the order of discovery: If (3) is discovered first, there is no
> > chance to set (4) as the default device.
> > 
> > With `device_order`: Although (3,1) is discovered first, (4,0) still can be the
> > default device because of the less `device_order`.
> > 
> > > > ```
> > > > [0]: vsock device (cid=3, order=1) <default device> ```
> > > >
> > > > Then the device (cid=4) comes:
> > > >
> > > > ```
> > > > [0]: vsock device (cid=4, order=0) <default device>
> > > > [1]: vsock device (cid=3, order=1)
> > > > ```
> > > >
> > > > Now the device (cid=4) becomes the default device.
> > > >
> > > > Although we can use a boolean value to indicate the default device,
> > > > I think we should keep this for future possible use of this ordering.
> > > >
> > > The notion and need of the default device is missing. May be is this
> > something already explained in current spec that I should read?
> > 
> > Yes. For the use case, you can refer to `or use default (no bind)` at the first
> > message in thread.
> > 
> > For the easy understanding, I'll explain it in the following.
> > 
> > When an app doesn't specify the src CID, the driver must fill one as local
> > address.
> > 
> > If the system doesn't support multiple devices, i.e. there is only one device,
> > the driver will fill the device's CID.
> >
> Ok. and in our updated diagram, even through there are N drivers and N devices,
> (N > 1), there is still one to one mapping of the driver and device.

Yes, there is a one-to-one mapping.

> > Unlike TCP/IP, there is neither route table nor default route. If there are
> > multiple devices and there is no default device, the driver doesn't know which
> > CID to use, which causes the failure of communication.
> > 
> When driver see only one device, can that be the default device?

There is only one device for a driver, so no concept of "default device"
from point of view of the driver.

Maybe I use the term "device" incorrectly.

I treat a pair of device and driver as an entry, which is what I call
"device". The "default device", more precisely the "default entry", is one
of all available entries.

```
entry0: device0 <-> driver0 (default)
entry1: device1 <-> driver1
entry2: device2 <-> driver2
```

> > > > > Please let me know if I misunderstood.
> > > > >
> > > > > > >
> > > > > > > ```
> > > > > > > [0]: vsock device (cid=4, index=0) <default device>
> > > > > > > [1]: vsock device (cid=3, index=1) ```
> > > > > > >
> > > > > > > The index is only used for determining the device position;
> > > > > > > for data transmission, `bind`, `connect`, etc., the CID is used.
> > > > > > >
> > > > > > So why not driver maintain some linked list of devices and use one?
> > > > > > The relation of cid and device index is not clear if there is one.
> > > > > > If none, the device index is just driver internal detail, right?
> > > > >
> > > > > Yes, the driver does maintain a linked list. However, the device
> > > > > should be able to control its position in the list. IMHO, it can't
> > > > > be the driver
> > > > internal detail.
> > > > > This isn’t clear of why ordering is needed, because you explained
> > > > > above that
> > > > when (3,1) is discovered first, it can be used without (4,0).
> > > > >
> > > > > >
> > > > > > > > > If the binding is based on the CID, than why the new index
> > needed?
> > > > > > > >
> > > > > > > > Think about the case of using the CID to determine the device
> > position.
> > > > > > > Do you mean CID is used to derive the device index?
> > > > > > > If yes, if there is one to one mapping, than the device
> > > > > > > identified by the CID
> > > > > > itself can be used directly, isn't it?
> > > > > >
> > > > > > Yes, but it is a counterexample. I mean using CID as the index
> > > > > > is not a good idea.
> > > > > I am not suggesting CID to be used as index.
> > > > > CID is used to select the device (out of available devices).
> > > > >
> > > > > >
> > > > > > I think the "index" is used to establish the one-to-one mapping.
> > > > > > If there is only CID, I don't have an idea about how to establish the
> > mapping.
> > > > > >
> > > > > I didn’t understand this part.
> > > >
> > > > The "device_order" ("index") is only used during the process of
> > > > device discovery. Once the device is initialized, the device is
> > > > identified by its CID, and the "device_order" is not used anymore.
> > > >
> > > Lets understand the need of default device.
> > 
> > > > > > > > If we
> > > > > > > > want to change the position, we have to change the CID. If
> > > > > > > > the peer doesn't realize the change, the connection will be broken.
> > > > > > > > So we have to decouple the CID and the position, one for
> > > > > > > > data transmission, one
> > > > > > for device management.
> > > > > > > > That is why we need the index.
> > > > > > > >
> > > > > > > > ```
> > > > > > > > ==from==
> > > > > > > > [0]: vsock device (cid=4, index=0) <default device>
> > > > > > > > [1]: vsock device (cid=3, index=1) ==to==
> > > > > > > > [0]: vsock device (cid=3, index=0) <default device>
> > > > > > > > [1]: vsock device (cid=4, index=1) ```
> > > > > > > >
> > > > > > > How is this mapping dynamically changed? Is this driver only
> > decision?
> > > > > >
> > > > > > By hot-plug/hot-unplug devices. So this is device-only decision
> > > > > > (or VMM side).
> > > > > >
> > > > > > > > > Or the example is stale here in commit log?
> > > > > > > >
> > > > > > > > No. It's up to date.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > ==== Host -> Guest ====
> > > > > > > > >
> > > > > > > > > The usage is no changes in this case. Send to device with CID 3.
> > > > > > > > >
> > > > > > > > > ```c
> > > > > > > > > fd = socket(AF_VSOCK);
> > > > > > > > > connect(fd, 3, 1234);
> > > > > > > > > n = write(fd, buffer);
> > > > > > > > > ```
> > > > > > > > >
> > > > > > > > > Send to device with CID 4.
> > > > > > > > >
> > > > > > > > > ```c
> > > > > > > > > fd = socket(AF_VSOCK);
> > > > > > > > > connect(fd, 4, 1234);
> > > > > > > > > n = write(fd, buffer);
> > > > > > > > > ```
> > > > > > > > >
> > > > > > > > > I've pushed a version of code for the implementation of
> > > > > > > > > multi devices to lkml [1].
> > > > > > > > >
> > > > > > > > > [1]
> > > > > > > >
> > > > > > > > [..]
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> > > > > > > > > > ---
> > > > > > > > > >  device-types/vsock/description.tex | 46
> > > > > > > > > > ++++++++++++++++++++++++++++--
> > > > > > > > > >  1 file changed, 44 insertions(+), 2 deletions(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/device-types/vsock/description.tex
> > > > > > > > > > b/device- types/vsock/description.tex index
> > > > > > > > > > 7d91d15..f2e663b 100644
> > > > > > > > > > --- a/device-types/vsock/description.tex
> > > > > > > > > > +++ b/device-types/vsock/description.tex
> > > > > > > > > > @@ -20,6 +20,7 @@ \subsection{Feature
> > > > > > > > > > bits}\label{sec:Device Types / Socket Device / Feature
> > > > > > > > > > bits} \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket
> > > > > > > > > > type is
> > > > supported.
> > > > > > > > > >  \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket
> > > > > > > > > > type is
> > > > > > > > supported.
> > > > > > > > > >  \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream
> > > > > > > > > > socket
> > > > > > type
> > > > > > > > > > is not implied.
> > > > > > > > > > +\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple socket
> > > > > > > > > > +devices are
> > > > > > > > > > supported.
> > > > > > > > > An individual device cannot indicate what other devices
> > > > > > > > > are
> > > > supported.
> > > > > > > > > The question is, when multiple devices are accessible to a
> > > > > > > > > single driver, how
> > > > > > > > should driver choose which device to use?
> > > > > > > > > This is the question that driver needs to solve based on
> > > > > > > > > certain
> > > > > > information.
> > > > > > > > >
> > > > > > > > > Therefore, the only thing needed in this patch is a
> > > > > > > > > feature bit to say, from
> > > > > > > > device point of view is:
> > > > > > > > >
> > > > > > > > > VIRTIO_VSOCK_DEV_INDEX This feature indicates that device
> > > > > > > > > configuration
> > > > > > > > space has device index.
> > > > > > > > >
> > > > > > > > > And somehow application chooses which device to use to
> > > > > > > > > transport the vq
> > > > > > > > entries.
> > > > > > > > >
> > > > > > > > > Right?
> > > > > > > >
> > > > > > > > `VIRTIO_VSOCK_F_MULTI_DEVICES` is to let driver know that
> > > > > > > > the device supports multi-devices feature: read the index
> > > > > > > > field from the config space, prepare an array to store
> > > > > > > > multiple devices, deny device without the feature, etc.
> > > > > > > >
> > > > > > > How does driver prepare the array, if it does not know the array size?
> > > > > >
> > > > > > The devices are stored in a linked list, so it does not need to
> > > > > > know the array size.
> > > > > >
> > > > > In the example of (3,1) you explained it can use it.
> > > > > So I do not follow the need of priority or order.
> > > > > Any number of devices can be in the group of multiple devices as
> > > > > long as they can establish identity about some kind of 'group' of them,
> > Right?
> > > > >
> > > > > > > What if two PCI hardware devices are plugged in, from two
> > > > > > > different
> > > > > > physical cards and each has the duplicate index?
> > > > > >
> > > > > > The latter one will be denied by the driver because of the conflicts.
> > > > > >
> > > > > How does it know that there is conflict?
> > > > > For example, lets say discovery occurred as follows:
> > > > > Phy_device_A: index_0
> > > > > Phy_device_B: index_1
> > > > > Phy_device_A: index_1
> > > > >
> > > > > You probably wanted to group A_0, A_1. But in current scheme A_0,
> > > > > B_1
> > > > gets grouped as there is no notion of a group.
> > > >
> > > > I have two questions:
> > > >
> > > > - Why can `Phy_device_A` be discovered twice?
> > > > - Why do you want to group A_0 and A_1?
> > > >
> > > The way I was seeing it as, phy_device_A = single backend creating multiple
> > vsock devices A_0 and A_1.
> > > So related devices are A_X to group.
> > > And skip grouping unrelated devices.
> > 
> > I am not an expert on PCI. So I am not sure if a PCI backend can create
> > multiple devices. But in the context of vsock, "single backend creating multiple
> > vsock devices" is not possible. IMHO, single backend = one device, and one
> > device corresponds to one driver.
> > 
> > This feature allows to have N devices (i.e. N drivers). Without this, only
> > 1 device (i.e. 1 driver) is allowed. So I update the diagram with drivers.
> > 
> > 
> > +────────────────────────────────────────────────────────────
> > ───+
> >  │ VMM                                                           │
> >  │                 +───────────────────────────────────────────+ │
> >  │                 │ Guest          virtio-vsock               │ │
> >  │ +────────────+  │   +──────────────+     +──────────────+   │ │
> >  │ │  device0   │<─────│    driver0   │<────│  kata-agent  │   │ │
> >  │ +────────────+  │   +──────────────+     +──────────────+   │ │
> >  │                 │                                           │ │
> >  │                 │   +──────────────+     +──────────────+   │ │
> >  │        +────────────│    driver1   │<────│   user app   │   │ │
> >  │        │        │   +──────────────+     +──────────────+   │ │
> >  │  vhost-user-vsock                                           │ │
> >  │        │        +───────────────────────────────────────────+ │
> >  │        │                                                      │
> > 
> > +────────│───────────────────────────────────────────────────
> > ───+
> >           │
> >  +────────V─────────+
> >  │  +───────────+   │
> >  │  │  device1  │   │
> >  │  +───────────+   │
> >  │           Ztunnel│
> >  +──────────────────+
> >
> So in this example, there is one to one mapping of driver and device.
> Hence, device0 can be the default device for driver0.
> And same for driver1.
> Do I still miss something?

I believe the "default device" is a misnomer, as I've explained above. If I
am wrong, please correct me.

> > > > Would you mind explaining more? Plus, all devices are placed in one
> > > > list, that is, in one group. IMHO, there is no group concept in term of
> > vsock.
> > > >
> > > > > > > > IMHO, `VIRTIO_VSOCK_F_MULTI_DEVICES` is better than
> > > > > > > > `VIRTIO_VSOCK_DEV_INDEX`.
> > > > > > > >
> > > > > > > > > >  \end{description}
> > > > > > > > > >
> > > > > > > > > >  \drivernormative{\subsubsection}{Feature bits}{Device
> > > > > > > > > > Types / Socket Device / Feature bits} @@ -34,6 +35,13 @@
> > > > > > > > > > \subsection{Feature bits}\label{sec:Device Types /
> > > > > > > > > > Socket Device / Feature bits}
> > > > > > > > > > VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver
> > > > > > MAY
> > > > > > > > > > act as if VIRTIO_VSOCK_F_STREAM has also been negotiated.
> > > > > > > > > >
> > > > > > > > > > +If a device without VIRTIO_VSOCK_F_MULTI_DEVICES has
> > > > > > > > > > +been registered, the driver SHOULD ignore all subsequent
> > devices.
> > > > > > > > > > +
> > > > > > > > > At driver level in virtio spec, there is no concept of registered.
> > > > > > > > > It should be something like If the device index is not
> > > > > > > > > present, the driver SHOULD pick some default
> > > > > > > > device etc.
> > > > > > > >
> > > > > > > > "Pick some default device" is not much accurate. When this
> > > > > > > > case happened, it means multi-devices feature is disabled,
> > > > > > > > then the driver should ignore all subsequent devices.
> > > > > > > Multiple vsock devices belong to some single group is what is
> > > > > > > needed, if
> > > > > > that definition is needed.
> > > > > > > And just providing an index does not help for it in my view.
> > > > > > >
> > > > > > > Is this some kind of multi-pathing?
> > > > > > > If so, providing some common such identification is necessary
> > > > > > > between two
> > > > > > devices to indicate they are part of some group.
> > > > > > >
> > > > > > > Please explain more I misunderstood.
> > > > > >
> > > > > > In the term of vsock, there is no concept for "group".
> > > > > >
> > > > > > I mean the driver will fallback to single-device mode if the
> > > > > > device index is not present. In this case, any subsequent
> > > > > > devices will be denied. In other words, there is only one vsock device
> > avilable in the driver.
> > > > > >
> > > > > I understood what you are proposing.
> > > > > But it is not looking correct way to solve it to me, because you
> > > > > want some
> > > > kind of grouping functionality that indicates that 'these N devices
> > > > belong to same group', hence transport those sockets in this group.'
> > > >
> > > > No. Indeed, every connection uses one vsock device, not group of devices.
> > > >
> > > > Without this patch, there is only one vsock device available. With
> > > > this patch, there are N vsock devices available.
> > > >
> > > Well, it can be available without this patch too.
> > > What prevents it from?
> > 
> > No, multiple devices are not available. The difference is the number of
> > availbale devices: 1 or N.
> > 
> > - Without this patch: 1 driver (frontend) = 1 device (backend)
> > - With this patch: N drivers (frontends) = N devices (backends)
> > 
> Ok, but driver still has one to one mapping for all N entries.
> 
> > > > But in the process of data transmit, the user usually gives a CID to
> > > > select a particular vsock device.
> > > >
> > > So each device can have unique CID? And if so, may be that's enough.
> > 
> > Yes.
> > 
> > > You tried to explain it, but I fail to understand why CID is not sufficient, like
> > the way you mentioned exactly the same i.e. "CID to select the particular
> > vsock device".
> > 
> > The CID can be considered like an IP address which can't be changed casually.
> > The changes must be notified to the peer. Otherwise, the communication will
> > fail.
> > 
> > The `device_order`, as a local variable, is relatively easily to change the default
> > device.
> >
> So can the driver pick one?

The order is for the entries as well.

> > > > To make it clear, let us talk about the network.
> > > >
> > > > Without this patch, driver is allowed to have only one NIC.
> > > Not really. Today driver instance handles multiple NICs already. Each nic has
> > different transport level address. For example, for PCI, it has different RID
> > (BDF).
> > > Each device also may/may not have same mac address.>
> > 
> > > > But with this patch,
> > > > driver is allowed to have N NICs. While there are N NICs available,
> > > > a particular NIC identified by route table or something is used.
> > > >
> > > > > > > > Will replace the term "register", see below:
> > > > > > > >
> > > > > > > > If a device without VIRTIO_VSOCK_F_MULTI_DEVICES has been
> > > > > > > > present, the driver SHOULD ignore all subsequent devices.
> > > > > > > >
> > > > > > >
> > > > > > > > > > +If a device with VIRTIO_VSOCK_F_MULTI_DEVICES has been
> > > > > > > > > > +registered, the driver SHOULD accept other devices only
> > > > > > > > > > +if they expose VIRTIO_VSOCK_F_MULTI_DEVICES.
> > > > > > > > > > +
> > > > > > > > > >  \devicenormative{\subsubsection}{Feature bits}{Device
> > > > > > > > > > Types / Socket Device / Feature bits}
> > > > > > > > > >
> > > > > > > > > >  The device SHOULD offer the
> > > > > > VIRTIO_VSOCK_F_NO_IMPLIED_STREAM
> > > > > > > > > > feature.
> > > > > > > > > > @@ -52,6 +60,7 @@ \subsection{Device configuration
> > > > > > > > > > layout}\label{sec:Device Types / Socket Device
> > > > > > > > > > \begin{lstlisting} struct virtio_vsock_config {
> > > > > > > > > >  	le64 guest_cid;
> > > > > > > > > > +	le16 index;
> > > > > > > > > >  };
> > > > > > > > > >  \end{lstlisting}
> > > > > > > > > >
> > > > > > > > > > @@ -77,11 +86,36 @@ \subsection{Device configuration
> > > > > > > > > > layout}\label{sec:Device Types / Socket Device  \hline
> > > > > > > > > > \end{tabular}
> > > > > > > > > >
> > > > > > > > > > +The \field{index} field indicates index of a device,
> > > > > > > > > > +and is required for each device when
> > > > > > > > > > +VIRTIO_VSOCK_F_MULTI_DEVICES feature has been
> > > > > > > > > > negotiated.
> > > > > > > > > This is not needed. A driver should be able to make choice
> > > > > > > > > on which device to
> > > > > > > > use.
> > > > > > > >
> > > > > > > > IMHO, this is necessary. It is a rule that DEVICE must
> > > > > > > > provide the index if it want to enable the multi-devices
> > > > > > > > feature. It's not a rule for the
> > > > > > driver.
> > > > > > > >
> > > > > > > > BTW, making choice on which device to use by the driver is
> > > > > > > > according to
> > > > > > CID.
> > > > > > > So let driver maintain its own data structure without the device
> > index.
> > > > > > > Why won't it work?
> > > > > >
> > > > > > Because the device (VMM side) should be able to decide the
> > > > > > postion of the devices. And the driver should follow the device's
> > decision.
> > > > > >
> > > > > (3,1) example shows that single device can also work without
> > > > > strictly
> > > > attaching to the position.
> > > > > So lets try to achieve without such strict index, but rather
> > > > > achieve is using a
> > > > generic group concept.
> > > > > A group of devices has wider use case. If needed, I will explain
> > > > > later in the
> > > > thread.
> > > >
> > > > Yes please. Thanks a lot!
> > > >
> > > There are two PCI devices exposed. Each is connected to different numa
> > node on the host.
> > > For two devices there is need to create single netdevice so that RSS RQs can
> > span across two devices.
> > > These two virtio PCI devices are part of one group so that driver needs to
> > learn and create only one protocol level netdev.
> > > There may be other totally unrelated virtio net pci devices at the
> > > same time which shouldn’t be grouped this way.>
> > 
> > > Vsock case you are explaining is similar, with exception that at OS driver
> > level, you still have two vsock devices, and application somehow is
> > doing/learning its group.
> > > So a base infrastructure to grouping the device and using it differently based
> > on driver side usecase is desired.
> > 
> > I think I am understanding the concept of "group" you said. I believe we are
> > talking about the different things.
> >
> I was explaining a scenario where a front end driver was given multiple devices.
> For example, driver0 is given device0 and device1.
> And in this case driver0 to choose which device0 or device1 to use?

Vsock hasn't supported 1 driver with multiple devices so far.

Only one vsock entry is available without this patch, while multiple vsock
entries are able to be available with this patch.

> > You are saying that 1 driver can handle multiple devices, right?
> >
> Right.
> 
>  
> > Now, the system is limited to have only 1 driver and 1 device. I am trying to
> > remove this limitation by allowing to have N drivers and N devices. But from a
> > single driver's perspective, it is still have only 1 device (see the above
> > diagram).
> >
> Ok. so that is the default device to use for the driver, right?

The default device should be updated to "default entry". Each entry is
assigned a vsock CID. If the user app don't specify a CID, the system will
use the default entry's CID.

> > > > I have two questions:
> > > >
> > > > - How much groups do we need?
> > > > - How can driver know which group the device belongs to?
> > > >
> > > The device tells the driver its group id. So, devices with same group id
> > belongs to one group.
> > > One may use UUID to define a group.
> > >
> > > > > > > > The index is only used to determine position in the driver's
> > > > > > > > device list. (This is the same as the previous explanation.)
> > > > > > > >
> > > > > > > > > > +The \field{index} is 16 bits in size, enabling support
> > > > > > > > > > +for up to
> > > > > > > > > > +65,536 devices.
> > > > > > > > > > +
> > > > > > > > > Bit width is visible, just mentioning maximum device size
> > > > > > > > > is good
> > > > > > enough.
> > > > > > > >
> > > > > > > > Will update in the next version.
> > > > > > > >
> > > > > > > > > > +The source socket is allowed to not be bound to any
> > > > > > > > > > +CID. It is required for the driver to choose a CID for the socket.
> > > > > > > > > > +If VIRTIO_VSOCK_F_MULTI_DEVICES is not negotiated, the
> > > > > > > > > > +one and only device's CID is used. If
> > > > > > > > > > +VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the driver
> > > > > > > > > > +uses the default device's. In this case, the driver
> > > > > > > > > > +selects the device with
> > > > the lowest index as the default.
> > > > > > > > > > +
> > > > > > > > > If socket can choose the CID, why does it need new index?
> > > > > > > > > Its confusing to see relation of CID and index here.
> > > > > > > > > Can you please explain?
> > > > > > > >
> > > > > > > > See "When we have many vsock devices, we...".
> > > > > > > >
> > > > > > > > > > +\devicenormative{\subsubsection}{Device configuration
> > > > > > > > > > +layout}{Device Types / Socket Device / Device
> > > > > > > > > > +configuration layout}
> > > > > > > > > > +
> > > > > > > > > > +When VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the
> > > > > > > > > > +device MUST
> > > > > > > > > > offer
> > > > > > > > > > +an \field{index}, which MUST NOT be same with the
> > > > > > > > > > +\field{index} of other devices.
> > > > > > > > > > +
> > > > > > > > > > +When VIRTIO_VSOCK_F_MULTI_DEVICES is not negotiated,
> > > > > > > > > > +the
> > > > > > device
> > > > > > > > > > SHOULD
> > > > > > > > > > +NOT offer an \field{index}.
> > > > > > > > > > +
> > > > > > > > > This should be MUST.
> > > > > > > >
> > > > > > > > Will update.
> > > > > > > >
> > > > > > > > > I don't see a need to write this.
> > > > > > > > > In other words,
> > > > > > > > >
> > > > > > > > > If VIRTIO_VSOCK_F_DEV_INDEX is offered, field index is
> > supported.
> > > > > > > >
> > > > > > > > This part gives two rules:
> > > > > > > >
> > > > > > > > - The device MUST not provide the index that has been already
> > used.
> > > > > > > > - If VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the device
> > > > > > > > MUST
> > > > > > offer
> > > > > > > >   the index field (if not offered, the driver might read data outside
> > the
> > > > > > > >   config space, as the sizes are different).
> > > > > > > >
> > > > > > > > > >  \subsection{Device Initialization}\label{sec:Device
> > > > > > > > > > Types / Socket Device / Device Initialization}
> > > > > > > > > >
> > > > > > > > > >  \begin{enumerate}
> > > > > > > > > >  \item The guest's cid is read from \field{guest_cid}.
> > > > > > > > > >
> > > > > > > > > > +\item If VIRTIO_VSOCK_F_MULTI_DEVICES has been
> > > > > > > > > > +negotiated, the
> > > > > > > > > > device's
> > > > > > > > > > +index will be read from \field{index}. If not, the
> > > > > > > > > > +device's index will be ignored.
> > > > > > > > > > +
> > > > > > > > > >  \item Buffers are added to the event virtqueue to
> > > > > > > > > > receive events from the device.
> > > > > > > > > >
> > > > > > > > > >  \item Buffers are added to the rx virtqueue to start
> > > > > > > > > > receiving
> > > > packets.
> > > > > > > > > > @@ -167,6 +201,10 @@
> > > > > > > > > > \subsubsection{Addressing}\label{sec:Device
> > > > > > > > > > Types / Socket Device / Device Opera  consists of a
> > > > > > > > > > (cid, port
> > > > > > > > > > number) tuple. The header fields used for this are
> > > > > > > > > > \field{src_cid}, \field{src_port}, \field{dst_cid}, and
> > \field{dst_port}.
> > > > > > > > > >
> > > > > > > > > > +If at least one device has negotiated
> > > > > > > > > > +VIRTIO_VSOCK_F_MULTI_DEVICES, and the source socket is
> > > > > > > > > > +not bound to any CID, then \field{src_cid} should be
> > > > > > > > > > +set to the default
> > > > > > device's CID.
> > > > > > > > > > +
> > > > > > > > > >  Currently stream and seqpacket sockets are supported.
> > > > > > > > > > \field{type} is 1
> > > > > > > > > > (VIRTIO_VSOCK_TYPE_STREAM)  for stream socket types, and
> > > > > > > > > > 2
> > > > > > > > > > (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
> > > > > > > > > >
> > > > > > > > > > @@ -233,8 +271,12 @@ \subsubsection{Receive and
> > > > > > > > > > Transmit}\label{sec:Device Types / Socket Device / De
> > > > > > > > > >
> > > > > > > > > >  \drivernormative{\paragraph}{Device Operation: Receive
> > > > > > > > > > and Transmit}{Device Types / Socket Device / Device
> > > > > > > > > > Operation / Receive and Transmit}
> > > > > > > > > >
> > > > > > > > > > -The \field{guest_cid} configuration field MUST be used
> > > > > > > > > > as the source CID when -sending outgoing packets.
> > > > > > > > > > +The \field{guest_cid} configuration field MUST be used
> > > > > > > > > > +as the source CID when sending outgoing packets.
> > > > > > > > > > +
> > > > > > > > > > +When VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the
> > > > > > > > > > +source
> > > > > > CID
> > > > > > > > > > MUST be
> > > > > > > > > > +one of the \field{guest_cid} configuration field of the
> > > > > > > > > > +multiple devices handled by the driver.
> > > > > > > > > >
> > > > > > > > > If the guest_cid is used to distinguish between devices,
> > > > > > > > > why the new field
> > > > > > > > index is needed?
> > > > > > > > > Can guest_cid be sufficient?
> > > > > > > >
> > > > > > > > See above "When we have many vsock devices, we..." as well.
> > > > > > > > If something is not clear or incorrect, please feel free to let me
> > know.
> > > > > > > >
> > > > > > > > > >  A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is
> > > > > > > > > > received with an unknown \field{type} value.
> > > > > > > > > > --
> > > > > > > > > > 2.34.1
> > > > > > > > > >
> > > > > > > >
> > > > > > > > Thanks for your comments!
> > > > > > > >
> > > > > > > > Best Regards,
> > > > > > > > Xuewei
> > > > > >
> > > > > > Thanks,
> > > > > > Xuewei
> > > >
> > > > Thanks,
> > > > Xuewei
> > 
> > Thanks,
> > Xuewei

Thanks,
Xuewei
