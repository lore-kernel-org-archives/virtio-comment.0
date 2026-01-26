Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB5227F18B
	for <virtio-comment@lists.linux.dev>; Mon, 26 Jan 2026 16:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445157; cv=none; b=f8SN8RtJmciXgZzy1kjg/T6oaWSw2jBeAXqjiJkplI6W9zenZ+g4Wn+i6gc/gM9pbg8Z5A1kTBvK2+b6o51goDVkF/M+NQeybk1BUcM+iq/e4allIxO9IVcowvH/12u/aS213su1l6TBmZp9ezsNiwAj3SkGSOnsaLGMdxLnrAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445157; c=relaxed/simple;
	bh=m1rTdpV2QSIEFjpdtMjZVbjp109Tok6cCCtgquzFII8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D8pjK+97SMpW+fey2waDkg1ePqQRWXiYHhqgO+JHLKyg4Umq/ny5+REPvFcBuO4dLzeN/h6vDMntP5oqJfW4m25liZjVoL3sQ/1orQhgzc2MzrciagUuZPDy1RgZh6QZFhrwnBnITUhJDHWi+Xt8yzwFJggI/4olGaTocwhoRDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GaihqBCs; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GaihqBCs"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c6a7638f42so690031585a.2
        for <virtio-comment@lists.linux.dev>; Mon, 26 Jan 2026 08:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769445154; x=1770049954; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PNSep2mbyUIliVQVGmf229JYk3r3T3yiBB/fX6EOwbg=;
        b=GaihqBCsAzSceishLBkh8lj7hMhvyL1tGy+a4/XxlSLCU7aQs3rM91om2pt+MkLSnD
         GSNajOZWgRFAe0IEce5RPWkCyXToyP944yAENvfGvC24Cza81j3RokLlkkW3orDe4Dwl
         O6RICTihh4XAwmx9uR8xHuu77u9X8FiZtfSnTj1XmcoKMEr4GPmv/tnEMAGobRUqX7tw
         UVozhd62LfGNtp9SVK8IqHFOWDT4ChWjmxNT07KRM/bV7+UiyfQlBJmA0xxZaY/P/qwd
         W68KByqxpbdqZBRmaoTo8fa5TjGzbFECniClhY7XCiV54mBGRQzDvBKjiaozlYDAVoyw
         rb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769445154; x=1770049954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNSep2mbyUIliVQVGmf229JYk3r3T3yiBB/fX6EOwbg=;
        b=Cfc45UIBdxQgj1pRTdzu13g7JFFgf2m9wSiIj8nNpgP6ZdgpeYNYD/n6LSoRUQ77yR
         3XlTKtS7IqMIV3yodRbXn8uBAbQ+az27Sh6VzLESJMsvMw2xoJmw0LyhviQngHo0dlqw
         D5lx2SaTB/dTDkfXIm+DLbs1To796IFW84qclXQPnNPNbeevarDzB1m6H6EzR1QrDny7
         eAEdNjN8ck0UCRLawL97joA2oakZ97UUX/AqLJFeRrurSVbghlo3a1CcsTaau39Kfoql
         VgNNQQRuvC4nyf/vKUHa+QGasuoAVVY5X9Hork4PV2R9ARFwvBcd6r/WprBYG4OBigEb
         yfsg==
X-Gm-Message-State: AOJu0YzzTTJJ13nhDSOyoRPmxXnRE/xhBLH6WXz9qDBSvj1TVAy+2Xq4
	Oz/GXfQS95Ag903ARdqXalBDsPyd/PR7UgDH7/Mnm80yPUf2dRSOOhQXJ+/g1o8mrf5M7t26iKN
	pCZI0
X-Gm-Gg: AZuq6aJv909uMOVVfk6Ke+B+OlQIc7Desd5SPYM6f14YivAbHuHi9oDtoVsz+rZi/o6
	IudU+G5agwNsjg6dw928fX+1yp1yzWEkzfcKG6X2xMqXLDQVtfNSD3DSxsT2yHsHb00j2746Yt5
	iiQyHhyLEUo80UFnXVi8ZPs0sUX1/dODoPF5wWqnB6/M2yLiRUx1zAbQueL8w2Mn1YZFWS1+KP3
	J+q7gNpIXuql6m+QqVqqaYcfO4gvhgZ33nELM7ZDEQpT37XPJucoSiAMZCgeQYYRftQdKjlEdK+
	6gBckL8Axvul6rENM6Ur+5Hr45V2f82WRl5M1Tjpi1NWRG7YUhnitIvt8MscCD+ZPqNiyNTk8DT
	QVNMlYPb0mmQ06UDR1DOVMnFqp9WOK/DRsQYHKKxE3llxii23Er/07lteOFYS7urYgJH1nd2MtN
	5HZTuWA+FWIjLGrE4L25Yh9oYIihf+T36NHVr9nyKk4KYOPtzhaaV/8mE=
