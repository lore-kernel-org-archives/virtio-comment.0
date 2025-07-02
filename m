Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDB560B8A
	for <virtio-comment@lists.linux.dev>; Wed,  2 Jul 2025 06:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751436329; cv=none; b=OHNhZjSKBJo62RLE7ynzbuD+AzCqMr5OYgMJ6IeSn6Tdmada5tmUPYts5ZdK3pFfgZrc/yrIaDW1vPsTWvWvUqjdnCSfhDWze8oZCIGwrYN9aYVCKy2qfFaIdUTnOicEwDFC2fTeAVzxC8Lt0RtDdIJHnVa+EuZmnmL+n2J7stY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751436329; c=relaxed/simple;
	bh=O+cT1D1aALo+TlY6lUMWqFkcrtV7yFVRyhx8Tv7Fy0U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lMmJ84ztGspNuEVdVhnGxHQo6ufdeQMU4Yi+HFMulsju6W9my0edyMuI45pNYHgZzn4Y/iTf2TynJnEi8oCTP2/6To12pAf1kbNnjSDvwfsQN1wDVhJKErvqs1yxI3BRc0pn+b4Jy1ADg0LthqjTBrpZEuq9Wg52QFhpzr/NGQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuABCFln; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuABCFln"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-748d982e92cso4903147b3a.1
        for <virtio-comment@lists.linux.dev>; Tue, 01 Jul 2025 23:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751436327; x=1752041127; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dI9mweEcSAxzFKZmERxC4p+Vh4YfyjefIhvASYS2Bjw=;
        b=iuABCFlnK8ke13mWwyiRuAO2ekXBWsUG1zvd01IcTjLR/7PWqXLkJesr53T5HRfNGq
         D0N4NN3jfd3SCh2gcV1mE3P5ucpwc5DQCcVNaANeZNkceDcRE3EK37lj2S7gqxi0NtzK
         r5cSs4dD98sCyJqI4We/UCygmgT7jMnI0gw7OMRQIT1fcDjYgfqOMOX5Dhl8Yfrb6ehG
         O2byHSPZaOEHpsYc/gWNNjLr2hr49FR9H0XBUByg4c8pDIIs6SRHDkj1ybFNso/L/N5v
         5axEpYm+zXBBsbSntG0QpZcKuJmVFGDD3jElMYDcU2JrzI7KbiLzn/wX0jEyA9F66YM2
         9n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751436327; x=1752041127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dI9mweEcSAxzFKZmERxC4p+Vh4YfyjefIhvASYS2Bjw=;
        b=Y5gsugESu9ElYRgwC9LOe8zsmk+9NmQHc9cFaVnqSFn8/mDtNvmy4jR736+dSwtFNz
         krwVYDl88qk5V5fGVS/P1IDoe45zo07jLgtRoTjSkLUmLdFYeSrXDrojwxKVxDSbFnz5
         ZP6m9ucd9KX7wVUhcxrDWutZ7bCUB6cZZ1dICfV47htT1EnMMXSue5Enyet5kOk5xzex
         NBx0v1dFtAzNoiS+PHrBZogpVNbuGNwa1Q/Q2dZUmJAsLpSF8i8KRk3m1yUVwop/jXS9
         E1ccH6VohuaJhTFYAIZDKE1m6gdVPB7Tz9XHBWSjvNPpgSZ6fdIlIXBqbgTquUet0iM5
         /Awg==
X-Forwarded-Encrypted: i=1; AJvYcCX36NXPkxDlDlE353AlLdAn5qwXt6nI3Q9jWqGKy/LnNJbypsOMfot0z+f6JHWFNfbd+KB1Q5/mtfviRFj6MA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzVKSDlUZr+ZCnA4FBgIxGs4aslhYDruWE1ur0zDKLhZ6UExE7
	+jAR6U93Y9Y6rsDFz/S19Sdl76J4zR3oIbQz33nADOLkdRsOKqFNyCyGHaoUcVU6+J+Xygce
