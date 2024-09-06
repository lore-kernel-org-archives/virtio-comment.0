Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E016D139D03
	for <virtio-comment@lists.linux.dev>; Fri,  6 Sep 2024 07:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725606531; cv=none; b=bRce+IxuHBakdABpCMXo3uWjCqR0HzQ/GO7FNYWZvmyAcw0bW/e+g4OsX05Kfr52k2D3L0tlMUuOlteWizMI+D5JOaNoP2aAugjjhSHWznQNzZ1dv2q1HC5Z2hyBrNyjXsmQwi4boPcxGva2SPRGC7njmezoqxzs2QwCm64jz4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725606531; c=relaxed/simple;
	bh=aobfCSPtNJe/UldhGMBqHlV+UaFM2fvjlULAThVo5DY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WE1Hu2amn33u9QUwDSHtrLw1ijEkuqDBhmlzdmV4WVC/UYP2eUCFwDHxB15v+igS3UgzoRjgkvkhoi7SDrqyhF0S8RoOIH7N/svZ3iWdWswbCfmmEBa4ENQVrq2AlC49BT/dpIWrKBShMoKJOuWKSFuCe8oapmqlIFBnqomMfP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WeFSXbjU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WeFSXbjU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725606528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pMUzJtI6sPXJct0uAi/uYrLpyIXyvAKPQ1h2mnksV5s=;
	b=WeFSXbjUAm+ZJEo94vYmWIS20yl8xto1hQBn4/oQrYhDvBN7LdAaRcH0I6Jf7XGpAUm0El
	M5th8GClt8l+PWRZ26jZ0SH+lWfT5KNY6xSIQSINOuxgF90skpn8FCVPEwjWXpwUzIHomC
	HTDiLjTnRapEKBlNrZqzehjLPkdw7mY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-5hrPuBL7OsKcllaG9BT7Og-1; Fri,
 06 Sep 2024 03:08:45 -0400
X-MC-Unique: 5hrPuBL7OsKcllaG9BT7Og-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 379011955F56;
	Fri,  6 Sep 2024 07:08:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.45.225.58])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 97D4D3000236;
	Fri,  6 Sep 2024 07:08:42 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: acourbot@chromium.org,
	Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v3] content: Reserve ID for media device
Date: Fri,  6 Sep 2024 09:08:33 +0200
Message-ID: <20240906070833.1949727-1-aesteve@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Reserve device ID 49 for media device.
Compatible with video encoder, video decoder,
and capture devices.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index 0a62dce..6d6b3d8 100644
--- a/content.tex
+++ b/content.tex
@@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 45         &   SPI master \\
 \hline
+49         &   Media device \\
+\hline
 \end{tabular}
 
 Some of the devices above are unspecified by this document,
-- 
2.45.2

