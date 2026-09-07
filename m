Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822984EC666
	for <virtio-comment@lists.linux.dev>; Mon,  7 Sep 2026 14:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789736; cv=none; b=LMfSzPPOOWiyiBygXNgMDFhExIr9lSP3l0HgIpi2WSwm2+e5IP0ndWdujPcKI4uyboEEDeS9Xd2Dn9e6tLSuH5jpwAVXbBMOS1iPzwGlJ5ru4Bv+SYa9dfka2fF+z3Tpf/CoH+/P8NZbltH5FRdpBcSjmKpp+QcbePvf2rEVR0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789736; c=relaxed/simple;
	bh=I4qXJNXp4MCE3aapz/2+qyfq1DTyLsyVZQo//xeB5FU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=CYjoJQB39WKJq4oZycLYXYMwSi8X5ZrZM1u9BT6tSdQmwhVHPgQ9ZN50vBzlIdTVeYamSau/RKBlWBp/lSyhSfVwif6P3mw2t9F3Q6lsrA+8qdVEBPiGpwNC7t5SAIglGzLBguaqUhK/fac/ZSkU7t+mgOcij+vtCK0XAUKW1n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fSoseO+B; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fSoseO+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788789733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FvgRx0/fPr7fmtrOEYA7SfJygF2b6wO4AnVX5ZSyUvs=;
	b=fSoseO+BjKIUsKbd7o17JERpknp5wpd1hlhkyfChi3dK5H8B5m39GsAx5WwnvJ+538Ol6w
	p6F2ZqOxTDJg1hJHCxqrBqqb2UPi4SSno+HoD7ZfVYEeRc9R09ja1nnfkz6tqvqDV2gBtD
	d2pLXPOcDITr/5lqgJ9iNC3yRoiCwnk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-544-H_sUSeJQMtqw9Y6VoKGZRQ-1; Mon,
 07 Sep 2026 10:02:12 -0400
X-MC-Unique: H_sUSeJQMtqw9Y6VoKGZRQ-1
X-Mimecast-MFC-AGG-ID: H_sUSeJQMtqw9Y6VoKGZRQ_1788789731
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2E9FB195411B
	for <virtio-comment@lists.linux.dev>; Mon,  7 Sep 2026 14:02:11 +0000 (UTC)
Received: from cash.home.annexia.org (unknown [10.44.32.28])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0820B1956049;
	Mon,  7 Sep 2026 14:02:09 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH v2] device-types/blk/description.tex: Allow longer device IDs to be returned
Date: Mon,  7 Sep 2026 15:02:08 +0100
Message-ID: <20260907140208.626488-1-rjones@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h4ygBCiIjFFfrmbLUhVvt8CDBi4VqHZgzubGLj0uBbY_1788789731
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

SCSI-based paravirtualized block devices including virtio-scsi and
VMware's pvscsi allow longer device IDs.  This presents an issue when
we change the backing of a disk from one type to another, eg from
pvscsi to virtio-blk, or virtio-scsi to virtio-blk.  The longer device
ID has to be truncated to 20 bytes.  This results in guest visible
changes, notably /dev/disk/by-id/ paths are different, so any
mountpoints or configuration files that use these paths will break.

Therefore extend virtio-blk to allow longer device IDs.  I chose 247
bytes (ASCII chars) as the new limit since SCSI serials can in theory
be this long.  Real serials will be much shorter than this; the aim is
to allow UUIDs to be preserved which would use 32 or 36 ASCII chars.

A new feature bit is introduced to indicate that long device IDs are
supported.

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 device-types/blk/description.tex | 37 ++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
index 3b3a4e7..72afcd8 100644
--- a/device-types/blk/description.tex
+++ b/device-types/blk/description.tex
@@ -73,6 +73,9 @@ \subsection{Feature bits}\label{sec:Device Types / Block Device / Feature bits}
     VIRTIO_BLK_REQ_FLAG_OUT_FUA flag in the \field{flags} bitfield of the
     \field{virtio_blk_req} structure for VIRTIO_BLK_T_OUT requests.
 
