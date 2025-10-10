Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74DB2FC003
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 16:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760113752; cv=none; b=WiAKG4nOqRqIhV+pF7Od0wyF8NiHCaFEQuwEPWY4oBpKU0hQWwPRtYesYQ3ZM+uT8Vhh7p/XXxAFHTalGz/AA4icrEL2h3ejpIVrExejgKirR16XTuRjFEUiuQhXUBeSTercidx41RKb+pw9m2MqWX8n1zxFGwtzOM3E/wE6gfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760113752; c=relaxed/simple;
	bh=MuZR8k5sp+6tWhI4EBaJG7jxzr4GIbg+a9K9aHL8lHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nTqiycfENHxvwH88htZ23VXM5YzHAuRMoFYQXhNRunNq7mOF0sEeE3XjMHuHNDdEOOs31Q94PqCCERALF0kNO1tuHCVOKEQsB2SAmL9HjNIR58z1xRaZzr0tIzZu/1Sqwsw6xTZhHSW6IpwIwEbWcOZjONFXBYGDvxHQe4oIQMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N6JsPCVi; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N6JsPCVi"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-631df7b2dffso5308729a12.1
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 09:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760113749; x=1760718549; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbJQu2m8LxcRYihwDkHRfve9bEf2/kB5QJDZLuQ7tDI=;
        b=N6JsPCViAM04nRJqj+mufYRVWXi5jKnLGvmvePXwvzw0ujpnGhwOhnwVnKvUNT/7Tq
         +CblpLE7D63zFy5bmSMOeV8YXc9xhnTWb273XsBAlzTHgSW8KxzTTWOlvhGLcw1p+FyH
         7n87YaxaCb15pcAWa9uen68FD953NMt/r+dEXsdlfN0507wlUjZOUF3BdUn4RimEswW0
         PMyHd+4Y+85t4AFv6Lbrb1xUAIe/5Vkscetyt/4foH30VycLJkrHoVcqLXxYj+ytMdoI
         GCQK5HktxeGSFEk9RtwQ58l49312QnjPLSqU9AWti/DxUphhaopDsGVZ1bFCmYxFTB5H
         K0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760113749; x=1760718549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbJQu2m8LxcRYihwDkHRfve9bEf2/kB5QJDZLuQ7tDI=;
        b=OSrRbUL+D0emx1e8GayI1gKgsBcEPKufy/Fp+ZSYLuTmPYXi26CnqsCkEIWGjTg6c2
         orUZyt2imBW6u6G601F0y2HM9qvP/U6UalCH3iszfkBdjt0grpeimCFRneP0QslBx6E+
         7ltQQh7OEw8MTdv6/82vDZZuuxEh54ldLQhuhoGIT0pyFK7sh+QzRFwYsyWipCEFkSZ+
         2esFcUclMatyzcY0lsJHdIR01O6tcHXsaf4VknWB9luYDRdNmHto2z4C6Qu39b4MAAr9
         qYiE3xZfMhxmDcJmn/21DNIqkVoqQYEt815z7ztPzHVzGva3NL3TbwDnm/L7r4QTJEVp
         x19w==
X-Gm-Message-State: AOJu0Ywl63ow4jLksUAtHAVNOTPN2/DsTixRVi/T4UFSA5HP5Q2C1oSo
	EHj77K/ZplSn7+rkZVEADFFZBAaBLJdu58qy/+aNwjnvNWb5ebj308q5KV0+XDSf/xM=
X-Gm-Gg: ASbGncvTSSu6CmoOM/JRvteFkuD5WTopTpCaWQH8Lv3vCCxXs9jg9gMKNHP/XmfBE0h
	Af38uPQaEWzDlKpo8ayw/q6/DUZQKM7RZ34po3Eq6ybT5UGc/w8cDRMemk7met1Ka4AwM5BYK1F
	GcKb54nsfffKXJ0i6FCGxRGjIUxyM3SLwI0BX6qFa68gHGMJVxnHNdyS6ebIwsvFev9GBDZevTU
	IrydOTrxaB5LKi3y2BduaX7fG6vASjUhGgBlGMUNfmwtuJ1LLoF30/1oLYZha7QiVH0tJopXPjh
	pgEsGjZwRsZh0igF20IZy2BNexz60CTvLJxnFNysxkEIcKce1nQWNtndw9UgyGGi5waFgq1am6M
	wLLPILPF3S+ZuHKMZqcu/pTDcwi15v8aZKtQMhZLuqvamKdqAIw/V6V2B2L9Wdz4rThI=
X-Google-Smtp-Source: AGHT+IFDQacRpSpTsdCKIsjO/lMQD6caDjQH9AoU4RTdmkH6nix2mpD5rGh7LQMIyLvejgq5rK0wyQ==
X-Received: by 2002:a17:907:d7ca:b0:b3d:a295:5445 with SMTP id a640c23a62f3a-b4f4116a343mr2137325066b.13.1760113749163;
        Fri, 10 Oct 2025 09:29:09 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a461703dbsm2717744a12.0.2025.10.10.09.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 09:29:03 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E0A435FAA0;
	Fri, 10 Oct 2025 17:28:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 09/11] make-setup-generated: optionally add GIT metadata
