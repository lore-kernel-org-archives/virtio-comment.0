Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA2B189916
	for <virtio-comment@lists.linux.dev>; Thu, 24 Oct 2024 07:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729753717; cv=none; b=gPTfJjU/6iaMpFlE6Fzhf09B0EKvvC/6QL2/oJj7B0wrTH/FTXN/6k6q8ZkxBseSqBfWZo4qIiUkNZ/rhVWuKzfgVTkfA6tGy3ShEZUb+GQwDOm5MrEk0YaBIrmq95BEUSK+pglSpI523COh0e4h3+dh+lrQEl5gn6JYaoPXCuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729753717; c=relaxed/simple;
	bh=sWuntWCQe4jFuvauKLD8TunqjAaZz8TqAJ2xhqKIDC4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jpPinBmCf7fnxsOOj3sWALIizvkvGTSIN1UOKvkEiZU3r+HP4MSMZQO4cB9ANIgeDAjhKC2FetoOCajnVI/gm+B7N1nxpWHHq7j6pzH16fB10BlYnPlV9nLcuPXgedU+DtoPIRecYhgdat8LwM8NLCWL4xehdHAttaV9E7dYXf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNoHX2u7; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNoHX2u7"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20c693b68f5so5725695ad.1
        for <virtio-comment@lists.linux.dev>; Thu, 24 Oct 2024 00:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729753713; x=1730358513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rZF4P5noCdWxTy+/bYT3mLVzHB6H1wslGRcSlIw7JyY=;
        b=LNoHX2u7XyT7G/1kzUQqjlN7feDr2zHkyF9EJU4iMvrqbifsDOFDP/GJeLWYsURZYg
         Yx5IechbW+Vf2ZaVwIqUKISBzIIxsKrjIzzK8PTIMAaSc/GSj7zj8Iz2XvRcoI04wokY
         XuGK9vyv7oBY5RULNd7RDX3smN2qtODFb+pZ5DjqeytcVRhAnWEibw0Ry58BDhdvF018
         i4jbmC7I9j/Gnq0ordHKhhAj2MRK3yTd4Fcj8qq7PTVe5WDj0nyqU1IAd0RZdLl2ITgZ
         9+eLe3/vbJfb0dLV4bTF0g9Ya+5y4VxiH8I/RZva8DqELBVvSjPojpMKa4nPnsmRcvVE
         DZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729753713; x=1730358513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZF4P5noCdWxTy+/bYT3mLVzHB6H1wslGRcSlIw7JyY=;
        b=c9JvRAGuGYj7/qch54XCAlQstZuyidTzZ9v2y7zgQJpFAPmEN6/gR1KKIxmxXRXI/v
         8gHogRVPbiPbedHBlJlYPChumDQV2xLtyxSOIhhVI8/xtiGTawjftdduXl4CU4Vmp17J
         wSFz1ZOL03V5vV1yUmr+dhnKvjdqDWb81dZfmmedA9jPj5CdO/T490v7X6inZpzoo8TW
         zGghaCpPGuPhb7yWOXXSUJAOI+cbCAD5pUy+8/+Vunirw9j2RQ1+a7kn8d2gDjI/oxiR
         1IzWeFOK7hy0h0AhdYLCc5zaQ60HB7X310YTrUvOr6ruxjhE8uzEthsuAV3GFMO9Gqxf
         svXA==
X-Gm-Message-State: AOJu0Yxm8DW58kYbV5wc0o+PEQ4KJCpqHfBKr9EjofDBKp2AW58b/Mqw
	jlWpRUUvqS+NMiSn+dfdfxNY61iEfjBNeCMc5jPkROY7ijz8ltUL
X-Google-Smtp-Source: AGHT+IGM9wBiLUd+ZviZGM/T91IC2nD+8CQlURjs2blXqtLfM/NEq1b2rIddhv96rDjg5QKeJ0GQlw==
X-Received: by 2002:a17:902:e5c7:b0:20b:ab4b:5432 with SMTP id d9443c01a7336-20fa9deb4ecmr68804155ad.12.1729753713203;
        Thu, 24 Oct 2024 00:08:33 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f20casm66624155ad.252.2024.10.24.00.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 00:08:32 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com,
	mst@redhat.com,
	fupan.lfp@antgroup.com
Cc: virtio-comment@lists.linux.dev,
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: [PATCH v5] virtio-vsock: Add support for multi devices
Date: Thu, 24 Oct 2024 15:08:17 +0800
Message-Id: <20241024070817.1072626-1-niuxuewei.nxw@antgroup.com>
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

== Motivition ==

Vsock is a lightweight and widely used data exchange mechanism between host
and guest. Kata Containers, a secure container runtime, leverages the
capability to exchange control data between the shim and the kata-agent.

