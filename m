Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49694208A7
	for <virtio-comment@lists.linux.dev>; Wed, 26 Jun 2024 02:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719369697; cv=none; b=FHKA4BFmp+1RanUTGrcy8UOf0H3kezo53bUfsWHK6ZDpg32Bgza0OtTOBeRhmvFYCqH7EZiuH5AHVOYV5dnuDM7Kytkhlg/vuQzRlcPyDL5rng5IqGEOkvEIkaUwdZtnYswKaY8u6ethJeVpBYDTQ0qxiY98fkOz422AR6bS1fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719369697; c=relaxed/simple;
	bh=uwoME+78Q3qL6Z6Laz8/QgcO/ItoI4CYqjBqVAvwLqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEV9OXSdsbsbHeS11nt8ReXXkQHMhuwKhs3rMgJA/q88g9QmqBxXFBzcnko/xbRVenQRsQ+ym0o4EUJT/BNPdk/VOVaxlc4rGScxsjQPvbd+o0ZTARuZJLODMQAQZ6vSY9sruZfVH/Tq0JdWzeEMWVdL0HCVIabRYWtbwruk8M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BSo2ANoy; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BSo2ANoy"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-6e7e23b42c3so3767980a12.1
        for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 19:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719369695; x=1719974495; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WOxwmI18HsY3ApxHbgC55+3/EERKC9dVGnqxHWo7pqo=;
        b=BSo2ANoyBGRh/+CvvgdvP28ZxWgEqgk+MZOZI92KZsWIWaVZppYg1hSp5FBmt8GNWU
         1DPMdQ4C2FbxFbZpU//O3V+qE97qtXEUsRoqdwmfr0WHhzWVs+m1rgmoDvHfoGqyiq6J
         dddsStARmE5amaKVUVdpU+EI9Edrrq9yb9JphGrvuYsplA+yn0AEyOtH2sT/EznB+QHY
         BcLTYD6zL+OdeaU+MUdeDQk3Fk1n+a+/+of3CQs6R+FQOVbbHh0pbMVJCsvM9qkAq5GY
         Hw+41S/jtR5B4EQvoyzuGnX8NI4CoiiLNKHPDb6Go3LCb7Zv/NM8mc5tZfj5Wxon/1AO
         QuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719369695; x=1719974495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOxwmI18HsY3ApxHbgC55+3/EERKC9dVGnqxHWo7pqo=;
        b=RbtQQmf5V63DilMpdbCR2JsSZ0H8dTC7aazOROXO6gpvILUbJ2M21H9+8hIBXpRwmq
         o/3Z/TfMPiOKWw+KsVi5Gd7DCud1xOmdOKhIQpA+30qmj/1LSUMzTt46oJtx45Lj/gRS
         Ihm78/HuU1qqZemZ2WZWAptIWEJTLl6+QroB8Uijr3AYHKsucRRnnea2lrdZZYGolSvf
         35bdMOpQQ3TMWYjDdBLgXtBOGFStU1c6kKfy28KW3PxF4bjs5iQ5fsw2cSFwB40WBagf
         97Mkj3OrfWB6a0HtRJd5gQ0uWmtniZT7Ae2Mb6tw0LlGznJjcKIzXs34x4pJpgyOmdIc
         apWg==
X-Gm-Message-State: AOJu0YymKlUMq9diPd9FYz3Hb7SLjCkNNcX6+5I6MLsbnVwMYi0KtrTV
	ui7Hh6ccP5dODZ6vJQBwWpQ8ikdhut6MpCygkKazaamYj9uXjNflJeIGjxIDAKw=
X-Google-Smtp-Source: AGHT+IEdY51kK4tielRgECN57Zl2mA/rrcaobeJ7p1bXsg7aM9YWSg5hDm+QdkPTgJVXa4eheTgC/Q==
X-Received: by 2002:a05:6a20:6724:b0:1bd:1b2d:6e2b with SMTP id adf61e73a8af0-1bd1b2d6e93mr3593239637.38.1719369695265;
        Tue, 25 Jun 2024 19:41:35 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3c5d29sm88373725ad.154.2024.06.25.19.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 19:41:34 -0700 (PDT)
Date: Wed, 26 Jun 2024 08:11:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH V6] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <20240626024130.z2g2ypjyn23sgwmf@vireshk-i7>
References: <51a926b4ea2240753bcda6041a9076d58e980082.1719299462.git.viresh.kumar@linaro.org>
 <ZnrZh5lfnFNMn5bM@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnrZh5lfnFNMn5bM@fedora>

On 25-06-24, 16:51, Matias Ezequiel Vara Larsen wrote:
> > +\section{Device Requirements}\label{sec:Creating New Transports / Device Requirements}
> > +
> > +The device keeps any data associated with a device-initiated transaction
> > +accessible to the driver until the driver acknowledges the transaction
> > +to be complete.
> > +
> > +The device doesn't access the contents of a virtqueue before the driver
> > +notifies, in a transport defined way, the device that the virtqueue is
> > +ready to be accessed.
> > +
> > +The device doesn't access or modify buffers on a virtqueue after it has
> > +notified the driver about their availability.
> > +
> 
> Why are the last two requirements in this section? Are not these
> requirements independent of the transport layer?

Hmm, maybe you are right. Cornelia ?

-- 
viresh
