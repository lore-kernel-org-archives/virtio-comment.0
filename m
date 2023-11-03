Return-Path: <virtio-comment-return-8140-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DD7C4167B
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 10:35:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3723874A02
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 10:35:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2225C986C92
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 10:35:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0B306986D89; Fri,  3 Nov 2023 10:35:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EEC35986C35
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 10:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="373962335"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="373962335"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="738043255"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="738043255"
From: Zhu Lingshan <lingshan.zhu@intel.com>
To: jasowang@redhat.com,
	mst@redhat.com,
	eperezma@redhat.com,
	cohuck@redhat.com,
	stefanha@redhat.com
Cc: virtio-comment@lists.oasis-open.org,
	parav@nvidia.com,
	Zhu Lingshan <lingshan.zhu@intel.com>
Date: Fri,  3 Nov 2023 18:34:37 +0800
Message-Id: <20231103103437.72784-7-lingshan.zhu@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231103103437.72784-1-lingshan.zhu@intel.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH V2 6/6] virtio-pci: implement dirty page tracking

This commit implements dirty page tracking facility in
PCI transport layer.

Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 transport-pci.tex | 72 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/transport-pci.tex b/transport-pci.tex
index 3161519..16209f4 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -188,6 +188,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
 #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
 /* Vendor-specific data */
 #define VIRTIO_PCI_CAP_VENDOR_CFG        9
+/* Memory Dirty Pages Tracker*/
+#define VIRTIO_PCI_CAP_MEMORY_TRACK_CFG  10
 \end{lstlisting}
 
         Any other value is reserved for future use.
@@ -1230,3 +1232,73 @@ \subsubsection{Driver Handling Interrupts}\label{sec:Virtio Transport Options /
         re-examine the configuration space to see what changed.
     \end{itemize}
 \end{itemize}
+
+\subsection{Memory Dirty Pages Tracker Capability}\label{sec:Virtio
+Transport Options / Virtio Over PCI Bus / PCI Device Layout /
+Memory Dirty Pages Tracker Capability}
+
+The Memory Dirty Pages Tracker facility is found at \field{bar} and \field{offset} in VIRTIO_PCI_CAP_MEMORY_TRACK_CFG capability.
+Its layout is shown below:
+
+\begin{lstlisting}
+struct virtio_pci_dity_page_track {
+        u8 enable;               /* Read-Write */
+        u8 gra_power;            /* Read-Write */
+        u8 reserved[2];
+        le32 {
+            pasid: 20;           /* Read-Write */
+            reserved: 12;
+        };
+        le64 bitmap_addr;        /* Read-Write */
+        le64 bitmap_length;      /* Read-Write */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{enable}]
+	The driver writes 1 to enable dirty pages tracking and sets 0 to disable.
+\item[\field{gra_power}]
+	The driver uses this to set the dirty pages tracking granularity.
+	Each bit in the bitmap covers page_size = 2\^{}(12 + gra_power) bytes,
+	so when gra_power == 0, 4K bytes page is default.
+\item[\field{pasid}]
+	Optionally, the driver uses this to assign a pasid to this capability.
+\item[\field{bitmap_addr}]
+	The driver use this to set the address of the bitmap which records the dirty pages
+	caused by the device.
+	Each bit in the bitmap represents one memory page, bit 0 in the bitmap
+	reprsents page 0 at address 0, bit 1 represents page 1, and so on in a linear manner.
+	When \field{enable} is set to 1 and the device writes to a memory page,
+	the device MUST set the corresponding bit to 1 which indicating the page is dirty.
+\item[\field{bitmap_length}]
+	The driver use this to set the length in bytes of the bitmap.
+\end{description}
+
+\devicenormative{\subsubsection}{Memory Dirty Pages Tracker Capability}{Virtio Transport Options / Virtio Over PCI Bus / Memory Dirty Pages Tracker Capability}
+
+The device MUST NOT set any bits beyond bitmap_length when reporting dirty pages.
+
+To prevent a read-modify-write procedure, if a memory page is dirty,
+optionally the device is permitted to set the entire byte, which encompasses the relevant bit, to 1.
+
+The device MAY increase \field{gra_power} to reduce \field{bitmap_length}.
+
+The device must ignore any writes to \field{pasid} if PASID Extended Capability is absent or
+the PASID functionality is disabled in PASID Extended Capability
+
+The bitmap which starts at \field{bitmap_addr} SHOULD not be considered
+as dirty when the device write to it.
+
+On a reset, the device MUST reset \field{pasid} and \field{enable}, and stop
+tracking dirty pages.
+
+\drivernormative{\subsubsection}{Memory Dirty Pages Tracker Capability}{Virtio Transport Options / Virtio Over PCI Bus / Memory Dirty Pages Tracker Capability}
+
+The driver is responsible to allocate the bitmap for tracking device dirty pages.
+
+Upon retrieving a cluster of bits from the bitmap, the driver MUST clear each of them by setting 0.
+
+The driver MUST configure \field{pasid} if PASID is enabled in PASID Extended Capability.
+
+The driver SHOULD NOT access \field{pasid} if PASID Extended Capability is absent or
+the PASID functionality is disabled in PASID Extended Capability.
-- 
2.35.3


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

