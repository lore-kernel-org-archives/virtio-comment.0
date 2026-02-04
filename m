Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B735B13B5AE
	for <virtio-comment@lists.linux.dev>; Wed,  4 Feb 2026 05:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770183267; cv=none; b=fw6H0F88+pNuR+5NssP2oEIrkjnmerwmULLVcgxb7PxuEw9w3ySJRbinrrLBlLf27atsrFsZAQVyhjlocVY+g1VkVIbTFUWPtid4DFf7++WEeDGo9vIRH/ZiUr2O705dSQnNAxunFKaBRz2NjsDBSqpnTzXHkXGm7H1t1wkSdZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770183267; c=relaxed/simple;
	bh=1g27REQEK1c414UDxm7nt8vQYYBqB7ucjJaALv2mPyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ivfwd0eCoo8E6dPdw3ZxMHh/C+wdM3v4m8QrO005txPx4pBDE3CgX9K4qCA/JVAB69l2R9CsAPe6hX7UHBWGcD6kCllasG2h+jfSCfMxVPcrCSYhr31Qq3rOB/dw1RyaYVOhQUI5/K16jwnHc94MNr+GX/3YohqFzOWMKYoMW+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZYZL9Yt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZYZL9Yt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD076C4CEF7;
	Wed,  4 Feb 2026 05:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770183267;
	bh=1g27REQEK1c414UDxm7nt8vQYYBqB7ucjJaALv2mPyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rZYZL9YtNwDMsrgWuCY3Aup8Em6UI+WQ9ZB/JeM49kBkg1l6uAoukWF6qtouo2gK9
	 ed2LuU0175yLzKHAaAqgsE5K5Ohrnk2ryfLkjDM6Ntk2+5mOclLAGoLT/HEzSxo2pm
	 2csBMSO/TAGARzcVtxEJzUptJS6RRoAvmVbirAV3dnJlFAhfIgDNjCSMgg9B23NsMJ
	 Nr2AuHNER7dgE60ippgEO12B1p8ZGe24Hklwjjxsky4aNLGyJWvhESudagtcy3boZQ
	 asntFdRuiZpwjI7MBKIjbvNuzNduwQtCIY+VBYi0qTJaXqXMq3q63wHaGjN22jt/zJ
	 kqjpLTfdD9uCw==
Date: Wed, 4 Feb 2026 11:04:21 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bill Mills <bill.mills@linaro.org>
Cc: virtio-comment@lists.linux.dev, 
	Bertrand Marquis <bertrand.marquis@arm.com>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Alex Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <jelmahygqhfwfjhykrzlltf6vimxdh5dtjfwa6mwsalsfdqb34@dopcb66fl6dz>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260126163230.1122685-1-bill.mills@linaro.org>

On Mon, Jan 26, 2026 at 11:32:26AM -0500, Bill Mills wrote:
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
> 
> * virtio-msg-ffa based on Arm FF-A interface for use between:
>   * normal world and secure world
>   * host and VM or VM to VM
>   * Can be used w/ or with out a hypervisor
>   * Any Hypervisor that implements FF-A can be used
>   * We have this working with pKVM and Xen
>   * We have this working with Trusty and OP-TEE
> 
> * virtio-msg-amp for use between heterogenous systems
>   * The main processors and its co-processors on an AMP SOC
>   * Two or more systems connected via PCIe
>   * Minimal requirements: bi-directional interrupts and
>     at least one shared memory area
>   * hvac-demo has 2 demos of this
>   * This is working on two hardware platforms
> 
> * virtio-msg-loopback for userspace implemented devices
>   * Allows user space to provide devices to its own kernel
>   * This is similar to fuse, cuse or loopback block devices but for virtio
>   * hvac-demo has a demo
> 
> We also anticipate a few more:
> 
> * virtio-msg-xen specific to Xen
>   * Usable on any Xen system (including x86 where FF-A does not exist)
>   * Using Xen events and page grants
> 
> * virtio-msg over admin virtqueues
>   * This allows any virtio-pci device that supports admin virtqueues to also
>     support a virtio-msg bus that supports sub devices
>   * [We are looking for collaborators for this work]
> 
> Changes since RFC2:
> 
> Spec Functional:
> * Made the common message header 8 bytes and added a token for optional use
>   when parallel outstanding requests are possible
> * Made the 8 byte fields align to 8 byte offsets.
>   This effects the {SET,GET}_VQUEUE messages
> * Many conformance cases have been tightened.
> 
> Spec Editorial:
> * Major restructure to better align with virtio spec
>   * Conformance model now matches other transports
>   * Use C structures to define messages instead of tables
> * Added a section to describe how responses are matched to requests
>   This includes the use of the new token field
> * Redefined / better described error handling between transport and bus
>   layers to eliminate the need for the bus to generate fake response messages
> * Included editorial feedback from RFC2
> 
> Eco-system:
> * Added virtio-msg-loopback demo
> * Arm has published the first draft of the virtio-msg over FFA spec [6]
> * virtio-msg over FFA has been demonstrated with both Trusty and OP-TEE
>   secure world
> * LKML RFC has been sent [7]
> * QEMU RFC has been sent [8]
> 
> This is the first non-RFC patch series. The known short comings have been
> addressed. We ask for review in earnest on this series and thank you for
> any feedback you can provide.
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
> Please note that although the demos work, a few have not been aligned
> with this version of the spec.
> 

FWIW,

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
