Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722400;
	b=U7n/6pIsEbN6IfC0idGL6GqlPoFN1cdzVXfDl0YTlltSzk/HVGcBQmgtC8A1bgQd9lBw
	 TIHv1AoWW9U+b3sZFa49mQLz49HajTj19FwF/vlLHKmWj8j/IhfAri1RGBup0OpOhwYxO
	 byOXGbS0o4saNnxdIKAXzpHuczBNIqkUcRCTpGWukoyoV4EzoH9dWXpn+DR3tY+/0FN4G
	 6T5XFHpnxkAhyj2V8zKqSEq7tUuKrv+g0glOBkF6UpZGvd8YxDmUrrgqbA1FSjozQqTM7
	 C+gp1NCnyaWvEqKFmG5Ntgp1VSwUV1lNRvgts6zuFChiyvstOecbqz3fFFdj1gaWIaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=OOuuKMVIzzAM69AHaEeNDWJT7q08uIQEcreRS3QIDg4=;
	b=ASFAct3PH3FNpSbiUlYuHfTdWwWdvZRrcW3q9joSBBPCNJO79Gn8aIT2iB3kg3745H3O
	 IjKfK8aG1Ydkz0F8MUjdFv2Ttakhtqe2QkoBlnUGITmMKXMakaFjfFu+/sSox8ixwS6kK
	 9thUWzeO1P52uqlrNPF/QbR5I8vaxlYlmXbYrj9rTsoVTuZ+/TrwYcRxC5x2s97UIdl72
	 UaXqTCkFt6yOrJUFI3BxQ1JEo1bOACAiRvsWe5G8GB5qsCDTMVN9v8qYhHyfWkmpAD+6R
	 usalR97ck62N9YXwfEty5glY7V+iTkkZ562NMnlrov3B2SkqU8DZrDAAKCwz3MyTZ8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Nttzg8h4;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149D1606A329
	for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 19:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 149D1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Nttzg8h4
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490d59c3edaso5029014f8f.1
        for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 11:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795722398; x=1796327198; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OOuuKMVIzzAM69AHaEeNDWJT7q08uIQEcreRS3QIDg4=;
        b=Nttzg8h4ZzI/pQXO0Zz0LUq1ZF/pMIHjH1eaIjYQiyfWU9uyMkxzZ707m1Q0HyzHLm
         mwu+hHZj506R6GtD/QrDrRD+ALXeChbBpZ8hTcNj7yvOk2fHrWnOXH3AplZy+PDkccE6
         kc0qam0kZkVSmfoPVvjtAYHszB7XiF5NfsxOb0J8/hasE/UGWviDThAFqZn+6nXeeCOi
         WlzptJHlLPbscxAVd33Sv6KYHfCarEliEKWoDXHHwSAIN84McBtcu7ariF8pI3ON7Rnz
         OUc3clXjbDdmypoDZ5S/8zprc1ZXo5D5EG8gu5YthgOuzDT5K/uyxHk3BLwWLKQrXJTi
         daTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722398; x=1796327198;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OOuuKMVIzzAM69AHaEeNDWJT7q08uIQEcreRS3QIDg4=;
        b=tP+/gaOlwYADTcXLS97r1qxBHZ8FXaGAu0BhvawsO5dCXY9l25HE+XaCxlRImbnJ/j
         Bs8mf+YEiPfY9wrP23fmp7XlJ0oZMsvDP6Lw6QtgA5041ABhzwC6AdH0fQtwWnlOkp60
         VJ6aMX1Uwl5hg3brxMDa6qQTi2WH1kT0zVfjsEU9rTSSRRVbYWnz0QhgYokK2BF143Wz
         wggfSneDu8I7jHDoK7CUehGMTEOq6NSVsHINdTKvbQTQZa0VgU/wX1usHq+37KYRS/07
         loTMv+tFmFHxe3YJgnV4GEoN+FH9q+7JEuiw0Y9dJw33lFEchDQNa7qqf8oWJKP7vd5/
         +bOA==
X-Gm-Message-State: APuU4Z8pnlaONN51spNeKjUSSKl1SaajZvG8k5NPdc85DpyMqXOhvK3r
	mZTNipLC/U3V2zhrU5ZYLDXLh5K4rR9DuPYo9GBQms4FFIVSHsaoAA/r6IKTYCCvRPgkXj6DZbg
	7WD9R
