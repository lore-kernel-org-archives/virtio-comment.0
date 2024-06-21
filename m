Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F28716EC01
	for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 09:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718962790; cv=none; b=fsq1ZuNjspO9LZufshD4M3W5SBBSYWLSEVnXGjrzZAsZ2JXMThV4Y48szGWVq/Kt0hcmJDABJmZLBikYRv05PCD0cj6KIKOg01Ri6j5sGporlMRgAq4MM7EkJKjvOwFZZqNdftXrGdpCPlrG7h472RbmV/8daTETiGv3dfBN3Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718962790; c=relaxed/simple;
	bh=UXwu/mfe50jBOTGkU9kyz9G1agEvCBSaKOCzv61eHk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=n8U6ZzhaTtt9Jjkp51QZCc1EtHeYxWHdZuux2Y5/HymiMHI0ATMeMv6vJ2ABGGWErZNg8zWx6dyI3LHH7rABYy0UfDfDHluiv756MMctR5Qugb7qibtumglGsa9UlFMR3R2e5OUaZZgXdT85tA2Lm8PMmT1WGHaID8YX0/gbibg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IZCjG+kj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IZCjG+kj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718962788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sr1nDH5F0SO3WtGbP0y1uBWVafLn+UqXKCsJENMGCpc=;
	b=IZCjG+kjy2d95XOwe0BuJz+AqwZ7Gw9YixQqbShNLHXH9hc6GrJwZ54AaLHxof0NaFrKxs
	baugEemHoQTm+Y68s34NrnfMkh4+Yuq+al5EguSv4L9jO1yQ0oQCZVgoHSvbXb+ef/2hDy
	/2gFWv5wh6RlDCLlKfrZ84HmbumhvGM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-CsNjihPXPvWeGsuYSdHd9A-1; Fri, 21 Jun 2024 05:39:46 -0400
X-MC-Unique: CsNjihPXPvWeGsuYSdHd9A-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-57d16963d77so1023344a12.1
        for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 02:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718962785; x=1719567585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sr1nDH5F0SO3WtGbP0y1uBWVafLn+UqXKCsJENMGCpc=;
        b=LlnwX/34gEovwm7FUFABlz9Rfliw3BInXZWfj9esOUiO4ZL9WnBdZpPtLx9c7zjwyu
         IVL/11pSm68w5EwwlRnAFajlHudE3fsdG8M2mBvhVpTJq0Ks/Xhf+I3UdFnrHUFm3N31
         5y6gvpIznu20JMTOlBlBtyl4W7jIXctgeJG8RPS2aCNItg4WL1ooSY2+oqVK+4WECQXu
         BTcinkdOmfEKSUXRsJfwqtPsG2Ypp7D13TzI6vvCJ8Gp4qc1jAIBULn6tE26skW1WS2w
         14YpTOfOjsYXm0HKTGAcupHRaq6aRZ3v4IH1LptMkPbLGdeT3zPRBwu2NntOhjzGkEF6
         H4NA==
X-Forwarded-Encrypted: i=1; AJvYcCWVJbO+yuMoBVDYP12wRJlyYIfnCLhMEZ9jSKMgwEi7Qtpqw112JpynbMQiwdUfNn9411koq2Vrj9+KFrzqxKUNL5Zm9Eaar2H+2pqAjEI=
X-Gm-Message-State: AOJu0YwK3dlSsC0iOHO6iwwMogdn+5gRD5Yh7SQKy2jPuB8+rAFKQd4U
	3IYEMe8OEgOlAmjhGADML71md4pHXmBr3Y96CulcRzLelfe+OjXpZU8fJrsp7Nf0uK2NDQsy2L9
	il2h3ZsnlDAYy2b54ILnCZSl0qr6y/zF4E2AP8I+4KzdI/sqTPoKz+zO4BO1GzGEN
X-Received: by 2002:a17:907:c20e:b0:a6f:b75f:3d46 with SMTP id a640c23a62f3a-a6fb75f3e79mr563692566b.43.1718962785653;
        Fri, 21 Jun 2024 02:39:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxXNFKerjWrkOupTiK9gaQzTnBhuvcPpehsgBGK93PJQuUNiKRAQzbvpHMe4+o/+LPefSHFg==
X-Received: by 2002:a17:907:c20e:b0:a6f:b75f:3d46 with SMTP id a640c23a62f3a-a6fb75f3e79mr563688666b.43.1718962784768;
        Fri, 21 Jun 2024 02:39:44 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf133228sm64675866b.0.2024.06.21.02.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 02:39:44 -0700 (PDT)
Date: Fri, 21 Jun 2024 05:39:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	"stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [PATCH V5] virtio-transport: Clarify requirements
Message-ID: <20240621053854-mutt-send-email-mst@kernel.org>
References: <9d543789de03d26a27a43ae8f7621d07d66e8731.1718084050.git.viresh.kumar@linaro.org>
 <PH0PR12MB5481413D59F2DC236F0B59DFDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240611065816.lq3ehs7fmpjbihip@vireshk-i7>
 <PH0PR12MB54815595D5B533A6E38636F2DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240611084103.3u7bsoe6nlr6xngf@vireshk-i7>
 <20240613093203.24hcx7euw6txy3zs@vireshk-i7>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240613093203.24hcx7euw6txy3zs@vireshk-i7>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 13, 2024 at 03:02:03PM +0530, Viresh Kumar wrote:
> On 11-06-24, 14:11, Viresh Kumar wrote:
> > On 11-06-24, 07:41, Parav Pandit wrote:
> > > Got it.
> > > I agree to Michael's suggestion "I feel a non-normative section is enough for this."
> > > So following his guidance, we should remove it from the requirements and have this as,
> > > 
> > > "implementation guide" or appendix section and it also looks good without the key wards too.
> > > 
> > > Otherwise, this requirement section becomes the example of how not to write normative in a normative section.
> > > (and we want to avoid future such examples).
> > 
> > I am okay with whatever Cornelia and Michael finalize on this.
> 
> Michael, Cornelia: Any decision on this ?

On what?

> -- 
> viresh

