Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A07773463
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 07:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719299621; cv=none; b=re1F3r3LLQiBfOKLs0weVFuB6/TbZgGqjcrR0aNOSRX0I1U/jK2Pj5Wkw1j46jIrO9qdZn+FTaFBbl++VbaIqfTgjYRkMxRlUgRfvPC/fLN1AxzYrtLs0krgIleEapYkYMLpWOCuzTNgPJK/obbcqMHpRyHxM1eVATs+pHV2Wqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719299621; c=relaxed/simple;
	bh=2cA4R+PLhjffnKhMQOzEsolgKyVFavs+4QTYzeXvmBI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=aTECDNprv6co7u7uhm8P45lwpn+cFMGtlFcHLUEsTq8JmukfYicmeDn7wcEGxy3rzONynnsxX0mfTdMVRBFiPW+sqJlPmXZfnBzO5aeRReNFybBr2sq7OU67Ixfm+fqtv2ZzlYPvXSuCwx/oVNakHoEi+1idaRnlqVj6Si9LFhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e7jYMGj6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e7jYMGj6"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2c81ce83715so2937954a91.3
        for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 00:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719299619; x=1719904419; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7J+2XLnNRR5grEQjUsNCiZ2Fp7fc8z9aBymIZ9sfvjA=;
        b=e7jYMGj6fiKjNWfmZTLUqHwX6bN9Nz7GGWPZv+hUCNLYYjtkM3jYm2OnPQwRD6xBdk
         BhpPRGNs3Xg6hJba5AUZo+XVn06UWQ+1ZgHx1l2sikp1PHrxDvbEWxobZWmjQ1hLpxYU
         gOFwLh9mTkEeZwUYMqHbSlqeeM8/XwF/2TaBzmc15YHD9+1ityqSZSYA3vOMyAlcZY/n
         8zhx/vwIeR2ku1eMAn3sWot8T8qzH2SDQ/5441qaBj5DsKG8LbxP4zpDGAQHyasEh1IE
         8d/fPrXxaNnmV/wkpTnM4AaAZohyJyTJ/DeeqEHGUj95JSQ9CDV0iVkoa+9TOgLshfqY
         bHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719299619; x=1719904419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7J+2XLnNRR5grEQjUsNCiZ2Fp7fc8z9aBymIZ9sfvjA=;
        b=DTJME7QyLt0MhbBwFlmlpGdVDSBtxrgrJ14oW2dyRBReROUPoUpDMFnDFfwEhXy2P7
         YkKi/XJSku5/P3MH7f8qrbX5nas2oXz6RKWBsv5CPRqz1/iuzsRZ80MgU9MbcctvFpcP
         svuHrtivVbSi69C90GSnyiWWd6VY23aqzuDf7WdOWAX9PchxucGYlexx7RMlBpOo8FKd
         p7n192vFoxMObnQLcHB1Tpp99u/miy0kUckaDZKpJhJYGxsCJOENQokM4VnAVFKs3BTk
         VuTEUEvPcDK+9Cy1xi0NexNIMncvZVUsD0V1MrxGq6kSYtZc5IddDPgl3Nn9MdTGg011
         Y2dg==
X-Gm-Message-State: AOJu0Yx/VNB7Q4Kocqwjc1IS51w9nfvHeGHH1nEXPLSqfw1TBJFqdOgm
	G9AGCQkXhPmelVoxHIpaBIX2uK+eXSYfVKUzlmZcerBZUzbfId+ijyboEeLJNoUTGDhjNUwPBFR
	o
X-Google-Smtp-Source: AGHT+IGDoGdFOTJkAG0J3kmVxHOGRBff1Z1uGYaFMySMxGdYoYCSuZwf49UIrOPXdC5g6H85isui0Q==
X-Received: by 2002:a17:90a:fc87:b0:2c8:5798:4750 with SMTP id 98e67ed59e1d1-2c858275a8emr5913812a91.33.1719299618481;
        Tue, 25 Jun 2024 00:13:38 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c819dcf12esm7845179a91.49.2024.06.25.00.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 00:13:37 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Parav Pandit <parav@nvidia.com>
Subject: [PATCH V6] virtio-transport: Add a new section to clarify transport requirements
Date: Tue, 25 Jun 2024 12:43:34 +0530
Message-Id: <51a926b4ea2240753bcda6041a9076d58e980082.1719299462.git.viresh.kumar@linaro.org>
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

This commit tries to define the same under a new appendix section.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
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
 newtransport.tex | 82 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)
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
index 000000000000..05996c814f09
--- /dev/null
+++ b/newtransport.tex
@@ -0,0 +1,82 @@
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
+The device doesn't access the contents of a virtqueue before the driver
+notifies, in a transport defined way, the device that the virtqueue is
+ready to be accessed.
+
+The device doesn't access or modify buffers on a virtqueue after it has
+notified the driver about their availability.
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
+The driver doesn't access buffers on a virtqueue before the device notifies
+about the readiness of the same.
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

