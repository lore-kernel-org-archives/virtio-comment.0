Return-Path: <virtio-comment-return-2034-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 456A198635A
	for <virtio-comment@lists.oasis-open.org>; Wed, 21 Jul 2021 21:00:13 +0000 (UTC)
From: tstark@linux.microsoft.com
Date: Wed, 21 Jul 2021 13:59:39 -0700
Message-Id: <20210721205939.20746-2-tstark@linux.microsoft.com>
In-Reply-To: <20210721205939.20746-1-tstark@linux.microsoft.com>
References: <20210721205939.20746-1-tstark@linux.microsoft.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH 1/1] virtio-pmem: Support PCI BAR-relative addresses
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: grahamwo@microsoft.com, benhill@microsoft.com, mst@redhat.com, pankaj.gupta@ionos.com, Taylor Stark <tstark@microsoft.com>
List-ID: <virtio-comment.lists.oasis-open.org>

From: Taylor Stark <tstark@microsoft.com>

Update the virtio-pmem RFC spec to add support for describing the pmem regi=
on
via PCI BARs. Shared memory windows are used to accomplish this, similar to
virtio-fs and virtio-gpu. This is required to support virtio-pmem in Hyper-=
V,
since Hyper-V only allows PCI devices to operate on memory ranges defined v=
ia
BARs.

Signed-off-by: Taylor Stark <tstark@microsoft.com>
---
 virtio-pmem.tex | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/virtio-pmem.tex b/virtio-pmem.tex
index 04e07bb..3f7d48e 100644
--- a/virtio-pmem.tex
+++ b/virtio-pmem.tex
@@ -40,11 +40,21 @@ \subsection{Device Initialization}\label{sec:Device Typ=
es / PMEM Device / Device
 Device hotplugs physical memory to guest address space. Persistent memory =
device
 is emulated with file backed memory at host side.
=20
+The device MUST indicate the guest physical address to the driver in one o=
f two
+ways:
 \begin{enumerate}
-\item Guest vpmem start is read from \field{start}.
-\item Guest vpmem end is read from \field{size}.
+\item As a guest absolute address.
+\item As a shared memory region.
 \end{enumerate}
=20
+If the guest physical address is indicated as an absolute address, the dev=
ice
+MUST set \field{start} to the absolute address and \field{size} to the siz=
e of
+the address range, in bytes.
+
+If the guest physical address is indicated as a shared memory region, the =
shared
+memory region MUST be shared memory region ID 0. The device SHOULD set
+\field{start} and \field{size} to zero.
+
 \devicenormative{\subsubsection}{Device Initialization}{Device Types / PME=
M Device / Device Initialization}
=20
 File backed memory SHOULD be memory mapped to guest address space with SHA=
RED
@@ -52,9 +62,11 @@ \subsection{Device Initialization}\label{sec:Device Type=
s / PMEM Device / Device
=20
 \subsection{Driver Initialization}\label{sec:Device Types / PMEM Driver / =
Driver Initialization}
=20
-Driver hotplugs the physical memory and registers associated
-region with the pmem API. Also, configures a flush callback
-function with the corresponding region.
+The driver SHOULD query the physical address ranges where the pmem was map=
ped.
+When performing the query, the driver MUST first query if shared memory re=
gion
+ID 0 is supported by the device. If present, the driver MUST NOT use \fiel=
d{start}
+or \field{size}. If not present, the driver SHOULD fallback to reading the
+physical address ranges from \field{start} and \field{size}.
=20
 \drivernormative{\subsubsection}{Driver Initialization: Filesystem direct =
access}{Device Types / PMEM Driver / Driver Initialization / Direct access}
=20
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

