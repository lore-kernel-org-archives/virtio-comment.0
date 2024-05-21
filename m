Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A4E6CDBD
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 10:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716286228; cv=none; b=BnmiRp1Zz27sLfcryuM+/5YD2+NZYkLht4Dgms2LL+TtFaa055F8ubP5WwHyqNt9IFqujDgXvKStNMYDhkulWKoz0L2/wzoWNhcLp/gzJmn4Ehd9dQVfRG+WgV+WzdjFSDjVn2TCLxZcThV1bTVxCE/jIiRxL/BB9dPP1jw94O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716286228; c=relaxed/simple;
	bh=D2pSwC+dEaLuwE3H5MVNRWGWMLW/tW0bI+1rMGBqsCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qd7ecWpEeYvmtEm+G+opVZfP+OObf5cyRW+Bur5PjiwwPVzI0sDh3O8uw2zdJdXCUPLaSyU6YkLKMhcLiHHZ4DFATvPwf3r6YNj7DF7x8ISYW2RgvaOQe6ebjLlkeeaDA5S9ApdJAQ3PaiZRmL+O90KqqEirtIh59SLk2VTqwxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Es3SON+c; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Es3SON+c"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ecddf96313so90125125ad.2
        for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 03:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716286226; x=1716891026; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JWEFbbQfCsC8H4Zi/wleszdGxvcLCG1JvRlnDDcuZWk=;
        b=Es3SON+c8u7E3SaVKIxJ1Vs+L69FSDu4PphMvsL7aZsRJ6zp15EdmVxOzASKrMNoVL
         1jqO5Q7VBSJDHXI/TIrlmAFHdhFjleW+zkFYaPblyQA8VIoVC2BAhL4HXxfb3+bn13M3
         HbkLgeNGIai+WYvB9//VdqmCMX/y7XDnVnj4mzkoDgtusyxA6Ig3i3wt9JsPX6Q8Qub8
         0Dg8unSyt3urr4IaUA0BKkJZF9KbsqiqrNqUXQsBRCE/Tc82gz7fMT8m5PFpplPBMHb7
         PbO/MZokPqTZGJOq6+85WoKe2DeVkeQPt/FVpoKPXWbbg4mArm7/OF0q+dlUPfKQKDsh
         TLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716286226; x=1716891026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWEFbbQfCsC8H4Zi/wleszdGxvcLCG1JvRlnDDcuZWk=;
        b=Ytn95PswbpIHuWwX/nL7fJSRi4fNFSYWotMu0deBBEksct9W0QHh0Vh70FabhCes/d
         rASxsPffi5AZ34D8lV0meckXQrDra4OPBYmcxObMWs6q4Bl2QfMQCf1tUqWn4s8hb/qS
         iIh5hQr7Ep/AsZtwtY79ptjue4WiN8LKGFXwn3M3F5Ra1W3ht8x1ZMnypImcE1gdBQGs
         o+wfe/yYKyqAjdghvy+IxoC+24l0dHkRzcCnONBTucZENgvdRcHgtiFDeY6+1J/UwRBj
         c7uit28luPqzWTpSJerenADpllNgtrgKDi8MRaWvWvDuFDG1WjhlJCw7c4j5W/q0VYxC
         Isyw==
X-Gm-Message-State: AOJu0YyKqXnobSDcKTgJbYldIwnlTiZpaVYmDgRy/e2y8d7u+E1IWZ7i
	qUbtnEQDdYFVV/weqQYxp0ozltPDrnB0B9O53uEcHMRHPQBLIug0vbTEFzs+JsM=
X-Google-Smtp-Source: AGHT+IHMzCxhDRStr/8TfyzteCd8wmEuvwK6nlMLtq9hP6vn9jpjTVWvfl33Ia+0RT9Dmc26eoPH4A==
X-Received: by 2002:a17:90a:780f:b0:2bd:69a4:b886 with SMTP id 98e67ed59e1d1-2bd69a4ba8fmr9416159a91.26.1716286226025;
        Tue, 21 May 2024 03:10:26 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b9f5820ce9sm10561514a91.56.2024.05.21.03.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 03:10:25 -0700 (PDT)
Date: Tue, 21 May 2024 15:40:23 +0530
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
Message-ID: <20240521101023.ooesha4uo3fufr3t@vireshk-i7>
References: <3543c631e29d35a667ca9d9e912d1a6db1feb0ce.1716197180.git.viresh.kumar@linaro.org>
 <a752usapxpmlwpm5ywvccrrkmumi5aosbzvsxjghsotn4kmgyq@hlmjdhedeqbz>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a752usapxpmlwpm5ywvccrrkmumi5aosbzvsxjghsotn4kmgyq@hlmjdhedeqbz>

Dropped virtio-dev list.

On 20-05-24, 12:20, Stefano Garzarella wrote:
> I haven't followed v1 and v2, so apologies in advance if my comments have
> already been discussed.

No issues.

> On Mon, May 20, 2024 at 02:59:40PM GMT, Viresh Kumar wrote:
> > +\transportnormative{\subsection}{Virtio Transport Requirements}{Virtio Transport Options / Virtio Transport Requirements}
> > +The transport MUST provide a mechanism for the driver to discover the
> > +device.
> 
> This seems a little too stringent. For example, does MMIO offer a discovery
> mechanism? IIRC we have to pass the address via device tree or kernel
> command line.

Right. Is converting this to SHOULD okay or do you suggest some other
change ?

> > +The transport MUST provide a mechanism to implement config space
> 
> "configuration space"

Sure.

> > between
> > +the device and the driver.
> > +
> > +\devicenormative{\subsection}{Virtio Transport Requirements}{Virtio Transport Options / Virtio Transport Requirements}
> > +
> > +The device MUST keep any data associated with a device-initiated
> > +transaction accessible to the driver until the driver acknowledges the
> > +transaction to be complete.
> > +
> > +The device MUST NOT access the contents of a virtqueue before the
> > +driver notifies, in a transport defined way, the device that the
> > +virtqueue is ready to be accessed.
> > +
> > +The device MUST NOT access or modify buffers on a virtqueue after it has
> > +notified the driver about their availability.
> > +
> > +The device MUST reset the virtqueues if requested by the driver, in a
> 
> Should we also talk about the possibility of resetting the entire device?

Do we support that today ? Maybe we can if the maintainers agree.

-- 
viresh
