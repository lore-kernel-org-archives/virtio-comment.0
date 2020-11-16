Return-Path: virtio-comment-return-1518-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 879019848BB
	for <virtio-comment@lists.oasis-open.org>; Mon, 16 Nov 2020 19:16:42 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
Date: Mon, 16 Nov 2020 20:16:29 +0100
Message-Id: <20201116191629.47661-1-david@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v1] virtio-mem: minor clarification regarding read-access to unplugged blocks
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: David Hildenbrand <david@redhat.com>, teawater <teawaterz@linux.alibaba.com>, Marek Kedzierski <mkedzier@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Let's clarify that we don't expect all DMA to work with unplugged blocks.
We really only give guarantees when reading from unplugged memory blocks
via the CPU, e.g., as done by Linux when creating a system dump via
kdump: the new kernel will copy the content of the old (crashed) kernel
via the CPU to user space, from where it will find its final destination
inside the dump file. Note that dumping via makedumpfile under Linux will
avoid reading unplugged blocks completely.

This is a preparation for device passthrough to VMs, whereby such
dedicated devices might not be able to read from unplugged memory blocks.

Let's document that this scenario is possible, and why this handling is
in place at all.

Cc: teawater <teawaterz@linux.alibaba.com>
Cc: Marek Kedzierski <mkedzier@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 virtio-mem.tex | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/virtio-mem.tex b/virtio-mem.tex
index 85cfb61..62a1d02 100644
--- a/virtio-mem.tex
+++ b/virtio-mem.tex
@@ -246,8 +246,13 @@ \subsection{Device Operation}\label{sec:Device Types /=
 Memory Device / Device Op
=20
 The device MUST NOT change the content of plugged memory blocks.
=20
-The device MUST allow to read from unplugged memory blocks inside
-the usable device-managed region.
+The device MUST allow the CPU to read from unplugged memory blocks inside
+the usable device-managed region. \footnote{To allow for simplified dumpin=
g of
+memory. The CPU is expected to copy such memory to another location before
+starting DMA.}
+
+The device MAY allow to read from unplugged memory blocks inside the
+usable device-managed region via DMA.
=20
 The device MAY allow to read from unplugged memory blocks outside
 the usable device-managed region.
--=20
2.26.2


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

