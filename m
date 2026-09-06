Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABF433F589
	for <virtio-comment@lists.linux.dev>; Sun,  6 Sep 2026 14:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788706492; cv=none; b=Bb3I5QEpP39mI9i+2mXP66HyjBOG8TTl5j4IfMpT176qS+tZr1vmLXuVMTdzyTwp4VwlhCrkDuY1P/Z8YlA6PjhATrEyDS3IbLu1yGHSRGgV7fFlddHdiNu6e3r5p1ZlZsyGv9CWSAgz4u6640DvgDvNAC32SIF6Nmr8vLHR4nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788706492; c=relaxed/simple;
	bh=59l3REO5XLwxV86MGbsiv3PlsZa1NCCdx6Ei74B4xeE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=TRCz5LLWlJ3GkauP7pbjJVfgmXmmqRE1gLmDIFpV1OIPZP6+9MCFnVCP4wS4V6ZRq2Bi0o5sZLGuclOqMwtgUUFQBYdrqB3vAO5KG87wcYUclEi1ybTocBniXC+tJou7GNUeF3HfWOeD7Ny3k5yBeI2bv1TItU6yyms+atSdcto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eJyg5kyG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eJyg5kyG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788706489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ITy3VckuKHJF3qyniGAzi7tE4IoJAKqgmhWNlTApmMM=;
	b=eJyg5kyGsr7AILwsbpTUNQJQE6L5wx2qSeQX42VelxjQSeSUGWlmBplaIWQEvpbJr3QRXg
	EyU7f5JYxkG5Ay8AY/d+FuR18UyefZgi+BARlC2xENvjlCivhbWjPlZ+UaiJoDnprJa7N1
	GqlQaNKtNs06WKz2nX0bK53VKuwWJ9w=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-369-vpZGdsItOum0k4g3G1iC-Q-1; Sun,
 06 Sep 2026 10:54:48 -0400
X-MC-Unique: vpZGdsItOum0k4g3G1iC-Q-1
X-Mimecast-MFC-AGG-ID: vpZGdsItOum0k4g3G1iC-Q_1788706487
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9D82418009CB
	for <virtio-comment@lists.linux.dev>; Sun,  6 Sep 2026 14:54:47 +0000 (UTC)
Received: from cash.home.annexia.org (unknown [10.44.32.28])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E084C1955F05
	for <virtio-comment@lists.linux.dev>; Sun,  6 Sep 2026 14:54:46 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH 1/1] device-types/blk/description.tex: Allow longer device IDs to be returned
Date: Sun,  6 Sep 2026 15:54:44 +0100
Message-ID: <20260906145444.127570-2-rjones@redhat.com>
In-Reply-To: <20260906145444.127570-1-rjones@redhat.com>
References: <20260906145444.127570-1-rjones@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NTsfbaunq4OkpzIkTbeWuyDqtlNCVIYCxJMN9UX-uCg_1788706487
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
bytes (ASCII chars) as the new limit since it can cope with any SCSI
device serial.  Real serials will be much shorter than this; the aim
is to allow UUIDs to be preserved which would use 32 or 36 ASCII
chars.

We have to be cautious about breaking existing guests where the
hypervisor is currently silently truncating a longer ID to 20 bytes.
I suggest in the specification that virtio-blk device drivers allow a
way to opt in to longer IDs, but this is ultimately up to the guests /
drivers to decide.

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 device-types/blk/description.tex | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
index 3b3a4e7..d42ca21 100644
--- a/device-types/blk/description.tex
+++ b/device-types/blk/description.tex
@@ -457,9 +457,9 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
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
@@ -469,7 +469,8 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 #define VIRTIO_BLK_T_GET_LIFETIME 10
 #define VIRTIO_BLK_T_DISCARD      11
 #define VIRTIO_BLK_T_WRITE_ZEROES 13
-#define VIRTIO_BLK_T_SECURE_ERASE   14
+#define VIRTIO_BLK_T_SECURE_ERASE 14
+#define VIRTIO_BLK_T_GET_LONG_ID  32
 \end{lstlisting}
 
 The \field{flags} bitfield is ignored by the device unless
@@ -515,9 +516,26 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
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
+VIRTIO_BLK_T_GET_LONG_ID fetches the complete device ID string.  The
+response is always 248 bytes long, padded to this length with NUL
+bytes.  Since the longest permitted device ID string is 247 bytes, the
+response MUST be NUL terminated.
+
+Device drivers MAY choose a mechanism to opt in to longer device IDs,
+to prevent existing guests from breaking when they see a longer
+(non-truncated) device ID.  In this case a guest which has not opted
+in will continue to use VIRTIO_BLK_T_GET_ID and ignore the complete
+ID.
 
 The \field{data} used for VIRTIO_BLK_T_GET_LIFETIME requests is populated
 by the device, and is of the form
-- 
2.55.0

