Return-Path: <virtio-comment-return-8987-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFE6C47DAF
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 47A4D19090B
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 339849867BC
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 251C59865B8; Mon, 22 Jan 2024 17:21:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 175279865B9
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 Jan 2024 17:21:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944087; x=1706548887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtdNt4XmY3PDcNP34YewPin5dlODC8nvV5NzE8bWv0M=;
        b=dM9mdukuF7g4eBxv8rIHfB/GvmTMb8+E0vklutyzCXNqdsA8ffX5PiOl5a7tTA4PNm
         Bw63vQpTiIR9GFJAnNenLX2xl28uOnJft8oVjm9Alc+KMkAzy1w3m/suEoIPNsuk0R6U
         Rcz9QgtkBxSWOyCCHwMN+vnnsPCJ95dMaLq4aDIAgd1VB6bVXPfRbi8IukbobH8hToZP
         8bzBgMo0GxtjhQ66Zq57Sj+94pfsefw6Ydp9cG6fjC087Ks4u29A9RQgA79Buhj3Yhks
         PgOXe88e1iuOIe7nh41TVl51bbFf9vUoCKwRGaAQ8xSLPQxRdlQPgDwn78NVVKYy/JWW
         63yw==
X-Gm-Message-State: AOJu0YyPTzjPgjUHPxi4ZL+W1kH+l+JZbqu7oD7cy3U8b8INjZ7wtWMC
	KURcTgWR+ixORU2a9Rw4N0y6UCP+GjhNDOpANt9TWIE0oO9RJWyvPeohSC47PyALa6/Tp9zoVpf
	7
X-Google-Smtp-Source: AGHT+IGBpf/Aji3rEXGNaq9bYQrYdf9nrvABu1pdScR3+p7sfyIMprZrvodhJzhaRV+INqmv0XaGoA==
X-Received: by 2002:a05:600c:314e:b0:40d:685c:3880 with SMTP id h14-20020a05600c314e00b0040d685c3880mr2593299wmo.176.1705944087376;
        Mon, 22 Jan 2024 09:21:27 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: virtio-comment@lists.oasis-open.org
Cc: vivek.gautam@arm.com,
	tina.zhang@intel.com,
	seb@rivosinc.com,
	sameo@rivosinc.com,
	eric.auger@redhat.com,
	kevin.tian@intel.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Date: Mon, 22 Jan 2024 17:14:36 +0000
Message-ID: <20240122171442.1740297-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122171442.1740297-2-jean-philippe@linaro.org>
References: <20240122171442.1740297-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v3 2/9] virtio-iommu: Add INVALIDATE request

Add a request that invalidates mappings of a domain attached with table.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 device-types/iommu/description.tex        | 165 ++++++++++++++++++++++
 device-types/iommu/device-conformance.tex |   1 +
 device-types/iommu/driver-conformance.tex |   1 +
 3 files changed, 167 insertions(+)

diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
index edf8811..c20897a 100644
--- a/device-types/iommu/description.tex
+++ b/device-types/iommu/description.tex
@@ -180,6 +180,7 @@ \subsection{Device operations}\label{sec:Device Types / IOMMU Device / Device op
 #define VIRTIO_IOMMU_T_UNMAP          4
 #define VIRTIO_IOMMU_T_PROBE          5
 #define VIRTIO_IOMMU_T_ATTACH_TABLE   6
+#define VIRTIO_IOMMU_T_INVALIDATE     7
 \end{lstlisting}
 
 A few general-purpose status codes are defined here.
@@ -712,6 +713,170 @@ \subsubsection{UNMAP request}\label{sec:Device Types / IOMMU Device / Device ope
 mapping, then the device SHOULD remove all mappings affected by the range
 and set the request \field{status} to VIRTIO_IOMMU_S_OK.
 
+\subsubsection{INVALIDATE request}\label{sec:Device Types / IOMMU Device / Device operations / INVALIDATE request}
+
+\begin{lstlisting}
+struct virtio_iommu_req_invalidate {
+  struct virtio_iommu_req_head head;
+  u8    scope;
+  u8    caches;
+  le16  flags;
+  le32  domain;
+  le32  pasid;
+  le64  id;
+  le64  address;
+  le64  nr_pages;
+  u8    page_size;
+  u8    reserved[19];
+  struct virtio_iommu_req_tail tail;
+};
+
+#define VIRTIO_IOMMU_INVAL_S_DOMAIN   1
+#define VIRTIO_IOMMU_INVAL_S_PASID    2
+#define VIRTIO_IOMMU_INVAL_S_ADDRESS  3
+
+#define VIRTIO_IOMMU_INVAL_C_PASID    (1 << 0)
+#define VIRTIO_IOMMU_INVAL_C_TLB      (1 << 1)
+
+#define VIRTIO_IOMMU_INVAL_F_LEAF     (1 << 0)
+#define VIRTIO_IOMMU_INVAL_F_PASID    (1 << 1)
+#define VIRTIO_IOMMU_INVAL_F_ID       (1 << 2)
+#define VIRTIO_IOMMU_INVAL_F_GLOBAL   (1 << 3)
+\end{lstlisting}
+
+Invalidate a mapping or configuration. When using PASID or page
+tables, the driver sends an INVALIDATE request to signal changes
+to table entries that might have been cached by the device, and
+to synchronize with table walkers.
+
+Field \field{scope} specifies which entries to invalidate:
+\begin{description}
+  \item[VIRTIO_IOMMU_INVAL_S_DOMAIN] invalidates all cached
+    entries for the given \field{domain}.
+  \item[VIRTIO_IOMMU_INVAL_S_PASID] invalidates all cached
+    entries for the given \field{domain} and \field{pasid}.
+  \item[VIRTIO_IOMMU_INVAL_S_ADDRESS] invalidates all cached
+    entries for the given \field{domain}, \field{pasid} and
+    virtual address range.
+\end{description}
+
+Field \field{caches} specifies which caches to invalidate:
+\begin{description}
+  \item[VIRTIO_IOMMU_INVAL_C_PASID] Invalidate entries cached
+    from the PASID table.
+  \item[VIRTIO_IOMMU_INVAL_C_TLB] Invalidate entries from the
+    Translation Lookaside Buffers (TLBs), including device TLBs
+    such as those implemented with the PCIe ATS extension.
+\end{description}
+
+For example, when the driver removes a mapping from a table
+attached to the \field{domain}, it sends an INVALIDATE request
+for \field{scope} ADDRESS and \field{caches} TLB. To invalidate
+the whole address space the driver sets the \field{scope} to
+DOMAIN, or to PASID when using a PASID table. When removing a
+page directory from a PASID table entry, the driver sends an
+INVALIDATE request with \field{scope} PASID, and all
+\field{caches} flags set.
+
+Field \field{flags} specifies additional information:
+\begin{description}
+  \item[VIRTIO_IOMMU_INVAL_F_LEAF] Only invalidate TLB entries
+    cached from leaf table entries.
+  \item[VIRTIO_IOMMU_INVAL_F_PASID] The \field{pasid} field is
+    valid.
+  \item[VIRTIO_IOMMU_INVAL_F_ID] The \field{id} field is valid.
+  \item[VIRTIO_IOMMU_INVAL_F_GLOBAL] In addition to TLB entries
+    targeted by the invalidation, also invalidate global entries.
+    For example PCIe ATS may create global entries if the IOMMU
+    sets the Global mapping bit in a Translation Completion.
+\end{description}
+
+Use of field \field{id} is specific to the table format. Some
+formats use only the PASID to identify address spaces within a
+domain, others use a separate ID for TLB entries.
+
+For a \field{scope} of VIRTIO_IOMMU_INVAL_S_ADDRESS, the
+invalidation affects the range of virtual addresses of size
+$\field{nr\_pages} \times 2^\field{page\_size}$, starting at
+\field{address}. Specifying the range size this way allows the
+device to efficiently remove TLB entries. For example a page
+table format could allow a 2MiB range to be mapped with either
+512 4KiB pages, or a single 2MiB block. In the latter case a
+single TLB entry is used, so the driver specifies a
+\field{page_size} of 21 and the device does not need to iterate
+over all 4KiB multiples to invalidate the range.
+
+The following table describes valid \field{caches}, \field{flags}
+and fields for each \field{scope}:
+
+\begin{tabular}{|l|c|c|c|}
+\hline
+  \field{scope}       & DOMAIN      & PASID               & ADDRESS \\
+\hline
+  \field{caches}      & PASID, TLB  & PASID, TLB          & TLB \\
+  \field{flags}       & ID          & LEAF, PASID, ID     & LEAF, PASID, ID, GLOBAL \\
+  \field{domain}      & Y           & Y                   & Y \\
+  \field{pasid}       & N           & Y                   & Y \\
+  \field{id}          & Y           & Y                   & Y \\
+  \field{address}     & N           & N                   & Y \\
+  \field{nr_pages}    & N           & N                   & Y \\
+  \field{page_size}   & N           & N                   & Y \\
+\hline
+\end{tabular}
+
+When using a PASID table, an invalidation of \field{scope}
+PASID or ADDRESS without VIRTIO_IOMMU_INVAL_F_PASID targets cache
+entries that were created by DMA transactions without PASID.
+Depending on the hardware implementation, this may behave in the
+same way as an invalidation of \field{scope} DOMAIN, clearing all
+cached entries including those with PASID. Notably, it is the
+behavior specified by the PCIe ATS extension.
+
+\devicenormative{\paragraph}{INVALIDATE request}{Device Types / IOMMU Device / Device operations / INVALIDATE request}
+
+After handling an INVALIDATE request, the device SHOULD NOT let
+endpoints attached to \field{domain} access virtual address in
+the invalidated range, unless the range is valid in the table
+attached to the \field{domain}. In other words, the device SHOULD
+access the virtual address through the attached tables instead of
+a cache.
+
+For a \field{scope} of VIRTIO_IOMMU_INVAL_S_DOMAIN, the device
+SHOULD ignore fields \field{pasid}, \field{address},
+\field{nr_pages} and \field{page_size}.
+
+For a \field{scope} of VIRTIO_IOMMU_INVAL_S_PASID, the device
+SHOULD ignore fields \field{address}, \field{nr_pages},
+\field{page_size},
+
+If no cache entry exist for the given parameters, the device
+SHOULD set the \field{status} field to VIRTIO_IOMMU_S_OK. In
+other words, spurious invalidations are allowed.
+
+The device MAY invalidate more entries and caches than requested,
+and MAY ignore flag VIRTIO_IOMMU_INVAL_F_LEAF. Over-invalidation
+is allowed, but under-invalidation is not.
+
+\drivernormative{\paragraph}{INVALIDATE request}{Device Types / IOMMU Device / Device operations / INVALIDATE request}
+
+\field{domain} MUST have been created with an ATTACH_TABLE
+request.
+
+For a \field{scope} of VIRTIO_IOMMU_INVAL_S_DOMAIN, the driver
+SHOULD set fields \field{pasid}, \field{address},
+\field{nr_pages} and \field{page_size} to zero.
+
+For a \field{scope} of VIRTIO_IOMMU_INVAL_S_PASID, the driver
+SHOULD set fields \field{address}, \field{nr_pages},
+\field{page_size} to zero.
+
+An invalidation with \field{scope} VIRTIO_IOMMU_INVAL_S_PASID or
+VIRTIO_IOMMU_INVAL_S_ADDRESS that targets cache entries created
+by transactions with PASID SHOULD have a valid \field{pasid} field,
+not solely a valid \field{id} field. This is because a platform can
+enable device caches such as PCIe ATS implicitly, requiring a PASID in
+the invalidation.
+
 \subsubsection{PROBE request}\label{sec:Device Types / IOMMU Device / Device operations / PROBE request}
 
 If the VIRTIO_IOMMU_F_PROBE feature bit is present, the driver sends a
diff --git a/device-types/iommu/device-conformance.tex b/device-types/iommu/device-conformance.tex
index 3c71354..d6ce69b 100644
--- a/device-types/iommu/device-conformance.tex
+++ b/device-types/iommu/device-conformance.tex
@@ -11,6 +11,7 @@
 \item \ref{devicenormative:Device Types / IOMMU Device / Device operations / DETACH request}
 \item \ref{devicenormative:Device Types / IOMMU Device / Device operations / MAP request}
 \item \ref{devicenormative:Device Types / IOMMU Device / Device operations / UNMAP request}
+\item \ref{devicenormative:Device Types / IOMMU Device / Device operations / INVALIDATE request}
 \item \ref{devicenormative:Device Types / IOMMU Device / Device operations / PROBE request}
 \item \ref{devicenormative:Device Types / IOMMU Device / Device operations / PROBE properties / RESVMEM}
 \item \ref{devicenormative:Device Types / IOMMU Device / Device operations / Fault reporting}
diff --git a/device-types/iommu/driver-conformance.tex b/device-types/iommu/driver-conformance.tex
index d7a313c..fa77bc7 100644
--- a/device-types/iommu/driver-conformance.tex
+++ b/device-types/iommu/driver-conformance.tex
@@ -12,6 +12,7 @@
 \item \ref{drivernormative:Device Types / IOMMU Device / Device operations / DETACH request}
 \item \ref{drivernormative:Device Types / IOMMU Device / Device operations / MAP request}
 \item \ref{drivernormative:Device Types / IOMMU Device / Device operations / UNMAP request}
+\item \ref{drivernormative:Device Types / IOMMU Device / Device operations / INVALIDATE request}
 \item \ref{drivernormative:Device Types / IOMMU Device / Device operations / PROBE request}
 \item \ref{drivernormative:Device Types / IOMMU Device / Device operations / PROBE properties / RESVMEM}
 \item \ref{drivernormative:Device Types / IOMMU Device / Device operations / Fault reporting}
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

