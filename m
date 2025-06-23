Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437F4248883
	for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 10:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674970; cv=none; b=OOnUfBKuVYxLRUr3DcDCYpi6xw4a69c6Bx75BaKh+Qg+cyICUO/q7fao9onxJVOFlEgSKTqfO9fIbMt9iVGm5edHvh2BBvvZQoxkPKrK+rntCc0ac2CeP2SBuwmq4Q8qiM3atSOqEBqFY834CWmbVeSQhQfTicxOMfxEKW0tnAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674970; c=relaxed/simple;
	bh=9gKkHqSnSfyep5F5KtyQEIOd8Hhu9xrnyednYqF7Qyc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jl/ZV3S7gEXP5D1T7y/b3LJ8ycU4UUdl5uvNdvn81lywyYmvo2weseTyaOJpvxNmi3EJ/qpu0I9P3wbjnV1+2Q7u/UEIt/1sWo5RU3SgVmsJYIoMZPAjQ3bqLj9iOd5YLItsUSqp6clZndX1nl2RrevI9xAl2TopGJSVQ3i5268=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cld1d3Uw; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cld1d3Uw"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2360ff7ac1bso26759225ad.3
        for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 03:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750674968; x=1751279768; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oODs7Mx2MSKF1ECCJUA16QrnMGU+S8MVQEkEWxbmhW4=;
        b=Cld1d3UwbClQF4aIP6uzEwbt6ld0Meq11fDhA/uLI9fD/8pWrVCgrR7mhCXkdp6SEP
         Wvr86L8OxRFmeMVnS+XHK2iDUZaeM1hocrJDNCvp/Klg1t98wYwAAZ2Qihne9FlxEXV9
         HghxoVuMYP8KLD/BBeJwgvYnWQ3tDz+B2jasyU2SGMPzIYz9Rju0adgkbw4MQC4odHiB
         pDHeSdw0Rj8121EOhExPpz/OAfiB4CD4IaAo+Ff0lXGx6z5Jltz3txuinWy+mZcHjzhw
         yZxxhAKa9yCI/waTxWcujGw2iqq90TIDRYmDHhDA2auv21gpCYC0kEhHnwPMvRVLaYao
         GZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750674968; x=1751279768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oODs7Mx2MSKF1ECCJUA16QrnMGU+S8MVQEkEWxbmhW4=;
        b=hUakFjGTOclNYL123oJ3kfYIzpchjZ9JhvR9k0h5+fuaVKW+msGaY0Dr0h/fCcy8hM
         AQSVRb4uVkpC3rEWkHRrBeo4Tz7F327387kpcKF2MeUSniXL7Cu9RzmFnAnMHHedgeJA
         YUNwEJsZ0SfzYNJe0kObDZk1L1FyigozGbQM5hqcAA4eb1CXaO1NVwFHP1qGPGzDORJq
         OL24P63XObDhSeUtwDxAzuCYFqNnnRypY13UEPHweoW0cLx0TkuHYwbNw6UWF5NfWGW0
         avLjZTDMupY1tL5kiKOenTem8mh7WXxIMYWl0wy8ggWjGCKV8QRAqJD8rBzId/AB+SfM
         r0Jw==
X-Forwarded-Encrypted: i=1; AJvYcCW/tpLF6kfe2LLJe6gdHYDXxiJdcVRpLwhsUSrBaBOsB8y7Xm3Sp9s+TnzXC+dFQhwni14oSMAx6oNb1/ZUmg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5Gx0ZG2fV8nW2mbCjtUpCqWqKfvhJX3il1aizGQ56Y1dJMVob
	D8j1rMHyS5nIGzaowN0oZrNAgoizKGPHMdlYAL0GsnoLKEtmuBZ878Mw
