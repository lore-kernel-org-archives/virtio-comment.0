Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901D314006
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 20:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721076095; cv=none; b=gRXrfTzpdnrcj0iOBbDDXo+Acs5rwWOl4czBJ7zYcjTWOt/PdQgqgOYCzOXnLINfVyiC+O3ffV1Itu7JJ5LXxklwzB/0eQ2NmI+sIZS4zkuizwZibGVZoc1oYNjLSrcV2q2dcpA7VMtWI4wbn+GWPKeyzOWUQCymr2pGWUO5P6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721076095; c=relaxed/simple;
	bh=W3FqRSkDibqBgTF96T+4nfoxsUINOrNyAp/OgnykM6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=CkZnd0kM9wy8+Ub+lhmgH16TfcRpJRqndBaQZElVc2l6ufpjPjv7jm8DwteXQ+X4Vt9xFpFKdnzXZyOVDbc8OAwjmZkN6LrdWY2CVDTx9HyF43TdOurBmlYK4UDM1oOYilh2JAGJRfJDyjdF5KkT0cskivaqgf2ZY6OpNqtN0uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H7yd16q5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H7yd16q5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721076092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R43gUwYZQU6b0aKTIQ3MVKE7JGataD+BCVWe9X2/xWs=;
	b=H7yd16q5KuuDBWOiG15YehRJVcV3SQRjeOfQ5eNKOMrjSDntT+uXMKTd2b969H8Ni++EaY
	p/F3PHum/uOOCQAmSI/3W/ehHspUqj5Na/lQLvx2g+Z1rnto6uf2uWBsSwk7c4UxIcWGGN
	GagffhUDvRLygBTMjHzqeGrHNE4xOu8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-gX-nGyXqMvGLr4dGM-JQuw-1; Mon, 15 Jul 2024 16:41:31 -0400
X-MC-Unique: gX-nGyXqMvGLr4dGM-JQuw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42666ed2d5fso30967765e9.3
        for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 13:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721076089; x=1721680889;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R43gUwYZQU6b0aKTIQ3MVKE7JGataD+BCVWe9X2/xWs=;
        b=I4wXRvh2c5bELAu19rEw2FEe77vXL1fo5KB27SltvLBX8eod2JnAKu3fV37bdtkLPt
         gOoAPQxRNip6So5eYtYXzWI/UvwcJcxEa4n6uN0zqqpbVdneTf7jVuylkPBkpPdcg2QR
         Ws5w9LPGYxaF+vq7LGvOJXmgOcw3yK8eeljL04WxlwustQootmUZZWZPe7sXLdtHQfN9
         5B4d1klwFGmoTXnf6DSaJMirLYM9phjlbXlOUqVdm5k/NteQAqMjrytuhvPqJrMiLNOO
         xItB6yhR3ioFlR9SovJ48XcsEn8s8O0RswSGmYYW+JJmDCZiI8ZFkLhfyJ4iN9lTCSZU
         s1gA==
X-Gm-Message-State: AOJu0YylWGayVuPa34T6HzihvgvOggIrAMF4x9QHiCwbKigH8V9XGHbM
	8IlKA7DNQV7ZiOio5SA1AX73WZLkyTD3n3pcP+devC3x6rhmOc2X7YDRdVDBuLfWUuF0eaGBL5a
	BkpxhDoVzR0zWrFRl/IoF2DqyfJwqOPJQBeG0A45uIXEbYbwPBsCtPmqsyS+9tacy
X-Received: by 2002:a05:600c:5487:b0:426:6ea2:31af with SMTP id 5b1f17b1804b1-427ba71d9dfmr264105e9.37.1721076089580;
        Mon, 15 Jul 2024 13:41:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMW3OWaWyIWTAOBsom4ALBMZY1KLxZK5A8+wPlMOgFFc3yM/cHyk1GhvypCA4iRaxx3g8p0A==
X-Received: by 2002:a05:600c:5487:b0:426:6ea2:31af with SMTP id 5b1f17b1804b1-427ba71d9dfmr264005e9.37.1721076089055;
        Mon, 15 Jul 2024 13:41:29 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:243:da88:7ff9:68fc:2f43:bcdf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368111d3e7dsm6817677f8f.87.2024.07.15.13.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 13:41:28 -0700 (PDT)
Date: Mon, 15 Jul 2024 16:41:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>
Subject: Re: [PATCH v3] editorial: replace hyperref with ref
Message-ID: <20240715163830-mutt-send-email-mst@kernel.org>
References: <20240714143632.3291695-1-parav@vr-arch-host06.mtvr.labs.mlnx>
 <PH0PR12MB5481B7000236059EA3E243A7DCA02@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481B7000236059EA3E243A7DCA02@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Jul 14, 2024 at 02:39:06PM +0000, Parav Pandit wrote:
> 
> 
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Sunday, July 14, 2024 8:07 PM
> > To: virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com
> > Cc: Parav Pandit <parav@nvidia.com>
> > Subject: [PATCH v3] editorial: replace hyperref with ref
> > 
> > From: Parav Pandit <parav@nvidia.com>
> > 
> > Replace hyperreference with the name reference.
> > Fix the broken reference link for the DEVICE_STATUS part.
> > 
> > Fixes: aa4f6f069ab3 ("admin: Add admin commands for device parts")
> > Fixes: 617aa2d62a88 ("admin: Define common device parts")
> > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > Message-ID: <20240713181540.3284147-1-parav@nvidia.com>
> >
> Missed to remove the message id in this error prone manual process. ☹
> Sending v4 now without the message id. 
> 

Shouldn't be manual.

The trick is that you should not send pull requests from
the same tree where you develop.

Instead, email patches, then use "b4 am" to get them
back from lore and apply them to another tree:
https://git.kernel.org/pub/scm/utils/b4/b4.git

test the result (detects instances of files you forgot to
add to git, etc), tag and send the pull request.

-- 
MST

