Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FB2199920
	for <virtio-comment@lists.linux.dev>; Wed, 17 Sep 2025 07:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758093181; cv=none; b=aK1ic1jvb8I6UA0zlcor82c8GorJDF9QV6oFm6wYDnj9WfC2W7LZbCfUNPVKkrVpJSNlp7SDTexbtQxxW1noFEWX9CiEZUtT6tHDNBKGXQesc8grzo54/+Zo1FEiqVn0R+k/W04lf0FABNVGTVV1nvU5UycrQQ0uAEjjvG0yNcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758093181; c=relaxed/simple;
	bh=gS/eYG8BHLfNMtG3ElroOptlGp7nPMSr/QyBY+sRXGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=YCqXCeanFQrdZ+W6a4B6Kz3P728LnU0jSjnfNhdbM6fXVMIi6gYG7y7ZodC3u5aK8+1oAbnyslPbYY9jdZ+5qIZEWV7AN9GIyPyfEFz4+Ce64u4o3N1knau2uibWlcN6+4SCTVDuU20TdwkjF59q3KlDxaTU3NIbNBrnGr/xYUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OkbNkuxL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OkbNkuxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758093178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jKh68E0b06U/nNWRddeEncL89gY952Z8jRyESmr0qw4=;
	b=OkbNkuxLv1W7D6oxP6Kcn7al6n8WoC99p6oSDtl95rg5KxpcsBvEzWaiXZX25MPGzLkC/u
	lUdjK727/8kaTHgq2DE2g8iEss0Xc+nNwkTWBlgLPxC1bCjxvKdqLoHn0ltc62xDSX+zhr
	hlW8nnIJu7ZDAXcejhHo9rEs2rXiqT0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-138-h2-XuoWrM_CAzMpZNZTBIg-1; Wed,
 17 Sep 2025 03:12:54 -0400
X-MC-Unique: h2-XuoWrM_CAzMpZNZTBIg-1
X-Mimecast-MFC-AGG-ID: h2-XuoWrM_CAzMpZNZTBIg_1758093173
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BB46E18002CF;
	Wed, 17 Sep 2025 07:12:53 +0000 (UTC)
Received: from desktop.redhat.com (unknown [10.45.225.112])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5235A18004D8;
	Wed, 17 Sep 2025 07:12:50 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: dverkamp@chromium.org,
	mst@redhat.com,
	stefanha@redhat.com,
	virtio-comment@lists.linux.dev
Cc: Alberto Faria <afaria@redhat.com>
Subject: [PATCH v3] virtio-blk: Add support for "Force Unit Access" writes
Date: Wed, 17 Sep 2025 08:12:49 +0100
Message-ID: <20250917071249.1689417-1-afaria@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AI0IcgUz3QiPlzdFMCo-DHTv1Bke9Ipo_ml3rwAXxFI_1758093173
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add a VIRTIO_BLK_F_REQ_FLAGS feature bit converting the current
`virtio_blk_req::reserved` field into a `flags` bit field, which can be
used to modify the behavior of an entire request.

Define one of the bits as signaling that a VIRTIO_BLK_T_OUT request
should be a "Force Unit Access" (FUA) write, i.e., should become stable
once the request completes. FUA writes enable better performance
compared to the alternative of waiting for a write to complete and
subsequently submitting a flush.

Leave the remaining 31 bits reserved for now.

Also add a VIRTIO_BLK_F_REQ_FLAGS_FUA feature bit indicating device
support for the aforementioned FUA bit.

This approach allows for future expansion to other request-level flags
that may each be applicable to all or just a subset of request types.
The VIRTIO_BLK_F_REQ_FLAGS feature bit ensures compatibility with legacy
devices/drivers that interpret the previously-`reserved` field as a
priority indicator.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---

QEMU + kernel patchsets and some performance numbers to follow.

v3:
- Changed to a more future-proof approach somewhat similar to what was
  suggested by Stefan.
- Included a brief rationale for the introduction of FUA write requests,
  as suggested by Michael.

v2:
- Redefine VIRTIO_BLK_T_OUT_FUA to 27 since 15 is already in use.
- Clarify that the cache mode has no impact on VIRTIO_BLK_T_OUT_FUA
  semantics.
- Allow drivers to negotiate VIRTIO_BLK_F_OUT_FUA even if they are
  incapable of sending VIRTIO_BLK_T_OUT_FUA commands.

 device-types/blk/description.tex | 50 +++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
index 2712ada..6f80451 100644
--- a/device-types/blk/description.tex
+++ b/device-types/blk/description.tex
@@ -66,6 +66,13 @@ \subsection{Feature bits}\label{sec:Device Types / Block Device / Feature bits}
 	(ZNS). For brevity, these standard documents are referred as "ZBD standards"
 	from this point on in the text.
 
