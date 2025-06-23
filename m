Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEC47081F
	for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680863; cv=none; b=MRD5Vd819ESP3rol5S97flR/+F2uaBWCD9LM5aO7VXEO0BdP6ahxZkQGa1vlvC15I2+PNrmxFYlwfwBW2MiPf/d/P+hZrcHPBdMi28RKCjj7dJO1+2KT3R0o2TUTTupsGyuIIVsaG7PfwF8C5+/Fc95ulrvXUBeIeEIzjR2zCKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680863; c=relaxed/simple;
	bh=/8x1nG7caexBjG6rk6j6yLpbt3t0bTHn5NbJclr3Aow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BfpO9rTwxPPHrcx/x3QyKCiTJPYV8FwxpyZPYTwoLAMBK+3aivEphA33Z/W+vpO58a9vw2neUZNmf7UEMFbSnGky2TKRntEf/xCbBJZlepnSTGwTUByWP14WT+2pXSV8KqbEP5rM2rEFA33eoIFgpLPgEGijAeN9n/8G18ROPiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ft+Wsa60; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ft+Wsa60"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23636167b30so37029555ad.1
        for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 05:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750680861; x=1751285661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsdpWpqjcWtPK9n0XppRmAEdmXia7oEfxFPV7XMcMOA=;
        b=ft+Wsa60iyz01XzWRr8dEdsPrgXxDOVI5uNJkkq0ZVGc7XhdxuRpcEw6c2BfsdX+9b
         oXguZajneiDlx2Do/U5hrxLmq981d8XinuY1zA7SewE0L6JfpCY6H1FFrxGFZxQSignj
         U3jdN/Fitqy+vBiyE4CI47zqnryFWLE7ZRRxWCXY2i1EMWA1k2GvcRlT7fy0Pa/NMRV1
         kctYb9JK/zTLGfm0sSZlDpa8zGnX94+KXoW7GbyOMzfa4LVMxeRPwrJU07a2mRG4QiZG
         sz+dpBwBBRh32fIfbPaFJGq5+3zX8BLDH6mKErXMIXBJFnDjnpIa7KthwEFGMWpBCG7g
         BUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750680861; x=1751285661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsdpWpqjcWtPK9n0XppRmAEdmXia7oEfxFPV7XMcMOA=;
        b=rrEtsnnaMaB4GsCXfAHb16B6ppj4f0TKm/HXHeI45kqLcuxpeqqiqOZej0B1ElKppt
         +zWEKXWV7XS6688pNSSnWWr2NQqVmenT/j9Gw3OlhFOu1ZDmwr30vty9bbvZ6FpYLntJ
         4HiixSCOMO67pC586UTW0MLz53eXLtxKEGnWB+Palh/j7m4Fi7w6m5ltsSvdCzWgNsko
         wgC7XXvIkHQyzp494GtvDP0Cwv2f3fixXAO/Jibbhyyg8rlw5VyZw6vOSyAN610bUiWH
         DojhTOxp0tp+bdaYY2dyAg5IDTMl1L5/zGCsz9SvjhZ3LQZVfvXc6r0R87Zm/Q2YH4Gh
         eHjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFPuvRBOqG42FdnjLYuZnyoenDq30jPlw5vx8deIyjuIZbVyj/Dr2hbKQuH3zsMc5II9sg6Zx/V3Vux85UFg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyv+cCwumebfddy4L6Xqk3ZhUgG/oT3Dnl9bK7taR5whwyuipYA
	9pVTBgWE1l5bRQPgf4cLykv1P2ivdSAGdyQl4gJcFvSLOH2E0mOmhSFq
