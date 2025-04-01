Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD380288A2
	for <virtio-comment@lists.linux.dev>; Thu,  3 Apr 2025 15:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743692695; cv=none; b=ottL3YcuFq5HU22UwWrJxXLI/SP5IMIYl90sJgoVEf4pU2NlRXgJlo3rxDDySK5+5l9K0CKiPgd/8gAaOA+CuQguM6l/eqepqXl+0FciaYr6khqea9nUjl8xDa1WH8aMSQcHcT7E1Vgb5HBQ35Wett2Xp3awLstYJkZyUDWasbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743692695; c=relaxed/simple;
	bh=SEVShtI8mQXz7XqzrB1W7V1HtGmF06q5e3JbTxpGvEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=kyR9Kqgprc+K0Y4xE5vx5o7zonFEezQFpfv7GGmRciZ0Okxak3Vg/wgPkRk3DbckDrk8ke+RV9RIGabNjRALRomRcZ9OK7DAep2Gy9gloo48T4F3+882FMxFfWjA6PbYZ9yRJYSw0GQhNl5TmCfHk3jCIDaiuVAoqK4Q2AN9EzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GkMQ6jQf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GkMQ6jQf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743692692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tAqwhyHJYmWO7CY4BcShNtJ1JmRV9kH0pn8IBbbAKNQ=;
	b=GkMQ6jQf9IL83Jjb1vOw97lAPLTBqnjUnZDpZ1dEBTS3xMLZ82ynYS8NMQQo1RddL2IkJt
	02pMPj/UySMM7OIgMvGpQuVmYVXaWj5QNC+kKsozOXG0o4JdD7y6kjpO2e0saQGNUEAk/4
	FVtOR72dB8nR68U8tyvQsNn0ZPhWOik=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-208-AnzpX2pDPQ6jV_UxMLJ2nw-1; Thu,
 03 Apr 2025 11:04:48 -0400
X-MC-Unique: AnzpX2pDPQ6jV_UxMLJ2nw-1
X-Mimecast-MFC-AGG-ID: AnzpX2pDPQ6jV_UxMLJ2nw_1743692687
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5C3CC1954B3E;
	Thu,  3 Apr 2025 15:04:47 +0000 (UTC)
Received: from f41vm.. (unknown [10.44.32.30])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8F1693001D0E;
	Thu,  3 Apr 2025 15:04:44 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: dmitry.osipenko@collabora.com,
	mst@redhat.com,
	gurchetansingh@chromium.org,
	parav@nvidia.com,
	Sergio Lopez <slp@redhat.com>
Subject: [PATCH] virtio-gpu: support blob alignment information
Date: Tue,  1 Apr 2025 13:42:03 -0400
Message-ID: <20250401174203.161991-1-slp@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4WhUMi3lbx_SQ0YCtDd9RnuqZCxrBuRtXV86FPQW-hE_1743692687
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Allow the device to require certain alignment constrains for blob
resources by extending the device configuration with the field
"blob_alignment" and introducing the VIRTIO_GPU_F_BLOB_ALIGNMENT
feature.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 device-types/gpu/description.tex | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index 4435248..8e5258d 100644
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
 
@@ -67,6 +70,8 @@ \subsubsection{Device configuration fields}
   supported by the device.  Minimum value is 1, maximum value is 16.
 \item[\field{num_capsets}] specifies the maximum number of capability
   sets supported by the device.  The minimum value is zero.
+\item[\field{blob_alignment}] specifies the byte alignment required by
+  the device for resource blobs.
 \end{description}
 
 \subsubsection{Events}
@@ -672,6 +677,9 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
 resource. There is no restriction on the image/buffer view the driver
 has on the blob resource.
 
+If VIRTIO_GPU_F_BLOB_ALIGNMENT is set, \field{size} must be aligned to
+\field{blob_alignment} as defined in the device configuration.
+
 \item[VIRTIO_GPU_CMD_SET_SCANOUT_BLOB] sets scanout parameters for a
    blob resource. Request data is
   \field{struct virtio_gpu_set_scanout_blob}. Response type is
@@ -776,6 +784,10 @@ \subsubsection{Device Operation: controlq (3d)}\label{sec:Device Types / GPU Dev
 };
 \end{lstlisting}
 
+If VIRTIO_GPU_F_BLOB_ALIGNMENT is set, \field{padding} and \field{offset}
+must be aligned to \field{blob_alignment} as defined in the device
+configuration.
+
 \item[VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB] unmaps a
   host-only blob resource from the host visible memory region. Request data
   is \field{struct virtio_gpu_resource_unmap_blob}.  Response type is
-- 
2.49.0

