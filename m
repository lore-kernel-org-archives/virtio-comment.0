Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794361969;
	b=MmUsFJdajb82UpAFK4w2dpTOM2HB+YrbFIhuKkMyPPBFORqUtG+4qJiohM78CeXmxz8V
	 bLnwVTo/BGdOL/6ywDbgM0gb7iC/xUzWHKxTGM1ENMrNovSY4oNbuBXTS7oKvfJ+/Mykc
	 S2K100p86nrYwRmUjCnmeXief9voS3rzgcstm8OYSPYJ1QdwMFbDGyOC/JvJF86ZIdKhJ
	 QURzMUHdE7lHOe+F2cFth1zPy8tn0d2/MRzK2TLBL3GrPVOlBIeNcbHCK4uJlJHlykta3
	 bmX+Geyp2R6tzh+ddojW/VY19rkqM2MjQBbNIBV7W0DYtNlb2Z/mn0KSEbGKrX6LQUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=enqW5373U47U9sTJoj0YulnkarfvfQG9awrG0o1k8Z0=;
	b=SK9dGgEhuWUNhbplOucxbzRXHl/qeniZBZRQ3BaoRtSG2XTh0YycM+r27/5aUqM2RCPO
	 9pH24uv8TPab0uw0M3kJvq57M0QSSTHZBb0jolZAIya9lXpByLlc/WfgMm8ejt9Bgf3VU
	 oXHWpjNIWwRsCxDvpWQOkwJqpYUQIfTN4azbKQ4p6kF+Uv3SR7IKo1W3cZKysLvPLb4ns
	 KsmxjPTscu8YuwYEDEMQ3n57Z/zkKAeZlWA68i7UEmR9cV0THZG4xBKPh6zUuIPWbSIE3
	 +r3qZ7mfdegt++4VF9aLreszgYD7r7gxpTvt/Ff8ydMKp3ApR7MGcr0Ow/0TXymRToQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RmZxsRds;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6934606A324
	for <virtio-comment@lists.linux.dev>; Wed, 11 Nov 2026 01:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6934606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RmZxsRds
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15dd124bbe7so3744408c88.1
        for <virtio-comment@lists.linux.dev>; Tue, 10 Nov 2026 17:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794361968; x=1794966768; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=enqW5373U47U9sTJoj0YulnkarfvfQG9awrG0o1k8Z0=;
        b=RmZxsRdseSe/NPyU0pAmfEyQzYBDw6kD8SsBPnCFbnvkZE0V9I1UUXqAdFflHar9cr
         bjLxdBj2K0qxSHaLZpT39rdns7l2ZwtVq1LyVBjdC4U3+Ez1ANc30OjbTFvqaRJzzFR/
         p6/PQ0ZQbik1W3aCWOHSMaPfpTLx8zq9zQ755ynrStydgg+lrwiZoT6KqcKxrBHB/0tr
         LNwp/M8ILpNizmXKqF+lQFa8iK5qA+yK5jf5pJE+q99isihK48H1l7cp8wtKfcSM5ltS
         yWZe+Vl0H6eUuMshSDDd4+XaAnPlnacolebT73xEBS/MFXENcCnIFRMHDQ661pRG04Xb
         bzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794361968; x=1794966768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=enqW5373U47U9sTJoj0YulnkarfvfQG9awrG0o1k8Z0=;
        b=do0nEIsQP9rB2NK0ozYUwgLlmnrLvvKDk/NmPbFyRwoNkLUjKGBqM5WJkwtmo3UVK+
         J2pNAJAugPHneRVwNRSW2jiK4mQPLzNKCvDGGTTIP7POtmMCy2X6y4s1pu2LIedKeSu3
         vCw9hf/yNa5o08b3odigay0Y3gEaxCDdipo0gE1wFRK/DN1E05eCjXjEB3nBbCc3o/zR
         maKqZuEGCyUewQmN9lw80Xb5VbsxRNmIp4tVZ3hW5m2koCO4uTzV8nhIkhnOWnQryM0N
         /hMBKTBMiA9qmyKkiEn4XTolr5QzrGUyrKOiKSF6QcoKmGb+8jWI+C8re2aFrDPRM2Ve
         R5LQ==
