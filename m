Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EA61BF33E
	for <virtio-comment@lists.linux.dev>; Tue,  6 Aug 2024 10:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722941410; cv=none; b=nk/ZurSAo6qPBQPd5pQFrFMQBOQyGTVPkE0YuJ600UxWtwFGdoS3/BC0OIjY3IwWLi+bqqNPfIUfE4dAh0/xL474wxxpuhwLVF7i+dJu3yh+e/hdda3mxXvvlqKvx4meEM8Nks4/064JR57OiEUNDm6e6s45518hWX6iVIeLfO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722941410; c=relaxed/simple;
	bh=7Z56QDGlYeYoCopF42qfbHwXGRHSxrpEFpbZxljEvzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8/9xTvhBWujR5BB6nGpKpxPXVHLHNjUy9Sx9q0SK3BULo45I5wyPS5fimQLlE+iPEnI4xojLybGxH/OVhDdCUW1Z/vJVAxC342E99kyajUtFOpuSkM0Li0f5fkSP1gfWk6/lOhk4R86XKxKJoNtAgVgL8mtsal6eONVIeetoPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wVs2o1bH; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wVs2o1bH"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fd78c165eeso3493895ad.2
        for <virtio-comment@lists.linux.dev>; Tue, 06 Aug 2024 03:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722941408; x=1723546208; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XJwyVj1m4fVDBE0EJcjJT7fV7uI9F+GLPIdpBb43hVo=;
        b=wVs2o1bHo0L6//rD43xlMhdDHPj2HHlbFi2QSwdeVqtd6v7PnLeg/VgNyz+rj7CIcX
         JmN72i5ypnwdbHqckO/KoZnNWQNk16mIgF2dd+b2bfylcW+W1PK0uj8RSCzvm3314IOk
         SOBabYUkzvMKDilzv6nwESYCchhtNE7QAJjp1W24I5t6Jjd98h1QRTR30c/+9tin5+Tw
         9zRseHvyz4gnvpMIVX27XtmEJRq2nkuag00FkUEz9daiLgHTlbkFFyNiuHv+SQy4Tcc2
         uFJxSrX5yI1hId+fOzu5Ls78fnUZ5AXdT5TO4orJZEUc+3zZVOcKDd8+Iq9aFhBfGuQc
         rNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722941408; x=1723546208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJwyVj1m4fVDBE0EJcjJT7fV7uI9F+GLPIdpBb43hVo=;
        b=lQ+jET/2pI/gmGsbQuph45Lb5doRuoEmjzKr+5hFgaDu5TukgKTcTXNFlU3Qwq913K
         smB6bO08RDAp3a3DTragM1i2baawnCbTUSICg1gRFCz9Jl5o8XMVVxLr+9q0Ikx80Q/N
         FHSjhRqhXDeHDNqLDKknjmx748fy6MwIyrUc1/SlpDcvcoHYgVlQWrR04tjNw4Ly4e1z
         5Ea+HYcJwUEg/Xvs5L7GqIvKqZPJ7ydewr0VXA98ecgfRbVd5BPdOI9y6JDl5qmYNwGL
         w9FH5jy5RS/NujA9U7d3V+Vo1PVQywCyLZoUhIJ/815MTrG7V0J/FSOGi3e5MopJTD/B
         hW0w==
X-Forwarded-Encrypted: i=1; AJvYcCVGEo5fPeS1vRFd8tRGhYgP2yVG+LBtXqQFkuRNlIji1xBCDAuflFZE71CthbkqbQSANmG1Nq38gC9Y6ilrBYvy7uagMcLR0Dmdx7oRcvc=
X-Gm-Message-State: AOJu0YyoaFGhr23tqD082qGBcE47ySIPb24H3UTYOImDaUBaz8fz+3Jt
	nbjmrazyWH/cwMqnwJnGi4j2JezcwNuPrpgZZQnrWndEm3k1fyqyks7KAN7PcRk=
X-Google-Smtp-Source: AGHT+IH6iUqTrevr/BQoJW7922I6Lebxhe9tmkuIevKQLrPmWdsFbzNFrmSBp+2X4iSX5iD88Py0Hg==
X-Received: by 2002:a17:902:da83:b0:1fa:fbe1:284c with SMTP id d9443c01a7336-1ff57281c29mr208492735ad.22.1722941407671;
        Tue, 06 Aug 2024 03:50:07 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4cf660sm12198286a91.42.2024.08.06.03.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 03:50:06 -0700 (PDT)
Date: Tue, 6 Aug 2024 16:20:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH V8] virtio-transport: Add a section to define mandatory
 transport requirements
Message-ID: <20240806105004.cwj7kysyt5k2t7ze@vireshk-i7>
References: <1ef4e58fdbbc2c94305aa8fac856da882da1cdc2.1722324234.git.viresh.kumar@linaro.org>
 <20240730091155-mutt-send-email-mst@kernel.org>
 <20240731090414.m5hkzvq34djq6awl@vireshk-i7>
 <87a5hx99se.fsf@redhat.com>
 <20240731055129-mutt-send-email-mst@kernel.org>
 <877cd198al.fsf@redhat.com>
 <20240731081509-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731081509-mutt-send-email-mst@kernel.org>

On 31-07-24, 08:16, Michael S. Tsirkin wrote:
> On Wed, Jul 31, 2024 at 12:15:30PM +0200, Cornelia Huck wrote:
> > On Wed, Jul 31 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > On Wed, Jul 31, 2024 at 11:43:13AM +0200, Cornelia Huck wrote:
> > >> On Wed, Jul 31 2024, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >> > +A transport provides a mechanism for the driver to read the device's
> > >> > +status bit.
> > >> 
> > >> Either "status bits", or "status" (as below.)
> > >
> > > It is actually "FEATURES_OK status bit" I think.
> > 
> > Also DEVICE_NEEDS_RESET?
> 
> Good point.
> 
> > I don't think it makes sense to say that the
> > driver needs a way to read individual bits, it should be able to read
> > the whole status.
> 
> It depends on the transport, I can imagine a transport that
> saves some space by not keeping a copy of e.g. DRIVER.

Should I rewrite as:

A transport provides a mechanism for the driver to read the device's FEATURES_OK
and DEVICE_NEEDS_RESET status bits.

?

-- 
viresh
