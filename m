Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464CE29BD91
	for <virtio-comment@lists.linux.dev>; Fri,  2 Oct 2026 01:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790903113; cv=none; b=cGaCNGbCExg5jJOjJ1i3WQnr1/AFlqklNWjYwXpAGsAXhYIzMX0BsQ2pZgpVOl2yQLMPu3mQHrkRAkR/h1LZg98TTPGycMytc31wGcMlW0hUyo2bINtLsiLtLUfoQcYjdk2tN2U+E0WkkUxmEqBpJku+z/k2ugtlq/ScFIJhno0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790903113; c=relaxed/simple;
	bh=uF4qcz7sAr6HPppKIzlJFHVi2MLutiZXCHYa3c7j2BM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q1J11q8yEBA/6aLgWE46Ge0KgU61yypRXtgj7M4F5ifenrM6bGINRntsd8DUAINc8vOkWzwde6464iLHA/dphvySJ1zdJ41EePnCKrGab2hl66ldpB7qPzqn6cCmo5rk7cbSbdCVEuI3ib/xxtQ/XiRGPsh+DQ//37uvT8eXIWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxBIIEpR; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxBIIEpR"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4c276e1c7so1318512a91.0
        for <virtio-comment@lists.linux.dev>; Thu, 01 Oct 2026 18:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790903110; x=1791507910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dr4S8joUK3UXdTdqFFtRNGKcooe/r7mkEzML0QBYYos=;
        b=OxBIIEpRAts3FTIjZ2vWm0Cuv5aMUqxxG0gAmWCVCXHCCcRVIuJJSHK03d3RkXo/Zg
         bzJD3xo4+utD6qY0NXSm6p3FqTfgOwItEU36oSz/GFjFjDvRX3QcY8Y+Brh40HeU2Bqk
         EaLgQy753uPZl9ZTRDznOtchKNo5whhARL4fHvBpMRwmMieTz0v6t1kUyn5ioqOpOqNX
         m5sBK6y9CGFzNFrm6+mAYwiAkKe1CWz9jseVSm7l/RFMdAIDLpVEStKJ9oqDqxow38RW
         uU8nIQkjgOKOQxqZp2lI73k6onYXrb2LoagLErfGtkKyWOat+4Oxpp1+rEUWrur5PWm8
         kFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790903110; x=1791507910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dr4S8joUK3UXdTdqFFtRNGKcooe/r7mkEzML0QBYYos=;
        b=XkaVEO5hTKCTAckbM0RtYhxvC0qDCAk+AejRrJsPwqX6V4ETcJWVl+623OvzyGp3zQ
         UT0Ovf1gTJqXYGMQQ3WpceMhkDU5o7AhrH8MN0HPvTIK5CjRIU7qPcNEzd/JblposXhJ
         9fXFU6kU061gtVDWhGs9jfHX+DbmYcczXLeyKf5K3CRpwW89BZgFfAx5wafKINUXFFLq
         G4ZZhorFyRoNjTU7eNws/84urNvXkJS3XL+h2zANN6CDUJeIOJD76UEfx3PBoO8LXxdQ
         x+dWejo6dZOA0+ABISqwBBpq6KQ9EkQrOr3NxB6fxWLQ3Hk4alYyQUzpGXcWIjlv7xzp
         JQAg==
X-Gm-Message-State: AFq9FYKqMjFIBXaVuc/Y72vz1SV9Purw6sAn9IJbE+4KMCWEqTEhIASy
	8GM/YTJBnpo22yRXPT8QrYv6PhyX2tcrBEN70UAURWjX5tJ/k7NZU64CYWdXuA==
X-Gm-Gg: AYBFou2UhuYCYSrRuCOwIVKNobwaTKsJbSz2C8hxTFxVFAZ5SlXDr2ycmSJk0OdGbVb
	fg15TWAzkRS12DL3CbYNquYqZxqZAlTRspITL2xIYJsWCjHBMTP+DmdoE+Gzd9W90rOLAk1AjHp
	zCB/dTJltWahjZvbNnSrT8Ct/XXEAuWQkkUijra6iP78nhtMrONCvNC03E1r9ra5W1VH614Tw6n
	NVBFWu0mMhasf/y1wHrFSitnuF4ZW0bNI6Xx0v/e+99nwzcq4moxxbCWAEWVa1xO4NbgB4Om4K4
	iFVNiQBWnC3BKS+xwhKn84c84ElrsmVFvZbSyJikE9CXuGZTomArRbEEAKLFJvlbuBUNWsR808A
	/EfLs049lkLUhBVtyE5rfwooCb1r1BaFCF09q2Z8aYjuB/dRAwFXphCvNtqADAfHZNahy7TdzDS
	tkhJsr0nRd0mzJN498EoyBlavllryqPaLu/qFCyVKEPp5NuwRGVb/70OnhC3N6qbGgWEZlDWaxH
	lMViiwLzudTEjUq
X-Received: by 2002:a17:90b:5824:b0:3a4:d2bf:2049 with SMTP id 98e67ed59e1d1-3a6ce97986fmr506841a91.60.1790903110375;
        Thu, 01 Oct 2026 18:05:10 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f471b16asm6699990a91.9.2026.10.01.18.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 18:05:09 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: virtio-comment@lists.linux.dev
