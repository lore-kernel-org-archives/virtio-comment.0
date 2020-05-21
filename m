Return-Path: virtio-comment-return-1284-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AEE0B985FA8
	for <virtio-comment@lists.oasis-open.org>; Thu, 21 May 2020 10:50:07 +0000 (UTC)
From: Petre Eftime <epetre@amazon.com>
Date: Thu, 21 May 2020 13:49:42 +0300
Message-ID: <20200521104942.5440-1-epetre@amazon.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH 1/1] content: Reserve virtio-nsm device ID
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: virtio-comment@lists.oasis-open.org
Cc: graf@amazon.com, Petre Eftime <epetre@amazon.com>
List-ID: <virtio-comment.lists.oasis-open.org>

The NitroSecureModule is a device with a very stripped down
Trusted Platform Module functionality, which is used in the
context of a Nitro Enclave (see https://lkml.org/lkml/2020/4/21/1020)
to provide boot time measurement and attestation.

Since this device provides some critical cryptographic operations,
there are a series of operations which are required to have guarantees
of atomicity, ordering and consistency: operations fully succeed or fully
fail, including when some external events might interfere in the
process: live migration, crashes, etc; any failure in the critical
section requires termination of the enclave it is attached to, so
the device needs to be as resilient as possible, simplicity is
strongly desired.

To account for that, the device and driver are made to have very few
error cases in the critical path and the operations themselves can be
rolled back and retried if events happen outside the critical
area, while processing a request. The driver itself can be made very
simple and thus is easily portable.

Since the requests can be handled directly in the virtio queue, serving
most requests requires no additional buffering or memory allocations
on the host side.

Signed-off-by: Petre Eftime <epetre@amazon.com>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index 91735e3..6eee371 100644
--- a/content.tex
+++ b/content.tex
@@ -2801,6 +2801,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 31         &   Video decoder device \\
 \hline
+0xec2000   &   NitroSecureModule \\
+\hline
 \end{tabular}
 
 Some of the devices above are unspecified by this document,
-- 
2.20.1




Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in Romania. Registration number J22/2621/2005.


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

