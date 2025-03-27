Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F7A204687
	for <virtio-comment@lists.linux.dev>; Thu, 27 Mar 2025 08:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743063531; cv=none; b=pD01eJmgSU35upXbBim/+SXdcpOrweadysKGhK0WTF9GWNn9qqkxCSwx5oy/xCqkMyYQGwhE7ByzGXSD+rndy5kRFG8i/DtbAo01XnVkzu11tDomdS5yjlIrn/+vaye/oqRskxknwU4lYnrNyjyjzHfuYqsZkN5JgETn7bPIAOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743063531; c=relaxed/simple;
	bh=XkTPe8RP1Cqmg9E+JMo3+GE2g+5gT/0Qv7AtxHTwd5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rMQVP3Khx6iQc4gqPVfgs+pZM/Ap/jNtHyVbqPHQ/kduvFKH8hEM/0Mzthe6qanp40uVfUQUFktyX4ufv/zBv6nTQjYGLzkdDyz8uYEuvOzhCuz5qFkhGwIB7VKfwZEzGmnu+zvULrEHIzK9omrfrZhmBYqclIBsgi7rzEyxJU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKgAgsuY; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKgAgsuY"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2264aefc45dso19896745ad.0
        for <virtio-comment@lists.linux.dev>; Thu, 27 Mar 2025 01:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743063529; x=1743668329; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVy3Vle4f2lG060AB0EkDy98qAfPg6FDF/ZPtr8bxQI=;
        b=VKgAgsuYjKJc6RsOvujGP1fwWjWvQLPKXEZCpqG6cGGFUI0eE3W05Y6RwOAdu2ulC4
         mgMFL68XrAgIKjld/hxKVV9ZLTAxNUS1ADxmZPK0llzz1ilwmmXWqhfIZaaSVzd9k2/U
         XtJ0uf9C9089RHSkfnIP9j61Sk+aLniu9KdVZ5hXS/+jRDISe5O4WsUpUFZ+JJCuBvmG
         0sVYqtWQG5/Tl1cpsMrny+tMg/3uj25RHVmJeK+sPHUe0SrOF64C/z7OBle10FYK+Kwe
         u8uCRtyhe/uf1tkpaA7uAHwOWlBz8k26s21DUxisrUfqp7z2TWg9/ML48hRT32Px5JO2
         rfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743063529; x=1743668329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EVy3Vle4f2lG060AB0EkDy98qAfPg6FDF/ZPtr8bxQI=;
        b=EwC3g2dyR+zjvqDJcnQwJoFoVRe3OWfZtdkjkWEz6kd9nnki6sb1qeWXtYiZvxYV7v
         CRVBUFU1nPFrAUsQf98GpJFCD8pM/CFpaCFvM4wTCoD7gEQuGSTa9iUsm+ZYeSOyaQ7f
         6gmRW7cZ5FrtjzaZinniNkbkUupAMKRPGRlwVptbArAKDhPqc0VUBm8/nSqyLynlIc2k
         8ZYo8QQ/qs45SMgwmR+utvMeMJWjFI5eLb9S3658OejSvOj3xOJ8fWGYXtTIPjk67C81
         KbMYthch/p2G477izkDvgE2kN3V7giBG4FlXCHpzJxPqqriGAG9EkSLTma3UmxOF85T2
         GOgw==
X-Forwarded-Encrypted: i=1; AJvYcCV/lu94r9iWnPiS2fCMqwTsTKyCq9TuSxNlyuR+bFhSYjZoSf64TOPT8fzEu8IAX3/cX791xJfqo77xHHYKCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxs6uBTcmvHfXSzd4cUpflr+r4cBiGIDNEfE4LBQuesMf5K0Ivc
	v5etu6o6yBMH3zF4fpt/baERChRVsYN1nY0yg9MMoi0cSsvmgTru
X-Gm-Gg: ASbGncuf9VW8uPTqVi5HfWs7pckirKqeicbjbW4VpV8fyYZoqyO9RUDz8dhObWD69nU
	L0ZNbWtKOscTGIOxIstAFVJ94qIOmj8S+kDdTCLaBGQi39rM+fcN2Haaj60rrrKoFVaTiMb/dC4
	qyHRqSdbohVLx8GMX+eVynFqY0do//8VKcQ1DEPAz+MwJikmjQW4r6DOv8qxDxikU2C8BDiVo6r
	DASv0Tt2TCXbgR2R76dRZm0Qb5eYuaG7AYxLVvYIxg0CWlL28OE5NJEC04/Y6eZarV1N8sybTPk
	qvNhAokxlRU/oKllgx0A1DFLoIChqy/cipnB1c3aGidrpepG1eSBw65wLl4q0HWn+SI=
X-Google-Smtp-Source: AGHT+IHkVA2I6NFSj5blaOfZv4t4fzCxDiB7LtyWydo89R2I9dDAucxrBrbToVE15MOOLuQ46G17dQ==
X-Received: by 2002:a05:6a20:2583:b0:1f5:8eb1:d5d2 with SMTP id adf61e73a8af0-1fea2d3f6ddmr5627422637.13.1743063529021;
        Thu, 27 Mar 2025 01:18:49 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a27d9a75sm12238384a12.16.2025.03.27.01.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 01:18:48 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	parav@nvidia.com,
	stefanha@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v6 RESEND] virtio-vsock: Add support for multi devices
