Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0087A1B12C4
	for <virtio-comment@lists.linux.dev>; Tue,  3 Sep 2024 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725360834; cv=none; b=u1WCzs/DDSMVAUgyyGs80tKJRlJe2cqXCiiFgoRkabhEpdnq/32DW1n9ey8R4ybIfFnBor3hflBiTf84VQphbSkGLzTAiT5/zN8yRGGbzrQ7LBEmoqKAL+edCiZE72Tq31kYhAuemGMY8kl13vngidKjDVixy7hUMQr8BHCTOps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725360834; c=relaxed/simple;
	bh=zyVKhDWH3nYoD1bUp2DrwFFcHo2jnz3T9xp0a/oYglg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ly/X17VvbC1FkJseozOF6iVL2A1ii06sUUCrz3kVtpiTEC9dRatXazsNslElMlso+fSePcTjU+R0pfDOOMgUiLAQ8vVL6IUcpdwLKYGtzbfEoL9VrjRqHm3kOz1Vf+C003dYIu5U+Gv+Vr7POIde14TH1Mi+arzgpxGko3g9W70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aJ3sn/y2; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aJ3sn/y2"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-202508cb8ebso30845485ad.3
        for <virtio-comment@lists.linux.dev>; Tue, 03 Sep 2024 03:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725360832; x=1725965632; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kg2q9ovxHjzVFKVz5f2f8Y3Ql+4gs8e1JIB52OuYdbc=;
        b=aJ3sn/y2YlgVScdJSbl9BZhEtl1A5Mf8rvPPnOgM35/368vBoj/e7yIn92n5uF4o89
         RNGxRKBsjfDnrn4mAz5otfQQNq04OrXc6kT6f3OWFQQg2KMLiSoJT9Uq3mrV9JKsugo3
         nHT7yAz9oQ9EjDkLzA7F65eQZh/tGWIwgOzR2dXo3eNu0WCnZVsZx9qGa79qwH+YCdd+
         89H1X2EOUJUvq20mFs/4nFm4r/WrQZiXkuQL5Up+LmpHxwcZxnVzARYVrWrRYaDkbjsQ
         2w9LmzcG5BkYfjsvV509+PyblpE5HMMCcUe5Uq2wWD/ri2ZcAZCgVp+z51ORhCH/I0sE
         Ttow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725360832; x=1725965632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kg2q9ovxHjzVFKVz5f2f8Y3Ql+4gs8e1JIB52OuYdbc=;
        b=lITUWeaVWp+6LHHSdq13cMoUuHVGm8v9g2U2mbZulod2xRZPygNp1hw8/fC3pPFGrT
         h68WeOPmbo3gadn2nxGqglXEkMo+OQbtRiOx5s/vW6xZiqTKLSDcF7Y8F7rL1nUNdVxp
         pkD7EfvT9LU6UTl/+xj2Mm0pvyiomcZPH2/v6R/I8XOJ6vHLjcXs5h/CJvh1nFVu+yn2
         /OYSnbLNRxgc3EZbs0UXMWVHQLY8caCKyks2Nb0Ffwl02qjYkZXp6EAuZbbaeaUNQP10
         qzKeom6wkD1d5EnpImewWZgxirgMetd+0jyKDiR0W6QzwpcacsEz0hl551900ToTKBt/
         lLtg==
X-Gm-Message-State: AOJu0YzFTjBgJkAmhQVBB/HapuV8hTozT2mQDZyz9VOaJvdrAV3hlTNa
	yO6QiwsffgzDYW53e9KAeJUYpkxrh/Fq4dC1BJLBD9w382wPu6HNXU/wJ3DdR5M=
X-Google-Smtp-Source: AGHT+IHhceJVW8hdzeyypFgv3eGBURhoRnpd0RUg9FpY0i0tF4AxN4/3j/8H+Jsgyb9XEJ6pR5Zquw==
X-Received: by 2002:a17:902:d58f:b0:1fd:aac9:a72e with SMTP id d9443c01a7336-205476430bcmr95145015ad.43.1725360832116;
        Tue, 03 Sep 2024 03:53:52 -0700 (PDT)
Received: from localhost ([122.172.83.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2054895736bsm48967895ad.245.2024.09.03.03.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 03:53:51 -0700 (PDT)
Date: Tue, 3 Sep 2024 16:23:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V10] virtio-transport: Add a section to define mandatory
 transport requirements
Message-ID: <20240903105349.m3a36hmfq4ihje3b@vireshk-i7>
References: <4c24ede14e2545b2e9c69e7d9b79dc15744fd965.1723647318.git.viresh.kumar@linaro.org>
 <20240903103815.pqjdjyedsqy3vr3y@vireshk-i7>
 <20240903065010-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903065010-mutt-send-email-mst@kernel.org>

On 03-09-24, 06:51, Michael S. Tsirkin wrote:
> On Tue, Sep 03, 2024 at 04:08:15PM +0530, Viresh Kumar wrote:
> > On 14-08-24, 20:27, Viresh Kumar wrote:
> > > The current Virtio documentation lacks a set of generic requirements
> > > applicable to all transports. Defining these generic requirements could
> > > be beneficial when integrating support for a new transport.
> > > 
> > > This section outlines the essential requirements that any transport
> > > method must adhere to.
> > > 
> > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > > ---
> > > V9->V10:
> > > - s/multiple// and s/employ/use/
> > 
> > Can we get this merged now please ?
> > 
> > -- 
> 
> 
> You want us to start a vote then?

Yes please. Thanks.

-- 
viresh
