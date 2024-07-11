Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEED29CEF
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 07:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720684106; cv=none; b=nFDssQsgdjAsq0TO0VH5TbJWJsH2SjSWkBhvbximRxCTVuJ7gSZelg0P2FkIKQU6NHObzW3x24fFWAkzQ1W5YVpKvp8QSg6dwj+Xg3AMFFFh/uyNQObStzHUW1zE+Bf47qTb+wwAlylYRli7hiTtIRkFzj8I8wIgqJLTfYLJRhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720684106; c=relaxed/simple;
	bh=GoqCu57pZCxbgxKxqRNgILLV3ObLX4bj2eUK+t6AANs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=HxqNRR5erYas5xVM5ZlBl0ACrtOeyJvJ7AqK/xIbn1nqYNyKFZG01TcBMyYkfBdkQU/bo2AtRopnGwwYr3I7+eq8ycsogpMhFMh8UM99zsFYo7EjbN/XBGW6FP3iCyxucEXX7FFFTDI3JFyxoiaIAG5Kp4EOv1NAWyFHX1Pi79M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X8SSXmtx; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X8SSXmtx"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fb3cf78fbdso3530925ad.1
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 00:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720684104; x=1721288904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFTuc7J3OtWd7UoF3CcG6VF9iQA/IwqfrhJFFygdGsA=;
        b=X8SSXmtxWghBpC4pYc07E+FLQXu4c8BoTLJpldSTNciDRPwrjZuTIlX49tQC1da/WP
         KXtVFkCYyx/83teSYvraOuGlVQZ12IJnJ0ZRixN+fSDESEw3+3FbqD0EmjPPR2yQn2JK
         FOMszjh9Q5rhq3TL5ZJbrwbE1/Rz8A9m77PZK/YxcYhDnw0q3np1Esx+c9kCr8eIldmw
         zjro3UoropC9/itcWycWaYaogfg0OX4HJIaR4PBB+F9cB7VB9sLoseKBmaOLYBiiLxBK
         2t4PJvFgC67Gi8DY8UrIK8Jv+gIztCGkzr5ka96rTdXPqgl+2RGOlrPTJYfuSrFidzCX
         bxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720684104; x=1721288904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFTuc7J3OtWd7UoF3CcG6VF9iQA/IwqfrhJFFygdGsA=;
        b=D+VOF82oTEl0BiEG/MpLblPiZkN50857YJTIZB//1yfAUQXauTbd0mh9wHyKV6Rrfw
         F06qtkKlw8tK4rKFDUmXiagMnir3Ndmzb8RURqLPlJ6si68m0jX5JrImrkHqbAbI45pW
         nhUWJSdAzvSscc+tmp+i9mlpYevwGKDn2cRHoh5u+xYNJdF7jwehj1343pmLiL6dNNEB
         f8WuYGAiFA7SmP3Y7cpGPdovKAfJmcA4Pna6rBy9vi1qbf6XZksQMW+QILRN+4134RGs
         846vRcqHEtJwAkPgrXgZzoMp6s7iOK5HncqouYw1AWsydD0Tzn7QZnEZ3MEBtjbeQHg7
         /xTQ==
X-Gm-Message-State: AOJu0Yz1HU++VvtTakfkysuzi9lrD+bFwuqp00sreB+8jH9wthYBQGro
	cUmmabKIYeQAgNH5ho6uxhPMgMyin0+sWNimox1gZ485ag1aWwU5T4DisR39fu5NjduuBYry9Dm
	r
X-Google-Smtp-Source: AGHT+IFr+Ex8V2L5sT7bzIi6js+yJ/jMkGsue3MGiD1NmHDwDjh7vDXnO3AexGw5A7Xk2jmPKce9jQ==
X-Received: by 2002:a17:90a:f18c:b0:2c2:dee2:ed41 with SMTP id 98e67ed59e1d1-2ca35c30b3bmr5838875a91.19.1720684104470;
        Thu, 11 Jul 2024 00:48:24 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ca344b9e30sm4978597a91.2.2024.07.11.00.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 00:48:23 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH V7] virtio-transport: Add a new section to clarify transport requirements
Date: Thu, 11 Jul 2024 13:18:18 +0530
Message-Id: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
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

This commit tries to define the same under a new Appendix section.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V6->V7:
- Remove parts that talk about accessing content of the virtqueue.

V5->V6:
- Move the changes to a new appendix section.
- Clarify the requirements a bit more based on review comments.

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

 main.tex         |  2 ++
 newtransport.tex | 72 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 newtransport.tex

diff --git a/main.tex b/main.tex
index b1913d65e964..6d337217a3d1 100644
--- a/main.tex
+++ b/main.tex
@@ -42,6 +42,8 @@
 
 \input{newdevice.tex}
 
+\input{newtransport.tex}
+
 % acknowledgements
 \input{acknowledgements.tex} 
 
diff --git a/newtransport.tex b/newtransport.tex
new file mode 100644
index 000000000000..2abd76e5b037
--- /dev/null
+++ b/newtransport.tex
@@ -0,0 +1,72 @@
+\chapter{Creating New Transports}\label{sec:Creating New Transports}
+
+Devices and drivers can use different transport methods to enable
+interaction, for example PCI, MMIO, or Channel I/O. The transport
+methods define various aspects of the communication between the device
+and the driver, like device discovery, exchanging capabilities,
+interrupt handling, data transfer, etc. For example, in a host/guest
+architecture, the host might expose a device to the guest on a PCI bus,
+and the guest will use a PCI-specific driver to interact with it.
+
+There are some mechanisms that any transport is required to implement,
+and some requirements that devices and drivers are required to follow.
+
+\section{Transport Requirements}\label{sec:Creating New Transports / Transport Requirements}
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
+the device.
+
+A transport provides a mechanism to reset an individual virtqueue.
+
+A transport provides a mechanism for the driver to read the device
+status. A transport provides a mechanism for the driver to change the
+device status.
+
+A transport provides a mechanism to implement configuration space
+between the device and the driver.
+
+\section{Device Requirements}\label{sec:Creating New Transports / Device Requirements}
+
+The device keeps any data associated with a device-initiated transaction
+accessible to the driver until the driver acknowledges the transaction
+to be complete.
+
+The device resets itself if requested by the driver, in a transport
+defined way, if the transport provides such a method.
+
+The device resets an individual virtqueue if requested by the driver,
+in a transport defined way, if the transport provides such a method.
+
+\section{Driver Requirements}\label{sec:Creating New Transports / Driver Requirements}
+
+The driver acknowledges device notifications, as mandated by the
+transport.
+
+The driver accesses queued buffers after the device has processed them
+and notified the driver of their availability. This mechanism is
+transport defined.
+
+The driver asks the device to reset itself if, for example, the driver
+times out waiting for a notification from the device for a previously
+queued request.
+
+The driver asks the device to reset an individual virtqueue.
-- 
2.31.1.272.g89b43f80a514

