Return-Path: <virtio-comment-return-2287-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 77ABE986184
	for <virtio-comment@lists.oasis-open.org>; Mon, 20 Sep 2021 13:36:30 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
Date: Mon, 20 Sep 2021 15:36:16 +0200
Message-Id: <20210920133618.16071-4-david@redhat.com>
In-Reply-To: <20210920133618.16071-1-david@redhat.com>
References: <20210920133618.16071-1-david@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v2 3/5] virtio-mem: document basic memory access to plugged memory blocks
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: David Hildenbrand <david@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Let's cleanly document that the driver just has to allow for access to
plugged memory blocks.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 virtio-mem.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/virtio-mem.tex b/virtio-mem.tex
index cca3c9f..3860b8c 100644
--- a/virtio-mem.tex
+++ b/virtio-mem.tex
@@ -249,6 +249,9 @@ \subsection{Device Operation}\label{sec:Device Types / =
Memory Device / Device Op
=20
 The device MUST NOT change the content of plugged memory blocks.
=20
+The device MUST allow the driver to read and write memory of plugged
+memory blocks.
+
 The device MUST allow the driver to read memory of unplugged memory blocks
 inside \field{usable_region_size} via the CPU. \footnote{To allow for simp=
lified
 dumping of memory. The CPU is expected to copy such memory to another loca=
tion
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

