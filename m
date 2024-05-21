Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB36750A63
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 07:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716276297; cv=none; b=YWWrtyg6ykzXCybj53x1LcB4i7hC4BvQIVF4SHNtd2A+BKoXgLwA4c67aJENLax00ssMPzuJERawlDYRkLVoCoBxR5IjooDHRHKmtRubqauVlG0vwEWmpXGbSFV+LllyBPle7LbxadydPV1hZKil/oin2/6c1vR/QZOotxn0ceI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716276297; c=relaxed/simple;
	bh=/Pw1uAQ5kXjktUUIOP2sZCqgeyOwuQAcyrOICzW3qLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Uprb//6hg+KwqEM4unE6WPvuPOOx7lnl73jvgN5ql1tIkmF1jel+6JlEaR0MtQgsK0Sd/YIuCCrC73C3V4HTWVVjblyQV5F7nnwqH0rvMgpFV+nv/zhSVIPilHkr/y38Le5qp9ji1IgpVdxRz3gHY3A42k60Tgxh19M6XnoSNt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nz2Qe9sZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nz2Qe9sZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716276294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HZvM6koxm6AZgYnrk1sRl33f057/EfqhsOgzW1GvWdI=;
	b=Nz2Qe9sZMlYHyseVkSmvRfqA/c40oF+jWRq65MEmNEzd9Jy1r+4bE8eIn3T92IDBHquG50
	Dg1lD6hVTyYVeiboHUePeekCzK6bLB+rMJJYiKchpTSiNE0ZhVbIcG8a65EupDtnPdXTvC
	/r3EMOKUsymjRbm1YW4rCW0rtFzKAL0=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-8Pv_UTUJO8-pxMrjg2ZdhA-1; Tue, 21 May 2024 03:24:51 -0400
X-MC-Unique: 8Pv_UTUJO8-pxMrjg2ZdhA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-51f843d9194so10989081e87.2
        for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 00:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716276289; x=1716881089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZvM6koxm6AZgYnrk1sRl33f057/EfqhsOgzW1GvWdI=;
        b=VpppRFK30HB2cA+Yd6OrE1la4qKM3BSLNQBlnRTt6tqGmhaFcMtRGOSqLUsbnrMAjk
         8xVx9ulkiUGnOB8+Be7ocptO05BIYjU6//OAZ4b8i+OelliEPy8nShVU04ZUKjxkIjaj
         bYmNbxc4QdL7XC9sePjX7/M7b59fJk1ZSwYjO1xdoMU2EWOMjiLffEbWP+mKDFh5byX2
         AI97uCuP2S+JpiaXkoqek72C4jgUZLLUSlfOIra+Ip/1pt407OxsBByqqGtPU2VWTpsa
         9k8Im3cJrwQMD1/CMFJcv0xu1p0JIeTRq9lT9mqV6lG2orWmny1DX8XG07sxG28BH43v
         I8fg==
X-Gm-Message-State: AOJu0YzClN1CfkR5HnLXSdT4+jEzAsfMkLwsD9SpJQCn6avcOCGqM6Ho
	FuNMxrP2CeEz+QWi0As3/NNWi4LVa8eres0+nhDxTdIZSdeqxu6NXfaGqcK+hjJZT8JOtyP+lfc
	UikEJJbwZXtj8I4VK6Q1XRpXcxAw8oOEqKz9fcq9woipEDoJDkp/YlMoGSjor73LT
X-Received: by 2002:a05:6512:312f:b0:51c:1fb4:2327 with SMTP id 2adb3069b0e04-5221006f7f3mr20424352e87.24.1716276289457;
        Tue, 21 May 2024 00:24:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwOf6l29lj2m7JbpfaafhJaACjD+EfWAdxc6poV8JRZgmKX5Ar65Zm2atyLYzMGvy8VDwqXA==
X-Received: by 2002:a05:6512:312f:b0:51c:1fb4:2327 with SMTP id 2adb3069b0e04-5221006f7f3mr20424337e87.24.1716276288909;
        Tue, 21 May 2024 00:24:48 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:240:5a20:b565:3672:6f2b:3d2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-354ca01df75sm3599506f8f.84.2024.05.21.00.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 00:24:48 -0700 (PDT)
Date: Tue, 21 May 2024 03:24:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: [PATCH v3] README.md: update mailing list info
Message-ID: <20240521032438-mutt-send-email-mst@kernel.org>
References: <8f5db33c96d685fcebca3579b05d09b64dd720d9.1715766697.git.mst@redhat.com>
 <PH0PR12MB54818B506EFE9E4ED61B4294DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515062910-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818853B8A407B6F2A3D463DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515063503-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A1F599028CBFAB58F594DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481A1F599028CBFAB58F594DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2024 at 04:19:31AM +0000, Parav Pandit wrote:
> Hi Michael,
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, May 15, 2024 4:07 PM
> 
> > > > I would wait until next Monday at least. Give everyone time to
> > > > subscribe to the new list.
> 
> Can you please merge this patch?

Pushed now.

-- 
MST

