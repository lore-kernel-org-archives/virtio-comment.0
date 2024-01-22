Return-Path: <virtio-comment-return-8992-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF20DC47DAF
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 898791FF6A
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 660FA9867EC
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5608F9867BF; Mon, 22 Jan 2024 17:21:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 398C39866C3
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 Jan 2024 17:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944091; x=1706548891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCiEAn8RKxm/LVr/WGVyeX1Gjv5TfE+1DjtBNHczHE4=;
        b=TbG5t+39bHRWwyUH6FLeElUWNLVVsbOf1UKepfQYzw3ABl5grqEnqzS/4rrl98DmjM
         bpFO1SNoIWpR6mdQVqAJioz5hsTXJ0eN197W+4f5a07baMH0vqwQxv8tMeYdZxELVtt+
         k4XzNUC7ArbSAuvWnXfD9Gp6bz59YHiP5G+/cZGPulphvNT1LOgWpEBXCN+U1m+a7h96
         Jp3XHVW6qo7r3P4jpwgc0maObQCdC5X1enpyUaNpk+pePvDlNZcf5WEow/GGdKhevMq4
         oOwQuIz8PtKipd+nI8PALfGF8B3GQ2n5ZPE3bHTl9VjD4URA3w4zC9pB5ty7w+BlQxgg
         uLBg==
X-Gm-Message-State: AOJu0YxSSz1tGqvMZooDJSHiukpJ4Okri0inGjPyJho8wMJqx25gW4CU
	TO7zRJKO9IX5slRhqwRCoj0NYSJTINvaTLvJLIOSdsNzqsE8QPI2WLSavbBj4lAr1hX9fa9+T7B
	X
X-Google-Smtp-Source: AGHT+IGf6etBsxnmGI8Nai4XS0PCQzY3dDAOh3gr9TLQBkwJOWAzVLJnD9/44YrHjhilunkHWdingw==
X-Received: by 2002:a05:600c:3aca:b0:40e:a3aa:a463 with SMTP id d10-20020a05600c3aca00b0040ea3aaa463mr2589672wms.20.1705944090898;
        Mon, 22 Jan 2024 09:21:30 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: virtio-comment@lists.oasis-open.org
Cc: vivek.gautam@arm.com,
	tina.zhang@intel.com,
	seb@rivosinc.com,
	sameo@rivosinc.com,
	eric.auger@redhat.com,
	kevin.tian@intel.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Date: Mon, 22 Jan 2024 17:14:40 +0000
Message-ID: <20240122171442.1740297-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122171442.1740297-2-jean-philippe@linaro.org>
References: <20240122171442.1740297-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v3 6/9] virtio-iommu: Add RISC-V page tables

The RISC-V IOMMU allows a guest to attach either a single page directory
or, when PASID is supported, a process directory (PASID table). Add the
PROBE and ATTACH_TABLE descriptions to support RISC-V.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

---
v2->v3: Drop capabilities defines, best left to virtio_iommu.h
---
 device-types/iommu/description.tex   |  3 +
 device-types/iommu/pgtable-riscv.tex | 92 ++++++++++++++++++++++++++++
 introduction.tex                     |  3 +
 3 files changed, 98 insertions(+)
 create mode 100644 device-types/iommu/pgtable-riscv.tex

diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
index 0ec067c..6fcd296 100644
--- a/device-types/iommu/description.tex
+++ b/device-types/iommu/description.tex
@@ -408,6 +408,7 @@ \subsubsection{ATTACH_TABLE request}\label{ref:Device Types / IOMMU Device / Dev
 
 #define VIRTIO_IOMMU_ATTACH_TABLE_ARM_SMMU3       1
 #define VIRTIO_IOMMU_ATTACH_TABLE_INTEL_PT        2
+#define VIRTIO_IOMMU_ATTACH_TABLE_RISCV           4
 \end{lstlisting}
 
 Attach an endpoint to a domain, in the same way as an ATTACH
@@ -999,6 +1000,7 @@ \subsubsection{PROBE properties}\label{sec:Device Types / IOMMU Device / Device
 #define VIRTIO_IOMMU_PROBE_T_RESV_MEM       1
 #define VIRTIO_IOMMU_PROBE_T_HW_ARM_SMMU3   2
 #define VIRTIO_IOMMU_PROBE_T_HW_INTEL_VTD   3
+#define VIRTIO_IOMMU_PROBE_T_HW_RISCV       4
 \end{lstlisting}
 
 \paragraph{Property RESV_MEM}\label{sec:Device Types / IOMMU Device / Device operations / PROBE properties / RESVMEM}
@@ -1151,3 +1153,4 @@ \subsection{Acceleration}\label{sec:Device Types / IOMMU Device / Acceleration}
 
 \input{device-types/iommu/pgtable-arm}
 \input{device-types/iommu/pgtable-intel}
+\input{device-types/iommu/pgtable-riscv}
diff --git a/device-types/iommu/pgtable-riscv.tex b/device-types/iommu/pgtable-riscv.tex
new file mode 100644
index 0000000..4118bf6
--- /dev/null
+++ b/device-types/iommu/pgtable-riscv.tex
@@ -0,0 +1,92 @@
+\subsubsection{RISC-V IOMMU tables}\label{sec:Device Types / IOMMU Device / Acceleration / RISC-V}
+
+Attach Process Directory Table (PDT) and first-stage page tables in the format
+described in the \hyperref[intro:RISCV-IOMMU]{RISC-V IOMMU Architecture
+Specification v1.0}.
+
+\paragraph{PROBE properties for RISC-V IOMMU}\label{sec:Device Types / IOMMU Device / Acceleration / RISC-V / PROBE}
+
+The PROBE property VIRTIO_IOMMU_PROBE_T_HW_RISCV provides
+information about a RISC-V IOMMU.
+
+\begin{lstlisting}
+struct virtio_iommu_probe_hw_riscv {
+  struct virtio_iommu_probe_property head;
+  u8    gxl;
+  u8    reserved[3];
+  le64  capabilities;
+};
+
+\end{lstlisting}
+
+The \field{capabilities} field correspond to the RISC-V IOMMU capabilities
+register.
+
+Field \field{gxl} corresponds to the IOMMU fctl.GXL
+configuration, and describes the virtual-memory schemes
+available. If \field{gxl} is 1, the driver sets SXL to 1 when
+configuring page tables.
+
+\paragraph{ATTACH_TABLE request for RISC-V IOMMU}\label{sec:Device Types / IOMMU Device / Acceleration / RISC-V / ATTACH_TABLE}
+
+\begin{lstlisting}
+struct virtio_iommu_req_attach_table_riscv {
+  struct virtio_iommu_req_head head;
+  le32  domain;
+  le32  endpoint;
+  u8    format;
+  u8    reserved[3];
+  le64  tc;
+  le64  ta;
+  le64  fsc;
+  u8    reserved[84];
+  struct virtio_iommu_req_tail tail;
+};
+
+#define VIRTIO_IOMMU_HW_RISCV_TC_PDTV         (1 << 5)
+#define VIRTIO_IOMMU_HW_RISCV_TC_SADE         (1 << 8)
+#define VIRTIO_IOMMU_HW_RISCV_TC_DPE          (1 << 9)
+#define VIRTIO_IOMMU_HW_RISCV_TC_SBE          (1 << 10)
+#define VIRTIO_IOMMU_HW_RISCV_TC_SXL          (1 << 11)
+
+#define VIRTIO_IOMMU_HW_RISCV_TA_PSCID_SHIFT  12
+#define VIRTIO_IOMMU_HW_RISCV_TA_PSCID_MASK   0xfffff
+
+#define VIRTIO_IOMMU_HW_RISCV_FSC_MODE_SHIFT  60
+#define VIRTIO_IOMMU_HW_RISCV_FSC_MODE_MASK   0xf
+#define VIRTIO_IOMMU_HW_RISCV_FSC_PPN_MASK    0xfffffffffff
+
+/* When VIRTIO_IOMMU_HW_RISCV_TC_PDTV == 0 */
+#define VIRTIO_IOMMU_HW_RISCV_FSC_MODE_SV39   8
+#define VIRTIO_IOMMU_HW_RISCV_FSC_MODE_SV48   9
+#define VIRTIO_IOMMU_HW_RISCV_FSC_MODE_SV57   10
+#define VIRTIO_IOMMU_HW_RISCV_FSC_MODE_SV32   8
+
+/* When VIRTIO_IOMMU_HW_RISCV_TC_PDTV == 1 */
+#define VIRTIO_IOMMU_HW_RISCV_FSC_MODE_PD8    1
+#define VIRTIO_IOMMU_HW_RISCV_FSC_MODE_PD17   2
+#define VIRTIO_IOMMU_HW_RISCV_FSC_MODE_PD20   3
+\end{lstlisting}
+
+Field \field{format} is VIRTIO_IOMMU_ATTACH_TABLE_RISCV.
+
+The RISC-V IOMMU supports two modes:
+
+\begin{description}
+  \item[VIRTIO_IOMMU_HW_RISCV_TC_PDTV = 0]
+    Field \field{fsc} contains a page directory and the paging
+    mode. Field \field{ta} contains a PSCID.
+
+  \item[VIRTIO_IOMMU_HW_RISCV_TC_PDTV = 1]
+    Field \field{fsc} contains the process directory and the
+    process table layout. Field \field{ta} is zero.
+\end{description}
+
+\paragraph{INVALIDATE request for RISC-V IOMMU}\label{sec:Device Types / IOMMU Device / Acceleration / RISC-V / INVALIDATE}
+
+When a process directory is attached, bits [19:0] of \field{id}
+in an INVALIDATE request correspond to the PSCID of the page
+directory.
+
+\todo{What are valid invalidate scope and caches values,
+depending on pdtv? Leaf flag unsupported?}
diff --git a/introduction.tex b/introduction.tex
index 9d0f5c5..1957611 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -107,6 +107,9 @@ \section{Normative References}\label{sec:Normative References}
 	\phantomsection\label{intro:VT-Directed-IO}\textbf{[VT-Directed-IO]} &
 	Intel Virtualization Technology for Directed I/O
 	\newline\url{https://cdrdv2.intel.com/v1/dl/getContent/671081} \\
+	\phantomsection\label{intro:RISCV-IOMMU}\textbf{[RISCV-IOMMU]} &
+	RISC-V IOMMU Specification
+	\newline\url{https://github.com/riscv-non-isa/riscv-iommu/releases} \\
 
 	\phantomsection\label{intro:rfc2784}\textbf{[RFC2784]} &
     Generic Routing Encapsulation. This protocol is only specified for IPv4 and used as either the payload or delivery protocol.
-- 
2.43.0


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

