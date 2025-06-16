Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9546A20C497
	for <virtio-comment@lists.linux.dev>; Mon, 16 Jun 2025 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750062565; cv=none; b=hx4ZP+FbdLXXh+XCeFe61MWrzXzre/gjN+1B758CBUAHURmZH5gA5nQ1Okfe7dVy0SUUZuP8GpbZXryCQ6QshTisO8FH+afRwesyGOuDEt5XGOmMyioLvDkEAkXLTcbAHAAopYd0PI8mQiieUKfAhlVlvhqhmtHOpwQZ4DAt644=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750062565; c=relaxed/simple;
	bh=fAlAitdyIzsNWlcmcd30HN6zGBRp96lAb2NOSSaUqxg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KbniEZZQFzRui2NiKI8SQOt7JDTPr4ep3EhyEBjYr/gcXk+EjcX7gx5eKIigmcpsN5T+DAOe32C2Cl3h1tOxR4/SAqzvJWg65fD+/+3woAfsK9VxnTorWLqV6uDdBSw4bOGQ8Yx1ThNICwDq9Q+bHMzWgcFBWxA8h75IrenFD2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQ0VWm43; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQ0VWm43"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7481600130eso4629331b3a.3
        for <virtio-comment@lists.linux.dev>; Mon, 16 Jun 2025 01:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750062563; x=1750667363; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bws67o0sm9jMMoQVDP3WxfolC7hHzejftAkz2NZs4So=;
        b=EQ0VWm43Yp/8rXKWimQugp3MUB+cPSJqGmEa7SapJZVyE82vOR3JRMn5H2Qfefhl4j
         dJa9tlV/ERm/g2ir21k0c/hhvkwccPt27/Czj5fTjFbd0rDX1WcLUy3fJkVcmZbL9Sxg
         Y1v8Y1/bE1QXlI6BY5EKUPEisheb01CndOvYpnH6w/XykE4TmZnzCOsKBBVnpwb40mn2
         GM2skFdF+fWa1h0DBnIgG6wJ7pibrdH0uuft/ZeVo1o8lumyN+3vNTtAsel9sFlsLw8f
         lwmUubWJTg8v1JoCtZV254nVDjGK+xVl1DD4ecflYkGOBz22o4ZF1BEZHEQo+R4hnhOE
         lW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750062563; x=1750667363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bws67o0sm9jMMoQVDP3WxfolC7hHzejftAkz2NZs4So=;
        b=nUimiR7DDP1Es3LHlRN2l1woxj4Ons1Rjy/g7Sa7sVhHw+/hIBfnJfQ8ldl4Emi3fm
         vgXUWlXcKF/iRDBw+DppkE7wYGOMHlhh4cIcuan5GbPxC0DV3eqIPTV0VY1VBYw+Lp0p
         LHHgnLlLVFLUKaR6/VjHSfMQI9ixRsrekPw6brhjve+DGie9pbbcZVrR5zc7u8gexnIF
         /dsqxbRf4tKtAosbeoq6sNrr6nywg6KEWCqehTw5Lu3XJZaRfGj4Wq7u4Dom2uC6uGqQ
         ++wQTIhaguuh7cq+poXbOdfOIcl0vgg2xGQUhYFPu7pxC7seZEfFWo2xVMsuhXzIB1i3
         HSgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmBBl6WGWwnjg1Ux8T+LPASZNNiO6WJtTERPG15YTkDFMxRe1EACk5pX25jpyFZq38WX5ZUF7myctuPzjy6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk9vrTb9Z9vz98USsIaiD92YQZXfPcWj/jFUGKhHxCzFSd8bUJ
	r0LQzXCSUufkbvcTTglSqZRJ0LFlFywj06Z0kYKpxrLVQWIjyHkfUEvmPBMI2UFCryhe5w==
X-Gm-Gg: ASbGncsOPQKhU60uQU3vvQ135mbVANccGeJIsYbRxJBLoSdCT8Mme7Y+LuGJW6OgYvj
	LddbclvF4DbYXZws/ylfpDt5jBdrKQXo5WiQqZRDcwxpiAedqwyDvtyfVWIS1mYcCGu/w/XAVyw
	98VFYBAIr2MoyLh1jLHUmcA313iM4h+t8OyhU2ezeowLu0bu8CzoDPZyp+TI2MXRKJMwX/YFZWz
	S8ntc/Gp38lJrIYfJcf3WYd41/9grmzWXFtusY5aR6ZAXw4YR40/dLqv3w5mGpA19Mhd0T0y6MN
	6PHmAegZteC5tAmcjd2ZxjJUB/E864w9617npRhH+ib0GX6DItNjZ3VovwJhCKY23Z9RbLmgo83
	XjRTfj3Ad
