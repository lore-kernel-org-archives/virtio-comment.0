Return-Path: <virtio-comment-return-7592-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CA0E81E17
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 25D41C611E
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A26D69868A3
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 629FA9868C0; Fri,  6 Oct 2023 16:14:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4337E986842
	for <virtio-comment@lists.oasis-open.org>; Fri,  6 Oct 2023 16:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696608864; x=1697213664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMwc/8xDQR0EbpCDNYWQPB2TpVrZXvf8vLYfIdouC18=;
        b=KZvTtf31AI8IDEuozsa7H5/m4M69d1nlsRgV8J71j3Uo0/acJJIxgoTvGiCoaxPsUf
         V9dzTZO3GwwjVLF0VSIvD/Cvv8JB07oJ7L3WD1w0BdnIpswRJMpxCChfQjYRspWPE5oc
         +w2CcaGDBTss1LkJ5SJQke5WiwlCNYxGUqrGRvp3IfSE67pJNZQo0K63hi6LdO08AkeB
         gQg3JdNLEc6C6Y0Mi/bbNMXj4rpbM2hVf25EwWlaM8RUt6hVbK6Gn9GGZ91BZg9BUIaL
         /RXz2uhlfamWhghxpGpiHvxA9In5EbvUYfl8OuwiEROWJQ3b9llG6+tlo1zHrof0gIe+
         vtrQ==
X-Gm-Message-State: AOJu0Yxe3+xDiEQ9qyhTkdWik3E7H+aj5AvzrHoEL3C2KsrLXUKmYFnh
	+BNismEypG+wZSzRJe+6IWvEWviSDViD+borI6k=
X-Google-Smtp-Source: AGHT+IFvFS0Sx7V4IE8zFBdLDq7xW+T9BD4BYAkNuTojXkwCbIRJaHXde1cHGqm3z1qjHZh6pktD8w==
X-Received: by 2002:a05:6000:109:b0:321:5d87:5f7c with SMTP id o9-20020a056000010900b003215d875f7cmr8073626wrx.30.1696608864030;
        Fri, 06 Oct 2023 09:14:24 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: virtio-comment@lists.oasis-open.org
Cc: vivek.gautam@arm.com,
	tina.zhang@intel.com,
	seb@rivosinc.com,
	sameo@rivosinc.com,
	eric.auger@redhat.com,
	kevin.tian@intel.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Date: Fri,  6 Oct 2023 17:09:43 +0100
Message-ID: <20231006160947.2227396-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006160947.2227396-3-jean-philippe@linaro.org>
References: <20231006160947.2227396-3-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 3/9] virtio-iommu: Add Arm SMMUv3 support

Allow a driver to detect support for Arm page tables and attach a set of
tables. When the hardware IOMMU is an Arm SMMUv3, an intermediate
"Context Descriptor" (CD) table has to be attached. That table is
indexed by PASID and contains multiple pointers to page directories:

                 CD table          Page directory
                +-------+   ,------->+-------+
                :       :   |        :       :
                +-------+   |        +-------+
         PASID->|  CD   |---'    VA->|  PTE  |--> GPA
                +-------+            +-------+
                :       :            :       :
                +-------+            +-------+

The driver detects support for this table format in a PROBE request and
sends an ATTACH_TABLE request with a pointer to the context descriptor
table. It populates the tables, and sends INVALIDATE requests after
removing entries that may have been cached by the hardware.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 device-types/iommu/description.tex |   9 +-
 device-types/iommu/pgtable-arm.tex | 148 +++++++++++++++++++++++++++++
 introduction.tex                   |   3 +
 3 files changed, 159 insertions(+), 1 deletion(-)
 create mode 100644 device-types/iommu/pgtable-arm.tex

diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
index 2a2184a..58edaad 100644
--- a/device-types/iommu/description.tex
+++ b/device-types/iommu/description.tex
@@ -405,6 +405,8 @@ \subsubsection{ATTACH_TABLE request}\label{ref:Device Types / IOMMU Device / Dev
 	u8   descriptor[111];
 	struct virtio_iommu_req_tail tail;
 };
+
+#define VIRTIO_IOMMU_ATTACH_TABLE_ARM_SMMU3       1
 \end{lstlisting}
 
 Attach an endpoint to a domain, in the same way as an ATTACH
