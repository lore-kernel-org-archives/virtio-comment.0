Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299FB2ECD20
	for <virtio-comment@lists.linux.dev>; Wed,  8 Oct 2025 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759935569; cv=none; b=FPeEhxvCZcNluoDCK60AWMZe8m+QNXv58bJSrq/o18Lbf7hEdIw6xAc6QizsKCVTlUi1+SIxKIbzN/zmeyLgGxzyUmzKAKcYJA9U5M9LqTC4EBFpOSXa2Cpmjp+FZ+25qLI6BZSc+C0a83wREUPWANBBd1cenaVNY1CQRnl/tqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759935569; c=relaxed/simple;
	bh=s7A1XBpsf8T38Hb4hCGSM6Au7Hgtk8e7Y7X5tYjC988=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iTkw7QGmu9fs8M84C8DjE+3TFPjFi54TfKuIl0+YUU7NTKtyEvTXBr6AcQtchahyhW44psm7TqLE8kLoUZIFQvMZvgwFnQDuBkfZFIu4QYUGHYmJA5htT8kAmNtwRvSY8nAmiZdCs3lks6fOAHokOGTHKT3oSaYX8rc7ienAc7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sBtfoVD/; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sBtfoVD/"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso20097f8f.0
        for <virtio-comment@lists.linux.dev>; Wed, 08 Oct 2025 07:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759935565; x=1760540365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEv9DqHbjOTlAqv+Nkv428TJzbOLuZLfAJSh3z8P+g4=;
        b=sBtfoVD/nBS9VigdUtCHwyht9GnYQNxYG2Z+HPZKcQrHaUgvC2DDgZzFXTKD3l83kU
         64MqDtHdnziTlIK0XMS70LIuVi0CYYen8rgkn13On4xdFDZkPwpt85lMcAtE49DReO0q
         1vWIVWBhJRbQyXJM0Vt91o5UxstDKQEIEKwgWohDlTbcUNLab9tdoK+TsVWnr0eNGf+r
         RAUV2HHA4SR83vT7M2j6gRm2y6yB7Qk5pg5QgL0/V4C3M5R42dwseH4fHJ+cMAWfZGNx
         SfmuwXA+IOYcYnixQDMsUOEQlz/B1mKZ9HsDtZwnT6OYHjpDFyHuD+J2fby8HTnnLavL
         /X0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759935565; x=1760540365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DEv9DqHbjOTlAqv+Nkv428TJzbOLuZLfAJSh3z8P+g4=;
        b=RCD3dcpRB2OxYXaFIXc4bAxdBfK7iPHMe3hxJPleQSO/Bt7Bsiy72VWsKlSH0XQjte
         kptDtwasd00noRQ23LRrVq6/M90eqboSbrmSMUwQk25cSGvrl/NDLMLBjhhoN5agHLTK
         f/DrzblQXln49lp8bSDq1WoDYkrONAqKtWoQMbGKH7ekQwxk9VonN7StP7vwUmuKebN+
         LVXYsTmS4pqNSfjm4yJHBS2e1hBUh+re0/AFCwRXY2Z67R23oLYU7QX5MzaaYU6c5WQW
         y2m0/1oRHKn6STbRKEuXUWsb4l58yQD1FSFdzg6KH6J8nhSl6prInLovU32DG7TCD94e
         UgEg==
X-Gm-Message-State: AOJu0YxNJDnJDzIV8Cvy+eKeoBpFrQrJi6hyqEllTqhZEeEYQnjII8ic
	RQqTmVd4H8VW76WGnVgIlOiD1j/GGv3JM/wyzD+af+Jyn2m/8uqITgKu9i1z7I2vdjg=
