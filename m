Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23041FDD
	for <virtio-comment@lists.linux.dev>; Sat, 12 Apr 2025 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744468124; cv=none; b=fIxomw/gsQH9zE3xJMPBPPwWjYstnSrf8b/D0wzBFRNPO+Nx8YZ5ouF1GIPygtiyrpr0B3kCTkEpTWEQyHiAOJ4NqDQdZYH3I+2XGuwkpoHUFiBUxFZluDoJ3QKLblHTHrB5lTFisJjiXLJcjeJQP4E4BnH/zjcgQEfO+SUiU3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744468124; c=relaxed/simple;
	bh=5OuES447EXMcuIjBu1e3SOIwMWhzsHu7936x8ZyoeQY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IdqVp17CAko2KRlslcsQ4ZtMAnfWMT1Q1Twwejsec1UUVYAMvAAkeciyJaRepqtDU2wqjwZ2C3HN9bZTXBIeW/yxDnqnQWcLDG364Fu611ZLtP8qJoeoEgz9Nv1yr6HwditOhKE+O0lwxrHPlKZ+5rvD18Gq7Bl7X+oiqaVRdR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWV0Snqh; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWV0Snqh"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7376dd56f60so2062135b3a.3
        for <virtio-comment@lists.linux.dev>; Sat, 12 Apr 2025 07:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744468119; x=1745072919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zuvF9Il95kkLYKVG84R3+ZV15xcWrTKXnRtD3Nr+3VQ=;
        b=eWV0Snqhcitjkm2ffE6rMDxAgJUTabBx9oxZTnyfA3qRD+YkznUd1jCU6iNST+akUN
         qtuDXp5BXxO3uOLfwSqJ2XPyRngknjDDXSsX8eDDtwHA8M9I2NpXjY/jXiKCrlK1FXTe
         h88x68f+sQx5tq/oGzCufxQ/lFR+lh6Ax6batWJXMj5JSTlVi7TKznHCfbAS4gQiFwKB
         jH/oqa6uPvafoFqwme21rB/OHJV+jVQE2m8YUPLuLxojfS10rqTo/zrHPQWQZBhA+0AU
         oVRztWRzO70P0A8uRTaTcBYcGZysK7T0pPf9kkhD4+xtIHtJwWUKxK4KO8a+sZ+FhF+O
         jvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744468119; x=1745072919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuvF9Il95kkLYKVG84R3+ZV15xcWrTKXnRtD3Nr+3VQ=;
        b=lJS9G8L1pJ49GMU7t49YaPft3euesrqxSHR8o5hv7wLC1xURnmbK4TrPhINVwCfWDa
         GgGKV97xzS4yO4RWJBJZRds1TZ/Q7B8iCi5iJLA7hllJIxkHdPnQjzwZG3P8j3AKx0ET
         trg5/wn3Cdr07WxXCEWRVRD/FsUcfgw5UjIx3ABIDFSzSThaNTXW68xgkY+603CYYNma
         I7pJUlcbkNmEnes/cIidNMTTOCm/tKTFLm+Yv/WCh0q0wgXlLF5gpNTSQU8M9PWkewPE
         yhn4l9xQ31LNmrNML1DQUbcDP9dX+P31cZ1E/2P9LJ4mkefYRFjqTsEfsIf4Eq7cjBWY
         ByUg==
X-Gm-Message-State: AOJu0YwyDZyWiX+Wgj6KfiZUQMApn5B0yEWo+90irrO6wgEVqM7aepyT
	cfuIEcu+OuhX4v2rmn8O0kavqnNtTako8TJDwzMu4wBf4F4wVGMR
X-Gm-Gg: ASbGncu0CMmEKWAnmsifjUoyUFKdONeSnHJRDskpuERG5yRu/xTJNGDgUvWoSaucjxD
	iPWSh9069E+X0P1W3MtMgwTuY54OTNZphGb3KbFJq24aEKbkjhM/6cHg4p2kRJqFD3DAiU6ml1y
	8gT90WmuYDMjQH83uyyp/S8e2hH15iu12227+b9PicB/4bdbC83dgIJ8XnD6IutftGFPW9giigX
	S2mrcZx2+trpfDfwW5iebSv7G+hIBdg4qEGounOVy7RvkYbAI61ZzPDcXhXFAreQpB5JOiodwAM
	FvPnS5adtyRMFYfCiy4QVIUtkFvBnrAJDjGqDCB1SnvCZnK9PxuVjF/lYzhhzKI7k9qgx/PfUA=
	=
X-Google-Smtp-Source: AGHT+IEHlooYxsuzDrYqrI5jTZwuWJjX/KCMaFQZA8eHHIUXfFJDcR/sUXpU6bGfCGb0hWIo3Q7rKQ==
X-Received: by 2002:a17:90b:2f08:b0:2ee:44ec:e524 with SMTP id 98e67ed59e1d1-30823783bc7mr8570602a91.35.1744468119237;
        Sat, 12 Apr 2025 07:28:39 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb5c5sm68273335ad.222.2025.04.12.07.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 07:28:38 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com,
	parav@nvidia.com,
	mst@redhat.com,
	fupan.lfp@antgroup.com
Cc: virtio-comment@lists.linux.dev,
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: [PATCH v7] virtio-vsock: Add support for multi devices
Date: Sat, 12 Apr 2025 22:28:25 +0800
Message-Id: <20250412142825.3180245-1-niuxuewei.nxw@antgroup.com>
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

v6 -> v7:
- Addresses minor review comments from Stefano.

[1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com

Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
---
 device-types/vsock/description.tex | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
index 7d91d15..392dc76 100644
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
+If the source socket is not bound to any source CID, the driver MUST assign
+one. If more than one device is present, the driver SHOULD use the default
+device's \field{guest_cid} configuration. Otherwise, the driver SHOULD use
+the \field{guest_cid} of the only available device.
 
 A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
 unknown \field{type} value.
-- 
2.34.1

