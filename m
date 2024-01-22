Return-Path: <virtio-comment-return-8991-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC53C47DDB
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2C7C13359B
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0ED7F9867BD
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F3676986556; Mon, 22 Jan 2024 17:21:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E3E5C9866BA
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 Jan 2024 17:21:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944090; x=1706548890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ye+QV7QxQfIGeQ2EgtwwT1XymIPkvWc3rxl7cpmEfs0=;
        b=Fnvp7P/xJXK0aOPnPzH7odCxcvrDWDJ3XA4sFBKBoAYbboUWDza+TdTMizudxP7ukC
         AZSj6FhhuTUnPGVzYYGg7Q3LFXqfbEPmF/Ccw/1TQYyPsIc/jmt7fvrEjshzrJes+urD
         jE7Yun+puy+t1kgahZ10y4jCv0q9Qcfg1zyNhs3PEYMau8S3Uy4ADV1LhupS5/SK6Na1
         dqaMOiv/1N4LNAxJVooe0AbUxqdtuEkBjg1XfxWpSXCbFjRMTSgEkVXMfxsuxl+pcArp
         sKSsFvBz8n5GObZBUwHnHL260CMafJaqUgiOnDbL2i8FfEm/nyoMunoKqXL/2KbT3V5W
         P3BA==
X-Gm-Message-State: AOJu0Ywukeht0/t3VIIgbDBHqMS5dExR0nrUjNMRExWq7sd2RAsMT08m
	fqsJGqKGwc+WyAHcyA6FuQxhO9eOZ5rcbxgBhQ5hcvhdQZRcMg/QjYbfoUQBgOfyRA/h/+yHNSx
	W
X-Google-Smtp-Source: AGHT+IF6nOIK7/8Ra9KuRI8tai1AVZHXooSLVLgQooKAUbYJVVlpalzcGEEKYUHkwXWkEyo3ho3xWA==
X-Received: by 2002:a05:600c:3148:b0:40e:40b3:99e9 with SMTP id h8-20020a05600c314800b0040e40b399e9mr2210347wmo.108.1705944089999;
        Mon, 22 Jan 2024 09:21:29 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: virtio-comment@lists.oasis-open.org
Cc: vivek.gautam@arm.com,
	tina.zhang@intel.com,
	seb@rivosinc.com,
	sameo@rivosinc.com,
	eric.auger@redhat.com,
	kevin.tian@intel.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Date: Mon, 22 Jan 2024 17:14:39 +0000
Message-ID: <20240122171442.1740297-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122171442.1740297-2-jean-philippe@linaro.org>
References: <20240122171442.1740297-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v3 5/9] virtio-iommu: Add VT-d IO page table

From: Tina Zhang <tina.zhang@intel.com>

Allow a driver of a device behind virtio-iommu to detect support for
VT-d IO page table.

The driver detects support for VT-d IO page table format in a PROBE
request and sends an ATTACH_TABLE request with a pointer to the first
stage page translation table.

The guest needs to know what the host configured in RID_PASID. The value
that the host picks for RID_PASID is reserved for DMA requests without
PASID. When the guest allocates PASIDs, it cannot use this value, unless
the host virtualizes the PASID space. In reality we expect that 0 will
be used everywhere for non-PASID DMA, but it's a lot easier to include
this field now than to add it later when some host happens to do things
differently.

The guest also needs to know what the host configured in RID_PRIV. This
bit selects the translation attribute of DMA-without-PASID, and the
guest needs to configure those page tables accordingly.

The definition of first stage page translation table ATTACH_TABLE
request references the fields defined in VT-d scalable-mode PASID table
entry, among them:
* FSPTPTR obtained from pgtbl_addr field.
* SRE/EAFE/WPE... defined in pgtbl_flags field. Most of these depend on
  ECAP feature bit and can thus be disabled by a device that doesn't
  support setting them. For example a device that doesn't support
  setting EAFE=1 clears ECAP_REG.EAFS.