+\item[VIRTIO_BLK_F_LONG_ID (20)] Device supports long device ID
+    strings via VIRTIO_BLK_T_GET_LONG_ID requests.
+
 \end{description}
 
 \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Block Device / Feature bits / Legacy Interface: Feature bits}
@@ -457,9 +460,9 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 The type of the request is either a read (VIRTIO_BLK_T_IN), a write
 (VIRTIO_BLK_T_OUT), a discard (VIRTIO_BLK_T_DISCARD), a write zeroes
 (VIRTIO_BLK_T_WRITE_ZEROES), a flush (VIRTIO_BLK_T_FLUSH), a get device ID
-string command (VIRTIO_BLK_T_GET_ID), a secure erase
-(VIRTIO_BLK_T_SECURE_ERASE), or a get device lifetime command
-(VIRTIO_BLK_T_GET_LIFETIME).
+string command (VIRTIO_BLK_T_GET_ID or VIRTIO_BLK_T_GET_LONG_ID),
+a secure erase (VIRTIO_BLK_T_SECURE_ERASE), or a get device lifetime
+command (VIRTIO_BLK_T_GET_LIFETIME).
 
 \begin{lstlisting}
 #define VIRTIO_BLK_T_IN           0
@@ -469,7 +472,8 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 #define VIRTIO_BLK_T_GET_LIFETIME 10
 #define VIRTIO_BLK_T_DISCARD      11
 #define VIRTIO_BLK_T_WRITE_ZEROES 13
-#define VIRTIO_BLK_T_SECURE_ERASE   14
+#define VIRTIO_BLK_T_SECURE_ERASE 14
+#define VIRTIO_BLK_T_GET_LONG_ID  32
 \end{lstlisting}
 
 The \field{flags} bitfield is ignored by the device unless
@@ -515,9 +519,25 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 the device to discard the specified range, provided that following reads return
 zeroes.
 
-VIRTIO_BLK_T_GET_ID requests fetch the device ID string from the device into
-\field{data}.  The device ID string is a NUL-padded ASCII string up to 20 bytes
-long.  If the string is 20 bytes long then there is no NUL terminator.
+VIRTIO_BLK_T_GET_ID or VIRTIO_BLK_T_GET_LONG_ID requests fetch the
+device ID string from the device into \field{data}.  The device ID
+string is an ASCII string which can be up to 247 bytes long.
+
+VIRTIO_BLK_T_GET_ID fetches the first 20 bytes of the device ID
+string.  If the ID is shorter than 20 bytes, then the response is
+padded with NUL bytes so its length is 20 bytes.  (Note that if the ID
+is 20 bytes or longer, this means the response will not be NUL
+terminated.)
+
+If the VIRTIO_BLK_F_LONG_ID feature is offered,
+VIRTIO_BLK_T_GET_LONG_ID fetches the complete device ID string.  The
+response is always 248 bytes long, padded to this length with NUL
+bytes.  Since the longest permitted device ID string is 247 bytes, the
+response is NUL terminated.
+
+Although 247 byte device ID strings are supported, there may be
+interoperability problems if strings longer than 128 bytes are used.
+It is also advisable to use only 7 bit ASCII characters.
 
 The \field{data} used for VIRTIO_BLK_T_GET_LIFETIME requests is populated
 by the device, and is of the form
@@ -913,6 +933,9 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 
 The length of \field{data} MUST be 20 bytes for VIRTIO_BLK_T_GET_ID requests.
 
+The length of \field{data} MUST be 248 bytes for VIRTIO_BLK_T_GET_LONG_ID
+requests.
+
 VIRTIO_BLK_T_DISCARD requests MUST NOT contain more than
 \field{max_discard_seg} struct virtio_blk_discard_write_zeroes segments in
 \field{data}.
-- 
2.55.0

