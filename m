Return-Path: <virtio-comment-return-8988-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B13EC47DDF
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E42E81CA242
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D4A429867B8
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BB46F9865B8; Mon, 22 Jan 2024 17:21:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A2C489867D4
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 Jan 2024 17:21:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944088; x=1706548888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GnFtCGKkHAmWmxyKhBg1yNe7v07QADfHzfE0Q2sDVE=;
        b=LLe+OUGFVkr7SY0LHu8MudC46O8JSfdeavET/VexjCIlj0db4XuNBZoNcY78lqh76B
         L1VETXCLHb8XlD2A7nLJ2NfH/tvNLVfaVqkNj1n56B3y+g/l5JIviTVcSBb9guADvv7J
         ex4kQ9iAD+4Bke4faxEF0mBHNYvcZzfimUnGG4NoVVw7Shjcw0EkrrXXp/uMhR3sDx3j
         eh72H7dszSIcnvVTIjq87brjVoYPayAgWZWkJiRpBYccczyjyyKks2WCO1RnCrjNp1Lr
         aaHC3NZh2gCHCrg0sQ/yvPksiRFr2uYSeCmr1p0C22ZOMZsX/LJGC0RYhj1xRRn++EKr
         Vv2Q==
X-Gm-Message-State: AOJu0YxPvYbQ2vK2xxpxtY8hkn687Ow0TvN2VQtXVtzOBCZJBREKNfcm
	cLtd/Vstr8/g/hk1svYWgGw0/ohOYruXcjVLk3zOgeJUcZ9ecFYL6rYzpFyf7+EQKlRJ2OVmv7V
	C
X-Google-Smtp-Source: AGHT+IGWIUlzCcDrxPA01ZlIEXDIEp9BokntqC9j/B3Qqa0ptmIT3o979hb5OVWZJWXNdy13JXeJGA==
X-Received: by 2002:a05:600c:2251:b0:40e:6182:43ca with SMTP id a17-20020a05600c225100b0040e618243camr2573004wmm.127.1705944088266;
        Mon, 22 Jan 2024 09:21:28 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: virtio-comment@lists.oasis-open.org
Cc: vivek.gautam@arm.com,
	tina.zhang@intel.com,
	seb@rivosinc.com,
	sameo@rivosinc.com,
	eric.auger@redhat.com,
	kevin.tian@intel.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Date: Mon, 22 Jan 2024 17:14:37 +0000
Message-ID: <20240122171442.1740297-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122171442.1740297-2-jean-philippe@linaro.org>
References: <20240122171442.1740297-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v3 3/9] virtio-iommu: Add Arm SMMUv3 support

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
v2->v3: Drop IDR definitions. The goal was to describe the ID fields
that actually matter for virtualization, but we can do that in the
reference virtio_iommu.h.
---
 device-types/iommu/description.tex |  9 +++-
 device-types/iommu/pgtable-arm.tex | 78 ++++++++++++++++++++++++++++++
 introduction.tex                   |  3 ++
 3 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 device-types/iommu/pgtable-arm.tex

diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
index c20897a..45930d9 100644
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
@@ -985,7 +987,8 @@ \subsubsection{PROBE request}\label{sec:Device Types / IOMMU Device / Device ope
 \subsubsection{PROBE properties}\label{sec:Device Types / IOMMU Device / Device operations / PROBE properties}
 
 \begin{lstlisting}
-#define VIRTIO_IOMMU_PROBE_T_RESV_MEM   1
+#define VIRTIO_IOMMU_PROBE_T_RESV_MEM       1
+#define VIRTIO_IOMMU_PROBE_T_HW_ARM_SMMU3   2
 \end{lstlisting}
 
 \paragraph{Property RESV_MEM}\label{sec:Device Types / IOMMU Device / Device operations / PROBE properties / RESVMEM}
@@ -1133,3 +1136,7 @@ \subsubsection{Fault reporting}\label{sec:Device Types / IOMMU Device / Device o
 \footnotetext{This would happen for example if the device implements a
 more recent version of this specification, whose fault report contains
 additional fields.}
+
+\subsection{Acceleration}\label{sec:Device Types / IOMMU Device / Acceleration}
+
+\input{device-types/iommu/pgtable-arm}
diff --git a/device-types/iommu/pgtable-arm.tex b/device-types/iommu/pgtable-arm.tex
new file mode 100644
index 0000000..edd7767
--- /dev/null
+++ b/device-types/iommu/pgtable-arm.tex
@@ -0,0 +1,78 @@
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
+\end{lstlisting}
+
+The \field{idr0-idr5} fields correspond to Arm SMMUv3 ID
+registers.
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
+  u8    reserved[92];
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
index cfa6633..753d5d0 100644
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