* FSPM calculated through addr_width field.
* PASID obtained from pasid field.

MTS is not present at the moment, because it's not yet clear how to
implement it - should it be a device or driver decision, or either.
Most new features can later be supported like this:
(1) Add a feature flag to the PROBE property. In some cases that flag is
    already present in CAP/ECAP, and simply needs to be set. The device
    offers the new flag. For example, set ECAP_REG.MTS
(2) Add a flag to ATTACH_TABLE, and any relevant field. The driver acks
    the new feature by setting the flag. For example, add a PAT flag and
    a PAT field to set the PAT array in the PASID table.
In most cases adding features won't require a new virtio-iommu feature
bit because PROBE properties are designed to be extensible on their own,
and ATTACH_TABLE has empty space and flags for this purpose.

Signed-off-by: Tina Zhang <tina.zhang@intel.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v2->v3:

* Dropped redundant descriptions of CAP and ECAP. They belong in
  virtio_iommu.h

* Changed the value of SRE, EAFE, WPE flags. Added flags PGSNP and
  PWSNP.

* Describe the meaning of \field{domain}: it's the DID, and its size is
  CAP_REG.ND.

* Added RID_PASID and RID_PRIV fields. And forbid using a \field{pasid}
  that corresponds to RID_PASID.

* Added F_PASID flag to ATTACH_TABLE. Just to make it consistent with
  INVALIDATE. Invalidating the non-PASID address space is done by
  omitting the F_PASID flag in INVALIDATE (rather than passing
  RID_PASID). TLBs can differentiate between entries without PASID and
  entries with PASID 0 (which can be created with some configurations,
  such as SMMU S1DSS=0b00), so INVALIDATE needs a way to target either.
  Having a F_PASID flag in ATTACH_TABLE also reflects better what the
  driver actually wants to do: attach the non-PASID address space by not
  setting a valid PASID field, rather than using a special value.

* The DETACH F_PASID flag now has the same meaning as ATTACH_TABLE.
  There is no way to detach all address spaces for an endpoint in one
  go. That would require a new DETACH flag.

* Add a requirements to clear ECAP.MTS. This allows to implement it
  easily in the future: just add a flag, CD bit and PAT field to
  ATTACH_TABLE, and turn ECAP.MTS on.
---
 device-types/iommu/description.tex        |   3 +
 device-types/iommu/device-conformance.tex |   1 +
 device-types/iommu/driver-conformance.tex |   1 +
 device-types/iommu/pgtable-intel.tex      | 118 ++++++++++++++++++++++
 introduction.tex                          |   3 +
 5 files changed, 126 insertions(+)
 create mode 100644 device-types/iommu/pgtable-intel.tex

diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
index be01fb1..0ec067c 100644
--- a/device-types/iommu/description.tex
+++ b/device-types/iommu/description.tex
@@ -407,6 +407,7 @@ \subsubsection{ATTACH_TABLE request}\label{ref:Device Types / IOMMU Device / Dev
 };
 
 #define VIRTIO_IOMMU_ATTACH_TABLE_ARM_SMMU3       1
+#define VIRTIO_IOMMU_ATTACH_TABLE_INTEL_PT        2
 \end{lstlisting}
 
 Attach an endpoint to a domain, in the same way as an ATTACH
