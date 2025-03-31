Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFBF1F1909
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 11:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743506976; cv=none; b=OTCO5JyZmrGoy9l0v6927Cfo6EH67j7Q8XPNgBIJJtUb1feizqAbEMDH9tmAPUtfsacHGZmA/bIcjmIo5WX4Gl4vbdg5ravEdEhmy+M8rVxCsGDubGaOogtWTcO++hLDgvXunn4PERyUUs8fOZWujGxn/2rwuRadkq10XsOzJpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743506976; c=relaxed/simple;
	bh=MDSRVhEOJJ8oeaZe+KiKzYLFJ/3pe3C4l5v0kc+mHBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=P+lyc2MrNSfVr633aqEln7ttyjSytkmlsoBE8VGvuyoZFmOO3wN+6Ulfx6xqtx7lJ12Aj+nc2J83ENAkVSgD6OLL8RpkRKh21RByHwhDcuo2Gxr6G2d5hpcz1JWmnQ3rl/4TjTNJhe5spnOPvOZle2aEQA/+RRU9HQvLlgZzxqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UTjQ/pau; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UTjQ/pau"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743506973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2nmqP3SpRFwfzuSyPhuvYr0wm5mc++2junxdgZje8AU=;
	b=UTjQ/pauobb/kgtIv9gxfL3rklXbwNE5EtLbTppD9DJNCbpLBJr+MJd9iEeVR70e2XWi8X
	86KlosUdFybFuke9Tx3Bkwyn/xcB/xnT6BWcSOpL5h0E2LI/7SSeiNUqL9+evXu022H518
	oLsog5HMYnJE+VRmcYB2Bsf8T4pT7CE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-339-fI_ZF98fOqChsnThL1tYMA-1; Tue,
 01 Apr 2025 07:29:29 -0400
X-MC-Unique: fI_ZF98fOqChsnThL1tYMA-1
X-Mimecast-MFC-AGG-ID: fI_ZF98fOqChsnThL1tYMA_1743506968
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 661771800263;
	Tue,  1 Apr 2025 11:29:28 +0000 (UTC)
Received: from f41vm.. (unknown [10.45.225.223])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AE6991955BEF;
	Tue,  1 Apr 2025 11:29:26 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: mst@redhat.com,
	dmitry.osipenko@collabora.com,
	parav@nvidia.com,
	Sergio Lopez <slp@redhat.com>
Subject: [PATCH v3 3/3] transport-mmio: introduce SHMPageShift register
Date: Mon, 31 Mar 2025 17:37:11 -0400
Message-ID: <20250331213711.63398-4-slp@redhat.com>
In-Reply-To: <20250331213711.63398-1-slp@redhat.com>
References: <20250331213711.63398-1-slp@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v5BHuczT43mELtvD-xzxdYX3G45BdEXjFIWP5vlVtLU_1743506968
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

