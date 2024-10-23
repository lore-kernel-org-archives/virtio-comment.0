Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99ED19F42F
	for <virtio-comment@lists.linux.dev>; Wed, 23 Oct 2024 11:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729682380; cv=none; b=X7I3MGtIHiPGgPBYvEZVeZnRc05g/b7YOI/QK674nu2khge3ndASCUwAqUC8XTBCMCQMcmba31aOcTCuxl66G9ISPzwGH+u5f0Jt9VOK8V5QbZCOcrUb2leGTYHPaSLh0uWJaSzSmG+7xptcYX/i9tL52jYrUb34xncaGS7s0EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729682380; c=relaxed/simple;
	bh=h0Kgb+St2dwc4KhDhVr2cR7V7wKtHZcC+DYYuQ2mInw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cuCeZi71IfE0N0aXFqkGBaX6C12tac6ZREnEF2PBVcp3keGsct8oTfn2eP/+IPW4s39Wrq+9Rl7JR9zzaeoYtTAj+/R/M70av5IOPmLPQOxzuCFDksSI2eIX3D/DcG/LdlDergt55YDLwxcsfT0sjEe8IT9BHBJ7ZQYYVEKrEag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbQcfCUY; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbQcfCUY"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20c70abba48so55876825ad.0
        for <virtio-comment@lists.linux.dev>; Wed, 23 Oct 2024 04:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729682378; x=1730287178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNiiEUVsBjuAW16CS3+EGeLEtdcJqDsAwx2svoi332c=;
        b=JbQcfCUYfZLhlfpEawpmneX6eGLpx3fOgzcoojyHJQUAF8nUI0EDZNLXQWYjxm2bY7
         mwvl4jylevUdPB2GbmMubHD0UX1HBJWWZyy4tsM9GKBsGe84yWwnrg2p6N0eqsUyVPIq
         AYXm+8o0FlYECxpghOFnCWmZZRA63Fe+BK0X4wmj8Ulle9CwIXJF9O53TBMbdkQKG1SY
         3MK1UJJC0qnktxV5JdHgXr/k+ZLs6pqeEL14O4nR1Lt2i7O3sjjUDcWGxMLS0Mvc1YAj
         Gi0Tx/Ft671cQCnL5DKjPNrNIXT/Jd53D48vtr9BsYBhky1XbBjSZyqvUKiBxwMj/JJQ
         aCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729682378; x=1730287178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNiiEUVsBjuAW16CS3+EGeLEtdcJqDsAwx2svoi332c=;
        b=QAoMjxrktq709h5k8wtlk5fZPD4WHfHwe3fY/AJtwYMhaa33eN18eUa100Om1oIzeP
         Wdiz/Uvp6qaQtYocAHrrUlXz6p+c8N4Vv19FMFvAZmHFajM2eYk0AFKOMQml4JO8iDax
         PYMr20HLTZjidbqw/SnRvoS0IvAAfMJIet86PmoAc52ZNvDszAK0g0DEoIz4BZbRDkOK
         Fx2vBlzt0JAg3TY9hcKqavHWet/2KCONVmM/kS24TDAEvfJpHtep7tI+4huXZwVH//1s
         nPYp26nobRYTkh5NxWJ4bQhzCQNdhj6R8GQSFDsHfUU56BBMwlGXsUmwjBi6YrlZ9slr
         mylQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBmFWFfl83MToECeJ5+1E74y/UsNUt8UPbBdOit4flXNniB/3ktIV4aG+F4vIvZ9510kZJEgV49bQXX4DHUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhDoVjWcy7aCOsVt1r1RjngCMuQF+0ouKVELLkC/atIJZFrc6E
	MGd4AwQlnA0T70J65GL73+7/IUuikiuMp8Z0hYZ4D/D6Y6c7ttM1
X-Google-Smtp-Source: AGHT+IGHlxMt2H9zA0gOM4708wRDysDCgGPf0142hysoePr0t3eMyoPDM4BH78rFf0jSu/OsBbE2Jg==
X-Received: by 2002:a17:902:e945:b0:20b:7ece:322c with SMTP id d9443c01a7336-20fa9e8f965mr32651265ad.29.1729682377810;
        Wed, 23 Oct 2024 04:19:37 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76df52ee3sm1133336a91.7.2024.10.23.04.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 04:19:37 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	virtio-comment@lists.linux.dev