X-Gm-Message-State: APuU4Z8V/3hfVpwBE3xjGgvFUryAT0Qg5H5YZ18Ol6gEsTJx+bWdnaBU
	Xq5esKD1gHCIRXjwy9uN9LLCeyFPToUpn1f/ytf52+qQG1R3L7CKLyANuj9YSA==
X-Gm-Gg: AYBFou3r53f6cJ8ddH9zakT+LJ9lgDRxHMLFJD4VfkRgNy7+WrFWUzxveeupIwMvReF
	j7UrkjMKjUWME44C2kHaAbWUAVOAug4fRXqgcWNlFja+sT2GIVSwP9Sd6u+JeWHOajqI7KMXcAG
	eGJuIgTp1vxSmo5hVRidAJyeLkSjaub68V9IWDaRrBnyBLBEJP+dbnzgOuqCHCnYfCet+1c2nZi
	8lrTowLaD62JBoyXeIIIViIM2sRBU8OfJ3Wgo4oOejXC9abJ6cPJwczqBwe9PUXHkvvzCqtywTW
	D90OAQm2SGZN3ZgwP/sxWTpJa6uC7hjRGf6OVlitXGYsHvdbIf4x1jQdQJWyH8XfarBlPB4p9gX
	t6//Jb84ZjzrJluBJYD4cGGemF8WdTPUd5+6enZQYMVoec53qIfdRF5MgGWCWxEMmOOYTSw27U8
	ByjUlXylrSIq6lY4zGUXUMfFLPuA+qiALsJKglC5een05UtM2yUXp87RzUJt+8++zmOkjdRIe65
	aFEUOAlC29ioVyMJHZQPrUqdlUDYiPCYFFZb3ZrSRCXs1JS61/VOcSJIg7M1fcNmeJqOxwJqVDG
	wTvMJdlaOElBYmwu1m8AfemaikkbKBMEUg6G0bs1svo8pJ0=
X-Received: by 2002:a05:701b:4587:b0:1b3:b6d3:b91c with SMTP id a92af1059eb24-1b3c02ec7b3mr890985c88.7.1794361967705;
        Tue, 10 Nov 2026 17:52:47 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe29fsm11892081eec.21.2026.11.10.17.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:52:46 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: virtio-comment@lists.linux.dev
Cc: alistair@alistair23.me,
	demiobenour@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2] transport-pci: Allow storing the configuration in the BAR
Date: Wed, 11 Nov 2026 11:52:37 +1000
Message-ID: <20261111015237.2595462-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
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
v2:
 - Add the VIRTIO_F_BAR_CONFIG feature bit

 content.tex       |  5 +++
 transport-pci.tex | 88 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/content.tex b/content.tex
index 243ce2d..0d428a9 100644
--- a/content.tex
+++ b/content.tex
@@ -854,6 +854,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
   and the \field{avail_event} fields as described in
 \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Used Buffer Notification Suppression}, \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Used Ring} and \ref{sec:Packed Virtqueues / Driver and Device Event Suppression}.
 
+  \item[VIRTIO_F_BAR_CONFIG(31)] This indicates that the Virtio Structure
+  Capabilities is stored in the memory BAR. See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Capabilities in a memory BAR}.
+  When this is set the driver must use the Capabilities in a memory BAR and
+  not the Capabilities in the config space. Attempting to use the config space
+  will result in the device reporting an error or failing to work.
 
   \item[VIRTIO_F_VERSION_1(32)] This indicates compliance with this
     specification, giving a simple way to detect legacy devices or drivers.
diff --git a/transport-pci.tex b/transport-pci.tex
index 95b08b8..a4ba0c2 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -262,6 +262,86 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
 fields provide the most significant 32 bits of a total 64 bit offset and
 length within the BAR specified by \field{cap.bar}.
 
+\subsubsection{Virtio Structure Capabilities in a memory BAR}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Capabilities in a memory BAR}
+
+Some devices, for example implementions using physical PCI endpoint
+controllers, are unable to add capabilities to the existing PCI capability
+list. This means they are unable to advertise the virtio structure
+capabilities as described above.
+
+When the capabilities are stored in the BAR, as defined below, the
+VIRTIO_F_BAR_CONFIG feature bit must be set.
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
@@ -270,6 +350,14 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
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
2.56.0