X-Gm-Gg: ASbGnctdt4v3NQOmESeSayhokIePhQ/c0Wm2EKrQQcxjG6bGLCWUFrnkxzKXbRL0/jZ
	QbtGMJD2m/sUEdWusPmBkI75WAJdrIn1/wKPKNLa4YqdA5+syhATcVrUmfgt4kuhkc/LfeGpsqE
	aw1uY0zmP0jlbuTTPVJByo4wfYidGHcW02GncZ+nCxEFVch+6I8ybkFYAI+IiKKnrY3ZKvzSXCc
	vz6Rz3+XxhKSTw/QDkcgQd9QyKKc8fg4kGny5XpN8luoVLgtFWiwj6PDqcx/eOAeKmngpVZwmcf
	IgvQycIvAdMvk1KTrKmsdHiW9kxrbf1ZrDTaI670Bx7t+UrQgIv7QDYiLha2WKiy8vKuHl8D/hr
	o3lpArl5c
X-Google-Smtp-Source: AGHT+IG8qggVuv4NpNHu4j4vGZqt4TuQXqQj2Wojq4h/cnmOMN+ETtnpTrzgdQMfHWOsqpXo28dNDQ==
X-Received: by 2002:a05:6a00:1ca3:b0:74b:b11:edd5 with SMTP id d2e1a72fcca58-74b50e6991bmr2557719b3a.3.1751436326379;
        Tue, 01 Jul 2025 23:05:26 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540b203sm13399306b3a.8.2025.07.01.23.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 23:05:25 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	parav@nvidia.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Date: Wed,  2 Jul 2025 14:05:16 +0800
