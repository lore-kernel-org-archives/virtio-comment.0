Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5D378F33
	for <virtio-comment@lists.linux.dev>; Tue,  4 Mar 2025 12:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741092677; cv=none; b=Rccw/yzd7MzkAk/SkwvG/eyEQgpJQBgmSwtodkUNQbyCpyO+f3AS7FpamjqM/655XHSesw+N5ZT3Y36oTdn4MMjiJu9eGjU+bl2oh7ej8axSxBoupETkwxDYf96SdeLtkNFzTJPbR6x7CeLpUDbAwu1whIDijhzCQJ+Qs6ubhqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741092677; c=relaxed/simple;
	bh=7EFjl7iSzjQ5bzDXQRBp+Bt2ssxPDS4WMPVwSQ5PVlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=HhKzlZ+RHrdsVdcXwNWUJ0694PrcPnKNwVgMJVGqCWzcQ0kg4kcu3b5ulvQxw9np4q71h+EG3tyMbxDRZn81CAxxfzNgOxxSyYN+7zj/uriM+36VcK8jp3NG8C04DN2Lmr2XXhS9ibUe5403O4NIrYpd0d6wIs5tQznCgE90itY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I4yJFh0g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I4yJFh0g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741092672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/G89Hv+nNbPI48WNg2ic6mMNBvGsG17nIx+RXzJGRUI=;
	b=I4yJFh0gyVoCTiRErDzdAIdDcUddzTYP+vYGbGfbxf0BLcxJA5IRfmcUVrctf0g6CL7yYR
	7jsisM5f7jBxASVY0ySNrWTzmEe94ZkGf6+9URVlZc+nAdFfzipPmguD+9NfB6CMor7YxJ
	DEMSoxjUvlTaCdTobpdq3k7BDwcKBSw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-A4Qj7JmYMc-RmmS7SUgq0w-1; Tue, 04 Mar 2025 07:51:01 -0500
X-MC-Unique: A4Qj7JmYMc-RmmS7SUgq0w-1
X-Mimecast-MFC-AGG-ID: A4Qj7JmYMc-RmmS7SUgq0w_1741092660
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-390de58dc09so3826537f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 04 Mar 2025 04:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741092660; x=1741697460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/G89Hv+nNbPI48WNg2ic6mMNBvGsG17nIx+RXzJGRUI=;
        b=EM+9+3/DmX3dLoE3hTrr6+CJbftSXaLH7kq+9n8uTnlVTfSJ02uXsaDTKwv+AfZQWO
         jib9yCQ13MHuVTNq15nHh1SWFX9gJUZJyUui6kM7rofqrprLIQhhD+GVbED8YZ3ertc0
         laYpIAkjUNOv04UcD2PiicxcCC8cmzD8VlcYR4NR6fMbtHdTU6b+cAMGdCvbu93o6RyM
         JFLQ33wuKXbbvTJaxD9HRFNF3Aa3Psb46/RBqAXieeJhgl6pm3PE7vqImO4Go5au38Pl
         X3+b8MsTy7DJ4XFrw699vgGSW+OjAjR4XglhjGuTUAXtNPDZWS0JjARyMS2N50JszMer
         phnA==
X-Forwarded-Encrypted: i=1; AJvYcCVj2p10Oi5vNFhuPhM/cIn28KLE23qPamMRW1sDRIeOHOpyXEHC/2M3RgkEcziWCBUKzbcFHX4ZqLIsCk4nDw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvL5hTsHHjc9x26R13QH9m3flcjiBH7IiGR3Lo2lkVYNr8KPFs
	PpsPChUCtltblkFgsDVBPl0fGFK1zz4P+IEBH7C/b4dflfZhuLsELLAmIsB0wdou2VSIrbC1S6V
	opDPMtuvTV0Cy2BannS0dldFNcE2sVk/2uDftQapVs7GG4/tguQnNx5DOpIERxWae
