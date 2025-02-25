Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080612571D3
	for <virtio-comment@lists.linux.dev>; Tue, 25 Feb 2025 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740491314; cv=none; b=CMnGbimk/zLBvQxbvdQ4hj+LkJiOzJYwyf8p7RfQmbW+n/Y7za1xYOY/ODqFUUbKUcVF9WZBguKwVrTWbjqDhRC8QpSoZnZgpHPbw19GZsQGvNaKvz0pUdxESLGeEKDWAwkbRNeP0SVD2z85DvNdlbi7B1iZYIXY0VLjLhXwXWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740491314; c=relaxed/simple;
	bh=4S2hrARxjxBgFJQtccC6+al3kAPmKCThMXUdvJSL2Ow=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oCtg2vMWZHQ0jolnsyEmsLvRMdgVIaHNvgsTn/CdPLLCPlU1Or1mZGn1ycSJ8m3dU7rQRxmy3uL3aH72+XCRBWQMcUV97W6qEPHaPPtX50UzSB/1czRGht+Xrca58P6NGKnN8KhKVecCh85/FM0CGzoPJGzTgVejUqIW4akxrjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wnvuwp10; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wnvuwp10"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c07cd527e4so524002485a.3
        for <virtio-comment@lists.linux.dev>; Tue, 25 Feb 2025 05:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740491310; x=1741096110; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rLuZNZ7E886EXQyb+MHO6WqDWo4Tjq1jj0D2QEr928I=;
        b=Wnvuwp10v9POB77LHVcxjQsBrAdIGQe8ZZhsZcSSmxoro6Xs0ib8kZP6djuhXLPoE9
         Rxv3ezJuSb9TAkz9zpMJBr3Wn60M6X+9SLCyyqnVpKQKBribbrOvBNNk0Vk4eUxyQ66Q
         oQMBV5nd/ulbOYIRPQNR9QggAbp9KG9UdZKU3T13m+Gv1Ga4o8s1gLFf8Pi91mCvC+4W
         eB+LdnrjBPKpmne0/fv6FeEm+P9S+X8g5jwL7PHdjl0N4MLZclwv6VzxRodYsutCEnF8
         XnHjQP/ViL9h9plWmL0ap1+okeUirJjedtt0WuSkIHvs5P53CJDZWIfFpHyDovIlW/mi
         aqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740491310; x=1741096110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLuZNZ7E886EXQyb+MHO6WqDWo4Tjq1jj0D2QEr928I=;
        b=NVdr7KOXcXP84abeUruLraU/4Xd/FZyWi+yNUDUxwGH23b4LPAz1kHTjBesmpvDSmJ
         kOFSnFBcMCCurBI/ON8Vs/HrkLgcBVCvuoVTmLIkJMwu3OCnXnEtOtPINcVKtbcFa0j8
         vI0cq3c7qGeYRYeeFZkSFYVKzkdkpbZGBFANR8ArmAqKCRvqUTIwUzIxqzYTlTYwo1yD
         j+p7w5dyF96Eh6gNVPW9IkuxCRgWqDDVVw3vUbIWhmKrbAgPOFvTs3hv/1WUVxcRy1sb
         94zph/Hu+QwTZa4Umh8SlbIR5198IaBFvbLvQLw2fz3K9vD/rRyazN6231LZhRdFCKHE
         piJQ==
X-Gm-Message-State: AOJu0YxJC+2gKIdYKDINBY7pKkBMMswZij/K0MzLzzHlk7Qt0M/n57m+
	IML1K2/4RXcK9Zyy6QhjLoPyU+wLjhR5e6IxF5pXt41xVehR8jdEuXosI6YpsX2dBFlI+WYvdE3
	0
X-Gm-Gg: ASbGncvH/Xam2hzI5YySFMtoW5rDBkeDITw0gUc0eeDzgqJQLB6EsIrf3pDDxYX/0ml
	dm7nIjPsDhvHhcpTm6uNoF00OGG+q+duuqyuj9Y6EFbsMVHaeZRXu5wPNmEhtuLZR1+kzvCJxcw
	9ue7DJ6yZ4n7gZuaxFDBlsiQF2A67Pw0GQqIDQ6zKc0Qj93AF2OFJRZBaEWe8gpmZXigL2BcniE
	93YkN23Xkx9Hi0qsZX1Qf2w7HjSSXvifaO1UK8ny5rzIoMjw+4MqVDRVUGgbj+Z5N2l+BYpeB3d
	F7eQ4ux3KBx1LhTR3vKb+rFCdZsqR4cTsPddpFKsXW4xOD7rwszC8vL8vVz0HR1zl1y01BE=
X-Google-Smtp-Source: AGHT+IGZ2RdB8+3+aBrfj+Ra2u6fJ6k0yK3feqxTWMbjzhdOa0ryEwLmxVoDTnAOab9mwAICrAG53A==
X-Received: by 2002:a05:6214:2482:b0:6e4:8774:3743 with SMTP id 6a1803df08f44-6e6ae9a8768mr182756556d6.41.1740491310395;
        Tue, 25 Feb 2025 05:48:30 -0800 (PST)
Received: from rocky.home (pool-72-83-14-124.washdc.fios.verizon.net. [72.83.14.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c23c327238sm107222485a.67.2025.02.25.05.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 05:48:29 -0800 (PST)
From: Bill Mills <bill.mills@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>
Subject: [PATCH RFC v1 0/1] virtio-msg transport layer
Date: Tue, 25 Feb 2025 08:48:00 -0500
Message-Id: <20250225134801.3546224-1-bill.mills@linaro.org>
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

We also anticipate a third:

* virtio-msg-xen specific to Xen
  * Usable on any Xen system (including x86 where FF-A does not exist)
  * Using Xen events and page grants

This series is a work in progress and we acknowledge at least the following
issues we need to work on:

* Conform to virtio spec nouns (device/driver vs frontend/backend)
  and verbs (must/may)
* Perhaps move error definition elsewhere it the spec and align on its symbols
  and numeric values
* Allow message size to be greater than 40 bytes and allow bus implementations
  to define their max message size
* Add a way to discover the protocol version
* Add a better description of the types of things a bus can do, specifically
  including out-of-band notification and memory area sharing/discovery
* Maybe redo configuration generation handling

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

 content.tex       |   1 +
 transport-msg.tex | 680 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 681 insertions(+)
 create mode 100644 transport-msg.tex

-- 
2.34.1

