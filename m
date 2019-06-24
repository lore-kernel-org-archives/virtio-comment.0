Return-Path: virtio-comment-return-760-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 69F6B984355
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Jun 2019 08:39:04 +0000 (UTC)
From: Yoni Bettan <ybettan@redhat.com>
Date: Mon, 24 Jun 2019 11:38:42 +0300
Message-Id: <20190624083842.5921-1-ybettan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH] Added instructions to install latex to README.md.
To: virtio-comment@lists.oasis-open.org
Cc: ailan@redhat.com, ehabkost@redhat.com, mst@redhat.com, Yoni Bettan <ybettan@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Signed-off-by: Yoni Bettan <ybettan@redhat.com>
---
 README.md | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/README.md b/README.md
index 3de0c1e..06f3563 100644
--- a/README.md
+++ b/README.md
@@ -62,6 +62,12 @@ git format-patch -o proposal1/ HEAD~1..<br>
 <p>
 git send-email --to=virtio-comment@lists.oasis-open.org proposal1/0001-*
 </code>
+<br><br>
+To do so you will need to install latex in order to compile the spec.
+For fedora user use:
+<code>
+sudo dnf install texlive-scheme-full
+</code>
 <h4>Note for TC Members</h4>
 <p>TC Members should review TC specific
 process rules under "Further Description of this Repository"
-- 
2.21.0


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

