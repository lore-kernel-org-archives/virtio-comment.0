Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F75EC5
	for <virtio-comment@lists.linux.dev>; Tue, 24 Jun 2025 03:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750736059; cv=none; b=BRjOUhu6WTCJDfwG2wXetZRi2oAga5ItHasHRbusdvinsSrNjQ0CEB0fDa+2w7SwTKzAYlAoY4BUWw9iS4DpUqzZ35jpyyYDQn1zZvXBb6LlbQUpqoPb8Q1IFu96NEhNk0MjV+KISmgfusV91xrpkmmoW46nK23F9JyxIPTvFgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750736059; c=relaxed/simple;
	bh=QeJWquXn8MLyQrCfJaa74YbV6u/+dV8UEiKHgk9oF+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u4f+NRKXKcqRA8liccf9aq7/dJXwtTLVUs/hMWwMrAjMw/xiLtsCsGHzUGhoGBRGHNccIpX4bwKkSpxA7Ck7ybrltjzwsHC3Nps5U8xcMXysWhHJwMLeqA8SBoH9fjHnu9K908QE9XH2wd612gVYHJVbxewSjBUYuYeMgpu640w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRPigsu7; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRPigsu7"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b31f0ef5f7aso2463331a12.3
        for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 20:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750736056; x=1751340856; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhBFaqrZx/WRhwyRO+YC+ehGm9+oRD9lmHTXD/51aas=;
        b=VRPigsu7NhComM1+rR3EjQa2d/wiwRzZqbaQ5HVqv4pQkojpZ4D0QjzUV1ecEwTlr0
         6FuCujOhVVUbUeQKOLabzu5S8JBCJP+jDf0VnrV9MOONMqortUR3AU7axliS9AhJSBfX
         rEbQ2VukDC9IFOXxG1ldhnQDOWkskHhp67iXcFYqaMMIGBazecE390juLz7BjPc6bKuC
         CYUnhkSoRjZtK0TD6QsPjajU3+TYV4/b7xI8rgAqmP6NUlD/Z1N6ca4nMXUGip/J5vvf
         iV9rlPudlLJ7hJfOrhGFaxQfOg90vivvfKZ+NZoKRA22QL+BmDPbo339fOPOFDqZKGKA
         bT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750736056; x=1751340856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhBFaqrZx/WRhwyRO+YC+ehGm9+oRD9lmHTXD/51aas=;
        b=MQI3l2xtXKnJ3zqolwmWp3dmcokSUbZimqXEjorFiSSjQyxDFwUSLXObOaZ6gDLXgq
         IHU6HdN6z6Fd3ZijXzEipc6xld4eMSgALuxXB6MtpT5haWBtIVW8ceS8BslMlY9xHdUV
         wDz88fwzzClQ7qXaOvgwWtnjz4Xd4jU7AcO/Rt4iG81TMMMIuCADwO+A/ajyixxrWJ+T
         KSrG5DCFbtEayIBjFxo5Xm5ucbQdzyfG0IrQ0a46Nidnr5wO2g/5UY8jG7UdW2L+Xl9y
         YJeKJlCaTI6XIYvlJNQSwAKnqg3PMUN1tx/lRDmV0oIxUH/WvAPcF0wC8TWIkk8UB3xo
         rNpA==
X-Forwarded-Encrypted: i=1; AJvYcCXaVk+PmPOblAfOUkgXojOc3q6YcUgNYoNT/pwX/L+L43a83NeekS7DXGf7CD4G81G2pxNkiU+hDgLa7tzVDw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzkIVj0vlu8EJdwnKuyl6+Cia1UqieeVfOaq2izjGpVPR1XbK7e
	9eZROj2ECXvCPyTWERJAa2soU4PnTvSeLufYkU0rUWcqW6Y385ncuLaj
X-Gm-Gg: ASbGncuOQTBwBtac7FUmbt5uO1zQ4pWqRmHccL1IvZ5d/ku97aOr81T2ozysfX6x32O
	mBMpHXo84Y8+xBN2f7/YnY0w8lZf6ONFwWxOsUHSR7CIzP+9EqJTFSyoYinCbjPLx7sEd0CIr/M
	n+rrXEPq7Q4E4qPmPrcwbvkK54vnOqHaoPkT4sVuRp6PB0E1zZNqe0ebXMNjXdYWa/5RXjwdSXT
	3d7EAz2tIONqosOQQ5sJTr+rBk27Tuq0/AiMp+I2Usb66DTBrPYARmUK+l/tG6JZviInU3bPIoc
	DjDMwCJ+Cv0cZ2zlFaOv+OnM/iMCae5pZhKn4LQwOzoEWvFYwsrHa4ObvD3VYngYYpRjKGrkltm
	adIRk+aBM
