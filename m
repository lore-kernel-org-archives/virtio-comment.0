Return-Path: <virtio-comment-return-2286-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 584BC986170
	for <virtio-comment@lists.oasis-open.org>; Mon, 20 Sep 2021 13:36:27 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
Date: Mon, 20 Sep 2021 15:36:14 +0200
Message-Id: <20210920133618.16071-2-david@redhat.com>
In-Reply-To: <20210920133618.16071-1-david@redhat.com>
References: <20210920133618.16071-1-david@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v2 1/5] virtio-mem: simplify statements that express unexpected behavior on memory access
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: David Hildenbrand <david@redhat.com>
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
@@ -220,8 +220,11 @@ \subsection{Device Operation}\label{sec:Device Types /=
 Memory Device / Device Op
 The driver MUST NOT read from unplugged memory blocks outside
 \field{usable_region_size}.
=20
-The driver SHOULD NOT read from unplugged memory blocks inside
-\field{usable_region_size}.
+The driver MUST NOT read memory of unplugged memory blocks inside
+\field{usable_region_size} via DMA.
+
+The driver SHOULD NOT read memory of unplugged memory blocks inside
+\field{usable_region_size} via the CPU.
=20
 The driver MUST NOT request to unplug memory blocks while the memory is
 still in use.
@@ -246,18 +249,10 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Memory Device / Device Op
=20
 The device MUST NOT change the content of plugged memory blocks.
=20
-The device MUST allow the CPU to read from unplugged memory blocks inside
-the usable device-managed region. \footnote{To allow for simplified dumpin=
g of
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
+inside \field{usable_region_size} via the CPU. \footnote{To allow for simp=
lified
+dumping of memory. The CPU is expected to copy such memory to another loca=
tion
+before starting DMA.}
=20
 The device MAY change the state of memory blocks during system resets.
=20
--=20
2.31.1


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