X-Gm-Gg: ASbGnctDsZYI+aAaBD8pDkHXwLOPbGhbIasz2y+/ukjd/MwEqPAv8V+qsai4KBIBTMs
	EpshBuBGUb7hwJ1Z/VetG36qnw19SPq7QPfsxDed16/uW+3hhusz/0/qpYQGEZLa+i4SzY/fGK2
	csTKhC5VTeGXNQEB6jKrA1oP78VJI/EExGrmTrUfvz+9udG4JvkGTIFpwyvJg4Pea8l450E7A67
	mqbQ5qdXn0EtWGw9fNNIdcLfT5L5uMfRS/BY25mMqxvssIkzZojLpUu+s00+xCLhiCZ+zpq9Gax
	TZ0lfhlN9Q==
X-Received: by 2002:a05:6000:1a8c:b0:390:eebc:6f36 with SMTP id ffacd0b85a97d-390eebc721cmr14359570f8f.55.1741092660196;
        Tue, 04 Mar 2025 04:51:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZvf4goLBrvBZhrumn5Gz+8E9z1nnygqsH6G+Q4dnW+669ct2chrz5umpoaDi4K88cBc7txQ==
X-Received: by 2002:a05:6000:1a8c:b0:390:eebc:6f36 with SMTP id ffacd0b85a97d-390eebc721cmr14359554f8f.55.1741092659861;
        Tue, 04 Mar 2025 04:50:59 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1514:ea00:6409:9e94:fe6f:3eb6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795d44sm17365047f8f.8.2025.03.04.04.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:50:59 -0800 (PST)
Date: Tue, 4 Mar 2025 07:50:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Sergio Lopez <slp@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: [PATCH 1/3] shared-mem: introduce page alignment restrictions
Message-ID: <20250304074145-mutt-send-email-mst@kernel.org>
References: <20250217115227.4961-1-slp@redhat.com>
 <20250217115227.4961-2-slp@redhat.com>
 <CY8PR12MB7195A2AFBB7530874D228954DCC12@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20250304055002-mutt-send-email-mst@kernel.org>
 <CY8PR12MB719587D7511B659F5D3BAD56DCC82@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CY8PR12MB719587D7511B659F5D3BAD56DCC82@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rSlx_32t7wuPJgAtC7HT9cIl9Uzu9V3WmV3DatKvUak_1741092660
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 04, 2025 at 10:58:14AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, March 4, 2025 4:23 PM
> > 
> > On Sun, Feb 23, 2025 at 05:21:00AM +0000, Parav Pandit wrote:
> > > Overall extending pci cap structure is not good idea even though it may
> > appear as small change for below reasons.
> > >
> > > 1. PCI spec already ran out of total bytes that can be stored in the capability
> > section. Extending it will not help.
> > > A virtio level extended capability is not good either due to below guidance
> > from PCI-SIG.
> > >
> > > 2. PCI spec highly discouraged putting vendor specific bits like this in the
> > capability section.
> > > Citation: "It is strongly recommended that PCI Express devices place
> > > no registers in Configuration Space other than those in headers or Capability
> > structures architected by applicable PCI specifications."
> > 
> > 
> > We can argue about new capabilities, but this is not doing it - it is merely
> > extending the existing one.
> > 
> This patch is not even extending it. it is reusing the pad field, which is good.
> Extending capability is problematic.
> 
> > So I do not really get any of these arguments.
> >
> I asked him to explore what all options did he consider.
>  
> > 
> > I'd be open to an alternative way to discover capabilities, as long as we don't
> > do that, I don't really see a reason to block minor tweaks like this one.
> > 
> I am not blocking it.

Sorry if it sounded I implied you do. I just said we shouldn't :)

> would like to know what other options were
> considered if the shared memory is going to grow or its just one-off
> field that can live in PCI capability field.
> I suggest, that this should be done without negotiating a feature bit. Because the device is just telling the restrictions...

True. But the feature is helpful for device to discover whether driver
follows them. If not it can fail FEATURES_OK if it wants to.

> > At the same time, I am not sure why this is a capability at all.
> > why not in config space?
> > 
> When you say "config space", you meant "virtio config space" and not "pci config space".
> Assuming yes, I believe the problem is, Sergio needs to add this field in ALL 19+ devices config space, which is not good.

Aha.

> > --
> > MST

