Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824DC10953
	for <virtio-comment@lists.linux.dev>; Wed, 14 Aug 2024 00:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723596129; cv=none; b=pcrJ5JZH+Mlc2ZSE2e8Zvt9aRe+WyrAVGExgRmEm9iusGvZd4vWfiCkTgBNSvxhbaL1dF1mdnddVntwGXy1Dj2+/MRqPcBavWZLJ+5eJmZpOSWG4yimFHSOYf40exgEPYA+9VhTkm/EP+kS8kfnblBdeSHXgmlgxw9nAcusWCRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723596129; c=relaxed/simple;
	bh=YekWJ2a6F3M2nIBXuwdhUj6Ni4A3MnTcy+38g++JKvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzdGMz6KbTLbAOROFSEXirhdZYje4oOj/ehJdpnWslS4PFldlI61fWkLjPuX0+GbOfOXq+OYLBhMlWjCLHWw/NTCoaL0v8sEIhRbxAw9WlBpHe/RVGCuKdAsKNkvhKg0UEHwmL10vJXxXja1jnfv8Bd6LbQlLTEiPmTMccpvuCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mXW1YZcZ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mXW1YZcZ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fec34f94abso52779365ad.2
        for <virtio-comment@lists.linux.dev>; Tue, 13 Aug 2024 17:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723596127; x=1724200927; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BuHreKlaUrwJYGscAjz7rDOZPwEos/rKAHSzl41cZVs=;
        b=mXW1YZcZ2/e7K8Ap7cSmFVftNJ0G1akghKaeqH2/8sczgQ0E4zBnqUIbBPXl9jCy/Z
         dkPQBlU0v6ZEnRnqd3AVTnX51IzgB+s5j5G4trLycI2cVYr57niEIhSyPm6o/uYAx81i
         T3yavNc/UGUFvznlP8CjTymDfa+7a31CDiIRvS5OFGS/d6AgNavzjWEiY5fwCYnmRFMX
         wCShJI/VxBWrKds9E2PVpJK98SkMLHx3hGtcAjf66rTAi3DygyMAqd/25b6fmoCM6O0K
         +sVfzKtNsLAA7xp8MEyivfQGAAg6TFw8OjeRGlsEekzLCgzF5fJjrnnKgo90FWIz72Qp
         NB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723596127; x=1724200927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuHreKlaUrwJYGscAjz7rDOZPwEos/rKAHSzl41cZVs=;
        b=U6xi8XJWwrtMZx3mumJOVudfIUwjcL48dlW/qhqT21EXHykkX/8nasPh8eo1RKt495
         W2reDqoRnFcgU8a98OzsXlGbmDYPxdvYSDX4Bqem2y1CcWco5XgEq9JJvtHW14VMCkQ/
         4Xpy8xNVBfqhH677jtDD7lskAsKin34RZCrspbYzBuRHCjxqa/eac/KdDsF2Zbdu3Pzr
         o5ltFGQyHWe4AyXPk4ljskHAVNONdmc8ULYlO4ZlVyPaEUdDVc9nx5j4UXT+YUMaxhX0
         dsfdWCiV1eYL3hP4Q4rNx4yI0nwd7azRCJlygPvuvvRBsb+2uZY/vO5xDF+b9qUrtAij
         jvUg==
X-Gm-Message-State: AOJu0YxTEY8dOBolBYhB/Y7krGFwBmdGYj11do880mCX0rbhN1Gk8x07
	bA7p83QKmO6QsblagJ4ioXcwEy2o7YfPJ8TavDrO9/06/NfwZzCExnu7I3ksUJQ=
X-Google-Smtp-Source: AGHT+IGEolKVykGa48oX55hKdsL+Cjro2HhiSMRT5BQC5qW7/0rZiB/VOErKSJCn5kVJGsu3w2VcdA==
X-Received: by 2002:a17:902:e80a:b0:1f9:f906:9088 with SMTP id d9443c01a7336-201d63bcc39mr16074665ad.22.1723596126639;
        Tue, 13 Aug 2024 17:42:06 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd147eb9sm19230195ad.90.2024.08.13.17.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 17:42:05 -0700 (PDT)
Date: Wed, 14 Aug 2024 06:12:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V9] virtio-transport: Add a section to define mandatory
 transport requirements
Message-ID: <20240814004203.ruvdkkeuuyhmbkk2@vireshk-i7>
References: <b8b964a8a3e6eba7461bbe7e10876c34e1e313a5.1723198845.git.viresh.kumar@linaro.org>
 <ZrnqBewNnZu5xmJ9@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrnqBewNnZu5xmJ9@fedora>

Hi Matias,

On 12-08-24, 12:55, Matias Ezequiel Vara Larsen wrote:
> On Fri, Aug 09, 2024 at 03:52:28PM +0530, Viresh Kumar wrote:
> > +Devices and drivers utilize various transport methods to facilitate
> > +communication, such as PCI, MMIO, or Channel I/O. These transport
> > +methods determine multiple aspects of the interaction between the device
> 
> Maybe remove `multiple` here. I think it does not add much but I do not
> have an strong opinion about this.

What about 'various' instead of 'multiple' ? Or just drop the word ?

> > +and the driver, including device discovery, capability exchange,
> > +interrupt handling, and data transfer. For instance, in a host/guest
> > +architecture, the host might expose a device to the guest via a virtual
> > +PCI bus, and the guest would employ a PCI device driver to interface
> > +with the device.
> > +
> 
> Maybe a verb different than `employ`? But I do not have an strong
> opinion about this.

'use' ? Or something else ?

-- 
viresh
