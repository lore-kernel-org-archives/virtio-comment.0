Return-Path: <virtio-comment-return-7594-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8F7E81E19
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DCB62157F04
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4B23B986821
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 04C31986874; Fri,  6 Oct 2023 16:14:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9D5DE98688C
	for <virtio-comment@lists.oasis-open.org>; Fri,  6 Oct 2023 16:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696608865; x=1697213665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwyAwoSWoaC/6ugYt8U0QebFnG6Cuj/rr4yLIEwcTPM=;
        b=QUj82spJiazI1Hq6HsRjtYlBKTpk7BrHgzU4RGJ87dNy1S/heveHceaNC7QqRS33z/
         kOdWLoleV5ZHmdijzBxtHNeW1mIGFYhEd066tghMwM7+yxeQqfx8Vo6Kc3X7o7KOjes1
         CmXg14P67Q0XVjhXPeOcI3+5trrB8X3+thZGJv5BAO6xsrt3PJN6y4YV5ZJAifSKMAhc
         u47qDIrPk4+C70CorsZOSSjUGeq0m9JPg4sAGnQ6RS6H85PY4T5Xd2WtMN5fXUgq3BQE
         WStQkQZlJDhWicw9GYxXV9SIEbtODwNgwxlF4lz45xM2eikmPYQIhPPqSNp5HasuIEio
         c0IQ==
X-Gm-Message-State: AOJu0YysyzOzkth2lbwO4DmuH2w+DUhUKK7QaBs02EPEdY2EabXxCD5x
	vRKYpHyJ1I8VV4NuPJFu3azUEJUwQGZN0RA7xtI=
X-Google-Smtp-Source: AGHT+IGJ+odKfWNlLM7/8/3R0zj8c7lM2Et953FVCBb/kzuNMB8gqfTnDPxxkpPgZb6266Lr15Tptw==
X-Received: by 2002:a7b:c4d6:0:b0:405:3455:d603 with SMTP id g22-20020a7bc4d6000000b004053455d603mr8269943wmk.17.1696608864954;
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
Date: Fri,  6 Oct 2023 17:09:45 +0100
Message-ID: <20231006160947.2227396-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006160947.2227396-3-jean-philippe@linaro.org>
References: <20231006160947.2227396-3-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 5/9] virtio-iommu: Add VT-d IO page table

From: Tina Zhang <tina.zhang@intel.com>

Allow a driver of a device behind virtio-iommu to detect support for
VT-d IO page table.

The driver detects support for VT-d IO page table format in a PROBE
request and sends an ATTACH_TABLE request with a pointer to the first
stage page translation table.

The definition of first stage page translation table ATTACH_TABLE
request references the fields defined in VT-d scalable-mode PASID table
entry.
* attributes defined in ATTACH_TABLE request:
  FSPTPTR got from pgtbl_addr field.
  SRE/EAFE/WPE defined in pgtbl_flags field.
  FSPM calculated through addr_width field.
  PASID got from pasid field.

* attributes not defined in ATTACH_TABLE request, as their
  configurations need to be decided by host:
  Memory type features, PAT/EMTE/CD/PGSNP/PWSNP.
  Snoop Behavior, PGSNP/PWSNP.

Support for any new attributes could easily be added by adding flags to
the PROBE property and fields in the ATTACH_TABLE config.

Signed-off-by: Tina Zhang <tina.zhang@intel.com>
[JPB: moved to pgtable-intel.tex, rework formatting]
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 device-types/iommu/description.tex   |  3 +
 device-types/iommu/pgtable-intel.tex | 98 ++++++++++++++++++++++++++++
 introduction.tex                     |  3 +
 3 files changed, 104 insertions(+)
 create mode 100644 device-types/iommu/pgtable-intel.tex

diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
index c057cdf..a4eb492 100644
--- a/device-types/iommu/description.tex
+++ b/device-types/iommu/description.tex
@@ -407,6 +407,7 @@ \subsubsection{ATTACH_TABLE request}\label{ref:Device Types / IOMMU Device / Dev
 };
 
 #define VIRTIO_IOMMU_ATTACH_TABLE_ARM_SMMU3       1
+#define VIRTIO_IOMMU_ATTACH_TABLE_INTEL_PT        2
 \end{lstlisting}
 
 Attach an endpoint to a domain, in the same way as an ATTACH