X-Google-Smtp-Source: AGHT+IGXwHK7ikMMoPe8keBtuF9Lj2e6CvOPpbW15HJgCsDfy+V4ELY4NUNz+ahjM4Y0UaIPOSFwmw==
X-Received: by 2002:a17:90b:384e:b0:311:e9ac:f5ce with SMTP id 98e67ed59e1d1-3159d8c1504mr20290716a91.21.1750736056060;
        Mon, 23 Jun 2025 20:34:16 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159e07d195sm9140584a91.44.2025.06.23.20.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 20:34:15 -0700 (PDT)
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
Date: Tue, 24 Jun 2025 11:33:32 +0800
Message-Id: <20250624033332.1686240-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CACGkMEscxnpdcFRkoLgow8qUKoKUSJM+j9Q1LG8HR5-aVVqxeg@mail.gmail.com>
References: <CACGkMEscxnpdcFRkoLgow8qUKoKUSJM+j9Q1LG8HR5-aVVqxeg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Mon, Jun 23, 2025 at 5:47 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> >
> > > On Thu, Jun 19, 2025 at 10:42 AM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > >
> > > > > On Wed, Jun 18, 2025 at 5:51 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > >
> > > > > > > On Wed, Jun 18, 2025 at 1:40 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > >
> > > > > > > > > On Wed, Jun 18, 2025 at 10:47 AM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > > On Tue, Jun 17, 2025 at 3:46 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > Resend, because it isn’t listed in the mailing list due to my mistake.
> > > > > > > > > > > >
> > > > > > > > > > > > > On Mon, Jun 16, 2025 at 4:38 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On Mon, 16 Jun 2025 at 10:29, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > On Fri, Jun 13, 2025 at 4:46 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > On Fri, 13 Jun 2025 at 06:57, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > On Sat, Apr 12, 2025 at 10:39 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > > This patch brings a new feature, called "multi devices", to the virtio
> > > > > > > > > > > > > > > > > > > > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> > > > > > > > > > > > > > > > > > > > > "device_order" field to the config for the virtio vsock.
> > > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > > == Motivition ==
> > > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > > Vsock is a lightweight and widely used data exchange mechanism between host
> > > > > > > > > > > > > > > > > > > > > and guest. Currently, the virtio-vsock only supports one device, resulting
> > > > > > > > > > > > > > > > > > > > > in the inability to enable more than one backend.
> > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > I wonder which part of the spec forbids more than one device.
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > No. The spec, however, is designed for a single device, and lacks some
> > > > > > > > > > > > > > > > > > > specifications for multiple devices.
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > For example, we should have a mechanism to select a device from all to
> > > > > > > > > > > > > > > > > > > communicate with a peer.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > I wonder if this is a:
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > 1) mechanism that needs to be mandated by the device
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Yes.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > 2) a policy that is allowed to be tweaked by the user as TCP/IP did
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Not allowed in the current version.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > (Note anyhow the driver can override what the device suggests...)
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I think we should follow what we described in the spec:
> > > > > > > > > > > > > > "The virtio socket device is a zero-configuration socket communications device."
> > > > > > > > > > > > >
> > > > > > > > > > > > > We probably need to define "configuration" first.
> > > > > > > > > > > > >
> > > > > > > > > > > > > For example, if it means zero configuration from the user, it does not
> > > > > > > > > > > > > conflict with 2), the driver can use its own algorithm to elect a
> > > > > > > > > > > > > "default" device.
> > > > > > > > > > > >
> > > > > > > > > > > > IMHO, it can be done, but it is not the current design.
> > > > > > > > > > >
> > > > > > > > > > > Well, you need at least explain the advantages or why you choose to do this.
> > > > > > > > > >
> > > > > > > > > > I listed in the previous message. Maybe it is not clear enough. I'll try to
> > > > > > > > > > explain it again.
> > > > > > > > > >
> > > > > > > > > > I think people should pick up the device by a `bind()` call, which takes a
> > > > > > > > > > CID as an argument.
> > > > > > > > > >
> > > > > > > > > > Generally, the device is picked up by the source CID, which is achieved
> > > > > > > > > > through a `bind()` call.
> > > > > > > > > >
> > > > > > > > > > The default device, which is equivalent to the current single device, is
> > > > > > > > > > used to be compatible with the existing applications.
> > > > > > > > > >
> > > > > > > > > > Apart from that, the default device is used to communicate with hypervisor
> > > > > > > > > > for some init works, such as gathering information about other vsock
> > > > > > > > > > devices.
> > > > > > > > > >
> > > > > > > > > > To summarize, users must do `bind()` call explicitly to select the desired
> > > > > > > > > > device for non-HV-VM communications.
> > > > > > > > >
> > > > > > > > > So if I understand correctly you need a way to select the default when
> > > > > > > > > bind() is not called?
> > > > > > > >
> > > > > > > > Yes.
> > > > > > > >
> > > > > > > > > > > > I prefer to set the default device for VM-HV communication to do some init
> > > > > > > > > > > > work. I don't think people have a strong need for this.
> > > > > > > > > > > >
> > > > > > > > > > > > > Another perspective, making decisions in guests may be even more
> > > > > > > > > > > > > helpful for the case where the device is not trusted
> > > > > > > > > > > >
> > > > > > > > > > > > How does the guest realize the vsock device is not trusted?
> > > > > > > > > > >
> > > > > > > > > > > There're various ways to build trust (for example device attestation)
> > > > > > > > > > > and more might come in the future.
> > > > > > > > > > >
> > > > > > > > > > > > The guest only
> > > > > > > > > > > > knows the information from its config space, which is provided by the host.
> > > > > > > > > > >
> > > > > > > > > > > The way to build trust is probably beyond the scope of virtio, but it
> > > > > > > > > > > is something we need to consider.
> > > > > > > > > >
> > > > > > > > > > Agree with you. If it comes in the future, I think the driver should have
> > > > > > > > > > the ability to make decisions.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > Actually, I meant the way to build trust via virtio is something that
> > > > > > > > > needs to be considered. But now we have other ways to build trust.
> > > > > > > > > That would result a situlation:
> > > > > > > > >
> > > > > > > > > 1) "default" vsock device is not trusted but other might
> > > > > > > >
> > > > > > > > I think this topic might be beyond the scope of this patch.
> > > > > > > >
> > > > > > > > With the current version, there is only one device supported, which can be
> > > > > > > > considered as the "default".  We don't have a mechanism to say "we don't
> > > > > > > > trust you", right?
> > > > > > >
> > > > > > > No. I meant we don't have it in the virtio core but we already have it
> > > > > > > in other layers (for example the transport layer).
> > > > > >
> > > > > > Are you referring to virito-vsock transport layer?
> > > > >
> > > > > Yes, for example the PCI layer.
> > > > >
> > > > > >
> > > > > > > > That is, it is assumed that we trust the device provided
> > > > > > > > by the hypervisor.
> > > > > > > >
> > > > > > > > This patch is for multiple devices support, based on the same assumption. I
> > > > > > > > think trust is a good point to consider, but perhaps we have to address it
> > > > > > > > in the follow-up patches.
> > > > > > >
> > > > > > > My point is not about how to build trust, it's about letting the
> > > > > > > driver decide by itself in some cases.
> > > > > > >
> > > > > > > A better way might be something like:
> > > > > > >
> > > > > > > "The device_order is a hint for the driver to select a default vsock
> > > > > > > device. Device MAY choose ...."
> > > > > >
> > > > > > Okay, I'll do that.
> > > > > >
> > > > > > > >
> > > > > > > > > or
> > > > > > > > >
> > > > > > > > > 2) two device claims that they are all "default"
> > > > > > > > >
> > > > > > > > > This means anyhow we need a decision from the driver side so the
> > > > > > > > > device side order seems to be useless here.
> > > > > > > >
> > > > > > > > There is only one default device. The device with the lowest device_order
> > > > > > > > is considered the default. It is not allowed to have the same device_order.
> > > > > > >
> > > > > > > Who can forbid two same device_order? Note that in various security
> > > > > > > models, hypervisors are not trusted at all.
> > > > > >
> > > > > > The driver does. Indeed, the driver is able to deny devices if they violate
> > > > > > the spec.
> > > > >
> > > > > Yes, that's the point, anyhow driver need to do the decision.
> > > > >
> > > > > >
> > > > > > > > > > > > > > So, IMO the guest (driver) should not be allowed to change anything.
> > > > > > > > > > > > > > E.g. Right now it's not allowed to change the CID assigned by the host (device).
> > > > > > > > > > > > >
> > > > > > > > > > > > > A dumb question when having two cids (cid1 and cid2) in the same
> > > > > > > > > > > > > guest, what happens if src=cid1 and dst=cid2?
> > > > > > > > > > > >
> > > > > > > > > > > > The packets will be directed to another application, if any, on the same guest.
> > > > > > > > > > >
> > > > > > > > > > > Ok, so in your example, vhost-user-vsock should route those packets
> > > > > > > > > > > back to kernel vsock?
> > > > > > > > > >
> > > > > > > > > > It depends. Two cases are possible:
> > > > > > > > > >
> > > > > > > > > > 1. dev0(cid1) and dev1(cid2) are from the same type of backend, e.g.
> > > > > > > > > > vhost-vsock, so the packets will be routed back as you described.
> > > > > > > > > > 2. dev0(cid1) from vhost-user-vsock, and dev1(cid2) from vhost-vsock, the
> > > > > > > > > > packets will be dropped if vhost-user-vsock device can't find a device
> > > > > > > > > > whose cid is cid2.
> > > > > > > > >
> > > > > > > > > Well, this means the behavior depends on the implementation which is not good.
> > > > > > > >
> > > > > > > > No, it is not. It depends on whether the device can find a proper
> > > > > > > > target device based on the dst_cid.
> > > > > > >
> > > > > > > This sounds really weird, two cids belong to the same guest. So guests
> > > > > > > should expect that the two vsock devic can talk to each other?
> > > > > >
> > > > > > Yes, a little bit complicated.
> > > > > >
> > > > > > Two constraints should be applied:
> > > > > >
> > > > > > 1. No CID conflicts within the driver;
> > > > > > 2. No CID conflicts within the address space.
> > > > > >
> > > > > > Here is a diagram to illustrate the situation where it does not violate the
> > > > > > constraints:
> > > > > >
> > > > > >  ┌─ kernel─(as0)────────────────────────────────────────────────────┐
> > > > > >  │   ┌───────────┐                      ┌───────────┐  ┌───────────┐│
> > > > > >  │   │ dev0(cid0)│                      │ dev2(cid1)│  │ dev3(cid2)││
> > > > > >  │   └───┬───────┘                      └───┬───────┘  └────────┬──┘│
> > > > > >  └───────┼──────────────────────────────────┼───────────────────┼───┘
> > > > > >   ┌──────┼───────────────────────┐   ┌──────┼───────────────────┼───┐
> > > > > >   │      │  ┌───────────┐        │   │      │  ┌───────────┐    │   │
> > > > > >   │      └──► dev0(cid0)│        │   │      └──► dev2(cid1)│    │   │
> > > > > >   │         └───────────┘        │   │         └───────────┘    │   │
> > > > > >   │         ┌───────────┐        │   │         ┌───────────┐    │   │
> > > > > >   │      ┌──► dev1(cid1)│        │   │         │ dev3(cid2)◄────┘   │
> > > > > >   │      │  └───────────┘     VM0│   │         └───────────┘     VM1│
> > > > > >   └──────┼───────────────────────┘   └──────────────────────────────┘
> > > > > >    vhost-user-vsock
> > > > > > ┌────────┼──────────────────────────────────────────────────────────┐
> > > > > > │   ┌────┼──────┐                                                   │
> > > > > > │   │ dev1(cid1)│                                                   │
> > > > > > │   └───────────┘                                                   │
> > > > > > └─userapp─(as1)─────────────────────────────────────────────────────┘
> > > > > >
> > > > > > - VM0
> > > > > >     - dev0
> > > > > >         - dst_cid = 2 (well-known cid): connect to host;
> > > > > >         - dst_cid = cid1: connect to dev2 (they are in the same as0);
> > > > > >         - dst_cid = cid2: connect to dev3;
> > > > > >     - dev1
> > > > > >         - dst_cid = 2 (well-known cid): connect to userapp;
> > > > > >         - dst_cid = cid0: failure (no cid0 is available in as1, even though
> > > > > >         cid1 is available in the VM0);
> > > > > >         - dst_cid = cid1: connect to dev0;
> > > > > > - VM1
> > > > > >     - dev2
> > > > > >         - dst_cid = 2 (well-known cid): connect to host;
> > > > > >         - dst_cid = cid0: connect to dev0;
> > > > > >         - dst_cid = cid2: connect to dev3;
> > > > > >     - dev3: skip the same as dev2.
> > > > > >
> > > > > > So back to your question, my answer is that it depends on the address
> > > > > > space. Hope it could be helpful.
> > > > >
> > > > > This brings an interesting question, for example if vm0 tries to
> > > > > connect to vm1, how does it know which device it needs to use (lacking
> > > > > the concept like switch/route/address announcing etc...)?
> > > >
> > > > The HV should maintain a table for that. The guest things firstly
> > > > communicate with the HV, through the default device, to know which device
> > > > to use.
> > >
> > > It's still not clear to me how things work. For example, we had a
> > > guest1 with two cid 4 ("default"),5 another guest2 with one cid 6. You
> > > meant guest1 needs to ask the host to know about which device is
> > > connected to 6? Or actually any device in guest1 can be used to
> > > connected to guest2?
> >
> > I think it is application-level, like micro services? Here are some
> > diagrams to illustrate the process:
> >
> > Step1: app0 asks the host: "I want to connect to app1 inside VM1";
> > Step2: host replies: "Please use source cid=5, and destination cid=6"
> 
> This sounds like arp anyhow.

