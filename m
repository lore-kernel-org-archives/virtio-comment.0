Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFED217F34
	for <virtio-comment@lists.linux.dev>; Wed, 18 Jun 2025 09:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240313; cv=none; b=OA/SdUr+opp5/URGKRGZZLur1o04tH2ECpvEwFolDcwhArTnrRQiBG1bwQNSivpVD5BkYdg6XSGacuUAYdWtqETORsrxgXjCKa8clAtHntpUFWLCTDfgjTJwVqrus03L7WuWqtdPOET7csYJIdR4GqmbMbERUN0BXjOKG8ZlKjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240313; c=relaxed/simple;
	bh=7YHALXB/zx+oCUf0ecp0tqkcPG6QxNjYgq6ZuQjEK/4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m9G8F+cxe0G2+xDmEqbPvB07bFGerftZ6YWdEteeoHGJ1kMgjYwnmyc2wIT3VjePY7WpRu5sIykHHQs08mItXUEQlvwnar5IXcnoJL1sEtDDJ91a2Q+GhlVELLBc0WDXRZjpATK8Qvhhgyl4oznNgO+S9lqoyImaJcy+ncHRzOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbqETj14; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbqETj14"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235e1d710d8so83488065ad.1
        for <virtio-comment@lists.linux.dev>; Wed, 18 Jun 2025 02:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240311; x=1750845111; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGayYQ8cEYKKdgFSHd1//ZnpGl6nloWxp8NYmouWxbo=;
        b=LbqETj145bJpVAekaNqJtEa+lt8Azpaz9EilMry/sZwrV8Qwa+QHphd0qJk+aceO3P
         n9NROhj0HssWoPA4uMueLmPUBmsMNMOGwUVT+c6rlDKjcrKX0Epmp28LMTA6Tgq8J5wX
         9CcAYs93bXLZIQPK7UY+sd/ew3qHiU9x3AVT5Oqrgeejb01PxjM1YKJN95hpDrfYzWjE
         zG9XDnwe4iSYFCnQndnzTaLmgbKj5cJwDHIoniX389E0rM4um2cDxnugakL/c8IkLxDk
         yTh0NuNNvfkprtUJMomaUNf0zCBIHDs3nreCAAywECjE1tLwNIoV+vVMg5I7TIZI9zfJ
         fZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240311; x=1750845111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGayYQ8cEYKKdgFSHd1//ZnpGl6nloWxp8NYmouWxbo=;
        b=k3Ns9dInffgTLGTpukySGzhGMXoaa2Vjmm6ni555A4hvTEll+8CExf8Apuf+3VqF0m
         R7jx8QrqCNFbhqD/xwrHO0S7IYKAzTT8cyJlfCcvOCqKUN2UbQZ2J+6W6qZ1ZpEK9/in
         DjD3xH/eF/lpg61zFzgph5xyxZOsxhzSWK0/9kSxVf5y4jy55dVSojWTHNLtRcuZ/oVF
         frzAEIxJ9QKKV676nYbfE1xQtjO2hOl++dAQhBO6687VzUKAn2Me6Z/bztsphWqTjPNm
         o409PhRFZFWEWQLn6YKfcTLbFOJp/DGHBsOoIkfi0BNw1wCQ+PdHhbvKVKfvZfiv9dmj
         Y9ZA==
X-Forwarded-Encrypted: i=1; AJvYcCU7OIL6S0E+M0bEPYZjIfehvNsX7G+4MmixE170f4vmmMYnFgaMlYbdjUCKo19p5B9sD8oLTaPbFoDcOVXKvg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXR+owbBXqwbGc4+4QSDA12OskzR20JGIZCJhIbZOPEq78uAI9
	2aNdStzk59GZCmChjlNswOPuyo59HHsPsCBG+cqjc3QDM+yia6dfOmBn
