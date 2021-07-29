Return-Path: <virtio-comment-return-2091-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 51AB4986134
	for <virtio-comment@lists.oasis-open.org>; Thu, 29 Jul 2021 05:09:39 +0000 (UTC)
From: tstark@linux.microsoft.com
Date: Wed, 28 Jul 2021 22:09:21 -0700
Message-Id: <20210729050922.5933-1-tstark@linux.microsoft.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v3 0/1] virtio-pmem: Support describing pmem as shared memory region
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: grahamwo@microsoft.com, benhill@microsoft.com, mst@redhat.com, pankaj.gupta@ionos.com, tstark@microsoft.com, david@redhat.com, cohuck@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

From: Taylor Stark <tstark@microsoft.com>

Changes from v2 [1]:
 - Incorporated suggestions from Cornelia Huck on rewording driver initiali=
zation.

Changes from v1:
 - Added in a feature bit (VIRTIO_PMEM_F_SHMEM_REGION) for controlling how =
the
   device indicates the guest physical address ranges to the driver. This f=
eature
   directly affects control flow of the driver, since it seemed weird to ha=
ve
   the driver indicate support for shared memory regions, and then needing
   to include an enum (or similar) informing the driver how the device
   indicated guest physical address ranges. If devices want to indicate the
   ranges as guest absolute addresses, they can skip negotiating the featur=
e.
 - The linux driver implementation has been updated and tested, but I'm hol=
ding
   off on posting the patches to get some feedback on the new approach.
 - Moved some changes to proper subsections (normative subsections).

[1] https://lists.oasis-open.org/archives/virtio-comment/202107/msg00145.ht=
ml

---

This patch updates the virtio-pmem spec to add support for describing the p=
mem
region as a shared memory region. This is required to support virtio-pmem i=
n
Hyper-V, since Hyper-V only allows PCI devices to operate on memory ranges
defined via BARs. When using the virtio PCI transport, shared memory region=
s
are described via PCI BARs.

As virtio-pmem hasn't been added to the virtio spec yet (see this issue [1]=
),
this patch is based off the RFC spec [2]. The linux driver implementation h=
as
been posted at [3].

[1] https://github.com/oasis-tcs/virtio-spec/issues/78
[2] https://lists.oasis-open.org/archives/virtio-dev/201903/msg00083.html
[3] https://lore.kernel.org/nvdimm/20210715223505.GA29329@linuxonhyperv3.gu=
j3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net

Taylor Stark (1):
  virtio-pmem: Support describing pmem as shared memory region

 conformance.tex |  1 +
 virtio-pmem.tex | 34 +++++++++++++++++++++++++++++-----
 2 files changed, 30 insertions(+), 5 deletions(-)

--=20
2.31.0.vfs.0.1


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

