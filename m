Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAD2219E93
	for <virtio-comment@lists.linux.dev>; Mon, 17 Feb 2025 11:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739793160; cv=none; b=W8QXPuPB+UfaXtAXxFZa/oO5YBM7MDlQe1hGoHjw/1qRDVc6nS1HooPYSJl2fpOWTwl4ERoJJmjs4wTD+nUF/EM083/w+lkz9qMV478HYLzW7Z6feb8dEDkjrlS0IQezxWi6UjRrKbocosKnY81kXCRMcDxwELfrJr2kTBlQVZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739793160; c=relaxed/simple;
	bh=soZ3Rz+XW9+2xstEqNMK3gQJTFex7IHhi08fYdisgw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=NX63FkuuaRce4rDdpVQvToWJRywDrkJJmul4RIEdnQWuSlsPqtdppIfItfXO887TaZ/FgS5nLbElwH4+HGFWiPBW1OuML+jrZs+k1XJMGLOKRoZUdO5arUJMyt7L0pEcctnT6J2QImwTdN1I2vER9mLMXn2tnl4eTPPB/SLSk9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ehaZMhB/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ehaZMhB/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739793157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PlMRSu0X31LKyCq20SyzyHK7ggkEYWWEvSO+oSZqYTE=;
	b=ehaZMhB/NEh62DpwR3a5Saj3EJam/hnFnJBwSnMOko5JhcGj7TG7YMB9rX3cC1WSLHzRyL
	S4L2tLWAvKwz7IwJUsmkKS+4TX/3fxwB8NcilUg6+ri2ng4DOOUjQK1/P4EG3OnLD+uSRK
	hAPTvastMb5XyAak48FFrFuDZrUKkb4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-558-rssn_B3FPZa-lCyv9Y6qNA-1; Mon,
 17 Feb 2025 06:52:36 -0500
X-MC-Unique: rssn_B3FPZa-lCyv9Y6qNA-1
X-Mimecast-MFC-AGG-ID: rssn_B3FPZa-lCyv9Y6qNA_1739793155
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AD03D18004A7
	for <virtio-comment@lists.linux.dev>; Mon, 17 Feb 2025 11:52:35 +0000 (UTC)
Received: from slp-asahi.redhat.com (unknown [10.45.224.236])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8AFDA300018D;
	Mon, 17 Feb 2025 11:52:34 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Sergio Lopez <slp@redhat.com>
Subject: [PATCH 3/3] transport-mmio: VIRTIO_F_SHM_PAGE_SIZE
Date: Mon, 17 Feb 2025 12:52:27 +0100
Message-ID: <20250217115227.4961-4-slp@redhat.com>
In-Reply-To: <20250217115227.4961-1-slp@redhat.com>
References: <20250217115227.4961-1-slp@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -0fAjQKI9p6s4B8_BJnBNi9dmg7BoOBirKndgLt4Y2U_1739793155
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Introduce VIRTIO_F_SHM_PAGE_SIZE by adding a the new register
"SHMPageShift" to hold the value that can be used to derive the page
size value supported by the device.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 transport-mmio.tex | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/transport-mmio.tex b/transport-mmio.tex
index 94a93a1..28d1594 100644
--- a/transport-mmio.tex
+++ b/transport-mmio.tex
@@ -242,6 +242,14 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
     apply to the queue selected by writing to \field{QueueSel}.
   }
   \hline
+  \mmioreg{SHMPageShift}{Shared memory region page shift 8 bit long}{0x0c4}{R}{%
+    If VIRTIO_F_SHM_PAGE_SIZE has been negotiated, this register returns
+    the page shift derived from the supported page size for this shared
+    memory region. The page shift is derived from the page size by using
+    this formula: $page size = 1 << (page shift + 12)$.
+    See also \ref {sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Page alignment restrictions}.
+  }
+  \hline
   \mmioreg{ConfigGeneration}{Configuration atomicity value}{0x0fc}{R}{
     Reading from this register returns a value describing a version of the device-specific configuration space (see \field{Config}).
     The driver can then access the configuration space and, when finished, read \field{ConfigGeneration} again.
-- 
2.48.1

