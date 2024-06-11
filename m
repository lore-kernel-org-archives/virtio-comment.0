Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E285B171095
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 06:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718089102; cv=none; b=sV7LSxCxkhm7q57bIVMP48oyJkaai1sa6v6zy+Tvjis90oPa9jlI8SqzCY/CKajIxXh+FRxt/57sn16yUjk4MMB0MVV6Tz/7vtne0jdXNK2npusGn2g6b9PRs0X8Sq5H2MhdpHY5AgwiNT86aYVqhtbKWH61P/ktCJrM4vknOkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718089102; c=relaxed/simple;
	bh=Zvu4uujc1syNpI1zbpdKtOk3y/O5yLHJojQWsmBdosg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJVN8lD3qq9eOv7F3ms83nc/gyeRu5dMz3ak8ESuh6vK9EsTNpFATvf970WFMsrbp6jr2M5tHPMmCcKyBTpCJj/5ZgCGr63cD/KX3e0Q9UIcAB6LNrD5ff8PvWtcKkpnsJUR7V8L5WmmtnvbFUvszaL/1E0S4jMygCKVb4U6c/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SQ6T6KqT; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SQ6T6KqT"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-701b0b0be38so4929058b3a.0
        for <virtio-comment@lists.linux.dev>; Mon, 10 Jun 2024 23:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718089100; x=1718693900; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j9mBup5rYcbGRS5QBvSHX+NXA5xcdzF3TQFrF5r3k+A=;
        b=SQ6T6KqTFusi+feURl8zw4oRv3V1CXXkPuFVs5kkdI+lBH7fuVEkBvH/RLbM8Gs2DO
         lPErvLq2RCIjN7cpKi6I7BxABSWXHxa5JRMfq5je0t2awKWCD3A1wmbjTv/bAH/Sq2c9
         3efB+8U3fT3CASJWMNiVY04wGWo7L3AKTGo94Alqij9FFc3HzhygZAgZTBeDP9+yFtPB
         A8OOZMUAzbB6yiL6wv6GxjyLYwWQavlkJEWAWLVDSpxxDdg2SeLPQg9l5ESV7ewKCWyH
         C/alyv46qLSPNBOZmqsXbUSCEe7H4Dh6p+Tz5wIMCkxMyrV/IHo93d2OytLm/TEUw7sh
         2kRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718089100; x=1718693900;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9mBup5rYcbGRS5QBvSHX+NXA5xcdzF3TQFrF5r3k+A=;
        b=PVx/95iwP8boYxEkTZaowwOxGK8PylseiLcVgvCwVCH0QVwHZOiEM6tydHpTVnT9P2
         M3rrgVUGYWMAIxMi1ThQur8n8WGZUNAEiPYOQ6Q5d9IQC6lf6zdxdXZXXwNjzRtV0o+Y
         XmoP277i16VUZqXJ0mei91bLuJ/nKQUYmwRkCiLAzvIrUCR0l7HwdpTmfFoSbqxGjeWV
         p1yNS9rG8v6178z+hMBYCsnRhhCK90xq01IxcOl9TgtCjBQuzrkpMlFSYFgfseEd+SGX
         jntadgq0UcYraHNx9VxQ6L31Q0PfkYQjiuwac94aZYt+2XwM15/M9I9RIepjnkjnp0LX
         yHDA==
X-Gm-Message-State: AOJu0Yx/AI/ByDIvybxqL/diR46H1dOKPaPEQqgnITgoo0z0JIzcfC1t
	RKATVBTFibPFMwvlACEkuYc9DH2blwi9J9xwsFQKNav33khbzPkaTTQqJ4Lxwu0=
X-Google-Smtp-Source: AGHT+IFi6Qv3kNKpgenTW7PcK0sSB/cLncEpufcKfMnHgdaVADM7TP/FaNt5kui9B3UxSn2twDQXDg==
X-Received: by 2002:a05:6a20:96d8:b0:1b2:a346:6c8a with SMTP id adf61e73a8af0-1b2f9dee1c5mr10448145637.54.1718089099625;
        Mon, 10 Jun 2024 23:58:19 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c28067d066sm12342805a91.33.2024.06.10.23.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 23:58:18 -0700 (PDT)