@@ -1009,6 +1010,7 @@ \subsubsection{PROBE properties}\label{sec:Device Types / IOMMU Device / Device
 \begin{lstlisting}
 #define VIRTIO_IOMMU_PROBE_T_RESV_MEM       1
 #define VIRTIO_IOMMU_PROBE_T_HW_ARM_SMMU3   2
+#define VIRTIO_IOMMU_PROBE_T_HW_INTEL_VTD   3
 \end{lstlisting}
 
 \paragraph{Property RESV_MEM}\label{sec:Device Types / IOMMU Device / Device operations / PROBE properties / RESVMEM}
@@ -1160,3 +1162,4 @@ \subsubsection{Fault reporting}\label{sec:Device Types / IOMMU Device / Device o
 \subsection{Acceleration}\label{sec:Device Types / IOMMU Device / Acceleration}
 
 \input{device-types/iommu/pgtable-arm}
+\input{device-types/iommu/pgtable-intel}
diff --git a/device-types/iommu/pgtable-intel.tex b/device-types/iommu/pgtable-intel.tex
new file mode 100644
index 0000000..90a3410
--- /dev/null
+++ b/device-types/iommu/pgtable-intel.tex
@@ -0,0 +1,98 @@
+\subsubsection{Intel VT-d tables}\label{sec:Device Types / IOMMU Device / Acceleration / Intel}
+
+Attach first-level translation tables in the format described by
+the \hyperref[intro:VT-Directed-IO]{Intel Virtualization
+Technology for Directed I/O specification}.
+
+\paragraph{PROBE property for VT-d page tables}\label{sec:Device Types / IOMMU Device / Acceleration / Intel / PROBE}
+
+The PROBE property VIRTIO_IOMMU_PROBE_T_HW_INTEL_VTD provides
+information about an Intel VT-d IOMMU.
+
+\begin{lstlisting}
+struct virtio_iommu_probe_hw_intel_vtd {
+  struct virtio_iommu_probe_property head;
+  u8   reserved[4];
+  le64 cap_reg;
+  le64 ecap_reg;
+};
+
+#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_RWBF        (1 << 4)
+#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_SAGAW_SHIFT 8
+#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_SAGAW_MASK  0x1f
+#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_MGAW_SHIFT  16
+#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_MGAW_MASK   0x1f
+#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_ZLR         (1 << 22)
+#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_FL1GP       (1 << 56)
+#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_5LP         (1 << 60)
+
+#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_SC         (1 << 7)
+#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_MTS        (1 << 25)
+#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_EAFS       (1 << 34)
+#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_PSS_SHIFT  35
+#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_PSS_MASK   0x1f
+#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_SMTS       (1 << 43)
+#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_VCS        (1 << 44)
+#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_SMPWC      (1 << 48)
+\end{lstlisting}
+
+\todo{check that these are necessary and sufficient to support
+page table assignement in scalable mode.}
+\todo{Need to support non-PASID assignment? non-scalable?}
+
+\begin{description}
+  \item[\field{cap_reg}] Capability Register.
+  \item[\field{ecap_reg}] Extended Capability Register.
+\end{description}
+
+\paragraph{ATTACH_TABLE request for VT-d page table}\label{sec:Device Types / IOMMU Device / Acceleration / Intel / ATTACH_TABLE}
+
+Attach a single set of page tables to an endpoint.
+
+\begin{lstlisting}
+/* Vt-d I/O Page Table Descriptor */
+struct virtio_iommu_req_attach_table_intel {
+  struct virtio_iommu_req_head          head;
+  le32                                  domain;
+  le32                                  endpoint;
+  u8                                    format;
+  u8                                    reserved[7];
+  le32                                  pasid;
+  le64                                  pgtbl_addr;
+  le64                                  pgtbl_flags;
+  le32                                  addr_width;
+  u8                                    reserved[80];
+  struct virtio_iommu_req_tail          tail;
+};
+
+/* Intel VT-d stage-1 page table entry attributes */
+#define	VIRTIO_IOMMU_HW_INTEL_VTD_SRE             0x01
+#define	VIRTIO_IOMMU_HW_INTEL_VTD_EAFE            0x02
+#define	VIRTIO_IOMMU_HW_INTEL_VTD_WPE             0x40
+#define	VIRTIO_IOMMU_HW_INTEL_VTD_LAST            0x80
+\end{lstlisting}
+
+\begin{description}
+  \item[\field{format}] VIRTIO_IOMMU_ATTACH_TABLE_INTEL_PT.
+  \item[\field{pasid}] Process Address Space Identifier.
+    \todo{don't we need to allocate these with alloc/free
+    commands to the host?}
+  \item[\field{pgtbl_addr}] Stage-1 page table base address.
+  \item[\field{pgtbl_flags}] Stage-1 page table entry attributes:
+    \begin{description}
+      \item{SRE} Supervisor request,
+      \item{EAFE} Extended access enable,
+      \item{WPE} Write protect enable.
+    \end{description}
+  \item[\field{pat}] Page attribute table data to compute
+    effective memory type.
+  \item[\field{addr_width}] The address width of the untranslated
+    addresses that are subjected to the stage-1 page table.
+\end{description}
+
+\paragraph{INVALIDATE request for VT-d page table}\label{sec:Device Types / IOMMU Device / Acceleration / Intel / INVALIDATE}
+
+Supported values for field \field{scope} are
+VIRTIO_IOMMU_INVAL_S_PASID and VIRTIO_IOMMU_INVAL_S_ADDRESS.
+The only supported value for field \field{caches} is
+VIRTIO_IOMMU_INVAL_C_TLB. Field \field{id} is not used.
diff --git a/introduction.tex b/introduction.tex
index 636fb1b..d0d5086 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -104,6 +104,9 @@ \section{Normative References}\label{sec:Normative References}
 	\phantomsection\label{intro:SMMUv3}\textbf{[SMMUv3]} &
 	Arm System Memory Management Unit version 3
 	\newline\url{https://developer.arm.com/documentation/ihi0070/latest} \\
+	\phantomsection\label{intro:VT-Directed-IO}\textbf{[VT-Directed-IO]} &
+	Intel Virtualization Technology for Directed I/O
+	\newline\url{https://cdrdv2.intel.com/v1/dl/getContent/671081} \\
 
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

