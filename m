Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7340F2376E6
	for <virtio-comment@lists.linux.dev>; Thu, 27 Feb 2025 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740668582; cv=none; b=S+h7C21rbMq488rCSvSnRVBIFnve/OEak/RLs5EF6pDM37cHc/yNu7fhBCWJft8kAa1h/MCrpRe+TbosnUbLarcOWdxsAhAuQOSXvlIo6t31RM1Hg26RHQyrmStmtS2ciHiVZEqbUNwOIhkHcyMLY63d+Ar+npEHta79KPRH7u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740668582; c=relaxed/simple;
	bh=D671HiumGK3Y43oDABwqlzgsLP0Ah+odaYzguZ5Qzso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=jjCKgdSfmguM7AW9/CK44tGDcf5XKYpXtIDje3UWFSf9E3d2MfLuXWQb39y0df9TBhpW944drP5YtI8TojHLBTGXNTrZMrz97z81OK3nQ5t9OgMRibApwHNhnssg0IafPvnpj97QHw6kB/TZyYzPXEW5Mdm/b0M/Ss7ZWo8ulPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=avIo1Nnz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="avIo1Nnz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740668579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LjL94By1pFUJZ7ODfj9Apz/tRRbaawBZnPvGKbj179w=;
	b=avIo1Nnz9zKm97Ixzsqr5MGIJQsXqVEIH6GnRlYn34x3I/rqpH6PlSfAzKMrPDQ0sTn1SA
	1dHhURJYNYx2euMFc9KevrqwPMxkSq0PkCEfm9sH2DR+0c5nwvbbb8O0IdoUXruPRTx6LC
	KsHjD0n9GetWw6oCBhs+eCq4kp22PSo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-E1109N0SNmion94zKFt2XQ-1; Thu, 27 Feb 2025 10:02:57 -0500
X-MC-Unique: E1109N0SNmion94zKFt2XQ-1
X-Mimecast-MFC-AGG-ID: E1109N0SNmion94zKFt2XQ_1740668576
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4399a5afc95so4590895e9.3
        for <virtio-comment@lists.linux.dev>; Thu, 27 Feb 2025 07:02:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740668575; x=1741273375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjL94By1pFUJZ7ODfj9Apz/tRRbaawBZnPvGKbj179w=;
        b=D7OFsx6zg85oshAtN+rqVtimSrU3HVr2RLV2Mytm0r/74surnRWVSS5y3rVvhBe0Pr
         2G2p1MA3kQk9sV9AQ1FbJBhGcsd1HpE17kJg3LPe2Kzplal3WCU4/KDiUH2kJZ2N+K5a
         FBqVEI5R1WvkgCl8joJkA+IYCIbNABaQ8aV1UGM1XYOl8lusaJAIWWBzoJqCN7OV2zBI
         a4Ytlwb86/LSNTvhqV0eEpL3gXigqpfbuzZIIquIcCR9YyTjk2SZiBzY+fiWb6PspNnD
         Uv3Kg135xFuPlcjsCnEFAqy5xtx7XA/H1f8QjoEjuYXjG8rYwIUpsLklR2p6+igeeEKn
         nz6g==
X-Gm-Message-State: AOJu0YzcfymZu0rQNS92bBdcc4UByvyUj2VuJUFYbTIKjchwnu5eVBYW
	xT/CwaNwXpkn/ujsfWSq86jCICUivH7Da6Q7p2UgY8G4ziN7aN/E++KmY8bUz+5fSYxEZGMON1Y
	pTNt2YXx4cvAtUJqsjQCM+ZM3lcERcpDLJHmuLk2GzLv48CTg8l7/1mHDIW0Q5hXRkr9nopenUm
	ByJdvIt00qNjwo84jIPGrlm9r/3qYBLdR3RPEddi7aMISlTyim
X-Gm-Gg: ASbGncuzWjD6qnII3Zvq6lekP+zkpNtvnnVAfQbVCvQVzZj4egupEHQFLb6YywUqFrX
	gS5NTRtmYbSUUj2hSkSGO89xVOOw3bw6vykBMPyl1GdclMpUuvTHSjneFb+X6NAYgAsbcVgl3az
	/9UFNr2d7wi0iLZQlMgfdTxF3qzhkrfLFcIlOVeayg0TrQIBdbdCRbojulz0QN5ZdKXBv2rOrnT
	/5RynvvYhxnos0T9b33UfgsDdS4vQqlsymIvymRnzkGurhC854ZEGa/UUXXqz9q3bQWxvgd27oD
	4EUG4zN2rXEh+tAzL0A=
X-Received: by 2002:a05:600c:35cc:b0:439:9a40:aa16 with SMTP id 5b1f17b1804b1-43ba133ae5cmr27283255e9.16.1740668573748;
        Thu, 27 Feb 2025 07:02:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGS+iufDEVa2FWbWFlFbaEQsRL5bKBAEVDN9zofk3R2ztmJcsAfCidEZt66PmBj2o8fUp9E4g==
X-Received: by 2002:a05:600c:35cc:b0:439:9a40:aa16 with SMTP id 5b1f17b1804b1-43ba133ae5cmr27280055e9.16.1740668571617;
        Thu, 27 Feb 2025 07:02:51 -0800 (PST)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b737074d8sm26530585e9.16.2025.02.27.07.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 07:02:51 -0800 (PST)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: cohuck@redhat.com,
	parav@nvidia.com,
	mst@redhat.com,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH v2] README.md: add example email for TC vote request
Date: Thu, 27 Feb 2025 16:02:41 +0100
Message-ID: <20250227150241.1274768-1-mvaralar@redhat.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ugwipkc6Muu2BGISnqL0eIx5xtLFk_zanTwkLnPCjYc_1740668576
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Acked-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
v1 -> v2: add Subject and To
---
 README.md | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/README.md b/README.md
index c06caf6..731838b 100644
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
+Subject: PATCH [description of changes]<br>
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

