Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CEF171E71
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 05:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718084148; cv=none; b=Z9ywTXHSwQdbovVm6wngDb5p6cRzCnMV/oVVj5OJEndalhADBuTUS2VOhSXXmvFZ6Ev2y0V99mPLYcHheN2+Qs+qpA+yBPLFnYwRhr2mMBjMpK4XSJJ7gsZEArycznio8+Hi+G4Ai7OkmK2xUUx11oJs2+9b3k3ptWqUWnvgxLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718084148; c=relaxed/simple;
	bh=25EmFWo+ER6txW2may1ChzmUTs813a/F7KAYtpr0IVM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Bj713MsNZdJbWolYmgahVj38kNk4dHp/ApxbGHXtBoPqlZxGuumd5ckzF3ao8B9hNhePyGMXsDiR2XWb7KI7xk9hBqnNESykNARFZPhg8+q3AvtVNIW8nLLFHlNFaANT7/s/Y/YsbExCkMqAzzFldUO4DsZb1xczFkPT2IkkSCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qt2ambdy; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qt2ambdy"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-6ce533b6409so517472a12.1
        for <virtio-comment@lists.linux.dev>; Mon, 10 Jun 2024 22:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718084146; x=1718688946; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qv9l9FEy1397W//cp494SNgVsqJExwInD6xN6sB1HtY=;
        b=qt2ambdyi4aSbGIcSS7LU8sy2r6Bsu+7+04MKVFBrzdYg8/xDTqNVeejdvm3fHd+MC
         jsBqz4dgZxMzb6fWYzIPJsfYQevAji0VV5fN9Ox3R0rgZfV81Ee2mpyHuBQ12rxBzHJs
         G2Dd+4uuRcJS3FRVi7AcjZseVo1KgPnEgsK+7IBAHeuYL9t08IqURwFCEeR+WBhw/0FQ
         iv+K+GJ6WShVPHqqU9I4yejIBKLBJHqtqs6IngUYY+sjcbikkHfam43oqL6xurPN5wec
         N6voOJOEXTQhT1NF2vh9sN22UNS6BBRE4r1nRwIFQXgRMFDy1TOK8FnidDNfflq4R6e3
         VPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718084146; x=1718688946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qv9l9FEy1397W//cp494SNgVsqJExwInD6xN6sB1HtY=;
        b=SA8ttGCkIPSuMdp1IDvmQsTgQzUjhOyLVXyn+/9IYDj5wQidG+aUxM2UhD0sibrvum
         JcaJInWc9OtCTxaMSv3Znv5we+FVgOKR1la0JqWB5I/oj31pXNPpAVG1GYHoMMTOhrbh
         3WIk1euZD+zpy83lLofAf/MDkt8voNk4NFy/Hr5j0kQj+Icq3u7MdhCFz8gDlS0AI1ch
         87Ui5r8JlrnGxV1xLmnvZsUOQVTHoMFLdy4CrkMiWFQxcs6lqTCLuABojaDNjwaJfPZP
         tCQ+SUQc119L5grnXJIvilbUYzeO3sgHeDBUrF7/92SF9mjxHclOWre3dwWYmYQX1BAr
         ZiQQ==
X-Gm-Message-State: AOJu0YwU1oMDYWGOasYk7D6AZEBu49ICJtWsa5tnBenDqALwVF51HQD8
	Y9xeMSaWX0BKg2ZJ9at6YaMwV5nirxWdq2Pb/rje+q3SmSSa0yYnU1/nY0J5Pt6hqE6xb+275Zm
	+
X-Google-Smtp-Source: AGHT+IE0XYoUNFYSxoztgTVcMtrE75iVIlJEe8Qsu8zGJG0JZdaBuE71Dd2TI9ymJGwqyO5CNs1yew==
X-Received: by 2002:a17:90a:ac17:b0:2c2:d4b8:832b with SMTP id 98e67ed59e1d1-2c2d4b887d3mr9901639a91.23.1718084145846;
        Mon, 10 Jun 2024 22:35:45 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2cd57024csm7373417a91.20.2024.06.10.22.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 22:35:45 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH V5] virtio-transport: Clarify requirements
