Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE41218027
	for <virtio-comment@lists.linux.dev>; Tue, 30 Jul 2024 07:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722324579; cv=none; b=u18DmrRSvgulhHZPo8K2mCDn1YFo2IfLn7NG1810bL6yo4gmxAzy+Fgih3G8H3vmBCSCJIk1cPjyO0Uay9l3BPznRuLm3fgFMBfgrNuq/CWm04NLB77a1ozCl0FscO8Q3siqjmX/robM9+/47LK+g02cuX+j5+8fimv/xyJU0D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722324579; c=relaxed/simple;
	bh=zsfmVx4aKOKo3t1pXMkZpJ0hE/y3YrgLBtBta15Yz28=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nwKAL6gfmL9khvlYIrgdfx6w2c0yTiqPpv/WPFsDog0OpLFQp9dp1VKbp+ci+zX2uytSs2tdmt/Hsw2Yd3SGnTHd1YPZSXuZzGBCgDI+57a82Gtm7xOQuWXKv4AiQs7E77rbeUlsC2AQwTeP/IDjnZNRndKw0aDbz/Nl645T8PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YXFaXDHI; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YXFaXDHI"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fbc3a9d23bso24489145ad.1
        for <virtio-comment@lists.linux.dev>; Tue, 30 Jul 2024 00:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722324577; x=1722929377; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JH1yrKXljjEBBINaXCY0R9geWyS6Pa80b9r+IbeoV5M=;
        b=YXFaXDHIQx1IeQmWDTuAciSFXK6ZSiDL2kLdghoHfG2HGys2ym9mTpFqZBVBuY75ZG
         TYVfp6saHfVz0vltQVLbPp35F5aCdEHbvJ6iB7LqEu+aRXdpURwHhT/byADeobl/JTDe
         xP5K1TAevSnhN27pgIz5TYy3QhHhiWJCMuBEUlO4Mf0broL1lf8eNPgryf4dsFg1dBm9
         KLsrFfvtn61kMCu51qvUQ7GFu4uzWYhd34EsLECC171QFXf51a8sLfeSLfKvOj7D1yy4
         6YxrY1me+GVwvx2ejgznuihArwfDB5nt9zeg84yxPhXbaaVsyCrH87qfVPJ/BSKJQhiO
         e0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722324577; x=1722929377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JH1yrKXljjEBBINaXCY0R9geWyS6Pa80b9r+IbeoV5M=;
        b=LkfIJcGYhvgiPXe83Sjhdex8fSR5ACLWnfUFpBHVeyxlhisWA9azty8DTyu5kekjF7
         t50lvVsg0Jx+S6iXL3boXJiXScCQW9HeCkny+PB8v1342U8gIm/X5ZGDBXnY9dmsm+i6
         /YE29l66TVxCqkh/x6Bjipt8pTg5n4RRSS9rSq2hu8snOd38idJmiZhr07nzJrCtdFvE
         +YELobz5to1/CHZ9ly8wXBZBe+/PU+/ucHlAqpNxTXWIKTd2+nMc+KyGeFvgCuhl1Zv7
         VnJFsscZCVt5zZYDWgAqiI9Udv8Zjwuwt0CiaZkhmNZmOloFtn1r8Y/MCf3+0qTkz30R
         zang==
X-Gm-Message-State: AOJu0YxEs3kaBgDw0qccmnWS62lAevNnVlWCfYn+4Ry21lmoT9iMfCp5
	43rRwax/Wq2uhpTENMfunoVj3kgXH5Z1W+xM6Zc0do83MycRMGA+GkFfrjMbmOTOHqU8hYKbu/M
	3
X-Google-Smtp-Source: AGHT+IHKm8525KsR3YWU9YWP8Zo1kAqO2CfV1IIkpVBiXMi/c7i3mt4FJJ7IgHactTz4TpmDYYOOwA==
X-Received: by 2002:a17:902:e84a:b0:1fb:35c7:8ea4 with SMTP id d9443c01a7336-1ff04808980mr81195125ad.2.1722324576986;
        Tue, 30 Jul 2024 00:29:36 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7d29228sm97297855ad.106.2024.07.30.00.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 00:29:36 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH V8] virtio-transport: Add a section to define mandatory transport requirements
Date: Tue, 30 Jul 2024 12:59:26 +0530
Message-Id: <1ef4e58fdbbc2c94305aa8fac856da882da1cdc2.1722324234.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current Virtio documentation lacks a set of generic requirements
applicable to all transports. Defining these generic requirements could
be beneficial when integrating support for a new transport.

This section outlines the essential requirements that any transport
method must adhere to.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V7->V8:
- Remove separate sections for device/driver requirements.
- Remove optional requirements.
- Other generic improvements.

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
 newtransport.tex | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)
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
index 000000000000..1c424ef907e3
--- /dev/null
+++ b/newtransport.tex
@@ -0,0 +1,40 @@
+\chapter{Creating New Transports}\label{sec:Creating New Transports}
+
+Devices and drivers utilize various transport methods to facilitate
+communication, such as PCI, MMIO, or Channel I/O. These transport
+methods determine multiple aspects of the interaction between the device
+and the driver, including device discovery, capability exchange,
+interrupt handling, and data transfer. For instance, in a host/guest
+architecture, the host might expose a device to the guest via a PCI bus,
+and the guest would employ a PCI device driver to interface with the
+device.
+
+This section outlines the mandatory requirements that a transport method
+must implement.
+
+A transport provides a mechanism to implement configuration space for
+the device.
+
+A transport provides a mechanism for the driver to communicate virtqueue
+configuration and memory location to the device.
+
+A transport provides a mechanism for the driver to identify the device
+type.
+
+A transport allows one or more virtqueues to be implemented by the
+device. The number of virtqueues is device specific and not specified by
+the transport.
+
+A transport provides a mechanism for the device to send device
+notifications to the driver, such as used buffer notification.
+
+A transport provides a mechanism for the driver to send driver
+notifications to the device, such as available buffer notification.
+
+A transport provides a mechanism for the driver to initiate a device reset.
+
+A transport provides a mechanism for the driver to read the device's
+status bit.
+
+A transport provides a mechanism for the driver to modify the device's
+status.
-- 
2.31.1.272.g89b43f80a514