Message-Id: <20250702060516.682183-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <w7oaipcnfmjikd3ob7mh3bkxgxbtgfqzrmf6upay2vqmpgniei@cpbnm63fj5th>
References: <w7oaipcnfmjikd3ob7mh3bkxgxbtgfqzrmf6upay2vqmpgniei@cpbnm63fj5th>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Mon, Jun 23, 2025 at 11:51:39PM +0800, Xuewei Niu wrote:
> >> On Mon, Jun 23, 2025 at 08:14:07PM +0800, Xuewei Niu wrote:
> >> >> On Mon, Jun 23, 2025 at 06:35:59PM +0800, Xuewei Niu wrote:
> >> >> >> On Mon, Jun 23, 2025 at 04:48:33PM +0800, Xuewei Niu wrote:
> >> >> >> >> On Thu, Jun 19, 2025 at 01:10:33PM +0800, Xuewei Niu wrote:
> >> >> >> >> >> > From: Xuewei Niu <niuxuewei97@gmail.com>
> >> >> >> >> >> > Sent: 19 June 2025 08:57 AM
> >> >> >> >> >> >
> >> >> >> >> >> > Hi Parav,
> >> >> >> >> >> >
> >> >> >> >> >> > Could you please take a look at the diagram in [1]?
> >> >> >> >> >> >
> >> >> >> >> >> > IIUC, for VM0, there are two groups, and for VM1, there is only one group.
> >> >> >> >> >> > Am I right? If yes, I think the group concept is reasonable but we don't need
> >> >> >> >> >> > at this time.
> >> >> >> >> >> >
> >> >> >> >> >> > I think the first thing is to figure out how to pick the right group.
> >> >> >> >> >> >
> >> >> >> >> >> > Standard socket doesn't provide a way to access the group information.
> >> >> >> >> >> >
> >> >> >> >> >> > Source and destination are from `bind()` and `connect()`, respectively. If we
> >> >> >> >> >> > don't call `bind()`, only the destination is known.
> >> >> >> >> >> >
> >> >> >> >> >> > However, only destination is not enough to find the group. For example, the
> >> >> >> >> >> > well-known CIDs (e.g. 2) are valid for all groups.
> >> >> >> >> >> >
> >> >> >> >> >> > 1:
> >> >> >> >> >> > https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/
> >> >> >> >> >>
> >> >> >> >> >> Right. Sock addressing scheme is naïve presently to select the group.
> >> >> >> >> >> Not sure when/how you or others plan to do.
> >> >> >> >> >> This is transport layer problem to solve (not to confuse with transport = pci/mmio etc).
> >> >> >> >>
> >> >> >> >>
> >> >> >> >> >>
> >> >> >> >> >> However, at device level, we should have the construct of grouping.
> >> >> >> >> >> Without this construct, all devices will be part of single group and one will not be able to build the group concept later.
> >> >> >> >> >> So even if you don't need it explicitly now, grouping the device is what you need when connect() is called.
> >> >> >> >> >>
> >> >> >> >> >> So I was imagining a relatively simple scheme:
> >> >> >> >> >> For example, virtio device level, some kind of group id is present.
> >> >> >> >> >> So two devices which has same group id, are part of single group.
> >> >> >> >> >> An example group id format can be a UUID.
> >> >> >> >> >>
> >> >> >> >> >> And this is completely optional for devices to implement.
> >> >> >> >> >> Generic enough and usable beyond just vsock device in other use cases
> >> >> >> >> >> we discussed in past.
> >> >> >> >> >
> >> >> >> >> >Fair enough.
> >> >> >> >> >
> >> >> >> >> >@Stefano, could you please take a look at this? I'd love to have some
> >> >> >> >> >input
> >> >> >> >> >from you.
> >> >> >> >> >
> >> >> >> >> >A brief summary of the idea is: The config space will be extended to
> >> >> >> >> >include a group id. The devices with the same group id are considered
> >> >> >> >> >to be
> >> >> >> >> >in the same group.
> >> >> >> >>
> >> >> >> >> Thanks for the summary, but please avoid top posting, otherwise is very
> >> >> >> >> hard to follow the discussion :-(
> >> >> >> >> https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replying
> >> >> >> >
> >> >> >> >Sorry, I'll avoid it in the future.
> >> >> >> >
> >> >> >> >> I like the idea of groups. What is not clear to me, is how groups will
> >> >> >> >> allow the driver to select the default output device when the source
> >> >> >> >> socket is not bind to any source CID.
> >> >> >> >
> >> >> >> >Well, we did discuss, but we need your input.
> >> >> >> >
> >> >> >> >I said in the thread [1] based on the standard socket API, the driver can't
> >> >> >> >pick a group. Parav [2] suggested that the group, as a basic concept,
> >> >> >> >should be present even if we are unable to use it.
> >> >> >> >
> >> >> >> >IMHO, we might use "{group_id}-{cid}" as the vsock addressing scheme to use
> >> >> >> >the concept. But it is a very big change, leading to incompatibility with
> >> >> >> >the existing apps.
> >> >> >>
> >> >> >> I still don't understand how the group_id will work :-( and how will
> >> >> >> allow the driver to pick the default device.
> >> >> >
> >> >> >FYI, here is trying to explain what is group and why it is needed, but I
> >> >> >agree with you about the idea of "types".
> >> >> >
> >> >> >I posted a diagram in the thread [1]. I think the group is something like a
> >> >> >"namespace". I think it is reasonable, but my concerns are compatibility
> >> >> >and complexity.
> >> >> >
> >> >> >1: https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/
> >> >> >
> >> >> >> This is the `sockaddr_vm`, so we should be careful of extending it:
> >> >> >>
> >> >> >> struct sockaddr_vm {
> >> >> >> 	__kernel_sa_family_t svm_family;
> >> >> >> 	unsigned short svm_reserved1;
> >> >> >> 	unsigned int svm_port;
> >> >> >> 	unsigned int svm_cid;
> >> >> >>
> >> >> >> #define VMADDR_FLAG_TO_HOST 0x01
> >> >> >>
> >> >> >> 	__u8 svm_flags;
> >> >> >> 	unsigned char svm_zero[sizeof(struct sockaddr) -
> >> >> >> 			       sizeof(sa_family_t) -
> >> >> >> 			       sizeof(unsigned short) -
> >> >> >> 			       sizeof(unsigned int) -
> >> >> >> 			       sizeof(unsigned int) -
> >> >> >> 			       sizeof(__u8)];
> >> >> >> };
> >> >> >>
> >> >> >> >I think it might be beyond the scope of this patch, and would make the
> >> >> >> >vsock more complex. The current conclusion is that we will keep the concept
> >> >> >> >of grouping as a placeholder, but we will not use it.
> >> >> >>
> >> >> >> IMO we should first clarify better what we want to support.
> >> >> >> As I already suggested some months ago, IMHO supporting any number of
> >> >> >> vsock devices for a VM it's not really needed for your goal and I can't
> >> >> >> see other use cases where a virtio-net device can't be use. Just a
> >> >> >> reminder, vsock is not a network device, is more a P2P device where we
> >> >> >> want to keep the configuration in the guest as simpler as possible (we
> >> >> >> don't want to run ARP, DHCP, etc.).
> >> >> >
> >> >> >Agree that.
> >> >> >
> >> >> >> Till now vsock was more used just for guest-host communication, but
> >> >> >> recently it was extended to communicate with sibling VMs.
> >> >> >>
> >> >> >> IIUC your use case, we just need to support different type of vsock
> >> >> >> devices attached to the VM. With "type" I mean type of address handled.
> >> >> >> I think we can define 3 types based on the CID we have:
> >> >> >> - hypervisor: VMADDR_CID_HYPERVISOR(0)
> >> >> >> - host: VMADDR_CID_HOST(2)
> >> >> >> - sibling: CID >=3
> >> >> >>
> >> >> >> The vhost-vsock device handles only VMADDR_CID_HOST, so it doesn't allow
> >> >> >> to reach from the guest any other CIDs.
> >> >> >> The vhost-user-vsock recently started to support sibling VMs.
> >> >> >> The tcp-over-vsock of libkrun should use VMADDR_CID_HYPERVISOR(0).
> >> >> >>
> >> >> >> So, IMHO we should define new features or config flags that a device can
> >> >> >> expose depending on which address is able to handle.
> >> >> >> Also, in order to avoid to overcomplicate vsock, we should allow only
> >> >> >> one device for each type (a single device should support multiple types,
> >> >> >> but only one device can be registered for a type).
> >> >> >
> >> >> >I think only one device can be registered for sibling and hypervisor. And
> >> >> >it is possible to have multiple devices for host. Otherwise, the goals of
> >> >> >this patch will be not achieved.
> >> >>
> >> >> Why?
> >> >>
> >> >> IMO, as I already wrote, the libkrun service should use CID=0.
> >> >
> >> >As we before discussed, if there is only one backend for the libkrun
> >> >service, we can use cid=0. I totally agree with you. So let us put this
> >> >case aside first.
> >> >
> >> >> How you will handle multiple devices for host? How can the guest know
> >> >> which device to use to reach HOST(2)?
> >> >
> >> >Do `bind()` explicitly, and a device with matching cid will be picked up.
> >>
> >> Okay, but why you need 2 devices to communicate with the same CID, host
> >> in this case (CID=2)?
> >> IMO use the source CID to multiplex a socket at destination is not
> >> great. But I can be wrong.
> >
> >I mean multiple sockets with multiple `bind()` calls, not multiplexing:
> >
> >- socket1: bind(3, -1), connect(2, 10000);
> >- socket2: bind(4, -1), connect(2, 10001);
> >- ...
> 
> Yep, of course, I meant exactly that.
> In this case we are doing multiplexing based on the source address, 
> which IMHO is odd.

Please see below.

> >> >> IMO is easier to have the multiple device for sibling (e.g. the device
> >> >> can advertise which dest CID its supports), but not for host.
> >> >
> >> >I think one device for sibling is enough.
> >>
> >> I also think one should be enough, but IMO I think it might make more
> >> sense to have multiple devices in this case, where each device can
> >> handle a pool of CIDs, then the hard part will be figuring out how to
> >> allocate the CIDs, etc. so yes, I agree that having one device even in
> >> this case is the easiest thing.
> >
> >Yeah, so let us skip this for now ;)
> 
> Agree.
> 
> > >
> >> >For example, dev1 is enough for
> >> >communication with dev3 and dev4. So we don't need dev2 for sibling in the
> >> >first VM, right?
> >>
> >> Just a note, vhost-vsock is not allowing any sibling communication.
> >> vhost-user-vsock can do it, but we don't want to bring any support in
> >> vhost-vsock to not overcomplicate it (again it will become like a
> >> network switch, requiring firewalls, etc.)
> >
> >Even if we don't impose some complicated mechanisms, I think the
> >vhost-vsock should work with sibling, and I don't see any difference
> >between vhost-vsock and vhost-user-vsock. (I am just curious.)
> 
> THe difference is how to prevent a communication between VMs of 
> different users.
> 
> With vhost-user-vsock, you can decide which VMs to connect to the 
> vhost-user backend, in vhost-vsock all of them will be attached to the 
> host net stack, so we need to add some kind of firewall, etc. and it 
> will complicate a lot our simple stack. So I'm not sure we want that.

I see it. The vhost-user-vsock provides kind of "namespace" capability, am
I right?

> >> >+──kernel(vhost-vsock)──────────────────────────────────────────────+
> >> >│+──────────────+ +──────────────+ +──────────────+ +──────────────+│
> >> >││  dev1(cid1)  │ │  dev2(cid2)  │ │  dev3(cid3)  │ │  dev4(cid4)  ││
> >> >│+──────────────+ +──────────────+ +──────────────+ +──────────────+│
> >> >+────────▲────────────────▲────────────────▲────────────────▲───────+
> >> >         │                │                │                │
> >> >         │                │          ┌─────┘                │
> >> >         │                │          │                      │
> >> >+────────┴───────────+    │ +────────┴───────────+ +────────┴───────────+
> >> >│+──────────────+ VM0│    │ │+──────────────+ VM1│ │+──────────────+ VM2│
> >> >││dev1(cid1,def)│    │    │ ││dev3(cid3,def)│    │ ││dev4(cid4,def)│    │
> >> >│+──────────────+    │    │ │+──────────────+    │ │+──────────────+    │
> >> >│+──────────────+    │    │ │                    │ │                    │
> >> >││  dev2(cid2)  │────┼────┘ │                    │ │                    │
> >> >│+──────────────+    │      │                    │ │                    │
> >> >+────────────────────+      +────────────────────+ +────────────────────+
> >> >
> >> >The things go different for devices for host:
> >> >
> >> >1. For dev1, it is used for sibling (dev1 <-> dev4), and the host
> >> >(src_cid=cid1, dst_cid=2) means the real host (not a userapp), where
> >> >doesn't show in the diagram.
> >>
> >> This is not going to happen (see above).
> >>
> >> >2. For dev2 (src_cid=cid2), the host (dst_cid=2) is userapp1;
> >> >3. For dev3 (src_cid=cid3), the host (dst_cid=2) is userapp2.
> >> >
> >> >+──kernel(vhost-vsock)──────────────────────────────────────────────+
> >> >│+──────────────+                                   +──────────────+│
> >> >││  dev1(cid1)  │                                   │  dev4(cid4)  ││
> >> >│+──────────────+                                   +──────────────+│
> >> >+────────▲──────────────────────────────────────────────────▲───────+
> >> >         │                                                  │
> >> >+────────┴───────────+     +────────────────────+           │
> >> >│+──────────────+ VM0│     │+──────────────+    │           │
> >> >││dev1(cid1,def)│    │┌────▶│  dev2(cid2)  │    │  +────────┴───────────+
> >> >│+──────────────+    ││    │+──────────────+    │  │+──────────────+ VM2│
> >> >│+──────────────+    ││    │            userapp1│  ││dev4(cid4,def)│    │
> >> >││  dev2(cid2)  │────┼┘    +────────────────────+  │+──────────────+    │
> >> >│+──────────────+  vhost-user-vsock─────────────+  │                    │
> >> >│+──────────────+    │     │+──────────────+    │  │                    │
> >> >││  dev3(cid3)  │────┼─────▶│  dev3(cid3)  │    │  │                    │
> >> >│+──────────────+    │     │+──────────────+    │  +────────────────────+
> >> >+────────────────────+     │            userapp2│
> >> >                           +────────────────────+
> >> >
> >>
> >> I'm really confused with `cid1`, `cid2`, etc. Are they any number >= 3?
> >> I'd suggest to use real value (e.g. cid=42).
> >
> >Okay. I'll update it with real value ;)
> >
> >Based on the above question, I still put the devices into the kernel.
> >
> >+──kernel(vhost-vsock)──────────────────────────────────────────────────+
> >│+───────────────+                                  +───────────────+   │
> >││  dev1(cid=3)  │                                  │  dev4(cid=6)  │   │
> >│+───────────────+                                  +───────────────+   │
> >+────────▲──────────────────────────────────────────────────▲───────────+
> >         │                                                  │
> >+────────┴───────────+     +────────────────────+           │
> >│+───────────────+VM0│     │+──────────────+    │           │
> >││dev1(cid=3,def)│   │┌────▶│ dev2(cid=4)  │    │  +────────┴───────────+
> >│+───────────────+   ││    │+──────────────+    │  │+───────────────+VM2│
> >│+───────────────+   ││    │            userapp1│  ││dev4(cid=6,def)│   │
> >││  dev2(cid=4)  │───┼┘    +────────────────────+  │+───────────────+   │
> >│+───────────────+ vhost-user-vsock─────────────+  │                    │
> >│+───────────────+   │     │+──────────────+    │  │                    │
> >││  dev3(cid=5)  │───┼─────▶│ dev3(cid=5)  │    │  │                    │
> >│+───────────────+   │     │+──────────────+    │  +────────────────────+
> >+────────────────────+     │            userapp2│
> >                           +────────────────────+
> >
> >> So what dest CID the VM0 is supposed to use to talk with userapp1 and
> >> userapp2? In both cases CID=2, right?
> >
> >Yes. There are at least two sockets with source cid=4 and cid=5 
> >respectively.
> 
> As I said, this is odd IMHO.
> We are using the source address to multiplex the destination app.
> We should use the destination address for that, no?

Well. In my design, we use one device mainly for the host, so that we can
do multiplexing as we ususally do. Other devices are dedicated for specific
uses, for example, I want to use a dedicated vsock for TSI backend as I
mentioned before. In this case, we can't do multiplexing.

IMHO, our systems are functional without the support of multiple devices,
right? So I introduce the default device to make sure that we don't break
the current usage after adding the support.

At the same time, we really want to have more devices for specific use
cases, where we have to deal with the more complicated usage and config.

To recap: I think the case I mentioned here is one of specific use cases.
For most cases, we can do multiplexing based on the destination address.

Looks good to you?

> >> Why you need 2 vhost-user-vsock devices?
> >
> >The benefit of vhost-user is "shared memory", which reduces the need 
> >for
> >data copying. It is possible to share virtqueues to multiple user apps, for
> >the sake of performance.
> >
> >I don't forget the "CID=0" thing. Just as an explanation, I'll use the
> >example of TSI.
> >
> >We can treat the TSI backend as a proxy. Thanks to vhost-user-vsock, the
> >data will be copied once from the guest user space to the proxy. When we
> >have two subnets, which is a common case, we might want to have two 
> >proxies
> >to forward the data.
> 
> Okay, I see it now, but it's really the use case of vsock?

We are using Kata Containers to launch a pod. Thanks to Istio Ambient [1]
service mesh, which is available now, we don't need to set network rules in
the pod. Networking inside the VM is pretty simple, we don't need to
network stack, all we need to do is to forward the data to the Istio
Ambient host daemonset. In this case, vsock and TSI are the best choices.

If use network, we have to do a lot of copy to achieve that:

guest userspace
    -> guest network stack
        -> pod net namespace network stack
            -> host network stack
                -> host userspace (Istio Ambient proxy)

If use TSI, the things are:

guest userspace
    -> guest vsock
        -> host tsi backend (Istio Ambient proxy)

We are trying to enable vsock to function as a data plane, instead of only
doing control stuff (control plane).

Of course, we also expect that the vsock keeps as simple as possible, and
try to not bother users who don't need these advanced features.

1: https://istio.io/latest/blog/2022/introducing-ambient-mesh/

> In this way the destination address (CID, port) is completely useless, 
> since it's never used, so why using vsock for this use case?

What if the userapp provides two services on different ports, so port is
needed?

> I have an idea, but I don't know if it is feasible.
> CID=0 is pretty much unsupported for now by virtio-vsock, but maybe we 
> could leverage it for this use case.
> 
> If we have multiple devices, but each practically allows only one 
> application to be reached,

See above.

> then these devices can be reached by CID=0 

Why CID=0 only?

> and port=x, where each device exposes in its configuration space the 
> port to which it responds.
> 
> Thus, in the guest, connect(0, 10001) will go to the device that exposes 
> port 10001, and so on.

Your proposal

pro:

1) all cases don't need to call `bind()`.