X-Gm-Gg: ASbGncvxoDXyVik3uodeVlrYCyHv/5cjPH4pZZkyy/HeKWTzRxfFUUiM63LLwLjiiwn
	ah81XUn3xwVGTnaQQ3qKV0QkRPyStZw1nARLwXLN9qaU7RY/UjTOWlv3xiBSL5fO/9pSZ05rsj2
	vR96uRkF8yNbk6Y5b6VKs5SqSG7WaTmrncQHLSX4guRKJLCBR7FXamVUSi6MR9a51RofwKV48Ao
	a6UMnflxbuTByNE42UUpAFRJGzTpFLwcTpQC4Mnh1p4G5k5CF1OxOpK7mlY6lGjYyRVOQu9+zV5
	NtJpeErw8TI+CMv8O0RdmW5Gv8s/NIZcndXyo3POeY7LEA5ZynkkqECWxYx073YFGb6rbjii7Y9
	eMxvKR9sIUjUU/gBa16hoQbzYFXS+XoNSCcrHMhmMjzIVYM5DDAA2XEUI0yycrg==
X-Google-Smtp-Source: AGHT+IE4+APS8JOmSetVPzgOcRNB1smEahCOTOiLeMGpD2RdkUvtRNZbtfodTBt2/u4evex+EnWfSg==
X-Received: by 2002:a5d:64e5:0:b0:425:7145:2df6 with SMTP id ffacd0b85a97d-42667177c6cmr2489436f8f.25.1759935565264;
        Wed, 08 Oct 2025 07:59:25 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab8fdsm29920510f8f.15.2025.10.08.07.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:59:22 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 80BC45FA6C;
	Wed, 08 Oct 2025 15:59:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 9/9] .github: add a runner to build the latest draft
Date: Wed,  8 Oct 2025 15:59:16 +0100
Message-ID: <20251008145916.2626143-10-alex.bennee@linaro.org>
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

This will run each time anything is pushed to the repository and store
the result in the release assets area of github. To see an example of
it in practice see the virtio-msg repo:

  https://github.com/Linaro/virtio-msg-spec/releases

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .github/workflows/deploy.yaml | 37 +++++++++++++++++++++++++++++++++++
 .github/workflows/test.yml    | 15 ++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 .github/workflows/deploy.yaml
 create mode 100644 .github/workflows/test.yml

diff --git a/.github/workflows/deploy.yaml b/.github/workflows/deploy.yaml
new file mode 100644
index 0000000..fec4910
--- /dev/null
+++ b/.github/workflows/deploy.yaml
@@ -0,0 +1,37 @@
+name: Deploy current state
+
+on: [push]
+
+jobs:
+  build:
+    runs-on: ubuntu-latest
+    steps:
+      - uses: actions/checkout@v4
+      - uses: xu-cheng/texlive-action@v2
+        with:
+          scheme: full
+          run: |
+            apk add file font-liberation make zip
+            make local-all
+            echo ${{ github.sha }} > Release.txt
+
+      - name: Create Draft Release
+        id: create_release
+        uses: actions/create-release@v1
+        env:
+          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
+        with:
+          tag_name: ${{github.ref_name}}-${{ github.repository_owner }}-draft-v${{ github.run_number }}
+          release_name: Draft ${{ github.run_number }}
+          draft: false
+          prerelease: false
+
+      - name: Upload Release Asset
+        uses: actions/upload-release-asset@v1
+        env:
+          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
+        with:
+          upload_url: ${{ steps.create_release.outputs.upload_url }}
+          asset_path: virtio-v1.4-wd01.pdf
+          asset_name: ${{github.ref_name}}-${{ github.repository_owner }}-draft-v${{ github.run_number }}.pdf
+          asset_content_type: application/pdf
diff --git a/.github/workflows/test.yml b/.github/workflows/test.yml
new file mode 100644
index 0000000..34f4f44
--- /dev/null
+++ b/.github/workflows/test.yml
@@ -0,0 +1,15 @@
+name: CI
+
+on: [pull_request]
+
+jobs:
+  build:
+    runs-on: ubuntu-latest
+    steps:
+      - uses: actions/checkout@v4
+      - uses: xu-cheng/texlive-action@v2
+        with:
+          scheme: full
+          run: |
+            apk add file make zip
+            make local-html
-- 
2.47.3

