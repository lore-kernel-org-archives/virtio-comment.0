Return-Path: <virtio-comment-return-7596-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC10E81E17
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 519432AEEB
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 43306986827
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3344298681B; Fri,  6 Oct 2023 16:14:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EFF4398681F
	for <virtio-comment@lists.oasis-open.org>; Fri,  6 Oct 2023 16:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696608863; x=1697213663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKZNEXrVfJint3w4FOgocC56GLwANFKWy6FudqnwDsA=;
        b=nct74ZMhaySuNdcdQXdftuPq5emkdX17kqMkyd1zIirHQL9666SSwe0/bjiVzXCDMl
         s4Zf2AALQ/J8w5tl/D3Npb/e3XiJo1XuL+5mljkgoKcyL+JKcAAoZpxs5Yz27ySvBuZE
         rKYPX6t0/2L7v36P1f3wVF+VSoYbdRjd/dE4YWJbskNjB2OjGQSq7CxxP94tSLofTBre
         nTCA780d6SB7fFCF2DfbphP2YyEAU4btmV48hDE1K35xA8Y/McJY2UzP8FCt0ol92Fq4
         gFAXVSoqfWK6TlEKNXHJqciEl+1Ht7kkvnhrOkhclohkKLS4CTj6zUGlZ6XWCy4l56YG
         ivZA==
X-Gm-Message-State: AOJu0Yy+vOCD1sGJxe/vr7i23z0wdA7EK/cWaN6XrXuCKBLOgFW9lfAh
	blcI/WBoy8fvmrjqy03T4V8/J/E/mipc8zLswRE=
X-Google-Smtp-Source: AGHT+IFbvLC4rv2yB3W1JgyU91SYzIqjGX1/Mo1/7BYGHUmkriXz3/xz1N3XOEMYyEPa9daTtFFvrQ==
X-Received: by 2002:a05:600c:214f:b0:405:4002:825a with SMTP id v15-20020a05600c214f00b004054002825amr7683949wml.13.1696608863022;
        Fri, 06 Oct 2023 09:14:23 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: virtio-comment@lists.oasis-open.org
Cc: vivek.gautam@arm.com,
	tina.zhang@intel.com,
	seb@rivosinc.com,
	sameo@rivosinc.com,
	eric.auger@redhat.com,
	kevin.tian@intel.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Date: Fri,  6 Oct 2023 17:09:41 +0100
Message-ID: <20231006160947.2227396-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006160947.2227396-3-jean-philippe@linaro.org>
References: <20231006160947.2227396-3-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 1/9] virtio-iommu: Add ATTACH_TABLE request

Add a way to attach page tables to a domain. Only introduces the feature
bit and the ATTACH_TABLE request. We'll also need new PROBE properties
and INVALIDATE requests.

It could also be ATTACH followed by "SET_TABLE", or "ALLOC_WITH_TABLE"
followed by ATTACH, but this leads to fewer domain states. With
ATTACH_TABLE a domain can be free, attached-with-map or
attached-with-pgtable.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 device-types/iommu/description.tex | 113 +++++++++++++++++++++++++----
 1 file changed, 100 insertions(+), 13 deletions(-)

diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
index d9d484c..f81d96d 100644
--- a/device-types/iommu/description.tex
+++ b/device-types/iommu/description.tex
@@ -54,9 +54,7 @@ \subsection{Feature bits}\label{sec:Device Types / IOMMU Device / Feature bits}
   The number of domains supported is described in \field{domain_range}.
 
 \item[VIRTIO_IOMMU_F_MAP_UNMAP (2)]
-  Map and unmap requests are available.\footnote{Future extensions may add
-  different modes of operations. At the moment, only
-  VIRTIO_IOMMU_F_MAP_UNMAP is supported.}
+  Map and unmap requests are available.
 
 \item[VIRTIO_IOMMU_F_BYPASS (3)]
   Endpoints that are not attached to a domain are in bypass mode.
@@ -74,6 +72,8 @@ \subsection{Feature bits}\label{sec:Device Types / IOMMU Device / Feature bits}
   whether endpoints that are attached to a domain are in bypass
   mode.
 
