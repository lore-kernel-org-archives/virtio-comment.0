Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D52810E9
	for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 11:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676483; cv=none; b=f76wNrAaXMBP2NHWCOqw5/OBQHSc5SgHP7CvNYassaqrBAVhyLxEjoMa6aADw8OU+xbPyiJOIfEp2ZcITinGAzPtzwGXA2XMOty32DHvkkUX1EmFaYbtIvffTdgpT7yfzygHCQekMY2xSoVNBm08SEcUtyRLZwhve5awwE98FRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676483; c=relaxed/simple;
	bh=+kpXEt4aoxeXTTDPJYNVx3osD/07UgZilCnQDaZF3q4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hWOzLD2QTgmU50wZTrrtEkUn9gOKoBuYpsCqP/9l0vKnMRlJobD/BIl6BQ7NBdPcs2fSGwBgnXj8zlixQe7IW1od/IORkltgcrgsHlkfOFeQ8uzzrsNYZO8S1v/T5A6HgC8IZEx+XNdOw/SLAaAwmJAQtSj0QY7MgNJM6riQKqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciw1rJVs; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciw1rJVs"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-23633a6ac50so55090795ad.2
        for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 04:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750676481; x=1751281281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddQGdVfV+taGS6y1daQ24zozO0ln49D96vYQHeDnHRs=;
        b=ciw1rJVsJqZRPzdac7ThX9/bYUrA1zGoyBU5sfVgctGNhNxJfmxiziMgiebOWTdTSk
         IQG9pO8SNtsgfmJURqOL2NVvmtOUnwGOH+pmey6oBsIkQNKDJAUsI2ubce9dbxMiykQW
         /z+f0af2CUJsMSJu8qc8SBp9Mu15ihfvqTVyDoERnLNKxqScly+9GGKrF1xJnwd56AQm
         hzLloguR7Is6NgGfFF6d1KcfVzbrYU0ahE0owmhRU4rbtb/fP4lkATTMH2JFxLf1g2b6
         BvxY8b1MrbAZ98qFmapdIP+fHxNYFrOH7L6+WuvF+tl+l2Wnf1eiG0ZnakFCy57ezU04
         TflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750676481; x=1751281281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddQGdVfV+taGS6y1daQ24zozO0ln49D96vYQHeDnHRs=;
        b=o2rrdmTBMwyw3+oqFp3TxI5R9IV+0e/ua79qf9Ky8BqiksL7yQoNqLWw/eq2J5dqfc
         ireQ9OEwEyckCGyAGehbWQc8FtgMCMczI7ZNeHpZPvLhjwrpMAJ9VcLV1QNoZEFIhcMV
         rQoiGx1+shNxSziATb5cQa+JGgCsin6KoM1SVFFvfIoyAgiAL8uWxBMiBwUZvt/1DMic
         jrq6nlyEdWgU2Rwn2iAA+RiC07HLwIbwvMKOi0VK9bwGdKabNhOMl6tF5kccu5iR7hvt
         JQacqOu3m9VvOza+xCxEre88Gg5xSvn6vLkgv3QeX0q6e00FJlofHzJrfHyTP8JJrRqV
         dvBA==
X-Forwarded-Encrypted: i=1; AJvYcCUljP0YXOzkK873fo9PRumiBGae6dYW2zhGOZ44+Uv4zKIgzMKpQCjqJoPqEb83yovnkTD2kz+skHn3jXiHng==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgSYFaZKF4zl8Zp6rThDQGkDy8Z3+FXBXdVVJQ8ZhF/rtxPn0Y
	GxiOS/6Oa4zEPrZkzsWbzGxaGuaMuZt9KiTGDFzjpefhrCdJ81X8+TAW
X-Gm-Gg: ASbGnctmtffQwZ1BeiR/QWGEj/gnJYr6oqIxsUeTsWnG0LfsDbyZ1/GCt/D2sR9RGDF
	b/2tKRT49C7zhymwXjpbT0HvfF/VqamiAWQACRnma41opNeh65Ddipy1ixMF9JTtY2Dfptxli2A
	iSiazo4UnWLBJ3C2om8/bB5YZbtuRXNLHbFGD2Vsha0Wn3n4Ij/+wBWi4lGpIH3IRHfrhaw3Gnt
	075rDypKMmJL2QRbqAgR9uj2I7vOJgip6y/tcKDJpHdZIhe+6TgXs9qb2XMcf3veyzbpkmKpH4r
	LtjrNzyuZmwzdASG106FfRryjXe2tgyDnlGCptTCXnIFX4P0gg/88Cs+wnGwLJWMGIV3cVtSo3J
	R7nEHOUX0