Date: Tue, 11 Jun 2024 12:28:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V5] virtio-transport: Clarify requirements
Message-ID: <20240611065816.lq3ehs7fmpjbihip@vireshk-i7>
References: <9d543789de03d26a27a43ae8f7621d07d66e8731.1718084050.git.viresh.kumar@linaro.org>
 <PH0PR12MB5481413D59F2DC236F0B59DFDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH0PR12MB5481413D59F2DC236F0B59DFDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>

Hi Parav,

On 11-06-24, 06:10, Parav Pandit wrote:
> > From: Viresh Kumar <viresh.kumar@linaro.org>
> > +\subsection{Transport Requirements}\label{sec:Virtio Transport Options
> > +/ Virtio Transport Requirements / Transport Requirements}
> > +
> > +A transport provides a mechanism for the driver to discover the device.
> > +
> I would like to add a normative.

Some background on why normative statements are removed for this
change:

https://lore.kernel.org/all/20240521073925-mutt-send-email-mst@kernel.org/

> A transport MAY provide a mechanism to create and destroy virtio devices.
> 
> (for example PCI transport provides this).
> 
> It isn’t blocker for this patch.
> In case if you spin v6, please add, else will send this change after yours is merged.

> > +The device doesn't access or modify buffers on a virtqueue after it has
> > +notified the driver about their availability.
> > +
> This needs to be corrected to only say "modify".
> 
> A device may still access (read) what is already wrote, for example, used index of the split queue.
> Or packed queue flags.

Hmm, we are talking about "buffers on a virtqueue" here. I am not sure
if the device should access them anymore. Once the control is passed
to the driver, the buffers may get modified anytime and device
shouldn't access them. Used index or flags are configuration things,
accessing them is fine I guess.

> > +The device resets itself and the virtqueues if requested by the driver,
> > +in a transport defined way, if the transport provides such a method.
> > +
> > +\subsection{Driver Requirements}\label{sec:Virtio Transport Options /
> > +Virtio Transport Requirements / Driver Requirements}
> > +
> > +The driver acknowledges device notifications, as mandated by the
> > +transport.
> > +
> > +The driver doesn't access virtqueue contents before the device notifies
> > +about the readiness of the same.
> > +
> This also needs fix.
> A driver may access (poll) for the packed queue flags or used index of the split q without device notifying it.

Maybe this (in a similar way to the device specific sentence earlier)
?

The driver doesn't access buffers on the virtqueue before the device
notifies about the readiness of the same.

Configuration specific fields can of course be accessed anytime.

> > +The driver accesses queued buffers after the device has processed them
> > +and notified the driver of their availability. This mechanism is
> > +transport defined.
> > +
> > +The driver asks the device to reset itself and the virtqueues if, for
> > +example, the driver times out waiting for a notification from the
> > +device for a previously queued request.
> > +
> Please remove "virtqueue" from above. The "device to reset itself" is enough.
> "and the virtqueues" is confusing, it sort of implies the vqs are something separate from the device reset flow, which is not true.
> So device reset is good enough.

I wonder if it will cause some confusion, i.e. about the state of the
virtqueues on device reset. I understand what you are saying, but is
it a given that virtqueues will be reset once device is ?

I looked at: "Basic Facilities of a Virtio Device" -> "Device Reset",
and it doesn't talk about vitqueue being reset with the device.

Also there is a separate section about, "Virtqueue Reset" and it talks
about the possibility of a virtqueue getting reset alone.

Maybe something like ?

The driver asks the device to reset itself (and its virtqueues) if,
for example, the driver times out waiting for a notification from the
device for a previously queued request.

Thanks.

-- 
viresh
