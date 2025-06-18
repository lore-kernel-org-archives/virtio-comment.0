Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C56155382
	for <virtio-comment@lists.linux.dev>; Wed, 18 Jun 2025 05:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750225221; cv=none; b=ur7WOO7WPSN4cFtb6NVKtqnp1dPooyGKKXRH4+WDw7yazgmyOrFWR2KPFj7vSTsv1NjzjLQ6Y4gpuGmL7mpxpw+bisczc0UBGFtvf1cxMniI7AEz54qzwy1DH25I4UfcZuRocZsG1bb67yK1jqVNTHtURZuCaa4Y2CsO3qzsg5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750225221; c=relaxed/simple;
	bh=5jvP3S5WU1p+2SssO7/dUhgsowZ1QwSepiGLtKybJ9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k39y71VjLXLHD4f0ppVhd03Ey0c7DrwKrc9klId6btgo2JdGdNkuMZ6y2f7fc7lvpvJxnRnnSu0P3kSbvqDFdxHhX9m3X+9uAnX/GTfKuzJdVjvAv4zExb72UIObOOm0q0fgllPPbadYZ+IxJ00tFyQgz/3YNMz7vGj34woeZ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hW9ThfpY; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hW9ThfpY"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234bfe37cccso83861325ad.0
        for <virtio-comment@lists.linux.dev>; Tue, 17 Jun 2025 22:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750225218; x=1750830018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtEJL9QnW3G83RY7SvsOKdtccbNc/oa2OOG9j/vnWTw=;
        b=hW9ThfpYSxRJj4jAb2/H74ssJB6n9CD1d/eaCYfkNIXB2xXzDNa6YJS4399RoOEZQF
         mWSVQPNwhS1PFDUWl93DkKERVkeEUog95QeUE1HBSvuKfcJkBn5viN4JXQ26EpwqEjKD
         eXLTFFxwUFbkVxAHNUCLcOc96vx18F+F6gNW72zm/6jr9Y3I4V5eO1a3ttsk1Ub+HJA8
         Was8SltTr7gE3M24TpMdlKcr50p0qX6gDq7/dvzj2qFPg2k23FcEQz6AWJlgFufIv2ji
         Ar759VuzOG1Z51vXy8gIw8sAV5RpvxJ5A8BsJccNu0qgKLmjVWAZ9VoautfynpQiBcyZ
         P+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750225218; x=1750830018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtEJL9QnW3G83RY7SvsOKdtccbNc/oa2OOG9j/vnWTw=;
        b=cOJzSly89tmZYWEh+lyv+9eeBT926zbTJ42AO2nI3ES84Q8EhzNOeJNXoGwBnintI8
         bzGEFQPqzEJiHk3DltEbwyCRagWZFUSQyqz7hYCEzZ/sC8Q6h8Wl1KGWRWpwGfKk3gt3
         t8JnUy2pTiIZCNMRkNmWzAMl0o1BHv1ol2B5WLL5MD8WPsDTaU29DuW9ZGg4j5giuZrj
         Hxr9HLQouC/eWIRDgN5RDFrm7ObKYDMa6/QeXJZl29X/u+dNTili8KniAK/ZWQwYL64y
         EAyxKAbKe8CgqMIKlaayIs+T/PaZ76FU8uEUeMvFMUP4fTblwSLU/l6L4sHiNgcFYWoj
         6URQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOohz8NlhH+cKnC+s80oIEbleNVr2hWk3HhGzr/DtClZjlYrbUJZH5LTOe4cLx8M4m6Oj6TlLrKN6yhxyxhg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa/eNGRFUXdysGYAiV/g71f9ep3jiUfxmLhkrB7Mn2GWHbfLsg
	f9nXqNzMqy3L2GWTaYFqaSiOdndXkx5AK1R3fiDtre1XKkz546NfQWso
