Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9457B1925BE
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 07:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725521258; cv=none; b=I7+mhhST4Q1Q+VHvpbvtYywmvbTF1HZKmkFfstWqaCslM0DJXXOXJFxCd7P3nHWuDRhdWv9eKjUV8N98rt0a81JHPc6tP7T8Iq+pmIo/9zr8PDKAN9Z1AJatoV9ROUEJNzdYUepw6SWPSdtKo7E6WW1W6jIMqTERuYL+SubSTOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725521258; c=relaxed/simple;
	bh=zNLac5Oj0m3TNd0jC21JhTv6sK6BKtPabTJ4HVNbfDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n2duJ02IJibgaMMgUFG3kq9NjRFK/awHTgKb2PGxljbTqu7Ousd1UlEOm9kT5Ivx9s0NgFhGEodYJISbPTeQc77zW6YGcD4/ae2K/ssOUk5sdK1plV9R+16F5HcDNzX+HNh7JDn1MQAtZzsa1Qhz1ZNaymO1NxzZb3V8ABJA7ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FtDL2XD1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FtDL2XD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725521255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/ZN7RNMZD9+GCAESd4AjUwDm/HPPeW4obXow50CrPYc=;
	b=FtDL2XD1qqPvEojzCAZ8B+2Ar5M1uPC8tgMCBYWkzBU4p7QjKP0CFX4uZx8tKq7mx8BpeM
	D4fpVZO0AnjGgAocck02qSb7L5md464Y1ojz4nR2yG9uV4nW9R6nHOeGNA66qW2GXOgl6e
	brwTX0zoeF4r9Nr9SNtzl4+Melapfsw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-155-_GNNMHvTO4SC1wfoEYvEZw-1; Thu,
 05 Sep 2024 03:27:34 -0400
X-MC-Unique: _GNNMHvTO4SC1wfoEYvEZw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A888C19560B1;
	Thu,  5 Sep 2024 07:27:33 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.225.40])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0175E30001AB;
	Thu,  5 Sep 2024 07:27:31 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: acourbot@chromium.org,
	Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v2] content: Reserve ID for media device
Date: Thu,  5 Sep 2024 09:27:30 +0200
Message-ID: <20240905072730.1765397-1-aesteve@redhat.com>
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

Reserve device ID 46 for media device.
Compatible with video encoder, video decoder,
and capture devices.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index 0a62dce..1bfa755 100644
--- a/content.tex
+++ b/content.tex
@@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 45         &   SPI master \\
 \hline
+46         &   Media device \\
+\hline
 \end{tabular}
 
 Some of the devices above are unspecified by this document,
-- 
2.45.2

