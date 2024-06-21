Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F9E16F295
	for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718963020; cv=none; b=o3tUzM27IacEvPJr/VmgEW7OEG+Ubgcz6q0YktCM8QXPJlQOjsEMGiz6BlOenC3IieXgCM9Rrv5xoEGgQvmvh7ASFVnZeXPAC3CQpcyfkqtRnrQINwF3S7HfWbhXTaWIfQpvX5h0x0LHYh2/RwaxURCMZu1tQ9lCH0GdhQGQgxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718963020; c=relaxed/simple;
	bh=h41upzXRjz+Dw3wurn5rmEW9bCy2roNjH1XGavMv7ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AzhuAP9p2iruUZsNP5/ZpZrhSWhRzK9rjoYtkswiExiiqVmHDounRP0Rofy5iyOI7a+NG1UNuUM/kYTQ2P3crfZJ1zMcCShqtQBlFTntHxhLTZEjW2CDzA4tJ2O4UL794XNMRQnGIE+i9ivz1uRc7oxmIrmvyKZp6Msz2duKD1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CFyEQP8e; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CFyEQP8e"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7046211e455so1264417b3a.3
        for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 02:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718963018; x=1719567818; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rXs71d7QLKa6yonnFQDgvoCh2eI3DsHC0dYSCMAS0V4=;
        b=CFyEQP8efC2iGyxb+S7d6idLBLEysyuZH89M/Jw822HWQPxRBlHzKQsdN30BpMnivP
         SqPblLX/Kd9iEvkx6I8E/HtcgtOMuGjn2YKfBCQ84+DhxY9scv454IcOWuuoyqce4zMn
         9PCl3c28ffz+l2bNfr8oGFSMGN6+EYJSExOXG8XXyycCXysaKrDiU1GelRbAVzVbxScf
         IsYzjGZELUWfFn9P+NXsJtYc8RD2k7DDBVzasI57km9ByjCC4Z86dNTzuj/l5879CUIT
         lm5o5Iv1Ig+PrjrGD6Xu6ghIDEXju0+gCVmLe+6T2xiJgj9YGA0pbx+lbmEgT7OVoLkY
         0EoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718963018; x=1719567818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXs71d7QLKa6yonnFQDgvoCh2eI3DsHC0dYSCMAS0V4=;
        b=bVn1Matmy7X+4fegpBigL8c1AeFN3eZdVFO9oA2bcf4ahzuGacr6s3gI533fQ19vpD
         HFiF0kkCpS9wxbqINfkp1gBSqeseHveL84E+uvwKgkFQ0ED9ss7y/8V2tdAAZvqTWUWJ
         LpEp5H7SEAB/nOtMBXMIqj/3hbJpdsQosBtiY7Q3kvuINZgkTQr0SQR7g1R6P9zfarTa
         StGkMB0RxR1btLWAXW5AnAVqJfAbUlBJJvX3A+sMmcgjFpeoY5lkoL+3o7/ftmdCr2qf
         wkFeeaAFeTB55YzvSxkcdeOkA5qvydWSg1bVrXnE9OBtuSLfxLjqmbH8puRSvyzAMxWS
         ZOyw==
X-Forwarded-Encrypted: i=1; AJvYcCUs0LmlvE1IhgaXGsnlSGWm+MhM5c5fjpUtuy85PIu9DuP1yo2CFWKhTaIUblv9HKl5eV9cGNa5dggyqLTkurXjMOeQkqwvGgLtNkpKhug=
X-Gm-Message-State: AOJu0YyR8cbU/JOyut+N31RVqziTUZBIgOsBEjJ0wj/jTraxPQjPYpyv
	rVre4PV/SNFFcncoioAYJGft90H6WAgF7C8iFazWHFCBnfPFAq6KcPr0DpbaRuA=
X-Google-Smtp-Source: AGHT+IE2uF5ISS4TKN1I1jBhIJZI1R88I2Bf9RzTLvdK04VC3qrKZmwjHcqRS3s32EDrlAqCClSwYA==
X-Received: by 2002:a05:6a00:2e95:b0:705:a171:b994 with SMTP id d2e1a72fcca58-70629cf92d5mr9634258b3a.32.1718963017905;
        Fri, 21 Jun 2024 02:43:37 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7065128e242sm1024010b3a.144.2024.06.21.02.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 02:43:37 -0700 (PDT)
Date: Fri, 21 Jun 2024 15:13:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [PATCH V5] virtio-transport: Clarify requirements
Message-ID: <20240621094335.ilvrwycyrzxjqao2@vireshk-i7>
References: <9d543789de03d26a27a43ae8f7621d07d66e8731.1718084050.git.viresh.kumar@linaro.org>
 <PH0PR12MB5481413D59F2DC236F0B59DFDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240611065816.lq3ehs7fmpjbihip@vireshk-i7>
 <PH0PR12MB54815595D5B533A6E38636F2DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240611084103.3u7bsoe6nlr6xngf@vireshk-i7>
 <20240613093203.24hcx7euw6txy3zs@vireshk-i7>
 <20240621053854-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621053854-mutt-send-email-mst@kernel.org>

On 21-06-24, 05:39, Michael S. Tsirkin wrote:
> On Thu, Jun 13, 2024 at 03:02:03PM +0530, Viresh Kumar wrote:
> > On 11-06-24, 14:11, Viresh Kumar wrote:
> > > On 11-06-24, 07:41, Parav Pandit wrote:
> > > > Got it.
> > > > I agree to Michael's suggestion "I feel a non-normative section is enough for this."
> > > > So following his guidance, we should remove it from the requirements and have this as,
> > > > 
> > > > "implementation guide" or appendix section and it also looks good without the key wards too.
> > > > 
> > > > Otherwise, this requirement section becomes the example of how not to write normative in a normative section.
> > > > (and we want to avoid future such examples).
> > > 
> > > I am okay with whatever Cornelia and Michael finalize on this.
> > 
> > Michael, Cornelia: Any decision on this ?
> 
> On what?

I am a bit confused about where exactly should we keep this section.
As the current patch or appendix or somewhere else ?

-- 
viresh
