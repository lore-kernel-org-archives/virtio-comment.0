Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19C144C97
	for <virtio-comment@lists.linux.dev>; Tue, 23 Jul 2024 13:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721739723; cv=none; b=IESPJufKHCqZ4zjNqSdFP56YcZIHcbYA4QovMhTA/CHPGJIa7M8RGT4u5emhfamA2W4Gb6Rb6A1giDUKZWUGPEsFbdr1LrrX/0GtbRlI/EA0GkHJ7jq8y3jK/O6WouRxES2kqhEfU1W2MlSdmAWWWRrNWboqeLvLEfXO/g9cKGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721739723; c=relaxed/simple;
	bh=L+vtu8qvq4xSxPvm99LHtF3Kuv+6ni5jasRQ19qoTbU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HZjr1407rEzDN5knjeiU1JKSBJPi0Diid8JXyvEOZhow9bblXqP5QbvjTsLwGlRfgnrm7jmpR5ImtPpoVwMQZS6Rdl2NHv9zMQwG7uRwPRQZdS4SB82hQbLEPf5WPk+aOrXQ5sgXnqG5J4JyjUmaM+xl8VjuWNnB/mI71M3E+LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOu8hq1U; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOu8hq1U"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fb53bfb6easo4525975ad.2
        for <virtio-comment@lists.linux.dev>; Tue, 23 Jul 2024 06:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721739721; x=1722344521; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CM0fWzzFH+YUvv6QbZtBNcNW1RZWEx/3Mv2vo9gcIXQ=;
        b=dOu8hq1UdgwvkbMejRx6wMQf4LuyqD9VWnnOr8QRkf1GGHup34YRUYuAuIjFSuGdbt
         okNgJk3ZeWGuo70MzA2dpddcJCxBhAS03ZGgXV8CcjBZSLVYjEERoTdg0Lvj3WrKBV8I
         1OQR6G9DWZxxVol7lCZlvtvyepKI1aXdKxrcVMsIDL4//58ifVfIcCwmpm5H7RuAeN/M
         6QkIlu/vmrE8wyrsrV22T/aLbX8lMMxyB0mT6RfJ6Qc8tFaXE86Szl+yOs5KTCzQTSuc
         tw3oLwM7Nr4DktIqQaT9LRZ/Zd33h2lv1LpC4IRWYVZAEAtEfkubRRel5vA5pjSAAeRI
         rF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721739721; x=1722344521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CM0fWzzFH+YUvv6QbZtBNcNW1RZWEx/3Mv2vo9gcIXQ=;
        b=DNmQYEm3SunN2dnOV0Yw2Z/HIgaHmP2Rd6U+V+dgd5/bV9a/T1pxde4cyi8W6HEP8g
         RVPS2FtX6w/cvURHbT0i9qBiU44FtXqkYNcOmf4S2RY700aRmfap0nUg6Yc6fOicLdna
         XJWc//6pllPCvOVMC2C2meHIG80VbWgkltMFiT5QfhRUXM5uIdIHn9YJoHCCDUf0fUnv
         lKp4X2wtk0o3Y3c6nZTZuuukE3sG/pS7ul3sd1rmTUTAAOqJ008KM9u5k2wOtocnt+C4
         pKArCTjA0XUWTdX/q781O/n7KwYb0OKZ6jXOnzycOSlszHCZ8+ZO/uYiSqUreFZBz1pi
         DkHg==
X-Gm-Message-State: AOJu0YyNsPfrcdj8n4Zsjgshh8s14rIK1nf43f/Py+dCsNs8BfysIp2t
	KMgUhqQ/cTEd+b9DX/t5GyQ4WETwgC+MSI3oFrFtIC2EvJvrEFCtvtV/dy/tlrBU8w==
X-Google-Smtp-Source: AGHT+IGvIOXrUeoY5lJgkXGsYca56Dx1AtVtTGLGr8ZFrEpBYaRQAvSLSlGlh9yG/0Gn6dZ0IkL/Jw==
X-Received: by 2002:a17:902:fa4b:b0:1f9:c3e4:4c0f with SMTP id d9443c01a7336-1fd74573c09mr60898055ad.34.1721739720640;
        Tue, 23 Jul 2024 06:02:00 -0700 (PDT)
