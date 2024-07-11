Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694051552E7
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 09:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720688706; cv=none; b=F2baaMt0JF9nxwDgvaXTxZFvWQ++6fFrqPbGzf2Um4mugZT1xevh/chSeq2YtzA1uqA+3hQUBMXI1GMoLaFWDEMrvqf/BJt2eq2dIcFTFoIhMRbQ+Ql9wJTAwYjNfLi4BQQB6Jco39UuinY3AvdZ3n2bHrOg0oWK7D4wEcFfkY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720688706; c=relaxed/simple;
	bh=mu/jcvgPjbsAJxnZR8sCGvj6QDsIEn7Q42c28vx7c+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMqJRGzRo/Hx3wZ3gCriZ2Sq2uYy/2Q2nwNYGktHueUcbDGI5XVVI3wUSNNeFKN+It9LDZZw/FA6/ehGFy+WwzFdKt8lXckQ73ZGofoHNXJiG0R+RMSk7YxNb61V/cb8vr13wg3jRw/LgLn0uMXidspA8tEYwA7OsM9jUGBMiWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=so+JTiRW; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="so+JTiRW"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-6e7b121be30so434603a12.1
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 02:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720688703; x=1721293503; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8zaAcZpZIEBtoahlaJ/75z9WJurtB9JVJLLAzGRdyCA=;
        b=so+JTiRWB5i0iFBB03oAxj33vJx+NzAJwP1dOy4f7kf5eXgl1DjxNcxp2xvOmpG3JT
         L+da0W8TmJBg0YSVIXzP6fYPd1c6d/gr4BMhfS9iqqPuYDb1UwWe53nx96FCF2+U0xBV
         YwyUzd4tNnU9UAQvV5T1dICRPYi9uhDx7aiv/W09mlAI7qqk6QexF0ZdpIfOQOX2z9Na
         pGKTNu7HZyF3UK+mxrSipe139oVJ04Bs+AEXjSr8c9lLDxNzsrvTb2o8KCVOvsArZc0f
         vYZzvdN36O7zyAWv1LGB3MwEgUkABVQT7Mjm/6yGWkYK+QED1YsTHYrvehJmErMqqNAW
         O7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720688703; x=1721293503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zaAcZpZIEBtoahlaJ/75z9WJurtB9JVJLLAzGRdyCA=;
        b=fvYJG0MeFy+UWMannGdEa53l0WJCS5Z3vA80rua5xV8wBkGVcKpHNSvyTdtCQbQQih
         /DwRZdouF+rnm23GVE5GIjC4jqxX2ZlKhBT3kXeZP7i7za115hYhAv1l/0l/mxPGdqt0
         XCP7xeRFH1zEnc0myjxRRl+BG/o9UxjccFEGgqzPnTPgWCePLtURU/mYV6OaGSZe9uDe
         9xZCFmrkpIejgyoAjYc4gnseydwUcCd3J0j7Qp83JA8U4GXNEZ2PL8U7R+TNtSruCcQm
         Ud273fYCFi0JgaKjsPqSvqE3IzR1ykEU5CrnOOZcXxFw5Q9CIhWX2cy0pLjCspjKPQQj
         3j2w==
X-Gm-Message-State: AOJu0Yx7MYbLJlSWOWYulIeBT7GTQDwktrhLitJrVkXqCkHrjLIy6shw
	VHzhdYwovaqI/yPIUv+i8b9v9i6GkjZf/GsHIuqnNMe/aiRrgFZaU0Agw+n12hQ=
X-Google-Smtp-Source: AGHT+IFs2szLoyMgIbNeMa0mdUw1Zzv1TJRXc21KC20dAavm7CAhFO5nWXenzBkz1TrFnEbYGtmY5w==
X-Received: by 2002:a05:6a20:734c:b0:1c2:8d3f:798 with SMTP id adf61e73a8af0-1c2984cf30bmr7801842637.43.1720688703583;
        Thu, 11 Jul 2024 02:05:03 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2caa9778f22sm917080a91.51.2024.07.11.02.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 02:05:03 -0700 (PDT)
Date: Thu, 11 Jul 2024 14:35:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <20240711090500.j7ctnzdcjeqf7uxf@vireshk-i7>
References: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
 <8734ogcp5b.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734ogcp5b.fsf@redhat.com>

On 11-07-24, 10:24, Cornelia Huck wrote:
> On Thu, Jul 11 2024, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > +A transport provides a mechanism to reset an individual virtqueue.
> 
> Is that more of a requirement or a strong suggestion, given that not all
> existing transports provide this?

Suggestion. How do you suggest I rewrite it as ?

> > +The driver asks the device to reset an individual virtqueue.
> 
> This sentence is a bit weird, like the driver would randomly decide to
> reset a virtqueue :) Can we qualify this a bit?

Right. Maybe:

The driver asks the device to reset an individual virtqueue, for
example, if the driver times out waiting for a notification from the
device for a previously queued request on the specific virtqueue.

-- 
viresh