X-Google-Smtp-Source: AGHT+IHoL0hHAmPQbthwmFxVu8edxhNHgt8tsx2JNQMTy9EnYTtC8VRQHiERbMl+IIDf5gUfwoyIEQ==
X-Received: by 2002:a05:6a00:ac4:b0:747:aa79:e2f5 with SMTP id d2e1a72fcca58-7489cdb448bmr11377891b3a.0.1750062562739;
        Mon, 16 Jun 2025 01:29:22 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890083fafsm6204552b3a.76.2025.06.16.01.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 01:29:22 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: jasowang@redhat.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	parav@nvidia.com,
	sgarzare@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Date: Mon, 16 Jun 2025 16:29:14 +0800
Message-Id: <20250616082914.1159976-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CACGkMEuV41G8S2gt=HozCK5GR6fv-QSChscR5TsG2HLO3H5FUQ@mail.gmail.com>
References: <CACGkMEuV41G8S2gt=HozCK5GR6fv-QSChscR5TsG2HLO3H5FUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Fri, Jun 13, 2025 at 4:46 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> >
> > > On Fri, 13 Jun 2025 at 06:57, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > >
> > > > > On Sat, Apr 12, 2025 at 10:39 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > >
> > > > > > This patch brings a new feature, called "multi devices", to the virtio
> > > > > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> > > > > > "device_order" field to the config for the virtio vsock.
> > > > > >
> > > > > > == Motivition ==
> > > > > >
> > > > > > Vsock is a lightweight and widely used data exchange mechanism between host
> > > > > > and guest. Currently, the virtio-vsock only supports one device, resulting
> > > > > > in the inability to enable more than one backend.
> > > > >
> > > > > I wonder which part of the spec forbids more than one device.
> > > >
> > > > No. The spec, however, is designed for a single device, and lacks some
> > > > specifications for multiple devices.
> > > >
> > > > For example, we should have a mechanism to select a device from all to
> > > > communicate with a peer.
> 
> I wonder if this is a:
> 
> 1) mechanism that needs to be mandated by the device

Yes.

> 2) a policy that is allowed to be tweaked by the user as TCP/IP did

Not allowed in the current version.

> (Note anyhow the driver can override what the device suggests...)

> > > > This patch introduces a new feature bit "VIRTIO_VSOCK_F_MULTI_DEVICES", and
> > > > involves some modifications to the config space, device & driver norms.
> > >
> > > Maybe we should think a better name to avoid confusion, like "F_DEVICE_ORDER".
> > > I'm not good at name, so if others are better suggestion, they are welcome.
> >
> > Naming things is tough for me, too. I'm good with "F_DEVICE_ORDER", and
> > will update it in the next. I am still open to other suggestions.
> 
> If we agree on the idea, I agree we need a better name.

Okay. I'll try to give a new name in the next version.

Thanks,
Xuewei

> Thanks
> 
> >
> > Thanks,
> > Xuewei
> >
> > > >
> > > > > > For instance, two devices
> > > > > > are required: one to transfer data to the VMM via virtio-vsock, and another
> > > > > > to a user process via vhost-user-vsock.
> > > > > >
> > > > > > Apart from that, a side gain is that theoretically the performance might be
> > > > > > improved since each device has its own queue. But it varies depending on
> > > > > > the implementation.
> > > > >
> > > > > It could implement multiqueue anyhow.
> > > > >
> > > > > Thanks
> > > >
> > > > Yes, indeed. As we discussed before, I marked this as a side gain. And
> > > > @Stefano said that the community has a plan to implement multiqueue for
> > > > vsock.
> > >
> > > I'm not sure there is a plan, but yeah, we should do it some day.
> > > As I mention in the previous email, I'd remove any reference to performance.
> > >
> > > I'd just talk about a mechanism to select a default out device, when
> > > the source socket is not bound to any address, like a default gateway.
> > >
> > > Thanks,
> > > Stefano
> > >
> > > > The foundational goal of this patch is to enable vsock to support
> > > > multiple backends.
> > > >
> > > > Thanks,
> > > > Xuewei
> >