X-Gm-Gg: ASbGncso+3xURfvmHAhLo2dh1j/UTj+/DZw4GMMHad9iY8iUlvoDAVodeHhM20lXzTq
	ut5uhpX8B4V0v27LSyvTcJpoJxzVtrTVqCiEdE9QKj6uF1asa9RMmAPs1R7NsBXeOhHiTl0UPFs
	HPkhtFtb9nT5yS8YwmdDk6xDu7n5al721rK5Bl0kmCclVUNvJ5OW7zzXBi7m8EXaNpVk7GA1Kzh
	kULM/cQH+YkskPGXytee8HwgCH0sJGd3iGTSl8ZoARnnC7UnUDTI1sT4KvmKzFXOznXH1YPiMrq
	slV/9Ilpp/8avuzmKCLwwLNJaY7nZQEbOKhq95/axFzfzYrFeh1gFQR9kX4iSw51vqCfl7kthEo
	hiG8iasya
X-Google-Smtp-Source: AGHT+IEdhDUfsSZ99sTS5VbGgJLNgSSAXirNrrhEr+w0Rafv+9ZPH0CMRdCcfIDMnBlQZ6hgY4euEw==
X-Received: by 2002:a17:902:d503:b0:236:363e:55d with SMTP id d9443c01a7336-2366b3de5f0mr305379885ad.28.1750240310916;
        Wed, 18 Jun 2025 02:51:50 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de782e2sm95112695ad.103.2025.06.18.02.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:51:50 -0700 (PDT)
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
Date: Wed, 18 Jun 2025 17:51:39 +0800
Message-Id: <20250618095139.1412138-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CACGkMEtRKJyy+ceQugN4aUyTUBiK6-2sUpFfYssRrno_vK_xyg@mail.gmail.com>
References: <CACGkMEtRKJyy+ceQugN4aUyTUBiK6-2sUpFfYssRrno_vK_xyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Wed, Jun 18, 2025 at 1:40 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> >
> > > On Wed, Jun 18, 2025 at 10:47 AM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > >
> > > > > On Tue, Jun 17, 2025 at 3:46 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > >
> > > > > > Resend, because it isn’t listed in the mailing list due to my mistake.
> > > > > >
> > > > > > > On Mon, Jun 16, 2025 at 4:38 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Mon, 16 Jun 2025 at 10:29, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > > On Fri, Jun 13, 2025 at 4:46 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > > On Fri, 13 Jun 2025 at 06:57, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > > On Sat, Apr 12, 2025 at 10:39 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > This patch brings a new feature, called "multi devices", to the virtio
> > > > > > > > > > > > > > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> > > > > > > > > > > > > > > "device_order" field to the config for the virtio vsock.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > == Motivition ==
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Vsock is a lightweight and widely used data exchange mechanism between host
> > > > > > > > > > > > > > > and guest. Currently, the virtio-vsock only supports one device, resulting
> > > > > > > > > > > > > > > in the inability to enable more than one backend.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I wonder which part of the spec forbids more than one device.
> > > > > > > > > > > > >
> > > > > > > > > > > > > No. The spec, however, is designed for a single device, and lacks some
> > > > > > > > > > > > > specifications for multiple devices.
> > > > > > > > > > > > >
> > > > > > > > > > > > > For example, we should have a mechanism to select a device from all to
> > > > > > > > > > > > > communicate with a peer.
> > > > > > > > > >
> > > > > > > > > > I wonder if this is a:
> > > > > > > > > >
> > > > > > > > > > 1) mechanism that needs to be mandated by the device
> > > > > > > > >
> > > > > > > > > Yes.
> > > > > > > > >
> > > > > > > > > > 2) a policy that is allowed to be tweaked by the user as TCP/IP did
> > > > > > > > >
> > > > > > > > > Not allowed in the current version.
> > > > > > > > >
> > > > > > > > > > (Note anyhow the driver can override what the device suggests...)
> > > > > > > >
> > > > > > > > I think we should follow what we described in the spec:
> > > > > > > > "The virtio socket device is a zero-configuration socket communications device."
> > > > > > >
> > > > > > > We probably need to define "configuration" first.
> > > > > > >
> > > > > > > For example, if it means zero configuration from the user, it does not
> > > > > > > conflict with 2), the driver can use its own algorithm to elect a
> > > > > > > "default" device.
> > > > > >
> > > > > > IMHO, it can be done, but it is not the current design.
> > > > >
> > > > > Well, you need at least explain the advantages or why you choose to do this.
> > > >
> > > > I listed in the previous message. Maybe it is not clear enough. I'll try to
> > > > explain it again.
> > > >
> > > > I think people should pick up the device by a `bind()` call, which takes a
> > > > CID as an argument.
> > > >
> > > > Generally, the device is picked up by the source CID, which is achieved
> > > > through a `bind()` call.
> > > >
> > > > The default device, which is equivalent to the current single device, is
> > > > used to be compatible with the existing applications.
> > > >
> > > > Apart from that, the default device is used to communicate with hypervisor
> > > > for some init works, such as gathering information about other vsock
> > > > devices.
> > > >
> > > > To summarize, users must do `bind()` call explicitly to select the desired
> > > > device for non-HV-VM communications.
> > >
> > > So if I understand correctly you need a way to select the default when
> > > bind() is not called?
> >
> > Yes.
> >
> > > > > > I prefer to set the default device for VM-HV communication to do some init
> > > > > > work. I don't think people have a strong need for this.
> > > > > >
> > > > > > > Another perspective, making decisions in guests may be even more
> > > > > > > helpful for the case where the device is not trusted
> > > > > >
> > > > > > How does the guest realize the vsock device is not trusted?
> > > > >
> > > > > There're various ways to build trust (for example device attestation)
> > > > > and more might come in the future.
> > > > >
> > > > > > The guest only
> > > > > > knows the information from its config space, which is provided by the host.
> > > > >
> > > > > The way to build trust is probably beyond the scope of virtio, but it
> > > > > is something we need to consider.
> > > >
> > > > Agree with you. If it comes in the future, I think the driver should have
> > > > the ability to make decisions.
> > >
> > >
> > > Actually, I meant the way to build trust via virtio is something that
> > > needs to be considered. But now we have other ways to build trust.
> > > That would result a situlation:
> > >
> > > 1) "default" vsock device is not trusted but other might
> >
> > I think this topic might be beyond the scope of this patch.
> >
> > With the current version, there is only one device supported, which can be
> > considered as the "default".  We don't have a mechanism to say "we don't
> > trust you", right?
> 
> No. I meant we don't have it in the virtio core but we already have it
> in other layers (for example the transport layer).