X-Google-Smtp-Source: AGHT+IF21PFrC2ZElMF/VZtd0+fM3zYqOzTYsWC3UECSpKRY4CN1VCQRr4fxXp5VyE/Ec6FFEaSFUg==
X-Received: by 2002:a17:903:2352:b0:234:e8db:432d with SMTP id d9443c01a7336-237d991821bmr179189465ad.39.1750676481308;
        Mon, 23 Jun 2025 04:01:21 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d839389esm81051335ad.41.2025.06.23.04.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 04:01:20 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: niuxuewei97@gmail.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	parav@nvidia.com,
	sgarzare@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Date: Mon, 23 Jun 2025 19:01:12 +0800
Message-Id: <20250623110112.1657205-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623103559.1656206-1-niuxuewei.nxw@antgroup.com>
References: <20250623103559.1656206-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> > On Mon, Jun 23, 2025 at 04:48:33PM +0800, Xuewei Niu wrote:
> > >> On Thu, Jun 19, 2025 at 01:10:33PM +0800, Xuewei Niu wrote:
> > >> >> > From: Xuewei Niu <niuxuewei97@gmail.com>
> > >> >> > Sent: 19 June 2025 08:57 AM
> > >> >> >
> > >> >> > Hi Parav,
> > >> >> >
> > >> >> > Could you please take a look at the diagram in [1]?
> > >> >> >
> > >> >> > IIUC, for VM0, there are two groups, and for VM1, there is only one group.
> > >> >> > Am I right? If yes, I think the group concept is reasonable but we don't need
> > >> >> > at this time.
> > >> >> >
> > >> >> > I think the first thing is to figure out how to pick the right group.
> > >> >> >
> > >> >> > Standard socket doesn't provide a way to access the group information.
> > >> >> >
> > >> >> > Source and destination are from `bind()` and `connect()`, respectively. If we
> > >> >> > don't call `bind()`, only the destination is known.
> > >> >> >
> > >> >> > However, only destination is not enough to find the group. For example, the
> > >> >> > well-known CIDs (e.g. 2) are valid for all groups.
> > >> >> >
> > >> >> > 1:
> > >> >> > https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/
> > >> >>
> > >> >> Right. Sock addressing scheme is naïve presently to select the group.
> > >> >> Not sure when/how you or others plan to do.
> > >> >> This is transport layer problem to solve (not to confuse with transport = pci/mmio etc).
> > >>
> > >>
> > >> >>
> > >> >> However, at device level, we should have the construct of grouping.
> > >> >> Without this construct, all devices will be part of single group and one will not be able to build the group concept later.
> > >> >> So even if you don't need it explicitly now, grouping the device is what you need when connect() is called.
> > >> >>
> > >> >> So I was imagining a relatively simple scheme:
> > >> >> For example, virtio device level, some kind of group id is present.
> > >> >> So two devices which has same group id, are part of single group.
> > >> >> An example group id format can be a UUID.
> > >> >>
> > >> >> And this is completely optional for devices to implement.
> > >> >> Generic enough and usable beyond just vsock device in other use cases
> > >> >> we discussed in past.
> > >> >
> > >> >Fair enough.
> > >> >
> > >> >@Stefano, could you please take a look at this? I'd love to have some
> > >> >input
> > >> >from you.
> > >> >
> > >> >A brief summary of the idea is: The config space will be extended to
> > >> >include a group id. The devices with the same group id are considered
> > >> >to be
> > >> >in the same group.
> > >>
> > >> Thanks for the summary, but please avoid top posting, otherwise is very
> > >> hard to follow the discussion :-(
> > >> https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replying
> > >
> > >Sorry, I'll avoid it in the future.
> > >
> > >> I like the idea of groups. What is not clear to me, is how groups will
> > >> allow the driver to select the default output device when the source
> > >> socket is not bind to any source CID.
> > >
> > >Well, we did discuss, but we need your input.
> > >
> > >I said in the thread [1] based on the standard socket API, the driver can't
> > >pick a group. Parav [2] suggested that the group, as a basic concept,
> > >should be present even if we are unable to use it.
> > >
> > >IMHO, we might use "{group_id}-{cid}" as the vsock addressing scheme to use
> > >the concept. But it is a very big change, leading to incompatibility with
> > >the existing apps.
> > 
> > I still don't understand how the group_id will work :-( and how will 
> > allow the driver to pick the default device.
> 
> FYI, here is trying to explain what is group and why it is needed, but I
> agree with you about the idea of "types".
> 
> I posted a diagram in the thread [1]. I think the group is something like a
> "namespace". I think it is reasonable, but my concerns are compatibility
> and complexity.
> 
> 1: https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/
> 
> > This is the `sockaddr_vm`, so we should be careful of extending it:
> > 
> > struct sockaddr_vm {
> > 	__kernel_sa_family_t svm_family;
> > 	unsigned short svm_reserved1;
> > 	unsigned int svm_port;
> > 	unsigned int svm_cid;
> > 
> > #define VMADDR_FLAG_TO_HOST 0x01
> > 
> > 	__u8 svm_flags;
> > 	unsigned char svm_zero[sizeof(struct sockaddr) -
> > 			       sizeof(sa_family_t) -
> > 			       sizeof(unsigned short) -
> > 			       sizeof(unsigned int) -
> > 			       sizeof(unsigned int) -
> > 			       sizeof(__u8)];
> > };
> >
> > >I think it might be beyond the scope of this patch, and would make the
> > >vsock more complex. The current conclusion is that we will keep the concept
> > >of grouping as a placeholder, but we will not use it.
> > 
> > IMO we should first clarify better what we want to support.
> > As I already suggested some months ago, IMHO supporting any number of 
> > vsock devices for a VM it's not really needed for your goal and I can't 
> > see other use cases where a virtio-net device can't be use. Just a 
> > reminder, vsock is not a network device, is more a P2P device where we 
> > want to keep the configuration in the guest as simpler as possible (we 
> > don't want to run ARP, DHCP, etc.).
> 
> Agree that.
> 
> > Till now vsock was more used just for guest-host communication, but 
> > recently it was extended to communicate with sibling VMs.
> > 
> > IIUC your use case, we just need to support different type of vsock 
> > devices attached to the VM. With "type" I mean type of address handled.
> > I think we can define 3 types based on the CID we have:
> > - hypervisor: VMADDR_CID_HYPERVISOR(0)
> > - host: VMADDR_CID_HOST(2)
> > - sibling: CID >=3
> > 
> > The vhost-vsock device handles only VMADDR_CID_HOST, so it doesn't allow 
> > to reach from the guest any other CIDs.
> > The vhost-user-vsock recently started to support sibling VMs.
> > The tcp-over-vsock of libkrun should use VMADDR_CID_HYPERVISOR(0).
> > 
> > So, IMHO we should define new features or config flags that a device can 
> > expose depending on which address is able to handle.
> > Also, in order to avoid to overcomplicate vsock, we should allow only 
> > one device for each type (a single device should support multiple types, 
> > but only one device can be registered for a type).
> 
> I think only one device can be registered for sibling and hypervisor. And
> it is possible to have multiple devices for host. Otherwise, the goals of
> this patch will be not achieved.
> 
> Then, we can get rid of the group concept.
> 
> Big thanks for your constructive ideas :)
> 
> Thanks,
> Xuewei

Well, I think it can impose some limitations to make things simpler:

1. The default device is used to VM-VM (sibling).
2. If there is an exclusive device for HV-VM, then use it. Otherwise, use
the default device.
3. Other devices are allowed to VM-Host only.

Thanks,
Xuewei

> > If we don't want this limitation, I think we need to overcomplicate 
> > vsock and define some kind of discovery algorithm that the guest driver 
> > should run to understand which CIDs are reachable for each device.
> > But I'm not sure we really want this; if this is a use case, the guest 
> > should use a virtio-net device that already support this pretty well, so 
> > before going on this direction, we should define better why we want to 
> > complicate vsock, instead of using a net device.
> > 
> > Thanks,
> > Stefano
