Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014DC2ECE83
	for <virtio-comment@lists.linux.dev>; Wed,  8 Oct 2025 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759935569; cv=none; b=b9BQ3Qs3ds1LSpJRzZP4DLTMeVsp4wB7wEA8aVXgrenXOETB9sKzixzXpNu+wU/+u1S79P44MJ/S+50n1E2cHKR/RYj+WmGEETkXMPpdAPewy5iG8dd8JGKkeokknfEUoGAS/mhJHE1e4qu9iMqzNptOG+z6WNjQtSmNwtyv6/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759935569; c=relaxed/simple;
	bh=bqPf1FtAVYh5KbriYb+TnvG6c3otjXdjho85pR2/6dU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lkql/Y+h3p+Elu69i1JXaHz0NjPpFspY0IwKbtLrKNnp0tenGjMzSNRkNAGUq9DtUcVKVnspr1ak4ESHUJW3w7eko4F/2547spsnQBgouos7jKDrogKsevraH5Gzi6oHZSG906Ts5Jj3FwGmyWKrIDYY/mM3D7/DJzrgnaUEn4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uEsxrvya; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uEsxrvya"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42421b1514fso6847f8f.2
        for <virtio-comment@lists.linux.dev>; Wed, 08 Oct 2025 07:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759935565; x=1760540365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kdx6IZVt7fRrL3QZce9VO38212pZND+96eRn6HNjQ7o=;
        b=uEsxrvyaOvauRzlJ4lw/m5adwxs1asqwZd9E609YddL2NmWeuVbnGyIH3Xt85UqYWu
         1sVplbn96hARHbyHBuurDOncnIM44fCjmXahVKjTJghZJ5wF+wV6Fj6TkiT4iJW9wPIt
         VGOEkM8dCxq2KlX3ZZv6xji6fvhwPlNGzBbyzJU9Pn20RPLJC3vzQm9ob/RtgcOkBR3D
         I/6MpgXwoxcvnPhkN3kgs1algbVzYvnJYqnEd4XboHefY4I+WbEm0UeBa0ce14/u/usm
         tDIB0n5YGaepmjZP5Ovr7xb0a/hIvwHOH2v56X+uRtZuzd2/20GRBpSWp4zaTr3T5Enj
         bvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759935565; x=1760540365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kdx6IZVt7fRrL3QZce9VO38212pZND+96eRn6HNjQ7o=;
        b=ORn7mFQHXsMUrpcCduWAGr1xxyJhksbgiDHEJqi2ViaqvmX+aobfaFTKrxzkLL95X8
         QvEgLAt/NO4kZsba2kkyw9wPkHWvZp8w9EKPQ8dIobnTAh8av/D/3sVEXSOCP3am/hBN
         iAJZ1np4tdSJyq4pbbB30A49h4F4wGLqI7MEMTNHhNF2y6W11dxxCMQMVzXkUFSOYKqJ
         6IBqPbyqBgioJbptjm0JdLaJOb34ekPcnAUl06ArlZ3Hd0zKX6TllTuDg3i4V4sTzCPK
         94TYibRiVd4+9enPRghBXee89zbS/EeznvLncdptJGmVehaOE9Mr8R/1PEG9/L+gXSzX
         lh0w==
X-Gm-Message-State: AOJu0YyDRWPojOFjPhDPHNoBoXvnQ1BMOnVS0RxeUhUbji0QtdFczpfD
	emWLby9AXj5Qy5C28kbmKjuDJbuxoJTuvjVshMhIkDYsphJxcAV/NJq4RNBEzsf0No4=
X-Gm-Gg: ASbGncvzI736w5a7vFT3E6mFoCQhDJAfnmKv5xI58xB86bf9steoCplhsyQS5rHsksz
	Wc9SDcw4tRm8d0aTHXloTcv5gRaWx55NgIW08VWVzuiuibQPN4tGEGKtqkllySCbspcYaWANDUQ
	USTUvBrvh25hUjp/t3d9rjZ1qHQrGXcBcMam1vRsGLujSfKCpxlSYhKV1jr0mNBeKpfZTQxBMEb
	N7SvSWMlLTJednAjawncuXjMeziK38oayAl3REQg9Z2IqDUSQfVHXltoD02YfyVXht/QgZeiSnk
	kte4nq1VfsIM3Lo4BTnP4ZS5Oi9b8DiAqg8QnzaegnTsJtb8TLdcpK08AYsqhCqjvZitIfA19K+
	Djs5Ufgmr5VyL8kHulLP2UzAZC9kqJaVGwttcPN6jeKv+ExQpGaA=
X-Google-Smtp-Source: AGHT+IE4Lb3zOtjG2upj1SgsDj4JEzirE8uo6BFfhzJn2pA3GyqRLQT4r0meErUmk/kW+1Xl7e/9Pw==
X-Received: by 2002:a05:6000:1a8b:b0:425:8bd1:fbb4 with SMTP id ffacd0b85a97d-4266e7df95cmr2531426f8f.50.1759935563849;
        Wed, 08 Oct 2025 07:59:23 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6b77sm30315148f8f.6.2025.10.08.07.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:59:22 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 678575FA5C;
	Wed, 08 Oct 2025 15:59:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 7/9] make-setup-generated: optionally add GIT metadata
Date: Wed,  8 Oct 2025 15:59:14 +0100
Message-ID: <20251008145916.2626143-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251008145916.2626143-1-alex.bennee@linaro.org>
References: <20251008145916.2626143-1-alex.bennee@linaro.org>
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

