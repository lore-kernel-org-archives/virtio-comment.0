Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792711727;
	b=YKrcfvV4aK8d+4e4tI0ArpwEUjk6f238e+8tKZljMvIRjt1aosJfCBwI+BC5vFtsO08x
	 sbk/WhTy5ofUi64qPDYWDvH4QboTqNK6GPuqNy9S+otoTuWL4FLLy0hSwxUI8xqayRZoV
	 MKAWLMoXjpOZWNPVYAPiJVwv32h6IrpHDxHxYaIZjOVOw5Cu6nf8r4eRgB76RhikI4v03
	 saXzBgBRxeCVEx+NDAUBCDO/C8taL1h0FTmYA8PNTE6ZFoJ3czHfHx4UBHrhV6a5AMOxh
	 CTzz95rmsceNXqs1sz7LuLJV5rJIujHMxa2KwaGKDopxVduuPfZULqc+RuN/Dl9c3cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792711727;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=uUaOY7kLtYsT3r59Gp9fnDUZMwmZPCCjbBZ2Z3TqMIk=;
	b=kWy9O8QoBL18IEhODiqTWCpYmw305HqHgrvILo43rBDotmwRmtUZLyTsVtMJ/8PNFHQe
	 bTxSIHwOztXiUFSOB1uMah61rbFOb34ACAh8ClcA6jOWIs3/q1vzIuaVETdTerTHpQ3v4
	 eCjy8mY+Zs8i7UiLmmAkxiXgs9xArj+hbMvZlg2h8eNsGS+eAOyrFjKFu2DF0KBU69ZtP
	 z4Ss1Vfe9Nbu45TX7h/1P9cVqPpK5xcgFlUUdm5b3BZRmL1VWE8y/bbE2for0Hhv37hfZ
	 lONGCm1ncEiMgfcjNWYDImMwQhx8IE39dmb/2z3fzN1laJAME5QwHen3TX40vXx0q7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fyp1E2Wh;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE081607AB62
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 23:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE081607AB62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fyp1E2Wh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792711725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uUaOY7kLtYsT3r59Gp9fnDUZMwmZPCCjbBZ2Z3TqMIk=;
	b=fyp1E2WhAs3+CViaCwxzVh/sGdq0hbwSkK7nO+rNj8SkOEyFTJl7k6rdJiUAhi/ohW8ehC
	UABb8tcZ3Q11KCDKHFgrxfFpYVEALzRCwJKlhZdnVmt9I0J3od6cNgvqkBpm1thE3M9rLK
	SNsihuCLFqYvbRHI65fzhgYDV/4Q4aA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-r_P401b6NbONxjGEXZIb1Q-1; Thu, 22 Oct 2026 19:28:44 -0400
X-MC-Unique: r_P401b6NbONxjGEXZIb1Q-1
X-Mimecast-MFC-AGG-ID: r_P401b6NbONxjGEXZIb1Q_1792711723
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1e489f97fso2590645e9.0
        for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 16:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792711723; x=1793316523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUaOY7kLtYsT3r59Gp9fnDUZMwmZPCCjbBZ2Z3TqMIk=;
        b=Z7dAdhvn/NITMwutCu245e+FixYwkE+OF4YBcuczZSabAYXqksZLvSN5jeXI1E/kWl
         s1VEJ97ksZTxTvjxQashoVH9/ljcOJmOqtEHSytrMqFcqBz1uWfTaJbCmgTOyhhs/7I6
         0z0pf8wpxhSHJ8UN3K4m3XU708LZ6B4Bt1vB0iv9d+MA4JgXYzI2HXkRucaZ8qxVunJD
         Q9aGTnZ3+bsScWelpefwLpONU8zmAFqgDVgVj9IgdnTvIQUI1Y3boJ0qL+sfz3Z7pxLl
         XSkKqvhmLBjyYBtPnV3aucM3uhiNRyo3c6oxKNh/Kpt8VQdJUe848lm1ATiDfooChxOe
         2hBQ==
