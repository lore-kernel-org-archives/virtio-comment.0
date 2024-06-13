Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD50381C4
	for <virtio-comment@lists.linux.dev>; Thu, 13 Jun 2024 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718271128; cv=none; b=PuvvgUoaKlXAMiMDZXRGdaMV2FK3uVMLwEP3+weiJt1EBMKMsVotBm+r5NBPyyMewGOdvXC8kIIHyMyH7AFVk5LgMYNDx3VOZq+HDaBLTBEsi+s11uCEXZpytN7OIqBYrpY/87EfVd+2PfRBUOxTfhYXFlCGR+4Rm6Ug6XrQ4V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718271128; c=relaxed/simple;
	bh=2S9Q0GgzcwBxHcpJaspMGVCjSXdsS01VeY87lFDs6xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vxiyp79vKb75lSKc69lbQrL7wjgiojD858eXDCabknIVRcKqYgWUvpXl1mkjoOMdmETV+pavg9eB/NKmjUhi4r8nR682W2xxNqFA3GjUdCMVc7sGgM9IPgZoccsBLq57+/4Ai8ya0WmNM7mIGBoy1CWp3rNUBfju16CsKu1k4ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lStETDRW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lStETDRW"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f47f07aceaso7844485ad.0
        for <virtio-comment@lists.linux.dev>; Thu, 13 Jun 2024 02:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718271126; x=1718875926; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lBVIur4GVh4oeHCaL/DETOFosK2cvE/luI2XW5EC2D0=;
        b=lStETDRWMy4x1WPqkiE+Vym/aJkJwCRfWqGCN0p09yAzqLCDx9AMPmTBwiYSggD7uW
         E4R4JaAOjzp1zcXHJVhUNCl3vI3oiuVA6kAR0OnCz1tgW8UkKLV/HLWocYOFyc2O/g4c
         PIlkscSjSf4QvUFhnd55DyiBC4fi9O17lJrYQavSn3XNdWLdIN7TeNJm3DfjSR76JI3E
         4LEAyR7VQWCQxCXJE/WL2HSzDfrk9l3cfN19yTA+oMYc2Sf3kuWkdaVk1GyaUg/TBsmt
         JRiJKEvsjk//7TAhglowTP/9MS8QKFXpy4Jo91+vBrZ6MWnLb8Ir5rwiH8To5SYHJgCQ
         whSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718271126; x=1718875926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBVIur4GVh4oeHCaL/DETOFosK2cvE/luI2XW5EC2D0=;
        b=Yas/M6fMkaEEG2W84iMnLsYRcII3xmMzalaNuCxyaiCPHClvcwRln1bPTDFNwkKYay
         MLxoNiki89jqe/NRywxXS9agJDboFrSwua0opJIuKeQIjNiO4WHEOxPyJlwbuh9tW/l0
         BFIhricFYCTDwL8LJO3agk8MaFF1GUZ1IL2LIQ1FRL/ImwgDOReY+1exCl8Rm5aACRaD
         WVTCmKdc7oqSBb4PHVE2e03eurjbL6Rn9tL3RLoDMTeJXuj4QBF7wRqBlL4SD/XAe2Y1
         YApvMQKENf+Gz2idv0wPEFWwUYRYKGOTJIuJn6ECudIXJpQAyf9212y0OAE6ihtC4eP2
         HWwQ==
X-Gm-Message-State: AOJu0Yz0e8CY6qS7W3SI8ruRfm+kFMXCimep262cX2j1XqKBQhKgzJzW
	mmhzvjmHxnf0jDSHaJ70nNz2fQqme4Q4UieFcrB+gcmndBsdpFtJt6cd2XFBi9o=
X-Google-Smtp-Source: AGHT+IG8gXfRBgHDlXBraoEdhBICB5kOakhPGJrB5nmKTyitDy5jJz6iz9/aNUZ/zF5dTxSeVn+NHA==
X-Received: by 2002:a17:903:2344:b0:1f5:e635:2212 with SMTP id d9443c01a7336-1f83b22d0cemr51825825ad.0.1718271126260;
        Thu, 13 Jun 2024 02:32:06 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e56535sm9242795ad.55.2024.06.13.02.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 02:32:05 -0700 (PDT)
Date: Thu, 13 Jun 2024 15:02:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [PATCH V5] virtio-transport: Clarify requirements
Message-ID: <20240613093203.24hcx7euw6txy3zs@vireshk-i7>
References: <9d543789de03d26a27a43ae8f7621d07d66e8731.1718084050.git.viresh.kumar@linaro.org>
 <PH0PR12MB5481413D59F2DC236F0B59DFDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240611065816.lq3ehs7fmpjbihip@vireshk-i7>
 <PH0PR12MB54815595D5B533A6E38636F2DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240611084103.3u7bsoe6nlr6xngf@vireshk-i7>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611084103.3u7bsoe6nlr6xngf@vireshk-i7>

On 11-06-24, 14:11, Viresh Kumar wrote:
> On 11-06-24, 07:41, Parav Pandit wrote:
> > Got it.
> > I agree to Michael's suggestion "I feel a non-normative section is enough for this."
> > So following his guidance, we should remove it from the requirements and have this as,
> > 
> > "implementation guide" or appendix section and it also looks good without the key wards too.
> > 
> > Otherwise, this requirement section becomes the example of how not to write normative in a normative section.
> > (and we want to avoid future such examples).
> 
> I am okay with whatever Cornelia and Michael finalize on this.

Michael, Cornelia: Any decision on this ?

-- 
viresh
