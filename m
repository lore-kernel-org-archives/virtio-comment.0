Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9184311587
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 10:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772014962; cv=none; b=ot8QCfbXu5yIXYnZQ6Ol/HhLYGHGKTaTyNc01OI7fn6lCTjsA73bw4gibLxSuSAeA9a45lLVNPrSh5l72szHCW4e9pfddqZbRzg2tR4HZwvaplhhj7EVQP3dZa97u3p+kmfj9l5upEDGX9+8Z8oc4lOmfXoqe0ZZtXRQZP+AdSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772014962; c=relaxed/simple;
	bh=pGeiK8M1drKD6CZXTDlfLRvvvUdopLxwLKeDSiYdNyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=CpPd2X4quH8Dr/Dl0P0tS5Wy1a68BDdjN2kv4IyZS5xrl+bvhvpuGqLefzB3kHv3Kw6GrGmJtE5HLqdeMeQtAUtWas6C/podK3hrpC6d1JV68sr5jOhVcbFJDV8KSQnMuIAdqzajndW7vYWvUQ8dkPhfJF7X7WoIlGb8rK6LUWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YsXlGplr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YsXlGplr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772014960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W/5mOUuoZ92LGIysFCAWAJHGLtiGM92wm8AAKKbAqao=;
	b=YsXlGplrSy1VP2ql5gYrBJ9koazNByM/Nn47i/xf8DURf2PvtkmPv+60JpbLsITgktpOUk
	WwkQerfCm0e6sO/N5zW0flthgSe+CLT3P0p5qAdlq5jOKnHIxWW+k1gXqF68gCFueHuS+T
	kP/KHxPvkyljhulctdsdELQEj9BQiCQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-jsRRB40_NJess7m4xPjQIg-1; Wed, 25 Feb 2026 05:22:39 -0500
X-MC-Unique: jsRRB40_NJess7m4xPjQIg-1
X-Mimecast-MFC-AGG-ID: jsRRB40_NJess7m4xPjQIg_1772014958
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-483101623e9so57253685e9.3
        for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 02:22:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772014958; x=1772619758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/5mOUuoZ92LGIysFCAWAJHGLtiGM92wm8AAKKbAqao=;
        b=kg44yX+Et/sN0+auNejEAAfeyj3MeQRLkvKxrY1PIIT6G8aFJTMrlT3xNmnveRGoZH
         Zie5FqAOe1jZM8mzdfo0Vt0k9YLZIXd/bXfYWQoKVKMKeWaspnRqaz3odYIFs0P1gddG
         uhAXX3O2VA5ssv36kaaJ6zkvBcbMdsS6f1tjahfvpEQJH80qyECOzEaj3HR7vKe2td0k
         80hb4VFH0IulDGubVVg7zvQLffKj72CvpdxzfcWQHXVU6K1svOOjYNDrSlKsJRp5lV8j
         YPA+3gqQ0J/MHOIekKgyMm4TQQJFdygK2K6MXIvY1zhwpPPN0FsGbi39J9nVMlNi3sHG
         +hYA==
X-Forwarded-Encrypted: i=1; AJvYcCUOTrYK4CoydM+9XAu0SY+prfYfNy32rRZzC/wseWxii5zgQ7ViyqacBOMFGwGNyv6meypN35c4pnAyY3BNqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeaZfGIq1NpAJvX1Czj2ZgBAor8ueHTEMBaqxzO71KvPbmOIqU
	E2BHebyWZ8CjrUx5iNTwF+xbQFUQKEKyEP7ltra5ZBnAcXVU4aOYzxijcmVBGvLJFleR/YvPFuh
	s6gLDhb9c9E0MO6SzR1jkaCwwPgx8TUQt1TI8CEG4DnRZw9OUcCh3kXyAjf+epBxAK4Kl
X-Gm-Gg: ATEYQzw5Qs0sTWBhS1csK/HcbI6KLphNhGo6mbKF0iHGAeHzpcFetBEKl/kp9APKLms
	EivpDDKzGy76jGQP5PDAgQ9eG9DOJGkG44rHXvBqWkelzsFXyGDBqaNGG/8AKJMT7znEKZTJQtc
	cEsxzsQz2gPaF95jIoUHnStysNwOYZe3HikoJaTRKL53nmBMmYPxd1M4Xe2MQgvsce7UAgEkqB0
	5JpBodJLuIV8qSnb9Ru3r3BwvouP1RN4BerOzyGR2+ymU9l4j4qmiFGwCfixyu4g65I1dkuykOQ
	ZYd7KMqjFa12ieqWkeredsTFLH1SkZIagezS9EwC0d/htTsZrUQPWuXv/QrW8KpOBCCirFi0go3
	0GdkKmMIN2+r+5Rl834rSFuw5tquHlLcVemWunlKq6crotw==
X-Received: by 2002:a05:600c:19c9:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-483a963d2d9mr226891075e9.30.1772014958137;
        Wed, 25 Feb 2026 02:22:38 -0800 (PST)
X-Received: by 2002:a05:600c:19c9:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-483a963d2d9mr226890055e9.30.1772014956820;
        Wed, 25 Feb 2026 02:22:36 -0800 (PST)
Received: from redhat.com (IGLD-80-230-79-166.inter.net.il. [80.230.79.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd68826asm90970035e9.0.2026.02.25.02.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:22:35 -0800 (PST)
Date: Wed, 25 Feb 2026 05:22:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Parav Pandit <parav@nvidia.com>,
	"Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <20260225051849-mutt-send-email-mst@kernel.org>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7ntR4E5Bv5icUKIoISWPdpgb4a-XV1eRIFVKbap0l6g_1772014958
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 25, 2026 at 03:36:36PM +0530, Manivannan Sadhasivam wrote:
> > > But that being said, I somewhat agree with Parav that we should define the bus
> > > implementations in the spec to avoid fixing the ABI in the implementations. For
> > > instance, if we try to use this transport over PCI, we've got questions like:
> > >
> > > 1. How the device should be bind to the virtio-msg-pci bus driver and not with
> > > the existing virtio-pci driver? Should it use a new Vendor ID or Sub-IDs?
> > 
> > One bus is appearing as one pci device with its own Vendor ID,
> > 
> 
> What should be the 'own Vendor ID' here?
> 
> The existing virtio-pci driver binds to all devices with the Vendor ID of
> PCI_VENDOR_ID_REDHAT_QUMRANET. So are you expecting the Vendors to use their own
> VID for exposing the Virtio devices? That would mean, the drivers on the host
> need update as well, which will not scale.
> 
> It would be good if the existing virtio-pci devices can use this new transport
> with only device side modifications.

ah maybe i misuderstand. you do not mean do not change drivers.
you mean a generic driver for everyone?

there are several ways to address this in pci
- use a shared vendor/device id: worked so far reasonably well for virtio.
  we can allocate a new range of device ids or a new vendor id.

- class / prog ifc
  it seems like a cleaner solution but will preclude declaring e.g.
  a virtio net interface as a network interface.



-- 
MST

