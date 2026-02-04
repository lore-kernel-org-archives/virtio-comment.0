Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7C12BDC2C
	for <virtio-comment@lists.linux.dev>; Wed,  4 Feb 2026 03:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770175759; cv=none; b=cRZBS2OeK9cHiM0ZwoV93/9xu4mA7QQ2gKX3OIIqLzn7Ecqi7M8qu7YP0IhPNT63DjBtcnTETksdT6rzFIGCFNaa9nA+10CV1urZMr6dq51xX36nc4Sj6VXmbOEQ5ZiTJkHFpxRkMZ9NZOcYVnB3/KQZBpCI1g9HZy41JXLXpts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770175759; c=relaxed/simple;
	bh=USOYtShTBmPUqB1WAUFUP3Y1CHU8lnl7E/ACDZOnDTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4TNbWohJ2RgpOJj2SDcwZmafZs0IrnAz19vsNngU3EbIxUNvjAhXSpn8p452ixUv7bAhiNd/3UmCNDsMOGVKdSJLI59NPZXP+DpOl+4McIbFhEdhk53AU4YcAVDcV9G1KdsQZnKDV6UtlQ2PV3goEdg/rxPey/egNiWVv7ZBes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l39qadII; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l39qadII"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-823075fed75so235898b3a.1
        for <virtio-comment@lists.linux.dev>; Tue, 03 Feb 2026 19:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770175757; x=1770780557; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0uW9TSup9GtMqS3QJMB8xnbRzQnme5YCy940i/m4pLI=;
        b=l39qadIIJsp5zG4N/aKUeuBUJlLLwkn93r8zIq3b5/eisypaGGsX04LxlJZMcZwbDx
         8/q5xt+4YzC8aQfrgx++lgp14Vzjrl3iuHqSuV31czsDIzQEXz1w0ROtVG0XzJnZm0zq
         3w9YweUB2iF4VFYPQfomqFyIdT2Y4EBfEX7jmgpzKac4q6Xccij0SnHS4aASNGBs3nJk
         VTOdFAmcpbu0qqv3roKyMAxEDqDiqt9gfdAOLr7amxT5GVDZTRF3hg80brO/n5xW1HVm
         +RjFwkfrpKN1q9BuilqJcsEedRJgWn4UdL2dyC7TbchS6q9ipn5e9Lcs6k3O/edgpYyR
         OIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770175757; x=1770780557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uW9TSup9GtMqS3QJMB8xnbRzQnme5YCy940i/m4pLI=;
        b=X55QmQ0AfNO4ko0HQpWyXVGE152K+wxcOVlTiKKP61ZRvQrUxdYbYltQTel6gxvZsn
         fV8rBv1lb6qi9/WvOBIYwPOErnvpE9/VeT8ntaQ+seOfeFE26SVBftPvCxYDYxPyi/SG
         GksGVrGV1i71Y5rq06UGKAb9n5A2ol44lG2BPsDCk0sRhsw1KAmyO0Gk/GWVapNHMVZJ
         X3UIItYcfOXR+Zl0PhNPeXOaAZEcmg+HBZFqEmvKfi5O7XqtgfmaWOD/fPZrz+nF8+ge
         0kC0D1xlnTYPjdF8dPs1+YpFEbMZFGK5qlhkYEhDURHdS1csme8dNvsSyFgVffpP+IiD
         TgXg==
X-Gm-Message-State: AOJu0Yxoy3mp3psC1FKmiMKYeHscjTcKDQUYlCNlYs4nh0s9KkNJQz3J
	xNZbhfgd6SNM7EHCtKBpWWOK/QIaoJZlB13tLWyDedtein+PMrjM44BDSOFlO3GFZto=
