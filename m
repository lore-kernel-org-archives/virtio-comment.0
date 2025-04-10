Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F4F256C75
	for <virtio-comment@lists.linux.dev>; Thu, 10 Apr 2025 10:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744282062; cv=none; b=JCRSVYubc/JwY8/LKTMufT60AwoK2nCcfXE+hT+ZGEj5KdBN8voOuF8eNGyFrPPGX/eCTAKnxUkwdpUdkiul1JPMahKeep1HfBLWP411b1tkLs0Nd4nSTsJuYRAtXvYAK1/6c3mlGPGNODPQ7eUo4OUFG5o8IB8WueUnRYGpmt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744282062; c=relaxed/simple;
	bh=gIZClq/uUy36f+5gT6isyDlHQ4pSA6FURJmOs0lhht4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mV/Mj+AJmXsrJ3KYGojbVFi0Sf0/LC8HiF4o/p40wh7YnJdZAP9mRBb7lS8f1XVi6uMU4SlrAqfjkzLkB4ukO6m3QmnfRUQew33av9gsC5Sh+puBWIQh8kDRsnSnhrXD4kJdvzBnLqR2ETbCtxjuH4KGEjkGkLQRVmGk267zu30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMd6Lfr6; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMd6Lfr6"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22423adf751so5754755ad.2
        for <virtio-comment@lists.linux.dev>; Thu, 10 Apr 2025 03:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744282059; x=1744886859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bke5evQvNzxyjnF9kGFxiWkV0Lgnck/2kTTpPbUs8cA=;
        b=fMd6Lfr6otMq4ukhNHXLOCQ0fI37ki24gj12C4ZYkbVBo5riiklPJL9k6BBE97gfQB
         m8KaoED0od0qS/eGQMygL3V8px9EytCfH2t2XdzZgFLLoJga3iUM2gvKHp3UuVgfipFg
         YwLLuzHrfUagkU3dwkY3Tfv6LVE/XoWbJo0yxOgYEnDAbqOpKTKNcbuKfkYDLHGkuhYv
         Llsdw7uIp12Qbn8zltNWAFVcCThxcTTWuPidSLm5sx5tvlSUVRVTEkKDboqUKUELZSO3
         xCxP0kbchNpvPkGeaNn0V41Xaj8CpmR4nieQ7DqXMROWMLlZH9jrutAHUYr4YLAm+gT1
         Qtgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744282059; x=1744886859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bke5evQvNzxyjnF9kGFxiWkV0Lgnck/2kTTpPbUs8cA=;
        b=wIhQwuq/bEuoVASxOvO3hg0dnd8xggO2iAxT+NLOQizxZ6vGbcDelKDHvp1c7apRcy
         TTLj10+rF9TJo0IdJxnWHhIpqq31zIAymnQepxlW3IV+N+c0qfSqyYN0BAtCZwB6bKH/
         uNZxWgFjKxGawWZ4Uzs9ClD3pSRHVdTHWJ7UM82n4IpWb99niGQytZN6FzFKbl92Oozc
         cfx+BbiF8gr8Yak9KJlhvAUba3GkSSJU3R3t9QkunSonTSaCeFOh94949/y5HVqXjcC+
         w3GcAwB8GbyqJKgSiF1OUvj1qCEOJPchwcJdAoIz4yT9meqPbBDPOcvfJwwJbcYjCtCe
         mPnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1wo9CCYXSS+woP9No/UTCpDthrajvg3zmWmJt9Nz//u6DUSyMWbj5ynFEtfw3qC9HKFNQjlkJW/lUUQAsmw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgFRiP8efVGSFnLSV+ygqlJHsakm6tarK0RNeaTtLFgBApIq0H
	RPZ2inZgQq+YW20svjkaUIAsmzhRQnFlDCdw7Q5AhzI82E2RK8e4
X-Gm-Gg: ASbGncs7UI9hTGtuaHz8066h9yDQGK+9QIjLrK355iHOiDjHv53xKf2aaGPoN/9wijA
	Ep10SyONwc61kneabmrWn0th/wUZvTnV7sqMGgtS1ShzQi1Ek8ukkjBklLQjqFJbzW+bA3SOSLI
	yrBTj2wDXTF0ticM3XEAXTY4lAdUD9UspdX4GSUdTm9pluU8pAjHJz2PeRmtd5fKBLNw7QuyP+i
	5HJ3oJ/jfjT/YoPsVKBmY1h8bI1qDLzy+g83JSf6H1OU7nbyAY5Q6aPvvPW3HJACNicTXY0QFvq
	ECJ6mpM6hAfO02yc4iD6yFgAiPyiWzkxuIHQQkRBKbdzFBGM2dyPT7SYoprrMB7I/ELPBxEM5Q=
	=
