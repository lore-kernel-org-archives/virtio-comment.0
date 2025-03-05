Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BD3151992
	for <virtio-comment@lists.linux.dev>; Wed,  5 Mar 2025 16:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741193168; cv=none; b=fBN8q1+QTtLdZQvoog1aVJwKVg1aWG+AR3Sn2dnaYNU/mLtf6jpr+rwumvpGk/6k8BEdp9l4w0/A7Z5eI8N0bFjvQTyGwEDsUS9YdXUjfgRRywbCiAIgS54bXhSlXdoh7eZB8HjWlDez4IQFpzCRvy5w1h1HcRLVoM3ag5XKNf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741193168; c=relaxed/simple;
	bh=xtpGQauGwmQDmED1Tgmh8WVvzu/3xN4Z7HQhp4FH3Ek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=jlZB2gN3sEFdtdqfKVlRCj/3a4rHfjpBFgCD6UeiSKVUtNXVEUha8sSBOXgEJtwN42lyvLhZ35B6WbNf54kKh0D/ucP8wm47z0JPLjuryy3GZAktwmrQZFDHOYtvMqFoomE9rdCphkJQ3bqpa22s/TbYOFQenzNagnwn+y0pqhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RcRehls4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RcRehls4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741193165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KJUXurR4XII75JmX5SlxikQsUrJauTjGmARIEetjlx4=;
	b=RcRehls4vECvQx83YE53c11a07/udkCmmDiantU3rAIWQVcDsGxdBLYhc53Di2PL+V4/4i
	9bcJUrw6gcd9ROuuZP97zw41wR9Uo8F4xNeqYA6Uxro+yPDAnSkHd3qZYzG7t7dH2rRADg
	LLVzXvylGMM3KUmMACX/A2puIzR+v7Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-FzeoDl-yMYmBNPsC_eaBPw-1; Wed, 05 Mar 2025 11:45:49 -0500
X-MC-Unique: FzeoDl-yMYmBNPsC_eaBPw-1
X-Mimecast-MFC-AGG-ID: FzeoDl-yMYmBNPsC_eaBPw_1741193148
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so32974635e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 05 Mar 2025 08:45:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741193148; x=1741797948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJUXurR4XII75JmX5SlxikQsUrJauTjGmARIEetjlx4=;
        b=YBb2FTtUOzQmHP4t5tePMFn19fyNUDhq0sxyChCUSsqeNHUj7HgdzWE2589gHL/PmA
         4m0gG3rYqD2wUnGMtOqMzRe4ej33q0ZYo4vAIG1uKAsR6UyLLV2a1o8mUdkWrmqCA1hO
         yw90mrPrnlEmeca4LtSvT4Jm/SDiDnn7gx8MAiFwbygzhv/vI6w7WSP1BFoCEBr7em6b
         ZCNDGZb4/CdL33WSEao1cMpq2geUQ24IazMksy+uHaVPGPZYm4R0OmHBO6Em0r8nwTFu
         aiUOt1aGnjIyaxT/1dAadt95J1/HCu2fsh4UbVi/xSywQcFAB817bM1jjVLVka+zlEjl
         jFKA==
X-Gm-Message-State: AOJu0YzSuvVFevdDoE65WQK9rSaar3RFoNWUaqCBkWdLrfqMrBh5M/Sd
	XtAhJxWmStFnuYBwUclul98Kh/xOPbrfloyBUzVMxwxoLPVtLOBkxG81ksLyHv5pCriJG/iofYT
	ec+s/GBFHIAC+KEyYrSLBdW+iZzlnV/UbMFMRfT4KVn2RfwMP0GBZhUDea6TJKn38dSVR2gNNUu
	VnAnouICSoSK+p35npN8kB79BWyEDqU+Psb+DjIYAFcZRhxANy
X-Gm-Gg: ASbGncsIRa2Q+O/Q1yuIyEx5iJc4I1r8nE2tV0Q4cjvdw8XrfUal5OLy7S0KxxVbI2M
	ajLYTjnVI3E/PMVMSfmLE4WIGUI5Lnol4jb9kSNgTPctqV2k/wXGk/tQy61WOZwUrrsTlLUeqgQ
	tcr2cIMIij6Xb6WfkidEvxh/kx+9lsDpCLGTbmZ54dkJ47f5qibort11w7W8hzJHw2DrsAl+AUA
	Zi0F/EDjJzFBCuDVAFoGPrcM1xGhxKNGVZ5fgiQnLnbPoB0RQ2liC14issPr29Hd48vX+C2UTzM
	M58i6nvHzbIF+W9VdSc=
X-Received: by 2002:a5d:64ae:0:b0:391:10c5:d1c6 with SMTP id ffacd0b85a97d-3911f72ff44mr3597518f8f.2.1741193147671;
        Wed, 05 Mar 2025 08:45:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHN7R8Mg9vPVbg6eiECOCg62WpEi9kgS8ikZJsQ9O4GkKQwHppc2dSuXtod9wlU5oGtMPEqrg==
X-Received: by 2002:a5d:64ae:0:b0:391:10c5:d1c6 with SMTP id ffacd0b85a97d-3911f72ff44mr3597488f8f.2.1741193147317;
        Wed, 05 Mar 2025 08:45:47 -0800 (PST)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795da5sm21890347f8f.15.2025.03.05.08.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 08:45:47 -0800 (PST)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: aesteve@redhat.com,
	sgarzare@redhat.com,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH v3] git-publish: add profile
Date: Wed,  5 Mar 2025 17:45:46 +0100
Message-ID: <20250305164546.1484029-1-mvaralar@redhat.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2zAJ2A0OYLlyWbe-ECQ3Xhn-9D0UJ6OdXx2ccn1lTLA_1741193148
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add git-publish profile and document how to use it.

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
v2 -> v3:
   * remove uppercase and the line split and use italic 
v1 -> v2:
   * add link to git-publish
   * document that the project contains a profile already
---
 .gitpublish |  3 +++
 README.md   | 15 +++++++++++++++
 2 files changed, 18 insertions(+)
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
index c06caf6..b521978 100644
--- a/README.md
+++ b/README.md
@@ -110,6 +110,21 @@ git format-patch -o proposal1/ HEAD~1..<br>
 git send-email --to=virtio-comment@lists.linux.dev proposal1/0001-*
 </code>
 
+<dl>Optionally, you can use <a
+href="https://github.com/stefanha/git-publish">git-publish</a> to submit a
+patch. This project already contains a <em>git-publish</em> profile that will
+configure some fields, e.g., <em>To</em> field with the right address. After you have
+installed <em>git-publish</em>, the procedure is the following:
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

