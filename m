Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4119851E42F
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860460; cv=none; b=Lde5yIvSRhmgXuxnz+q3mBCCAuUjtsCdDlEXngO2aiXC6LUW8cWczy2RO0LtdoM4Kuccxk0Yv6o1KMlrKUkQn+X8NTqlA6jsLG318+1X0nITeC7od82Sts+V1NOMIWJFDnBkEozhHihs3yE6UHdP+1+r3/whq7AsyfmhBD4Ej5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860460; c=relaxed/simple;
	bh=IYvlLqDO9QscXwMtMOTVQU1fjmjdk/8jjV3Wgco6O/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=B0+S34dBUy9vYokKSqkGG08DuCuBjhExV/MKTId4D+2NnPXtrh7naY3brGSPbNbYeoKjZlQUFBJptIixnisal+jROQw2zdCNcp22EV5tORlj3Q11BUEsSDMuvW20Ewv1XQmEf0RQZBAC1URvRAsggm4IMjUA2kJZzVxqldHd0xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EP572yGc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EP572yGc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788860456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bgsZ4WvWgMgchsS6FLMQqHiCHv+9joEhsgkaLwv7Re8=;
	b=EP572yGchQiFR2e7AiuVaKvyWtFNIaIOccf57vo9Rg4W9UkSALdiIKhUl3oxNy4ahAdS2V
	+RTbQnmoXNM37HSVdOn5ynwi9mZuxwPgNbrBUHYCqUg1e1xpJVAM+Hnexd0oJsDezmmmtV
	GuXajqtIkNvqYuM4CuygsESVuyZOfC8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-17A_UUjyPUibZIrox-Oh1w-1; Tue,
 08 Sep 2026 05:40:55 -0400
X-MC-Unique: 17A_UUjyPUibZIrox-Oh1w-1
X-Mimecast-MFC-AGG-ID: 17A_UUjyPUibZIrox-Oh1w_1788860454
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 946A1195DE11
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 09:40:54 +0000 (UTC)
Received: from cash.home.annexia.org (unknown [10.44.32.28])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9CC8A1955F0C;
	Tue,  8 Sep 2026 09:40:53 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH v3 1/1] device-types/blk/description.tex: Allow longer device IDs to be returned
Date: Tue,  8 Sep 2026 10:40:50 +0100
Message-ID: <20260908094050.915173-2-rjones@redhat.com>
In-Reply-To: <20260908094050.915173-1-rjones@redhat.com>
References: <20260908094050.915173-1-rjones@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nG8jPGOI9eojlWDT0oOdzddrH5mwFdgsCHk-YYQmIc0_1788860454
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
 device-types/blk/description.tex | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
index 3b3a4e7..aa3ec66 100644
--- a/device-types/blk/description.tex
+++ b/device-types/blk/description.tex
@@ -73,6 +73,9 @@ \subsection{Feature bits}\label{sec:Device Types / Block Device / Feature bits}
     VIRTIO_BLK_REQ_FLAG_OUT_FUA flag in the \field{flags} bitfield of the
     \field{virtio_blk_req} structure for VIRTIO_BLK_T_OUT requests.
 
+\item[VIRTIO_BLK_F_LONG_ID (20)] Device supports long device ID
+    strings.
+
 \end{description}
 
 \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Block Device / Feature bits / Legacy Interface: Feature bits}
@@ -516,8 +519,23 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 zeroes.
 
 VIRTIO_BLK_T_GET_ID requests fetch the device ID string from the device into
-\field{data}.  The device ID string is a NUL-padded ASCII string up to 20 bytes
-long.  If the string is 20 bytes long then there is no NUL terminator.
+\field{data}.  The device ID string is an ASCII string which can be
+up to 247 bytes long.
+
+If VIRTIO_BLK_F_LONG_ID was not negotiated, VIRTIO_BLK_T_GET_ID
+fetches the first 20 bytes of the device ID string.  If the ID is
+shorter than 20 bytes, then the response is padded with NUL bytes so
+its length is 20 bytes.  (Note that if the ID is 20 bytes or longer,
+this means the response will not be NUL terminated.)
+
+If VIRTIO_BLK_F_LONG_ID was negotiated, VIRTIO_BLK_T_GET_ID fetches
+the complete device ID string.  The response is always 248 bytes long,
+padded to this length with NUL bytes.  Since the longest permitted
+device ID string is 247 bytes, the response is NUL terminated.
+
+Although 247 byte device ID strings are allowed, there may be
+interoperability problems if strings longer than 128 bytes are used.
+It is also advisable to use only 7 bit ASCII characters.
 
 The \field{data} used for VIRTIO_BLK_T_GET_LIFETIME requests is populated
 by the device, and is of the form
@@ -911,7 +929,10 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 virtio_blk_discard_write_zeroes for VIRTIO_BLK_T_DISCARD,
 VIRTIO_BLK_T_SECURE_ERASE and VIRTIO_BLK_T_WRITE_ZEROES requests.
 
-The length of \field{data} MUST be 20 bytes for VIRTIO_BLK_T_GET_ID requests.
+For VIRTIO_BLK_T_GET_ID requests the length of \field{data} depends
+on the feature VIRTIO_BLK_F_LONG_ID.  If VIRTIO_BLK_F_LONG_ID was
+negotiated the length of \field{data} MUST be 248 bytes, else
+it MUST be 20 bytes.
 
 VIRTIO_BLK_T_DISCARD requests MUST NOT contain more than
 \field{max_discard_seg} struct virtio_blk_discard_write_zeroes segments in
-- 
2.55.0

