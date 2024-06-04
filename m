Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66946144D25
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 09:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717492321; cv=none; b=jgJbyt85tw9Mm+P+Oww+k1Ch3wd09OFsKoCO1P9cLMCwMBxBbm9RIoW3Mtf9HtIOcOJG0fP10fsdQ0ugFCHixY74dMR04OoFO2icGr/5hQrP2kocq1QMt88q+xZZQndMK3WlFFQAyyjRti38ncWHdaNWYipZWvGxxVko+y1KM4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717492321; c=relaxed/simple;
	bh=ULYkT5N2DY+3grWX0U39gRIY/3lGlEqLeySxWMh0O/E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=GMyF5weRKo1xGbzoVy0ttZKtR+5THxvUh9mynYIGSzIlSnthTgtOr4VmjLNsQpobgl/H3QCWgZt1+RN8NaxYCaP1HsaBe/m2/2HqtGAqBmxloB2FIAjbu8nK45tAURwkDq92p72bx0TokKwGZRx+fkfwPrqBX55GPdSGYOt2RIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WlpVOFHo; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WlpVOFHo"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f692d6e990so8104805ad.3
        for <virtio-comment@lists.linux.dev>; Tue, 04 Jun 2024 02:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717492318; x=1718097118; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JbW+0PL9QId7XEQYFwMu95tb3M3+BJieK6GlKeyGFtE=;
        b=WlpVOFHoaEJzF8zuO7QHY/8DhsuP1bsQFbUBXjoFQ6fYhIFrAg66vtzFbCvIKs0QrH
         TAPVVdcocq5iE0qxy6pBSsWiiDude9mJDEP1MKJDRb187WAtQxTOu+iNvzYwMH/ga1dl
         16V/E71U8C8nt+7BHhfRLhlor6NAkw/tCMSYwiW6995UrBMd4s92RICWcJWDSdeRW4x+
         oF1rbkUghdE8TnAxhpErJnG96NVcsOM1EbizBwLsP99u1qDhSRAvrqmUC8yLlNukro3N
         lRuVTiIx8WMFzFne5+coDHuXq5PJ0UkywcaaWTUIhLrm9i9UU1a8IqX6c67y9bDVEJRF
         UmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717492318; x=1718097118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JbW+0PL9QId7XEQYFwMu95tb3M3+BJieK6GlKeyGFtE=;
        b=bIzcVAoUx7gFsut6IJwRrkH3RF1qDFxguHhB4d8WoLUIX51Z1s0PU8HHTbbhr2fmTY
         YT4ssKEA1qaIxVFhr3KwZqJ+mNsHAxhiq4W3dD2skjZFz+t9KyL0aThbVO4QSscpRfCk
         nnKqM3mJpIfjKqDvfjITfzGIfzNxzTcH5+3VOW9sDq1oq0T6FUENtrT94466/Nw5yPBF
         7S0czJupq62YbYw/K3wfZOXy/2SUgjVILaLu7gKDRI9jKJDsGbSwDhNSfCpxgURTXGxn
         KjpqhaWEd7Q5Un2QpNlAzXUYhfyFwPlgNG0ar+WDxLxOQ5yKVah5tpFabnd8Xx5Shx8X
         ZjWQ==
X-Gm-Message-State: AOJu0YxL+W7bcCUA938diBXloct+BXZ1MZnCiMAD24SsO8Vt9bzbQD9g
	krGj1pryV7LMi5f3+eLu/jqfefV+vvEECkhZF8Mjq4K/cEGluWqj2QLKzMmI8MUGX61+3l/+26L
	w
X-Google-Smtp-Source: AGHT+IGDHc15b3cUCaX8ToDLN25VAdunOSAJk95TAfb/H8m9qU1Fi7l6cc4MdFJBtrGKhLBc7hNiNg==
X-Received: by 2002:a17:902:ce85:b0:1f6:70d6:d49a with SMTP id d9443c01a7336-1f670d6decdmr76290765ad.11.1717492318348;
        Tue, 04 Jun 2024 02:11:58 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632339170sm78394445ad.41.2024.06.04.02.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 02:11:57 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH V4] virtio-transport: Clarify requirements
Date: Tue,  4 Jun 2024 14:41:49 +0530
Message-Id: <19a5f63c2d88f88f76f5cfc94793aa182d1eeb7f.1717492057.git.viresh.kumar@linaro.org>
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

 content.tex | 80 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index 0a62dce5f65f..23eea890d9b7 100644
--- a/content.tex
+++ b/content.tex
@@ -631,8 +631,84 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
 
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
+\subsection{Transport Requirements}\label{sec:Virtio Transport Options / Virtio Transport Requirements / Transport Requirements}
+
+The transport provides a mechanism for the driver to discover the
+device.
+
+The transport provides a mechanism for the driver to identify the device
+type.
+
+The transport provides a mechanism for communicating virtqueue
+configurations between the device and the driver.
+
+The transport allows multiple virtqueues per device. The number of
+virtqueues for a pair of device-driver are governed by the individual
+device protocol.
+
+The transport provides a mechanism that the device and the driver use to
+access memory for implementing virtqueues.
+
+The transport provides a mechanism for the device to notify the driver
+and a mechanism for the driver to notify the device, for example
+regarding availability of a buffer on the virtqueue.
+
+The transport provides a mechanism for the driver to initiate a reset
+of the virtqueues and device.
+
+The transport provides a mechanism for the driver to read the device
+status. The transport MUST provide a mechanism for the driver to change
+the device status.
+
+The transport provides a mechanism to implement configuration space
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
+The device resets itself and the virtqueues if requested by the driver, in a
+transport defined way, if the transport provides such a method.
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

