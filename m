Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722401;
	b=srsTHR52LSQoV0Bt3Rfw8O3VCm/FVxUW7adsdG2CO+r8hsuRM18CO6xzNpJeBJVYjxcw
	 8H1ax1vMcjq+PMhKiS+hFxom2fXGXa36bo/+i9rG9VVrStnFokEIfJYW7TyN1LGdo6HnK
	 U9JH5B48fy4+mGbPErzwi+uyOIX0e8ezdjO8EwyThvWPUObS+YGWglPrzHYQaZuthgIkB
	 lbLqrq7Vd9Un9/J04jlo8s3wFvw1RqH61Z6z2/GTixvGd0nr9ybmkfYCYFnPKkdJ6KER/
	 wCzrRB8Hc4grD/pXI3sT0WUbGnKoHrNARKM4EFJp9orvUYP8aL5xgQZNNDiGSnHDMWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=vZ4rlIZa+wY8M07zwYjDkeJAxpXtlHiPVcpyYF5JJsQ=;
	b=owhFTjANgG69uBJRUMLnKZhzXF/meKCDG4t/frbClp8bs/QOr/F54ZFQVi8HW/s9pEwa
	 a/TwgENvqa0U/Dli+dHFYJpXwlRemIRKu8qjn+5gLDsD04bWkVpXG3SfouKAPgZ7cj3bu
	 mWhX+ut32toFcQYBeWWY7NZOxlAKfD8cDv6lz+msBBCi1DN6pSiHZI4/X341ntLmdtjlL
	 dsVXvpG8bD8cX4bbGvynRg1tcko6qNk1MFBcepcZpY5KKZH3QFvxl4nRTjN98wREy9tRl
	 tS3o1/ufzvj5toghCB9b/4eumYK5q6oakq1RkcVTfIJ/dH1+THX6nMb+kqlP1XQmAYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f2V3MTjb;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597A4606A31E
	for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 19:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 597A4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f2V3MTjb
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so75756355e9.3
        for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 11:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795722400; x=1796327200; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vZ4rlIZa+wY8M07zwYjDkeJAxpXtlHiPVcpyYF5JJsQ=;
        b=f2V3MTjbGmWc3pah9aumk0ituPOjp+R3cND08E22UKBeOuzzKmgTQSAv9pvKsh6DxA
         h2SC77fz9qh3FhG3MY1gxjSB5cfa6reWJ7o+z2Qf9iJOqkeHjtQxfr0kHQODDT8CBW1H
         wZGTzvU2Q+vMN4xNOAAyWfdR7v5Ou9pdw8DXwnuNX81bRNhKbHOVp0FIgIXT7SxXYlKq
         oX/Xq7VvrdSv8tI5nsIw+g+XY88tk/NOYqU5gdaOhtBntfh0QxpqxUNW7AAaAHUZAW/b
         Xh3EYEwmALDaXq3W1giuL2zUCQ7BDPlmi9H805F9LHC0GInihelhTd2OeacNzJPBcnbZ
         PfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722400; x=1796327200;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZ4rlIZa+wY8M07zwYjDkeJAxpXtlHiPVcpyYF5JJsQ=;
        b=NmHG4pl5JwkOWbwxQdGFs+QP7EB0l6AKpq4wcx8pY8vP9b6MQG43rw81tEwzW7WEeE
         dM3otPJwDjeMo9tJWbIItcnqv8IVIXzinLH7eeE2qij/L2fa6/WNlrPo5g8duuseWdXH
         9fWhG0I579rNhaZvY07PhwtCUS+yiVSeOGt+500kriXAqq0WP4EQInIPCG8qDqAiFSN3
         MRH5g/z1StN2RnVR8AV+1OFcIw4wGE+Dm3yjLZYIaDkFhVIzWHLELYVOWdJHO6PUmkVh
         pTULXXyfyMMemUTb//0PuTIGs6EDW/Q5ReBTiqG+BiBFY9u+NuXu49iXDYmAxHJVloz/
         ow2Q==
X-Gm-Message-State: APuU4Z8KKFRNoDLWC/qNm1HHAywXeHEYi4O9Ud6CKIo7jfXeC6IPbUkh
	YEPZZRpEi4Foq3SC8BW6DmSUbZ3loG1AHmhuiZBTDxmhTSFzyjFXS6jJptUtRNriib5E+jA7X11
	Uweqp
