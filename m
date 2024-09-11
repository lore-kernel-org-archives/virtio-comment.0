Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD837EEFD
	for <virtio-comment@lists.linux.dev>; Wed, 11 Sep 2024 10:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726048913; cv=none; b=KkgeeTH5QaijgBNOpQYDrEXGy7U/AnLh5JTYfxyy+95cHni08w5LnTe1NbXD0kvTz5348LAkDe77jQOnPoBCHMLxOGVmB90/T2Vs4f2lsbgcmQMWiKNokX0Wu4Oeu1F5yPrTyejsM0heHBgF7fdMkse+RLuxVfm2lrAhkQkEszY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726048913; c=relaxed/simple;
	bh=umBO1DI5ec0WSSKQJ7k+qBHEfFTR80coQZLAOTXnR2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=dMbBpffdVlgvw0L9epQLkL+SCMZzr7mIOCnFD8tk3QauIY1Q+2DbCOxWrKHRT941cL73/Ob+eBIfNi4t2FXSOIU7noFFcd6qjD7upilZBa1gA6c6anfzq+3yuIz8sxahLjW8GlNXZJGpv3N+op9VGIUu/rmfY5R0pXDNM3ew6PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hy6UKAIY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hy6UKAIY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726048911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hrsK53n5BylFpD0yGDeSRvBreFSVHxqIS81+/HFNF/4=;
	b=hy6UKAIYFY/H3rt9LlbHrhuP/UdHLXENbHbpWzNkISJiEPdeFv5fLby5C1QF6MSrDjT7fI
	LFS8tTp8XUcutaO60U94Q9nJkSzUhZwLO5YjQhIWrW2jUSdXGnfW6eNXFniDyNQx+rO3Qa
	WpSMIihskLVpCDRQWMWdoXdhr4jcaZI=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-MWOleU7rOdSpmcEtRKguRw-1; Wed, 11 Sep 2024 06:01:50 -0400
X-MC-Unique: MWOleU7rOdSpmcEtRKguRw-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5365cd47e2eso3701094e87.3
        for <virtio-comment@lists.linux.dev>; Wed, 11 Sep 2024 03:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726048908; x=1726653708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrsK53n5BylFpD0yGDeSRvBreFSVHxqIS81+/HFNF/4=;
        b=ZksFXFT2NyUHA1/MOOzVIIDI1Dm4O/h1KCmXe1k29qIX98+Qavz/u6Uhi8HRfZJsQ0
         bJ37hXQifwqLoS0sXb1Wsz+uXRbAxexnkiNhmdL/bS9jlU+u6Ntl988UNhHqEzBFVtgG
         tQqIRd0WNeSWVLPnYU3tMkXKnBvVXHFNmVS1as9LUK2jZRaYN30Qkj2Y6FllkS42FaS5
         LIUQYI/db9RTyCoCc7hpoyKvgd5rasrqb+KacTWsBTeZd1HvsWA36Zn445wpOHXeqZj/
         aHYzL/5mImeDdmfODvfF+ltybDx9rmNhysRBxZfuiRqaEqvjoz1WBwJO4BLll2JoUdjI
         PM0A==
X-Forwarded-Encrypted: i=1; AJvYcCWNpQNQjWjuKRVG0AcNrhYvBpydiN2HbiM1HH2ebeHRmhZYvF2cyzOFWq1IHXq6gOQQcLjl0xaIkNPppcZz7g==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywonl/AOqMhSl440eekFAZnmSPTHgbhBLKVxsjQ1n8fsY12o5dY
	RAHOZ3YcTCzCbybt15vSCkFwvKh+n7GIVomgapUXldJZKf+v6q5xulT9vekY6SsbR43YGWIsPVL
	GUNRo8n/j9OfLyG5cHhpP1g60ONQ3EzoZ2RcrL93CjwGgzaz2JcMRDZL9VjFNzztH
X-Received: by 2002:a05:6512:220d:b0:533:483f:9563 with SMTP id 2adb3069b0e04-536587f8258mr10107554e87.45.1726048908428;
        Wed, 11 Sep 2024 03:01:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdVk3f52L5kHv/aMqzA9zBQjkXEZ0HSBqfvjmUCnYo8O3zgK2eHZPol5IyFAlQhM7BKioe6Q==
X-Received: by 2002:a05:6512:220d:b0:533:483f:9563 with SMTP id 2adb3069b0e04-536587f8258mr10107529e87.45.1726048907798;
        Wed, 11 Sep 2024 03:01:47 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1ec:a3d1:80b4:b3a2:70bf:9d18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25a43365sm597167166b.94.2024.09.11.03.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:01:47 -0700 (PDT)
Date: Wed, 11 Sep 2024 06:01:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: Re: [PATCH] device-parts: editorial: Fix metadata type name
Message-ID: <20240911060140-mutt-send-email-mst@kernel.org>
References: <20240907165218.778501-1-parav@nvidia.com>
 <Zt8DqrYIXGMM399j@fedora>
 <IA0PR12MB8713207F29554B2FB2219AAFDC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910124712-mutt-send-email-mst@kernel.org>
 <IA0PR12MB8713C76D953BE65BE6842ACADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910143400-mutt-send-email-mst@kernel.org>
 <IA0PR12MB8713D2C68564AB88E9D159B8DC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910161943-mutt-send-email-mst@kernel.org>
 <IA0PR12MB8713E6440868B97D63A52396DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <IA0PR12MB8713E6440868B97D63A52396DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 11, 2024 at 03:19:45AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, September 11, 2024 1:51 AM
> 
> [..]
> > > It is already in italics.
> > >
> > > The question was : should be written as,
> > >
> > > Option_A: \field{type} field indicates so-n-so...
> > > or
> > > Option_B: \field{type} indicates so-n-soo..
> > 
> > Ah.
> > 
> > I don't really feel adding "field" adds much, because of italics and because
> > one can see it's a field from the name.
> > So, brevity wins.
> 
> Ok. Got it.
> The current patch is discussion does not have word 'field'.
> So current patch is good as-is.
> Thanks.

Agreed.

