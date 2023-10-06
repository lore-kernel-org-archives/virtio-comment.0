Return-Path: <virtio-comment-return-7591-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE78E81E19
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B37487BB14
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4C867986840
	for <virtio-comment@archiver.kernel.org>; Fri,  6 Oct 2023 16:14:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1FC61986883; Fri,  6 Oct 2023 16:14:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 927E4986829
	for <virtio-comment@lists.oasis-open.org>; Fri,  6 Oct 2023 16:14:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696608862; x=1697213662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eU6AosuaNHaMkkH/9jNVQPOHT9OC12xRDzrjaV/W4VU=;
        b=DziqJgLTVFnJQkh0SPXyG72P6zXP2khmSxkPpRmRKgBZbP5G4hBXFtu2Ixk7G0rgxr
         SUPOGCsZlTGzlSCv0BNVA6XhxtrJN2hiM8XYWbOnufF9+as6shAI2gn9LO/BV62CVdsd
         HE7OthkPt7fauyXdrO+xXWMPPg17ZyYfBwAOK9ZvMFTLad69Pp3foMo2xB+AWTNysyky
         ybzw/oqyj/ExkodZvuAyzESvTfWjVwjrk6iBGR0JCelIx6JQqCgN3dkyQy2P8Tdqt4IA
         AEsGbxb1bKDDZc4EXprMrIQhMImNYak4wMROeesg5KKMCwk01j2iQC/kb31tXz7gVEQg
         +qIQ==
X-Gm-Message-State: AOJu0Yz3EEFfS2skY/91y0+pvx3ra+9U+aPK2HP+6T5kXB7+jM1y2u0M
	Pehw8v44s26Vg2IdjQ/AR4GbiTcynD4njL/jumE=
X-Google-Smtp-Source: AGHT+IGnd6p+NM14WzrTE9dU/uqM7E0ZjmK+8/50OwhB5e/oalRb2F8VlvNVJ5In76CFaW3QkhQaAA==
X-Received: by 2002:a05:6000:109:b0:320:9e2:b3a2 with SMTP id o9-20020a056000010900b0032009e2b3a2mr7912699wrx.33.1696608862495;
        Fri, 06 Oct 2023 09:14:22 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: virtio-comment@lists.oasis-open.org
Cc: vivek.gautam@arm.com,
	tina.zhang@intel.com,
	seb@rivosinc.com,
	sameo@rivosinc.com,
	eric.auger@redhat.com,
	kevin.tian@intel.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Date: Fri,  6 Oct 2023 17:09:40 +0100
Message-ID: <20231006160947.2227396-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 0/9] virtio-iommu: Support page tables

Add page table support to the virtio-iommu specification. The main
advantage of page tables over the MAP/UNMAP interface is sharing virtual
address spaces (SVA aka SVM), where an endpoint with PASID and I/O page
fault support can directly access process address spaces, and
application don't have to explicitly deal with DMA buffers. Using page
tables for regular DMA is also faster than MAP/UNMAP because it removes
the context switch on MAP (while UNMAP is replaced by INVALIDATE), but
requires pinning all guest memory which prevents the host from
over-committing memory. Some endpoints support I/O page faults (PCIe PRI)
which removes the need for pinning guest memory, but also has a runtime
cost.

The best compromise for managing DMA for any endpoint probably remains DMA
pools in the guest (for example Linux' page_pool) managed with MAP/UNMAP,
since it works with all systems and endpoints, provides ideal runtime
performance while allowing the host to overcommit most guest memory. For
assigned endpoints, support for page table isn't necessarily a net gain
outside of SVA but is certainly worth exploring. And for virtual
endpoints, page tables are more efficient than MAP/UNMAP.


Some reasons to add page tables to virtio-iommu:

* Although it can be done with emulated IOMMUs (vSMMU, VT-d, etc), several
  VMMs aim to avoid complex emulations and need this support in
  virtio-iommu (crosvm, cloud-hypervisor, kvmtool). Ideally those VMMs
  just transfer IOMMU commands between the virtqueue and the host API
  without having to deal with too much vendor detail. A VMM can also
  offload this to a vhost-iommu implementations.

* Ability to support a mix of hardware and software IOMMUs with differing
  configuration. The virtio-iommu driver discovers properties of the
  underlying IOMMU for each endpoint, for example the platform could have
  an IOMMU that supports nesting translation, an IOMMU that doesn't, and
  several virtual endpoints implemented by the VMM. One virtio-iommu
  instance can handle all of them and use the most advanced feature for
  each endpoint.

* Possibility of paravirtualized extensions (more efficient TLB
  management, optimized page requests). For virtual endpoints, even the
  basic page table support in virtio-iommu seemed more efficient than
  emulated IOMMUs in my tests.


This is the second version of the page table support for virtio-iommu, and
is quite different from v1 [1]. Mainly we added support for Intel, RISC-V
and AMD IOMMUs in addition to Arm. Although they don't need to be merged
at the same time, it's good to have an idea of the whole page table
support, since those architectures differ significantly.

The PROBE properties now contains raw ID registers (sanitized to only
contain information relevant to the guest). As a consequence SMMUv2 is not
supported anymore, would need to be added separately. ATTACH_TABLE is
also a little less generic, though I did try to describe the general
PASID table / page table model in the ATTACH_TABLE section rather than
in each format description. INVALIDATE is mostly unchanged.


You can find a PDF with these changes and diff colors here:

https://jpbrucker.net/virtio-iommu/spec/virtio-iommu-pt-v1.6-diff.pdf
https://jpbrucker.net/virtio-iommu/spec/virtio-iommu-pt-v1.6.pdf
https://jpbrucker.net/git/virtio/log/?h=viommu/tables

Please prototype and review!

It would also be good to involve some AMD folks, I didn't know who to Cc
and the AMD support is mostly illustrative for now. 

And do subscribe to the virtio-comment list [2] before replying,
otherwise your mail won't reach the list.

[1] https://lore.kernel.org/virtio-dev/20210205175812.143886-1-jean-philippe@linaro.org/
[2] https://www.oasis-open.org/committees/comments/index.php?wg_abbrev=virtio

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

 device-types/iommu/description.tex   | 369 +++++++++++++++++++++++++--
 device-types/iommu/pgtable-amd.tex   | 187 ++++++++++++++
 device-types/iommu/pgtable-arm.tex   | 148 +++++++++++
 device-types/iommu/pgtable-intel.tex |  98 +++++++
 device-types/iommu/pgtable-riscv.tex | 111 ++++++++
 introduction.tex                     |   9 +
 6 files changed, 895 insertions(+), 27 deletions(-)
 create mode 100644 device-types/iommu/pgtable-amd.tex
 create mode 100644 device-types/iommu/pgtable-arm.tex
 create mode 100644 device-types/iommu/pgtable-intel.tex
 create mode 100644 device-types/iommu/pgtable-riscv.tex

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

