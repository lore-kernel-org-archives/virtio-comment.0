Return-Path: <tstark@linux.microsoft.com>
From: tstark@linux.microsoft.com
Subject: [PATCH v2 0/1] virtio-pmem: Support describing pmem as shared memory region
Date: Mon, 26 Jul 2021 21:29:06 -0700
Message-Id: <20210727042907.24315-1-tstark@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: grahamwo@microsoft.com, benhill@microsoft.com, mst@redhat.com, pankaj.gupta@ionos.com, tstark@microsoft.com, david@redhat.com, cohuck@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

From: Taylor Stark <tstark@microsoft.com>

Changes from v1 [1]:
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

[1] https://lists.oasis-open.org/archives/virtio-comment/202107/msg00111.ht=
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
 virtio-pmem.tex | 30 +++++++++++++++++++++++++-----
 2 files changed, 26 insertions(+), 5 deletions(-)

--=20
2.32.0

