Return-Path: virtio-comment-return-843-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 81FEF985B2F
	for <virtio-comment@lists.oasis-open.org>; Tue, 20 Aug 2019 12:02:00 +0000 (UTC)
From: Yoni Bettan <ybettan@redhat.com>
Date: Tue, 20 Aug 2019 15:01:44 +0300
Message-Id: <20190820120144.108598-3-ybettan@redhat.com>
In-Reply-To: <20190820120144.108598-1-ybettan@redhat.com>
References: <20190820120144.108598-1-ybettan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH V4 2/2] README.md: Added building instructions.
To: virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, stefanha@gmail.com, ehabkost@redhat.com, ailan@redhat.com, Yoni Bettan <ybettan@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Signed-off-by: Yoni Bettan <ybettan@redhat.com>
---
 README.md | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/README.md b/README.md
index 4747824..5ac84f9 100644
--- a/README.md
+++ b/README.md
@@ -29,6 +29,34 @@
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
+<p>OSX users don't need to install Tex-Live because they already have
+<a href="http://www.tug.org/mactex/">MacTex</a> installed.
+
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
 <h4>Providing Feedback</h4>
 Feedback must be provided the <strong>virtio-comment</strong> mailing list,
 and archived in the mailing list archives.
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

