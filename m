Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A041D1A256B
	for <virtio-comment@lists.linux.dev>; Wed, 12 Mar 2025 13:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741786106; cv=none; b=JciyiJObAHiL26mANnC8WA90lS5pZ2rh5BpMskxEavUlzxKvc0cF/kXnJt5VVENuW5RlNcNid8PBG5S+H63vuvXcxXDf8x+yciZ6s582Y+Bhsj9/lGgWnDn53/+Pno5WSAFwom/z9fVc9adSHpHU76P/xZPlQKggYaFxcQ2L5ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741786106; c=relaxed/simple;
	bh=PKEOr99/0NLPPU05oZbhTIipa3A3uY44ldIMultmbbA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WkU6xwxDGOu1M/gL4I56mC6sbqWkAXNY7ZupQKgN/7K7Qth52pXdPOZIq6Ew+IspJY7R+cWLHrJQpzbNpktb8Psx31fRAoel8yNLyu5dl/1D+29sXR/o1spIj+R4pRgUoNtmp9g/z7UI4koisXdiJYfIf5+jFdDfTz1BqRHna8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ot5vuGs5; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ot5vuGs5"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22580c9ee0aso49972675ad.2
        for <virtio-comment@lists.linux.dev>; Wed, 12 Mar 2025 06:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741786104; x=1742390904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XBf59JOHXucq8Y6WFLH+kSJcn5oFds1kh97P0y5tbgA=;
        b=Ot5vuGs5LBUDUQxtEAW3oE6DqXZdtrNIoAuUM90rLmpLfew9W9zdvTAsaAhvyf2xh2
         MzU7FoZnC/ukpPjALbLukgqn+nuFPUmL8+2i5KNGDdxJPOBf8SLbnnZU3k5GJasyqDS4
         hbyO4sQfj5C//Nss4SQeX0+xn4aKAaPPiwoq74uSS8vR/vb47mzOOjQ5NUKzqpmkNjLk
         4G9JsSkulhVOhGZFjF2Glm9IPCiMjf6mT2M5oOMXYDzi/vPluZYKfVfx4cJQRpjsZM02
         YelLb5xdAP2DwunQSsF/8yBuFwr2nGsUwWSDQU1DTZSKrwW2TZcxeAE+5R55Jj7sPzyj
         xZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741786104; x=1742390904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBf59JOHXucq8Y6WFLH+kSJcn5oFds1kh97P0y5tbgA=;
        b=gpCfn0vgbCevtX52DJDFC+qoCOnCh/09R2R5/WDsMm23rrXVhsZ2ktnv/ns1n7/8Tf
         EMfhewo1bUKkYXTYhWDjMLRlUcPjonkdQxvn2RJTcwci4K+utsk2xKtBZ3czqCjNHwkk
         K8oqzRuto3ItzutB/00MWEXdgIzlXL6yFyKdHdgFBsHk+h8VeZn3kduJyyyQq4Ylxhln
         qKVNoCFroTPRHxvJKb8GLqQ9BgrRYNh24Vy9UQkSB+AwNS2AJ11HGvUAQNc1LUcn81EI
         Jsn/uN9A4VSrp2mQKTTsrwebZ2qJUlZpsXn1M3JUr64EZ/hExKtBMQzxzUXl99mshFMV
         o0vw==
X-Gm-Message-State: AOJu0YywjAtITQzltXTcBichfLT3RcnYzgbUSt/YZG2tNJtXtolR/iU0
	oRBAw3rPuUe7RUItZT/0z/PGfnXkaJmwJs/XkSKDNJA0NBhy/hlIc5VhhC8NGJo=
X-Gm-Gg: ASbGncvFgAR6CvD9/YHo7aGqNaC0iDldTu63oQl04Esy0XMjQqRM+Uo1FyGCYIvIuGl
	iEeNC/uLOyR4Lo5lEpek4Yoh+ovJVEBO5DRyx/0aVEt3Rkr/SygQmwf6xaSk7LWRgTX9K04ZGug
	FEyO6gHqiDeLnQCvasSMwNEIr3nleO2wS/tZbFmVMgaRU/C2hrlYYv7Ub9v6dEzv+7qRzyFWEPs
	UvBAbaXLut2CgTBFij6M/gnm2gcm6a5d0FqKPW5l1yfId2yzlMc2VMuN4Vb8ArtNbdS3ZgKk5G9
	5U6fY6wBM2YykQ1DgZCmmVM9SoJ9GK6EM889H4mPn/7GUB2l2etyrUwZXFJSeMvJsls=
X-Google-Smtp-Source: AGHT+IGTN9ahbRfgYCGx+kF4lp9cGblHyXNboyq65ZWemTpsWVicwOkP0ncORuZjPoL1KdNaaZrMYg==
X-Received: by 2002:aa7:83d1:0:b0:736:4e0a:7e82 with SMTP id d2e1a72fcca58-736aa9f1f2cmr22823002b3a.10.1741786103559;
        Wed, 12 Mar 2025 06:28:23 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736982065dfsm12272116b3a.30.2025.03.12.06.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 06:28:23 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com,
	parav@nvidia.com,
	mst@redhat.com,
	fupan.lfp@antgroup.com
Cc: virtio-comment@lists.linux.dev,
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: [PATCH v6] virtio-vsock: Add support for multi devices
Date: Wed, 12 Mar 2025 21:28:03 +0800
Message-Id: <20250312132803.1414748-1-niuxuewei.nxw@antgroup.com>
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

