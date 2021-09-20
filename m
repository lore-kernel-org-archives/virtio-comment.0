Return-Path: <virtio-comment-return-2285-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2601E9861ED
	for <virtio-comment@lists.oasis-open.org>; Mon, 20 Sep 2021 13:36:28 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
Date: Mon, 20 Sep 2021 15:36:15 +0200
Message-Id: <20210920133618.16071-3-david@redhat.com>
In-Reply-To: <20210920133618.16071-1-david@redhat.com>
References: <20210920133618.16071-1-david@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v2 2/5] virtio-mem: rephrase remaining memory access statements
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: David Hildenbrand <david@redhat.com>
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
@@ -215,9 +215,9 @@ \subsection{Device Operation}\label{sec:Device Types / =
Memory Device / Device Op
=20
 \drivernormative{\subsubsection}{Device Operation}{Device Types / Memory D=
evice / Device Operation}
=20
-The driver MUST NOT write to unplugged memory blocks.
+The driver MUST NOT write memory of unplugged memory blocks.
=20
-The driver MUST NOT read from unplugged memory blocks outside
+The driver MUST NOT read memory of unplugged memory blocks outside
 \field{usable_region_size}.
=20
 The driver MUST NOT read memory of unplugged memory blocks inside
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

