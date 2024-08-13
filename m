Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6EE13541B
	for <virtio-comment@lists.linux.dev>; Tue, 13 Aug 2024 07:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723535502; cv=none; b=Qgi0YtDiDwYa+Oi/vX38UUJcpGwv7skgGWftTN1zjgfY7xgf26iGVelZ9hzfzjeQbX4K10M3J0Ai1kuv5t1jj81Z8SKfogPnUgpu43YH1Sg1KLuV3ae5ydDAy+dE0+ISZA4ezpE2MB4hPLhQTaPL3yTLCa2KxnmM+6yihrqqbrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723535502; c=relaxed/simple;
	bh=T2XIyG/o3zkjA7I2YFidM7yzEdYXg0LFPpYKFtOglIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=kFAKzElX6r2wzMvGjEbRpxNLDW0RUOCjvYmGnnUwHywaQbUhKIp45B5hwvwvR5UUps8fVgHr0HJJjlZoOimRJ8ioRNEMg7i/M/8mxY7J7Qz5pkCEwsokTdsvZm4aM0b5hK0LphWlxk3rjLxnq7kAavz0xDN0dGV3a2HzBKo6QNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d00PLA9p; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d00PLA9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723535499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yid0Nh58M7YWA17m9GckeQXe4D5Rck14/BZcezwzflo=;
	b=d00PLA9p7l3wpV77VoBsp/E5j3F5QkPOelFjnrN6DCx9Ae885GOe7IzaqtN7HsgvPL6Y23
	B5KFBx5/mAMqjOshA53+LfmdYukQRH7DY/M8IBupfjDnokAv9mvSASh9wxKgFPC9gazeC6
	EwJcmZaiqcJJl3GWYXEmLvQ/iQDjW2M=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-2ab_B-ZSPe6D61ONMSwBwg-1; Tue, 13 Aug 2024 03:51:38 -0400
X-MC-Unique: 2ab_B-ZSPe6D61ONMSwBwg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a7d63fbf4afso517545166b.2
        for <virtio-comment@lists.linux.dev>; Tue, 13 Aug 2024 00:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723535497; x=1724140297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yid0Nh58M7YWA17m9GckeQXe4D5Rck14/BZcezwzflo=;
        b=YXZwfbJXX3iQXOuiCaC2Bdp4ky+bhubkM5hu30VH2rLKvvQ7N5EKO7C6hX6BB2T5W+
         pdEzRJq+bj6RFGS0NRtQFm6GTm3DAg5c1qOpR66zy/GHgrcQNh84O12HPTTbsKr1annE
         iKpwqtl9F+Io33favQr4J/zInF9y4WKW8ObG/Ov25cK11sAMVUfOqzal/PsPsxCmt0uh
         hXq84EwjjFlTdp+iHuwPQVux0BqLe2YO2w2WSMLX2JDcLoguSpD1HXz8Vug7s13xsJzc
         DLZqS1mlNq28EI6WWDZ5ibsxCbFMEqeQq2Qy91MpdF0paVmllDLmP6oZXxMMnyhM5CfJ
         d29Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiLT5Fl5zioDBDXiGktw3fk/UnydSDiRJf5WG4CWG73csjMgzX8wddQjrmEY8EsnfVOuulOXD5rL89faf3ExN6o51lTqG7fBYmEhxyrEY=
X-Gm-Message-State: AOJu0YxspFihsM+LuI3p4y4ikTUfh1GWwr5PgcN0i9RHSvDjoJKQ27yO
	GOwN4V7zal3IX9ANOb59lcqFuHeCIGc1YSjhHgklzOc6E2lCnedVDklA6qOn7xX3yl8LRSlf0kr
	2IKV7D9wQfUI5P9VdQF6djaEIdM69PXPa7rhpkJR6HtxrDSf0mgvuE3t6uuIg1z8I
X-Received: by 2002:a17:907:a08:b0:a77:cd4f:e4ed with SMTP id a640c23a62f3a-a80ed2d70bbmr179593666b.63.1723535497084;
        Tue, 13 Aug 2024 00:51:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaAvB+0xDJYtytUqtPxIFEN4481Y+pf5xrdJN9BzKKPsuKdbFSR0MPGxMry8S2AAd8AutYLg==
X-Received: by 2002:a17:907:a08:b0:a77:cd4f:e4ed with SMTP id a640c23a62f3a-a80ed2d70bbmr179590166b.63.1723535496174;
        Tue, 13 Aug 2024 00:51:36 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:346:dcde:9c09:aa95:551d:d374])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f4181439sm46364966b.190.2024.08.13.00.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 00:51:35 -0700 (PDT)
Date: Tue, 13 Aug 2024 03:51:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240813033547-mutt-send-email-mst@kernel.org>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 13, 2024 at 04:42:06AM +0000, Parav Pandit wrote:
> a. suspending a device is non frequent operation (in order of N operations/sec, where N is roughly in range of 10 or 100) per device?
> b. A software-based device may not always want to force VM_EXIT on read and write on the device_status register?

I just see where this is going.  Parav, if you want a device with
as little as possible memory on it, using DMA as much as possible,
what you want is develop an alternative transport
that will let you control status without using memory accesses.
This will also, with time, allow doing this for existing config space.
We aren't blocking all spec development until you do, and the tradeoff
of easy to debug, robust MMIO control versus complex but maybe
cheaper for some hardware vendors DMA based access is up to the
device.

-- 
MST