Date: Tue, 11 Jun 2024 11:05:42 +0530
Message-Id: <9d543789de03d26a27a43ae8f7621d07d66e8731.1718084050.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The virtio documentation currently doesn't define any generic
requirements that are applicable to all transports. They can be useful
while adding support for a new transport.

This commit tries to define the same.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V4->V5:
- s/The transport/A transport/
- s/MUST provide/provides/
- Added some text for transport requirements.

V3->V4:
- Remove the normative sections and use direct speech.
- Change wording at few places.

V2->V3:
- Minor fixes.
- Added Reviewed by from Alex.

V1->V2:
- Lot of changes after discussions with Alex and Cornelia.
- Almost a rewrite of the first commit.
- Add Transport normative sections.

 content.tex | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index 0a62dce5f65f..e2a836327818 100644
--- a/content.tex
+++ b/content.tex
@@ -631,8 +631,86 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
 
 \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
 
-Virtio can use various different buses, thus the standard is split
-into virtio general and bus-specific sections.
+Devices and drivers can use different transport methods to enable
+interaction, for example PCI, MMIO, or Channel I/O. The transport
+methods define various aspects of the communication between the device
+and the driver, like device discovery, exchanging capabilities,
+interrupt handling, data transfer, etc. For example, in a host/guest
+architecture, the host might expose a device to the guest on a PCI bus,
+and the guest will use a PCI-specific driver to interact with it.
+
+The standard contains sections describing the transport-agnostic parts
+of virtio, and sections describing how individual transports implement
+virtio.
+
+\section{Virtio Transport Requirements}\label{sec:Virtio Transport Options / Virtio Transport Requirements}
+
+There are some mechanisms that any transport is required to implement,
+and some requirements that devices and drivers are required to follow.
+
+\subsection{Transport Requirements}\label{sec:Virtio Transport Options / Virtio Transport Requirements / Transport Requirements}
+
+A transport provides a mechanism for the driver to discover the device.
+
+A transport provides a mechanism for the driver to identify the device
+type.
+
+A transport provides a mechanism for communicating virtqueue
+configurations between the device and the driver.
+
+A transport allows multiple virtqueues per device. The number of
+virtqueues for a pair of device-driver are governed by the individual
+device protocol.
+
+A transport provides a mechanism that the device and the driver use to
+access memory for implementing virtqueues.
+
+A transport provides a mechanism for the device to notify the driver and
+a mechanism for the driver to notify the device, for example regarding
+availability of a buffer on the virtqueue.
+
+A transport provides a mechanism for the driver to initiate a reset of
+the virtqueues and device.
+
+A transport provides a mechanism for the driver to read the device
+status. A transport provides a mechanism for the driver to change the
+device status.
+
+A transport provides a mechanism to implement configuration space
+between the device and the driver.
+
+\subsection{Device Requirements}\label{sec:Virtio Transport Options / Virtio Transport Requirements / Device Requirements}
+
+The device keeps any data associated with a device-initiated transaction
+accessible to the driver until the driver acknowledges the transaction
+to be complete.
+
+The device doesn't access the contents of a virtqueue before the driver
+notifies, in a transport defined way, the device that the virtqueue is
+ready to be accessed.
+
+The device doesn't access or modify buffers on a virtqueue after it has
+notified the driver about their availability.
+
+The device resets itself and the virtqueues if requested by the driver,
+in a transport defined way, if the transport provides such a method.
+
+\subsection{Driver Requirements}\label{sec:Virtio Transport Options / Virtio Transport Requirements / Driver Requirements}
+
+The driver acknowledges device notifications, as mandated by the
+transport.
+
+The driver doesn't access virtqueue contents before the device notifies
+about the readiness of the same.
+
+The driver accesses queued buffers after the device has processed them
+and notified the driver of their availability. This mechanism is
+transport defined.
+
+The driver asks the device to reset itself and the virtqueues if, for
+example, the driver times out waiting for a notification from the device
+for a previously queued request.
+
 
 \input{transport-pci.tex}
 \input{transport-mmio.tex}
-- 
2.31.1.272.g89b43f80a514

