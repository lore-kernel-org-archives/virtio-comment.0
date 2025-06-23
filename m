Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8F824DD0A
	for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 13:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750684103; cv=none; b=Z57hIqa0O/3ll5HlZpoUu6UIXrq+Bg8O+hoO96wTnaS0ytmR8tCLHZZiHGrzO8wfyB2mHWsatVW0HWbWjEbrHKJPsLyNyDK4mnkAYJGR7z+/P7/y2aQLqHH3s4Pa/Gka4Br/LTC97skaRAZ5zjTCc7vHtJIT/y09MCAUBPbnQdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750684103; c=relaxed/simple;
	bh=z235zuVOqZEFogSdPjKpQ3NuSTKU3jDynzpZFYO0v9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=OpXAvKDmw7pIKS35gcWGBdsIhKujISJ91GzEluwUE9rjvdlSCdIfOAzkNbdJjFyZwMClPuWF+miDIYJzYIHf1J4AHZtC8K8U+pOnzT9a6lj2BKpjnoEMUJM9KNCTO8O9GC7EBkIulYAEy7MhEAARBNu31c7lt3myu+xqi4syTUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S0RHAIex; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S0RHAIex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750684097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bla9XNnyMuzw+t8kto8Q/YnJzaF7GFb9IsWRsYpg+8=;
	b=S0RHAIexAAdigceQausyimtnaHnbjaXcN7TyPHRGDMdFocGdZtlbPpxiYHLDqUXHj3x6aZ
	LDw9bqFiDACjLbG+UBpFOB3SXSvmUxZsyG4djVOuW7WCRg0Ua/C9meV3tCEB0Ho5yccOnM
	oM0RlZ6VEVPUX906gcCfce264cYHC6s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-Mw9yrmJINLmogsOPU-qneg-1; Mon, 23 Jun 2025 08:52:21 -0400
X-MC-Unique: Mw9yrmJINLmogsOPU-qneg-1
X-Mimecast-MFC-AGG-ID: Mw9yrmJINLmogsOPU-qneg_1750683141
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a523ce0bb2so2309642f8f.0
        for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 05:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750683141; x=1751287941;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2bla9XNnyMuzw+t8kto8Q/YnJzaF7GFb9IsWRsYpg+8=;
        b=I9nz3mxJjdVKjSQMuRrjwYp2CZM5662iCs0DC6WMHlrbHUcnayP0fD+/gAzfEZBs5u
         9bOmM6VplwVec4tGjdFyCOC9pqAFErZWAE+UJ3I+k2aO6U+GqYUlxqaW9nQ5L7LwSfoJ
         Hnyow+aYVcpapQk/wSAMOxrbfDUQOyh9jY8viZ4cXKxsTupIrgNSleZhI5r67+Gy7ck2
         TtHJbIi6Zgvnr5RgNEuP23qdV6jZb/YBllw2R9437Z/l2t7szP1m6WILZZClqP5CDLYv
         xJrPVmlY9jXdrTWIT1yG6eB1rprwaGcASYqi8n1dqsE7WI+93IU+wPlF7kM3UujDjX7b
         uhNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdGdsXKTitTt1O+UX3dsjMGkzeDFXmduhGSx1FAk0zLU3T6DE5xzX8VVCLJb3GAwt8OrTYEcqovzTho4OQfw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZhw8yCLNTpCgIsj7uQSjlzs9996yL/kNli1RfPCh6HlXsyNN6
	4XmO/WQViKOrf2Z+CnJhrUW4hSHJ8loXoOZCC2qB2n9GkbdoG0EK/4jRCOmAC7rKsJB9MoHYLsQ
	8vVQg5vUvQdJfxziJZFmcX2ZQFvCNyQmu0VWFxkztNhKLlYCfKZfnevlBW2PEf5vYuZsL
X-Gm-Gg: ASbGnctYYOYscYk5m4pSV1WcXfvB0/UEjzBuPPPHRxnFR5pJHSU63/+UR0rRtiDU0wE
	+FFghex/snZes0dABhknnt5CWMn40xMT920vgAmV89h0sbsoCN+HIb8df34g45+heETdzDZg+Oa
	pXWtusBruNLKhPbVuc53WH3iT2aGkJUNO9zQM1O96n6XKFHrBVKliq7X84meZKiXNgUN3cytffB
	ZLgftzrTBroyXVnGcDEoA7eLumtx95mB+Mole/e7xVW/xoKpYW784TR3RQI6e93OlYGj6O6ZvJH
	Q1q0kkBGCqrNfdG8+Pn9PmPJLFg=
