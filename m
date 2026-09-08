Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2D551E42F
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 09:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860457; cv=none; b=hSclvSA6K2sfF6nXSvVZZVObtEr44D0IUDM8bG42lcuovMWs2/zxm2M/hMWISv/k5n0X1pLyQVLZ4B3LvXV2tGV/HuZMG5gFH7q+FV9cMOFe6XWW9Y5XvCi5DMNhccVLhUds4kkuaFBtSsKtI+ijVmPVJXhITqZ3pWaE1Q/NAY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860457; c=relaxed/simple;
	bh=kf32Ct8jX6I473GvFJiI3fXRQC3+BNOl8w7baQSbybs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m75P8tesaQ4MlQqyLSQHibR8p6002yUUFCOQJ2yLvf/YLdHM6ny/XrOQSZggUQ1DjkSKSVjCjFKNjcPqMXJ+VcmUUypvTHbakDJCNZsCWDgXZWMNc3cLj6VLDf/MwJwv9hqCmBJ7UoK/j/6P8VIJ+5cqqTC7SZrp5uCB2yR5HAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SVLo4oNb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SVLo4oNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788860455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u/40PoNQxt87WUMVsq/xe1Drx2k1I0QJTwxuRuQAm0Q=;
	b=SVLo4oNbLWmzBgoQi0qrQ3Olf0kH4HrqRZMbxHaMz5meHx1Owrh20HSm2VS7L0X5D0Unav
	vj6feCEfsHYkkuU+mxlVIyw4yPslwKhO97B+k0MHvEvAaW/lFMRXGWiso7kEh8ttZv4LMK
	RWpRbmo6T7t6B7ltNn8+U24q5YTElOo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-Pbm4WSPlOHqNkQvNz3otww-1; Tue,
 08 Sep 2026 05:40:54 -0400
X-MC-Unique: Pbm4WSPlOHqNkQvNz3otww-1
X-Mimecast-MFC-AGG-ID: Pbm4WSPlOHqNkQvNz3otww_1788860453
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3042F19539A9
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 09:40:53 +0000 (UTC)
Received: from cash.home.annexia.org (unknown [10.44.32.28])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 001FC1955F0C;
	Tue,  8 Sep 2026 09:40:51 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH v3 0/1] [PATCH v3] device-types/blk/description.tex: Allow longer device IDs to be returned
Date: Tue,  8 Sep 2026 10:40:49 +0100
Message-ID: <20260908094050.915173-1-rjones@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JQdz9vsmvlIsYXmsdPsK4hGYR08L0GU9ZPEpBY0aP8w_1788860453
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

v3 considerably simplifies everything.  We now use the feature bit
(VIRTIO_BLK_F_LONG_ID) to decide if the driver will provide a 20 or
248 byte buffer to VIRTIO_BLK_T_GET_ID.

VIRTIO_BLK_T_GET_LONG_ID has been dropped.

There is a working implementation of this here:

https://github.com/rwmjones/virtio-spec/commits/2026-virtio-blk-long-id/
https://gitlab.com/rwmjones/qemu/-/commits/2026-virtio-blk-long-id?ref_type=heads
https://github.com/rwmjones/linux/commits/2026-virtio-blk-long-id/

Rich.

Richard W.M. Jones (1):
  device-types/blk/description.tex: Allow longer device IDs to be
    returned

 device-types/blk/description.tex | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

-- 
2.55.0

