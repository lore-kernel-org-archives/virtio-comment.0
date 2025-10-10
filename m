Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9958286883
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 11:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095224; cv=none; b=D2He8VMfuNBxjnWAX3gJQ63+4SG1hL/b5aBj3NM0zVXVqJdO/Vs4Dl2R3mgfwuxPFigmGWt+v0k0CfOQ/VOs/ZFsRxCqx266qV8pfzLSuUpquxJKYh/E8p4dYvIcLkGCqpjcLj9q7nEUrvH+ttUfPktr56uBuA8FUriWQYq9UxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095224; c=relaxed/simple;
	bh=gU2osOlVJddZuJX09TPrTYQ9Q7Zp1wPWB17tFEziUsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n2Lr9Q071rU80G/Ssc/seiLkPtdCu/hjaI36wXxNY6+Or+dYf3lAnvUvfab8NCI8Tlo9Vzxlg5hdUe3XA2P0SGKovkcI+FfgxZoz2S38tDE7jhe5ya0r4xTiQeN0Pkj3Eg0y8Xv94r0WQQuw2RzFpBPY1xwCES+zhQy5u59ses0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YbgoPL15; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YbgoPL15"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62ec5f750f7so3411013a12.3
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 04:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760095220; x=1760700020; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpudwtPK0jrqMFXw2o38+mQ+xEOQM+o1ABBo8+QBRrs=;
        b=YbgoPL15/MIJkxga+IVAll1uvcj/bC83NQpZ6mzxd0dF1dU/Iq5R6bQVLTBZ0panw+
         KKd2RnVAgbYQnx0Ikn0FwFYuv7ONpN4BnfRqDicN+tjT8YRvAbZnER4cCzcFakyHpem8
         yKS6NV5sVhb77ilbv4idSC6DQ0+le+jAUlPGdp1jtcpZdqJTl7GoT/ZkwhBl0Crl7cXQ
         W8FFf8F3GSi6+AjLoV520PWD5DXs+2x25mUAsPECitpruprdrCtJ998+YSynqS3mKloD
         KKtebvVCF7XsGm3K76v5GXnj3qgtZ8FsZ9q2NTCyBJLw1aHqHbZujA6P3uCEGTZYZBOO
         Nz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760095220; x=1760700020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vpudwtPK0jrqMFXw2o38+mQ+xEOQM+o1ABBo8+QBRrs=;
        b=QC1uI5RU+0E+sWcPUyklhvEQN9k6MY4HFc5SAXroug1vSw16XnweGeJdi1WGXx+O2a
         F+M51ythRY0HyUZAANCzJraBTEmJvsH9qjuq0a74TL6yIYJjAaNOd6tXjZc4s3uDusBm
         0OIEqsmc9amz3etwJ1zT7YUi7+HOiF5PVSbJU+P+32Gunkv4mgdBiymIUek14WLvI1qL
         NEZXrJQplICbY/NIT3ciwmdtodYvqtYQyVEwIM9jAaIUBHZNhZLbTkpCcoyvuXXRBRbK
         kUcoM9mXBnEJ50HP6gzW9qTSus9leXNYBy/343shQs2TqsaKZE7zOWXsET7EQNP9LKnC
         7XwA==
X-Gm-Message-State: AOJu0YyeTd3wGMM8RxL4hnU5jBf5XYeFaM8beaj062+yan+aNovh//mr
	/umRPLW4zCbc/ckgS4PlpEGLMnLlRGBGrCjqF3c3iESYwgIzctXYfZwiZFZmR57Y2XBA4PPHweg
	PVa9+
X-Gm-Gg: ASbGncvNcz15CyDz5FiaUWhMhNmMXq4rJrnOO9FBOF1oI7zp6r3fqLt+1H4iO+BMkrE
	VNqiIIJtjzhbobYY+ZD2CzxKi3Zr2mtSSeybPnQLJkG+ebhxXyk/0M8kFbi9Ie9ORoRk4NU+R9g
	7crjqS3EdTfRrDW8JHeDh1SVGAWDxuKqNuMMAnbb3MEqiCrS68ASuhxu888+VnNoPplpAyk0Ed7
	YqdYY9/H8XSvP/ZXvi6D6XfSYmOyouRjxaOpDqr8ydJETa80j7Sbs6QX1jSpiXNJtS7CW5RapQe
	EMjjwcBb9fnlhRfO0PzaXJN0G7N+Lkc8rZe+VNcGD148h75/tyfwf4zBMuHhkWDHJbZCvFr0jTY
	t+AM575XE0uc7ITM13HqeFr2ei0UHEc98D0tBkkXy7B1pFFaDQ71SK0yY
