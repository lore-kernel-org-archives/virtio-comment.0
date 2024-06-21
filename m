Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAAF16D4D1
	for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 08:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718957109; cv=none; b=r6xJGt0/ALG8GR1m7fvHkN3dfYyQphofD7IDEafi6JD20Hv+4ePrKgcerKldHShYV/B8LCGamxWf/mxKgCQi2peAHIDDfzyLLPAdEJNryIyqGt3Tyf6Ysa9YrYsUHiJvx345NWYU9p9p+JdDhpKALsJ0qlyLzjK9ofrRl1ix4Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718957109; c=relaxed/simple;
	bh=8/EwNd+TaUeIwJJ9INTgsc984u1foPe2hkH5cFPKkNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWsGLrwjkbLJiW1Uzs6kopiuAMbNGCWM9aZ/gw/zwH02iOv90auVWftyvqhrw7qNfSmSxcs82iWZE3H1gs1RMrBaPYCM8bVTgz22/GDzM3hc3B7ojRU83edMIv0wJfZjOAKiyKQkT15mojpqD5InziaTyIy72ORnkrxL1tNSNrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IpTYCSPB; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IpTYCSPB"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f9aa039327so14940915ad.2
        for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 01:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718957107; x=1719561907; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=twnj+Q1gQXmV6oUXTtUBElDm+K4Mzcq27JCK6PpRDsM=;
        b=IpTYCSPB67Bni2XsIK6U2Q4VMJqGO0A//gu3e6aDBLzYUB8pkV6HSv+svF6D+EyVZI
         epNFg472vaxIgiTmnXYKafb+FYGgR9Fg4ReljLC5GQBKbQx0uBJaCzd/Ohfw1vJjQxi+
         k2zeOlBHmnucQ6gXMU9LZy5kRCYEUA1nUtFncQbs3dY06ORNAxfFMpfb+ikvoNAoWFMT
         JgmACAVFhl++phhjUtXxaRCtV34gN91S0cauaa96w/hJrEnMd+UZfNPJP8DS7e8KNKua
         zJDRWpWIR0r/TmDMgnLuHo56NPz3O9ety4xBEj0OmyavSCVcXHTlKQ3u3fiDEvdySUg8
         gpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718957107; x=1719561907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twnj+Q1gQXmV6oUXTtUBElDm+K4Mzcq27JCK6PpRDsM=;
        b=q8l5+Osxmi13lxcVAp+9PTiYiIEJ4zd+AnmL9FiMhteBLdaMkmHLm7ao4pf1B31AGz
         6DwH7MVrLWG2KRxt+Gh4Aq8LUtdhw6t8SbUv3rEMKgQZqFWaz0huBTU5IEEKYtShOtPl
         LqInHbXdaRT1x1bgFhUWmn88qpj81sCqyA1D56wB7NcsDHCS/sCy6PUY8+U6wUM/s0AL
         1IR6TlZcczZeshBLPV+Xv77lH1LiYysIBq2zXV8XVLitXalesJ5RoBsCRglPpedXgZik
         d1wWA4rIa7o8ZzC6SUlnEfN0J29I85iarC/akeVKEUT+6UK7jhZhqIsuSp5Z+LNDPhBy
         nmJg==
X-Gm-Message-State: AOJu0Yy6Q/rffbTDwSNkJghoKOyAFBzh/mNvyQ8TFibhM+H8V09EaTS7
	F3+zJGUFy9CDgMwvyxf11QWABzbjVRCiR7hPUbR5A4cECeK4My0yj/rl9zZEQak=
X-Google-Smtp-Source: AGHT+IGdHpzj7pgbXpCng2WhGCK0kagiUUwSoYr8K+eYV0h+ovd0Z7nzldL87vhjT0esacmIfJNqsA==
X-Received: by 2002:a17:902:f550:b0:1f9:b301:dc6 with SMTP id d9443c01a7336-1f9b30111f9mr71811135ad.7.1718957107239;
        Fri, 21 Jun 2024 01:05:07 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb2f2a06sm8447645ad.31.2024.06.21.01.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 01:05:06 -0700 (PDT)
Date: Fri, 21 Jun 2024 13:35:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [PATCH V5] virtio-transport: Clarify requirements
Message-ID: <20240621080504.aooo53v7tcx2tvx7@vireshk-i7>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613093203.24hcx7euw6txy3zs@vireshk-i7>

On 13-06-24, 15:02, Viresh Kumar wrote:
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

Ping.

-- 
viresh