X-Forwarded-Encrypted: i=1; AKwUvBylxPeCngX1NAARR06n8rWBbZJ0WcgaQ5SXgYim5ZCZPPBSaAhNxL9+03yKCNuyjtdLeTstCXoBZFvL02Pmdw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIMgndtozcAW0QQt8rQ/DOgaDmAiEXryVANhXoyXjmYerIV/aMr
	lOkKRUJtUZ2IYaX25Q/uBGzAdL9qxViJwKuBg4Z2wdGA7Vhxtjn/2MyKDlMYj4EkVkJNqpCqsJ3
	705+SbI65vy34gky5kCJSTf5XZ8HuJda6HyH53H6kdcCsjKzXLtyanfAao4Jh0XsJyy4a
X-Gm-Gg: AYBFou20C2XfzxgWKZs2TwhLz3+H7FWSA0kiFy4VIjj6H0OrvcUR1DP0XhBL90E8MkD
	Nwz99XMrMRHzpzUifZl++azolThmSGcTKQbjodvL9N3B28v22MvWwHN9+oZegncMAkCFE/g5FXZ
	PyCva7fYvcY22Ha9yRs/2CwxYK1UzC/QryjnvkemGNqntZw5UjwBDGk112ONeKD1OIK3rh7jpBB
	Amx8p2yyeYmD9ZlB7Q3DXyNfKivfE0hlv20LhMawTyNZJslUiWxuebAn5o3NrhXcqswRylNk+EF
	A167ucp/34KcBcNLt4MVOcE6ETk/cT+s3KwB7FbGO5/mNT6lhoFxQ2UQtk6EtqrSV0XP4RE=
X-Received: by 2002:a05:600c:c491:b0:4a1:e225:b122 with SMTP id 5b1f17b1804b1-4a211cbb5b4mr8958565e9.14.1792711722990;
        Thu, 22 Oct 2026 16:28:42 -0700 (PDT)
X-Received: by 2002:a05:600c:c491:b0:4a1:e225:b122 with SMTP id 5b1f17b1804b1-4a211cbb5b4mr8958195e9.14.1792711722498;
        Thu, 22 Oct 2026 16:28:42 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f6:2400:30a8:9e33:7d82:c035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211b29394sm15910885e9.2.2026.10.22.16.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 16:28:41 -0700 (PDT)