X-Gm-Gg: ASbGncu+lL2k/POKDNRFfyRmcBKn/Iac4tujyj8+1DCxPyl42pfZQVTR2yt5hp2m3gs
	zFvqbTuogjDoHPo0K69UZbD9ISq+GK9RnGNCaoGvR/ohI6N0OH5GftxL0gBisNVeVDPFO6sV/Ph
	nleUiEKNu107sIvCFImu8OcDzBCzGf7m6v69izE9H1JFuNW8uNun1ifWvCQIlLuCOz0/GO7GhSZ
	BAllYEqotJpuxcScqkV8+MSgwud+MRTrjNxJ5phm3bclxDo4iTvZ2OKSuc9FV9Lm+O04rBBiWyg
	B7q+bFTFAs9LINAAZSbYb0pTcLLjrLGduTkY804vkeGUssnBc7Z2HRHckRNMl4RRXmfI9Umgenn
	rOk8dvzsS
X-Google-Smtp-Source: AGHT+IHl+dB2uPkfGBAHuTT6liyLRMkLaOTdg2I+WwZ/82nSuVV4U0D2Xma5amqht3NJQU5d9RGnaQ==
X-Received: by 2002:a17:903:2288:b0:234:bfcb:5c21 with SMTP id d9443c01a7336-2366b00eee9mr268643155ad.19.1750225218181;
        Tue, 17 Jun 2025 22:40:18 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a1ab8sm91161305ad.84.2025.06.17.22.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 22:40:17 -0700 (PDT)
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
Date: Wed, 18 Jun 2025 13:40:06 +0800
Message-Id: <20250618054006.1378278-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CACGkMEuXV_ep5VOAD84gjWc4RqRSZ6QRzDxC0yn+Zh9gu3b-Cw@mail.gmail.com>
References: <CACGkMEuXV_ep5VOAD84gjWc4RqRSZ6QRzDxC0yn+Zh9gu3b-Cw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Wed, Jun 18, 2025 at 10:47 AM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> >
> > > On Tue, Jun 17, 2025 at 3:46 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > >
> > > > Resend, because it isn’t listed in the mailing list due to my mistake.
> > > >
> > > > > On Mon, Jun 16, 2025 at 4:38 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
> > > > > >
> > > > > > On Mon, 16 Jun 2025 at 10:29, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > >
> > > > > > > > On Fri, Jun 13, 2025 at 4:46 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > > On Fri, 13 Jun 2025 at 06:57, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > > On Sat, Apr 12, 2025 at 10:39 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > This patch brings a new feature, called "multi devices", to the virtio
> > > > > > > > > > > > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> > > > > > > > > > > > > "device_order" field to the config for the virtio vsock.
> > > > > > > > > > > > >
> > > > > > > > > > > > > == Motivition ==
> > > > > > > > > > > > >
> > > > > > > > > > > > > Vsock is a lightweight and widely used data exchange mechanism between host
> > > > > > > > > > > > > and guest. Currently, the virtio-vsock only supports one device, resulting
> > > > > > > > > > > > > in the inability to enable more than one backend.
> > > > > > > > > > > >
> > > > > > > > > > > > I wonder which part of the spec forbids more than one device.
> > > > > > > > > > >
> > > > > > > > > > > No. The spec, however, is designed for a single device, and lacks some
> > > > > > > > > > > specifications for multiple devices.
> > > > > > > > > > >
> > > > > > > > > > > For example, we should have a mechanism to select a device from all to
> > > > > > > > > > > communicate with a peer.
> > > > > > > >
> > > > > > > > I wonder if this is a:
> > > > > > > >
> > > > > > > > 1) mechanism that needs to be mandated by the device
> > > > > > >
> > > > > > > Yes.
> > > > > > >
> > > > > > > > 2) a policy that is allowed to be tweaked by the user as TCP/IP did
> > > > > > >
> > > > > > > Not allowed in the current version.
> > > > > > >
> > > > > > > > (Note anyhow the driver can override what the device suggests...)
> > > > > >
> > > > > > I think we should follow what we described in the spec:
> > > > > > "The virtio socket device is a zero-configuration socket communications device."
> > > > >
> > > > > We probably need to define "configuration" first.
> > > > >
> > > > > For example, if it means zero configuration from the user, it does not
> > > > > conflict with 2), the driver can use its own algorithm to elect a
> > > > > "default" device.
> > > >
> > > > IMHO, it can be done, but it is not the current design.
> > >
> > > Well, you need at least explain the advantages or why you choose to do this.
> >
> > I listed in the previous message. Maybe it is not clear enough. I'll try to
> > explain it again.
> >
> > I think people should pick up the device by a `bind()` call, which takes a
> > CID as an argument.
> >
> > Generally, the device is picked up by the source CID, which is achieved
> > through a `bind()` call.
> >
> > The default device, which is equivalent to the current single device, is
> > used to be compatible with the existing applications.
> >
> > Apart from that, the default device is used to communicate with hypervisor
> > for some init works, such as gathering information about other vsock
> > devices.
> >
> > To summarize, users must do `bind()` call explicitly to select the desired
> > device for non-HV-VM communications.
> 
> So if I understand correctly you need a way to select the default when
> bind() is not called?

