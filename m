Return-Path: <virtio-comment-return-8989-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA298C47DD9
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CA7762B14E
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BFA709866D7
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B32A59865B6; Mon, 22 Jan 2024 17:21:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9956A9865B8
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 Jan 2024 17:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944089; x=1706548889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wiEZqTN1B5Q8qFQFVwNGdDsHVAg2x1m09n4qj2UdFbw=;
        b=Wk0uee0uCVaBLk03DgDGzKWEckmGCO/cXQmnwFeO+Tl+ZpBb2JH91hl4mOrO3eZZ19
         fy/qze4ZqFru3tHixvGRRLHH+RiNzsQDn3yFG0A8qk+1qz5KdI+cjXTbP9FjYxIzc7MN
         YazRFMotaumTsiL8twSvzqckMWY+sImrms0uQtvfUqgn5MpLzJACO7iJAvpaOJYXRJg9
         3uBScpezTx7QArnsvdFINFdA7oQltmabxTUOPzroRAFoZk02M4IMCdLLqkA6jKZfFkLE
         +znkuOI8fS+Abi9E78WTTaPlKAoC+RG98qSnxMBsBYU2xbH0TA51DlptezPTcuX8o/G1
         O5eg==
X-Gm-Message-State: AOJu0YzCjbW+HeyahsQJ01uF/TfHac2IP4kEGIiJ4ugEEb9d1sOM2cY5
	Xg5IIVgV5wWgZyFCG1UEqv1oOhpFoRjQNtA/fIxk23jj9xLQWAjk2msrxfRIRoIlSqvuGJamI+s
	S
X-Google-Smtp-Source: AGHT+IEUt/di8AH7p8bI8olLkO1B7oDVDVF/hT3Nj1h4ujDTJ2aV/xOIvCll0lmcd3FzUqDOFsInfA==
X-Received: by 2002:a1c:770f:0:b0:40e:75d6:4e1a with SMTP id t15-20020a1c770f000000b0040e75d64e1amr1425846wmi.377.1705944089134;
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
Date: Mon, 22 Jan 2024 17:14:38 +0000
Message-ID: <20240122171442.1740297-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122171442.1740297-2-jean-philippe@linaro.org>
References: <20240122171442.1740297-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v3 4/9] virtio-iommu: Add PASID field to DETACH

Some page table extensions (Intel scalable mode and some AMD
implementations) require populating host-managed PASID tables with
ATTACH_TABLE and DETACH requests. To mirror the PASID parameter in the
ATTACH_TABLE request, add a PASID parameter to DETACH.

This could later be used if we generalize PASID support to the ATTACH
request, but there is not plan for that at the moment.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

---
v2->v3: Update meaning of F_PASID to match the VT-d table format.
---
 device-types/iommu/description.tex | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
index 45930d9..be01fb1 100644
--- a/device-types/iommu/description.tex
+++ b/device-types/iommu/description.tex
@@ -481,27 +481,34 @@ \subsubsection{DETACH request}
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
+with a VIRTIO_IOMMU_T_ATTACH_TABLE request.
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
@@ -511,8 +518,9 @@ \subsubsection{DETACH request}
 then the device MAY set the request \field{status} to
 VIRTIO_IOMMU_S_INVAL.
 
-The device MUST ensure that after being detached from a domain, the
-endpoint cannot access any mapping from that domain.
+The device MUST ensure that after being detached from an address
+space, the endpoint cannot access any mapping from that address
+space.
 
 \subsubsection{MAP request}\label{sec:Device Types / IOMMU Device / Device operations / MAP request}
 
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

