Return-Path: <virtio-comment-return-7599-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C429E81E19
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 148DD330A7
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EC349986825
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E0C8F98681B; Fri,  6 Oct 2023 16:14:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CE98598681D
	for <virtio-comment@lists.oasis-open.org>; Fri,  6 Oct 2023 16:14:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696608865; x=1697213665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ELcTahhcWBsEEcQV2M1eCzpxuiY5NaZ1tYLjs45axI=;
        b=G+pn2bWCUYWtuw0So9b6X+wQbawsVEThe/Ek8khJtwMsCBvuy+t2lJzD57wqmzV4V/
         5vvBoCusyLg5sTFgVfcu8fKYYe7jmcPWgVl9vKiti6lp6mQn1qbSbdc44hiugqmwiHTy
         P2mMJvT864cxFZvDiXleM1MsNF/acBF2wzpPp1k0eD+AC79uxlbivEvUkhFYon8jixid
         TX3Rh9Hp71JKVYOdsm/wTd+wvBeHk5DYncLlBC9PeMMOYzKQWEPnC+B13ONUHALkt0qG
         oK9e0bB9NTQd+7s7bUWxCEk6z6c8d9eEM+33FQoBG9P5XBVxyis5I0M/Dj/FrXE8M6P5
         gK4g==
X-Gm-Message-State: AOJu0YxzY0AeKS2sS730rJ6T/kkjmFGoBCuXZYah1CsHy5d82pwj2BOf
	tvXdhZUqwVfCxA9HmrNNTFilzUt6q+1zcBTYpRY=
X-Google-Smtp-Source: AGHT+IFYeeeaq2tV18V7tPX1wh5TfW6E5VbAXryHGFLKyxlXJQlRMOTRHop/7+vTfFMVJ9EbnVQwUA==
X-Received: by 2002:adf:f88f:0:b0:323:1df0:c039 with SMTP id u15-20020adff88f000000b003231df0c039mr7265326wrp.56.1696608865465;
        Fri, 06 Oct 2023 09:14:25 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: virtio-comment@lists.oasis-open.org
Cc: vivek.gautam@arm.com,
	tina.zhang@intel.com,
	seb@rivosinc.com,
	sameo@rivosinc.com,
	eric.auger@redhat.com,
	kevin.tian@intel.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Date: Fri,  6 Oct 2023 17:09:46 +0100
Message-ID: <20231006160947.2227396-9-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006160947.2227396-3-jean-philippe@linaro.org>
References: <20231006160947.2227396-3-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 6/9] virtio-iommu: Add RISC-V page tables

The RISC-V IOMMU allows a guest to attach either a single page directory
or, when PASID is supported, a process directory (PASID table). Add the
PROBE and ATTACH_TABLE descriptions to support RISC-V.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 device-types/iommu/description.tex   |   3 +
 device-types/iommu/pgtable-riscv.tex | 111 +++++++++++++++++++++++++++
 introduction.tex                     |   3 +
 3 files changed, 117 insertions(+)
 create mode 100644 device-types/iommu/pgtable-riscv.tex

diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
index a4eb492..a50dd21 100644
--- a/device-types/iommu/description.tex
+++ b/device-types/iommu/description.tex
@@ -408,6 +408,7 @@ \subsubsection{ATTACH_TABLE request}\label{ref:Device Types / IOMMU Device / Dev
 
 #define VIRTIO_IOMMU_ATTACH_TABLE_ARM_SMMU3       1
 #define VIRTIO_IOMMU_ATTACH_TABLE_INTEL_PT        2
+#define VIRTIO_IOMMU_ATTACH_TABLE_RISCV           4
 \end{lstlisting}
 
 Attach an endpoint to a domain, in the same way as an ATTACH
@@ -1011,6 +1012,7 @@ \subsubsection{PROBE properties}\label{sec:Device Types / IOMMU Device / Device
 #define VIRTIO_IOMMU_PROBE_T_RESV_MEM       1
 #define VIRTIO_IOMMU_PROBE_T_HW_ARM_SMMU3   2
 #define VIRTIO_IOMMU_PROBE_T_HW_INTEL_VTD   3
+#define VIRTIO_IOMMU_PROBE_T_HW_RISCV       4
 \end{lstlisting}
 
 \paragraph{Property RESV_MEM}\label{sec:Device Types / IOMMU Device / Device operations / PROBE properties / RESVMEM}
@@ -1163,3 +1165,4 @@ \subsection{Acceleration}\label{sec:Device Types / IOMMU Device / Acceleration}
 
 \input{device-types/iommu/pgtable-arm}
 \input{device-types/iommu/pgtable-intel}
+\input{device-types/iommu/pgtable-riscv}
diff --git a/device-types/iommu/pgtable-riscv.tex b/device-types/iommu/pgtable-riscv.tex
new file mode 100644
index 0000000..1a3cb36
--- /dev/null
+++ b/device-types/iommu/pgtable-riscv.tex
@@ -0,0 +1,111 @@
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
+#define VIRTIO_IOMMU_HW_RISCV_CAP_SV32      (1 << 8)
+#define VIRTIO_IOMMU_HW_RISCV_CAP_SV39      (1 << 9)
+#define VIRTIO_IOMMU_HW_RISCV_CAP_SV48      (1 << 10)
+#define VIRTIO_IOMMU_HW_RISCV_CAP_SV57      (1 << 11)
+#define VIRTIO_IOMMU_HW_RISCV_CAP_SVPBMT    (1 << 15)
+#define VIRTIO_IOMMU_HW_RISCV_CAP_END       (1 << 27)
+#define VIRTIO_IOMMU_HW_RISCV_CAP_PD8       (1 << 38)
+#define VIRTIO_IOMMU_HW_RISCV_CAP_PD17      (1 << 39)
+#define VIRTIO_IOMMU_HW_RISCV_CAP_PD20      (1 << 40)
+
+\end{lstlisting}
+
+The \field{capabilities} field correspond to the RISC-V IOMMU capabilities
+register. The following fields affect the process and page table. Other fields
+are set to zero.
+
+\begin{description}
+  \item[version] Optional.
+  \item[Sv32, Sv39, Sv48, Sv57] Input address size.
+  \item[Svpbmt] Memory types.
+  \item[END] Bi-endianness supported.
+  \item[PD8, PD17, PD20] Process Table layout.
+\end{description}
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
index d0d5086..0a3be2e 100644
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