+\item[VIRTIO_IOMMU_F_ATTACH_TABLE (7)]
+  The ATTACH_TABLE and INVALIDATE requests are available.
 \end{description}
 
 \drivernormative{\subsubsection}{Feature bits}{Device Types / IOMMU Device / Feature bits}
@@ -84,7 +84,8 @@ \subsection{Feature bits}\label{sec:Device Types / IOMMU Device / Feature bits}
 
 \devicenormative{\subsubsection}{Feature bits}{Device Types / IOMMU Device / Feature bits}
 
-The device SHOULD offer feature bit VIRTIO_IOMMU_F_MAP_UNMAP.
+The device MUST offer at least one of the
+VIRTIO_IOMMU_F_MAP_UNMAP or VIRTIO_IOMMU_F_ATTACH_TABLE features.
 
 The VIRTIO_IOMMU_F_BYPASS_CONFIG feature supersedes
 VIRTIO_IOMMU_F_BYPASS. New devices SHOULD NOT offer
@@ -142,10 +143,6 @@ \subsection{Device initialization}\label{sec:Device Types / IOMMU Device / Devic
 
 When the device is reset, endpoints are not attached to any domain.
 
-Future devices might support more modes of operation besides MAP/UNMAP.
-Drivers verify that devices set VIRTIO_IOMMU_F_MAP_UNMAP and fail
-gracefully if they don't.
-
 \drivernormative{\subsubsection}{Device Initialization}{Device Types / IOMMU Device / Device Initialization}
 
 The driver MUST NOT negotiate VIRTIO_IOMMU_F_MAP_UNMAP if it is incapable
@@ -177,11 +174,12 @@ \subsection{Device operations}\label{sec:Device Types / IOMMU Device / Device op
 Type may be one of:
 
 \begin{lstlisting}
-#define VIRTIO_IOMMU_T_ATTACH     1
-#define VIRTIO_IOMMU_T_DETACH     2
-#define VIRTIO_IOMMU_T_MAP        3
-#define VIRTIO_IOMMU_T_UNMAP      4
-#define VIRTIO_IOMMU_T_PROBE      5
+#define VIRTIO_IOMMU_T_ATTACH         1
+#define VIRTIO_IOMMU_T_DETACH         2
+#define VIRTIO_IOMMU_T_MAP            3
+#define VIRTIO_IOMMU_T_UNMAP          4
+#define VIRTIO_IOMMU_T_PROBE          5
+#define VIRTIO_IOMMU_T_ATTACH_TABLE   6
 \end{lstlisting}
 
 A few general-purpose status codes are defined here.
@@ -395,6 +393,89 @@ \subsubsection{ATTACH request}\label{sec:Device Types / IOMMU Device / Device op
 attached to the domain, the device SHOULD reject the request and
 set \field{status} to VIRTIO_IOMMU_S_UNSUPP.
 
+\subsubsection{ATTACH_TABLE request}\label{ref:Device Types / IOMMU Device / Device operations / ATTACH_TABLE request}
+
+\begin{lstlisting}
+struct virtio_iommu_req_attach_table {
+	struct virtio_iommu_req_head head;
+	le32 domain;
+	le32 endpoint;
+	u8   format;
+	u8   descriptor[111];
+	struct virtio_iommu_req_tail tail;
+};
+\end{lstlisting}
+
+Attach an endpoint to a domain, in the same way as an ATTACH
+request. In addition, provide the address of a table describing
+the mappings. Instead of using MAP and UNMAP requests, the driver
+creates and removes mappings by writing into the tables. When a
+mapping that may have been cached in a TLB is removed, the driver
+sends an INVALIDATE request.
+
+The driver discovers with a PROBE request the table formats
+supported by the device for each endpoint. The driver chooses a
+format it recognises, and sends the ATTACH_TABLE request.
+
+Apart from \field{domain}, \field{endpoint} and \field{format},
+each table format uses different parameters in field
+\field{descriptor}. Table formats and their associated parameters
+are described in section \ref{sec:Device Types / IOMMU Device /
+Acceleration}.
+
+Some formats support \emph{page tables}, where the ATTACH_TABLE
+request contains the address of a \emph{page directory}, the root
+of a page table tree which describe mappings of a single address
+space. Other formats support \emph{PASID tables}, which contain
+multiple page directory addresses, indexed by a 20-bit identifier
+called PASID (Process Address Space ID), providing multiple
+address spaces per endpoint. Field \field{domain} corresponds to
+one PASID table: a second ATTACH_TABLE request with the same
+\field{domain} and a different \field{endpoint} has the PASID
+table address. The device is not required to support attaching
+multiple endpoints to the same domain.
+
+For some formats, the PASID table is managed by the device rather
+than driver. The ATTACH_TABLE request contains a \field{pasid}
+field and a page directory. Similarly to when the driver manages
+the PASID table, \field{domain} corresponds to one PASID table.
+The driver uses the same \field{domain} for each ATTACH_TABLE
+request with PASID. Issuing a DETACH request without PASID
+detaches all address spaces that were attached with PASID for the
+given \field{domain}.
+
+An endpoint that supports issuing DMA with PASID can also issue
+DMA without PASID. The configuration method of the address space
+without PASID depends on the table format, but typically consists
+in reserving the first entry of the PASID table for DMA without
+PASID. In this case, for a format where the device manages PASID
+tables, ATTACH_TABLE requests with \field{pasid} 0 attaches a
+page directory for DMA without PASID, and DETACH request with
+\field{pasid} 0 detaches it. A DETACH request without
+VIRTIO_IOMMU_DETACH_F_PASID, on the other hand, detaches all page
+directories for the given \field{domain}.
+
+\drivernormative{\paragraph}{ATTACH_TABLE request}{Device Types / IOMMU Device / Device operations / ATTACH_TABLE request}
+
+The driver SHOULD NOT send ATTACH_TABLE requests if the
+VIRTIO_IOMMU_F_ATTACH_TABLE feature was not negotiated.
+
+The driver SHOULD NOT send ATTACH_TABLE requests with a
+\field{domain} currently attached without table. It SHOULD NOT
+send ATTACH requests with a \field{domain} currently attached
+with table.
+
+\devicenormative{\paragraph}{ATTACH_TABLE request}{Device Types / IOMMU Device / Device operations / ATTACH_TABLE request}
+
+If the endpoint identified by \field{endpoint} is already
+attached to another domain, then the device SHOULD first detach
+it from that domain and attach it to the one identified by
+\field{domain}. In that case the device SHOULD behave as if the
+driver issued a DETACH request with this \field{endpoint},
+followed by the ATTACH_TABLE request. If the device cannot do so,
+it MUST reject the request and set \field{status} to
+VIRTIO_IOMMU_S_UNSUPP.
+
 \subsubsection{DETACH request}
 
 \begin{lstlisting}
@@ -512,6 +593,9 @@ \subsubsection{MAP request}\label{sec:Device Types / IOMMU Device / Device opera
 If the VIRTIO_IOMMU_F_MMIO feature isn't negotiated, the driver MUST NOT
 use the VIRTIO_IOMMU_MAP_F_MMIO flag.
 
+\field{domain} SHOULD NOT have been created with an ATTACH_TABLE
+request.
+
 \devicenormative{\paragraph}{MAP request}{Device Types / IOMMU Device / Device operations / MAP request}
 
 If \field{virt_start}, \field{phys_start} or (\field{virt_end} + 1) is
@@ -609,6 +693,9 @@ \subsubsection{UNMAP request}\label{sec:Device Types / IOMMU Device / Device ope
 
 The driver SHOULD NOT send UNMAP requests on a bypass domain.
 
+\field{domain} SHOULD NOT have been created with an ATTACH_TABLE
+request.
+
 \devicenormative{\paragraph}{UNMAP request}{Device Types / IOMMU Device / Device operations / UNMAP request}
 
 If the \field{reserved} field of an UNMAP request is not zero, the device
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

