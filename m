Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD5D344033
	for <virtio-comment@lists.linux.dev>; Wed, 21 Jan 2026 17:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769016413; cv=none; b=eAlAma8vA8xCN56EbNjN0pi5GhMg06GYDuWSd9lxQz4fpFhOoOZuE5VVSKYfLv/0x6XhNkoaOE4bPD4imYl9vUs1BQ5/i7skcE10Z0eKauEzmR6wN1NXTP8O5C/KuxG8yG9JUEZTyo5X8rn0+bcMg+znjSRRabqYKYAfYekj3yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769016413; c=relaxed/simple;
	bh=KbLUcoYk0G36WzwYUwhF5BT3wapOlMJkWAlblk4pRsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8zsFM7eCuIzjhMDfk1TBfGYjfI/bWVO+drXqQaeA3b9vST4xhkIZIT027ZivcQcjI3MwyUZWPmfN/REiflL/TFnPaVmcRWbTwGPrpGcEN+H+N5kALbJiHwVUMJ/CZxmrTTrA8XKwpuodzCv8WMcjcWOidCPtEAKxzTclCc9ro0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tgBXqOtZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tgBXqOtZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D77C4CEF1;
	Wed, 21 Jan 2026 17:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769016413;
	bh=KbLUcoYk0G36WzwYUwhF5BT3wapOlMJkWAlblk4pRsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tgBXqOtZQ+4oD2pF4cSZq2EC/QRqmBhiqWDwKCBXzg/tb40MeNuBU35LWhG6C5CVr
	 J6jTSF6ULJezprnS76F4upICnzMzYKRu/V21gVNZCs645WHO2zk5Q4ShWsJnkpVHvD
	 Qn7rGlKi9Wqun0kqR6z0x5hbKtTF82ftjV+hn2SVlLNQCTTA7ItMXJ6cmNCNl2Jlaz
	 b55UWqM35SfjpG+Ausz2XPZqiHAPfCK5Ggh3ygGvUwg9BYmHtX7DF+rZyC0qM6W/+X
	 3RmyCo4wR/FYX0PA7ND0p1CRckQMhv9ZrDyW/8SGofueiTR3y/yai4FGtK9682CN6o
	 Ynbnv1dTq+8tQ==
Date: Wed, 21 Jan 2026 22:56:40 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bill Mills <bill.mills@linaro.org>
Cc: virtio-comment@lists.linux.dev, 
	Bertrand Marquis <bertrand.marquis@arm.com>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Alex Bennee <alex.bennee@linaro.org>
Subject: Re: [PATCH RFC v2 0/1] virtio-msg transport layer
Message-ID: <gn4fqmvtixmllu6eog4ru224he6542sudczbyk3cvn2qt3bbfl@qblt5w4hjgvi>
References: <20250620224426.3923880-1-bill.mills@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620224426.3923880-1-bill.mills@linaro.org>

On Fri, Jun 20, 2025 at 06:44:25PM -0400, Bill Mills wrote:
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

Hi Bill,

Is there any update on this series? Are you planning to post non-RFC version
anytime soon?

- Mani

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
> We also anticipate a few more:
> 
> * virtio-msg-xen specific to Xen
>   * Usable on any Xen system (including x86 where FF-A does not exist)
>   * Using Xen events and page grants
> 
> * virtio-msg-loopback for userspace implemented devices
>   * Allows user space to provide devices to its own kernel
>   * This is similar to fuse, cuse or loopback block devices but for virtio
>   * Once developed this can provide a single kernel demo of virtio-msg
>   * [Work has begun on this]
> 
> * virtio-msg over admin virtqueues
>   * This allows any virtio-pci device that supports admin virtqueues to also
>     support a virtio-msg bus that supports sub devices
>   * [We are looking for collaborators for this work]
> 
> Changes since RFC1:
> * reformated document to better conform to the virtio spec style
>   - created an introduction chapter
>   - created a basic concept chapter
>   - created bus operation and device initialization and operation chapters
>   - reworked description of transport and bus messages
>   - attempted a "compliance chapter"
>   - reused spec macros
>   - switched to MAY/MUST/SHALL/SHOULD wording
>   - eliminate the use of terms front-end and back-end and use driver and device
> * made the maximum message size variable per bus instance
> * use "device number" for virtio-msg device instances on the bus instead of
>   adding yet another meaning for "device ID"
> * added the configuration generation count and its use
> * described types of things that can be done with bus specific messages
>   such as setup of bus level shared memory and out of band notifications
> * removed wording of notification being optional at transport level and
>   described bus level notifications of in-band, out-of-band, and polled
>   from driver side bus
> * removed the ERROR message from transport level. Errors should be handled at
>   the bus level to better match virtio-pci and virtio-mmio
> * removed bus level reset and status from standard bus messages
> * replaced bus messages DEVICE_{ADDED,REMOVED} with EVENT_DEVICE
> * changed names to GET_DEVICE_FEATURES and SET_DRIVER_FEATURES for clarity
> * made SET_DEVICE_STATE return new state as it may not match
> * Don't echo back the data in SET_VQUEUE (it cannot change)
> * defined request/response vs event message id ranges
> * match field size of next offset and wrap to virtio-{pci,mmio}
> * added maximum number of virtqueues to DEVICE_INFO
> * added admin virtqueue and SHM support
> 
> This series is a work in progress and we acknowledge at least the following
> issues we need to work on:
> 
> * Better conformance documentation
> * Publish an update to Arm FF-A spec that shows virtio-msg binding (work underway)
> * Publish virtio-msg-amp data structures and messages somewhere
> * Align implementations to this version and send PATCH v1 (non-rfc)
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
>  content.tex       |    1 +
>  transport-msg.tex | 1354 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 1355 insertions(+)
>  create mode 100644 transport-msg.tex
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