+\item[VIRTIO_BLK_F_REQ_FLAGS (18)] Device can interpret the \field{flags} field
+    in the \field{virtio_blk_req} structure.
+
+\item[VIRTIO_BLK_F_REQ_FLAGS_FUA (19)] Device supports the Force Unit Access
+    (FUA) flag in the \field{flags} field of the \field{virtio_blk_req}
+    structure for VIRTIO_BLK_T_OUT requests.
+
 \end{description}
 
 \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Block Device / Feature bits / Legacy Interface: Feature bits}
@@ -402,6 +409,9 @@ \subsection{Device Initialization}\label{sec:Device Types / Block Device / Devic
 \item the device MUST initialize padding bytes \field{unused2} to 0.
 \end{itemize}
 
+If VIRTIO_BLK_F_REQ_FLAGS is not negotiated, then VIRTIO_BLK_F_REQ_FLAGS_FUA
+also MUST NOT be negotiated.
+
 \subsubsection{Legacy Interface: Device Initialization}\label{sec:Device Types / Block Device / Device Initialization / Legacy Interface: Device Initialization}
 
 Because legacy devices do not have FEATURES_OK, transitional devices
@@ -434,7 +444,10 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 \begin{lstlisting}
 struct virtio_blk_req {
         le32 type;
-        le32 reserved;
+        struct {
+                le32 fua:1;
+                le32 reserved:31;
+        } flags;
         le64 sector;
         u8 data[];
         u8 status;
@@ -459,6 +472,9 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 #define VIRTIO_BLK_T_SECURE_ERASE   14
 \end{lstlisting}
 
+The \field{flags} field is entirely reserved unless VIRTIO_BLK_F_REQ_FLAGS is
+negotiated.
+
 The \field{sector} number indicates the offset (multiplied by 512) where
 the read or write is to occur. This field is unused and set to 0 for
 commands other than read, write and some zone operations.
@@ -873,6 +889,14 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 
 A driver SHOULD accept the VIRTIO_BLK_F_RO feature if offered.
 
+If VIRTIO_BLK_F_REQ_FLAGS is negotiated:
+
+\begin{itemize}
+\item A driver MUST NOT set the \field{fua} bit in \field{flags} unless the
+    VIRTIO_BLK_F_REQ_FLAGS_FUA feature is negotiated and the request type is
+    VIRTIO_BLK_T_OUT.
+\end{itemize}
+
 A driver MUST set \field{sector} to 0 for a VIRTIO_BLK_T_FLUSH request.
 A driver SHOULD NOT include any data in a VIRTIO_BLK_T_FLUSH request.
 
@@ -962,9 +986,15 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 operation of the device. When this happens, the device SHOULD trigger a
 configuration change notification.
 
-A device MUST set the \field{status} byte to VIRTIO_BLK_S_IOERR
-for a write request if the VIRTIO_BLK_F_RO feature if offered, and MUST NOT
-write any data.
+A device MUST set the \field{status} byte to VIRTIO_BLK_S_IOERR for a write
+request and MUST NOT write any data if any of the following conditions is true:
+
+\begin{itemize}
+\item the VIRTIO_BLK_F_RO feature if offered.
+
+\item the VIRTIO_BLK_F_REQ_FLAGS feature was negotiated and the \field{fua} bit
+    in \field{flags} is set but VIRTIO_BLK_F_REQ_FLAGS_FUA was not negotiated.
+\end{itemize}
 
 The device MUST set the \field{status} byte to VIRTIO_BLK_S_UNSUPP for
 discard, secure erase and write zeroes commands if any unknown flag is set.
@@ -1000,14 +1030,20 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
   \field{writeback} field in configuration space was 0 \textbf{all the time between
   the submission of the write and its completion};
 
-\item\label{item:flush3} a VIRTIO_BLK_T_FLUSH request is sent \textbf{after the write is
+\item\label{item:flush3} the VIRTIO_BLK_F_REQ_FLAGS_FUA feature was negotiated
+  and the \field{fua} bit in \field{flags} was set in the write request
+  (regardless of whether the VIRTIO_BLK_F_FLUSH or VIRTIO_BLK_F_CONFIG_WCE
+  features were negotiated, and regardless of the current cache mode as
+  expressed by the value of the \field{writeback} field in configuration space).
+
+\item\label{item:flush4} a VIRTIO_BLK_T_FLUSH request is sent \textbf{after the write is
   completed} and is completed itself.
 \end{enumerate}
 
 If the device is backed by persistent storage, the device MUST ensure that
 stable writes are committed to it, before reporting completion of the write
-(cases~\ref{item:flush1} and~\ref{item:flush2}) or the flush
-(case~\ref{item:flush3}).  Failure to do so can cause data loss
+(cases~\ref{item:flush1}, \ref{item:flush2} and~\ref{item:flush3}) or the flush
+(case~\ref{item:flush4}).  Failure to do so can cause data loss
 in case of a crash.
 
 If the driver changes \field{writeback} between the submission of the write
-- 
2.51.0

