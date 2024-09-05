Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F1119341E
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 07:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725521431; cv=none; b=AIU7L1oHJUhL4jLgKx0qWv8Pl0ZHgxGJuS+z4KsHiPPQd7KPrsHuOV6l/WpphQAQHPUGPaEyIIN50fnF9RfXbWX1R0vcF/21CvSF1W9SrEELIkLaGT3ibIOyt7XdG+Kpt9u7OfzC6PEEmhVPV0kMa4UyQ2J4EJaLC8syW4WvPCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725521431; c=relaxed/simple;
	bh=lZhSeT0WpclrXMERk5iwAght5sqYc4tdGod4Kzk4hh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IpkHJIfrgerWk5Dqr8E64I80kFJPLAAL+ac94uz4tJo/HsI40YK8pddPdAUIfVbJNLngS2YUNINN/IczceERGwY9/4KHZLe2G80Xi7nCZNY26ihAXaKsh3Yc2e/WdpNRfqbtD0Pr8VjOrm3WpM0wcrsXc+e04ZMScVSqqGlEPLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JfseaGL9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JfseaGL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725521428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rIJ0cQu4JDH31Ek9n7LJLNNucHKuUPpn3R1jvA9KgiQ=;
	b=JfseaGL9H0wSBwix7i6/vscKABercPdiX8zCDsfnFBocnmywloBIu3EebWLLBS4yR75hS/
	oExp2suYsljrjRkMKdiwisUv4PEJ4NAie2KM1StP9qpMUUu5MW6LAchosf6qlhqdZ6wlFE
	5anNpHkXKzvxdwAllH2pJni2b8wO9DM=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-176-HVahqtkMMkqV2f7fB0Ybnw-1; Thu,
 05 Sep 2024 03:30:24 -0400
X-MC-Unique: HVahqtkMMkqV2f7fB0Ybnw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6F46B1944EAC;
	Thu,  5 Sep 2024 07:30:22 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.225.40])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A8BC7300023D;
	Thu,  5 Sep 2024 07:30:20 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: acourbot@chromium.org,
	Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v2] content: Reserve ID for media device
Date: Thu,  5 Sep 2024 09:30:18 +0200
Message-ID: <20240905073018.1766082-1-aesteve@redhat.com>
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

