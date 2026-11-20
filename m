Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202934;
	b=Rd3MY6tAn97iwjJA+jUMO6IuqFg+EPEbWFKiH1SNeYf934tUx4I52zPnimTfxOHk3KgM
	 s+V5lnI2LURsJ+WdSPV1BQwBP5//0RWeISp4hn/LJbcG6Bs6uVzfV/nUXGnveF2ObiwvU
	 9F2ooA88ZixRzr5RQ5XWH7N2X9kSXVF+BuRxI4zT4Wzxf5bU4xK5M2OmNMGCxSUpphe26
	 qoKTCWaNgKVV/m44ai9h4/+iX2VieeaMfPNrRjQJA9FseEAy+BJA2zXGJWERWrHyBhXJq
	 FTZ0vzj3uR6/KiB5hnVOcl8rPf/TyVaos1a+vV+1PeLHG6TcyNDoFURIwS1lTbJJ9DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=jB1K2/lgjP2EHgUQkQzV8Cd1pmFj89yXadaFTpFahhk=;
	b=hFfRulh0vQjsq7wXr++2gJTwJExUYVopcVEPyn5XolrNpgDQ8jPKeCOf2JLlqjDxOT4k
	 Y7nLCxz6KnY+xnwigeOxcZhEyYInSbPY/mSsaZtkMoh2h2wfHa4+0uBmgn7KNQ9fHhY01
	 uHu59SX29uXxBtiCu7fWT6DlYFuIM9naKWAjpg9DGlOQ+kRXKee8jex/Dr2KS+ayp29RR
	 EJc5pacaDoR4Zqs/71o+03seJvGgoWIteCRlbh6rgox8lAmEe0V4jryMdxdGG/FWjAxdV
	 oAOK+w4buVPBN2MJZjW//JmxwkGJs2OnxjOEM5t762F5aJ1/cqXMMu1jSZZihmTkb9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--keiichiw.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ShmPr0Qt;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC311606A6E0
	for <virtio-comment@lists.linux.dev>; Fri, 20 Nov 2026 19:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC311606A6E0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--keiichiw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ShmPr0Qt
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-83edc5c5ae9so1285060a34.1
        for <virtio-comment@lists.linux.dev>; Fri, 20 Nov 2026 11:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202931; x=1795807731; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jB1K2/lgjP2EHgUQkQzV8Cd1pmFj89yXadaFTpFahhk=;
        b=ShmPr0QtNqcB9Ii+pW/9JsWMS6HwUW1dv5tlfcR97fEJUvlcVwEtcg1nbArd8mj7r1
         cXRSrvEeBrXlu6HgF1vW+yp7pSHww0ffqmqw/0BQsjBCSCV4l2A3RY27NM/ji6chWZKo
         C+TZ6AgQK99Gxdi+KdOiOeXrrOpk1swHFCQF2wfXXtAmPqBOWGZVN8gdwbGZxP3VpQHj
         Dr/Ayott0EIem9sRuT57+q1AUsj3+6DznEv9eQpzswyR5n0032XZEmGJ7ZfVEyWAjVk3
         HOjL1WJSE/he4aaDN+qPZEExTPKc8HkhzWsqzu8Pxm+yaRiwmaCnFQmicl4upGmOjiGs
         kiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202931; x=1795807731;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jB1K2/lgjP2EHgUQkQzV8Cd1pmFj89yXadaFTpFahhk=;
        b=cgHbVOxDXD5rn2Le4IRwxCJkDMhcasz2hciSyRRCb70iTOHEVBI6nMTCt8sRcAkng/
         OZ6+BnOK4gQMYC3UAytkltA76nuKQs//h6RdxlVmeZEFsNk/K/knQLd04IKier5ldujr
         Hjpve+goW1IBhnz4OYcYqWMv3LhOGZovfsDyb7tDFTqZ15eAJQ2ftBuyVv0SXvlutG2Y
         AuUfGe/8SIUkuM/QWMX8d85obRvnRdnnIwlmtUmWfcrUCRb00xZq8eb1Z3GK5K2KTM/Y
         3NWlyC/ayuDSOwCk+3cHt1fDUTDTaAY2aDoqSCE4hPS9Ig04JOus+py+hS9gng//+bUG
         eY4w==
