Return-Path: <virtio-comment-return-7595-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573CFE81E17
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3FAC71922ED
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 99ED998687D
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4F88198683A; Fri,  6 Oct 2023 16:14:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9F5CC98688F
	for <virtio-comment@lists.oasis-open.org>; Fri,  6 Oct 2023 16:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696608867; x=1697213667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UHDCHWVWwB9PU8RvWkipHltna0N2PUzMD5bIK6O5Hk=;
        b=BKtXUL5j/3vEEneV1K0BrkFvqOgQ8APYDXqXBN34cnlfTQd7ETaU0Pc006OeT1+4qn
         KUH6yv2xjgJUArD0hFbkVIselM7Jaa+XcpLBAWZw+S/UIxrpa7nwe/1mPIvaRQ99bSP9
         Cthbj1E9GZziAAD4yh/7OqrFnCuSeL46EtDMh/TodbvyjI4MAjiXhWXNiZzxqud8Si4t
         QbghdS2UEmJPqLQ07YUbj4VYfJ3TFwItbOV3d2YDMklxZnIup2HaEXd+xd8PahEl/4aC
         AgVYftqjHkazJ+WA/X4axvabznAEnblVdnaEjcRsMZogtSko+rrTqLg4cf+2qISm1LAN
         9eXQ==
X-Gm-Message-State: AOJu0YxHdK8Zawr34vygbVxikusl/IuYKiZfEm7IQZ49Aj0qWNz/4eIG
	3Nbu/N32g4M4jdovfQ+i4jUJEBHrjq8Drezpvnw=
X-Google-Smtp-Source: AGHT+IF3dMPna+oJikYmD07UIpbF2pLtrfNV2EG5OV/V2S5DQ+c4Lsmh6nzJKJuYLcn1nSf8M/o4Cw==
X-Received: by 2002:a05:6000:1946:b0:327:e073:d604 with SMTP id e6-20020a056000194600b00327e073d604mr7217125wry.45.1696608866976;
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
Date: Fri,  6 Oct 2023 17:09:49 +0100
Message-ID: <20231006160947.2227396-12-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006160947.2227396-3-jean-philippe@linaro.org>
References: <20231006160947.2227396-3-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 9/9] virtio-iommu: Add PASID information to fault report

With page table support comes PASID support, so it's useful to have the
faulting address space in error reports.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 device-types/iommu/description.tex | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
index dcb51d3..0bf3b37 100644
--- a/device-types/iommu/description.tex
+++ b/device-types/iommu/description.tex
@@ -1123,13 +1123,14 @@ \subsubsection{Fault reporting}\label{sec:Device Types / IOMMU Device / Device o
   u8    reserved[3];
   le32  flags;
   le32  endpoint;
-  le32  reserved1;
+  le32  pasid;
   le64  address;
 };
 
 #define VIRTIO_IOMMU_FAULT_F_READ     (1 << 0)
 #define VIRTIO_IOMMU_FAULT_F_WRITE    (1 << 1)
 #define VIRTIO_IOMMU_FAULT_F_ADDRESS  (1 << 8)
+#define VIRTIO_IOMMU_FAULT_F_PASID    (1 << 9)
 \end{lstlisting}
 
 \begin{description}
@@ -1144,9 +1145,11 @@ \subsubsection{Fault reporting}\label{sec:Device Types / IOMMU Device / Device o
         access \field{address}, which wasn't mapped in the domain or
         didn't have the correct protection flags.
     \end{description}
+  \item[\field{reserved}] Should be zero.
   \item[\field{flags}] Information about the fault context.
   \item[\field{endpoint}] The endpoint causing the fault.
-  \item[\field{reserved} and \field{reserved1}] Should be zero.
+  \item[\field{pasid}] If VIRTIO_IOMMU_FAULT_F_PASID is set, the
+    address space ID of the fault.
   \item[\field{address}] If VIRTIO_IOMMU_FAULT_F_ADDRESS is set, the
     address causing the fault.
 \end{description}
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