@@ -995,7 +997,8 @@ \subsubsection{PROBE request}\label{sec:Device Types / IOMMU Device / Device ope
 \subsubsection{PROBE properties}\label{sec:Device Types / IOMMU Device / Device operations / PROBE properties}
 
 \begin{lstlisting}
-#define VIRTIO_IOMMU_PROBE_T_RESV_MEM   1
+#define VIRTIO_IOMMU_PROBE_T_RESV_MEM       1
+#define VIRTIO_IOMMU_PROBE_T_HW_ARM_SMMU3   2
 \end{lstlisting}
 
 \paragraph{Property RESV_MEM}\label{sec:Device Types / IOMMU Device / Device operations / PROBE properties / RESVMEM}
@@ -1143,3 +1146,7 @@ \subsubsection{Fault reporting}\label{sec:Device Types / IOMMU Device / Device o
 \footnotetext{This would happen for example if the device implements a
 more recent version of this specification, whose fault report contains
 additional fields.}
+
+\subsection{Acceleration}\label{sec:Device Types / IOMMU Device / Acceleration}
+
+\input{device-types/iommu/pgtable-arm}
diff --git a/device-types/iommu/pgtable-arm.tex b/device-types/iommu/pgtable-arm.tex
new file mode 100644
index 0000000..2f41218
--- /dev/null
+++ b/device-types/iommu/pgtable-arm.tex
@@ -0,0 +1,148 @@
+\subsubsection{Arm SMMUv3 tables}\label{sec:Device Types / IOMMU Device / Acceleration / Arm SMMUv3}
+
+Attach Context Descriptor tables (PASID tables) in the format described in the
+\hyperref[intro:SMMUv3]{Arm System Memory Management Unit v3 specification}.
+The table contains context descriptors indexed by PASID, each pointing to a
+page directory.
+
+\paragraph{PROBE property for Arm SMMUv3}\label{sec:Device Types / IOMMU Device / Acceleration / Arm SMMUv3 / PROBE}
+
+The PROBE property VIRTIO_IOMMU_PROBE_T_HW_ARM_SMMU3 provides information about
+an Arm SMMU v3.
+
+\begin{lstlisting}
+struct virtio_iommu_probe_hw_arm_smmu3 {
+  struct virtio_iommu_probe_property head;
+  u8    reserved[4];
+  le64  idr0;
+  le64  idr1;
+  le64  reserved;
+  le64  idr3;
+  le64  reserved;
+  le64  idr5;
+};
+
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_TTF_32           (1 << 2)
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_TTF_64           (1 << 3)
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_COHACC           (1 << 4)
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_BTM              (1 << 5)
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_HTTU_SHIFT       6
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_HTTU_MASK        0x3
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_HTTU_HA          1
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_HTTU_HA_HD       2
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_ASID16           (1 << 12)
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_CD2L             (1 << 19)
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_TTENDIAN_SHIFT   21
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_TTENDIAN_MASK    0x3
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_TTENDIAN_MIXED   0
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_TTENDIAN_LE      2
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_TTENDIAN_BE      3
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_STALL_SHIFT      24
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_STALL_MASK       0x3
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_STALL_SUPPORTED  0
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_STALL_FORCE      2
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR0_TERM_MODEL       (1 << 26)
+
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR1_SSIDSIZE_SHIFT   6
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR1_SSIDSIZE_MASK    0x1f
+
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR3_HAD              (1 << 2)
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR3_PBHA             (1 << 3)
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR3_STT              (1 << 9)
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR3_BBML_SHIFT       11
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR3_BBML_MASK        0x3
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR3_E0PD             (1 << 13)
+
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR5_OAS_SHIFT        0
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR5_OAS_MASK         0x7
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR5_OAS_32           0
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR5_OAS_36           1
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR5_OAS_40           2
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR5_OAS_42           3
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR5_OAS_44           4
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR5_OAS_48           5
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR5_OAS_52           6
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR5_GRAN4K           (1 << 4)
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR5_GRAN16K          (1 << 5)
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR5_GRAN64K          (1 << 6)
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR5_VAX_SHIFT        10
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR5_VAX_MASK         0x3
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR5_VAX_48           0
+#define VIRTIO_IOMMU_HW_ARM_SMMU3_IDR5_VAX_52           1
+\end{lstlisting}
+
+The \field{idr0-idr5} fields correspond to Arm SMMUv3 ID
+registers. Fields described here affect the context descriptor
+and page table formats. Other fields might be set to zero.
+
+\begin{description}
+  \item[IDR0_TTF] Translation table format.
+  \item[IDR0_COHACC] Coherent page table access.
+  \item[IDR0_BTM] Broadcast TLB maintenance.
+  \item[IDR0_HTTU] Hardware access and dirty bit update.
+  \item[IDR0_ASID16] 16-bit ASID (otherwise 8-bit).
+  \item[IDR0_CD2L] 2-level Context Descriptor table.
+  \item[IDR0_TTENDIAN] Translation tables endianness.
+  \item[IDR0_STALL_MODEL] Stall support for faulting
+    transactions.
+  \item[IDR0_TERM_MODEL] Configurable transaction termination.
+  \item[IDR1_SSIDSIZE] Substream ID (PASID) size.
+  \item[IDR3_HAD] Hierarchical attributes disable.
+  \item[IDR3_PBHA] Page-Based Hardware Attributes.
+  \item[IDR3_STT] Small translation tables.
+  \item[IDR3_E0PD] Disable unprivileged access.
+  \item[IDR5_OAS] Output address size.
+  \item[IDR5_GRAN] 4kB, 16kB, 64kB pages support.
+  \item[IDR5_VAX] Virtual address size.
+\end{description}
+
+\paragraph{ATTACH_TABLE request for Arm SMMUv3}\label{sec:Device Types / IOMMU Device / Acceleration / Arm SMMUv3 / ATTACH_TABLE}
+
+\begin{lstlisting}
+struct virtio_iommu_req_attach_table_arm_smmu3 {
+  struct virtio_iommu_req_head head;
+  le32  domain;
+  le32  endpoint;
+  u8    format;
+  u8    reserved[3];
+  le64  ste0;
+  le64  ste1;
+  u8    reserved[51];
+  struct virtio_iommu_req_tail tail;
+};
+
+#define VIRTIO_IOMMU_HW_ARM_STE0_S1FMT_SHIFT      4
+#define VIRTIO_IOMMU_HW_ARM_STE0_S1FMT_MASK       0x3
+#define VIRTIO_IOMMU_HW_ARM_STE0_S1FMT_LINEAR     0
+#define VIRTIO_IOMMU_HW_ARM_STE0_S1FMT_4KL2       1
+#define VIRTIO_IOMMU_HW_ARM_STE0_S1FMT_64KL2      2
+
+#define VIRTIO_IOMMU_HW_ARM_STE0_S1PTR_MASK       0xfffffffffffc0
+
+#define VIRTIO_IOMMU_HW_ARM_STE0_S1CDMAX_SHIFT    59
+#define VIRTIO_IOMMU_HW_ARM_STE0_S1CDMAX_MASK     0x1f
+
+#define VIRTIO_IOMMU_HW_ARM_STE1_S1DSS_SHIFT      0
+#define VIRTIO_IOMMU_HW_ARM_STE1_S1DSS_MASK       0x3
+#define VIRTIO_IOMMU_HW_ARM_STE1_S1DSS_TERM       0
+#define VIRTIO_IOMMU_HW_ARM_STE1_S1DSS_BYPASS     1
+#define VIRTIO_IOMMU_HW_ARM_STE1_S1DSS_SSZERO     2
+\end{lstlisting}
+
+Field \field{format} is VIRTIO_IOMMU_ATTACH_TABLE_ARM_SMMU3.
+
+Configuration fields have the same meaning as the SMMUv3 Stream
+Table Entry format:
+
+\begin{description}
+  \item[S1FMT] Layout of the context descriptor table.
+  \item[S1PTR] Address of the context descriptor table.
+  \item[S1CDMAX] Size of the table. $2^\field{s1cdmax}$
+    is the number of context descriptors.
+  \item[S1DSS] Behavior for transactions without PASID.
+\end{description}
+
+\paragraph{INVALIDATE request for Arm SMMUv3}\label{sec:Device Types / IOMMU Device / Acceleration / Arm SMMUv3 / INVALIDATE}
+
+Bits [15:0] of \field{id} in an INVALIDATE request correspond to
+the address space ID (ASID) in the Context Descriptor entry.
diff --git a/introduction.tex b/introduction.tex
index 1e39a4b..636fb1b 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -101,6 +101,9 @@ \section{Normative References}\label{sec:Normative References}
 	\phantomsection\label{intro:SEC1}\textbf{[SEC1]} &
     Standards for Efficient Cryptography Group(SECG), ``SEC1: Elliptic Cureve Cryptography'', Version 1.0, September 2000.
 	\newline\url{https://www.secg.org/sec1-v2.pdf}\\
+	\phantomsection\label{intro:SMMUv3}\textbf{[SMMUv3]} &
+	Arm System Memory Management Unit version 3
+	\newline\url{https://developer.arm.com/documentation/ihi0070/latest} \\
 
 	\phantomsection\label{intro:rfc2784}\textbf{[RFC2784]} &
     Generic Routing Encapsulation. This protocol is only specified for IPv4 and used as either the payload or delivery protocol.
-- 
2.42.0


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

