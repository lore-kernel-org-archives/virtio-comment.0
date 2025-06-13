Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951E52DA75C
	for <virtio-comment@lists.linux.dev>; Fri, 13 Jun 2025 08:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749803806; cv=none; b=cH6MxKvwWSUZr7YpvzAVIVXFGw2pztyBbnp9sLUS1b9qoGSEOGfDFjnP4agtrMap10BH9ZN/7r7pv8Bb8pJH8iiPa6m9SWr57AxQFInM1+B6jm9eGjpQy1xrp3HjzFAyCunOOdfmZ+10PUnZkYZQN1vPKlJjOANjEUv0ffRfJ5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749803806; c=relaxed/simple;
	bh=XDIFdnv998m4g0SdzSTQOrPidzQgkyOrj9iy2Yv98mk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F2iuUo+1ugHVxbVPHRy3xHboJBy+GXqqwH8B1udOpwBDuWfsRTNFPLMcK7sZEoXItz8ifk+ebkh/KlMgJ3lHfpEGOe5jc68pDZ/8lFZId96EZSHqbNPnBnavfdjLr2TmSNHwCVu9fV8XgMkQ1+dLdmw9UHFr4N4JKNlMqo6EEJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hovDgrVo; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hovDgrVo"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3109f106867so2646902a91.1
        for <virtio-comment@lists.linux.dev>; Fri, 13 Jun 2025 01:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749803804; x=1750408604; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knIIjoUJePaqmVR9dLK+IZzg1pTfR7smZzB8zrNpl/I=;
        b=hovDgrVo3bxCogOfkdkQA9PzKEQBJAFx06ltjcar5zwsBdCnv5myTiCzR00FV0eQX1
         p9LrVSUMcDCy3efhgfS95tvXru5NzO4hb46ogNZ1D29gFPGPuabj8PznlHmWR+5byTcQ
         XkGZmP1YdVe1dn+Dz6WHhg8eTqLqnEi3Vsvw7+SMFkQ+kOXTh7M6UwUppG2uAa3phkep
         ljf8uKjKTxLoXNgkbekQPlwREVePRiD3aVmq5pFCMmtRaDcKxzA9iM9ZpnpArbNS7ktd
         11BNKvdV5Z/oiQWT1+dkLhtHsE1qofbUMGFfQ8KYCOXLf25GNA0TmnBCpRTzazxeM8Tg
         O0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749803804; x=1750408604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knIIjoUJePaqmVR9dLK+IZzg1pTfR7smZzB8zrNpl/I=;
        b=iBUU4dcNweHZnI1N95F8Ed0BKVcLQPoGzd1rj1wV7Oe73Js0zguIeYq/JpvNjcYCPa
         u5mk+yniOSNByZxM8w64RnfPO3sXSTWhmhgLGJZU1mRs4pVA6aGjK3++D7m1npgPsiEH
         aNTpwHn2jagB3Z/5O59mb6OeCzqu7sdiyBULJAuOKXtrOlkiZFBi/RBRq34sU5gorWwd
         5BGRevQdhOe771pVa8tdB07Dd0/j4xRUNXvgU0rmMwyh1u/aknD5YOGhXRMfg7CtS/nd
         +4oMaZRU43YSX7DJ05lryQ53qxmJ/L5kbGUwxqDAQSc6m8JFFrcJ6R9N7zjIimMiyKqj
         T3Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXvneHUjR/qpMiHdByR+O+DG8hG2AXFmM8dNIE00qgDWqoO6C6GfHFENScOjMhIz3/aM5JeB0EJMgWr2mSggw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/xMzC9XAw7+a23jtmyS9ewqodubtCyT90tMJUsIVCiI9jj22u
	9+oyQV1wPWnPVsQnldrTQ3uey7vFNJx4d25/iOybvotiD9cxLe5vGcXs
X-Gm-Gg: ASbGncvEVYKW5nh68UeeRgxd9N1jSngF7x6QGxuqrybjgpN2ZUoQ5KwKWLcqrH3ruy6
	ebgQlfayl20/pcohuDthzEyOpHNCfJ5I65Kg2pGhONJPgdTbSJnhj/2f9+eHKJD85g8N21PdHPb
	4mNgpLO0hmkaXK7DhPVe+ErxOb1RGODfwOhzm4RtW4lqMeZI4iGCokOAm2bZHb+5F8i+5VnQqwl
	Exj/4R/Nmp/Iz2I3bPta4cS66PFyF0AQpwdDsCCT/USu+0n5FllEIybLrsvM8FHXdzXi4DJ1ppw
	HKlP5mxZAcceg09GojOKC9o9cxysKB85QlO9ugatwshbTUW4as+ThfYgzWUklTVBeunzT+daN/d
	7QC4tXsCS
X-Google-Smtp-Source: AGHT+IHmlw3wt6FH/2APetDo/wFyRY6v1VUx1eGepR5cCVA+I4zrZqjksbfRt3QlB7WME1K2qGASDw==
X-Received: by 2002:a17:90b:540f:b0:311:ad7f:329c with SMTP id 98e67ed59e1d1-313d9e90309mr3956154a91.18.1749803803500;
        Fri, 13 Jun 2025 01:36:43 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c4e3f0sm2786920a91.23.2025.06.13.01.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 01:36:43 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com
Cc: fupan.lfp@antgroup.com,
	jasowang@redhat.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	parav@nvidia.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Date: Fri, 13 Jun 2025 16:36:33 +0800
Message-Id: <20250613083633.1087589-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAGxU2F6-MgJTLir2hcvUdLeAeVeRygEhKzui_N+2vqsWxhBkLw@mail.gmail.com>
References: <CAGxU2F6-MgJTLir2hcvUdLeAeVeRygEhKzui_N+2vqsWxhBkLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Fri, 13 Jun 2025 at 06:23, Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Sat, Apr 12, 2025 at 10:39 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > >
> > > This patch brings a new feature, called "multi devices", to the virtio
> > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> > > "device_order" field to the config for the virtio vsock.
> > >
> > > == Motivition ==
> > >
> > > Vsock is a lightweight and widely used data exchange mechanism between host
> > > and guest. Currently, the virtio-vsock only supports one device, resulting
> > > in the inability to enable more than one backend.
> >
> > I wonder which part of the spec forbids more than one device.
> 
> I don't think there isn't anything that forbid it, but what we don't
> have is a kind of default gateway/interface to use when sending
> messages.
> So, this proposal is mostly to chose the default device to use, when
> the user don't bind any CID on the source socket.
> 
> >
> > > For instance, two devices
> > > are required: one to transfer data to the VMM via virtio-vsock, and another
> > > to a user process via vhost-user-vsock.
> > >
> > > Apart from that, a side gain is that theoretically the performance might be
> > > improved since each device has its own queue. But it varies depending on
> > > the implementation.
> >
> > It could implement multiqueue anyhow.
> 
> Yeah, I pointed out multiple times to skip this as justification,
> since multi-queue has more much sense for that.
> IMHO it's confusing to still talk about it in this proposal.
> 
> Stefano
> 
> >
> > Thanks
> >

Thanks for the clarification. I'll remove such descriptions in the next
version.

Thanks,
Xuewei