Yes.

> > > > I prefer to set the default device for VM-HV communication to do some init
> > > > work. I don't think people have a strong need for this.
> > > >
> > > > > Another perspective, making decisions in guests may be even more
> > > > > helpful for the case where the device is not trusted
> > > >
> > > > How does the guest realize the vsock device is not trusted?
> > >
> > > There're various ways to build trust (for example device attestation)
> > > and more might come in the future.
> > >
> > > > The guest only
> > > > knows the information from its config space, which is provided by the host.
> > >
> > > The way to build trust is probably beyond the scope of virtio, but it
> > > is something we need to consider.
> >
> > Agree with you. If it comes in the future, I think the driver should have
> > the ability to make decisions.
> 
> 
> Actually, I meant the way to build trust via virtio is something that
> needs to be considered. But now we have other ways to build trust.
> That would result a situlation:
> 
> 1) "default" vsock device is not trusted but other might

I think this topic might be beyond the scope of this patch.

With the current version, there is only one device supported, which can be
considered as the "default". We don't have a mechanism to say "we don't
trust you", right? That is, it is assumed that we trust the device provided
by the hypervisor.

This patch is for multiple devices support, based on the same assumption. I
think trust is a good point to consider, but perhaps we have to address it
in the follow-up patches.

> or
> 
> 2) two device claims that they are all "default"
>
> This means anyhow we need a decision from the driver side so the
> device side order seems to be useless here.

There is only one default device. The device with the lowest device_order
is considered the default. It is not allowed to have the same device_order.

> > > > > > So, IMO the guest (driver) should not be allowed to change anything.
> > > > > > E.g. Right now it's not allowed to change the CID assigned by the host (device).
> > > > >
> > > > > A dumb question when having two cids (cid1 and cid2) in the same
> > > > > guest, what happens if src=cid1 and dst=cid2?
> > > >
> > > > The packets will be directed to another application, if any, on the same guest.
> > >
> > > Ok, so in your example, vhost-user-vsock should route those packets
> > > back to kernel vsock?
> >
> > It depends. Two cases are possible:
> >
> > 1. dev0(cid1) and dev1(cid2) are from the same type of backend, e.g.
> > vhost-vsock, so the packets will be routed back as you described.
> > 2. dev0(cid1) from vhost-user-vsock, and dev1(cid2) from vhost-vsock, the
> > packets will be dropped if vhost-user-vsock device can't find a device
> > whose cid is cid2.
> 
> Well, this means the behavior depends on the implementation which is not good.

No, it is not. It depends on whether the device can find a proper
target device based on the dst_cid.

In case 2, the two devices are in different namespaces (or sort of address
spaces). If there is no device with cid2 in the namespace of
dev0 (vhost-user-vsock), then the packet will be dropped.

In case 1, the two are in the same, so that the communication can be
established.

Thanks,
Xuewei

Thanks

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
> > > > > > Thanks,
> > > > > > Stefano
> > > > > >
> > > > >
> > > > > Thanks
> > > >
> >