Subject: Re: [RESEND PATCH v4] virtio-vsock: Add support for multi devices
Date: Wed, 23 Oct 2024 19:19:27 +0800
Message-Id: <20241023111927.1050645-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aivsjdideukviwqjitriv2ilarkdiuq4uodxlmlwukpl7mdiov@ntpa7txyiuz2>
References: <aivsjdideukviwqjitriv2ilarkdiuq4uodxlmlwukpl7mdiov@ntpa7txyiuz2>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> >> >> >> >
> >> >> >> >> >+
> >> >> >> >> >+\devicenormative{\subsubsection}{Device configuration layout}{Device
> >> >> >> >> >Types / Socket Device / Device configuration layout}
> >> >> >> >> >+
> >> >> >> >> >+The \field{index}es don't have to be continuous. For instance, three
> >> >> >> >> >+devices with \field{index} 1, 2 and 5 respectively are acceptable.
> >> >> >> >> >+
> >> >> >> >> >+The \field{index}es cannot have conflicts. For instance, three devices with
> >> >> >> >> >+\field{index} 1, 1 and 5 respectively are prohibited.
> >> >> >> >>
> >> >> >> >> A normative section should use SHOULD, MAY, MUST. Please take a look at
> >> >> >> >> the other normative sections.
> >> >> >> >>
> >> >> >> >> Should we add a line here in the normative section to specify that the
> >> >> >> >> driver must use the device with the lowest index as the default?
> >> >> >> >
> >> >> >> >I will update it as follows in v5.
> >> >> >> >
> >> >> >> >```
> >> >> >> >\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> >> >> >> >
> >> >> >> >The device MAY make \field{index}es discontinuous.
> >> >> >> >
> >> >> >> >The device MUST use a different \field{index}.
> >> >> >>
> >> >> >> I think in both we need to talk about multiple devices, not the single
> >> >> >> device.
> >> >> >
> >> >> >Yes, I think I am talking about multiple devices. I'd like to point out that the
> >> >> >indexes must be unique but could be discontinuous.
> >> >> >
> >> >> >What about the following?
> >> >> >
> >> >> >```
> >> >> >\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> >> >> >
> >> >> >The device MUST offer a unique \field{index}. The \field{index}es among all
> >> >> >devices MAY be discontinuous.
> >> >> >```
> >> >>
> >> >> I think we should emphasize that this is only true when
> >> >> VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated. Also we should better say
> >> >> what we mean by unique, i.e., that index can be assigned to one device
> >> >> when there are more than one.
> >> >>
> >> >> Thanks,
> >> >> Stefano
> >> >
> >> >I updated it with emphasizing the condition of VIRTIO_VSOCK_F_MULTI_DEVICES
> >> >and the meaning of "unique", as follows:
> >> >
> >> >```
> >> >The device MUST offer an \field{index}, which MUST NOT be same with the
> >> >\field{index} of other devices, when VIRTIO_VSOCK_F_MULTI_DEVICES is
> >> >negotiated.
> >>
> >> I'd put the condition first: When VIRTIO_VSOCK_F_MULTI_DEVICES is
> >> negotiated ...
> >
> >Will do.
> >
> >> Rereading these sentences, though, a doubt occurred to me:
> >>
> >> What if we have multiple devices attached, but some of them have
> >> VIRTIO_VSOCK_F_MULTI_DEVICES and some don't?
> >>
> >> I think we should cover this in the spec, but I'm not sure how to handle
> >> it. Maybe in this case, since without the feature we don't support,
> >> devices that don't have VIRTIO_VSOCK_F_MULTI_DEVICES may be ignored, any
> >> other ideas?
> >
> >Yeah, nice catch here!
> >
> >It would depend on the frist device:
> 
> The problem with depending everything on the first device is that we 
> support hot-plug and hot-unplug, so there might be a case that we don't 
> know which device is the first.
> 
> >
> >1. The first device has negotiated VIRTIO_VSOCK_F_MULTI_DEVICES. Then,
> >ingore the following devices without VIRTIO_VSOCK_F_MULTI_DEVICES.
> >2. The first device has not negotiated VIRTIO_VSOCK_F_MULTI_DEVICES. Then,
> >we should consider that the multi-devices feature is disabled, and ignore
> >any devices that follow.
> 
> Yeah, but I wouldn't relate to the first device, something like this (to 
> be reworked better)
> 
> - if the driver has already registered a device that doesn't have 
>    negotiated VIRTIO_VSOCK_F_MULTI_DEVICES, then it can ignore all 
>    subsequent devices
> 
> - if the driver has already registered one or more devices by 
>    negotiating VIRTIO_VSOCK_F_MULTI_DEVICES, then it should accept other 
>    devices only if they expose VIRTIO_VSOCK_F_MULTI_DEVICES
> 
> >
> >I don't know if we can unregister a device after it has been registered. If
> >yes, when a device with the feature enabled comes, for case 2, we could
> >unregister the first device and ignore devices without
> >VIRTIO_VSOCK_F_MULTI_DEVICES.
> 
> In that case I think we should ignore the new device, since we don't 
> know how to handle the old one, and un-register it under the hood is not 
> that nice.
> 
> So in the end if a user wants to use multiple vsock devices, they all 
> have to negotiate VIRTIO_VSOCK_F_MULTI_DEVICES..
> 
> Thanks,
> Stefano

I totally agree with you. The term "first device" might not be accurate.

I think all problems have been solved so far. I'll send the next version ASAP.

Thanks,
Xuewei
