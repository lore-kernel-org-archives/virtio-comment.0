Return-Path: <virtio-comment-return-7597-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD49BE81E1A
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EDD9F2AC5D
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DCEF6986825
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D09C398681B; Fri,  6 Oct 2023 16:14:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C2BD798681C
	for <virtio-comment@lists.oasis-open.org>; Fri,  6 Oct 2023 16:14:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696608866; x=1697213666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmnpYjXBpNkaTztUoAxVKdhTnxqX4uwkCYqq7CjhQRk=;
        b=JaczXc+g0dlmwHnA8I+VtmYLanuTRZcg3EjV6jRwT+ASICpc3r/SgOfn0yDdMrXQl7
         vhzDbQUP/a1XI4s1eh2x4dFcJQ8CCl4y0UUckhhIyCHNA65O9HHzMeXfaUXgU1O8+DSf
         Ez0XifdOBieKf6sstw3lIZGU3B8nqZISTgluF7cRUaXlujCtzrm2mfDvE72NVNSN23aY
         K7h+YYcTjaxLX4QHCmwJ/P/tNlhgG/muFpJIFgndWVrw4PwdS6/nGkuPJBz97uuXUYFB
         D5Oe6v+MBdESoE6A8qK2j2U0BGARfbKrwDTi2W4vWoXP2y5LTi3VR1efZYrsExw/rJq4
         EstA==
X-Gm-Message-State: AOJu0YwCwMiheCmQQfadXwY8VP1iyhzS9T9xedA9f9kZqCh/SVwOWdkW
	j7Rs/J9b7fcvGWmsa6pahC7RDHOGqj71vqr18/U=
X-Google-Smtp-Source: AGHT+IHCsqM+wH9fNDhn1W9BmIV+1yltpcRLVAysNGv0q1E05sXiI376SJmdiW1Sww+dT/vCmARTbg==
X-Received: by 2002:adf:e74e:0:b0:321:504a:bc9a with SMTP id c14-20020adfe74e000000b00321504abc9amr7286643wrn.71.1696608865924;
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
Date: Fri,  6 Oct 2023 17:09:47 +0100
Message-ID: <20231006160947.2227396-10-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006160947.2227396-3-jean-philippe@linaro.org>
References: <20231006160947.2227396-3-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 7/9] virtio-iommu: Add AMD page tables

Mostly for illustration for the moment. It has several interesting
features, like HW acceleration of queues, so this patch tries to
show how that could be supported with virtio-iommu. The interface is
straightforward, the difficulty lies in abstracting the guest AMD IOMMU
driver well enough to be reused by virtio-iommu.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 device-types/iommu/description.tex |   4 +
 device-types/iommu/pgtable-amd.tex | 187 +++++++++++++++++++++++++++++
 2 files changed, 191 insertions(+)
 create mode 100644 device-types/iommu/pgtable-amd.tex

diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
index a50dd21..38f94f8 100644
--- a/device-types/iommu/description.tex
+++ b/device-types/iommu/description.tex
@@ -409,6 +409,8 @@ \subsubsection{ATTACH_TABLE request}\label{ref:Device Types / IOMMU Device / Dev
 #define VIRTIO_IOMMU_ATTACH_TABLE_ARM_SMMU3       1
 #define VIRTIO_IOMMU_ATTACH_TABLE_INTEL_PT        2
 #define VIRTIO_IOMMU_ATTACH_TABLE_RISCV           4
+#define VIRTIO_IOMMU_ATTACH_TABLE_AMD_GCR3        5
+#define VIRTIO_IOMMU_ATTACH_TABLE_AMD_PT          6
 \end{lstlisting}
 
 Attach an endpoint to a domain, in the same way as an ATTACH
@@ -1013,6 +1015,7 @@ \subsubsection{PROBE properties}\label{sec:Device Types / IOMMU Device / Device
 #define VIRTIO_IOMMU_PROBE_T_HW_ARM_SMMU3   2
 #define VIRTIO_IOMMU_PROBE_T_HW_INTEL_VTD   3
 #define VIRTIO_IOMMU_PROBE_T_HW_RISCV       4
+#define VIRTIO_IOMMU_PROBE_T_HW_AMD         5
 \end{lstlisting}
 
 \paragraph{Property RESV_MEM}\label{sec:Device Types / IOMMU Device / Device operations / PROBE properties / RESVMEM}
@@ -1166,3 +1169,4 @@ \subsection{Acceleration}\label{sec:Device Types / IOMMU Device / Acceleration}
 \input{device-types/iommu/pgtable-arm}
 \input{device-types/iommu/pgtable-intel}
 \input{device-types/iommu/pgtable-riscv}
+\input{device-types/iommu/pgtable-amd}
diff --git a/device-types/iommu/pgtable-amd.tex b/device-types/iommu/pgtable-amd.tex
new file mode 100644
index 0000000..81e3af2
--- /dev/null
+++ b/device-types/iommu/pgtable-amd.tex
@@ -0,0 +1,187 @@
+\subsubsection{AMD GCR3 table}\label{sec:Device Types / IOMMU Device / Acceleration / AMD GCR3}
+
+The AMD IOMMU distinguishes two modes: the GCR3 table may be in
+system physical memory, managed entirely by the host platform, or
+in guest physical memory, managed by the guest driver.
+GCR3TRPMode indicates support for GPA based GCR3 table.
+
+The driver first configures a GCR3 table using the
+virtio_iommu_req_attach_pst_amd_gcr3 request. If GPA based GCR3 table is
+supported, then the driver can provide a pointer to a GCR3 table.
+
+Otherwise, the driver provides GCR3 configuration, and populates the
+device-managed GCR3 table using VIRTIO_IOMMU_ATTACH_TABLE_AMD_PT
+requests. Field \field{domain} in page table ATTACH_TABLE
+requests is the same as the one used to configure GCR3.
+
+\paragraph{PROBE properties for AMD GCR3 table}\label{sec:Device Types / IOMMU Device / Acceleration / AMD GCR3 / PROBE}
+
+The PROBE property VIRTIO_IOMMU_PROBE_T_HW_AMD provides
+information about an AMD IOMMU.
+
+\begin{lstlisting}
+struct virtio_iommu_probe_hw_amd {
+  struct virtio_iommu_probe_property head;
+  le32	cap;
+  le64	efr;
+  le64	efr2;
+
+  u8    viommu_mmio_bar;
+  u8    reserved[7];
+  le64  viommu_mmio_offset;
+
+};
+\end{lstlisting}
+
+Valid ID register fields are:
+
+\begin{itemize}
+  \item EFR.GLXSup
+  \item EFR.NXSup
+  \item EFR.USSup
+  \item EFR.GATS
+
+  \item EFR.PASmax
+  \item EFR.GIoSup
+  \item EFR.GAUpdateDisSup
+  \item EFR.vIOMMUSup
+\end{itemize}
+
+\todo{reserve cap and efr2 if we're not using them? Probably
+some missing. Also, declare bitfields.}
+
+When vIOMMUSup is 1, fields \field{viommu_mmio_bar} and
+\field{viommu_mmio_offset} indicate the location of the 4kB
+Virtual Function MMIO Registers. When using the virtio-pci
+transport the combination of bar and offset locate the MMIO
+region. Otherwise the \field{viommu_mmio_offset} is from the
+start of the device MMIO region.
+
+\todo{Interrupt injection for vIOMMU. When passing the VF
+control MMIO registers, we also pass the index of the two MSIs
+used for event/general and PPR virtual queues, so the host can
+setup routing. If not using virtio-pci then the platform could in
+theory reserve two IRQ lines, but we can just mandate PCI and
+MSIs. However, the spec also requires us to support Guest Virtual
+APIC features, which looks like a can of worms.}
+
+\paragraph{ATTACH_TABLE request for AMD GCR3 table}\label{sec:Device Types / IOMMU Device / Acceleration / AMD GCR3 / ATTACH_TABLE / GCR3}
+
+The driver attaches a GCR3 table with the following structure,
+whose fields correspond to Device Table Entry fields.
+
+\begin{lstlisting}
+struct virtio_iommu_req_attach_table_amd_gcr3 {
+  struct virtio_iommu_req_head head;
+  le32  domain;
+  le32  endpoint;
+  u8    format;
+  u8    reserved[3];
+
+  le64  gcr3_table_root_pointer;
+  u8    glx;
+  u8    giov;
+  u8    guest_paging_mode;
+  u8    vimuen;
+  u8    gaupdatedis;
+  u8    reserved[3]
+
+  le64  guest_command_control;
+  le64  guest_event_control;
+  le64  guest_event_logb;
+  le64  guest_ppr_control;
+  le64  guest_pprb_control;
+  le32  domain_id;
+
+  u8    reserved[48];
+  struct virtio_iommu_req_tail tail;
+};
+\end{lstlisting}
+
+\todo{Change this to DTE bitfields if the Linux UAPI goes that
+way, to ease impedance matching. Nicer this way, because the GCR3
+pointer is split in three in the DTE.}
+
+\begin{description}
+  \item[\field{format}] VIRTIO_IOMMU_ATTACH_TABLE_AMD_GCR3
+  \item[\field{glx}] The layout used for the GC3 table. When GPA
+    based GCR3 is not supported, this field is ignored.
+  \item[\field{giov}] Behavior for requests without PASID.
+  \item[\field{guest_paging_mode}] Layout used for the page
+    tables.
+  \item[\field{gaupdatedis}] Disable hardware update of page
+    tables.
+  \item[\field{gcr3_table_root_pointer}] When GPA based GCR3 table is
+    supported, the pointer to the GCR3 root table. Otherwise 0.
+  \item[\field{vimuen}] Enable IOMMU virtualization acceleration.
+\end{description}
+
+The following fields attach command, event and ppr queues to the
+hardware IOMMU, when \field{vimuen} is 1.
+
+\todo{These five regs may need a separate request than
+virtio_iommu_req_attach_table_amd_gcr3, because these registers
+are shared between all endpoints that share a (viommu_mmio_bar,
+viommu_mmio_offset), ie a GuestID within one IOMMU (could there
+be multiple ones in the system?). Or we can just require that all
+attach_table requests use the same registers.}
+
+\begin{description}
+  \item[\field{guest_command_control}]
+  \item[\field{guest_event_control}]
+  \item[\field{guest_event_logb}]
+  \item[\field{guest_ppr_control}]
+  \item[\field{guest_pprb_control}]
+  \item[\field{domain_id}] Guest DomainID, used by the driver in
+    invalidation commands. Assuming TLB entries are formed with
+    the DomainID allocated and written by the host in DTE, this
+    provides a virtual domain ID space to the guest, and the
+    IOMMU translates it in virtual invalidation commands.
+
+    Guest DeviceID corresponds to virtio-iommu endpoint ID, which
+    the host already knows.
+\end{description}
+
+\paragraph{ATTACH_TABLE request for AMD page table}\label{sec:Device Types / IOMMU Device / Acceleration / AMD GCR3 / ATTACH_TABLE / page table}
+
+When GPA based GCR3 table is not supported, the driver sends this
+request to update the device-managed GCR3 table. The
+\field{device} and \field{domain} have already been attached with
+a VIRTIO_IOMMU_ATTACH_TABLE_AMD_GCR3 request.
+
+\todo{this applies to all endpoints attached to the GCR3 table,
+hence only one request needed per domain and \field{endpoint} is
+meaningless}
+
+The driver sends DETACH requests with PASID to clear GCR3 table
+entries.
+
+\begin{lstlisting}
+struct virtio_iommu_req_attach_table_amd_pt {
+  struct virtio_iommu_req_head head;
+  le32  domain;
+  le32  endpoint;
+  u8    format;
+  u8    reserved[3];
+  le64  guest_page_table_pointer;
+  le32  pasid;
+
+  u8    reserved[XX];
+  struct virtio_iommu_req_tail tail;
+}
+\end{lstlisting}
+
+\begin{description}
+  \item[\field{format}] VIRTIO_IOMMU_ATTACH_TABLE_AMD_PT
+  \item[\field{pasid}] Index into the GCR3 table.
+  \item[\field{guest_page_table_pointer}] Pointer to the page
+    table.
+\end{description}
+
+\todo{arch-specific ATC invalidation: INVALIDATE_IOTLB_PAGES (ATC
+inv) has a custom inval types that avoid flushing dependent
+transactions, and one that flushes all transactions. It's
+endpoint-specific. Do we need to support it? First one seems like
+just an optimization that can be replaced by a standard ATC inv,
+but the second one may not have an equivalent in standard
+invalidation flags.}
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

