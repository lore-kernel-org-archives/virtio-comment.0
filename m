Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E181B2E338E
	for <virtio-comment@lists.linux.dev>; Mon, 24 Mar 2025 06:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742798638; cv=none; b=S2rD0wz1YtBO6t+Kn+H06nO//gZ57goUxzg7eDYY6qGUiMLgGB2PKFBoGB64TqHvcQzZdLH9vFYnFFlQMFzCRXoNDyuguHdoZtMV3HD6/2gGPui/5jNBndjp/GHNoS5U99qXRA37enUe++r2jorL82OLsC9CejZq6JdCq9rhzOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742798638; c=relaxed/simple;
	bh=PKEOr99/0NLPPU05oZbhTIipa3A3uY44ldIMultmbbA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PGRvbEnwQ8pRpdXhxZP4C/ffzMR/wKdDB2H/uerzSwu2by7Y6fZ6uYnGRjnQt7/rkZNm4iOUG8itgx1B3jgdQZFxaJze/DK3MOBfIAq0cwH9veEuyUQLcvX77H38la3Kp0ieAziW2W6geAZnO1gmXECepXUJ26oszoPJNfXsAtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1q6b9/8; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1q6b9/8"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223fd89d036so72130745ad.1
        for <virtio-comment@lists.linux.dev>; Sun, 23 Mar 2025 23:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742798636; x=1743403436; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XBf59JOHXucq8Y6WFLH+kSJcn5oFds1kh97P0y5tbgA=;
        b=g1q6b9/8bEvFsIGn50mK66roNnmnbUn/zU/9oL+/F+MKGwPfFMnlgvAzZ8Mh0Dfd5X
         wRarUXrWw3K7QlOrTr47vbVmJD4ES1Nm3dG08CXW0p4yheZznZPB4u1cfM6j/kilTD1r
         Y9JOs7RWICEdfspCrzD+Vt8BhkEoD2w4zqgIaN5R9OmJzl8f3UDcYaw9HsljSEaKXsaz
         xiddbrCfyN/1E1rJwD1/KwloYmfyueRFTufjMYEJZUaWg4FqxKL9odpbT7yZmihCBzl9
         frU/p7rij5C6EWcNo7fs/639yrXiUv2qIdV01n/Hm3JKr8v+ua1K4K8P/EeT0aPHNSMs
         x70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742798636; x=1743403436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBf59JOHXucq8Y6WFLH+kSJcn5oFds1kh97P0y5tbgA=;
        b=SAg08EXQhK6ceH5yZU++dlXvm8hEs+RSruLw3wnV1Yo3FI2wWZmUHjPlDLH4IqXIG0
         jHEOgSTM5I7bopwVU4yOUP3vocmqichIBftGaiT4GPeyUkGZDS9tpjS+EUi6LTCGDncB
         OcAABpAF95LC8SEiFwgM+az6Hng0el0fBP3hhfMVXAVRscrQCIPcrUIOn/mtA58AsfWh
         lLfFAMQZepfOgrjrvQW/uGmSAgnOg5tYl65fA49XNnsc0SuVNTmwKo9APwShdOizEN87
         /rBw2ztGsmhJ3NG5IwbUdbPxxtLxdL+JW/3gWkojUDtOjqrOeEIz2af0EEkNAalfQtCg
         mPpQ==
X-Gm-Message-State: AOJu0Yy7SPghC9PprH7hNaHX2uKFzIP52uxmUjgN8IZj2/WR2ybgzzWJ
	TWSf76QedAJ+IzqVLyl9hMb+M3Qr2urNAf4rdSObsUea19IWpgx+
X-Gm-Gg: ASbGnculThmvx5g3YRiuzYZaQ2MmBNHD1cpwzgfCMI1bRKMuGDfueEsIK/OBE4jR7Mc
	MVgYU5TBmD2vDun9Iy9WAaKisZyAZ9nebmYaN2o/zoK60+lfxtWQCQPhmRfp6XnWAIliaJwhon4
	kRPjMOAdKOtNFwovcMgDsQsBJys93IutiQg8mmS7yTkIO4+9k8NVYDdpYryIeOUCkdc8mkk6xPd
	f9x9cbAsPv4xJN1cXwWnqzv1DnlPFWFtZasV9RHNwQI+/b6lwJyUM7wrObtphTw4yzJH9eTTnH7
	axHnMl9nFSKGc4lKKbXPBfP8VKPVglHzqIFiHY5NXiUhb5EubgH456nnyjOjcZEPRV8=