X-Google-Smtp-Source: AGHT+IHNQljYOnRyur1kX9IIEO0DwpFrH5x/IYdxqm5ZFuDh6sZPdOVrRq0cvR9LNeAytueur24u0g==
X-Received: by 2002:a17:902:f745:b0:224:de2:7fd0 with SMTP id d9443c01a7336-22b2edeec59mr41615675ad.25.1744282059015;
        Thu, 10 Apr 2025 03:47:39 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e38553sm2923569b3a.89.2025.04.10.03.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:47:38 -0700 (PDT)
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
Date: Thu, 10 Apr 2025 18:47:27 +0800
Message-Id: <20250410104727.3149826-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAGxU2F4c4E4Bg4F+GhO3pQBk=3Bj7D1jaNisbnyNXUNvjVUs5g@mail.gmail.com>
References: <CAGxU2F4c4E4Bg4F+GhO3pQBk=3Bj7D1jaNisbnyNXUNvjVUs5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Thu, 10 Apr 2025 at 10:59, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> >
> > > On Thu, 10 Apr 2025 at 05:06, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > >
> > > > > On Wed, 9 Apr 2025 at 08:56, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > [...]
> > > > > > >
> > > > > > > The idea is to inform the guest which addresses are reachable by the
> > > > > > > device, so the guest can easily decide which device to use. I'm
> > > > > > > talking about the destination, so CID_HOST(2), CID_HYPERVISOS(0) or a
> > > > > > > sibling VM (CID >=3).
> > > > > > >
> > > > > > > >
> > > > > > > > We have had the guest_cid field in the config space. The guest knows all
> > > > > > > > devices present in the VM.
> > > > > > >
> > > > > > > Okay, but how can the guest figure out from this information which
> > > > > > > device to use to talk to the hypervisor or an application in the host?
> > > > > > >
> > > > > > > >
> > > > > > > > If the app tries to bind a random CID, it will fail since the driver can't
> > > > > > > > find the device by the CID.
> > > > > > >
> > > > > > > I'm not talking about the source CID on which to do bind() (which I
> > > > > > > honestly don't like), but I'm talking about the destination CID on
> > > > > > > which to do connect().
> > > > > > >
> > > > > > > > > so that the guest knows which device to use depending on the destination
> > > > > > > > > CID.
> > > > > > > >
> > > > > > > > Yes, this is what I was describing in the previous comment. The message
> > > > > > > > will be directed to the device by the destination CID.
> > > > > > >
> > > > > > > Sorry, I don't understand how you do this without having an
> > > > > > > information from the device about what addresses it supports. Can you
> > > > > > > elaborate a bit?
> > > > > >
> > > > > > Thanks for your explanation. So things you were talking about are as
> > > > > > follows:
> > > > > >
> > > > > > 1) guest app as a server: the app MUST do `bind()` to a CID that is
> > > > > > available in current VM.
> > > > > > 2) guest app as a client: the guest driver picks a device and uses the
> > > > > > device's CID as src CID, so that the guest app don't need to do `bind()`,
> > > > > > but only do `connect()`.
> > > > > >
> > > > > > The key point is who takes responsibility for picking a device:
> > > > > >
> > > > > > 1) I prefer the guest app to do such thing: do `bind()` to pick one, then
> > > > > > do `connect()`.
> > > > >
> > > > > Why?
> > > > >
> > > > > This implies that users must be informed in some way that they must
> > > > > use a certain CID to communicate with the VMM and another to
> > > > > communicate with the host application, when they could just as well
> > > > > use CID_HYPERVISOS(0) or CID_HOST(2) for that and everything would be
> > > > > transparent.
> > > >
> > > > Sorry, I didn't express it clearly. I just listed my original idea and your
> > > > idea.
> > > >
> > > > What types of services can be considered as hypervisor services?
> > >
> > > TSI.
> > > The vsock used to implement it end up in the VMM (i.e. libkrun), right?
> > >
> > > > In our
> > > > case, the kata-agent is a control service for Kata, so could we consider it
> > > > as a hypervisor service?
> > >
> > > Nope, kata-agent is clearly a host application.
> >
> > Make sense for me.
> >
> > > > How does the driver know which device is for hypervisor? A possible way is
> > > > to add a feature, like `VIRTIO_VSOCK_F_HYPERVISOR`? If it is possible, I
> > > > think the CID_HYPERVISOR can still be used in the case of 3+ devices to
> > > > maintain the same behavior.
> > >
> > > Or adding a bitfield in the config space, where the device set several
> > > flags depending on what kind of CIDs is able to handle.
> > > They don't need to be negotiated, IMHO. Just advertised by the device.
> >
> > Will do in the v7.
> 
> BTW this could be part of another proposal if you don't want to speed this down.
> I think we are talking about 2 features here: multiple devices and CID
> supported per device.

IMO, it could be considered as one proposal but two features:
CID_HYPERVISOR support and per device CID support. My idea is to split
these two features into two patches.

WDYT?

Thanks,
Xuewei