X-Received: by 2002:a05:6000:230b:b0:3a5:8a68:b823 with SMTP id ffacd0b85a97d-3a6d12af83bmr8892043f8f.23.1750683140569;
        Mon, 23 Jun 2025 05:52:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF/sUBEnGhEW91idqm+U/245arTH0IcMQsigA5mgGgN8LoEwIUwln0tQnUa9Yeq1cerGeYsg==
X-Received: by 2002:a05:6000:230b:b0:3a5:8a68:b823 with SMTP id ffacd0b85a97d-3a6d12af83bmr8892013f8f.23.1750683139923;
        Mon, 23 Jun 2025 05:52:19 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.202.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45364703701sm110480895e9.27.2025.06.23.05.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 05:52:19 -0700 (PDT)
Date: Mon, 23 Jun 2025 14:51:56 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Message-ID: <s6rxycmztea6cryhsxbeyljhvptduue2h67wy2vrbffseorops@ht6iocaszizf>
References: <bswghcrtbm3tgfadpzjidjeng4hd6wnhpodu3hpgxqe7x7aa6m@zqctemeqotaf>
 <20250623121407.1665067-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250623121407.1665067-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tsxrJyDCHWJLqUCmJALoEUInw8HZzUCUz9dH-rVfA6E_1750683141
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jun 23, 2025 at 08:14:07PM +0800, Xuewei Niu wrote:
>> On Mon, Jun 23, 2025 at 06:35:59PM +0800, Xuewei Niu wrote:
>> >> On Mon, Jun 23, 2025 at 04:48:33PM +0800, Xuewei Niu wrote:
>> >> >> On Thu, Jun 19, 2025 at 01:10:33PM +0800, Xuewei Niu wrote:
>> >> >> >> > From: Xuewei Niu <niuxuewei97@gmail.com>
>> >> >> >> > Sent: 19 June 2025 08:57 AM
>> >> >> >> >
>> >> >> >> > Hi Parav,
>> >> >> >> >
>> >> >> >> > Could you please take a look at the diagram in [1]?
>> >> >> >> >
>> >> >> >> > IIUC, for VM0, there are two groups, and for VM1, there is only one group.
>> >> >> >> > Am I right? If yes, I think the group concept is reasonable but we don't need
>> >> >> >> > at this time.
>> >> >> >> >
>> >> >> >> > I think the first thing is to figure out how to pick the right group.
>> >> >> >> >
>> >> >> >> > Standard socket doesn't provide a way to access the group information.
>> >> >> >> >
>> >> >> >> > Source and destination are from `bind()` and `connect()`, respectively. If we
>> >> >> >> > don't call `bind()`, only the destination is known.
>> >> >> >> >
>> >> >> >> > However, only destination is not enough to find the group. For example, the
>> >> >> >> > well-known CIDs (e.g. 2) are valid for all groups.
>> >> >> >> >
>> >> >> >> > 1:
>> >> >> >> > https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/
>> >> >> >>
>> >> >> >> Right. Sock addressing scheme is naïve presently to select the group.
>> >> >> >> Not sure when/how you or others plan to do.
>> >> >> >> This is transport layer problem to solve (not to confuse with transport = pci/mmio etc).
>> >> >>
>> >> >>
>> >> >> >>
>> >> >> >> However, at device level, we should have the construct of grouping.
>> >> >> >> Without this construct, all devices will be part of single group and one will not be able to build the group concept later.
>> >> >> >> So even if you don't need it explicitly now, grouping the device is what you need when connect() is called.
>> >> >> >>
>> >> >> >> So I was imagining a relatively simple scheme:
>> >> >> >> For example, virtio device level, some kind of group id is present.
>> >> >> >> So two devices which has same group id, are part of single group.
>> >> >> >> An example group id format can be a UUID.
>> >> >> >>
>> >> >> >> And this is completely optional for devices to implement.
>> >> >> >> Generic enough and usable beyond just vsock device in other use cases
>> >> >> >> we discussed in past.
>> >> >> >
>> >> >> >Fair enough.
>> >> >> >
>> >> >> >@Stefano, could you please take a look at this? I'd love to have some
>> >> >> >input
>> >> >> >from you.
>> >> >> >
>> >> >> >A brief summary of the idea is: The config space will be extended to
>> >> >> >include a group id. The devices with the same group id are considered
>> >> >> >to be
>> >> >> >in the same group.
>> >> >>
>> >> >> Thanks for the summary, but please avoid top posting, otherwise is very
>> >> >> hard to follow the discussion :-(
>> >> >> https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replying
>> >> >
>> >> >Sorry, I'll avoid it in the future.
>> >> >
>> >> >> I like the idea of groups. What is not clear to me, is how groups will
>> >> >> allow the driver to select the default output device when the source
>> >> >> socket is not bind to any source CID.
>> >> >
>> >> >Well, we did discuss, but we need your input.
>> >> >
>> >> >I said in the thread [1] based on the standard socket API, the driver can't
>> >> >pick a group. Parav [2] suggested that the group, as a basic concept,
>> >> >should be present even if we are unable to use it.
>> >> >
>> >> >IMHO, we might use "{group_id}-{cid}" as the vsock addressing scheme to use
>> >> >the concept. But it is a very big change, leading to incompatibility with
>> >> >the existing apps.
>> >>
>> >> I still don't understand how the group_id will work :-( and how will
>> >> allow the driver to pick the default device.
>> >
>> >FYI, here is trying to explain what is group and why it is needed, but I
>> >agree with you about the idea of "types".
>> >
>> >I posted a diagram in the thread [1]. I think the group is something like a
>> >"namespace". I think it is reasonable, but my concerns are compatibility
>> >and complexity.
>> >
>> >1: https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/
>> >
>> >> This is the `sockaddr_vm`, so we should be careful of extending it:
>> >>
>> >> struct sockaddr_vm {
>> >> 	__kernel_sa_family_t svm_family;
>> >> 	unsigned short svm_reserved1;
>> >> 	unsigned int svm_port;
>> >> 	unsigned int svm_cid;
>> >>
>> >> #define VMADDR_FLAG_TO_HOST 0x01
>> >>
>> >> 	__u8 svm_flags;
>> >> 	unsigned char svm_zero[sizeof(struct sockaddr) -
>> >> 			       sizeof(sa_family_t) -
>> >> 			       sizeof(unsigned short) -
>> >> 			       sizeof(unsigned int) -
>> >> 			       sizeof(unsigned int) -
>> >> 			       sizeof(__u8)];
>> >> };
>> >>
>> >> >I think it might be beyond the scope of this patch, and would make the
>> >> >vsock more complex. The current conclusion is that we will keep the concept
>> >> >of grouping as a placeholder, but we will not use it.
>> >>
>> >> IMO we should first clarify better what we want to support.
>> >> As I already suggested some months ago, IMHO supporting any number of
>> >> vsock devices for a VM it's not really needed for your goal and I can't
>> >> see other use cases where a virtio-net device can't be use. Just a
>> >> reminder, vsock is not a network device, is more a P2P device where we
>> >> want to keep the configuration in the guest as simpler as possible (we
>> >> don't want to run ARP, DHCP, etc.).
>> >
>> >Agree that.
>> >
>> >> Till now vsock was more used just for guest-host communication, but
>> >> recently it was extended to communicate with sibling VMs.
>> >>
>> >> IIUC your use case, we just need to support different type of vsock
>> >> devices attached to the VM. With "type" I mean type of address handled.
>> >> I think we can define 3 types based on the CID we have:
>> >> - hypervisor: VMADDR_CID_HYPERVISOR(0)
>> >> - host: VMADDR_CID_HOST(2)
>> >> - sibling: CID >=3
>> >>
>> >> The vhost-vsock device handles only VMADDR_CID_HOST, so it doesn't allow
>> >> to reach from the guest any other CIDs.
>> >> The vhost-user-vsock recently started to support sibling VMs.
>> >> The tcp-over-vsock of libkrun should use VMADDR_CID_HYPERVISOR(0).
>> >>
>> >> So, IMHO we should define new features or config flags that a device can
>> >> expose depending on which address is able to handle.
>> >> Also, in order to avoid to overcomplicate vsock, we should allow only
>> >> one device for each type (a single device should support multiple types,
>> >> but only one device can be registered for a type).
>> >
>> >I think only one device can be registered for sibling and hypervisor. And
>> >it is possible to have multiple devices for host. Otherwise, the goals of
>> >this patch will be not achieved.
>>
>> Why?
>>
>> IMO, as I already wrote, the libkrun service should use CID=0.
>
>As we before discussed, if there is only one backend for the libkrun
>service, we can use cid=0. I totally agree with you. So let us put this
>case aside first.
>
>> How you will handle multiple devices for host? How can the guest know
>> which device to use to reach HOST(2)?
>
>Do `bind()` explicitly, and a device with matching cid will be picked up.

Okay, but why you need 2 devices to communicate with the same CID, host 
in this case (CID=2)?
IMO use the source CID to multiplex a socket at destination is not 
great. But I can be wrong.

>
>> IMO is easier to have the multiple device for sibling (e.g. the device
>> can advertise which dest CID its supports), but not for host.
>
>I think one device for sibling is enough.

I also think one should be enough, but IMO I think it might make more 
sense to have multiple devices in this case, where each device can 
handle a pool of CIDs, then the hard part will be figuring out how to 
allocate the CIDs, etc. so yes, I agree that having one device even in 
this case is the easiest thing.

>For example, dev1 is enough for
>communication with dev3 and dev4. So we don't need dev2 for sibling in the
>first VM, right?

Just a note, vhost-vsock is not allowing any sibling communication.
vhost-user-vsock can do it, but we don't want to bring any support in 
vhost-vsock to not overcomplicate it (again it will become like a 
network switch, requiring firewalls, etc.)

>
>+──kernel(vhost-vsock)──────────────────────────────────────────────+
>│+──────────────+ +──────────────+ +──────────────+ +──────────────+│
>││  dev1(cid1)  │ │  dev2(cid2)  │ │  dev3(cid3)  │ │  dev4(cid4)  ││
>│+──────────────+ +──────────────+ +──────────────+ +──────────────+│
>+────────▲────────────────▲────────────────▲────────────────▲───────+
>         │                │                │                │
>         │                │          ┌─────┘                │
>         │                │          │                      │
>+────────┴───────────+    │ +────────┴───────────+ +────────┴───────────+
>│+──────────────+ VM0│    │ │+──────────────+ VM1│ │+──────────────+ VM2│
>││dev1(cid1,def)│    │    │ ││dev3(cid3,def)│    │ ││dev4(cid4,def)│    │
>│+──────────────+    │    │ │+──────────────+    │ │+──────────────+    │
>│+──────────────+    │    │ │                    │ │                    │
>││  dev2(cid2)  │────┼────┘ │                    │ │                    │
>│+──────────────+    │      │                    │ │                    │
>+────────────────────+      +────────────────────+ +────────────────────+
>
>The things go different for devices for host:
>
>1. For dev1, it is used for sibling (dev1 <-> dev4), and the host
>(src_cid=cid1, dst_cid=2) means the real host (not a userapp), where
>doesn't show in the diagram.

This is not going to happen (see above).

>2. For dev2 (src_cid=cid2), the host (dst_cid=2) is userapp1;
>3. For dev3 (src_cid=cid3), the host (dst_cid=2) is userapp2.
>
>+──kernel(vhost-vsock)──────────────────────────────────────────────+
>│+──────────────+                                   +──────────────+│
>││  dev1(cid1)  │                                   │  dev4(cid4)  ││
>│+──────────────+                                   +──────────────+│
>+────────▲──────────────────────────────────────────────────▲───────+
>         │                                                  │
>+────────┴───────────+     +────────────────────+           │
>│+──────────────+ VM0│     │+──────────────+    │           │
>││dev1(cid1,def)│    │┌────▶│  dev2(cid2)  │    │  +────────┴───────────+
>│+──────────────+    ││    │+──────────────+    │  │+──────────────+ VM2│
>│+──────────────+    ││    │            userapp1│  ││dev4(cid4,def)│    │
>││  dev2(cid2)  │────┼┘    +────────────────────+  │+──────────────+    │
>│+──────────────+  vhost-user-vsock─────────────+  │                    │
>│+──────────────+    │     │+──────────────+    │  │                    │
>││  dev3(cid3)  │────┼─────▶│  dev3(cid3)  │    │  │                    │
>│+──────────────+    │     │+──────────────+    │  +────────────────────+
>+────────────────────+     │            userapp2│
>                           +────────────────────+
>

I'm really confused with `cid1`, `cid2`, etc. Are they any number >= 3?
I'd suggest to use real value (e.g. cid=42).

So what dest CID the VM0 is supposed to use to talk with userapp1 and 
userapp2? In both cases CID=2, right?

Why you need 2 vhost-user-vsock devices?
Can you just have a single one and have the application 
connecting/listing on different port? (which is the sense of the port, 
multiplexing application on the destination)

Thanks,
Stefano

