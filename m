Return-Path: virtio-comment-return-762-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CF012985A41
	for <virtio-comment@lists.oasis-open.org>; Tue, 25 Jun 2019 07:33:56 +0000 (UTC)
From: Yoni Bettan <ybettan@redhat.com>
Date: Tue, 25 Jun 2019 10:33:36 +0300
Message-Id: <20190625073336.7813-1-ybettan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH V2] Added building instruction to README.md.
To: virtio-comment@lists.oasis-open.org
Cc: ehabkost@redhat.com, ailan@redhat.com, mst@redhat.com, Yoni Bettan <ybettan@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Signed-off-by: Yoni Bettan <ybettan@redhat.com>
---
 README.md | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/README.md b/README.md
index 3de0c1e..fc33c9f 100644
--- a/README.md
+++ b/README.md
@@ -29,6 +29,40 @@
 <div>
 
 <h3>Further Description of this Repository</h3>
+<h4>Building Instructions</h4>
+<p>In order to build the spec you will need <a href="https://www.tug.org/texlive/">Tex-Live</a>.
+Installing it can be done via:<br>
+Fedora:
+<code>
+sudo dnf install texlive-scheme-full
+</code><br>
+Ubuntu:
+<code>
+sudo apt-get install texlive-full
+</code><br></p>
+<p>The building proccess is done with
+<code>
+./makeall.sh
+</code>
+and it contains 3 main parts:
+<code>
+makezip.sh
+</code>,
+<code>
+makehtml.sh
+</code>,
+<code>
+makepdf.sh
+</code>.
+Using
+<code>
+./makehtml.sh
+</code>
+should be enought if you just want to test your changes since
+<code>
+makepdf.sh
+</code>
+may required some font packages.</p>
 <h4>Providing Feedback</h4>
 Feedback must be provided the <strong>virtio-comment</strong> mailing list,
 and archived in the mailing list archives.
-- 

V1 -> V2:
    * Added building instructions

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

