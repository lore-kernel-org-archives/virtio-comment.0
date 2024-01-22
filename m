Return-Path: <virtio-comment-return-8986-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57584C47DAF
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 99F02120D47
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 856619866BA
	for <virtio-comment@archiver.kernel.org>; Mon, 22 Jan 2024 17:21:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 68950986556; Mon, 22 Jan 2024 17:21:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 56D2B9865B6
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 Jan 2024 17:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944085; x=1706548885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XtoElnixnDZ+0oLLGMB0qqcj2v/5O+e4N4FADfI4gbM=;
        b=uVMOcc2jZQbmh08AdBdlqV7WKhi8qOf67PcTDPjh7L57gsrXpJPPfMZ5Q3sUlJ8BU+
         24Ig6VQGM0vgAsS0laeUdud6h9/IChrBlvC8mn5JQfxzGgFujBL1gK0ycce0gLWSs/HB
         eFrQUEX8lUMLrRB3fDxtmbiyDUDTjOIOW+kj5meKctNeK675LAFdhUU6Rs6heTXPNHe3
         BDV6Bkjv20ZWrCdOiavP5H1qhMFQyp4u+Fq/yGqkKsmeD6vrdhfd6qDgB4am3r3JI/ie
         K0Wqe3PCvvmWml14a+7DCoOyaYosd1rmOzNbNGno4Y1MlntMjh396wRRPTbAf56rPCsW
         q/5g==
X-Gm-Message-State: AOJu0Yy5vsb3IM1J7GkjpDFJQGKFl61xsL2NhIKobAl7tc6KVoKWYES9
	mnqOYfWbZaEvGq46QY+i8FWdEu31cvxrxP1+cY28Zjt5p1yksYJ9uPZDlTYKh44Ykhitg1Eoe37
	n
X-Google-Smtp-Source: AGHT+IHJVGuVM7VRoLcWtUGGNss3bdzSnze6bjlfu5BwKXAyx6roHTAnXhNsm26hfwmlrBSKDcIrJg==
X-Received: by 2002:a05:600c:18a6:b0:40e:4af9:6a19 with SMTP id x38-20020a05600c18a600b0040e4af96a19mr2551322wmp.155.1705944085545;
        Mon, 22 Jan 2024 09:21:25 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: virtio-comment@lists.oasis-open.org
Cc: vivek.gautam@arm.com,
	tina.zhang@intel.com,
	seb@rivosinc.com,
	sameo@rivosinc.com,
	eric.auger@redhat.com,
	kevin.tian@intel.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Date: Mon, 22 Jan 2024 17:14:34 +0000
Message-ID: <20240122171442.1740297-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v3 0/9] virtio-iommu: Support page tables

Add page table support for Arm SMMUv3, Intel VT-d, RISC-V IOMMU and AMD
IOMMU to the virtio-iommu specification. The main advantage of page tables
over the MAP/UNMAP interface is sharing virtual address spaces (SVA aka
SVM), where an endpoint with PASID and I/O page fault support can directly
access process address spaces, and applications don't have to explicitly
deal with DMA buffers. Using page tables for regular DMA is also faster
than MAP/UNMAP because it removes the context switch on MAP (while UNMAP
is replaced by INVALIDATE), but requires pinning all guest memory which
prevents the host from over-committing resources. Some endpoints support
I/O page faults (PCIe PRI) which removes the need for pinning guest
memory, but also has a runtime cost.

One virtio-iommu instance can provide both interfaces: page tables for
endpoints that support unpinned memory, and MAP/UNMAP for the others. 

Find more details and rationale on the previous posting [1]. Since v2,
I've updated the VT-d support following Tina's review (see changelog on
individual patches), and some small fixes.

You can find a PDF with these changes and diff colors here:

https://jpbrucker.net/virtio-iommu/spec/virtio-iommu-pt-v1.7-diff.pdf
https://jpbrucker.net/virtio-iommu/spec/virtio-iommu-pt-v1.7.pdf
https://jpbrucker.net/git/virtio/log/?h=viommu/tables

[1] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00018.html

Jean-Philippe Brucker (8):
  virtio-iommu: Add ATTACH_TABLE request
  virtio-iommu: Add INVALIDATE request
  virtio-iommu: Add Arm SMMUv3 support
  virtio-iommu: Add PASID field to DETACH
  virtio-iommu: Add RISC-V page tables
  virtio-iommu: Add AMD page tables
  virtio-iommu: Add VIRTIO_IOMMU_RESV_MEM_T_IDENTITY
  virtio-iommu: Add PASID information to fault report

Tina Zhang (1):
  virtio-iommu: Add VT-d IO page table

 device-types/iommu/description.tex        | 357 ++++++++++++++++++++--
 device-types/iommu/device-conformance.tex |   3 +
 device-types/iommu/driver-conformance.tex |   3 +
 device-types/iommu/pgtable-amd.tex        | 171 +++++++++++
 device-types/iommu/pgtable-arm.tex        |  78 +++++
 device-types/iommu/pgtable-intel.tex      | 118 +++++++
 device-types/iommu/pgtable-riscv.tex      |  92 ++++++
 introduction.tex                          |   9 +
 8 files changed, 804 insertions(+), 27 deletions(-)
 create mode 100644 device-types/iommu/pgtable-amd.tex
 create mode 100644 device-types/iommu/pgtable-arm.tex
 create mode 100644 device-types/iommu/pgtable-intel.tex
 create mode 100644 device-types/iommu/pgtable-riscv.tex

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

