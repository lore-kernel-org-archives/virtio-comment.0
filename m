Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E70DE56A
	for <virtio-comment@lists.linux.dev>; Wed, 12 Nov 2025 05:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762926691; cv=none; b=t7OvSqadnIQutTd8AglDVDs1vYeu9cSEp/Z3BreTwwrE7CuIK+CYL/BsnwCQQB06EuOQDULzxhNZ9MOV+ah4UqLAiQQYo11jCNy4rX+WQbuiqn35Zgo80YAYzuoWYfndr1tqw46Dbg3abZ8VQQvWOgNjvZlD/wrHNwm+OFlEQtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762926691; c=relaxed/simple;
	bh=s0LYZoiAF71ACFn/t5/7aJ+2bXdF9GaE+msJVHUjNRo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=kP48DMOL9z5NjPKytRq4Zj0+ZJKsGRHUzOYJ+xtXa0Oh4qOm8qRlu9B4ILiZyG3nzaBTek1EPA/NX4REf37iFxd1D8qTc4mBpWnv+imIZIV5IOqZYGRg6a6DMydJBiwZwTow/EAzuDrY5i4MRGzXtOY6z75ZJC+luWMbIoyhBEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=csjNEHbm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="csjNEHbm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762926688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=emIqLrIE71c4iH/Ob/5xjbe2HD13AUzA+TtD7309qsI=;
	b=csjNEHbmPX+32vz+TOYQlnFjkZAlL2iqZs3w8IzflQWDiEmL5r/4eB3fhsZHQMJvRCqSbE
	L1gG8+yer6SeAulXmird+fgwhFLvt4lOEDuYOpLOEp2x4XGWIZpxeaJ7kSO+WilKy9EGRs
	NcJaN8X86Rs1TEIPRgK/tTiy2plc/+c=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-470-_A345R_TN8aoz5tsOm9qsg-1; Wed,
 12 Nov 2025 00:51:26 -0500
X-MC-Unique: _A345R_TN8aoz5tsOm9qsg-1
X-Mimecast-MFC-AGG-ID: _A345R_TN8aoz5tsOm9qsg_1762926686
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A6146195608D;
	Wed, 12 Nov 2025 05:51:25 +0000 (UTC)
Received: from lg.redhat.com (unknown [10.44.32.45])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A2DDE18004D8;
	Wed, 12 Nov 2025 05:51:17 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: virtio-comment@lists.linux.dev,
	mst@redhat.com,
	stefanha@redhat.com,
	dverkamp@chromium.org
Cc: Alberto Faria <afaria@redhat.com>
Subject: [PATCH v4] virtio-blk: Add support for "Force Unit Access" writes
Date: Wed, 12 Nov 2025 05:51:13 +0000
Message-ID: <20251112055113.62207-1-afaria@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1TtfN5XoGck3ZePi2bNgiUViVV3EHf3j0KhL_h_u_aY_1762926686
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add a VIRTIO_BLK_F_REQ_FLAGS feature bit converting the current
`virtio_blk_req::reserved` field into a `flags` bit field, which can be
used to modify the behavior of an entire request. The meaning of each
bit depends on the request type.

Define a single VIRTIO_BLK_REQ_FLAG_OUT_FUA bit as signaling that a
VIRTIO_BLK_T_OUT request should be a "Force Unit Access" (FUA) write,
i.e., should become stable once the request completes. FUA writes enable
better performance compared to the alternative of waiting for a write to
complete and subsequently submitting a flush.

Also add a VIRTIO_BLK_F_REQ_FLAGS_OUT_FUA feature bit indicating device
support for the aforementioned FUA bit.

This approach allows for future expansion to other request-level flags
and allows the same flag bit to be used for different purposes on
different request types. The VIRTIO_BLK_F_REQ_FLAGS feature bit ensures
compatibility with legacy devices/drivers that interpret the
previously-`reserved` field as a priority indicator.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---

v4:
- Have the semantics of each request flag depend on the request type, as
  suggested by Stefan.
- Some other smaller rewordings suggested by Stefan.

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

 device-types/blk/description.tex | 43 +++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
index 2712ada..3b3a4e7 100644
--- a/device-types/blk/description.tex
+++ b/device-types/blk/description.tex
@@ -66,6 +66,13 @@ \subsection{Feature bits}\label{sec:Device Types / Block Device / Feature bits}
 	(ZNS). For brevity, these standard documents are referred as "ZBD standards"
 	from this point on in the text.
 
