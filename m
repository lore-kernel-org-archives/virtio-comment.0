Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE7E2857ED
	for <virtio-comment@lists.linux.dev>; Thu, 10 Apr 2025 13:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292001; cv=none; b=nn9vfWC5sWCLFTJebIIgNKxG0NzsopzX74BGgPwAOXvaxFJzVk3EwQDn5M8+aeC5MOQPUhj9AmMpBCmKQiqPUxFJbxirL7zetlYI44RV3L0h5LN0Q9G4li2Un6UI6IVDMSvZRftlbA5qhZR9uuD4QSvPLvjk/nsAeTUCb6FjFx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292001; c=relaxed/simple;
	bh=QM7zmtOQb0veiF1ba9ri+161bml9w3px2PKdpdRFVlM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=DL2llo59BtN9AFlcWGKHoVVyEUbkmFTdaPaZqQAiDyVje2GKsmZcadok41iexUu8Ibd3T42luCdaR5qU8EurZlxwaX70TNAIvDMDlE1InRyX69dmB+8iiJjiE/hNArnPk7oQRiy8ByOgMzAMEH8rpMd9TtbY9Sq5RxuthtNwRFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iJJiZGXk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iJJiZGXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744291998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2Em8RQgOrWR17dOowaelEkVaKfuxIxtR4M0PhC3nXaE=;
	b=iJJiZGXkyoj2xOwKhW1QEI60w8Hu7VD8PdIQKytSGrZHNNxJJFS+RnX6QiXtyIuyrfsLvQ
	RH96tANuTlDANS/B7ikJSsT+deb/TCuV2U+mr++tWuFmqbtBx+pB7TH6X31Zpk64XdLmeB
	PxFfhgdBrytcaaFtLLsWr/Ff2V4Cq7c=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-274-5h1rExbBNGioxI8_HcO47w-1; Thu,
 10 Apr 2025 09:33:15 -0400
X-MC-Unique: 5h1rExbBNGioxI8_HcO47w-1
X-Mimecast-MFC-AGG-ID: 5h1rExbBNGioxI8_HcO47w_1744291993
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DF03E187BE1E;
	Thu, 10 Apr 2025 13:33:09 +0000 (UTC)
Received: from f41vm.. (unknown [10.45.224.222])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D829F3003901;
	Thu, 10 Apr 2025 13:33:06 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: gurchetansingh@chromium.org,
	dmitry.osipenko@collabora.com,
	parav@nvidia.com,
	mst@redhat.com,
	Sergio Lopez <slp@redhat.com>
Subject: [PATCH v2] virtio-gpu: support blob alignment information
Date: Wed,  9 Apr 2025 17:23:24 -0400
Message-ID: <20250409212324.18134-1-slp@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xZWE6PxnvPwTzO-Jbro7rK-B1FxAev3MFKZXjCP1aiU_1744291993
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Allow the device to require certain alignment constrains for blob
resources by extending the device configuration with the field
"blob_alignment" and introducing the VIRTIO_GPU_F_BLOB_ALIGNMENT
feature.

v2:
 - Clarify blob_alignment valid values (thanks Michael).
 - Rephrase feature negotiation (thanks Michael).

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 device-types/gpu/description.tex | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index 4435248..b3e75d3 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -37,6 +37,8 @@ \subsection{Feature bits}\label{sec:Device Types / GPU Device / Feature bits}
   resources is supported.
 \item[VIRTIO_GPU_F_CONTEXT_INIT (4)] multiple context types and
   synchronization timelines supported.  Requires VIRTIO_GPU_F_VIRGL.
+\item[VIRTIO_GPU_F_BLOB_ALIGNMENT (5)] configuration field
+  \field{blob_alignment} is valid. Requires VIRTIO_GPU_F_RESOURCE_BLOB.
 \end{description}
 
 \subsection{Device configuration layout}\label{sec:Device Types / GPU Device / Device configuration layout}
@@ -52,6 +54,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / GPU Device / D
         le32 events_clear;
         le32 num_scanouts;
         le32 num_capsets;
+        le32 blob_alignment;
 };
 \end{lstlisting}
 
@@ -67,6 +70,9 @@ \subsubsection{Device configuration fields}
   supported by the device.  Minimum value is 1, maximum value is 16.
 \item[\field{num_capsets}] specifies the maximum number of capability
   sets supported by the device.  The minimum value is zero.
+\item[\field{blob_alignment}] specifies the minimal alignment, in bytes,
+  required by the device for resource blobs.  The value must a power of
+  two.  Minimum value is 1, maximum value is 4294967296.
 \end{description}
 
 \subsubsection{Events}
@@ -672,6 +678,9 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
 resource. There is no restriction on the image/buffer view the driver
 has on the blob resource.
 
+If VIRTIO_GPU_F_BLOB_ALIGNMENT has been negotiated, \field{size} must be
+aligned to \field{blob_alignment} as defined in the device configuration.
+
 \item[VIRTIO_GPU_CMD_SET_SCANOUT_BLOB] sets scanout parameters for a
    blob resource. Request data is
   \field{struct virtio_gpu_set_scanout_blob}. Response type is
@@ -776,6 +785,10 @@ \subsubsection{Device Operation: controlq (3d)}\label{sec:Device Types / GPU Dev
 };
 \end{lstlisting}
 
+If VIRTIO_GPU_F_BLOB_ALIGNMENT has been negotiated, \field{padding} and
+\field{offset} must be aligned to \field{blob_alignment} as defined in the
+device configuration.
+
 \item[VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB] unmaps a
   host-only blob resource from the host visible memory region. Request data
   is \field{struct virtio_gpu_resource_unmap_blob}.  Response type is
-- 
2.49.0

