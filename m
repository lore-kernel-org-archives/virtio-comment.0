Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16557F
	for <virtio-comment@lists.linux.dev>; Thu, 30 May 2024 06:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717051029; cv=none; b=k0dEm2xpwQ0v9VmFTLg2/pOvwteNOswXkIz5jlxI4JMeq4yv77UfMfhE9eVsruF0zhG9Sc28m6Q6Z9aUBsAfVdyOmYzzg8c4sO4sGmrAH8AYJ0dqjFLObiFMo3XlYjT79SsXvNkwpH8Xe0zu25awf+Gu09KsOx0CKYOv/Bt0sao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717051029; c=relaxed/simple;
	bh=qgrFEGHw1Vl/i5jY4BEdj+inZ/tZC0QliMURFZZoLSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eh/6n/rk3uO4OBxdXtDvnWr07mn5tl5ojCSBbHoFmAXnoD7LzrlP383Wian4EooACBB8W+pdnU/7QFmNJmqy/yqjv9tarWygXj2KZd5M7pOpWfRuj9duImLyRTSYx2Ar9mO7kKg4+/6HLv1i82/9E/pQoH3JxQ2EU/yg3uiuIps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GNeBhM/I; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GNeBhM/I"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70223dffaf6so545018b3a.1
        for <virtio-comment@lists.linux.dev>; Wed, 29 May 2024 23:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717051027; x=1717655827; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dZA/VyX1MnUNbI2493bcgnmKpU+Wu1XyMv0tS56FYas=;
        b=GNeBhM/Ip0hJ2c0gCIvLQkGVaDzeVrNaSLAFxX9WtmtMGNMYCVHivcqXJAc0G3Bvzv
         zuY35B9ZyKAPfyt03KwobIrTLXchAK0kg8HiLgFuMP2Qc0Jv1fbHkhbSgPp245MtIS9z
         fLlANDII/fL3aBHDmUOynXme84GzgxYiOnMvrpft3GMkpi4a53xlVO+UDV/U8Eoriczc
         3EcV7DYxVS6Q48h3bIbENWBfYmsisUyxDdemBBrhtz10Zhnt0LxAkr4aoMRdApsnhvoN
         cdKdxJPtgnvpREb9spaZAxftH4ttO85wuDd3jd7TJt1zXA7o5mQYLY3Prj44NEy00KzF
         XySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717051027; x=1717655827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZA/VyX1MnUNbI2493bcgnmKpU+Wu1XyMv0tS56FYas=;
        b=fn+4CiRlGEq2b3YT1DArPHd4tU2C3p4z/Ys4zZaZ2Z2vDEVTV2wg810Uf0QzorulK1
         3G0Qhe2aKy2kosiGcjtQsTZWhQdu6K2+dfx2iB3rkTsfglaRNVnOvEvUv8niNV18lUAc
         QBpEfy7z/wPfAHtdE3Ooj0/E3ImGqMEvX69nvbDcwMVmQ7vsKFlIhBaD59Cy33hL891D
         lCh23dWERMsLeDndAl3UPt7UrWPAkSj8a/4S0qVb9vHOoGSmB18CZTqcx3w8KCLNXHW/
         RSOJv7SSmR5Ty807iZXFb7DpHXWKjoaCaugyJ437wmRVupwhREPeW+CwljQWhoeB7dC/
         v5lQ==
X-Gm-Message-State: AOJu0YyXRPsBzJ2zTmdqtbuywqNl8FJB7ldGhXwYz4T/yvXW5rFowfIx
	/wKSI+75lGwgdYX0koHlsRnkJ1c8ZppQk31fSYQspLwqzDYtWOYNqMIT0I/jF9M=
X-Google-Smtp-Source: AGHT+IFYrdr2wE6y1S8I90rTBSf9vTejQ3U6UPem/Op1SlfpgrvKcF1x/1w2hQAtVwFYuvK1eS4+EA==
X-Received: by 2002:a05:6a21:1f2f:b0:1a9:4055:6dce with SMTP id adf61e73a8af0-1b26460c5e4mr1004940637.58.1717051026736;
        Wed, 29 May 2024 23:37:06 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70230088070sm703239b3a.50.2024.05.29.23.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 23:37:06 -0700 (PDT)
Date: Thu, 30 May 2024 12:07:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V3 Resend] virtio-transport: Clarify requirements
Message-ID: <20240530063704.geyzjp2bi4nwfala@vireshk-i7>
References: <3543c631e29d35a667ca9d9e912d1a6db1feb0ce.1716197180.git.viresh.kumar@linaro.org>
 <a752usapxpmlwpm5ywvccrrkmumi5aosbzvsxjghsotn4kmgyq@hlmjdhedeqbz>
 <20240521101023.ooesha4uo3fufr3t@vireshk-i7>
 <kl3cehxu74h2c7opytdditx6bodpy7clbofivnkr5druswlknz@o2nsukuuipym>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kl3cehxu74h2c7opytdditx6bodpy7clbofivnkr5druswlknz@o2nsukuuipym>

On 29-05-24, 12:42, Stefano Garzarella wrote:
> mmm, I had interpreted this statement as if we could:
> 
>   The transport MAY provide a mechanism for the driver to initiate a
>   reset of the virtqueues and device.
> 
> IIUC device reset is always supported (see `\section{Device Reset}` in
> content.txt) and it's transport specific. While single virtqueue reset
> depends on VIRTIO_F_RING_RESET.

Done, thanks.

-- 
viresh