Date: Thu, 22 Oct 2026 19:28:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Hilber <peter.hilber@oss.qualcomm.com>
Cc: Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
Message-ID: <20261022192444-mutt-send-email-mst@kernel.org>
References: <20261022091645-mutt-send-email-mst@kernel.org>
 <oinsf3ecwsrgxuff2m4q3qsjzfg3quldsqv3wjnlzxqbiyzhrz@m4s7bjwc2fsf>
 <87h5id3he3.fsf@redhat.com>
 <SJ0PR12MB6806C8FCEDA2E3D40CA82EB6DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022114028-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806C7432951E2DB6CB3C945DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022115837-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB68066B4C6D821EF792DAA220DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022122727-mutt-send-email-mst@kernel.org>
 <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NDZ4o5pC9c8kONdVt5IfUFjzJThjBaXOwUcT8958MVE_1792711723
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 23, 2026 at 12:39:48AM +0200, Peter Hilber wrote:
> On Thu, Oct 22, 2026 at 12:29:31PM -0400, Michael S. Tsirkin wrote:
> > On Thu, Oct 22, 2026 at 04:20:51PM +0000, Parav Pandit wrote:
> > > 
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: 22 October 2026 09:32 PM
> > > > 
> > > > On Thu, Oct 22, 2026 at 03:49:51PM +0000, Parav Pandit wrote:
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: 22 October 2026 09:12 PM
> > > > > >
> > > > > > On Thu, Oct 22, 2026 at 03:35:51PM +0000, Parav Pandit wrote:
> > > > > > >
> > > > > > > > From: Cornelia Huck <cohuck@redhat.com>
> > > > > > > > Sent: 22 October 2026 08:35 PM
> > > > > > > >
> > > > > > > > On Thu, Oct 22 2026, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > > >
> > > > > > > > > Let's define some standard way for the vendors to declare that this
> > > > > > > > > device is "Qualcomm", "NXP" or "hobbyist which doesn't own PCI or USB id
> > > > > > > > > block".
> > > > > > > >
> > > > > > > > Are we able to use the first <n> bytes of config space for that? I guess
> > > > > > > > that is the only way that can possibly work for any transport.
> > > > > > > >
> > > > > > > > Then, maybe something like one or two bytes for a vendor id (including
> > > > > > > > one for "testing purposes" or so), and the rest to be used in a
> > > > > > > > vendor-specific way.
> > > > > > > >
> > > > > > > device ids are independent of the transport.
> > > > > > >
> > > > > > > but Peter already announced that:
> > > > > > > " Reserve a device ID for QPSFI devices (Qualcomm Platform Subsystem
> > > > > > > Firmware Interface). QPSFI devices expose functionality across SoC
> > > > > > > subsystems through a common Virtio-based protocol. There are no plans to
> > > > > > > standardize the devices."
> > > > > > >
> > > > > > > So, I am unable to understand why should it be part of vendor agnostic virtio spec?
> > > > > > > Why a vendor specific implementation of device and driver is not sufficient?
> > > > > >
> > > > > > I don't really think we should vendors burn up device IDs every
> > > > > > times they want something non standard. Reserving ID 52 as
> > > > > > "vendor specific" so vendors can go wild sounds good,
> > > > > > but a bit more needs to be done than just reserving:
> > > > > > document what is expected, e.g. no auto load based on ID
> > > > > > alone.
> > > > >
> > > > > First, you indicate to open virtio to vendor specific extension. This is huge in itself.
> > > > 
> > > > Not as such.  It's just reserving an id. People always do things like
> > > > implement some crazy spec saying "we will upstream later" and later they
> > > > do not.
> > > > And then the ID conflicts with a standard one. Suboptimal.
> > > > 
> > > > So if we can tell everyone "always use this ID, and use platform
> > > > specific tool dor discovery, until your device is in the spec"
> > > > then that's not too bad.
> > > > 
> > > > 
> > > > 
> > > > > that should be first discussed.
> > > > > If you suggest this, may be every device type should be able to extend, and not just demux at device id level.
> > > > >
> > > > > Second, one reserved id is not enough, because a given system may have multiple such different vendors devices installed.
> > > > 
> > > > I don't think we should care.
> > > > 
> > > than all 0xffff as one experimental id once for all is good enough.
> > > than vendor FOO, BAR, differentiation is not needed.
> > 
> > I don't think we want 0xffff, a lot of systems treat that value as
> > special, pci comes to mind.
> > 
> > > And if it is not for experimental purpose, not sure why would vendor stop at only one device.
> > 
> > They can reuse that id as many times as they want and differentiate
> > with a device specific or out of band methods.
> > First X bytes of config space was mentioned. or whatever.
> > 
> > We can add a recommentation maybe if vendors desire that.
> > 
> 
> Thank you to everybody contributing to the discussion and to the concept
> of a vendor-specific device. Just for clarity, Qualcomm intends to
> upstream Linux kernel drivers for this new device type, so would
> definitely want to use a registered device ID.
>
> In case of an in-band approach, I suppose we would then have an explicit
> vendor list in the spec where vendors have to register?
> 
> Best regards,
> 
> Peter

Just why are you bothering with virtio spec at all then?
Just use your own vendor id for this.

> 
> > > > > So why to bend things so much and re-invent the wheel?
> > > > > Why for say PCI transport's any vendor and device id are not sufficient to indicate a vendor and device?
> > > > >
> > > > > and if so, why to even document it in the virtio spec?
> > > > >
> > > > > I guess, I am missing the basic motivation part.
> > > > 
> > > > For the virtio spec? Above. For Qualcomm since they decided never to
> > > > upstream - donnu. Don't care much, either...
> > > 
> > > ok. so yeah, let vendor's platform device be in the vendor's OSS zone.
> > 