Date: Fri, 10 Oct 2025 17:28:56 +0100
Message-ID: <20251010162858.4107388-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010162858.4107388-1-alex.bennee@linaro.org>
References: <20251010162858.4107388-1-alex.bennee@linaro.org>
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
v3
  - re-flow logic so we either do "unofficial draft" or the formal
  OASIS doc type, not both
  - use git describe --tags for more descriptive git point
  - expose git version to VERSION
---
 make-setup-generated.sh | 96 +++++++++++++++++++++++++----------------
 makeall.sh              |  4 +-
 makehtml.sh             |  2 +-
 makepdf.sh              |  2 +-
 4 files changed, 63 insertions(+), 41 deletions(-)

diff --git a/make-setup-generated.sh b/make-setup-generated.sh
index 2c5c7f8..256f700 100755
--- a/make-setup-generated.sh
+++ b/make-setup-generated.sh
@@ -1,45 +1,67 @@
 #! /bin/sh
+#
+# Generate version and metadata preamble for the document
+#
 
 DATESTR=${DATESTR:-`cat REVISION-DATE 2>/dev/null`}
-if [ x"$DATESTR" = x ]; then
-    ISODATE=`git show --format=format:'%cd' --date=iso | head -n 1`
-    DATESTR=`date -d "$DATE" +'%d %B %Y'`
-fi
 
-case "$1" in
-    *-wd*)
-	STAGE=wd
-	STAGENAME="Working Draft"
-	WORKINGDRAFT=`basename "$1" | sed 's/.*-wd//'`
-	;;
-    *-os*)
-	STAGE=os
-	STAGENAME="OASIS Standard"
-	WORKINGDRAFT=""
-	;;
-    *-csd*)
-	STAGE=csd
-	WORKINGDRAFT=`basename "$1" | sed 's/.*-csd//'`
-	STAGENAME="Committee Specification Draft $WORKINGDRAFT"
-	;;
-    *-csprd*)
-	STAGE=csprd
-	WORKINGDRAFT=`basename "$1" | sed 's/.*-csprd//'`
-	STAGENAME="Committee Specification Draft $WORKINGDRAFT"
-	STAGEEXTRATITLE=" / \newline Public Review Draft $WORKINGDRAFT"
-	STAGEEXTRA=" / Public Review Draft $WORKINGDRAFT"
-	;;
-    *-cs*)
-	STAGE=cs
-	WORKINGDRAFT=`basename "$1" | sed 's/.*-cs//'`
-	STAGENAME="Committee Specification $WORKINGDRAFT"
-	;;
-    *)
-	echo Unknown doc type >&2
-	exit 1
-esac
+# If a second argument is passed we extract what we can from git
+# metadata (closest lightweight tag) and local tree status. This
+# allows us to build an unofficial draft and tag it appropriately.
+#
+# The formal build process skips this.
+if ! test -z "$2"; then
+    TAG=$(git describe --dirty --tags)
+    # base date on now
+    DATESTR=$(date +'%d %B %Y')
+    COMMIT=$(git describe --tags HEAD)
+
+    # Finally check if we have un-committed changes in the tree
+    if ! git diff-index --quiet HEAD -- ; then
+        COMMIT="$COMMIT with local changes"
+    fi
 
-VERSION=`echo "$1"| sed -e 's/virtio-v//' -e 's/-.*//'`
+    STAGE=draft
+    STAGENAME="Unofficial Draft"
+    WORKINGDRAFT=
+    VERSION="git @ $COMMIT"
+else
+    # These are all stages mandated by the OASIS process
+    case "$1" in
+        *-wd*)
+	    STAGE=wd
+	    STAGENAME="Working Draft"
+	    WORKINGDRAFT=`basename "$1" | sed 's/.*-wd//'`
+	    ;;
+        *-os*)
+	    STAGE=os
+	    STAGENAME="OASIS Standard"
+	    WORKINGDRAFT=""
+	    ;;
+        *-csd*)
+	    STAGE=csd
+	    WORKINGDRAFT=`basename "$1" | sed 's/.*-csd//'`
+	    STAGENAME="Committee Specification Draft $WORKINGDRAFT"
+	    ;;
+        *-csprd*)
+	    STAGE=csprd
+	    WORKINGDRAFT=`basename "$1" | sed 's/.*-csprd//'`
+	    STAGENAME="Committee Specification Draft $WORKINGDRAFT"
+	    STAGEEXTRATITLE=" / \newline Public Review Draft $WORKINGDRAFT"
+	    STAGEEXTRA=" / Public Review Draft $WORKINGDRAFT"
+	    ;;
+        *-cs*)
+	    STAGE=cs
+	    WORKINGDRAFT=`basename "$1" | sed 's/.*-cs//'`
+	    STAGENAME="Committee Specification $WORKINGDRAFT"
+	    ;;
+        *)
+	    echo Unknown doc type >&2
+	    exit 1
+    esac
+
+    VERSION=`echo "$1"| sed -e 's/virtio-v//' -e 's/-.*//'`
+fi
 
 #Prepend OASIS unless already there
 case "$STAGENAME" in
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