@@ -997,6 +998,7 @@ \subsubsection{PROBE properties}\label{sec:Device Types / IOMMU Device / Device
 \begin{lstlisting}
 #define VIRTIO_IOMMU_PROBE_T_RESV_MEM       1
 #define VIRTIO_IOMMU_PROBE_T_HW_ARM_SMMU3   2
+#define VIRTIO_IOMMU_PROBE_T_HW_INTEL_VTD   3
 \end{lstlisting}
 
 \paragraph{Property RESV_MEM}\label{sec:Device Types / IOMMU Device / Device operations / PROBE properties / RESVMEM}
@@ -1148,3 +1150,4 @@ \subsubsection{Fault reporting}\label{sec:Device Types / IOMMU Device / Device o
 \subsection{Acceleration}\label{sec:Device Types / IOMMU Device / Acceleration}
 
 \input{device-types/iommu/pgtable-arm}
+\input{device-types/iommu/pgtable-intel}
diff --git a/device-types/iommu/device-conformance.tex b/device-types/iommu/device-conformance.tex
index d6ce69b..a84df9f 100644
--- a/device-types/iommu/device-conformance.tex
+++ b/device-types/iommu/device-conformance.tex
@@ -15,4 +15,5 @@
 \item \ref{devicenormative:Device Types / IOMMU Device / Device operations / PROBE request}
 \item \ref{devicenormative:Device Types / IOMMU Device / Device operations / PROBE properties / RESVMEM}
 \item \ref{devicenormative:Device Types / IOMMU Device / Device operations / Fault reporting}
+\item \ref{devicenormative:Device Types / IOMMU Device / Acceleration / Intel / ATTACH_TABLE}
 \end{itemize}
diff --git a/device-types/iommu/driver-conformance.tex b/device-types/iommu/driver-conformance.tex
index fa77bc7..9c8b8ca 100644
--- a/device-types/iommu/driver-conformance.tex
+++ b/device-types/iommu/driver-conformance.tex
@@ -16,4 +16,5 @@
 \item \ref{drivernormative:Device Types / IOMMU Device / Device operations / PROBE request}
 \item \ref{drivernormative:Device Types / IOMMU Device / Device operations / PROBE properties / RESVMEM}
 \item \ref{drivernormative:Device Types / IOMMU Device / Device operations / Fault reporting}
+\item \ref{drivernormative:Device Types / IOMMU Device / Acceleration / Intel / ATTACH_TABLE}
 \end{itemize}
diff --git a/device-types/iommu/pgtable-intel.tex b/device-types/iommu/pgtable-intel.tex
new file mode 100644
index 0000000..4562ce0
--- /dev/null
+++ b/device-types/iommu/pgtable-intel.tex
@@ -0,0 +1,118 @@
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
+  u8    reserved[4];
+  le64  cap_reg;
+  le64  ecap_reg;
+  le32  rid_pasid;
+  u8    reserved2[4];
+};
+
+#define VIRTIO_IOMMU_PROBE_HW_INTEL_VTD_RID_PASID   0xfffff
+#define VIRTIO_IOMMU_PROBE_HW_INTEL_VTD_RID_PRIV    (1 << 20)
+\end{lstlisting}
+
+\begin{description}
+  \item[\field{cap_reg}] Capability Register.
+  \item[\field{ecap_reg}] Extended Capability Register.
+  \item[\field{rid_pasid}] When ECAP_REG.RPS is set,
+    VIRTIO_IOMMU_PROBE_HW_INTEL_VTD_RID_PASID bits in this field
+    correspond to the value of the RID_PASID field in the
+    scalable-mode context-entry of the probed endpoint.
+
+    When ECAP_REG.RPRIVS is set, bit
+    VIRTIO_IOMMU_PROBE_HW_INTEL_VTD_RID_PRIV in this field
+    corresponds to the value of the RID_PRIV field in the
+    scalable-mode context-entry of the probed endpoint.
+\end{description}
+
+\paragraph{ATTACH_TABLE request for VT-d page table}\label{sec:Device Types / IOMMU Device / Acceleration / Intel / ATTACH_TABLE}
+
+Attach a single set of page tables to an endpoint, using scalable
+mode tables (RTADDR_REG.TTM = 01).
+
+\begin{lstlisting}
+struct virtio_iommu_req_attach_table_intel {
+  struct virtio_iommu_req_head head;
+  le32  domain;
+  le32  endpoint;
+  u8    format;
+  u8    reserved[3];
+  le32  flags;
+  le32  pasid;
+  le64  pgtbl_addr;
+  le64  pgtbl_flags;
+  le32  addr_width;
+  u8    reserved[80];
+  struct virtio_iommu_req_tail tail;
+};
+
+#define VIRTIO_IOMMU_HW_INTEL_VTD_F_PASID         (1 << 0)
+
+/* Intel VT-d first-stage page table flags */
+#define VIRTIO_IOMMU_HW_INTEL_VTD_SRE             (1 << 0)
+#define VIRTIO_IOMMU_HW_INTEL_VTD_WPE             (1 << 1)
+#define VIRTIO_IOMMU_HW_INTEL_VTD_EAFE            (1 << 2)
+#define VIRTIO_IOMMU_HW_INTEL_VTD_PGSNP           (1 << 3)
+#define VIRTIO_IOMMU_HW_INTEL_VTD_PWSNP           (1 << 4)
+\end{lstlisting}
+
+\begin{description}
+  \item[\field{flags}]
+    \begin{description}
+      \item[VIRTIO_IOMMU_HW_INTEL_VTD_F_PASID] Field
+        \field{pasid} is valid.
+    \end{description}
+  \item[\field{domain}] Corresponds to DID, the Domain Identifier
+    in the VT-d Scalable-mode PASID table entry. The combination
+    of DID and PASID uniquely identifies a DMA address space.
+    The number of bits supported in \field{domain} is defined by
+    CAP_REG.ND. A single \field{domain} space is shared between
+    ATTACH and ATTACH_TABLE requests, but the \field{domain}
+    field in ATTACH requests is limited by \field{domain_range},
+    which can be larger than CAP_REG.ND.
+  \item[\field{format}] VIRTIO_IOMMU_ATTACH_TABLE_INTEL_PT.
+  \item[\field{pasid}] Process Address Space Identifier (PASID),
+    allocated by the driver.
+  \item[\field{pgtbl_addr}] First-stage page table base address.
+  \item[\field{pgtbl_flags}] First-stage page table entry attributes:
+    \begin{description}
+      \item{SRE} Supervisor Request, when ECAP_REG.SRE is 1.
+      \item{WPE} Write Protect.
+      \item{EAFE} Extended Accessed Flag, when ECAP_REG.EAFS is 1.
+      \item{PGSNP} Page Snoop, when ECAP_REG.SC is 1.
+      \item{PWSNP} Page-Walk Snoop, when ECAP_REG.SMPWC is 1.
+    \end{description}
+  \item[\field{addr_width}] The address width of the untranslated
+    addresses that are subjected to the first-stage page table.
+    This also defines the number of levels of page tables (FSPM).
+\end{description}
+
+\devicenormative{\subparagraph}{ATTACH_TABLE request for VT-d page table}{Device Types / IOMMU Device / Acceleration / Intel / ATTACH_TABLE}
+
+The device SHOULD NOT set ECAP_REG.MTS. Page table attributes are
+not supported.
+
+\drivernormative{\subparagraph}{ATTACH_TABLE request for VT-d page table}{Device Types / IOMMU Device / Acceleration / Intel / ATTACH_TABLE}
+
+The driver SHOULD NOT use the value given by RID_PASID in field
+\field{pasid} of an ATTACH_TABLE request, or a DETACH request. It
+is reserved for DMA without PASID.
+
+\paragraph{INVALIDATE request for VT-d page table}\label{sec:Device Types / IOMMU Device / Acceleration / Intel / INVALIDATE}
+
+Supported values for field \field{scope} are
+VIRTIO_IOMMU_INVAL_S_PASID and VIRTIO_IOMMU_INVAL_S_ADDRESS.
+The only supported value for field \field{caches} is
+VIRTIO_IOMMU_INVAL_C_TLB. Field \field{id} is not used.
diff --git a/introduction.tex b/introduction.tex
index 753d5d0..9d0f5c5 100644
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