X-Gm-Gg: ASbGncuzC0w+DY1er9BXhXuxyvG9f2n+zqsSNNzPevBnqc58DCpet4TF94PtWfXhoX7
	LYoz2lnnZ0JadE0qN9kifCqOj0CBzAQePslzB8d+OXOIi+mZ52yW9Li5w90IW2Tleq6bQ9vGcQX
	yn9A3kZHToSvOQEzbIgeZqXe/vuLTBF8corjiLkwhisiYSEWHheajG+CR8647zJyHXf860qS/Aj
	wAX366NzLuWOlfnUIrJpIdstDacUINKJSbZ8ZEZHrNSUHeoAwG3C+VMliCx+yc0BMDpzesRqTZJ
	7ukLQrDsu34vAuLauGHHmkpA7TQWEpUz1rA8wgcRCVT4aPtaPSPCt/vJyMs3yRq7uXI3POdX5zw
	6PuZntmea
X-Google-Smtp-Source: AGHT+IGGAX3V9pILFuH78LBFJACePp/FIxrYFY69NcEu8DC9g9XI6+OeEwoZ0iFqhMNVYlRCg9j8+Q==
X-Received: by 2002:a17:903:1a4c:b0:234:c8f6:1b03 with SMTP id d9443c01a7336-237d9b1af90mr149205285ad.47.1750674968220;
        Mon, 23 Jun 2025 03:36:08 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860a426sm80713875ad.117.2025.06.23.03.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:36:07 -0700 (PDT)
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
Date: Mon, 23 Jun 2025 18:35:59 +0800
Message-Id: <20250623103559.1656206-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ncciiv3udhy6mylzobtt5jnp3xwthtfvuwonb7i5c5hkpcyfc2@utxcie3jxof2>
References: <ncciiv3udhy6mylzobtt5jnp3xwthtfvuwonb7i5c5hkpcyfc2@utxcie3jxof2>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Mon, Jun 23, 2025 at 04:48:33PM +0800, Xuewei Niu wrote:
> >> On Thu, Jun 19, 2025 at 01:10:33PM +0800, Xuewei Niu wrote:
> >> >> > From: Xuewei Niu <niuxuewei97@gmail.com>
> >> >> > Sent: 19 June 2025 08:57 AM
> >> >> >
> >> >> > Hi Parav,
> >> >> >
> >> >> > Could you please take a look at the diagram in [1]?
> >> >> >
> >> >> > IIUC, for VM0, there are two groups, and for VM1, there is only one group.
> >> >> > Am I right? If yes, I think the group concept is reasonable but we don't need
> >> >> > at this time.
> >> >> >
> >> >> > I think the first thing is to figure out how to pick the right group.
> >> >> >
> >> >> > Standard socket doesn't provide a way to access the group information.
> >> >> >
> >> >> > Source and destination are from `bind()` and `connect()`, respectively. If we
> >> >> > don't call `bind()`, only the destination is known.
> >> >> >
> >> >> > However, only destination is not enough to find the group. For example, the
> >> >> > well-known CIDs (e.g. 2) are valid for all groups.
> >> >> >
> >> >> > 1:
> >> >> > https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/
> >> >>
> >> >> Right. Sock addressing scheme is naïve presently to select the group.
> >> >> Not sure when/how you or others plan to do.
> >> >> This is transport layer problem to solve (not to confuse with transport = pci/mmio etc).
> >>
> >>
> >> >>
> >> >> However, at device level, we should have the construct of grouping.
> >> >> Without this construct, all devices will be part of single group and one will not be able to build the group concept later.
> >> >> So even if you don't need it explicitly now, grouping the device is what you need when connect() is called.
> >> >>
> >> >> So I was imagining a relatively simple scheme:
> >> >> For example, virtio device level, some kind of group id is present.
> >> >> So two devices which has same group id, are part of single group.
> >> >> An example group id format can be a UUID.
> >> >>
> >> >> And this is completely optional for devices to implement.
> >> >> Generic enough and usable beyond just vsock device in other use cases
> >> >> we discussed in past.
> >> >
> >> >Fair enough.
> >> >
> >> >@Stefano, could you please take a look at this? I'd love to have some
> >> >input
> >> >from you.
> >> >
> >> >A brief summary of the idea is: The config space will be extended to
> >> >include a group id. The devices with the same group id are considered
> >> >to be
> >> >in the same group.
> >>
> >> Thanks for the summary, but please avoid top posting, otherwise is very
> >> hard to follow the discussion :-(
> >> https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replying
> >
> >Sorry, I'll avoid it in the future.
> >
> >> I like the idea of groups. What is not clear to me, is how groups will
> >> allow the driver to select the default output device when the source
> >> socket is not bind to any source CID.
> >
> >Well, we did discuss, but we need your input.
> >
> >I said in the thread [1] based on the standard socket API, the driver can't
> >pick a group. Parav [2] suggested that the group, as a basic concept,
> >should be present even if we are unable to use it.
> >
> >IMHO, we might use "{group_id}-{cid}" as the vsock addressing scheme to use
> >the concept. But it is a very big change, leading to incompatibility with
> >the existing apps.
> 
> I still don't understand how the group_id will work :-( and how will 
> allow the driver to pick the default device.

FYI, here is trying to explain what is group and why it is needed, but I
agree with you about the idea of "types".

I posted a diagram in the thread [1]. I think the group is something like a
"namespace". I think it is reasonable, but my concerns are compatibility
and complexity.

1: https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/

> This is the `sockaddr_vm`, so we should be careful of extending it:
> 
> struct sockaddr_vm {
> 	__kernel_sa_family_t svm_family;
> 	unsigned short svm_reserved1;
> 	unsigned int svm_port;
> 	unsigned int svm_cid;
> 
> #define VMADDR_FLAG_TO_HOST 0x01
> 
> 	__u8 svm_flags;
> 	unsigned char svm_zero[sizeof(struct sockaddr) -
> 			       sizeof(sa_family_t) -
> 			       sizeof(unsigned short) -
> 			       sizeof(unsigned int) -
> 			       sizeof(unsigned int) -
> 			       sizeof(__u8)];
> };
>
> >I think it might be beyond the scope of this patch, and would make the
> >vsock more complex. The current conclusion is that we will keep the concept
> >of grouping as a placeholder, but we will not use it.
> 
> IMO we should first clarify better what we want to support.
> As I already suggested some months ago, IMHO supporting any number of 
> vsock devices for a VM it's not really needed for your goal and I can't 
> see other use cases where a virtio-net device can't be use. Just a 
> reminder, vsock is not a network device, is more a P2P device where we 
> want to keep the configuration in the guest as simpler as possible (we 
> don't want to run ARP, DHCP, etc.).

Agree that.

> Till now vsock was more used just for guest-host communication, but 
> recently it was extended to communicate with sibling VMs.
> 
> IIUC your use case, we just need to support different type of vsock 
> devices attached to the VM. With "type" I mean type of address handled.
> I think we can define 3 types based on the CID we have:
> - hypervisor: VMADDR_CID_HYPERVISOR(0)
> - host: VMADDR_CID_HOST(2)
> - sibling: CID >=3
> 
> The vhost-vsock device handles only VMADDR_CID_HOST, so it doesn't allow 
> to reach from the guest any other CIDs.
> The vhost-user-vsock recently started to support sibling VMs.
> The tcp-over-vsock of libkrun should use VMADDR_CID_HYPERVISOR(0).
> 
> So, IMHO we should define new features or config flags that a device can 
> expose depending on which address is able to handle.
> Also, in order to avoid to overcomplicate vsock, we should allow only 
> one device for each type (a single device should support multiple types, 
> but only one device can be registered for a type).

I think only one device can be registered for sibling and hypervisor. And
it is possible to have multiple devices for host. Otherwise, the goals of
this patch will be not achieved.

Then, we can get rid of the group concept.

Big thanks for your constructive ideas :)

Thanks,
Xuewei

> If we don't want this limitation, I think we need to overcomplicate 
> vsock and define some kind of discovery algorithm that the guest driver 
> should run to understand which CIDs are reachable for each device.
> But I'm not sure we really want this; if this is a use case, the guest 
> should use a virtio-net device that already support this pretty well, so 
> before going on this direction, we should define better why we want to 
> complicate vsock, instead of using a net device.
> 
> Thanks,
> Stefano
