Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4422B1607AA
	for <virtio-comment@lists.linux.dev>; Tue, 13 Aug 2024 08:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723538596; cv=none; b=GYGeRhn7qnjXf6f0Kdh0FtbuLrmymnvZkGzpP8j9RnRpZk5KY0cWWBlLJ5uTEOwpjwonnmM7p/vFo613hLtvuHubxw355PjkEWhVp3spYqnNq9FxEVZAISOhxnnV7X+VaSrJbkot5Mc2UrNdZOfiZA/1XriyqAuThn3TAO4ToIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723538596; c=relaxed/simple;
	bh=H2RGuEf64zoN9H5ny+fdmZLSrAwFn8JHAZ/36uk/JvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ABxSZ9jCTmDeKnaaRSkKl2b6hGUfC07Un+jKCUp6JQ1qorFLYKKPvsAJiMOCFUX1UtnDv7S1trZ4I9iudIGX9gWlzA3i6Qc0sG2gnihisHIaaOfo703yHnehh8Jmo+vQi+dApJ57jSIjQX4Jp3JqT9PUenHqDof9GfTv2p+sIKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kck7WYFC; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kck7WYFC"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fd66cddd07so35439935ad.2
        for <virtio-comment@lists.linux.dev>; Tue, 13 Aug 2024 01:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723538594; x=1724143394; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vfzZiXysnlTINDpn8l3SyN6Ho8HVPTEcKuofhBdw5PQ=;
        b=Kck7WYFC/Z6xMzQj+CzAm8f+3ceVN8QcLrvLW6v57Nl/nJfotNKHj7TiekjTws54Th
         iftEFNje4IyynX0KjjcwZeaNcp5G1hTt50BfCXA7r6cgba3mLK18qsqn8pAMWF1quZR0
         /+32E+potriTxX9ee3ixhP+NzpBItS7r3wfC5/Um5jW1VagOUjPBsgPbSUDP+KuF91gf
         jwEeHJ7GTwxVH0jzUgfPMR3nhsO56qgfAYty5W5G0M+OY/NKWDQHTJMDE5mmATEoQr/S
         zHI7VXYlykh4plznT6BVxC5Yw+5J30M8LlztMIfxIvE7xs41EtuAiKmkLJe0Y67brvgD
         nYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723538594; x=1724143394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfzZiXysnlTINDpn8l3SyN6Ho8HVPTEcKuofhBdw5PQ=;
        b=s19K1yN4cYEWDwD0rukQsSkhJTdGSvz+HNZm2ieVJrztJebBRiCKz0gvlSqHMmM9IA
         XRfJHsR1faBDwSPxV2pyB3/LccfTEsqbV9cbyJW+uFdWXJHkLkf9TsJVUbhcmOXvKaLs
         3xoFmJ2KvFAqLV0Qg16+QBHLA6pl6ESI3Vj2Bme/sQn8/pB90BkldIc0iZruz73fyKHZ
         Zoy94lW+DQcky7DGJET5QnLl5RqK+C/DcrvSUdpIAoy9Sxl0RG/ABBlPVv1tLfa6yGPo
         xcCDh7eEmYTq5k4yBAkDI4u06/FG3wcnICzINXzGf4mcoEoHvvI/IMC2ANogZK1o1m2C
         YoLA==
X-Gm-Message-State: AOJu0Yz8guvSQLulHQqhS9vl9pOmU87J1vZhhqA5ABMUkFPM1IwLZ+a2
	kqKROVfTezqeTqI2aA6coV2kYrSvt1S+XLjD2IeGmN93JzHUImU7UECRY3uSx2M=
X-Google-Smtp-Source: AGHT+IG6+hXsP+7znelcMRY5rtjV7hw/bIjH1OhPhYx0cNAV+/TOT32yOu8Jqjic/MDj0+DKWsqI5A==
X-Received: by 2002:a17:902:e80a:b0:1fc:2e38:d3de with SMTP id d9443c01a7336-201ca120563mr27903345ad.7.1723538593806;
        Tue, 13 Aug 2024 01:43:13 -0700 (PDT)
Received: from devant.hz.ali.com ([47.89.83.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1a91c4sm8797495ad.125.2024.08.13.01.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 01:43:13 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com,
	mst@redhat.com,
	fupan.lfp@antgroup.com
Cc: virtio-comment@lists.linux.dev,
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: [RESEND PATCH v4] virtio-vsock: Add support for multi devices
Date: Tue, 13 Aug 2024 16:14:46 +0800
Message-Id: <20240813081446.2711296-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We’d like to transfer networking data, based on TSI (Transparent Socket
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

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
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

