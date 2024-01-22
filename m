Return-Path: <virtio-comment-return-8995-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73879C47DAF
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5F5B26034D
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5647F9866BA
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4B9B59865B8; Mon, 22 Jan 2024 17:21:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5B2709867C3
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 Jan 2024 17:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944093; x=1706548893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HnSoUahcRNICLdcqHsmMLhQZ2QzE4Q5mHZK6Kbmm4SA=;
        b=F25gnOeiNJ3CWWWu8Tkzd793aReRJyYKlGpqrZ15jFgDvVnoSfiitDwZKFD6LE/eEE
         2sFuk9TGgJvnwgIPA2FjujQoH/nf15YJ+fEWPDLb1TyAgXyfueln7lQKBxxRiVBCo/Mu
         LbkNpia/GKkBHHU4cV4UipPnHa/KTJE4c2B7mDUekSY9WfNbFnh1nYvxTo+XZ+cfeIJp
         UfXaRpwySybptsRLrqJ/KDKsG32QMZN0ITREIWKw9ii9Z0j2/xoEItRKOx2T07k1AwmJ
         T4kc4d+1mmxONg0GBK/l6F+WSfL6L5OCEBlXyyg6dHB5n7/B0a4jcM+vD1JCyEPvLH0L
         EYuQ==
X-Gm-Message-State: AOJu0Yyz1Li35EWkiYp6kAtYQVEBrBJJ4Z57HURSJOmKjGyED0PLDh+B
	DsQ00XjMBAaU9FXJ8vnYIhbxAWB4YyenJWqEqCoBswwEGhSDFTLtLfKMy0drd3x9Xhg8x0bpOp9
	6
X-Google-Smtp-Source: AGHT+IGup5nSO6UlqEM6DHsKDjjTDNVYsDnoVRK3BBWikJSbpOZuvjTtsVBbSUw+92Vrkk6ALVx0FQ==
X-Received: by 2002:a05:600c:4f06:b0:40e:44b5:511e with SMTP id l6-20020a05600c4f0600b0040e44b5511emr2481976wmq.99.1705944093452;
        Mon, 22 Jan 2024 09:21:33 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: virtio-comment@lists.oasis-open.org
Cc: vivek.gautam@arm.com,
	tina.zhang@intel.com,
	seb@rivosinc.com,
	sameo@rivosinc.com,
	eric.auger@redhat.com,
	kevin.tian@intel.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Date: Mon, 22 Jan 2024 17:14:43 +0000
Message-ID: <20240122171442.1740297-11-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122171442.1740297-2-jean-philippe@linaro.org>
References: <20240122171442.1740297-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v3 9/9] virtio-iommu: Add PASID information to fault report

With page table support comes PASID support, so it's useful to have the
faulting address space in error reports.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 device-types/iommu/description.tex | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
index 7c81516..7e142bd 100644
--- a/device-types/iommu/description.tex
+++ b/device-types/iommu/description.tex
@@ -1111,13 +1111,14 @@ \subsubsection{Fault reporting}\label{sec:Device Types / IOMMU Device / Device o
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
@@ -1132,9 +1133,11 @@ \subsubsection{Fault reporting}\label{sec:Device Types / IOMMU Device / Device o
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

