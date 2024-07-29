Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452D1548E0
	for <virtio-comment@lists.linux.dev>; Mon, 29 Jul 2024 03:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722224228; cv=none; b=ajuVsS0M2m6JP+4CFCek8OqxkcP1ctC6NZwWTkoGzvNhGLRB9L84T+xDFvUwGgqkRfNRwnB7CHHuQV2xRcFvNDplWzrA5l9UFMSSv/MwRlOi7My7DoU8YUc55OP20M8ohGXIQ32YJ+EA6H1Lcg/bUM0jL6IulTTgl6n+HlfgfRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722224228; c=relaxed/simple;
	bh=PneyYy0i4yauNUWmO9eOv3QoVQ7EJxq9jadmGQ5TGVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEHbvDFNK+6v4Gcib8MuzMu6TkhmO20E3h9DEbVbC5JmjuvGPnMPlGxWimeICtLCRzT2i5/kh66MzkQHxW2A9UFBu3quIbkCjyJHpdgModnWayhISiuZQZLiY23GR9Hdnw6nj7TGBpilCe27Km416pKPx07zMlQ+TlAb/exGzNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ma/YPbjR; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ma/YPbjR"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fd9e6189d5so16918975ad.3
        for <virtio-comment@lists.linux.dev>; Sun, 28 Jul 2024 20:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722224226; x=1722829026; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IVQGI46DJU6ZHnNQaiSPSpTHmDvIOdkma3BKyAsZgIs=;
        b=Ma/YPbjR5hAj1HGLMq4cAJ8jFM8V4x2auIbKRiIFjAftzQUp4/5+dPVcIIhjuGquh3
         eLIU37UBowx8jSpf66d7pWfIWT0BrFB+nNNTjL5UctwTNRqrKG4vmZWhfuoxFH1yTLtp
         r0uAN9q5WMaN+xUFCp5FZ28KD3CzrR4fXFvB416w0CjICmZOf2GPzzQJGH053x8OqPVu
         RvaNcVbdCs05UgL2iGAULhL5KXXnbkNeBmTwLyrCcq36a3OrqBoHOKwNJlRYAdfstCBy
         VINZ+W9qjk6weV5WzKEeiNHyStKH7IoetBp1znvY9lwTpH2N6dZ/L3oeHJDDvOd57SRv
         8hLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722224226; x=1722829026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVQGI46DJU6ZHnNQaiSPSpTHmDvIOdkma3BKyAsZgIs=;
        b=sFXnNpDwDnWQU5NPTCZNQGfsD/6HG+ZONEUUIP35slhDtWGpD4vYzS+4ur3LoAGR/5
         6vH0SRszF27/AlhOqNeXV7IDw2BAlM4/RlH3HADp2PEDasarGfSVQmSTj5hLEHSAS5cl
         83ptbgJQIVYjinhvletkXK35HgwhiC7pssI1D4Gbyw1l0cvzGno05/05yOtBSsnKAcFV
         5TMzecPUotP43R640URUnFGvVWN/F0UQ4adPwzIV+ycyZWTzREL+C0hqkXm+ilkNi4lM
         4MrnMKcpGN9fVFMDbjEhrPcD5RaCXHl7T7JRKMfriozILhM/FdOF/v0zeD9bD5C358Sq
         AvKA==
X-Forwarded-Encrypted: i=1; AJvYcCWYxR+CLEodpknkxgSEDU40zjtSZt6ZhuimXtf5unl7rHO7taB2Xj41TmzA15dmC2xQID2hMz21BXA8dU+rg/0z91qmwMwduc6od8tRqQo=
X-Gm-Message-State: AOJu0YzY2VpKLO6b1IB7h8d4w/FV1Kobccwa5vonLY1mJeC/vOxhO/RE
	bi7v+gw037E1UrUie1Tm/NRKtONfzfqAwHGwQgGr7nyWowUXQziKQvrv6u9eNn4=
X-Google-Smtp-Source: AGHT+IG5OLf+HevKdeIKeXZZDr1Bx+UqGLbfklsdVyU/961EAtjNfXQ1+2q4Q9z1EOq1XJT1+VfbHw==
X-Received: by 2002:a17:902:ce89:b0:1fd:9238:40f with SMTP id d9443c01a7336-1ff04811470mr41854065ad.22.1722224226377;
        Sun, 28 Jul 2024 20:37:06 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7c8c826sm71594515ad.58.2024.07.28.20.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 20:37:05 -0700 (PDT)
Date: Mon, 29 Jul 2024 09:06:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <20240729033656.kbobqdsm67hb4qbk@vireshk-i7>
References: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
 <20240724104537.5632obtaek7yr4ct@vireshk-i7>
 <20240724065845-mutt-send-email-mst@kernel.org>
 <20240725091544.kmiij443daqnzkja@vireshk-i7>
 <20240725052410-mutt-send-email-mst@kernel.org>
 <20240725105524.sucisnw2djjzewed@vireshk-i7>
 <20240725081757-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725081757-mutt-send-email-mst@kernel.org>

On 25-07-24, 08:24, Michael S. Tsirkin wrote:
> The configuration as used here is its own plural.
> Here's an explanation if you want the detail - not
> because a random website is an expert but just because it
> happens to be right.
> 
> https://www.wordhippo.com/what-is/the-plural-of/configuration.html

Ah.

> No it's an i2c device, not i2c protocol. The i2c, spi etc protocols are
> outside of virtio spec and have nothing to do with virtqueues.
> 
> > 
> > Please suggest how you think this must be written then.
> 
> I still don't know what you want to say.
> Virtio spec just calls them "specific devices".
> Are you trying to say:
> 	The number of virtqueues is device specific and not specified by the
> 	transport.

Yes.

-- 
viresh
