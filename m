Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE73217C8
	for <virtio-comment@lists.linux.dev>; Mon, 17 Jun 2024 01:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718589310; cv=none; b=rvr5EKPKrCcX47TD2iVdotVHlJ9PltqT1klqXiZRGotc8KqUOHM7AKX2IBcQk/aQNlJdhGbpPEwxuEhHMjJHKlKyfzuGtf9v6IxUunYRjJ3ugFhv9OfGRnT1abPJOPmXNmd7BLBafETvb+/qQax4OWI3xnI7mBlsX7JfzHespQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718589310; c=relaxed/simple;
	bh=sPbply+CnJKM7Ltrl0OEwF3u89Bssy2+aJGDbupa05Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fwMezv2IomsDQP2bxTqRwLhvBHQwi4NWLhn4VL6k/NYMq5/LQOm9yorU2UvxTlK3TGmd6tpVi/SFAKp/Nc6YILqWt3/m9S88fEBb7hWvVvE7mSKFfgQqROqkGERwRn/HJC/eFKx5EA4YPzV/cBGR3FChY1wvTspfdx8sAYZ0Ebs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQYe++yA; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQYe++yA"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-705b9a89e08so3438145b3a.1
        for <virtio-comment@lists.linux.dev>; Sun, 16 Jun 2024 18:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718589308; x=1719194108; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5sR2s8ZpCvO0YUM85sMDXYmp+laPOH2MbGccShhp2/4=;
        b=DQYe++yAKOpeUJxNdr/tPtO7nhRCzCXBKzmtIvmUGy5iYIf0rMMlEUS5Ia3UiBmPtk
         xujv6tn6yQOMBvzqu/mRtohfkocmc53R8Tjw4AFfp4W+9fsj+sMend7QsSLDNhFCb0pD
         V0YuB4kIP/rb0i2VHzQIhOqKFW1JgnkMOv4LuVhl5mwnMuZtWH9QXYpo2Uop2n60Oxod
         xAyi3WjYvKYAHVV++ja/rs8T1Fi5bfPJcXiDHaIvjSEpHttCG7/u4j5AKHRwOtySIvit
         QI2Dmq5zw2fsr6aAyFxtdeRn2hyXdQmcP+Gz5qJhFV9KaRNKhrHCNZbA4jCkVrAVSok9
         uwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718589308; x=1719194108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sR2s8ZpCvO0YUM85sMDXYmp+laPOH2MbGccShhp2/4=;
        b=IE/+jjO9LSwrZfHIEH9gIeke2aYUHTnMGxMSAUQItmkAcZ+pFVH/FjWLY/1TIefnf9
         h2teQ1HpfbGM7/dQbLEn9WsCMDoPM9nMWif4jzRALDF6qjBM2PMsUK02oegoWS77Med0
         5h8isGx89UTVnKdgSVnh97g8X1+12dARI7WWzy9E6YV0/B05nFmltI5rXpgFTGQYuq90
         eKTcSuS5sTK84tuPL3oppFacGgDo6ny75Qdi0DJwlgxpYqRTN3LqzQIIkApFMBgPDLQ/
         jQoYqnZc+J0Ep7TUNs6E7Mg2BeadihoMGJRHcH/Ed3V2hDAtrRUYqVltev+C5KP5HkpR
         THlw==
X-Gm-Message-State: AOJu0YypmaT/pU7rT0QP5I5NrFXMAF+S3G/wJqVa2K/+iiqNz/6NxqCj
	sWsjizf2mxTfV5zGyJGJL1FSQPTYpBXsu56v1lyTPL9VpQaQYbBkOREKwHk7FhKjDw==
X-Google-Smtp-Source: AGHT+IGFC6whKnUc5ndDGLsFZp/333E/H/9oE2t+CN5Na/MOTMwCz0InDvCIwZlYWBWGWj5Gnhl+5A==
X-Received: by 2002:a05:6a20:da84:b0:1b2:b135:8efe with SMTP id adf61e73a8af0-1bae7d9016emr9153767637.12.1718589307808;
        Sun, 16 Jun 2024 18:55:07 -0700 (PDT)
Received: from devant.hz.ali.com ([47.89.83.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f497a1sm69673835ad.283.2024.06.16.18.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 18:55:07 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com,
	mst@redhat.com,
	fupan.lfp@antgroup.com
Cc: virtio-comment@lists.linux.dev,
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: [RFC PATCH v3] virtio-vsock: Add support for multi devices
Date: Mon, 17 Jun 2024 09:54:46 +0800
Message-Id: <20240617015446.2723779-1-niuxuewei.nxw@antgroup.com>
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

Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
---
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
 device-types/vsock/description.tex | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
index 7d91d15..190f123 100644
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
 
@@ -77,11 +79,42 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
 \hline
 \end{tabular}
 
+The \field{index} field indicates index of a device, and is required for
+each device while the VIRTIO_VSOCK_F_MULTI_DEVICES feature has been
+negotiated. The size of the \field{index} is 16 bits which supports up to
+65,536 devices.
+
+The device with the lowest index is considered as the default device. Plus,
+it works fine with hot-plug and hot-unplug. When adding a device at runtime
+to be the default, assign it the lowest \field{index} without changing the
+configuration of the previous device.
+
+The device is responsible for populating the \field{index} field. The rules
+for \field{index} are:
+
+\begin{itemize}
+\item It doesn't have to be continuous. For instance, three devices with
+the \field{index} 1, 2 and 5 respectively are acceptable.
+
+\item It cannot have conflicts. For instance, three devices with the
+\field{index} 1, 1 and 5 respectively are prohibited.
+\end{itemize}
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
@@ -167,6 +200,11 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
 consists of a (cid, port number) tuple. The header fields used for this are
 \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
 
+In the case of sending packets from the guest to its peer, if the
+VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated and the
+\field{src_cid} isn't specified, the \field{src_cid} should be set to the
+CID of default device.
+
 Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
 for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
 
-- 
2.34.1

