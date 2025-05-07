Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B02A28BAA2
	for <virtio-comment@lists.linux.dev>; Wed,  7 May 2025 15:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746631570; cv=none; b=pqguvpV7pgbCe98YQT/LpX3sDDe2aAkTJg7sEg8xn++IbIpG4uqXDqfNX45BkLAzY9nwfGcCN8SoawaJz6BEvjfL1MsDqVFmTFQ/4p6VNQ9NIhcHIWo76d8NjNQWoY8WpdaFbq2bbrvE7gs3RhOjGjkX2z+k8k9z/LxETZg133o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746631570; c=relaxed/simple;
	bh=9wGVEkL/ujccV3KCoaBTO5QLO8f8b1ui41dSzVoVXj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=ii1ZyETwhsGZixDR/qYCZVsN3H0fVxMDQFljKbispUcumNSY+Kcu+h0ouZZVinDTolTIlRkom27SI32ua/6HXbUM05xoJ6kJY+w9Xdxu7b9TbP0/3lLh0K3fTanwH6F79FzslfokBDhVN3LzzbUgYxD+FZurFwIDNyDq4/OKxY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H24DkXiY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H24DkXiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746631567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rPVmENkE9jC003vwWeMDd3JexGpTPdBlumucS0w6UOE=;
	b=H24DkXiYjEbE3W78J79IXdLybZVNVO7i5SupL5glbugtqwjaTgW9cX8WjlZbSG4hnbqUqJ
	IbbYuWqVpOl1SU7n+Y5AM+Ve9f9rxOS0UBAWahg5sGy4Q1l8AL4K1Q2S+GvUkYHJ8TUYGl
	l2T4DYRign5mSB9waCEc1MGrBV5k3JI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-368-HWDUxSTANaOgnOVWdE_PGg-1; Wed,
 07 May 2025 11:26:06 -0400
X-MC-Unique: HWDUxSTANaOgnOVWdE_PGg-1
X-Mimecast-MFC-AGG-ID: HWDUxSTANaOgnOVWdE_PGg_1746631565
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 66EF918004AD
	for <virtio-comment@lists.linux.dev>; Wed,  7 May 2025 15:26:05 +0000 (UTC)
Received: from desktop.redhat.com (unknown [10.45.224.21])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2F1E819560B3;
	Wed,  7 May 2025 15:26:03 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Alberto Faria <afaria@redhat.com>
Subject: [PATCH] virtio-blk: Add a VIRTIO_BLK_T_OUT_FUA request type
Date: Wed,  7 May 2025 16:26:02 +0100
Message-ID: <20250507152602.3993258-1-afaria@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SP5l2Rqa_q0QgtCTllOg7J715B-r97PS6cg2bk6g7WQ_1746631565
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This is a variant of the VIRTIO_BLK_T_OUT request type that further
ensures the write becomes stable once the request completes, commonly
known as a Force Unit Access (FUA) request.

Also add a VIRTIO_BLK_F_OUT_FUA feature bit signaling support for this
request type.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---

I'll be sending out implementation RFCs to linux-block and qemu-devel
soon and will link them from here.

 device-types/blk/description.tex | 114 +++++++++++++++++--------------
 1 file changed, 64 insertions(+), 50 deletions(-)

diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
index 2712ada..4d2453a 100644
--- a/device-types/blk/description.tex
+++ b/device-types/blk/description.tex
@@ -66,6 +66,8 @@ \subsection{Feature bits}\label{sec:Device Types / Block Device / Feature bits}
 	(ZNS). For brevity, these standard documents are referred as "ZBD standards"
 	from this point on in the text.
 
+\item[VIRTIO_BLK_F_OUT_FUA (18)] Force Unit Access (FUA) command support.
+
 \end{description}
 
 \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Block Device / Feature bits / Legacy Interface: Feature bits}