X-Google-Smtp-Source: AGHT+IG5b2ZDoPWp7jbW2pGKH8NSko5ZGN9IbJwX+1hVQYLVPMxgru8IyvGQqB4YffJNHMzb98639Q==
X-Received: by 2002:a05:6402:4305:b0:639:dfba:ca4b with SMTP id 4fb4d7f45d1cf-639dfbb0ee3mr9200412a12.8.1760095220146;
        Fri, 10 Oct 2025 04:20:20 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b71438sm2080521a12.25.2025.10.10.04.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:20:15 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 012655FA6F;
	Fri, 10 Oct 2025 12:20:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 08/10] make-setup-generated: optionally add GIT metadata
Date: Fri, 10 Oct 2025 12:20:08 +0100
Message-ID: <20251010112010.3880438-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010112010.3880438-1-alex.bennee@linaro.org>
References: <20251010112010.3880438-1-alex.bennee@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This isn't a full conversion to git based metadata but it allows for
local builds to add git commit and tree status to the final built
product. The normal formal build process is unaffected and uses
manually updated VERSION, REVISION and REVISION-DATE metadata.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-ID: <20251008145916.2626143-8-alex.bennee@linaro.org>
---
 make-setup-generated.sh | 32 ++++++++++++++++++++++++++++----
 makeall.sh              |  4 ++--
 makehtml.sh             |  2 +-
 makepdf.sh              |  2 +-
 4 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/make-setup-generated.sh b/make-setup-generated.sh
index 2c5c7f8..8d33ac5 100755
--- a/make-setup-generated.sh
+++ b/make-setup-generated.sh
@@ -1,16 +1,31 @@
 #! /bin/sh
+#
+# Generate version and metadata preamble for the document
+#
 
 DATESTR=${DATESTR:-`cat REVISION-DATE 2>/dev/null`}
-if [ x"$DATESTR" = x ]; then
-    ISODATE=`git show --format=format:'%cd' --date=iso | head -n 1`
-    DATESTR=`date -d "$DATE" +'%d %B %Y'`
+
+# If a second argument is passed we extract what we can from git
+# metadata (closest lightweight tag) and local tree status. This
+# allows locally generated copies to be tagged appropriately.
+#
+# The formal build process skips this.
+if ! test -z "$2"; then
+    TAG=$(git describe --dirty --tags)
+    # base date on now
+    DATESTR=$(date +'%d %B %Y')
+    COMMIT=$(git rev-parse --short HEAD)
+
+    # Finally check if we have un-committed changes in the tree
+    if ! git diff-index --quiet HEAD -- ; then
+        COMMIT="$COMMIT with local changes"
+    fi
 fi
 
 case "$1" in
     *-wd*)
 	STAGE=wd
 	STAGENAME="Working Draft"
-	WORKINGDRAFT=`basename "$1" | sed 's/.*-wd//'`
 	;;
     *-os*)
 	STAGE=os
@@ -41,6 +56,15 @@ esac
 
 VERSION=`echo "$1"| sed -e 's/virtio-v//' -e 's/-.*//'`
 
+#
+# Finally if we are building a local draft copy append the commit
+# details to the end of the working draft
+#
+if ! test -z "$COMMIT" ; then
+    STAGEEXTRATITLE="$STAGEEXTRATITLE (@ git $COMMIT)"
+fi
+
+
 #Prepend OASIS unless already there
 case "$STAGENAME" in
 	OASIS*)
diff --git a/makeall.sh b/makeall.sh
index 37e6c34..5f5d5dc 100755
--- a/makeall.sh
+++ b/makeall.sh
@@ -3,8 +3,8 @@
 export SPECDOC=${SPECDOC:-`cat REVISION`}
 export DATESTR=${DATESTR:-`cat REVISION-DATE`}
 ./makezip.sh
-./makehtml.sh
-./makepdf.sh
+./makehtml.sh $1
+./makepdf.sh $1
 zip $SPECDOC.zip $SPECDOC.pdf
 echo Generated file $SPECDOC.zip
 echo To change output file name, set SPECDOC environment variable
diff --git a/makehtml.sh b/makehtml.sh
index 45b7080..cf1a8d7 100755
--- a/makehtml.sh
+++ b/makehtml.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 
 SPECDOC=${SPECDOC:-`cat REVISION`}
-./make-setup-generated.sh "$SPECDOC"
+./make-setup-generated.sh "$SPECDOC" $1
 
 cp virtio-html.tex $SPECDOC.tex
 
diff --git a/makepdf.sh b/makepdf.sh
index 9cae903..bdfb8e5 100755
--- a/makepdf.sh
+++ b/makepdf.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 
 SPECDOC=${SPECDOC:-`cat REVISION`}
-./make-setup-generated.sh "$SPECDOC"
+./make-setup-generated.sh "$SPECDOC" $1
 
 rm $SPECDOC.aux $SPECDOC.pdf $SPECDOC.out
 xelatex --jobname $SPECDOC virtio.tex
-- 
2.47.3