Date: Thu, 27 Mar 2025 16:18:30 +0800
Message-Id: <20250327081830.2309856-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <jvqe4zwumc5lxpcltzjfgtwi3uppi4hc2wpbgphpb2vbezsg3b@n5hmgt3gwayk>
References: <jvqe4zwumc5lxpcltzjfgtwi3uppi4hc2wpbgphpb2vbezsg3b@n5hmgt3gwayk>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Wed, 26 Mar 2025 at 11:32, Stefano Garzarella <sgarzare@redhat.com> wrote:
> > On Wed, Mar 26, 2025 at 06:00:31PM +0800, Xuewei Niu wrote:
> > >> On Tue, Mar 25, 2025 at 11:19:46AM +0800, Xuewei Niu wrote:
> > >> >> On Mon, Mar 24, 2025 at 02:43:35PM +0800, Xuewei Niu wrote:
> > >> >> >This patch brings a new feature, called "multi devices", to the virtio
> > >> >> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> > >> >> >"device_order" field to the config for the virtio vsock.
> > >> >> >
> > >> >> >== Motivition ==
> > >> >> >
> > >> >> >Vsock is a lightweight and widely used data exchange mechanism between host
> > >> >> >and guest. Currently, the virtio-vsock only supports one device, resulting
> > >> >> >in the inability to enable more than one backend. For instance, two devices
> > >> >> >are required: one to transfer data to the VMM via virtio-vsock,
> > >> >>
> > >> >> Come to think of it, AF_VSOCK defines CID 0 (VMADDR_CID_HYPERVISOR) to
> > >> >> communicate with the hypervisor, but in virtio-vsock we never supported
> > >> >> it. Could this be the use case?
> > >> >>
> > >> >> We could in this way add a new feature for those devices that
> > >> >> communicate only with the VMM, where the CID of the VM is quite useless.
> > >> >> So instead of having multiple CIDs per VM, we could continue to have a
> > >> >> single CID, but the transport could support 2 devices, one to
> > >> >> communicate with the VMM (CID = 0) and one to communicate with the host
> > >> >> apps (CID = 2).
> > >> >>
> > >> >> Maybe this is orthogonal to this proposal, though, because it might
> > >> >> still make sense to have multiple vsock devices, even though it's not
> > >> >> very clear to me.
> > >> >
> > >> >In terms of the current situation, two devices are enough.
> > >> >
> > >> >We are the team of Kata Containers, so we are focusing on cloud-native
> > >> >computing. What I mentioned below might be beyond the scope of the virtio
> > >> >spec, just for your reference.
> > >> >
> > >> >The background is that the architecture of proxy mesh has been evolved over
> > >> >the past few years: from per-pod to per-host (e.g. Istio Ambient Mesh[1]).
> > >> >
> > >> >Thanks to the TSI[2] and vhost-user protocol, network packets can bypass
> > >> >both host and guest network stacks. It is possible to establish a fast path
> > >> >between the pod and the proxy.
> > >> >
> > >> >When we have multiple networks, it is intuitive to have multiple NICs. So
> > >> >does vsock.
> > >>
> > >> Be careful though, we don't want to complicate vsock to become like a
> > >> NIC.
> > >>
> > >> >
> > >> >When multiple networks are availble, it means that it is possible to have
> > >> >multiple proxies(i.e. user processes). In this case, two devices are not
> > >> >enough. This feature makes vsock more flexible and scalable.
> > >>
> > >> This is a good point, but I really don't understand why a VM should have
> > >> multiple CIDs assigned.
> > >
> > >I think priority is not the biggest issue here. So let us focus on how to
> > >route the connection to the right device among more than two devices.
> >
> > That's why I was recommending a different approach. IMO the user should
> > not do this, but that should be transparent, hidden in the driver.
> >
> > By supporting VMADDR_CID_HYPERVISOR, we know very well if a packet is to
> > be sent to the VMM, then we have to use the device that supports it.
> > Whereas if the user connects to VMADDR_CID_HOST we have to use the other
> > device.
> >
> > The user doesn't have to do anything, only use the right destination CID
> > if it wants to talk to the VMM or another host process.
> 
> Obviously, if we want to support more than 2 devices, we need this
> that you are proposing. But IMO we need also to support
> VMADDR_CID_HYPERVISOR, and we should prevent the user from doing
> bind() on a random CID if one of the two devices only talks to the
> VMM.

I agree with supporting `VMADDR_CID_HYPERVISOR` for virtio-vsock. I can
work on this later.

> Because, again, how does the user know which CID to bind?

Nice catch! I am trying to give a solution for this issue regarding the
scenario of more than two devices.

Let users access the `device_order` and the `guest_cid` field. Host user
program and guest user program can make an advance agreement. For example,
the first device (whose `device_order` is smallest) is used to communicate
with host process 1, the second device is used to host process 2, and so
on.

The guest user program want to direct the message to host process 2, then
the things would be:

1. Guest user program gets the second device's `guest_cid`.
2. Guest user program binds to the CID.

This could be worked because the `device_order` is a VM-level
configuration. (On the contrary, the `guest_cid` is a host-level
configuration).

If people don't need this feature (use 1 or 2 devices only), they can use
vsock as the simple way. Otherwise, people should accept the more
complicated way.

WDYT?

Thanks,
Xuewei

> >
> > >
> > >Our solution uses CID as device identification. From the users'
> > >perspective, they can direct the connection to the appropriate device by
> > >specifying a CID in either the `connect` or `bind` syscall.
> >
> > How does the user know which device/CID to bind if it wants to talk with
> > the VMM or with the application?
> >
> > >
> > >Assigning one CID to a VM looks good to me. But I am not sure how to
> > >distinguish the devices. For example, should we expose a ioctl or a
> > >sockopt?
> >
> > Nope, just simply use the right destination CID in the connect()
> > (VMADDR_CID_HYPERVISOR or VMADDR_CID_HOST), without doing any bind().
> >
> > For receiving, the user can check the source CID after connection and
> > decide to discard connections from VMADDR_CID_HYPERVISOR or
> > VMADDR_CID_HOST depending of the service.
> >
> > Thanks,
> > Stefano
