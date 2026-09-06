Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6121FA859
	for <virtio-comment@lists.linux.dev>; Sun,  6 Sep 2026 14:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788706491; cv=none; b=bdTMA0VKyVtXcBCgiaj25pp9oq6lsKHcmys2jczkwIIzY/5YXLERaJRLpJ952oe2VbiEJxL+jegg1nNZtMCMq4fdzSpA2eYMh+Kp5jkpdRVRHVEd/7x315/zRNNsYCXz1xwMX7Ja8VAV8xXSR+Y2i3o5BJ/Jxi7gMlBgBFRNqyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788706491; c=relaxed/simple;
	bh=3Co+7KR2p7yxYQutmPYcpZblOv9dE5LMnVeUPsX2jc8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qwqkxdzcMCr8ix2x5VFCZJCFzLuSAJ363uEgx0cmxC6/pscxBleK2gGxI3eb9lV+/5B3yNwvCHKI3YVarMNm1i0QgERHL++nQb1JEPhEJQATn/Sn/gNNcxAI+muIO/VVZzuR9FahjwGQ6UpSBkHW1zWoT9IZtzNlKZO5+qw4We0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X3bwUsWZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X3bwUsWZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788706488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2WpRT8Mjpkutv+M4+5gUUd/Wc+1oPzsyc6l5ezEcFFA=;
	b=X3bwUsWZlm/PYGYQAgMziSPB+p7+vIFeM9NOPr5e70jJzYx+3ByEccA2s8PGzpcTcHcVCc
	YvXuOmX8hFUf1pmDRuBbuT3JRE2vrEk9cJKup6/9hajTCVzbPn9AijahOey2+DrhApZn3I
	pUTq/HrkdoTIfiSRhGv6MfoAyELN708=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-279-2UWrGsRmMqSEmIK9wkfpig-1; Sun,
 06 Sep 2026 10:54:47 -0400
X-MC-Unique: 2UWrGsRmMqSEmIK9wkfpig-1
X-Mimecast-MFC-AGG-ID: 2UWrGsRmMqSEmIK9wkfpig_1788706486
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 735031954B18
	for <virtio-comment@lists.linux.dev>; Sun,  6 Sep 2026 14:54:46 +0000 (UTC)
Received: from cash.home.annexia.org (unknown [10.44.32.28])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B550F1955F05
	for <virtio-comment@lists.linux.dev>; Sun,  6 Sep 2026 14:54:45 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH 0/1] [PATCH] device-types/blk/description.tex: Allow longer device IDs to be returned
Date: Sun,  6 Sep 2026 15:54:43 +0100
Message-ID: <20260906145444.127570-1-rjones@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BcoFWmMYrEXn2t8eApBiz7eV4eJ6mwHMNXX1-hN4QFE_1788706486
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This is a draft proposal to allow virtio-blk devices to have longer
device ID strings (aka serial numbers).

On Linux the serial number of a disk appears under
/sys/block/vda/serial and is used by udev to generate symlinks in
/dev/disk/by-id/.  The serial should be logically attached to a disk
image, and should not change as the disk moves around, and the
symlinks in /dev/disk/by-id/ should similarly be long lived and
permanently refer to a specific disk.

Currently virtio-blk limits the device ID string to 20 ASCII
characters.  Other buses, especially SCSI-based ones like virtio-scsi
and VMware's pvscsi, support much longer serials.  VMware (pvscsi)
calls the serial number a UUID and encodes it through SCSI VPD 0x83 as
"NAA Registered Extended" using 128 bits which Linux prints as a 32
character UUID (without dashes).  virtio-scsi supports a wider variety
of formats, up to very long serials.

This causes problems when the backing device of a disk is changed from
other types to virtio-blk.  Our specific case is when converting
guests from VMware (using pvscsi) to qemu (using virtio-blk), but a
similar thing would happen when converting between virtio-scsi and
virtio-blk.  In both cases a long serial is truncated to 20 bytes.
This causes /dev/disk/by-id/ paths inside the guest to change, meaning
that configuration files and software expecting these paths to never
change will break.

Another major concern is to prevent existing guests from breaking when
long serials are introduced.  In particular, qemu currently silently
truncates the serial parameter to 20 characters, but higher level
software (libvirt, KubeVirt) passes in the full length serial.  The
danger here is that upgrading the hypervisor + driver in a guest would
cause the longer serial to suddenly be used, breaking the guest.  Or
in another scenario, a guest template that uses the older driver would
see the truncated serial even if a new hypervisor is used, but
upgrading the driver inside the guest later would change to use the
longer serial.

Therefore this patch:

 - Leaves the old request VIRTIO_BLK_T_GET_ID alone.  Old drivers can
   continue to use this.  The existing (truncation) behaviour is
   documented.

 - Introduces a new call VIRTIO_BLK_T_GET_LONG_ID to read the full
   serial, up to 247 bytes long.  This is always NUL-terminated and
   passed through a buffer which is always 248 bytes long.

 - Advises driver writers that they should allow guests to opt in to
   longer serial support, while leaving it up to drivers / guests to
   decide what to do based on their situation.

I have written working qemu and Linux kernel patches that implement this:

https://gitlab.com/rwmjones/qemu/-/commits/2026-virtio-blk-long-id?ref_type=heads
https://github.com/rwmjones/linux/commits/2026-virtio-blk-long-id/

Rich.

Richard W.M. Jones (1):
  device-types/blk/description.tex: Allow longer device IDs to be
    returned

 device-types/blk/description.tex | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

-- 
2.55.0

