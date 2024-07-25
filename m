Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBBE19AA59
	for <virtio-comment@lists.linux.dev>; Thu, 25 Jul 2024 12:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721910259; cv=none; b=e9LJ5hdYS1MPBPuItGB44xA8kyRcbM0uXAbTfeICGLF5JJG1YlfQfSYo/VouR5vU0zW44z3+sWH1gE+YQ6kwJ+J8DtxmFlAEw3UmzEFYkPAm/DsHnYgio4eBqx30MGoqpYEKyqx61oQ7Sh7C2fWeh68i3bWDnosDc5/luQNu/+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721910259; c=relaxed/simple;
	bh=leFgjCvkNdgKnbnSXYHp2U+AyryEFoeBQhnMPGZSMso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GqjBg4UMN02Bzmgep4rNNd+u5Wqc/bXXLX46Lbi7dibLE2I7BbAqhc+2sPscqRE/pRw0Zyz1QCJ8I+WsCjU5zGLiiub3pirJPU+HYgM5sHWaTkhAwFawzkGixdur2dnnAhowKMjyz6+0vN02uOI8H1egg3gTx0MfgWU+RIbKtro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h4R2zsEx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h4R2zsEx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721910257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KoZgsYw1BbC/ysOdJcFcOUjHT4SK5eockAmpE9Qgtbo=;
	b=h4R2zsExrLIsMx9CVvl3KPPG3WukqY66OcPt6pMfavE9gqQDgaaFnnUDw4cH0B/9gsJwbQ
	3tjjWRV8c62qmD41exSWHMnqzB0NAf+6rgU1V7BEhlTn2R1jFccpMOXadhempuNFs/LTzC
	M+kPRY8fw6y1rfa4jLYhSDwdKnhmY9Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-H0Y45UGyOBuSeS9Jt19zxw-1; Thu, 25 Jul 2024 08:24:15 -0400
X-MC-Unique: H0Y45UGyOBuSeS9Jt19zxw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-36875698d0dso560500f8f.3
        for <virtio-comment@lists.linux.dev>; Thu, 25 Jul 2024 05:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721910254; x=1722515054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KoZgsYw1BbC/ysOdJcFcOUjHT4SK5eockAmpE9Qgtbo=;
        b=CMok/ASagt68B/BfKaydFQt3jzRojR2q3wvK41ckV6wt9F102Uei8CKz47Vhl3e/vK
         BdNUW7+OY9B6LPx3gcRiLDNEKYB50/XVqdoSteHJSWSFeK2MHDZVuGgPOVqiS66i2pfl
         b7+nnon0MndmjAgvaIsybTLHu3vipa40sPKOS2CMF1DWhNHDRuJG1p6EJizHwOIMOLS6
         n9DAdJtvrIZzmdhEWI1cIv+9De3UoF60M7UbLflQ6l2ELKTLWou28hbtBSDAg7RG4u8o
         CppGOo9L27ZWsC0wGSyPIcJq6rQ6IFmH9wWynQZ/Mq6ytwEnA/iTAU9iwMYyuoM1CMWd
         jEXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOBfk4WNezRZvlswPOgolDbFhVo0VIzxdJyuDLKfGbDZeo7QpTD3Kb0axd4vKd8Wct9IMAAOq2Xg+klj7itq14xe80SibhRt13x8OVteA=
X-Gm-Message-State: AOJu0YzEBuOnkCj0zDjgyMxT+ZJkNYmHwccHuoykQqPRqmUZlpbUc9vb
	bhgJezMn8FhkUSg3gwMKQvlXcN2gB9xrm/H8k2CMpFGE0ZS5sgjhinprDGbBqYpy9YjbuT/OKL0
	EiR4nzGOMfUV1cNMMiIc4M6dt6cRDavlT2HQICQgKiljeQg9GLIhLQBqfIR5H/Oyw
X-Received: by 2002:adf:b189:0:b0:367:4dce:1ff5 with SMTP id ffacd0b85a97d-36b319f2d2fmr1540144f8f.32.1721910254466;
        Thu, 25 Jul 2024 05:24:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcH802secwEyHoPICG0JNjw4AofQ9EJ1bE/wzFbnVkg8iABiA6XFxNmPJiXtryQEzbMfqXzg==
X-Received: by 2002:adf:b189:0:b0:367:4dce:1ff5 with SMTP id ffacd0b85a97d-36b319f2d2fmr1540123f8f.32.1721910253847;
        Thu, 25 Jul 2024 05:24:13 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f8:1b05:4ed8:7577:e2b:7ae3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428054b9196sm33381655e9.0.2024.07.25.05.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 05:24:13 -0700 (PDT)
Date: Thu, 25 Jul 2024 08:24:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <20240725081757-mutt-send-email-mst@kernel.org>
References: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
 <20240724104537.5632obtaek7yr4ct@vireshk-i7>
 <20240724065845-mutt-send-email-mst@kernel.org>
 <20240725091544.kmiij443daqnzkja@vireshk-i7>
 <20240725052410-mutt-send-email-mst@kernel.org>
 <20240725105524.sucisnw2djjzewed@vireshk-i7>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240725105524.sucisnw2djjzewed@vireshk-i7>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 25, 2024 at 04:25:24PM +0530, Viresh Kumar wrote:
> On 25-07-24, 05:28, Michael S. Tsirkin wrote:
> > On Thu, Jul 25, 2024 at 02:45:44PM +0530, Viresh Kumar wrote:
> > > "A transport provides a mechanism for the device to communicate virtqueue
> > > configurations and memory location to the driver."
> > 
> > not really, it's normally the driver that communicates all this.
> 
> Ah.
> 
> > and configuration is it's own plural I think.
> 
> Hmm, Wikipedia [1] and chatgpt say otherwise.
> 
> Anyway, "configuration" is fine here.

The configuration as used here is its own plural.
Here's an explanation if you want the detail - not
because a random website is an expert but just because it
happens to be right.

https://www.wordhippo.com/what-is/the-plural-of/configuration.html

> > > > > The number of virtqueues per pair are governed by the individual
> > > > > +device protocol.
> > > > 
> > > > what is device protocol?
> > > 
> > > "The number of virtqueues are governed by the device implementation."
> > 
> > what are you trying to say? that transport does not need to
> > specify this?
> > basically we can just kill this sentence then?
> 
> Hmm, from what I understand the individual device implementation (protocol as
> specified in the virtio-specification, for example I2C, SPI, etc.) specify the
> exact number of virtqueues that are required for their working. I am not sure
> how a transport changes that.

No it's an i2c device, not i2c protocol. The i2c, spi etc protocols are
outside of virtio spec and have nothing to do with virtqueues.

> 
> Please suggest how you think this must be written then.

I still don't know what you want to say.
Virtio spec just calls them "specific devices".
Are you trying to say:
	The number of virtqueues is device specific and not specified by the
	transport.

> > pls check what we say about device and driver notifications and follow
> > that terminology
> 
> "A transport provides a mechanism for the device to send the configuration
> change notifications and used buffer notifications to the driver."
> 
> "A transport provides a mechanism for the driver to send the available buffer
> notifications to the device."


you can just say "device notifications" and "driver notifications",
respectively, there might be more down the road.

> 
> -- 
> viresh
> 
> [1] https://en.wiktionary.org/wiki/configuration