@@ -317,6 +319,9 @@ \subsection{Device Initialization}\label{sec:Device Types / Block Device / Devic
     driver SHOULD ignore all other fields in \field{zoned}.
 \end{itemize}
 
+Drivers SHOULD NOT negotiate VIRTIO_BLK_F_OUT_FUA if they are incapable of
+sending VIRTIO_BLK_T_OUT_FUA commands.
+
 \devicenormative{\subsubsection}{Device Initialization}{Device Types / Block Device / Device Initialization}
 
 Devices SHOULD always offer VIRTIO_BLK_F_FLUSH, and MUST offer it
@@ -395,9 +400,9 @@ \subsection{Device Initialization}\label{sec:Device Types / Block Device / Devic
     VIRTIO_BLK_T_ZONE_APPEND requests.
 
 \item the \field{write_granularity} field of \field{zoned} MUST be set by the
-    device to the offset and size alignment constraint for VIRTIO_BLK_T_OUT
-    and VIRTIO_BLK_T_ZONE_APPEND requests issued to a sequential zone of the
-    device.
+    device to the offset and size alignment constraint for VIRTIO_BLK_T_OUT,
+    VIRTIO_BLK_T_ZONE_APPEND, and VIRTIO_BLK_T_OUT_FUA requests issued to a
+    sequential zone of the device.
 
 \item the device MUST initialize padding bytes \field{unused2} to 0.
 \end{itemize}
@@ -445,8 +450,9 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 (VIRTIO_BLK_T_OUT), a discard (VIRTIO_BLK_T_DISCARD), a write zeroes
 (VIRTIO_BLK_T_WRITE_ZEROES), a flush (VIRTIO_BLK_T_FLUSH), a get device ID
 string command (VIRTIO_BLK_T_GET_ID), a secure erase
-(VIRTIO_BLK_T_SECURE_ERASE), or a get device lifetime command
-(VIRTIO_BLK_T_GET_LIFETIME).
+(VIRTIO_BLK_T_SECURE_ERASE), a get device lifetime command
+(VIRTIO_BLK_T_GET_LIFETIME), or a Force Unit Access write
+(VIRTIO_BLK_T_OUT_FUA).
 
 \begin{lstlisting}
 #define VIRTIO_BLK_T_IN           0
@@ -457,6 +463,7 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 #define VIRTIO_BLK_T_DISCARD      11
 #define VIRTIO_BLK_T_WRITE_ZEROES 13
 #define VIRTIO_BLK_T_SECURE_ERASE   14
+#define VIRTIO_BLK_T_OUT_FUA      15
 \end{lstlisting}
 
 The \field{sector} number indicates the offset (multiplied by 512) where
@@ -464,9 +471,9 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 commands other than read, write and some zone operations.
 
 VIRTIO_BLK_T_IN requests populate \field{data} with the contents of sectors
-read from the block device (in multiples of 512 bytes).  VIRTIO_BLK_T_OUT
-requests write the contents of \field{data} to the block device (in multiples
-of 512 bytes).
+read from the block device (in multiples of 512 bytes).  VIRTIO_BLK_T_OUT and
+VIRTIO_BLK_T_OUT_FUA requests write the contents of \field{data} to the block
+device (in multiples of 512 bytes).
 
 The \field{data} used for discard, secure erase or write zeroes commands
 consists of one or more segments. The maximum number of segments is
@@ -566,11 +573,12 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 
 Requests of type VIRTIO_BLK_T_OUT, VIRTIO_BLK_T_ZONE_OPEN,
 VIRTIO_BLK_T_ZONE_CLOSE, VIRTIO_BLK_T_ZONE_FINISH, VIRTIO_BLK_T_ZONE_APPEND,
-VIRTIO_BLK_T_ZONE_RESET or VIRTIO_BLK_T_ZONE_RESET_ALL may be completed by the
-device with VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR or VIRTIO_BLK_S_UNSUPP
-\field{status}, or, additionally, with  VIRTIO_BLK_S_ZONE_INVALID_CMD,
-VIRTIO_BLK_S_ZONE_UNALIGNED_WP, VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or
-VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE ZBD-specific status codes.
+VIRTIO_BLK_T_ZONE_RESET, VIRTIO_BLK_T_ZONE_RESET_ALL or VIRTIO_BLK_T_OUT_FUA may
+be completed by the device with VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR or
+VIRTIO_BLK_S_UNSUPP \field{status}, or, additionally, with
+VIRTIO_BLK_S_ZONE_INVALID_CMD, VIRTIO_BLK_S_ZONE_UNALIGNED_WP,
+VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE
+ZBD-specific status codes.
 
 Besides the request status, VIRTIO_BLK_T_ZONE_APPEND requests return the
 starting sector of the appended data back to the driver. For this reason,
@@ -672,8 +680,8 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 
 Zones with VIRTIO_BLK_ZT_SWP can be read randomly and should be written
 sequentially, similarly to SWR zones. However, SWP zones can accept random write
-operations, that is, VIRTIO_BLK_T_OUT requests with a start sector different
-from the zone write pointer position.
+operations, that is, VIRTIO_BLK_T_OUT and VIRTIO_BLK_T_OUT_FUA requests with a
+start sector different from the zone write pointer position.
 
 The field \field{z_state} of \field{virtio_blk_zone_descriptor} indicates the
 state of the device zone.
@@ -731,8 +739,9 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 equal to the sector address of the zone. In this state, the entire capacity of
 the zone is available for writing. A zone can transition from this state to
 \begin{itemize}
-\item VIRTIO_BLK_ZS_IOPEN when a successful VIRTIO_BLK_T_OUT request or
-    VIRTIO_BLK_T_ZONE_APPEND with a non-zero data size is received for the zone.
+\item VIRTIO_BLK_ZS_IOPEN when a successful VIRTIO_BLK_T_OUT or
+    VIRTIO_BLK_T_OUT_FUA request or VIRTIO_BLK_T_ZONE_APPEND with a non-zero
+    data size is received for the zone.
 
 \item VIRTIO_BLK_ZS_EOPEN when a successful VIRTIO_BLK_T_ZONE_OPEN request is
     received for the zone
@@ -763,9 +772,9 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 \item VIRTIO_BLK_ZS_FULL when a successful VIRTIO_BLK_T_ZONE_FINISH request is
     received for the zone.
 
-\item VIRTIO_BLK_ZS_FULL when a successful VIRTIO_BLK_T_OUT or
-    VIRTIO_BLK_T_ZONE_APPEND request that causes the zone to reach its writable
-    capacity is received for the zone.
+\item VIRTIO_BLK_ZS_FULL when a successful VIRTIO_BLK_T_OUT,
+    VIRTIO_BLK_T_ZONE_APPEND, or VIRTIO_BLK_T_OUT_FUA request that causes the
+    zone to reach its writable capacity is received for the zone.
 \end{itemize}
 
 Zones in the VIRTIO_BLK_ZS_EOPEN (Explicitly Open) state transition from
@@ -788,9 +797,9 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 \item VIRTIO_BLK_ZS_FULL when a successful VIRTIO_BLK_T_ZONE_FINISH request is
     received for the zone,
 
-\item VIRTIO_BLK_ZS_FULL when a successful VIRTIO_BLK_T_OUT or
-    VIRTIO_BLK_T_ZONE_APPEND request that causes the zone to reach its writable
-    capacity is received for the zone.
+\item VIRTIO_BLK_ZS_FULL when a successful VIRTIO_BLK_T_OUT,
+    VIRTIO_BLK_T_ZONE_APPEND, or VIRTIO_BLK_T_OUT_FUA request that causes the
+    zone to reach its writable capacity is received for the zone.
 \end{itemize}
 
 When a VIRTIO_BLK_T_ZONE_EOPEN request is issued to an Explicitly Open zone, the
@@ -806,8 +815,9 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 \item VIRTIO_BLK_ZS_EMPTY when a successful VIRTIO_BLK_T_ZONE_RESET_ALL request
     is received by the device,
 
-\item VIRTIO_BLK_ZS_IOPEN when a successful VIRTIO_BLK_T_OUT request or
-    VIRTIO_BLK_T_ZONE_APPEND with a non-zero data size is received for the zone.
+\item VIRTIO_BLK_ZS_IOPEN when a successful VIRTIO_BLK_T_OUT or
+    VIRTIO_BLK_T_OUT_FUA request or VIRTIO_BLK_T_ZONE_APPEND with a non-zero
+    data size is received for the zone.
 
 \item VIRTIO_BLK_ZS_EOPEN when a successful VIRTIO_BLK_T_ZONE_OPEN request is
     received for the zone,
@@ -876,8 +886,8 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 A driver MUST set \field{sector} to 0 for a VIRTIO_BLK_T_FLUSH request.
 A driver SHOULD NOT include any data in a VIRTIO_BLK_T_FLUSH request.
 
-The length of \field{data} MUST be a multiple of 512 bytes for VIRTIO_BLK_T_IN
-and VIRTIO_BLK_T_OUT requests.
+The length of \field{data} MUST be a multiple of 512 bytes for VIRTIO_BLK_T_IN,
+VIRTIO_BLK_T_OUT, and VIRTIO_BLK_T_OUT_FUA requests.
 
 The length of \field{data} MUST be a multiple of the size of struct
 virtio_blk_discard_write_zeroes for VIRTIO_BLK_T_DISCARD,
@@ -939,8 +949,8 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 MAY read the starting sector location of the written data from the request
 field \field{append_sector}.
 
-All VIRTIO_BLK_T_OUT requests issued by the driver to sequential zones and
-VIRTIO_BLK_T_ZONE_APPEND requests MUST have:
+All VIRTIO_BLK_T_OUT and VIRTIO_BLK_T_OUT_FUA requests issued by the driver to
+sequential zones and VIRTIO_BLK_T_ZONE_APPEND requests MUST have:
 
 \begin{enumerate}
 \item the data size that is a multiple of the number of bytes reported
@@ -1002,11 +1012,14 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 
 \item\label{item:flush3} a VIRTIO_BLK_T_FLUSH request is sent \textbf{after the write is
   completed} and is completed itself.
+
+\item\label{item:flush4} the write was performed using a VIRTIO_BLK_T_OUT_FUA
+  request.
 \end{enumerate}
 
 If the device is backed by persistent storage, the device MUST ensure that
 stable writes are committed to it, before reporting completion of the write
-(cases~\ref{item:flush1} and~\ref{item:flush2}) or the flush
+(cases~\ref{item:flush1}, \ref{item:flush2}, and~\ref{item:flush4}) or the flush
 (case~\ref{item:flush3}).  Failure to do so can cause data loss
 in case of a crash.
 
@@ -1098,22 +1111,22 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 sequential device zones in VIRTIO_BLK_ZS_IOPEN, VIRTIO_BLK_ZS_EOPEN,
 VIRTIO_BLK_ZS_CLOSED and VIRTIO_BLK_ZS_FULL state to VIRTIO_BLK_ZS_EMPTY state.
 
-Upon receiving a VIRTIO_BLK_T_ZONE_APPEND request or a VIRTIO_BLK_T_OUT
-request issued to a SWR zone in VIRTIO_BLK_ZS_EMPTY or VIRTIO_BLK_ZS_CLOSED
-state, the device attempts to perform the transition of the zone to
-VIRTIO_BLK_ZS_IOPEN state before writing data. This transition may fail due to
-insufficient open and/or active zone resources available on the device. In this
-case, the request MUST be completed with VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or
-VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE value in the \field{status}.
+Upon receiving a VIRTIO_BLK_T_ZONE_APPEND request or a VIRTIO_BLK_T_OUT or
+VIRTIO_BLK_T_OUT_FUA request issued to a SWR zone in VIRTIO_BLK_ZS_EMPTY or
+VIRTIO_BLK_ZS_CLOSED state, the device attempts to perform the transition of the
+zone to VIRTIO_BLK_ZS_IOPEN state before writing data. This transition may fail
+due to insufficient open and/or active zone resources available on the device.
+In this case, the request MUST be completed with VIRTIO_BLK_S_ZONE_OPEN_RESOURCE
+or VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE value in the \field{status}.
 
 If the \field{sector} field in the VIRTIO_BLK_T_ZONE_APPEND request does not
 specify the lowest sector for a zone, then the request SHALL be completed with
 VIRTIO_BLK_S_ZONE_INVALID_CMD value in \field{status}.
 
-A VIRTIO_BLK_T_ZONE_APPEND request or a VIRTIO_BLK_T_OUT request that has the
-data range that exceeds the remaining writable capacity for the zone, then the
-request SHALL be completed with VIRTIO_BLK_S_ZONE_INVALID_CMD value in
-\field{status}.
+A VIRTIO_BLK_T_ZONE_APPEND request or a VIRTIO_BLK_T_OUT or VIRTIO_BLK_T_OUT_FUA
+request that has the data range that exceeds the remaining writable capacity for
+the zone, then the request SHALL be completed with VIRTIO_BLK_S_ZONE_INVALID_CMD
+value in \field{status}.
 
 If a request of the type VIRTIO_BLK_T_ZONE_APPEND is completed with
 VIRTIO_BLK_S_OK status, the field \field{append_sector} in
@@ -1136,22 +1149,23 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
     VIRTIO_BLK_S_ZONE_INVALID_CMD \field{status}.
 \end{itemize}
 
-If a VIRTIO_BLK_T_ZONE_APPEND request, a VIRTIO_BLK_T_IN request or a
-VIRTIO_BLK_T_OUT request issued to a SWR zone has the range that has sectors in
-more than one zone, then the request SHALL be completed with
+If a VIRTIO_BLK_T_ZONE_APPEND, VIRTIO_BLK_T_IN, VIRTIO_BLK_T_OUT, or
+VIRTIO_BLK_T_OUT_FUA request issued to a SWR zone has the range that has sectors
+in more than one zone, then the request SHALL be completed with
 VIRTIO_BLK_S_ZONE_INVALID_CMD value in the field \field{status}.
 
-A VIRTIO_BLK_T_OUT request that has the \field{sector} value that is not aligned
-with the write pointer for the zone, then the request SHALL be completed with
-VIRTIO_BLK_S_ZONE_UNALIGNED_WP value in the field \field{status}.
+A VIRTIO_BLK_T_OUT or VIRTIO_BLK_T_OUT_FUA request that has the \field{sector}
+value that is not aligned with the write pointer for the zone, then the request
+SHALL be completed with VIRTIO_BLK_S_ZONE_UNALIGNED_WP value in the field
+\field{status}.
 
 In order to avoid resource-related errors while opening zones implicitly, the
 device MAY automatically transition zones in VIRTIO_BLK_ZS_IOPEN state to
 VIRTIO_BLK_ZS_CLOSED state.
 
-All VIRTIO_BLK_T_OUT requests or VIRTIO_BLK_T_ZONE_APPEND requests issued
-to a zone in the VIRTIO_BLK_ZS_RDONLY state SHALL be completed with
-VIRTIO_BLK_S_ZONE_INVALID_CMD \field{status}.
+All VIRTIO_BLK_T_OUT, VIRTIO_BLK_T_OUT_FUA, and VIRTIO_BLK_T_ZONE_APPEND
+requests issued to a zone in the VIRTIO_BLK_ZS_RDONLY state SHALL be completed
+with VIRTIO_BLK_S_ZONE_INVALID_CMD \field{status}.
 
 All requests issued to a zone in the VIRTIO_BLK_ZS_OFFLINE state SHALL be
 completed with VIRTIO_BLK_S_ZONE_INVALID_CMD value in the field \field{status}.
-- 
2.49.0

