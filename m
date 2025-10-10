Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C55E25FA2C
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 16:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760113753; cv=none; b=Pe+UAG6HdVmKGwDkc7SWMf3KZbzvSKjjDjPVA5qELOB8/oxT7vCQmiSCHhdFlz37u3yxB1OgVtNHSU1PEa9wx3aD9G8vxFzSocSF+cPHvDK3hNMNMj684ZrgBX+sKwVHnf2RIrolwCvrnbg0mHT9b9ApSKsga62Et8T4KCEDRj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760113753; c=relaxed/simple;
	bh=PqTPLG+HYJ5iKJgJqtxqjHya3YU6k1wj4Zx7uVy9bZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=or6aK+A4n5MbMDPp8mzmytlQtqmxDw+sipDGHCFd0gZcQBGBvUBePBTcbRyliWa/lK5d1OBXUCv61vnmPk3j/SUay30IqHgQ0ZFbIoa1O12GWr/wd2YdVo8Oq+5a88/9mNbvjjm83I+uVK8UzNG701DryWiOuV/RmBu4ZyQAUuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wpaNYhaP; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wpaNYhaP"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3e9d633b78so365443366b.1
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 09:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760113750; x=1760718550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LwXt0de5A/D96XFrd4PK0WrYoAMLMVeFz818rnvFGA=;
        b=wpaNYhaPyGt6v30jtBmyXKhXtgZA5E5+FcaZVR6wJVSou6liLYcTeSvxQdGjPt/4sL
         Dl/wEuFhnpAkz9ieVfW8H2ZVdq4O36W2aMbJ/8BIYJe4pDnBHazBEhj1xbS5h9aVTNNP
         8FHth52Re1vrmVDTkclDIrqCd97ZFpEeAr8+FTJE3DmFr8lbOYwsIjBXJXbWtRJRfIFL
         aq2No0N1o99sWqOGB6LpsJ8KJTmJrraIekyUnmLIN4GG9O0HR0am3r0f0MvQhNqS0Osm
         o6x3mcBTCWZtB4Bl5GZUEeih1uVsoiwSl95B0x10vRiSl0CaMSpvkgqo9URBxk2MtDOq
         Z4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760113750; x=1760718550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LwXt0de5A/D96XFrd4PK0WrYoAMLMVeFz818rnvFGA=;
        b=Pbc7qlPu6/S/BRh2CXkZvD8TgB/UJnZmMLlDFMS2QvLW5lEpKIK9ZRvlN7YvLMbc9m
         wwFpxVfnhAs8+DnepounD67PLE81tTYBq1awP3ZLIYMLOuLaRvWp5T+QkDOQSRROWlwP
         kmFtl8KBlcEZ9o0A1YV1YkvDn56BvHutQRsR1GrH3Dy/RjHVrm81vINMT/KNKhlQ3nFI
         z6nU+Mqsq92qid0KfazQmBdB+wkn8IXwKWYuRH9aUY+YqWvWVG2Jti2aNVOdbaGGovm+
         h/bInkIeY8TS1xXKcnOtzqKEwi4pJIc3xFs2DA26vj6M+SjKwDhjoHbjN4yc5p83JDsV
         FFOQ==
X-Gm-Message-State: AOJu0YzizJbNeqFLgvT9jVuvG09OiE5u4y5eSE83zEJ5ygQoTBFkPkUr
	62FkTkF7j0j7W+ghzjJJ67qsqtL2lX6SVUkI4JkmpPUbk1s1j+HBJc1EuBUD6G5kBqsrdR9+cfO
	U+twT
X-Gm-Gg: ASbGncv/pobtIEr/ea/78ws+kFkRwFAHMqrRfEDeQUKl4skBrlbBiFMW+Q9WoWqMKVe
	ZDYtBhNF37EGettHA3HsV+AQi1arMuCLwik0VbpizseoH7d7sFQhgyGQGoms1TBknqbbtKfibkH
	FjlCojHAKQ7f/v8nGhLJWPa4O0a7HfjLTtN8q6HAN8wo9KEdCxaBFTln0ZF3B/Yn5GS0i4glrJW
	1ZhfELz+/19npTdZ/gwrVb1mQbw3/glpX6Pe/8O/1ALxD8+ASX5kzKxBCzE7ua09B37r9zfb3c5
	DekiHel6FcMNYHRBr/PUnJVLnhR6Lk61RGB9P161N4hZnrn0CtoJ/OHtEKU5a7gF+2La4w1KAyt
	XF2PoypY3Vp4Bhh3HY8i1IUAeoy829989eRQY/3FeFu3inuLGi5EkHnA6
X-Google-Smtp-Source: AGHT+IGikhAHeJ3rTNhQF5Z5chuyFnLKkAAaqGqLpIzN9mlEs0YoVskqeXgDESamGPceXeqH+63qSQ==
X-Received: by 2002:a17:906:36d5:b0:b4f:644c:8873 with SMTP id a640c23a62f3a-b4f644caaabmr1516165966b.2.1760113749738;
        Fri, 10 Oct 2025 09:29:09 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c12a8esm266440466b.42.2025.10.10.09.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 09:29:03 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 075735FAAE;
	Fri, 10 Oct 2025 17:28:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 11/11] .github: add a runner to build the latest draft
Date: Fri, 10 Oct 2025 17:28:58 +0100
Message-ID: <20251010162858.4107388-12-alex.bennee@linaro.org>
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

This will run each time anything is pushed to the repository and store
the result in the release assets area of github. To see an example of
from this working branch see:

  https://github.com/stsquad/virtio-spec/releases

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - amend runner to use "make draft"
  - point at my repo examples
  - update to latest texlive action v3
---
 .github/workflows/deploy.yaml | 37 +++++++++++++++++++++++++++++++++++
 .github/workflows/test.yml    | 15 ++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 .github/workflows/deploy.yaml
 create mode 100644 .github/workflows/test.yml

diff --git a/.github/workflows/deploy.yaml b/.github/workflows/deploy.yaml
new file mode 100644
index 0000000..30619ac
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
+      - uses: xu-cheng/texlive-action@v3
+        with:
+          scheme: full
+          run: |
+            apk add file font-liberation make zip
+            make draft
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

