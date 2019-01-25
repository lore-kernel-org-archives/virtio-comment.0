Return-Path: virtio-comment-return-597-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0E679985F68
	for <virtio-comment@lists.oasis-open.org>; Fri, 25 Jan 2019 20:03:30 +0000 (UTC)
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Date: Fri, 25 Jan 2019 20:02:21 +0000
Message-Id: <20190125200222.19945-1-jean-philippe.brucker@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH 0/1] Add virtio-iommu device specification
To: virtio-comment@lists.oasis-open.org
Cc: joro@8bytes.org, eric.auger@redhat.com, tnowicki@caviumnetworks.com, kevin.tian@intel.com, Lorenzo.Pieralisi@arm.com, bharat.bhushan@nxp.com, Will.Deacon@arm.com, Robin.Murphy@arm.com, Marc.Zyngier@arm.com
List-ID: <virtio-comment.lists.oasis-open.org>

From: Jean-Philippe Brucker <jphilippe.brucker@gmail.com>

[Re-sending from the right address using the right gitconfig, sorry for
 the mix-up...]

This is the virtio-iommu specification draft, applied onto the current
virtio-spec (tag virtio-v1.1-csd01). To make the review easier I uploaded
a PDF version at [1]. I'd like to start the review and (eventually) voting
process. Should I also open a github issue?

---

For those familiar with the standalone virtio-iommu draft, patch 1/1
corresponds to Section 2. For 0.10 I also added a precision about MAP
conflicts ("If a mapping already exists in the requested range, the device
SHOULD set the request status to VIRTIO_IOMMU_S_INVAL and SHOULD NOT
change any mapping.") which is already done by the QEMU device. There were
a few more wording issues and typos; see the v0.9-v0.10 diff [2] for the
complete changes in this version.

---

A short description of virtio-iommu and why we're doing this:

The virtio-iommu device allows a guest to manage DMA mappings for
physical, emulated and paravirtualized endpoints. It is designed to be
portable and is currently compatible with at least x86 and Arm IOMMU
architectures. The MAP/UNMAP mode introduced here is architecture-
agnostic.

However some platforms will benefit from this device more than others in
the short term. For example the Arm SMMU doesn't currently include a
paravirtualized mode that would allow it to shadow a single translation
stage into a physical SMMU. On Arm the only way to assign devices to guest
userspace requires nesting translation, which isn't supported by all
SMMUs, or using virtio-iommu.

On the other hand, Power platforms already describe a paravirtualized
IOMMU interface (TCE) in PAPR, and are unlikely to benefit from
virtio-iommu for the moment.

The Intel IOMMU also provides such paravirtualized mode (Caching Mode),
but x86 platforms might still benefit from virtio-iommu to accelerate some
aspects of the IOMMU - for example in-kernel processing of MAP/UNMAP, and
in future extensions, reducing the invalidation and page fault bottlenecks
when sharing virtual memory between process and endpoints.

Reference implementations for device and driver have been posted and
reviewed on the list [3][4].

[1] http://jpbrucker.net/virtio-iommu/spec/virtio-v1.1-wd01-iommu-0.10-draft.pdf
[2] http://jpbrucker.net/virtio-iommu/spec/diffs/
[3] https://lists.linuxfoundation.org/pipermail/iommu/2019-January/032677.html
[4] http://lists.gnu.org/archive/html/qemu-arm/2018-11/msg00680.html

Jean-Philippe Brucker (1):
  Add virtio-iommu device specification

 content.tex      |   1 +
 virtio-iommu.tex | 849 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 850 insertions(+)
 create mode 100644 virtio-iommu.tex

-- 
2.19.1


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

