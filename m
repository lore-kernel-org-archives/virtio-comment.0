Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89958217727
	for <virtio-comment@lists.linux.dev>; Mon, 17 Feb 2025 11:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739793157; cv=none; b=c14Z2vS0iA/cjB6klfn9wXLQ5DInj8oPOEKktyVtbOLd8YeW8FpRKnit9BxKh7dU8+NQ7ZPI3m+Dtt/mdHdv2tIbqXFpElRYjdHeMBMUi+N5GPCQZ7E3Ytx8JUgm+nWWKIq34lf54OnAxaV1xQoxXeTW66TukvVo5qVOYluaSGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739793157; c=relaxed/simple;
	bh=BUv8n3qymRtAVgVET0jHmMrSjKKx8AgmE03KGEKAZUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=WpOWIp4dVDGnfpjC7wUXpRTpRFmhr+zJoNWDKPxAqN7zFHQoFnnscmAg5V6PLbZtde6VbDIcY7mSHRJiC2pqFrzgvqH8G7ODYhGrClWPP3BkROYeROn7Z14gDLdZtVOeoZ2zisogI9mmMEDI9PjFgNZJ+JQMBwZnVzwCDGyxJaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hlfltwrB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hlfltwrB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739793154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jEJ+Gk3ED2l3dQgZ2vMvnZm9zP5UORXyNxgZZVI/drI=;
	b=hlfltwrBN+ss0Pmir8QFnhZrexUHZg5L7SJh1JsWOBz2axcLLP8BNKsJONTaRCk4H6cEtt
	PQUdjRyVwGFhn6dOJaLCqt6JZ2W+w/McEUJzXJcrv9q+GDbqSZtZjorp6U/8/dtuCYlhMQ
	yTpJuXljDfFFW6r7xCZyNV/sPfrFFlM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-A4v_uYP2NMqh5RX1WofW9w-1; Mon,
 17 Feb 2025 06:52:33 -0500
X-MC-Unique: A4v_uYP2NMqh5RX1WofW9w-1
X-Mimecast-MFC-AGG-ID: A4v_uYP2NMqh5RX1WofW9w_1739793152
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 44CE919560B9
	for <virtio-comment@lists.linux.dev>; Mon, 17 Feb 2025 11:52:32 +0000 (UTC)
Received: from slp-asahi.redhat.com (unknown [10.45.224.236])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 20C34300018D;
	Mon, 17 Feb 2025 11:52:30 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Sergio Lopez <slp@redhat.com>
Subject: [PATCH 1/3] shared-mem: introduce page alignment restrictions
Date: Mon, 17 Feb 2025 12:52:25 +0100
Message-ID: <20250217115227.4961-2-slp@redhat.com>
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
X-Mimecast-MFC-PROC-ID: zcqqB197AMfogFN0ge4LgOL6FhlmbDcx8VF6ZUFwdeg_1739793152
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add a subsection for page alignment restrictions and introduce the
VIRTIO_F_SHM_PAGE_SIZE feature bit.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 content.tex    | 3 +++
 shared-mem.tex | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/content.tex b/content.tex
index c17ffa6..575065d 100644
--- a/content.tex
+++ b/content.tex
@@ -872,6 +872,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
 	handling features reserved for future use.
 
+  \item[VIRTIO_F_SHM_PAGE_SIZE(42)] This feature indicates that the device
+  transport provides information about the supported page size.
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
diff --git a/shared-mem.tex b/shared-mem.tex
index 6e6f6c4..dd90cb7 100644
--- a/shared-mem.tex
+++ b/shared-mem.tex
@@ -34,6 +34,13 @@ \subsection{Addressing within regions}\label{sec:Basic Facilities of a Virtio De
 The \field{shmid} may be explicit or may be inferred from the
 context of the reference.
 
+\subsection{Page alignment restrictions}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Page alignment restrictions}
+
+If VIRTIO_F_SHM_PAGE_SIZE has been negotiated, when requesting
+the device to map memory into a shared memory region, the driver
+MUST obtain the page size information from the transport and honor
+the page alignment constrains derived from that page size.
+
 \devicenormative{\subsection}{Shared Memory Regions}{Basic Facilities of a Virtio
 Device / Shared Memory Regions}
 Shared memory regions MUST NOT expose shared memory regions which
-- 
2.48.1