Cc: alistair@alistair23.me,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] transport-pci: Allow storing the configuration in the BAR
Date: Fri,  2 Oct 2026 11:04:56 +1000
Message-ID: <20261002010456.2053759-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Most physical PCI endpoint capable PCIe controllers do not allow modifying the
capability list, and thus are unable to advertise the Common configuration
capability.

This results in physical PCIe endpoints implementing virtio-pci falling
back to the legacy interface and then needing hacks to deal with DMA
issues [1].

One solution to this is to allow the device to store the configuration
data in the BAR [2]. This can be used as a fallback mechanism so we
don't break any existing setups. New drivers and devices can attempt
to read the configuration from the capabilities first and then fallback
to the BAR.

We also need to add a go_busy field so that the driver and device have a
basic message box to communicate. This is required for
device_feature_select for example.

1: https://lkml.org/lkml/2026/9/1/185
2: https://lkml.org/lkml/2026/9/1/2370

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 transport-pci.tex | 85 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/transport-pci.tex b/transport-pci.tex
index 95b08b8..7d09169 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -262,6 +262,83 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
 fields provide the most significant 32 bits of a total 64 bit offset and
 length within the BAR specified by \field{cap.bar}.
 
+\subsubsection{Virtio Structure Capabilities in a memory BAR}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Capabilities in a memory BAR}
+
+Some devices, for example implementions using physical PCI endpoint
+controllers, are unable to add capabilities to the existing PCI capability
+list. This means they are unable to advertise the virtio structure
+capabilities as described above.
+
+In this case a device MAY instead publish the same capability structures in
+one of its memory BARs, at offset VIRTIO_PCI_CAP_BAR_OFFSET (0), prefixed by
+the following header:
+
+\begin{lstlisting}
+#define VIRTIO_PCI_CAP_BAR_OFFSET 0
+#define VIRTIO_PCI_CAP_BAR_MAGIC  0x74726976 /* "virt" */
+#define VIRTIO_PCI_CAP_BAR_VERSION_ONE  1
+
+struct virtio_pci_bar_cap_hdr {
+        le32 magic;             /* VIRTIO_PCI_CAP_BAR_MAGIC */
+        u8 hdr_ver;             /* Version of this header */
+        u8 num_caps;            /* Number of capability entries that follow */
+        u8 go_busy;             /* Indicates to start an operation and when it's ongoing */
+        u8 padding[1];
+};
+\end{lstlisting}
+
+The fields are interpreted as follows:
+
+\begin{description}
+\item[\field{magic}]
+        Magic value that identifies the presence of capabilities in this BAR.
+        Must be set to VIRTIO_PCI_CAP_BAR_MAGIC.
+
+\item[\field{hdr_ver}]
+        The version of this header (virtio_pci_bar_cap_hdr), currently
+        only version VIRTIO_PCI_CAP_BAR_VERSION_ONE is supported.
+
+\item[\field{num_caps}]
+        The number of struct virtio_pci_cap entries that follow this header.
+
+\item[\field{go_busy}]
+        The driver writes VIRTIO_PCI_CAP_BAR_VERSION_ONE to this field to indicate
+        that the device should take action. The device is considered busy until
+        the driver reads this as 0.
+\end{description}
+
+The header is followed by \field{num_caps} struct virtio_pci_cap entries
+(see \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / Virtio Structure PCI Capabilities}),
+the first of which begins immediately after struct
+virtio_pci_bar_cap_hdr.
+
+The entries are packed one immediately after another. Each entry is interpreted
+the same as if they are in configuration space and locate the
+corresponding structure within a memory BAR.
+
+Note that the \field{cap_vndr} and \field{cap_next} fields are not used in
+this case.
+
+For read-write communication with the device, for example \field{device_feature_select},
+the driver should set the value of the field then write the header version to
+\field{go_busy}. This indicates to the device that an action is required.
+
+The device will then read the fields, take action according to the sections above
+and when complete clear the \field{go_busy}. The driver MUST NOT read or write
+other fields until \field{go_busy} has been cleared by the device.
+
+Note the driver can write to multiple fields before triggering \field{go_busy}. The
+device MUST then take all actions before clearing \field{go_busy}.
+
+A device that publishes capabilities in a memory BAR MUST place struct
+virtio_pci_bar_cap_hdr at offset VIRTIO_PCI_CAP_BAR_OFFSET within a memory
+BAR.
+
+A device MUST follow struct virtio_pci_bar_cap_hdr with \field{num_caps} struct virtio_pci_cap entries.
+
+The device MUST provide the same capabilities it usually would, just in the memory
+BAR.
+
 \drivernormative{\subsubsection}{Virtio Structure PCI Capabilities}{Virtio Transport Options / Virtio Over PCI Bus / Virtio Structure PCI Capabilities}
 
 The driver MUST ignore any vendor-specific capability structure which has
@@ -270,6 +347,14 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
 The driver SHOULD use the first instance of each virtio structure type they can
 support.
 
+The driver SHOULD first attempt to use the virtio structure capabilities in
+the PCI configuration space. If no common configuration capability is
+present, the driver MAY scan each memory BAR at offset
+VIRTIO_PCI_CAP_BAR_OFFSET for a struct virtio_pci_bar_cap_hdr whose
+\field{magic} equals VIRTIO_PCI_CAP_BAR_MAGIC. If found, use the
+capability entries published there as described in
+\ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Capabilities in a memory BAR}.
+
 The driver MUST accept a \field{cap_len} value which is larger than specified here.
 
 The driver MUST ignore any vendor-specific capability structure which has
-- 
2.55.0

