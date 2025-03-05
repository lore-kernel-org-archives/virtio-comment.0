Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D753E214805
	for <virtio-comment@lists.linux.dev>; Wed,  5 Mar 2025 10:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741172279; cv=none; b=TzeQ7tPRLxq+5qR/duwEY2v0uFOSuV5/8oNQdsltIrq5PVbxQMhzg6MsWFbuAo0L++cBymCR899rJHcFEqWwRliHMu6tWkdQ0itSlH8hh7KpigUaEHZj3hf6QXNg1eS6tPKUbLqWZUonAZlHjRGE0w1FBCGxVHG2eEGRmrdy5GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741172279; c=relaxed/simple;
	bh=PC/iRVbCCoiy/lgj9yD6PK8AmDaF7GLpbHxBfsqP8CE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=I8TKmmMsQLSO06CFPChLxrfOLj8Y6y8RPcWb5HP0R2rIZB8VGk/JwuTPT5cxeMzGCklJrO1DqjckPuY0RbelyP9eXyNxObcl4XSffUaWUcrQgKgzM+Y9qcclB/TiaCjXJ4EqAGDLn862ZtiV/PD4ZXWGCUtk8g6TOBmnsXAFDA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bNiY1K1a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bNiY1K1a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741172275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TDPQXfCuFE9lDoyrQQDbzAaRZ7dyNtbteQmNGFuk4Nc=;
	b=bNiY1K1aNJBW8T5Em0i1n/qIM8h1tAKFMjdEBg5vv0j4sKkv5PnblkhKU/Zqbc87r24aZq
	GcG5WLlcZR1s83MoUkKuOsIpgqxzc9XxT9QiD0Vo3xFyJCs+QPGOXtoy6QkHRAAiGQEPH0
	iWQDcQVDd59PoHNsiOXKfrZAyxgKr80=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-mTVtvOR_Pl-pAZps1xSNKA-1; Wed, 05 Mar 2025 05:57:54 -0500
X-MC-Unique: mTVtvOR_Pl-pAZps1xSNKA-1
X-Mimecast-MFC-AGG-ID: mTVtvOR_Pl-pAZps1xSNKA_1741172273
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43bcde3f887so11002505e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 05 Mar 2025 02:57:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741172272; x=1741777072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TDPQXfCuFE9lDoyrQQDbzAaRZ7dyNtbteQmNGFuk4Nc=;
        b=QL9qA3jvS/+d9C2CTmTfWQyZe7Wj0B/eLxMY/IPYRqqWzDUtpv6A9d7DU511BeQUmS
         6XiCEhOATGoPLqaYJ41iYwsJ35qYgM7QJv1TGwq8TtK0jWI7ku9Tk4kj3ysotu6qgVJe
         nKvdFi8Mrf1D+hkWS0aexT04ayqTga1C7UNqd4DSb+88v62UuoMWBxdMxr++p04W4O3p
         YJ4BxB6en0Uir8e4y4yXtlFW3O1Z21CRqkLavaCSVIdytRH5k4hYyJJ1z0y+x9MvDd62
         HD6lcgni3pApeyerxxMZpxW93u0tO7QMtnURJ0SB8TSF9ZoYSskiT+Z7O3WEoTSUyBp5
         mVJw==
X-Gm-Message-State: AOJu0YwLyAX7zhcjkn+IkTalG+6ztUNm16aZeO5MUBLJ6k167ajHL0pK
	bR4PFnSjW1kxK4+bdd9HgGVWcxJ4Lbfi10hkkQd5igxKL/k1lSALEFOThMRYdHEDii26kxfcc5M
	oDZQ9c1CeTBmOBHnwyvoam8K9TL3299Ew5l2palx9DdN1KZS5rkEOVNou7U4oiY0Ku6jPE2gEca
	BP9t+5uaizf6C3pSpaZJwO8537waaryffLJpYBhkpDJBF2RaG3
X-Gm-Gg: ASbGncuFYLeFIzE/0/pQAoMOkGZWdjRiehEwyKMyn/QBDrV2s8tkgewrHbtDe75YP0Y
	gLQr8IrJXYH9T+IZqZa1GVejp9bVj4ZqW6Gk2WYkjuKGRyllF+u7qUTGYfNDpF0vibzLbN49C16
	PIRgE+R9DBBsqhh7qWs3T8tKM3qmQHLZo5kmU8nQ6FXQLnznMsgGhN/ZGH2wJk8YUoAc3WwNQLU
	5PMQlYVRVaLsV8CKE0GxWplpg1g6s4jB4qNJNFoU3eKFpdo/96expoDsSglRrUfsFexbrNCPJCY
	AVvpxJJR8RFsG2q4sVY=
X-Received: by 2002:a05:600c:4f15:b0:439:8bc3:a697 with SMTP id 5b1f17b1804b1-43bd294bc2dmr18334995e9.4.1741172272642;
        Wed, 05 Mar 2025 02:57:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6hQvn5rAV9l8/XVrmJmGKvEWCeG4SAeAKvPQ6cGxkBb+lH45TLjlnNMTRiRReN3BpXiaZiw==
X-Received: by 2002:a05:600c:4f15:b0:439:8bc3:a697 with SMTP id 5b1f17b1804b1-43bd294bc2dmr18334765e9.4.1741172272237;
        Wed, 05 Mar 2025 02:57:52 -0800 (PST)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd42c5cd9sm13971745e9.20.2025.03.05.02.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:57:51 -0800 (PST)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: aesteve@redhat.com,
	sgarzare@redhat.com,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH v2] git-publish: add profile
Date: Wed,  5 Mar 2025 11:57:51 +0100
Message-ID: <20250305105751.1472050-1-mvaralar@redhat.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dRRM64ApGEmIfJLkXWoT3gUdfW4Zj7dFUAyoAJG-MME_1741172273
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add git-publish profile and document how to use it.

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
v1 -> v2: 
   * add link to git-publish
   * document that the project contain a profile already
---
 .gitpublish |  3 +++
 README.md   | 13 +++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 .gitpublish

diff --git a/.gitpublish b/.gitpublish
new file mode 100644
index 0000000..d412896
--- /dev/null
+++ b/.gitpublish
@@ -0,0 +1,3 @@
+[gitpublishprofile "default"]
+base = master
+to = virtio-comment@lists.linux.dev
diff --git a/README.md b/README.md
index c06caf6..3df3fb2 100644
--- a/README.md
+++ b/README.md
@@ -110,6 +110,19 @@ git format-patch -o proposal1/ HEAD~1..<br>
 git send-email --to=virtio-comment@lists.linux.dev proposal1/0001-*
 </code>
 
+<dl>Optionally, you can use
+<A
+HREF="https://github.com/stefanha/git-publish">git-publish</A> to submit a patch. This project already contains a git-publish's profile that will configure some fields, i.e., To field with the right address. After you have installed git-publish, the procedure is the following:
+
+<code>
+<p>
+git checkout master -b my-feature<br>
+# work on new commits, add your 'Signed-off-by' lines to each<br>
+git publish<br>
+# more work, rebase on master, ...<br>
+git publish # will send a v2<br>
+</code>
+</dl>
 <dl>
 <dt>When to use the virtio-comment mailing list:</dt>
 <dd>
-- 
2.42.0