+\item[VIRTIO_BLK_F_REQ_FLAGS (18)] Device can interpret the \field{flags}
+    bitfield in the \field{virtio_blk_req} structure.
+
+\item[VIRTIO_BLK_F_REQ_FLAGS_OUT_FUA (19)] Device supports the
+    VIRTIO_BLK_REQ_FLAG_OUT_FUA flag in the \field{flags} bitfield of the
+    \field{virtio_blk_req} structure for VIRTIO_BLK_T_OUT requests.
+
 \end{description}
 
 \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Block Device / Feature bits / Legacy Interface: Feature bits}
@@ -317,6 +324,9 @@ \subsection{Device Initialization}\label{sec:Device Types / Block Device / Devic
     driver SHOULD ignore all other fields in \field{zoned}.
 \end{itemize}
 
+The driver MUST NOT negotiate VIRTIO_BLK_F_REQ_FLAGS_OUT_FUA without
+VIRTIO_BLK_F_REQ_FLAGS.
+
 \devicenormative{\subsubsection}{Device Initialization}{Device Types / Block Device / Device Initialization}
 
 Devices SHOULD always offer VIRTIO_BLK_F_FLUSH, and MUST offer it
@@ -402,6 +412,9 @@ \subsection{Device Initialization}\label{sec:Device Types / Block Device / Devic
 \item the device MUST initialize padding bytes \field{unused2} to 0.
 \end{itemize}
 
+The device MUST NOT acknowledge FEATURES_OK if the driver sets
+VIRTIO_BLK_F_REQ_FLAGS_OUT_FUA without VIRTIO_BLK_F_REQ_FLAGS.
+
 \subsubsection{Legacy Interface: Device Initialization}\label{sec:Device Types / Block Device / Device Initialization / Legacy Interface: Device Initialization}
 
 Because legacy devices do not have FEATURES_OK, transitional devices
@@ -434,7 +447,7 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 \begin{lstlisting}
 struct virtio_blk_req {
         le32 type;
-        le32 reserved;
+        le32 flags;
         le64 sector;
         u8 data[];
         u8 status;
@@ -459,6 +472,16 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 #define VIRTIO_BLK_T_SECURE_ERASE   14
 \end{lstlisting}
 
+The \field{flags} bitfield is ignored by the device unless
+VIRTIO_BLK_F_REQ_FLAGS is negotiated, in which case each bit's meaning depends
+on the request type. The following flags are currently defined (the numeric
+value is the bit index in the \field{flags} bitfield):
+
+\begin{description}
+\item[VIRTIO_BLK_REQ_FLAG_OUT_FUA (0) for VIRTIO_BLK_T_OUT requests] Force Unit
+    Access (FUA) flag.
+\end{description}
+
 The \field{sector} number indicates the offset (multiplied by 512) where
 the read or write is to occur. This field is unused and set to 0 for
 commands other than read, write and some zone operations.
@@ -873,6 +896,11 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 
 A driver SHOULD accept the VIRTIO_BLK_F_RO feature if offered.
 
+If VIRTIO_BLK_F_REQ_FLAGS is negotiated, a driver MUST NOT set a bit in
+\field{flags} (e.g., VIRTIO_BLK_REQ_FLAG_OUT_FUA) unless the corresponding
+feature (e.g., VIRTIO_BLK_F_REQ_FLAGS_OUT_FUA) for the request type in question
+(e.g., VIRTIO_BLK_T_OUT) is negotiated.
+
 A driver MUST set \field{sector} to 0 for a VIRTIO_BLK_T_FLUSH request.
 A driver SHOULD NOT include any data in a VIRTIO_BLK_T_FLUSH request.
 
@@ -1000,14 +1028,21 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
   \field{writeback} field in configuration space was 0 \textbf{all the time between
   the submission of the write and its completion};
 
-\item\label{item:flush3} a VIRTIO_BLK_T_FLUSH request is sent \textbf{after the write is
+\item\label{item:flush3} the VIRTIO_BLK_F_REQ_FLAGS_OUT_FUA feature was
+  negotiated and the VIRTIO_BLK_REQ_FLAG_OUT_FUA bit in \field{flags} was set in
+  the write request (regardless of whether the VIRTIO_BLK_F_FLUSH or
+  VIRTIO_BLK_F_CONFIG_WCE features were negotiated, and regardless of the
+  current cache mode as expressed by the value of the \field{writeback} field in
+  configuration space).
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
2.51.1