X-Gm-Gg: AZFdTZdelJt/2TwI10ecPjw+YKH7ZO1zCZP1Zws6b8ETyMQkVkNklxtwumt2ukV81mz
	juG8imscoONEcNKhYB3/QTvz8wbdjM8mzkpMS6fHv4Utoa21jy+SiEnPF92FEodIacA7HJEXgxG
	UqZ/Avch7HqDsCPCWzrA+OOEnm+h+qYzp3uFxKWCgsraaT5q9x/iJgn91OKCgQ9ZJ5tCG0CBar6
	M1q1vTw5yN2s365eaSpNHoTgLZuFTOuZMGbsoT4rCzCr8B2i+EmQKn+03NjRztPEQ7m2ou0s3j/
	UIHQ4zoGM0oWKMovbkJbfEK65M5L1jr/DPwNvz24P8Zk/6dwsGah3eNTEEI4/C9u2oo9X/lUyFO
	paspl2DUuFHSulOG7AJvMwk7ZcsfOJ3jNmfgqTbsE5qLFz0IKrBZ4Y23UGJyssYhwhVrqQqP7Z+
	dRlApUHLfWasSNBi6xBjna+XrSN6LQ+gUKQYLfrEE5bc5wVZpLWKWsVoj3OYxSX19K/aYJ0emEb
	wOpswWCXdmEnVeX98kHezCy/tXFg6fDiM/cGMqSkfNbk7HYhL5Up/pvKIyMdqy88uls7ziXmQjE
	ELdhpfmxzyzJcGm+N+Z/MrUgvFHs
X-Received: by 2002:a05:600c:46d3:b0:4bb:6687:5394 with SMTP id 5b1f17b1804b1-4bb888097b0mr459225255e9.9.1795722399547;
        Thu, 26 Nov 2026 11:46:39 -0800 (PST)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm859042645e9.13.2026.11.26.11.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:46:37 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1D26D5FEDB;
	Thu, 26 Nov 2026 19:46:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 12/12] .github: add a runner to build the latest draft
Date: Thu, 26 Nov 2026 19:46:32 +0000
Message-ID: <20261126194632.2429425-13-alex.bennee@linaro.org>
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
v4
  - fix test workflow to also use v3
  - call make draft-html
  - use different asset uploader action
  - include ms core fonts
  - fetch-depth 0 to include tags in checkout
  - include zip and pdf, use glob matching
v5
  - configure safe.directory for container git calls
  - add contents: write permission for releases
  - bump action-gh-release to v3 for Node 24 support
  - update test workflow to build full draft and upload artifacts on PRs
---
 .github/workflows/deploy.yaml | 36 +++++++++++++++++++++++++++++++++++
 .github/workflows/test.yml    | 31 ++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 .github/workflows/deploy.yaml
 create mode 100644 .github/workflows/test.yml

diff --git a/.github/workflows/deploy.yaml b/.github/workflows/deploy.yaml
new file mode 100644
index 0000000..1fe5833
--- /dev/null
+++ b/.github/workflows/deploy.yaml
@@ -0,0 +1,36 @@
+name: Deploy current state
+
+on: [push]
+
+jobs:
+  build:
+    runs-on: ubuntu-latest
+    permissions:
+      contents: write
+    steps:
+      - uses: actions/checkout@v5
+        with:
+          fetch-depth: 0
+      - uses: xu-cheng/texlive-action@v3
+        with:
+          scheme: full
+          run: |
+            apk add make msttcorefonts-installer file fontconfig font-liberation zip git
+            git config --global --add safe.directory '*'
+            update-ms-fonts
+            fc-cache -f
+            make draft
+            echo ${{ github.sha }} > Release.txt
+
+      - name: Create Draft Release and Upload Asset
+        uses: softprops/action-gh-release@v3
+        env:
+          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
+        with:
+          tag_name: ${{github.ref_name}}-${{ github.repository_owner }}-draft-v${{ github.run_number }}
+          name: Draft ${{ github.run_number }}
+          prerelease: true
+          files: |
+            Release.txt
+            *.pdf
+            *.zip
diff --git a/.github/workflows/test.yml b/.github/workflows/test.yml
new file mode 100644
index 0000000..d8ee25d
--- /dev/null
+++ b/.github/workflows/test.yml
@@ -0,0 +1,31 @@
+name: CI
+
+on: [pull_request]
+
+jobs:
+  build:
+    runs-on: ubuntu-latest
+    steps:
+      - uses: actions/checkout@v5
+        with:
+          fetch-depth: 0
+      - uses: xu-cheng/texlive-action@v3
+        with:
+          scheme: full
+          run: |
+            apk add make msttcorefonts-installer file fontconfig font-liberation zip git
+            git config --global --add safe.directory '*'
+            update-ms-fonts
+            fc-cache -f
+            make draft
+            echo ${{ github.sha }} > Release.txt
+
+      - name: Upload Draft Artifacts
+        uses: actions/upload-artifact@v7
+        with:
+          name: virtio-draft-pr-${{ github.event.pull_request.number || github.sha }}
+          path: |
+            Release.txt
+            *.pdf
+            *.zip
+
-- 
2.47.3

