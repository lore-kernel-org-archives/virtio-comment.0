Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031E821422A
	for <virtio-comment@lists.linux.dev>; Mon, 31 Mar 2025 15:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743436776; cv=none; b=EcdcOmWva09aWvjDzOOzvIsmgrUE0mSGza/BxTPc25O4JDpkv7bXAwyBQv9eCwlvKzvatuPpq4r8tU4pu30bp658PWOL45LwS82b9TLyGyfgXWv/joG1ZnWhzRVuB18fiUM90OPS5tJECTMldShfApoEegMVuh0nU8q7Z8XOSqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743436776; c=relaxed/simple;
	bh=MDSRVhEOJJ8oeaZe+KiKzYLFJ/3pe3C4l5v0kc+mHBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=VkJpIZOiSI0Qge3pLsl6676Ia/xOscqmur+BwTFvAFf5a+60WYWQa/LF2rVfDKz+40AsH5EbZv29ZCDM7FwSaRiMYW1Xll6VcSwGSmhhCy+VLbC2QPDiE9zjI3UjzxupTSZUQLPRL61v90dh+UCF5TJMZvy+OddIMFHGN6oc3e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RxoZ05rj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RxoZ05rj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743436773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2nmqP3SpRFwfzuSyPhuvYr0wm5mc++2junxdgZje8AU=;
	b=RxoZ05rjy1SYS3SXfAi2BLmch9C/q/gDre1I9clj3XLJgB39Jh+SvonanWySZjzKo6icO0
	VyXkYQyW4YQw2rJEZ5Jx49H03ZsjtsM+Q3GvOFvJd/N0dRktMTdT7P9Gv4TWIS2kh087y3
	wwvncEo9uebFILZQm+n4camtNQoeit0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-607-GsTXsf0aM1SdRw79fwDqZg-1; Mon,
 31 Mar 2025 11:59:30 -0400
X-MC-Unique: GsTXsf0aM1SdRw79fwDqZg-1
X-Mimecast-MFC-AGG-ID: GsTXsf0aM1SdRw79fwDqZg_1743436769
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6CAC5180AF4D;
	Mon, 31 Mar 2025 15:59:29 +0000 (UTC)
Received: from f41vm.. (unknown [10.45.224.27])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 86B961801752;
	Mon, 31 Mar 2025 15:59:27 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: dmitry.osipenko@collabora.com,
	parav@nvidia.com,
	mst@redhat.com,
	Sergio Lopez <slp@redhat.com>
Subject: [PATCH v2 3/3] transport-mmio: introduce SHMPageShift register
Date: Mon, 31 Mar 2025 11:05:48 -0400
Message-ID: <20250331150548.50595-4-slp@redhat.com>
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
X-Mimecast-MFC-PROC-ID: ZGR6ZEe1xNpnjF9EmEgNmntqqGnhjCCzydEKOgS0dAM_1743436769
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Introduce the "SHMPageShift" register which, when read, returns the
page shift value that can be used to derive the page size value
supported by the shared memory regions in the device.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 transport-mmio.tex | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/transport-mmio.tex b/transport-mmio.tex
index 94a93a1..042a82c 100644
--- a/transport-mmio.tex
+++ b/transport-mmio.tex
@@ -242,6 +242,14 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
     apply to the queue selected by writing to \field{QueueSel}.
   }
   \hline
+  \mmioreg{SHMPageShift}{Shared memory region page shift 8 bit long}{0x0c4}{R}{%
+    Reading from this register returns the page shift derived from the supported
+    page size for the memory region selected by the \field{SHMSel} register. The
+    page shift is derived from the page size by using this formula:
+    $page size = 1 << (page shift + 12)$.
+    See also \ref {sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Page alignment restrictions}.
+  }
+  \hline
   \mmioreg{ConfigGeneration}{Configuration atomicity value}{0x0fc}{R}{
     Reading from this register returns a value describing a version of the device-specific configuration space (see \field{Config}).
     The driver can then access the configuration space and, when finished, read \field{ConfigGeneration} again.
-- 
2.49.0

