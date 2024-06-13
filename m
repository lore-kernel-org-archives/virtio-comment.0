Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994EE136E12
	for <virtio-comment@lists.linux.dev>; Thu, 13 Jun 2024 06:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718259240; cv=none; b=HnaLYKPgUJxYsPLy9MQYM4HwrW7QkVSkI1mR1U1Hm+4aH9ghxlxFTzMCxsRXVSnn/887lCkzLU8v1qKOVwaBWqa1KpAbWoxjnwOgSbMknXoBFa8OGuo4HRxGNvA6TbIHRA6Y24LoCBQvfHOlX8wyd+/DkO6rQ9Tc0E2ImtBs+VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718259240; c=relaxed/simple;
	bh=+AGc9fkYi9InnttVM1B+04zCeqBbhJKHi9hiN684N6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=niQdTAQxPxsd341vVCWBwNKu6Xzi6C/0SEb/MZPhW/fmni1Zs6V6sfXVAQfWa3bxstEp4r7RAz2GsY0jR3UCy1EhGTSFbHzQn/o2UlZN1ebXOVyUFIGtQW79kqumqDwJJ1ao5wDJujcVGjsMpyYbPg2XNwHGiQDuSrqCkyq29xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OvSH3e/3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OvSH3e/3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718259237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wkEnBBoLS/IHqE3IVp+fO4nFa5xVumMFGV/mDozMGL4=;
	b=OvSH3e/3bOj6RCySJqfHCQPxeUOZ/IGP0dozy5TbbKiAwOe2YJpxr55NvDNg2SMBHDl7By
	Hg+xnWGMc3m0fAZiRUxfGekfSwgWpnNX8+eSYhiJKjLJXeLxDlKk9KODjaDQ3vbvb17KZW
	E7dun5ibXfvjPRVvPoygop8gZ0AZsYo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-q6dyXncbOEmS1XLkMHGAaw-1; Thu, 13 Jun 2024 02:13:56 -0400
X-MC-Unique: q6dyXncbOEmS1XLkMHGAaw-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-35f2730d114so730577f8f.1
        for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 23:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718259235; x=1718864035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkEnBBoLS/IHqE3IVp+fO4nFa5xVumMFGV/mDozMGL4=;
        b=d493vUR6sQptA38kkEBCjkjKH6bcwCSleJdEYoqfcLBXFrqsPRkf/g42A31q7kCqXT
         +9DkVO5/lHGMwEVveMcsp8Jb9aMh5AevZZ5QYhHhwjhmoJGKY6nAHhssO3WZ0C34Yrno
         KGSBjErjv09GkgBD6M9pOcFEpPo380n5xrTKO6pG42Do+V9qa3aS4hrgeQR2DRpcqdp3
         ux1LZtsOET/Z2i6AB63ThuNCpXj7YeHr9qnks6mjD+/TSq9LOnhVeh0LCVdxV46OBf64
         8/mwtmmPsRSqfjLdkErB2qLjBM30zvBtlTTrOdj6fQafpmZt8GdwjhSn4+gIkfaAmndg
         82Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUpP7lxHKVoAHQwOJyNRkPx0OC+OpQdm0dfiMJjL5a6hjECClKGUHdeuoVBIgtWu0oZzs1Nm3wHDBYbNuF217HAQo+puK2cCfVFuvOalo4=
X-Gm-Message-State: AOJu0YyGkiOAI8QZOoyaZFN0ZdHcSEOyItB5zvDOSS/BTL7+0N6a8PC8
	cb/Byiu8mpyIOyR3vTXc6tijvlYWeCY7uZf005khWlVQ76GD4IB5yASOhmoQiwNbWZPT30knueL
	dD8Ctwe9jdxQkoxdczR5coLpp9g6Cdj3DAsUwaX8aPlDsRnDVOr4z6gpzu72/iLBR
X-Received: by 2002:a5d:6545:0:b0:35f:d50:3301 with SMTP id ffacd0b85a97d-360718c9db7mr1553885f8f.3.1718259234922;
        Wed, 12 Jun 2024 23:13:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYuU/DjgEMboNTpGcpjRIY6BraNmh/2XPNn6UDoC7tUyWhMrEmDJU9XcC3ZTNEppoaGldsbQ==
X-Received: by 2002:a5d:6545:0:b0:35f:d50:3301 with SMTP id ffacd0b85a97d-360718c9db7mr1553863f8f.3.1718259234451;
        Wed, 12 Jun 2024 23:13:54 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:341:5539:9b1a:2e49:4aac:204e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36077536f78sm405171f8f.7.2024.06.12.23.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 23:13:53 -0700 (PDT)
Date: Thu, 13 Jun 2024 02:13:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, Halil Pasic <pasic@linux.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240613021132-mutt-send-email-mst@kernel.org>
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
 <20240607220246.3213607c.pasic@linux.ibm.com>
 <1717814062.4461155-1-hengqi@linux.alibaba.com>
 <20240610144602.57a04723.pasic@linux.ibm.com>
 <1718026545.7557275-2-hengqi@linux.alibaba.com>
 <20240610221900.1810ea96.pasic@linux.ibm.com>
 <1718102433.0456574-3-hengqi@linux.alibaba.com>
 <20240611122756-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813E2EE4EA2BA729B2F6B7DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54813E2EE4EA2BA729B2F6B7DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2024 at 05:43:18PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, June 11, 2024 10:00 PM
> 
> 
> > How we can we make progress with
> > the realease but sure we don't make backwards compat a pain?
> > 
> > Ideas?
> >
> There is no functional break with this relaxation.
> Device set some non-zero defaults and driver didn't modify them.... 
> Anything broken? Unlikely.
> And device/driver has better performance, is that a problem? Unlikely.
> 

Yes, it is possible. Driver can cache values it sets
and never query device with get.
Before anything is set, driver will report incorrect values.
What will break as a result? Hard to predict.


Given the patch is big, I am inclined to say it just should use
a feature bit.

-- 
MST

