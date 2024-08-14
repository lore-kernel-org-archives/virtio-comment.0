Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F011BBBEC
	for <virtio-comment@lists.linux.dev>; Wed, 14 Aug 2024 14:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723647429; cv=none; b=haXTdFKkBxtnU6nSg2y+KU6WCNP9qFrDk2KLff2ydJDw8sDGNuddmRZfxxun3uOil0UTacrWJ1tXlrT0nalkkTNG6tSPTr6RPr24KDBV+MDxTSaGlON+h6+WlrRyqpCftItRmOeyFAAQRhPmmYllwdiXqYZvhiffvDu4lqjru8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723647429; c=relaxed/simple;
	bh=+D72tu47fNDnFXg9bpY2qnMMODQkqJmmoOAIO4fp15g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QNG2Cx9lcCwGB57eJ2ZEm3PIejgavynG2aaiDV7Co7DJ2mVSsHsiNfAnNGISCzzKjRtY0zwRMZOyt1mJsoUOrpv5ch8a10luT+EImpkHOOkSV8RlsheMNvud4mC+26kq6PmgDS13jnGp5LHhalkHMhGR5uHDyIVAaWUQOgDS0jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M3rld1JB; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M3rld1JB"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fc65329979so61413225ad.0
        for <virtio-comment@lists.linux.dev>; Wed, 14 Aug 2024 07:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723647427; x=1724252227; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aK01X2n9UnnEWAe7yRRDN+mi4Xot7eoGhFG3q8Zqo88=;
        b=M3rld1JB00ws4DYqtBiZNZr67P1aK3Th7EXb7t+jbl486jnDznJ+gDVieTXXrkVU5F
         569yv0OnWlN0qW11F+aWnMT8qrdooIolQaXUmqMkXJsw5C680pGewYiBF84lYtv0M7GO
         bD/l9lFFpwThPgIF/ZkFSsooLQVo+eUe7o1CaUrQsRU49aoyLWKwyORvMgyySyN9wTYQ
         DsBi1ezkEob4PCbKl503IQq/HTnMLdEs9kj4LRcFRedSQbM+ndRMVdxFpA9ru72Vi7P9
         4YJ2DQlshrEts1oLNvSkhcYvrqE4986R4qXAqZ6HXRVI7DaJAzOw2tjN2iT4ucU8KZyI
         Nteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647427; x=1724252227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aK01X2n9UnnEWAe7yRRDN+mi4Xot7eoGhFG3q8Zqo88=;
        b=G3ZOakvEY6oFLsuLdSgNnhoZ0Skkm4C4JNnjfuGCAy5+/nQwfwDCErH3IxQ7u4I1cc
         TctE55uknj9o2puFEaRVyC8XGhCcpyddgD/ycq6Lhk/9sGmWewPZ16Yusyt/lMDhu+8p
         M7RLUiZ11nnyPXvWEV+T31ykELO4Fl9xaL8hT0LbgULNrgpgV2IcYZ0H9tpm4PaNMz4F
         jJt6jxk24PSSE5ATSa5ahXeq6LUOVE4+yn5qpOPWUum8yNmRIQdTsxmhjELRoGH//3KG
         f44ZfUv25g2VlcGM256JBWQAhfIs8r8Z4PqOAWemYQ2wPsuMK4tD43c0FR4vY5W80lYK
         8yHw==
X-Gm-Message-State: AOJu0YykLa9BHBwpaitSmCFqIgJBjm0vWBTnkCIBGNhFUJqzCandmkSw
	+Kxri5MOARJhNWATLyJzehrUTpz8D+OSvHN5q2qQHW8dMfRhBOWKB4/v4gpOtlLzUwyItx6anuZ
	0
X-Google-Smtp-Source: AGHT+IGzrXm+19dgaslZpmviMrfTx10OC4rzchrvPK432zxmcIn3vj5gS+Zq00oPRgBJWDGWakMX7w==
X-Received: by 2002:a17:902:ec83:b0:1ff:4d2a:fe43 with SMTP id d9443c01a7336-201d65c469amr33663245ad.61.1723647426963;
        Wed, 14 Aug 2024 07:57:06 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201ec160f56sm1446715ad.146.2024.08.14.07.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 07:57:06 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH V10] virtio-transport: Add a section to define mandatory transport requirements
Date: Wed, 14 Aug 2024 20:27:00 +0530
Message-Id: <4c24ede14e2545b2e9c69e7d9b79dc15744fd965.1723647318.git.viresh.kumar@linaro.org>
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
V9->V10:
- s/multiple// and s/employ/use/

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
 newtransport.tex | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)
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
index 000000000000..b3e0df42fa2d
--- /dev/null
+++ b/newtransport.tex
@@ -0,0 +1,43 @@
+\chapter{Creating New Transports}\label{sec:Creating New Transports}
+
+Devices and drivers utilize various transport methods to facilitate
+communication, such as PCI, MMIO, or Channel I/O. These transport
+methods determine aspects of the interaction between the device and the
+driver, including device discovery, capability exchange, interrupt
+handling, and data transfer. For instance, in a host/guest architecture,
+the host might expose a device to the guest via a virtual PCI bus, and
+the guest would use a PCI device driver to interface with the device.
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