X-Google-Smtp-Source: AGHT+IGOmnxX64uqNotq4SYc6T5W/I2levZ0dgC6rKmX+wnMfm/Bx7RyrLHzYh57DVeRNyFc9AUqpg==
X-Received: by 2002:a17:902:ce08:b0:224:2175:b0cd with SMTP id d9443c01a7336-22780db3884mr202487535ad.26.1742798635783;
        Sun, 23 Mar 2025 23:43:55 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811b808bsm62740205ad.141.2025.03.23.23.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 23:43:55 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com,
	parav@nvidia.com,
	mst@redhat.com,
	fupan.lfp@antgroup.com
Cc: virtio-comment@lists.linux.dev,
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: [PATCH v6 RESEND] virtio-vsock: Add support for multi devices
Date: Mon, 24 Mar 2025 14:43:35 +0800
Message-Id: <20250324064335.1845722-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch brings a new feature, called "multi devices", to the virtio
vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
"device_order" field to the config for the virtio vsock.

== Motivition ==

Vsock is a lightweight and widely used data exchange mechanism between host
and guest. Currently, the virtio-vsock only supports one device, resulting
in the inability to enable more than one backend. For instance, two devices
are required: one to transfer data to the VMM via virtio-vsock, and another
to a user process via vhost-user-vsock.

Apart from that, a side gain is that theoretically the performance might be
improved since each device has its own queue. But it varies depending on
the implementation.

== Typical Usages ==

Assuming there are two virtio-vsock devices on the guest, with CIDs 3 and 4
respectively. And the device with CID 3 is default.

Connect to the host using the device with CID 3.

```c
// use default one (no bind)
fd = socket(AF_VSOCK);
connect(fd, 2, 1234);
n = write(fd, buffer);

// or bind explicitly
fd = socket(AF_VSOCK);
bind(fd, 3, -1);
connect(fd, 2, 1234);
n = write(fd, buffer);
```

Connect to the host using the device with CID 4.

```c
// must bind explicitly as the device with CID 4 is not default.
fd = socket(AF_VSOCK);
bind(fd, 4, -1);
connect(fd, 2, 1234);
n = write(fd, buffer);
```

The first version of multi-devices implementation is available at [1].

[1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com

Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
---
 device-types/vsock/description.tex | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
index 7d91d15..7d0cfe4 100644
--- a/device-types/vsock/description.tex
+++ b/device-types/vsock/description.tex
@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
 \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
 \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
 \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
+\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple devices feature is supported.
 \end{description}
 
 \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
@@ -34,6 +35,12 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
 VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
 VIRTIO_VSOCK_F_STREAM has also been negotiated.
 
+The driver SHOULD ignore devices that do not have
+VIRTIO_VSOCK_F_MULTI_DEVICES if the feature has been negotiated.
+
+The driver SHOULD ignore all subsequent devices if a device without
+VIRTIO_VSOCK_F_MULTI_DEVICES is present.
+
 \devicenormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
 
 The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature.
@@ -52,6 +59,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
 \begin{lstlisting}
 struct virtio_vsock_config {
 	le64 guest_cid;
+	le16 device_order;
 };
 \end{lstlisting}
 
@@ -77,11 +85,27 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
 \hline
 \end{tabular}
 
+The \field{device_order} is used to identify the default device. Up to
+65,535 devices can be supported due to the size.
+
+\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
+
+The device MUST provide a distinct \field{device_order} if
+VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated.
+
+\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
+
+The driver MUST treat the device with the lowest \field{device_order} as
+the default device.
+
 \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
 
 \begin{enumerate}
 \item The guest's cid is read from \field{guest_cid}.
 
+\item If VIRTIO_VSOCK_F_MULTI_DEVICES has been negotiated, the device's
+order will be read from \field{device_order}.
+
 \item Buffers are added to the event virtqueue to receive events from the device.
 
 \item Buffers are added to the rx virtqueue to start receiving packets.
@@ -233,8 +257,10 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
 
 \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
 
-The \field{guest_cid} configuration field MUST be used as the source CID when
-sending outgoing packets.
+If \field{src_cid} is missing in outgoing packets, the driver MUST assign
+one. If more than one device is present, the driver SHOULD use the default
+device's \field{guest_cid} configuration. Otherwise, the driver SHOULD use
+the \field{guest_cid} of the only available device.
 
 A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
 unknown \field{type} value.
-- 
2.34.1

