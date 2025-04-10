Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C799F23D28F
	for <virtio-comment@lists.linux.dev>; Tue, 15 Apr 2025 08:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744707447; cv=none; b=UABuVbXqvpTEo+CyLlJHjq+I7O3wFx/6EPl22yuV1CbdN3sEoXyqWhXmPCr7C2Resg/VS30N1CaFW06Ubbllyd/LHYsi6dnivcAHuxpH2T8JkejQYO3BZubRXVWqtxXdGtCblpUFrqh/Z22eaZCOn0Xzse8cYJUioThp7UzVwfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744707447; c=relaxed/simple;
	bh=43H/SFXKbS/C0QbcW2K91nlRJ0Ysn+E61IMqXaCsKxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=HA40O0WJ/psj0hDNuObwvw2nw0jpAtoPw57QL4LDBrq0TPdhN01M2gi275ypXc9WkdzAmG4kZccWCdSy7ba52W1YgxWkWafxVvq1We0V2skWUzNa42YOP0MHiTd8HS8RdG7tcDhg1sS4CHBTbQij2H8QObzgZS+I0ISJyS3ky5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aYOqMt/m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aYOqMt/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744707442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aBZiDm/CxhKT2qgoFGh4bOQVXfR0MZRsmJ2SYkMrhYc=;
	b=aYOqMt/mzD8fzSkCj9O2+KlntStJeML8EVK3G4i6C5N8z86Nr5ORsuJy8QR48NlAWej5qY
	lHvt8bdd8mwIBFkV9UI80odhxxHo6z3g+iP0RdUEfNZ9g/wCu1Q5syrKYJZ+/1Bxqg+/n0
	/pkllVd6BHt5AUo13FCcq9tCeEeuaoU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-327-laJFzU43OhChkze2mQ7yaw-1; Tue,
 15 Apr 2025 04:57:18 -0400
X-MC-Unique: laJFzU43OhChkze2mQ7yaw-1
X-Mimecast-MFC-AGG-ID: laJFzU43OhChkze2mQ7yaw_1744707433
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C97601800265;
	Tue, 15 Apr 2025 08:57:12 +0000 (UTC)
Received: from f41vm.. (unknown [10.45.226.121])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2B81D1956054;
	Tue, 15 Apr 2025 08:57:09 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: parav@nvidia.com,
	dmitry.osipenko@collabora.com,
	mst@redhat.com,
	dverkamp@chromium.org,
	gurchetansingh@chromium.org,
	Sergio Lopez <slp@redhat.com>
Subject: [PATCH v3] virtio-gpu: support blob alignment information
Date: Thu, 10 Apr 2025 10:34:56 -0400
Message-ID: <20250410143456.122942-1-slp@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uTfQCon_rYu7GZy4dYeAUFgqcnc-tFzuoBbn8KbpvLU_1744707433
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

There's an increasing number of machines supporting multiple page sizes
and, on these machines, the host and a guest can be running with
different pages sizes. In addition to this, there might be physical
devices that require to operate their memory at a specific granularity.

In these cases, if they are to use Shared Memory Regions, the device
and the driver must operate with the same granularity, as otherwise
the former might not be able to fulfill the requests sent by the
latter.

For the GPU device, this has an impact on blob creation and mapping. To
address the problem, allow the device to require certain alignment
constrains for blob resources by extending the device configuration
with the field "blob_alignment" and introducing the
VIRTIO_GPU_F_BLOB_ALIGNMENT feature.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---

v3:
 - Add driver conformance statements (thanks Michael).
 - Avoid using "must" outside conformance statements (thanks Michael).
 - Elaborate use case in commit description (thanks Michael).
 - Drop "padding" field requirements (thanks Daniel).

v2:
 - Clarify blob_alignment valid values (thanks Michael).
 - Rephrase feature negotiation (thanks Michael).

 conformance.tex                  |  2 ++
 device-types/gpu/description.tex | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/conformance.tex b/conformance.tex
index dc00e84..0aeb406 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -22,6 +22,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \ref{sec:Conformance / Driver Conformance / Entropy Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / Traditional Memory Balloon Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / SCSI Host Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / GPU Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / Input Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / Crypto Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / Socket Driver Conformance},
@@ -140,6 +141,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/entropy/driver-conformance.tex}
 \input{device-types/balloon/driver-conformance.tex}
 \input{device-types/scsi/driver-conformance.tex}
+\input{device-types/gpu/driver-conformance.tex}
 \input{device-types/input/driver-conformance.tex}
 \input{device-types/crypto/driver-conformance.tex}
 \input{device-types/vsock/driver-conformance.tex}
diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index 4435248..af54cf1 100644
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
+  required by the device for resource blobs.  The value is a power of
+  two.  Minimum value is 1, maximum value is 4294967296.
 \end{description}
 
 \subsubsection{Events}
@@ -672,6 +678,9 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
 resource. There is no restriction on the image/buffer view the driver
 has on the blob resource.
 
+If VIRTIO_GPU_F_BLOB_ALIGNMENT has been negotiated, \field{size} is aligned
+to \field{blob_alignment} as defined in the device configuration.
+
 \item[VIRTIO_GPU_CMD_SET_SCANOUT_BLOB] sets scanout parameters for a
    blob resource. Request data is
   \field{struct virtio_gpu_set_scanout_blob}. Response type is
@@ -700,6 +709,14 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
 
 \end{description}
 
+\drivernormative{\paragraph}{Device Operation: controlq}{Device Types / GPU Device / Device Operation / Device Operation: controlq}
+
+\begin{itemize}
+\item If VIRTIO_GPU_F_BLOB_ALIGNMENT has been negotiated, in
+VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB requests \field{size} MUST be aligned
+to \field{blob_alignment} as defined in the device configuration.
+\end{itemize}
+
 \subsubsection{Device Operation: controlq (3d)}\label{sec:Device Types / GPU Device / Device Operation / Device Operation: controlq (3d)}
 
 These commands are supported by the device if the VIRTIO_GPU_F_VIRGL
@@ -776,6 +793,9 @@ \subsubsection{Device Operation: controlq (3d)}\label{sec:Device Types / GPU Dev
 };
 \end{lstlisting}
 
+If VIRTIO_GPU_F_BLOB_ALIGNMENT has been negotiated, \field{offset} is
+aligned to \field{blob_alignment} as defined in the device configuration.
+
 \item[VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB] unmaps a
   host-only blob resource from the host visible memory region. Request data
   is \field{struct virtio_gpu_resource_unmap_blob}.  Response type is
@@ -793,6 +813,14 @@ \subsubsection{Device Operation: controlq (3d)}\label{sec:Device Types / GPU Dev
 
 \end{description}
 
+\drivernormative{\paragraph}{Device Operation: controlq (3d)}{Device Types / GPU Device / Device Operation / Device Operation: controlq (3d)}
+
+\begin{itemize}
+\item If VIRTIO_GPU_F_BLOB_ALIGNMENT has been negotiated, in
+VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB requests \field{offset} MUST be aligned to
+\field{blob_alignment} as defined in the device configuration.
+\end{itemize}
+
 \subsubsection{Device Operation: cursorq}\label{sec:Device Types / GPU Device / Device Operation / Device Operation: cursorq}
 
 Both cursorq commands use the same command struct.
-- 
2.49.0