X-Received: by 2002:a05:620a:4013:b0:8c6:3c46:a1b6 with SMTP id af79cd13be357-8c6f9572caemr577045485a.3.1769445154101;
        Mon, 26 Jan 2026 08:32:34 -0800 (PST)
Received: from rocky.home (pool-108-48-78-67.washdc.fios.verizon.net. [108.48.78.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e37d1d6dsm1042321285a.17.2026.01.26.08.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:32:33 -0800 (PST)
From: Bill Mills <bill.mills@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>,
	Bill Mills <bill.mills@linaro.org>
Subject: [PATCH v1 0/4] virtio-msg transport layer
Date: Mon, 26 Jan 2026 11:32:26 -0500
Message-Id: <20260126163230.1122685-1-bill.mills@linaro.org>
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

The standard bus messages are an effort to avoid different bus implementations
doing the same thing in different ways for no good reason. However the
different environments will require different things. Instead of trying to
anticipate all needs and provide something very abstract, we think
implementation specific messages will be needed at the bus level. Over time,
if we see similar messages across multiple bus implementations, we will move to
standardize a bus level message for that.

We are working on a few reusable bus implementations:

* virtio-msg-ffa based on Arm FF-A interface for use between:
  * normal world and secure world
  * host and VM or VM to VM
  * Can be used w/ or with out a hypervisor
  * Any Hypervisor that implements FF-A can be used
  * We have this working with pKVM and Xen
  * We have this working with Trusty and OP-TEE

* virtio-msg-amp for use between heterogenous systems
  * The main processors and its co-processors on an AMP SOC
  * Two or more systems connected via PCIe
  * Minimal requirements: bi-directional interrupts and
    at least one shared memory area
  * hvac-demo has 2 demos of this
  * This is working on two hardware platforms

* virtio-msg-loopback for userspace implemented devices
  * Allows user space to provide devices to its own kernel
  * This is similar to fuse, cuse or loopback block devices but for virtio
  * hvac-demo has a demo

We also anticipate a few more:

* virtio-msg-xen specific to Xen
  * Usable on any Xen system (including x86 where FF-A does not exist)
  * Using Xen events and page grants

* virtio-msg over admin virtqueues
  * This allows any virtio-pci device that supports admin virtqueues to also
    support a virtio-msg bus that supports sub devices
  * [We are looking for collaborators for this work]

Changes since RFC2:

Spec Functional:
* Made the common message header 8 bytes and added a token for optional use
  when parallel outstanding requests are possible
* Made the 8 byte fields align to 8 byte offsets.
  This effects the {SET,GET}_VQUEUE messages
* Many conformance cases have been tightened.

Spec Editorial:
* Major restructure to better align with virtio spec
  * Conformance model now matches other transports
  * Use C structures to define messages instead of tables
* Added a section to describe how responses are matched to requests
  This includes the use of the new token field
* Redefined / better described error handling between transport and bus
  layers to eliminate the need for the bus to generate fake response messages
* Included editorial feedback from RFC2

Eco-system:
* Added virtio-msg-loopback demo
* Arm has published the first draft of the virtio-msg over FFA spec [6]
* virtio-msg over FFA has been demonstrated with both Trusty and OP-TEE
  secure world
* LKML RFC has been sent [7]
* QEMU RFC has been sent [8]

This is the first non-RFC patch series. The known short comings have been
addressed. We ask for review in earnest on this series and thank you for
any feedback you can provide.

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

Please note that although the demos work, a few have not been aligned
with this version of the spec.

[1] https://linaro.atlassian.net/wiki/spaces/HVAC/overview
[2] https://github.com/wmamills/hvac-demo
[3] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git/log/?h=virtio/msg
[4] https://github.com/edgarigl/qemu/commits/edgar/virtio-msg-rfc/
[5] https://github.com/arnopo/open-amp/commits/virtio-msg/
[6] https://documentation-service.arm.com/static/68f647791134f773ab3f0a7c
[7] https://lore.kernel.org/all/cover.1753865268.git.viresh.kumar@linaro.org/
[8] https://mail.gnu.org/archive/html/qemu-devel/2025-10/msg07438.html

Bertrand Marquis (2):
  virtio-msg: add new command for bus normative
  virtio-msg: add conformance entries in conformance chapter

Bill Mills (2):
  virtio-msg: Add virtio-msg, a message based virtio transport layer
  virtio-msg: link virtio-msg content

 commands.tex      |    3 +-
 conformance.tex   |  105 ++-
 content.tex       |    1 +
 transport-msg.tex | 1640 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1746 insertions(+), 3 deletions(-)
 create mode 100644 transport-msg.tex

-- 
2.34.1