cons:

1) since the config space will not be read after the device is set up, the
driver can't update the exposed port dynamically.
2) the driver has to maintain the mapping between the port and the device.
3) the guest apps still have to know the mapping to get the right port.

===

My proposal

pro:

1) it is transparent to the driver.
2) most cases (expected 95%) don't need to make a change (they don't have
to know the mapping, and don't need to call `bind()`).

cons:

1) specific cases (expected 5%) need to know which device to use, and do
`bind()` call.

===

I update some limitations, and try to make things clearer:

1) the default device is allowed to communicate with host and sibling (just
like with a single device now).
2) other devices are allowed to communicate with host (CID=2) only.

> I don't know if I really like that proposal honestly, anyway, if we go 
> back with yours instead, where the guest has to do the bind to choose 
> the device to use, that's fine, but the one thing we have to have IMO is 
> a way to set the default device, as we were doing.

Exactly!

> >
> >                 +────────────────+    +───────────────────────────────+
> > .─────────.     │  tsi backend1  │    │+───────────────+    ┏━━━━━━━━┓│
> >(    NW1    )◀───│   (userapp1)   │◀───┤│  vsock dev1   ◀────┃subnet1 ┃│
> > `─────────'     +────────────────+    │+───────────────+    ┗━━━━━━━━┛│
> >                                       │                               │
> >                 +────────────────+    │+───────────────+    
> >                 ┏━━━━━━━━┓│
> > .─────────.     │  tsi backend2  │◀───┤│  vsock dev2   ◀────┃subnet2 ┃│
> >(    NW2    )◀───│   (userapp2)   │    │+───────────────+    ┗━━━━━━━━┛│
> > `─────────'     +────────────────+    +───────────────────────────────+
> >
> >> Can you just have a single one and have the application
> >> connecting/listing on different port? (which is the sense of the port,
> >> multiplexing application on the destination)
> >
> >In terms of functionality, I think it is possible. But it loses the benefit
> >of vhost-user-vsock.
> 
> Can you elaborate a bit?

In this case, we can have one TSI backend with multiple ports. Then, the
backend forwards data to different proxies, which means we actually copy
the data an additional time between the backend and the proxy.

guest userspace
    -> guest vsock
        -> host tsi backend
            -> host proxy (Istio Ambient proxy)

If we can combine TSI backend and proxy, we can reduce the data copying.

Thanks,
Xuewei

> BTW in rust-vmm/vhost-device we use a single vhost-user device and 
> multiplex connections between multiple applications in the host: 
> https://github.com/rust-vmm/vhost-device/tree/main/vhost-device-vsock
> 
> Thanks,
> Stefano