X-Gm-Gg: ASbGncujtgEvY3W2ZKKIozgqTIe3viVj4S/flIMiF6LL2hzGqacolD447VeNlLhiPlj
	vJhFsS7+RRVBzgtOzemCXzW//sXwd4kb2I/R9EpP01VhFUNtnHyZkQmHtPGo3YPChPp/bNJrW/b
	T0AzV4D3OPRtb+lyFVU6YUU9R07OV4S7odSU5Ba+cGaM/FC2nNmInlhi/AVtHkuwOQ7/1aYb5uQ
	aTKOZP312BHp2uqx//ruV1GWUhkVeXAbcgCfm/SeSImaVDRHHwfCqoaUeGhRPAAfHz9tgpTNMoU
	GAijQOqSvknwKkoTQjYIO/NJuVstDTCOzGBiY8too9nHLp304BJ9XxeUSTvQN5ZNNEF/k4YBAel
	egOpBY0wH
X-Google-Smtp-Source: AGHT+IFGlm+2M0mcuFYftQ/V3siJCo8eSxlGVw41cbLiJ4y4QhLl1aNA7IOrxK3HNLKpr8IsPG1Skw==
X-Received: by 2002:a17:903:4b27:b0:235:2799:640 with SMTP id d9443c01a7336-237d98e293amr154296665ad.25.1750680860682;
        Mon, 23 Jun 2025 05:14:20 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86d563fsm83117395ad.207.2025.06.23.05.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 05:14:20 -0700 (PDT)
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
Date: Mon, 23 Jun 2025 20:14:07 +0800
Message-Id: <20250623121407.1665067-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bswghcrtbm3tgfadpzjidjeng4hd6wnhpodu3hpgxqe7x7aa6m@zqctemeqotaf>
References: <bswghcrtbm3tgfadpzjidjeng4hd6wnhpodu3hpgxqe7x7aa6m@zqctemeqotaf>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Mon, Jun 23, 2025 at 06:35:59PM +0800, Xuewei Niu wrote:
> >> On Mon, Jun 23, 2025 at 04:48:33PM +0800, Xuewei Niu wrote:
> >> >> On Thu, Jun 19, 2025 at 01:10:33PM +0800, Xuewei Niu wrote:
> >> >> >> > From: Xuewei Niu <niuxuewei97@gmail.com>
> >> >> >> > Sent: 19 June 2025 08:57 AM
> >> >> >> >
> >> >> >> > Hi Parav,
> >> >> >> >
> >> >> >> > Could you please take a look at the diagram in [1]?
> >> >> >> >
> >> >> >> > IIUC, for VM0, there are two groups, and for VM1, there is only one group.
> >> >> >> > Am I right? If yes, I think the group concept is reasonable but we don't need
> >> >> >> > at this time.
> >> >> >> >
> >> >> >> > I think the first thing is to figure out how to pick the right group.
> >> >> >> >
> >> >> >> > Standard socket doesn't provide a way to access the group information.
> >> >> >> >
> >> >> >> > Source and destination are from `bind()` and `connect()`, respectively. If we
> >> >> >> > don't call `bind()`, only the destination is known.
> >> >> >> >
> >> >> >> > However, only destination is not enough to find the group. For example, the
> >> >> >> > well-known CIDs (e.g. 2) are valid for all groups.
> >> >> >> >
> >> >> >> > 1:
> >> >> >> > https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/
> >> >> >>
> >> >> >> Right. Sock addressing scheme is naïve presently to select the group.
> >> >> >> Not sure when/how you or others plan to do.
> >> >> >> This is transport layer problem to solve (not to confuse with transport = pci/mmio etc).
> >> >>
> >> >>
> >> >> >>
> >> >> >> However, at device level, we should have the construct of grouping.
> >> >> >> Without this construct, all devices will be part of single group and one will not be able to build the group concept later.
> >> >> >> So even if you don't need it explicitly now, grouping the device is what you need when connect() is called.
> >> >> >>
> >> >> >> So I was imagining a relatively simple scheme:
> >> >> >> For example, virtio device level, some kind of group id is present.
> >> >> >> So two devices which has same group id, are part of single group.
> >> >> >> An example group id format can be a UUID.
> >> >> >>
> >> >> >> And this is completely optional for devices to implement.
> >> >> >> Generic enough and usable beyond just vsock device in other use cases
> >> >> >> we discussed in past.
> >> >> >
> >> >> >Fair enough.
> >> >> >
> >> >> >@Stefano, could you please take a look at this? I'd love to have some
> >> >> >input
> >> >> >from you.
> >> >> >
> >> >> >A brief summary of the idea is: The config space will be extended to
> >> >> >include a group id. The devices with the same group id are considered
> >> >> >to be
> >> >> >in the same group.
> >> >>
> >> >> Thanks for the summary, but please avoid top posting, otherwise is very
> >> >> hard to follow the discussion :-(
> >> >> https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replying
> >> >
> >> >Sorry, I'll avoid it in the future.
> >> >
> >> >> I like the idea of groups. What is not clear to me, is how groups will
> >> >> allow the driver to select the default output device when the source
> >> >> socket is not bind to any source CID.
> >> >
> >> >Well, we did discuss, but we need your input.
> >> >
> >> >I said in the thread [1] based on the standard socket API, the driver can't
> >> >pick a group. Parav [2] suggested that the group, as a basic concept,
> >> >should be present even if we are unable to use it.
> >> >
> >> >IMHO, we might use "{group_id}-{cid}" as the vsock addressing scheme to use
> >> >the concept. But it is a very big change, leading to incompatibility with
> >> >the existing apps.
> >>
> >> I still don't understand how the group_id will work :-( and how will
> >> allow the driver to pick the default device.
> >
> >FYI, here is trying to explain what is group and why it is needed, but I
> >agree with you about the idea of "types".
> >
> >I posted a diagram in the thread [1]. I think the group is something like a
> >"namespace". I think it is reasonable, but my concerns are compatibility
> >and complexity.
> >
> >1: https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/
> >
> >> This is the `sockaddr_vm`, so we should be careful of extending it:
> >>
> >> struct sockaddr_vm {
> >> 	__kernel_sa_family_t svm_family;
> >> 	unsigned short svm_reserved1;
> >> 	unsigned int svm_port;
> >> 	unsigned int svm_cid;
> >>
> >> #define VMADDR_FLAG_TO_HOST 0x01
> >>
> >> 	__u8 svm_flags;
> >> 	unsigned char svm_zero[sizeof(struct sockaddr) -
> >> 			       sizeof(sa_family_t) -
> >> 			       sizeof(unsigned short) -
> >> 			       sizeof(unsigned int) -
> >> 			       sizeof(unsigned int) -
> >> 			       sizeof(__u8)];
> >> };
> >>
> >> >I think it might be beyond the scope of this patch, and would make the
> >> >vsock more complex. The current conclusion is that we will keep the concept
> >> >of grouping as a placeholder, but we will not use it.
> >>
> >> IMO we should first clarify better what we want to support.
> >> As I already suggested some months ago, IMHO supporting any number of
> >> vsock devices for a VM it's not really needed for your goal and I can't
> >> see other use cases where a virtio-net device can't be use. Just a
> >> reminder, vsock is not a network device, is more a P2P device where we
> >> want to keep the configuration in the guest as simpler as possible (we
> >> don't want to run ARP, DHCP, etc.).
> >
> >Agree that.
> >
> >> Till now vsock was more used just for guest-host communication, but
> >> recently it was extended to communicate with sibling VMs.
> >>
> >> IIUC your use case, we just need to support different type of vsock
> >> devices attached to the VM. With "type" I mean type of address handled.
> >> I think we can define 3 types based on the CID we have:
> >> - hypervisor: VMADDR_CID_HYPERVISOR(0)
> >> - host: VMADDR_CID_HOST(2)
> >> - sibling: CID >=3
> >>
> >> The vhost-vsock device handles only VMADDR_CID_HOST, so it doesn't allow
> >> to reach from the guest any other CIDs.
> >> The vhost-user-vsock recently started to support sibling VMs.
> >> The tcp-over-vsock of libkrun should use VMADDR_CID_HYPERVISOR(0).
> >>
> >> So, IMHO we should define new features or config flags that a device can
> >> expose depending on which address is able to handle.
> >> Also, in order to avoid to overcomplicate vsock, we should allow only
> >> one device for each type (a single device should support multiple types,
> >> but only one device can be registered for a type).
> >
> >I think only one device can be registered for sibling and hypervisor. And
> >it is possible to have multiple devices for host. Otherwise, the goals of
> >this patch will be not achieved.
> 
> Why?
> 
> IMO, as I already wrote, the libkrun service should use CID=0.

As we before discussed, if there is only one backend for the libkrun
service, we can use cid=0. I totally agree with you. So let us put this
case aside first.

> How you will handle multiple devices for host? How can the guest know 
> which device to use to reach HOST(2)?

Do `bind()` explicitly, and a device with matching cid will be picked up.

> IMO is easier to have the multiple device for sibling (e.g. the device 
> can advertise which dest CID its supports), but not for host.

I think one device for sibling is enough. For example, dev1 is enough for
communication with dev3 and dev4. So we don't need dev2 for sibling in the
first VM, right?

+──kernel(vhost-vsock)──────────────────────────────────────────────+    
│+──────────────+ +──────────────+ +──────────────+ +──────────────+│    
││  dev1(cid1)  │ │  dev2(cid2)  │ │  dev3(cid3)  │ │  dev4(cid4)  ││    
│+──────────────+ +──────────────+ +──────────────+ +──────────────+│    
+────────▲────────────────▲────────────────▲────────────────▲───────+    
         │                │                │                │            
         │                │          ┌─────┘                │            
         │                │          │                      │            
+────────┴───────────+    │ +────────┴───────────+ +────────┴───────────+
│+──────────────+ VM0│    │ │+──────────────+ VM1│ │+──────────────+ VM2│
││dev1(cid1,def)│    │    │ ││dev3(cid3,def)│    │ ││dev4(cid4,def)│    │
│+──────────────+    │    │ │+──────────────+    │ │+──────────────+    │
│+──────────────+    │    │ │                    │ │                    │
││  dev2(cid2)  │────┼────┘ │                    │ │                    │
│+──────────────+    │      │                    │ │                    │
+────────────────────+      +────────────────────+ +────────────────────+

The things go different for devices for host:

1. For dev1, it is used for sibling (dev1 <-> dev4), and the host
(src_cid=cid1, dst_cid=2) means the real host (not a userapp), where
doesn't show in the diagram.
2. For dev2 (src_cid=cid2), the host (dst_cid=2) is userapp1;
3. For dev3 (src_cid=cid3), the host (dst_cid=2) is userapp2.

+──kernel(vhost-vsock)──────────────────────────────────────────────+    
│+──────────────+                                   +──────────────+│    
││  dev1(cid1)  │                                   │  dev4(cid4)  ││    
│+──────────────+                                   +──────────────+│    
+────────▲──────────────────────────────────────────────────▲───────+    
         │                                                  │            
+────────┴───────────+     +────────────────────+           │            
│+──────────────+ VM0│     │+──────────────+    │           │            
││dev1(cid1,def)│    │┌────▶│  dev2(cid2)  │    │  +────────┴───────────+
│+──────────────+    ││    │+──────────────+    │  │+──────────────+ VM2│
│+──────────────+    ││    │            userapp1│  ││dev4(cid4,def)│    │
││  dev2(cid2)  │────┼┘    +────────────────────+  │+──────────────+    │
│+──────────────+  vhost-user-vsock─────────────+  │                    │
│+──────────────+    │     │+──────────────+    │  │                    │
││  dev3(cid3)  │────┼─────▶│  dev3(cid3)  │    │  │                    │
│+──────────────+    │     │+──────────────+    │  +────────────────────+
+────────────────────+     │            userapp2│                        
                           +────────────────────+                        

Thanks,
Xuewei

> >
> >Then, we can get rid of the group concept.
> >
> >Big thanks for your constructive ideas :)
> 
> You're welcome :-)
> 
> Stefano
