Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2B619E98C
	for <virtio-comment@lists.linux.dev>; Fri, 20 Jun 2025 22:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750459475; cv=none; b=GYQN9DITgCQBp/3lFH5cEzR6gqgvG7Nj0M6XjfE9yk1VVDSiaI1GKZoCQF/3OkHngi8YGKZi7n3GXQhCujlnf+kS3cwQtYfAAP8sRVr20Oy6QbMlzN9G1+JhMLuOrdZ9Tdcc1cyepVLjShjdrxLQg/Kb87sg33eFdjxlmX1TIiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750459475; c=relaxed/simple;
	bh=c1W2DkAopHS/N4sNzfr0ZNZmm3Lnxz+5uKdY63qjaWs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YLUUi6FgIDCosbYT8o+3cJ0ObC+D8LpuPGZXcj4KrD2d+YCUN1RCKqOoxsBiUa74D1QIIPRG2j6Keay701sUrCGWZA9LO/X/kZIBpXKItnlmGRmes9ciRuYdJPxJTg+4J0/J06EQ63N8o4h5iQvI5Js22jmTuAeNQcJK/oQXgdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XyRzL0mI; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XyRzL0mI"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fabb948e5aso28607896d6.1
        for <virtio-comment@lists.linux.dev>; Fri, 20 Jun 2025 15:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750459471; x=1751064271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lmDmQfdhjG+fLm+eUUDWBb8XipCzTcE4eBYwqv3umeE=;
        b=XyRzL0mIsBPqZNa1O0I53fw65xEarsj4CqXopLfLhu57+2BctA6tSmDSdrxEK8olEv
         Tf29wnP5asoDOBoF8N/GQD6g3uRb17143hp/9U5iSKzsNoso2IlKEqTetjiFgqi1cxxn
         o7QzJED9AYt5iDuLf77ZzoxK9Ylo++lHT3uD77jS5J6kl49Ca1ChgUCK0+PXCGO+O3rg
         nDxUNBzR8t9ZOlQ7SbiZV/R7jeNNHt3FBognIbrTdjMYWzthQteVCjjcR+2Ds0F504Lv
         k56Dcb5zoeJvRK3FmMTLGxIBwgW7ZXcP4bBKo12t3oJKtptRyaJ8+y9iUY5E8owwFbQm
         YGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750459471; x=1751064271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmDmQfdhjG+fLm+eUUDWBb8XipCzTcE4eBYwqv3umeE=;
        b=K2N4adfmwUAehusj7eCRe7aQRsyPpb/fz6aRJc7+4MvRrfS4BwuT0NjcoK8UuiUo7n
         8S8Yf/tHJZuGBQgz1H6EQIGepU77wqGGPPJiRmXTQY4SNV4xUmomyAiqtWUmJA56gmTW
         rCtPbqu0nmgGXKmgAXxgRfuRMIXdPcu6vZEjXqtMx7apS5v5uaG60cu6DNfZDeFsHIz+
         +QO5XJskZvNKNZ8cAwD+M7vPT2k1JAOCXeJp6WadKNYc7S6npb1ou6g8JXBEOsVAcGSx
         4a65EevMS/5Chm5uIBtRYrKvB6SQtzVexWHPxhQiI/4yFj4dhO+dRhh57DtMaP4T//9E
         uj8Q==
X-Gm-Message-State: AOJu0YzVMaCtGhX/vscUdBk0esSNoSKGDxeYF/aNJdCHx6eX3KA0lImh
	VaGPbB8GFgFyfFn0gLrhpMOxyUvnAf1nuPgY6H5BAy4WiAAaQhSU4XqRpPzOd6pebmRMftPlAyo
	PON0t
X-Gm-Gg: ASbGncs3ADsZfhlgpLDjQGhEqMzbiuI6KSJLKAKjRnLzdIHa7dAyRdySeZpqNFIdLyq
	g8EiEQs0fNKx5Rn8jI5Wv6RUwaB36zCmJgJV3PZRYBGBCYNOPsXyWymv1wNDcU5Sdor0MY4uGaM
	rYeaKkKnozCpKQ0ReFueOJmXUI6U4eHuGuhjts94Nvtt01aMV9D9ndQf8kaAD5xtpjodfVfXJSa
	PSLgnq04NxYlBooblNIwGoV7ObanoNgBkvhq+VxB4RKbXsQZNe6xKJa4x26EzyR3zgrGN5RNw2w
	zGWzUndLgryG3gIBIVhAH2uH62cvsHPD8Tc2R+Jco3UwLlXR9YiKsZrhwb8VshZzf2/lRCBe4Q2
	BLTxw0ePq5Dk2rZ7F/A6rwmvCKiuhxdJLqWTMKovj6g==
X-Google-Smtp-Source: AGHT+IEDDyRYzXiJuOgibe9+j80XD9RvwbW67493H2iD2sHTmHGaTXcCKXCsCXtgxBAM+AqyrOsvdw==
X-Received: by 2002:a05:6214:1d06:b0:6cb:ee08:c1e8 with SMTP id 6a1803df08f44-6fd0a531da0mr88349466d6.23.1750459471409;
        Fri, 20 Jun 2025 15:44:31 -0700 (PDT)
