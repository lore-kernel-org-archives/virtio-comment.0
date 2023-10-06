Return-Path: <virtio-comment-return-7593-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712FEE81E19
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 915F1F3F6D
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F0675986924
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AC7E7986821; Fri,  6 Oct 2023 16:14:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 42807986841
	for <virtio-comment@lists.oasis-open.org>; Fri,  6 Oct 2023 16:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696608866; x=1697213666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1jY/18M6kyH8rLWNef04M1VB7y0h21GLTon78XPABo=;
        b=P8J3fgpSLU1ynxTSagU4BgtT58oKXumIBLYy3/3j3nUYiUM5xe2IVyPgxABy5+LMfD
         k8bDMBEoD8UbECQVufXIjcV3pA/QV/fq1H0N1QsZIqZsLM9cwyEKNj02W9OQEkZA8mHo
         6IYenItwEoeY/ZKbC4aMeHH8DSVNU1yHa22ebJbSiY+cENR67YbuGZokvpGjXcV3tr3v
         Aeagf69xnmllfu9I7k8ZbiT5uMtp+NArDK7YS30jSmN2d/fz0fzkp5ketvQr6hzx6oLi
         xzvZGGmqnzIlV1vPb6k/5u2NtXE1h/kmxxko+IyIKmk7VniOz6mKlxStDYXIlpz/+VSX
         HIxw==
X-Gm-Message-State: AOJu0YynUDP028L9FaP9A48s+QUW7DQ5Yk+hN34+i+jniDwWbhPhIs8K
	XgLcb75JjOnKnBYceb6xmD7glm7GPOKergRXwVQ=
X-Google-Smtp-Source: AGHT+IGPZYew4aes8uI7er7S/xduLtZBdKLWnQ+8dSH3td2JmQOCt65nmm+BWHZ9Ajs+R6GGe8bWEA==
X-Received: by 2002:a5d:6a01:0:b0:317:727f:3bc7 with SMTP id m1-20020a5d6a01000000b00317727f3bc7mr7712479wru.17.1696608866343;
        Fri, 06 Oct 2023 09:14:26 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: virtio-comment@lists.oasis-open.org
Cc: vivek.gautam@arm.com,
	tina.zhang@intel.com,
	seb@rivosinc.com,
	sameo@rivosinc.com,
	eric.auger@redhat.com,
	kevin.tian@intel.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Date: Fri,  6 Oct 2023 17:09:48 +0100
Message-ID: <20231006160947.2227396-11-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006160947.2227396-3-jean-philippe@linaro.org>
References: <20231006160947.2227396-3-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 8/9] virtio-iommu: Add VIRTIO_IOMMU_RESV_MEM_T_IDENTITY

To support MSIs on platforms that translate MSI addresses (Arm, possibly
RISC-V), when using page tables, the driver needs to create IOVA-GPA
mappings of addresses reserved by the platform.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 device-types/iommu/description.tex | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
index 38f94f8..dcb51d3 100644
--- a/device-types/iommu/description.tex
+++ b/device-types/iommu/description.tex
@@ -1031,7 +1031,10 @@ \subsubsection{PROBE properties}\label{sec:Device Types / IOMMU Device / Device
   u8    reserved[3];
   le64  start;
   le64  end;
+  le32  flags;
 };
+
+#define VIRTIO_IOMMU_RESV_MEM_F_MMIO      (1 << 0)
 \end{lstlisting}
 
 Fields \field{start} and \field{end} describe the range of reserved virtual
@@ -1051,6 +1054,27 @@ \subsubsection{PROBE properties}\label{sec:Device Types / IOMMU Device / Device
     In addition it provides information about MSI doorbells. If the
     endpoint doesn't have a VIRTIO_IOMMU_RESV_MEM_T_MSI property, then the
     driver creates an MMIO mapping to the doorbell of the MSI controller.
+
+  \item[VIRTIO_IOMMU_RESV_MEM_T_IDENTITY (2)]
+    When using page tables, the driver creates an identity
+    mapping for this region, in order to get full functionality
+    of the endpoint. When not using page tables, this behaves
+    like a VIRTIO_IOMMU_RESV_MEM_T_RESERVED region.
+
+    The intent is to create MSI doorbell mappings when the driver
+    uses VIRTIO_IOMMU_T_ATTACH_TABLE, the platform manages MSIs
+    and the hardware IOMMU translates MSI addresses using page
+    tables. In that case the driver fully controls the mappings,
+    so the platform requests through this property that the
+    driver creates itself the mapping to the MSI doorbell. When
+    not using page tables, the platform can create the mappings
+    itself and this is simply a reserved region.
+
+    Flag VIRTIO_IOMMU_RESV_MEM_F_MMIO tells the driver to create
+    an MMIO mapping.
+    \todo{Does each acceleration need to define what MMIO means?
+    Arm has a lot of MMIO flavors. Do we need a common
+    non-cacheable definition as well?}
 \end{description}
 
 \drivernormative{\subparagraph}{Property RESV_MEM}{Device Types / IOMMU Device / Device operations / PROBE properties / RESVMEM}
@@ -1063,6 +1087,9 @@ \subsubsection{PROBE properties}\label{sec:Device Types / IOMMU Device / Device
 The driver SHOULD treat any \field{subtype} it doesn't recognize as if it
 was VIRTIO_IOMMU_RESV_MEM_T_RESERVED.
 
+The driver SHOULD create an identity mapping described by
+VIRTIO_IOMMU_RESV_MEM_T_IDENTITY, when using page tables.
+
 \devicenormative{\subparagraph}{Property RESV_MEM}{Device Types / IOMMU Device / Device operations / PROBE properties / RESVMEM}
 
 The device SHOULD set \field{reserved} to zero.
@@ -1073,7 +1100,8 @@ \subsubsection{PROBE properties}\label{sec:Device Types / IOMMU Device / Device
 The device SHOULD NOT present multiple RESV_MEM properties that overlap
 each other for the same endpoint.
 
-The device SHOULD reject a MAP request that overlaps a RESV_MEM region.
+The device SHOULD reject a MAP request that overlaps a RESV_MEM
+region.
 
 The device SHOULD NOT allow accesses from the endpoint to RESV_MEM regions
 to affect any other component than the endpoint and the driver.
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