Are you referring to virito-vsock transport layer?
 
> > That is, it is assumed that we trust the device provided
> > by the hypervisor.
> >
> > This patch is for multiple devices support, based on the same assumption. I
> > think trust is a good point to consider, but perhaps we have to address it
> > in the follow-up patches.
> 
> My point is not about how to build trust, it's about letting the
> driver decide by itself in some cases.
> 
> A better way might be something like:
> 
> "The device_order is a hint for the driver to select a default vsock
> device. Device MAY choose ...."

Okay, I'll do that.

> >
> > > or
> > >
> > > 2) two device claims that they are all "default"
> > >
> > > This means anyhow we need a decision from the driver side so the
> > > device side order seems to be useless here.
> >
> > There is only one default device. The device with the lowest device_order
> > is considered the default. It is not allowed to have the same device_order.
> 
> Who can forbid two same device_order? Note that in various security
> models, hypervisors are not trusted at all.

The driver does. Indeed, the driver is able to deny devices if they violate
the spec.

> > > > > > > > So, IMO the guest (driver) should not be allowed to change anything.
> > > > > > > > E.g. Right now it's not allowed to change the CID assigned by the host (device).
> > > > > > >
> > > > > > > A dumb question when having two cids (cid1 and cid2) in the same
> > > > > > > guest, what happens if src=cid1 and dst=cid2?
> > > > > >
> > > > > > The packets will be directed to another application, if any, on the same guest.
> > > > >
> > > > > Ok, so in your example, vhost-user-vsock should route those packets
> > > > > back to kernel vsock?
> > > >
> > > > It depends. Two cases are possible:
> > > >
> > > > 1. dev0(cid1) and dev1(cid2) are from the same type of backend, e.g.
> > > > vhost-vsock, so the packets will be routed back as you described.
> > > > 2. dev0(cid1) from vhost-user-vsock, and dev1(cid2) from vhost-vsock, the
> > > > packets will be dropped if vhost-user-vsock device can't find a device
> > > > whose cid is cid2.
> > >
> > > Well, this means the behavior depends on the implementation which is not good.
> >
> > No, it is not. It depends on whether the device can find a proper
> > target device based on the dst_cid.
> 
> This sounds really weird, two cids belong to the same guest. So guests
> should expect that the two vsock devic can talk to each other?

