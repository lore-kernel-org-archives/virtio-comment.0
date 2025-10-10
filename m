Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0CF262FFC
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 11:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095226; cv=none; b=FH0AJ4MSd2vxq8wucwhw3HyT64Xizf8Ts8cRrYV/C4wtlBDWaRsuYQznj+ZS5PFyTxDJRejlx63rvagvD7qmjhOjd29Xb29Riedni+6g12tils8Xh36/RBXBcO/2DRoM8RsCR2f/cyfwIWFjzwOOu4VGR/1DyGP94vuYq6GDOak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095226; c=relaxed/simple;
	bh=Z22/egE7vhpizM24+migJgZ84vYknBfxYMQNvJ1QmXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ETdAoeipgmRySFtOSMJg8P2CLwhpZmbKI6+nSPevrQDaEQuvOLmiM4DpxE2+VbF9qpdNBIhN14Z++1ECU09z7M727mrq4wx0rLVRTF8oH0+GRebib24HpFvLQChKCOKocSUNBfDpYWqKHx+jy0j48nuBLQpqBlPWHVrnGMdXsEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c8ZWu84F; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c8ZWu84F"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-62ec5f750f7so3411077a12.3
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 04:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760095223; x=1760700023; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YX9/VIxoudWTI9mASzugueW+/aF3bZZobOp0tua+GHE=;
        b=c8ZWu84FAgLdjzKeiiH6330hNTFOeDDXhzvXP8iiupdBvSbHWZUC1PlCnhXq3LXaTr
         ZrLzJW7LMSdVlXovDEfm6kN6s7cOY+zYhdZzKyAAkV/fGIz7u5obN3gwYUZnhhUKjkHd
         G1tQadBMeajjQaEodaCn8/MBV3NH0RbEpKppZufbtWPx5Z5yNUs4calc6E1NF6Gbech0
         NW4fbjsxBCnpWTmMNMo/Sa9j3kBINaenpL+tHacuG3AbDDVaTN7vAONUH8Zxl9c++kfK
         IILnvI/68PWXe7CleUk8Mk69wbL9tMEy3iEDi4upNwvGP+kkz5E7AG/T1J9clicXVmSV
         wlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760095223; x=1760700023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YX9/VIxoudWTI9mASzugueW+/aF3bZZobOp0tua+GHE=;
        b=N/iXfajI5ZHlwme4SwMHNGprqpYbfr0DXbl+afUc7cHn1yENrHqFppFM0KayylD66v
         1sVU87xr3BB27pZFRb/LsLmEKaAQBw53oQez+txgcgpE83o+mUnUAya+5OnVIlSMOKnb
         eGMviditzEXoIqi0HawCH3NtK2yPELybEr5zQzcgXGyta+9fT0E5E4d65R8OXDhgbM6E
         6UB3E9SPvcjZaSOVH6A5TggRS93SgJ56fRBRnTu/LyAyNfxMd537Qg5wImHajbUqM7EG
         lpVnNUjqHBj7ePm8IWyhZPGikbcCRaarm6RQab35GnGpWXqj4g6EqgPBhvS5gh2bvwHX
         8lhQ==
X-Gm-Message-State: AOJu0YyX3rtUpfwEcnNg4NJGWcBKzfxwjXm9r7+ZdVeUoTXNvIO1alRd
	t12GYFhfhOuKGPzJRNS0aV5BnRa4lfes6ehwgshTcQIeQm/NS9zG0WjgKyfXPT+ifv2nn/Wsza9
	/04sr
X-Gm-Gg: ASbGncvBypiZoqbJuT1x4PhEIlt9f9+M6lqeqiIF4H2023diMULXFhlva5EWeZ66m6s
	Wjbv9PcbXkEjW920RBlZv5O0q6yyO11EiW+aTUiOACMQXb5RDrWcP1jGq+6F6mMjsX1k25MaT7O
	ymDE4lT+YhzGEnB4DrsSeBrvDxSbM+kzdpXyWmiUxMa/GRK/zD2GrpogOM/JrV5FznFsOfJM9sE
	fv4XKXMSILhr3FbFgQ1CdeHaB0PeUg7bOYm6KKUaee302IuLmMa55gC6+OioMY0BukoqQ4PFDAr
	UOLHW0J1aCbmhtUq+7s2E+849QcERG+n1x4bDPcQQKCQ4oU7xjbzWKtW9Cby99i4sE/8ytLxqME
	eP40fZBX0Nu3eNBUPYoY4hPfhcH3UxB1rOYUV7Bw+aJ5Sdo9Gc/cCFoH8
X-Google-Smtp-Source: AGHT+IE/JbisTwgBWaXmTOO3puQ/lN77t5IiIBsqTyHJP94X4W8Jupq9UOb5yYNywkO6piGWus7fpQ==
X-Received: by 2002:a05:6402:1ed0:b0:639:e469:8ad1 with SMTP id 4fb4d7f45d1cf-639e469a2e6mr8210926a12.20.1760095222693;
        Fri, 10 Oct 2025 04:20:22 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b71438sm2080561a12.25.2025.10.10.04.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:20:15 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1B5725FAA7;
	Fri, 10 Oct 2025 12:20:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 10/10] .github: add a runner to build the latest draft
Date: Fri, 10 Oct 2025 12:20:10 +0100
Message-ID: <20251010112010.3880438-11-alex.bennee@linaro.org>
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

This will run each time anything is pushed to the repository and store
the result in the release assets area of github. To see an example of
it in practice see the virtio-msg repo:

  https://github.com/Linaro/virtio-msg-spec/releases

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-ID: <20251008145916.2626143-10-alex.bennee@linaro.org>
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

