Return-Path: virtio-comment-return-1332-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 54FD398613F
	for <virtio-comment@lists.oasis-open.org>; Fri, 19 Jun 2020 20:50:13 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Fri, 19 Jun 2020 21:49:59 +0100
Message-Id: <20200619204959.7877-6-alex.bennee@linaro.org>
In-Reply-To: <20200619204959.7877-1-alex.bennee@linaro.org>
References: <20200619204959.7877-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH  v2 5/5] make-setup-generated: optionally add GIT metadata
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
List-ID: <virtio-comment.lists.oasis-open.org>

This isn't a full conversion to git based metadata but it allows for
local builds to add git commit and tree status to the final built
product. The normal formal build process is unaffected and uses
manually updated VERSION, REVISION and REVISION-DATE metadata.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
---
 Makefile                |  3 +--
 make-setup-generated.sh | 34 ++++++++++++++++++++++++++++++----
 makehtml.sh             |  2 +-
 3 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index c426a3c..1698557 100644
--- a/Makefile
+++ b/Makefile
@@ -3,12 +3,11 @@
 # Basic Makefile to aid automation of document building
 #
=20
-
-
 .PHONY: all
 all:
 =09./makeall.sh
=20
+.PHONY: html
 html:
 =09./makehtml.sh local
=20
diff --git a/make-setup-generated.sh b/make-setup-generated.sh
index f15d148..be63bb7 100755
--- a/make-setup-generated.sh
+++ b/make-setup-generated.sh
@@ -1,17 +1,34 @@
 #! /bin/sh
+#
+# Generate version and metadata preamble for the document
+#
=20
+# By default we base the version on the directory metadata
 VERSION=3D1.1
 DATESTR=3D${DATESTR:-`cat REVISION-DATE 2>/dev/null`}
-if [ x"$DATESTR" =3D x ]; then
-    ISODATE=3D`git show --format=3Dformat:'%cd' --date=3Diso | head -n 1`
-    DATESTR=3D`date -d "$DATE" +'%d %B %Y'`
+
+
+# If a second argument is passed we extract what we can from git
+# metadata (closest lightweight tag) and local tree status. This
+# allows locally generated copies to be tagged appropriately.
+#
+# The formal build process skips this.
+if ! test -z "$2"; then
+    TAG=3D$(git describe --dirty --tags)
+    # base date on now
+    DATESTR=3D$(date +'%d %B %Y')
+    COMMIT=3D$(git rev-parse --short HEAD)
+
+    # Finally check if we have un-committed changes in the tree
+    if ! git diff-index --quiet HEAD -- ; then
+        COMMIT=3D"$COMMIT with local changes"
+    fi
 fi
=20
 case "$1" in
     *-wd*)
 =09STAGE=3Dwd
 =09STAGENAME=3D"Working Draft"
-=09WORKINGDRAFT=3D`basename "$1" | sed 's/.*-wd//'`
 =09;;
     *-os*)
 =09STAGE=3Dos
@@ -40,6 +57,15 @@ case "$1" in
 =09exit 1
 esac
=20
+#
+# Finally if we are building a local draft copy append the commit
+# details to the end of the working draft
+#
+if ! test -z "$COMMIT" ; then
+    STAGEEXTRATITLE=3D"$STAGEEXTRATITLE (@ git $COMMIT)"
+fi
+
+
 #Prepend OASIS unless already there
 case "$STAGENAME" in
 =09OASIS*)
diff --git a/makehtml.sh b/makehtml.sh
index e18c350..099746c 100755
--- a/makehtml.sh
+++ b/makehtml.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
=20
 SPECDOC=3D${SPECDOC:-`cat REVISION`}
-./make-setup-generated.sh "$SPECDOC"
+./make-setup-generated.sh "$SPECDOC" $1
=20
 cp virtio-html.tex $SPECDOC.tex
=20
--=20
2.20.1


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

