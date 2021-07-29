Return-Path: <virtio-comment-return-2092-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EFA17986476
	for <virtio-comment@lists.oasis-open.org>; Thu, 29 Jul 2021 05:09:46 +0000 (UTC)
From: tstark@linux.microsoft.com
Date: Wed, 28 Jul 2021 22:09:22 -0700
Message-Id: <20210729050922.5933-2-tstark@linux.microsoft.com>
In-Reply-To: <20210729050922.5933-1-tstark@linux.microsoft.com>
References: <20210729050922.5933-1-tstark@linux.microsoft.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v3 1/1] virtio-pmem: Support describing pmem as shared memory region
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: grahamwo@microsoft.com, benhill@microsoft.com, mst@redhat.com, pankaj.gupta@ionos.com, tstark@microsoft.com, david@redhat.com, cohuck@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

From: Taylor Stark <tstark@microsoft.com>

Update the virtio-pmem RFC spec to add support for describing the pmem regi=
on
as a shared memory window. This is required to support virtio-pmem in Hyper=
-V,
since Hyper-V only allows PCI devices to operate on memory ranges defined v=
ia
BARs. When using the virtio PCI transport, shared memory regions are descri=
bed
via PCI BARs.

Signed-off-by: Taylor Stark <tstark@microsoft.com>
---
 conformance.tex |  1 +
 virtio-pmem.tex | 34 +++++++++++++++++++++++++++++-----
 2 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/conformance.tex b/conformance.tex
index 33fdac9..8e414eb 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -201,6 +201,7 @@ \section{Conformance Targets}\label{sec:Conformance / C=
onformance Targets}
=20
 \begin{itemize}
 \item \ref{devicenormative:Device Types / PMEM Device / Device Initializat=
ion}
+\item \ref{drivernormative:Device Types / PMEM Driver / Driver Initializat=
ion}
 \item \ref{drivernormative:Device Types / PMEM Driver / Driver Initializat=
ion / Direct access}
 \item \ref{drivernormative:Device Types / PMEM Driver / Driver Initializat=
ion / Virtio flush}
 \item \ref{drivernormative:Device Types / PMEM Driver / Driver Operation /=
 Virtqueue command}
diff --git a/virtio-pmem.tex b/virtio-pmem.tex
index 04e07bb..ceb62db 100644
--- a/virtio-pmem.tex
+++ b/virtio-pmem.tex
@@ -19,7 +19,10 @@ \subsection{Virtqueues}\label{sec:Device Types / PMEM De=
vice / Virtqueues}
=20
 \subsection{Feature bits}\label{sec:Device Types / PMEM Device / Feature b=
its}
=20
-There are currently no feature bits defined for this device.
+\begin{description}
+\item[VIRTIO_PMEM_F_SHMEM_REGION (0)] The guest physical address range wil=
l be
+indicated as a shared memory region.
+\end{description}
=20
 \subsection{Device configuration layout}\label{sec:Device Types / PMEM Dev=
ice / Device configuration layout}
=20
@@ -38,11 +41,11 @@ \subsection{Device configuration layout}\label{sec:Devi=
ce Types / PMEM Device /
 \subsection{Device Initialization}\label{sec:Device Types / PMEM Device / =
Device Initialization}
=20
 Device hotplugs physical memory to guest address space. Persistent memory =
device
-is emulated with file backed memory at host side.
-
+is emulated with file backed memory at host side. The device indicates the=
 guest
+physical address to the driver in one of two ways:
 \begin{enumerate}
-\item Guest vpmem start is read from \field{start}.
-\item Guest vpmem end is read from \field{size}.
+\item As a guest absolute address.
+\item As a shared memory region.
 \end{enumerate}
=20
 \devicenormative{\subsubsection}{Device Initialization}{Device Types / PME=
M Device / Device Initialization}
@@ -50,12 +53,33 @@ \subsection{Device Initialization}\label{sec:Device Typ=
es / PMEM Device / Device
 File backed memory SHOULD be memory mapped to guest address space with SHA=
RED
 memory mapping.
=20
+If VIRTIO_PMEM_F_SHMEM_REGION has been negotiated, the device MUST indicat=
e the
+guest physical address as a shared memory region. The device MUST use shar=
ed
+memory region ID 0. The device SHOULD set \field{start} and \field{size} t=
o zero.
+
+If VIRTIO_PMEM_F_SHMEM_REGION has not been negotiated, the device MUST ind=
icate
+the guest physical address as a guest absolute address. The device MUST se=
t
+\field{start} to the absolute address and \field{size} to the size of the
+address range, in bytes.
+
 \subsection{Driver Initialization}\label{sec:Device Types / PMEM Driver / =
Driver Initialization}
=20
 Driver hotplugs the physical memory and registers associated
 region with the pmem API. Also, configures a flush callback
 function with the corresponding region.
=20
+\drivernormative{\subsubsection}{Driver Initialization}{Device Types / PME=
M Driver / Driver Initialization}
+
+In order to discover the physical address ranges where the pmem was
+mapped:
+
+If VIRTIO_PMEM_F_SHMEM_REGION has been negotiated, the driver MUST query
+shared memory ID 0 for the physical address ranges, and MUST NOT use
+\field{start} or \field{stop}.
+
+If VIRTIO_PMEM_F_SHMEM_REGION has not been negotiated, the driver MUST
+read the physical address ranges from \field{start} and \field{stop}.
+
 \drivernormative{\subsubsection}{Driver Initialization: Filesystem direct =
access}{Device Types / PMEM Driver / Driver Initialization / Direct access}
=20
 Driver SHOULD enable filesystem direct access operations for
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