X-Gm-Message-State: APuU4Z9oKzILKJAdTz/Ltk2zK01OaYVZwTFGSJxb5+7V/RQO0Qez2bYA
	XwstydBYNjazX6Xm8XX/tXKZfSwjSAFyncypk4kGYCs/se5aK5toVrGIeZBlFXGFGSlzdi3ucaH
	XjNBcRq1dYgLsI5OqzflR397vDvYlSHLYOrwW+LRVxxnn8orMy/AtCXepCVZ9J2ZVBt3u952Obk
	twbm47vE0FoPuaxStzRSbxmRdPJLVJhpQOfqVZay/Lq1RrNrYAukiyeNkFjA==
X-Received: from jabem1.prod.google.com ([2002:a05:6638:4da1:b0:620:1c04:b694])
 (user=keiichiw job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:c40e:b0:571:76cb:b4d2 with SMTP id 5614622812f47-57a0b03eeabmr5575568b6e.38.1795202930351;
 Fri, 20 Nov 2026 11:28:50 -0800 (PST)
Date: Fri, 20 Nov 2026 13:28:38 -0600
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261120192838.1171099-1-keiichiw@google.com>
Subject: [PATCH] split-ring: fix inverted empty-ring checks in receiving used
 buffers note
From: Keiichi Watanabe <keiichiw@google.com>
To: virtio-comment@lists.linux.dev
Cc: hattorij@google.com, Keiichi Watanabe <keiichiw@google.com>
Content-Type: text/plain; charset="UTF-8"

In the Receiving Used Buffers From The Device polling example, both
comparisons check `vq->last_seen_used != le16_to_cpu(virtq->used.idx)`
instead of `==`. When unconsumed used buffers are present
(`last_seen_used != used->idx`), the loop immediately enables
notifications and breaks without processing any buffer; when the used
ring is empty (`last_seen_used == used->idx`), the loop skips the
re-enable/break block and reads past `used->idx`. The snippet also
mixes `virtq->used.idx` with `virtq.used->ring[...]` and omits the `&`
address-of operator when initializing `struct virtq_used_elem *e`.

Replace both `!=` checks with `==`, use consistent `virtq->used->`
member access, and take the address `&virtq->used->ring[...]`.

Signed-off-by: Keiichi Watanabe <keiichiw@google.com>
---
 split-ring.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/split-ring.tex b/split-ring.tex
index de94038..1fd68c9 100644
--- a/split-ring.tex
+++ b/split-ring.tex
@@ -718,17 +718,17 @@ \subsection{Receiving Used Buffers From The Device}\label{sec:Basic Facilities o
 virtq_disable_used_buffer_notifications(vq);
 
 for (;;) {
-        if (vq->last_seen_used != le16_to_cpu(virtq->used.idx)) {
+        if (vq->last_seen_used == le16_to_cpu(virtq->used->idx)) {
                 virtq_enable_used_buffer_notifications(vq);
                 mb();
 
-                if (vq->last_seen_used != le16_to_cpu(virtq->used.idx))
+                if (vq->last_seen_used == le16_to_cpu(virtq->used->idx))
                         break;
 
                 virtq_disable_used_buffer_notifications(vq);
         }
 
-        struct virtq_used_elem *e = virtq.used->ring[vq->last_seen_used%vsz];
+        struct virtq_used_elem *e = &virtq->used->ring[vq->last_seen_used%vsz];
         process_buffer(e);
         vq->last_seen_used++;
 }
-- 
2.56.1.809.ga0b61035b5-goog