Yes, a little bit complicated.

Two constraints should be applied:

1. No CID conflicts within the driver;
2. No CID conflicts within the address space.

Here is a diagram to illustrate the situation where it does not violate the
constraints:

 ┌─ kernel─(as0)────────────────────────────────────────────────────┐
 │   ┌───────────┐                      ┌───────────┐  ┌───────────┐│
 │   │ dev0(cid0)│                      │ dev2(cid1)│  │ dev3(cid2)││
 │   └───┬───────┘                      └───┬───────┘  └────────┬──┘│
 └───────┼──────────────────────────────────┼───────────────────┼───┘
  ┌──────┼───────────────────────┐   ┌──────┼───────────────────┼───┐
  │      │  ┌───────────┐        │   │      │  ┌───────────┐    │   │
  │      └──► dev0(cid0)│        │   │      └──► dev2(cid1)│    │   │
  │         └───────────┘        │   │         └───────────┘    │   │
  │         ┌───────────┐        │   │         ┌───────────┐    │   │
  │      ┌──► dev1(cid1)│        │   │         │ dev3(cid2)◄────┘   │
  │      │  └───────────┘     VM0│   │         └───────────┘     VM1│
  └──────┼───────────────────────┘   └──────────────────────────────┘
   vhost-user-vsock                                                  
┌────────┼──────────────────────────────────────────────────────────┐
│   ┌────┼──────┐                                                   │
│   │ dev1(cid1)│                                                   │
│   └───────────┘                                                   │
└─userapp─(as1)─────────────────────────────────────────────────────┘

- VM0
    - dev0
        - dst_cid = 2 (well-known cid): connect to host;
        - dst_cid = cid1: connect to dev2 (they are in the same as0);
        - dst_cid = cid2: connect to dev3;
    - dev1
        - dst_cid = 2 (well-known cid): connect to userapp;
        - dst_cid = cid0: failure (no cid0 is available in as1, even though
        cid1 is available in the VM0);
        - dst_cid = cid1: connect to dev0;
- VM1
    - dev2
        - dst_cid = 2 (well-known cid): connect to host;
        - dst_cid = cid0: connect to dev0;
        - dst_cid = cid2: connect to dev3;
    - dev3: skip the same as dev2.

So back to your question, my answer is that it depends on the address
space. Hope it could be helpful.

> > In case 2, the two devices are in different namespaces (or sort of address
> > spaces). If there is no device with cid2 in the namespace of
> > dev0 (vhost-user-vsock), then the packet will be dropped.
> 
> Are you talking about the implementation of the device or the spec?

I think it is the spec. I am not good at recognizing those, so please
correct me if I am wrong.

Thanks,
Xuewei

> > In case 1, the two are in the same, so that the communication can be
> > established.
> >
> > Thanks,
> > Xuewei
> >
> > Thanks
> 
> Thanks
> 
> >
> > > >
> > > > Thanks,
> > > > Xuewei
> > > >
> > > > > Thanks
> > > > >
> > > > > >
> > > > > > Thanks,
> > > > > > Xuewei
> > > > > >
> > > > > > > > Thanks,
> > > > > > > > Stefano
> > > > > > > >
> > > > > > >
> > > > > > > Thanks
> > > > > >
> > > >
> >
