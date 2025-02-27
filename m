Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F384521D584
	for <virtio-comment@lists.linux.dev>; Thu, 27 Feb 2025 07:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740643157; cv=none; b=ZhF4avk+Ir8zD30Ksnw8Gz/OX5l6gTYJ9r2VF4s1ACGeaeuIR0vv6IaJtgUprSvDpW8FGELMmbolYm4CpvWhmm0ZDu7OI1MT2iIW1VIpzmwxhdCVNDvqg6b13H0KGq7sLn1dco1cigKIyzmuhm6Q2nSwAI6mknaJ3Nn2XCLnwls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740643157; c=relaxed/simple;
	bh=lbDHY3En+xQVUi4fsWkhOUt3vWbZSFk3YZ6XrxB1MPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=edpnoZ0IaiMAJKEdexsGdle/uJZtUkw7OOoNH3c7UUaB+XL7PxDlxF9UOF9uGzfSawXMur7BtjyC+aYUTG8j7H5iL7N5eTimj72eB/uxg96rRpvLl+FbjymatcKh08l53cGj+z1RUX4aKYna2x4AM2x6hFnt6S/CT3W/lfm/EjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KuUcQsEx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KuUcQsEx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740643153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lvKvycgkNn0QPikgjYdy8UvvhNb/XznEmJcQwQiqOV0=;
	b=KuUcQsEx1GJWX6qMk7ZdXfLgPT8cUQ/ko93vD57MalmHNb/6CMkZImoMaxJVHqLER6kZWC
	pTmoGZKSbbllEeIkaboejPBe44we6WOeE8QbAgVOm9qaXry4P/vh3c/m6ImxVIBRtFStaX
	RBJC8jFpKyIkqcKUBHa+ZYIK8dmqkjY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-vNq7Pbo9OwiNP61Xel7NAA-1; Thu, 27 Feb 2025 02:59:11 -0500
X-MC-Unique: vNq7Pbo9OwiNP61Xel7NAA-1
X-Mimecast-MFC-AGG-ID: vNq7Pbo9OwiNP61Xel7NAA_1740643150
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43995bff469so3988355e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 23:59:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740643150; x=1741247950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvKvycgkNn0QPikgjYdy8UvvhNb/XznEmJcQwQiqOV0=;
        b=iEJi4GW6MLG3WMOzOl18IEJlwGI3vWTpSQcBB4nfH46ZknRG3Xd/TDDttXdYeUgqQD
         OLeOoyY46vQe9h3hcEzgypvmPb2sN0HGj/2Wfc3llSmG7C7Piq4fOKjQcdxjyduZdTGZ
         81uUSthaqMQ2bAENiBQn/+nTc53j3xhbYfJmFkQv9V0B8ywB4opljRy7GWeQgWvI+Q6/
         MLkXtMYptiPP3ltjFowCIt8vOP/uAPB9oy99ZLXMOYQzn5o6RvRaPsc9esDI4iD5tgmW
         ioFK5ag8jnVyg6ZX+DV/ZRMzt6Qz92L7ttarHkIbm+uhXkd3pzpvZ2Pw0z4iaeqBWTZT
         8R8A==
X-Gm-Message-State: AOJu0YxxxHe5lOI7wBgGOKkseZQLp64oEUpQbwImyJiRc8pbPLVD1w3q
	2dUIgzso8Luo5WWc/aFSLZErelf2ds3EiW25dxWM/1uo90neF5I+UxpD9DXL8qB7JNnnrm562uB
	7NMEFJTx3PVOTBwNnmLs4wxefF8EcNiOxUjcJ2wIu1dH0XAmGUL8leREy4sUnlC80
X-Gm-Gg: ASbGncse16ev8H0kipnphGQT+Lm0/MZiIou6zQiks7H6yB/MYCGBtL8zgn4DBR3bTce
	RO3x6bIYyh2USZa9SdTVgRpvGAnGILXv9NzBFh5EqP1QP833iSoKJd1n8a4SAu0mw/qeSqzYdQG
	czMQ5k6xhh2hjL3tHI6QExFyZ+Z1t/+hur9i3RictJLhjer+amlRSM17N6lx2dVQJWx7F3aacEX
	GTzJbOj8zTkUCs10c3id22zkVHILnjCF9eBBsbIlckSUxWFUt97Pe6Y4rlvl829Z4GIbWMg+mqu
X-Received: by 2002:a05:600c:1910:b0:439:98f6:8bc8 with SMTP id 5b1f17b1804b1-439aebcf61dmr185638675e9.26.1740643150182;
        Wed, 26 Feb 2025 23:59:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF18z1wxERhj8g525sed1fSMSwlQPNch8L4wy2eRlveDRQNL/MmW6Q+n7PJYret6b5xKgySJg==
