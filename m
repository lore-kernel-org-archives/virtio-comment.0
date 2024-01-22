Return-Path: <virtio-comment-return-8993-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DD3C47DD9
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 06ACB412A5
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 02B9C9867D9
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E90B098670A; Mon, 22 Jan 2024 17:21:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5D80A9867E4
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 Jan 2024 17:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944092; x=1706548892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7DioE5PsGBqacMfsdmi3kPHfLlnh5srfUiqF9qci4o=;
        b=a9yshMYZa0nHF6o1sxizsDb8/duwNl2I0ce1K+E1vvGnRIs3gZO4PyAU9Vg5/bBiYr
         CPQKVL50lmiDYe06AN+U/q9H0XFBr5EOkWy/TBZsB8XqVfpYT7EEFQzzdmBXSDM1JC93
         JVLOw2V9mu3aQK6J3IYCmLeMsclWz1qdAB4PQ8t9RSzbDtkJ/WeeM5U5EtFdoRm+U0AG
         XDAR6qnW4h4VRWngF1tC1e72DkOAsQHVgNQ9w+ikD99KrsKI+zSTSIilaSlaQr9MXV/4
         7/r4ouJC+NVJ86s+A5E2JGi5eYhgaVbC2ROT1WCdKKFS6psZcmvKPdy/OpzbkWY4AAAM
         4xJQ==
X-Gm-Message-State: AOJu0YxL1gEt8Bz2bZCJZKpuGuxbDnR3bYOQXOmgOxAkQx4fKrVHo/h7
	u3UydYyeckMDOm1b93TM3qxkuLc0o1/CMnE3ux3pj6PEKLmvu0wL1qSyz9YK/XChy6mOfWhv7OT
	y
X-Google-Smtp-Source: AGHT+IGWbQhPI9hAOyE30rCok7VTGnhXka+XL7R9rVAadH5QAwxwcrI1iwemjVKCCPlzb2K2l4+21Q==
X-Received: by 2002:a7b:c8d9:0:b0:40e:45b0:557f with SMTP id f25-20020a7bc8d9000000b0040e45b0557fmr2378521wml.140.1705944092623;
        Mon, 22 Jan 2024 09:21:32 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: virtio-comment@lists.oasis-open.org
Cc: vivek.gautam@arm.com,
	tina.zhang@intel.com,
	seb@rivosinc.com,
	sameo@rivosinc.com,
	eric.auger@redhat.com,
	kevin.tian@intel.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Date: Mon, 22 Jan 2024 17:14:42 +0000
Message-ID: <20240122171442.1740297-10-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122171442.1740297-2-jean-philippe@linaro.org>
References: <20240122171442.1740297-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v3 8/9] virtio-iommu: Add VIRTIO_IOMMU_RESV_MEM_T_IDENTITY

To support MSIs on platforms that translate MSI addresses (Arm, possibly
RISC-V), when using page tables, the driver needs to create IOVA-GPA
mappings of addresses reserved by the platform.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 device-types/iommu/description.tex | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
index 0c5f4a6..7c81516 100644
--- a/device-types/iommu/description.tex
+++ b/device-types/iommu/description.tex
@@ -1019,7 +1019,10 @@ \subsubsection{PROBE properties}\label{sec:Device Types / IOMMU Device / Device
   u8    reserved[3];
   le64  start;
   le64  end;
+  le32  flags;
 };
+
+#define VIRTIO_IOMMU_RESV_MEM_F_MMIO      (1 << 0)
 \end{lstlisting}
 
 Fields \field{start} and \field{end} describe the range of reserved virtual
@@ -1039,6 +1042,27 @@ \subsubsection{PROBE properties}\label{sec:Device Types / IOMMU Device / Device
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
@@ -1051,6 +1075,9 @@ \subsubsection{PROBE properties}\label{sec:Device Types / IOMMU Device / Device
 The driver SHOULD treat any \field{subtype} it doesn't recognize as if it
 was VIRTIO_IOMMU_RESV_MEM_T_RESERVED.
 
+The driver SHOULD create an identity mapping described by
+VIRTIO_IOMMU_RESV_MEM_T_IDENTITY, when using page tables.
+
 \devicenormative{\subparagraph}{Property RESV_MEM}{Device Types / IOMMU Device / Device operations / PROBE properties / RESVMEM}
 
 The device SHOULD set \field{reserved} to zero.
@@ -1061,7 +1088,8 @@ \subsubsection{PROBE properties}\label{sec:Device Types / IOMMU Device / Device
 The device SHOULD NOT present multiple RESV_MEM properties that overlap
 each other for the same endpoint.
 
-The device SHOULD reject a MAP request that overlaps a RESV_MEM region.
+The device SHOULD reject a MAP request that overlaps a RESV_MEM
+region.
 
 The device SHOULD NOT allow accesses from the endpoint to RESV_MEM regions
 to affect any other component than the endpoint and the driver.
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

