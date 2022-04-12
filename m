Return-Path: <cohuck@redhat.com>
From: Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH] iommu: offered -> negotiated
Date: Tue, 12 Apr 2022 10:30:59 +0200
Message-Id: <20220412083059.86367-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
To: virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
Cc: Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

All those clauses actually apply whenever the feature is negotiated,
not merely offered. Rename to clarify things.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 virtio-iommu.tex | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/virtio-iommu.tex b/virtio-iommu.tex
index f8cbe8895f0d..efe1000ac2d2 100644
--- a/virtio-iommu.tex
+++ b/virtio-iommu.tex
@@ -232,22 +232,22 @@ \subsection{Device operations}\label{sec:Device Types / IOMMU Device / Device op
   Creating mappings aligned on large page sizes can improve performance
   since they require fewer page table and TLB entries.
 
-\item If the VIRTIO_IOMMU_F_DOMAIN_RANGE feature is offered,
+\item If the VIRTIO_IOMMU_F_DOMAIN_RANGE feature is negotiated,
   \field{domain_range} describes the values supported in a \field{domain}
-  field. If the feature is not offered, any \field{domain} value is valid.
+  field. If the feature is not negotiated, any \field{domain} value is valid.
 
-\item If the VIRTIO_IOMMU_F_INPUT_RANGE feature is offered,
+\item If the VIRTIO_IOMMU_F_INPUT_RANGE feature is negotiated,
   \field{input_range} contains the virtual address range that the IOMMU is
   able to translate. Any mapping request to virtual addresses outside of
   this range fails.
 
-  If the feature is not offered, virtual mappings span over the whole
+  If the feature is not negotiated, virtual mappings span over the whole
   64-bit address space (\texttt{start = 0, end = 0xffffffff ffffffff})
 \end{itemize}
 
 An endpoint is in bypass mode if:
 \begin{itemize}
-  \item the VIRTIO_IOMMU_F_BYPASS_CONFIG feature is offered and:
+  \item the VIRTIO_IOMMU_F_BYPASS_CONFIG feature is negotiated and:
     \begin{itemize}
       \item config field \field{bypass} is 1 and the endpoint is
         not attached to a domain. This applies even if the driver
-- 
2.34.1

