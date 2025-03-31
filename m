Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD4A214223
	for <virtio-comment@lists.linux.dev>; Mon, 31 Mar 2025 15:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743436769; cv=none; b=O6w7NAyP7/mYBP+vuJ26jejJDzZ7mfqn2Ny65BhbnjB+0v4BrMx6aHE8CpwF9nYSTi2LH/K9621PVS1VFGQGRpIIxEU58srKzf+7idvPsSPnGT2BL1i5ZzZGgXUlBcTES5kIWoEt6tM4K3PVgmYpOOVRQf2CwKxdQSGJjjhXFrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743436769; c=relaxed/simple;
	bh=vhzxGDxxeGcGTv1pumww848uGdyczEmNUIrF5/Qx0/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=PBY1D/J9Hp93mhSWhB7QKxLzmZnDDfPWj/p8XrWZe1KueNlp2UVCtJHkpWTyJqRBqoiXHgzMDLWnkpFZNQmMO8ZYe3vl52TmTMM4OQH3ItB5bICw67PoWsjctDKC/hjy1fQp8FDJ7TFFfWYVmnC4R7iaHQ8RuKzUCV1VCWKm54M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aWKojP3N; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aWKojP3N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743436766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z1IDIQpWiSMl98CZVFLLhRzi848jNdUkNuzWKxTkk2g=;
	b=aWKojP3NI4Spit58zTy8/zUfCED1jF5foPVqRhaKVACf5b82y5+B7FQw7X0rGglv0lCmSa
	4iCy7QI/r8RHsyXpeByzwOMuCA8dhdN9H2IELog4y2Dr3QrxK39fU9kR8EF7zQUasmIRFb
	6pF33lp0oQO470p0h2/7LPvLuYV5cmQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653-UVMLpKgaOxqTriAvJSMbLQ-1; Mon,
 31 Mar 2025 11:59:25 -0400
X-MC-Unique: UVMLpKgaOxqTriAvJSMbLQ-1
X-Mimecast-MFC-AGG-ID: UVMLpKgaOxqTriAvJSMbLQ_1743436764
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 85AD318001E6;
	Mon, 31 Mar 2025 15:59:24 +0000 (UTC)
Received: from f41vm.. (unknown [10.45.224.27])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BB876180174E;
	Mon, 31 Mar 2025 15:59:22 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: dmitry.osipenko@collabora.com,
	parav@nvidia.com,
	mst@redhat.com,
	Sergio Lopez <slp@redhat.com>
Subject: [PATCH v2 1/3] shared-mem: introduce page alignment restrictions
Date: Mon, 31 Mar 2025 11:05:46 -0400
Message-ID: <20250331150548.50595-2-slp@redhat.com>
In-Reply-To: <20250331150548.50595-1-slp@redhat.com>
References: <20250331150548.50595-1-slp@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jXZtbLYlR9QUVt7yqRY2oDXEh0_4CjQiqNIWLY5LJrI_1743436764
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add a subsection for page alignment restrictions.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 shared-mem.tex | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/shared-mem.tex b/shared-mem.tex
index 6e6f6c4..2021083 100644
--- a/shared-mem.tex
+++ b/shared-mem.tex
@@ -34,6 +34,12 @@ \subsection{Addressing within regions}\label{sec:Basic Facilities of a Virtio De
 The \field{shmid} may be explicit or may be inferred from the
 context of the reference.
 
+\subsection{Page alignment restrictions}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Page alignment restrictions}
+
+When requesting the device to map memory into a shared memory region
+the driver MUST obtain the page size information from the transport
+and honor the page alignment constrains derived from that page size.
+
 \devicenormative{\subsection}{Shared Memory Regions}{Basic Facilities of a Virtio
 Device / Shared Memory Regions}
 Shared memory regions MUST NOT expose shared memory regions which
-- 
2.49.0