Not really.

As Stefano mentioned in [1][2], vsock is designed for p2p communication. I
am just quoting what he said:

"Just a note, AF_VSOCK is suppose to be very similar to AF_UNIX. It's a 
point ot point connection, we don't have any transport layer like TCP.
What we call "transport" in AF_VSOCK world, is usually the driver/device 
usend to send data (e.g. vmci, virtio, vhost, hyperv)."

"Just a reminder, vsock is not a network device, is more a P2P device where
we want to keep the configuration in the guest as simpler as possible (we
don't want to run ARP, DHCP, etc.)."

1: https://lore.kernel.org/virtio-comment/ntpwwmwwaow4lfdjubgdwsvvpzpkuc52iz3vjztbx4iphvpnem@gmd2bsqckonm/
2: https://lore.kernel.org/virtio-comment/ncciiv3udhy6mylzobtt5jnp3xwthtfvuwonb7i5c5hkpcyfc2@utxcie3jxof2/

> > +────────+         +───────────────────────────────+    +──────────────────────────────+
> > │  host  │         │+───────────────+          VM0 │    │                         VM1  │
> > │service │◀─step1──┤│dev0(cid=4,def)│──┐           │    │                              │
> > +────────+         │+───────────────+  │           │    │                              │
> >                    │+───────────────+  │  +───────+│    │+───────────────+     +──────+│
> >                    ││  dev1(cid=5)  │  └──│ app0  ││    ││dev1(cid=6,def)│     │ app1 ││
> >                    │+───────────────+     +───────+│    │+───────────────+     +──────+│
> >                    +───────────────────────────────+    +──────────────────────────────+
> >
> > Step3: app0 binds (5, -1), and connects to (6, {PORT}) to establish a
> > connection.
> >
> > +────────+         +───────────────────────────────+    +──────────────────────────────+
> > │  host  │         │+───────────────+          VM0 │    │                         VM1  │
> > │service │         ││dev0(cid=4,def)│              │    │                              │
> > +────────+         │+───────────────+              │    │                              │
> >                    │+──────────────bind(5, -1)────+│    │+───────────────+     +──────+│
> >                  ┌─┤│  dev1(cid=5)  │◀────│ app0  ││    ││dev1(cid=6,def)│─────▶ app1 ││
> >                  │ │+───────────────+     +───────+│    │+───────────────+     +──────+│
> >                  │ +───────────────────────────────+    +────────▲─────────────────────+
> >                  │                                               │
> >                  └───────────────connect(6,PORT)─────────────────┘
> >
> > This is a little bit complicated, but it is dynamic. Another way is to
> > assign a fixed CID for app1,
> 
> Who did the assignment here?

Discovery must happen through an out-of-band mechanism, which is not
built-in for vsock, for example, the configuration files.

Even though we have a single device, we have to discovery the CID for
sibling. This feature is aimed at adding more devices, the mechanism
remains the same.

> > so app0 can always connect to it without
> > needing to ask for the host service.
> 
> Basically, I wonder if the above needs to be part of the spec or not
> and why. If not, we should not bother here.

Yes, I think it is not part of the spec as I mentioned above.

Thanks,
Xuewei

> Thanks
> 
> >
> > Thanks,
> > Xuewei
> >
> > > Thanks
> > >
> > > >
> > > > Thanks,
> > > > Xuewei
> > > >
> >
