Return-Path: virtio-comment-return-875-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 56B6A9860B2
	for <virtio-comment@lists.oasis-open.org>; Thu, 24 Oct 2019 10:22:42 +0000 (UTC)
From: Yoni Bettan <ybettan@redhat.com>
Date: Thu, 24 Oct 2019 13:22:33 +0300
Message-Id: <20191024102234.41927-2-ybettan@redhat.com>
In-Reply-To: <20191024102234.41927-1-ybettan@redhat.com>
References: <20191024102234.41927-1-ybettan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] [PATCH 1/2] Rearranged the "Providing Feedback" section of README.md
To: virtio-comment@lists.oasis-open.org
Cc: Yoni Bettan <yonibettan@gmail.com>, Yoni Bettan <ybettan@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

From: Yoni Bettan <yonibettan@gmail.com>

Just arranged the alignment and also updated bullet #5 to fit multiple comm=
its
instead of a single one.

Signed-off-by: Yoni Bettan <ybettan@redhat.com>
---
 README.md | 60 +++++++++++++++++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 19 deletions(-)

diff --git a/README.md b/README.md
index 5ac84f9..f2fa5d0 100644
--- a/README.md
+++ b/README.md
@@ -71,25 +71,47 @@ have any attachments.
 A patch can be generated and sent by cloning the spec repository,
 creating a commit, formatting it as a patch and then sending it.
 For example:
-<code>
-<p>
-git clone https://github.com/oasis-tcs/virtio-spec.git<br>
-... edit spec text, and save ...<br>
-<p>
-git commit -a<br>
-... describe the proposed change, in the following format:<br>
-single line summary<br>
-<br>
-detailed description, including motivation for the change<br>
-<br>
-Signed-off-by: Name &lt;email&gt;<br>
-... then save and close the editor ... <br>
-<p>
-git format-patch -o proposal1/ HEAD~1..<br>
-... generates a new directory proposal1/ and a file starting with 0001- ..=
.<br>
-<p>
-git send-email --to=3Dvirtio-comment@lists.oasis-open.org proposal1/0001-*
-</code>
+<ol>
+<li>
+  clone the repository using
+  <code> git clone https://github.com/oasis-tcs/virtio-spec.git </code><br=
>
+</li>
+
+<li>
+  edit spec text and save<br>
+</li>
+
+<li>
+  commit changes using
+  <code> git commit -a</code>=20
+  and describe the proposed change, in the following format:<br>
+  <br>
+  single line summary<br>
+  <br>
+  detailed description, including motivation for the change<br>
+  <br>
+  Signed-off-by: Name &lt;email&gt;<br>
+  <br>
+</li>
+
+<li>
+  save and close the editor<br>
+</li>
+
+<li>
+  create the patch using=20
+  <code>
+    git format-patch -o proposal1/ HEAD~N
+  </code>=20
+  - it will generates a new directory 'proposal1/' and a files starting wi=
th '0001-...' based on the last N commits of your git log <br>
+
+<li>
+  send the patch using=20
+  <code>
+    git send-email --to=3Dvirtio-comment@lists.oasis-open.org proposal1/00=
01-*
+  </code>
+</li>
+</ol>
 <h4>Note for TC Members</h4>
 <p>TC Members should review TC specific
 process rules under "Further Description of this Repository"
--=20
2.21.0


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

