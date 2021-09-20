Return-Path: <david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Subject: [PATCH RESEND v2 1/5] virtio-mem: simplify statements that express unexpected behavior on memory access
Date: Mon, 20 Sep 2021 15:46:49 +0200
Message-Id: <20210920134653.16412-2-david@redhat.com>
In-Reply-To: <20210920134653.16412-1-david@redhat.com>
References: <20210920134653.16412-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: David Hildenbrand <david@redhat.com>, Hui Zhu <teawater@gmail.com>, Marek Kedzierski <mkedzier@redhat.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>, Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Wei Yang <richard.weiyang@linux.alibaba.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Some statements express that the device MAY allow access to memory inside
unplugged memory blocks, although it's really just unexpected behavior and
conforming drivers MUST NOT perform such access.

Clarify that, and move the special CPU vs. DMA handling for some
unplugged memory blocks to the driver section instead.

While at it, start rephrasing our statements to clarify and prepare for
further changes.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 virtio-mem.tex | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/virtio-mem.tex b/virtio-mem.tex
index 62a1d02..f0c5970 100644
--- a/virtio-mem.tex
+++ b/virtio-mem.tex
@@ -220,8 +220,11 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
 The driver MUST NOT read from unplugged memory blocks outside
 \field{usable_region_size}.
 
-The driver SHOULD NOT read from unplugged memory blocks inside
-\field{usable_region_size}.
+The driver MUST NOT read memory of unplugged memory blocks inside
+\field{usable_region_size} via DMA.
+
+The driver SHOULD NOT read memory of unplugged memory blocks inside
+\field{usable_region_size} via the CPU.
 
 The driver MUST NOT request to unplug memory blocks while the memory is
 still in use.
@@ -246,18 +249,10 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
 
 The device MUST NOT change the content of plugged memory blocks.
 
-The device MUST allow the CPU to read from unplugged memory blocks inside
-the usable device-managed region. \footnote{To allow for simplified dumping of
-memory. The CPU is expected to copy such memory to another location before
-starting DMA.}
-
-The device MAY allow to read from unplugged memory blocks inside the
-usable device-managed region via DMA.
-
-The device MAY allow to read from unplugged memory blocks outside
-the usable device-managed region.
-
-The device MAY allow to write to unplugged memory blocks.
+The device MUST allow the driver to read memory of unplugged memory blocks
+inside \field{usable_region_size} via the CPU. \footnote{To allow for simplified
+dumping of memory. The CPU is expected to copy such memory to another location
+before starting DMA.}
 
 The device MAY change the state of memory blocks during system resets.
 
-- 
2.31.1