X-Received: by 2002:a05:600c:1910:b0:439:98f6:8bc8 with SMTP id 5b1f17b1804b1-439aebcf61dmr185638525e9.26.1740643149719;
        Wed, 26 Feb 2025 23:59:09 -0800 (PST)
Received: from redhat.com ([2.52.7.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba52b88asm46070575e9.4.2025.02.26.23.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 23:59:08 -0800 (PST)
Date: Thu, 27 Feb 2025 02:59:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bill Mills <bill.mills@linaro.org>
Cc: virtio-comment@lists.linux.dev,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>
Subject: Re: [PATCH RFC v1 0/1] virtio-msg transport layer
Message-ID: <20250227025757-mutt-send-email-mst@kernel.org>
References: <20250225134801.3546224-1-bill.mills@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250225134801.3546224-1-bill.mills@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eciPHidymS0NBHY5i5SuQp65Oh5KARMev34rzNmQdqs_1740643150
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 25, 2025 at 08:48:00AM -0500, Bill Mills wrote:
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
> How much of the bus level should be described in the virtio spec is one item
> we wish to discuss. This draft takes a middle approach by describing the bus
> level and defining some standard bus level messages that MAY be used by the bus.
> It also describes a range of bus messages that are implementation dependent.
> 
> The standard bus messages are an effort to avoid different bus implementations
> doing the same thing in different ways for no good reason. However the
> different environments will require different things. Instead of trying to
> anticipate all needs and provide something very abstract, we think
> implementation specific messages will be needed at the bus level. Over time,
> if we see similar messages across multiple bus implementations, we will move to
> standardize a bus level message for that.
> 
> We are working on two reusable bus implementations:
> 
> * virtio-msg-ffa based on Arm FF-A interface for use between:
>   * normal world and secure world
>   * host and VM or VM to VM
>   * Can be used w/ or with out a hypervisor
>   * Any Hypervisor that implements FF-A can be used
> 
> * virtio-msg-amp for use between heterogenous systems
>   * The main processors and its co-processors on an AMP SOC
>   * Two or more systems connected via PCIe
>   * Minimal requirements: bi-directional interrupts and
>     at least one shared memory area
> 
> We also anticipate a third:
> 
> * virtio-msg-xen specific to Xen
>   * Usable on any Xen system (including x86 where FF-A does not exist)
>   * Using Xen events and page grants

I am also interested in virtio-msg-admin-cmd, sending messages to VFs
over the admin commands of the PF.

Thank you, will review.

> This series is a work in progress and we acknowledge at least the following
> issues we need to work on:
> 
> * Conform to virtio spec nouns (device/driver vs frontend/backend)
>   and verbs (must/may)
> * Perhaps move error definition elsewhere it the spec and align on its symbols
>   and numeric values
> * Allow message size to be greater than 40 bytes and allow bus implementations
>   to define their max message size
> * Add a way to discover the protocol version
> * Add a better description of the types of things a bus can do, specifically
>   including out-of-band notification and memory area sharing/discovery
> * Maybe redo configuration generation handling
> 
> Background info and work in progress implementations:
> * HVAC project page with intro slides [1]
> * HVAC demo repo w/ instructions in README.md [2]
> * Kernel w/ virtio-msg common level and ffa support [3]
> * QEMU w/ support for one form of virtio-msg-amp [4]
> * Portable RTOS library w/ one form of virtio-msg-amp [5]
> 
> In addition to the QEMU system based demos in the hvac-demo repo, we also have
> two hardware systems running:
> * AMD x86 + AMD Arm Versal connected via PCIe
> * ST STM32MP157 A7 Linux using virtio-i2c provided by M4 Zephyr
> 
> Please note that although the demos work, they are not yet aligned with each
> other nor this version of the spec.
> 
> [1] https://linaro.atlassian.net/wiki/spaces/HVAC/overview
> [2] https://github.com/wmamills/hvac-demo
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git/log/?h=virtio/msg
> [4] https://github.com/edgarigl/qemu/commits/edgar/virtio-msg-new
> [5] https://github.com/arnopo/open-amp/commits/virtio-msg/
> 
> Bill Mills (1):
>   virtio-msg: Add virtio-msg, a message based virtio transport layer
> 
>  content.tex       |   1 +
>  transport-msg.tex | 680 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 681 insertions(+)
>  create mode 100644 transport-msg.tex
> 
> -- 
> 2.34.1
> 

