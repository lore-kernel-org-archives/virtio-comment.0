Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F07BDF43
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 07:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720682494; cv=none; b=Vayqk6EOPBWOny4v3VAgSaa2bz2a0pgiHKKr5SELishFkCA8sve+oNeubJEszax8EMbh6G7fT1aKc9ceYpkzrHnQYm+pVk3lH11e35gjVCq1MNVJzJpAFs0uaN+IoEBwNj0uSgCF56mEjG0z1i+Ib0B32oP1Gqtm7CXTnX/CVzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720682494; c=relaxed/simple;
	bh=CObjFBI3bzRtxa2qQH9gmxBhav16uUqbS5SZ8OpVvO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlyW8juJXdCnrizvnlYEtCR9EJ5xcfNh2+lYn7cgmW/gt4ZGpaN/dtzaxgnlGqq2rv1pi0Jy42Z6yHtT8S1tr3zsbZLCI2UngVUlAgk8+0PfQWAp8ztD4BvaF3lmc7CLfXMdpyaKHdlh+jQUgZHORcgEL0CkJYjHSOIORJXCMho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E9WHbcjT; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E9WHbcjT"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70b4a8a5587so486030b3a.2
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 00:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720682492; x=1721287292; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a9m1du4pQaz9CP9AG1bJ1bQD0U6dScSD4OW1aX9ffwA=;
        b=E9WHbcjTjleE6G7XeGGEIxZrmVCHDfrgvxabvaTWNOk1h0ZN8rcPqmccg7ke0r00bh
         Z7IHqE2jvJNJbpz8/3tcv+2se7J+KucUwRAkqeAYM4YyvO9onvrBeJvj+rZX0mqbsjjR
         Kg1LLA2clYEK+w0F40zx/uU42ZaUv1Bi5Jj4XsTEdQ1bRVmJSqM3VtC0Qh1qI86G1gi7
         9nOA/mTauejBzt6ihZdnUWT8SWC/FQYHw9cRQqyfFvIl7qQWpyGP7fUkohqGO8CCuRW/
         F2jfokmN0XnflsZQK50DwvYEA8JzSZ6GgcHBm1mbVh7cf/GdwsIlzbAS5YA28ur2UXZV
         aY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720682492; x=1721287292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9m1du4pQaz9CP9AG1bJ1bQD0U6dScSD4OW1aX9ffwA=;
        b=ueIVZ9eAJr1ou2TyoiKM7ymlZtI8zcNBo3uEGFAntfDOX7nZHFnyQpoM1FdNUBO+AA
         8Hqd9n+oGSgpQH9gvKD1ueBEyqK7uTxmRg7crOybTW9j7Y3r2pEbN8UrAW5XXSGZTfm8
         MeDtYwfVvrTBHTja1kuQcG/yez1hZkLlgmnT7SV4jJQkLwYS9DyDHNHNHW/9Js6hm8k+
         C9DNrF21u1MNMNJ57J/fqx1ODPsv+rQglWNu0TA+cG0TbKBaM4yu3MXovSH1pNLuy2Tr
         5m9BYy9kw0Jo1ioihvw9+23lHVpZYMrJFt10U1wvtX2QOVkjh2IwMzRcZEXNrt7QtC+A
         GrEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7aBbbdZt5gNe3ej3o0nHU6bquCfV7+tBFZnhoiNw9Q9N++nYB4TFVE3iZns8+Wru9FRu+CajbVNVGACNDhkNB4MPBvnA6aF0PeSMhv+w=
X-Gm-Message-State: AOJu0YylSkxGK+3Z4/kCuRKDou5uIE5vp74+sMHCW998OX8v9YdjP8u1
	JKn4/6s2V0Ap/mN6YL0Skp4MF4OjV0zR09sy0fn7aQuMifTLlMiBizDEnepmOtc=
X-Google-Smtp-Source: AGHT+IFOVTXEn3zjksV02U7pa4CACBDHKE5S+y+snRp5yUn+iZJi+Wd8YPVpJHQjUeCtGI5LqkPTZA==
X-Received: by 2002:a05:6a00:4f8c:b0:706:5b58:464c with SMTP id d2e1a72fcca58-70b43558591mr9616132b3a.9.1720682491588;
        Thu, 11 Jul 2024 00:21:31 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439c3213sm4965882b3a.194.2024.07.11.00.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 00:21:30 -0700 (PDT)
Date: Thu, 11 Jul 2024 12:51:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH V6] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <20240711072128.ptal2sigsg5cu3dv@vireshk-i7>
References: <51a926b4ea2240753bcda6041a9076d58e980082.1719299462.git.viresh.kumar@linaro.org>
 <ZnrZh5lfnFNMn5bM@fedora>
 <20240626024130.z2g2ypjyn23sgwmf@vireshk-i7>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626024130.z2g2ypjyn23sgwmf@vireshk-i7>

On 26-06-24, 08:11, Viresh Kumar wrote:
> On 25-06-24, 16:51, Matias Ezequiel Vara Larsen wrote:
> > > +\section{Device Requirements}\label{sec:Creating New Transports / Device Requirements}
> > > +
> > > +The device keeps any data associated with a device-initiated transaction
> > > +accessible to the driver until the driver acknowledges the transaction
> > > +to be complete.
> > > +
> > > +The device doesn't access the contents of a virtqueue before the driver
> > > +notifies, in a transport defined way, the device that the virtqueue is
> > > +ready to be accessed.
> > > +
> > > +The device doesn't access or modify buffers on a virtqueue after it has
> > > +notified the driver about their availability.
> > > +
> > 
> > Why are the last two requirements in this section? Are not these
> > requirements independent of the transport layer?
> 
> Hmm, maybe you are right. Cornelia ?

Hi Michael / Cornelia,

Can we please get this merged a bit sooner ? It has taken a huge
amount of time to get this upstream. I posted the first version on
5th December :(

Please see if we can get done with it a bit sooner. Thanks.

-- 
viresh
