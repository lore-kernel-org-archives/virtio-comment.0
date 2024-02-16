Return-Path: <virtio-comment-return-9115-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57BBC48260
	for <virtio-comment@archiver.kernel.org>; Fri, 16 Feb 2024 08:25:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 548C42AC4E
	for <virtio-comment@archiver.kernel.org>; Fri, 16 Feb 2024 08:25:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 40C1F986661
	for <virtio-comment@archiver.kernel.org>; Fri, 16 Feb 2024 08:25:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 32F3C9865F9; Fri, 16 Feb 2024 08:25:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 24C919865FD
	for <virtio-comment@lists.oasis-open.org>; Fri, 16 Feb 2024 08:25:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708071901; x=1708676701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+51CgnaRtpPCaYklKgLUUzBz+AwUc5MjO3vRL9Q9bQU=;
        b=o4uBeXtK7mPhyZaoNJJeWOHAPv7EvIsKPxmgLV+GXU3/YK1cGMewSmvBV5Eutqm5qK
         rDCeLOgFKwahbmipB+68duIsfIacDVMS6Ht9chPQMH0xR9CbFnfWt0ytcO/rph4C4cEe
         zllptD4JfKuoNrouWvYscHOQ++AoKEpRhZFZi8zjmTGdLYIhXMZqV27sDL9STr21OxZj
         TRv2iBX9VpIA7pXE5U9rpm1Ow0qyIy4ntpqMOEgRTJNp25lhsRCpIReeAbmC8UlKo8CI
         SpMEUyGilu54i0Y921wLzfdD01zz6l2/4Xq2VXBJTMNLOmndnnY+6WH43XRkjjbgGgNo
         emNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSATHJqN9XNztMt0pvn5vlUulB11D/zIZP66JHHMYMQCaNP5CMgcDW19YNGzs6xZM9AmjHZ1sVXbagk1x3PSrXNqiCj6+C/MkjIb6KB0m/PLHcpA==
X-Gm-Message-State: AOJu0Yya9xGgwWNiknl6uopnxQrSKXR7f9gJ32hUmRVsyuiIufcDeXZk
	WvKqesQ+IK0cCXP+svM7eukcnqFTk7MSiitjpm9530G3A6sUlSp6pc8l36f1zQ==
X-Google-Smtp-Source: AGHT+IHHmfsjHAugTV+iX4Gi329U+waKVUIpxQRjecz7fn6DTvJJj/lM8nCgbUlFXRPpFgNJaNPlGg==
X-Received: by 2002:a17:90a:cb87:b0:298:dde2:cce with SMTP id a7-20020a17090acb8700b00298dde20ccemr3879246pju.40.1708071901505;
        Fri, 16 Feb 2024 00:25:01 -0800 (PST)
From: David Stevens <stevensd@chromium.org>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org
Cc: parav@nvidia.com,
	David Stevens <stevensd@chromium.org>
Date: Fri, 16 Feb 2024 17:24:32 +0900
Message-ID: <20240216082432.709956-2-stevensd@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240216082432.709956-1-stevensd@chromium.org>
References: <20240216082432.709956-1-stevensd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v4 1/1] Add suspend support for virtio PCI devices

Add a virtio power management PCI capability to allow drivers to suspend
virtio PCI devices. This allows drivers to suspend devices at the virtio
level before suspending them at the PCI transport layer. This allows
drivers to do a two phase suspend, which prevents notifications from
being ignored or lost if interrupts are reconfigured at the PCI
transport layer immediately before or after the device is put into the
PCI PM D3 low power state.
---
 transport-pci.tex | 51 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/transport-pci.tex b/transport-pci.tex
index a5c6719ea871..ce77708a9b69 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -188,6 +188,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
 #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
 /* Vendor-specific data */
 #define VIRTIO_PCI_CAP_VENDOR_CFG        9
+/* Power management configuration */
+#define VIRTIO_PCI_CAP_PM_CFG            10
 \end{lstlisting}
 
         Any other value is reserved for future use.
@@ -804,6 +806,55 @@ \subsubsection{PCI configuration access capability}\label{sec:Virtio Transport O
 specified by some other Virtio Structure PCI Capability
 of type other than \field{VIRTIO_PCI_CAP_PCI_CFG}.
 
+\subsubsection{Power management capability}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Power management capability}
+
+The VIRTIO_PCI_CAP_PM_CFG capability refers to a single byte. The
+driver can write to the byte to set the power state of the device,
+and it can read from the byte to get the current power state of the
+device.
+
+The valid power states are:
+
+\begin{lstlisting}
+/* Device is operating normally */
+#define VIRTIO_PM_STATE_ACTIVE    0
+/* Device operation is suspended */
+#define VIRTIO_PM_STATE_SUSPENDED 1
+\end{lstlisting}
+
+The device power state has no effect when \field{device status} does
+not have the DRIVER_OK bit set or does have the DEVICE_NEEDS_RESET bit
+set.
+
+\devicenormative{\paragraph}{Power management capability}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Power management capability}
+
+A device MUST maintain its state while suspended such that all driver
+visible state after resuming exactly matches driver visible state
+before suspending.
+
+A device MUST NOT send notifications while suspended.
+
+A device MAY operate on any buffers in its virtqueue while suspended.
+
+A device MUST set its power state to VIRTIO_PM_STATE_ACTIVE on reset.
+
+A device SHOULD take steps to minimize its resource consumption while
+suspended, although what this involves is specific to the particular
+device implementation.
+
+\drivernormative{\paragraph}{Power management capability}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Power management capability}
+
+A driver MUST NOT access a suspended device's BARs corresponding to
+any virtio structures, except for the power management byte.
+
+A driver MAY suspend a device that has buffers in one of its
+virtqueues, but it MUST NOT modify any such buffers while the device
+is suspended.
+
+A driver MUST read from the power management byte after writing to the
+byte to verify that the device successfully entered the target power
+state.
+
 \subsubsection{Legacy Interfaces: A Note on PCI Device Layout}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Legacy Interfaces: A Note on PCI Device Layout}
 
 Transitional devices MUST present part of configuration
-- 
2.44.0.rc0.258.g7320e95886-goog


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