X-Gm-Gg: AZFdTZeWDQObAolACBmU1QPHiWG5MCPfAk3e5wsMKRAjouVV+79m7fjuDHJQDV9T/Hm
	we2zctS3jYEqslQhl/NSK3mVgUv1cipnTjpMOmHWv8ALPD4lGTnNAuEn0skMl8bS2WuDk2YMr4c
	vIUkNAfedMZ5A1lyvP63HaVJHQoS/adsuOVaedHWAuoufCZApopcjPWzBJ94Bxy5jbnxGl2Mm5N
	TJpDdqnX/jaq8tD7hZb6Sv215wxfzB17BLe8C+SVIRRoUATEePCbvzQbqYAGXz7i1UOGhrvbFjT
	E/jqJv4xJ4lhCFlx8V6KcS4W5RNPXzl8lr+JKamLWOa7Fk34zG5MJwxoeWkX0hOImUjNFG6LcPc
	zH85bt5y97FgvYbs4TBzvewG4G/BOj2ZFUdJD4M0cKFI6/4aXDFIVA9M+02WzMbw3qZmiNO8AeA
	sgqf97kWQXiItdCgYceRkyFC783MwP6lRZvgO2IVF3rnmxpwk1WjtCfHyjv+325qg3yzQ6J72SF
	iyIdxZ7pqzrSfs5y2TskZbXma5RXw3QARbzBZGWNdZhgURpw29bFgOXnfRTxA110vEP66+YXc8A
	E/MjDm4RFFt8WjzwAELV6fGIurxa
X-Received: by 2002:a05:6000:2083:b0:491:cd7:e96b with SMTP id ffacd0b85a97d-4aa5710d738mr51926489f8f.15.1795722398474;
        Thu, 26 Nov 2026 11:46:38 -0800 (PST)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm43066855f8f.44.2026.11.26.11.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:46:37 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 01D4A5FD43;
	Thu, 26 Nov 2026 19:46:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 10/12] make-setup-generated: optionally add GIT metadata
Date: Thu, 26 Nov 2026 19:46:30 +0000
Message-ID: <20261126194632.2429425-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126194632.2429425-1-alex.bennee@linaro.org>
References: <20261126194632.2429425-1-alex.bennee@linaro.org>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
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
v4
  - fallback when git describe has no tags
  - constrain tag search to version tags
  - keep metadata in STAGENAME
---
 make-setup-generated.sh | 101 ++++++++++++++++++++++++----------------
 makeall.sh              |   4 +-
 makehtml.sh             |   2 +-
 makepdf.sh              |   2 +-
 4 files changed, 66 insertions(+), 43 deletions(-)

diff --git a/make-setup-generated.sh b/make-setup-generated.sh
index 2c5c7f8..932cef9 100755
--- a/make-setup-generated.sh
+++ b/make-setup-generated.sh
@@ -1,49 +1,72 @@
 #! /bin/sh
+#
+# Generate version and metadata preamble for the document
+#
 
 DATESTR=${DATESTR:-`cat REVISION-DATE 2>/dev/null`}
-if [ x"$DATESTR" = x ]; then
-    ISODATE=`git show --format=format:'%cd' --date=iso | head -n 1`
-    DATESTR=`date -d "$DATE" +'%d %B %Y'`
-fi
-
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
 
 VERSION=`echo "$1"| sed -e 's/virtio-v//' -e 's/-.*//'`
 
-#Prepend OASIS unless already there
+# If a second argument is passed we extract what we can from git
+# metadata (closest version tag) and local tree status. This
+# allows us to build an unofficial draft and tag it appropriately.
+#
+# The formal build process skips this.
+if ! test -z "$2"; then
+    # base date on now
+    DATESTR=$(date +'%d %B %Y')
+    COMMIT=$(git describe --tags --match 'v[0-9]*' HEAD 2>/dev/null)
+    # fallback if we have no version tags for reference
+    if test -z "$COMMIT"; then
+        COMMIT=$(git rev-parse --short HEAD)
+    fi
+    # Finally check if we have un-committed changes in the tree
+    if ! git diff-index --quiet HEAD -- ; then
+        COMMIT="$COMMIT (dirty)"
+    fi
+
+    STAGE=draft
+    STAGENAME="Unofficial Draft (git @ $COMMIT)"
+    WORKINGDRAFT=
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
+fi
+
+#Prepend OASIS unless already there or unofficial
 case "$STAGENAME" in
-	OASIS*)
+	OASIS*|Unofficial*)
 		OASISSTAGENAME="$STAGENAME"
 		;;
 	*)
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

