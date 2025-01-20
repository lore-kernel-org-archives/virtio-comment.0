Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8BC1DED4B
	for <virtio-comment@lists.linux.dev>; Mon, 20 Jan 2025 13:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737378993; cv=none; b=GoL69NlrI40KvmAPe7lB8KTkYR/Y+Q9gNRKK0MQeiqqBGkbUxBq7+obVM9qPPU+DkjCJPlbTxiprzDh3THGQi6plVaKRh3r569wkp++bHp9UptIuEuQht/EYMz4TxSbm4405DcflmUJS8++gkRx+KWR11KSwvZSOfNiUI4AK3RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737378993; c=relaxed/simple;
	bh=A1uhcBowKw68nNXC4rXmSzEByEeUDOvjMvcF3JCkQh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uq07BPhGV5A027+kY+Yb4+R9Ak0Ty0zRQBEn5rNovNIk4qpbCpmzWli5IxnHpKzr9ApG/ZUkCDUaWR63O6wPZDKDpbEbKqoRvlnd7o6UTui82OC6W0eL2CqdJdVbKI9X+rQQHJwlJCWgXGbmVgSgGoIFMKkYivU4WHUzE+HRDD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9163LSq; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9163LSq"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21636268e43so100436445ad.2
        for <virtio-comment@lists.linux.dev>; Mon, 20 Jan 2025 05:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737378990; x=1737983790; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0euJeN8pvcZHa6JUR4yOD0cusNzIhxb3zrW52zdgPec=;
        b=E9163LSq0aCsGRT8OvtIhWQ+O6oSFXSUBksfCr9ZeF5jgnlNjj7AFaNyvbBSGFpx8a
         7O76mZqYvqlFPTk1fGuRgxHmFsR0N0Y0kJldwkgIT11krfbbylbqTv8jptWDw2xTfAeM
         AhDq3s3KbimblhZ78AYihf5I+Fs7ZF/Hayum/ZAwedoP2m5OEv0QwPJ34Cb4DdplWbbe
         JfkhIOYaxIpdKEAObSAPi1JNkKQBvEZVi4i+rsxXpYG7fEiZibHhFo8Ris9WkeyDzdtt
         2NcI9a9JNtKOuscOuBgTKtz2FSi6I4bOmu/eBefcpGf7rrt9+VKMzsZo9mjcJqFL4N1s
         u4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737378990; x=1737983790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0euJeN8pvcZHa6JUR4yOD0cusNzIhxb3zrW52zdgPec=;
        b=Rhbqhp9McL79mWW0FP/5KL6iosrTxmDtBnl9NVmWFIOiF7whVPG33SrriBX/xxtZG2
         JFY+7PaSC3wD9GDB0WRPb76ZOM/858W2xgHRZBnJ2P4T5sJ+ciJUYfTFFEoVZeqGJFpy
         6OHGiWtVrbZvWofL2ZGXH35RXq6phj3A1uvD1ljMnn1/Ry8Qq7aX3aspXVAyslLyJIRn
         2H6r5Q6Dog8msJ6KLCw/A1YVBqG81DW5BnHqD4fG9Lg+VMGNd8ql8IP5/JnwxfimIFdw
         8XJ+VrRR40VNqkldgfEcLRhzv+Z9xc6nDeqIh/86TevTE6biMPqKcxoHsW65AzqStg5W
         JQrA==
X-Forwarded-Encrypted: i=1; AJvYcCUIj6TQHVyrPcQ6QwbD+Z9l8yi0YaxoxDjT3w0ldEG4IUvEqonFIIblRz0BPq00ocmCZuTlH5PhxL9/Ic8JKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxINnhH9IwOLBZUVKyBPtExOe54Omx9Fwi+adHh/mGBA+KvtzO
	igiYbr+lixj4PLN5NFOC0Qahhht4Plz/7wCbraE4gNcaUQ7ejFlM
X-Gm-Gg: ASbGncseJTAvF6qYu1SAwjbZr8TjZ2Qb+8q6YVs8odyW9wQpbXVeC/WzbewHs4h8p12
	uOyMUwJvE/XJekDkdFwX3YM/JmImKSzjUu9CrYjU7q9bTYitWNZo8fIsZ6/LFTMV28Rnfz5BTfc
	2ixpfiJEU6WMvcqAGjzjONj5Gs7YAPld4ZUvQ+PmdI2a5CsvduLQbs/p65Kdy0B+5hGphjyIths
	D0lj52WQX2jf8cvxjkmrG4lTA9tvkmfMHPr1FmIJ4EsRVbKDRKQ1uWzPlq3RakZRvq4rke50foQ
	wYjldlNzuMLONkhS
X-Google-Smtp-Source: AGHT+IF1JiS5pSb+ZK10u3ukKOE4KPR+GiWN2Mp2m6MujclAMRWTJ7U+4k4C8NcYu1Lxr3cIxOsswA==
X-Received: by 2002:a05:6a20:918c:b0:1e0:de01:4407 with SMTP id adf61e73a8af0-1eb2160d370mr17539453637.37.1737378989369;
        Mon, 20 Jan 2025 05:16:29 -0800 (PST)