Received: from rocky.home (pool-72-83-14-124.washdc.fios.verizon.net. [72.83.14.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd09538315sm17065256d6.73.2025.06.20.15.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 15:44:30 -0700 (PDT)
From: Bill Mills <bill.mills@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>
Subject: [PATCH RFC v2 0/1] virtio-msg transport layer
Date: Fri, 20 Jun 2025 18:44:25 -0400
Message-Id: <20250620224426.3923880-1-bill.mills@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the virtio-msg transport layer.

The individuals and organizations involved in this effort have had difficulty in
using the existing virtio-transports in various situations and desire to add one
more transport that performs its transport layer operations by sending and
receiving messages.

Implementations of virtio-msg will normally be done in multiple layers:
* common / device level
* bus level

The common / device level defines the messages exchanged between the driver
and a device. This common part should lead to a common driver holding most
of the virtio specifics and can be shared by all virtio-msg bus implementations.
The kernel implementation in [3] shows this separation. As with other transport
layers, virtio-msg should not require modifications to existing virtio device
implementations (virtio-net, virtio-blk etc). The common / device level is the
main focus of this version of the patch series.

The virtio-msg bus level implements the normal things a bus defines
(enumeration, dma operations, etc) but also implements the message send and
receive operations. A number of bus implementations are envisioned,
some of which will be reusable and general purpose. Other bus implementations
might be unique to a given situation, for example only used by a PCIe card
and its driver.

How much of the bus level should be described in the virtio spec is one item
we wish to discuss. This draft takes a middle approach by describing the bus
level and defining some standard bus level messages that MAY be used by the bus.
It also describes a range of bus messages that are implementation dependent.

The standard bus messages are an effort to avoid different bus implementations
doing the same thing in different ways for no good reason. However the
different environments will require different things. Instead of trying to
anticipate all needs and provide something very abstract, we think
implementation specific messages will be needed at the bus level. Over time,
if we see similar messages across multiple bus implementations, we will move to
standardize a bus level message for that.

We are working on two reusable bus implementations:

* virtio-msg-ffa based on Arm FF-A interface for use between:
  * normal world and secure world
  * host and VM or VM to VM
  * Can be used w/ or with out a hypervisor
  * Any Hypervisor that implements FF-A can be used

* virtio-msg-amp for use between heterogenous systems
  * The main processors and its co-processors on an AMP SOC
  * Two or more systems connected via PCIe
  * Minimal requirements: bi-directional interrupts and
    at least one shared memory area

We also anticipate a few more:

* virtio-msg-xen specific to Xen
  * Usable on any Xen system (including x86 where FF-A does not exist)
  * Using Xen events and page grants

* virtio-msg-loopback for userspace implemented devices
  * Allows user space to provide devices to its own kernel
  * This is similar to fuse, cuse or loopback block devices but for virtio
  * Once developed this can provide a single kernel demo of virtio-msg
  * [Work has begun on this]

* virtio-msg over admin virtqueues
  * This allows any virtio-pci device that supports admin virtqueues to also
    support a virtio-msg bus that supports sub devices
  * [We are looking for collaborators for this work]

Changes since RFC1:
* reformated document to better conform to the virtio spec style
  - created an introduction chapter
  - created a basic concept chapter
  - created bus operation and device initialization and operation chapters
  - reworked description of transport and bus messages
  - attempted a "compliance chapter"
  - reused spec macros
  - switched to MAY/MUST/SHALL/SHOULD wording
  - eliminate the use of terms front-end and back-end and use driver and device
* made the maximum message size variable per bus instance
* use "device number" for virtio-msg device instances on the bus instead of
  adding yet another meaning for "device ID"
* added the configuration generation count and its use
* described types of things that can be done with bus specific messages
  such as setup of bus level shared memory and out of band notifications
* removed wording of notification being optional at transport level and
  described bus level notifications of in-band, out-of-band, and polled
  from driver side bus
* removed the ERROR message from transport level. Errors should be handled at
  the bus level to better match virtio-pci and virtio-mmio
* removed bus level reset and status from standard bus messages
* replaced bus messages DEVICE_{ADDED,REMOVED} with EVENT_DEVICE
* changed names to GET_DEVICE_FEATURES and SET_DRIVER_FEATURES for clarity
* made SET_DEVICE_STATE return new state as it may not match
* Don't echo back the data in SET_VQUEUE (it cannot change)
* defined request/response vs event message id ranges
* match field size of next offset and wrap to virtio-{pci,mmio}
* added maximum number of virtqueues to DEVICE_INFO
* added admin virtqueue and SHM support

This series is a work in progress and we acknowledge at least the following
issues we need to work on:

* Better conformance documentation
* Publish an update to Arm FF-A spec that shows virtio-msg binding (work underway)
* Publish virtio-msg-amp data structures and messages somewhere
* Align implementations to this version and send PATCH v1 (non-rfc)

Background info and work in progress implementations:
* HVAC project page with intro slides [1]
* HVAC demo repo w/ instructions in README.md [2]
* Kernel w/ virtio-msg common level and ffa support [3]
* QEMU w/ support for one form of virtio-msg-amp [4]
* Portable RTOS library w/ one form of virtio-msg-amp [5]

In addition to the QEMU system based demos in the hvac-demo repo, we also have
two hardware systems running:
* AMD x86 + AMD Arm Versal connected via PCIe
* ST STM32MP157 A7 Linux using virtio-i2c provided by M4 Zephyr

Please note that although the demos work, they are not yet aligned with each
other nor this version of the spec.

[1] https://linaro.atlassian.net/wiki/spaces/HVAC/overview
[2] https://github.com/wmamills/hvac-demo
[3] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git/log/?h=virtio/msg
[4] https://github.com/edgarigl/qemu/commits/edgar/virtio-msg-new
[5] https://github.com/arnopo/open-amp/commits/virtio-msg/

Bill Mills (1):
  virtio-msg: Add virtio-msg, a message based virtio transport layer

 content.tex       |    1 +
 transport-msg.tex | 1354 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1355 insertions(+)
 create mode 100644 transport-msg.tex

-- 
2.34.1