X-Gm-Gg: AZuq6aIUJzt1qQyGHqlrtGHAmjz+IujtB5GsBWn2eGLZ+MTU0f8DdudJ+Lj1tlcb1Pb
	jlv6lowF+hGzReGDDCiAEdMqUUoG7OOZ6YaMH7rpsLC0vGEI7zuG/jM7PZxuJYiVjUomyn7dXcn
	Rj9y5QFMQjFU0KwrkqmJcRqecZh6n083rDHls21kET+gflwjB14/jWF94Q+Ar7OacUmvtsxFXCL
	SFzIkuXFDg5essY+evPCeXNzk8PwK8HScCWRiyhy+WUXrQeSyqyLrhq4mvaLonBQ2CSBwkyvAHh
	nROFj9iT7IKWC7/tx1+UunGkujY7Xocdn+0oTzjWZtcKEoOFNOWe4C09qdnzaJZjxbPRUJTW4pd
	HIjiGGeGW7poe8oIOsmzqXIjV8ZXTiyWdtDqKzDrT06rIVQF0TRRqX8kWNTDmR0NFheePf7H7eu
	bVpQ+gRJwzt2ztdmJbY12xwg==
X-Received: by 2002:a05:6a00:4fd4:b0:821:8052:e683 with SMTP id d2e1a72fcca58-8240434cc61mr4587165b3a.16.1770175756739;
        Tue, 03 Feb 2026 19:29:16 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d4af6efsm840739b3a.65.2026.02.03.19.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 19:29:15 -0800 (PST)
Date: Wed, 4 Feb 2026 08:59:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Bill Mills <bill.mills@linaro.org>
Cc: virtio-comment@lists.linux.dev, 
	Bertrand Marquis <bertrand.marquis@arm.com>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Alex Bennee <alex.bennee@linaro.org>, 
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <gntft4yvpcpiu6x7j6z4gnuyg44dq77ooae7zjgue6wir576vf@ibsu4qcwhf7b>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126163230.1122685-1-bill.mills@linaro.org>

On 26-01-26, 11:32, Bill Mills wrote:
> This series adds the virtio-msg transport layer.
> 
> The individuals and organizations involved in this effort have had difficulty in
> using the existing virtio-transports in various situations and desire to add one
> more transport that performs its transport layer operations by sending and
> receiving messages.
> 
> Implementations of virtio-msg will normally be done in multiple layers:
> * common / device level
> * bus level
> 
> The common / device level defines the messages exchanged between the driver
> and a device. This common part should lead to a common driver holding most
> of the virtio specifics and can be shared by all virtio-msg bus implementations.
> The kernel implementation in [3] shows this separation. As with other transport
> layers, virtio-msg should not require modifications to existing virtio device
> implementations (virtio-net, virtio-blk etc). The common / device level is the
> main focus of this version of the patch series.
> 
> The virtio-msg bus level implements the normal things a bus defines
> (enumeration, dma operations, etc) but also implements the message send and
> receive operations. A number of bus implementations are envisioned,
> some of which will be reusable and general purpose. Other bus implementations
> might be unique to a given situation, for example only used by a PCIe card
> and its driver.
> 
> The standard bus messages are an effort to avoid different bus implementations
> doing the same thing in different ways for no good reason. However the
> different environments will require different things. Instead of trying to
> anticipate all needs and provide something very abstract, we think
> implementation specific messages will be needed at the bus level. Over time,
> if we see similar messages across multiple bus implementations, we will move to
> standardize a bus level message for that.
> 
> We are working on a few reusable bus implementations:
 
> Bertrand Marquis (2):
>   virtio-msg: add new command for bus normative
>   virtio-msg: add conformance entries in conformance chapter
> 
> Bill Mills (2):
>   virtio-msg: Add virtio-msg, a message based virtio transport layer
>   virtio-msg: link virtio-msg content
> 
>  commands.tex      |    3 +-
>  conformance.tex   |  105 ++-
>  content.tex       |    1 +
>  transport-msg.tex | 1640 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 1746 insertions(+), 3 deletions(-)
>  create mode 100644 transport-msg.tex

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
