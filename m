Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2DE13EFEF
	for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 12:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719492188; cv=none; b=RpTnIAxYVkmgOY9Amhi/I5o+9IDv4+H4H+7BhkVVSv3q74tyLcPhjJcskCoL6rSw54MpDkJDM689c7Ch6Md0svViIIuVdomDOQ8A926AVUQ4knAlmGvZXQuEQFPM5eV3VUaLHhKxUKQ7msL6rNjXlUGjSvE8yuw6+k2LpMU6OQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719492188; c=relaxed/simple;
	bh=TCxo7/W7vaLMgbK3X1/tl4BBr4Feh3Iu57KvboIlV70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=JEsqwxg32KXqNXZdN/rbciwOlF+FN5V7fumErSV8OD+257hdekfpWLt041Os13WtXTFMQXJV9CONoF7rciVjuoz1LwDVXuMp/bIeoVQrMT/RFG+3uS8PXvvbtKFX7BT6+5wtOhMNRNgVhCJzIieqCOVp2FTPgA3FBb9Jx2amqwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QMjH+ZFS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QMjH+ZFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719492185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j40eHrRxn2bt7yXdPHamWmWG6YNz7xn0J5QQLSbhfZE=;
	b=QMjH+ZFSTHAw3PGxp0MHt1CZ8rY0ZG/LHLZDruBmGLfo+/GQxj5urZRLZR68FUKv/4s1uY
	tWhTZa6Hx5BHqbngq5Qcp63GkT0ZknmLPo1d54fdMMlqJ+3wmM0jumTuAzbAb2J8sKj4FL
	APmsbXBb3Ky/ld3ANXuVdXNb7v6CiZ4=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-aPCRAVH2MEqgA1JenJ71Vg-1; Thu, 27 Jun 2024 08:43:04 -0400
X-MC-Unique: aPCRAVH2MEqgA1JenJ71Vg-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ee4e043c76so2510051fa.0
        for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 05:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719492182; x=1720096982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j40eHrRxn2bt7yXdPHamWmWG6YNz7xn0J5QQLSbhfZE=;
        b=H41G/f7Uxf91bfBciKZfasTeRKb8AdDkmnRFBgmCSy32Y8ZoW4/NXUag7hWmzQtIja
         ae+YeRp4t2vZkvDQfu+x2/VoGdGZmjK+R736dYoRic/HgO60Yc9AXcHjZiPl1imYis8T
         VMpcEDPLbAIy1WrGQ/W0QR/b6qulIbkHQmt2iRzCJQemoFElmnBSSezJ/2E1xYrkXIAO
         hQv+lswsYeRDH4xKIwm9q3ldH89kC+OsGuEPaMViAH8aw/VsF1p58Kw3tzSJPObbcJJX
         wTqJVN4LVwctcwYwcmK+TtKRRK3KHUGR66qVDYIX8ElEIRrbqZiVDbHBtxgG46aLJ300
         s6dw==
X-Forwarded-Encrypted: i=1; AJvYcCWEYoa2KDz0B3P87u5np0srGAVUGAUNyGn2jldr0p1KXbOX9GUOL2vdMocV85S22QYkWe5YBtpnaRe+vuJ3MfzWJPQVm7H5Whw8J7g4Pas=
X-Gm-Message-State: AOJu0YwvCmIh3XDATGXDEnGoqQn98y1kUH184wqdkZ//uW4+ygKCCUqX
	Br9eIX0VyyMcpzICTOf0QoErVCMuNXO+cSIgZvapRnkedmrHDZHPfe4lSZG2E4jRxoVFCdJVtRZ
	8U8i6mb1tg8Y7U5/gsS7L0xxARV1M4xQ17YlSXWC5/mFjDOEq8H7R69KNymKqQhh5
X-Received: by 2002:a2e:9e82:0:b0:2ec:52da:606e with SMTP id 38308e7fff4ca-2ec579c7702mr87253781fa.40.1719492182384;
        Thu, 27 Jun 2024 05:43:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8qXo73ZTkEwencXGwBD4u/gMFREj+6DQhNOQX9kskHbo7o26YQOrvvf8LUcd7dzCeDxLT2g==
X-Received: by 2002:a2e:9e82:0:b0:2ec:52da:606e with SMTP id 38308e7fff4ca-2ec579c7702mr87253531fa.40.1719492181617;
        Thu, 27 Jun 2024 05:43:01 -0700 (PDT)
Received: from redhat.com ([2a02:14f:177:a007:5be4:b928:19f7:7c2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564bb6d01sm25683135e9.29.2024.06.27.05.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 05:43:01 -0700 (PDT)
Date: Thu, 27 Jun 2024 08:42:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Si-Wei Liu <si-wei.liu@oracle.com>, Heng Qi <hengqi@linux.alibaba.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240627083606-mutt-send-email-mst@kernel.org>
References: <77ec85ae-0f50-4093-b499-3b6defec4ade@oracle.com>
 <1718869209.8824844-6-hengqi@linux.alibaba.com>
 <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
 <1718940245.6932242-13-hengqi@linux.alibaba.com>
 <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
 <1719020069.8729858-17-hengqi@linux.alibaba.com>
 <f03e76fe-9ee8-4000-b41c-0b284f2f237d@oracle.com>
 <PH0PR12MB54818CFB447152A25130F9B8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <bca1e5e8-65af-4825-b6fe-2ca3b6c41feb@oracle.com>
 <PH0PR12MB5481F4D12791EFECAB7831C6DCD72@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481F4D12791EFECAB7831C6DCD72@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 27, 2024 at 12:13:50PM +0000, Parav Pandit wrote:
> The intent is to restore the behavior to same as what it used to be when VIRTIO_NET_F_VQ_NOTF_COAL is not negotiated.

This is not what the commit log or the github issue say though.
The more I look at the change the less I understand it.

Can the issue be clarified please?
	Current spec text ABC is bad for performance because DEF,
	change it to GHI - as a result device can get better
	performance by JKL.


-- 
MST