Received: from devant.hz.ali.com ([47.89.83.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fda5a56e36sm33804425ad.174.2024.07.23.06.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:02:00 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com,
	mst@redhat.com,
	fupan.lfp@antgroup.com
Cc: virtio-comment@lists.linux.dev,
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: [RFC PATCH v4] virtio-vsock: Add support for multi devices
Date: Tue, 23 Jul 2024 21:00:59 +0800
Message-Id: <20240723130059.3123011-1-niuxuewei.nxw@antgroup.com>
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
"index" field to the config for the virtio vsock.

I've pushed a version of code for the implementation of multi devices to
lkml [1]. You might also refer to a google doc [2] for multi devices
details regarding motivation, implementation, use cases, etc.

[1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
[2] https://docs.google.com/document/d/14RUDEesi86EBZigVxxFsjxAl2OslPFplLyXMHiyDgYs/edit?usp=sharing

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
---
v4 -> v3:
- Add some explanations about the default device.
- Add a device normative section in the "Device configuration layout",
  which includes the rules for the "index" field.
- Revise descriptions of the default src_cid (thanks to Stefano).

v2 -> v3:
- Merge the two commits into one.
- Add some descriptions regarding the "index" field: the default device and
  the type.
- Add some descriptions about how multi devices are initialized in the
  Device Initialization.

v1 -> v2:
- Rename the feature to "VIRTIO_VSOCK_F_MULTI_DEVICES".
- Remove description from the relationship clarification.
- Remove implementation details from commit message and documentation.
- Rename the field from `order` to `index`.
- Rewrite the introduction about the `index` field.
- Add a case for sending message from the guest.
---
 device-types/vsock/description.tex | 45 ++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
index 7d91d15..5a10ae1 100644
--- a/device-types/vsock/description.tex
+++ b/device-types/vsock/description.tex
@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
 \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
 \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
 \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
+\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple devices.
 \end{description}
 
 \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
@@ -52,6 +53,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
 \begin{lstlisting}
 struct virtio_vsock_config {
 	le64 guest_cid;
+	le16 index;
 };
 \end{lstlisting}
 
@@ -77,11 +79,41 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
 \hline
 \end{tabular}
 
+The \field{index} field indicates index of a device, and is required for
+each device while the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been
+negotiated. The size of the \field{index} is 16 bits which supports up to
+65,536 devices.
+
+The device with the lowest index is considered as the default device. There
+was only one device before the multi-device feature was supported. When the
+multi-device feature is enabled (VIRTIO_VSOCK_F_MULTI_DEVICES has been
+negotiated), the default device can be thought of as the device. It is used
+to maintain compatibility with applications that are not yet ready to
+support this feature.
+
+\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
+
+The \field{index}es don't have to be continuous. For instance, three
+devices with \field{index} 1, 2 and 5 respectively are acceptable.
+
+The \field{index}es cannot have conflicts. For instance, three devices with
+\field{index} 1, 1 and 5 respectively are prohibited.
+
 \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
 
 \begin{enumerate}
 \item The guest's cid is read from \field{guest_cid}.
 
+\item Check for multi devices support:
+\begin{itemize}
+    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated,
+    the device's index will be read from \field{index}, and the driver will
+    allow multi devices.
+    \item If the VIRTIO_VSOCK_F_MULTI_DEVICES feature isn't negotiated, the
+    device's index will be ignored, and the driver will deny the second and
+    subsequent devices.
+\end{itemize}
+
 \item Buffers are added to the event virtqueue to receive events from the device.
 
 \item Buffers are added to the rx virtqueue to start receiving packets.
@@ -167,6 +199,11 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
 consists of a (cid, port number) tuple. The header fields used for this are
 \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
 
+When the driver supports multiple devices (feature
+VIRTIO_VSOCK_F_MULTI_DEVICES negotiated), if the transmitting socket is not
+bound to any specific address, then \field{src_cid} should be assigned with
+the CID of the default device.
+
 Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
 for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
 
@@ -233,8 +270,12 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
 
 \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
 
-The \field{guest_cid} configuration field MUST be used as the source CID when
-sending outgoing packets.
+The \field{guest_cid} configuration field of one device MUST be used as the
+source CID when sending outgoing packets. When the
+VIRTIO_VSOCK_F_MULTI_DEVICES feature is not negotiated, there is only one
+device. When this feature has been negotiated, either use the
+\field{guest_cid} of the device specified by the user, or use that of the
+default device.
 
 A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
 unknown \field{type} value.
-- 
2.34.1

