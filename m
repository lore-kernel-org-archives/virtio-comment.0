Return-Path: <virtio-comment-return-7590-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA1AE81E1B
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0D08C7A096
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B25B9986832
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7BAC398681B; Fri,  6 Oct 2023 16:14:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C4F58986825
	for <virtio-comment@lists.oasis-open.org>; Fri,  6 Oct 2023 16:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696608864; x=1697213664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/WmOAUZQ3650EM5MP77D+jZsk7QToIA1yfZVlwSeTs=;
        b=XcM7It5M/nVw3as/d3cUU+A7gTe8e/GOZ9i+D+rWfmVouGv2GkPASWeEmvuiLDpmnn
         awIYfUhOaJcQAogjJEJVSTAng4jP44FUoUFAv6yFYM7X+SrIcgJsQQkhzW+4ztKZh/v7
         gpLc/UXu2JRyg1wXKlttNMK+uTBanyA2uqR5yVIP73z1JCvkPutK0GYRawn/CbxH9PSV
         NfbASg7w4WBXfI/MjPmmfntniy+axbwtpvuNB1VBMaZbK/5TJ6hl+kqtpJbiRXY9bhza
         /gVe1gcmYWCwSaYQRW5Hlmk/EmNH72iGU4AnsRcX8J0+fOwRNmfq2ltd0E7B7qL1TyH/
         nV5A==
X-Gm-Message-State: AOJu0Yw32i7vaIM25WzFF4tN2nzlLdrViPUEfuoDartdEFERRFa1Cufy
	7KFoByZ2f92ja2s7dSYoemT6JEOhuJsOeJQ5kNQ=
X-Google-Smtp-Source: AGHT+IFq8k+An/fa5rCrPzNx9elhygfZnrYgD8b1eiVH63w8bEQ1J0Luojxp46Hk6Mf/GbzUebogjA==
X-Received: by 2002:a5d:4e8f:0:b0:319:79b4:a8ba with SMTP id e15-20020a5d4e8f000000b0031979b4a8bamr8735679wru.41.1696608864487;
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
Date: Fri,  6 Oct 2023 17:09:44 +0100
Message-ID: <20231006160947.2227396-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006160947.2227396-3-jean-philippe@linaro.org>
References: <20231006160947.2227396-3-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 4/9] virtio-iommu: Add PASID field to DETACH

Some page table extensions (Intel scalable mode and some AMD
implementations) require populating host-managed PASID tables with
ATTACH_TABLE and DETACH requests. To mirror the PASID parameter in the
ATTACH_TABLE request, add a PASID parameter to DETACH.

This could later be used if we generalize PASID support to the ATTACH
request, but there is not plan for that at the moment.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 device-types/iommu/description.tex | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
index 58edaad..c057cdf 100644
--- a/device-types/iommu/description.tex
+++ b/device-types/iommu/description.tex
@@ -486,27 +486,36 @@ \subsubsection{DETACH request}
   struct virtio_iommu_req_head head;
   le32 domain;
   le32 endpoint;
-  u8   reserved[8];
+  le32 flags;
+  le32 pasid;
   struct virtio_iommu_req_tail tail;
 };
+
+#define VIRTIO_IOMMU_DETACH_F_PASID   (1 << 0)
 \end{lstlisting}
 
-Detach an endpoint from a domain. When this request completes,
-the endpoint cannot access any mapping from that domain anymore.
-However the endpoint may then be in bypass mode and access the
-guest-physical address space.
+Detach an address space from an endpoint. When this request
+completes, the endpoint cannot access any mapping from the
+address space anymore. However the endpoint may then be in bypass
+mode and access the guest-physical address space.
 
 After all endpoints have been successfully detached from a domain, it
 ceases to exist and its ID can be reused by the driver for another domain.
 
+When flag VIRTIO_IOMMU_DETACH_F_PASID is set, field \field{pasid}
+contains the identifier of the address space to detach from the
+device. This is only supported with some table formats, attached
+with a VIRTIO_IOMMU_T_ATTACH_TABLE request. When flag
+VIRTIO_IOMMU_DETACH_F_PASID is not set, detach all address spaces
+from the device.
+
 \drivernormative{\paragraph}{DETACH request}{Device Types / IOMMU Device / Device operations / DETACH request}
 
-The driver SHOULD set \field{reserved} to zero.
+The driver SHOULD set field \field{pasid} and flag
+VIRTIO_IOMMU_DETACH_F_PASID to zero if PASID is not supported.
 
 \devicenormative{\paragraph}{DETACH request}{Device Types / IOMMU Device / Device operations / DETACH request}
 
-The device MUST ignore \field{reserved}.
-
 If the endpoint identified by \field{endpoint} doesn't exist, then the
 device MUST reject the request and set \field{status} to
 VIRTIO_IOMMU_S_NOENT.
@@ -516,8 +525,9 @@ \subsubsection{DETACH request}
 then the device MAY set the request \field{status} to
 VIRTIO_IOMMU_S_INVAL.
 
-The device MUST ensure that after being detached from a domain, the
-endpoint cannot access any mapping from that domain.
+The device MUST ensure that after being detached from an address
+space, the endpoint cannot access any mapping from that address
+space.
 
 \subsubsection{MAP request}\label{sec:Device Types / IOMMU Device / Device operations / MAP request}
 
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