Received: from devant.antgroup-inc.local ([47.89.83.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bca75d6fasm6956800a12.4.2025.01.20.05.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 05:16:28 -0800 (PST)
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
Date: Mon, 20 Jan 2025 21:16:13 +0800
Message-Id: <20250120131613.1227498-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CY8PR12MB71955EE2C373C56409E0CA06DC102@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <CY8PR12MB71955EE2C373C56409E0CA06DC102@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> > From: Xuewei Niu <niuxuewei97@gmail.com>
> > Sent: Tuesday, December 31, 2024 12:43 PM
> > 
> > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > Sent: Tuesday, December 31, 2024 11:03 AM
> > > >
> > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > Sent: Thursday, December 5, 2024 11:59 AM
> > > > > >
> > > > > > Hi Parav,
> > > > > >
> > > > > > Sorry for the late reply. I was super busy in the past few
> > > > > > weeks. I hope things become more regular from now on.
> > > > > >
> > > > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > > > Sent: Thursday, October 24, 2024 12:38 PM
> > > > > > > >
> > > > > > > > This patch brings a new feature, called "multi devices", to
> > > > > > > > the virtio vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES"
> > > > > > > > feature
> > > > > > bit, and a "index"
> > > > > > > > field to the config for the virtio vsock.
> > > > > > > >
> > > > > > > > == Motivition ==
> > > > > > > >
> > > > > > > > Vsock is a lightweight and widely used data exchange
> > > > > > > > mechanism between host and guest. Kata Containers, a secure
> > > > > > > > container runtime, leverages the capability to exchange
> > > > > > > > control data between the shim and the
> > > > > > kata-agent.
> > > > > > > >
> > > > > > > > Currently, the virtio-vsock only supports one device,
> > > > > > > > resulting in the following
> > > > > > > > limitations:
> > > > > > > >
> > > > > > > > * Poor performance isolation: All vsock connections share
> > > > > > > > the same virtqueue.
> > > > > > > Do you have rough estimates on how much performance is
> > > > > > > affected (or is
> > > > > > poor) due to single queue?
> > > > > > > I am not familiar vsock application space.
> > > > > > > It is something like 10K socket msg/sec or 10 million socket
> > > > > > > msg/sec due to
> > > > > > single queue?
> > > > > >
> > > > > > Yes, but the data shows the performance doesn't grow much.
> > > > > If so, please update the commit log description to not have
> > > > > performance as
> > > > the motivation.
> > > > > Rather performance as side gain.
> > > > > Please write it as main motivation is ... TSI etc details.
> > > >
> > > > Will do.
> > > >
> > > > > > I think we can
> > > > > > skip the performance part for now. Here are reasons:
> > > > > >
> > > > > > - The biggest motivition to make us support this feautre is mutli-
> > backends
> > > > > >   support. In the Kata Containers cases, we'd like to use Transparent
> > > > > >   Socket Impersonation (TSI) to use virtio-vsock for data plane. The
> > > > > >   limitation of the single vsock device is quite clear.
> > > > > Do you mean TSI functionality requires multiple vsock device as
> > > > > the only
> > > > way forward?
> > > > > I thought even one vsock device can do TSI too?
> > > > > Which information is mandatory from multiple devices to do TSI?
> > > >
> > > > Yes. TSI doesn't rely on this feature.
> > > Hmm. So I lost you. :(
> > > If TSI can be achieved without mult-device, you probably need to rewrite it
> > which one needs multi-device.
> > 
> > Will do.
> > 
> > > > However, we have finished a POC that integrates vhost-user-vsock
> > > > with Ztunnel, a per-host proxy for Istio service mesh. The diagram
> > > > is as following.
> > > >
> > > >
> > > >
> > > >
> > ╔═════════════════════════════════════════
> > ═══
> > > > ═══╗
> > > >                              ║ VMM                                           ║
> > > >                              ║                                               ║
> > > >                              ║   ╔═════════════╗
> > ╔═════════════╗
> > > > ║
> > > >                              ║   ║    device   ║ <════════ ║  kata-agent ║   ║
> > > >     ╔════════════════════╗   ║
> > ╚═════════════╝virtio-
> > > > vsock═════════════╝   ║
> > > >     ║                    ║   ║                                               ║
> > > >     ║  Ztunnel           ║   ║                                               ║
> > > >     ║                    ║   ║                                               ║
> > > >     ║    ╔═════════════╗ ║   ║    vhost-user-vsock
> > > > ╔═════════════╗   ║
> > > >     ║    ║    device   ║ ║
> > <══════════════════════════════ ║
> > > > user app  ║   ║
> > > >     ║    ╚═════════════╝ ║   ║
> > > > ╚═════════════╝   ║
> > > >     ║                    ║   ║                                               ║
> > > >     ╚════════════════════╝
> > > >
> > ╚═════════════════════════════════════════
> > ═══
> > > > ═══╝
> > > >
> > > > Kata-agent is a required component to manage containers in Kata
> > Containers.
> > > > It uses virtio-vsock to communicate with the shim.
> > > >
> > > > The device for networking is offloaded to the Ztunnel using
> > > > vhost-user protocol in order to bypass network stacks on both host
> > > > and guest. We can't achieve this without the multi-device feature.
> > > The above diagram achieves the described feature using single device.
> > > Or the arrow 'virtio-vsock' consist of multiple devices? If so, better to
> > upgrade the diagram box 'device' to 'devices'.
> > 
> > The diagram shows two devices: one in the VMM, and one in the Ztunnel. So I
> > update the diagram with number to make it clear.
> > 
> > 
> > ╔═════════════════════════════════════════
> > ══════╗
> >                              ║ VMM                                           ║
> >                              ║                                               ║
> >                              ║   ╔═════════════╗           ╔═════════════╗
> > ║
> >                              ║   ║   device1   ║ <════════ ║  kata-agent ║   ║
> >     ╔════════════════════╗   ║
> > ╚═════════════╝virtio-vsock═════════════╝   ║
> >     ║                    ║   ║                                               ║
> >     ║  Ztunnel           ║   ║                                               ║
> >     ║                    ║   ║                                               ║
> >     ║    ╔═════════════╗ ║   ║    vhost-user-vsock
> > ╔═════════════╗   ║
> >     ║    ║   device2   ║ ║
> > <══════════════════════════════ ║   user app  ║   ║
> >     ║    ╚═════════════╝ ║   ║
> > ╚═════════════╝   ║
> >     ║                    ║   ║                                               ║
> >     ╚════════════════════╝
> > ╚═════════════════════════════════════════
> > ══════╝
> > 
> 
> From my limited understanding, it appears that the driver that is using device1 and device2 are two different drivers, is that right?

Yes, you are right,

> > > > > > - This feature gives vsock device the capability to improve performance.
> > > > > >   Apart from the driver side, optimizations on the VMM side are also
> > > > > >   required. For example, VMM spawns an exclusive thread for each
> > vsock
> > > > > >   device. But we don't have enough time to do that.
> > > > > > - Stefano said that they have a plan to add support
> > > > > > multi-virtqueues in
> > > > the
> > > > > >   feature to enhance the isolation of vsock devices. We are
> > > > > > doing the
> > > > same
> > > > > >   thing, but with different approaches.
> > > > > >
> > > > > > > > By the way, although multi-queues can solve this problem,
> > > > > > > > they do not conflict.
> > > > > > > > * Cannot enable more than one backend: Virtio-vsock,
> > > > > > > > vhost-vsock, and vhost-user-vsock cannot be enabled
> > > > > > > > simultaneously
> > > > on the transport.
> > > > > > > >
> > > > > > > > We'd like to transfer networking data, based on TSI
> > > > > > > > (Transparent Socket
> > > > > > > > Impersonation) technique, over vsock via the vhost-user
> > > > > > > > protocol to reduce overhead. However, by default, the vsock
> > > > > > > > device is occupied by the kata- agent, a control component for Kata
> > Containers.
> > > > > > > >
> > > > > > > > == Typical Usages ==
> > > > > > > >
> > > > > > > > Assuming there are two virtio-vsock devices on the guest,
> > > > > > > > with CIDs
> > > > > > > > 3 and 4 respectively. And the device with CID 3 is default.
> > > > > > > >
> > > > > > > > ==== Guest -> Host ====
> > > > > > > >
> > > > > > > > Use the device with CID 3.
> > > > > > > >
> > > > > > > > ```c
> > > > > > > > fd = socket(AF_VSOCK);
> > > > > > > > bind(fd, 3, -1);
> > > > > > > > connect(fd, 2, 1234);
> > > > > > > > n = write(fd, buffer);
> > > > > > > >
> > > > > > > > // or use default (no bind)
> > > > > > > > fd = socket(AF_VSOCK);
> > > > > > > > connect(fd, 2, 1234);
> > > > > > > > n = write(fd, buffer);
> > > > > > > > ```
> > > > > > > >
> > > > > > > > Use the device with CID 4.
> > > > > > > >
> > > > > > > > ```c
> > > > > > > > fd = socket(AF_VSOCK);
> > > > > > > > bind(fd, 4, -1);
> > > > > > > > connect(fd, 2, 1234);
> > > > > > > > n = write(fd, buffer);
> > > > > > > > ```
> > > > > > > Above and below example is not using the index that you are
> > > > > > > introducing in
> > > > > > this patch.
> > > > > > > Can you please elaborate?
> > > > > >
> > > > > > When we have many vsock devices, we need to know the position of
> > > > > > those devices. The devices are arranged in a (linked) array, see below:
> > > > > How does the driver know how many devices would be accessible to
> > > > > the
> > > > driver?
> > > > > I suppose it does not need to know it. It can just work with
> > > > > current number
> > > > of active devices. Isn't it?
> > > >
> > > > Seems like it is not very clean here.
> > > >
> > > > Yes, the driver doesn't need to know it.
> > > >
> > > > The "index" is not the real index of devices. It is a kind of
> > > > ordering for devices. The device with less index is at the front of
> > > > other devices in the device list. But the real index depends on how many
> > devices are discovered.
> > > >
> > > > For example, there are three devices, vsock device (cid=4, index=4),
> > > > vsock device (cid=3, index=5), vsock device (cid=5, index=1). The
> > > > driver maintains a linked list to store the devices.
> > > >
> > > > Assuming that the driver firstly discovered the vsock device(4,4),
> > > > then place it in the first place.
> > > >
> > > > ```
> > > > [real index 0]: vsock device (cid=4, index=4) <default device> ```
> > > >
> > > > Then, the vsock device (3,5) was discovered. The driver should place
> > > > it in the second place, as its index 5 is greater.
> > > >
> > > > ```
> > > > [real index 0]: vsock device (cid=4, index=4) <default device> [real index 1]:
> > > > vsock device (cid=3, index=5) ```
> > > >
> > > > Finally, the vsock device (5,1) was discovered. The driver should
> > > > place it in the first place, as its index 1 is less than the previous devices.
> > > >
> > > > ```
> > > > [real index 0]: vsock device (cid=5, index=1) <default device> [real index 1]:
> > > > vsock device (cid=4, index=4) [real index 2]: vsock device (cid=3,
> > > > index=5) ```
> > > >
> > > > The "index" in device's config space is a logical index to be used for sorting.
> > > >
> > > I see. In that case we should rename index to a more intuitive name, such as
> > device_order.
> > 
> > Lol. In fact, the original name is "order", but I think it doesn't look pro. I don't
> > have any problem with the name. Will change it.
> > 
> > > > > In other words, say, if the first vsock device discovered, is
> > > > > index=1, can
> > > > cid==4 make progress with it?
> > > >
> > > > Yes. If device (3,1) is discovered first, the device (4,0) can make
> > > > progress with it. Apart from that, the final order is the same with the
> > below.
> > > >
> > > If device (3,1) can make the progress, then why any ordering is needed?
> > 
> > Currently, the order is used to determine **the default device**. In the single-
> > device mode, the user app doesn't need to specify a CID as there is only one
> > CID avilable. However, we can't expect every app to update their code to
> > support multiple CIDs. When the CID is not persent, the driver will use the
> > default device's.
> > 
> > Assuming that there is no `device_order`. We intent to set device (cid=4) to the
> > default device. Then, we must ensure that the device (cid=4) is discovered
> > before any other devices. **Indeed, we can't guarantee this.**
> > 
> > Let us go through this case: The device (cid=3) is discovered firstly.
> > 
> > ```
> > [0]: vsock device (cid=3) <default device> ```
> > 
> > Then the device (cid=4) comes:
> > 
> > ```
> > [0]: vsock device (cid=3) <default device>
> > [1]: vsock device (cid=4)
> > ```
> > 
> > Now the device (cid=3) becomes the default device which is not what we
> > want.
> > 
> > If we have "device_order", the result will change. All we need to do is we
> > assign device (cid=4) a less order than device (cid=3).
> > 
> Since the connection can progress through (4,0), why (3,1) should be a default device?
> What breaks if (3,0) stays as default device?

The point is that we should have an ability to specify a device as the
default.

Assuming that there is no `device_order`, the devices are indicated by (4)
and (3). And we want to set (4) as the default device.

We can't guarantee the order of discovery: If (3) is discovered first,
there is no chance to set (4) as the default device.

With `device_order`: Although (3,1) is discovered first, (4,0) still can be
the default device because of the less `device_order`.

> > ```
> > [0]: vsock device (cid=3, order=1) <default device> ```
> > 
> > Then the device (cid=4) comes:
> > 
> > ```
> > [0]: vsock device (cid=4, order=0) <default device>
> > [1]: vsock device (cid=3, order=1)
> > ```
> > 
> > Now the device (cid=4) becomes the default device.
> > 
> > Although we can use a boolean value to indicate the default device, I think we
> > should keep this for future possible use of this ordering.
> > 
> The notion and need of the default device is missing. May be is this something already explained in current spec that I should read?

Yes. For the use case, you can refer to `or use default (no bind)` at the
first message in thread.

For the easy understanding, I'll explain it in the following.

When an app doesn't specify the src CID, the driver must fill one as local
address.

If the system doesn't support multiple devices, i.e. there is only one
device, the driver will fill the device's CID.

Unlike TCP/IP, there is neither route table nor default route. If there are
multiple devices and there is no default device, the driver doesn't know
which CID to use, which causes the failure of communication.

> > > Please let me know if I misunderstood.
> > >
> > > > >
> > > > > ```
> > > > > [0]: vsock device (cid=4, index=0) <default device>
> > > > > [1]: vsock device (cid=3, index=1) ```
> > > > >
> > > > > The index is only used for determining the device position; for
> > > > > data transmission, `bind`, `connect`, etc., the CID is used.
> > > > >
> > > > So why not driver maintain some linked list of devices and use one?
> > > > The relation of cid and device index is not clear if there is one.
> > > > If none, the device index is just driver internal detail, right?
> > >
> > > Yes, the driver does maintain a linked list. However, the device
> > > should be able to control its position in the list. IMHO, it can't be the driver
> > internal detail.
> > > This isn’t clear of why ordering is needed, because you explained above that
> > when (3,1) is discovered first, it can be used without (4,0).
> > >
> > > >
> > > > > > > If the binding is based on the CID, than why the new index needed?
> > > > > >
> > > > > > Think about the case of using the CID to determine the device position.
> > > > > Do you mean CID is used to derive the device index?
> > > > > If yes, if there is one to one mapping, than the device identified
> > > > > by the CID
> > > > itself can be used directly, isn't it?
> > > >
> > > > Yes, but it is a counterexample. I mean using CID as the index is
> > > > not a good idea.
> > > I am not suggesting CID to be used as index.
> > > CID is used to select the device (out of available devices).
> > >
> > > >
> > > > I think the "index" is used to establish the one-to-one mapping. If
> > > > there is only CID, I don't have an idea about how to establish the mapping.
> > > >
> > > I didn’t understand this part.
> > 
> > The "device_order" ("index") is only used during the process of device
> > discovery. Once the device is initialized, the device is identified by its CID, and
> > the "device_order" is not used anymore.
> > 
> Lets understand the need of default device.

> > > > > > If we
> > > > > > want to change the position, we have to change the CID. If the
> > > > > > peer doesn't realize the change, the connection will be broken.
> > > > > > So we have to decouple the CID and the position, one for data
> > > > > > transmission, one
> > > > for device management.
> > > > > > That is why we need the index.
> > > > > >
> > > > > > ```
> > > > > > ==from==
> > > > > > [0]: vsock device (cid=4, index=0) <default device>
> > > > > > [1]: vsock device (cid=3, index=1) ==to==
> > > > > > [0]: vsock device (cid=3, index=0) <default device>
> > > > > > [1]: vsock device (cid=4, index=1) ```
> > > > > >
> > > > > How is this mapping dynamically changed? Is this driver only decision?
> > > >
> > > > By hot-plug/hot-unplug devices. So this is device-only decision (or
> > > > VMM side).
> > > >
> > > > > > > Or the example is stale here in commit log?
> > > > > >
> > > > > > No. It's up to date.
> > > > > >
> > > > > > >
> > > > > > > ==== Host -> Guest ====
> > > > > > >
> > > > > > > The usage is no changes in this case. Send to device with CID 3.
> > > > > > >
> > > > > > > ```c
> > > > > > > fd = socket(AF_VSOCK);
> > > > > > > connect(fd, 3, 1234);
> > > > > > > n = write(fd, buffer);
> > > > > > > ```
> > > > > > >
> > > > > > > Send to device with CID 4.
> > > > > > >
> > > > > > > ```c
> > > > > > > fd = socket(AF_VSOCK);
> > > > > > > connect(fd, 4, 1234);
> > > > > > > n = write(fd, buffer);
> > > > > > > ```
> > > > > > >
> > > > > > > I've pushed a version of code for the implementation of multi
> > > > > > > devices to lkml [1].
> > > > > > >
> > > > > > > [1]
> > > > > >
> > > > > > [..]
> > > > > >
> > > > > > > >
> > > > > > > > Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> > > > > > > > ---
> > > > > > > >  device-types/vsock/description.tex | 46
> > > > > > > > ++++++++++++++++++++++++++++--
> > > > > > > >  1 file changed, 44 insertions(+), 2 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/device-types/vsock/description.tex b/device-
> > > > > > > > types/vsock/description.tex index 7d91d15..f2e663b 100644
> > > > > > > > --- a/device-types/vsock/description.tex
> > > > > > > > +++ b/device-types/vsock/description.tex
> > > > > > > > @@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device
> > > > > > > > Types / Socket Device / Feature bits}
> > > > > > > > \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is
> > supported.
> > > > > > > >  \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type
> > > > > > > > is
> > > > > > supported.
> > > > > > > >  \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket
> > > > type
> > > > > > > > is not implied.
> > > > > > > > +\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple socket
> > > > > > > > +devices are
> > > > > > > > supported.
> > > > > > > An individual device cannot indicate what other devices are
> > supported.
> > > > > > > The question is, when multiple devices are accessible to a
> > > > > > > single driver, how
> > > > > > should driver choose which device to use?
> > > > > > > This is the question that driver needs to solve based on
> > > > > > > certain
> > > > information.
> > > > > > >
> > > > > > > Therefore, the only thing needed in this patch is a feature
> > > > > > > bit to say, from
> > > > > > device point of view is:
> > > > > > >
> > > > > > > VIRTIO_VSOCK_DEV_INDEX This feature indicates that device
> > > > > > > configuration
> > > > > > space has device index.
> > > > > > >
> > > > > > > And somehow application chooses which device to use to
> > > > > > > transport the vq
> > > > > > entries.
> > > > > > >
> > > > > > > Right?
> > > > > >
> > > > > > `VIRTIO_VSOCK_F_MULTI_DEVICES` is to let driver know that the
> > > > > > device supports multi-devices feature: read the index field from
> > > > > > the config space, prepare an array to store multiple devices,
> > > > > > deny device without the feature, etc.
> > > > > >
> > > > > How does driver prepare the array, if it does not know the array size?
> > > >
> > > > The devices are stored in a linked list, so it does not need to know
> > > > the array size.
> > > >
> > > In the example of (3,1) you explained it can use it.
> > > So I do not follow the need of priority or order.
> > > Any number of devices can be in the group of multiple devices as long
> > > as they can establish identity about some kind of 'group' of them, Right?
> > >
> > > > > What if two PCI hardware devices are plugged in, from two
> > > > > different
> > > > physical cards and each has the duplicate index?
> > > >
> > > > The latter one will be denied by the driver because of the conflicts.
> > > >
> > > How does it know that there is conflict?
> > > For example, lets say discovery occurred as follows:
> > > Phy_device_A: index_0
> > > Phy_device_B: index_1
> > > Phy_device_A: index_1
> > >
> > > You probably wanted to group A_0, A_1. But in current scheme A_0, B_1
> > gets grouped as there is no notion of a group.
> > 
> > I have two questions:
> > 
> > - Why can `Phy_device_A` be discovered twice?
> > - Why do you want to group A_0 and A_1?
> > 
> The way I was seeing it as, phy_device_A = single backend creating multiple vsock devices A_0 and A_1.
> So related devices are A_X to group.
> And skip grouping unrelated devices.

I am not an expert on PCI. So I am not sure if a PCI backend can create
multiple devices. But in the context of vsock, "single backend creating
multiple vsock devices" is not possible. IMHO, single backend = one device,
and one device corresponds to one driver.

This feature allows to have N devices (i.e. N drivers). Without this, only
1 device (i.e. 1 driver) is allowed. So I update the diagram with drivers.

 +───────────────────────────────────────────────────────────────+
 │ VMM                                                           │
 │                 +───────────────────────────────────────────+ │
 │                 │ Guest          virtio-vsock               │ │
 │ +────────────+  │   +──────────────+     +──────────────+   │ │
 │ │  device0   │<─────│    driver0   │<────│  kata-agent  │   │ │
 │ +────────────+  │   +──────────────+     +──────────────+   │ │
 │                 │                                           │ │
 │                 │   +──────────────+     +──────────────+   │ │
 │        +────────────│    driver1   │<────│   user app   │   │ │
 │        │        │   +──────────────+     +──────────────+   │ │
 │  vhost-user-vsock                                           │ │
 │        │        +───────────────────────────────────────────+ │
 │        │                                                      │
 +────────│──────────────────────────────────────────────────────+
          │                                                       
 +────────V─────────+                                             
 │  +───────────+   │                                             
 │  │  device1  │   │                                             
 │  +───────────+   │                                             
 │           Ztunnel│                                             
 +──────────────────+                                             

> > Would you mind explaining more? Plus, all devices are placed in one list, that
> > is, in one group. IMHO, there is no group concept in term of vsock.
> > 
> > > > > > IMHO, `VIRTIO_VSOCK_F_MULTI_DEVICES` is better than
> > > > > > `VIRTIO_VSOCK_DEV_INDEX`.
> > > > > >
> > > > > > > >  \end{description}
> > > > > > > >
> > > > > > > >  \drivernormative{\subsubsection}{Feature bits}{Device Types
> > > > > > > > / Socket Device / Feature bits} @@ -34,6 +35,13 @@
> > > > > > > > \subsection{Feature bits}\label{sec:Device Types / Socket
> > > > > > > > Device / Feature bits} VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the
> > > > > > > > driver
> > > > MAY
> > > > > > > > act as if VIRTIO_VSOCK_F_STREAM has also been negotiated.
> > > > > > > >
> > > > > > > > +If a device without VIRTIO_VSOCK_F_MULTI_DEVICES has been
> > > > > > > > +registered, the driver SHOULD ignore all subsequent devices.
> > > > > > > > +
> > > > > > > At driver level in virtio spec, there is no concept of registered.
> > > > > > > It should be something like
> > > > > > > If the device index is not present, the driver SHOULD pick
> > > > > > > some default
> > > > > > device etc.
> > > > > >
> > > > > > "Pick some default device" is not much accurate. When this case
> > > > > > happened, it means multi-devices feature is disabled, then the
> > > > > > driver should ignore all subsequent devices.
> > > > > Multiple vsock devices belong to some single group is what is
> > > > > needed, if
> > > > that definition is needed.
> > > > > And just providing an index does not help for it in my view.
> > > > >
> > > > > Is this some kind of multi-pathing?
> > > > > If so, providing some common such identification is necessary
> > > > > between two
> > > > devices to indicate they are part of some group.
> > > > >
> > > > > Please explain more I misunderstood.
> > > >
> > > > In the term of vsock, there is no concept for "group".
> > > >
> > > > I mean the driver will fallback to single-device mode if the device
> > > > index is not present. In this case, any subsequent devices will be
> > > > denied. In other words, there is only one vsock device avilable in the driver.
> > > >
> > > I understood what you are proposing.
> > > But it is not looking correct way to solve it to me, because you want some
> > kind of grouping functionality that indicates that 'these N devices belong to
> > same group', hence transport those sockets in this group.'
> > 
> > No. Indeed, every connection uses one vsock device, not group of devices.
> > 
> > Without this patch, there is only one vsock device available. With this patch,
> > there are N vsock devices available.
> > 
> Well, it can be available without this patch too.
> What prevents it from?

No, multiple devices are not available. The difference is the number of
availbale devices: 1 or N.

- Without this patch: 1 driver (frontend) = 1 device (backend)
- With this patch: N drivers (frontends) = N devices (backends)

> > But in the process of data transmit, the user usually gives a CID to select a
> > particular vsock device.
> >
> So each device can have unique CID? And if so, may be that's enough.

Yes.

> You tried to explain it, but I fail to understand why CID is not sufficient, like the way you mentioned exactly the same i.e. "CID to select the particular vsock device".

The CID can be considered like an IP address which can't be changed
casually. The changes must be notified to the peer. Otherwise, the
communication will fail.

The `device_order`, as a local variable, is relatively easily to change the
default device.

> > To make it clear, let us talk about the network.
> > 
> > Without this patch, driver is allowed to have only one NIC. 
> Not really. Today driver instance handles multiple NICs already. Each nic has different transport level address. For example, for PCI, it has different RID (BDF).
> Each device also may/may not have same mac address.> 

> > But with this patch,
> > driver is allowed to have N NICs. While there are N NICs available, a particular
> > NIC identified by route table or something is used.
> > 
> > > > > > Will replace the term "register", see below:
> > > > > >
> > > > > > If a device without VIRTIO_VSOCK_F_MULTI_DEVICES has been
> > > > > > present, the driver SHOULD ignore all subsequent devices.
> > > > > >
> > > > >
> > > > > > > > +If a device with VIRTIO_VSOCK_F_MULTI_DEVICES has been
> > > > > > > > +registered, the driver SHOULD accept other devices only if
> > > > > > > > +they expose VIRTIO_VSOCK_F_MULTI_DEVICES.
> > > > > > > > +
> > > > > > > >  \devicenormative{\subsubsection}{Feature bits}{Device Types
> > > > > > > > / Socket Device / Feature bits}
> > > > > > > >
> > > > > > > >  The device SHOULD offer the
> > > > VIRTIO_VSOCK_F_NO_IMPLIED_STREAM
> > > > > > > > feature.
> > > > > > > > @@ -52,6 +60,7 @@ \subsection{Device configuration
> > > > > > > > layout}\label{sec:Device Types / Socket Device
> > > > > > > > \begin{lstlisting} struct virtio_vsock_config {
> > > > > > > >  	le64 guest_cid;
> > > > > > > > +	le16 index;
> > > > > > > >  };
> > > > > > > >  \end{lstlisting}
> > > > > > > >
> > > > > > > > @@ -77,11 +86,36 @@ \subsection{Device configuration
> > > > > > > > layout}\label{sec:Device Types / Socket Device  \hline
> > > > > > > > \end{tabular}
> > > > > > > >
> > > > > > > > +The \field{index} field indicates index of a device, and is
> > > > > > > > +required for each device when VIRTIO_VSOCK_F_MULTI_DEVICES
> > > > > > > > +feature has been
> > > > > > > > negotiated.
> > > > > > > This is not needed. A driver should be able to make choice on
> > > > > > > which device to
> > > > > > use.
> > > > > >
> > > > > > IMHO, this is necessary. It is a rule that DEVICE must provide
> > > > > > the index if it want to enable the multi-devices feature. It's
> > > > > > not a rule for the
> > > > driver.
> > > > > >
> > > > > > BTW, making choice on which device to use by the driver is
> > > > > > according to
> > > > CID.
> > > > > So let driver maintain its own data structure without the device index.
> > > > > Why won't it work?
> > > >
> > > > Because the device (VMM side) should be able to decide the postion
> > > > of the devices. And the driver should follow the device's decision.
> > > >
> > > (3,1) example shows that single device can also work without strictly
> > attaching to the position.
> > > So lets try to achieve without such strict index, but rather achieve is using a
> > generic group concept.
> > > A group of devices has wider use case. If needed, I will explain later in the
> > thread.
> > 
> > Yes please. Thanks a lot!
> > 
> There are two PCI devices exposed. Each is connected to different numa node on the host.
> For two devices there is need to create single netdevice so that RSS RQs can span across two devices.
> These two virtio PCI devices are part of one group so that driver needs to learn and create only one protocol level netdev.
> There may be other totally unrelated virtio net pci devices at the same time which shouldn’t be grouped this way.> 

> Vsock case you are explaining is similar, with exception that at OS driver level, you still have two vsock devices, and application somehow is doing/learning its group.
> So a base infrastructure to grouping the device and using it differently based on driver side usecase is desired.

I think I am understanding the concept of "group" you said. I believe we are
talking about the different things.

You are saying that 1 driver can handle multiple devices, right?

Now, the system is limited to have only 1 driver and 1 device. I am trying
to remove this limitation by allowing to have N drivers and N devices. But
from a single driver's perspective, it is still have only 1 device (see the
above diagram).

> > I have two questions:
> > 
> > - How much groups do we need?
> > - How can driver know which group the device belongs to?
> >
> The device tells the driver its group id. So, devices with same group id belongs to one group.
> One may use UUID to define a group.
>  
> > > > > > The index is only used to determine position in the driver's
> > > > > > device list. (This is the same as the previous explanation.)
> > > > > >
> > > > > > > > +The \field{index} is 16 bits in size, enabling support for
> > > > > > > > +up to
> > > > > > > > +65,536 devices.
> > > > > > > > +
> > > > > > > Bit width is visible, just mentioning maximum device size is
> > > > > > > good
> > > > enough.
> > > > > >
> > > > > > Will update in the next version.
> > > > > >
> > > > > > > > +The source socket is allowed to not be bound to any CID. It
> > > > > > > > +is required for the driver to choose a CID for the socket.
> > > > > > > > +If VIRTIO_VSOCK_F_MULTI_DEVICES is not negotiated, the one
> > > > > > > > +and only device's CID is used. If
> > > > > > > > +VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the driver uses
> > > > > > > > +the default device's. In this case, the driver selects the device with
> > the lowest index as the default.
> > > > > > > > +
> > > > > > > If socket can choose the CID, why does it need new index?
> > > > > > > Its confusing to see relation of CID and index here.
> > > > > > > Can you please explain?
> > > > > >
> > > > > > See "When we have many vsock devices, we...".
> > > > > >
> > > > > > > > +\devicenormative{\subsubsection}{Device configuration
> > > > > > > > +layout}{Device Types / Socket Device / Device configuration
> > > > > > > > +layout}
> > > > > > > > +
> > > > > > > > +When VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the device
> > > > > > > > +MUST
> > > > > > > > offer
> > > > > > > > +an \field{index}, which MUST NOT be same with the
> > > > > > > > +\field{index} of other devices.
> > > > > > > > +
> > > > > > > > +When VIRTIO_VSOCK_F_MULTI_DEVICES is not negotiated, the
> > > > device
> > > > > > > > SHOULD
> > > > > > > > +NOT offer an \field{index}.
> > > > > > > > +
> > > > > > > This should be MUST.
> > > > > >
> > > > > > Will update.
> > > > > >
> > > > > > > I don't see a need to write this.
> > > > > > > In other words,
> > > > > > >
> > > > > > > If VIRTIO_VSOCK_F_DEV_INDEX is offered, field index is supported.
> > > > > >
> > > > > > This part gives two rules:
> > > > > >
> > > > > > - The device MUST not provide the index that has been already used.
> > > > > > - If VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the device MUST
> > > > offer
> > > > > >   the index field (if not offered, the driver might read data outside the
> > > > > >   config space, as the sizes are different).
> > > > > >
> > > > > > > >  \subsection{Device Initialization}\label{sec:Device Types /
> > > > > > > > Socket Device / Device Initialization}
> > > > > > > >
> > > > > > > >  \begin{enumerate}
> > > > > > > >  \item The guest's cid is read from \field{guest_cid}.
> > > > > > > >
> > > > > > > > +\item If VIRTIO_VSOCK_F_MULTI_DEVICES has been negotiated,
> > > > > > > > +the
> > > > > > > > device's
> > > > > > > > +index will be read from \field{index}. If not, the device's
> > > > > > > > +index will be ignored.
> > > > > > > > +
> > > > > > > >  \item Buffers are added to the event virtqueue to receive
> > > > > > > > events from the device.
> > > > > > > >
> > > > > > > >  \item Buffers are added to the rx virtqueue to start receiving
> > packets.
> > > > > > > > @@ -167,6 +201,10 @@
> > > > > > > > \subsubsection{Addressing}\label{sec:Device
> > > > > > > > Types / Socket Device / Device Opera  consists of a (cid,
> > > > > > > > port
> > > > > > > > number) tuple. The header fields used for this are
> > > > > > > > \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
> > > > > > > >
> > > > > > > > +If at least one device has negotiated
> > > > > > > > +VIRTIO_VSOCK_F_MULTI_DEVICES, and the source socket is not
> > > > > > > > +bound to any CID, then \field{src_cid} should be set to the
> > > > > > > > +default
> > > > device's CID.
> > > > > > > > +
> > > > > > > >  Currently stream and seqpacket sockets are supported.
> > > > > > > > \field{type} is 1
> > > > > > > > (VIRTIO_VSOCK_TYPE_STREAM)  for stream socket types, and 2
> > > > > > > > (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
> > > > > > > >
> > > > > > > > @@ -233,8 +271,12 @@ \subsubsection{Receive and
> > > > > > > > Transmit}\label{sec:Device Types / Socket Device / De
> > > > > > > >
> > > > > > > >  \drivernormative{\paragraph}{Device Operation: Receive and
> > > > > > > > Transmit}{Device Types / Socket Device / Device Operation /
> > > > > > > > Receive and Transmit}
> > > > > > > >
> > > > > > > > -The \field{guest_cid} configuration field MUST be used as
> > > > > > > > the source CID when -sending outgoing packets.
> > > > > > > > +The \field{guest_cid} configuration field MUST be used as
> > > > > > > > +the source CID when sending outgoing packets.
> > > > > > > > +
> > > > > > > > +When VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the source
> > > > CID
> > > > > > > > MUST be
> > > > > > > > +one of the \field{guest_cid} configuration field of the
> > > > > > > > +multiple devices handled by the driver.
> > > > > > > >
> > > > > > > If the guest_cid is used to distinguish between devices, why
> > > > > > > the new field
> > > > > > index is needed?
> > > > > > > Can guest_cid be sufficient?
> > > > > >
> > > > > > See above "When we have many vsock devices, we..." as well. If
> > > > > > something is not clear or incorrect, please feel free to let me know.
> > > > > >
> > > > > > > >  A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is
> > > > > > > > received with an unknown \field{type} value.
> > > > > > > > --
> > > > > > > > 2.34.1
> > > > > > > >
> > > > > >
> > > > > > Thanks for your comments!
> > > > > >
> > > > > > Best Regards,
> > > > > > Xuewei
> > > >
> > > > Thanks,
> > > > Xuewei
> > 
> > Thanks,
> > Xuewei

Thanks,
Xuewei
