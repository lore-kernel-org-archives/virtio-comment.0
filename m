Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA51E38E5E3
	for <virtio-comment@lists.linux.dev>; Tue,  3 Feb 2026 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770124875; cv=none; b=E1oVkKhcSEDPLXP874fFx478RMe2O4UIPRM21+vFIZv8cFJ+7m1rpkM0cbxUcxOKRjnqaKx01WoKgn7ISdhwP9CJzi1Noi+JDkBphWVEBLNH8gjQO+aMb88kokHYEmSqFgmHSxSiMZ/FvL5OnuJQzaY7gKILr6E2shQm7a5PypE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770124875; c=relaxed/simple;
	bh=QQYD8t6l6qCa5SsPe6Gmg9leieQKZWeRqSPOjca1trs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UXFfJ6HKnuI6Oua51CKCzZsFa3bScAhslMiXhPj6HiwqPtpcL62lPNN5MSf5WQFBUoaYvCZIxWfekB+gOQRAu0JtcT2DbTcuZHxn9pX9jHyd0C9arrcCbAtFCgAWRoJEWOrrgGVzOPTtF0jhYfDiguTB+WX3pXG8W92B7z7Mve4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WISvC7Rg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WISvC7Rg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770124870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b5reMwIbCgHGzxEbOX3skw3pCZd2EaAEKOGriUmdL7Y=;
	b=WISvC7RgUzCxZAE1gkJlHrDn5sL40XIBn1eJ+0AJ2j3diP+u4ZkzdXyC9+2I7+VrHc96IR
	V1KpIn4iWm9MEIeKfMvEPvFcTGthipJs3EwisO7OrfC5P05GumvErmscp0RA5KkbvLeQOW
	0OWPQLUkMmbp5Bw09JBAl8U7QIxOEZo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-2M1tgmlPMHe3TIGojnGfwA-1; Tue, 03 Feb 2026 08:21:07 -0500
X-MC-Unique: 2M1tgmlPMHe3TIGojnGfwA-1
X-Mimecast-MFC-AGG-ID: 2M1tgmlPMHe3TIGojnGfwA_1770124866
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4806fa4a180so47927635e9.2
        for <virtio-comment@lists.linux.dev>; Tue, 03 Feb 2026 05:21:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770124866; x=1770729666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b5reMwIbCgHGzxEbOX3skw3pCZd2EaAEKOGriUmdL7Y=;
        b=FpUkoN4tvI7A/fqalIiA6h+L6qcHgkEu4BQ4wifI6+re+h9s25dW+wTzjDIgNmJAnC
         Tr5z3qUbrRu+nMzUA7AJN/OKAJWRIsxD6jFVBQTjunUczrPAcPazqqj9uD77MyZD3my8
         dMtJ3vtSLnKfz49zEEeKPmKGAJRmbgDhTsom5uZnMEw1HolfMCFoQe5cikGf+B7xyzjc
         SWNRktMZlRSG5PIWIy3yf6hE9NWPBEE6lFGm+tpal94gVDOzASvfcwAX7OWuVdKY8cvT
         TPyyzj6QE1PocBXcf9ajKMjlo+5hmnuJiwxxt/p9TtoBi7inRbTWUQjS+xXToZ/Zg/Gf
         RuoA==
X-Gm-Message-State: AOJu0YxhGN1bKc2k8o8BdwSiN4lSi/JQXKOc126ABHQ31E+5/za/UK+Y
	I4DIKxiXY5Ro3wZJriXSmMwxV2+3Pdl16BzfHgl0kVdWnzW9lY6DzmIQRR/l/sPqwXZJDD2zViN
	zripeZvB4/SDlzDlCB22utQ6IaDV88JJrbxWyNTQNm7vmJLW44gLYvMUlUuEeN7Vrw/wC
X-Gm-Gg: AZuq6aIgLUs+B1FCw54AkgnxMxCxDzEGfIbYr815v4tQ/kuANVWPwld1akc/4LImQng
	dEYp3NwI+9FAkb9o1Sw7KajeTQwTCjJ13XGeaGYCY+PiX71A+mORtLULwHcBhGjKNr1wmt9T1u6
	6QJCqpAWUDVyo/seq95e+pB2K5nuHldJVYbDJ4TfHbGzRFeCphve2+DZrMAIhA75KUHAB2OyBvC
	vVa9cd5b4LeBcAGOey+31YN0sforDhQBFhvuovfzdh2/wEFeOO3GB2y4PvetxU0MwQYn/kgrtR0
	41pBNGk36N/BkfvcoFwK40vgnp8AE+owSDlyuari6QjJbhw0ihf/z6D9pFppOFQPna6akAtiCJ0
	1pBBoeNz+m5rdPnODe5i4YPbVJ2BTdqhpYw==
X-Received: by 2002:a05:600c:5294:b0:480:1a9a:e571 with SMTP id 5b1f17b1804b1-482db4d77b9mr196614355e9.22.1770124865940;
        Tue, 03 Feb 2026 05:21:05 -0800 (PST)
X-Received: by 2002:a05:600c:5294:b0:480:1a9a:e571 with SMTP id 5b1f17b1804b1-482db4d77b9mr196613745e9.22.1770124865168;
        Tue, 03 Feb 2026 05:21:05 -0800 (PST)
Received: from redhat.com (IGLD-80-230-34-155.inter.net.il. [80.230.34.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436142de842sm3644936f8f.30.2026.02.03.05.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 05:21:04 -0800 (PST)
Date: Tue, 3 Feb 2026 08:21:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bill Mills <bill.mills@linaro.org>
Cc: virtio-comment@lists.linux.dev,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <20260203081952-mutt-send-email-mst@kernel.org>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260126163230.1122685-1-bill.mills@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S7qg3zuuVvk9OPedFE746XoQC_YIhLkhhKNOWzKUBpc_1770124866
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 26, 2026 at 11:32:26AM -0500, Bill Mills wrote:
> This series adds the virtio-msg transport layer.
> 
> The individuals and organizations involved in this effort have had difficulty in
> using the existing virtio-transports in various situations and desire to add one
> more transport that performs its transport layer operations by sending and
> receiving messages.

Is it arm and linaro, or more?
If more, could we get some acks on list from the people involved?


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
> [1] https://linaro.atlassian.net/wiki/spaces/HVAC/overview
> [2] https://github.com/wmamills/hvac-demo
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git/log/?h=virtio/msg
> [4] https://github.com/edgarigl/qemu/commits/edgar/virtio-msg-rfc/
> [5] https://github.com/arnopo/open-amp/commits/virtio-msg/
> [6] https://documentation-service.arm.com/static/68f647791134f773ab3f0a7c
> [7] https://lore.kernel.org/all/cover.1753865268.git.viresh.kumar@linaro.org/
> [8] https://mail.gnu.org/archive/html/qemu-devel/2025-10/msg07438.html
> 
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
> 
> -- 
> 2.34.1
> 

