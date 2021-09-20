Return-Path: <david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Subject: [PATCH RESEND v2 2/5] virtio-mem: rephrase remaining memory access statements
Date: Mon, 20 Sep 2021 15:46:50 +0200
Message-Id: <20210920134653.16412-3-david@redhat.com>
In-Reply-To: <20210920134653.16412-1-david@redhat.com>
References: <20210920134653.16412-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: David Hildenbrand <david@redhat.com>, Hui Zhu <teawater@gmail.com>, Marek Kedzierski <mkedzier@redhat.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>, Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Wei Yang <richard.weiyang@linux.alibaba.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Let's rephrase the remaining statements regarding memory access to unify
and prepare for further changes.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 virtio-mem.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virtio-mem.tex b/virtio-mem.tex
index f0c5970..cca3c9f 100644
--- a/virtio-mem.tex
+++ b/virtio-mem.tex
@@ -215,9 +215,9 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
 
 \drivernormative{\subsubsection}{Device Operation}{Device Types / Memory Device / Device Operation}
 
-The driver MUST NOT write to unplugged memory blocks.
+The driver MUST NOT write memory of unplugged memory blocks.
 
-The driver MUST NOT read from unplugged memory blocks outside
+The driver MUST NOT read memory of unplugged memory blocks outside
 \field{usable_region_size}.
 
 The driver MUST NOT read memory of unplugged memory blocks inside
-- 
2.31.1

