Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D558B199FBA
	for <virtio-comment@lists.linux.dev>; Tue, 11 Mar 2025 21:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741728043; cv=none; b=iGepPe+rJdyq80Ua4kw3LbKQjwHuk1FwejErs/PgZW9FDrVKaMaus4mef4u1f7/XPxEhEVwfSO3AGtiZS2D7gu1sQo+xwdyV0PEKuQzRS1PQevkpoAevFEY4S/14z9AN9BNAdqY8+McHu/MZDYOFUqjBD2M03eGnoZzeKskLB8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741728043; c=relaxed/simple;
	bh=odoAUUcdRVWG3rBBw8TbD8ojLHaLcPkMTcRHVpzcnzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=SC8jqxYOocPQB7fFyxRS2eyHOZoQP8qN/nlxDVVtgCgLre3EloLnOEkT+caC8mR1pY7B9fYASyuHozBzx337hFPa8fFiV8yxJqmV99rhWMd+FjNVCIOV2AK5fGhWzRTGNhOLUlfFcKloxzDMhKUkFBh9693AZPMj2uhGkT78L00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vf02Tgln; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vf02Tgln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741728039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d0+prwGsDDOqOMgguGtwh5r72MmgVN5OQwDcba7j6t0=;
	b=Vf02TglnS+Hkl9pBsF8b+qAlLhbpDaGO7/sxRhF4LtQGMukJb/sCBY0H3iUPwb/xKLxhVP
	ccsuZE33FMnfF40bGAPZwEaDrHqb3UcVjCa72o6NTwkP2Z7cw6RQT52xZMFT87piOg/Ni9
	Tt5t6Wf9Aia7ByEJdCA1h2h1x6NLuNk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-vSah3KglOIuRczUA5saUvg-1; Tue, 11 Mar 2025 17:20:38 -0400
X-MC-Unique: vSah3KglOIuRczUA5saUvg-1
X-Mimecast-MFC-AGG-ID: vSah3KglOIuRczUA5saUvg_1741728038
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39149cbc77dso1925611f8f.3
        for <virtio-comment@lists.linux.dev>; Tue, 11 Mar 2025 14:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741728037; x=1742332837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0+prwGsDDOqOMgguGtwh5r72MmgVN5OQwDcba7j6t0=;
        b=KPZIVaFhK78RyZ2LJwvqeH/tC8JZf5kpe2QLIivJoXupIWA+A6pUpYgcRcefrfN2wL
         VZ7T+FQQ19mARx3WkBybzdJ3T51Nt1AD2vGRYUJlA8exVEWx+NETLsueeyo2hkhNq2Kl
         Vqz5csfYPkfu/Plm9MSdUnWgArw+Oa09o2stgTfZuaqJp4j4Pb+iZN0iKkv9an+wGTZr
         Weou2YprOLbv0kYHE5s313bFN25gGg8l1upYPdq4LaAihT3Gz0p50oZru71oxh/nLMAZ
         mbNETkh31HdS3vaM9DcS9KnOK3g7c6AsAsL9QM0sMuaLzjSj3Z3/uZ/RGDD0GBSuUs63
         +4pw==
X-Gm-Message-State: AOJu0YxNt6H75wge1bbuS9HVM+nq3jiAU0b56eaDoMHkjFQL6wen0eYg
	+kw1V97dm9GGT97qoHZ3kf4dTD+wmqEJ3ElaCo0TFHRS7jvNAeusXkPq3mUSn1PqMjiEoOD18te
	4Xi/NSbnBmJV5KcTesv1SlWVUwmqEIU4X2lIPTz94wjRqbh5fQtE7xkG3UugiTOOZziOHGUutq+
	XrYHA3ukrpAHbBJGrqOSOyAQ9CW9nxs4Hiepzsjgz5CCjGY4x8
X-Gm-Gg: ASbGncv3gC+0ZCjGxrbYAV3oq/4JcrbXWAG+Oi99btIjYsdGJs3hS+B/sAQjColFoyv
	pmJm7TbgdnaEQL54IQXVM5SGC5G4XJCqPzVnEYxbz/XWgSCMO9jkHDRMgq+fF3ckUNh+cHjI2Zf
	CX1lpDV7RoDIvCuLnp298/9e/97h54mlq9j+owpscbEMK8tGNClgqmXF742YWbH8wupuOdA+HMX
	gPSufxJGbAk+0X+daE8CXvL/Z1QQimzkTr3iRW5bqi1CE4ofFL2ynb3GrroADBYCCjBG1tnpWLV
	LGO4IsTkn6PYL7OI+Vg=
X-Received: by 2002:a05:6000:1849:b0:391:158f:3d59 with SMTP id ffacd0b85a97d-39132d21141mr19860540f8f.15.1741728036827;
        Tue, 11 Mar 2025 14:20:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5Y5Wi0s7al49cPyJZ9uKSbskkWSnm9o3ybwmpk1e/vwpkYW+13jHDDQRJvr8YYD8OKE12fg==
X-Received: by 2002:a05:6000:1849:b0:391:158f:3d59 with SMTP id ffacd0b85a97d-39132d21141mr19860523f8f.15.1741728036430;
        Tue, 11 Mar 2025 14:20:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e2bacsm19130634f8f.78.2025.03.11.14.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 14:20:35 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: cohuck@redhat.com,
	parav@nvidia.com,
	mst@redhat.com,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH v4] README.md: add example email for TC vote request
Date: Tue, 11 Mar 2025 22:20:30 +0100
Message-ID: <20250311212030.1745812-1-mvaralar@redhat.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ykYRRdPFqOfTD3t8XuybpwIaPYafK439W7IpcWuQUrI_1741728038
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
v3 -> v4: add "[]"
v2 -> v3: use "()"
v1 -> v2: add Subject and To
---
 README.md | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/README.md b/README.md
index c06caf6..f4b32ab 100644
--- a/README.md
+++ b/README.md
@@ -206,7 +206,16 @@ The mail requesting the vote should include the following, on a line by itself:<
 <code>
 Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
 </code>
-(NNN is the issue number)</li>
+(NNN is the issue number)<br>
+For example, you can use the following template when requesting the TC vote:<br>
+<code>
+Subject: [PATCH] (description of changes)<br>
+To: virtio-comment@lists.linux.dev<br>
+
+Could please open a voting ballot for these changes?
+
+Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
+</code></li>
 <li>Please make sure to allow time for review between posting a comment
 and asking for a vote. </li>
 </ol>

base-commit: 124fcd0e97f209aab19639e7369116d99ede22a2
-- 
2.42.0