Currently, the virtio-vsock only supports one device, resulting in the
following limitations:

* Poor performance isolation: All vsock connections share the same
virtqueue. By the way, although multi-queues can solve this problem, they
do not conflict.
* Cannot enable more than one backend: Virtio-vsock, vhost-vsock, and
vhost-user-vsock cannot be enabled simultaneously on the transport.

We'd like to transfer networking data, based on TSI (Transparent Socket
Impersonation) technique, over vsock via the vhost-user protocol to reduce
overhead. However, by default, the vsock device is occupied by the
kata-agent, a control component for Kata Containers.

== Typical Usages ==

Assuming there are two virtio-vsock devices on the guest, with CIDs 3 and 4
respectively. And the device with CID 3 is default.

==== Guest -> Host ====

Use the device with CID 3.

```c
fd = socket(AF_VSOCK);
bind(fd, 3, -1);
connect(fd, 2, 1234);
n = write(fd, buffer);

// or use default (no bind)
fd = socket(AF_VSOCK);
connect(fd, 2, 1234);
n = write(fd, buffer);
```

Use the device with CID 4.

```c
fd = socket(AF_VSOCK);
bind(fd, 4, -1);
connect(fd, 2, 1234);
n = write(fd, buffer);
```

==== Host -> Guest ====

The usage is no changes in this case. Send to device with CID 3.

```c
fd = socket(AF_VSOCK);
connect(fd, 3, 1234);
n = write(fd, buffer);
```

Send to device with CID 4.

```c
fd = socket(AF_VSOCK);
connect(fd, 4, 1234);
n = write(fd, buffer);
```

I've pushed a version of code for the implementation of multi devices to
lkml [1].

[1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com

Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
---
 device-types/vsock/description.tex | 46 ++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
index 7d91d15..f2e663b 100644
--- a/device-types/vsock/description.tex
+++ b/device-types/vsock/description.tex
@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
 \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
 \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
 \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
+\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple socket devices are supported.
 \end{description}
 
 \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
@@ -34,6 +35,13 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
 VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
 VIRTIO_VSOCK_F_STREAM has also been negotiated.
 
+If a device without VIRTIO_VSOCK_F_MULTI_DEVICES has been registered, the
+driver SHOULD ignore all subsequent devices.
+
+If a device with VIRTIO_VSOCK_F_MULTI_DEVICES has been registered, the
+driver SHOULD accept other devices only if they expose
+VIRTIO_VSOCK_F_MULTI_DEVICES.
+
 \devicenormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
 
 The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature.
@@ -52,6 +60,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
 \begin{lstlisting}
 struct virtio_vsock_config {
 	le64 guest_cid;
+	le16 index;
 };
 \end{lstlisting}
 
@@ -77,11 +86,36 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
 \hline
 \end{tabular}
 
+The \field{index} field indicates index of a device, and is required for
+each device when VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated.
+The \field{index} is 16 bits in size, enabling support for up to 65,536
+devices.
+
+The source socket is allowed to not be bound to any CID. It is required for
+the driver to choose a CID for the socket. If VIRTIO_VSOCK_F_MULTI_DEVICES
+is not negotiated, the one and only device's CID is used. If
+VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the driver uses the default
+device's. In this case, the driver selects the device with the lowest index
+as the default.
+
+\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
+
+When VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the device MUST offer an
+\field{index}, which MUST NOT be same with the \field{index} of other
+devices.
+
+When VIRTIO_VSOCK_F_MULTI_DEVICES is not negotiated, the device SHOULD NOT
+offer an \field{index}.
+
 \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
 
 \begin{enumerate}
 \item The guest's cid is read from \field{guest_cid}.
 
+\item If VIRTIO_VSOCK_F_MULTI_DEVICES has been negotiated, the device's
+index will be read from \field{index}. If not, the device's index will
+be ignored.
+
 \item Buffers are added to the event virtqueue to receive events from the device.
 
 \item Buffers are added to the rx virtqueue to start receiving packets.
@@ -167,6 +201,10 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
 consists of a (cid, port number) tuple. The header fields used for this are
 \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
 
+If at least one device has negotiated VIRTIO_VSOCK_F_MULTI_DEVICES, and the
+source socket is not bound to any CID, then \field{src_cid} should be set
+to the default device's CID.
+
 Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
 for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
 
@@ -233,8 +271,12 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
 
 \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
 
-The \field{guest_cid} configuration field MUST be used as the source CID when
-sending outgoing packets.
+The \field{guest_cid} configuration field MUST be used as the source CID
+when sending outgoing packets.
+
+When VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the source CID MUST be one
+of the \field{guest_cid} configuration field of the multiple devices
+handled by the driver.
 
 A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
 unknown \field{type} value.
-- 
2.34.1

