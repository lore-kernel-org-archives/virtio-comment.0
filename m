Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E1D19340B
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 07:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725519843; cv=none; b=L9ig5WJQavVuQccLPPkxdhswyjgNen7BhY582W/7U/ZteK5Gg2tDU7Z8nWecn+fIbmNN67p/n18HTEBU8e5D4CN04KG0FD18sXtBSmr40FlZT8fvRDboErJP+EOvecJbb8Tc+XwsFZNQrX22C+hxD6z0JI0cAtaHZeI7aFH5Udk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725519843; c=relaxed/simple;
	bh=zNLac5Oj0m3TNd0jC21JhTv6sK6BKtPabTJ4HVNbfDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CIf/bXdNrFJHgtWyWdz5GgFPeqkiefwNNUBHwgcVKxUMwvK8JhIayR7TMzPnuRsESQT28pFCey3Zhi7drfn02tKYYGgNxF9M7BTT5ZY7YCV3wdLTlGf04OeY+gavq8Vpu4OOoXjJK44f5LDhJeIj3AHjn6MdKh3n0DSXCTMXuio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZUeiIrNJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZUeiIrNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725519840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/ZN7RNMZD9+GCAESd4AjUwDm/HPPeW4obXow50CrPYc=;
	b=ZUeiIrNJ+9us6QdXqDCfrxPTop0c9ZxNL83bpT56WPFMyXAW6RuNgvCVoiVHkaXmIEvZSt
	/euejWem0MHNzlUVqQ/9Tkskc6tVfbmQpbaNXNdOH534L0yrirx3IsJh3MqYI+3lwDUkjy
	IkPjq4gBuYuogc3LfmL7TN8Jo5y+gVI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-576-YFbwi8GhN3SUOSsMnGEadQ-1; Thu,
 05 Sep 2024 03:03:56 -0400
X-MC-Unique: YFbwi8GhN3SUOSsMnGEadQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6FD0B1956069;
	Thu,  5 Sep 2024 07:03:55 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.225.40])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8EFEF19560AA;
	Thu,  5 Sep 2024 07:03:53 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: virtio-dev@lists.oasis-open.org,
	virtio-comment@lists.linux.dev
Cc: virtio-comment@lists.oasis-open.org,
	Albert Esteve <aesteve@redhat.com>
Subject: [PATCH] content: Reserve ID for media device
Date: Thu,  5 Sep 2024 09:03:51 +0200
Message-ID: <20240905070351.1761683-1-aesteve@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

