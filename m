Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0116341C6E
	for <virtio-comment@lists.linux.dev>; Fri,  9 Aug 2024 10:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723198977; cv=none; b=FeTpDX6blZScz3KOcTuIhvCAiLPheUUF/mVrE1Fx/UMJQIei3kQmyaBLQZn9PHbQ9MYPt+ytXUPxzSacI/nQAINPu/Q5kFt5j1nqONMa+6Rgr9tGuzwmPiGwdI3LgcTs/bPJHLcOKytvAAHZDncIMEjCreuf8xAlLMR8TKFboSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723198977; c=relaxed/simple;
	bh=TsxmGa8DVY4RyQnBRZaricF6LeTEWrcGWjat1PETEg0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lwT0aOuSZ4TdWPrUH7LSeZK23EQdDdfSs9mtHKJYDpXnHljLPYyjCXb9yQ05IxaNsypIKsY9Kanrki0c6jUUGUZiY1noJeTt7h0DgvwDv36aBUEXXoVMK5C5Nj65MX5FL1I9gHW7QkYIECSjom3yFVQTpnVTWiFT2I3izOrEF2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ED31TYcI; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ED31TYcI"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2cb52e2cb33so1483342a91.0
        for <virtio-comment@lists.linux.dev>; Fri, 09 Aug 2024 03:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723198975; x=1723803775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/M1FjlPBDpWLvQ1EvTtUqheCpsiaDFlvqBHBuBE47CQ=;
        b=ED31TYcIy/c2TZHd1p53li7cOgBVRLwDY7+sbiDjoKVLFx9toCuZ08h5DaMX7H4rZw
         +ut+NKfTOfjtaCSiX6Y054TiHJjmDJg/8L/63HpAo7Lxd+5MP+UGLvEcp8+s7X9xAE2o
         fKJX+/UQ6CyujztLkJ9HDIZ/6HoUlz+Rcg9unxDpjm6YTiLcpRYwGR/tOxSCsnal/vkW
         zGZ7rAeHwlCb0HLYYOQ5mlbBntOEI5z41lGVtPd0Q1MCCVmfkiQBC+E/qnaihDtNpvWc
         RLXOG/04lCrsAFF4m9TuYY52xsuy2x/4qm1gWmkYmKwAF1olGen0YekJYFLG0LlRbQFs
         RZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723198975; x=1723803775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/M1FjlPBDpWLvQ1EvTtUqheCpsiaDFlvqBHBuBE47CQ=;
        b=Z+qr6yOiHeQlByPw49qP7Ygk7KrtY5HlaWryfRwrIz2zaebSoP1sYksbgqx7aGifGq
         z38KdGK4ZmOduRPFWRIK9ckQfoLs1c2PUCx+5aWd2icZpKRg8aympj21+lhNb0Fkng+c
         2lcI9bKCP+06oplMHZpGOmj7i9YXyovL1J1jzD5LS87ZGAFRP9vTXwu+oiIhq1b01n2/
         YobY8kigCWxrmLrCpDyd7AWUAu6Q+EDfthusnjcGwpFmY3vwdoMynmfvR4Zb/fg3gYx9
         nwarwHj3YkjHvns8txiZLf+xE57Ds8rOc4WlBgsLsmdKmHxOWIAO00Myu3YdxRf1QtVy
         jV3w==
X-Gm-Message-State: AOJu0YwGtnfXNrlc3r0YUKqN8m+xh3n+MuTv+VaYDwqyFnxTUzb5/CRH
	ORY71DNhgGzlb7efTB+TQjR4lTzsbTDkFyih5C6yXZOSaTTUauiMW+maj//MeVZaYHW3HOGpULq
	l
X-Google-Smtp-Source: AGHT+IEVUaIWPQfXirzQS/EKZseMuD4G6Qg38Uxyn7X0YAMPTTEjCD4IjEd08QWcwEZPGdVcA/X0Jw==
X-Received: by 2002:a17:90a:a898:b0:2cf:dbd2:7bb with SMTP id 98e67ed59e1d1-2d1e805f9a6mr967580a91.28.1723198975090;
        Fri, 09 Aug 2024 03:22:55 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1c9c82b6asm2610017a91.16.2024.08.09.03.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 03:22:54 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH V9] virtio-transport: Add a section to define mandatory transport requirements
Date: Fri,  9 Aug 2024 15:52:28 +0530
Message-Id: <b8b964a8a3e6eba7461bbe7e10876c34e1e313a5.1723198845.git.viresh.kumar@linaro.org>
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
V8->V9:
- Change order of the statements.
- Specify DEVICE_NEEDS_RESET and FEATURES_OK bits.
- Language improvements.

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
 newtransport.tex | 44 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)
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
index 000000000000..af6c42c75a60
--- /dev/null
+++ b/newtransport.tex
@@ -0,0 +1,44 @@
+\chapter{Creating New Transports}\label{sec:Creating New Transports}
+
+Devices and drivers utilize various transport methods to facilitate
+communication, such as PCI, MMIO, or Channel I/O. These transport
+methods determine multiple aspects of the interaction between the device
+and the driver, including device discovery, capability exchange,
+interrupt handling, and data transfer. For instance, in a host/guest
+architecture, the host might expose a device to the guest via a virtual
+PCI bus, and the guest would employ a PCI device driver to interface
+with the device.
+
+This section outlines the mandatory requirements that a transport method
+implements.
+
+A transport provides a mechanism to implement configuration space for
+the device.
+
+A transport provides a mechanism for the driver to identify the device
+type.
+
+A transport provides a mechanism for the driver to read the device's
+FEATURES_OK and DEVICE_NEEDS_RESET status bits.
+
+A transport provides a mechanism for the driver to modify the device's
+status.
+
+A transport provides a mechanism for the driver to read and modify the
+device's feature bits.
+
+A transport allows one or more virtqueues to be implemented by the
+device. The number of virtqueues is device specific and not specified by
+the transport.
+
+A transport provides a mechanism for the driver to communicate virtqueue
+configuration and memory location to the device.
+
+A transport provides a mechanism for the device to send device
+notifications to the driver, such as used buffer notifications.
+
+A transport provides a mechanism for the driver to send driver
+notifications to the device, such as available buffer notifications.
+
+A transport provides a mechanism for the driver to initiate a device
+reset.
-- 
2.31.1.272.g89b43f80a514

